Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72512AFC418
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816C810E5A5;
	Tue,  8 Jul 2025 07:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="DHEc4kR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECC910E5A5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 07:31:57 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4530921461aso27627375e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 00:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1751959916; x=1752564716; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/Gk4wr68rkXmATLXG0ucRH40tW6OMgs5fvrKbu1n6Tw=;
 b=DHEc4kR/vOAVtRVGtVNK00oJGEsmfPQhcutrtLkyAM70IHg8Sc6iwuw+qA6TXdVpTD
 JvVLftFPLP7J4xKAITipA97YI2APbvHB/Ds6iAHUiBSFcHyYEg11nOkMUIGuF10TwzDA
 2zZILxK/nnCX1xI+i8aokI7HkgLymqvENY1ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751959916; x=1752564716;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Gk4wr68rkXmATLXG0ucRH40tW6OMgs5fvrKbu1n6Tw=;
 b=aq9Egk87ny1k65vNGezBlzk/lWN2hLGXCKx+/YvlDWo5LFQNifePZgIGuybnHrPXqj
 LWc1pH2rtDvWKffSwKk+lfnwuA9fn0SXPmLFDFjcEqJovmtbkLhHsW3CRg/877ptvWNN
 U71dzeB+nlbwDXsOnvqtprLlUK3ImzAFa8bU71ZIhS2WsVb0SSK9s9GV6+zmA2kBy3rN
 A/WTcUYzA73RNd/ylzMwEIuYceX8C3z/dMaTIYTjQMfpxkXPrV5t76cCGjofbv68dKI3
 CJhI63aAQpvKYcamNkw8GX9ZftONscE9leGX27Mvq64XHfzCmZRn0JsI8DWToA6qeegf
 pIvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+3QR33RbJhkZYtdYj69aQRj9qUO+7USd09wHGanmlu6IVFbSs90rm5C16y4FUXBT1srvv95BSi7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzr2j5TOEgnIQaRwsDixU2Ug5U7BDD1b30leK8Vbm9x6PzidPl2
 O7BuYoCLtXXfNiYwlOFFg9GqZFUnPS2igIBaby8bD8yQdpx2idC2rqvMsq/V2RZDm2Y=
X-Gm-Gg: ASbGnctslxiDc00Y7/UjMiUIeyDgg4ug+i9WC64YJUb1BHI4tgKRzEXD5+RjsM/ywUy
 /vMlBKrMZ8aYcjZN3BKg9rcw3bqlUDYdQNT8lEISNlZe/sXcAxPOiUvXdzIr6X5Vo4FlUpKm6Wy
 m5EDDsVYuLsFGLmF+08WWPw1zaKN5ZBLBey85fNuTdN05VO33iUmIlod+G1Djl1ksN6qAM/F50R
 WwHxnwZi9ZEPYZkYdfup1luLiUEVTFmcBsLJIpZw1iX5DqjAT2YqRp4QwaqaFGs+eitWdW760V2
 Z5sGN9/QhBUsTYTNWrMgOHMe0t3OovgueH5V8SbG5oxr2awc2c2q3jdPylvTuaLBfqLdqhd+YA=
 =
X-Google-Smtp-Source: AGHT+IGVIK2gfXh+mpshg81JEk7DRdX681Gl06HmQoy2+V7/Z3uayPJrFQSZ6s4EC+ncU15lK7EI3w==
X-Received: by 2002:a05:600c:3489:b0:43c:ec4c:25b4 with SMTP id
 5b1f17b1804b1-454cd4cb9c6mr19348565e9.10.1751959915663; 
 Tue, 08 Jul 2025 00:31:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd44ef0dsm13520705e9.13.2025.07.08.00.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 00:31:55 -0700 (PDT)
Date: Tue, 8 Jul 2025 09:31:53 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Steve French <smfrench@gmail.com>
Cc: David Airlie <airlied@redhat.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: Flood of RIPs in DRM driver starting with 6.16-rc5
Message-ID: <aGzJaX1elvYzQPa-@phenom.ffwll.local>
Mail-Followup-To: Steve French <smfrench@gmail.com>,
 David Airlie <airlied@redhat.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>
References: <CAH2r5msTzHGf5YhYra+_5yFFGkc=1o2z_-QmtsA=5rNdy35j0g@mail.gmail.com>
 <CAH2r5mtuSD659modFsaj+hNQqK9+tMyZQ1zGHOjfEvXVz_fWMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2r5mtuSD659modFsaj+hNQqK9+tMyZQ1zGHOjfEvXVz_fWMA@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Mon, Jul 07, 2025 at 05:21:00PM -0500, Steve French wrote:
