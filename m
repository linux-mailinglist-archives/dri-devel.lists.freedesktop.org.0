Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 643607A4AED
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 15:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F03410E2CD;
	Mon, 18 Sep 2023 13:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED8D10E2CA;
 Mon, 18 Sep 2023 13:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695045367; x=1726581367;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=yMTPamUHQ5QG7U4xQA4MiEFpIMT8wObYkfknU6MztQU=;
 b=JS2feB4oASU+nNpl00DoIPsCmXxDndIUNCjcdfF0iqdCr7lWovfZbTnc
 lAi05eJM6Lhix9/7mbMDCZWzMisWleXUmSeW9EzlJt8bWYm0qt2lPTSIe
 eXUBPjGoKgmodLGuedHbnadK1e0RQOTa6XaMxf++nc/1XHZVQiRpju2UK
 peaKMgu5EEbVOxx/ij6AiUFduQvxva0IcrtZYuAD81AIemjGMTOsxvK0Q
 mbH5JJE5SH8n20kBaGynBziWkNuORXkmMIvuzy8PUOqy4P/Ok8QKLZRj/
 H/z3HRHFOYrW77d9XH41vwwf3wwX6K2CARKgxBZxpDpeygycxlLYCXSCV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466007931"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="466007931"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="992722140"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="992722140"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:55:43 -0700
Date: Mon, 18 Sep 2023 16:56:04 +0300
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?=
 =?utf-8?Q?e_for_series_starting_with_=5B1=2F4?= =?utf-8?Q?=5D?= drm/dp_mst:
 Fix NULL dereference during payload addition
Message-ID: <ZQhW9EbnLE1zIK5U@ideak-desk.fi.intel.com>
References: <20230913223218.540365-1-imre.deak@intel.com>
 <169467130979.29164.4108537547578448698@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169467130979.29164.4108537547578448698@emeril.freedesktop.org>
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
Reply-To: imre.deak@intel.com
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 06:01:49AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/4] drm/dp_mst: Fix NULL dereference during payload addition
> URL   : https://patchwork.freedesktop.org/series/123652/
> State : failure

Thanks for the reviews, patches 1-3 are pushed to drm-misc-next and
patch 4 to drm-intel-next.

