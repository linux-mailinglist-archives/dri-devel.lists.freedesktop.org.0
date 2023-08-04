Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597067716D8
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 23:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A1610E19B;
	Sun,  6 Aug 2023 21:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CA810E021;
 Fri,  4 Aug 2023 18:09:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1691172518; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=fLf+nk6TZ5/qH5xbTHujlQihJ+fdkpdlkHtvB5tAYn+mDVLQU9cQz2LGRlQWX6t7qU
 PIsg8zwSyXA9qHaEn1pC2HmGu2soyr2QvHIxUHzwizMggUSVt8w7PRc01H6tCC/DTjb6
 11ZVN+Kjh1jfu2Ey4Il5LU250qBWCxKZLWJ70jkBEW/gMaIwhbTSoF9HxE7jz186BQaO
 +rsVlRE8ZMq15tFixuxz+6quYGZEyf7QLN4OiXvpi3OXbzGj22iaEwoAr7hFOiA3xNF4
 Nia2ihmYMo4f5vpga810CpnuDsEsdvzThiUSmlvmSgdpn1bEeY5JJJ1vPogmTsV5nhBG
 Ay/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1691172518;
 s=strato-dkim-0002; d=strato.com;
 h=References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=KbTSG9OgTKvRp1/Rflsl/+c1/jWgayXkjXruRYIH3Xw=;
 b=Uk8PNA/duUTotcZ3Frn3wKQfOv+CgK5MVlj8aJ/OQHGQCASRaWUw7zq6iGkZG2rKPu
 PozBVKfSX+HaCBWKfH095cp5iHAJSSc3LaBOO5zMIIPo9vLyYh0fZUQ2xTb7wRufLxW2
 YU9lKA0F1ICmYNagjtmM3vF44n1Sn36f00tytfc3uN+64FkXXwr+iOjR1czrZKwRp1Xv
 bn7gjANuPrTjbG6tK1cvNp3hArnRGOlqHgdKcUNh17bJA+VnAoNZ6TsRsWdYBdcB+PPn
 HSF8a0fzrzjPA+P5GTW1boaHYWSYVLxPkE/GfR4sZwL2PZUa1Pa4p9N+dQmEp2frKFdE
 j4+A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1691172518;
 s=strato-dkim-0002; d=kravcenko.com;
 h=References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=KbTSG9OgTKvRp1/Rflsl/+c1/jWgayXkjXruRYIH3Xw=;
 b=A0opKnKoCEgKBI3styBUJ26OhIZbUV77w1z0cXQobnxZspsnnl4IJloSs3q+pOTnis
 TBjWAuOwWQUMoq4y7thXEPm7K6b2xpjs/dc5zPMlA/ArB2Rrlt88fIy9oPR/pp/CFIS0
 OFY32W3WZTpFr0ETQ+gPhh4i5D9lv6xOQ1VxFPGDnFWxOqmOd632fmVt4XroIgpSvrxm
 Zef73QJ97qvcv/9m2uBoXMSCn/GhJwbvs/pQWZSnhzVkupL5Q6JB+EA5xPhWr315CbVv
 Sx+WcqF9lTOWZFtE/qJpasi7D1lHcdpAz/AnKAKMdsdR2nak60XvGmskeXv4H33qVSZA
 foQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1691172518;
 s=strato-dkim-0003; d=kravcenko.com;
 h=References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=KbTSG9OgTKvRp1/Rflsl/+c1/jWgayXkjXruRYIH3Xw=;
 b=0an8gO4fImtydXd66lp/kXKz3RH+alieDeZJc2Zln8/f9ldqZYpcQvqjsXwz7TnmmI
 rkO5nLWsUfOL3PrF7hDw==