> I also see it manually building 6.16-rc4 from Saturday (not just
> seeing it with Ubuntu's daily build and mainline rc5 build), and are
> happening multiple times a second.

Should get addressed by this one here I think:

https://lore.kernel.org/dri-devel/20250707131224.249496-1-tzimmermann@suse.de/

Thanks for the report!
-Sima

> 
>  6.16.0-rc4+ #64 PREEMPT(voluntary)
> [  519.392263] Tainted: [W]=WARN
> [  519.392286] Hardware name: LENOVO 20MAS08500/20MAS08500, BIOS
> N2CET70W (1.53 ) 03/11/2024
> [  519.392313] RIP: 0010:drm_gem_object_handle_put_unlocked+0x135/0x1a0
> [  519.392363] Code: 48 8b 43 08 48 63 f5 48 8d b8 f8 0c 00 00 e8 c2
> 8b 99 00 4c 89 f7 e8 6a d2 50 ff c7 83 18 01 00 00 00 00 00 00 e9 4e
> ff ff ff <0f> 0b 5b 5d 41 5c 41 5d 41 5e 31 c0 31 f6 31 ff c3 cc cc cc
> cc 48
> [  519.392401] RSP: 0018:ffff8881a542fa88 EFLAGS: 00010246
> [  519.392443] RAX: 0000000000000000 RBX: ffff888196ee4000 RCX: 0000000000000000
> [  519.392536] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [  519.392566] RBP: ffff888196ee4004 R08: 0000000000000000 R09: 0000000000000000
> [  519.392595] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8881017b4000
> [  519.392624] R13: ffff888196ee4008 R14: ffff8881602bfc48 R15: ffff8881af771080
> [  519.392657] FS:  00007a43b692b6c0(0000) GS:ffff8888713bc000(0000)
> knlGS:0000000000000000
> [  519.392692] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  519.392722] CR2: 00007a4349384000 CR3: 000000010ba80005 CR4: 00000000003726f0
> [  519.392754] Call Trace:
> [  519.392779]  <TASK>
> [  519.392821]  drm_gem_fb_destroy+0x5c/0xb0
> [  519.392884]  drm_mode_closefb_ioctl+0xba/0x100
> [  519.392936]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
> [  519.392976]  drm_ioctl_kernel+0x132/0x1e0
> [  519.393037]  ? __pfx_drm_ioctl_kernel+0x10/0x10
> [  519.393083]  ? lock_release+0xcf/0x2b0
> [  519.393176]  drm_ioctl+0x3d4/0x710
> [  519.393245]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
> [  519.393299]  ? __pfx_drm_ioctl+0x10/0x10
> [  519.393415]  ? rcu_is_watching+0x1c/0x50
> [  519.393454]  ? trace_irq_enable.constprop.0+0xb4/0xf0
> [  519.393557]  ? _raw_spin_unlock_irqrestore+0x4a/0x70
> [  519.393627]  nouveau_drm_ioctl+0x89/0x110 [nouveau]
> [  519.397112]  __x64_sys_ioctl+0xc8/0x130
> [  519.397158]  ? rcu_is_watching+0x1c/0x50
> [  519.397212]  do_syscall_64+0x91/0x550
> [  519.397252]  ? ksys_read+0x158/0x170
> [  519.397303]  ? __pfx_ksys_read+0x10/0x10
> [  519.397357]  ? trace_irq_enable.constprop.0+0xb4/0xf0
> [  519.397408]  ? do_syscall_64+0x1c2/0x550
> [  519.397449]  ? rcu_is_watching+0x1c/0x50
> [  519.397535]  ? trace_irq_enable.constprop.0+0xb4/0xf0
> [  519.397588]  ? do_syscall_64+0x1c2/0x550
> [  519.397626]  ? handle_softirqs+0x4d5/0x640
> [  519.397699]  ? __pfx_handle_softirqs+0x10/0x10
> [  519.397759]  ? sched_core_idle_cpu+0x6d/0x160
> [  519.397806]  ? rcu_is_watching+0x1c/0x50
> [  519.397846]  ? trace_irq_enable.constprop.0+0xb4/0xf0
> [  519.397889]  ? lockdep_hardirqs_on_prepare+0xfe/0x210
> [  519.397953]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  519.397995] RIP: 0033:0x7a43c4d24ded
> [  519.398032] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10
> c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
> 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00
> 00 00
> [  519.398072] RSP: 002b:00007fff1befc240 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  519.398118] RAX: ffffffffffffffda RBX: 00005f07243655a0 RCX: 00007a43c4d24ded
> [  519.398151] RDX: 00007fff1befc2d0 RSI: 00000000c00864d0 RDI: 000000000000000c
> [  519.398181] RBP: 00007fff1befc290 R08: 0000000000000000 R09: 0000000000000220
> [  519.398211] R10: 0000000000000008 R11: 0000000000000246 R12: 00007fff1befc2d0
> [  519.398241] R13: 00000000c00864d0 R14: 000000000000000c R15: 000000001ef049c5
> [  519.398350]  </TASK>
> [  519.398373] irq event stamp: 10107687
> [  519.398396] hardirqs last  enabled at (10107693):
> [<ffffffff9f728462>] __up_console_sem+0x62/0x80
> [  519.398441] hardirqs last disabled at (10107698):
> [<ffffffff9f728447>] __up_console_sem+0x47/0x80
> [  519.398530] softirqs last  enabled at (10105846):
> [<ffffffff9f6093d8>] __irq_exit_rcu+0x158/0x180
> [  519.398579] softirqs last disabled at (10105841):
> [<ffffffff9f6093d8>] __irq_exit_rcu+0x158/0x180
> [  519.398626] ---[ end trace 0000000000000000 ]---
> [  519.987964] ------------[ cut here ]------------
> [  519.987996] WARNING: CPU: 1 PID: 2513 at
> drivers/gpu/drm/drm_gem.c:286
> drm_gem_object_handle_put_unlocked+0x135/0x1a0
> [  519.988067] Modules linked in: snd_seq_dummy snd_hrtimer
> snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device
> rfcomm xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack
> nf_defrag_ipv6 nf_defrag_ipv4 bridge stp llc xfrm_user xfrm_algo
> cachefiles xt_addrtype nft_compat nls_utf8 nf_tables cifs cifs_arc4
> nls_ucs2_utils cifs_md4 netfs ccm overlay qrtr cmac algif_hash
> algif_skcipher af_alg bnep snd_sof_pci_intel_cnl
> snd_sof_intel_hda_generic soundwire_intel snd_sof_intel_hda_sdw_bpt
> snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda_mlink
> snd_sof_intel_hda soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp
> snd_sof snd_sof_utils snd_soc_acpi_intel_match
> snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation
> snd_soc_acpi soundwire_bus snd_soc_sdca crc8 snd_soc_avs
> snd_soc_hda_codec snd_hda_ext_core snd_soc_core snd_hda_codec_hdmi
> snd_compress ac97_bus snd_pcm_dmaengine intel_uncore_frequency
> intel_uncore_frequency_common snd_hda_codec_realtek
> snd_hda_codec_generic snd_hda_scodec_component
> [  519.989387]  intel_tcc_cooling x86_pkg_temp_thermal
> intel_powerclamp coretemp kvm_intel snd_hda_intel iwlmvm
> snd_intel_dspcfg binfmt_misc snd_intel_sdw_acpi cmdlinepart kvm
> uvcvideo spi_nor ee1004 snd_hda_codec mac80211
> processor_thermal_device_pci_legacy irqbypass elan_i2c btusb
> videobuf2_vmalloc processor_thermal_device polyval_clmulni uvc mtd
> mei_hdcp snd_hda_core processor_thermal_wt_hint mei_pxp
> videobuf2_memops ghash_clmulni_intel btrtl sha1_ssse3
> platform_temperature_control snd_hwdep videobuf2_v4l2 btintel
> processor_thermal_rfim videobuf2_common aesni_intel nvidiafb
> processor_thermal_rapl btbcm snd_ctl_led nls_iso8859_1 intel_rapl_msr
> libarc4 sch_fq_codel iwlwifi snd_pcm btmtk i2c_i801 videodev think_lmi
> vgastate intel_rapl_common spi_intel_pci rapl i2c_mux mei_me
> processor_thermal_wt_req bluetooth intel_cstate intel_wmi_thunderbolt
> firmware_attributes_class mc wmi_bmof snd_timer fb_ddc i2c_smbus
> spi_intel cfg80211 processor_thermal_power_floor
> processor_thermal_mbox mei intel_soc_dts_iosf intel_pch_thermal
> [  519.991069]  thinkpad_acpi nvram int3403_thermal
> int340x_thermal_zone intel_pmc_core pmt_telemetry pmt_class
> intel_pmc_ssram_telemetry int3400_thermal acpi_pad intel_vsec
> acpi_thermal_rel input_leds joydev mac_hid serio_raw nouveau mxm_wmi
> drm_gpuvm gpu_sched drm_ttm_helper ttm drm_exec drm_display_helper cec
> rc_core i2c_algo_bit msr parport_pc nfsd ppdev lp parport auth_rpcgss
> nfs_acl nvme_fabrics lockd efi_pstore grace sunrpc nfnetlink dmi_sysfs
> ip_tables x_tables autofs4 xfs btrfs blake2b_generic raid10 raid456
> async_raid6_recov async_memcpy async_pq async_xor async_tx xor
> raid6_pq raid1 raid0 8250_dw snd soundcore wacom video nvme
> hid_generic ucsi_acpi typec_ucsi rtsx_pci_sdmmc nvme_core
> intel_lpss_pci typec usbhid intel_lpss nvme_keyring psmouse e1000e hid
> nvme_auth rtsx_pci thunderbolt idma64 sparse_keymap platform_profile
> wmi pinctrl_cannonlake
> [  519.993135] CPU: 1 UID: 1000 PID: 2513 Comm: gnome-shell Tainted: G
>        W           6.16.0-rc4+ #64 PREEMPT(voluntary)
> [  519.993193] Tainted: [W]=WARN
> [  519.993217] Hardware name: LENOVO 20MAS08500/20MAS08500, BIOS
> N2CET70W (1.53 ) 03/11/2024
> [  519.993245] RIP: 0010:drm_gem_object_handle_put_unlocked+0x135/0x1a0
> [  519.993298] Code: 48 8b 43 08 48 63 f5 48 8d b8 f8 0c 00 00 e8 c2
> 8b 99 00 4c 89 f7 e8 6a d2 50 ff c7 83 18 01 00 00 00 00 00 00 e9 4e
> ff ff ff <0f> 0b 5b 5d 41 5c 41 5d 41 5e 31 c0 31 f6 31 ff c3 cc cc cc
> cc 48
> [  519.993338] RSP: 0018:ffff8881a542f958 EFLAGS: 00010246
> [  519.993381] RAX: 0000000000000000 RBX: ffff888128788000 RCX: 0000000000000000
> [  519.993413] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [  519.993441] RBP: ffff888128788004 R08: 0000000000000000 R09: 0000000000000000
> [  519.993472] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8881017b4000
> [  519.993501] R13: ffff888128788008 R14: ffff8881602be848 R15: ffff8881af771080
> [  519.993535] FS:  00007a43b692b6c0(0000) GS:ffff888870ebc000(0000)
> knlGS:0000000000000000
> [  519.993661] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  519.993707] CR2: 000031ac05bee400 CR3: 000000010ba80001 CR4: 00000000003726f0
> [  519.993752] Call Trace:
> [  519.993788]  <TASK>
> [  519.993847]  drm_gem_fb_destroy+0x5c/0xb0
> [  519.993938]  drm_mode_closefb_ioctl+0xba/0x100
> [  519.994014]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
> [  519.994071]  drm_ioctl_kernel+0x132/0x1e0
> [  519.994159]  ? __pfx_drm_ioctl_kernel+0x10/0x10
> [  519.994226]  ? lock_release+0xcf/0x2b0
> [  519.994359]  drm_ioctl+0x3d4/0x710
> [  519.994462]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
> [  519.994542]  ? __pfx_drm_ioctl+0x10/0x10
> [  519.994774]  ? rcu_is_watching+0x1c/0x50
> [  519.994838]  ? trace_irq_enable.constprop.0+0xb4/0xf0
> [  519.994913]  ? _raw_spin_unlock_irqrestore+0x4a/0x70
> [  519.995012]  nouveau_drm_ioctl+0x89/0x110 [nouveau]
> [  519.999658]  __x64_sys_ioctl+0xc8/0x130
> [  519.999724]  ? rcu_is_watching+0x1c/0x50
> [  519.999802]  do_syscall_64+0x91/0x550
> [  519.999900]  ? __lock_acquire+0x466/0x28c0
> [  520.000001]  ? do_raw_spin_lock+0x116/0x1c0
> [  520.000072]  ? __pfx_do_raw_spin_lock+0x10/0x10
> [  520.000129]  ? rb_insert_color+0x2a/0x2a0
> [  520.000229]  ? lock_acquire+0x16e/0x300
> [  520.000300]  ? ktime_get+0x24/0x140
> [  520.000360]  ? find_held_lock+0x2b/0x90
> [  520.000427]  ? ktime_get+0x24/0x140
> [  520.000487]  ? lock_release+0xcf/0x2b0
> [  520.000658]  ? ktime_get+0x7b/0x140
> [  520.000737]  ? lapic_next_deadline+0x22/0x40
> [  520.000790]  ? clockevents_program_event+0xf8/0x190
> [  520.000873]  ? hrtimer_interrupt+0x371/0x3c0
> [  520.000987]  ? sched_core_idle_cpu+0x6d/0x160
> [  520.001056]  ? rcu_is_watching+0x1c/0x50
> [  520.001113]  ? trace_irq_enable.constprop.0+0xb4/0xf0
> [  520.001176]  ? lockdep_hardirqs_on_prepare+0xfe/0x210
> [  520.001269]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  520.001329] RIP: 0033:0x7a43c4d24ded
> [  520.001382] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10
> c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
> 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00
> 00 00
> [  520.001435] RSP: 002b:00007fff1befc240 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  520.001500] RAX: ffffffffffffffda RBX: 00005f0721ae1400 RCX: 00007a43c4d24ded
> [  520.001545] RDX: 00007fff1befc2d0 RSI: 00000000c00864d0 RDI: 000000000000000c
> [  520.001668] RBP: 00007fff1befc290 R08: 0000000000000000 R09: 0000000000001168
> [  520.001713] R10: 0000000000000008 R11: 0000000000000246 R12: 00007fff1befc2d0
> [  520.001755] R13: 00000000c00864d0 R14: 000000000000000c R15: 000000001ef9711b
> [  520.001912]  </TASK>
> [  520.001946] irq event stamp: 10111849
> [  520.001978] hardirqs last  enabled at (10111855):
> [<ffffffff9f728462>] __up_console_sem+0x62/0x80
> [  520.002044] hardirqs last disabled at (10111860):
> [<ffffffff9f728447>] __up_console_sem+0x47/0x80
> [  520.002104] softirqs last  enabled at (10111652):
> [<ffffffff9f6093d8>] __irq_exit_rcu+0x158/0x180
> [  520.002171] softirqs last disabled at (10111641):
> [<ffffffff9f6093d8>] __irq_exit_rcu+0x158/0x180
> [  520.002238] ---[ end trace 0000000000000000 ]---
> [  520.154640] ------------[ cut here ]------------
> [  520.154675] WARNING: CPU: 4 PID: 2513 at
> drivers/gpu/drm/drm_gem.c:286
> drm_gem_object_handle_put_unlocked+0x135/0x1a0
> [  520.154743] Modules linked in: snd_seq_dummy snd_hrtimer
> snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device
> rfcomm xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack
> nf_defrag_ipv6 nf_defrag_ipv4 bridge stp llc xfrm_user xfrm_algo
> cachefiles xt_addrtype nft_compat nls_utf8 nf_tables cifs cifs_arc4
> nls_ucs2_utils cifs_md4 netfs ccm overlay qrtr cmac algif_hash
> algif_skcipher af_alg bnep snd_sof_pci_intel_cnl
> snd_sof_intel_hda_generic soundwire_intel snd_sof_intel_hda_sdw_bpt
> snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda_mlink
> snd_sof_intel_hda soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp
> snd_sof snd_sof_utils snd_soc_acpi_intel_match
> snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation
> snd_soc_acpi soundwire_bus snd_soc_sdca crc8 snd_soc_avs
> snd_soc_hda_codec snd_hda_ext_core snd_soc_core snd_hda_codec_hdmi
> snd_compress ac97_bus snd_pcm_dmaengine intel_uncore_frequency
> intel_uncore_frequency_common snd_hda_codec_realtek
> snd_hda_codec_generic snd_hda_scodec_component
> [  520.156018]  intel_tcc_cooling x86_pkg_temp_thermal
> intel_powerclamp coretemp kvm_intel snd_hda_intel iwlmvm
> snd_intel_dspcfg binfmt_misc snd_intel_sdw_acpi cmdlinepart kvm
> uvcvideo spi_nor ee1004 snd_hda_codec mac80211
> processor_thermal_device_pci_legacy irqbypass elan_i2c btusb
> videobuf2_vmalloc processor_thermal_device polyval_clmulni uvc mtd
> mei_hdcp snd_hda_core processor_thermal_wt_hint mei_pxp
> videobuf2_memops ghash_clmulni_intel btrtl sha1_ssse3
> platform_temperature_control snd_hwdep videobuf2_v4l2 btintel
> processor_thermal_rfim videobuf2_common aesni_intel nvidiafb
> processor_thermal_rapl btbcm snd_ctl_led nls_iso8859_1 intel_rapl_msr
> libarc4 sch_fq_codel iwlwifi snd_pcm btmtk i2c_i801 videodev think_lmi
> vgastate intel_rapl_common spi_intel_pci rapl i2c_mux mei_me
> processor_thermal_wt_req bluetooth intel_cstate intel_wmi_thunderbolt
> firmware_attributes_class mc wmi_bmof snd_timer fb_ddc i2c_smbus
> spi_intel cfg80211 processor_thermal_power_floor
> processor_thermal_mbox mei intel_soc_dts_iosf intel_pch_thermal
> [  520.157367]  thinkpad_acpi nvram int3403_thermal
> int340x_thermal_zone intel_pmc_core pmt_telemetry pmt_class
> intel_pmc_ssram_telemetry int3400_thermal acpi_pad intel_vsec
> acpi_thermal_rel input_leds joydev mac_hid serio_raw nouveau mxm_wmi
> drm_gpuvm gpu_sched drm_ttm_helper ttm drm_exec drm_display_helper cec
> rc_core i2c_algo_bit msr parport_pc nfsd ppdev lp parport auth_rpcgss
> nfs_acl nvme_fabrics lockd efi_pstore grace sunrpc nfnetlink dmi_sysfs
> ip_tables x_tables autofs4 xfs btrfs blake2b_generic raid10 raid456
> async_raid6_recov async_memcpy async_pq async_xor async_tx xor
> raid6_pq raid1 raid0 8250_dw snd soundcore wacom video nvme
> hid_generic ucsi_acpi typec_ucsi rtsx_pci_sdmmc nvme_core
> intel_lpss_pci typec usbhid intel_lpss nvme_keyring psmouse e1000e hid
> nvme_auth rtsx_pci thunderbolt idma64 sparse_keymap platform_profile
> wmi pinctrl_cannonlake
> [  520.158953] CPU: 4 UID: 1000 PID: 2513 Comm: gnome-shell Tainted: G
>        W           6.16.0-rc4+ #64 PREEMPT(voluntary)
> [  520.159011] Tainted: [W]=WARN
> [  520.159033] Hardware name: LENOVO 20MAS08500/20MAS08500, BIOS
> N2CET70W (1.53 ) 03/11/2024
> [  520.159062] RIP: 0010:drm_gem_object_handle_put_unlocked+0x135/0x1a0
> [  520.159115] Code: 48 8b 43 08 48 63 f5 48 8d b8 f8 0c 00 00 e8 c2
> 8b 99 00 4c 89 f7 e8 6a d2 50 ff c7 83 18 01 00 00 00 00 00 00 e9 4e
> ff ff ff <0f> 0b 5b 5d 41 5c 41 5d 41 5e 31 c0 31 f6 31 ff c3 cc cc cc
> cc 48
> [  520.159155] RSP: 0018:ffff8881a542fa18 EFLAGS: 00010246
> [  520.159198] RAX: 0000000000000000 RBX: ffff8888777e2000 RCX: 0000000000000000
> [  520.159230] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [  520.159258] RBP: ffff8888777e2004 R08: 0000000000000000 R09: 0000000000000000
> [  520.159289] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8881017b4000
> [  520.159319] R13: ffff8888777e2008 R14: ffff8881602bed48 R15: ffff8881af771080
> [  520.159352] FS:  00007a43b692b6c0(0000) GS:ffff88887103c000(0000)
> knlGS:0000000000000000
> [  520.159388] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  520.159419] CR2: 00007a433f99f000 CR3: 000000010ba80003 CR4: 00000000003726f0
> [  520.159451] Call Trace:
> [  520.159477]  <TASK>
> [  520.159519]  drm_gem_fb_destroy+0x5c/0xb0
> [  520.159644]  drm_mode_closefb_ioctl+0xba/0x100
> [  520.159701]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
> [  520.159741]  drm_ioctl_kernel+0x132/0x1e0
> [  520.159803]  ? __pfx_drm_ioctl_kernel+0x10/0x10
> [  520.159849]  ? lock_release+0xcf/0x2b0
> [  520.159943]  drm_ioctl+0x3d4/0x710
> [  520.160013]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
> [  520.160067]  ? __pfx_drm_ioctl+0x10/0x10
> [  520.160184]  ? rcu_is_watching+0x1c/0x50
> [  520.160224]  ? trace_irq_enable.constprop.0+0xb4/0xf0
> [  520.160276]  ? _raw_spin_unlock_irqrestore+0x4a/0x70
> [  520.160346]  nouveau_drm_ioctl+0x89/0x110 [nouveau]
> [  520.164171]  __x64_sys_ioctl+0xc8/0x130
> [  520.164216]  ? rcu_is_watching+0x1c/0x50
> [  520.164271]  do_syscall_64+0x91/0x550
> [  520.164317]  ? __pfx_vfs_read+0x10/0x10
> [  520.164384]  ? lock_release+0xcf/0x2b0
> [  520.164459]  ? __fget_files+0x12d/0x230
> [  520.164534]  ? fput+0x25/0x80
> [  520.164573]  ? ksys_read+0x158/0x170
> [  520.164686]  ? __pfx_ksys_read+0x10/0x10
> [  520.164743]  ? rcu_is_watching+0x1c/0x50
> [  520.164782]  ? trace_irq_enable.constprop.0+0xb4/0xf0
> [  520.164834]  ? rcu_is_watching+0x1c/0x50
> [  520.164873]  ? trace_irq_enable.constprop.0+0xb4/0xf0
> [  520.164924]  ? do_syscall_64+0x1c2/0x550
> [  520.164964]  ? trace_irq_enable.constprop.0+0xb4/0xf0
> [  520.165008]  ? lockdep_hardirqs_on_prepare+0xfe/0x210
> [  520.165074]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  520.165116] RIP: 0033:0x7a43c4d24ded
> [  520.165152] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10
> c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
> 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00
> 00 00
> [  520.165192] RSP: 002b:00007fff1befc240 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  520.165239] RAX: ffffffffffffffda RBX: 00005f0723185370 RCX: 00007a43c4d24ded
> [  520.165272] RDX: 00007fff1befc2d0 RSI: 00000000c00864d0 RDI: 000000000000000c
> [  520.165302] RBP: 00007fff1befc290 R08: 0000000000000000 R09: 00007a43c4e03ac0
> [  520.165332] R10: 0000000000000008 R11: 0000000000000246 R12: 00007fff1befc2d0
> [  520.165362] R13: 00000000c00864d0 R14: 000000000000000c R15: 000000001efbfc09
> [  520.165472]  </TASK>
> [  520.165495] irq event stamp: 10117535
> [  520.165517] hardirqs last  enabled at (10117541):
> [<ffffffff9f728462>] __up_console_sem+0x62/0x80
> [  520.165562] hardirqs last disabled at (10117546):
> [<ffffffff9f728447>] __up_console_sem+0x47/0x80
> [  520.165656] softirqs last  enabled at (10117366):
> [<ffffffff9f6093d8>] __irq_exit_rcu+0x158/0x180
> [  520.165704] softirqs last disabled at (10117339):
> [<ffffffff9f6093d8>] __irq_exit_rcu+0x158/0x180
> [  520.165749] ---[ end trace 0000000000000000 ]---
> [  520.377686] ------------[ cut here ]------------
> [  520.377728] WARNING: CPU: 10 PID: 2513 at
> drivers/gpu/drm/drm_gem.c:286
> drm_gem_object_handle_put_unlocked+0x135/0x1a0
> [  520.377818] Modules linked in: snd_seq_dummy snd_hrtimer
> snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device
> rfcomm xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack
> nf_defrag_ipv6 nf_defrag_ipv4 bridge stp llc xfrm_user xfrm_algo
> cachefiles xt_addrtype nft_compat nls_utf8 nf_tables cifs cifs_arc4
> nls_ucs2_utils cifs_md4 netfs ccm overlay qrtr cmac algif_hash
> algif_skcipher af_alg bnep snd_sof_pci_intel_cnl
> snd_sof_intel_hda_generic soundwire_intel snd_sof_intel_hda_sdw_bpt
> snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda_mlink
> snd_sof_intel_hda soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp
> snd_sof snd_sof_utils snd_soc_acpi_intel_match
> snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation
> snd_soc_acpi soundwire_bus snd_soc_sdca crc8 snd_soc_avs
> snd_soc_hda_codec snd_hda_ext_core snd_soc_core snd_hda_codec_hdmi
> snd_compress ac97_bus snd_pcm_dmaengine intel_uncore_frequency
> intel_uncore_frequency_common snd_hda_codec_realtek
> snd_hda_codec_generic snd_hda_scodec_component
> [  520.379442]  intel_tcc_cooling x86_pkg_temp_thermal
> intel_powerclamp coretemp kvm_intel snd_hda_intel iwlmvm
> snd_intel_dspcfg binfmt_misc snd_intel_sdw_acpi cmdlinepart kvm
> uvcvideo spi_nor ee1004 snd_hda_codec mac80211
> processor_thermal_device_pci_legacy irqbypass elan_i2c btusb
> videobuf2_vmalloc processor_thermal_device polyval_clmulni uvc mtd
> mei_hdcp snd_hda_core processor_thermal_wt_hint mei_pxp
> videobuf2_memops ghash_clmulni_intel btrtl sha1_ssse3
> platform_temperature_control snd_hwdep videobuf2_v4l2 btintel
> processor_thermal_rfim videobuf2_common aesni_intel nvidiafb
> processor_thermal_rapl btbcm snd_ctl_led nls_iso8859_1 intel_rapl_msr
> libarc4 sch_fq_codel iwlwifi snd_pcm btmtk i2c_i801 videodev think_lmi
> vgastate intel_rapl_common spi_intel_pci rapl i2c_mux mei_me
> processor_thermal_wt_req bluetooth intel_cstate intel_wmi_thunderbolt
> firmware_attributes_class mc wmi_bmof snd_timer fb_ddc i2c_smbus
> spi_intel cfg80211 processor_thermal_power_floor
> processor_thermal_mbox mei intel_soc_dts_iosf intel_pch_thermal
> [  520.381326]  thinkpad_acpi nvram int3403_thermal
> int340x_thermal_zone intel_pmc_core pmt_telemetry pmt_class
> intel_pmc_ssram_telemetry int3400_thermal acpi_pad intel_vsec
> acpi_thermal_rel input_leds joydev mac_hid serio_raw nouveau mxm_wmi
> drm_gpuvm gpu_sched drm_ttm_helper ttm drm_exec drm_display_helper cec
> rc_core i2c_algo_bit msr parport_pc nfsd ppdev lp parport auth_rpcgss
> nfs_acl nvme_fabrics lockd efi_pstore grace sunrpc nfnetlink dmi_sysfs
> ip_tables x_tables autofs4 xfs btrfs blake2b_generic raid10 raid456
> async_raid6_recov async_memcpy async_pq async_xor async_tx xor
> raid6_pq raid1 raid0 8250_dw snd soundcore wacom video nvme
> hid_generic ucsi_acpi typec_ucsi rtsx_pci_sdmmc nvme_core
> intel_lpss_pci typec usbhid intel_lpss nvme_keyring psmouse e1000e hid
> nvme_auth rtsx_pci thunderbolt idma64 sparse_keymap platform_profile
> wmi pinctrl_cannonlake
> [  520.383461] CPU: 10 UID: 1000 PID: 2513 Comm: gnome-shell Tainted:
> G        W           6.16.0-rc4+ #64 PREEMPT(voluntary)
> [  520.383540] Tainted: [W]=WARN
> [  520.383570] Hardware name: LENOVO 20MAS08500/20MAS08500, BIOS
> N2CET70W (1.53 ) 03/11/2024
> [  520.383606] RIP: 0010:drm_gem_object_handle_put_unlocked+0x135/0x1a0
> [  520.383768] Code: 48 8b 43 08 48 63 f5 48 8d b8 f8 0c 00 00 e8 c2
> 8b 99 00 4c 89 f7 e8 6a d2 50 ff c7 83 18 01 00 00 00 00 00 00 e9 4e
> ff ff ff <0f> 0b 5b 5d 41 5c 41 5d 41 5e 31 c0 31 f6 31 ff c3 cc cc cc
> cc 48
> [  520.383827] RSP: 0018:ffff8881a542fbe8 EFLAGS: 00010246
> [  520.383885] RAX: 0000000000000000 RBX: ffff888196ee4000 RCX: 0000000000000000
> [  520.383921] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [  520.383963] RBP: ffff888196ee4004 R08: 0000000000000000 R09: 0000000000000000
> [  520.384005] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8881017b4000
> [  520.384048] R13: ffff888196ee4008 R14: ffff8881b9f37948 R15: ffff8881af771080
> [  520.384097] FS:  00007a43b692b6c0(0000) GS:ffff88887133c000(0000)
> knlGS:0000000000000000
> [  520.384149] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  520.384188] CR2: 000005e99866c000 CR3: 000000010ba80001 CR4: 00000000003726f0
> [  520.384235] Call Trace:
> [  520.384265]  <TASK>
> [  520.384324]  drm_gem_fb_destroy+0x5c/0xb0
> [  520.384417]  drm_mode_closefb_ioctl+0xba/0x100
> [  520.384494]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
> [  520.384555]  drm_ioctl_kernel+0x132/0x1e0
> [  520.384720]  ? __pfx_drm_ioctl_kernel+0x10/0x10
> [  520.384788]  ? lock_release+0xcf/0x2b0
> [  520.384923]  drm_ioctl+0x3d4/0x710
> [  520.384999]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
> [  520.385055]  ? __pfx_drm_ioctl+0x10/0x10
> [  520.385193]  ? rcu_is_watching+0x1c/0x50
> [  520.385253]  ? trace_irq_enable.constprop.0+0xb4/0xf0
> [  520.385328]  ? _raw_spin_unlock_irqrestore+0x4a/0x70
> [  520.385429]  nouveau_drm_ioctl+0x89/0x110 [nouveau]
> [  520.389425]  __x64_sys_ioctl+0xc8/0x130
> [  520.389471]  ? rcu_is_watching+0x1c/0x50
> [  520.389524]  do_syscall_64+0x91/0x550
> [  520.389584]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  520.389680] RIP: 0033:0x7a43c4d24ded
> [  520.389720] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10
> c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
> 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00
> 00 00
> [  520.389759] RSP: 002b:00007fff1befc240 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  520.389794] RAX: ffffffffffffffda RBX: 00005f0722ae66c0 RCX: 00007a43c4d24ded
> [  520.389817] RDX: 00007fff1befc2d0 RSI: 00000000c00864d0 RDI: 000000000000000c
> [  520.389838] RBP: 00007fff1befc290 R08: 0000000000000000 R09: 00007a43c4e03ac0
> [  520.389859] R10: 0000000000000008 R11: 0000000000000246 R12: 00007fff1befc2d0
> [  520.389879] R13: 00000000c00864d0 R14: 000000000000000c R15: 000000001efec80e
> [  520.389954]  </TASK>
> [  520.389970] irq event stamp: 10123147
> [  520.389985] hardirqs last  enabled at (10123153):
> [<ffffffff9f728462>] __up_console_sem+0x62/0x80
> [  520.390018] hardirqs last disabled at (10123158):
> [<ffffffff9f728447>] __up_console_sem+0x47/0x80
> [  520.390048] softirqs last  enabled at (10121286):
> [<ffffffff9f6093d8>] __irq_exit_rcu+0x158/0x180
> [  520.390090] softirqs last disabled at (10121281):
> [<ffffffff9f6093d8>] __irq_exit_rcu+0x158/0x180
> [  520.390136] ---[ end trace 0000000000000000 ]---
> 
> On Mon, Jul 7, 2025 at 4:51 PM Steve French <smfrench@gmail.com> wrote:
> >
> > I see these RIP logged every second or two with 6.16-rc5 on boot, and
> > they continue indefinitely.  I don't remember seeing these on rc4.
> > This happens when booting up, even when doing nothing on laptop
> > (Lenovo P52, Ubuntu 24 running normal build of mainline 6.16-rc5) and
> > they keep occurring.
> >
> > 6.16.0-061600rc5-generic #202507062141 PREEMPT(voluntary)
> > [  642.019544] Tainted: [W]=WARN
> > [  642.019549] Hardware name: LENOVO 20MAS08500/20MAS08500, BIOS
> > N2CET70W (1.53 ) 03/11/2024
> > [  642.019556] RIP: 0010:drm_gem_object_handle_put_unlocked+0xc5/0x100
> > [  642.019570] Code: ca ff eb 9c 4c 89 e7 e8 09 cf 64 00 eb d0 48 8b
> > 43 08 48 8d b8 e8 05 00 00 e8 47 8b 60 00 c7 83 e0 00 00 00 00 00 00
> > 00 eb 90 <0f> 0b 5b 41 5c 5d 31 c0 31 f6 31 ff c3 cc cc cc cc 48 8b 83
> > 40 01
> > [  642.019579] RSP: 0018:ffffd003454f38c8 EFLAGS: 00010246
> > [  642.019590] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
> > [  642.019596] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8ced0e693000
> > [  642.019602] RBP: ffffd003454f38d8 R08: 0000000000000000 R09: 0000000000000000
> > [  642.019609] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8ced06634000
> > [  642.019615] R13: 0000000000000000 R14: ffffd003454f3a30 R15: ffff8ced06634000
> > [  642.019622] FS:  00007f0b743986c0(0000) GS:ffff8cf4cbd88000(0000)
> > knlGS:0000000000000000
> > [  642.019630] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  642.019637] CR2: 00007f0af0384000 CR3: 000000016c6a0006 CR4: 00000000003726f0
> > [  642.019645] Call Trace:
> > [  642.019651]  <TASK>
> > [  642.019658]  drm_gem_fb_destroy+0x35/0x80
> > [  642.019673]  drm_framebuffer_free+0x40/0xa0
> > [  642.019706]  drm_mode_object_put.part.0+0x5d/0xa0
> > [  642.019718]  drm_mode_object_put+0x15/0x30
> > [  642.019727]  drm_mode_closefb_ioctl+0x76/0xa0
> > [  642.019738]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
> > [  642.019748]  drm_ioctl_kernel+0xb2/0x110
> > [  642.019760]  drm_ioctl+0x2ea/0x5b0
> > [  642.019767]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
> > [  642.019788]  nouveau_drm_ioctl+0x5e/0xc0 [nouveau]
> > [  642.020378]  __x64_sys_ioctl+0xa2/0x100
> > [  642.020392]  x64_sys_call+0x106b/0x2320
> > [  642.020403]  do_syscall_64+0x80/0xe80
> > [  642.020416]  ? do_syscall_64+0xb6/0xe80
> > [  642.020429]  ? __rseq_handle_notify_resume+0x36/0x70
> > [  642.020444]  ? arch_exit_to_user_mode_prepare.isra.0+0xa0/0xc0
> > [  642.020455]  ? do_syscall_64+0xb6/0xe80
> > [  642.020474]  ? kick_ilb+0x52/0x180
> > [  642.020488]  ? update_load_avg+0x8b/0x410
> > [  642.020502]  ? __update_blocked_fair+0xac/0x550
> > [  642.020515]  ? __note_gp_changes+0x1ca/0x220
> > [  642.020529]  ? note_gp_changes+0x8f/0xa0
> > [  642.020541]  ? rcu_core+0x1b6/0x370
> > [  642.020553]  ? rcu_core_si+0xe/0x20
> > [  642.020564]  ? handle_softirqs+0xe4/0x340
> > [  642.020576]  ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xc0
> > [  642.020588]  ? irqentry_exit_to_user_mode+0x2d/0x1d0
> > [  642.020599]  ? irqentry_exit+0x43/0x50
> > [  642.020609]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [  642.020618] RIP: 0033:0x7f0b7ad24ded
> > [  642.020627] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10
> > c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
> > 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00
> > 00 00
> > [  642.020635] RSP: 002b:00007ffca5eb8f50 EFLAGS: 00000246 ORIG_RAX:
> > 0000000000000010
> > [  642.020647] RAX: ffffffffffffffda RBX: 000055b1a5e17cc0 RCX: 00007f0b7ad24ded
> > [  642.020654] RDX: 00007ffca5eb8fe0 RSI: 00000000c00864d0 RDI: 000000000000000c
> > [  642.020661] RBP: 00007ffca5eb8fa0 R08: 0000000000000000 R09: 00007f0b7ae03ac0
> > [  642.020667] R10: 0000000000000008 R11: 0000000000000246 R12: 00007ffca5eb8fe0
> > [  642.020673] R13: 00000000c00864d0 R14: 000000000000000c R15: 000000002640746b
> > [  642.020702]  </TASK>
> > [  642.020707] ---[ end trace 0000000000000000 ]---
> >
> > ...
> >
> > 6.16.0-061600rc5-generic #202507062141 PREEMPT(voluntary)
> > [  795.464458] Tainted: [W]=WARN
> > [  795.464460] Hardware name: LENOVO 20MAS08500/20MAS08500, BIOS
> > N2CET70W (1.53 ) 03/11/2024
> > [  795.464462] RIP: 0010:drm_gem_object_handle_put_unlocked+0xc5/0x100
> > [  795.464468] Code: ca ff eb 9c 4c 89 e7 e8 09 cf 64 00 eb d0 48 8b
> > 43 08 48 8d b8 e8 05 00 00 e8 47 8b 60 00 c7 83 e0 00 00 00 00 00 00
> > 00 eb 90 <0f> 0b 5b 41 5c 5d 31 c0 31 f6 31 ff c3 cc cc cc cc 48 8b 83
> > 40 01
> > [  795.464471] RSP: 0018:ffffd003454f3898 EFLAGS: 00010246
> > [  795.464476] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
> > [  795.464479] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8ced0e693000
> > [  795.464481] RBP: ffffd003454f38a8 R08: 0000000000000000 R09: 0000000000000000
> > [  795.464484] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8ced06634000
> > [  795.464486] R13: 0000000000000000 R14: ffffd003454f3a00 R15: ffff8ced06634000
> > [  795.464489] FS:  00007f0b743986c0(0000) GS:ffff8cf4cb988000(0000)
> > knlGS:0000000000000000
> > [  795.464492] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  795.464495] CR2: 00007f0b6c6a9020 CR3: 000000016c6a0006 CR4: 00000000003726f0
> > [  795.464498] Call Trace:
> > [  795.464500]  <TASK>
> > [  795.464504]  drm_gem_fb_destroy+0x35/0x80
> > [  795.464510]  drm_framebuffer_free+0x40/0xa0
> > [  795.464515]  drm_mode_object_put.part.0+0x5d/0xa0
> > [  795.464520]  drm_mode_object_put+0x15/0x30
> > [  795.464524]  drm_mode_closefb_ioctl+0x76/0xa0
> > [  795.464528]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
> > [  795.464533]  drm_ioctl_kernel+0xb2/0x110
> > [  795.464537]  drm_ioctl+0x2ea/0x5b0
> > [  795.464541]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
> > [  795.464550]  nouveau_drm_ioctl+0x5e/0xc0 [nouveau]
> > [  795.464783]  __x64_sys_ioctl+0xa2/0x100
> > [  795.464790]  x64_sys_call+0x106b/0x2320
> > [  795.464794]  do_syscall_64+0x80/0xe80
> > [  795.464802]  ? __x64_sys_poll+0xd2/0x180
> > [  795.464808]  ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xc0
> > [  795.464813]  ? do_syscall_64+0xb6/0xe80
> > [  795.464819]  ? futex_hash+0xe/0x20
> > [  795.464823]  ? futex_wake+0x89/0x1b0
> > [  795.464830]  ? do_futex+0x18e/0x260
> > [  795.464835]  ? __x64_sys_futex+0x127/0x200
> > [  795.464839]  ? eventfd_write+0xdc/0x200
> > [  795.464844]  ? security_file_permission+0x5b/0x170
> > [  795.464850]  ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xc0
> > [  795.464854]  ? do_syscall_64+0xb6/0xe80
> > [  795.464862]  ? ksys_write+0xd9/0xf0
> > [  795.464869]  ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xc0
> > [  795.464873]  ? do_syscall_64+0xb6/0xe80
> > [  795.464878]  ? do_syscall_64+0xb6/0xe80
> > [  795.464883]  ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xc0
> > [  795.464888]  ? irqentry_exit_to_user_mode+0x2d/0x1d0
> > [  795.464893]  ? irqentry_exit+0x43/0x50
> > [  795.464897]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [  795.464901] RIP: 0033:0x7f0b7ad24ded
> > [  795.464904] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10
> > c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
> > 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00
> > 00 00
> > [  795.464907] RSP: 002b:00007ffca5eb8f50 EFLAGS: 00000246 ORIG_RAX:
> > 0000000000000010
> > [  795.464912] RAX: ffffffffffffffda RBX: 000055b1a8710050 RCX: 00007f0b7ad24ded
> > [  795.464915] RDX: 00007ffca5eb8fe0 RSI: 00000000c00864d0 RDI: 000000000000000c
> > [  795.464917] RBP: 00007ffca5eb8fa0 R08: 0000000000000000 R09: 00007f0b7ae03ac0
> > [  795.464920] R10: 0000000000000008 R11: 0000000000000246 R12: 00007ffca5eb8fe0
> > [  795.464922] R13: 00000000c00864d0 R14: 000000000000000c R15: 000000002f66b7a8
> > [  795.464929]  </TASK>
> > [  795.464931] ---[ end trace 0000000000000000 ]---
> >
> >
> > --
> > Thanks,
> >
> > Steve
> 
> 
> 
> -- 
> Thanks,
> 
> Steve

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
