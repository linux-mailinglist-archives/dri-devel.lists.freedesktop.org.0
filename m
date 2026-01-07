Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0012ACFD3A3
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 11:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC87710E58C;
	Wed,  7 Jan 2026 10:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHbAxXjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D450010E58C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767782446; x=1799318446;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=KrUeo6qqHJttN5Sg+z4n7pGtLGMDanVao0fj3nvVJOk=;
 b=bHbAxXjg2Jqo9V8syixbpjA/7zyXf5PPLwBju0VkGhlgBJ4Rt/jHV1oC
 4KbRGmL7fbxx93ZjwK+Wb2a7+ei3IjddNjh6SioJt/jjvkkYtY5xM8YYL
 auUHNmMhJsWrju7eN3ZaYPoZ65lLSfbpAcluCgEBt5QvBL9RzM0N4VnFQ
 GMLW6UMEi/eWNM1Gk422iDeaMwCRBs89wmt4mOaPAi2wwRgSraDD9Rtyi
 rorLwBkrPRdPflatrI3A6EXJ0gwno47ZUWbwPlLanbCJN2FWuOSnka1T/
 ho3ybNW03BYBC9/GmII3ihXCMkXFsf6qz0R6Ld3sg4fqWqhtto5RwOjlV g==;
X-CSE-ConnectionGUID: e0a+9fTtSXeAFbKeAYZhyg==
X-CSE-MsgGUID: vuPF2P+QSCyeV0oAJL2cgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="80511093"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="80511093"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 02:40:46 -0800
X-CSE-ConnectionGUID: IJxl8IS1Sz2fZijvwE0jlA==
X-CSE-MsgGUID: yNqRmq1jSTqAxlbIZmDt6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202804508"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.60])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 02:40:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Satadru Pramanik <satadru@gmail.com>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
Subject: Re: 6.19.0-rc4 regression from 6.19.0-rc3 in i915: [drm] PCH PWM1
 enabled
In-Reply-To: <CAFrh3J-+8+210iG4Mj-+p2PQg-RDvwdUpU8u2Bom0oWXVSoEGg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <CAFrh3J_OtTdve_ryOXZLfBV9sWDZ--HyTJZi9mSQ6gko98PJrA@mail.gmail.com>
 <CAFrh3J-+8+210iG4Mj-+p2PQg-RDvwdUpU8u2Bom0oWXVSoEGg@mail.gmail.com>
Date: Wed, 07 Jan 2026 12:40:42 +0200
Message-ID: <bf8be8c6d77847234d8bde303508ad4ab8a1aca7@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Jan 2026, Satadru Pramanik <satadru@gmail.com> wrote:
> Maybe worth noting that since I have this output:
> lspci -nnd ::03xx
> 00:02.0 VGA compatible controller [0300]: Intel Corporation Crystal Well
> Integrated Graphics Controller [8086:0d26] (rev 08)
> 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107M
> [GeForce GT 750M Mac Edition] [10de:0fe9] (rev a1)
>
> I can boot with this: i915.force_probe=3D!0d26 xe.force_probe=3D0d26

That basically disables i915 for your device, but xe driver doesn't
support it either.

> But then I get this in my dmesg:

And that's your proprietary Broadcom wl module going bonkers at
boot. Basically nothing we can do about any of this until you remove
that.

BR,
Jani.

