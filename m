Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5279775DE8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 13:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AECF10E02A;
	Wed,  9 Aug 2023 11:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D6310E02A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 11:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691581344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXKzyQLsuZorz2nAPYSV0uQXCuFaOKudrpDhBGMH5kA=;
 b=hX8lmhjUKkvDRsNbp0Sgz3B5Bh3mvXnz7KFGJrTda5bnhpnZW2xSILFsm9lb1TsNaGmFH4
 Va2eybbM9SWsXvKFQYkGav659UvCaI9TG2oqARxe+GMzT0CycVL979pIJAhdjv7Ky+RqIi
 hne6QjTnX+xMq790ci26qN6LJMfirCI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-cJP_q5JWNWqklal2Oumnpw-1; Wed, 09 Aug 2023 07:42:22 -0400
X-MC-Unique: cJP_q5JWNWqklal2Oumnpw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b9d5bc6161so11545741fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 04:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691581341; x=1692186141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZXKzyQLsuZorz2nAPYSV0uQXCuFaOKudrpDhBGMH5kA=;
 b=BVU/60USNE+rgDinGblN//Xo01TAaJ97pIdSjRRmZ0S087hdZJg6rKONhXL+MUWg9B
 Cw4ytkMgODhPcfqbNZrwJKzdMDOShsIt8tVoyVcya8U222tgf6NR2D0jfTC6QwR32hhd
 2s9YoWmPQYtexgMI67ObGQkoTbkCeweEeOTL9A/aj83ddjZvD//yJjbSGo/u9TMLsHFK
 f4hquWUv43P0akD2PdSS0QI945GoqDw/lJbdsgTYcafxgtINmpRLML3IdkcejIaR4VWV
 fHfYLddQSsemzsokiGLeFVC29HpJirDOkOjZv4jMTp453aLtVrqsSJnQoPi02KWHfqYW
 93zg==
X-Gm-Message-State: AOJu0YyuZR4iQMP6RpQJ7dEXfFUX82I/2WWAl6SbEmAQx0ojIFj8mBqu
 eCtJtuS+NqB1otfO5N3QjQ3BZ4nKtVFJFwZ37/Ii0gI0uyPLFRrvOCXxwRWydCzJBW7ffUDjtbd
 6U8heQvTSIwpsP+9WV9OkMKMtvtr75rtG7Lv7KNZYtvaO
X-Received: by 2002:a2e:8e31:0:b0:2b9:e10b:a511 with SMTP id
 r17-20020a2e8e31000000b002b9e10ba511mr1349699ljk.0.1691581341179; 
 Wed, 09 Aug 2023 04:42:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZopjv7pGQQRXMmRkmiWqHJ/a+dvehVgImkZW66xgdgDLUGkS6wzdm5PBlp2ywBAq7ERPc+SEWmIV+8qXVtpU=
X-Received: by 2002:a2e:8e31:0:b0:2b9:e10b:a511 with SMTP id
 r17-20020a2e8e31000000b002b9e10ba511mr1349683ljk.0.1691581340718; Wed, 09 Aug
 2023 04:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
 <CACO55tvZD5U4J8DawFTRVnV-dLYLngfhuqO29_sWNEGofKfnBg@mail.gmail.com>
 <20230807150521.GGZNEIMQ9rsyCmkpoA@fat_crate.local>
 <CACO55tvWuSdwdirj7S3Dk-r4NAw8jC8g5RHKFd62WXi43iQP-w@mail.gmail.com>
 <87fs4sfu54.wl-tiwai@suse.de>
In-Reply-To: <87fs4sfu54.wl-tiwai@suse.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 9 Aug 2023 13:42:09 +0200
Message-ID: <CACO55tszwFEgt=8xn4auAE7KJVs3ybGG68OzL9HJt19XGVhhHQ@mail.gmail.com>
Subject: Re: 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO for HPD, not
 PMGR AUX interrupts")