X-RZG-AUTH: ":I2AFc2Cjaf5HiRB0lhnvZ9elhwku56KjVuxY6AZJWRy8C0aEhFGYVtZdsoywGOIVpSHY0o63PckPhiSO1IhQGG0mBjo18W4hBO/Ijw=="
Received: from p200300c7f704d301468a5bfffe84f964.dip0.t-ipconnect.de
 by smtp.strato.de (RZmta 49.6.6 AUTH) with ESMTPSA id dd2654z74I8cXS7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 4 Aug 2023 20:08:38 +0200 (CEST)
Date: Fri, 4 Aug 2023 20:08:30 +0200 (CEST)
From: Olaf Skibbe <news@kravcenko.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: nouveau bug in linux/6.1.38-2
In-Reply-To: <CACO55ttcUEUjdVgx4y7pv26VAGeHS5q1wVKWrMw5=o9QLaJLZw@mail.gmail.com>
Message-ID: <977ac5b0-4ab8-7782-10e1-b4bee6b58030@kravcenko.com>
References: <20be6650-5db3-b72a-a7a8-5e817113cff5@kravcenko.com>
 <c27fb4dd-b2dc-22de-4425-6c7db5f543ba@leemhuis.info>
 <CACO55ttcUEUjdVgx4y7pv26VAGeHS5q1wVKWrMw5=o9QLaJLZw@mail.gmail.com>
User-Agent: Alpine 2.26 (DEB 649 2022-06-02)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463786238-675451933-1691172518=:22036"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 06 Aug 2023 21:43:47 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 nouveau@lists.freedesktop.org, 1042753@bugs.debian.org,
 dri-devel@lists.freedesktop.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Ben Skeggs <bskeggs@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463786238-675451933-1691172518=:22036
Content-Type: text/plain; format=flowed; charset=US-ASCII

Dear all,

On Fri, 4 Aug 2023 at 14:15, Karol Herbst wrote:

>>> 62aecf23f3d1 drm/nouveau: add nv_encoder pointer check for NULL
>>> fb725beca62d drm/nouveau/dp: check for NULL nv_connector->native_mode
>>> 90748be0f4f3 drm/nouveau: don't detect DSM for non-NVIDIA device
>>> 5a144bad3e75 nouveau: fix client work fence deletion race
>
> mind retrying with only fb725beca62d and 62aecf23f3d1 reverted? Would 
> be weird if the other two commits are causing it. If that's the case, 
> it's a bit worrying that reverting either of the those causes issues, 
> but maybe there is a good reason for it. Anyway, mind figuring out 
> which of the two you need reverted to fix your issue? Thanks!

The result is:

Patch with commit fb725beca62d reverted: Graphics works. I attached the 
respective patch again to this mail.

Patch with commit 62aecf23f3d1 reverted: Screen remains black, error 
message:

