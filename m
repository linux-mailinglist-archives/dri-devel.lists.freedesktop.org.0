Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9038695483
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 00:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157D710E77D;
	Mon, 13 Feb 2023 23:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1021010E77C;
 Mon, 13 Feb 2023 23:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676329861; x=1707865861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+OOJhXsdORv5qdQe7lPU+r/ruC4YuUEBMXYojRRvm5U=;
 b=jnqbiahWC/aNNLm0IHswRT5m2V6ZB8zvUZ5YUCUEQAc52uglO/0iYhjX
 xkh+ZfdhAsB6qZmUfm/godmtD5hbcgeokOOIz82fkpggMTvi7kD8mT0rR
 iEBM3SCPOayv/0t8yPhAh3rzy3vpngebWndIfWbDJsfGblMJFSTLcp8Jk
 6ao3vbpuoT7C8vZJGMrJ55JNRoYTMdMHroSi1rVduSEM1b0z2eB+5ewla
 c7BaSkg+ByrDHYfF6udDLnPPGkAoCjIj35biQF4RMv5OBzB003lgqvoaV
 Au/xZHfkI5M4E89P8vExGYXzHyUbzFgrAAYIUjBtIyfEAlraF1/2C5vGx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="319050259"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="319050259"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 15:11:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="618810751"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="618810751"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.19.172])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 15:10:56 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: =?UTF-8?B?4pyX?= Fi.CI.BAT: failure for drm/i915/active:
 Serialize access to barrier tasks lists
Date: Tue, 14 Feb 2023 00:10:53 +0100
Message-ID: <1769743.TLkxdtWsSY@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <167631293081.20214.8686327131613371860@emeril.freedesktop.org>
References: <20230213164912.51132-1-janusz.krzysztofik@linux.intel.com>
 <167631293081.20214.8686327131613371860@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, 13 February 2023 19:28:50 CET Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/active: Serialize access to barrier tasks lists
> URL   : https://patchwork.freedesktop.org/series/113962/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12732 -> Patchwork_113962v1
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_113962v1 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_113962v1, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/index.html
> 
> Participating hosts (37 -> 37)
> ------------------------------
> 
>   Additional (2): fi-kbl-soraka bat-atsm-1 
>   Missing    (2): fi-snb-2520m fi-pnv-d510 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_113962v1:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@gem_barrier_race@remote-request@rcs0} (NEW):
>     - fi-cfl-guc:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-cfl-guc/igt@gem_barrier_race@remote-request@rcs0.html

A tracker believed to be a preallocated barrier has been apparently modified 
by another thread.  I believe this should be addressed by the other patch, 
"drm/i915/active: Fix misuse of non-idle barriers as fence trackers".