To: Takashi Iwai <tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Borislav Petkov <bp@alien8.de>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 9, 2023 at 11:22=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 08 Aug 2023 12:39:32 +0200,
> Karol Herbst wrote:
> >
> > On Mon, Aug 7, 2023 at 5:05=E2=80=AFPM Borislav Petkov <bp@alien8.de> w=
rote:
> > >
> > > On Mon, Aug 07, 2023 at 01:49:42PM +0200, Karol Herbst wrote:
> > > > in what way does it stop? Just not progressing? That would be kinda
> > > > concerning. Mind tracing with what arguments `nvkm_uevent_add` is
> > > > called with and without that patch?
> > >
> > > Well, me dumping those args I guess made the box not freeze before
> > > catching a #PF over serial. Does that help?
> > >
> > > ....
> > > [    3.410135] Unpacking initramfs...
> > > [    3.416319] software IO TLB: mapped [mem 0x00000000a877d000-0x0000=
0000ac77d000] (64MB)
> > > [    3.418227] Initialise system trusted keyrings
> > > [    3.432273] workingset: timestamp_bits=3D56 max_order=3D22 bucket_=
order=3D0
> > > [    3.439006] ntfs: driver 2.1.32 [Flags: R/W].
> > > [    3.443368] fuse: init (API version 7.38)
> > > [    3.447601] 9p: Installing v9fs 9p2000 file system support
> > > [    3.453223] Key type asymmetric registered
> > > [    3.457332] Asymmetric key parser 'x509' registered
> > > [    3.462236] Block layer SCSI generic (bsg) driver version 0.4 load=
ed (major 250)
> > > [    3.475865] efifb: probing for efifb
> > > [    3.479458] efifb: framebuffer at 0xf9000000, using 1920k, total 1=
920k
> > > [    3.485969] efifb: mode is 800x600x32, linelength=3D3200, pages=3D=
1
> > > [    3.491872] efifb: scrolling: redraw
> > > [    3.495438] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
> > > [    3.502349] Console: switching to colour frame buffer device 100x3=
7
> > > [    3.509564] fb0: EFI VGA frame buffer device
> > > [    3.514013] ACPI: \_PR_.CP00: Found 4 idle states
> > > [    3.518850] ACPI: \_PR_.CP01: Found 4 idle states
> > > [    3.523687] ACPI: \_PR_.CP02: Found 4 idle states
> > > [    3.528515] ACPI: \_PR_.CP03: Found 4 idle states
> > > [    3.533346] ACPI: \_PR_.CP04: Found 4 idle states
> > > [    3.538173] ACPI: \_PR_.CP05: Found 4 idle states
> > > [    3.543003] ACPI: \_PR_.CP06: Found 4 idle states
> > > [    3.544219] Freeing initrd memory: 8196K
> > > [    3.547844] ACPI: \_PR_.CP07: Found 4 idle states
> > > [    3.609542] Serial: 8250/16550 driver, 4 ports, IRQ sharing enable=
d
> > > [    3.616224] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 11=
5200) is a 16550A
> > > [    3.625552] serial 0000:00:16.3: enabling device (0000 -> 0003)
> > > [    3.633034] 0000:00:16.3: ttyS1 at I/O 0xf0a0 (irq =3D 17, base_ba=
ud =3D 115200) is a 16550A
> > > [    3.642451] Linux agpgart interface v0.103
> > > [    3.647141] ACPI: bus type drm_connector registered
> > > [    3.653261] Console: switching to colour dummy device 80x25
> > > [    3.659092] nouveau 0000:03:00.0: vgaarb: deactivate vga console
> > > [    3.665174] nouveau 0000:03:00.0: NVIDIA GT218 (0a8c00b1)
> > > [    3.784585] nouveau 0000:03:00.0: bios: version 70.18.83.00.08
> > > [    3.792244] nouveau 0000:03:00.0: fb: 512 MiB DDR3
> > > [    3.948786] nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
> > > [    3.953755] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
> > > [    3.959073] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
> > > [    3.964808] nouveau 0000:03:00.0: DRM: DCB version 4.0
> > > [    3.969938] nouveau 0000:03:00.0: DRM: DCB outp 00: 02000360 00000=
000
> > > [    3.976367] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000362 00020=
010
> > > [    3.982792] nouveau 0000:03:00.0: DRM: DCB outp 02: 028003a6 0f220=
010
> > > [    3.989223] nouveau 0000:03:00.0: DRM: DCB outp 03: 01011380 00000=
000
> > > [    3.995647] nouveau 0000:03:00.0: DRM: DCB outp 04: 08011382 00020=
010
> > > [    4.002076] nouveau 0000:03:00.0: DRM: DCB outp 05: 088113c6 0f220=
010
> > > [    4.008511] nouveau 0000:03:00.0: DRM: DCB conn 00: 00101064
> > > [    4.014151] nouveau 0000:03:00.0: DRM: DCB conn 01: 00202165
> > > [    4.021710] nvkm_uevent_add: uevent: 0xffff888100242100, event: 0x=
ffff8881022de1a0, id: 0x0, bits: 0x1, func: 0x0000000000000000
> > > [    4.033680] nvkm_uevent_add: uevent: 0xffff888100242300, event: 0x=
ffff8881022de1a0, id: 0x0, bits: 0x1, func: 0x0000000000000000
> > > [    4.045429] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer c=
opies
> > > [    4.052059] stackdepot: allocating hash table of 1048576 entries v=
ia kvcalloc
> > > [    4.067191] nvkm_uevent_add: uevent: 0xffff888100242800, event: 0x=
ffff888104b3e260, id: 0x0, bits: 0x1, func: 0x0000000000000000
> > > [    4.078936] nvkm_uevent_add: uevent: 0xffff888100242900, event: 0x=
ffff888104b3e260, id: 0x1, bits: 0x1, func: 0x0000000000000000
> > > [    4.090514] nvkm_uevent_add: uevent: 0xffff888100242a00, event: 0x=
ffff888102091f28, id: 0x1, bits: 0x3, func: 0xffffffff8177b700
> > > [    4.102118] tsc: Refined TSC clocksource calibration: 3591.345 MHz
> > > [    4.108342] clocksource: tsc: mask: 0xffffffffffffffff max_cycles:=
 0x33c4635c383, max_idle_ns: 440795314831 ns