# dmesg | grep -A 36 "cut here"
[    2.921358] ------------[ cut here ]------------
[    2.921361] WARNING: CPU: 1 PID: 176 at drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:460 nvkm_dp_acquire+0x26a/0x490 [nouveau]
[    2.921627] Modules linked in: sd_mod(E) t10_pi(E) crc64_rocksoft(E) sr_mod(E) crc64(E) crc_t10dif(E) crct10dif_generic(E) cdrom(E) nouveau(E+) mxm_wmi(E) i2c_algo_bit(E) drm_display_helper(E) cec(E) ahci(E) rc_core(E) drm_ttm_helper(E) libahci(E) ttm(E) ehci_pci(E) crct10dif_pclmul(E) crct10dif_common(E) ehci_hcd(E) drm_kms_helper(E) crc32_pclmul(E) firewire_ohci(E) sdhci_pci(E) cqhci(E) libata(E) e1000e(E) sdhci(E) psmouse(E) crc32c_intel(E) lpc_ich(E) ptp(E) i2c_i801(E) scsi_mod(E) i2c_smbus(E) firewire_core(E) scsi_common(E) usbcore(E) crc_itu_t(E) mmc_core(E) drm(E) pps_core(E) usb_common(E) battery(E) video(E) wmi(E) button(E)
[    2.921695] CPU: 1 PID: 176 Comm: kworker/u16:5 Tainted: G            E      6.1.0-0.a.test-amd64 #1  Debian 6.1.38-2a~test
[    2.921701] Hardware name: Dell Inc. Latitude E6510/0N5KHN, BIOS A17 05/12/2017
[    2.921705] Workqueue: nvkm-disp nv50_disp_super [nouveau]
[    2.921948] RIP: 0010:nvkm_dp_acquire+0x26a/0x490 [nouveau]
[    2.922192] Code: 48 8b 44 24 58 65 48 2b 04 25 28 00 00 00 0f 85 37 02 00 00 48 83 c4 60 44 89 e0 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc <0f> 0b c1 e8 03 41 88 6d 62 44 89 fe 48 89 df 48 69 c0 cf 0d d6 26
[    2.922196] RSP: 0018:ffffc077c04dfd60 EFLAGS: 00010246
[    2.922201] RAX: 0000000000041eb0 RBX: ffff9a8482624c00 RCX: 0000000000041eb0
[    2.922204] RDX: ffffffffc0b47760 RSI: 0000000000000000 RDI: ffffc077c04dfcf0
[    2.922206] RBP: 0000000000000001 R08: ffffc077c04dfc64 R09: 0000000000005b76
[    2.922209] R10: 000000000000000d R11: ffffc077c04dfde0 R12: 00000000ffffffea
[    2.922212] R13: ffff9a8517541e00 R14: 0000000000044d45 R15: 0000000000000000
[    2.922215] FS:  0000000000000000(0000) GS:ffff9a85a3c40000(0000) knlGS:0000000000000000
[    2.922219] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.922222] CR2: 000055f660bcb3a8 CR3: 0000000197610000 CR4: 00000000000006e0
[    2.922226] Call Trace:
[    2.922231]  <TASK>
[    2.922235]  ? __warn+0x7d/0xc0
[    2.922244]  ? nvkm_dp_acquire+0x26a/0x490 [nouveau]
[    2.922487]  ? report_bug+0xe6/0x170
[    2.922494]  ? handle_bug+0x41/0x70
[    2.922501]  ? exc_invalid_op+0x13/0x60
[    2.922505]  ? asm_exc_invalid_op+0x16/0x20
[    2.922512]  ? init_reset_begun+0x20/0x20 [nouveau]
[    2.922708]  ? nvkm_dp_acquire+0x26a/0x490 [nouveau]
[    2.922954]  nv50_disp_super_2_2+0x70/0x430 [nouveau]
[    2.923200]  nv50_disp_super+0x113/0x210 [nouveau]
[    2.923445]  process_one_work+0x1c7/0x380
[    2.923456]  worker_thread+0x4d/0x380
[    2.923463]  ? rescuer_thread+0x3a0/0x3a0
[    2.923469]  kthread+0xe9/0x110
[    2.923476]  ? kthread_complete_and_exit+0x20/0x20
[    2.923482]  ret_from_fork+0x22/0x30
[    2.923493]  </TASK>
[    2.923494] ---[ end trace 0000000000000000 ]---

(Maybe it's worth to mention that the LED back-light is on, while the 
screen appears black.)

Cheers,
Olaf

P.S.: By the way: as a linux user for more than 20 years, I am very 
pleased to have the opportunity to contribute at least a little bit to 
the improvement. I'd like to use the chance to thank you all very much 
for building and developing this great operating system.
---1463786238-675451933-1691172518=:22036
Content-Type: text/x-diff; name=0002-Revert-drm-nouveau-dp-check-for-NULL-nv_connector-na.patch
Content-Transfer-Encoding: BASE64
Content-ID: <6f94cf73-1a71-90ac-9374-6c19b6d5ca06@cam.uni-heidelberg.de>
Content-Description: 
Content-Disposition: attachment; filename=0002-Revert-drm-nouveau-dp-check-for-NULL-nv_connector-na.patch

