Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DEQESOXeGkWrQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:44:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64699311A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083D810E52E;
	Tue, 27 Jan 2026 10:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qLgV8uQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288CF10E52A;
 Tue, 27 Jan 2026 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769510685;
 bh=N0g6aEtX7pDV3CnUFf72SGONiRwQ0e3Y0ynmp/ZwTCM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qLgV8uQ6RxGfCfhwLy7d0UsESAmhTtlf82byP5OGXkbqIjIEVareSt1Pe8ZK+3DKR
 3b4JdQre6A3H7uwVxU84GXqO/1xvPhoHc//cOT87LnlI62bHg6+avnrBFBEv7kH+4Q
 2MyU9A1tctvXImT9bobi7Zln2Cm3l2R5UZSOpX0GbktnQoJmApDDcsabmAY39wwsX7
 tdHZf33ADynEsl2GPC+aR6oeg0ZLLtqtMD0XgvB5gK7FAHgQoH5p2BeL0A8BHUL53Z
 ilqiago0vV/K+f5JpS4QwCEi6ZQmbDvbUbKOtW5fTtX3hTQqrHkD2qOjptoXW9pUkp
 quXPaDSHZf8Qw==
Received: from vignesh-thinkpad.. (unknown [171.76.81.211])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CD6A717E00AC;
 Tue, 27 Jan 2026 11:44:40 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/7] drm/ci: uprev IGT
Date: Tue, 27 Jan 2026 16:14:01 +0530
Message-ID: <20260127104406.200505-7-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127104406.200505-1-vignesh.raman@collabora.com>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,oss.qualcomm.com,kernel.org,lists.infradead.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.915];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B64699311A
X-Rspamd-Action: no action

Recent IGT [1] seems to be broken on MSM hardware, with many tests
failing due to the old_primary->index != 0 assertion. Uprev IGT to
the last known good revision where the tests pass, and update the
expectation files accordingly.

