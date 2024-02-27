Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA09869B24
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 16:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218B310E85A;
	Tue, 27 Feb 2024 15:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDliegJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472C710E2F6;
 Tue, 27 Feb 2024 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709049045; x=1740585045;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=VWOHOuScyKgPBHfjUKR+fC6DrUHodes7uYhGg1KUKvA=;
 b=KDliegJcaSvlbSafFbXmINr6GjsOk+MVY1Uyo8PKBpRHmiEFmtv82N50
 4WkMO0iaUa+JkcY8ObF7oVJBQ6NGiukpTTNSsqOIkpwixmS7guTtH1d6v
 nYfrFXCnK7PaOKCl26AxMheLeFqg5+V8P+3V86tr6jpN3AGCUXQN0/+9M
 C+GJtpiIrh8VxUancHqkOFt02rvCgIpIpDU8/K5ZYdha5q2OvEiMNoxjb
 HfJxlj76l1FtECc31s/IPQy+10NDfO9J3uCfMDnKz0yTicWMwP4El29Y3
 2kjDtn7M2ZwJrNjH3RYEXFnPwngeU9bMCH7bdzU96wn/bbs68AmVlCjjX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="20940388"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="20940388"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 07:50:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7027129"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 07:50:42 -0800
Date: Tue, 27 Feb 2024 17:51:05 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jouni Hogander <jouni.hogander@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?=
 =?utf-8?Q?e_for_drm=2Fi915?= =?utf-8?Q?=3A?= Add Display Port tunnel BW
 allocation support (rev6)
Message-ID: <Zd4E6aCguAnm+imO@ideak-desk.fi.intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <170904368955.337360.17984430833255893803@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170904368955.337360.17984430833255893803@8e613ede5ea5>
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

On Tue, Feb 27, 2024 at 02:21:29PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915: Add Display Port tunnel BW allocation support (rev6)
> URL   : https://patchwork.freedesktop.org/series/129082/
> State : failure

Thanks for the reviews,acks, patchset is pushed to drm-intel-next. The
failure is unrelated see below.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14345_full -> Patchwork_129082v6_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_129082v6_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_129082v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_129082v6_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-snb:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-snb7/igt@kms_fbcon_fbt@fbc-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-snb7/igt@kms_fbcon_fbt@fbc-suspend.html

No TBT/DP tunnels on the above machine, an unrelated system/suspend
resume problem in the EPB driver:

<7>[  554.320951] Calling intel_epb_restore+0x0/0xb0
<4>[  554.320956] unchecked MSR access error: RDMSR from 0x1b0 at rIP: 0xffffffff8104d4d3 (intel_epb_restore+0x13/0xb0)

The same was already reported at:
https://gitlab.freedesktop.org/drm/intel/-/issues/10007

> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
>     - shard-snb:          [SKIP][3] ([fdo#109271]) -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_129082v6_full that come from known issues:
> 
> ### CI changes ###
> 
> #### Possible fixes ####
> 
>   * boot:
>     - shard-glk:          ([PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [FAIL][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28], [FAIL][29]) ([i915#8293]) -> ([PASS][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk9/boot.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk9/boot.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk9/boot.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk8/boot.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk8/boot.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk8/boot.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk7/boot.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk7/boot.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk7/boot.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk5/boot.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk5/boot.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk5/boot.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk4/boot.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk4/boot.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk4/boot.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk3/boot.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk3/boot.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk3/boot.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk3/boot.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk2/boot.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk2/boot.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk2/boot.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk1/boot.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk1/boot.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk1/boot.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk1/boot.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk1/boot.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk1/boot.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk1/boot.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk2/boot.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk2/boot.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk2/boot.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk3/boot.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk3/boot.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk3/boot.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk4/boot.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk4/boot.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk4/boot.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk5/boot.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk5/boot.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk5/boot.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk7/boot.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk7/boot.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk7/boot.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk8/boot.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk8/boot.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk9/boot.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk9/boot.html
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk9/boot.html
> 
>   
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#8411]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#7701])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@drm_fdinfo@virtual-busy-idle-all:
>     - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#8414]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@drm_fdinfo@virtual-busy-idle-all.html
> 
>   * igt@gem_ctx_persistence@heartbeat-stop:
>     - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#8555])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-stop.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-tglu:         NOTRUN -> [SKIP][58] ([i915#280])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_eio@kms:
>     - shard-dg1:          NOTRUN -> [FAIL][59] ([i915#5784])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@gem_eio@kms.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [PASS][60] -> [FAIL][61] ([i915#5784])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-dg1-18/igt@gem_eio@unwedge-stress.html
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-19/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4812])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          NOTRUN -> [FAIL][63] ([i915#2846])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk9/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-flow:
>     - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4473] / [i915#4771]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@gem_exec_fair@basic-flow.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][65] ([i915#2842])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][66] ([i915#2842])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-rkl:          [PASS][67] -> [FAIL][68] ([i915#2842]) +4 other tests fail
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-uc:
>     - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3539] / [i915#4852])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
> 
>   * igt@gem_exec_flush@basic-uc-ro-default:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3539] / [i915#4852]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@gem_exec_flush@basic-uc-ro-default.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#5107])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_exec_params@secure-non-master:
>     - shard-mtlp:         NOTRUN -> [SKIP][72] ([fdo#112283]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@gem_exec_params@secure-non-master.html
> 
>   * igt@gem_exec_reloc@basic-concurrent0:
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3281]) +4 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-13/igt@gem_exec_reloc@basic-concurrent0.html
> 
>   * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
>     - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#3281]) +3 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-write-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3281]) +7 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@gem_exec_reloc@basic-write-gtt.html
> 
>   * igt@gem_exec_suspend@basic-s0@lmem0:
>     - shard-dg2:          [PASS][76] -> [INCOMPLETE][77] ([i915#9275])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-dg2-5/igt@gem_exec_suspend@basic-s0@lmem0.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@gem_exec_suspend@basic-s0@lmem0.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][78] ([i915#7975] / [i915#8213])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> 
>   * igt@gem_fence_thrash@bo-copy:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4860]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@gem_fence_thrash@bo-copy.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4860]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][81] ([i915#4613]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>   * igt@gem_lmem_swapping@verify-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#4613]) +3 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk9/igt@gem_lmem_swapping@verify-ccs.html
> 
>   * igt@gem_lmem_swapping@verify-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4565])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4613])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@gem_lmem_swapping@verify-random-ccs.html
> 
>   * igt@gem_mmap_gtt@basic-small-bo:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4077]) +4 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@gem_mmap_gtt@basic-small-bo.html
> 
>   * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
>     - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4077])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html
> 
>   * igt@gem_mmap_gtt@ptrace:
>     - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4077]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@gem_mmap_gtt@ptrace.html
> 
>   * igt@gem_mmap_wc@fault-concurrent:
>     - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4083]) +3 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@gem_mmap_wc@fault-concurrent.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-display:
>     - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#3282]) +6 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-tglu:         NOTRUN -> [WARN][90] ([i915#2658])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#4270])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4270]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_readwrite@read-write:
>     - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3282])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-13/igt@gem_readwrite@read-write.html
> 
>   * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#5190]) +5 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#8428])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#4079])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#4079])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4885])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_userptr_blits@coherency-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3297])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@gem_userptr_blits@coherency-unsync.html
>     - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#3297])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-13/igt@gem_userptr_blits@coherency-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#3297])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gen7_exec_parse@basic-allowed:
>     - shard-tglu:         NOTRUN -> [SKIP][102] ([fdo#109289]) +3 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@gen7_exec_parse@basic-allowed.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [PASS][103] -> [ABORT][104] ([i915#5566])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk1/igt@gen9_exec_parse@allowed-all.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk1/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@bb-start-far:
>     - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#2856]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@gen9_exec_parse@bb-start-far.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#2856])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api:
>     - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#8399])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@i915_pm_freq_api@freq-basic-api.html
> 
>   * igt@i915_pm_rps@min-max-config-loaded:
>     - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#6621])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@i915_pm_rps@min-max-config-loaded.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#7707])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#4215] / [i915#5190])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#8709]) +3 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#4538] / [i915#5286]) +1 other test skip
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-13/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-tglu:         NOTRUN -> [SKIP][113] ([fdo#111615] / [i915#5286]) +1 other test skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][114] ([fdo#111614]) +4 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][115] ([fdo#111614]) +2 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-tglu:         NOTRUN -> [SKIP][116] ([fdo#111614])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#3638]) +1 other test skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-mtlp:         NOTRUN -> [SKIP][118] ([fdo#111615]) +2 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#4538] / [i915#5190]) +6 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-tglu:         [PASS][120] -> [FAIL][121] ([i915#3743]) +1 other test fail
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-tglu:         NOTRUN -> [SKIP][122] ([fdo#111615])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4538])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#3742])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#7213] / [i915#9010])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4087]) +3 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#7828]) +2 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2:          NOTRUN -> [SKIP][128] ([fdo#111827])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg1:          NOTRUN -> [SKIP][129] ([fdo#111827])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-13/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#7828]) +6 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#7828]) +1 other test skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
>     - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#7828]) +2 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#3299])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#9424])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#7118] / [i915#9424]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#3359]) +1 other test skip
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#3359])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
>     - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#8814])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#3555] / [i915#8814])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([fdo#109274] / [i915#5354]) +2 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#4213])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-snb:          [PASS][142] -> [SKIP][143] ([fdo#109271]) +3 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-snb7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#9809]) +1 other test skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-tglu:         NOTRUN -> [SKIP][145] ([fdo#109274] / [fdo#111767])
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-tglu:         NOTRUN -> [SKIP][146] ([fdo#109274])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][147] ([fdo#110189] / [i915#9723])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][148] ([fdo#110189] / [i915#9723])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-12/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1:
>     - shard-snb:          NOTRUN -> [SKIP][149] ([fdo#109271] / [fdo#110189])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#3555]) +1 other test skip
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#3804])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#3555] / [i915#8812])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#3840] / [i915#9688])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#3840] / [i915#9053])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#4854])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#3637])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#8381])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-modeset:
>     - shard-tglu:         NOTRUN -> [SKIP][158] ([fdo#109274] / [i915#3637] / [i915#3966]) +1 other test skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_flip@2x-flip-vs-modeset.html
> 
>   * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][159] ([fdo#109274]) +5 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-dg1:          NOTRUN -> [SKIP][160] ([fdo#111825] / [i915#9934]) +2 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-tglu:         NOTRUN -> [SKIP][161] ([fdo#109274] / [i915#3637])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#2587] / [i915#2672])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#2587] / [i915#2672]) +1 other test skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#2672]) +3 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-dg2:          NOTRUN -> [SKIP][165] ([fdo#109285])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>     - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#1825]) +7 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][167] ([fdo#111767] / [i915#5354])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][168] ([fdo#109280]) +8 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#5354]) +21 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][170] ([fdo#111825]) +6 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#8708]) +3 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#3458]) +14 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>     - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#3458]) +4 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-glk:          NOTRUN -> [SKIP][174] ([fdo#109271]) +104 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>     - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#10070])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#8708]) +6 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#8708]) +4 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#6118])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#3555] / [i915#8228]) +1 other test skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([fdo#109289]) +2 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-dg2:          NOTRUN -> [SKIP][181] ([fdo#109274] / [i915#5354] / [i915#9423])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [FAIL][182] ([i915#8292])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#9423]) +7 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#9423]) +11 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#5176] / [i915#9423]) +1 other test skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#5176] / [i915#9423]) +3 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-16/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#9423]) +5 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#5235]) +11 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#5235]) +15 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-16/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#5235] / [i915#9423]) +3 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#9685])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#9685])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-dg2:          [PASS][193] -> [FAIL][194] ([i915#8717])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-dg2-10/igt@kms_pm_rpm@i2c.html
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-2/igt@kms_pm_rpm@i2c.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#9519])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-dg2:          [PASS][196] -> [SKIP][197] ([i915#9519])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-rkl:          [PASS][198] -> [SKIP][199] ([i915#9519]) +1 other test skip
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#6524] / [i915#6805])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-glk:          NOTRUN -> [SKIP][201] ([fdo#109271] / [fdo#110189]) +1 other test skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
>     - shard-tglu:         NOTRUN -> [SKIP][202] ([fdo#110189]) +7 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][203] ([fdo#110189]) +2 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>     - shard-dg1:          NOTRUN -> [SKIP][204] ([fdo#110189])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#4348])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr-primary-mmap-gtt@edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#9688]) +2 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_psr@fbc-psr-primary-mmap-gtt@edp-1.html
> 
>   * igt@kms_psr@psr-cursor-render:
>     - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#9732]) +15 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@kms_psr@psr-cursor-render.html
> 
>   * igt@kms_psr@psr2-primary-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#9732]) +4 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_psr@psr2-primary-mmap-cpu.html
> 
>   * igt@kms_psr@psr2-sprite-mmap-gtt:
>     - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#9732]) +3 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_psr@psr2-sprite-mmap-gtt.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-rkl:          [PASS][210] -> [INCOMPLETE][211] ([i915#8875] / [i915#9569])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-rkl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#4235]) +2 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#4235]) +1 other test skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3555]) +1 other test skip
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#3555]) +3 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#8623])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-rkl:          [PASS][217] -> [FAIL][218] ([i915#9196])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-rkl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-tglu:         [PASS][219] -> [FAIL][220] ([i915#9196])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#9906])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#2437] / [i915#9412])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-glk:          NOTRUN -> [SKIP][223] ([fdo#109271] / [i915#2437])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk9/igt@kms_writeback@writeback-pixel-formats.html
>     - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#2437] / [i915#9412])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@mi-rpc:
>     - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#2434] / [i915#7387])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@perf@mi-rpc.html
> 
>   * igt@perf_pmu@event-wait@rcs0:
>     - shard-tglu:         NOTRUN -> [SKIP][226] ([fdo#112283])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@perf_pmu@event-wait@rcs0.html
> 
>   * igt@perf_pmu@frequency@gt0:
>     - shard-dg2:          NOTRUN -> [FAIL][227] ([i915#6806])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@perf_pmu@frequency@gt0.html
>     - shard-dg1:          NOTRUN -> [FAIL][228] ([i915#6806])
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-13/igt@perf_pmu@frequency@gt0.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#8516])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@prime_udl:
>     - shard-dg2:          NOTRUN -> [SKIP][230] ([fdo#109291])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@prime_udl.html
> 
>   * igt@prime_vgem@basic-write:
>     - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#3291] / [i915#3708])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@prime_vgem@basic-write.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-tglu:         NOTRUN -> [SKIP][232] ([fdo#109295])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@prime_vgem@fence-write-hang:
>     - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#3708]) +1 other test skip
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@prime_vgem@fence-write-hang.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#9917])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each:
>     - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#9917])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@sriov_basic@enable-vfs-bind-unbind-each.html
> 
>   * igt@syncobj_wait@invalid-wait-zero-handles:
>     - shard-dg1:          NOTRUN -> [FAIL][236] ([i915#9779])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@syncobj_wait@invalid-wait-zero-handles.html
> 
>   * igt@v3d/v3d_perfmon@create-two-perfmon:
>     - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#2575]) +2 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@v3d/v3d_perfmon@create-two-perfmon.html
> 
>   * igt@v3d/v3d_submit_cl@single-out-sync:
>     - shard-tglu:         NOTRUN -> [SKIP][238] ([fdo#109315] / [i915#2575]) +2 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@v3d/v3d_submit_cl@single-out-sync.html
> 
>   * igt@v3d/v3d_submit_csd@bad-extension:
>     - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#2575]) +1 other test skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@v3d/v3d_submit_csd@bad-extension.html
> 
>   * igt@v3d/v3d_submit_csd@single-out-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#2575]) +9 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-5/igt@v3d/v3d_submit_csd@single-out-sync.html
> 
>   * igt@vc4/vc4_label_bo@set-bad-name:
>     - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#7711]) +1 other test skip
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-3/igt@vc4/vc4_label_bo@set-bad-name.html
> 
>   * igt@vc4/vc4_perfmon@create-perfmon-0:
>     - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#2575])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-4/igt@vc4/vc4_perfmon@create-perfmon-0.html
> 
>   * igt@vc4/vc4_tiling@set-bad-modifier:
>     - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#7711]) +1 other test skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@vc4/vc4_tiling@set-bad-modifier.html
> 
>   * igt@vc4/vc4_wait_bo@bad-bo:
>     - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#7711]) +4 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-1/igt@vc4/vc4_wait_bo@bad-bo.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          [FAIL][245] ([i915#7742]) -> [PASS][246]
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglu:         [FAIL][247] ([i915#6268]) -> [PASS][248]
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_exec_fair@basic-none@vecs0:
>     - shard-rkl:          [FAIL][249] ([i915#2842]) -> [PASS][250]
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-rkl-1/igt@gem_exec_fair@basic-none@vecs0.html
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-7/igt@gem_exec_fair@basic-none@vecs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-glk:          [FAIL][251] ([i915#2842]) -> [PASS][252]
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [TIMEOUT][253] ([i915#5493]) -> [PASS][254]
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg1:          [INCOMPLETE][255] ([i915#10137] / [i915#9820] / [i915#9849]) -> [PASS][256]
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-rkl:          [FAIL][257] ([i915#10031]) -> [PASS][258]
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-2/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-mtlp:         [FAIL][259] ([i915#3763] / [i915#5138]) -> [PASS][260]
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-mtlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-tglu:         [FAIL][261] ([i915#3743]) -> [PASS][262]
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-tglu-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-tglu-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-snb:          [SKIP][263] ([fdo#109271] / [fdo#111767]) -> [PASS][264]
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-snb6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-snb7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-snb:          [SKIP][265] ([fdo#109271]) -> [PASS][266] +3 other tests pass
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-snb6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-snb7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          [FAIL][267] ([i915#2346]) -> [PASS][268]
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-dg2:          [SKIP][269] ([i915#9519]) -> [PASS][270]
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-rkl:          [SKIP][271] ([i915#9519]) -> [PASS][272] +2 other tests pass
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@perf@non-zero-reason@0-rcs0:
>     - shard-dg2:          [FAIL][273] ([i915#7484]) -> [PASS][274]
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-dg2-10/igt@perf@non-zero-reason@0-rcs0.html
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg2-10/igt@perf@non-zero-reason@0-rcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@atomic:
>     - shard-snb:          [INCOMPLETE][275] ([i915#8816]) -> [SKIP][276] ([fdo#109271])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-snb7/igt@kms_content_protection@atomic.html
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-snb2/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-dg1:          [SKIP][277] ([i915#9424]) -> [SKIP][278] ([i915#9433])
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-dg1-15/igt@kms_content_protection@mei-interface.html
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-dg1-12/igt@kms_content_protection@mei-interface.html
>     - shard-snb:          [SKIP][279] ([fdo#109271]) -> [INCOMPLETE][280] ([i915#9878])
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-snb6/igt@kms_content_protection@mei-interface.html
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-snb7/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-snb:          [SKIP][281] ([fdo#109271] / [fdo#111767]) -> [SKIP][282] ([fdo#109271])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-snb:          [SKIP][283] ([fdo#109271]) -> [SKIP][284] ([fdo#109271] / [fdo#111767])
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-snb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][285] ([i915#4070] / [i915#4816]) -> [SKIP][286] ([i915#4816])
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-rkl:          [FAIL][287] ([i915#9295]) -> [SKIP][288] ([i915#3361])
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/shard-rkl-4/igt@kms_pm_dc@dc6-dpms.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#10031]: https://gitlab.freedesktop.org/drm/intel/issues/10031
>   [i915#10070]: https://gitlab.freedesktop.org/drm/intel/issues/10070
>   [i915#10137]: https://gitlab.freedesktop.org/drm/intel/issues/10137
>   [i915#10307]: https://gitlab.freedesktop.org/drm/intel/issues/10307
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
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
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3763]: https://gitlab.freedesktop.org/drm/intel/issues/3763
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
>   [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
>   [i915#5107]: https://gitlab.freedesktop.org/drm/intel/issues/5107
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6118]: https://gitlab.freedesktop.org/drm/intel/issues/6118
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
>   [i915#6806]: https://gitlab.freedesktop.org/drm/intel/issues/6806
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
>   [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
>   [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
>   [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8293]: https://gitlab.freedesktop.org/drm/intel/issues/8293
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
>   [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8717]: https://gitlab.freedesktop.org/drm/intel/issues/8717
>   [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
>   [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
>   [i915#8816]: https://gitlab.freedesktop.org/drm/intel/issues/8816
>   [i915#8875]: https://gitlab.freedesktop.org/drm/intel/issues/8875
>   [i915#9010]: https://gitlab.freedesktop.org/drm/intel/issues/9010
>   [i915#9053]: https://gitlab.freedesktop.org/drm/intel/issues/9053
>   [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
>   [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
>   [i915#9295]: https://gitlab.freedesktop.org/drm/intel/issues/9295
>   [i915#9412]: https://gitlab.freedesktop.org/drm/intel/issues/9412
>   [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
>   [i915#9433]: https://gitlab.freedesktop.org/drm/intel/issues/9433
>   [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
>   [i915#9569]: https://gitlab.freedesktop.org/drm/intel/issues/9569
>   [i915#9685]: https://gitlab.freedesktop.org/drm/intel/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
>   [i915#9723]: https://gitlab.freedesktop.org/drm/intel/issues/9723
>   [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
>   [i915#9779]: https://gitlab.freedesktop.org/drm/intel/issues/9779
>   [i915#9809]: https://gitlab.freedesktop.org/drm/intel/issues/9809
>   [i915#9820]: https://gitlab.freedesktop.org/drm/intel/issues/9820
>   [i915#9849]: https://gitlab.freedesktop.org/drm/intel/issues/9849
>   [i915#9878]: https://gitlab.freedesktop.org/drm/intel/issues/9878
>   [i915#9906]: https://gitlab.freedesktop.org/drm/intel/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/intel/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/intel/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_14345 -> Patchwork_129082v6
> 
>   CI-20190529: 20190529
>   CI_DRM_14345: b3552bf1e79de200a6ca49c518ead46a1256618c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_129082v6: b3552bf1e79de200a6ca49c518ead46a1256618c @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129082v6/index.html
