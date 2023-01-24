Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F2D67905B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 06:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D892E10E608;
	Tue, 24 Jan 2023 05:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6B710E608;
 Tue, 24 Jan 2023 05:49:37 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id tz11so36268107ejc.0;
 Mon, 23 Jan 2023 21:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhJwRm9AKY3Nh8HZfpL/HR1cmEvlo8eF444A2EWsj7Q=;
 b=cTEBHYiglClAcEfFNHuXU4rMI8+Vjx8i47QKY5knZpahYQALZ/m/7HF89etAoT6m5P
 V7H9kbF4WXjXUc0ftE0xfOvElupkZVkB/PwjYhGjdApysPwJ9qHuRO8zeBDFlOH6VJ5B
 b2fKQ00+RJvsBHB0O4uPWXOnjfj3X8s2sBI28TujwaCNZ+9Q2xwN4KGLNnANysqubvQ6
 zNM5UDGpbQzG04gfaKMEO+3nEKCrEgnTbpJ+THDUAcAOYx65KLeZC7SkPTqeQkHaNlW1
 t1E6bbf3FT77lZm1gFuagh/5GSMMtS9wCZyjN7qe4PhLrD+/6bgJdE3NN6bSJNQWGF2l
 ZhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uhJwRm9AKY3Nh8HZfpL/HR1cmEvlo8eF444A2EWsj7Q=;
 b=mmdqvXMFvgFWc9Y6zUuQ6DuFermnujrM7CSwCRs++EoAviam+z98Y6WBiPtkOepwMV
 WcHjtuoTqXAi79yVAWTKn0oPmVRwP9XlIJPLib1ZqQzlJKxH/Jp/nVGKpNtTqv5byZ2G
 4P72057wKVXKqvZAS5dOCNlS1Q51ZXhr1fZczQ9zthDFCTyyR4rT6h6YxqffCSzyS2Ge
 CnrpfCgPKssjc/5c1NWDq9h6Ud4/PJTfKepmS1fUQrJ07cTTLtq2xr1HCiFmJwmtr4gl
 Il5xmDNbQ+Sb8Mh6BbmMTDmLpeV91JoHChAcPCHBnncs244zLSX/eLO0Hlyog5SvEL4m
 lDRg==
X-Gm-Message-State: AFqh2krk3DziOOdVBsbXqMZYB+lQiW3ggK9oQjBT7IT5BLCjeGWzgGmO
 qnb+sASoi3JThpcxOV4NypY=
X-Google-Smtp-Source: AMrXdXunS5/LxnUeuIKnB82SPjD6RKgguWToG2ra0FCgegRYGRtaHAi4iYIebGj5LX8JB6FYkWSNqw==
X-Received: by 2002:a17:907:2a8c:b0:870:8e22:1433 with SMTP id
 fl12-20020a1709072a8c00b008708e221433mr20744744ejc.16.1674539375532; 
 Mon, 23 Jan 2023 21:49:35 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch.
 [82.192.242.114]) by smtp.gmail.com with ESMTPSA id
 w1-20020a170906480100b0080c433a9eeesm391060ejq.182.2023.01.23.21.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 21:49:34 -0800 (PST)
Received: by eldamar.lan (Postfix, from userid 1000)
 id 7038BBE2DE0; Tue, 24 Jan 2023 06:49:33 +0100 (CET)
Date: Tue, 24 Jan 2023 06:49:33 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Assertion failure in i915 intel_display.c#assert_plane() after
 resume from hibernation
Message-ID: <Y89xbXITTRFpjm5B@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nabijaczleweli@nabijaczleweli.xyz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

A user in Debian, cc'ed reporte the following issue when resuming from
hibernation, tested as well on recent 6.1.7 kernel, context see
https://bugs.debian.org/971068

