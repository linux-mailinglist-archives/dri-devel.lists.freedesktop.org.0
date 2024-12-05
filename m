Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687999E598B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 16:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870D610E0C3;
	Thu,  5 Dec 2024 15:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMBlCUqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32B010E0C3;
 Thu,  5 Dec 2024 15:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733411786; x=1764947786;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Mx+4/o/8oIIH4mHrEFvJSQ/ewNY+D/g6AZ4xa0VUXtg=;
 b=hMBlCUqPGh8BE5qFnz5Jug/XcWeVcTND1ctXHNby7acrvM+Le3uJ4qMu
 sjlhIyJRMZsvxZFahqBxrXYEZXs3yYEqXPKGZCh/pwFb7FfYY66AI8fNf
 bN9q138bQro2zUCE6ouoVtKi44Y8lM5bxbT/rTnFjOdZvuOXVvUZoZTYo
 kbz0Ja6xsMlhjeR7YgNn33k37jb4sdv70oB6OFL1MEuOGG0kqaCVaxb8x
 ow02Y319vnkzbq8QWyjdJWMUo3cra3fsPIUHkL07UHeiXD9EBSPMYekBB
 QXeZI2xaSQHoY+AaJ2X7kLcseG2cle1UeGDvPds+Foyp6uUwu6LSpQBJF w==;
X-CSE-ConnectionGUID: 7fUtfjiQRcaZEMVND+x2Sw==
X-CSE-MsgGUID: QZKh4UcCSaKl8S8uq4T/YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33610669"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33610669"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:16:24 -0800
X-CSE-ConnectionGUID: sHPqtT8ESP+WUklnRiXi9g==
X-CSE-MsgGUID: 36FaoXimRoGmGRaMNDUJ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94473014"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:16:22 -0800
Date: Thu, 5 Dec 2024 17:16:59 +0200
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyTIGk5MTUuQ0kuRnVsbDogc3Vj?=
 =?utf-8?Q?cess_for_drm=2Fdp=5Fmst?= =?utf-8?Q?=3A?= Fix a few side-band
 message handling issues (rev3)
Message-ID: <Z1HD63uXVJD0kT3h@ideak-desk.fi.intel.com>
References: <20241203160223.2926014-1-imre.deak@intel.com>
 <173332622484.2548676.16715906961846112377@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173332622484.2548676.16715906961846112377@b555e5b46a47>
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

On Wed, Dec 04, 2024 at 03:30:24PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/dp_mst: Fix a few side-band message handling issues (rev3)
> URL   : https://patchwork.freedesktop.org/series/142057/
> State : success

