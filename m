Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D27679DB6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 16:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F0210E6C0;
	Tue, 24 Jan 2023 15:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAC110E6BF;
 Tue, 24 Jan 2023 15:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674574846; x=1706110846;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=SXKCDUa0eY9/FeAB4ay7C5AhWXMd9dFwzFf4s4Mebao=;
 b=Y8z5dh/oHRGk1U+Q1sA+YTBwfJYOMMRYpAIacU9OMFbVKD1DhE5AH9ai
 hlRnV2m8UXG5r7TKwLmUArCoo7faMWFt6uFdCht7nqLKQLPDeTQPKaY6z
 9Ueshzc4zuFmfEygqpc9OXOv6BuzI3LZXZOJf7eBD20+ESNtNw2hsP+Hg
 tbcoqJxv0xuSHgPcA4mXoFJBTIYspYdPvq6Nk0bgOXDHrpbTA6S7ocCZk
 zlrqalmUelnIAihVJIo4/whzLQjlan/8W5i4i5h9MeP70T6wygARQaXil
 GPAvoTo/r1V/gUAMei3yI3OD3efYTCsbjSYGkX/zKOJan7iMuzl0fBC2X Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="388665746"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="388665746"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 07:40:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="836002592"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="836002592"
Received: from pesir-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.197])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 07:40:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Salvatore Bonaccorso <carnil@debian.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Assertion failure in i915 intel_display.c#assert_plane() after
 resume from hibernation
In-Reply-To: <Y89xbXITTRFpjm5B@eldamar.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <Y89xbXITTRFpjm5B@eldamar.lan>
Date: Tue, 24 Jan 2023 17:40:36 +0200
Message-ID: <87bkmo6ivf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Tue, 24 Jan 2023, Salvatore Bonaccorso <carnil@debian.org> wrote:
> Hi
>
> A user in Debian, cc'ed reporte the following issue when resuming from
> hibernation, tested as well on recent 6.1.7 kernel, context see
> https://bugs.debian.org/971068

Full dmesg from boot with drm.debug=3D0xe module parameter might be
helpful. You may need to add log_buf_len=3D4M or similar to grab it all,
it's verbose.

BR,
Jani.


>
>> Can repro on the sid kernel, uname -a of
>>   Linux nabtop 6.1.0-2-686-pae #1 SMP PREEMPT_DYNAMIC Debian 6.1.7-1 (20=
23-01-18) i686 GNU/Linux
>>=20
>> Log below. Backtrace is only trivially different.
>>=20
>> Best,
>> =D0=BD=D0=B0=D0=B1
>>=20
>> -- >8 --
>> Jan 22 14:06:46 nabtop kernel: OOM killer disabled.
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [m=
em 0x00000000-0x00000fff]
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [m=
em 0x0009f000-0x000fffff]
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [m=
em 0xb5aa1000-0xb5aa6fff]
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [m=
em 0xb5bba000-0xb5c0efff]
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [m=
em 0xb5d08000-0xb5f0efff]
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [m=
em 0xb5f18000-0xb5f1efff]
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [m=
em 0xb5f65000-0xb5f9efff]
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [m=
em 0xb5fe1000-0xb5ffefff]
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Marking nosave pages: [m=
em 0xb6000000-0xffffffff]
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Basic memory bitmaps cre=
ated
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Preallocating image memo=
ry
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Allocated 183519 pages f=
or snapshot
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Allocated 734076 kbytes =
in 0.70 seconds (1048.68 MB/s)
>> Jan 22 14:06:46 nabtop kernel: Freezing remaining freezable tasks ... (e=
lapsed 0.001 seconds) done.
>> Jan 22 14:06:46 nabtop kernel: wifi1: deauthenticating from de:0d:17:ad:=
80:55 by local choice (Reason: 3=3DDEAUTH_LEAVING)
>> Jan 22 14:06:46 nabtop kernel: ACPI: EC: interrupt blocked
>> Jan 22 14:06:46 nabtop kernel: ACPI: PM: Preparing to enter system sleep=
 state S4
