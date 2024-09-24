Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCFB984794
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 16:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CAD10E8C2;
	Tue, 24 Sep 2024 14:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FjoEQ/DC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1C410E8C2;
 Tue, 24 Sep 2024 14:22:31 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-7db3e962c2aso453569a12.0; 
 Tue, 24 Sep 2024 07:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727187751; x=1727792551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7onTEOatE2DhoGMOCkJ+plPI3T3PYBmmSUdgwoaXgLk=;
 b=FjoEQ/DC/UABFFiOi0kNc3Lqxu4bIRPdZefaT/kGDOh0waSNiS6x26ulGZfu9HrCVB
 UeWI8uD0J764LfLLqHjtQcsQ3q9Xiz2/vtzOtxavt4JPEjoM3QSDOH89Eipza5PQ8Jw6
 fyIjLPdcEXpP29IG620JXSS5iGoYiw0c0xA+Qay1oLmsCppcSWRfC0+8ztU+2TDGy3ZW
 SQFDwGC719lFqYrBar//to2OV/vi82d2K56bmYnLK9T9O9aOYT4iyAFxLKRi48v3zUPm
 0nxmhJ0AnpTKe4YPClEzEN1BslV6syGeZUw5I+Ze7c+7L/TtQXPEregG1YUeOX1Myy6P
 N7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727187751; x=1727792551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7onTEOatE2DhoGMOCkJ+plPI3T3PYBmmSUdgwoaXgLk=;
 b=fzfZO6ThwpLkTGg4P1klF1m6Gkc/D9U2m3rXECPoPeWKX+SWwR4/0Kjins8ViC0a9y
 BbZtQSyurgw1A1K4q9EqGWaJ+dX3ihb+HKuvzjmONLVwzJhuwXy3LdLDPruS2HqPQBLh
 vZ0J6WwD0Xehcnfl2Tx3pBAvEEjjHzfkpHpzeowstwcqvrKIGcSGAc9KdGo+YPaRdgkT
 0J0aBY0RVmtfRvl6nn0Zhrz0C/36cuVf/JCZXxxivUqH7Yb2KIReQYnQX+jOsc7wjlpx
 bvrweN6iT7N1iNMXZ8zVWwS+uwectHoVH6ER3YnXihiRpTqjoMcE9/KRmWyIXUsG9+ZY
 FbTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrFLjoBS2idbcgNUZaiLW4GaPkiLrRQKISrtHk2pHb+fm+650iki0v8hBf0cHvxwMIvnLXp3iyeSR5@lists.freedesktop.org,
 AJvYcCWryNyOuAJ6Fbmzq3XW8ZQcOIs24QuMCowxOIlpp1GK5y/Fd6vTlA1wjPi55CX+YdIv3n8E2Soq@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyk2kY2ccme5ern9PfSsgU6m6Uyt0M1yE/w4nDNfgG5nIb0x93Z
 E7Ms49ggLeHaAYhTI4Jlc7mYOoLbEfDiOk+DWsjOUGitmZk01FFrW4su3mhnh/uGkH2+0gyRYfa
 lGtyNUiSnfoHXOcfl6Tp+vzZqqZEIh3Iy
X-Google-Smtp-Source: AGHT+IGiZrSClTjeDYK99K6RV8VI71KCcf0SL/reJlcJeKBFginuCdrBgo08tJeBlkA0Ztfbs8IzRAz9K49VhrdKqQs=
X-Received: by 2002:a17:902:f681:b0:205:76f3:fc22 with SMTP id
 d9443c01a7336-20aefd5b2cemr16238685ad.3.1727187750669; Tue, 24 Sep 2024
 07:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240919165641.4632-1-user@am64> <20240924020824.6264-1-user@am64>
 <8eb45005-c6fb-4baa-a44a-243958a3a1ba@suse.de>
 <c960dc48-0a05-4cad-b86b-33ad59923bc3@suse.de>
In-Reply-To: <c960dc48-0a05-4cad-b86b-33ad59923bc3@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Sep 2024 10:22:18 -0400
Message-ID: <CADnq5_OtdUvOUPpq1aUoxtgpt6a4h598019SNhe+9ZWUaANYqg@mail.gmail.com>
Subject: Re: radeon ARUBA NULL pointer dereference
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Arthur Marsh <arthur.marsh@internode.on.net>, Xinhui.Pan@amd.com,
 airlied@gmail.com, 
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org, 
 christian.koenig@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, wuhoipok@gmail.com, iommu@lists.linux.dev, 
 "the arch/x86 maintainers" <x86@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 24, 2024 at 8:43=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
