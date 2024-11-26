Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E94F9D9776
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 13:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150E210E855;
	Tue, 26 Nov 2024 12:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvsJ4RRB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD2C10E3F3;
 Tue, 26 Nov 2024 12:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732625483; x=1764161483;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=xE0Pcy38aBVOAbo04bPNjbxPrzvjUBTbJe80vVGAd5A=;
 b=gvsJ4RRBA4PKiZfextitFs9lfdnF9fngZX9UHQFADnW+WoO2bRPsl2j3
 ImwlbOCGXPNRCIQ6kmag4W/VAqkh/LBe9Auf/7XXC/mZKUUBC7ydhlmZH
 IjetNt1JxI+CaJ43JzOpwUak9qZDdu9T8NMdvfLtLhLG0tQi+8tRa7qsa
 E9pv9K+3MrkdSEBx7kVzOsZ+1MwjywqpIcMi3fcLWwDwaGhR1scZO8WSX
 vjla1wM0bBUKCshDLhFXTeE0L1iJs63o9co7fBtclLGax+tz3U75btMuj
 bcU15AMjRtxL5EklT/tgnGB1yNDZSnUZRrzidWJ8C56xjgvojVsUYmUps g==;
X-CSE-ConnectionGUID: JWQX+ARpRzC6sfAXLbTUvQ==
X-CSE-MsgGUID: kagE4NNuR4+QOpfydzAHKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36707558"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="36707558"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 04:51:21 -0800
X-CSE-ConnectionGUID: lDztzTMpR1uBC1ERJursRA==
X-CSE-MsgGUID: DfT8NuFeTeuxNT0252XwFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="91720260"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 04:51:20 -0800
Date: Tue, 26 Nov 2024 14:51:57 +0200
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>, I915-ci-infra@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWls?= =?utf-8?Q?ure?= for
 drm/dp_mst: Fix MST sideband message body length check
Message-ID: <Z0XEbYDvtLB4DB9N@ideak-desk.fi.intel.com>
References: <20241125205314.1725887-1-imre.deak@intel.com>
 <173257228696.3006635.14827664566185260069@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173257228696.3006635.14827664566185260069@b555e5b46a47>
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

On Mon, Nov 25, 2024 at 10:04:46PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/dp_mst: Fix MST sideband message body length check
> URL   : https://patchwork.freedesktop.org/series/141772/
> State : failure

Thanks for the review, patch is pushed to drm-misc-fixes.

The failure below is unrelated, since the KBL machine doesn't have an
MST sink connected.

> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15743 -> Patchwork_141772v1
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_141772v1 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_141772v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141772v1/index.html
> 
> Participating hosts (45 -> 44)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_141772v1:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - fi-kbl-7567u:       [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15743/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141772v1/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_141772v1 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-rpls-4:         [PASS][3] -> [FAIL][4] ([i915#12903])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15743/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141772v1/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [PASS][5] -> [ABORT][6] ([i915#12061]) +1 other test abort
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15743/bat-mtlp-8/igt@i915_selftest@live.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141772v1/bat-mtlp-8/igt@i915_selftest@live.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@dmabuf@all-tests@dma_fence_chain:
>     - fi-bsw-nick:        [INCOMPLETE][7] ([i915#12904]) -> [PASS][8] +1 other test pass
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15743/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141772v1/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
> 
>   * igt@i915_selftest@live:
>     - bat-twl-2:          [ABORT][9] ([i915#12919]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15743/bat-twl-2/igt@i915_selftest@live.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141772v1/bat-twl-2/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - bat-twl-2:          [ABORT][11] -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15743/bat-twl-2/igt@i915_selftest@live@gt_pm.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141772v1/bat-twl-2/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-2:         [ABORT][13] ([i915#12061]) -> [PASS][14] +1 other test pass
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15743/bat-arlh-2/igt@i915_selftest@live@workarounds.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141772v1/bat-arlh-2/igt@i915_selftest@live@workarounds.html
>     - {bat-arls-6}:       [ABORT][15] ([i915#12061]) -> [PASS][16] +1 other test pass
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15743/bat-arls-6/igt@i915_selftest@live@workarounds.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141772v1/bat-arls-6/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
>     - bat-apl-1:          [DMESG-WARN][17] -> [PASS][18] +1 other test pass
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15743/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141772v1/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@a-dp1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
>   [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
>   [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_15743 -> Patchwork_141772v1
> 
>   CI-20190529: 20190529
>   CI_DRM_15743: 6510562075d8541c218e72188f9ef339f8ba371f @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_8124: 8124
>   Patchwork_141772v1: 6510562075d8541c218e72188f9ef339f8ba371f @ git://anongit.freedesktop.org/gfx-ci/linux
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141772v1/index.html
