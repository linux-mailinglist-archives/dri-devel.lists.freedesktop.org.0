Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EFF694A7B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 16:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EFF10E5E4;
	Mon, 13 Feb 2023 15:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D0C10E5E4;
 Mon, 13 Feb 2023 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676301181; x=1707837181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H36clka671RDw1FhzSGBSeD52zHbFPjr8GiDS8is9xY=;
 b=ExORhCieDoDLlDjfs+EIz9c7b2KTIzE2deJDYo6XFOmy42yOFcGfr/BW
 r3FAf8aR1i878dMxGexx0U9YQ2sAOPL7k+tmFD0Z8d8w5k8Cl5GeZsRNC
 j6FLDpkDptxr4UzHHJjuxRHGDrjaK+3/BaXEoFEe4bqTKeIEeOjU9/z6J
 TG3JtV4CnsFuRezPK6CayZAQ3G3xCTdr/TZ2kLmOtNml3xQFtyFOAtnFB
 EHZnR4OZBm6U3+X3MWPOnbb2r1F4DHo/xOfeNBDMvcGNjqixj+9EQyA7P
 YxiVU6JTdi9fVuRIsGhZRx50VRaLjcSKitH1UoSjPXhvldcvbY6iS7FWV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="310541854"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="310541854"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 07:13:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="792758879"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="792758879"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.19.172])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 07:12:57 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: =?UTF-8?B?4pyT?= Fi.CI.BAT: success for drm/i915/active: Fix
 misuse of non-idle barriers as fence trackers
Date: Mon, 13 Feb 2023 16:12:54 +0100
Message-ID: <3663372.MHq7AAxBmi@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <167629606262.20213.9123371560394852051@emeril.freedesktop.org>
References: <20230213130546.20370-1-janusz.krzysztofik@linux.intel.com>
 <167629606262.20213.9123371560394852051@emeril.freedesktop.org>
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

On Monday, 13 February 2023 14:47:42 CET Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/active: Fix misuse of non-idle barriers as fence trackers
> URL   : https://patchwork.freedesktop.org/series/113950/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12730 -> Patchwork_113950v1
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113950v1/index.html
> 
> Participating hosts (40 -> 37)
> ------------------------------
> 
>   Missing    (3): fi-tgl-1115g4 bat-atsm-1 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_113950v1:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

No mor list corruptions, only issues already reported by the new 
igt@gem_barrier_race@remote-request test before (without this patch in place).

>   * {igt@gem_barrier_race@remote-request@rcs0} (NEW):
>     - fi-rkl-11600:       NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113950v1/fi-rkl-11600/igt@gem_barrier_race@remote-request@rcs0.html
>     - bat-dg1-5:          NOTRUN -> [ABORT][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113950v1/bat-dg1-5/igt@gem_barrier_race@remote-request@rcs0.html

Infinite __i915_active_wait(), similar to 
https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_706/fi-cfl-8109u/igt@gem_barrier_race@remote-request@rcs0.html

>     - {bat-adlm-1}:       NOTRUN -> [DMESG-WARN][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113950v1/bat-adlm-1/igt@gem_barrier_race@remote-request@rcs0.html

Suspicious RCU usage, equivalent to 
https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_706/bat-dg1-7/igt@gem_barrier_race@remote-request@rcs0.html,
also seen before, e.g., 
https://gitlab.freedesktop.org/drm/intel/-/issues/7390, 
https://gitlab.freedesktop.org/drm/intel/-/issues/6616

Thanks,
Janusz

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_12730 and Patchwork_113950v1:
> 
> ### New IGT tests (2) ###
> 
>   * igt@gem_barrier_race@remote-request:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_barrier_race@remote-request@rcs0:
>     - Statuses : 2 abort(s) 1 dmesg-warn(s) 27 pass(s) 5 skip(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_113950v1 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * {igt@gem_barrier_race@remote-request@rcs0} (NEW):
>     - fi-pnv-d510:        NOTRUN -> [SKIP][4] ([fdo#109271])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113950v1/fi-pnv-d510/igt@gem_barrier_race@remote-request@rcs0.html
>     - fi-blb-e6850:       NOTRUN -> [SKIP][5] ([fdo#109271])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113950v1/fi-blb-e6850/igt@gem_barrier_race@remote-request@rcs0.html
>     - fi-ivb-3770:        NOTRUN -> [SKIP][6] ([fdo#109271])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113950v1/fi-ivb-3770/igt@gem_barrier_race@remote-request@rcs0.html
>     - fi-elk-e7500:       NOTRUN -> [SKIP][7] ([fdo#109271])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113950v1/fi-elk-e7500/igt@gem_barrier_race@remote-request@rcs0.html
>     - fi-ilk-650:         NOTRUN -> [SKIP][8] ([fdo#109271])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113950v1/fi-ilk-650/igt@gem_barrier_race@remote-request@rcs0.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-apl-guc:         [DMESG-FAIL][9] ([i915#5334]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12730/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113950v1/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@requests:
>     - {bat-rpls-2}:       [ABORT][11] ([i915#7982]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12730/bat-rpls-2/igt@i915_selftest@live@requests.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113950v1/bat-rpls-2/igt@i915_selftest@live@requests.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
>     - fi-bsw-n3050:       [FAIL][13] ([i915#6298]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12730/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113950v1/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
>   [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
>   [i915#7996]: https://gitlab.freedesktop.org/drm/intel/issues/7996
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7157 -> TrybotIGT_706
>   * Linux: CI_DRM_12730 -> Patchwork_113950v1
> 
>   CI-20190529: 20190529
>   CI_DRM_12730: c54b5fcf3e686a0abfdd7d6af53e9014c137023a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_7157: 96d12fdc942cee9526a951b377b195ca9c8276b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_113950v1: c54b5fcf3e686a0abfdd7d6af53e9014c137023a @ git://anongit.freedesktop.org/gfx-ci/linux
>   TrybotIGT_706: https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_706/index.html
> 
> 
> ### Linux commits
> 
> 44de67f6c674 drm/i915/active: Fix misuse of non-idle barriers as fence trackers
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113950v1/index.html
> 




