Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C3977BFA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 11:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DF910E120;
	Fri, 13 Sep 2024 09:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWWnypLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA6610E120
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 09:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726218794; x=1757754794;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Gco1mA0rl1TQS/IgAQwQrJepeGCITtEtV/Z4tZJaoOU=;
 b=DWWnypLyO+No3s8LfZ4k334WhaHMNwf0gCKD0D63OHeMMjF5xvl/ytkV
 iz34SGpkf7/jSGYzQ2erB6b9KI/Xvh/ldKYyHJ2kAmTsjiZL7uH/A+uu+
 /kNVjS7Yajw/M0dsA/PLBY3amQrKMibh/P3RaA6aEzyuXKaCK8ucTRN9S
 W64fYvShZWdQmBg3XMOlSp1o5K2S+NKV6it6gtEa8D5PJKuoVCaAZEDlr
 ohKftxrNCeKSLV0PiBnHifwsa3jodxe77bj5WIhbm7+wfdE5Xal67ENXJ
 H/wgnAQBhIzSgPG8Wklx5uIW3ftN9mPU1HzBXJu3zsDiH+j1AHJcL0fjn g==;
X-CSE-ConnectionGUID: i/FShWWsTXWa6i/9CZyCAA==
X-CSE-MsgGUID: bBjoLW/cR16IumKsR7lV2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="13509043"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="13509043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 02:13:13 -0700
X-CSE-ConnectionGUID: wnzCKiNnQwa7xcvi1QAu2w==
X-CSE-MsgGUID: pdcFFz0EQgyuPLgzNV5i9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="68496163"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.64])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 02:13:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Carlos Eduardo Gallo Filho
 <gcarlos@disroot.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?utf-8?Q?Ma?=
 =?utf-8?Q?=C3=ADra?= Canal
 <mairacanal@riseup.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, Arthur
 Grillo <arthurgrillo@riseup.net>, Tales Lelo da Aparecida
 <tales.aparecida@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 RESEND 0/9] Increase coverage on drm_framebuffer.c
In-Reply-To: <20240913-sly-chameleon-of-love-e6531f@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240911001559.28284-1-gcarlos@disroot.org>
 <172605715531.956551.13163712003461695066.b4-ty@kernel.org>
 <87ttekdn7n.fsf@intel.com> <20240913-sly-chameleon-of-love-e6531f@houat>
Date: Fri, 13 Sep 2024 12:13:04 +0300
Message-ID: <87plp7ex27.fsf@intel.com>
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

On Fri, 13 Sep 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Fri, Sep 13, 2024 at 10:31:08AM GMT, Jani Nikula wrote:
>> On Wed, 11 Sep 2024, Maxime Ripard <mripard@kernel.org> wrote:
>> > On Tue, 10 Sep 2024 21:15:25 -0300, Carlos Eduardo Gallo Filho wrote:
>> >> This patchset includes new KUnit tests for 5 untested functions from
>> >> drm_framebuffer.c and improvements to the existent one.
>> >> 
>> >> The first patch replace the use of dev_private member from drm_device
>> >> mock on the existent test by embedding it into an outer struct containing
>> >> a generic pointer.
>> >> 
>> >> [...]
>> >
>> > Applied to misc/kernel.git (drm-misc-next).
>> 
>> How was this series itself tested? It would be prudent to Cc: intel-gfx
>> on stuff like this to run it through our CI. I don't think it ever
>> passed [1].
>
> I'm not sure what's going on, but:
>
> ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm//tests
>
> Works like a charm with this series

We consistently hit the below warning in drm_framebuffer_free().

Looks like drm_test_framebuffer_free() fails to initialize the
framebuffer, there's no call to drm_framebuffer_init(), leaving
fb->filp_head list uninitialized. The list_empty() check in
drm_framebuffer_free() blows up. Why it doesn't fail for you, I don't
understand.

BR,
Jani.



