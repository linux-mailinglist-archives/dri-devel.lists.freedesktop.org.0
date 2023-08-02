Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6619776E129
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 09:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB00A10E59F;
	Thu,  3 Aug 2023 07:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 714 seconds by postgrey-1.36 at gabe;
 Wed, 02 Aug 2023 21:40:07 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD2B10E155;
 Wed,  2 Aug 2023 21:40:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1691011685; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=Fx/qZj7s3guZOXf1WQswLfrUtaHaHBnmz5DGRgQPIKcnHuUbh+yyZhkhVm93pyPQC8
 T3Mv+FDFlK/oKFqzhVN/DE3LuE/DgimmOv1o6h8/T7++gLmYafwvUg3H3zenM7RuR8Ci
 dJxqdCWiIiPYHHCXvOfBuFb4fIdM4BPqgPnsoydkET1dEcaZVKNqW6142eGXjJ+cetuu
 kjt9oKNE88t/X1qrPDX3i+94VQG9v93eS6NxN17eqidiNajr0eFuAon/Afxi4FbIqOJ3
 0VA35dLaD0wd1m6EaTZmzSnPoDIVMmSsdQYlaz4UC2osq8i1R3D4hZNo28z7/In9Mb6y
 t3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1691011685;
 s=strato-dkim-0002; d=strato.com;
 h=Message-ID:Subject:cc:To:From:Date:Cc:Date:From:Subject:Sender;
 bh=x4UBCc8CQ6q3DIajFFGUiRq9xMNubdSIR0XXq2ZES7Q=;
 b=QbZhSAWRjlkAyNurpg9zFighMIvNSeGBZkRGXR7TH+RWEyn22I3B/NzaOeEpABd3Zq
 ArB6BynNMwMNALbcxw19+XaDA8S0u4YBqeYsMd/kUfbGPlDXD2X6sEuN1Yh2MYrbP03w
 fj2vYm5ZftntX06V7tnEqSUVNphnHlPZNkcJmORVlhdqB9uZK69udpvjimgqEmPceGr4
 /HAMXPbJfIr5W9Zw+nYXR8MXkMbYttNssO2qkHXDsW4uqPe/o2yXwzLWxq8Bp8DAiOEq
 MEFRWHWCwkeLQG7CjTa5epOEY8hlVinM3fs9uYfMDmAhREgZ2dakWrFXT5VMOS1AWij5
 /E3Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1691011685;
 s=strato-dkim-0002; d=kravcenko.com;
 h=Message-ID:Subject:cc:To:From:Date:Cc:Date:From:Subject:Sender;
 bh=x4UBCc8CQ6q3DIajFFGUiRq9xMNubdSIR0XXq2ZES7Q=;
 b=XMpDj7EkGsMUhJuH6y+1oPa/ZTihhSDRMwnePXuaMNE9ipAKLdLOgaJM7yIAHb1Blg
 VoV6DIwm/vs+4Hy83DX/H4PZrnvu+Pvv07oT2XBWR1ctCf5CcgqG2pfESkM2jezSeMGp
 584IehMhTU8gwDhTTjrSIjkgbxRpiF8cBmz9R5ZcdN0+vbr5XxMUwm3cppS4sHsvBtZ9
 EJJ+jimWgbbnDzi9QyWH3GeR1BA+re+N6Lm7SUjSINSuuLogOiWGaD97rGngPwyYt16v
 J5o0MMOwF8jyv5BxUBbsYiDBz6uvqMBh5swm5c1pKHV4EWYNmfygzxHm2wSvvdfAgldk
 drMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1691011685;
 s=strato-dkim-0003; d=kravcenko.com;
 h=Message-ID:Subject:cc:To:From:Date:Cc:Date:From:Subject:Sender;
 bh=x4UBCc8CQ6q3DIajFFGUiRq9xMNubdSIR0XXq2ZES7Q=;
 b=yQbvuQiAzxpaLqkoC2vNABOIChdwIazHX80BNgCQJDY7AEiXh/1Gj0SBKvtveW7ah1
 prRDgK3LLJvMh1/pxyAw==
X-RZG-AUTH: ":I2AFc2Cjaf5HiRB0lhnvZ9elhwku56KjVuxY6AZJWRy8C0aEhFGYVtZdsoywGOIVpSHY0o63PckPhiSO1IhQGG0mBjo18W4hBO/Ijw=="
Received: from p200300c7f704d301468a5bfffe84f964.dip0.t-ipconnect.de
 by smtp.strato.de (RZmta 49.6.6 AUTH) with ESMTPSA id dd2654z72LS5RVa
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Aug 2023 23:28:05 +0200 (CEST)
Date: Wed, 2 Aug 2023 23:28:03 +0200 (CEST)
From: Olaf Skibbe <news@kravcenko.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: nouveau bug in linux/6.1.38-2
Message-ID: <20be6650-5db3-b72a-a7a8-5e817113cff5@kravcenko.com>
User-Agent: Alpine 2.26 (DEB 649 2022-06-02)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 03 Aug 2023 07:21:52 +0000
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
Cc: 1042753@bugs.debian.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Maintainers,

Hereby I would like to report an apparent bug in the nouveau driver in
linux/6.1.38-2.

Running a current debian stable on a Dell Latitude E6510 with a
"NVIDIA Corporation GT218M" graphic card, the monitor turns black
after the grub screen. Also switching to a console (Strg-Alt-F2) shows
just a black screen. Access via ssh is possible.