>> Jan 22 14:06:46 nabtop kernel: ACPI: EC: event blocked
>> Jan 22 14:06:46 nabtop kernel: ACPI: EC: EC stopped
>> Jan 22 14:06:46 nabtop kernel: ACPI: PM: Saving platform NVS memory
>> Jan 22 14:06:46 nabtop kernel: Disabling non-boot CPUs ...
>> Jan 22 14:06:46 nabtop kernel: smpboot: CPU 1 is now offline
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Creating image:
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Need to copy 175700 pages
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Normal pages needed: 577=
65 + 1024, available pages: 167322
>> Jan 22 14:06:46 nabtop kernel: ACPI: PM: Restoring platform NVS memory
>> Jan 22 14:06:46 nabtop kernel: ACPI: EC: EC started
>> Jan 22 14:06:46 nabtop kernel: Enabling non-boot CPUs ...
>> Jan 22 14:06:46 nabtop kernel: x86: Booting SMP configuration:
>> Jan 22 14:06:46 nabtop kernel: smpboot: Booting Node 0 Processor 1 APIC =
0x1
>> Jan 22 14:06:46 nabtop kernel: CPU1 is up
>> Jan 22 14:06:46 nabtop kernel: ACPI: PM: Waking up from system sleep sta=
te S4
>> Jan 22 14:06:46 nabtop kernel: ACPI: EC: interrupt unblocked
>> Jan 22 14:06:46 nabtop kernel: ACPI: EC: event unblocked
>> Jan 22 14:06:46 nabtop kernel: usb usb1: root hub lost power or was reset
>> Jan 22 14:06:46 nabtop kernel: usb usb2: root hub lost power or was reset
>> Jan 22 14:06:46 nabtop kernel: usb usb4: root hub lost power or was reset
>> Jan 22 14:06:46 nabtop kernel: usb usb3: root hub lost power or was reset
>> Jan 22 14:06:46 nabtop kernel: usb usb6: root hub lost power or was reset
>> Jan 22 14:06:46 nabtop kernel: usb usb7: root hub lost power or was reset
>> Jan 22 14:06:46 nabtop kernel: usb usb8: root hub lost power or was reset
>> Jan 22 14:06:46 nabtop kernel: usb usb5: root hub lost power or was reset
>> Jan 22 14:06:46 nabtop kernel: sd 0:0:0:0: [sda] Starting disk
>> Jan 22 14:06:46 nabtop kernel: iwlwifi 0000:08:00.0: Radio type=3D0x1-0x=
2-0x0
>> Jan 22 14:06:46 nabtop kernel: iwlwifi 0000:08:00.0: Radio type=3D0x1-0x=
2-0x0
>> Jan 22 14:06:46 nabtop kernel: ------------[ cut here ]------------
>> Jan 22 14:06:46 nabtop kernel: primary B assertion failure (expected off=
, current on)
>> Jan 22 14:06:46 nabtop kernel: WARNING: CPU: 0 PID: 1038 at drivers/gpu/=
drm/i915/display/intel_display.c:476 assert_plane+0x9f/0xb0 [i915]
>> Jan 22 14:06:46 nabtop kernel: Modules linked in: ghash_generic gf128mul=
 gcm ccm algif_aead des_generic libdes ecb algif_skcipher bnep cmac md4 alg=
if_hash af_alg binfmt_misc btusb btrtl btbcm btintel btmtk bluetooth jitter=
entropy_rng sha512_generic ctr drbg joydev ansi_cprng ecdh_generic ecc iwld=
vm mac80211 libarc4 iTCO_wdt intel_pmc_bxt snd_hda_codec_conexant iTCO_vend=
or_support uvcvideo watchdog snd_hda_codec_generic ledtrig_audio videobuf2_=
vmalloc videobuf2_memops i915 videobuf2_v4l2 nls_ascii snd_hda_intel iwlwif=
i videobuf2_common snd_intel_dspcfg drm_buddy snd_intel_sdw_acpi nls_cp437 =
videodev drm_display_helper snd_hda_codec snd_hda_core i2c_i801 cec vfat mc=
 psmouse evdev wmi_bmof i2c_smbus snd_hwdep rc_core pcspkr cfg80211 sg ttm =
