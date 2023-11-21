Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 110327F37C0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 21:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9B710E540;
	Tue, 21 Nov 2023 20:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE70010E2C4;
 Tue, 21 Nov 2023 20:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700600069; x=1732136069;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=EpNKvq9HPk+9l0Kr6CSsXAdLYFICjotj9jqZ58qTPnE=;
 b=ESZK8P0UH/15FtEt6QbGGHcPdpHiWMuYZk7yWIuefGkw+kyDFJAAgR8w
 sqYpUmFEE5AhO8e/9mqp4HWn8XQZzB1MOjrHsSDn8sw2Dmsg4K4WSiz84
 PgCmxow4DXwDkfwsW2XMQ5+wYWKJNkqchvnUMq8ppWu17ORpSsP/ngCyk
 z3xxWbxiaMOapvHQovM9xkFevRlq4JnvCRP/GtGxli30VyK0Hu8+dQlPu
 En4AGbhDtoRL/mAESm9GPl6L4KtGI4iM+sHE36R40tQYHuIkrhV44bsE4
 EixpNenJeMwPvDEaGTESBd2PTg7R105s3Uj98AG+bzz7ZnMrE3GYxbK7t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="371277210"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="371277210"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 12:54:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="832782711"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="832782711"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 12:54:04 -0800
Date: Tue, 21 Nov 2023 22:54:05 +0200
From: Imre Deak <imre.deak@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Lyude Paul <lyude@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, Wayne Lin <wayne.lin@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: Re: =?utf-8?B?4pyTIEZpLkNJLkJBVDogc3VjY2Vz?= =?utf-8?Q?s_fo?=
 =?utf-8?Q?r?= drm/i915: Fix UHBR data, link M/N/TU and PBN values (rev6)
Message-ID: <ZV0Y7Yxxlw2ZduF6@ideak-desk.fi.intel.com>
References: <20231116131841.1588781-1-imre.deak@intel.com>
 <170053425347.30157.9127672548112308422@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170053425347.30157.9127672548112308422@emeril.freedesktop.org>
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
Cc: intel-gfx@lists.freedesktop.org, lgci.bug.filing@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 21, 2023 at 02:37:33AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915: Fix UHBR data, link M/N/TU and PBN values (rev6)
> URL   : https://patchwork.freedesktop.org/series/126526/
> State : success

Thanks for the reviews and acks, the patchset is pushed to drm-intel-next.

I had to rebase patch 1 on drm-intel-next as described in
https://lore.kernel.org/all/ZVy2rGFvp2cXaCoc@ideak-desk.fi.intel.com/