RnJvbSA0N2MwZTkzOGJlZWY3MzM1ZmZhMTc5ZjEwMDY3NTRmOTY2NGM2YzRk
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogRGllZGVyaWsgZGUg
SGFhcyA8ZGlkaS5kZWJpYW5AY2tub3cub3JnPg0KRGF0ZTogTW9uLCAzMSBK
dWwgMjAyMyAxOTo1NTo1NCArMDIwMA0KU3ViamVjdDogW1BBVENIIDIvNF0g
UmV2ZXJ0ICJkcm0vbm91dmVhdS9kcDogY2hlY2sgZm9yIE5VTEwNCiBudl9j
b25uZWN0b3ItPm5hdGl2ZV9tb2RlIg0KDQpUaGlzIHJldmVydHMgY29tbWl0
IGZiNzI1YmVjYTYyZDE3NWMwMmNhNjE5YzI3MDM3YzE0ZjdhYjhlN2MuDQot
LS0NCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rv
ci5jIHwgNCArKy0tDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jDQppbmRleCBmZDk4
NDczM2I4ZTYuLjE5OTFiYmIxZDA1YyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMNCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMNCkBA
IC05NjYsNyArOTY2LDcgQEAgbm91dmVhdV9jb25uZWN0b3JfZ2V0X21vZGVz
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQogCS8qIERldGVy
bWluZSBkaXNwbGF5IGNvbG91ciBkZXB0aCBmb3IgZXZlcnl0aGluZyBleGNl
cHQgTFZEUyBub3csDQogCSAqIERQIHJlcXVpcmVzIHRoaXMgYmVmb3JlIG1v
ZGVfdmFsaWQoKSBpcyBjYWxsZWQuDQogCSAqLw0KLQlpZiAoY29ubmVjdG9y
LT5jb25uZWN0b3JfdHlwZSAhPSBEUk1fTU9ERV9DT05ORUNUT1JfTFZEUyAm
JiBudl9jb25uZWN0b3ItPm5hdGl2ZV9tb2RlKQ0KKwlpZiAoY29ubmVjdG9y
LT5jb25uZWN0b3JfdHlwZSAhPSBEUk1fTU9ERV9DT05ORUNUT1JfTFZEUykN
CiAJCW5vdXZlYXVfY29ubmVjdG9yX2RldGVjdF9kZXB0aChjb25uZWN0b3Ip
Ow0KIA0KIAkvKiBGaW5kIHRoZSBuYXRpdmUgbW9kZSBpZiB0aGlzIGlzIGEg
ZGlnaXRhbCBwYW5lbCwgaWYgd2UgZGlkbid0DQpAQCAtOTg3LDcgKzk4Nyw3
IEBAIG5vdXZlYXVfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yKQ0KIAkgKiAibmF0aXZlIiBtb2RlIGFzIHNv
bWUgVkJJT1MgdGFibGVzIHJlcXVpcmUgdXMgdG8gdXNlIHRoZQ0KIAkgKiBw
aXhlbCBjbG9jayBhcyBwYXJ0IG9mIHRoZSBsb29rdXAuLi4NCiAJICovDQot
CWlmIChjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NP
Tk5FQ1RPUl9MVkRTICYmIG52X2Nvbm5lY3Rvci0+bmF0aXZlX21vZGUpDQor
CWlmIChjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NP
Tk5FQ1RPUl9MVkRTKQ0KIAkJbm91dmVhdV9jb25uZWN0b3JfZGV0ZWN0X2Rl
cHRoKGNvbm5lY3Rvcik7DQogDQogCWlmIChudl9lbmNvZGVyLT5kY2ItPnR5
cGUgPT0gRENCX09VVFBVVF9UVikNCi0tIA0KMi40MC4xDQoNCg==

---1463786238-675451933-1691172518=:22036--
