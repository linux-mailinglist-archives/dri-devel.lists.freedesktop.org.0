Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32C49766BB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 12:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51EB10E186;
	Thu, 12 Sep 2024 10:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sb6tSHIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0949B10E0A2;
 Thu, 12 Sep 2024 10:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726137294; x=1757673294;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=nA8ajZ6442i2V78saRgv4jB2STg2WGLnWpc3G4mERjQ=;
 b=Sb6tSHIKwVDem3wbwYxU8NIU2anURZYPQF7MkB/TSjzpuvEjR9V31oLO
 Jsip3n6rWlDP3XUrdFThSGcGmFlaNJrewi1blplge/eX3IjxNV4TMeB0P
 PuVQWbVZx57CFokRuiGlrrRCGiUu+9te5T9BaDb19nJ0Ewb9OGgU/DgC8
 OgDjH000d4/S68x7iNhfKPxNAI4bpXoebG1MMeoveZqRySgUH1VGtANq+
 31siQbtzmZ2dm/UMud8l/9sY5ihA3IPwbZfwtAZTOpAoK3B5JRb6IEWAM
 VfdcQpXpPxMxa424OssGEnu6HXLwaIFul+yT0VY5CQK+9DAV65+qgQoLj w==;
X-CSE-ConnectionGUID: K3CBAQedQRmAQeGDCGI4Aw==
X-CSE-MsgGUID: xWW79gKJT2+mk7rIo32KPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36363473"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="36363473"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 03:34:54 -0700
X-CSE-ConnectionGUID: erN0xY6uRpOWJeuT9msc6Q==
X-CSE-MsgGUID: RhRa+0KWQNuvRc/G2cxlIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="105116674"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 03:34:51 -0700
Date: Thu, 12 Sep 2024 13:35:15 +0300
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>, I915-ci-infra@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?=
 =?utf-8?Q?e_for_drm=2Fdp=5Fmst?= =?utf-8?Q?=3A?= Fix DSC decompression
 detection in Synaptics branch devices
Message-ID: <ZuLD49fJP1d-iSwG@ideak-desk.fi.intel.com>
References: <20240909144650.2931258-1-imre.deak@intel.com>
 <172600967360.982706.2473677126227847851@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172600967360.982706.2473677126227847851@2413ebb6fbb6>
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

On Tue, Sep 10, 2024 at 11:07:53PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/dp_mst: Fix DSC decompression detection in Synaptics branch devices
> URL   : https://patchwork.freedesktop.org/series/138419/
> State : failure

Patch is pushed to drm-misc-fixes, thanks for the review.

The failures are unrelated, see below.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15385_full -> Patchwork_138419v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_138419v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_138419v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_138419v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-dg2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-1/igt@kms_fbcon_fbt@fbc-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html

No MST sink is connected on the above machine, so the change doesn't
have an effect on it. It's a network issue, seen many times before:

(kms_fbcon_fbt:1417) igt_core-WARNING: [cmd] rtcwake: write error
(kms_fbcon_fbt:1417) igt_aux-WARNING: rtcwake failed with 1

<3> [434.693278] e1000e 0000:00:1f.6: PM: pci_pm_suspend(): e1000e_pm_suspend [e1000e] returns -2
<3> [434.693306] e1000e 0000:00:1f.6: PM: dpm_run_callback(): pci_pm_suspend returns -2
<3> [434.693381] e1000e 0000:00:1f.6: PM: failed to suspend async: error -2
<7> [434.693551] PM: suspend of devices aborted after 1197.406 msecs
<7> [434.693555] PM: start suspend of devices aborted after 1602.264 msecs
<3> [434.693558] PM: Some devices failed to suspend, or early wake event detected

> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-glk4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

No MST sink is connected. Something is wrong with the logging here, the
above test seems to pass:

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-glk4/igt_runner3.txt :

[926.370349] Starting subtest: planes-upscale-factor-0-25-downscale-factor-0-75
[926.404699] Starting dynamic subtest: pipe-A-HDMI-A-1
[942.012172] Dynamic subtest pipe-A-HDMI-A-1: SUCCESS (15.606s)
[942.080019] Starting dynamic subtest: pipe-B-HDMI-A-1
[959.482889] Dynamic subtest pipe-B-HDMI-A-1: SUCCESS (17.439s)
[959.556223] Subtest planes-upscale-factor-0-25-downscale-factor-0-75: SUCCESS (33.186s)