<0> [71.858197] kworker/-121       2..... 47434813us : barrier_to_ll.part.0: barrier_to_ll:50 GEM_BUG_ON(!is_barrier(&node->base))
<0> [71.858233] ---------------------------------
<7> [71.858990] i915 0000:00:02.0: [drm:i915_oa_stream_init.isra.0 [i915]] opening stream oa config uuid=d3c99326-e161-4e44-9745-7772bdc579c5
<4> [71.859197] ------------[ cut here ]------------
<2> [71.859200] kernel BUG at drivers/gpu/drm/i915/i915_active.c:50!
<4> [71.859223] irq event stamp: 2086064
<4> [71.859223] invalid opcode: 0000 [#1] PREEMPT SMP PTI
<4> [71.859225] CPU: 2 PID: 121 Comm: kworker/2:2 Tainted: G     U  W          6.2.0-rc7-Patchwork_113962v1-gf0c0bf045b5d+ #1
<4> [71.859229] hardirqs last  enabled at (2086063): [<ffffffff81c90c88>] _raw_spin_unlock_irqrestore+0x58/0x70
<4> [71.859236] Hardware name: Micro-Star International Co., Ltd. MS-7B54/Z370M MORTAR (MS-7B54), BIOS 1.10 12/28/2017
<4> [71.859241] hardirqs last disabled at (2086064): [<ffffffff81c90986>] _raw_spin_lock_irqsave+0x56/0x60
<4> [71.859251] softirqs last  enabled at (2085096): [<ffffffff81c92000>] __do_softirq+0x300/0x469
<4> [71.859259] softirqs last disabled at (2085091): [<ffffffff810d0bfe>] irq_exit_rcu+0xae/0xf0
<4> [71.859246] Workqueue: events engine_retire [i915]
<4> [71.859384] RIP: 0010:barrier_to_ll.part.0+0x6b/0x6d [i915]
<4> [71.859562] Code: 00 48 c7 c2 50 91 64 a0 48 c7 c7 96 75 60 a0 e8 c5 42 be e0 bf 01 00 00 00 e8 9b 0c be e0 31 f6 bf 09 00 00 00 e8 df 05 ac e0 <0f> 0b 66 0f 1f 00 f3 0f 1e fa f3 0f 1e fa f3 0f 1e fa f3 0f 1e fa
<4> [71.859575] RSP: 0018:ffffc90000f37d80 EFLAGS: 00010246
<4> [71.859581] RAX: 0000000000000240 RBX: ffff88810be1a000 RCX: 0000000000000006
<4> [71.859588] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000009
<4> [71.859593] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
<4> [71.859599] R10: 0000000001b93b58 R11: 0000000001b93bd8 R12: ffff888112aa99d8
<4> [71.859605] R13: ffff888112aa9a70 R14: 0000000000000206 R15: ffff88810825a260
<4> [71.859611] FS:  0000000000000000(0000) GS:ffff888266500000(0000) knlGS:0000000000000000
<4> [71.859618] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [71.859624] CR2: 00007fbf6e85d3e8 CR3: 0000000006612004 CR4: 00000000003706e0
<4> [71.859629] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
<4> [71.859634] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
<4> [71.859640] Call Trace:
<4> [71.859642]  <TASK>
<4> [71.859645]  i915_active_acquire_barrier.cold+0x15/0x104 [i915]

>     - fi-kbl-guc:         NOTRUN -> [ABORT][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-kbl-guc/igt@gem_barrier_race@remote-request@rcs0.html

Reported a few months ago by igt@perf@stress-open-close under 
https://gitlab.freedesktop.org/drm/intel/-/issues/5386, closed as not 
reproducible.  Not a regression, I believe.

> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-kbl-soraka/igt@i915_selftest@live@hangcheck.html

Incomplete igt@i915_selftest@live@hangcheck with no serial log is a known 
issue, not related to this change, I believe.

No timeout on infinite __i915_active_wait() this time.

Let me resubmit in series with the other patch.

Thanks,
Janusz

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_12732 and Patchwork_113962v1:
> 
> ### New IGT tests (2) ###
> 
>   * igt@gem_barrier_race@remote-request:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_barrier_race@remote-request@rcs0:
>     - Statuses : 2 abort(s) 30 pass(s) 3 skip(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_113962v1 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@fbdev@write:
>     - fi-blb-e6850:       [PASS][4] -> [SKIP][5] ([fdo#109271]) +4 similar issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12732/fi-blb-e6850/igt@fbdev@write.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-blb-e6850/igt@fbdev@write.html
> 
>   * {igt@gem_barrier_race@remote-request@rcs0} (NEW):
>     - fi-blb-e6850:       NOTRUN -> [SKIP][6] ([fdo#109271])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-blb-e6850/igt@gem_barrier_race@remote-request@rcs0.html
>     - fi-ivb-3770:        NOTRUN -> [SKIP][7] ([fdo#109271])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-ivb-3770/igt@gem_barrier_race@remote-request@rcs0.html
>     - fi-ilk-650:         NOTRUN -> [SKIP][8] ([fdo#109271])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-ilk-650/igt@gem_barrier_race@remote-request@rcs0.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#2190])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][11] ([i915#5334] / [i915#7872])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][12] ([i915#1886])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][13] ([fdo#109271]) +15 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-kbl-soraka/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][14] ([i915#7828])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-rkl-11600/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_suspend@basic-s0@lmem0:
>     - {bat-dg2-11}:       [INCOMPLETE][15] -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12732/bat-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/bat-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - fi-rkl-11600:       [ABORT][17] -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12732/fi-rkl-11600/igt@i915_suspend@basic-s2idle-without-i915.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/fi-rkl-11600/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
>   [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
>   [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
>   [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
>   [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
>   [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
>   [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
>   [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
>   [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
>   [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7160 -> TrybotIGT_706
>   * Linux: CI_DRM_12732 -> Patchwork_113962v1
> 
>   CI-20190529: 20190529
>   CI_DRM_12732: f0c0bf045b5ddf97f246d22ed9b658d16e798c77 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_7160: 45da871dd2684227e93a2fc002b87dfc58bd5fd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_113962v1: f0c0bf045b5ddf97f246d22ed9b658d16e798c77 @ git://anongit.freedesktop.org/gfx-ci/linux
>   TrybotIGT_706: https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_706/index.html
> 
> 
> ### Linux commits
> 
> 9d62bd9a2877 drm/i915/active: Serialize access to barrier tasks lists
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113962v1/index.html
> 