> Can repro on the sid kernel, uname -a of
>   Linux nabtop 6.1.0-2-686-pae #1 SMP PREEMPT_DYNAMIC Debian 6.1.7-1 (202=
3-01-18) i686 GNU/Linux
>=20
> Log below. Backtrace is only trivially different.
>=20
> Best,
> =D0=BD=D0=B0=D0=B1
>=20
> -- >8 --
> Jan 22 14:06:46 nabtop kernel: OOM killer disabled.
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [me=
m 0x00000000-0x00000fff]
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [me=
m 0x0009f000-0x000fffff]
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [me=
m 0xb5aa1000-0xb5aa6fff]
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [me=
m 0xb5bba000-0xb5c0efff]
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [me=
m 0xb5d08000-0xb5f0efff]
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [me=
m 0xb5f18000-0xb5f1efff]
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [me=
m 0xb5f65000-0xb5f9efff]
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [me=
m 0xb5fe1000-0xb5ffefff]
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [me=
m 0xb6000000-0xffffffff]
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Basic memory bitmaps crea=
ted
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Preallocating image memory
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Allocated 183519 pages fo=
r snapshot
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Allocated 734076 kbytes i=
n 0.70 seconds (1048.68 MB/s)
> Jan 22 14:06:46 nabtop kernel: Freezing remaining freezable tasks ... (el=
apsed 0.001 seconds) done.
> Jan 22 14:06:46 nabtop kernel: wifi1: deauthenticating from de:0d:17:ad:8=
0:55 by local choice (Reason: 3=3DDEAUTH_LEAVING)
> Jan 22 14:06:46 nabtop kernel: ACPI: EC: interrupt blocked
> Jan 22 14:06:46 nabtop kernel: ACPI: PM: Preparing to enter system sleep =
state S4
> Jan 22 14:06:46 nabtop kernel: ACPI: EC: event blocked
> Jan 22 14:06:46 nabtop kernel: ACPI: EC: EC stopped
> Jan 22 14:06:46 nabtop kernel: ACPI: PM: Saving platform NVS memory
> Jan 22 14:06:46 nabtop kernel: Disabling non-boot CPUs ...
> Jan 22 14:06:46 nabtop kernel: smpboot: CPU 1 is now offline
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Creating image:
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Need to copy 175700 pages
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Normal pages needed: 5776=
5 + 1024, available pages: 167322
> Jan 22 14:06:46 nabtop kernel: ACPI: PM: Restoring platform NVS memory
> Jan 22 14:06:46 nabtop kernel: ACPI: EC: EC started
> Jan 22 14:06:46 nabtop kernel: Enabling non-boot CPUs ...
> Jan 22 14:06:46 nabtop kernel: x86: Booting SMP configuration:
> Jan 22 14:06:46 nabtop kernel: smpboot: Booting Node 0 Processor 1 APIC 0=
x1
> Jan 22 14:06:46 nabtop kernel: CPU1 is up
> Jan 22 14:06:46 nabtop kernel: ACPI: PM: Waking up from system sleep stat=
e S4
> Jan 22 14:06:46 nabtop kernel: ACPI: EC: interrupt unblocked
> Jan 22 14:06:46 nabtop kernel: ACPI: EC: event unblocked
> Jan 22 14:06:46 nabtop kernel: usb usb1: root hub lost power or was reset
> Jan 22 14:06:46 nabtop kernel: usb usb2: root hub lost power or was reset
> Jan 22 14:06:46 nabtop kernel: usb usb4: root hub lost power or was reset
> Jan 22 14:06:46 nabtop kernel: usb usb3: root hub lost power or was reset
> Jan 22 14:06:46 nabtop kernel: usb usb6: root hub lost power or was reset
> Jan 22 14:06:46 nabtop kernel: usb usb7: root hub lost power or was reset
> Jan 22 14:06:46 nabtop kernel: usb usb8: root hub lost power or was reset
> Jan 22 14:06:46 nabtop kernel: usb usb5: root hub lost power or was reset
> Jan 22 14:06:46 nabtop kernel: sd 0:0:0:0: [sda] Starting disk
> Jan 22 14:06:46 nabtop kernel: iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2=
-0x0
> Jan 22 14:06:46 nabtop kernel: iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2=
-0x0
> Jan 22 14:06:46 nabtop kernel: ------------[ cut here ]------------
> Jan 22 14:06:46 nabtop kernel: primary B assertion failure (expected off,=
 current on)