fat lpc_ich snd_pcm drm_kms_helper toshiba_acpi snd_timer industrialio snd =
sparse_keymap toshiba_bluetooth sky2 soundcore rfkill i2c_algo_bit toshiba_=
haps ac button acpi_cpufreq nf_log_syslog nft_log nft_limit nft_ct nf_connt=
rack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables
>> Jan 22 14:06:46 nabtop kernel:  libcrc32c nfnetlink drm ip_tables x_tabl=
es ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc64_rocksoft crc6=
4 crc_t10dif sr_mod crct10dif_generic cdrom crct10dif_common sdhci_pci cqhc=
i ehci_pci uhci_hcd ehci_hcd ahci libahci sdhci libata mmc_core serio_raw f=
irewire_ohci usbcore battery usb_common video wmi pkcs8_key_parser coretemp=
 firewire_sbp2 firewire_core crc_itu_t scsi_mod scsi_common parport_pc ppde=
v lp parport autofs4
>> Jan 22 14:06:46 nabtop kernel: CPU: 0 PID: 1038 Comm: kworker/u4:20 Not =
tainted 6.1.0-2-686-pae #1  Debian 6.1.7-1
>> Jan 22 14:06:46 nabtop kernel: Hardware name: TOSHIBA Satellite Pro U400=
/Satellite Pro U400, BIOS V5.00    10/26/2010
>> Jan 22 14:06:46 nabtop kernel: Workqueue: events_unbound async_run_entry=
_fn
>> Jan 22 14:06:46 nabtop kernel: EIP: assert_plane+0x9f/0xb0 [i915]
>> Jan 22 14:06:46 nabtop kernel: Code: ff 73 0c 68 30 da b7 f8 e8 0e c7 3a=
 ff 83 c4 10 eb b3 8d b4 26 00 00 00 00 66 90 57 52 ff 73 0c 68 30 da b7 f8=
 e8 75 eb e3 dc <0f> 0b 83 c4 10 eb 94 e8 65 9c e7 dc 8d 74 26 00 90 3e 8d =
74 26 00
>> Jan 22 14:06:46 nabtop kernel: EAX: 00000036 EBX: c1238c00 ECX: 00000001=
 EDX: 80000001
>> Jan 22 14:06:46 nabtop kernel: ESI: 00000000 EDI: f8ba1548 EBP: c63f7cdc=
 ESP: c63f7cb8
>> Jan 22 14:06:46 nabtop kernel: DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0=
068 EFLAGS: 00010292
>> Jan 22 14:06:46 nabtop kernel: CR0: 80050033 CR2: 01e6fc26 CR3: 15e2c000=
 CR4: 000006f0