All the failures below are unrelated, since none of the affected
platforms has MST sinks.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13627_full -> Patchwork_123652v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_123652v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_123652v1_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (9 -> 10)
> ------------------------------
> 
>   Additional (1): shard-rkl0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_123652v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-apl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-apl3/igt@gen9_exec_parse@allowed-all.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-apl6/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-glk:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-glk7/igt@gen9_exec_parse@allowed-single.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-glk6/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64:
>     - shard-mtlp:         [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-mtlp-6/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-5/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-rkl:          [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-rkl-4/igt@kms_rotation_crc@sprite-rotation-90.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-rkl-7/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-mtlp:         NOTRUN -> [ABORT][9]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@perf_pmu@rc6-all-gts.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_feature_discovery@display-4x}:
>     - shard-mtlp:         NOTRUN -> [SKIP][10]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@kms_feature_discovery@display-4x.html
> 
>   * {igt@kms_feature_discovery@dp-mst}:
>     - shard-dg2:          NOTRUN -> [SKIP][11]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_feature_discovery@dp-mst.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_13627_full and Patchwork_123652v1_full:
> 
> ### New IGT tests (4) ###
> 
>   * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-hdmi-a-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_123652v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@drm_fdinfo@most-busy-check-all@bcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8414]) +21 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@drm_fdinfo@most-busy-check-all@bcs0.html
> 
>   * igt@drm_fdinfo@virtual-busy-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8414]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@drm_fdinfo@virtual-busy-hang.html
> 
>   * igt@drm_mm@drm_mm_test:
>     - shard-snb:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#8661]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-snb7/igt@drm_mm@drm_mm_test.html
> 
>   * igt@gem_busy@semaphore:
>     - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#3936])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@gem_busy@semaphore.html
> 
>   * igt@gem_ctx_freq@sysfs@gt0:
>     - shard-dg2:          [PASS][16] -> [FAIL][17] ([i915#6786])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg2-3/igt@gem_ctx_freq@sysfs@gt0.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@gem_ctx_freq@sysfs@gt0.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@rcs0:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][18] ([i915#8841]) +4 other tests dmesg-warn
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-snb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> 
>   * igt@gem_ctx_isolation@preservation@ccs0:
>     - shard-mtlp:         [PASS][19] -> [ABORT][20] ([i915#9262]) +1 other test abort
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-mtlp-8/igt@gem_ctx_isolation@preservation@ccs0.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-2/igt@gem_ctx_isolation@preservation@ccs0.html
> 
>   * igt@gem_ctx_persistence@heartbeat-many:
>     - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#8555])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@gem_ctx_persistence@heartbeat-many.html
> 
>   * igt@gem_ctx_persistence@heartbeat-stop:
>     - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8555])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-stop.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
>     - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#5882]) +9 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#280]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_eio@hibernate:
>     - shard-dg1:          [PASS][25] -> [ABORT][26] ([i915#7975] / [i915#8213])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg1-18/igt@gem_eio@hibernate.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg1-14/igt@gem_eio@hibernate.html
>     - shard-tglu:         [PASS][27] -> [ABORT][28] ([i915#7975] / [i915#8213] / [i915#8398])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-tglu-7/igt@gem_eio@hibernate.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-tglu-10/igt@gem_eio@hibernate.html
> 
>   * igt@gem_exec_capture@capture-invisible@lmem0:
>     - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#6334]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@gem_exec_capture@capture-invisible@lmem0.html
> 
>   * igt@gem_exec_endless@dispatch@bcs0:
>     - shard-tglu:         [PASS][30] -> [TIMEOUT][31] ([i915#3778] / [i915#7921])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-tglu-7/igt@gem_exec_endless@dispatch@bcs0.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-tglu-7/igt@gem_exec_endless@dispatch@bcs0.html
> 
>   * igt@gem_exec_fair@basic-none-rrul:
>     - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539] / [i915#4852]) +2 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@gem_exec_fair@basic-none-rrul.html
> 
>   * igt@gem_exec_fair@basic-none-solo:
>     - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4473])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@gem_exec_fair@basic-none-solo.html
> 
>   * igt@gem_exec_fair@basic-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#3539])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@gem_exec_fair@basic-sync.html
> 
>   * igt@gem_exec_fence@submit3:
>     - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#4812]) +2 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@gem_exec_fence@submit3.html
> 
>   * igt@gem_exec_gttfill@multigpu-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#7697]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@gem_exec_gttfill@multigpu-basic.html
> 
>   * igt@gem_exec_reloc@basic-write-read-active:
>     - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#3281]) +20 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html
> 
>   * igt@gem_exec_reloc@basic-write-read-noreloc:
>     - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#3281])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@gem_exec_reloc@basic-write-read-noreloc.html
> 
>   * igt@gem_exec_schedule@preempt-queue-chain:
>     - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4537] / [i915#4812])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-chain.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-y:
>     - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4860]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@gem_fence_thrash@bo-write-verify-y.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#4613])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-glk1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4613]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [PASS][43] -> [TIMEOUT][44] ([i915#5493])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_mmap_gtt@basic-write-read:
>     - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4077]) +7 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@gem_mmap_gtt@basic-write-read.html
> 
>   * igt@gem_mmap_wc@copy:
>     - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4083]) +5 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@gem_mmap_wc@copy.html
> 
>   * igt@gem_mmap_wc@fault-concurrent:
>     - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4083])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@gem_mmap_wc@fault-concurrent.html
> 
>   * igt@gem_partial_pwrite_pread@write-uncached:
>     - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#3282])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@gem_partial_pwrite_pread@write-uncached.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-1:
>     - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4270]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@gem_pxp@reject-modify-context-protection-off-1.html
> 
>   * igt@gem_readwrite@beyond-eob:
>     - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3282]) +2 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@gem_readwrite@beyond-eob.html
> 
>   * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#8428]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4079]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4885])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4077]) +14 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@gem_tiled_swapping@non-threaded.html
> 
>   * igt@gem_userptr_blits@coherency-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3297]) +3 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@gem_userptr_blits@coherency-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#3297]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-busy:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3297] / [i915#4880]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
> 
>   * igt@gem_userptr_blits@vma-merge:
>     - shard-dg2:          NOTRUN -> [FAIL][58] ([i915#3318])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@gem_userptr_blits@vma-merge.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#2856]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#2856]) +2 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@i915_hangman@gt-error-state-capture@vecs0:
>     - shard-mtlp:         [PASS][61] -> [DMESG-WARN][62] ([i915#9262])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-mtlp-1/igt@i915_hangman@gt-error-state-capture@vecs0.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-4/igt@i915_hangman@gt-error-state-capture@vecs0.html
> 
>   * igt@i915_module_load@load:
>     - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#6227])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@i915_module_load@load.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-mtlp:         [PASS][64] -> [ABORT][65] ([i915#8489] / [i915#8668])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_rpm@dpms-lpsp:
>     - shard-rkl:          [PASS][66] -> [SKIP][67] ([i915#1397]) +3 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-rkl-6/igt@i915_pm_rpm@dpms-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp:
>     - shard-dg1:          [PASS][68] -> [SKIP][69] ([i915#1397])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg1-12/igt@i915_pm_rpm@modeset-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#1397]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp:
>     - shard-dg2:          [PASS][71] -> [SKIP][72] ([i915#1397])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg2-11/igt@i915_pm_rpm@modeset-non-lpsp.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-pc8-residency-stress:
>     - shard-dg2:          NOTRUN -> [SKIP][73] ([fdo#109506])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          [PASS][74] -> [INCOMPLETE][75] ([i915#7790])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-snb5/igt@i915_pm_rps@reset.html
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-snb4/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-rkl:          [PASS][76] -> [FAIL][77] ([fdo#103375])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_addfb_basic@basic-x-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4212]) +3 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_addfb_basic@basic-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4215] / [i915#5190])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-4-4-mc_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#8709]) +11 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-4-4-mc_ccs.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#8502]) +7 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs.html
> 
>   * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [FAIL][82] ([i915#8247]) +3 other tests fail
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#6228])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#1769] / [i915#3555])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-mtlp:         NOTRUN -> [SKIP][85] ([fdo#111614])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg2:          NOTRUN -> [SKIP][86] ([fdo#111614]) +5 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-mtlp:         NOTRUN -> [SKIP][87] ([fdo#111615]) +3 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#5190]) +19 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#4538] / [i915#5190]) +5 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
>     - shard-glk:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#3886])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-glk1/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
>     - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#3886] / [i915#6095]) +4 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#5354]) +58 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#3689] / [i915#3886] / [i915#5354]) +9 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#6095]) +11 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#3689] / [i915#5354]) +29 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>     - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#4087] / [i915#7213]) +3 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#7828]) +3 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-mtlp:         NOTRUN -> [SKIP][98] ([fdo#111827])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([fdo#111827]) +3 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#7828]) +11 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-glk:          NOTRUN -> [SKIP][101] ([fdo#109271]) +25 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-glk1/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@mei_interface:
>     - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#7118]) +2 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@kms_content_protection@mei_interface.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#6944])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#3359]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#3555] / [i915#8814])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#3359]) +1 other test skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][107] ([fdo#109274] / [fdo#111767] / [i915#5354])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#3546]) +4 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#4103] / [i915#4213]) +2 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-mtlp:         NOTRUN -> [FAIL][110] ([i915#8248])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][111] ([fdo#109274] / [i915#5354]) +8 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [PASS][112] -> [FAIL][113] ([i915#2346])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#8812])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-wc.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#3555] / [i915#3840]) +1 other test skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#3555] / [i915#3840])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#3469])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#3637])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-snb:          NOTRUN -> [SKIP][119] ([fdo#109271] / [fdo#111767])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-snb7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#8381])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][121] ([fdo#109274] / [fdo#111767])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-dg2:          NOTRUN -> [SKIP][122] ([fdo#109274]) +10 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#2672])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#2672]) +5 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#2672] / [i915#3555])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
>     - shard-dg2:          [PASS][126] -> [FAIL][127] ([i915#6880]) +1 other test fail
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
>     - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#1825]) +17 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
>     - shard-dg2:          NOTRUN -> [FAIL][129] ([i915#6880]) +1 other test fail
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#8708]) +19 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>     - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#3458]) +29 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#8708]) +6 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#3555] / [i915#8228]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#3555] / [i915#8228])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#3555] / [i915#8228]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>     - shard-dg2:          NOTRUN -> [SKIP][136] ([fdo#109289]) +7 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [ABORT][137] ([i915#9262]) +1 other test abort
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [DMESG-WARN][138] ([i915#9262]) +2 other tests dmesg-warn
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#3582]) +3 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@kms_plane_lowres@tiling-4@pipe-c-edp-1.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#8806])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [FAIL][141] ([i915#8292])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#5176]) +11 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#5176]) +1 other test skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#5176]) +27 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg1-18/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#5235]) +1 other test skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#5235]) +11 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#5235]) +15 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
>     - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#5235]) +23 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg1-19/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#6524] / [i915#6805])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#658]) +2 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#1072]) +9 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_psr@dpms.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4235])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#4235] / [i915#5190])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_selftest@drm_cmdline:
>     - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#8661])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@kms_selftest@drm_cmdline.html
> 
>   * igt@kms_selftest@drm_damage:
>     - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#8661])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_selftest@drm_damage.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#3555]) +7 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#8623])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak-pipe-a:
>     - shard-rkl:          [PASS][158] -> [FAIL][159] ([i915#9196])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-rkl-7/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-rkl-3/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak-pipe-b:
>     - shard-mtlp:         [PASS][160] -> [FAIL][161] ([i915#9196])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak-pipe-c:
>     - shard-tglu:         [PASS][162] -> [FAIL][163] ([i915#9196])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak-pipe-c.html
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak-pipe-c.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#2437]) +1 other test skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@blocking@0-rcs0:
>     - shard-mtlp:         NOTRUN -> [FAIL][165] ([i915#9259]) +1 other test fail
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@perf@blocking@0-rcs0.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          [PASS][166] -> [FAIL][167] ([i915#4349]) +3 other tests fail
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@frequency@gt0:
>     - shard-dg2:          NOTRUN -> [FAIL][168] ([i915#6806])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@perf_pmu@frequency@gt0.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-dg2:          NOTRUN -> [FAIL][169] ([i915#5793] / [i915#6121])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@perf_pmu@module-unload.html
> 
>   * igt@perf_pmu@semaphore-busy@rcs0:
>     - shard-mtlp:         NOTRUN -> [FAIL][170] ([i915#4349]) +2 other tests fail
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@perf_pmu@semaphore-busy@rcs0.html
> 
>   * igt@prime_vgem@fence-write-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#3708])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@prime_vgem@fence-write-hang.html
> 
>   * igt@sysfs_timeslice_duration@idempotent@vcs0:
>     - shard-snb:          NOTRUN -> [SKIP][172] ([fdo#109271]) +146 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-snb7/igt@sysfs_timeslice_duration@idempotent@vcs0.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#4818])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html
> 
>   * igt@v3d/v3d_get_param@get-bad-flags:
>     - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#2575]) +17 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-1/igt@v3d/v3d_get_param@get-bad-flags.html
> 
>   * igt@v3d/v3d_perfmon@get-values-valid-perfmon:
>     - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#2575]) +1 other test skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html
> 
>   * igt@vc4/vc4_perfmon@create-two-perfmon:
>     - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#7711]) +1 other test skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@vc4/vc4_perfmon@create-two-perfmon.html
> 
>   * igt@vc4/vc4_wait_bo@used-bo-1ns:
>     - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#7711]) +10 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-11/igt@vc4/vc4_wait_bo@used-bo-1ns.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          [FAIL][178] ([i915#7742]) -> [PASS][179]
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> 
>   * igt@gem_barrier_race@remote-request@rcs0:
>     - shard-glk:          [ABORT][180] ([i915#7461] / [i915#8190]) -> [PASS][181]
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-glk1/igt@gem_barrier_race@remote-request@rcs0.html
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-glk1/igt@gem_barrier_race@remote-request@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [FAIL][182] ([i915#2842]) -> [PASS][183]
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-rkl:          [FAIL][184] ([i915#2842]) -> [PASS][185] +1 other test pass
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-rkl-7/igt@gem_exec_fair@basic-pace@vecs0.html
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - shard-dg2:          [INCOMPLETE][186] ([i915#8797]) -> [PASS][187]
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@gem_exec_whisper@basic-queues-priority-all:
>     - shard-mtlp:         [ABORT][188] ([i915#7392] / [i915#9262]) -> [PASS][189]
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-mtlp-5/igt@gem_exec_whisper@basic-queues-priority-all.html
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-6/igt@gem_exec_whisper@basic-queues-priority-all.html
> 
>   * igt@gem_ringfill@basic-all:
>     - shard-mtlp:         [ABORT][190] ([i915#9262]) -> [PASS][191] +2 other tests pass
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-mtlp-7/igt@gem_ringfill@basic-all.html
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@gem_ringfill@basic-all.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg2:          [DMESG-WARN][192] ([i915#7061] / [i915#8617]) -> [PASS][193]
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-untiled:
>     - shard-mtlp:         [FAIL][194] ([i915#8691]) -> [PASS][195]
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-4/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp:
>     - shard-dg1:          [SKIP][196] ([i915#1397]) -> [PASS][197]
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp.html
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg1-15/igt@i915_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - shard-rkl:          [DMESG-FAIL][198] ([i915#4258]) -> [PASS][199]
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-rkl-6/igt@i915_selftest@live@gt_pm.html
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-rkl-6/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-tglu:         [FAIL][200] ([i915#3743]) -> [PASS][201]
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-apl:          [FAIL][202] ([i915#2346]) -> [PASS][203]
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_flip@blocking-absolute-wf_vblank@b-vga1:
>     - shard-snb:          [ABORT][204] ([i915#8865]) -> [PASS][205]
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-snb7/igt@kms_flip@blocking-absolute-wf_vblank@b-vga1.html
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-snb1/igt@kms_flip@blocking-absolute-wf_vblank@b-vga1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
>     - shard-dg2:          [FAIL][206] ([i915#6880]) -> [PASS][207]
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
> 
>   * {igt@kms_pm_dc@dc9-dpms}:
>     - shard-tglu:         [SKIP][208] ([i915#4281]) -> [PASS][209]
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak-pipe-b:
>     - shard-tglu:         [FAIL][210] ([i915#9196]) -> [PASS][211]
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html
> 
>   * igt@prime_mmap_coherency@ioctl-errors:
>     - shard-mtlp:         [FAIL][212] -> [PASS][213]
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-mtlp-5/igt@prime_mmap_coherency@ioctl-errors.html
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-3/igt@prime_mmap_coherency@ioctl-errors.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-dg2:          [INCOMPLETE][214] ([i915#9283]) -> [ABORT][215] ([i915#7461])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg2-10/igt@gem_create@create-ext-cpu-access-big.html
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@i915_hangman@gt-error-state-capture@vcs1:
>     - shard-mtlp:         [DMESG-WARN][216] ([i915#9262]) -> [ABORT][217] ([i915#9262])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-mtlp-1/igt@i915_hangman@gt-error-state-capture@vcs1.html
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-4/igt@i915_hangman@gt-error-state-capture@vcs1.html
> 
>   * igt@kms_psr@cursor_plane_move:
>     - shard-dg1:          [SKIP][218] ([i915#1072]) -> [SKIP][219] ([i915#1072] / [i915#4078]) +1 other test skip
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg1-14/igt@kms_psr@cursor_plane_move.html
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg1-13/igt@kms_psr@cursor_plane_move.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - shard-dg1:          [SKIP][220] ([i915#1072] / [i915#4078]) -> [SKIP][221] ([i915#1072])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-dg1-13/igt@kms_psr@sprite_plane_onoff.html
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-dg1-19/igt@kms_psr@sprite_plane_onoff.html
> 
>   * igt@sysfs_timeslice_duration@timeout@vecs0:
>     - shard-mtlp:         [ABORT][222] ([i915#8521] / [i915#8865]) -> [TIMEOUT][223] ([i915#6950])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13627/shard-mtlp-2/igt@sysfs_timeslice_duration@timeout@vecs0.html
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/shard-mtlp-1/igt@sysfs_timeslice_duration@timeout@vecs0.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3582]: https://gitlab.freedesktop.org/drm/intel/issues/3582
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
>   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5793]: https://gitlab.freedesktop.org/drm/intel/issues/5793
>   [i915#5882]: https://gitlab.freedesktop.org/drm/intel/issues/5882
>   [i915#5978]: https://gitlab.freedesktop.org/drm/intel/issues/5978
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
>   [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
>   [i915#6228]: https://gitlab.freedesktop.org/drm/intel/issues/6228
>   [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6786]: https://gitlab.freedesktop.org/drm/intel/issues/6786
>   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
>   [i915#6806]: https://gitlab.freedesktop.org/drm/intel/issues/6806
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#6950]: https://gitlab.freedesktop.org/drm/intel/issues/6950
>   [i915#7061]: https://gitlab.freedesktop.org/drm/intel/issues/7061
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
>   [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7921]: https://gitlab.freedesktop.org/drm/intel/issues/7921
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#8190]: https://gitlab.freedesktop.org/drm/intel/issues/8190
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
>   [i915#8248]: https://gitlab.freedesktop.org/drm/intel/issues/8248
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
>   [i915#8398]: https://gitlab.freedesktop.org/drm/intel/issues/8398
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
>   [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
>   [i915#8521]: https://gitlab.freedesktop.org/drm/intel/issues/8521
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8617]: https://gitlab.freedesktop.org/drm/intel/issues/8617
>   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
>   [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#8691]: https://gitlab.freedesktop.org/drm/intel/issues/8691
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8797]: https://gitlab.freedesktop.org/drm/intel/issues/8797
>   [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
>   [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
>   [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
>   [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
>   [i915#8865]: https://gitlab.freedesktop.org/drm/intel/issues/8865
>   [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
>   [i915#9226]: https://gitlab.freedesktop.org/drm/intel/issues/9226
>   [i915#9227]: https://gitlab.freedesktop.org/drm/intel/issues/9227
>   [i915#9259]: https://gitlab.freedesktop.org/drm/intel/issues/9259
>   [i915#9261]: https://gitlab.freedesktop.org/drm/intel/issues/9261
>   [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
>   [i915#9283]: https://gitlab.freedesktop.org/drm/intel/issues/9283
>   [i915#9295]: https://gitlab.freedesktop.org/drm/intel/issues/9295
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_13627 -> Patchwork_123652v1
> 
>   CI-20190529: 20190529
>   CI_DRM_13627: 45460a37f9be43072b509ca6044b215648f56221 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_7486: afd9a940c8247291baadd1977fe881d4f2edf0c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_123652v1: 45460a37f9be43072b509ca6044b215648f56221 @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_123652v1/index.html
