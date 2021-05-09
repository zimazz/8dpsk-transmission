clc;
clear;
M = 8
sequence = randi([0 M-1],1,1e6);
zn = dpskmod(sequence, M);
BER = [];
snr_db_=[];
for snr_db=0:1:15
    snr_db_ = [snr_db_ snr_db];
    snr = 10.^(snr_db/10);
    rn = zn + ((1 / (2*sqrt(snr))) * (randn(1,1e6) + 1j*randn(1,1e6)));
    rn_demod = dpskdemod(rn, M);
    [N BER_temp] = biterr(sequence, rn_demod);
    BER = [BER BER_temp];
end
semilogy(snr_db_, BER)
title('BER VS SNR');
ylabel('BER');
xlabel('SNR')