Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91230695CAC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 09:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECD610E80E;
	Tue, 14 Feb 2023 08:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAC810E809;
 Tue, 14 Feb 2023 08:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676362512; x=1707898512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CUlXgU2oHP9xTihDtLhXNlvcd0R/BORLD3o2XsB51ko=;
 b=C1Fnm6vehU8MhAhyehA8jd/fw32mNttFhd5YsKi0H1UWPOheEGAexe5W
 /N2sYmfLqdmp8bhFR5GWTpZUt9oQ92vjWlnOQxmqJbtfR0O54NwDzBr0o
 Bro4EsCH3lrIZxLAPYd+FDompqjwkekFAy1vUbcg2Bg35s2Igkhq/iKzX
 7wrI5utkkoye3J8gVhJRz/92NRlcxgM8Q2azRKbreEju0Ldiv9d9Sie5y
 pbV57VW08mFbwv+0jH5A02ZlJF7HXs/BBgsqh38J9psM5i00Zz6W52aK7
 4vSIhOX0nJUg6y3/VZrXUdkk0nU2Yqyjad0AtDJkx2CKxKA/Vdancz6Ia Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="319137103"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="319137103"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:14:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="662471642"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="662471642"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.19.67])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:14:40 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: =?UTF-8?B?4pyT?= Fi.CI.IGT: success for Resolve barrier tasks
 list related issues
Date: Tue, 14 Feb 2023 09:14:36 +0100
Message-ID: <1775379.3VsfAaAtOV@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <167634589275.8399.8356943960798059660@emeril.freedesktop.org>
References: <20230213232128.59217-1-janusz.krzysztofik@linux.intel.com>
 <167634589275.8399.8356943960798059660@emeril.freedesktop.org>
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

On Tuesday, 14 February 2023 04:38:12 CET Patchwork wrote:
> == Series Details ==
> 
> Series: Resolve barrier tasks list related issues
> URL   : https://patchwork.freedesktop.org/series/113975/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12734_full -> Patchwork_113975v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_113975v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@gem_barrier_race@remote-request@rcs0} (NEW):
>     - {shard-dg1}:        NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-dg1-18/igt@gem_barrier_race@remote-request@rcs0.html

Still worth, my patches occurred still not sufficient for resolution of 
corruptions of fence callback lists.  I don't expect this to be resolved via 
more restrictive locking.  Looking for still another source of unintentional 
races seems the way to go.

Another conclusion: even several trybot runs are still not sufficient for 
getting the issue(s) reproduced.

Thanks,
Janusz


> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_async_flips@crc@pipe-c-hdmi-a-1:
>     - {shard-dg1}:        NOTRUN -> [FAIL][2] +3 similar issues
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-dg1-14/igt@kms_async_flips@crc@pipe-c-hdmi-a-1.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_12734_full and Patchwork_113975v1_full:
> 
> ### New IGT tests (4) ###
> 
>   * igt@gem_barrier_race@remote-request:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_barrier_race@remote-request@rcs0:
>     - Statuses : 1 abort(s) 3 pass(s) 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-b-edp-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-b-edp-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_113975v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#2842])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#2842])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-glk2/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-apl:          [PASS][7] -> [ABORT][8] ([i915#5566])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-apl1/igt@gen9_exec_parse@allowed-single.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-apl7/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][9] ([fdo#109271]) +1 similar issue
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-glk2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs.html
> 
>   * igt@kms_color@ctm-max@pipe-a-hdmi-a-1:
>     - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271]) +32 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-snb1/igt@kms_color@ctm-max@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
>     - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#2346])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
>     - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#79])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@most-busy-check-all@rcs0:
>     - {shard-rkl}:        [FAIL][15] ([i915#7742]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html
> 
>   * igt@fbdev@unaligned-read:
>     - {shard-tglu}:       [SKIP][17] ([i915#2582]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-tglu-6/igt@fbdev@unaligned-read.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-tglu-7/igt@fbdev@unaligned-read.html
> 
>   * igt@gem_bad_reloc@negative-reloc:
>     - {shard-rkl}:        [SKIP][19] ([i915#3281]) -> [PASS][20] +8 similar issues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-2/igt@gem_bad_reloc@negative-reloc.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-5/igt@gem_bad_reloc@negative-reloc.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - {shard-rkl}:        [FAIL][21] ([i915#6268]) -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-3/igt@gem_ctx_exec@basic-nohangcheck.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-3/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_exec_endless@dispatch@bcs0:
>     - {shard-rkl}:        [SKIP][23] ([i915#6247]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-1/igt@gem_exec_endless@dispatch@bcs0.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - {shard-rkl}:        [FAIL][25] ([i915#2846]) -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - {shard-rkl}:        [FAIL][27] ([i915#2842]) -> [PASS][28] +3 similar issues
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-5/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-glk:          [FAIL][29] ([i915#2842]) -> [PASS][30] +1 similar issue
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads:
>     - {shard-rkl}:        [SKIP][31] ([i915#3282]) -> [PASS][32] +2 similar issues
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gen9_exec_parse@basic-rejected:
>     - {shard-rkl}:        [SKIP][33] ([i915#2527]) -> [PASS][34]
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-1/igt@gen9_exec_parse@basic-rejected.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-5/igt@gen9_exec_parse@basic-rejected.html
> 
>   * igt@i915_hangman@engine-engine-error@bcs0:
>     - {shard-rkl}:        [SKIP][35] ([i915#6258]) -> [PASS][36] +1 similar issue
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-1/igt@i915_hangman@engine-engine-error@bcs0.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-apl:          [SKIP][37] ([fdo#109271]) -> [PASS][38]
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-apl4/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_pm_rpm@dpms-lpsp:
>     - {shard-rkl}:        [SKIP][39] ([i915#1397]) -> [PASS][40] +1 similar issue
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-3/igt@i915_pm_rpm@dpms-lpsp.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-6/igt@i915_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - {shard-rkl}:        [SKIP][41] ([i915#1845] / [i915#4098]) -> [PASS][42] +17 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_dp_aux_dev:
>     - {shard-rkl}:        [SKIP][43] ([i915#1257]) -> [PASS][44]
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-1/igt@kms_dp_aux_dev.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-6/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-hdmi-a2:
>     - shard-glk:          [FAIL][45] ([i915#2122]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-glk3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-hdmi-a2.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-glk9/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
>     - shard-glk:          [FAIL][47] ([i915#79]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
>     - {shard-tglu}:       [SKIP][49] ([i915#1849]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - {shard-rkl}:        [SKIP][51] ([i915#1849] / [i915#4098]) -> [PASS][52] +13 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_plane@plane-panning-bottom-right@pipe-a-planes:
>     - {shard-rkl}:        [SKIP][53] ([i915#1849]) -> [PASS][54] +1 similar issue
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right@pipe-a-planes.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right@pipe-a-planes.html
> 
>   * igt@kms_psr@primary_mmap_gtt:
>     - {shard-rkl}:        [SKIP][55] ([i915#1072]) -> [PASS][56] +2 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-1/igt@kms_psr@primary_mmap_gtt.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-6/igt@kms_psr@primary_mmap_gtt.html
> 
>   * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a:
>     - {shard-rkl}:        [SKIP][57] ([i915#4098]) -> [PASS][58]
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-4/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a.html
> 
>   * igt@kms_universal_plane@universal-plane-pipe-b-sanity:
>     - {shard-tglu}:       [SKIP][59] ([fdo#109274]) -> [PASS][60] +1 similar issue
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-tglu-6/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-tglu-1/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html
> 
>   * igt@kms_vblank@pipe-c-ts-continuation-suspend:
>     - {shard-tglu}:       [SKIP][61] ([i915#1845] / [i915#7651]) -> [PASS][62] +6 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-tglu-6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-tglu-2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - {shard-rkl}:        [SKIP][63] ([fdo#109295] / [fdo#111656] / [i915#3708]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/shard-rkl-6/igt@prime_vgem@coherency-gtt.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/shard-rkl-5/igt@prime_vgem@coherency-gtt.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>   [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
>   [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
>   [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
>   [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>   [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
>   [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
>   [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
>   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
>   [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
>   [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
>   [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
>   [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
>   [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
>   [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
>   [i915#7178]: https://gitlab.freedesktop.org/drm/intel/issues/7178
>   [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#7949]: https://gitlab.freedesktop.org/drm/intel/issues/7949
>   [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#8018]: https://gitlab.freedesktop.org/drm/intel/issues/8018
>   [i915#8150]: https://gitlab.freedesktop.org/drm/intel/issues/8150
>   [i915#8155]: https://gitlab.freedesktop.org/drm/intel/issues/8155
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7160 -> TrybotIGT_706
>   * Linux: CI_DRM_12734 -> Patchwork_113975v1
> 
>   CI-20190529: 20190529
>   CI_DRM_12734: ffa7027c353c6821636559f42584dd11f527b0e0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_7160: 45da871dd2684227e93a2fc002b87dfc58bd5fd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_113975v1: ffa7027c353c6821636559f42584dd11f527b0e0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   TrybotIGT_706: https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_706/index.html
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/index.html
> 




