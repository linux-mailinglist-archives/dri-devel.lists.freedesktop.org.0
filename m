Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC0695BFD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 09:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BB210E808;
	Tue, 14 Feb 2023 08:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B35E10E808;
 Tue, 14 Feb 2023 08:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676361942; x=1707897942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CWIV/X4A8G0EevjiVH0XxRulHNGz994WUMSOVSJoSvA=;
 b=AEUkzCFQ4nAuZ41VoD7T0dIhnyuOyoTfecdkvc0er078buClaEtHh8IC
 Iq5eXAFSmJ+DWvO5ipzm8DnONwol9wZKOKh02qWKQ/Ndp6y8eS+ot6cV/
 Y+DioKNQCFXVtf82Sz+MfJnkIHTqPnxM4eBU96I9lWeva1JpbwWsegyHx
 yoj/O3PbjuORz9KrT81P23lZz/WlLorQMJFDGqbIipu6W6Nd0tTHwcn57
 b3DG84o2W8KQAIU/vYz6xkBP+RW+iw6+MuoFIbjXAAGinromaD08zcnM1
 E9YsJyzdhzGoEthyHL5uTTqQBCg0PsiwwI7OHPH8sJgdY0aQzGyc635aH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="310738269"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="310738269"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:05:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="811931261"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="811931261"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.19.67])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:05:35 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: =?UTF-8?B?4pyT?= Fi.CI.BAT: success for Resolve barrier tasks
 list related issues
Date: Tue, 14 Feb 2023 09:05:32 +0100
Message-ID: <13632284.RDIVbhacDa@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <167633350233.8399.5809547591125640488@emeril.freedesktop.org>
References: <20230213232128.59217-1-janusz.krzysztofik@linux.intel.com>
 <167633350233.8399.5809547591125640488@emeril.freedesktop.org>
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

On Tuesday, 14 February 2023 01:11:42 CET Patchwork wrote:
> == Series Details ==
> 
> Series: Resolve barrier tasks list related issues
> URL   : https://patchwork.freedesktop.org/series/113975/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12734 -> Patchwork_113975v1
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/
index.html
> 
> Participating hosts (39 -> 37)
> ------------------------------
> 
>   Missing    (2): fi-kbl-soraka fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in 
Patchwork_113975v1:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@gem_barrier_race@remote-request@rcs0} (NEW):
>     - bat-dg1-5:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/bat-dg1-5/igt@gem_barrier_race@remote-request@rcs0.html
>     - fi-kbl-guc:         NOTRUN -> [ABORT][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/fi-kbl-guc/igt@gem_barrier_race@remote-request@rcs0.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@i915_selftest@live@uncore:
>     - {bat-adlp-9}:       [PASS][3] -> [DMESG-WARN][4] +5 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/bat-adlp-9/
igt@i915_selftest@live@uncore.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/bat-adlp-9/igt@i915_selftest@live@uncore.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_12734 and 
Patchwork_113975v1:
> 
> ### New IGT tests (2) ###
> 
>   * igt@gem_barrier_race@remote-request:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_barrier_race@remote-request@rcs0:
>     - Statuses : 2 abort(s) 29 pass(s) 4 skip(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_113975v1 that come from known 
issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * {igt@gem_barrier_race@remote-request@rcs0} (NEW):
>     - fi-pnv-d510:        NOTRUN -> [SKIP][5] ([fdo#109271])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/fi-pnv-d510/igt@gem_barrier_race@remote-request@rcs0.html
>     - fi-blb-e6850:       NOTRUN -> [SKIP][6] ([fdo#109271])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/fi-blb-e6850/igt@gem_barrier_race@remote-request@rcs0.html
>     - fi-ivb-3770:        NOTRUN -> [SKIP][7] ([fdo#109271])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/fi-ivb-3770/igt@gem_barrier_race@remote-request@rcs0.html
>     - fi-ilk-650:         NOTRUN -> [SKIP][8] ([fdo#109271])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/fi-ilk-650/igt@gem_barrier_race@remote-request@rcs0.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-glk-j4005:       [DMESG-FAIL][9] ([i915#5334]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/fi-glk-j4005/
igt@i915_selftest@live@gt_heartbeat.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

Hmm, results from this pre-merge run, unlike my former trybot attempts, show 
that my patches still don't resolve the issue of timeout on infinite 
__i915_active_wait().  Maybe I should retry with still more rigorous locking, 
or keep looking for still another root cause if that doesn't help.

Thanks,
Janusz

> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-skl-guc:         [DMESG-WARN][11] ([i915#8073]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12734/fi-skl-guc/
igt@i915_selftest@live@hangcheck.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_113975v1/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when 
computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
>   [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
>   [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
>   [i915#8073]: https://gitlab.freedesktop.org/drm/intel/issues/8073
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7160 -> TrybotIGT_706
>   * Linux: CI_DRM_12734 -> Patchwork_113975v1
> 
>   CI-20190529: 20190529
>   CI_DRM_12734: ffa7027c353c6821636559f42584dd11f527b0e0 @ git://
anongit.freedesktop.org/gfx-ci/linux
>   IGT_7160: 45da871dd2684227e93a2fc002b87dfc58bd5fd9 @ https://
gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_113975v1: ffa7027c353c6821636559f42584dd11f527b0e0 @ git://
anongit.freedesktop.org/gfx-ci/linux
>   TrybotIGT_706: https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_706/
index.html
> 
> 
> ### Linux commits
> 
> 33537b06edaa drm/i915/active: Serialize access to barrier tasks lists
> bc4b58c4f439 drm/i915/active: Fix misuse of non-idle barriers as fence 
trackers
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/
Patchwork_113975v1/index.html
> 