> Jan 22 14:06:46 nabtop kernel: WARNING: CPU: 0 PID: 1038 at drivers/gpu/d=
rm/i915/display/intel_display.c:476 assert_plane+0x9f/0xb0 [i915]
> Jan 22 14:06:46 nabtop kernel: Modules linked in: ghash_generic gf128mul =
gcm ccm algif_aead des_generic libdes ecb algif_skcipher bnep cmac md4 algi=
f_hash af_alg binfmt_misc btusb btrtl btbcm btintel btmtk bluetooth jittere=
ntropy_rng sha512_generic ctr drbg joydev ansi_cprng ecdh_generic ecc iwldv=
m mac80211 libarc4 iTCO_wdt intel_pmc_bxt snd_hda_codec_conexant iTCO_vendo=
r_support uvcvideo watchdog snd_hda_codec_generic ledtrig_audio videobuf2_v=
malloc videobuf2_memops i915 videobuf2_v4l2 nls_ascii snd_hda_intel iwlwifi=
 videobuf2_common snd_intel_dspcfg drm_buddy snd_intel_sdw_acpi nls_cp437 v=
ideodev drm_display_helper snd_hda_codec snd_hda_core i2c_i801 cec vfat mc =
psmouse evdev wmi_bmof i2c_smbus snd_hwdep rc_core pcspkr cfg80211 sg ttm f=
at lpc_ich snd_pcm drm_kms_helper toshiba_acpi snd_timer industrialio snd s=
parse_keymap toshiba_bluetooth sky2 soundcore rfkill i2c_algo_bit toshiba_h=
aps ac button acpi_cpufreq nf_log_syslog nft_log nft_limit nft_ct nf_conntr=
ack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables
> Jan 22 14:06:46 nabtop kernel:  libcrc32c nfnetlink drm ip_tables x_table=
s ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc64_rocksoft crc64=
 crc_t10dif sr_mod crct10dif_generic cdrom crct10dif_common sdhci_pci cqhci=
 ehci_pci uhci_hcd ehci_hcd ahci libahci sdhci libata mmc_core serio_raw fi=
rewire_ohci usbcore battery usb_common video wmi pkcs8_key_parser coretemp =
firewire_sbp2 firewire_core crc_itu_t scsi_mod scsi_common parport_pc ppdev=
 lp parport autofs4