And things stop only later at:

[964.486604] [124/128] (358s left) kms_frontbuffer_tracking (fbc-2p-primscrn-spr-indfb-draw-mmap-gtt)
[964.720191] Starting subtest: fbc-2p-primscrn-spr-indfb-draw-mmap-gtt

> 
>   * igt@perf_pmu@most-busy-idle-check-all:
>     - shard-rkl:          [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-rkl-3/igt@perf_pmu@most-busy-idle-check-all.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-1/igt@perf_pmu@most-busy-idle-check-all.html

No MST sink is connected, the issue looks similar to:

https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11822

> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_138419v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#6230])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@api_intel_bb@crc32.html
>     - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#6230])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@api_intel_bb@crc32.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#11078])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@device_reset@cold-reset-bound.html
> 
>   * igt@drm_fdinfo@most-busy-check-all:
>     - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8414]) +11 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@drm_fdinfo@most-busy-check-all.html
> 
>   * igt@drm_fdinfo@virtual-busy-idle:
>     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8414])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@drm_fdinfo@virtual-busy-idle.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#7697]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_ctx_persistence@heartbeat-many:
>     - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#8555]) +2 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-many.html
> 
>   * igt@gem_eio@hibernate:
>     - shard-rkl:          NOTRUN -> [ABORT][13] ([i915#7975] / [i915#8213])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@gem_eio@hibernate.html
> 
>   * igt@gem_exec_capture@capture-invisible@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#6334]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@gem_exec_capture@capture-invisible@lmem0.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-glk:          NOTRUN -> [SKIP][15] ([i915#6334]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-glk5/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_fair@basic-none-vip@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][16] ([i915#2842]) +1 other test fail
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@gem_exec_fair@basic-none-vip@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2842]) +1 other test fail
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-rkl:          [PASS][19] -> [FAIL][20] ([i915#2842]) +4 other tests fail
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-rkl-5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][21] ([i915#2842]) +5 other tests fail
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_fence@submit:
>     - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#4812])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@gem_exec_fence@submit.html
> 
>   * igt@gem_exec_fence@submit3:
>     - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#4812])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@gem_exec_fence@submit3.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#3539] / [i915#4852]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_exec_flush@basic-wb-ro-default:
>     - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#3539] / [i915#4852]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@gem_exec_flush@basic-wb-ro-default.html
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu-active:
>     - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#3281]) +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu-active.html
> 
>   * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
>     - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#3281]) +7 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html
> 
>   * igt@gem_exec_suspend@basic-s3@lmem0:
>     - shard-dg2:          [PASS][28] -> [FAIL][29] ([i915#11279]) +2 other tests fail
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-1/igt@gem_exec_suspend@basic-s3@lmem0.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-5/igt@gem_exec_suspend@basic-s3@lmem0.html
> 
>   * igt@gem_fence_thrash@bo-copy:
>     - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#4860]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@gem_fence_thrash@bo-copy.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - shard-glk:          NOTRUN -> [SKIP][31] ([i915#4613]) +2 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-glk9/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_media_fill@media-fill:
>     - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#8289])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@gem_media_fill@media-fill.html
> 
>   * igt@gem_media_vme:
>     - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#284])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-15/igt@gem_media_vme.html
> 
>   * igt@gem_mmap_gtt@zero-extend:
>     - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#4077]) +12 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@gem_mmap_gtt@zero-extend.html
> 
>   * igt@gem_mmap_wc@write-read:
>     - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#4083]) +6 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@gem_mmap_wc@write-read.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads:
>     - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3282]) +5 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@gem_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-glk:          NOTRUN -> [WARN][37] ([i915#2658])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-glk4/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pwrite@basic-random:
>     - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#3282]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@gem_pwrite@basic-random.html
> 
>   * igt@gem_pxp@fail-invalid-protected-context:
>     - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#4270])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@gem_pxp@fail-invalid-protected-context.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-1:
>     - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4270]) +3 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@gem_pxp@reject-modify-context-protection-off-1.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-on:
>     - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4270]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@gem_pxp@reject-modify-context-protection-on.html
> 
>   * igt@gem_readwrite@beyond-eob:
>     - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3282]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@gem_readwrite@beyond-eob.html
> 
>   * igt@gem_render_copy@linear-to-vebox-y-tiled:
>     - shard-snb:          NOTRUN -> [SKIP][43] +19 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-snb7/igt@gem_render_copy@linear-to-vebox-y-tiled.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#5190] / [i915#8428]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html
> 
>   * igt@gem_set_tiling_vs_gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4079])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@gem_set_tiling_vs_gtt.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4079]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#4885])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-glk:          NOTRUN -> [SKIP][48] ([i915#3323])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-glk5/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@forbidden-operations:
>     - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#3282] / [i915#3297])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@gem_userptr_blits@forbidden-operations.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate:
>     - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3297] / [i915#4880])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3297]) +3 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#3297])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-glk:          [PASS][53] -> [ABORT][54] ([i915#5566])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-glk8/igt@gen9_exec_parse@allowed-single.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-glk3/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@bb-start-cmd:
>     - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#2856])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@gen9_exec_parse@bb-start-cmd.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#2527]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#2527]) +4 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@i915_fb_tiling:
>     - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4881])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@i915_fb_tiling.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-glk:          [PASS][59] -> [ABORT][60] ([i915#9820])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-glk9/igt@i915_module_load@reload-with-fault-injection.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-glk5/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-dg2:          [PASS][61] -> [ABORT][62] ([i915#9820])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_freq_api@freq-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#8399])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#11681] / [i915#6621])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#11681] / [i915#6621])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#6245])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - shard-mtlp:         [PASS][67] -> [ABORT][68] ([i915#12061]) +1 other test abort
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-mtlp-7/igt@i915_selftest@live@workarounds.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-mtlp-7/igt@i915_selftest@live@workarounds.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-glk:          NOTRUN -> [DMESG-WARN][69] ([i915#9311]) +1 other test dmesg-warn
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-glk4/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>     - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4212]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#8709]) +3 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#8709]) +11 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-mtlp:         [PASS][73] -> [FAIL][74] ([i915#11808] / [i915#5956]) +1 other test fail
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#1769] / [i915#3555])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-tglu:         [PASS][76] -> [FAIL][77] ([i915#11808]) +1 other test fail
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-tglu-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-tglu-10/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>     - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4538] / [i915#5286]) +6 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#5286]) +3 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#3638]) +3 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3638]) +2 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4538]) +3 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][83] +12 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4538] / [i915#5190]) +2 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-glk:          NOTRUN -> [SKIP][85] +232 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-glk8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_joiner@invalid-modeset-force-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#10656])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@kms_big_joiner@invalid-modeset-force-joiner.html
>     - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#10656])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_big_joiner@invalid-modeset-force-joiner.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#6095]) +100 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-15/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#6095]) +60 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#12042])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#10307] / [i915#6095]) +146 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#10307] / [i915#10434] / [i915#6095]) +7 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-10/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#11616] / [i915#7213]) +4 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-multiple:
>     - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#7828]) +3 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#7828])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>     - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#7828]) +7 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#9424])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@kms_content_protection@lic-type-1.html
>     - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#9424])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#7118] / [i915#9424])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#11453]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3555]) +5 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#11453])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#3555] / [i915#8814])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#4103] / [i915#4213]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#4103]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#8812]) +1 other test skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#3555] / [i915#3840]) +1 other test skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3555] / [i915#3840])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#3840] / [i915#9053])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#658])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#9934]) +11 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@flip-vs-fences-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#8381])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_flip@flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1:
>     - shard-dg2:          [PASS][113] -> [FAIL][114] ([i915#2122]) +3 other tests fail
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible:
>     - shard-snb:          NOTRUN -> [FAIL][115] ([i915#2122]) +2 other tests fail
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#2672] / [i915#3555])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#2672])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
>     - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#2587] / [i915#2672]) +2 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#2672] / [i915#3555] / [i915#5190])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#2672]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#2672] / [i915#3555]) +2 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#2672] / [i915#3555])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#5354]) +9 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#1825])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#5439])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
>     - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#3023]) +8 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#8708]) +3 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>     - shard-dg1:          NOTRUN -> [SKIP][128] +40 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#1825]) +20 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#9766])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-15/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#8708]) +16 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#3458]) +17 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#3458]) +2 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#3555] / [i915#8228]) +1 other test skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#3555] / [i915#8228])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#1839])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>     - shard-dg2:          NOTRUN -> [SKIP][137] +5 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#9423]) +13 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#9423]) +8 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#9728]) +5 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#5235] / [i915#9423]) +2 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#9728]) +3 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a-hdmi-a-4:
>     - shard-dg1:          [PASS][143] -> [DMESG-WARN][144] ([i915#4423]) +1 other test dmesg-warn
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg1-16/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a-hdmi-a-4.html
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#9423]) +20 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#9685])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#3361])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_pm_dc@dc6-dpms.html
>     - shard-tglu:         [PASS][148] -> [FAIL][149] ([i915#9295])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#9685])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg2:          [PASS][151] -> [SKIP][152] ([i915#9340])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-2/igt@kms_pm_lpsp@kms-lpsp.html
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html
>     - shard-rkl:          [PASS][153] -> [SKIP][154] ([i915#9340])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-1/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-dg2:          [PASS][155] -> [SKIP][156] ([i915#9519]) +2 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-3/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#9519])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-rkl:          [PASS][158] -> [SKIP][159] ([i915#9519])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#6524])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@kms_prime@basic-crc-hybrid.html
>     - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#6524]) +1 other test skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#6524] / [i915#6805])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#11520]) +1 other test skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>     - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#11520]) +3 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area:
>     - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#11520])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#9683])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@pr-primary-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#1072] / [i915#9732]) +4 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_psr@pr-primary-mmap-gtt.html
> 
>   * igt@kms_psr@psr2-primary-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#1072] / [i915#9732]) +9 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_psr@psr2-primary-mmap-gtt.html
> 
>   * igt@kms_psr@psr2-sprite-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#1072] / [i915#9732]) +21 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_psr@psr2-sprite-mmap-gtt.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#5289])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#3555]) +1 other test skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#8623])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-rkl:          [PASS][173] -> [FAIL][174] ([i915#9196]) +1 other test fail
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak.html
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-snb:          [PASS][175] -> [FAIL][176] ([i915#9196])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-snb1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-snb1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>     - shard-mtlp:         [PASS][177] -> [FAIL][178] ([i915#9196]) +1 other test fail
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-tglu:         [PASS][179] -> [FAIL][180] ([i915#9196]) +1 other test fail
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3555]) +1 other test skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-4/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#11920])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#9906])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-glk:          NOTRUN -> [SKIP][184] ([i915#2437]) +1 other test skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-glk9/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#2437])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@perf@gen8-unprivileged-single-ctx-counters:
>     - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#2436])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@perf@gen8-unprivileged-single-ctx-counters.html
> 
>   * igt@perf@global-sseu-config-invalid:
>     - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#7387])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@perf@global-sseu-config-invalid.html
> 
>   * igt@perf_pmu@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          [PASS][188] -> [FAIL][189] ([i915#4349])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-rkl-3/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
> 
>   * igt@perf_pmu@semaphore-busy@vcs1:
>     - shard-mtlp:         [PASS][190] -> [FAIL][191] ([i915#4349])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-mtlp-7/igt@perf_pmu@semaphore-busy@vcs1.html
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-mtlp-1/igt@perf_pmu@semaphore-busy@vcs1.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#3708])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-17/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#9917])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@syncobj_wait@invalid-wait-zero-handles:
>     - shard-dg1:          NOTRUN -> [FAIL][194] ([i915#9781])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-15/igt@syncobj_wait@invalid-wait-zero-handles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all:
>     - shard-rkl:          [FAIL][195] -> [PASS][196]
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all.html
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all.html
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          [FAIL][197] ([i915#7742]) -> [PASS][198]
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> 
>   * igt@gem_ctx_engines@invalid-engines:
>     - shard-rkl:          [FAIL][199] ([i915#12065]) -> [PASS][200]
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-rkl-3/igt@gem_ctx_engines@invalid-engines.html
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-5/igt@gem_ctx_engines@invalid-engines.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg1:          [ABORT][201] ([i915#9820]) -> [PASS][202]
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
>     - shard-dg1:          [FAIL][203] ([i915#3591]) -> [PASS][204] +1 other test pass
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
> 
>   * igt@i915_power@sanity:
>     - shard-mtlp:         [SKIP][205] ([i915#7984]) -> [PASS][206]
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-mtlp-1/igt@i915_power@sanity.html
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-mtlp-5/igt@i915_power@sanity.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2:
>     - shard-dg2:          [FAIL][207] -> [PASS][208] +1 other test pass
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2.html
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-snb:          [FAIL][209] ([i915#5956]) -> [PASS][210] +1 other test pass
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-snb7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-snb1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@torture-bo:
>     - shard-mtlp:         [INCOMPLETE][211] -> [PASS][212] +1 other test pass
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-mtlp-7/igt@kms_cursor_legacy@torture-bo.html
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-mtlp-1/igt@kms_cursor_legacy@torture-bo.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-snb:          [INCOMPLETE][213] ([i915#4839]) -> [PASS][214] +1 other test pass
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a4:
>     - shard-dg1:          [FAIL][215] ([i915#2122]) -> [PASS][216] +2 other tests pass
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg1-18/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a4.html
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a4.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-dg2:          [SKIP][217] ([i915#3555] / [i915#8228]) -> [PASS][218]
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-2/igt@kms_hdr@bpc-switch-dpms.html
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-11/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg2:          [SKIP][219] ([i915#9519]) -> [PASS][220]
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-rkl:          [SKIP][221] ([i915#9519]) -> [PASS][222] +1 other test pass
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-rkl:          [ABORT][223] ([i915#9820]) -> [ABORT][224] ([i915#9697])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][225] ([i915#3458]) -> [SKIP][226] ([i915#10433] / [i915#3458]) +1 other test skip
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
>     - shard-dg2:          [SKIP][227] ([i915#10433] / [i915#3458]) -> [SKIP][228] ([i915#3458])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][229] ([i915#4816]) -> [SKIP][230] ([i915#4070] / [i915#4816])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-rkl:          [SKIP][231] ([i915#3361]) -> [FAIL][232] ([i915#9295])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-rkl-3/igt@kms_pm_dc@dc6-dpms.html
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_psr@pr-cursor-render:
>     - shard-dg2:          [SKIP][233] ([i915#1072] / [i915#9732]) -> [SKIP][234] ([i915#1072] / [i915#9673] / [i915#9732]) +4 other tests skip
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-2/igt@kms_psr@pr-cursor-render.html
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-11/igt@kms_psr@pr-cursor-render.html
> 
>   * igt@kms_psr@psr2-cursor-plane-move:
>     - shard-dg2:          [SKIP][235] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][236] ([i915#1072] / [i915#9732]) +10 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-11/igt@kms_psr@psr2-cursor-plane-move.html
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-10/igt@kms_psr@psr2-cursor-plane-move.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2:          [SKIP][237] ([i915#11131] / [i915#4235] / [i915#5190]) -> [SKIP][238] ([i915#11131] / [i915#5190])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15385/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
>   [i915#11131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131
>   [i915#11279]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11279
>   [i915#11453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#11808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808
>   [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
>   [i915#12042]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12042
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12065
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>   [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
>   [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
>   [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
>   [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
>   [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
>   [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
>   [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>   [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213
>   [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
>   [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
>   [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
>   [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
>   [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
>   [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
>   [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
>   [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
>   [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
>   [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>   [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9697
>   [i915#9728]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781
>   [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_15385 -> Patchwork_138419v1
> 
>   CI-20190529: 20190529
>   CI_DRM_15385: bd6c4b2266ebc908d55e8ec3f419b832ebdc3945 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_8011: 26dca87f1252b7f6f0c0f833050256f0244d61e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_138419v1: bd6c4b2266ebc908d55e8ec3f419b832ebdc3945 @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138419v1/index.html
