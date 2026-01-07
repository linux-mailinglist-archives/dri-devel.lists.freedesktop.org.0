Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535CCCFD310
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 11:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A71910E081;
	Wed,  7 Jan 2026 10:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imIvlDwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F83310E081
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 10:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767782008; x=1799318008;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=TCHGFA8MoUrLLhpWgfEV6aMmaW6ZLngK8om1sQmX8D0=;
 b=imIvlDwKjgjeGRWCt8guvCFUCNNjcWXKuobz26+SzoDZq6mmbH9OBb4J
 ckaAyqoM9en2TCgEwwidAWkNxS02hFE+iYEgOlbzDsRByJEufaZlnZhDh
 AVb2q2rf3UJjrZcBme9cIwXZviIzfeUH6Be7EnUiFWinOQOPjpSuZoTrd
 W97o74Fiq6re63/jyiH1epYx8pgHDzeLWTEv3wJqHPTFze1LHyzmwT4+2
 QN0N4ZWxcD7mFfOA2ehzGN1Fl9J7JNe200KGeRCEz1eVdU2oqh7nsTzAq
 06QK//YU1lV/N/ctdrEDQYMC/A+W2xFjFT9PtwNHcZvgQ5a5MLqfEQqha w==;
X-CSE-ConnectionGUID: O8iMXyFnQWiTBRlxFwz6Fw==
X-CSE-MsgGUID: H0r63D3qTlGaVUUJSTWGNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69062353"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="69062353"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 02:33:27 -0800
X-CSE-ConnectionGUID: WS7ExccSQau7qrCMAJ8T2Q==
X-CSE-MsgGUID: wWheNjtfQNe5ttr0GfESZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202025752"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.60])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 02:33:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Satadru Pramanik <satadru@gmail.com>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
Subject: Re: 6.19.0-rc4 regression from 6.19.0-rc3 in i915: [drm] PCH PWM1
 enabled
In-Reply-To: <CAFrh3J_OtTdve_ryOXZLfBV9sWDZ--HyTJZi9mSQ6gko98PJrA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <CAFrh3J_OtTdve_ryOXZLfBV9sWDZ--HyTJZi9mSQ6gko98PJrA@mail.gmail.com>
Date: Wed, 07 Jan 2026 12:33:23 +0200
Message-ID: <f2dc09294c3af2e9d97e72e10f8f3674368a8b36@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
> Hello all, I'm newly getting this in my dmesg on my MacBookPro11,3 after
> updating from 6.19.0-rc3 to 6.19.0-rc4 on Ubuntu 25.10. I'm using the
> nouveau driver for my display, but this warning appears to be from i915,
> which my laptop also may be using for some portion of display enablement.

AFAICS there were no related changes in the drm subsystem between -rc3
and -rc4. I suspect something else changed. If you think otherwise,
please bisect.

> [  200.760128] ------------[ cut here ]------------
> [  200.760132] i915 0000:00:02.0: [drm] PCH PWM1 enabled
> [  200.760134] WARNING:
> drivers/gpu/drm/i915/display/intel_display_power.c:1234 at
> hsw_enable_pc8+0x8a4/0xb10 [i915], CPU#0: kworker/u32:6/1378
> [  200.760351] Modules linked in: snd_seq_dummy snd_hrtimer
> scsi_transport_iscsi qrtr ccm algif_aead des3_ede_x86_64 des_generic libdes
> md4 rfcomm cmac algif_hash algif_skcipher af_alg bnep blocklayoutdriver
> nfsv4 nfs lockd grace nfs_localio netfs sunrpc binfmt_misc nls_iso8859_1
> cmdlinepart spi_nor mtd snd_hda_codec_intelhdmi intel_rapl_msr zfs(POE)
> intel_rapl_common x86_pkg_temp_thermal intel_powerclamp nouveau input_leds
> i915 spl(OE) snd_hda_codec_cs420x snd_hda_codec_generic
> snd_hda_codec_nvhdmi snd_hda_codec_hdmi hid_apple drm_ttm_helper coretemp
> facetimehd(OE) snd_hda_intel gpu_sched btusb videobuf2_dma_sg
> snd_intel_dspcfg drm_gpuvm videobuf2_memops btrtl snd_intel_sdw_acpi
> videobuf2_v4l2 snd_seq_midi snd_hda_codec btintel snd_seq_midi_event
> drm_exec drm_buddy iTCO_wdt videodev kvm_intel btbcm mxm_wmi i2c_algo_bit
> btmtk snd_hwdep intel_pmc_bxt snd_rawmidi spi_intel_platform wl(POE) joydev
> hid_generic videobuf2_common kvm spi_intel snd_hda_core iTCO_vendor_support
> applesmc ghash_clmulni_intel nvme ttm rapl bluetooth
> [  200.760418]  snd_seq intel_cstate uas usbhid drm_display_helper snd_pcm
> nvme_core cfg80211 cec efi_pstore rc_core hid mc bcm5974 sbs thunderbolt
> apple_mfi_fastcharge drm_client_lib i2c_i801 drm_kms_helper i2c_mux
> usb_storage i2c_smbus lpc_ich sbshc snd_timer apple_gmux snd_seq_device
> acpi_als industrialio_triggered_buffer mei_me kfifo_buf drm snd
> industrialio mei soundcore video wmi mac_hid dm_mirror dm_region_hash
> dm_log tcp_bbr sch_fq_codel pkcs8_key_parser msr parport_pc ppdev lp
> parport nfnetlink dmi_sysfs autofs4 aesni_intel
> [  200.760461] CPU: 0 UID: 0 PID: 1378 Comm: kworker/u32:6 Tainted: P     U
>  W  OE       6.19.0-rc4 #1 PREEMPT(lazy)
> [  200.760466] Tainted: [P]=PROPRIETARY_MODULE, [U]=USER, [W]=WARN,
> [O]=OOT_MODULE, [E]=UNSIGNED_MODULE