> Jan 22 14:06:46 nabtop kernel: CPU: 0 PID: 1038 Comm: kworker/u4:20 Not t=
ainted 6.1.0-2-686-pae #1  Debian 6.1.7-1
> Jan 22 14:06:46 nabtop kernel: Hardware name: TOSHIBA Satellite Pro U400/=
Satellite Pro U400, BIOS V5.00    10/26/2010
> Jan 22 14:06:46 nabtop kernel: Workqueue: events_unbound async_run_entry_=
fn
> Jan 22 14:06:46 nabtop kernel: EIP: assert_plane+0x9f/0xb0 [i915]
> Jan 22 14:06:46 nabtop kernel: Code: ff 73 0c 68 30 da b7 f8 e8 0e c7 3a =
ff 83 c4 10 eb b3 8d b4 26 00 00 00 00 66 90 57 52 ff 73 0c 68 30 da b7 f8 =
e8 75 eb e3 dc <0f> 0b 83 c4 10 eb 94 e8 65 9c e7 dc 8d 74 26 00 90 3e 8d 7=
4 26 00
> Jan 22 14:06:46 nabtop kernel: EAX: 00000036 EBX: c1238c00 ECX: 00000001 =
EDX: 80000001
> Jan 22 14:06:46 nabtop kernel: ESI: 00000000 EDI: f8ba1548 EBP: c63f7cdc =
ESP: c63f7cb8
> Jan 22 14:06:46 nabtop kernel: DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 00=
68 EFLAGS: 00010292
> Jan 22 14:06:46 nabtop kernel: CR0: 80050033 CR2: 01e6fc26 CR3: 15e2c000 =
CR4: 000006f0
> Jan 22 14:06:46 nabtop kernel: Call Trace:
> Jan 22 14:06:46 nabtop kernel:  intel_disable_transcoder+0x71/0x2a0 [i915]
> Jan 22 14:06:46 nabtop kernel:  ? drm_vblank_get+0x65/0xd0 [drm]
> Jan 22 14:06:46 nabtop kernel:  ? drm_crtc_vblank_get+0x12/0x20 [drm]
> Jan 22 14:06:46 nabtop kernel:  ? assert_vblank_disabled+0x10/0x70 [i915]
> Jan 22 14:06:46 nabtop kernel:  i9xx_crtc_disable+0x56/0x260 [i915]
> Jan 22 14:06:46 nabtop kernel:  ? intel_synchronize_irq+0x16/0x20 [i915]
> Jan 22 14:06:46 nabtop kernel:  ? intel_crtc_disable_pipe_crc+0xa4/0xb0 [=
i915]
> Jan 22 14:06:46 nabtop kernel:  intel_old_crtc_state_disables+0x35/0x90 [=
i915]
> Jan 22 14:06:46 nabtop kernel:  intel_atomic_commit_tail+0x409/0xe30 [i91=
5]
> Jan 22 14:06:46 nabtop kernel:  ? sugov_start+0x150/0x150
> Jan 22 14:06:46 nabtop kernel:  ? sugov_start+0x150/0x150
> Jan 22 14:06:46 nabtop kernel:  intel_atomic_commit+0x30b/0x350 [i915]
> Jan 22 14:06:46 nabtop kernel:  ? intel_atomic_commit_tail+0xe30/0xe30 [i=
915]
> Jan 22 14:06:46 nabtop kernel:  drm_atomic_commit+0x6b/0xe0 [drm]
> Jan 22 14:06:46 nabtop kernel:  ? drm_plane_get_damage_clips.cold+0x1b/0x=
1b [drm]
> Jan 22 14:06:46 nabtop kernel:  drm_atomic_helper_commit_duplicated_state=
+0xb6/0xd0 [drm_kms_helper]
> Jan 22 14:06:46 nabtop kernel:  __intel_display_resume+0x6c/0xd0 [i915]
> Jan 22 14:06:46 nabtop kernel:  intel_display_resume+0xb4/0x120 [i915]
> Jan 22 14:06:46 nabtop kernel:  i915_drm_resume+0xc6/0x130 [i915]
> Jan 22 14:06:46 nabtop kernel:  i915_pm_resume+0x34/0x50 [i915]
> Jan 22 14:06:46 nabtop kernel:  i915_pm_restore+0x1f/0x30 [i915]
> Jan 22 14:06:46 nabtop kernel:  pci_pm_restore+0x5a/0xe0
> Jan 22 14:06:46 nabtop kernel:  ? pci_pm_poweroff_noirq+0x100/0x100
> Jan 22 14:06:46 nabtop kernel:  dpm_run_callback+0x4f/0x130
> Jan 22 14:06:46 nabtop kernel:  device_resume+0x70/0x150
> Jan 22 14:06:46 nabtop kernel:  ? device_resume+0x150/0x150
> Jan 22 14:06:46 nabtop kernel:  async_resume+0x1b/0x30
> Jan 22 14:06:46 nabtop kernel:  async_run_entry_fn+0x34/0x130
> Jan 22 14:06:46 nabtop kernel:  process_one_work+0x182/0x310
> Jan 22 14:06:46 nabtop kernel:  worker_thread+0x13e/0x380
> Jan 22 14:06:46 nabtop kernel:  kthread+0xda/0x100
> Jan 22 14:06:46 nabtop kernel:  ? rescuer_thread+0x340/0x340
> Jan 22 14:06:46 nabtop kernel:  ? kthread_complete_and_exit+0x20/0x20
> Jan 22 14:06:46 nabtop kernel:  ret_from_fork+0x1c/0x28
> Jan 22 14:06:46 nabtop kernel: ---[ end trace 0000000000000000 ]---
> Jan 22 14:06:46 nabtop kernel: ata1: SATA link up 3.0 Gbps (SStatus 123 S=
Control 300)
> Jan 22 14:06:46 nabtop kernel: ata2: SATA link up 1.5 Gbps (SStatus 113 S=
Control 300)
> Jan 22 14:06:46 nabtop kernel: ata6: SATA link down (SStatus 0 SControl 3=
00)
> Jan 22 14:06:46 nabtop kernel: ata5: SATA link down (SStatus 0 SControl 3=
00)
> Jan 22 14:06:46 nabtop kernel: ata1.00: unexpected _GTF length (8)
> Jan 22 14:06:46 nabtop kernel: ata1.00: unexpected _GTF length (8)
> Jan 22 14:06:46 nabtop kernel: ata1.00: configured for UDMA/100
> Jan 22 14:06:46 nabtop kernel: ata2.00: configured for UDMA/33
> Jan 22 14:06:46 nabtop kernel: usb 5-4: reset high-speed USB device numbe=
r 4 using ehci-pci
> Jan 22 14:06:46 nabtop kernel: usb 6-2: reset full-speed USB device numbe=
r 2 using uhci_hcd
> Jan 22 14:06:46 nabtop kernel: firewire_core 0000:0a:01.0: rediscovered d=
evice fw0
> Jan 22 14:06:46 nabtop kernel: ------------[ cut here ]------------
> Jan 22 14:06:46 nabtop kernel: primary B assertion failure (expected off,=
 current on)