> > > [    4.108401] nvkm_uevent_add: uevent: 0xffff8881020b6000, event: 0x=
ffff888102091f28, id: 0xf, bits: 0x3, func: 0xffffffff8177b700
> > > [    4.129864] clocksource: Switched to clocksource tsc
> > > [    4.131478] [drm] Initialized nouveau 1.3.1 20120801 for 0000:03:0=
0.0 on minor 0
> > > [    4.143806] BUG: kernel NULL pointer dereference, address: 0000000=
000000020
> >
> > ahh, that would have been good to know :) Mind figuring out what's
> > exactly NULL inside nvif_object_mthd? Or rather what line
> > `nvif_object_mthd+0x136` belongs to, then it should be easy to figure
> > out what's wrong here.
>
> FWIW, we've hit the bug on openSUSE Tumbleweed 6.4.8 kernel:
>   https://bugzilla.suse.com/show_bug.cgi?id=3D1214073
> Confirmed that reverting the patch cured the issue.
>
> FWIW, loading nouveau showed a refcount_t warning just before the NULL
> dereference:
>

mh, I wonder if one of those `return -EINVAL;` branches is hit where
it wasn't before. Could some of you check if `nvkm_uconn_uevent`
returns -EINVAL with that patch where it didn't before? I wonder if
it's the `if (&outp->head =3D=3D &conn->disp->outps) return -EINVAL;` and
if remove that fixes the crash?