[1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/a909ab05

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  16 ++-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   7 +
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  32 +----
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |  65 +++++++++
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |  24 +---
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  29 +---
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   7 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  35 +----
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  | 131 ++++++++++++++++++
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  37 +----
 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt  |  50 +++++++
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   4 +
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   5 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |   6 +
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  16 +--
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  13 +-
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 119 ++++++++++++++++
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   7 +-
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   1 +
 .../msm-sc7180-trogdor-kingoftown-fails.txt   |   1 +
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   1 +
 .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |   1 +
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  14 +-
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  21 +++
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  12 +-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  35 +++++
 .../drm/ci/xfails/rockchip-rk3588-fails.txt   |   2 +-
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  50 -------
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   2 +
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   3 +
 34 files changed, 527 insertions(+), 224 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 56088c5393cd..8ceeabda74d7 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: 129d5b10baaadea1d6cd6377341c4cb42e7ee6fd
+  IGT_VERSION: 26ddb59c1d5f8d68500f2d09263afe919c79a8d2
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/mesa/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.20.0
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index f44dbce3151a..612fb6527964 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -5,7 +5,15 @@ amdgpu/amd_abm@backlight_monotonic_basic,Fail
 amdgpu/amd_abm@dpms_cycle,Fail
 amdgpu/amd_assr@assr-links,Fail
 amdgpu/amd_assr@assr-links-dpms,Fail
-amdgpu/amd_mall@static-screen,Crash
+amdgpu/amd_basic@cs-gfx-with-IP-GFX,Fail
+amdgpu/amd_basic@cs-multi-fence-with-IP-GFX,Fail
+amdgpu/amd_basic_ex@command_ce_write_fence,Fail
+amdgpu/amd_basic_multi_gpu@cs-gfx-with-IP-GFX,Fail
+amdgpu/amd_basic_multi_gpu@cs-multi-fence-with-IP-GFX,Fail
+amdgpu/amd_mem@access-ppr-mem,Crash
+amdgpu/amd_mem@invalid_alloc,Fail
+amdgpu/amd_mem@memory-alloc,Crash
+amdgpu/amd_mem@memory_alloc_all,Crash
 amdgpu/amd_mode_switch@mode-switch-first-last-pipe-2,Crash
 amdgpu/amd_plane@mpo-pan-nv12,Fail
 amdgpu/amd_plane@mpo-pan-p010,Fail
@@ -13,11 +21,13 @@ amdgpu/amd_plane@mpo-pan-rgb,Crash
 amdgpu/amd_plane@mpo-scale-nv12,Fail
 amdgpu/amd_plane@mpo-scale-p010,Fail
 amdgpu/amd_plane@mpo-scale-rgb,Crash
-amdgpu/amd_plane@mpo-swizzle-toggle,Fail
+amdgpu/amd_plane@mpo-swizzle-toggle,Crash
 amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Fail
+core_setmaster@master-drop-set-user,Fail
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@too-high,Fail
+kms_async_flips@basic-modeset-with-all-modifiers-formats,Crash
 kms_atomic_transition@plane-all-modeset-transition-internal-panels,Fail
 kms_atomic_transition@plane-all-transition,Fail
 kms_atomic_transition@plane-all-transition-nonblocking,Fail
@@ -33,6 +43,8 @@ kms_cursor_crc@cursor-sliding-64x64,Fail
 kms_cursor_edge_walk@64x64-left-edge,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
+kms_invalid_mode@int-max-clock,Fail
+kms_invalid_mode@overflow-vrefresh,Fail
 kms_lease@lease-uevent,Fail
 kms_plane@pixel-format,Fail
 kms_plane_cursor@primary,Fail
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
index adffb011298a..8b81af104b30 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
@@ -32,3 +32,10 @@ kms_async_flips@async-flip-with-page-flip-events-atomic
 # IGT Version: 1.29-g33adea9eb
 # Linux Version: 6.13.0-rc2
 kms_async_flips@crc-atomic
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://gitlab.freedesktop.org/drm/amd/-/issues/4406
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_async_flips@alternate-sync-async-flip
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
index 8e2b5504004e..af720e5d779a 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
@@ -1,44 +1,16 @@
-core_setmaster_vs_auth,Fail
+core_setmaster@master-drop-set-user,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
-kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc,Timeout
-kms_fb_coherency@memset-crc,Crash
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu,Timeout
 kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_scaling@planes-upscale-factor-0-25,Timeout
-kms_pm_backlight@brightness-with-dpms,Crash
-kms_pm_backlight@fade,Crash
-kms_prop_blob@invalid-set-prop-any,Fail
-kms_properties@connector-properties-legacy,Timeout
-kms_universal_plane@disable-primary-vs-flip,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
 perf@i915-ref-count,Fail
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
index 922327632eff..3fda27663e98 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
@@ -22,6 +22,71 @@ i915_suspend.*
 kms_scaling_modes.*
 i915_pm_rpm.*
 i915_module_load@reload-with-fault-injection
+kms_big_fb.*
 
 # Kernel panic
 drm_fdinfo.*
+
+# Kernel panic
+kms_cursor_legacy@short-flip-after-cursor-toggle
+# DEBUG - Begin test kms_cursor_legacy@short-flip-after-cursor-toggle
+# [ 2253.980256] i915 0000:00:02.0: [drm] *ERROR* [CRTC:56:pipe A] flip_done timed out
+# [ 2254.036707] [IGT] kms_setmode: executing
+# [ 2254.042006] [IGT] kms_setmode: starting subtest invalid-clone-single-crtc
+# [ 2254.049962] [IGT] kms_setmode: finished subtest invalid-clone-single-crtc, SKIP
+# [ 2254.058253] [IGT] kms_setmode: exiting, ret=77
+# [ 2254.080577] [IGT] kms_frontbuffer_tracking: executing
+# [ 2254.650348] [IGT] kms_frontbuffer_tracking: starting subtest psr-1p-primscrn-pri-shrfb-draw-blt
+# [ 2254.660232] [IGT] kms_frontbuffer_tracking: finished subtest psr-1p-primscrn-pri-shrfb-draw-blt, SKIP
+# [ 2254.671910] [IGT] kms_frontbuffer_tracking: exiting, ret=77
+# [ 2254.748102] [IGT] kms_big_fb: executing
+# [ 2255.286765] [IGT] kms_big_fb: starting subtest 4-tiled-64bpp-rotate-0
+# [ 2255.294100] [IGT] kms_big_fb: finished subtest 4-tiled-64bpp-rotate-0, SKIP
+# [ 2255.302188] [IGT] kms_big_fb: exiting, ret=77
+# [ 2255.335552] [IGT] kms_frontbuffer_tracking: executing
+# [ 2255.876572] [IGT] kms_frontbuffer_tracking: starting subtest fbcpsr-1p-primscrn-pri-shrfb-draw-blt
+# [ 2255.886699] [IGT] kms_frontbuffer_tracking: finished subtest fbcpsr-1p-primscrn-pri-shrfb-draw-blt, SKIP
+# [ 2255.898345] [IGT] kms_frontbuffer_tracking: exiting, ret=77
+# [ 2255.965262] [IGT] syncobj_timeline: executing
+# [ 2255.973253] [IGT] syncobj_timeline: exiting, ret=77
+# [ 2255.995583] [IGT] kms_cursor_legacy: executing
+# [ 2256.541009] [IGT] kms_cursor_legacy: starting subtest short-flip-after-cursor-toggle
+# [ 2266.780310] i915 0000:00:02.0: [drm] *ERROR* flip_done timed out
+# [ 2266.787082] i915 0000:00:02.0: [drm] *ERROR* [CRTC:56:pipe A] commit wait timed out
+# [ 2277.020277] i915 0000:00:02.0: [drm] *ERROR* flip_done timed out
+# [ 2277.027028] i915 0000:00:02.0: [drm] *ERROR* [CONNECTOR:106:eDP-1] commit wait timed out
+# [ 2287.260289] i915 0000:00:02.0: [drm] *ERROR* flip_done timed out
+# [ 2287.267049] i915 0000:00:02.0: [drm] *ERROR* [PLANE:33:plane 1A] commit wait timed out
+# [ 2458.780969] INFO: task kms_cursor_lega:1032 blocked for more than 122 seconds.
+# [ 2458.789054]       Tainted: G S      W           6.19.0-rc1-g2789e80ceac3 #1
+# [ 2458.796836] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
+# [ 2458.805591] task:kms_cursor_lega state:D stack:12208 pid:1032  tgid:1032  ppid:190    task_flags:0x400100 flags:0x00080802
+# [ 2458.817949] Call Trace:
+# [ 2458.820676]  <TASK>
+# [ 2458.823025]  __schedule+0x5d0/0x1160
+# [ 2458.827030]  schedule+0x35/0x130
+# [ 2458.830639]  drm_vblank_work_flush+0x96/0x100
+# [ 2458.841356]  intel_wait_for_vblank_workers+0x55/0x90
+# [ 2458.846911]  intel_atomic_commit_tail+0xd65/0x1990
+# [ 2458.862115]  intel_atomic_commit+0x25f/0x2a0
+# [ 2458.866884]  drm_atomic_commit+0xac/0xe0
+# [ 2458.876533]  drm_mode_atomic_ioctl+0x9fd/0xce0
+# [ 2458.887065]  drm_ioctl_kernel+0xac/0x100
+# [ 2458.891452]  drm_ioctl+0x22c/0x4d0
+# [ 2458.900810]  __x64_sys_ioctl+0x91/0xe0
+# [ 2458.905008]  do_syscall_64+0xbd/0xf80
+# [ 2458.909105]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# [ 2458.914754] RIP: 0033:0x7efd730628db
+# [ 2458.918752] RSP: 002b:00007ffda34ed090 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# [ 2458.927217] RAX: ffffffffffffffda RBX: 0000563a1e3f44d0 RCX: 00007efd730628db
+# [ 2458.935196] RDX: 00007ffda34ed130 RSI: 00000000c03864bc RDI: 0000000000000003
+# [ 2458.943166] RBP: 00007ffda34ed130 R08: 00007efd7313dac0 R09: 0000000000000001
+# [ 2458.951145] R10: 0000000000000012 R11: 0000000000000246 R12: 00000000c03864bc
+# [ 2458.959122] R13: 0000000000000003 R14: 0000563a1e3b5aa0 R15: 0000563a1e3fad30
+# [ 2458.967104]  </TASK>
+# [ 2458.969547] INFO: lockdep is turned off.
+
+# Hangs and timeout occurs
+kms_atomic@crtc-invalid-params-fence
+# DEBUG - Begin test kms_atomic@crtc-invalid-params-fence
+# MesaCITimeoutError: LAVA job 21068652 unresponsive for 5.0 minutes; retrying the job.
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
index 7353ab11e940..032f7adeeff2 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
@@ -1,29 +1,9 @@
+core_setmaster@master-drop-set-user,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_flip@flip-vs-wf_vblank-interruptible,Fail
 kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
index 6fef7c1e56ea..4839d50267c2 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
@@ -1,4 +1,5 @@
-core_setmaster_vs_auth,Fail
+api_intel_bb@intel-bb-blit-none,Timeout
+core_setmaster@master-drop-set-user,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
@@ -8,9 +9,6 @@ i915_pipe_stress@stress-xrgb8888-ytiled,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
 i915_pm_rpm@system-suspend-execbuf,Timeout
-kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc,Timeout
-kms_cursor_crc@cursor-suspend,Timeout
-kms_fb_coherency@memset-crc,Crash
 kms_flip@busy-flip,Timeout
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
@@ -35,17 +33,7 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
 kms_lease@lease-uevent,Fail
-kms_pipe_stress@stress-xrgb8888-untiled,Fail
-kms_pipe_stress@stress-xrgb8888-ytiled,Fail
-kms_plane_alpha_blend@alpha-basic,Fail
-kms_plane_alpha_blend@alpha-opaque-fb,Fail
-kms_plane_alpha_blend@alpha-transparent-fb,Fail
-kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_scaling@planes-upscale-factor-0-25,Timeout
-kms_pm_backlight@brightness-with-dpms,Crash
-kms_pm_backlight@fade,Crash
-kms_prop_blob@invalid-set-prop-any,Fail
-kms_properties@connector-properties-legacy,Timeout
+kms_pm_rpm@basic-rte,Fail
 kms_psr2_sf@cursor-plane-update-sf,Fail
 kms_psr2_sf@overlay-plane-update-continuous-sf,Fail
 kms_psr2_sf@overlay-plane-update-sf-dmg-area,Fail
@@ -53,17 +41,6 @@ kms_psr2_sf@overlay-primary-update-sf-dmg-area,Fail
 kms_psr2_sf@plane-move-sf-dmg-area,Fail
 kms_psr2_sf@primary-plane-update-sf-dmg-area,Fail
 kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb,Fail
-kms_psr2_sf@psr2-cursor-plane-update-sf,Fail
-kms_psr2_sf@psr2-overlay-plane-update-continuous-sf,Fail
-kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area,Fail
-kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area,Fail
-kms_psr2_sf@psr2-plane-move-sf-dmg-area,Fail
-kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area,Fail
-kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb,Fail
-kms_psr2_su@page_flip-NV12,Fail
-kms_psr2_su@page_flip-P010,Fail
-kms_setmode@basic,Fail
-kms_universal_plane@disable-primary-vs-flip,Timeout
 perf@i915-ref-count,Fail
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
index 5343cc1c8696..5e5b9901a08e 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
@@ -32,3 +32,10 @@ kms_async_flips@crc
 # IGT Version: 1.29-g33adea9eb
 # Linux Version: 6.13.0-rc2
 gen9_exec_parse@unaligned-access
+
+# Board Name: asus-C436FA-Flip-hatch
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14625
+# Failure Rate: 100
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+perf_pmu@most-busy-check-all
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
index 8adf5f0a6e80..72de426b1dd7 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
@@ -1,45 +1,22 @@
-core_setmaster_vs_auth,Fail
+core_setmaster@master-drop-set-user,Fail
 gen9_exec_parse@unaligned-access,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
+kms_dirtyfb@default-dirtyfb-ioctl,Fail
 kms_dirtyfb@drrs-dirtyfb-ioctl,Fail
+kms_dirtyfb@fbc-dirtyfb-ioctl,Fail
 kms_flip@blocking-wf_vblank,Fail
 kms_flip@wf_vblank-ts-check,Fail
 kms_flip@wf_vblank-ts-check-interruptible,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu,Timeout
 kms_frontbuffer_tracking@fbc-tiling-linear,Fail
+kms_frontbuffer_tracking@fbcdrrs-tiling-linear,Fail
 kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
-kms_plane_scaling@planes-upscale-factor-0-25,Timeout
-kms_pm_backlight@brightness-with-dpms,Crash
-kms_pm_backlight@fade,Crash
-kms_prop_blob@invalid-set-prop-any,Fail
-kms_properties@connector-properties-legacy,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
 kms_rotation_crc@multiplane-rotation,Fail
-kms_rotation_crc@multiplane-rotation-cropping-top,Fail
-kms_universal_plane@disable-primary-vs-flip,Timeout
+kms_rotation_crc@multiplane-rotation-cropping-bottom,Timeout
 perf@non-zero-reason,Timeout
 sysfs_heartbeat_interval@long,Timeout
 sysfs_heartbeat_interval@off,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
index 2e4ef9f35654..30fc9df75402 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
@@ -326,3 +326,134 @@ kms_lease.*
 
 # The test alternates between failing and timing out on reruns, causing the pipeline to fail
 gen9_exec_parse@unaligned-access
+
+kms_frontbuffer_tracking.*
+# DEBUG - Begin test kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu
+# Pass: 392, Fail: 2, UnexpectedImprovement: 6, ExpectedFail: 14, Skip: 29103, Timeout: 16, Duration: 1:22:45, Remaining: 9:07
+# [ 4297.883681] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
+# [ 4297.904667] RSP: 002b:00007ffeae886eb0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# [ 4297.913141] RAX: ffffffffffffffda RBX: 00007ffeae887858 RCX: 00007fbc82201d1b
+# [ 4297.921135] RDX: 00007ffeae886f40 RSI: 00000000c06864a2 RDI: 0000000000000003
+# [ 4297.929123] RBP: 00007ffeae886f40 R08: 0000000000000000 R09: 00007ffeae887858
+# [ 4297.937111] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c06864a2
+# [ 4297.945097] R13: 0000000000000003 R14: 0000000000000000 R15: 00007ffeae887700
+# [ 4297.953093]  </TASK>
+# [ 4297.955550] irq event stamp: 0
+# [ 4297.958973] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
+# [ 4297.966005] hardirqs last disabled at (0): [<ffffffffb370ebce>] copy_process+0x9ae/0x2000
+# [ 4297.975163] softirqs last  enabled at (0): [<ffffffffb370ebce>] copy_process+0x9ae/0x2000
+# [ 4297.984330] softirqs last disabled at (0): [<0000000000000000>] 0x0
+# [ 4297.991354] ---[ end trace 0000000000000000 ]---
+# [ 4297.996610] ------------[ cut here ]------------
+# [ 4298.001797] i915 0000:00:02.0: [drm] plane 1A assertion failure (expected on, current off)
+# [ 4298.011099] WARNING: CPU: 1 PID: 2567 at drivers/gpu/drm/i915/display/intel_display.c:463 assert_plane+0x11b/0x130
+# [ 4298.022695] Modules linked in:
+# [ 4298.026124] CPU: 1 UID: 0 PID: 2567 Comm: kms_flip Tainted: G S      W           6.16.0-rc2-g0594d0b01a7c #1 PREEMPT(voluntary)
+# [ 4298.039094] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
+# [ 4298.044459] Hardware name: HP Bloog/Bloog, BIOS  09/19/2019
+# [ 4298.050697] RIP: 0010:assert_plane+0x11b/0x130
+# [ 4298.055676] Code: 50 48 85 ed 75 03 48 8b 2f e8 b1 be 12 00 4d 89 e9 4d 89 e0 48 89 d9 48 89 c6 48 89 ea 48 c7 c7 40 ac e1 b4 e8 f6 a3 6d ff 90 <0f> 0b 90 90 e9 2f ff ff ff e8 17 b0 7a 00 0f 1f 80 00 00 00 00 90
+# [ 4298.076695] RSP: 0018:ffffb1bb4087ba58 EFLAGS: 00010282
+# [ 4298.082558] RAX: 0000000000000000 RBX: ffff9052078df760 RCX: 00000000fffffa0c
+# [ 4298.090554] RDX: 0000000000000000 RSI: ffffb1bb4087b908 RDI: 0000000000000001
+# [ 4298.098536] RBP: ffff905201bb1740 R08: 000000000000823c R09: 00000000fffffa0c
+# [ 4298.106519] R10: 00000000fffffa0c R11: ffffffffb508eca0 R12: ffffffffb4eba9db
+# [ 4298.114524] R13: ffffffffb4e90a5f R14: ffff905201460800 R15: 0000000000000003
+# [ 4298.122512] FS:  00007fbc812516c0(0000) GS:ffff9052c60f9000(0000) knlGS:0000000000000000
+# [ 4298.131568] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# [ 4298.138009] CR2: 0000563771f3c5b8 CR3: 0000000102246000 CR4: 0000000000350ef0
+# [ 4298.146023] Call Trace:
+# [ 4298.148775]  <TASK>
+# [ 4298.151136]  intel_atomic_commit_tail+0x1684/0x1770
+# [ 4298.166393]  intel_atomic_commit+0x26e/0x2b0
+# [ 4298.171180]  drm_atomic_commit+0xab/0xe0
+# [ 4298.180878]  drm_atomic_helper_set_config+0x6f/0xb0
+# [ 4298.186349]  drm_mode_setcrtc+0x3ab/0x940
+# [ 4298.205833]  drm_ioctl_kernel+0xab/0x100
+# [ 4298.210241]  drm_ioctl+0x233/0x4b0
+# [ 4298.219164]  __x64_sys_ioctl+0x8e/0xe0
+# [ 4298.223373]  do_syscall_64+0xbb/0x370
+# [ 4298.227483]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# [ 4298.233142] RIP: 0033:0x7fbc82201d1b
+# [ 4298.237173] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
+# [ 4298.258178] RSP: 002b:00007ffeae886eb0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# [ 4298.266653] RAX: ffffffffffffffda RBX: 00007ffeae887858 RCX: 00007fbc82201d1b
+# [ 4298.274663] RDX: 00007ffeae886f40 RSI: 00000000c06864a2 RDI: 0000000000000003
+# [ 4298.282664] RBP: 00007ffeae886f40 R08: 0000000000000000 R09: 00007ffeae887858
+# [ 4298.290650] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c06864a2
+# [ 4298.298634] R13: 0000000000000003 R14: 0000000000000000 R15: 00007ffeae887700
+# [ 4298.306650]  </TASK>
+# [ 4298.309103] irq event stamp: 0
+# [ 4298.312525] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
+# [ 4298.319543] hardirqs last disabled at (0): [<ffffffffb370ebce>] copy_process+0x9ae/0x2000
+# [ 4298.328696] softirqs last  enabled at (0): [<ffffffffb370ebce>] copy_process+0x9ae/0x2000
+# [ 4298.337872] softirqs last disabled at (0): [<0000000000000000>] 0x0
+# [ 4298.344892] ---[ end trace 0000000000000000 ]---
+
+sysfs_heartbeat_interval.*
+# [ 1219.376136] i915 0000:00:02.0: [drm] Resetting vecs0 for preemption time out
+# [ 1219.386448] i915 0000:00:02.0: [drm] GPU HANG: ecode 9:8:277ffefe, in sysfs_heartbeat [1500]
+# [ 1219.395917] i915 0000:00:02.0: [drm] GPU error state saved to /sys/class/drm/card1/error
+# [ 1220.389661] [IGT] sysfs_heartbeat_interval: finished subtest vecs0, FAIL
+# [ 1220.397453] [IGT] sysfs_heartbeat_interval: starting dynamic subtest vcs0
+# [ 1220.405507] i915 0000:00:02.0: [drm] vcs0 heartbeat interval adjusted to a non-default value which may cause engine resets to target innocent contexts!
+# [ 1240.423786] Fence expiration time out i915-0000:00:02.0:0000:00:02.0:2!
+# [ 1240.433139] i915 0000:00:02.0: [drm] Resetting vcs0 for preemption time out
+# [ 1240.443200] i915 0000:00:02.0: [drm] GPU HANG: ecode 9:4:a77ffefe, in sysfs_heartbeat [1500]
+# [ 1240.452664] i915 0000:00:02.0: [drm] GPU error state saved to /sys/class/drm/card1/error
+
+kms_busy@extended-pageflip-hang-newfb
+# DEBUG - Begin test kms_busy@extended-pageflip-hang-newfb
+# [  635.322871] [IGT] kms_busy: executing
+# [  635.376068] [IGT] kms_busy: starting subtest extended-pageflip-hang-newfb
+# [  635.387692] [IGT] kms_busy: starting dynamic subtest pipe-A
+# [  639.603625] i915 0000:00:02.0: [drm] Resetting rcs0 for preemption time out
+# [  639.611970] i915 0000:00:02.0: [drm] GPU HANG: ecode 9:1:e757fefe, in kms_busy [821]
+
+api_intel_bb@intel-bb-blit-none
+# DEBUG - Begin test api_intel_bb@intel-bb-blit-none
+# [ 3544.287885] ------------[ cut here ]------------
+# [ 3544.293066] i915 0000:00:02.0: [drm] attached crtc is active, but connector isn't
+# [ 3544.301500] WARNING: CPU: 1 PID: 1831 at drivers/gpu/drm/i915/display/intel_modeset_verify.c:58 verify_connector_state+0x226/0x3e0
+# [ 3544.314679] Modules linked in:
+# [ 3544.318111] CPU: 1 UID: 0 PID: 1831 Comm: kms_atomic_tran Tainted: G S      W           6.18.0-rc2-gd7824990c233 #1 PREEMPT(voluntary)
+# [ 3544.331748] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
+# [ 3544.337135] Hardware name: HP Bloog/Bloog, BIOS  09/19/2019
+# [ 3544.343386] RIP: 0010:verify_connector_state+0x226/0x3e0
+# [ 3544.349350] Code: 74 04 48 8b 7f 08 4c 8b 6f 50 4d 85 ed 75 03 4c 8b 2f e8 8d ed 0c 00 4c 89 ea 48 c7 c7 80 c2 05 8e 48 89 c6 e8 7b 7d 65 ff 90 <0f> 0b 90 90 49 8b 44 24 10 e9 32 ff ff ff 49 8b 44 24 10 e9 28 ff
+# [ 3544.370380] RSP: 0018:ffff9816c0123a00 EFLAGS: 00010282
+# [ 3544.376244] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000000000079f
+# [ 3544.384233] RDX: 0000000000000000 RSI: ffff9816c01238a0 RDI: 00000000ffffe79f
+# [ 3544.392212] RBP: ffff8c5aca0b2c00 R08: 00000000ffffe79f R09: ffffffff8e4b89e8
+# [ 3544.400225] R10: 0000000000000003 R11: 0000000000000003 R12: ffff8c5ac0387c00
+# [ 3544.408206] R13: ffff8c5ac8c7f9c0 R14: ffff8c5ac44df000 R15: ffff8c5ac1b9e000
+# [ 3544.416197] FS:  00007f1fa7d1f740(0000) GS:ffff8c5baccc8000(0000) knlGS:0000000000000000
+# [ 3544.425257] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# [ 3544.431711] CR2: 00007f1fa85fb238 CR3: 0000000106176000 CR4: 0000000000350ef0
+# [ 3544.439704] Call Trace:
+# [ 3544.442445]  <TASK>
+# [ 3544.444804]  intel_modeset_verify_crtc+0x6b/0x580
+# [ 3544.450089]  intel_atomic_commit_tail+0x1099/0x1960
+# [ 3544.465364]  intel_atomic_commit+0x25c/0x2a0
+# [ 3544.470159]  drm_atomic_commit+0xac/0xe0
+# [ 3544.479849]  drm_mode_atomic_ioctl+0x9c8/0xca0
+# [ 3544.490426]  drm_ioctl_kernel+0xac/0x100
+# [ 3544.494863]  drm_ioctl+0x22c/0x4b0
+# [ 3544.504267]  __x64_sys_ioctl+0x91/0xe0
+# [ 3544.508482]  do_syscall_64+0xbd/0xfa0
+# [ 3544.512593]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# [ 3544.518256] RIP: 0033:0x7f1fa90d98db
+# [ 3544.522266] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
+# [ 3544.543302] RSP: 002b:00007ffe41812ed0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# [ 3544.551791] RAX: ffffffffffffffda RBX: 00005631eb5e51b0 RCX: 00007f1fa90d98db
+# [ 3544.559784] RDX: 00007ffe41812f70 RSI: 00000000c03864bc RDI: 0000000000000003
+# [ 3544.567774] RBP: 00007ffe41812f70 R08: 00000000000001c0 R09: 0000000000000001
+# [ 3544.575781] R10: 0000000000000006 R11: 0000000000000246 R12: 00000000c03864bc
+# [ 3544.583774] R13: 0000000000000003 R14: 00005631eb5dd770 R15: 00005631eb5dd7b0
+# [ 3544.591774]  </TASK>
+# [ 3544.594227] irq event stamp: 0
+# [ 3544.597648] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
+# [ 3544.604669] hardirqs last disabled at (0): [<ffffffff8c78859c>] copy_process+0xa3c/0x2150
+# [ 3544.613864] softirqs last  enabled at (0): [<ffffffff8c78859c>] copy_process+0xa3c/0x2150
+# [ 3544.623026] softirqs last disabled at (0): [<0000000000000000>] 0x0
+# [ 3544.630047] ---[ end trace 0000000000000000 ]---
diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
index 57453e340040..78af0a2051d7 100644
--- a/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
@@ -1,45 +1,18 @@
+core_setmaster@master-drop-set-root,Fail
+core_setmaster@master-drop-set-user,Fail
 drm_fdinfo@busy-check-all,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
-kms_flip@dpms-off-confusion,Fail
-kms_flip@nonexisting-fb,Fail
-kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,UnexpectedImprovement(Skip)
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_fb_coherency@memset-crc,Crash
 kms_lease@lease-uevent,Fail
-kms_pm_rpm@modeset-stress-extra-wait,Timeout
-kms_rotation_crc@bad-pixel-format,Fail
-kms_rotation_crc@multiplane-rotation,Fail
-kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
-kms_rotation_crc@multiplane-rotation-cropping-top,Fail
+kms_pm_backlight@fade-with-dpms,Crash
+kms_rotation_crc@multiplane-rotation,Timeout
 perf@i915-ref-count,Fail
 perf_pmu@module-unload,Fail
-perf_pmu@most-busy-idle-check-all,Fail
 perf_pmu@rc6,Crash
-prime_busy@before-wait,Fail
 sysfs_heartbeat_interval@long,Timeout
 sysfs_heartbeat_interval@off,Timeout
 sysfs_preempt_timeout@off,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt
index 8dec57da1bb3..28a3713cba31 100644
--- a/drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt
@@ -19,3 +19,53 @@ i915_pm_rc6_residency.*
 
 # Hangs the machine and timeout occurs
 i915_pm_rpm@system-hibernate*
+
+# Hung task
+kms_big_fb@linear-8bpp-rotate-180
+# DEBUG - Begin test kms_big_fb@linear-8bpp-rotate-180
+# [ 2399.385958] [IGT] kms_big_fb: starting subtest linear-8bpp-rotate-180
+# [ 2409.564521] i915 0000:00:02.0: [drm] *ERROR* flip_done timed out
+# [ 2409.571287] i915 0000:00:02.0: [drm] *ERROR* [CRTC:108:pipe A] commit wait timed out
+# [ 2419.804478] i915 0000:00:02.0: [drm] *ERROR* flip_done timed out
+# [ 2419.811238] i915 0000:00:02.0: [drm] *ERROR* [CONNECTOR:265:eDP-1] commit wait timed out
+# [ 2581.595871] INFO: task kms_big_fb:2014 blocked for more than 122 seconds.
+# [ 2581.603531]       Tainted: G S      W           6.18.0-rc2-gf3fa2ecfc797 #1
+# [ 2581.611341] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
+# [ 2581.620149] task:kms_big_fb      state:D stack:12376 pid:2014  tgid:2014  ppid:175    task_flags:0x400100 flags:0x00080003
+# [ 2581.632523] Call Trace:
+# [ 2581.635272]  <TASK>
+# [ 2581.637630]  __schedule+0x5b4/0x1000
+# [ 2581.641649]  schedule+0x35/0x130
+# [ 2581.645272]  drm_vblank_work_flush+0x96/0x100
+# [ 2581.656055]  intel_wait_for_vblank_workers+0x55/0x90
+# [ 2581.661628]  intel_atomic_commit_tail+0xd15/0x1960
+# [ 2581.685600]  intel_atomic_commit+0x25c/0x2a0
+# [ 2581.690395]  drm_atomic_commit+0xac/0xe0
+# [ 2581.700077]  drm_mode_atomic_ioctl+0x9c8/0xca0
+# [ 2581.710642]  drm_ioctl_kernel+0xac/0x100
+# [ 2581.715049]  drm_ioctl+0x22c/0x4b0
+# [ 2581.724444]  __x64_sys_ioctl+0x91/0xe0
+# [ 2581.728653]  do_syscall_64+0xbd/0xfa0
+# [ 2581.732767]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# [ 2581.738436] RIP: 0033:0x7fa5ed2508db
+# [ 2581.742459] RSP: 002b:00007ffd373f6e80 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# [ 2581.750947] RAX: ffffffffffffffda RBX: 0000558a9d86cae0 RCX: 00007fa5ed2508db
+# [ 2581.758949] RDX: 00007ffd373f6f20 RSI: 00000000c03864bc RDI: 0000000000000003
+# [ 2581.766948] RBP: 00007ffd373f6f20 R08: 00007fa5ed32bac0 R09: 0000000000000001
+# [ 2581.774949] R10: 000000000000001d R11: 0000000000000246 R12: 00000000c03864bc
+# [ 2581.782953] R13: 0000000000000003 R14: 0000558a9d8626e0 R15: 0000558a9d8628d0
+# [ 2581.790951]  </TASK>
+# [ 2581.793402] INFO: lockdep is turned off.
+# [ 2704.475873] INFO: task kms_big_fb:2014 blocked for more than 245 seconds.
+# [ 2704.483528]       Tainted: G S      W           6.18.0-rc2-gf3fa2ecfc797 #1
+# [ 2704.491338] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
+# [ 2704.500125] task:kms_big_fb      state:D stack:12376 pid:2014  tgid:2014  ppid:175    task_flags:0x400100 flags:0x00080003
+# [ 2704.512503] Call Trace:
+# [ 2704.515250]  <TASK>
+# [ 2704.517601]  __schedule+0x5b4/0x1000
+# [ 2704.521618]  schedule+0x35/0x130
+# [ 2704.525241]  drm_vblank_work_flush+0x96/0x100
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
index 117098bc95d9..afd4809b491c 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
@@ -1,3 +1,5 @@
+core_debugfs@read-all-entries,Timeout
+core_setmaster@master-drop-set-user,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
@@ -17,6 +19,8 @@ perf@i915-ref-count,Fail
 perf_pmu@busy-accuracy-50,Fail
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
+prime_busy@after-wait,Fail
+prime_busy@before,Fail
 sysfs_heartbeat_interval@long,Timeout
 sysfs_heartbeat_interval@off,Timeout
 sysfs_preempt_timeout@off,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
index 462c050a8b2d..102c4b3eef4d 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
@@ -1,14 +1,14 @@
 api_intel_allocator@reopen,Timeout
 api_intel_bb@destroy-bb,Timeout
 core_hotunplug@hotrebind-lateclose,Timeout
+core_setmaster@master-drop-set-user,Fail
+drm_read@short-buffer-block,Timeout
 dumb_buffer@map-valid,Timeout
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
-i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rps@engine-order,Timeout
-i915_pm_rps@waitboost,Fail
 kms_lease@lease-uevent,Fail
 kms_rotation_crc@multiplane-rotation,Fail
 perf@i915-ref-count,Fail
@@ -17,7 +17,6 @@ perf_pmu@enable-race,Timeout
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
 perf_pmu@semaphore-wait-idle,Timeout
-prime_busy@before,Fail
 prime_mmap@test_refcounting,Timeout
 sriov_basic@enable-vfs-bind-unbind-each-numvfs-all,Timeout
 syncobj_basic@illegal-fd-to-handle,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
new file mode 100644
index 000000000000..9738006e3759
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
@@ -0,0 +1,6 @@
+# Board Name: acer-cp514-2h-1130g7-volteer
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14624
+# Failure Rate: 100
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+perf@gen12-unprivileged-single-ctx-counters
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
index 0f167cfd503c..5be9ed09aaf1 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
@@ -1,4 +1,4 @@
-core_setmaster_vs_auth,Fail
+core_setmaster@master-drop-set-user,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
@@ -6,9 +6,8 @@ i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
 i915_pm_rpm@system-suspend-execbuf,Timeout
-kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc,Timeout
-kms_cursor_crc@cursor-suspend,Timeout
-kms_fb_coherency@memset-crc,Crash
+kms_dirtyfb@default-dirtyfb-ioctl,Fail
+kms_dirtyfb@fbc-dirtyfb-ioctl,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -29,19 +28,14 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu,Timeout
 kms_frontbuffer_tracking@fbc-tiling-linear,Fail
 kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_scaling@planes-upscale-factor-0-25,Timeout
-kms_pm_backlight@brightness-with-dpms,Crash
-kms_pm_backlight@fade,Crash
-kms_prop_blob@invalid-set-prop-any,Fail
-kms_properties@connector-properties-legacy,Timeout
-kms_universal_plane@disable-primary-vs-flip,Timeout
+kms_pm_backlight@fade-with-dpms,Crash
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
 perf@i915-ref-count,Fail
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
index 592d7d69e6fc..1533e46f3dc6 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
@@ -1,7 +1,9 @@
+core_setmaster@master-drop-set-root,Fail
+core_setmaster@master-drop-set-shared-fd,Fail
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
-kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
+kms_3d@basic,Fail
 kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
-kms_bw@connected-linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@connected-linear-tiling-2-displays-1920x1080p,Fail
 kms_bw@connected-linear-tiling-2-displays-2160x1440p,Fail
 kms_bw@connected-linear-tiling-2-displays-2560x1440p,Fail
@@ -14,9 +16,7 @@ kms_bw@linear-tiling-2-displays-1920x1080p,Fail
 kms_bw@linear-tiling-2-displays-2160x1440p,Fail
 kms_bw@linear-tiling-2-displays-2560x1440p,Fail
 kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_color@invalid-gamma-lut-sizes,Fail
 kms_cursor_legacy@cursor-vs-flip-atomic,Fail
-kms_cursor_legacy@cursor-vs-flip-legacy,Fail
 kms_cursor_legacy@flip-vs-cursor-atomic,Fail
 kms_cursor_legacy@flip-vs-cursor-legacy,Fail
 kms_cursor_legacy@flip-vs-cursor-toggle,Fail
@@ -24,9 +24,9 @@ kms_cursor_legacy@flip-vs-cursor-varying-size,Fail
 kms_flip@basic-plain-flip,Fail
 kms_flip@dpms-off-confusion,Fail
 kms_flip@dpms-off-confusion-interruptible,Fail
-kms_flip@flip-vs-absolute-wf_vblank,Fail
-kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
 kms_flip@flip-vs-blocking-wf-vblank,Fail
+kms_flip@flip-vs-dpms-on-nop,Fail
+kms_flip@flip-vs-dpms-on-nop-interruptible,Fail
 kms_flip@flip-vs-expired-vblank,Fail
 kms_flip@flip-vs-expired-vblank-interruptible,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
@@ -40,5 +40,4 @@ kms_flip@plain-flip-fb-recreate-interruptible,Fail
 kms_flip@plain-flip-interruptible,Fail
 kms_flip@plain-flip-ts-check,Fail
 kms_flip@plain-flip-ts-check-interruptible,Fail
-kms_invalid_mode@overflow-vrefresh,Fail
 kms_lease@lease-uevent,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
index 443596d9e662..031828241b52 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
@@ -53,3 +53,122 @@ kms_bw@connected-linear-tiling-1-displays-2160x1440p
 # IGT Version: 1.30-g04bedb923
 # Linux Version: 6.14.0-rc4
 kms_flip@flip-vs-wf_vblank-interruptible
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/7559dd68-c9dd-410f-880f-201679e2dd54@collabora.com/T/#u
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@blocking-wf_vblank
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/953ab66e-9dda-4003-9b98-9e0d81e18a1f@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@busy-flip
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/6ab7f59c-042e-4c7a-baaa-86c7d47ab308@collabora.com/
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@flip-vs-rmfb
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/30b3f8b0-3409-4329-bb60-b6287e1a439d@collabora.com/
+# Failure Rate: 60
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_atomic_transition@plane-all-modeset-transition-internal-panels
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/4c9e1501-52cd-4659-a894-8a2ac58c3996@collabora.com/
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@absolute-wf_vblank
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@flip-vs-absolute-wf_vblank
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@modeset-vs-vblank-race
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 60
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@nonexisting-fb
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@blocking-absolute-wf_vblank
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@dpms-vs-vblank-race
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@basic-flip-vs-dpms
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@flip-vs-dpms-off-vs-modeset
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_atomic_transition@plane-toggle-modeset-transition
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@basic-flip-vs-wf_vblank
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@wf_vblank-ts-check
+
+# Board Name: mt8173-elm-hana
+# Bug Report: TBD
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@basic-flip-vs-modeset
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
index 184d0cccc318..7f94244866b8 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -13,12 +13,9 @@ kms_cursor_legacy@flip-vs-cursor-atomic,Fail
 kms_cursor_legacy@flip-vs-cursor-legacy,Fail
 kms_cursor_legacy@flip-vs-cursor-toggle,Fail
 kms_cursor_legacy@flip-vs-cursor-varying-size,Fail
-kms_flip@basic-flip-vs-wf_vblank,Fail
 kms_flip@basic-plain-flip,Fail
 kms_flip@dpms-off-confusion,Fail
 kms_flip@dpms-off-confusion-interruptible,Fail
-kms_flip@flip-vs-absolute-wf_vblank,Fail
-kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
 kms_flip@flip-vs-blocking-wf-vblank,Fail
 kms_flip@flip-vs-expired-vblank,Fail
 kms_flip@flip-vs-expired-vblank-interruptible,Fail
@@ -28,7 +25,6 @@ kms_flip@flip-vs-panning-interruptible,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-suspend,Fail
 kms_flip@flip-vs-suspend-interruptible,Fail
-kms_flip@flip-vs-wf_vblank-interruptible,Fail
 kms_flip@plain-flip-fb-recreate,Fail
 kms_flip@plain-flip-fb-recreate-interruptible,Fail
 kms_flip@plain-flip-interruptible,Fail
@@ -36,3 +32,6 @@ kms_flip@plain-flip-ts-check,Fail
 kms_flip@plain-flip-ts-check-interruptible,Fail
 kms_invalid_mode@overflow-vrefresh,Fail
 kms_lease@lease-uevent,Fail
+kms_flip@flip-vs-dpms-on-nop,Fail
+kms_flip@flip-vs-dpms-on-nop-interruptible,Fail
+core_setmaster@master-drop-set-user,Fail
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
index fc3745180683..8aef1d06987e 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
@@ -1,4 +1,5 @@
 kms_3d,Fail
+kms_3d@basic,Fail
 kms_cursor_legacy@forked-bo,Fail
 kms_cursor_legacy@forked-move,Fail
 kms_cursor_legacy@single-bo,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index ae36a39619c6..693450ac7d03 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -1,3 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 kms_color@ctm-0-25,Fail
 kms_color@ctm-0-50,Fail
 kms_color@ctm-0-75,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index ae36a39619c6..693450ac7d03 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -1,3 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 kms_color@ctm-0-25,Fail
 kms_color@ctm-0-50,Fail
 kms_color@ctm-0-75,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
index 8d26b23133aa..f387c73193c6 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
@@ -1,3 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
 kms_cursor_legacy@forked-bo,Fail
 kms_cursor_legacy@forked-move,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
index abd1ccb71561..cc5f7fe98dd7 100644
--- a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
@@ -1,2 +1,3 @@
+core_setmaster@master-drop-set-user,Fail
 panfrost/panfrost_prime@gem-prime-import,Fail
 panfrost/panfrost_submit@pan-submit-error-bad-requirements,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
index 8330b934602a..8d0b7682e640 100644
--- a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
@@ -1,2 +1,3 @@
+core_setmaster@master-drop-set-user,Crash
 panfrost/panfrost_prime@gem-prime-import,Crash
 panfrost/panfrost_submit@pan-submit-error-bad-requirements,Crash
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
index abd1ccb71561..cc5f7fe98dd7 100644
--- a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
@@ -1,2 +1,3 @@
+core_setmaster@master-drop-set-user,Fail
 panfrost/panfrost_prime@gem-prime-import,Fail
 panfrost/panfrost_submit@pan-submit-error-bad-requirements,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
index 61122ea7f008..365990ce42d4 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
@@ -2,8 +2,18 @@ core_setmaster@master-drop-set-root,Crash
 core_setmaster@master-drop-set-shared-fd,Crash
 core_setmaster@master-drop-set-user,Crash
 core_setmaster_vs_auth,Crash
-dumb_buffer@create-clear,Crash
 fbdev@pan,Crash
-kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
+kms_cursor_crc@cursor-dpms,Crash
+kms_cursor_crc@cursor-sliding-32x32,Crash
+kms_cursor_legacy@basic-flip-before-cursor-atomic,Crash
+kms_cursor_legacy@cursor-vs-flip-atomic,Crash
+kms_flip@basic-flip-vs-wf_vblank,Crash
+kms_flip@flip-vs-absolute-wf_vblank,Crash
+kms_flip@flip-vs-panning-vs-hang,Crash
+kms_flip@plain-flip-fb-recreate-interruptible,Crash
+kms_pipe_crc_basic@read-crc-frame-sequence,Crash
+kms_plane_cursor@overlay,Crash
+kms_plane_cursor@viewport,Crash
 kms_prop_blob@invalid-set-prop,Crash
 kms_prop_blob@invalid-set-prop-any,Crash
+kms_properties@get_properties-sanity-non-atomic,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
index cd0b27d8b636..34f43e95a51b 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
@@ -32,3 +32,24 @@ kms_flip@plain-flip-ts-check
 # IGT Version: 1.28-ga73311079
 # Linux Version: 6.11.0-rc2
 kms_cursor_crc@cursor-alpha-opaque
+
+# Board Name: rk3288-veyron-jaq
+# Bug Report: https://lore.kernel.org/dri-devel/acfd5838-d861-4dd9-97c3-99fffc9bfa04@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@flip-vs-absolute-wf_vblank
+
+# Board Name: rk3288-veyron-jaq
+# Bug Report: https://lore.kernel.org/dri-devel/81e13fcc-d916-4eb8-91cd-f74f64f53f72@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@flip-vs-dpms-on-nop-interruptible
+
+# Board Name: rk3288-veyron-jaq
+# Bug Report: https://lore.kernel.org/dri-devel/10c5abab-c8fe-4eff-8eed-009038436b49@collabora.com/T/#u
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@plain-flip-fb-recreate
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
index 45dd8d493f6e..eac97338c05f 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
@@ -1,9 +1,9 @@
-dumb_buffer@create-clear,Crash
+core_setmaster@master-drop-set-user,Fail
 kms_atomic_transition@modeset-transition,Fail
 kms_atomic_transition@modeset-transition-fencing,Fail
 kms_atomic_transition@plane-toggle-modeset-transition,Fail
-kms_color@gamma,Fail
-kms_color@legacy-gamma,Fail
+kms_cursor_crc@async-cursor-crc-framebuffer-change,Fail
+kms_cursor_crc@async-cursor-crc-position-change,Fail
 kms_cursor_crc@cursor-alpha-opaque,Fail
 kms_cursor_crc@cursor-alpha-transparent,Fail
 kms_cursor_crc@cursor-dpms,Fail
@@ -29,6 +29,8 @@ kms_cursor_crc@cursor-sliding-32x10,Fail
 kms_cursor_crc@cursor-sliding-32x32,Fail
 kms_cursor_crc@cursor-sliding-64x21,Fail
 kms_cursor_crc@cursor-sliding-64x64,Fail
+kms_cursor_crc@cursor-tearing-framebuffer-change,Fail
+kms_cursor_crc@cursor-tearing-position-change,Fail
 kms_cursor_edge_walk@64x64-left-edge,Fail
 kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
 kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
@@ -41,8 +43,11 @@ kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
 kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
 kms_cursor_legacy@flip-vs-cursor-legacy,Fail
 kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic,Fail
+kms_flip@basic-flip-vs-dpms,Fail
 kms_flip@basic-flip-vs-wf_vblank,Fail
 kms_flip@blocking-wf_vblank,Fail
+kms_flip@flip-vs-dpms-on-nop,Fail
+kms_flip@flip-vs-dpms-on-nop-interruptible,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning,Fail
 kms_flip@flip-vs-panning-interruptible,Fail
@@ -51,7 +56,6 @@ kms_flip@modeset-vs-vblank-race,Fail
 kms_flip@plain-flip-fb-recreate,Fail
 kms_flip@plain-flip-fb-recreate-interruptible,Fail
 kms_flip@plain-flip-ts-check,Fail
-kms_flip@plain-flip-ts-check-interruptible,Fail
 kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_invalid_mode@int-max-clock,Fail
 kms_invalid_mode@overflow-vrefresh,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
index b467991d4094..918dd33c2092 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
@@ -144,3 +144,38 @@ kms_bw@connected-linear-tiling-1-displays-2160x1440p
 # IGT Version: 1.30-g04bedb923
 # Linux Version: 6.14.0-rc4
 kms_bw@linear-tiling-1-displays-3840x2160p
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/7b6e2e3b-2ea2-4cd7-92a5-68d23a63e426@collabora.com/T/#u
+# Failure Rate: 60
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_color@gamma
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/e29c2892-08f2-423f-af72-e4d8b207fd1c@collabora.com/T/#u
+# Failure Rate: 60
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_bw@connected-linear-tiling-1-displays-3840x2160p
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/ad9ce463-c803-4502-ae89-381a6b6eb19f@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_color@legacy-gamma
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/59724e10-12ca-4481-b0e4-72d7b6e4dae0@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_flip@plain-flip-ts-check-interruptible
+
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/d790db5f-a1ba-47f9-9af0-d3287ef3274c@collabora.com/T/#u
+# Failure Rate: 20
+# IGT Version: 2.1-g26ddb59c1
+# Linux Version: 6.16.0-rc2
+kms_bw@linear-tiling-2-displays-3840x2160p
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
index a3aac6acb5df..eb5c6ad27d60 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
@@ -1,6 +1,6 @@
 core_setmaster@master-drop-set-user,Fail
-dumb_buffer@create-clear,Crash
 kms_3d,Fail
+kms_3d@basic,Fail
 kms_cursor_legacy@forked-bo,Fail
 kms_cursor_legacy@forked-move,Fail
 kms_cursor_legacy@single-bo,Fail
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
index 9749ddb75121..1831ce8fdbc9 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
@@ -2,7 +2,6 @@ kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@size-max,Fail
 kms_addfb_basic@too-high,Fail
-kms_atomic_transition@plane-primary-toggle-with-vblank-wait,Fail
 kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
 kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
 kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
@@ -131,60 +130,11 @@ kms_bw@linear-tiling-9-displays-1920x1080p,Fail
 kms_bw@linear-tiling-9-displays-2160x1440p,Fail
 kms_bw@linear-tiling-9-displays-2560x1440p,Fail
 kms_bw@linear-tiling-9-displays-3840x2160p,Fail
-kms_flip@absolute-wf_vblank,Fail
-kms_flip@absolute-wf_vblank-interruptible,Fail
-kms_flip@basic-flip-vs-wf_vblank,Fail
-kms_flip@blocking-absolute-wf_vblank,Fail
-kms_flip@blocking-absolute-wf_vblank-interruptible,Fail
-kms_flip@blocking-wf_vblank,Fail
-kms_flip@busy-flip,Fail
-kms_flip@dpms-vs-vblank-race,Fail
-kms_flip@dpms-vs-vblank-race-interruptible,Fail
-kms_flip@flip-vs-absolute-wf_vblank,Fail
-kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
-kms_flip@flip-vs-blocking-wf-vblank,Fail
-kms_flip@flip-vs-expired-vblank,Fail
-kms_flip@flip-vs-expired-vblank-interruptible,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
-kms_flip@flip-vs-wf_vblank-interruptible,Fail
-kms_flip@modeset-vs-vblank-race,Fail
-kms_flip@modeset-vs-vblank-race-interruptible,Fail
-kms_flip@plain-flip-fb-recreate,Fail
-kms_flip@plain-flip-fb-recreate-interruptible,Fail
-kms_flip@plain-flip-ts-check,Fail
-kms_flip@plain-flip-ts-check-interruptible,Fail
-kms_flip@wf_vblank-ts-check,Fail
-kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_invalid_mode@int-max-clock,Fail
 kms_invalid_mode@overflow-vrefresh,Fail
-kms_lease@cursor-implicit-plane,Fail
 kms_lease@lease-uevent,Fail
-kms_lease@page-flip-implicit-plane,Fail
-kms_lease@setcrtc-implicit-plane,Fail
-kms_lease@simple-lease,Fail
-kms_sequence@get-busy,Fail
-kms_sequence@get-forked,Fail
-kms_sequence@get-forked-busy,Fail
-kms_sequence@get-idle,Fail
-kms_sequence@queue-busy,Fail
-kms_sequence@queue-idle,Fail
-kms_setmode@basic,Fail
-kms_vblank@accuracy-idle,Fail
-kms_vblank@crtc-id,Fail
-kms_vblank@invalid,Fail
-kms_vblank@query-busy,Fail
-kms_vblank@query-forked,Fail
-kms_vblank@query-forked-busy,Fail
-kms_vblank@query-idle,Fail
-kms_vblank@ts-continuation-dpms-rpm,Fail
 kms_vblank@ts-continuation-dpms-suspend,Fail
-kms_vblank@ts-continuation-idle,Fail
-kms_vblank@ts-continuation-modeset,Fail
-kms_vblank@ts-continuation-modeset-rpm,Fail
 kms_vblank@ts-continuation-suspend,Fail
-kms_vblank@wait-busy,Fail
-kms_vblank@wait-forked,Fail
-kms_vblank@wait-forked-busy,Fail
-kms_vblank@wait-idle,Fail
 perf@i915-ref-count,Fail
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
index 6ebcc7d89fbd..013a645d1c08 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
@@ -16,6 +16,8 @@ kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-suspend,Fail
 kms_flip@flip-vs-suspend-interruptible,Fail
 kms_lease@lease-uevent,Fail
+kms_plane@pixel-format,Timeout
+kms_plane@pixel-format-source-clamping,Timeout
 kms_writeback@writeback-check-output,Fail
 kms_writeback@writeback-check-output-XRGB2101010,Fail
 kms_writeback@writeback-fb-id,Fail
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
index 716d2d4e452d..66227842e517 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
@@ -809,3 +809,6 @@ kms_dp_link_training.*
 # https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
 kms_display_modes@extended-mode-basic
 kms_display_modes@mst-extended-mode-negative
+
+# Hangs the machine and timeout occurs
+.*suspend.*
-- 
2.47.3