> Jan 22 14:06:46 nabtop kernel: WARNING: CPU: 0 PID: 1038 at drivers/gpu/d=
rm/i915/display/intel_display.c:476 assert_plane+0x9f/0xb0 [i915]
> Jan 22 14:06:46 nabtop kernel: Modules linked in: ghash_generic gf128mul =
gcm ccm algif_aead des_generic libdes ecb algif_skcipher bnep cmac md4 algi=
f_hash af_alg binfmt_misc btusb btrtl btbcm btintel btmtk bluetooth jittere=
ntropy_rng sha512_generic ctr drbg joydev ansi_cprng ecdh_generic ecc iwldv=
m mac80211 libarc4 iTCO_wdt intel_pmc_bxt snd_hda_codec_conexant iTCO_vendo=
r_support uvcvideo watchdog snd_hda_codec_generic ledtrig_audio videobuf2_v=
malloc videobuf2_memops i915 videobuf2_v4l2 nls_ascii snd_hda_intel iwlwifi=
 videobuf2_common snd_intel_dspcfg drm_buddy snd_intel_sdw_acpi nls_cp437 v=
ideodev drm_display_helper snd_hda_codec snd_hda_core i2c_i801 cec vfat mc =
psmouse evdev wmi_bmof i2c_smbus snd_hwdep rc_core pcspkr cfg80211 sg ttm f=
at lpc_ich snd_pcm drm_kms_helper toshiba_acpi snd_timer industrialio snd s=
parse_keymap toshiba_bluetooth sky2 soundcore rfkill i2c_algo_bit toshiba_h=
aps ac button acpi_cpufreq nf_log_syslog nft_log nft_limit nft_ct nf_conntr=
ack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables
> Jan 22 14:06:46 nabtop kernel:  libcrc32c nfnetlink drm ip_tables x_table=
s ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc64_rocksoft crc64=
 crc_t10dif sr_mod crct10dif_generic cdrom crct10dif_common sdhci_pci cqhci=
 ehci_pci uhci_hcd ehci_hcd ahci libahci sdhci libata mmc_core serio_raw fi=
rewire_ohci usbcore battery usb_common video wmi pkcs8_key_parser coretemp =
firewire_sbp2 firewire_core crc_itu_t scsi_mod scsi_common parport_pc ppdev=
 lp parport autofs4
