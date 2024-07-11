Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B23692EF25
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 20:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C7E10EB6E;
	Thu, 11 Jul 2024 18:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJXItARp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1931D10EB64;
 Thu, 11 Jul 2024 18:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720723780; x=1752259780;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=E31BSYTk56HT4ZUC/K04ZMFdG26wFcdVe8E91BvOfZI=;
 b=DJXItARpK5AW7/8mYEo/i3Yy+vWuNauDodm8zmOx/SdNbW0m6xD3S4UX
 bDhNmGSMoVN8OesjpULETN2wfa6vaIDcFmqUwAoBj+5v3lUB6N7S2SrUd
 PKR456DENmfsVcdKTgJuLWY7tQRN29uoJx5nskO1zqfkSjgi5kIYE+sxa
 D2ZHS4J0T5CsBez/JEhyOq61bnd3mtOV3evLm399dBnb2koFc0Ef7aLDY
 8C9acfiV5UsM8TLeOM9/73nGyPdOM1ZNSk/mD94sOmf/KBmlMa0cCy/Ws
 3MwqGVf8v1ii1Ewt4krLbFo2eiK8zTo48nAcQE8W+204aamKJEAuDDXf0 Q==;
X-CSE-ConnectionGUID: dmEdhJzHRqm9vWCtM+Sr1Q==
X-CSE-MsgGUID: X6S9jErgQKqFQP5ANvNM3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="22004904"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="22004904"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 11:49:40 -0700
X-CSE-ConnectionGUID: v0dIzXq5SzycJTOo1nHEGQ==
X-CSE-MsgGUID: vNvmCb2qSm66T60RCMsFBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="49078329"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 11:49:38 -0700
Date: Thu, 11 Jul 2024 21:49:50 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Ankit K Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyTIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= success for
 drm/i915/dp: Fix LTTPR detection (rev2)
Message-ID: <ZpApTskQ7GEWjMv-@ideak-desk.fi.intel.com>
References: <20240708190029.271247-1-imre.deak@intel.com>
 <172052354680.85573.2253853333241130600@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172052354680.85573.2253853333241130600@2413ebb6fbb6>
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

On Tue, Jul 09, 2024 at 11:12:26AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/dp: Fix LTTPR detection (rev2)
> URL   : https://patchwork.freedesktop.org/series/135711/
> State : success

Thanks for the reviews, pushed patches 1-4 to drm-intel-next, patch 5 to
drm-misc-next.

> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15045_full -> Patchwork_135711v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with Patchwork_135711v2_full need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_135711v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_135711v2_full:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
>     - shard-snb:          [FAIL][1] ([i915#11462]) -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_135711v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][3] ([i915#8411])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@api_intel_bb@object-reloc-keep-cache.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#11078])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@drm_fdinfo@isolation@vcs1:
>     - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8414]) +6 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@drm_fdinfo@isolation@vcs1.html
> 
>   * igt@drm_fdinfo@virtual-busy-hang-all:
>     - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8414])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@drm_fdinfo@virtual-busy-hang-all.html
> 
>   * igt@drm_fdinfo@virtual-idle:
>     - shard-rkl:          NOTRUN -> [FAIL][7] ([i915#7742])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@drm_fdinfo@virtual-idle.html
> 
>   * igt@gem_busy@semaphore:
>     - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#3936])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@gem_busy@semaphore.html
> 
>   * igt@gem_ccs@block-multicopy-compressed:
>     - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#9323])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@gem_ccs@block-multicopy-compressed.html
> 
>   * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>     - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#9323])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-dg2:          NOTRUN -> [ABORT][11] ([i915#9846])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#8562])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_persistence@heartbeat-many:
>     - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8555])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-many.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#280])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#280])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-16/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg1:          [PASS][16] -> [FAIL][17] ([i915#5784])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg1-18/igt@gem_eio@reset-stress.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_balancer@bonded-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#4771])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#4036])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_balancer@sliced:
>     - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#4812])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@gem_exec_balancer@sliced.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#6344])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-rkl:          [PASS][22] -> [FAIL][23] ([i915#2846])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html
>     - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#3539] / [i915#4852]) +4 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][25] ([i915#2842])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-glk4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-vip@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][26] ([i915#2842])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@gem_exec_fair@basic-none-vip@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-rkl:          [PASS][27] -> [FAIL][28] ([i915#2842])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle:
>     - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#3539])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@gem_exec_fair@basic-throttle.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#3539] / [i915#4852]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_exec_reloc@basic-active:
>     - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#3281]) +9 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@gem_exec_reloc@basic-active.html
> 
>   * igt@gem_exec_reloc@basic-gtt-read-noreloc:
>     - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#3281]) +3 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-scanout:
>     - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#3281]) +4 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@gem_exec_reloc@basic-scanout.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-chain:
>     - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4537] / [i915#4812]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
> 
>   * igt@gem_exec_schedule@semaphore-codependency:
>     - shard-dg1:          [PASS][35] -> [DMESG-WARN][36] ([i915#4423]) +2 other tests dmesg-warn
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg1-14/igt@gem_exec_schedule@semaphore-codependency.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-16/igt@gem_exec_schedule@semaphore-codependency.html
> 
>   * igt@gem_exec_schedule@semaphore-power:
>     - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#7276])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#2190])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#4613] / [i915#7582])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
>     - shard-dg2:          [PASS][40] -> [FAIL][41] ([i915#10378])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-2/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-5/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
> 
>   * igt@gem_lmem_swapping@massive-random:
>     - shard-glk:          NOTRUN -> [SKIP][42] ([i915#4613]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-glk7/igt@gem_lmem_swapping@massive-random.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#4613]) +3 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#4613]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg2:          [PASS][45] -> [TIMEOUT][46] ([i915#5493])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#4565])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html
> 
>   * igt@gem_media_vme:
>     - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#284])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@gem_media_vme.html
> 
>   * igt@gem_mmap_gtt@basic-small-copy-odd:
>     - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4077]) +3 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@gem_mmap_gtt@basic-small-copy-odd.html
> 
>   * igt@gem_mmap_wc@copy:
>     - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4083])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@gem_mmap_wc@copy.html
> 
>   * igt@gem_mmap_wc@write-gtt-read-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4083]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@gem_mmap_wc@write-gtt-read-wc.html
> 
>   * igt@gem_partial_pwrite_pread@write:
>     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3282]) +3 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@gem_partial_pwrite_pread@write.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads:
>     - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#3282]) +3 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_pread@snoop:
>     - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3282]) +4 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@gem_pread@snoop.html
> 
>   * igt@gem_pxp@create-protected-buffer:
>     - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4270])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@gem_pxp@create-protected-buffer.html
> 
>   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>     - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#4270])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#4270]) +2 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-on:
>     - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4270]) +3 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-16/igt@gem_pxp@reject-modify-context-protection-on.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#5190] / [i915#8428]) +5 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#8411]) +2 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4079])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_set_tiling_vs_gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4079])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@gem_set_tiling_vs_gtt.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3297]) +3 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-glk:          NOTRUN -> [SKIP][64] ([i915#3323])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@forbidden-operations:
>     - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3282] / [i915#3297])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@gem_userptr_blits@forbidden-operations.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>     - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3297] / [i915#4880])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#3297])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#2527]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@bb-chained:
>     - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#2527]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-16/igt@gen9_exec_parse@bb-chained.html
> 
>   * igt@gen9_exec_parse@bb-large:
>     - shard-tglu:         NOTRUN -> [SKIP][70] ([i915#2527] / [i915#2856])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@gen9_exec_parse@bb-large.html
> 
>   * igt@gen9_exec_parse@unaligned-access:
>     - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#2856]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@gen9_exec_parse@unaligned-access.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-rkl:          [PASS][72] -> [ABORT][73] ([i915#9820])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-tglu:         [PASS][74] -> [ABORT][75] ([i915#10887] / [i915#9820])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-10/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-dg2:          [PASS][76] -> [ABORT][77] ([i915#9820])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
>     - shard-dg1:          NOTRUN -> [FAIL][78] ([i915#3591])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#4387])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#6245])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][81] ([i915#9311])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@i915_selftest@mock@memory_region.html
>     - shard-glk:          NOTRUN -> [DMESG-WARN][82] ([i915#9311])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-glk3/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][83] ([i915#7443])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4077]) +4 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#5190]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-x-tiled-legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4212]) +2 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@kms_addfb_basic@basic-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#3826])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#8709]) +3 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#1769] / [i915#3555])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4538] / [i915#5286]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-dg2:          NOTRUN -> [SKIP][91] +10 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#5286]) +4 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#5286]) +2 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3638])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3638]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#4538] / [i915#5190]) +7 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4538]) +3 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_joiner@invalid-modeset-force-joiner:
>     - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#10656])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_big_joiner@invalid-modeset-force-joiner.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#10307] / [i915#6095]) +155 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#6095]) +51 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#6095]) +81 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#6095]) +19 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#11616] / [i915#7213]) +3 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-a-dp-4.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#7828]) +5 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-glk:          NOTRUN -> [SKIP][106] +138 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-glk4/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd:
>     - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#7828]) +5 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#7828]) +4 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#7828]) +4 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3116])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#3299])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#9424]) +1 other test skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#11453])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#3555]) +4 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#11453])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#3555]) +3 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][118] +20 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#4103] / [i915#4213]) +1 other test skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#4103]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-dg1:          [PASS][121] -> [DMESG-WARN][122] ([i915#10166])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg1-18/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-16/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-b:
>     - shard-glk:          NOTRUN -> [DMESG-WARN][123] ([i915#10166])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-glk3/igt@kms_cursor_legacy@torture-move@pipe-b.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#8588])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-16/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#3804])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2:          [PASS][126] -> [SKIP][127] ([i915#1257])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-11/igt@kms_dp_aux_dev.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-5/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#8812])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#3840] / [i915#9053])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#3469])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#1839])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#1839])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#658])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][134] -> [FAIL][135] ([i915#2122])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-snb2/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@2x-flip-vs-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#8381])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_flip@2x-flip-vs-fences.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#9934]) +2 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#3637]) +1 other test skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#2587] / [i915#2672]) +1 other test skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#2587] / [i915#2672]) +4 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#2672]) +3 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#2672]) +2 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#8708]) +7 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][144] +19 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
>     - shard-dg2:          [PASS][145] -> [FAIL][146] ([i915#6880])
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#3458]) +17 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
>     - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#1825]) +24 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#5354]) +21 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#5439])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#9766])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#3023]) +15 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#8708]) +5 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#3458]) +10 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
>     - shard-tglu:         NOTRUN -> [SKIP][155] +37 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#6118])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#3555] / [i915#8228])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#3555] / [i915#8228]) +1 other test skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#3555] / [i915#8228]) +1 other test skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#6301])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#3555] / [i915#8806])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [FAIL][162] ([i915#8292])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#9423]) +3 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#9423]) +11 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#9423]) +11 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#5235]) +7 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#5235]) +7 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#5235]) +7 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#5235] / [i915#9423]) +15 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#9812])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#9685])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#3361])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#9519])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#9519])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2:          [PASS][175] -> [SKIP][176] ([i915#9519])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-rkl:          [PASS][177] -> [SKIP][178] ([i915#9519]) +1 other test skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#6524])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#6524])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#11520]) +2 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
>     - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#11520]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#11520]) +3 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#11520]) +1 other test skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#9683])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#9683])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr-no-drrs:
>     - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#9732]) +12 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@kms_psr@fbc-psr-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr-primary-page-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#1072] / [i915#9732]) +5 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_psr@fbc-psr-primary-page-flip.html
> 
>   * igt@kms_psr@pr-cursor-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#1072] / [i915#9673] / [i915#9732]) +5 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_psr@pr-cursor-mmap-cpu.html
> 
>   * igt@kms_psr@pr-cursor-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#1072] / [i915#9732]) +13 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@kms_psr@pr-cursor-mmap-gtt.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#1072] / [i915#9732]) +13 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#5289])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#11131] / [i915#5190])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#3555]) +1 other test skip
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1:
>     - shard-snb:          NOTRUN -> [FAIL][195] ([i915#5465]) +3 other tests fail
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-dg1:          NOTRUN -> [FAIL][196] ([IGT#2] / [i915#6493])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#8623])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#3555])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#9906])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@kms_vrr@max-min.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#9906])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#9906])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#2437] / [i915#9412])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#2437])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#2437] / [i915#9412])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@global-sseu-config-invalid:
>     - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#7387])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@perf@global-sseu-config-invalid.html
> 
>   * igt@perf@non-zero-reason@0-rcs0:
>     - shard-dg2:          NOTRUN -> [FAIL][206] ([i915#9100])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@perf@non-zero-reason@0-rcs0.html
> 
>   * igt@perf_pmu@busy-double-start@rcs0:
>     - shard-mtlp:         [PASS][207] -> [FAIL][208] ([i915#4349])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#8516])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-17/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#3291] / [i915#3708])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-6/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#3708])
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#3291] / [i915#3708])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@prime_vgem@basic-write.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#9917])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-8/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each:
>     - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#9917])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@sriov_basic@enable-vfs-bind-unbind-each.html
> 
>   * igt@syncobj_wait@invalid-wait-zero-handles:
>     - shard-dg1:          NOTRUN -> [FAIL][215] ([i915#9781])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-15/igt@syncobj_wait@invalid-wait-zero-handles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglu:         [FAIL][216] ([i915#6268]) -> [PASS][217]
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglu:         [FAIL][218] ([i915#2842]) -> [PASS][219]
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - shard-tglu:         [ABORT][220] -> [PASS][221]
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-tglu-8/igt@gem_exec_suspend@basic-s3@smem.html
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-8/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
>     - shard-dg2:          [FAIL][222] ([i915#10378]) -> [PASS][223] +1 other test pass
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-1/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-6/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg1:          [ABORT][224] ([i915#9820]) -> [PASS][225]
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-glk:          [ABORT][226] ([i915#9820]) -> [PASS][227]
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-glk3/igt@i915_module_load@reload-with-fault-injection.html
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-glk4/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [FAIL][228] ([i915#2346]) -> [PASS][229]
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@a-vga1:
>     - shard-snb:          [FAIL][230] ([i915#2122]) -> [PASS][231] +1 other test pass
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible@a-vga1.html
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible@a-vga1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>     - shard-dg2:          [FAIL][232] ([i915#6880]) -> [PASS][233]
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>     - shard-snb:          [SKIP][234] -> [PASS][235] +3 other tests pass
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-dg2:          [SKIP][236] ([i915#9519]) -> [PASS][237] +1 other test pass
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-rkl:          [SKIP][238] ([i915#9519]) -> [PASS][239] +2 other tests pass
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
>     - shard-mtlp:         [FAIL][240] ([i915#9196]) -> [PASS][241]
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-tglu:         [FAIL][242] ([i915#9196]) -> [PASS][243]
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-tglu-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-mtlp:         [ABORT][244] ([i915#10131] / [i915#9820]) -> [ABORT][245] ([i915#10131] / [i915#10887] / [i915#9697])
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          [SKIP][246] ([i915#7118] / [i915#9424]) -> [SKIP][247] ([i915#7118] / [i915#7162] / [i915#9424])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-4/igt@kms_content_protection@type1.html
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg2:          [SKIP][248] ([i915#11453] / [i915#3359]) -> [SKIP][249] ([i915#11453]) +1 other test skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-5/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-dg1:          [SKIP][250] ([i915#9934]) -> [SKIP][251] ([i915#4423] / [i915#9934])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg1-14/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-16/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>     - shard-dg1:          [SKIP][252] -> [SKIP][253] ([i915#4423]) +2 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
>     - shard-dg2:          [SKIP][254] ([i915#10433] / [i915#3458]) -> [SKIP][255] ([i915#3458])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][256] ([i915#3458]) -> [SKIP][257] ([i915#10433] / [i915#3458]) +1 other test skip
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][258] ([i915#4070] / [i915#4816]) -> [SKIP][259] ([i915#4816])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_psr@fbc-pr-sprite-blt:
>     - shard-dg2:          [SKIP][260] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][261] ([i915#1072] / [i915#9732]) +9 other tests skip
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-11/igt@kms_psr@fbc-pr-sprite-blt.html
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-5/igt@kms_psr@fbc-pr-sprite-blt.html
> 
>   * igt@kms_psr@psr2-cursor-blt:
>     - shard-dg2:          [SKIP][262] ([i915#1072] / [i915#9732]) -> [SKIP][263] ([i915#1072] / [i915#9673] / [i915#9732]) +13 other tests skip
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-4/igt@kms_psr@psr2-cursor-blt.html
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_psr@psr2-cursor-blt.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2:          [SKIP][264] ([i915#11131] / [i915#4235]) -> [SKIP][265] ([i915#11131])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-11/igt@kms_rotation_crc@bad-tiling.html
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-5/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2:          [SKIP][266] ([i915#11131] / [i915#5190]) -> [SKIP][267] ([i915#11131] / [i915#4235] / [i915#5190])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2:          [SKIP][268] ([i915#11131]) -> [SKIP][269] ([i915#11131] / [i915#4235]) +1 other test skip
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-270.html
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
>   [i915#10166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
>   [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
>   [i915#11131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131
>   [i915#11453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453
>   [i915#11462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11462
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616
>   [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>   [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
>   [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
>   [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
>   [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
>   [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#3826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3826
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
>   [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
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
>   [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
>   [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
>   [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6118
>   [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>   [i915#6268]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6268
>   [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>   [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
>   [i915#6493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6493
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>   [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162
>   [i915#7213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213
>   [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
>   [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
>   [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
>   [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
>   [i915#7742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292
>   [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
>   [i915#8588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
>   [i915#8806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8806
>   [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
>   [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
>   [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
>   [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
>   [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
>   [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>   [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9697
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
>   [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
>   [i915#9846]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9846
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_15045 -> Patchwork_135711v2
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_15045: 1b010bec39a554cbbd0b51cbf49142e2f218013d @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_7919: 2c50c98273c55882bdc209fed77d0e40b24431f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_135711v2: 1b010bec39a554cbbd0b51cbf49142e2f218013d @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_135711v2/index.html