>
>
> Am 24.09.24 um 14:20 schrieb Thomas Zimmermann:
> > (cc: DMA and x86 folks)
> >
> > Hi
> >
> > Am 24.09.24 um 04:08 schrieb Arthur Marsh:
> >> Using current Linus git head kernel, I was able to save the dmesg
> >> output:
> >>
> >> [   17.218724] [drm] radeon kernel modesetting enabled.
> >> [   17.218778] radeon 0000:00:01.0: vgaarb: deactivate vga console
> >> [   17.219509] Console: switching to colour dummy device 80x25
> >> [   17.219700] [drm] initializing kernel modesetting (ARUBA
> >> 0x1002:0x990C 0x1002:0x0123 0x00).
> >> [   17.219773] ATOM BIOS: 113
> >> [   17.219838] radeon 0000:00:01.0: VRAM: 768M 0x0000000000000000 -
> >> 0x000000002FFFFFFF (768M used)
> >> [   17.219841] radeon 0000:00:01.0: GTT: 1024M 0x0000000030000000 -
> >> 0x000000006FFFFFFF
> >> [   17.219844] [drm] Detected VRAM RAM=3D768M, BAR=3D256M
> >> [   17.219845] [drm] RAM width 64bits DDR
> >> [   17.219851] BUG: kernel NULL pointer dereference, address:
> >> 00000000000000a0
> >
> > This is 160 bytes behind NULL, which indicates a field within a struct.
> >
> >> [   17.219852] #PF: supervisor read access in kernel mode
> >> [   17.219853] #PF: error_code(0x0000) - not-present page
> >> [   17.219854] PGD 0 P4D 0
> >> [   17.219856] Oops: Oops: 0000 [#1] PREEMPT_RT SMP NOPTI
> >> [   17.219858] CPU: 0 UID: 0 PID: 451 Comm: udevd Not tainted 6.11.0+
> >> #6121
> >> [   17.219860] Hardware name: Gigabyte Technology Co., Ltd. To be
> >> filled by O.E.M./F2A78M-HD2, BIOS F2 05/28/2014
> >> [   17.219862] RIP: 0010:dma_get_required_mask+0x11/0x50
> >> [   17.219868] Code: 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90
> >> 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 48 8b 87 68 02 00 00 48 85
> >> c0 74 11 <48> 8b 80 a0 00 00 00 48 85 c0 74 1f e9 ee ed 94 00 f6 87
> >> 2c 03 00
> >> [   17.219870] RSP: 0018:ffffa54bc13a7b00 EFLAGS: 00010202
> >> [   17.219871] RAX: 0000000000000000 RBX: 000000ffffffffff RCX:
> >> 0000000000000000
> >> [   17.219872] RDX: 0000000000000000 RSI: 0000000000000027 RDI:
> >> ffff976f44e720c8
> >> [   17.219873] RBP: ffff976f44e720c8 R08: 00000000ffffefff R09:
> >> ffffffffab2aab08
> >> [   17.219874] R10: 00000000fffff000 R11: 0000000000000002 R12:
> >> 0000000000000000
> >> [   17.219875] R13: ffff976f48a4aa30 R14: 0000000000000000 R15:
> >> 0000000000000028
> >> [   17.219876] FS:  00007f59a070d840(0000) GS:ffff97726f800000(0000)
> >> knlGS:0000000000000000
> >> [   17.219878] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> [   17.219879] CR2: 00000000000000a0 CR3: 00000001053b4000 CR4:
> >> 00000000000406f0
> >> [   17.219880] Call Trace:
> >> [   17.219881]  <TASK>
> >> [   17.219882]  ? __die_body.cold+0x19/0x1e
> >> [   17.219885]  ? page_fault_oops+0xa8/0x230
> >> [   17.219889]  ? search_module_extables+0x4f/0x90
> >> [   17.219891]  ? fixup_exception+0x36/0x2f0
> >> [   17.219894]  ? exc_page_fault+0x88/0x1b0
> >> [   17.219897]  ? asm_exc_page_fault+0x22/0x30
> >> [   17.219900]  ? dma_get_required_mask+0x11/0x50

Also reported here:
https://gitlab.freedesktop.org/drm/amd/-/issues/3648

Alex

> >
> > This is not in the radeon driver but the DMA code. I'd say it's at
> > [1], as get_required_mask is 160 bytes within struct drm_map_ops. The
> > call to get_arch_dma_ops() probably returns NULL.
>
> And indeed, when I added
>
>      pr_warn("dev dma ops: 0x%p\n", pdev->dev.dma_ops);
>      pr_warn("arch dma ops: 0x%p\n", get_arch_dma_ops());
>
> to radeon_pci_probe(), I got
>
> [   22.325657] dev dma ops: 0x0000000000000000
> [   22.342921] arch dma ops: 0x0000000000000000
>
> as a result.
>
> Best regards
> Thomas
>
> >
> > Best regards
> > Thomas
> >
> > [1]
> > https://elixir.bootlin.com/linux/v6.11/source/kernel/dma/mapping.c#L523
> > [2]
> > https://elixir.bootlin.com/linux/v6.11/source/include/linux/dma-map-ops=
.h#L98
> >
> >> [   17.219902] dma_addressing_limited+0x6c/0xb0
> >> [   17.219905]  radeon_ttm_init+0x3f/0x210 [radeon]
> >> [   17.219977]  cayman_init+0x97/0x290 [radeon]
> >> [   17.220057]  radeon_device_init+0x5e9/0xb40 [radeon]
> >> [   17.220115]  radeon_driver_load_kms+0xb0/0x260 [radeon]
> >> [   17.220174]  radeon_pci_probe+0xff/0x170 [radeon]
> >> [   17.220231]  pci_device_probe+0xbe/0x1a0
> >> [   17.220234]  really_probe+0xde/0x350
> >> [   17.220237]  ? pm_runtime_barrier+0x61/0xb0
> >> [   17.220240]  ? __pfx___driver_attach+0x10/0x10
> >> [   17.220242]  __driver_probe_device+0x78/0x110
> >> [   17.220245]  driver_probe_device+0x2d/0xc0
> >> [   17.220247]  __driver_attach+0xc9/0x1c0
> >> [   17.220249]  bus_for_each_dev+0x6a/0xb0
> >> [   17.220251]  ? migrate_enable+0xbf/0xf0
> >> [   17.220254]  bus_add_driver+0x139/0x220
> >> [   17.220256]  driver_register+0x6e/0xc0
> >> [   17.220258]  ? __pfx_radeon_module_init+0x10/0x10 [radeon]
> >> [   17.220315]  do_one_initcall+0x42/0x210
> >> [   17.220318]  ? __kmalloc_cache_noprof+0x89/0x230
> >> [   17.220321]  do_init_module+0x60/0x210
> >> [   17.220324]  init_module_from_file+0x89/0xc0
> >> [   17.220326]  __x64_sys_finit_module+0x142/0x390
> >> [   17.220329]  do_syscall_64+0x47/0x110
> >> [   17.220331]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >> [   17.220334] RIP: 0033:0x7f59a0625279
> >> [   17.220336] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00
> >> 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
> >> 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 77 6b 0d 00 f7 d8 64
> >> 89 01 48
> >> [   17.220337] RSP: 002b:00007ffd15ee7df8 EFLAGS: 00000246 ORIG_RAX:
> >> 0000000000000139
> >> [   17.220339] RAX: ffffffffffffffda RBX: 00005578ae660840 RCX:
> >> 00007f59a0625279
> >> [   17.220340] RDX: 0000000000000000 RSI: 00005578ae677fc0 RDI:
> >> 0000000000000011
> >> [   17.220341] RBP: 0000000000000000 R08: 00007f59a06fcb20 R09:
> >> 00005578ae640550
> >> [   17.220342] R10: 0000000000000040 R11: 0000000000000246 R12:
> >> 00005578ae677fc0
> >> [   17.220342] R13: 0000000000020000 R14: 00005578ae651750 R15:
> >> 0000000000000000
> >> [   17.220344]  </TASK>
> >> [   17.220345] Modules linked in: radeon(+) snd_hda_codec_hdmi
> >> snd_seq_midi snd_seq_midi_event snd_seq snd_hda_intel
> >> snd_intel_dspcfg snd_emu10k1 snd_hda_codec drm_ttm_helper ttm
> >> snd_util_mem drm_suballoc_helper snd_ac97_codec snd_hda_core
> >> drm_display_helper ac97_bus snd_rawmidi snd_hwdep snd_seq_device
> >> snd_pcm drm_kms_helper edac_mce_amd sha512_ssse3 sha512_generic
> >> k10temp sha256_ssse3 sha1_ssse3 drm aesni_intel snd_timer gf128mul
> >> crypto_simd cryptd acpi_cpufreq evdev pcspkr serio_raw emu10k1_gp
> >> gameport at24 regmap_i2c i2c_algo_bit snd video soundcore wmi button
> >> sp5100_tco ext4 crc32c_generic crc16 mbcache jbd2 uas usb_storage
> >> hid_generic usbhid hid sg sr_mod sd_mod cdrom ata_generic
> >> firewire_ohci crc32_pclmul crc32c_intel firewire_core crc_itu_t
> >> pata_atiixp i2c_piix4 i2c_smbus ahci r8169 libahci xhci_pci ohci_pci
> >> realtek libata mdio_devres ehci_pci ohci_hcd xhci_hcd scsi_mod
> >> ehci_hcd scsi_common usbcore libphy usb_common
> >> [   17.220388] CR2: 00000000000000a0
> >> [   17.220390] ---[ end trace 0000000000000000 ]---
> >>
> >> Happy to provide additional information and run tests.
> >>
> >> Regards,
> >>
> >> Arthur Marsh.
> >
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