~# uname -r
6.1.0-10-amd64

demesg shows the following error message:

[    3.560153] WARNING: CPU: 0 PID: 176 at drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:460 nvkm_dp_acquire+0x26a/0x490 [nouveau]
[    3.560287] Modules linked in: sd_mod t10_pi sr_mod crc64_rocksoft cdrom crc64 crc_t10dif crct10dif_generic nouveau(+) ahci libahci mxm_wmi i2c_algo_bit drm_display_helper libata cec rc_core drm_ttm_helper ttm scsi_mod e1000e drm_kms_helper ptp firewire_ohci sdhci_pci cqhci ehci_pci sdhci ehci_hcd firewire_core i2c_i801 crct10dif_pclmul crct10dif_common drm crc32_pclmul crc32c_intel psmouse usbcore mmc_core crc_itu_t pps_core scsi_common i2c_smbus lpc_ich usb_common battery video wmi button
[    3.560322] CPU: 0 PID: 176 Comm: kworker/u16:5 Not tainted 6.1.0-10-amd64 #1  Debian 6.1.38-2
[    3.560325] Hardware name: Dell Inc. Latitude E6510/0N5KHN, BIOS A17 05/12/2017
[    3.560327] Workqueue: nvkm-disp nv50_disp_super [nouveau]
[    3.560433] RIP: 0010:nvkm_dp_acquire+0x26a/0x490 [nouveau]
[    3.560538] Code: 48 8b 44 24 58 65 48 2b 04 25 28 00 00 00 0f 85 37 02 00 00 48 83 c4 60 44 89 e0 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc <0f> 0b c1 e8 03 41 88 6d 62 44 89 fe 48 89 df 48 69 c0 cf 0d d6 26
[    3.560541] RSP: 0018:ffff9899c048bd60 EFLAGS: 00010246
[    3.560542] RAX: 0000000000041eb0 RBX: ffff88e0209d2600 RCX: 0000000000041eb0
[    3.560544] RDX: ffffffffc079f760 RSI: 0000000000000000 RDI: ffff9899c048bcf0
[    3.560545] RBP: 0000000000000001 R08: ffff9899c048bc64 R09: 0000000000005b76
[    3.560546] R10: 000000000000000d R11: ffff9899c048bde0 R12: 00000000ffffffea
[    3.560548] R13: ffff88e00b39e480 R14: 0000000000044d45 R15: 0000000000000000
[    3.560549] FS:  0000000000000000(0000) GS:ffff88e123c00000(0000) knlGS:0000000000000000
[    3.560551] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.560552] CR2: 00007f57f4e90451 CR3: 0000000181410000 CR4: 00000000000006f0
[    3.560554] Call Trace:
[    3.560558]  <TASK>
[    3.560560]  ? __warn+0x7d/0xc0
[    3.560566]  ? nvkm_dp_acquire+0x26a/0x490 [nouveau]
[    3.560671]  ? report_bug+0xe6/0x170
[    3.560675]  ? handle_bug+0x41/0x70
[    3.560679]  ? exc_invalid_op+0x13/0x60
[    3.560681]  ? asm_exc_invalid_op+0x16/0x20
[    3.560685]  ? init_reset_begun+0x20/0x20 [nouveau]
[    3.560769]  ? nvkm_dp_acquire+0x26a/0x490 [nouveau]
[    3.560888]  nv50_disp_super_2_2+0x70/0x430 [nouveau]
[    3.560997]  nv50_disp_super+0x113/0x210 [nouveau]
[    3.561103]  process_one_work+0x1c7/0x380
[    3.561109]  worker_thread+0x4d/0x380
[    3.561113]  ? rescuer_thread+0x3a0/0x3a0
[    3.561116]  kthread+0xe9/0x110
[    3.561120]  ? kthread_complete_and_exit+0x20/0x20
[    3.561122]  ret_from_fork+0x22/0x30
[    3.561130]  </TASK>

Further information:

$ lspci -v -s $(lspci | grep -i vga | awk '{ print $1 }')
01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [NVS 3100M] (rev a2) (prog-if 00 [VGA controller])
 	Subsystem: Dell Latitude E6510
 	Flags: bus master, fast devsel, latency 0, IRQ 27
 	Memory at e2000000 (32-bit, non-prefetchable) [size=16M]
 	Memory at d0000000 (64-bit, prefetchable) [size=256M]
 	Memory at e0000000 (64-bit, prefetchable) [size=32M]
 	I/O ports at 7000 [size=128]
 	Expansion ROM at 000c0000 [disabled] [size=128K]
 	Capabilities: <access denied>
 	Kernel driver in use: nouveau
 	Kernel modules: nouveau

I reported this bug to debian already, see
https://bugs.debian.org/1042753 for context.

With support (thanks Diederik!) I managed to figure out that the cause
was a regression between upstream kernel version 6.1.27 and 6.1.38.

I build a new 6.1.38 kernel with these commits reverted:

62aecf23f3d1 drm/nouveau: add nv_encoder pointer check for NULL
fb725beca62d drm/nouveau/dp: check for NULL nv_connector->native_mode
90748be0f4f3 drm/nouveau: don't detect DSM for non-NVIDIA device
5a144bad3e75 nouveau: fix client work fence deletion race

With that kernel the graphic works again.

Please inform me if further tests are required.

Cheers,
Olaf

