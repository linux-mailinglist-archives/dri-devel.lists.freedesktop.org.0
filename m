Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A87B54E9B3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 20:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D6611A48F;
	Thu, 16 Jun 2022 18:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C66311A488;
 Thu, 16 Jun 2022 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655405865; x=1686941865;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=t0PiRMHLhHYqENTUhDI9Q70WAJemmnaKqJMbNjpPD3I=;
 b=BQtBTbK3ta7wptvUOkmJ19iBr+v7kHxnZR+q5tp0uAee1T2hLAjpCd/3
 w4b/Q0YqaW4WeSjhCyWfeD19q5fQ/Mkh5ZslH6glbHP7P8ja1+33vNMuK
 z39mHBrUnJOld+bvfUahZKN6S9hWNZeHxVmZ/ax3L8RuUry4b4BKLurfQ
 BjKUmlAo4xPc3GibA6fAC6jvLLETk+HftOVbcAqUKCcKQBMg6BaaHIcY2
 8Sy6MES2pDA1dvBP5JcYHozzSVUhDGj+Zq2cTNzsE4joKjl3T9K3qRV23
 LC+rSB4lLOJgjOR0or9SeDAtnQzZE7GmfggMWWLPNuo6yTDis2BGwk9D+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="278123215"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="278123215"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 11:57:43 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="583746857"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 11:57:41 -0700
Date: Thu, 16 Jun 2022 21:57:37 +0300
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Lyude Paul <lyude@redhat.com>,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?=
 =?utf-8?Q?e_for_drm=2Fdp=2Fmst?= =?utf-8?Q?=3A?= Read the extended DPCD
 capabilities during system resume
Message-ID: <Yqt9IW5P7ClfLlao@ideak-desk.fi.intel.com>
References: <20220614094537.885472-1-imre.deak@intel.com>
 <165526713488.14601.9810548853295831180@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165526713488.14601.9810548853295831180@emeril.freedesktop.org>
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

On Wed, Jun 15, 2022 at 04:25:34AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/dp/mst: Read the extended DPCD capabilities during system resume
> URL   : https://patchwork.freedesktop.org/series/105102/
> State : failure

Thanks for the reviews, pushed the patch to drm-misc-next also adding
Cc: stable.

The failure is unrelated, see below.

> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11756_full -> Patchwork_105102v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_105102v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_105102v1_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (13 -> 13)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_105102v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@reset-stress:
>     - shard-snb:          [PASS][1] -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-snb7/igt@gem_eio@reset-stress.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-snb2/igt@gem_eio@reset-stress.html

<7> [109.948420] heartbeat vcs0 heartbeat {seqno:5:11771, prio:-2147483648} not ticking

SNB doesn't support MST, so it's some unrelated issue.

> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_11756_full and Patchwork_105102v1_full:
> 
> ### New IGT tests (5) ###
> 
>   * igt@kms_atomic_interruptible@legacy-setmode@hdmi-a-3-pipe-a:
>     - Statuses : 1 pass(s)
>     - Exec time: [6.14] s
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [8.02] s
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.91] s
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.93] s
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.94] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_105102v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_eio@in-flight-contexts-1us:
>     - shard-apl:          [PASS][3] -> [TIMEOUT][4] ([i915#3063])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl2/igt@gem_eio@in-flight-contexts-1us.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl2/igt@gem_eio@in-flight-contexts-1us.html
> 
>   * igt@gem_exec_balancer@parallel-keep-in-fence:
>     - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#4525]) +2 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-iclb2/igt@gem_exec_balancer@parallel-keep-in-fence.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html
> 
>   * igt@gem_exec_capture@pi@vcs0:
>     - shard-iclb:         [PASS][7] -> [INCOMPLETE][8] ([i915#3371])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-iclb7/igt@gem_exec_capture@pi@vcs0.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb1/igt@gem_exec_capture@pi@vcs0.html
> 
>   * igt@gem_exec_endless@dispatch@bcs0:
>     - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#3778])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-tglb2/igt@gem_exec_endless@dispatch@bcs0.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-tglb1/igt@gem_exec_endless@dispatch@bcs0.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-kbl:          NOTRUN -> [FAIL][11] ([i915#2842])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@bcs0:
>     - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#2842]) +1 similar issue
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-tglb2/igt@gem_exec_fair@basic-pace@bcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-iclb:         [PASS][14] -> [FAIL][15] ([i915#2842])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-iclb3/igt@gem_exec_fair@basic-pace@vecs0.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html
>     - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#2842]) +1 similar issue
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109283])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_lmem_swapping@heavy-random:
>     - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#4613])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@gem_lmem_swapping@heavy-random.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-skl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl10/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-kbl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl3/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#4613])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl3/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_ppgtt@flink-and-close-vma-leak:
>     - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#644])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
> 
>   * igt@gem_render_copy@yf-tiled-to-vebox-linear:
>     - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#768])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@gem_render_copy@yf-tiled-to-vebox-linear.html
> 
>   * igt@gem_spin_batch@spin-each:
>     - shard-skl:          [PASS][26] -> [FAIL][27] ([i915#2898])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-skl6/igt@gem_spin_batch@spin-each.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl2/igt@gem_spin_batch@spin-each.html
> 
>   * igt@gem_userptr_blits@input-checking:
>     - shard-skl:          NOTRUN -> [DMESG-WARN][28] ([i915#4991])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl1/igt@gem_userptr_blits@input-checking.html
> 
>   * igt@gem_userptr_blits@vma-merge:
>     - shard-skl:          NOTRUN -> [FAIL][29] ([i915#3318])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl10/igt@gem_userptr_blits@vma-merge.html
> 
>   * igt@gem_workarounds@suspend-resume:
>     - shard-apl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +1 similar issue
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl7/igt@gem_workarounds@suspend-resume.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl6/igt@gem_workarounds@suspend-resume.html
> 
>   * igt@gen9_exec_parse@bb-secure:
>     - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#2856])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@gen9_exec_parse@bb-secure.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#454])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#110892])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-skl:          NOTRUN -> [SKIP][36] ([fdo#109271]) +133 similar issues
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-skl:          NOTRUN -> [FAIL][37] ([i915#3743]) +2 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3886]) +2 similar issues
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>     - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109278] / [i915#3886])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>     - shard-skl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#3886]) +4 similar issues
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
>     - shard-kbl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#3886]) +4 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl3/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#3742])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-0-5:
>     - shard-skl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl6/igt@kms_color_chamelium@pipe-a-ctm-0-5.html
>     - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@kms_color_chamelium@pipe-a-ctm-0-5.html
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-max:
>     - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +2 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-max.html
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-negative:
>     - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +11 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl6/igt@kms_color_chamelium@pipe-d-ctm-negative.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#3116])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen:
>     - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271]) +173 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-64x64-rapid-movement:
>     - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278]) +4 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-64x64-rapid-movement.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109274] / [fdo#109278])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#2346] / [i915#533])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109274])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][54] -> [FAIL][55] ([i915#79])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271]) +82 similar issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl3/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
>     - shard-kbl:          [PASS][57] -> [FAIL][58] ([i915#79])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
>     - shard-kbl:          [PASS][59] -> [DMESG-WARN][60] ([i915#180]) +4 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1:
>     - shard-skl:          [PASS][61] -> [FAIL][62] ([i915#2122])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-skl10/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl2/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#3701])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
>     - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109280]) +2 similar issues
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-iclb:         NOTRUN -> [SKIP][65] ([i915#3555])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
>     - shard-skl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#533])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl10/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>     - shard-kbl:          NOTRUN -> [FAIL][67] ([fdo#108145] / [i915#265])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
>     - shard-skl:          NOTRUN -> [FAIL][68] ([i915#265])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl4/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
>     - shard-apl:          NOTRUN -> [FAIL][69] ([fdo#108145] / [i915#265])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-skl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#658]) +1 similar issue
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl4/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#658])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl3/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#658]) +3 similar issues
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl4/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-iclb:         NOTRUN -> [FAIL][73] ([i915#5939])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-iclb:         [PASS][74] -> [SKIP][75] ([fdo#109642] / [fdo#111068] / [i915#658])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb5/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@psr2_sprite_blt:
>     - shard-iclb:         [PASS][76] -> [SKIP][77] ([fdo#109441])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb3/igt@kms_psr@psr2_sprite_blt.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-skl:          NOTRUN -> [FAIL][78] ([IGT#2])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl10/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#2437])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl3/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@perf@polling-small-buf:
>     - shard-skl:          [PASS][80] -> [FAIL][81] ([i915#1722])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-skl4/igt@perf@polling-small-buf.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl10/igt@perf@polling-small-buf.html
> 
>   * igt@prime_nv_pcopy@test1_micro:
>     - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109291])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@prime_nv_pcopy@test1_micro.html
> 
>   * igt@sw_sync@sync_multi_timeline_wait:
>     - shard-skl:          NOTRUN -> [FAIL][83] ([i915#6140]) +1 similar issue
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl10/igt@sw_sync@sync_multi_timeline_wait.html
> 
>   * igt@sysfs_clients@create:
>     - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#2994])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@sysfs_clients@create.html
> 
>   * igt@sysfs_clients@sema-25:
>     - shard-kbl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#2994]) +1 similar issue
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl7/igt@sysfs_clients@sema-25.html
> 
>   * igt@sysfs_clients@split-10:
>     - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#2994])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl3/igt@sysfs_clients@split-10.html
> 
>   * igt@sysfs_clients@split-50:
>     - shard-skl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#2994]) +1 similar issue
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl4/igt@sysfs_clients@split-50.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_read@empty-block:
>     - {shard-rkl}:        [SKIP][88] ([i915#1845] / [i915#4098]) -> [PASS][89] +42 similar issues
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-1/igt@drm_read@empty-block.html
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@drm_read@empty-block.html
> 
>   * igt@drm_read@short-buffer-wakeup:
>     - shard-apl:          [DMESG-WARN][90] ([i915#62]) -> [PASS][91] +26 similar issues
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl3/igt@drm_read@short-buffer-wakeup.html
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl7/igt@drm_read@short-buffer-wakeup.html
> 
>   * igt@fbdev@read:
>     - {shard-rkl}:        [SKIP][92] ([i915#2582]) -> [PASS][93]
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-1/igt@fbdev@read.html
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@fbdev@read.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@bcs0:
>     - shard-apl:          [DMESG-WARN][94] ([i915#180]) -> [PASS][95] +2 similar issues
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html
> 
>   * igt@gem_eio@in-flight-contexts-1us:
>     - shard-tglb:         [TIMEOUT][96] ([i915#3063]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-tglb5/igt@gem_eio@in-flight-contexts-1us.html
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-tglb7/igt@gem_eio@in-flight-contexts-1us.html
> 
>   * igt@gem_eio@kms:
>     - shard-tglb:         [FAIL][98] ([i915#5784]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-tglb5/igt@gem_eio@kms.html
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-tglb7/igt@gem_eio@kms.html
> 
>   * igt@gem_exec_balancer@parallel-contexts:
>     - shard-iclb:         [SKIP][100] ([i915#4525]) -> [PASS][101] +2 similar issues
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-iclb7/igt@gem_exec_balancer@parallel-contexts.html
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-apl:          [FAIL][102] ([i915#2842]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - {shard-tglu}:       [FAIL][104] ([i915#2842]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-tglu-6/igt@gem_exec_fair@basic-pace@rcs0.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-tglu-5/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-tglb:         [SKIP][106] ([i915#2190]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-tglb6/igt@gem_huc_copy@huc-copy.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-tglb2/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_mmap_wc@set-cache-level:
>     - {shard-rkl}:        [SKIP][108] ([i915#1850]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-1/igt@gem_mmap_wc@set-cache-level.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html
> 
>   * igt@i915_pm_backlight@bad-brightness:
>     - {shard-rkl}:        [SKIP][110] ([i915#3012]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-2/igt@i915_pm_backlight@bad-brightness.html
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@i915_pm_backlight@bad-brightness.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>     - {shard-dg1}:        [SKIP][112] ([i915#1397]) -> [PASS][113] +1 similar issue
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-dg1-18/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@i915_pm_rps@waitboost:
>     - {shard-rkl}:        [FAIL][114] ([i915#4016]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-1/igt@i915_pm_rps@waitboost.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-1/igt@i915_pm_rps@waitboost.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-tglb:         [DMESG-WARN][116] ([i915#5591]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-tglb1/igt@i915_selftest@live@hangcheck.html
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-tglb7/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_selftest@perf@engine_cs:
>     - shard-apl:          [DMESG-WARN][118] -> [PASS][119] +4 similar issues
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl3/igt@i915_selftest@perf@engine_cs.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl7/igt@i915_selftest@perf@engine_cs.html
> 
>   * igt@kms_atomic@atomic_plane_damage:
>     - {shard-rkl}:        [SKIP][120] ([i915#4098]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-1/igt@kms_atomic@atomic_plane_damage.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_atomic@atomic_plane_damage.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-apl:          [DMESG-WARN][122] ([i915#1982] / [i915#62]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_color@pipe-a-legacy-gamma-reset:
>     - shard-apl:          [DMESG-WARN][124] ([i915#180] / [i915#62]) -> [PASS][125] +68 similar issues
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl3/igt@kms_color@pipe-a-legacy-gamma-reset.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl7/igt@kms_color@pipe-a-legacy-gamma-reset.html
>     - {shard-rkl}:        [SKIP][126] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][127] +4 similar issues
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-2/igt@kms_color@pipe-a-legacy-gamma-reset.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_color@pipe-a-legacy-gamma-reset.html
> 
>   * igt@kms_color@pipe-b-ctm-max:
>     - {shard-rkl}:        [SKIP][128] ([i915#1149] / [i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][129] +3 similar issues
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-2/igt@kms_color@pipe-b-ctm-max.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_color@pipe-b-ctm-max.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
>     - {shard-rkl}:        [SKIP][130] ([fdo#112022] / [i915#4070]) -> [PASS][131] +10 similar issues
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>     - shard-kbl:          [DMESG-WARN][132] ([i915#180]) -> [PASS][133] +2 similar issues
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
>     - {shard-rkl}:        [SKIP][134] ([fdo#111825] / [i915#4070]) -> [PASS][135] +3 similar issues
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled:
>     - {shard-rkl}:        [SKIP][136] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][137] +4 similar issues
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - {shard-rkl}:        [SKIP][138] ([fdo#110189] / [i915#3955]) -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-2/igt@kms_fbcon_fbt@psr.html
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-skl:          [FAIL][140] ([i915#4767]) -> [PASS][141]
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-skl7/igt@kms_fbcon_fbt@psr-suspend.html
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl9/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
>     - shard-glk:          [FAIL][142] ([i915#79]) -> [PASS][143]
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
>     - shard-skl:          [FAIL][144] ([i915#2122]) -> [PASS][145] +1 similar issue
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-skl9/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-skl1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@a-dp1:
>     - shard-apl:          [DMESG-WARN][146] ([i915#180] / [i915#1982] / [i915#62]) -> [PASS][147]
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl3/igt@kms_flip@wf_vblank-ts-check@a-dp1.html
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl7/igt@kms_flip@wf_vblank-ts-check@a-dp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - {shard-rkl}:        [SKIP][148] ([i915#3701]) -> [PASS][149] +1 similar issue
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-kbl:          [DMESG-WARN][150] ([i915#180] / [i915#1982]) -> [PASS][151]
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>     - {shard-rkl}:        [SKIP][152] ([i915#1849] / [i915#4098]) -> [PASS][153] +36 similar issues
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
>     - shard-kbl:          [FAIL][154] ([i915#1188]) -> [PASS][155]
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl3/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
> 
>   * igt@kms_invalid_mode@zero-clock:
>     - {shard-rkl}:        [SKIP][156] ([i915#4278]) -> [PASS][157]
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-2/igt@kms_invalid_mode@zero-clock.html
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_invalid_mode@zero-clock.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-b-planes:
>     - {shard-rkl}:        [SKIP][158] ([i915#1849] / [i915#3558]) -> [PASS][159] +1 similar issue
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-2/igt@kms_plane@plane-position-hole@pipe-b-planes.html
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.html
> 
>   * igt@kms_properties@crtc-properties-legacy:
>     - {shard-rkl}:        [SKIP][160] ([i915#1849]) -> [PASS][161] +1 similar issue
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-1/igt@kms_properties@crtc-properties-legacy.html
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html
> 
>   * igt@kms_psr@cursor_mmap_cpu:
>     - {shard-rkl}:        [SKIP][162] ([i915#1072]) -> [PASS][163] +2 similar issues
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-2/igt@kms_psr@cursor_mmap_cpu.html
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_psr@cursor_mmap_cpu.html
> 
>   * igt@kms_psr@psr2_sprite_mmap_gtt:
>     - shard-iclb:         [SKIP][164] ([fdo#109441]) -> [PASS][165]
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak-pipe-b:
>     - {shard-rkl}:        [SKIP][166] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][167] +2 similar issues
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-rkl-2/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html
> 
>   * igt@perf_pmu@idle@rcs0:
>     - {shard-dg1}:        [FAIL][168] ([i915#4349]) -> [PASS][169]
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-dg1-17/igt@perf_pmu@idle@rcs0.html
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-dg1-16/igt@perf_pmu@idle@rcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-iclb:         [SKIP][170] ([i915#4525]) -> [FAIL][171] ([i915#6117])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-apl:          [SKIP][172] ([fdo#109271]) -> [TIMEOUT][173] ([i915#1319])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl3/igt@kms_content_protection@atomic-dpms.html
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl7/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-kbl:          [INCOMPLETE][174] ([i915#180]) -> [FAIL][175] ([i915#4767])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
>     - shard-apl:          [DMESG-FAIL][176] ([i915#180] / [i915#62]) -> [FAIL][177] ([i915#265])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>     - shard-iclb:         [SKIP][178] ([fdo#111068] / [i915#658]) -> [SKIP][179] ([i915#2920])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-iclb:         [FAIL][180] ([i915#5939]) -> [SKIP][181] ([fdo#109642] / [fdo#111068] / [i915#658])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-iclb3/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@runner@aborted:
>     - shard-apl:          ([FAIL][182], [FAIL][183], [FAIL][184], [FAIL][185], [FAIL][186], [FAIL][187]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][188], [FAIL][189], [FAIL][190], [FAIL][191]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl2/igt@runner@aborted.html
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl4/igt@runner@aborted.html
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl2/igt@runner@aborted.html
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl4/igt@runner@aborted.html
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl6/igt@runner@aborted.html
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-apl1/igt@runner@aborted.html
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl7/igt@runner@aborted.html
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl8/igt@runner@aborted.html
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl6/igt@runner@aborted.html
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-apl2/igt@runner@aborted.html
>     - shard-kbl:          ([FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195], [FAIL][196], [FAIL][197], [FAIL][198]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#92]) -> ([FAIL][199], [FAIL][200], [FAIL][201], [FAIL][202], [FAIL][203]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl6/igt@runner@aborted.html
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl3/igt@runner@aborted.html
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl1/igt@runner@aborted.html
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl1/igt@runner@aborted.html
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl1/igt@runner@aborted.html
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl1/igt@runner@aborted.html
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11756/shard-kbl1/igt@runner@aborted.html
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl1/igt@runner@aborted.html
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl1/igt@runner@aborted.html
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl3/igt@runner@aborted.html
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl1/igt@runner@aborted.html
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/shard-kbl1/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
>   [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
>   [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
>   [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
>   [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
>   [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
>   [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2898]: https://gitlab.freedesktop.org/drm/intel/issues/2898
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>   [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
>   [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>   [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
>   [i915#3371]: https://gitlab.freedesktop.org/drm/intel/issues/3371
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
>   [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
>   [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
>   [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
>   [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
>   [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
>   [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
>   [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
>   [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_11756 -> Patchwork_105102v1
> 
>   CI-20190529: 20190529
>   CI_DRM_11756: 8c633a8be6329332d77800978f5a9c83adefdb2c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_6524: 4b17146f2a0504db694eb89e19d7f9f7f5051983 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_105102v1: 8c633a8be6329332d77800978f5a9c83adefdb2c @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_105102v1/index.html