>> Jan 22 14:06:46 nabtop kernel: Call Trace:
>> Jan 22 14:06:46 nabtop kernel:  intel_disable_transcoder+0x71/0x2a0 [i91=
5]
>> Jan 22 14:06:46 nabtop kernel:  ? drm_vblank_get+0x65/0xd0 [drm]
>> Jan 22 14:06:46 nabtop kernel:  ? drm_crtc_vblank_get+0x12/0x20 [drm]
>> Jan 22 14:06:46 nabtop kernel:  ? assert_vblank_disabled+0x10/0x70 [i915]
>> Jan 22 14:06:46 nabtop kernel:  i9xx_crtc_disable+0x56/0x260 [i915]
>> Jan 22 14:06:46 nabtop kernel:  ? intel_synchronize_irq+0x16/0x20 [i915]
>> Jan 22 14:06:46 nabtop kernel:  ? intel_crtc_disable_pipe_crc+0xa4/0xb0 =
[i915]
>> Jan 22 14:06:46 nabtop kernel:  intel_old_crtc_state_disables+0x35/0x90 =
[i915]
>> Jan 22 14:06:46 nabtop kernel:  intel_atomic_commit_tail+0x409/0xe30 [i9=
15]
>> Jan 22 14:06:46 nabtop kernel:  ? sugov_start+0x150/0x150
>> Jan 22 14:06:46 nabtop kernel:  ? sugov_start+0x150/0x150
>> Jan 22 14:06:46 nabtop kernel:  intel_atomic_commit+0x30b/0x350 [i915]
>> Jan 22 14:06:46 nabtop kernel:  ? intel_atomic_commit_tail+0xe30/0xe30 [=
i915]
>> Jan 22 14:06:46 nabtop kernel:  drm_atomic_commit+0x6b/0xe0 [drm]
>> Jan 22 14:06:46 nabtop kernel:  ? drm_plane_get_damage_clips.cold+0x1b/0=
x1b [drm]
>> Jan 22 14:06:46 nabtop kernel:  drm_atomic_helper_commit_duplicated_stat=
e+0xb6/0xd0 [drm_kms_helper]
>> Jan 22 14:06:46 nabtop kernel:  __intel_display_resume+0x6c/0xd0 [i915]
>> Jan 22 14:06:46 nabtop kernel:  intel_display_resume+0xb4/0x120 [i915]
>> Jan 22 14:06:46 nabtop kernel:  i915_drm_resume+0xc6/0x130 [i915]
>> Jan 22 14:06:46 nabtop kernel:  i915_pm_resume+0x34/0x50 [i915]
>> Jan 22 14:06:46 nabtop kernel:  i915_pm_restore+0x1f/0x30 [i915]
>> Jan 22 14:06:46 nabtop kernel:  pci_pm_restore+0x5a/0xe0
>> Jan 22 14:06:46 nabtop kernel:  ? pci_pm_poweroff_noirq+0x100/0x100
>> Jan 22 14:06:46 nabtop kernel:  dpm_run_callback+0x4f/0x130
>> Jan 22 14:06:46 nabtop kernel:  device_resume+0x70/0x150
>> Jan 22 14:06:46 nabtop kernel:  ? device_resume+0x150/0x150
>> Jan 22 14:06:46 nabtop kernel:  async_resume+0x1b/0x30
>> Jan 22 14:06:46 nabtop kernel:  async_run_entry_fn+0x34/0x130
>> Jan 22 14:06:46 nabtop kernel:  process_one_work+0x182/0x310
>> Jan 22 14:06:46 nabtop kernel:  worker_thread+0x13e/0x380
>> Jan 22 14:06:46 nabtop kernel:  kthread+0xda/0x100
>> Jan 22 14:06:46 nabtop kernel:  ? rescuer_thread+0x340/0x340
>> Jan 22 14:06:46 nabtop kernel:  ? kthread_complete_and_exit+0x20/0x20
>> Jan 22 14:06:46 nabtop kernel:  ret_from_fork+0x1c/0x28
>> Jan 22 14:06:46 nabtop kernel: ---[ end trace 0000000000000000 ]---
>> Jan 22 14:06:46 nabtop kernel: ata1: SATA link up 3.0 Gbps (SStatus 123 =
SControl 300)
>> Jan 22 14:06:46 nabtop kernel: ata2: SATA link up 1.5 Gbps (SStatus 113 =
SControl 300)
>> Jan 22 14:06:46 nabtop kernel: ata6: SATA link down (SStatus 0 SControl =
300)
>> Jan 22 14:06:46 nabtop kernel: ata5: SATA link down (SStatus 0 SControl =
300)
>> Jan 22 14:06:46 nabtop kernel: ata1.00: unexpected _GTF length (8)
>> Jan 22 14:06:46 nabtop kernel: ata1.00: unexpected _GTF length (8)
>> Jan 22 14:06:46 nabtop kernel: ata1.00: configured for UDMA/100
>> Jan 22 14:06:46 nabtop kernel: ata2.00: configured for UDMA/33
>> Jan 22 14:06:46 nabtop kernel: usb 5-4: reset high-speed USB device numb=
er 4 using ehci-pci
>> Jan 22 14:06:46 nabtop kernel: usb 6-2: reset full-speed USB device numb=
er 2 using uhci_hcd
>> Jan 22 14:06:46 nabtop kernel: firewire_core 0000:0a:01.0: rediscovered =
device fw0
>> Jan 22 14:06:46 nabtop kernel: ------------[ cut here ]------------
>> Jan 22 14:06:46 nabtop kernel: primary B assertion failure (expected off=
, current on)
>> Jan 22 14:06:46 nabtop kernel: WARNING: CPU: 0 PID: 1038 at drivers/gpu/=
drm/i915/display/intel_display.c:476 assert_plane+0x9f/0xb0 [i915]
>> Jan 22 14:06:46 nabtop kernel: Modules linked in: ghash_generic gf128mul=
 gcm ccm algif_aead des_generic libdes ecb algif_skcipher bnep cmac md4 alg=
