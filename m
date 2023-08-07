Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026C177288F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 17:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA5710E1F6;
	Mon,  7 Aug 2023 15:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C867F10E2A2;
 Mon,  7 Aug 2023 15:05:39 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 560E540E0195; 
 Mon,  7 Aug 2023 15:05:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HRuVA5cN8_Rq; Mon,  7 Aug 2023 15:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1691420735; bh=0h5SV6UpwPF8c5G+9vMefvXBdF50gEme0yM2MIkZnzc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UdaWKIkvIrhUFuisZmQVpTeLCf0Z1DCbvBbHTSA1IC74hNcQI6JVpqinqsPkSonz9
 ldTPDmRamxJUsbRttTpvlTmCb9avkwgCgOJGtPhqVbDB8LTIdKj914X8SYfObKn0XP
 2upTfaxEZEqU1ku76du7RXKE9ai29sNMpH6jlUPVWhYBqX056QOrqfcIyLbKLssUV+
 tRccio+CD1udiz08wE8b4J1boTO06D+4HSl2QFe920iinwnQib3l1m4/UJ7rs8hUTc
 2BxKWMne96EHUHgOT1veTLk4k1CYz748EmjCOh3nyJIU9xoTV1jXF5jW1tOglCPakx
 i0m3HlgB44EdfwELYcrxR7WivYCZLEapyl1BHtlItAdFIzYm0GhwYr2KWANbbDDgBV
 RJavUwn8j8aEI2ycKXverIkuhbmBJNleI4rHzEQRUuI30ObZGnM5nLjwFN9RQ9YS5M
 C7Yy2IKwQuS50NVn+SxPzmnZed7kLIg2J64e1yIhAUtvlCvsScJVadSwkZap3yynhl
 X0hhMuHVQm/gENXX0ut5M5rwICoZhANGiiwkLrBOzHGXzENzEBA9cPyCrbl3oPPxO4
 2H+NuSn6e5/XyI3j86hxPuSqthGvZniE1b/tpWj+6lB8+sVPbvWrfr230lOsSIHO9F
 5OXJ0yHn/5B5kJwFDbwCaNaw=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2DCD640E018F;
 Mon,  7 Aug 2023 15:05:26 +0000 (UTC)
Date: Mon, 7 Aug 2023 17:05:21 +0200
From: Borislav Petkov <bp@alien8.de>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO for HPD, not
 PMGR AUX interrupts")
Message-ID: <20230807150521.GGZNEIMQ9rsyCmkpoA@fat_crate.local>
References: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
 <CACO55tvZD5U4J8DawFTRVnV-dLYLngfhuqO29_sWNEGofKfnBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACO55tvZD5U4J8DawFTRVnV-dLYLngfhuqO29_sWNEGofKfnBg@mail.gmail.com>
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
Cc: nouveau@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, regressions@leemhuis.info,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 07, 2023 at 01:49:42PM +0200, Karol Herbst wrote:
> in what way does it stop? Just not progressing? That would be kinda
> concerning. Mind tracing with what arguments `nvkm_uevent_add` is
> called with and without that patch?

Well, me dumping those args I guess made the box not freeze before
catching a #PF over serial. Does that help?

