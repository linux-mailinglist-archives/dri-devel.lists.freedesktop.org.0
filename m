Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33648AB0F0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 16:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2017810E743;
	Fri, 19 Apr 2024 14:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUwSdHDk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A42510E743;
 Fri, 19 Apr 2024 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713537920; x=1745073920;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=o3J0QjObHvs/JlGV9PmvVfjwp/rPvuNHjUIEgp1w5d0=;
 b=iUwSdHDkYzwTojj0INT3KGAc1Eeidat5FECftPCr3WULj9O9yWnKG77Q
 QlF/1izTzcv/FBrcxlGHMpxWhwz2expGjM3sBf6FMT9Bwe6/mRbhD+HQV
 6PtaHnkk7X+kmrf0cCAT+/CfG99csCEWc8CWIp64cA11uoidJrPNCgNsR
 V+eE4Ugcn7RDBE6lG7eQtp40POx6X8423TgC8e/PZKGge4Nb8zZH7nxbt
 cEEnKFfj8PVBzLA8zByaofGDGiETV3+jxAJalfcIsQy4chi30BsjRAj2E
 Ny54EptrRzlQjBXgz5llUEflSjgNpLrqpcfma6JfZjqGXjor4JnvpDO04 A==;
X-CSE-ConnectionGUID: ckjCsQxKQWiZ6Er5Gu6hyw==
X-CSE-MsgGUID: 021BWW0ATtaG5WKjX4LCag==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12932992"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="12932992"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:45:19 -0700
X-CSE-ConnectionGUID: CURpHirhS/G30kuL+YWmTA==
X-CSE-MsgGUID: YwL70EEATd+b5y6UnLlsSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23383690"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:45:16 -0700
Date: Fri, 19 Apr 2024 17:45:13 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ankit K Nautiyal <ankit.k.nautiyal@intel.com>,
 Manasi D Navare <manasi.d.navare@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, I915-ci-infra@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 drm/i915/dp: Few MTL/DSC and a UHBR monitor fix (rev4)
Message-ID: <ZiKDeejKss5/YHlP@ideak-desk.fi.intel.com>
References: <20240416221010.376865-1-imre.deak@intel.com>
 <171344297373.1500733.4217846063163403125@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171344297373.1500733.4217846063163403125@8e613ede5ea5>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 18, 2024 at 12:22:53PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/dp: Few MTL/DSC and a UHBR monitor fix (rev4)
> URL   : https://patchwork.freedesktop.org/series/131386/
> State : failure

I pushed the patchset to drm-intel-next, amending the code comment in
patch 4 as requested, thanks for the reviews, acks.

The test failure is unrelated see below.

> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14596_full -> Patchwork_131386v4_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_131386v4_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_131386v4_full, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
> Participating hosts (9 -> 10)
> ------------------------------
> 
>   Additional (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_131386v4_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@perf@polling@0-rcs0:
>     - shard-rkl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-rkl-3/igt@perf@polling@0-rcs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-5/igt@perf@polling@0-rcs0.html

Only an HDMI display is connected to the above RKL, so can't see how the
DP/MST/DSC changes could have an effect. There is already an open ticket
for the issue, probably RKL needs to be added to the platform list:

https://gitlab.freedesktop.org/drm/intel/-/issues/10538

(perf:1120) DEBUG: engine 0:0 - TestOa metric set UUID = 74dbc739-d871-41b5-be7b-fb547ac5bec9
(perf:1120) DEBUG: tick length = 10000000ns, oa period = 21.845ms, test duration = 10000000000ns, min iter. = 359, max iter. = 459
(perf:1120) DEBUG: 461 non-blocking reads during test with 45 Hz OA sampling (expect no more than 459)
(perf:1120) DEBUG: 1 extra iterations seen, not related to periodic sampling (e.g. context switches)
(perf:1120) DEBUG: time in userspace = 0ns (+-10000000ns) (start utime = 0, end = 0)
(perf:1120) DEBUG: time in kernelspace = 10000000ns (+-10000000ns) (start stime = 5, end = 6)
(perf:1120) CRITICAL: Test assertion failure function test_polling, file ../../../usr/src/igt-gpu-tools/tests/intel/perf.c:2730:
(perf:1120) CRITICAL: Failed assertion: n <= (max_iterations + n_extra_iterations)

> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_131386v4_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][3] ([i915#8411])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
>   * igt@drm_fdinfo@busy@vcs1:
>     - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8414]) +9 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@drm_fdinfo@busy@vcs1.html
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
>     - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8414]) +7 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html
> 
>   * igt@gem_bad_reloc@negative-reloc-lut:
>     - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#3281]) +7 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@gem_bad_reloc@negative-reloc-lut.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#7697])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@gem_basic@multigpu-create-close.html
> 
>   * igt@gem_caching@reads:
>     - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#4873])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@gem_caching@reads.html
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#9323])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@gem_ccs@suspend-resume.html
>     - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#9323])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_create@create-ext-cpu-access-sanity-check:
>     - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#6335]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html
> 
>   * igt@gem_ctx_persistence@heartbeat-close:
>     - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8555])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-close.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hostile:
>     - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8555])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg1:          [PASS][15] -> [FAIL][16] ([i915#5784])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-dg1-15/igt@gem_eio@reset-stress.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_balancer@bonded-pair:
>     - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#4771])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@gem_exec_balancer@bonded-pair.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#6334])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_capture@capture@vecs0-lmem0:
>     - shard-dg2:          NOTRUN -> [FAIL][19] ([i915#10386]) +3 other tests fail
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-11/igt@gem_exec_capture@capture@vecs0-lmem0.html
> 
>   * igt@gem_exec_capture@many-4k-incremental:
>     - shard-glk:          NOTRUN -> [FAIL][20] ([i915#9606])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-glk3/igt@gem_exec_capture@many-4k-incremental.html
> 
>   * igt@gem_exec_fair@basic-none-rrul:
>     - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#4473] / [i915#4771])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@gem_exec_fair@basic-none-rrul.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][22] ([i915#2842])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@bcs0:
>     - shard-rkl:          [PASS][23] -> [FAIL][24] ([i915#2842])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share:
>     - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#3539] / [i915#4852]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@gem_exec_fair@basic-pace-share.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-tglu:         [PASS][26] -> [FAIL][27] ([i915#2842]) +2 other tests fail
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-4/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle:
>     - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#3539])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@gem_exec_fair@basic-throttle.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][29] ([i915#2842])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_fence@concurrent:
>     - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#4812])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@gem_exec_fence@concurrent.html
> 
>   * igt@gem_exec_fence@submit3:
>     - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4812])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@gem_exec_fence@submit3.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-wb:
>     - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#3539] / [i915#4852]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
> 
>   * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
>     - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#3281]) +8 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-cpu-wc-active:
>     - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#3281]) +3 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@gem_exec_reloc@basic-cpu-wc-active.html
> 
>   * igt@gem_exec_reloc@basic-gtt-read-noreloc:
>     - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#3281]) +5 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
> 
>   * igt@gem_exec_schedule@preempt-queue-chain:
>     - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#4537] / [i915#4812])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@gem_exec_schedule@preempt-queue-chain.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-chain:
>     - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4537] / [i915#4812])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4860]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@gem_fenced_exec_thrash@no-spare-fences.html
> 
>   * igt@gem_fenced_exec_thrash@too-many-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4860])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-11/igt@gem_fenced_exec_thrash@too-many-fences.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#4613] / [i915#7582])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random:
>     - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#4613]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
>     - shard-dg1:          NOTRUN -> [FAIL][42] ([i915#10378])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - shard-glk:          NOTRUN -> [SKIP][43] ([i915#4613])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-glk8/igt@gem_lmem_swapping@random-engines.html
>     - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4613]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_media_vme:
>     - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#284])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@gem_media_vme.html
> 
>   * igt@gem_mmap@short-mmap:
>     - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4083]) +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@gem_mmap@short-mmap.html
> 
>   * igt@gem_mmap_gtt@hang:
>     - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4077]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-11/igt@gem_mmap_gtt@hang.html
> 
>   * igt@gem_mmap_wc@invalid-flags:
>     - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4083]) +4 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@gem_mmap_wc@invalid-flags.html
> 
>   * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
>     - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4083])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
> 
>   * igt@gem_partial_pwrite_pread@write:
>     - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3282]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@gem_partial_pwrite_pread@write.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3282]) +3 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4270]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_pxp@regular-baseline-src-copy-readible:
>     - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#4270]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#4270])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-execution:
>     - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4270]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>     - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4270]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
> 
>   * igt@gem_render_copy@linear-to-vebox-yf-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#8428])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@gem_render_copy@linear-to-vebox-yf-tiled.html
> 
>   * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#5190] / [i915#8428]) +2 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4079]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#8411])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4885])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_tiled_partial_pwrite_pread@reads:
>     - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4077]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@gem_tiled_partial_pwrite_pread@reads.html
> 
>   * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
>     - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4077]) +8 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_unfence_active_buffers:
>     - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4879])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@gem_unfence_active_buffers.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#3297]) +2 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@forbidden-operations:
>     - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3282]) +6 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@gem_userptr_blits@forbidden-operations.html
>     - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#3282] / [i915#3297])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@gem_userptr_blits@forbidden-operations.html
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>     - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#3297])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>     - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3297] / [i915#4880])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#2856]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@basic-rejected:
>     - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#2527] / [i915#2856])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@gen9_exec_parse@basic-rejected.html
> 
>   * igt@gen9_exec_parse@bb-secure:
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#2856])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@gen9_exec_parse@bb-secure.html
> 
>   * igt@gen9_exec_parse@bb-start-cmd:
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#2527]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@gen9_exec_parse@bb-start-cmd.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#2527]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@i915_module_load@load:
>     - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#6227])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@i915_module_load@load.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg2:          NOTRUN -> [ABORT][76] ([i915#9820])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_freq_api@freq-reset-multiple:
>     - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#8399])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@i915_pm_freq_api@freq-reset-multiple.html
> 
>   * igt@i915_pm_freq_mult@media-freq@gt0:
>     - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#6590])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@i915_pm_freq_mult@media-freq@gt0.html
>     - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#6590])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@i915_pm_freq_mult@media-freq@gt0.html
> 
>   * igt@i915_pm_rps@thresholds-park@gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#8925])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@i915_pm_rps@thresholds-park@gt0.html
> 
>   * igt@i915_pm_rps@thresholds@gt0:
>     - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#8925])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@i915_pm_rps@thresholds@gt0.html
> 
>   * igt@i915_pm_rps@waitboost:
>     - shard-mtlp:         NOTRUN -> [FAIL][82] ([i915#8346])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@i915_pm_rps@waitboost.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#5723])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@i915_query@test-query-geometry-subslices.html
>     - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#5723])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4212])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4212]) +1 other test skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-2:
>     - shard-glk:          [PASS][87] -> [FAIL][88] ([i915#2521])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-2.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#8709]) +7 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#8709]) +11 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#9531])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>     - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4538] / [i915#5286]) +2 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>     - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#5286]) +1 other test skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#5286]) +2 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3638])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#3638])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-tglu:         [PASS][97] -> [FAIL][98] ([i915#3743])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#4538] / [i915#5190]) +6 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4538]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_joiner@basic-force-joiner:
>     - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#10656])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@kms_big_joiner@basic-force-joiner.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#10656])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@kms_big_joiner@invalid-modeset.html
>     - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#10656])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#6095]) +79 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#6095]) +7 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#10307] / [i915#10434] / [i915#6095]) +6 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-10/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [SKIP][107] +137 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-glk2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#6095]) +19 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#10307] / [i915#6095]) +144 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#6095]) +49 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#10278])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#10278])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#3742])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_cdclk@mode-transition.html
>     - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#3742])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4087]) +3 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#7828]) +5 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#7828]) +5 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd:
>     - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#7828]) +2 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@kms_chamelium_hpd@dp-hpd.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>     - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#7828]) +5 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
>     - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#7828]) +2 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#3299])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#3299])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#7118])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#7118] / [i915#9424]) +1 other test skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#3555] / [i915#8814]) +3 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#3359])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#3555]) +1 other test skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#3359])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#3359]) +1 other test skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#9809]) +2 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4103] / [i915#4213])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-mtlp:         NOTRUN -> [SKIP][132] +13 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#4103])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#9227])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-10/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#3555]) +2 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@kms_display_modes@extended-mode-basic.html
>     - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#3555]) +1 other test skip
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#3804])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#3555]) +3 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#3555] / [i915#8812])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#8812])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-wc.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#3555] / [i915#3840])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-11/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#3555] / [i915#3840])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@kms_dsc@dsc-with-bpc-formats.html
>     - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#3555] / [i915#3840])
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#3555] / [i915#3840] / [i915#9053])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#3955])
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#4854])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#1839])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#1839])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#9337])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#658])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#658])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#3637]) +1 other test skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][153] +11 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][154] -> [FAIL][155] ([i915#2122]) +2 other tests fail
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-snb1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
>     - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#9934]) +3 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
>     - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#3637]) +1 other test skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@flip-vs-fences-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#8381])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@kms_flip@flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#2672]) +3 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
>     - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#2587] / [i915#2672]) +2 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#2587] / [i915#2672])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#2672] / [i915#3555])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#2672] / [i915#3555])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#2672]) +2 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-rte:
>     - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#5354]) +23 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#8708]) +5 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-stridechange:
>     - shard-dg2:          [PASS][167] -> [FAIL][168] ([i915#6880]) +2 other tests fail
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-stridechange.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#8708]) +9 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#3458]) +9 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][171] +32 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
>     - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#8708]) +4 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#10070])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-11/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
>     - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#3023]) +15 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
>     - shard-tglu:         NOTRUN -> [SKIP][175] +19 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#1825]) +15 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#1825]) +27 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#3458]) +10 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#3555] / [i915#8228])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#4816])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#6301])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane@pixel-format@pipe-a:
>     - shard-mtlp:         [PASS][182] -> [INCOMPLETE][183] ([i915#10698])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-mtlp-7/igt@kms_plane@pixel-format@pipe-a.html
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-7/igt@kms_plane@pixel-format@pipe-a.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [FAIL][184] ([i915#8292])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][185] ([i915#8292])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#9423]) +3 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#5176]) +7 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#9423]) +3 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#9423]) +3 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-13/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#5235]) +5 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#5235]) +2 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#3555] / [i915#5235])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#5235] / [i915#9423]) +19 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#5354])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_pm_backlight@fade-with-suspend.html
>     - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#5354])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#9292])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#9293])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#9685])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#5978])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#9340])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_lpsp@screens-disabled:
>     - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#8430])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@kms_pm_lpsp@screens-disabled.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-rkl:          [PASS][202] -> [SKIP][203] ([i915#9519])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2:          [PASS][204] -> [SKIP][205] ([i915#9519]) +2 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#6524] / [i915#6805])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>     - shard-dg1:          NOTRUN -> [SKIP][207] +25 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#4348])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#9683])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-primary-render:
>     - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#1072] / [i915#9673] / [i915#9732]) +4 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-11/igt@kms_psr@fbc-pr-primary-render.html
> 
>   * igt@kms_psr@fbc-pr-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#1072] / [i915#9732]) +8 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@kms_psr@fbc-pr-suspend.html
> 
>   * igt@kms_psr@fbc-psr2-basic:
>     - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#1072] / [i915#9732]) +13 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@kms_psr@fbc-psr2-basic.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#9688]) +6 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
> 
>   * igt@kms_psr@psr2-cursor-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#1072] / [i915#9732]) +13 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@kms_psr@psr2-cursor-blt.html
> 
>   * igt@kms_psr@psr2-cursor-mmap-gtt:
>     - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#9732]) +5 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@kms_psr@psr2-cursor-mmap-gtt.html
> 
>   * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#4077] / [i915#9688])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html
> 
>   * igt@kms_rotation_crc@exhaust-fences:
>     - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#4235])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@kms_rotation_crc@exhaust-fences.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg1:          [PASS][218] -> [DMESG-WARN][219] ([i915#1982])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-dg1-15/igt@kms_rotation_crc@primary-rotation-270.html
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#5190]) +1 other test skip
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-snb:          NOTRUN -> [SKIP][221] +18 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-snb5/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#3555] / [i915#8809])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#8623])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-snb:          [PASS][224] -> [FAIL][225] ([i915#9196])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-snb5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>     - shard-tglu:         [PASS][226] -> [FAIL][227] ([i915#9196])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#9906]) +1 other test skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@kms_vrr@max-min.html
>     - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#9906])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@kms_vrr@max-min.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#2437])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@perf@global-sseu-config-invalid:
>     - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#7387])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@perf@global-sseu-config-invalid.html
> 
>   * igt@perf@mi-rpc:
>     - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#2434])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@perf@mi-rpc.html
>     - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#2434])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@perf@mi-rpc.html
> 
>   * igt@perf@per-context-mode-unprivileged:
>     - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#2435])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@perf@per-context-mode-unprivileged.html
> 
>   * igt@perf_pmu@faulting-read@gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#8440])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@perf_pmu@faulting-read@gtt.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#3291] / [i915#3708])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@prime_vgem@basic-read.html
>     - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#3708])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@fence-write-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#3708])
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@prime_vgem@fence-write-hang.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#9917])
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@sriov_basic@bind-unbind-vf.html
>     - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#9917])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#9917]) +1 other test skip
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@syncobj_timeline@invalid-wait-zero-handles:
>     - shard-dg2:          NOTRUN -> [FAIL][242] ([i915#9781])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@syncobj_timeline@invalid-wait-zero-handles.html
> 
>   * igt@v3d/v3d_get_param@get-bad-param:
>     - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#2575]) +4 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-15/igt@v3d/v3d_get_param@get-bad-param.html
>     - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#2575]) +3 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-3/igt@v3d/v3d_get_param@get-bad-param.html
> 
>   * igt@v3d/v3d_submit_csd@job-perfmon:
>     - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#2575]) +7 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@v3d/v3d_submit_csd@job-perfmon.html
> 
>   * igt@v3d/v3d_wait_bo@unused-bo-1ns:
>     - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#2575]) +5 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-3/igt@v3d/v3d_wait_bo@unused-bo-1ns.html
> 
>   * igt@vc4/vc4_perfmon@create-perfmon-0:
>     - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#7711]) +2 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-mtlp-4/igt@vc4/vc4_perfmon@create-perfmon-0.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-purgeable:
>     - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#7711]) +5 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-3/igt@vc4/vc4_purgeable_bo@mark-purgeable.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice:
>     - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#7711]) +2 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice.html
> 
>   * igt@vc4/vc4_tiling@set-bad-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#7711]) +4 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-2/igt@vc4/vc4_tiling@set-bad-modifier.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@idle@rcs0:
>     - shard-rkl:          [FAIL][251] ([i915#7742]) -> [PASS][252]
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-rkl-4/igt@drm_fdinfo@idle@rcs0.html
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-rkl:          [FAIL][253] ([i915#2842]) -> [PASS][254] +1 other test pass
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-rkl-3/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-5/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [ABORT][255] ([i915#5566]) -> [PASS][256]
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-glk9/igt@gen9_exec_parse@allowed-all.html
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-glk3/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
>     - shard-dg1:          [FAIL][257] ([i915#3591]) -> [PASS][258]
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-tglu:         [FAIL][259] ([i915#3743]) -> [PASS][260] +2 other tests pass
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-snb:          [SKIP][261] -> [PASS][262] +5 other tests pass
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-snb1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-snb7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-dg1:          [DMESG-WARN][263] ([i915#10166]) -> [PASS][264]
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-dg1-16/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-vga1:
>     - shard-snb:          [FAIL][265] ([i915#2122]) -> [PASS][266]
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-snb7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-vga1.html
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-snb6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-vga1.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:
>     - shard-rkl:          [FAIL][267] ([i915#2122]) -> [PASS][268]
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-4:
>     - shard-dg1:          [INCOMPLETE][269] -> [PASS][270]
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-dg1-15/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-4.html
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-rkl:          [SKIP][271] ([i915#9519]) -> [PASS][272]
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-tglu:         [FAIL][273] ([i915#9196]) -> [PASS][274] +1 other test pass
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_lmem_swapping@heavy-random@lmem0:
>     - shard-dg1:          [FAIL][275] ([i915#10378] / [i915#4423]) -> [FAIL][276] ([i915#10378])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-dg1-16/igt@gem_lmem_swapping@heavy-random@lmem0.html
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-17/igt@gem_lmem_swapping@heavy-random@lmem0.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [TIMEOUT][277] ([i915#5493]) -> [DMESG-WARN][278] ([i915#4936] / [i915#5493])
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg1:          [INCOMPLETE][279] ([i915#9820] / [i915#9849]) -> [ABORT][280] ([i915#9820])
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-snb:          [SKIP][281] -> [INCOMPLETE][282] ([i915#8816])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-snb1/igt@kms_content_protection@lic-type-0.html
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-snb7/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][283] ([i915#3458]) -> [SKIP][284] ([i915#10433] / [i915#3458]) +1 other test skip
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-rkl:          [SKIP][285] ([i915#3361]) -> [FAIL][286] ([i915#9295])
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-rkl-3/igt@kms_pm_dc@dc6-dpms.html
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_psr@fbc-psr-cursor-mmap-cpu:
>     - shard-dg2:          [SKIP][287] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][288] ([i915#1072] / [i915#9732]) +4 other tests skip
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-dg2-11/igt@kms_psr@fbc-psr-cursor-mmap-cpu.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-6/igt@kms_psr@fbc-psr-cursor-mmap-cpu.html
> 
>   * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>     - shard-dg2:          [CRASH][289] ([i915#9351]) -> [INCOMPLETE][290] ([i915#5493])
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14596/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
> 
>   
>   [i915#10070]: https://gitlab.freedesktop.org/drm/intel/issues/10070
>   [i915#10166]: https://gitlab.freedesktop.org/drm/intel/issues/10166
>   [i915#10278]: https://gitlab.freedesktop.org/drm/intel/issues/10278
>   [i915#10307]: https://gitlab.freedesktop.org/drm/intel/issues/10307
>   [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
>   [i915#10386]: https://gitlab.freedesktop.org/drm/intel/issues/10386
>   [i915#10433]: https://gitlab.freedesktop.org/drm/intel/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/intel/issues/10434
>   [i915#10656]: https://gitlab.freedesktop.org/drm/intel/issues/10656
>   [i915#10698]: https://gitlab.freedesktop.org/drm/intel/issues/10698
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
>   [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
>   [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
>   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
>   [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
>   [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#5978]: https://gitlab.freedesktop.org/drm/intel/issues/5978
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
>   [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
>   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
>   [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8346]: https://gitlab.freedesktop.org/drm/intel/issues/8346
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
>   [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8430]: https://gitlab.freedesktop.org/drm/intel/issues/8430
>   [i915#8440]: https://gitlab.freedesktop.org/drm/intel/issues/8440
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
>   [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
>   [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
>   [i915#8816]: https://gitlab.freedesktop.org/drm/intel/issues/8816
>   [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
>   [i915#9053]: https://gitlab.freedesktop.org/drm/intel/issues/9053
>   [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
>   [i915#9227]: https://gitlab.freedesktop.org/drm/intel/issues/9227
>   [i915#9292]: https://gitlab.freedesktop.org/drm/intel/issues/9292
>   [i915#9293]: https://gitlab.freedesktop.org/drm/intel/issues/9293
>   [i915#9295]: https://gitlab.freedesktop.org/drm/intel/issues/9295
>   [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
>   [i915#9337]: https://gitlab.freedesktop.org/drm/intel/issues/9337
>   [i915#9340]: https://gitlab.freedesktop.org/drm/intel/issues/9340
>   [i915#9351]: https://gitlab.freedesktop.org/drm/intel/issues/9351
>   [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
>   [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
>   [i915#9531]: https://gitlab.freedesktop.org/drm/intel/issues/9531
>   [i915#9606]: https://gitlab.freedesktop.org/drm/intel/issues/9606
>   [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
>   [i915#9683]: https://gitlab.freedesktop.org/drm/intel/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/intel/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
>   [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
>   [i915#9781]: https://gitlab.freedesktop.org/drm/intel/issues/9781
>   [i915#9809]: https://gitlab.freedesktop.org/drm/intel/issues/9809
>   [i915#9820]: https://gitlab.freedesktop.org/drm/intel/issues/9820
>   [i915#9849]: https://gitlab.freedesktop.org/drm/intel/issues/9849
>   [i915#9906]: https://gitlab.freedesktop.org/drm/intel/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/intel/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/intel/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_14596 -> Patchwork_131386v4
> 
>   CI-20190529: 20190529
>   CI_DRM_14596: d9ed10db0dab988accaf881038e3e371f12ed5d5 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_7810: 189483744e9ff56ea573e07a049c5365404c7ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_131386v4: d9ed10db0dab988accaf881038e3e371f12ed5d5 @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_131386v4/index.html