if_hash af_alg binfmt_misc btusb btrtl btbcm btintel btmtk bluetooth jitter=
entropy_rng sha512_generic ctr drbg joydev ansi_cprng ecdh_generic ecc iwld=
vm mac80211 libarc4 iTCO_wdt intel_pmc_bxt snd_hda_codec_conexant iTCO_vend=
or_support uvcvideo watchdog snd_hda_codec_generic ledtrig_audio videobuf2_=
vmalloc videobuf2_memops i915 videobuf2_v4l2 nls_ascii snd_hda_intel iwlwif=
i videobuf2_common snd_intel_dspcfg drm_buddy snd_intel_sdw_acpi nls_cp437 =
videodev drm_display_helper snd_hda_codec snd_hda_core i2c_i801 cec vfat mc=
 psmouse evdev wmi_bmof i2c_smbus snd_hwdep rc_core pcspkr cfg80211 sg ttm =
fat lpc_ich snd_pcm drm_kms_helper toshiba_acpi snd_timer industrialio snd =
sparse_keymap toshiba_bluetooth sky2 soundcore rfkill i2c_algo_bit toshiba_=
haps ac button acpi_cpufreq nf_log_syslog nft_log nft_limit nft_ct nf_connt=
rack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables
>> Jan 22 14:06:46 nabtop kernel:  libcrc32c nfnetlink drm ip_tables x_tabl=
es ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc64_rocksoft crc6=
4 crc_t10dif sr_mod crct10dif_generic cdrom crct10dif_common sdhci_pci cqhc=
i ehci_pci uhci_hcd ehci_hcd ahci libahci sdhci libata mmc_core serio_raw f=
irewire_ohci usbcore battery usb_common video wmi pkcs8_key_parser coretemp=
 firewire_sbp2 firewire_core crc_itu_t scsi_mod scsi_common parport_pc ppde=
v lp parport autofs4
>> Jan 22 14:06:46 nabtop kernel: CPU: 0 PID: 1038 Comm: kworker/u4:20 Tain=
ted: G        W          6.1.0-2-686-pae #1  Debian 6.1.7-1
>> Jan 22 14:06:46 nabtop kernel: Hardware name: TOSHIBA Satellite Pro U400=
/Satellite Pro U400, BIOS V5.00    10/26/2010
>> Jan 22 14:06:46 nabtop kernel: Workqueue: events_unbound async_run_entry=
_fn
>> Jan 22 14:06:46 nabtop kernel: EIP: assert_plane+0x9f/0xb0 [i915]
>> Jan 22 14:06:46 nabtop kernel: Code: ff 73 0c 68 30 da b7 f8 e8 0e c7 3a=
 ff 83 c4 10 eb b3 8d b4 26 00 00 00 00 66 90 57 52 ff 73 0c 68 30 da b7 f8=
 e8 75 eb e3 dc <0f> 0b 83 c4 10 eb 94 e8 65 9c e7 dc 8d 74 26 00 90 3e 8d =
74 26 00
>> Jan 22 14:06:46 nabtop kernel: EAX: 00000036 EBX: c1238c00 ECX: 00000001=
 EDX: 80000001
>> Jan 22 14:06:46 nabtop kernel: ESI: 00000000 EDI: f8ba1548 EBP: c63f7d60=
 ESP: c63f7d3c