....
[    3.410135] Unpacking initramfs...
[    3.416319] software IO TLB: mapped [mem 0x00000000a877d000-0x00000000ac77d000] (64MB)
[    3.418227] Initialise system trusted keyrings
[    3.432273] workingset: timestamp_bits=56 max_order=22 bucket_order=0
[    3.439006] ntfs: driver 2.1.32 [Flags: R/W].
[    3.443368] fuse: init (API version 7.38)
[    3.447601] 9p: Installing v9fs 9p2000 file system support
[    3.453223] Key type asymmetric registered
[    3.457332] Asymmetric key parser 'x509' registered
[    3.462236] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    3.475865] efifb: probing for efifb
[    3.479458] efifb: framebuffer at 0xf9000000, using 1920k, total 1920k
[    3.485969] efifb: mode is 800x600x32, linelength=3200, pages=1
[    3.491872] efifb: scrolling: redraw
[    3.495438] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    3.502349] Console: switching to colour frame buffer device 100x37
[    3.509564] fb0: EFI VGA frame buffer device
[    3.514013] ACPI: \_PR_.CP00: Found 4 idle states
[    3.518850] ACPI: \_PR_.CP01: Found 4 idle states
[    3.523687] ACPI: \_PR_.CP02: Found 4 idle states
[    3.528515] ACPI: \_PR_.CP03: Found 4 idle states
[    3.533346] ACPI: \_PR_.CP04: Found 4 idle states
[    3.538173] ACPI: \_PR_.CP05: Found 4 idle states
[    3.543003] ACPI: \_PR_.CP06: Found 4 idle states
[    3.544219] Freeing initrd memory: 8196K
[    3.547844] ACPI: \_PR_.CP07: Found 4 idle states
[    3.609542] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    3.616224] 00:05: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    3.625552] serial 0000:00:16.3: enabling device (0000 -> 0003)
[    3.633034] 0000:00:16.3: ttyS1 at I/O 0xf0a0 (irq = 17, base_baud = 115200) is a 16550A
[    3.642451] Linux agpgart interface v0.103
[    3.647141] ACPI: bus type drm_connector registered
[    3.653261] Console: switching to colour dummy device 80x25
[    3.659092] nouveau 0000:03:00.0: vgaarb: deactivate vga console
[    3.665174] nouveau 0000:03:00.0: NVIDIA GT218 (0a8c00b1)
[    3.784585] nouveau 0000:03:00.0: bios: version 70.18.83.00.08
[    3.792244] nouveau 0000:03:00.0: fb: 512 MiB DDR3
[    3.948786] nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
[    3.953755] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[    3.959073] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
[    3.964808] nouveau 0000:03:00.0: DRM: DCB version 4.0
[    3.969938] nouveau 0000:03:00.0: DRM: DCB outp 00: 02000360 00000000
[    3.976367] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000362 00020010
[    3.982792] nouveau 0000:03:00.0: DRM: DCB outp 02: 028003a6 0f220010
[    3.989223] nouveau 0000:03:00.0: DRM: DCB outp 03: 01011380 00000000
[    3.995647] nouveau 0000:03:00.0: DRM: DCB outp 04: 08011382 00020010
[    4.002076] nouveau 0000:03:00.0: DRM: DCB outp 05: 088113c6 0f220010
[    4.008511] nouveau 0000:03:00.0: DRM: DCB conn 00: 00101064
[    4.014151] nouveau 0000:03:00.0: DRM: DCB conn 01: 00202165
[    4.021710] nvkm_uevent_add: uevent: 0xffff888100242100, event: 0xffff8881022de1a0, id: 0x0, bits: 0x1, func: 0x0000000000000000
[    4.033680] nvkm_uevent_add: uevent: 0xffff888100242300, event: 0xffff8881022de1a0, id: 0x0, bits: 0x1, func: 0x0000000000000000
[    4.045429] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[    4.052059] stackdepot: allocating hash table of 1048576 entries via kvcalloc
[    4.067191] nvkm_uevent_add: uevent: 0xffff888100242800, event: 0xffff888104b3e260, id: 0x0, bits: 0x1, func: 0x0000000000000000
[    4.078936] nvkm_uevent_add: uevent: 0xffff888100242900, event: 0xffff888104b3e260, id: 0x1, bits: 0x1, func: 0x0000000000000000
[    4.090514] nvkm_uevent_add: uevent: 0xffff888100242a00, event: 0xffff888102091f28, id: 0x1, bits: 0x3, func: 0xffffffff8177b700
[    4.102118] tsc: Refined TSC clocksource calibration: 3591.345 MHz
[    4.108342] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x33c4635c383, max_idle_ns: 440795314831 ns
[    4.108401] nvkm_uevent_add: uevent: 0xffff8881020b6000, event: 0xffff888102091f28, id: 0xf, bits: 0x3, func: 0xffffffff8177b700
[    4.129864] clocksource: Switched to clocksource tsc
[    4.131478] [drm] Initialized nouveau 1.3.1 20120801 for 0000:03:00.0 on minor 0
[    4.143806] BUG: kernel NULL pointer dereference, address: 0000000000000020
[    4.144676] #PF: supervisor read access in kernel mode
[    4.144676] #PF: error_code(0x0000) - not-present page
[    4.144676] PGD 0 P4D 0 
[    4.144676] Oops: 0000 [#1] PREEMPT SMP PTI
[    4.144676] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 6.5.0-rc5-dirty #1
[    4.144676] Hardware name: Dell Inc. Precision T3600/0PTTT9, BIOS A13 05/11/2014
[    4.144676] RIP: 0010:nvif_object_mthd+0x136/0x1e0
[    4.144676] Code: f2 4c 89 ee 48 8d 7c 24 20 66 89 04 24 c6 44 24 18 00 e8 8d 04 4e 00 41 8d 56 20 49 8b 44 24 08 83 fa 17 76 7d 49 39 c4 74 45 <48> 8b 78 20 4c 89 64 24 10 48 8b 40 38 c6 44 24 06 ff 31 c9 48 89
[    4.144676] RSP: 0000:ffffc90000023888 EFLAGS: 00010282
[    4.144676] RAX: 0000000000000000 RBX: ffff8881003bc000 RCX: 0000000000000008
[    4.144676] RDX: 0000000000000028 RSI: ffffc90000023948 RDI: ffffc900000238a8
[    4.144676] RBP: ffff8881003bc620 R08: ffff888102170000 R09: ffff888102170000
[    4.144676] R10: 0000000000000002 R11: 0000000000000001 R12: ffff8881003bc620
[    4.144676] R13: ffffc90000023948 R14: 0000000000000008 R15: 0000000000000000
[    4.144676] FS:  0000000000000000(0000) GS:ffff88843a700000(0000) knlGS:0000000000000000
[    4.144676] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.144676] CR2: 0000000000000020 CR3: 000000000641e001 CR4: 00000000000606e0
[    4.144676] Call Trace:
[    4.144676]  <TASK>
[    4.144676]  ? __die+0x20/0x70
[    4.144676]  ? page_fault_oops+0x14c/0x430
[    4.144676]  ? fixup_exception+0x22/0x340
[    4.144676]  ? kernelmode_fixup_or_oops+0x84/0x110
[    4.144676]  ? exc_page_fault+0x66/0x1b0
[    4.144676]  ? asm_exc_page_fault+0x22/0x30
[    4.144676]  ? nvif_object_mthd+0x136/0x1e0
[    4.144676]  ? nvif_object_mthd+0x123/0x1e0
[    4.144676]  ? rcu_is_watching+0xd/0x40
[    4.144676]  ? __mutex_lock+0xc9/0x790
[    4.144676]  ? nouveau_dp_detect+0x67/0x4e0
[    4.144676]  nvif_conn_hpd_status+0x22/0xd0
[    4.144676]  nouveau_dp_detect+0x33b/0x4e0
[    4.144676]  ? rt_mutex_unlock+0xf5/0x110
[    4.144676]  nouveau_connector_detect+0x10f/0x470
[    4.144676]  drm_helper_probe_detect+0x81/0xa0
[    4.144676]  drm_helper_probe_single_connector_modes+0x441/0x510
[    4.144676]  drm_client_modeset_probe+0x1f8/0xca0
[    4.144676]  __drm_fb_helper_initial_config_and_unlock+0x34/0x560
[    4.144676]  ? __mutex_lock+0xc9/0x790
[    4.144676]  ? drm_client_register+0x22/0xa0
[    4.144676]  drm_fbdev_generic_client_hotplug+0x66/0xc0
[    4.144676]  drm_client_register+0x64/0xa0
[    4.144676]  nouveau_drm_probe+0x20d/0x230
[    4.144676]  local_pci_probe+0x46/0xa0
[    4.144676]  pci_device_probe+0xaf/0x200
[    4.144676]  really_probe+0xc2/0x2d0
[    4.144676]  __driver_probe_device+0x73/0x120
[    4.144676]  driver_probe_device+0x1e/0xe0
[    4.144676]  __driver_attach+0x8a/0x190
[    4.144676]  ? __pfx___driver_attach+0x10/0x10
[    4.144676]  bus_for_each_dev+0x6a/0xb0
[    4.144676]  bus_add_driver+0xeb/0x1f0
[    4.144676]  driver_register+0x5c/0x120
[    4.144676]  ? __pfx_nouveau_drm_init+0x10/0x10
[    4.144676]  do_one_initcall+0x5b/0x280
[    4.144676]  kernel_init_freeable+0x186/0x2f0
[    4.144676]  ? __pfx_kernel_init+0x10/0x10
[    4.144676]  kernel_init+0x16/0x1b0
[    4.144676]  ret_from_fork+0x30/0x50
[    4.144676]  ? __pfx_kernel_init+0x10/0x10
[    4.144676]  ret_from_fork_asm+0x1b/0x30
[    4.144676]  </TASK>
[    4.144676] Modules linked in:
[    4.144676] CR2: 0000000000000020
[    4.144676] ---[ end trace 0000000000000000 ]---
[    4.144676] RIP: 0010:nvif_object_mthd+0x136/0x1e0
[    4.144676] Code: f2 4c 89 ee 48 8d 7c 24 20 66 89 04 24 c6 44 24 18 00 e8 8d 04 4e 00 41 8d 56 20 49 8b 44 24 08 83 fa 17 76 7d 49 39 c4 74 45 <48> 8b 78 20 4c 89 64 24 10 48 8b 40 38 c6 44 24 06 ff 31 c9 48 89
[    4.144676] RSP: 0000:ffffc90000023888 EFLAGS: 00010282
[    4.144676] RAX: 0000000000000000 RBX: ffff8881003bc000 RCX: 0000000000000008
[    4.144676] RDX: 0000000000000028 RSI: ffffc90000023948 RDI: ffffc900000238a8
[    4.144676] RBP: ffff8881003bc620 R08: ffff888102170000 R09: ffff888102170000
[    4.144676] R10: 0000000000000002 R11: 0000000000000001 R12: ffff8881003bc620
[    4.144676] R13: ffffc90000023948 R14: 0000000000000008 R15: 0000000000000000
[    4.144676] FS:  0000000000000000(0000) GS:ffff88843a700000(0000) knlGS:0000000000000000
[    4.144676] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.144676] CR2: 0000000000000020 CR3: 000000000641e001 CR4: 00000000000606e0
[    4.144676] note: swapper/0[1] exited with irqs disabled
[    4.549714] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009
[    4.550687] Kernel Offset: disabled
[    4.550687] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009 ]---

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