Thanks for the review, patchset is pushed to drm-misc-fixes.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15786_full -> Patchwork_142057v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with Patchwork_142057v3_full need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_142057v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (9 -> 10)
> ------------------------------
> 
>   Additional (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_142057v3_full:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-rkl:          [DMESG-FAIL][1] ([i915#12964]) -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15786/shard-rkl-1/igt@gem_softpin@noreloc-s3.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-5/igt@gem_softpin@noreloc-s3.html
> 
>   
> 
> ### Piglit changes ###
> 
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - pig-kbl-iris:       NOTRUN -> [{DMESG-WARN}][3] +3 other tests {dmesg-warn}
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/pig-kbl-iris/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_142057v3_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-dg1-12/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@gem_ctx_param@set-priority-not-supported:
>     - shard-tglu-1:       NOTRUN -> [SKIP][5] +5 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-1/igt@gem_ctx_param@set-priority-not-supported.html
> 
>   * igt@gem_ctx_persistence@hostile:
>     - shard-tglu:         NOTRUN -> [FAIL][6] ([i915#11980] / [i915#12580])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-5/igt@gem_ctx_persistence@hostile.html
> 
>   * igt@gem_exec_balancer@indices:
>     - shard-mtlp:         NOTRUN -> [ABORT][7] ([i915#13218]) +1 other test abort
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-mtlp-4/igt@gem_exec_balancer@indices.html
> 
>   * igt@gem_exec_reloc@basic-concurrent0:
>     - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#3281])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@gem_exec_reloc@basic-concurrent0.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#4860])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-mtlp-4/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_pxp@fail-invalid-protected-context:
>     - shard-rkl:          NOTRUN -> [TIMEOUT][10] ([i915#12964])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@gem_pxp@fail-invalid-protected-context.html
> 
>   * igt@gem_readwrite@beyond-eob:
>     - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#3282])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@gem_readwrite@beyond-eob.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>     - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#3297])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-mtlp-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#6412])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#8436])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-mtlp-4/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@i915_pm_rc6_residency@media-rc6-accuracy:
>     - shard-mtlp:         NOTRUN -> [SKIP][15] +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-mtlp-4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-tglu-1:       NOTRUN -> [DMESG-WARN][16] ([i915#9311]) +1 other test dmesg-warn
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-1/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - shard-tglu:         NOTRUN -> [ABORT][17] ([i915#13218]) +2 other tests abort
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-5/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-rkl:          [PASS][18] -> [ABORT][19] ([i915#13218])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15786/shard-rkl-7/igt@i915_suspend@fence-restore-tiled2untiled.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-5/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-tglu-1:       NOTRUN -> [ABORT][20] ([i915#13218]) +3 other tests abort
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-1/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8709]) +11 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html
> 
>   * igt@kms_async_flips@crc:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][22] ([i915#12964]) +5 other tests dmesg-warn
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_async_flips@crc.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#5286])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#3638])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][25]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#6095]) +4 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-5/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#10307] / [i915#6095]) +19 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-dg2-1/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][28] ([i915#6095]) +4 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-1/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#6095]) +9 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#6095]) +7 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#3742])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-tglu-1:       NOTRUN -> [SKIP][32] ([i915#7828]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#7828]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-5/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#7828])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][35] ([i915#3116] / [i915#3299])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#3555])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-tglu-1:       NOTRUN -> [SKIP][37] ([i915#4103]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#3555] / [i915#3840])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#9934]) +3 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
>     - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#2672] / [i915#3555])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][41] ([i915#2587] / [i915#2672])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-rte:
>     - shard-dg2:          [PASS][43] -> [FAIL][44] ([i915#6880])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15786/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#8708]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-tglu:         NOTRUN -> [SKIP][46] +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
>     - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#1825]) +3 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
>     - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#3023]) +2 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
>     - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#12247]) +4 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-tglu-1:       NOTRUN -> [SKIP][50] ([i915#9812])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#9685])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#3361])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#11520])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-pr-sprite-mmap-cpu:
>     - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#1072] / [i915#9732]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@kms_psr@fbc-pr-sprite-mmap-cpu.html
> 
>   * igt@kms_psr@fbc-psr-primary-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#9732]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-5/igt@kms_psr@fbc-psr-primary-blt.html
> 
>   * igt@kms_psr@fbc-psr2-dpms:
>     - shard-tglu-1:       NOTRUN -> [SKIP][56] ([i915#9732])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-1/igt@kms_psr@fbc-psr2-dpms.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#3555])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-5/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#2437] / [i915#9412])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-tglu-1/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@polling@0-rcs0:
>     - shard-rkl:          NOTRUN -> [ABORT][59] ([i915#13218]) +1 other test abort
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@perf@polling@0-rcs0.html
> 
>   * igt@perf_pmu@busy-accuracy-2@rcs0:
>     - shard-dg1:          NOTRUN -> [ABORT][60] ([i915#13218]) +3 other tests abort
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-dg1-12/igt@perf_pmu@busy-accuracy-2@rcs0.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-rkl:          [ABORT][61] ([i915#13218]) -> [PASS][62]
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15786/shard-rkl-5/igt@i915_suspend@sysfs-reader.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-7/igt@i915_suspend@sysfs-reader.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][63] ([i915#3458]) -> [SKIP][64] ([i915#10433] / [i915#3458]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15786/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][65] ([i915#4816]) -> [SKIP][66] ([i915#4070] / [i915#4816])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15786/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11980]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980
>   [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
>   [i915#12580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12580
>   [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
>   [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
>   [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8436
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
>   [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
>   [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
>   [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_15786 -> Patchwork_142057v3
> 
>   CI-20190529: 20190529
>   CI_DRM_15786: c8df5caf278df4f9ca0aba627047c5ee4318fc0d @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_8137: 8137
>   Patchwork_142057v3: c8df5caf278df4f9ca0aba627047c5ee4318fc0d @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_142057v3/index.html