> [  163.237655] ACPI Warning: \_SB.PCI0.IXVE.IGPU._DSM: Argument #4 type m=
ismatch - Found [Buffer], ACPI requires [Package] (20230331/nsarguments-61)
> [  163.237700] ACPI: \_SB_.PCI0.IXVE.IGPU: failed to evaluate _DSM
> [  163.237755] nouveau 0000:02:00.0: enabling device (0002 -> 0003)
> [  163.238089] ACPI: \_SB_.PCI0.LGPU: Enabled at IRQ 20
> [  163.249419] Console: switching to colour dummy device 80x25
> [  163.266174] nouveau 0000:02:00.0: vgaarb: deactivate vga console
> [  163.266307] nouveau 0000:02:00.0: NVIDIA MCP79/MCP7A (0ac180b1)
> [  163.287303] nouveau 0000:02:00.0: bios: version 62.79.40.00.01
> [  163.309529] nouveau 0000:02:00.0: fb: 256 MiB stolen system memory
> [  163.383121] nouveau 0000:02:00.0: DRM: VRAM: 256 MiB
> [  163.383132] nouveau 0000:02:00.0: DRM: GART: 1048576 MiB
> [  163.383138] nouveau 0000:02:00.0: DRM: TMDS table version 2.0
> [  163.383142] nouveau 0000:02:00.0: DRM: DCB version 4.0
> [  163.383145] nouveau 0000:02:00.0: DRM: DCB outp 00: 01000123 00010014
> [  163.383150] nouveau 0000:02:00.0: DRM: DCB outp 01: 02021232 00000010
> [  163.383154] nouveau 0000:02:00.0: DRM: DCB outp 02: 02021286 0f220010
> [  163.383158] nouveau 0000:02:00.0: DRM: DCB conn 00: 00000040
> [  163.383162] nouveau 0000:02:00.0: DRM: DCB conn 01: 0000a146
> [  163.385635] nouveau 0000:02:00.0: DRM: MM: using M2MF for buffer copie=
s
> [  163.417977] ------------[ cut here ]------------
> [  163.417988] refcount_t: saturated; leaking memory.
> [  163.418012] WARNING: CPU: 1 PID: 2873 at lib/refcount.c:19 refcount_wa=
rn_saturate+0x9b/0x110
> [  163.418022] Modules linked in: nouveau(+) button mxm_wmi i2c_algo_bit =
drm_display_helper drm_ttm_helper xt_conntrack xt_MASQUERADE nf_conntrack_n=
etlink nfnetlink xfrm_user xfrm_algo iptable_nat nf_nat nf_conntrack nf_def=
rag_ipv6 nf_defrag_ipv4 xt_addrtype iptable_filter bpfilter br_netfilter br=
idge stp llc overlay ccm af_packet bnep btusb btrtl btbcm btintel btmtk blu=
etooth ecdh_generic uvcvideo rtl8xxxu videobuf2_vmalloc mac80211 uvc videob=
uf2_memops videobuf2_v4l2 videodev libarc4 videobuf2_common mc cfg80211 hid=
_appleir hid_apple bcm5974 apple_mfi_fastcharge iscsi_ibft iscsi_boot_sysfs=
 joydev rfkill qrtr z3fold snd_hda_codec_realtek snd_hda_codec_generic ledt=
rig_audio coretemp snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hd=
a_codec kvm_intel snd_hda_core applesmc snd_hwdep kvm snd_pcm irqbypass pcs=
pkr acpi_cpufreq snd_timer binfmt_misc snd forcedeth soundcore squashfs nls=
_iso8859_1 loop nls_cp437 vfat fat i2c_nforce2 acpi_als industrialio_trigge=
red_buffer kfifo_buf indu
>  strialio sbs sbshc apple_bl ac
> [  163.418129]  tiny_power_button fuse efi_pstore configfs dmi_sysfs ip_t=
ables x_tables hid_generic usbhid ttm video wmi cec ohci_pci ohci_hcd ehci_=
pci rc_core sr_mod ehci_hcd sha512_ssse3 cdrom usbcore nv_tco btrfs blake2b=
_generic libcrc32c xor raid6_pq sg dm_multipath dm_mod scsi_dh_rdac scsi_dh=
_emc scsi_dh_alua msr efivarfs [last unloaded: button]
> [  163.418177] CPU: 1 PID: 2873 Comm: modprobe Not tainted 6.4.8-1-defaul=
t #1 openSUSE Tumbleweed 5f0d78911475bf45bbeef64510275b9fba2542b1
> [  163.418183] Hardware name: Apple Inc. MacBook5,1/Mac-F42D89C8, BIOS   =
  MB51.88Z.007D.B03.0904271443 04/27/09