and then resolve the corresponding conflict merging drm-intel-next and
drm-misc-next (resulting in the original change in patch 1):

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index c7a29bb737e2,53e323b71d26..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@@ -209,11 -210,11 +210,11 @@@ static void dm_helpers_construct_old_pa
                        struct drm_dp_mst_atomic_payload *new_payload,
                        struct drm_dp_mst_atomic_payload *old_payload)
  {
 -      struct link_mst_stream_allocation_table current_link_table =
 -                                                                      link->mst_stream_alloc_table;
 -      struct link_mst_stream_allocation *dc_alloc;
 -      int pbn_per_slot = dfixed_trunc(pbn_per_slot_fp);
 -      int i;
 +      struct drm_dp_mst_atomic_payload *pos;
-       int pbn_per_slot = mst_state->pbn_div;
++      int pbn_per_slot = dfixed_trunc(mst_state->pbn_div);
 +      u8 next_payload_vc_start = mgr->next_start_slot;
 +      u8 payload_vc_start = new_payload->vc_start_slot;
 +      u8 allocated_time_slots;

        *old_payload = *new_payload;

The IGT full test results using CI_DRM_13898_full as base (thanks to
Jani for the help with this) with one unrelated failure commented on
inline:

*  CI Bug Log - changes from CI_DRM_13898_full -> Patchwork_126526v6_full
*  Summary
*  FAILURE
*  
*  Serious unknown changes coming with Patchwork_126526v6_full absolutely need to be
*  verified manually.
*  
*  If you think the reported changes have nothing to do with the changes
*  introduced in Patchwork_126526v6_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
*  to document this new failure mode, which will reduce false positives in CI.
*  
*  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/index.html
*  
*  Participating hosts (10 -> 11)
*  Additional (1): shard-mtlp0
*  
*  Possible new issues
*  Here are the unknown changes that may have been introduced in Patchwork_126526v6_full:
*  
*  IGT changes
*  Possible regressions
*  igt@i915_selftest@live@requests:
*  shard-mtlp: NOTRUN -> DMESG-FAIL +1 other test dmesg-fail

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/shard-mtlp-8/igt@i915_selftest@live@requests.html

<6> [411.388436] i915: Running i915_request_live_selftests/live_cancel_request
<3> [411.398207] i915 0000:00:02.0: [drm] *ERROR* GT1: live_cancel_request(rcs0): engine 'other0' was reset -1 times!
<3> [411.423402] i915/i915_request_live_selftests: live_cancel_request failed with error -5


The platform doesn't have any external monitors attached, so can't see how the changes
in the patchset would be related. The closest issue (without a ticket filed for it) looks
to be:

https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13906/bat-mtlp-6/igt@i915_selftest@live@requests.html#dmesg-warnings741

<7> [266.125209] i915 0000:00:02.0: [drm:i915_gem_open [i915]] 
<6> [267.264820] Completed 281 waits for 8482 fences across 6 engines and 4 cpus
<3> [267.265605] i915 0000:00:02.0: [drm] *ERROR* GT1: live_breadcrumbs_smoketest(): engine 'other0' was reset -1 times!
<3> [267.276018] i915/i915_request_live_selftests: live_breadcrumbs_smoketest failed with error -5


*  New tests
*  New tests have been introduced between CI_DRM_13898_full and Patchwork_126526v6_full:
*  
*  New IGT tests (15)
*  igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-dp-4:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-dp-4:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_cursor_crc@cursor-random-128x128@pipe-a-dp-4:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-dp-4:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-dp-4:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-dp-4:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_plane_cursor@overlay@pipe-a-dp-4-size-128:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_plane_cursor@overlay@pipe-a-dp-4-size-256:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_plane_cursor@overlay@pipe-a-dp-4-size-64:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_plane_cursor@viewport@pipe-a-dp-4-size-128:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_plane_cursor@viewport@pipe-a-dp-4-size-256:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_plane_cursor@viewport@pipe-a-dp-4-size-64:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-dp-4:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a-dp-4:
*  
*  Statuses : 1 pass(s)
*  Exec time: [0.0] s
*  igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_calc_pbn_div:
*  
*  Statuses : 6 pass(s)
*  Exec time: [0.0] s
*  Known issues
*  Here are the changes found in Patchwork_126526v6_full that come from known issues:
*  
*  CI changes
*  Issues hit
*  boot:
*  shard-glk: (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS) -> (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, FAIL, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS) (i915#8293)
*  IGT changes
*  Issues hit
*  igt@device_reset@unbind-cold-reset-rebind:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#7701)
*  igt@drm_fdinfo@most-busy-check-all@bcs0:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#8414) +19 other tests skip
*  igt@drm_fdinfo@most-busy-check-all@rcs0:
*  
*  shard-rkl: PASS -> FAIL (i915#7742) +1 other test fail
*  igt@drm_fdinfo@virtual-busy-all:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#8414)
*  shard-mtlp: NOTRUN -> SKIP (i915#8414) +1 other test skip
*  igt@gem_caching@writes:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#4873)
*  igt@gem_ctx_exec@basic-nohangcheck:
*  
*  shard-tglu: PASS -> FAIL (i915#6268)
*  igt@gem_ctx_sseu@invalid-args:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#280)
*  igt@gem_eio@reset-stress:
*  
*  shard-dg1: PASS -> FAIL (i915#5784)
*  igt@gem_eio@wait-wedge-immediate:
*  
*  shard-mtlp: PASS -> ABORT (i915#9262)
*  igt@gem_exec_balancer@hog:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#4812)
*  igt@gem_exec_balancer@sliced:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#4812)
*  igt@gem_exec_capture@capture-invisible@smem0:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#6334)
*  igt@gem_exec_fair@basic-none-rrul@rcs0:
*  
*  shard-tglu: NOTRUN -> FAIL (i915#2842)
*  igt@gem_exec_fair@basic-none-vip:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#4473 / i915#4771)
*  igt@gem_exec_fair@basic-none-vip@rcs0:
*  
*  shard-rkl: NOTRUN -> FAIL (i915#2842)
*  igt@gem_exec_fair@basic-pace-solo@rcs0:
*  
*  shard-rkl: PASS -> FAIL (i915#2842) +1 other test fail
*  igt@gem_exec_fair@basic-throttle@rcs0:
*  
*  shard-tglu: PASS -> FAIL (i915#2842) +1 other test fail
*  igt@gem_exec_flush@basic-uc-ro-default:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 other test skip
*  igt@gem_exec_params@rsvd2-dirt:
*  
*  shard-dg2: NOTRUN -> SKIP (fdo#109283 / i915#5107)
*  igt@gem_exec_params@secure-non-master:
*  
*  shard-tglu: NOTRUN -> SKIP (fdo#112283)
*  igt@gem_exec_reloc@basic-cpu-wc-active:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#3281) +5 other tests skip
*  igt@gem_exec_reloc@basic-gtt-read-active:
*  
*  shard-rkl: NOTRUN -> SKIP (i915#3281)
*  igt@gem_exec_reloc@basic-write-read-active:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#3281) +2 other tests skip
*  igt@gem_exec_reloc@basic-write-wc-active:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#3281) +2 other tests skip
*  igt@gem_exec_suspend@basic-s4-devices@lmem0:
*  
*  shard-dg2: NOTRUN -> ABORT (i915#7975 / i915#8213) +1 other test abort
*  igt@gem_fenced_exec_thrash@2-spare-fences:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#4860) +1 other test skip
*  igt@gem_fenced_exec_thrash@no-spare-fences:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#4860)
*  igt@gem_lmem_swapping@parallel-random-verify:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#4613)
*  igt@gem_lmem_swapping@smem-oom@lmem0:
*  
*  shard-dg2: NOTRUN -> DMESG-WARN (i915#4936 / i915#5493)
*  igt@gem_lmem_swapping@verify-random-ccs:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#4613) +1 other test skip
*  igt@gem_lmem_swapping@verify-random-ccs@lmem0:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#4565)
*  igt@gem_mmap@bad-object:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#4083) +1 other test skip
*  igt@gem_mmap_gtt@basic-read-write-distinct:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#4077) +7 other tests skip
*  igt@gem_mmap_gtt@basic-write-read-distinct:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#4077) +6 other tests skip
*  igt@gem_mmap_wc@read:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#4083)
*  igt@gem_partial_pwrite_pread@reads-snoop:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#3282) +2 other tests skip
*  igt@gem_pxp@create-valid-protected-context:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#4270) +2 other tests skip
*  igt@gem_pxp@protected-encrypted-src-copy-not-readible:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#4270) +1 other test skip
*  igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
*  igt@gem_readwrite@write-bad-handle:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#3282) +1 other test skip
*  igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#8428) +1 other test skip
*  igt@gem_set_tiling_vs_blt@untiled-to-tiled:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#4079) +1 other test skip
*  igt@gem_softpin@evict-snoop:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#4885)
*  shard-mtlp: NOTRUN -> SKIP (i915#4885)
*  igt@gem_tiled_blits@basic:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#4077) +1 other test skip
*  igt@gem_unfence_active_buffers:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#4879)
*  igt@gem_userptr_blits@coherency-sync:
*  
*  shard-rkl: NOTRUN -> SKIP (fdo#110542)
*  shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 other test skip
*  igt@gem_userptr_blits@forbidden-operations:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#3282)
*  igt@gem_userptr_blits@map-fixed-invalidate-overlap:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
*  igt@gem_userptr_blits@readonly-unsync:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#3297)
*  igt@gen7_exec_parse@cmd-crossing-page:
*  
*  shard-tglu: NOTRUN -> SKIP (fdo#109289)
*  igt@gen9_exec_parse@allowed-all:
*  
*  shard-rkl: NOTRUN -> SKIP (i915#2527)
*  shard-mtlp: NOTRUN -> SKIP (i915#2856) +1 other test skip
*  igt@gen9_exec_parse@allowed-single:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#2527)
*  igt@gen9_exec_parse@basic-rejected:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856)
*  igt@gen9_exec_parse@secure-batches:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#2856)
*  igt@i915_module_load@reload-with-fault-injection:
*  
*  shard-dg2: PASS -> DMESG-WARN (i915#9559)
*  shard-snb: PASS -> INCOMPLETE (i915#9200)
*  igt@i915_pm_freq_mult@media-freq@gt0:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#6590)
*  igt@i915_pm_freq_mult@media-freq@gt1:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#6590) +1 other test skip
*  igt@i915_pm_rps@basic-api:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#6621)
*  igt@i915_pm_rps@min-max-config-idle:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#6621)
*  igt@i915_pm_rps@reset:
*  
*  shard-snb: PASS -> INCOMPLETE (i915#7790)
*  igt@i915_selftest@mock@memory_region:
*  
*  shard-mtlp: NOTRUN -> DMESG-WARN (i915#9311)
*  igt@kms_addfb_basic@basic-y-tiled-legacy:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#4215)
*  shard-mtlp: NOTRUN -> SKIP (i915#4212)
*  igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#3826)
*  igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
*  
*  shard-dg2: NOTRUN -> FAIL (i915#8247) +3 other tests fail
*  igt@kms_async_flips@crc@pipe-c-hdmi-a-1:
*  
*  shard-dg1: NOTRUN -> FAIL (i915#8247) +3 other tests fail
*  igt@kms_atomic@plane-primary-overlay-mutable-zpos:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#9531)
*  igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#1769 / i915#3555)
*  igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
*  
*  shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#5286) +1 other test skip
*  igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
*  
*  shard-mtlp: PASS -> FAIL (i915#5138)
*  igt@kms_big_fb@linear-32bpp-rotate-90:
*  
*  shard-tglu: NOTRUN -> SKIP (fdo#111614) +2 other tests skip
*  igt@kms_big_fb@x-tiled-16bpp-rotate-270:
*  
*  shard-mtlp: NOTRUN -> SKIP (fdo#111614) +1 other test skip
*  igt@kms_big_fb@x-tiled-32bpp-rotate-270:
*  
*  shard-dg2: NOTRUN -> SKIP (fdo#111614) +1 other test skip
*  igt@kms_big_fb@x-tiled-64bpp-rotate-270:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#3638)
*  igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
*  
*  shard-tglu: PASS -> FAIL (i915#3743) +1 other test fail
*  igt@kms_big_fb@y-tiled-8bpp-rotate-180:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#5190) +6 other tests skip
*  igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#4538) +1 other test skip
*  igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +3 other tests skip
*  igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
*  
*  shard-tglu: NOTRUN -> SKIP (fdo#111615) +3 other tests skip
*  igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
*  
*  shard-mtlp: NOTRUN -> SKIP (fdo#111615) +6 other tests skip
*  igt@kms_big_joiner@2x-modeset:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#2705)
*  igt@kms_cdclk@mode-transition-all-outputs:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#7213)
*  igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#7213) +3 other tests skip
*  igt@kms_chamelium_audio@hdmi-audio-edid:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#7828) +2 other tests skip
*  igt@kms_chamelium_color@ctm-0-75:
*  
*  shard-dg2: NOTRUN -> SKIP (fdo#111827)
*  igt@kms_chamelium_color@degamma:
*  
*  shard-dg1: NOTRUN -> SKIP (fdo#111827)
*  shard-mtlp: NOTRUN -> SKIP (fdo#111827)
*  igt@kms_chamelium_edid@hdmi-mode-timings:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#7828) +4 other tests skip
*  igt@kms_chamelium_hpd@dp-hpd-fast:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#7828) +1 other test skip
*  igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#7828) +5 other tests skip
*  igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
*  
*  shard-rkl: NOTRUN -> SKIP (i915#7828) +1 other test skip
*  igt@kms_color@deep-color@pipe-a-hdmi-a-2-gamma:
*  
*  shard-rkl: NOTRUN -> FAIL (i915#6892) +1 other test fail
*  igt@kms_content_protection@lic:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#6944)
*  shard-rkl: NOTRUN -> SKIP (i915#7118)
*  igt@kms_cursor_crc@cursor-onscreen-512x170:
*  
*  shard-rkl: NOTRUN -> SKIP (fdo#109279 / i915#3359)
*  igt@kms_cursor_crc@cursor-random-512x512:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#3359)
*  igt@kms_cursor_crc@cursor-rapid-movement-32x10:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#3555) +5 other tests skip
*  igt@kms_cursor_crc@cursor-sliding-32x10:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#3555)
*  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814)
*  igt@kms_cursor_crc@cursor-sliding-512x170:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#3359) +2 other tests skip
*  igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#3546) +2 other tests skip
*  igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
*  
*  shard-dg2: NOTRUN -> SKIP (fdo#109274 / i915#5354) +1 other test skip
*  igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
*  
*  shard-tglu: NOTRUN -> SKIP (fdo#109274 / fdo#111767)
*  igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213)
*  shard-mtlp: NOTRUN -> SKIP (i915#4213)
*  igt@kms_display_modes@extended-mode-basic:
*  
*  shard-rkl: NOTRUN -> SKIP (i915#3555)
*  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8827)
*  igt@kms_dsc@dsc-with-formats:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
*  igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
*  
*  shard-mtlp: NOTRUN -> SKIP (fdo#111767 / i915#3637)
*  shard-dg1: NOTRUN -> SKIP (fdo#111767 / fdo#111825)
*  igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
*  
*  shard-tglu: NOTRUN -> SKIP (fdo#109274 / i915#3637) +2 other tests skip
*  igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
*  
*  shard-dg2: NOTRUN -> SKIP (fdo#109274) +1 other test skip
*  shard-snb: NOTRUN -> SKIP (fdo#109271) +7 other tests skip
*  igt@kms_flip@2x-plain-flip:
*  
*  shard-rkl: NOTRUN -> SKIP (fdo#111825)
*  shard-mtlp: NOTRUN -> SKIP (i915#3637) +1 other test skip
*  igt@kms_flip@flip-vs-fences-interruptible:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#8381)
*  igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#8810)
*  igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672)
*  igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 other tests skip
*  igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#2672) +1 other test skip
*  igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
*  
*  shard-rkl: NOTRUN -> SKIP (i915#2672)
*  igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#2672) +1 other test skip
*  igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810)
*  igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555)
*  igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
*  
*  shard-rkl: NOTRUN -> SKIP (fdo#111825 / i915#1825) +3 other tests skip
*  igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#1825) +24 other tests skip
*  igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#8708) +9 other tests skip
*  igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#5354) +15 other tests skip
*  igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
*  
*  shard-dg1: NOTRUN -> SKIP (fdo#111825) +9 other tests skip
*  igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#8708) +2 other tests skip
*  shard-mtlp: NOTRUN -> SKIP (i915#8708) +3 other tests skip
*  igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#3458) +9 other tests skip
*  igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
*  
*  shard-rkl: NOTRUN -> SKIP (i915#3023) +1 other test skip
*  igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#3458) +1 other test skip
*  igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite:
*  
*  shard-tglu: NOTRUN -> SKIP (fdo#109280) +13 other tests skip
*  igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
*  
*  shard-tglu: NOTRUN -> SKIP (fdo#110189) +8 other tests skip
*  igt@kms_getfb@getfb-reject-ccs:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#6118)
*  igt@kms_hdr@static-swap:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests skip
*  igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#1839)
*  igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
*  
*  shard-dg1: NOTRUN -> SKIP (fdo#109289)
*  shard-mtlp: NOTRUN -> SKIP (fdo#109289) +2 other tests skip
*  igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
*  
*  shard-dg2: NOTRUN -> SKIP (fdo#109289) +1 other test skip
*  igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#5176 / i915#9423) +3 other tests skip
*  igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#5176 / i915#9423) +3 other tests skip
*  igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:
*  
*  shard-rkl: NOTRUN -> SKIP (i915#5235) +1 other test skip
*  igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#5235) +15 other tests skip
*  igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#5235) +7 other tests skip
*  igt@kms_prime@basic-crc-hybrid:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805) +1 other test skip
*  igt@kms_prime@d3hot:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#6524)
*  igt@kms_psr2_su@page_flip-nv12:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#9683)
*  igt@kms_psr2_su@page_flip-p010:
*  
*  shard-tglu: NOTRUN -> SKIP (fdo#109642 / fdo#111068 / i915#9683)
*  igt@kms_psr@psr2_cursor_mmap_cpu:
*  
*  shard-rkl: NOTRUN -> SKIP (i915#9673)
*  igt@kms_psr@psr2_primary_blt:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#9673) +1 other test skip
*  igt@kms_psr@psr2_primary_render:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#9681) +2 other tests skip
*  igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#9685)
*  igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#4235)
*  igt@kms_rotation_crc@sprite-rotation-90:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#4235) +2 other tests skip
*  igt@kms_scaling_modes@scaling-mode-none:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#3555) +3 other tests skip
*  igt@kms_setmode@invalid-clone-exclusive-crtc:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#4098)
*  igt@kms_setmode@invalid-clone-single-crtc-stealing:
*  
*  shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#4098)
*  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8809)
*  igt@kms_tiled_display@basic-test-pattern:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#8623)
*  igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
*  
*  shard-mtlp: PASS -> FAIL (i915#9196)
*  igt@kms_writeback@writeback-fb-id:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#2437)
*  igt@kms_writeback@writeback-pixel-formats:
*  
*  shard-rkl: NOTRUN -> SKIP (i915#2437)
*  shard-mtlp: NOTRUN -> SKIP (i915#2437)
*  igt@perf@enable-disable@0-rcs0:
*  
*  shard-dg2: PASS -> FAIL (i915#8724)
*  igt@perf_pmu@busy-double-start@bcs0:
*  
*  shard-mtlp: PASS -> FAIL (i915#4349) +1 other test fail
*  igt@perf_pmu@frequency@gt0:
*  
*  shard-dg2: NOTRUN -> FAIL (i915#6806)
*  igt@perf_pmu@rc6-all-gts:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#8516)
*  igt@prime_vgem@basic-fence-read:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#3291 / i915#3708)
*  igt@sw_sync@timeline_closed:
*  
*  shard-mtlp: PASS -> DMESG-WARN (i915#2017)
*  igt@v3d/v3d_mmap@mmap-bad-handle:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#2575) +1 other test skip
*  igt@v3d/v3d_perfmon@create-single-perfmon:
*  
*  shard-rkl: NOTRUN -> SKIP (fdo#109315)
*  igt@v3d/v3d_submit_cl@valid-submission:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#2575) +5 other tests skip
*  igt@v3d/v3d_submit_csd@single-out-sync:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#2575) +6 other tests skip
*  igt@v3d/v3d_submit_csd@valid-multisync-submission:
*  
*  shard-tglu: NOTRUN -> SKIP (fdo#109315 / i915#2575) +3 other tests skip
*  igt@vc4/vc4_mmap@mmap-bo:
*  
*  shard-dg2: NOTRUN -> SKIP (i915#7711) +3 other tests skip
*  igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:
*  
*  shard-mtlp: NOTRUN -> SKIP (i915#7711) +3 other tests skip
*  igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
*  
*  shard-dg1: NOTRUN -> SKIP (i915#7711) +1 other test skip
*  igt@vc4/vc4_wait_bo@unused-bo-1ns:
*  
*  shard-tglu: NOTRUN -> SKIP (i915#2575) +2 other tests skip
*  Possible fixes
*  igt@gem_eio@hibernate:
*  
*  shard-dg1: ABORT (i915#7975 / i915#8213) -> PASS
*  shard-mtlp: ABORT (i915#7975 / i915#8213 / i915#9414) -> PASS
*  igt@gem_exec_fair@basic-pace-share@rcs0:
*  
*  shard-glk: FAIL (i915#2842) -> PASS
*  igt@gem_exec_suspend@basic-s4-devices@smem:
*  
*  shard-tglu: ABORT (i915#7975 / i915#8213) -> PASS
*  igt@gem_lmem_swapping@smem-oom@lmem0:
*  
*  shard-dg1: DMESG-WARN (i915#4936 / i915#5493) -> PASS
*  igt@gem_workarounds@reset:
*  
*  shard-mtlp: ABORT (i915#9414) -> PASS
*  {igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0}:
*  
*  shard-dg1: FAIL (i915#3591) -> PASS
*  igt@i915_pm_rps@reset:
*  
*  shard-tglu: INCOMPLETE -> PASS
*  igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
*  
*  shard-tglu: FAIL (i915#3743) -> PASS
*  {igt@kms_pm_rpm@dpms-mode-unset-non-lpsp}:
*  
*  shard-rkl: SKIP (i915#9519) -> PASS
*  shard-dg1: SKIP (i915#9519) -> PASS
*  igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
*  
*  shard-rkl: INCOMPLETE (i915#8875 / i915#9569) -> PASS
*  igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
*  
*  shard-tglu: FAIL (i915#9196) -> PASS +1 other test pass
*  igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1:
*  
*  shard-snb: FAIL (i915#9196) -> PASS
*  igt@perf_pmu@render-node-busy-idle@vcs0:
*  
*  shard-mtlp: FAIL (i915#4349) -> PASS
*  igt@prime_vgem@fence-wait@vcs1:
*  
*  shard-mtlp: ABORT -> PASS
*  igt@prime_vgem@fence-wait@vecs0:
*  
*  shard-mtlp: DMESG-WARN (i915#8875) -> PASS
*  Warnings
*  igt@kms_content_protection@type1:
*  
*  shard-dg2: SKIP (i915#7118 / i915#7162) -> SKIP (i915#7118)
*  igt@kms_fbcon_fbt@psr:
*  
*  shard-rkl: SKIP (i915#3955) -> SKIP (fdo#110189 / i915#3955)
*  {name}: This element is suppressed. This means it is ignored when computing
*  the status of the difference (SUCCESS, WARNING, or FAILURE).
*  
*  Build changes
*  Linux: CI_DRM_13898 -> Patchwork_126526v6
*  Piglit: piglit_4509 -> None
*  CI-20190529: 20190529
*  CI_DRM_13898: b7c604dc2389bdd42eb052506c3908ad635f28bf @ git://anongit.freedesktop.org/gfx-ci/linux
*  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
*  Patchwork_126526v6: 8d55b3869b666b36e26a40cfc2f1f84b72a34cd3 @ git://anongit.freedesktop.org/gfx-ci/linux
*  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit


> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13901 -> Patchwork_126526v6
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/index.html
> 
> Participating hosts (31 -> 33)
> ------------------------------
> 
>   Additional (4): fi-hsw-4770 bat-kbl-2 fi-pnv-d510 bat-dg1-5 
>   Missing    (2): fi-kbl-soraka fi-snb-2520m 
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_126526v6 that come from known issues:
> 
> ### CI changes ###
> 
> #### Issues hit ####
> 
>   * boot:
>     - bat-jsl-1:          [PASS][1] -> [FAIL][2] ([i915#8293])
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-jsl-1/boot.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-jsl-1/boot.html
> 
>   
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@fbdev@info:
>     - bat-kbl-2:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1849])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-kbl-2/igt@fbdev@info.html
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - bat-dg2-9:          [PASS][4] -> [INCOMPLETE][5] ([i915#8797] / [i915#9275])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-pnv-d510:        NOTRUN -> [SKIP][6] ([fdo#109271]) +25 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/fi-pnv-d510/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-kbl-2:          NOTRUN -> [SKIP][7] ([fdo#109271]) +20 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_mmap@basic:
>     - bat-dg1-5:          NOTRUN -> [SKIP][8] ([i915#4083])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg1-5/igt@gem_mmap@basic.html
> 
>   * igt@gem_tiled_fence_blits@basic:
>     - bat-dg1-5:          NOTRUN -> [SKIP][9] ([i915#4077]) +2 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg1-5/igt@gem_tiled_fence_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-dg1-5:          NOTRUN -> [SKIP][10] ([i915#4079]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg1-5/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_module_load@load:
>     - bat-adlp-6:         [PASS][11] -> [DMESG-WARN][12] ([i915#1982] / [i915#8449])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-adlp-6/igt@i915_module_load@load.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-adlp-6/igt@i915_module_load@load.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-dg1-5:          NOTRUN -> [SKIP][13] ([i915#6621])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg1-5/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-hsw-4770:        NOTRUN -> [INCOMPLETE][14] ([i915#9527])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - fi-hsw-4770:        NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#5190])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-x-tiled-legacy:
>     - bat-dg1-5:          NOTRUN -> [SKIP][16] ([i915#4212]) +7 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg1-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-dg1-5:          NOTRUN -> [SKIP][17] ([i915#4215])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-dg1-5:          NOTRUN -> [SKIP][18] ([i915#4103] / [i915#4213]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg1-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg1-5:          NOTRUN -> [SKIP][19] ([i915#3555] / [i915#3840])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg1-5/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-dg1-5:          NOTRUN -> [SKIP][20] ([fdo#109285])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - bat-dg1-5:          NOTRUN -> [SKIP][21] ([i915#433])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg1-5/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:
>     - fi-hsw-4770:        NOTRUN -> [SKIP][22] ([fdo#109271]) +12 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
>     - bat-kbl-2:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#1845]) +14 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-kbl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-dg1-5:          NOTRUN -> [SKIP][24] ([i915#3555])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-dg1-5:          NOTRUN -> [SKIP][25] ([i915#3708]) +3 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg1-5/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - bat-dg1-5:          NOTRUN -> [SKIP][26] ([i915#3708] / [i915#4077]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-dg1-5/igt@prime_vgem@basic-gtt.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-apl-guc:         [DMESG-FAIL][27] ([i915#5334]) -> [PASS][28]
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
>     - bat-rplp-1:         [ABORT][29] ([i915#8668]) -> [PASS][30]
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#8293]: https://gitlab.freedesktop.org/drm/intel/issues/8293
>   [i915#8449]: https://gitlab.freedesktop.org/drm/intel/issues/8449
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#8797]: https://gitlab.freedesktop.org/drm/intel/issues/8797
>   [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
>   [i915#9527]: https://gitlab.freedesktop.org/drm/intel/issues/9527
>   [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_13901 -> Patchwork_126526v6
> 
>   CI-20190529: 20190529
>   CI_DRM_13901: 8d55b3869b666b36e26a40cfc2f1f84b72a34cd3 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   Patchwork_126526v6: 8d55b3869b666b36e26a40cfc2f1f84b72a34cd3 @ git://anongit.freedesktop.org/gfx-ci/linux
> 
> 
> ### Linux commits
> 
> dfd69da63d0e drm/i915/dp: Reuse intel_dp_{max, effective}_data_rate in intel_link_compute_m_n()
> 3bdeb4eb6880 drm/i915/dp: Simplify intel_dp_max_data_rate()
> 29d9d5b20906 drm/i915/dp: Report a rounded-down value as the maximum data rate
> ce144ebc203f drm/i915/dp_mst: Fix PBN / MTP_TU size calculation for UHBR rates
> 332160a9365a drm/i915/dp_mst: Calculate the BW overhead in intel_dp_mst_find_vcpi_slots_for_bpp()
> a77782e10312 drm/i915/dp: Fix UHBR link M/N values
> 842740e3896c drm/i915/dp: Account for channel coding efficiency on UHBR links
> a11a8db78fa3 drm/i915/dp: Replace intel_dp_is_uhbr_rate() with drm_dp_is_uhbr_rate()
> 83508fa204b8 drm/dp_mst: Add kunit tests for drm_dp_get_vc_payload_bw()
> bb5be2d5e23b drm/dp_mst: Fix PBN divider calculation for UHBR rates
> bb817db5d4a4 drm/dp_mst: Store the MST PBN divider value in fixed point format
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_126526v6/index.html