<4> [131.574236] ------------[ cut here ]------------
<4> [131.574244] drm-kunit-mock-device drm_test_framebuffer_free.drm-kunit-mock-device: [drm] drm_WARN_ON(!list_empty(&fb->filp_head))
<4> [131.574269] WARNING: CPU: 8 PID: 1261 at drivers/gpu/drm/drm_framebuffer.c:832 drm_framebuffer_free+0x71/0x80
<4> [131.574281] Modules linked in: drm_framebuffer_test drm_kunit_helpers kunit vgem drm_shmem_helper snd_hda_codec_hdmi r8153_ecm cdc_ether usbnet i915 x86_pkg_temp_thermal coretemp kvm_intel kvm snd_hda_intel snd_intel_dspcfg mei_gsc_proxy snd_hda_codec prime_numbers crct10dif_pclmul r8152 snd_hwdep i2c_algo_bit crc32_pclmul wmi_bmof mii ghash_clmulni_intel ttm e1000e snd_hda_core video i2c_i801 mei_me drm_display_helper ptp i2c_mux snd_pcm thunderbolt mei drm_buddy pps_core i2c_smbus intel_lpss_pci wmi [last unloaded: drm_framebuffer_test]
<4> [131.574378] CPU: 8 UID: 0 PID: 1261 Comm: kunit_try_catch Tainted: G                 N 6.11.0-rc7-CI_DRM_15393-g2c6794afc551+ #1
<4> [131.574386] Tainted: [N]=TEST
<4> [131.574389] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
<4> [131.574393] RIP: 0010:drm_framebuffer_free+0x71/0x80
<4> [131.574400] Code: 4c 8b 6f 50 4d 85 ed 75 03 4c 8b 2f e8 48 c5 03 00 48 c7 c1 88 00 4f 82 4c 89 ea 48 c7 c7 53 8f 45 82 48 89 c6 e8 1f be 80 ff <0f> 0b eb ad 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
<4> [131.574405] RSP: 0018:ffffc900013efd60 EFLAGS: 00010282
<4> [131.574413] RAX: 0000000000000000 RBX: ffffc900013efdc8 RCX: 0000000000000000
<4> [131.574418] RDX: 0000000000000002 RSI: ffffffff8243ccc2 RDI: 00000000ffffffff
<4> [131.574422] RBP: ffff8881190f9000 R08: 0000000000000000 R09: ffffc900013efb90
<4> [131.574425] R10: 0000000000000001 R11: 0000000000000001 R12: ffffc900013efda0
<4> [131.574429] R13: ffff888114cb9b40 R14: ffffffffa030e520 R15: ffffc9000169f8e0
<4> [131.574434] FS:  0000000000000000(0000) GS:ffff88885fc00000(0000) knlGS:0000000000000000
<4> [131.574441] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [131.574448] CR2: 000055cc6f2feed0 CR3: 000000000663a002 CR4: 0000000000f70ef0
<4> [131.574455] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
<4> [131.574463] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
<4> [131.574470] PKRU: 55555554
<4> [131.574477] Call Trace:
<4> [131.574483]  <TASK>
<4> [131.574491]  ? __warn+0x8c/0x190
<4> [131.574505]  ? drm_framebuffer_free+0x71/0x80
<4> [131.574518]  ? report_bug+0x1f8/0x200
<4> [131.574535]  ? prb_read_valid+0x16/0x20
<4> [131.574553]  ? handle_bug+0x3c/0x70
<4> [131.574566]  ? exc_invalid_op+0x18/0x70
<4> [131.574579]  ? asm_exc_invalid_op+0x1a/0x20
<4> [131.574593]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 [kunit]
<4> [131.574636]  ? drm_framebuffer_free+0x71/0x80
<4> [131.574658]  drm_test_framebuffer_free+0x88/0x220 [drm_framebuffer_test]
<4> [131.574709]  kunit_try_run_case+0x6d/0x150 [kunit]
<4> [131.574724]  ? __kthread_parkme+0x31/0xa0
<4> [131.574732]  ? lockdep_hardirqs_on+0x7b/0x100
<4> [131.574744]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 [kunit]
<4> [131.574757]  kunit_generic_run_threadfn_adapter+0x19/0x40 [kunit]
<4> [131.574771]  kthread+0xeb/0x120
<4> [131.574779]  ? __pfx_kthread+0x10/0x10
<4> [131.574788]  ret_from_fork+0x2c/0x50
<4> [131.574796]  ? __pfx_kthread+0x10/0x10
<4> [131.574803]  ret_from_fork_asm+0x1a/0x30
<4> [131.574821]  </TASK>
<4> [131.574824] irq event stamp: 1017
<4> [131.574829] hardirqs last  enabled at (1023): [<ffffffff8113ec40>] console_unlock+0x110/0x120
<4> [131.574841] hardirqs last disabled at (1028): [<ffffffff8113ec25>] console_unlock+0xf5/0x120
<4> [131.574851] softirqs last  enabled at (14): [<ffffffff810a492c>] handle_softirqs+0x2ec/0x3f0
<4> [131.574859] softirqs last disabled at (5): [<ffffffff810a50a7>] irq_exit_rcu+0x87/0xc0
<4> [131.574867] ---[ end trace 0000000000000000 ]---


-- 
Jani Nikula, Intel