>
> [    3.045178] ------------[ cut here ]------------
> [    3.045183] Unpatched return thunk in use. This should not happen!
> [    3.045184] WARNING: arch/x86/kernel/cpu/bugs.c:3737 at
> __warn_thunk+0x10/0x20, CPU#1: (udev-worker)/353
> [    3.045192] Modules linked in: nouveau(+) wl(POE+) snd_hda_codec_gener=
ic
> snd_hda_codec_hdmi kvm(+) drm_ttm_helper gpu_sched drm_gpuvm drm_exec btu=
sb
> mxm_wmi snd_hda_intel drm_buddy i2c_algo_bit btrtl snd_intel_dspcfg ttm
> btintel iTCO_wdt snd_seq_midi snd_intel_sdw_acpi ghash_clmulni_intel joyd=
ev
> uas rapl snd_seq_midi_event hid_generic drm_display_helper snd_hda_codec
> facetimehd(OE+) btbcm nvme videobuf2_dma_sg btmtk intel_pmc_bxt
> spi_intel_platform snd_hwdep videobuf2_memops spi_intel iTCO_vendor_suppo=
rt
> applesmc cec bluetooth sbs(+) snd_rawmidi usb_storage intel_cstate
> nvme_core bcm5974 usbhid efi_pstore videobuf2_v4l2 i2c_i801 cfg80211 hid
> snd_hda_core videodev rc_core lpc_ich apple_mfi_fastcharge i2c_mux
> drm_client_lib i2c_smbus videobuf2_common snd_seq snd_pcm drm_kms_helper =
mc
> thunderbolt sbshc snd_seq_device snd_timer acpi_als drm snd
> industrialio_triggered_buffer apple_gmux mei_me kfifo_buf industrialio
> video mei soundcore wmi mac_hid dm_mirror dm_region_hash dm_log tcp_bbr
> sch_fq_codel pkcs8_key_parser msr
> [    3.045271]  parport_pc ppdev lp parport nfnetlink dmi_sysfs autofs4
> aesni_intel
> [    3.045281] CPU: 1 UID: 0 PID: 353 Comm: (udev-worker) Tainted: P
>     OE       6.19.0-rc4 #1 PREEMPT(lazy)
> [    3.045285] Tainted: [P]=3DPROPRIETARY_MODULE, [O]=3DOOT_MODULE,
> [E]=3DUNSIGNED_MODULE
> [    3.045286] Hardware name: Apple Inc.
> MacBookPro11,3/Mac-2BD1B31983FE1663, BIOS 432.60.3.0.0 10/27/2021
> [    3.045288] RIP: 0010:__warn_thunk+0x10/0x20
> [    3.045293] Code: 50 00 5d 48 98 c3 cc cc cc cc 90 90 90 90 90 90 90 90
> 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 48 8d 3d 10 e1 45 02
> <67> 48 0f b9 3a 5d c3 cc cc cc cc 0f 1f 44 00 00 90 90 90 90 90 90
> [    3.045295] RSP: 0018:ffffb9dc8061fa18 EFLAGS: 00010202
> [    3.045298] RAX: 0000000000000010 RBX: 0000000000000000 RCX:
> 0000000000000000
> [    3.045299] RDX: 0000000000000000 RSI: ffffffffc190fc0f RDI:
> ffffffff9114d790
> [    3.045301] RBP: ffffb9dc8061fa18 R08: 0000000000000020 R09:
> 0000000000000000
> [    3.045303] R10: ffffb9dc8061fb38 R11: ffff9303437ea2e0 R12:
> ffffffffc190fc0f
> [    3.045304] R13: 0000000000000000 R14: ffffffffc0b9b010 R15:
> 0000000000000000
> [    3.045306] FS:  00007f8662192980(0000) GS:ffff93071d83d000(0000)
> knlGS:0000000000000000
> [    3.045308] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    3.045310] CR2: 00007f8661386000 CR3: 0000000117fd7001 CR4:
> 00000000001706f0
> [    3.045312] Call Trace:
> [    3.045321]  <TASK>
> [    3.045323]  warn_thunk_thunk+0x16/0x30
> [    3.045329]  getvar+0x20/0x70 [wl]
> [    3.045382]  wl_module_init+0x17/0xa0 [wl]
> [    3.045418]  do_one_initcall+0x59/0x310
> [    3.045424]  do_init_module+0x6a/0x260
> [    3.045427]  ? module_decompress_cleanup+0x4f/0x70
> [    3.045431]  load_module+0x1de9/0x2060
> [    3.045437]  init_module_from_file+0xe9/0x170
> [    3.045439]  ? init_module_from_file+0xe9/0x170
> [    3.045444]  idempotent_init_module+0x10e/0x2f0
> [    3.045448]  __x64_sys_finit_module+0x73/0xf0
> [    3.045450]  ? __secure_computing+0x7c/0xd0
> [    3.045455]  x64_sys_call+0x15b8/0x1da0
> [    3.045458]  do_syscall_64+0x6d/0x650
> [    3.045462]  ? switch_fpu_return+0x5c/0xe0
> [    3.045466]  ? do_syscall_64+0x29b/0x650
> [    3.045469]  ? irqentry_exit+0x3a/0x510
> [    3.045473]  ? exc_page_fault+0x90/0x1a0
> [    3.045477]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [    3.045480] RIP: 0033:0x7f8662cd68cd
> [    3.045483] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48
> 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05
> <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 13 f5 0f 00 f7 d8 64 89 01 48
> [    3.045485] RSP: 002b:00007ffd8fc05cd8 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000139
> [    3.045488] RAX: ffffffffffffffda RBX: 00005591fd6d3990 RCX:
> 00007f8662cd68cd
> [    3.045489] RDX: 0000000000000004 RSI: 00007f866146c336 RDI:
> 000000000000001d
> [    3.045491] RBP: 00007ffd8fc05d70 R08: 0000000000000000 R09:
> 00005591fd6d6d00
> [    3.045492] R10: 0000000000000000 R11: 0000000000000246 R12:
> 00007f866146c336
> [    3.045494] R13: 0000000000020000 R14: 00005591fd6d59c0 R15:
> 00005591fd6d6cc0
> [    3.045497]  </TASK>
> [    3.045499] ---[ end trace 0000000000000000 ]---
>
>
> On Tue, Jan 6, 2026 at 12:07=E2=80=AFPM Satadru Pramanik <satadru@gmail.c=
om> wrote:
>
>> Hello all, I'm newly getting this in my dmesg on my MacBookPro11,3 after
>> updating from 6.19.0-rc3 to 6.19.0-rc4 on Ubuntu 25.10. I'm using the
>> nouveau driver for my display, but this warning appears to be from i915,
>> which my laptop also may be using for some portion of display enablement.
>>
>> [  200.760128] ------------[ cut here ]------------
>> [  200.760132] i915 0000:00:02.0: [drm] PCH PWM1 enabled
>> [  200.760134] WARNING:
>> drivers/gpu/drm/i915/display/intel_display_power.c:1234 at
>> hsw_enable_pc8+0x8a4/0xb10 [i915], CPU#0: kworker/u32:6/1378
>> [  200.760351] Modules linked in: snd_seq_dummy snd_hrtimer
>> scsi_transport_iscsi qrtr ccm algif_aead des3_ede_x86_64 des_generic lib=
des
>> md4 rfcomm cmac algif_hash algif_skcipher af_alg bnep blocklayoutdriver
>> nfsv4 nfs lockd grace nfs_localio netfs sunrpc binfmt_misc nls_iso8859_1
>> cmdlinepart spi_nor mtd snd_hda_codec_intelhdmi intel_rapl_msr zfs(POE)
>> intel_rapl_common x86_pkg_temp_thermal intel_powerclamp nouveau input_le=
ds
>> i915 spl(OE) snd_hda_codec_cs420x snd_hda_codec_generic
>> snd_hda_codec_nvhdmi snd_hda_codec_hdmi hid_apple drm_ttm_helper coretemp
>> facetimehd(OE) snd_hda_intel gpu_sched btusb videobuf2_dma_sg
>> snd_intel_dspcfg drm_gpuvm videobuf2_memops btrtl snd_intel_sdw_acpi
>> videobuf2_v4l2 snd_seq_midi snd_hda_codec btintel snd_seq_midi_event
>> drm_exec drm_buddy iTCO_wdt videodev kvm_intel btbcm mxm_wmi i2c_algo_bit
>> btmtk snd_hwdep intel_pmc_bxt snd_rawmidi spi_intel_platform wl(POE) joy=
dev
>> hid_generic videobuf2_common kvm spi_intel snd_hda_core iTCO_vendor_supp=
ort
>> applesmc ghash_clmulni_intel nvme ttm rapl bluetooth
>> [  200.760418]  snd_seq intel_cstate uas usbhid drm_display_helper snd_p=
cm
>> nvme_core cfg80211 cec efi_pstore rc_core hid mc bcm5974 sbs thunderbolt
>> apple_mfi_fastcharge drm_client_lib i2c_i801 drm_kms_helper i2c_mux
>> usb_storage i2c_smbus lpc_ich sbshc snd_timer apple_gmux snd_seq_device
>> acpi_als industrialio_triggered_buffer mei_me kfifo_buf drm snd
>> industrialio mei soundcore video wmi mac_hid dm_mirror dm_region_hash
>> dm_log tcp_bbr sch_fq_codel pkcs8_key_parser msr parport_pc ppdev lp
>> parport nfnetlink dmi_sysfs autofs4 aesni_intel
>> [  200.760461] CPU: 0 UID: 0 PID: 1378 Comm: kworker/u32:6 Tainted: P
>> U  W  OE       6.19.0-rc4 #1 PREEMPT(lazy)
>> [  200.760466] Tainted: [P]=3DPROPRIETARY_MODULE, [U]=3DUSER, [W]=3DWARN,
>> [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
>> [  200.760468] Hardware name: Apple Inc.
>> MacBookPro11,3/Mac-2BD1B31983FE1663, BIOS 432.60.3.0.0 10/27/2021
>> [  200.760470] Workqueue: pm pm_runtime_work
>> [  200.760478] Sched_ext: lavd_1.0.20_g3c8138b8_x86_64_unknown_linux_gnu
>> (enabled+all), task: runnable_at=3D+0ms
>> [  200.760480] RIP: 0010:hsw_enable_pc8+0x8aa/0xb10 [i915]
>> [  200.760653] Code: 32 12 00 48 85 ff 74 04 48 8b 7f 08 4c 8b 67 50 4d =
85
>> e4 75 03 4c 8b 27 e8 e3 73 a7 e4 48 8d 3d dc 03 30 00 4c 89 e2 48 89 c6
>> <67> 48 0f b9 3a e9 df f9 ff ff 48 8b 3b 80 bb 4b 14 00 00 00 0f 84
>> [  200.760655] RSP: 0018:ffffaf668250fc68 EFLAGS: 00010282
>> [  200.760658] RAX: ffffffffc1d688a4 RBX: ffff920740f62000 RCX:
>> ffffffffc180f0d0
>> [  200.760660] RDX: ffff920742008030 RSI: ffffffffc1d688a4 RDI:
>> ffffffffc1c038d0
>> [  200.760661] RBP: ffffaf668250fc90 R08: 0000000000000002 R09:
>> 0000000000000064
>> [  200.760663] R10: 0000000000000000 R11: 0000000000000001 R12:
>> ffff920742008030
>> [  200.760664] R13: ffff920740ed4000 R14: 0000000000000000 R15:
>> ffff920740ed4000
>> [  200.760666] FS:  0000000000000000(0000) GS:ffff920b06bfd000(0000)
>> knlGS:0000000000000000
>> [  200.760668] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  200.760669] CR2: 00007f72423b701c CR3: 00000001777eb004 CR4:
>> 00000000001726f0
>> [  200.760671] Call Trace:
>> [  200.760673]  <TASK>
>> [  200.760678]  intel_display_power_suspend+0x61/0x80 [i915]
>> [  200.760852]  intel_runtime_suspend+0xd7/0x230 [i915]
>> [  200.760963]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
>> [  200.760970]  pci_pm_runtime_suspend+0x6a/0x1a0
>> [  200.760974]  __rpm_callback+0x4b/0x1f0
>> [  200.760979]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
>> [  200.760983]  rpm_callback+0x6f/0x80
>> [  200.760986]  rpm_suspend+0xe1/0x5e0
>> [  200.760990]  ? __schedule+0x44b/0x1650
>> [  200.760996]  pm_runtime_work+0x91/0xa0
>> [  200.761000]  process_one_work+0x188/0x360
>> [  200.761005]  worker_thread+0x327/0x460
>> [  200.761007]  ? __pfx_worker_thread+0x10/0x10
>> [  200.761010]  kthread+0x10b/0x220
>> [  200.761015]  ? __pfx_kthread+0x10/0x10
>> [  200.761018]  ret_from_fork+0x16e/0x1e0
>> [  200.761023]  ? __pfx_kthread+0x10/0x10
>> [  200.761027]  ret_from_fork_asm+0x1a/0x30
>> [  200.761034]  </TASK>
>> [  200.761035] ---[ end trace 0000000000000000 ]---
>>
>>
>> inxi -IG gives me this:
>> Graphics:
>>   Device-1: Intel Crystal Well Integrated Graphics driver: i915 v: kernel
>>   Device-2: NVIDIA GK107M [GeForce GT 750M Mac Edition] driver: nouveau
>>     v: kernel
>>   Display: wayland server: X.Org v: 24.1.8 with: Xwayland v: 24.1.8
>>     compositor: gnome-shell v: 49.0 driver: X: loaded: modesetting
>>     unloaded: fbdev,vesa dri: nouveau gpu: nouveau resolution:
>> 3840x2400~60Hz
>>   API: EGL v: 1.5 drivers: crocus,nouveau,swrast
>>     platforms: gbm,wayland,x11,surfaceless,device
>>   API: OpenGL v: 4.6 compat-v: 4.3 vendor: mesa
>>     v: 25.3.2+git2512181741.a943c55aea0~q~mesarc2 renderer: NVE7
>>   API: Vulkan v: 1.4.321 drivers: nvk,intel,llvmpipe
>>     surfaces: xcb,xlib,wayland
>>   Info: Tools: api: eglinfo, glxinfo, vulkaninfo x11: xdriinfo, xdpyinfo,
>>     xprop, xrandr
>> Info:
>>   Memory: total: 16 GiB available: 15.53 GiB used: 4.85 GiB (31.2%)
>>   Processes: 468 Uptime: 17m Shell: Bash inxi: 3.3.39
>>
>> Please let me know if I'm sending this to the wrong list?
>>
>> Regards,
>>
>> Satadru Pramanik
>>

--=20
Jani Nikula, Intel
