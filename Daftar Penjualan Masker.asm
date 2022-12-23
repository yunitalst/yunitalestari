.model small
.code
org 100h
start:
         jmp mulai
nama         db 13,10,'Nama Anda   : $'
hp           db 13,10,'No.HP/Telp  : $'
lanjut       db 13,10,'lanjut Tekan y untuk lanjut >>>>>>>>> $'
tampung_nama   db 30,?,30 dup(?)
tampung_hp     db 13,?,13 dup(?)   
masukkan  db 13,10,'Silahkan Masukkan No/Kode Emas yang Anda pilih: $'
      
daftar db 13,10,'+----------------------------  ----+'
       db 13,10,'|       DAFTAR HARGA MASKER   |'
       db 13,10,'+----------------------------------+'
       db 13,10,'|NO | NAMA   | HARGA          |'
       db 13,10,'+----------------------------------+'
       db 13,10,'|1 | DUCKBILL  | RP.35.000    |'
       db 13,10,'+----------------------------------+'
       db 13,10,'|2 | N95       | RP.40.000    |'
       db 13,10,'+----------------------------------+'
       db 13,10,'|3 | N99       | RP.50.000    |'
       db 13,10,'+----------------------------------+'
       db 13,10,'|4 | N100      | RP.45.000    |'
       db 13,10,'+----------------------------------+'
       db 13,10,'|5 | R95       | RP.55.000    |'
       db 13,10,'+----------------------------------+','$'
    mulai:
        mov ah,09h
        lea dx,nama
        int 21h
        mov ah,0ah
        lea dx,tampung_nama
        int 21h
        push dx  
        
        mov ah,09h
        lea dx,hp
        int 21h
        mov ah,0ah
        lea dx,tampung_hp
        int 21h
        push dx
       mov ah,09h
	 mov dx,offset daftar
	 int 21h
	 mov ah,09h
	 mov dx,offset lanjut
	 int 21h
	 mov ah,01h
	 int 21h
	 cmp al,'y'
	 jmp proses
	 jne error_msg
error_msg:
        mov ah,09h
        mov dx,offset error_msg
        int 21h
        int 20h
proses:
        mov ah,09h
        mov dx,offset masukkan
        int 21h
        mov ah,01
        int 21h
        mov bh,al
       
       
        cmp al,'1'
        je hasil1
        
        cmp al,'2'
        je hasil2
        
        cmp al,'3'
        je hasil3
        
        cmp al,'4'
        je hasil4
        
        cmp al,'5'
        je hasil5   
        
hasil1:
	mov ah,09h
	lea dx,teks1
	int 21h
	int 20h
hasil2:
	mov ah,09h
	lea dx,teks2
	int 21h
	int 20h
hasil3:
	mov ah,09h
	lea dx,teks3
	int 21h
	int 20h
	
hasil4:
	mov ah,09h
	lea dx,teks4
	int 21h
	int 20h  
hasil5:
	mov ah,09h
	lea dx,teks5
	int 21h
	int 20h
       
;-----------------------------------------------------------------------------------------
teks1  db 13,10,'Anda memilih DUCKBILL'
       db 13,10,'Total Harga Yang Harus Anda Bayar : RP.35.000'
       db 13,10,'Terima Kasih $'
teks2  db 13,10,'Anda memilih N95'
       db 13,10,'Total Harga Yang Harus Anda Bayar : RP.40.000'
       db 13,10,'Terima Kasih $'
teks3  db 13,10,'Anda memilih N99'
       db 13,10,'Total Harga Yang Harus Anda Bayar : RP.50.000'
       db 13,10,'Terima Kasih $'
teks4  db 13,10,'Anda memilih N100'
       db 13,10,'Total Harga Yang Harus Anda Bayar : RP.45.000'
       db 13,10,'Terima Kasih $'
teks5  db 13,10,'Anda memilih R95'
       db 13,10,'Total Harga Yang Harus Anda Bayar : RP.55.000'
       db 13,10,'Terima Kasih $'
