Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387BA1044BB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 21:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE186EA22;
	Wed, 20 Nov 2019 20:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 512 seconds by postgrey-1.36 at gabe;
 Wed, 20 Nov 2019 20:01:41 UTC
Received: from omr1.cc.vt.edu (omr1.cc.ipv6.vt.edu
 [IPv6:2607:b400:92:8300:0:c6:2117:b0e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B375C6EA22
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 20:01:41 +0000 (UTC)
Received: from mr3.cc.vt.edu (mr3.cc.ipv6.vt.edu
 [IPv6:2607:b400:92:8500:0:7f:b804:6b0a])
 by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id xAKJr8KW021610
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 14:53:08 -0500
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mr3.cc.vt.edu (8.14.7/8.14.7) with ESMTP id xAKJr3uM016356
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 14:53:08 -0500
Received: by mail-qt1-f200.google.com with SMTP id x50so637001qth.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 11:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:mime-version
 :content-transfer-encoding:date:message-id;
 bh=Pcz0vZsBN6EW4lKcg2ho+YDFFW6RUHvYufWFKuIJyxQ=;
 b=VuKJIALBYeNGOorM8timnGItMGMwtMCWIySG/YHRPI7zn7EoYm/t9TFBIJcv0kQ0aA
 QkQ+6vxyu/TSJL286zEhZBbKuFPmCecLovxf98Nsj96B+GDCin9tOlO3ki5JNIhcR1oB
 ID38xDpCeIRo4sbBuEKQKu+VNo2LZS8z/ZFU2LZJ+0QDGL6xmql6cWQyoF4oCozdWTNa
 UN0qFwdSFl5NveL4b34T8UolBkEaFDx/YVyfqhEGEP10ozntQQ7pOiCsO3TRFfhzsCEj
 QyXB+CmINF/oZnOiQRZTNi4P2nuk07TCzmCeLsJZO9t3S1cydG8UJkbPY45Ww9wZTW48
 3ebQ==
X-Gm-Message-State: APjAAAXsNR1pLH+K/jCGSHmAncNUKCgF4DL0H46GG2MtEsD6gMqRZlQo
 K4z0tUeQ50sbdVkUrdMNNFBgJZbot7TxzV1ZM5lN66f/UsjlxU19hR7QUxtviinvwjanPQXcFWK
 7au0YWQUIVbRu6jWDgIu8tcC/evke2+//Rh9rq3E=
X-Received: by 2002:ac8:3946:: with SMTP id t6mr2270759qtb.278.1574279582458; 
 Wed, 20 Nov 2019 11:53:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxe7C1h6tJTtd0SA5Jkuld5APhArQsh7ntYw8a3ee9nAIjC9zXPsti0I9UFb/qDeXbPmYQxtw==
X-Received: by 2002:ac8:3946:: with SMTP id t6mr2269374qtb.278.1574279562910; 
 Wed, 20 Nov 2019 11:52:42 -0800 (PST)
Received: from turing-police ([2601:5c0:c001:c9e1::359])
 by smtp.gmail.com with ESMTPSA id y29sm62197qtc.8.2019.11.20.11.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 11:52:41 -0800 (PST)
From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?="
 <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next - DEBUG_MUTEX=y causes message flood
Mime-Version: 1.0
Date: Wed, 20 Nov 2019 14:52:40 -0500
Message-ID: <65415.1574279560@turing-police>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0536536578=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0536536578==
Content-Type: multipart/signed; boundary="==_Exmh_1574279560_2911P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--==_Exmh_1574279560_2911P
Content-Type: text/plain; charset=us-ascii

I haven't narrowed down when this started, other than "sometime between
10/23 and 11/13".  Looks to me like something in the i915/DRM arena doesn't
play nice with mutex debugging.

The system still acts fine, but my /var partition filled up due to gigabytes
of the following two warning calls repeating over and over.  I'm not sure what
triggers it, except that I know that it doesn't start when the Gnome login screen
is displaying, but something after I login starts it complaining.

Nov 17 22:13:16 turing-police kernel: [  163.835592] ------------[ cut here ]------------
Nov 17 22:13:16 turing-police kernel: [  163.835712] WARNING: CPU: 0 PID: 0 at kernel/locking/mutex.c:1419 mutex_trylock+0x13a/0x150
Nov 17 22:13:16 turing-police kernel: [  163.835717] Modules linked in: fuse nf_log_ipv6 ts_bm nf_log_ipv4 nf_log_common xt_string xt_LOG bpfilter sunrpc algif_hash algif_skcipher af_alg bnep vfat fat ath3k btusb btrtl btbcm btintel bluetooth ecdh_generic ecc uas intel_rapl_msr rtsx_pci_sdmmc ath9k ath9k_common ath9k_hw intel_rapl_common intel_soc_dts_thermal intel_soc_dts_iosf intel_powerclamp crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel cryptd serio_raw snd_hda_codec_realtek snd_hda_codec_hdmi ath rtsx_pci bfq fan toshiba_acpi toshiba_bluetooth mei_txe industrialio pwm_lpss_platform i2c_hid rfkill_gpio pwm_lpss sch_fq_codel
Nov 17 22:13:16 turing-police kernel: [  163.835795] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G                T 5.4.0-rc7-next-20191113-dirty #701
Nov 17 22:13:16 turing-police kernel: [  163.835799] Hardware name: TOSHIBA Satellite C55-B/ZBWAA, BIOS 5.00 07/23/2015
Nov 17 22:13:16 turing-police kernel: [  163.835806] RIP: 0010:mutex_trylock+0x13a/0x150
Nov 17 22:13:16 turing-police kernel: [  163.835813] Code: 7b 70 45 31 c9 41 b8 01 00 00 00 31 c9 ba 01 00 00 00 31 f6 e8 87 5e 21 ff 58 48 8d 65 e8 b8 01 00 00 00 5b 41 5c 41 5d 5d c3 <0f> 0b e9 f7 fe ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00
Nov 17 22:13:16 turing-police kernel: [  163.835817] RSP: 0018:ffff989080003d70 EFLAGS: 00010006
Nov 17 22:13:16 turing-police kernel: [  163.835823] RAX: 0000000080010002 RBX: ffff974932946e08 RCX: 00000000ffffffff
Nov 17 22:13:16 turing-police kernel: [  163.835828] RDX: ffffffffb4a2b900 RSI: ffff974934107c88 RDI: ffff974932946e08
Nov 17 22:13:16 turing-police kernel: [  163.835832] RBP: ffff989080003d90 R08: 0000000000000000 R09: 0000000000000000
Nov 17 22:13:16 turing-police kernel: [  163.835837] R10: 0000000000000000 R11: 0000000000000000 R12: ffff974932946e00
Nov 17 22:13:16 turing-police kernel: [  163.835841] R13: ffff989080003e18 R14: ffff989080003e08 R15: ffff97493333ae08
Nov 17 22:13:16 turing-police kernel: [  163.835846] FS:  0000000000000000(0000) GS:ffff974937800000(0000) knlGS:0000000000000000
Nov 17 22:13:16 turing-police kernel: [  163.835850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Nov 17 22:13:16 turing-police kernel: [  163.835855] CR2: 0000560c069bc708 CR3: 0000000088a24000 CR4: 00000000001006f0
Nov 17 22:13:16 turing-police kernel: [  163.835859] Call Trace:
Nov 17 22:13:16 turing-police kernel: [  163.835864]  <IRQ>
Nov 17 22:13:16 turing-police kernel: [  163.835878]  active_retire+0x36/0x70
Nov 17 22:13:16 turing-police kernel: [  163.835886]  node_retire+0x19/0x20
Nov 17 22:13:16 turing-police kernel: [  163.835898]  intel_engine_breadcrumbs_irq+0x296/0x410
Nov 17 22:13:16 turing-police kernel: [  163.835924]  gen6_gt_irq_handler+0x5e/0x130
Nov 17 22:13:16 turing-police kernel: [  163.835935]  valleyview_irq_handler+0x2a1/0x2e0
Nov 17 22:13:16 turing-police kernel: [  163.835956]  __handle_irq_event_percpu+0x40/0x2c0
Nov 17 22:13:16 turing-police kernel: [  163.835962]  ? handle_irq_event+0x2c/0x53
Nov 17 22:13:16 turing-police kernel: [  163.835977]  handle_irq_event_percpu+0x32/0x90
Nov 17 22:13:16 turing-police kernel: [  163.835990]  handle_irq_event+0x34/0x53
Nov 17 22:13:16 turing-police kernel: [  163.836002]  handle_edge_irq+0x95/0x1d0
Nov 17 22:13:16 turing-police kernel: [  163.836012]  do_IRQ+0x83/0x190
Nov 17 22:13:16 turing-police kernel: [  163.836023]  common_interrupt+0xf/0xf
Nov 17 22:13:16 turing-police kernel: [  163.836029]  </IRQ>
Nov 17 22:13:16 turing-police kernel: [  163.836036] RIP: 0010:cpuidle_enter_state+0xc3/0x610
Nov 17 22:13:16 turing-police kernel: [  163.836041] Code: 00 00 31 ff e8 3e 0b 65 ff 80 7d c0 00 74 12 9c 58 f6 c4 02 0f 85 6e 03 00 00 31 ff e8 66 ff 6c ff e8 11 93 73 ff fb 45 85 ed <0f> 88 b4 02 00 00 4d 63 f5 49 83 fe 09 0f 87 83 04 00 00 49 6b c6
Nov 17 22:13:16 turing-police kernel: [  163.836046] RSP: 0018:ffffffffb4a03d80 EFLAGS: 00000206 ORIG_RAX: ffffffffffffffdc
Nov 17 22:13:16 turing-police kernel: [  163.836052] RAX: ffffffffb4a2b900 RBX: ffffb8907fa10030 RCX: 0000000000000000
Nov 17 22:13:16 turing-police kernel: [  163.836056] RDX: 0000000000000019 RSI: 0000000000000006 RDI: ffffffffb4a2b900
Nov 17 22:13:16 turing-police kernel: [  163.836060] RBP: ffffffffb4a03dd0 R08: 000000262554d345 R09: 0000000000000000
Nov 17 22:13:16 turing-police kernel: [  163.836065] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffffb4b76560
Nov 17 22:13:16 turing-police kernel: [  163.836069] R13: 0000000000000003 R14: 0000000000000003 R15: 0000000000000003
Nov 17 22:13:16 turing-police kernel: [  163.836111]  cpuidle_enter+0x29/0x40
Nov 17 22:13:16 turing-police kernel: [  163.836122]  call_cpuidle+0x36/0x60
Nov 17 22:13:16 turing-police kernel: [  163.836132]  do_idle+0x1c0/0x210
Nov 17 22:13:16 turing-police kernel: [  163.836149]  cpu_startup_entry+0x1b/0x1d
Nov 17 22:13:16 turing-police kernel: [  163.836158]  rest_init+0x1bf/0x2eb
Nov 17 22:13:16 turing-police kernel: [  163.836170]  arch_call_rest_init+0x11/0x63
Nov 17 22:13:16 turing-police kernel: [  163.836179]  start_kernel+0x7bf/0x7ef
Nov 17 22:13:16 turing-police kernel: [  163.836194]  x86_64_start_reservations+0x4f/0x70
Nov 17 22:13:16 turing-police kernel: [  163.836204]  x86_64_start_kernel+0x7b/0x9e
Nov 17 22:13:16 turing-police kernel: [  163.836214]  secondary_startup_64+0xa4/0xb0
Nov 17 22:13:16 turing-police kernel: [  163.836242] irq event stamp: 451082
Nov 17 22:13:16 turing-police kernel: [  163.836249] hardirqs last  enabled at (451079): [<ffffffffb3b09bff>] cpuidle_enter_state+0xbf/0x610
Nov 17 22:13:16 turing-police kernel: [  163.836254] hardirqs last disabled at (451080): [<ffffffffb3002e6a>] trace_hardirqs_off_thunk+0x1a/0x1c
Nov 17 22:13:16 turing-police kernel: [  163.836261] softirqs last  enabled at (451082): [<ffffffffb3116f1c>] _local_bh_enable+0x1c/0x30
Nov 17 22:13:16 turing-police kernel: [  163.836267] softirqs last disabled at (451081): [<ffffffffb31174f0>] irq_enter+0x50/0x70
Nov 17 22:13:16 turing-police kernel: [  163.836272] ---[ end trace 2e91f38e14c84d13 ]---
Nov 17 22:13:16 turing-police kernel: [  163.836341] ------------[ cut here ]------------
Nov 17 22:13:16 turing-police kernel: [  163.836455] WARNING: CPU: 0 PID: 0 at kernel/locking/mutex.c:737 mutex_unlock+0x27/0x40
Nov 17 22:13:16 turing-police kernel: [  163.836459] Modules linked in: fuse nf_log_ipv6 ts_bm nf_log_ipv4 nf_log_common xt_string xt_LOG bpfilter sunrpc algif_hash algif_skcipher af_alg bnep vfat fat ath3k btusb btrtl btbcm btintel bluetooth ecdh_generic ecc uas intel_rapl_msr rtsx_pci_sdmmc ath9k ath9k_common ath9k_hw intel_rapl_common intel_soc_dts_thermal intel_soc_dts_iosf intel_powerclamp crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel cryptd serio_raw snd_hda_codec_realtek snd_hda_codec_hdmi ath rtsx_pci bfq fan toshiba_acpi toshiba_bluetooth mei_txe industrialio pwm_lpss_platform i2c_hid rfkill_gpio pwm_lpss sch_fq_codel
Nov 17 22:13:16 turing-police kernel: [  163.836518] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W       T 5.4.0-rc7-next-20191113-dirty #701
Nov 17 22:13:16 turing-police kernel: [  163.836522] Hardware name: TOSHIBA Satellite C55-B/ZBWAA, BIOS 5.00 07/23/2015
Nov 17 22:13:16 turing-police kernel: [  163.836528] RIP: 0010:mutex_unlock+0x27/0x40
Nov 17 22:13:16 turing-police kernel: [  163.836533] Code: 00 00 00 55 48 89 e5 41 54 49 89 fc 65 8b 05 d8 a6 09 4c a9 00 ff 1f 00 75 10 48 8b 75 08 4c 89 e7 e8 fd fc ff ff 41 5c 5d c3 <0f> 0b 48 8b 75 08 4c 89 e7 e8 eb fc ff ff 41 5c 5d c3 0f 1f 80 00
Nov 17 22:13:16 turing-police kernel: [  163.836538] RSP: 0018:ffff989080003d50 EFLAGS: 00010006
Nov 17 22:13:16 turing-police kernel: [  163.836543] RAX: 0000000080010002 RBX: ffff974934107c88 RCX: 00000000ffffffff
Nov 17 22:13:16 turing-police kernel: [  163.836548] RDX: ffffffffb4a2b900 RSI: ffff974932946e78 RDI: ffff974932946e08
Nov 17 22:13:16 turing-police kernel: [  163.836552] RBP: ffff989080003d58 R08: 0000002625672d76 R09: 0000000000000000
Nov 17 22:13:16 turing-police kernel: [  163.836557] R10: 0000000000000001 R11: 0000000000000000 R12: ffff974932946e08
Nov 17 22:13:16 turing-police kernel: [  163.836561] R13: ffff974932946e00 R14: ffff989080003e08 R15: ffff97493333ae08
Nov 17 22:13:16 turing-police kernel: [  163.836566] FS:  0000000000000000(0000) GS:ffff974937800000(0000) knlGS:0000000000000000
Nov 17 22:13:16 turing-police kernel: [  163.836571] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Nov 17 22:13:16 turing-police kernel: [  163.836575] CR2: 0000560c069bc708 CR3: 0000000088a24000 CR4: 00000000001006f0
Nov 17 22:13:16 turing-police kernel: [  163.836579] Call Trace:
Nov 17 22:13:16 turing-police kernel: [  163.836583]  <IRQ>
Nov 17 22:13:16 turing-police kernel: [  163.836593]  __active_retire+0x67/0x140
Nov 17 22:13:16 turing-police kernel: [  163.836605]  active_retire+0x5f/0x70
Nov 17 22:13:16 turing-police kernel: [  163.836614]  node_retire+0x19/0x20
Nov 17 22:13:16 turing-police kernel: [  163.836622]  intel_engine_breadcrumbs_irq+0x296/0x410
Nov 17 22:13:16 turing-police kernel: [  163.836649]  gen6_gt_irq_handler+0x5e/0x130
Nov 17 22:13:16 turing-police kernel: [  163.836659]  valleyview_irq_handler+0x2a1/0x2e0
Nov 17 22:13:16 turing-police kernel: [  163.836679]  __handle_irq_event_percpu+0x40/0x2c0
Nov 17 22:13:16 turing-police kernel: [  163.836685]  ? handle_irq_event+0x2c/0x53
Nov 17 22:13:16 turing-police kernel: [  163.836699]  handle_irq_event_percpu+0x32/0x90
Nov 17 22:13:16 turing-police kernel: [  163.836712]  handle_irq_event+0x34/0x53
Nov 17 22:13:16 turing-police kernel: [  163.836723]  handle_edge_irq+0x95/0x1d0
Nov 17 22:13:16 turing-police kernel: [  163.836733]  do_IRQ+0x83/0x190
Nov 17 22:13:16 turing-police kernel: [  163.836743]  common_interrupt+0xf/0xf
Nov 17 22:13:16 turing-police kernel: [  163.836749]  </IRQ>
Nov 17 22:13:16 turing-police kernel: [  163.836756] RIP: 0010:cpuidle_enter_state+0xc3/0x610
Nov 17 22:13:16 turing-police kernel: [  163.836761] Code: 00 00 31 ff e8 3e 0b 65 ff 80 7d c0 00 74 12 9c 58 f6 c4 02 0f 85 6e 03 00 00 31 ff e8 66 ff 6c ff e8 11 93 73 ff fb 45 85 ed <0f> 88 b4 02 00 00 4d 63 f5 49 83 fe 09 0f 87 83 04 00 00 49 6b c6
Nov 17 22:13:16 turing-police kernel: [  163.836766] RSP: 0018:ffffffffb4a03d80 EFLAGS: 00000206 ORIG_RAX: ffffffffffffffdc
Nov 17 22:13:16 turing-police kernel: [  163.836772] RAX: ffffffffb4a2b900 RBX: ffffb8907fa10030 RCX: 0000000000000000
Nov 17 22:13:16 turing-police kernel: [  163.836776] RDX: 0000000000000019 RSI: 0000000000000006 RDI: ffffffffb4a2b900
Nov 17 22:13:16 turing-police kernel: [  163.836780] RBP: ffffffffb4a03dd0 R08: 000000262554d345 R09: 0000000000000000
Nov 17 22:13:16 turing-police kernel: [  163.836785] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffffb4b76560
Nov 17 22:13:16 turing-police kernel: [  163.836789] R13: 0000000000000003 R14: 0000000000000003 R15: 0000000000000003
Nov 17 22:13:16 turing-police kernel: [  163.836829]  cpuidle_enter+0x29/0x40
Nov 17 22:13:16 turing-police kernel: [  163.836840]  call_cpuidle+0x36/0x60
Nov 17 22:13:16 turing-police kernel: [  163.836850]  do_idle+0x1c0/0x210
Nov 17 22:13:16 turing-police kernel: [  163.836867]  cpu_startup_entry+0x1b/0x1d
Nov 17 22:13:16 turing-police kernel: [  163.836875]  rest_init+0x1bf/0x2eb
Nov 17 22:13:16 turing-police kernel: [  163.836886]  arch_call_rest_init+0x11/0x63
Nov 17 22:13:16 turing-police kernel: [  163.836895]  start_kernel+0x7bf/0x7ef
Nov 17 22:13:16 turing-police kernel: [  163.836910]  x86_64_start_reservations+0x4f/0x70
Nov 17 22:13:16 turing-police kernel: [  163.836920]  x86_64_start_kernel+0x7b/0x9e
Nov 17 22:13:16 turing-police kernel: [  163.836929]  secondary_startup_64+0xa4/0xb0
Nov 17 22:13:16 turing-police kernel: [  163.836956] irq event stamp: 451082
Nov 17 22:13:16 turing-police kernel: [  163.836963] hardirqs last  enabled at (451079): [<ffffffffb3b09bff>] cpuidle_enter_state+0xbf/0x610
Nov 17 22:13:16 turing-police kernel: [  163.836969] hardirqs last disabled at (451080): [<ffffffffb3002e6a>] trace_hardirqs_off_thunk+0x1a/0x1c
Nov 17 22:13:16 turing-police kernel: [  163.836974] softirqs last  enabled at (451082): [<ffffffffb3116f1c>] _local_bh_enable+0x1c/0x30
Nov 17 22:13:16 turing-police kernel: [  163.836980] softirqs last disabled at (451081): [<ffffffffb31174f0>] irq_enter+0x50/0x70
Nov 17 22:13:16 turing-police kernel: [  163.836984] ---[ end trace 2e91f38e14c84d14 ]---


--==_Exmh_1574279560_2911P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXdWZiAdmEQWDXROgAQI8og/8DpiSVsYLap0idVZopDEkDMnHqkEBdJAA
FR+qgCTAGAr3toAZZKAO3PKUfb73aALKOusUtv6XXJ6Z4MUgJnbDr/ZKzoA/9/Gq
MDVei2xiipbUOQDVhhFUVZStJbLXBA+9J4G1nARKuGzTB5o9jCYcJKxCB9OxhF5Q
QGy4kDJie0F+irFYaFTT4Tbs7L2mUxEtP2Ls6j7sDaC15LI5cbPCMpwd5XdAKAiW
6ekOoiDb+1p2FWkTpxMDHymu4F0o/xwRzyGJT9nXM4VT+BBtdozLs/iQJvRJs8d4
Bm/inzDqdCm2njDItytdRWXAvjCPWw9wDocgHPqUyT7hyn8XnP5cwpaBvhhQkWzq
4VS42+Jnl1dc+udb6TCdSkAkOheqZW3EyqH3wo6iXpD4PB1sFYOpD9T+6ORh1jle
lSyiAb8arwvOm73ziP+ZdDViFGpC7DFodk2vu4Cow5Ow1ICU1OY/qHTA+9fAYXHt
NegB9WPiYAnFM73Pws7+fHVYl8CSxStyZz0nI40stWhNkoKaRC7eWpzBpmVQFIwB
ky9fAxl66tXt7Y4A49p17y5cT2+EWB7olAkZQ94X4qLyvDFVlyrEF8sFbssNmdBZ
vjbnASo+Bh1niyKSrV+vzlaamv3JcRVpP7Zl/KBPONG8hZfKM2xjJnA482noogUO
MFEhgb/tNKA=
=t+5I
-----END PGP SIGNATURE-----

--==_Exmh_1574279560_2911P--

--===============0536536578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0536536578==--