> [  163.418187] RIP: 0010:refcount_warn_saturate+0x9b/0x110
> [  163.418192] Code: 01 01 e8 68 7b aa ff 0f 0b c3 cc cc cc cc 80 3d e6 e=
1 a8 01 00 75 a8 48 c7 c7 d0 ed 05 a4 c6 05 d6 e1 a8 01 01 e8 45 7b aa ff <=
0f> 0b c3 cc cc cc cc 80 3d c0 e1 a8 01 00 75 85 48 c7 c7 28 ee 05
> [  163.418196] RSP: 0018:ffffbae941613aa0 EFLAGS: 00010086
> [  163.418200] RAX: 0000000000000000 RBX: ffff951bc88c2000 RCX: 000000000=
0000027
> [  163.418204] RDX: ffff951cf81274c8 RSI: 0000000000000001 RDI: ffff951cf=
81274c0
> [  163.418207] RBP: 0000000000000246 R08: 0000000000000000 R09: ffffbae94=
1613948
> [  163.418210] R10: 0000000000000003 R11: ffffffffa4958d48 R12: ffff951be=
0df3a58
> [  163.418213] R13: ffffbae941613ad8 R14: ffff951be0df3800 R15: 000000000=
0000000
> [  163.418216] FS:  00007f81c0247740(0000) GS:ffff951cf8100000(0000) knlG=
S:0000000000000000
> [  163.418220] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  163.418223] CR2: 00005653d818cd64 CR3: 000000012c72a000 CR4: 000000000=
00006e0
> [  163.418226] Call Trace:
> [  163.418231]  <TASK>
> [  163.418234]  ? refcount_warn_saturate+0x9b/0x110
> [  163.418238]  ? __warn+0x81/0x130
> [  163.418248]  ? refcount_warn_saturate+0x9b/0x110
> [  163.418252]  ? report_bug+0x171/0x1a0
> [  163.418259]  ? handle_bug+0x3c/0x80
> [  163.418264]  ? exc_invalid_op+0x17/0x70
> [  163.418268]  ? asm_exc_invalid_op+0x1a/0x20
> [  163.418275]  ? refcount_warn_saturate+0x9b/0x110
> [  163.418279]  drm_connector_list_iter_next+0x97/0xc0
> [  163.418289]  drm_connector_register_all+0x3d/0xf0
> [  163.418296]  drm_modeset_register_all+0x5f/0x80
> [  163.418302]  drm_dev_register+0x114/0x240
> [  163.418307]  nouveau_drm_probe+0x16a/0x280 [nouveau 7f21e95875a4a01375=
64007ae3277f6b641e9279]
> [  163.418713]  local_pci_probe+0x45/0xa0
> [  163.418719]  pci_device_probe+0xc7/0x230
> [  163.418726]  really_probe+0x19e/0x3e0
> [  163.418730]  ? __pfx___driver_attach+0x10/0x10
> [  163.418734]  __driver_probe_device+0x78/0x160
> [  163.418737]  driver_probe_device+0x1f/0x90
> [  163.418741]  __driver_attach+0xd2/0x1c0
> [  163.418745]  bus_for_each_dev+0x77/0xc0
> [  163.418751]  bus_add_driver+0x116/0x220
> [  163.418757]  driver_register+0x59/0x100
> [  163.418762]  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau 7f21e95875a4a=
0137564007ae3277f6b641e9279]
> [  163.418999]  do_one_initcall+0x4a/0x220
> [  163.418999]  ? kmalloc_trace+0x2a/0xa0
> [  163.418999]  do_init_module+0x60/0x240
> [  163.418999]  __do_sys_init_module+0x17f/0x1b0
> [  163.418999]  do_syscall_64+0x60/0x90
> [  163.418999]  ? syscall_exit_to_user_mode+0x1b/0x40
> [  163.418999]  ? do_syscall_64+0x6c/0x90
> [  163.418999]  ? count_memcg_events.constprop.0+0x1a/0x30
> [  163.418999]  ? handle_mm_fault+0x9e/0x350
> [  163.418999]  ? do_user_addr_fault+0x179/0x640
> [  163.418999]  ? exc_page_fault+0x71/0x160
> [  163.418999]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  163.418999] RIP: 0033:0x7f81bfb19a5e
> [  163.418999] Code: c3 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 9=
0 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 49 89 ca b8 af 00 00 00 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 7a 03 0d 00 f7 d8 64 89 01 48
> [  163.418999] RSP: 002b:00007ffddb1760c8 EFLAGS: 00000246 ORIG_RAX: 0000=
0000000000af
> [  163.418999] RAX: ffffffffffffffda RBX: 0000560bc842df00 RCX: 00007f81b=
fb19a5e
> [  163.418999] RDX: 0000560bc8432900 RSI: 00000000006aef9b RDI: 00007f81b=
ea94010
> [  163.418999] RBP: 0000560bc8432900 R08: 0000560bc8432c20 R09: 000000000=
0000000
> [  163.418999] R10: 0000000000012b71 R11: 0000000000000246 R12: 000000000=
0040000
> [  163.418999] R13: 0000000000000000 R14: 0000000000000009 R15: 0000560bc=
842d7b0
> [  163.418999]  </TASK>
> [  163.418999] ---[ end trace 0000000000000000 ]---
>
> The full dmesg is found in
>   https://bugzilla.suse.com/attachment.cgi?id=3D868688
>
>
> thanks,
>
> Takashi
>