Basically all bets are off with the proprietary modules. Can you
reproduce without?

> [  200.760468] Hardware name: Apple Inc.
> MacBookPro11,3/Mac-2BD1B31983FE1663, BIOS 432.60.3.0.0 10/27/2021
> [  200.760470] Workqueue: pm pm_runtime_work
> [  200.760478] Sched_ext: lavd_1.0.20_g3c8138b8_x86_64_unknown_linux_gnu
> (enabled+all), task: runnable_at=+0ms
> [  200.760480] RIP: 0010:hsw_enable_pc8+0x8aa/0xb10 [i915]
> [  200.760653] Code: 32 12 00 48 85 ff 74 04 48 8b 7f 08 4c 8b 67 50 4d 85
> e4 75 03 4c 8b 27 e8 e3 73 a7 e4 48 8d 3d dc 03 30 00 4c 89 e2 48 89 c6
> <67> 48 0f b9 3a e9 df f9 ff ff 48 8b 3b 80 bb 4b 14 00 00 00 0f 84
> [  200.760655] RSP: 0018:ffffaf668250fc68 EFLAGS: 00010282
> [  200.760658] RAX: ffffffffc1d688a4 RBX: ffff920740f62000 RCX:
> ffffffffc180f0d0
> [  200.760660] RDX: ffff920742008030 RSI: ffffffffc1d688a4 RDI:
> ffffffffc1c038d0
> [  200.760661] RBP: ffffaf668250fc90 R08: 0000000000000002 R09:
> 0000000000000064
> [  200.760663] R10: 0000000000000000 R11: 0000000000000001 R12:
> ffff920742008030
> [  200.760664] R13: ffff920740ed4000 R14: 0000000000000000 R15:
> ffff920740ed4000
> [  200.760666] FS:  0000000000000000(0000) GS:ffff920b06bfd000(0000)
> knlGS:0000000000000000
> [  200.760668] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  200.760669] CR2: 00007f72423b701c CR3: 00000001777eb004 CR4:
> 00000000001726f0
> [  200.760671] Call Trace:
> [  200.760673]  <TASK>
> [  200.760678]  intel_display_power_suspend+0x61/0x80 [i915]
> [  200.760852]  intel_runtime_suspend+0xd7/0x230 [i915]
> [  200.760963]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
> [  200.760970]  pci_pm_runtime_suspend+0x6a/0x1a0
> [  200.760974]  __rpm_callback+0x4b/0x1f0
> [  200.760979]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
> [  200.760983]  rpm_callback+0x6f/0x80
> [  200.760986]  rpm_suspend+0xe1/0x5e0
> [  200.760990]  ? __schedule+0x44b/0x1650
> [  200.760996]  pm_runtime_work+0x91/0xa0
> [  200.761000]  process_one_work+0x188/0x360
> [  200.761005]  worker_thread+0x327/0x460
> [  200.761007]  ? __pfx_worker_thread+0x10/0x10
> [  200.761010]  kthread+0x10b/0x220
> [  200.761015]  ? __pfx_kthread+0x10/0x10
> [  200.761018]  ret_from_fork+0x16e/0x1e0
> [  200.761023]  ? __pfx_kthread+0x10/0x10
> [  200.761027]  ret_from_fork_asm+0x1a/0x30
> [  200.761034]  </TASK>
> [  200.761035] ---[ end trace 0000000000000000 ]---
>
>
> inxi -IG gives me this:
> Graphics:
>   Device-1: Intel Crystal Well Integrated Graphics driver: i915 v: kernel
>   Device-2: NVIDIA GK107M [GeForce GT 750M Mac Edition] driver: nouveau
>     v: kernel
>   Display: wayland server: X.Org v: 24.1.8 with: Xwayland v: 24.1.8
>     compositor: gnome-shell v: 49.0 driver: X: loaded: modesetting
>     unloaded: fbdev,vesa dri: nouveau gpu: nouveau resolution:
> 3840x2400~60Hz
>   API: EGL v: 1.5 drivers: crocus,nouveau,swrast
>     platforms: gbm,wayland,x11,surfaceless,device
>   API: OpenGL v: 4.6 compat-v: 4.3 vendor: mesa
>     v: 25.3.2+git2512181741.a943c55aea0~q~mesarc2 renderer: NVE7
>   API: Vulkan v: 1.4.321 drivers: nvk,intel,llvmpipe
>     surfaces: xcb,xlib,wayland
>   Info: Tools: api: eglinfo, glxinfo, vulkaninfo x11: xdriinfo, xdpyinfo,
>     xprop, xrandr
> Info:
>   Memory: total: 16 GiB available: 15.53 GiB used: 4.85 GiB (31.2%)
>   Processes: 468 Uptime: 17m Shell: Bash inxi: 3.3.39
>
> Please let me know if I'm sending this to the wrong list?

In general, please report i915 issues as described at [1].

BR,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


-- 
Jani Nikula, Intel