> Jan 22 14:06:46 nabtop kernel: CPU: 0 PID: 1038 Comm: kworker/u4:20 Taint=
ed: G        W          6.1.0-2-686-pae #1  Debian 6.1.7-1
> Jan 22 14:06:46 nabtop kernel: Hardware name: TOSHIBA Satellite Pro U400/=
Satellite Pro U400, BIOS V5.00    10/26/2010
> Jan 22 14:06:46 nabtop kernel: Workqueue: events_unbound async_run_entry_=
fn
> Jan 22 14:06:46 nabtop kernel: EIP: assert_plane+0x9f/0xb0 [i915]
> Jan 22 14:06:46 nabtop kernel: Code: ff 73 0c 68 30 da b7 f8 e8 0e c7 3a =
ff 83 c4 10 eb b3 8d b4 26 00 00 00 00 66 90 57 52 ff 73 0c 68 30 da b7 f8 =
e8 75 eb e3 dc <0f> 0b 83 c4 10 eb 94 e8 65 9c e7 dc 8d 74 26 00 90 3e 8d 7=
4 26 00
> Jan 22 14:06:46 nabtop kernel: EAX: 00000036 EBX: c1238c00 ECX: 00000001 =
EDX: 80000001
> Jan 22 14:06:46 nabtop kernel: ESI: 00000000 EDI: f8ba1548 EBP: c63f7d60 =
ESP: c63f7d3c
> Jan 22 14:06:46 nabtop kernel: DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 00=
68 EFLAGS: 00010292
> Jan 22 14:06:46 nabtop kernel: CR0: 80050033 CR2: 01e6fc26 CR3: 15e2c000 =
CR4: 000006f0
> Jan 22 14:06:46 nabtop kernel: Call Trace:
> Jan 22 14:06:46 nabtop kernel:  intel_atomic_commit_tail+0xdbb/0xe30 [i91=
5]
> Jan 22 14:06:46 nabtop kernel:  ? sugov_start+0x150/0x150
> Jan 22 14:06:46 nabtop kernel:  ? sugov_start+0x150/0x150
> Jan 22 14:06:46 nabtop kernel:  intel_atomic_commit+0x30b/0x350 [i915]
> Jan 22 14:06:46 nabtop kernel:  ? intel_atomic_commit_tail+0xe30/0xe30 [i=
915]
> Jan 22 14:06:46 nabtop kernel:  drm_atomic_commit+0x6b/0xe0 [drm]
> Jan 22 14:06:46 nabtop kernel:  ? drm_plane_get_damage_clips.cold+0x1b/0x=
1b [drm]
> Jan 22 14:06:46 nabtop kernel:  drm_atomic_helper_commit_duplicated_state=
+0xb6/0xd0 [drm_kms_helper]
> Jan 22 14:06:46 nabtop kernel:  __intel_display_resume+0x6c/0xd0 [i915]
> Jan 22 14:06:46 nabtop kernel:  intel_display_resume+0xb4/0x120 [i915]
> Jan 22 14:06:46 nabtop kernel:  i915_drm_resume+0xc6/0x130 [i915]
> Jan 22 14:06:46 nabtop kernel:  i915_pm_resume+0x34/0x50 [i915]
> Jan 22 14:06:46 nabtop kernel:  i915_pm_restore+0x1f/0x30 [i915]
> Jan 22 14:06:46 nabtop kernel:  pci_pm_restore+0x5a/0xe0
> Jan 22 14:06:46 nabtop kernel:  ? pci_pm_poweroff_noirq+0x100/0x100
> Jan 22 14:06:46 nabtop kernel:  dpm_run_callback+0x4f/0x130
> Jan 22 14:06:46 nabtop kernel:  device_resume+0x70/0x150
> Jan 22 14:06:46 nabtop kernel:  ? device_resume+0x150/0x150
> Jan 22 14:06:46 nabtop kernel:  async_resume+0x1b/0x30
> Jan 22 14:06:46 nabtop kernel:  async_run_entry_fn+0x34/0x130
> Jan 22 14:06:46 nabtop kernel:  process_one_work+0x182/0x310
> Jan 22 14:06:46 nabtop kernel:  worker_thread+0x13e/0x380
> Jan 22 14:06:46 nabtop kernel:  kthread+0xda/0x100
> Jan 22 14:06:46 nabtop kernel:  ? rescuer_thread+0x340/0x340
> Jan 22 14:06:46 nabtop kernel:  ? kthread_complete_and_exit+0x20/0x20
> Jan 22 14:06:46 nabtop kernel:  ret_from_fork+0x1c/0x28
> Jan 22 14:06:46 nabtop kernel: ---[ end trace 0000000000000000 ]---
> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Basic memory bitmaps freed
> Jan 22 14:06:46 nabtop kernel: OOM killer enabled.
> Jan 22 14:06:46 nabtop kernel: Restarting tasks ... done.
> Jan 22 14:06:46 nabtop kernel: usb 7-1: USB disconnect, device number 2
> Jan 22 14:06:46 nabtop iwd[648]: Received Deauthentication event, reason:=
 3, from_ap: false
> Jan 22 14:06:46 nabtop systemd-networkd[435]: wifi1: Lost carrier

Anything could help pin-pointing the issue?

Regards,
Salvatore