>> Jan 22 14:06:46 nabtop kernel: DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0=
068 EFLAGS: 00010292
>> Jan 22 14:06:46 nabtop kernel: CR0: 80050033 CR2: 01e6fc26 CR3: 15e2c000=
 CR4: 000006f0
>> Jan 22 14:06:46 nabtop kernel: Call Trace:
>> Jan 22 14:06:46 nabtop kernel:  intel_atomic_commit_tail+0xdbb/0xe30 [i9=
15]
>> Jan 22 14:06:46 nabtop kernel:  ? sugov_start+0x150/0x150
>> Jan 22 14:06:46 nabtop kernel:  ? sugov_start+0x150/0x150
>> Jan 22 14:06:46 nabtop kernel:  intel_atomic_commit+0x30b/0x350 [i915]
>> Jan 22 14:06:46 nabtop kernel:  ? intel_atomic_commit_tail+0xe30/0xe30 [=
i915]
>> Jan 22 14:06:46 nabtop kernel:  drm_atomic_commit+0x6b/0xe0 [drm]
>> Jan 22 14:06:46 nabtop kernel:  ? drm_plane_get_damage_clips.cold+0x1b/0=
x1b [drm]
>> Jan 22 14:06:46 nabtop kernel:  drm_atomic_helper_commit_duplicated_stat=
e+0xb6/0xd0 [drm_kms_helper]
>> Jan 22 14:06:46 nabtop kernel:  __intel_display_resume+0x6c/0xd0 [i915]
>> Jan 22 14:06:46 nabtop kernel:  intel_display_resume+0xb4/0x120 [i915]
>> Jan 22 14:06:46 nabtop kernel:  i915_drm_resume+0xc6/0x130 [i915]
>> Jan 22 14:06:46 nabtop kernel:  i915_pm_resume+0x34/0x50 [i915]
>> Jan 22 14:06:46 nabtop kernel:  i915_pm_restore+0x1f/0x30 [i915]
>> Jan 22 14:06:46 nabtop kernel:  pci_pm_restore+0x5a/0xe0
>> Jan 22 14:06:46 nabtop kernel:  ? pci_pm_poweroff_noirq+0x100/0x100
>> Jan 22 14:06:46 nabtop kernel:  dpm_run_callback+0x4f/0x130
>> Jan 22 14:06:46 nabtop kernel:  device_resume+0x70/0x150
>> Jan 22 14:06:46 nabtop kernel:  ? device_resume+0x150/0x150
>> Jan 22 14:06:46 nabtop kernel:  async_resume+0x1b/0x30
>> Jan 22 14:06:46 nabtop kernel:  async_run_entry_fn+0x34/0x130
>> Jan 22 14:06:46 nabtop kernel:  process_one_work+0x182/0x310
>> Jan 22 14:06:46 nabtop kernel:  worker_thread+0x13e/0x380
>> Jan 22 14:06:46 nabtop kernel:  kthread+0xda/0x100
>> Jan 22 14:06:46 nabtop kernel:  ? rescuer_thread+0x340/0x340
>> Jan 22 14:06:46 nabtop kernel:  ? kthread_complete_and_exit+0x20/0x20
>> Jan 22 14:06:46 nabtop kernel:  ret_from_fork+0x1c/0x28
>> Jan 22 14:06:46 nabtop kernel: ---[ end trace 0000000000000000 ]---
>> Jan 22 14:06:46 nabtop kernel: PM: hibernation: Basic memory bitmaps fre=
ed
>> Jan 22 14:06:46 nabtop kernel: OOM killer enabled.
>> Jan 22 14:06:46 nabtop kernel: Restarting tasks ... done.
>> Jan 22 14:06:46 nabtop kernel: usb 7-1: USB disconnect, device number 2
>> Jan 22 14:06:46 nabtop iwd[648]: Received Deauthentication event, reason=
: 3, from_ap: false
>> Jan 22 14:06:46 nabtop systemd-networkd[435]: wifi1: Lost carrier
>
> Anything could help pin-pointing the issue?
>
> Regards,
> Salvatore

--=20
Jani Nikula, Intel Open Source Graphics Center
