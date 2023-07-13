Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592B6751B7B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB91010E636;
	Thu, 13 Jul 2023 08:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE04610E62F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:25:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcc-0005qL-Qz; Thu, 13 Jul 2023 10:24:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrca-00E4j6-Ln; Thu, 13 Jul 2023 10:24:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcZ-004Vgl-O4; Thu, 13 Jul 2023 10:24:19 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Julia Lawall <julia.lawall@inria.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Luben Tuikov <luben.tuikov@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sean Paul <seanpaul@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 01/17] drm/atomic_state: Rename struct drm_atomic_state::dev
 to drm
Date: Thu, 13 Jul 2023 10:23:52 +0200
Message-Id: <20230713082408.2266984-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=113545;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=odOBpsyb5Hk3jxkUHoH7bB3ek/1KqrI7aLEjpR6s44s=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7SB55pVVU2MatB6BO1JiCk4U6kZxGP2UeYMP
 FCtqry3XGyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0gQAKCRCPgPtYfRL+
 Ts/jB/9k+wxXtl5T8rLjEaZB8b8a9B7sPb8Nx6423X1hZSTU6AtslgBVw2SLJJeq0nIjazMwXN9
 +0GU6ejPzs33SUT5Klu/z+bMXqyzetvhbjIbryVdKmsZIS5a50LcbAVkq7Ew7IbE/rRPHGiEDTA
 rTWnES+Pe5l7f6ESYHdDRONYpwVxEYwFUKf1j/HRsMy5pQ6eBO6m5q9pcoLo4hfji8Ls30z0//L
 Q8GKdx6GbSnT/Uw7LWjxhyxXzDvtn/jpfcVHBzLSIm1C8CW/f6Z9UdvYUozH0Mac/1mk3Tkp4gT
 wgCeDMRLCgDtt+blUPH1mruH4gJ3HVwEGEW3KM7YixWxnngu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"dev" is usually used for struct device pointers. Using it for struct
drm_device pointers is irritating (for me at least). Replace it
by "drm" and adapt all users.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 58 +++++++++---------
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  2 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |  4 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  4 +-
 drivers/gpu/drm/ast/ast_mode.c                |  2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 12 ++--
 drivers/gpu/drm/drm_atomic.c                  | 42 ++++++-------
 drivers/gpu/drm/drm_atomic_helper.c           | 14 ++---
 drivers/gpu/drm/drm_atomic_uapi.c             |  2 +-
 drivers/gpu/drm/drm_mode_object.c             |  2 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c       |  2 +-
 drivers/gpu/drm/i915/display/hsw_ips.c        |  6 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c        |  6 +-
 drivers/gpu/drm/i915/display/icl_dsi.c        |  2 +-
 .../gpu/drm/i915/display/intel_atomic_plane.c |  6 +-
 drivers/gpu/drm/i915/display/intel_bw.c       | 12 ++--
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 22 +++----
 drivers/gpu/drm/i915/display/intel_cdclk.h    |  4 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 60 +++++++++----------
 drivers/gpu/drm/i915/display/intel_display.h  | 16 ++---
 drivers/gpu/drm/i915/display/intel_dp.c       |  4 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  4 +-
 drivers/gpu/drm/i915/display/intel_dpll.c     | 20 +++----
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 23 +++----
 drivers/gpu/drm/i915/display/intel_fbc.c      |  8 +--
 .../gpu/drm/i915/display/intel_global_state.c | 12 ++--
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c | 14 ++---
 drivers/gpu/drm/i915/display/intel_psr.c      | 12 ++--
 drivers/gpu/drm/i915/display/intel_snps_phy.c |  2 +-
 drivers/gpu/drm/i915/display/intel_wm.c       | 12 ++--
 drivers/gpu/drm/i915/display/skl_watermark.c  | 32 +++++-----
 drivers/gpu/drm/i915/display/skl_watermark.h  |  4 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |  2 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |  2 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c    |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c     |  4 +-
 drivers/gpu/drm/msm/msm_atomic.c              |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c        |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  4 +-
 drivers/gpu/drm/omapdrm/omap_drv.c            |  4 +-
 drivers/gpu/drm/omapdrm/omap_overlay.c        |  4 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  2 +-
 drivers/gpu/drm/tegra/drm.c                   |  2 +-
 drivers/gpu/drm/tidss/tidss_kms.c             |  2 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c   |  4 +-
 .../gpu/drm/vc4/tests/vc4_test_pv_muxing.c    |  2 +-
 drivers/gpu/drm/vc4/vc4_kms.c                 | 14 ++---
 drivers/gpu/drm/vkms/vkms_drv.c               |  2 +-
 include/drm/drm_atomic.h                      | 20 +++----
 include/drm/drm_atomic_helper.h               |  4 +-
 58 files changed, 262 insertions(+), 257 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 514f6785a020..83ec2bb5c3b1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3880,7 +3880,7 @@ static int register_outbox_irq_handlers(struct amdgpu_device *adev)
 int dm_atomic_get_state(struct drm_atomic_state *state,
 			struct dm_atomic_state **dm_state)
 {
-	struct drm_device *dev = state->dev;
+	struct drm_device *dev = state->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_display_manager *dm = &adev->dm;
 	struct drm_private_state *priv_state;
@@ -3900,7 +3900,7 @@ int dm_atomic_get_state(struct drm_atomic_state *state,
 static struct dm_atomic_state *
 dm_atomic_get_new_state(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = state->dev;
+	struct drm_device *dev = state->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_display_manager *dm = &adev->dm;
 	struct drm_private_obj *obj;
@@ -8098,7 +8098,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			&bundle->flip_addrs[planes_count].address,
 			afb->tmz_surface, false);
 
-		drm_dbg_state(state->dev, "plane: id=%d dcc_en=%d\n",
+		drm_dbg_state(state->drm, "plane: id=%d dcc_en=%d\n",
 				 new_plane_state->plane->index,
 				 bundle->plane_infos[planes_count].dcc.enable);
 
@@ -8161,7 +8161,8 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 				dc_plane,
 				bundle->flip_addrs[planes_count].flip_timestamp_in_us);
 
-		drm_dbg_state(state->dev, "%s Flipping to hi: 0x%x, low: 0x%x\n",
+		drm_dbg_state(state->drm,
+				 "%s Flipping to hi: 0x%x, low: 0x%x\n",
 				 __func__,
 				 bundle->flip_addrs[planes_count].address.grph.addr.high_part,
 				 bundle->flip_addrs[planes_count].address.grph.addr.low_part);
@@ -8476,7 +8477,7 @@ static void amdgpu_dm_crtc_copy_transient_flags(struct drm_crtc_state *crtc_stat
  */
 static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = state->dev;
+	struct drm_device *dev = state->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_display_manager *dm = &adev->dm;
 	struct dm_atomic_state *dm_state;
@@ -8536,17 +8537,17 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
 		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
 
-		drm_dbg_state(state->dev,
-			"amdgpu_crtc id:%d crtc_state_flags: enable:%d, active:%d, "
-			"planes_changed:%d, mode_changed:%d,active_changed:%d,"
-			"connectors_changed:%d\n",
-			acrtc->crtc_id,
-			new_crtc_state->enable,
-			new_crtc_state->active,
-			new_crtc_state->planes_changed,
-			new_crtc_state->mode_changed,
-			new_crtc_state->active_changed,
-			new_crtc_state->connectors_changed);
+		drm_dbg_state(state->drm,
+		              "amdgpu_crtc id:%d crtc_state_flags: enable:%d, active:%d, "
+		              "planes_changed:%d, mode_changed:%d,active_changed:%d,"
+		              "connectors_changed:%d\n",
+		              acrtc->crtc_id,
+		              new_crtc_state->enable,
+		              new_crtc_state->active,
+		              new_crtc_state->planes_changed,
+		              new_crtc_state->mode_changed,
+		              new_crtc_state->active_changed,
+		              new_crtc_state->connectors_changed);
 
 		/* Disable cursor if disabling crtc */
 		if (old_crtc_state->active && !new_crtc_state->active) {
@@ -9322,17 +9323,17 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 	if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
 		goto skip_modeset;
 
-	drm_dbg_state(state->dev,
-		"amdgpu_crtc id:%d crtc_state_flags: enable:%d, active:%d, "
-		"planes_changed:%d, mode_changed:%d,active_changed:%d,"
-		"connectors_changed:%d\n",
-		acrtc->crtc_id,
-		new_crtc_state->enable,
-		new_crtc_state->active,
-		new_crtc_state->planes_changed,
-		new_crtc_state->mode_changed,
-		new_crtc_state->active_changed,
-		new_crtc_state->connectors_changed);
+	drm_dbg_state(state->drm,
+		      "amdgpu_crtc id:%d crtc_state_flags: enable:%d, active:%d, "
+		      "planes_changed:%d, mode_changed:%d,active_changed:%d,"
+		      "connectors_changed:%d\n",
+		      acrtc->crtc_id,
+		      new_crtc_state->enable,
+		      new_crtc_state->active,
+		      new_crtc_state->planes_changed,
+		      new_crtc_state->mode_changed,
+		      new_crtc_state->active_changed,
+		      new_crtc_state->connectors_changed);
 
 	/* Remove stream for any changed/disabled CRTC */
 	if (!enable) {
@@ -10073,7 +10074,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		if (!modified)
 			continue;
 
-		drm_for_each_plane_mask(plane, state->dev, crtc->state->plane_mask) {
+		drm_for_each_plane_mask(plane, state->drm,
+					crtc->state->plane_mask) {
 			if (plane->type == DRM_PLANE_TYPE_CURSOR)
 				continue;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a4cb23d059bd..1d207d43a71e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -395,7 +395,7 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 {
 	struct dc_stream_state *stream = crtc->stream;
-	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->drm);
 	bool has_rom = adev->asic_type <= CHIP_RAVEN;
 	struct drm_color_ctm *ctm = NULL;
 	const struct drm_color_lut *degamma_lut, *regamma_lut;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 440fc0869a34..80684dea114e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -319,7 +319,7 @@ static int count_crtc_active_planes(struct drm_crtc_state *new_crtc_state)
 	struct drm_plane *plane;
 	int num_active = 0;
 
-	drm_for_each_plane_mask(plane, state->dev, new_crtc_state->plane_mask) {
+	drm_for_each_plane_mask(plane, state->drm, new_crtc_state->plane_mask) {
 		struct drm_plane_state *new_plane_state;
 
 		/* Cursor planes are "fake". */
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 62dc64550793..dd3c455bb1bb 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -69,7 +69,7 @@ static const struct drm_driver komeda_kms_driver = {
 
 static void komeda_kms_atomic_commit_hw_done(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = state->dev;
+	struct drm_device *dev = state->drm;
 	struct komeda_kms_dev *kms = to_kdev(dev);
 	int i;
 
@@ -88,7 +88,7 @@ static void komeda_kms_atomic_commit_hw_done(struct drm_atomic_state *state)
 
 static void komeda_kms_commit_tail(struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = old_state->drm;
 	bool fence_cookie = dma_fence_begin_signalling();
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 46ff3521570c..b23ca9b90b7c 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -189,7 +189,7 @@ static int malidp_set_and_wait_config_valid(struct drm_device *drm)
 
 static void malidp_atomic_commit_hw_done(struct drm_atomic_state *state)
 {
-	struct drm_device *drm = state->dev;
+	struct drm_device *drm = state->drm;
 	struct malidp_drm *malidp = drm_to_malidp(drm);
 	int loop = 5;
 
@@ -230,7 +230,7 @@ static void malidp_atomic_commit_hw_done(struct drm_atomic_state *state)
 
 static void malidp_atomic_commit_tail(struct drm_atomic_state *state)
 {
-	struct drm_device *drm = state->dev;
+	struct drm_device *drm = state->drm;
 	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index f711d592da52..f91ff312edfd 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1741,7 +1741,7 @@ static int ast_astdp_output_init(struct ast_device *ast)
 
 static void ast_mode_config_helper_atomic_commit_tail(struct drm_atomic_state *state)
 {
-	struct ast_device *ast = to_ast_device(state->dev);
+	struct ast_device *ast = to_ast_device(state->drm);
 
 	/*
 	 * Concurrent operations could possibly trigger a call to
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 8fe7b635e5bb..5070670b29b5 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3404,7 +3404,8 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
 
 	/* Skip failed payloads */
 	if (payload->vc_start_slot == -1) {
-		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
+		drm_dbg_kms(state->drm,
+			    "Part 1 of payload creation for %s failed, skipping part 2\n",
 			    payload->port->connector->name);
 		return -EIO;
 	}
@@ -4492,7 +4493,8 @@ void drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_state *state)
 		for (j = 0; j < old_mst_state->num_commit_deps; j++) {
 			ret = drm_crtc_commit_wait(old_mst_state->commit_deps[j]);
 			if (ret < 0)
-				drm_err(state->dev, "Failed to wait for %s: %d\n",
+				drm_err(state->drm,
+					"Failed to wait for %s: %d\n",
 					old_mst_state->commit_deps[j]->crtc->name, ret);
 		}
 
@@ -5332,14 +5334,14 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
 
 	payload = drm_atomic_get_mst_payload_state(mst_state, port);
 	if (!payload) {
-		drm_dbg_atomic(state->dev,
+		drm_dbg_atomic(state->drm,
 			       "[MST PORT:%p] Couldn't find payload in mst state %p\n",
 			       port, mst_state);
 		return -EINVAL;
 	}
 
 	if (payload->dsc_enabled == enable) {
-		drm_dbg_atomic(state->dev,
+		drm_dbg_atomic(state->drm,
 			       "[MST PORT:%p] DSC flag is already set to %d, returning %d time slots\n",
 			       port, enable, payload->time_slots);
 		time_slots = payload->time_slots;
@@ -5347,7 +5349,7 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
 
 	if (enable) {
 		time_slots = drm_dp_atomic_find_time_slots(state, port->mgr, port, pbn);
-		drm_dbg_atomic(state->dev,
+		drm_dbg_atomic(state->drm,
 			       "[MST PORT:%p] Enabling DSC flag, reallocating %d time slots on the port\n",
 			       port, time_slots);
 		if (time_slots < 0)
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 2c454568a607..8a07506a20a2 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -140,7 +140,7 @@ drm_atomic_state_init(struct drm_device *dev, struct drm_atomic_state *state)
 	if (!state->planes)
 		goto fail;
 
-	state->dev = dev;
+	state->drm = dev;
 
 	drm_dbg_atomic(dev, "Allocated atomic state %p\n", state);
 
@@ -189,7 +189,7 @@ EXPORT_SYMBOL(drm_atomic_state_alloc);
  */
 void drm_atomic_state_default_clear(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = state->dev;
+	struct drm_device *dev = state->drm;
 	struct drm_mode_config *config = &dev->mode_config;
 	int i;
 
@@ -279,7 +279,7 @@ EXPORT_SYMBOL(drm_atomic_state_default_clear);
  */
 void drm_atomic_state_clear(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = state->dev;
+	struct drm_device *dev = state->drm;
 	struct drm_mode_config *config = &dev->mode_config;
 
 	if (config->funcs->atomic_state_clear)
@@ -299,11 +299,11 @@ EXPORT_SYMBOL(drm_atomic_state_clear);
 void __drm_atomic_state_free(struct kref *ref)
 {
 	struct drm_atomic_state *state = container_of(ref, typeof(*state), ref);
-	struct drm_mode_config *config = &state->dev->mode_config;
+	struct drm_mode_config *config = &state->drm->mode_config;
 
 	drm_atomic_state_clear(state);
 
-	drm_dbg_atomic(state->dev, "Freeing atomic state %p\n", state);
+	drm_dbg_atomic(state->drm, "Freeing atomic state %p\n", state);
 
 	if (config->funcs->atomic_state_free) {
 		config->funcs->atomic_state_free(state);
@@ -360,7 +360,7 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 	state->crtcs[index].ptr = crtc;
 	crtc_state->state = state;
 
-	drm_dbg_atomic(state->dev, "Added [CRTC:%d:%s] %p state to %p\n",
+	drm_dbg_atomic(state->drm, "Added [CRTC:%d:%s] %p state to %p\n",
 		       crtc->base.id, crtc->name, crtc_state, state);
 
 	return crtc_state;
@@ -863,7 +863,7 @@ drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
 
 	state->num_private_objs = num_objs;
 
-	drm_dbg_atomic(state->dev,
+	drm_dbg_atomic(state->drm,
 		       "Added new private object %p state %p to %p\n",
 		       obj, obj_state, state);
 
@@ -1279,7 +1279,7 @@ int
 drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
 				   struct drm_crtc *crtc)
 {
-	struct drm_mode_config *config = &state->dev->mode_config;
+	struct drm_mode_config *config = &state->drm->mode_config;
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_connector_list_iter conn_iter;
@@ -1302,7 +1302,7 @@ drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
 	 * Changed connectors are already in @state, so only need to look
 	 * at the connector_mask in crtc_state.
 	 */
-	drm_connector_list_iter_begin(state->dev, &conn_iter);
+	drm_connector_list_iter_begin(state->drm, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		if (!(crtc_state->connector_mask & drm_connector_mask(connector)))
 			continue;
@@ -1353,7 +1353,7 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 		       "Adding all current planes for [CRTC:%d:%s] to %p\n",
 		       crtc->base.id, crtc->name, state);
 
-	drm_for_each_plane_mask(plane, state->dev, old_crtc_state->plane_mask) {
+	drm_for_each_plane_mask(plane, state->drm, old_crtc_state->plane_mask) {
 		struct drm_plane_state *plane_state =
 			drm_atomic_get_plane_state(state, plane);
 
@@ -1377,7 +1377,7 @@ EXPORT_SYMBOL(drm_atomic_add_affected_planes);
  */
 int drm_atomic_check_only(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = state->dev;
+	struct drm_device *dev = state->drm;
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state;
@@ -1426,7 +1426,7 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 	}
 
 	if (config->funcs->atomic_check) {
-		ret = config->funcs->atomic_check(state->dev, state);
+		ret = config->funcs->atomic_check(state->drm, state);
 
 		if (ret) {
 			drm_dbg_atomic(dev, "atomic driver check for %p failed: %d\n",
@@ -1488,8 +1488,8 @@ EXPORT_SYMBOL(drm_atomic_check_only);
  */
 int drm_atomic_commit(struct drm_atomic_state *state)
 {
-	struct drm_mode_config *config = &state->dev->mode_config;
-	struct drm_printer p = drm_info_printer(state->dev->dev);
+	struct drm_mode_config *config = &state->drm->mode_config;
+	struct drm_printer p = drm_info_printer(state->drm->dev);
 	int ret;
 
 	if (drm_debug_enabled(DRM_UT_STATE))
@@ -1499,9 +1499,9 @@ int drm_atomic_commit(struct drm_atomic_state *state)
 	if (ret)
 		return ret;
 
-	drm_dbg_atomic(state->dev, "committing %p\n", state);
+	drm_dbg_atomic(state->drm, "committing %p\n", state);
 
-	return config->funcs->atomic_commit(state->dev, state, false);
+	return config->funcs->atomic_commit(state->drm, state, false);
 }
 EXPORT_SYMBOL(drm_atomic_commit);
 
@@ -1521,16 +1521,16 @@ EXPORT_SYMBOL(drm_atomic_commit);
  */
 int drm_atomic_nonblocking_commit(struct drm_atomic_state *state)
 {
-	struct drm_mode_config *config = &state->dev->mode_config;
+	struct drm_mode_config *config = &state->drm->mode_config;
 	int ret;
 
 	ret = drm_atomic_check_only(state);
 	if (ret)
 		return ret;
 
-	drm_dbg_atomic(state->dev, "committing %p nonblocking\n", state);
+	drm_dbg_atomic(state->drm, "committing %p nonblocking\n", state);
 
-	return config->funcs->atomic_commit(state->dev, state, true);
+	return config->funcs->atomic_commit(state->drm, state, true);
 }
 EXPORT_SYMBOL(drm_atomic_nonblocking_commit);
 
@@ -1736,11 +1736,11 @@ void drm_atomic_print_new_state(const struct drm_atomic_state *state,
 	int i;
 
 	if (!p) {
-		drm_err(state->dev, "invalid drm printer\n");
+		drm_err(state->drm, "invalid drm printer\n");
 		return;
 	}
 
-	drm_dbg_atomic(state->dev, "checking %p\n", state);
+	drm_dbg_atomic(state->drm, "checking %p\n", state);
 
 	for_each_new_plane_in_state(state, plane, plane_state, i)
 		drm_atomic_plane_print_state(p, plane_state);
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 41b8066f61ff..664d0595ea89 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -159,7 +159,7 @@ static int handle_conflicting_encoders(struct drm_atomic_state *state,
 	 * and the CRTC is disabled if no encoder is left. This preserves
 	 * compatibility with the legacy set_config behavior.
 	 */
-	drm_connector_list_iter_begin(state->dev, &conn_iter);
+	drm_connector_list_iter_begin(state->drm, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		struct drm_crtc_state *crtc_state;
 
@@ -1731,7 +1731,7 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_flip_done);
  */
 void drm_atomic_helper_commit_tail(struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = old_state->drm;
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 
@@ -1761,7 +1761,7 @@ EXPORT_SYMBOL(drm_atomic_helper_commit_tail);
  */
 void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = old_state->drm;
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 
@@ -1782,7 +1782,7 @@ EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
 
 static void commit_tail(struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = old_state->drm;
 	const struct drm_mode_config_helper_funcs *funcs;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
@@ -2271,7 +2271,7 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 	const struct drm_mode_config_helper_funcs *funcs;
 	int i, ret;
 
-	funcs = state->dev->mode_config.helper_private;
+	funcs = state->drm->mode_config.helper_private;
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		commit = kzalloc(sizeof(*commit), GFP_KERNEL);
@@ -2451,13 +2451,13 @@ void drm_atomic_helper_fake_vblank(struct drm_atomic_state *old_state)
 		if (!new_crtc_state->no_vblank)
 			continue;
 
-		spin_lock_irqsave(&old_state->dev->event_lock, flags);
+		spin_lock_irqsave(&old_state->drm->event_lock, flags);
 		if (new_crtc_state->event) {
 			drm_crtc_send_vblank_event(crtc,
 						   new_crtc_state->event);
 			new_crtc_state->event = NULL;
 		}
-		spin_unlock_irqrestore(&old_state->dev->event_lock, flags);
+		spin_unlock_irqrestore(&old_state->drm->event_lock, flags);
 	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_fake_vblank);
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 98d3b10c08ae..44f7b5c3b2d1 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -967,7 +967,7 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
 	int i, ret, old_mode = connector->dpms;
 	bool active = false;
 
-	ret = drm_modeset_lock(&state->dev->mode_config.connection_mutex,
+	ret = drm_modeset_lock(&state->drm->mode_config.connection_mutex,
 			       state->acquire_ctx);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index ac0d2ce3f870..63f071e77d77 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -528,7 +528,7 @@ static int set_property_atomic(struct drm_mode_object *obj,
 	state->acquire_ctx = &ctx;
 
 retry:
-	if (prop == state->dev->mode_config.dpms_property) {
+	if (prop == state->drm->mode_config.dpms_property) {
 		if (obj->type != DRM_MODE_OBJECT_CONNECTOR) {
 			ret = -EINVAL;
 			goto out;
diff --git a/drivers/gpu/drm/i915/display/g4x_hdmi.c b/drivers/gpu/drm/i915/display/g4x_hdmi.c
index 5c187e6e0472..7f3743dea587 100644
--- a/drivers/gpu/drm/i915/display/g4x_hdmi.c
+++ b/drivers/gpu/drm/i915/display/g4x_hdmi.c
@@ -602,7 +602,7 @@ intel_hdmi_hotplug(struct intel_encoder *encoder,
 int g4x_hdmi_connector_atomic_check(struct drm_connector *connector,
 				    struct drm_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->dev);
+	struct drm_i915_private *i915 = to_i915(state->drm);
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *conn;
 	int ret;
diff --git a/drivers/gpu/drm/i915/display/hsw_ips.c b/drivers/gpu/drm/i915/display/hsw_ips.c
index 8eca0de065b6..b052dfa21690 100644
--- a/drivers/gpu/drm/i915/display/hsw_ips.c
+++ b/drivers/gpu/drm/i915/display/hsw_ips.c
@@ -91,7 +91,7 @@ bool hsw_ips_disable(const struct intel_crtc_state *crtc_state)
 static bool hsw_ips_need_disable(struct intel_atomic_state *state,
 				 struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
 	const struct intel_crtc_state *new_crtc_state =
@@ -132,7 +132,7 @@ bool hsw_ips_pre_update(struct intel_atomic_state *state,
 static bool hsw_ips_need_enable(struct intel_atomic_state *state,
 				struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
 	const struct intel_crtc_state *new_crtc_state =
@@ -215,7 +215,7 @@ bool hsw_crtc_state_ips_capable(const struct intel_crtc_state *crtc_state)
 int hsw_ips_compute_config(struct intel_atomic_state *state,
 			   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index af0c79a4c9a4..51a896bbebc4 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -2788,7 +2788,7 @@ static bool ilk_validate_pipe_wm(const struct drm_i915_private *dev_priv,
 static int ilk_compute_pipe_wm(struct intel_atomic_state *state,
 			       struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_pipe_wm *pipe_wm;
@@ -3386,7 +3386,7 @@ static int ilk_sanitize_watermarks_add_affected(struct drm_atomic_state *state)
 	struct drm_plane *plane;
 	struct intel_crtc *crtc;
 
-	for_each_intel_crtc(state->dev, crtc) {
+	for_each_intel_crtc(state->drm, crtc) {
 		struct intel_crtc_state *crtc_state;
 
 		crtc_state = intel_atomic_get_crtc_state(state, crtc);
@@ -3402,7 +3402,7 @@ static int ilk_sanitize_watermarks_add_affected(struct drm_atomic_state *state)
 		}
 	}
 
-	drm_for_each_plane(plane, state->dev) {
+	drm_for_each_plane(plane, state->drm) {
 		struct drm_plane_state *plane_state;
 
 		plane_state = drm_atomic_get_plane_state(state, plane);
diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index c133928a0655..74f2e2ed5c19 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1227,7 +1227,7 @@ static void gen11_dsi_enable(struct intel_atomic_state *state,
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(conn_state->crtc);
 
-	drm_WARN_ON(state->base.dev, crtc_state->has_pch_encoder);
+	drm_WARN_ON(state->base.drm, crtc_state->has_pch_encoder);
 
 	/* Wa_1409054076:icl,jsl,ehl */
 	icl_apply_kvmr_pipe_a_wa(encoder, crtc->pipe, true);
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 7d9578ebae55..5f4ff7c19452 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -675,7 +675,7 @@ intel_crtc_get_plane(struct intel_crtc *crtc, enum plane_id plane_id)
 int intel_plane_atomic_check(struct intel_atomic_state *state,
 			     struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_plane_state *new_plane_state =
 		intel_atomic_get_new_plane_state(state, plane);
 	const struct intel_plane_state *old_plane_state =
@@ -750,7 +750,7 @@ skl_next_plane_to_commit(struct intel_atomic_state *state,
 	}
 
 	/* should never happen */
-	drm_WARN_ON(state->base.dev, 1);
+	drm_WARN_ON(state->base.drm, 1);
 
 	return NULL;
 }
@@ -881,7 +881,7 @@ static void i9xx_crtc_planes_update_arm(struct intel_atomic_state *state,
 void intel_crtc_planes_update_arm(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 
 	if (DISPLAY_VER(i915) >= 9)
 		skl_crtc_planes_update_arm(state, crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index bef96db62c80..aee6d03eb322 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -771,7 +771,7 @@ static unsigned int intel_bw_data_rate(struct drm_i915_private *dev_priv,
 struct intel_bw_state *
 intel_atomic_get_old_bw_state(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_global_state *bw_state;
 
 	bw_state = intel_atomic_get_old_global_obj_state(state, &dev_priv->display.bw.obj);
@@ -782,7 +782,7 @@ intel_atomic_get_old_bw_state(struct intel_atomic_state *state)
 struct intel_bw_state *
 intel_atomic_get_new_bw_state(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_global_state *bw_state;
 
 	bw_state = intel_atomic_get_new_global_obj_state(state, &dev_priv->display.bw.obj);
@@ -793,7 +793,7 @@ intel_atomic_get_new_bw_state(struct intel_atomic_state *state)
 struct intel_bw_state *
 intel_atomic_get_bw_state(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_global_state *bw_state;
 
 	bw_state = intel_atomic_get_global_obj_state(state, &dev_priv->display.bw.obj);
@@ -1134,7 +1134,7 @@ int intel_bw_min_cdclk(struct drm_i915_private *i915,
 int intel_bw_calc_min_cdclk(struct intel_atomic_state *state,
 			    bool *need_cdclk_calc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_bw_state *new_bw_state = NULL;
 	const struct intel_bw_state *old_bw_state = NULL;
 	const struct intel_cdclk_state *cdclk_state;
@@ -1207,7 +1207,7 @@ int intel_bw_calc_min_cdclk(struct intel_atomic_state *state,
 
 static int intel_bw_check_data_rate(struct intel_atomic_state *state, bool *changed)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_crtc_state *new_crtc_state, *old_crtc_state;
 	struct intel_crtc *crtc;
 	int i;
@@ -1254,7 +1254,7 @@ static int intel_bw_check_data_rate(struct intel_atomic_state *state, bool *chan
 int intel_bw_atomic_check(struct intel_atomic_state *state)
 {
 	bool changed = false;
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_bw_state *new_bw_state;
 	const struct intel_bw_state *old_bw_state;
 	int ret;
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 4207863b7b2a..92a5cea8fa7f 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2357,7 +2357,7 @@ static void intel_set_cdclk(struct drm_i915_private *dev_priv,
 
 static void intel_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_cdclk_state *old_cdclk_state =
 		intel_atomic_get_old_cdclk_state(state);
 	const struct intel_cdclk_state *new_cdclk_state =
@@ -2402,7 +2402,7 @@ static void intel_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
 
 static void intel_cdclk_pcode_post_notify(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_cdclk_state *new_cdclk_state =
 		intel_atomic_get_new_cdclk_state(state);
 	const struct intel_cdclk_state *old_cdclk_state =
@@ -2447,7 +2447,7 @@ static void intel_cdclk_pcode_post_notify(struct intel_atomic_state *state)
 void
 intel_set_cdclk_pre_plane_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_cdclk_state *old_cdclk_state =
 		intel_atomic_get_old_cdclk_state(state);
 	const struct intel_cdclk_state *new_cdclk_state =
@@ -2479,7 +2479,7 @@ intel_set_cdclk_pre_plane_update(struct intel_atomic_state *state)
 void
 intel_set_cdclk_post_plane_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_cdclk_state *old_cdclk_state =
 		intel_atomic_get_old_cdclk_state(state);
 	const struct intel_cdclk_state *new_cdclk_state =
@@ -2636,7 +2636,7 @@ int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
 static int intel_compute_min_cdclk(struct intel_cdclk_state *cdclk_state)
 {
 	struct intel_atomic_state *state = cdclk_state->base.state;
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	const struct intel_bw_state *bw_state;
 	struct intel_crtc *crtc;
 	struct intel_crtc_state *crtc_state;
@@ -2706,7 +2706,7 @@ static int intel_compute_min_cdclk(struct intel_cdclk_state *cdclk_state)
 static int bxt_compute_min_voltage_level(struct intel_cdclk_state *cdclk_state)
 {
 	struct intel_atomic_state *state = cdclk_state->base.state;
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc *crtc;
 	struct intel_crtc_state *crtc_state;
 	u8 min_voltage_level;
@@ -2742,7 +2742,7 @@ static int bxt_compute_min_voltage_level(struct intel_cdclk_state *cdclk_state)
 static int vlv_modeset_calc_cdclk(struct intel_cdclk_state *cdclk_state)
 {
 	struct intel_atomic_state *state = cdclk_state->base.state;
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	int min_cdclk, cdclk;
 
 	min_cdclk = intel_compute_min_cdclk(cdclk_state);
@@ -2798,7 +2798,7 @@ static int bdw_modeset_calc_cdclk(struct intel_cdclk_state *cdclk_state)
 static int skl_dpll0_vco(struct intel_cdclk_state *cdclk_state)
 {
 	struct intel_atomic_state *state = cdclk_state->base.state;
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc *crtc;
 	struct intel_crtc_state *crtc_state;
 	int vco, i;
@@ -2866,7 +2866,7 @@ static int skl_modeset_calc_cdclk(struct intel_cdclk_state *cdclk_state)
 static int bxt_modeset_calc_cdclk(struct intel_cdclk_state *cdclk_state)
 {
 	struct intel_atomic_state *state = cdclk_state->base.state;
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	int min_cdclk, min_voltage_level, cdclk, vco;
 
 	min_cdclk = intel_compute_min_cdclk(cdclk_state);
@@ -2944,7 +2944,7 @@ static const struct intel_global_state_funcs intel_cdclk_funcs = {
 struct intel_cdclk_state *
 intel_atomic_get_cdclk_state(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_global_state *cdclk_state;
 
 	cdclk_state = intel_atomic_get_global_obj_state(state, &dev_priv->display.cdclk.obj);
@@ -3020,7 +3020,7 @@ static bool intel_cdclk_need_serialize(struct drm_i915_private *i915,
 
 int intel_modeset_calc_cdclk(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	const struct intel_cdclk_state *old_cdclk_state;
 	struct intel_cdclk_state *new_cdclk_state;
 	enum pipe pipe = INVALID_PIPE;
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.h b/drivers/gpu/drm/i915/display/intel_cdclk.h
index 48fd7d39e0cd..07383dfa4b47 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.h
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.h
@@ -77,9 +77,9 @@ intel_atomic_get_cdclk_state(struct intel_atomic_state *state);
 
 #define to_intel_cdclk_state(x) container_of((x), struct intel_cdclk_state, base)
 #define intel_atomic_get_old_cdclk_state(state) \
-	to_intel_cdclk_state(intel_atomic_get_old_global_obj_state(state, &to_i915(state->base.dev)->display.cdclk.obj))
+	to_intel_cdclk_state(intel_atomic_get_old_global_obj_state(state, &to_i915(state->base.drm)->display.cdclk.obj))
 #define intel_atomic_get_new_cdclk_state(state) \
-	to_intel_cdclk_state(intel_atomic_get_new_global_obj_state(state, &to_i915(state->base.dev)->display.cdclk.obj))
+	to_intel_cdclk_state(intel_atomic_get_new_global_obj_state(state, &to_i915(state->base.drm)->display.cdclk.obj))
 
 int intel_cdclk_init(struct drm_i915_private *dev_priv);
 void intel_cdclk_debugfs_register(struct drm_i915_private *i915);
diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 0600fdcd06ef..41837b17602d 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -2998,7 +2998,7 @@ intel_mtl_port_pll_type(struct intel_encoder *encoder,
 void intel_c10pll_state_verify(struct intel_atomic_state *state,
 			       struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_c10pll_state mpllb_hw_state = { 0 };
 	struct intel_c10pll_state *mpllb_sw_state = &new_crtc_state->cx0pll_state.c10;
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 090f242e610c..e60baa96a7ae 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3241,7 +3241,7 @@ static void intel_enable_ddi(struct intel_atomic_state *state,
 			     const struct intel_crtc_state *crtc_state,
 			     const struct drm_connector_state *conn_state)
 {
-	drm_WARN_ON(state->base.dev, crtc_state->has_pch_encoder);
+	drm_WARN_ON(state->base.drm, crtc_state->has_pch_encoder);
 
 	if (!intel_crtc_is_bigjoiner_slave(crtc_state))
 		intel_ddi_enable_transcoder_func(encoder, crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d8533603ad05..0a9774eaf9f1 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -783,7 +783,7 @@ intel_get_crtc_new_encoder(const struct intel_atomic_state *state,
 		num_encoders++;
 	}
 
-	drm_WARN(state->base.dev, num_encoders != 1,
+	drm_WARN(state->base.drm, num_encoders != 1,
 		 "%d encoders for pipe %c\n",
 		 num_encoders, pipe_name(master_crtc->pipe));
 
@@ -932,7 +932,7 @@ static bool vrr_disabling(const struct intel_crtc_state *old_crtc_state,
 static void intel_post_plane_update(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
 	const struct intel_crtc_state *new_crtc_state =
@@ -1035,7 +1035,7 @@ static void intel_crtc_async_flip_disable_wa(struct intel_atomic_state *state,
 static void intel_pre_plane_update(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
 	const struct intel_crtc_state *new_crtc_state =
@@ -1173,7 +1173,7 @@ static void intel_crtc_disable_planes(struct intel_atomic_state *state,
 
 static void intel_encoders_update_prepare(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
 	struct intel_crtc *crtc;
 	int i;
@@ -4049,9 +4049,9 @@ static int icl_add_linked_planes(struct intel_atomic_state *state)
 		if (IS_ERR(linked_plane_state))
 			return PTR_ERR(linked_plane_state);
 
-		drm_WARN_ON(state->base.dev,
+		drm_WARN_ON(state->base.drm,
 			    linked_plane_state->planar_linked_plane != plane);
-		drm_WARN_ON(state->base.dev,
+		drm_WARN_ON(state->base.drm,
 			    linked_plane_state->planar_slave == plane_state->planar_slave);
 	}
 
@@ -4418,7 +4418,7 @@ compute_baseline_pipe_bpp(struct intel_atomic_state *state,
 
 static bool check_digital_port_conflicts(struct intel_atomic_state *state)
 {
-	struct drm_device *dev = state->base.dev;
+	struct drm_device *dev = state->base.drm;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 	unsigned int used_ports = 0;
@@ -5420,7 +5420,7 @@ intel_verify_planes(struct intel_atomic_state *state)
 int intel_modeset_all_pipes(struct intel_atomic_state *state,
 			    const char *reason)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc *crtc;
 
 	/*
@@ -5501,7 +5501,7 @@ static int hsw_mode_set_planes_workaround(struct intel_atomic_state *state)
 		return 0;
 
 	/* w/a possibly needed, check how many crtc's are already enabled. */
-	for_each_intel_crtc(state->base.dev, crtc) {
+	for_each_intel_crtc(state->base.drm, crtc) {
 		crtc_state = intel_atomic_get_crtc_state(&state->base, crtc);
 		if (IS_ERR(crtc_state))
 			return PTR_ERR(crtc_state);
@@ -5546,7 +5546,7 @@ u8 intel_calc_active_pipes(struct intel_atomic_state *state,
 
 static int intel_modeset_checks(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 
 	state->modeset = true;
 
@@ -5576,7 +5576,7 @@ static int intel_crtc_add_planes_to_state(struct intel_atomic_state *state,
 					  struct intel_crtc *crtc,
 					  u8 plane_ids_mask)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_plane *plane;
 
 	for_each_intel_plane_on_crtc(&dev_priv->drm, crtc, plane) {
@@ -5633,7 +5633,7 @@ static int intel_crtc_add_bigjoiner_planes(struct intel_atomic_state *state,
 
 static int intel_bigjoiner_add_affected_planes(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_crtc_state *crtc_state;
 	struct intel_crtc *crtc;
 	int i;
@@ -5659,7 +5659,7 @@ static int intel_bigjoiner_add_affected_planes(struct intel_atomic_state *state)
 
 static int intel_atomic_check_planes(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
 	struct intel_plane_state __maybe_unused *plane_state;
 	struct intel_plane *plane;
@@ -5773,7 +5773,7 @@ static bool intel_pipes_need_modeset(struct intel_atomic_state *state,
 static int intel_atomic_check_bigjoiner(struct intel_atomic_state *state,
 					struct intel_crtc *master_crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_crtc_state *master_crtc_state =
 		intel_atomic_get_new_crtc_state(state, master_crtc);
 	struct intel_crtc *slave_crtc;
@@ -5844,7 +5844,7 @@ static int intel_atomic_check_bigjoiner(struct intel_atomic_state *state,
 static void kill_bigjoiner_slave(struct intel_atomic_state *state,
 				 struct intel_crtc *master_crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_crtc_state *master_crtc_state =
 		intel_atomic_get_new_crtc_state(state, master_crtc);
 	struct intel_crtc *slave_crtc;
@@ -5883,7 +5883,7 @@ static void kill_bigjoiner_slave(struct intel_atomic_state *state,
 static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 				       struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_plane_state *old_plane_state;
@@ -5940,7 +5940,7 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 
 static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_crtc_state *old_crtc_state, *new_crtc_state;
 	const struct intel_plane_state *new_plane_state, *old_plane_state;
 	struct intel_plane *plane;
@@ -6123,7 +6123,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 
 static int intel_bigjoiner_add_affected_crtcs(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state;
 	struct intel_crtc *crtc;
 	u8 affected_pipes = 0;
@@ -6412,7 +6412,7 @@ static int intel_atomic_prepare_commit(struct intel_atomic_state *state)
 	struct intel_crtc *crtc;
 	int i, ret;
 
-	ret = drm_atomic_helper_prepare_planes(state->base.dev, &state->base);
+	ret = drm_atomic_helper_prepare_planes(state->base.drm, &state->base);
 	if (ret < 0)
 		return ret;
 
@@ -6487,7 +6487,7 @@ static void intel_pipe_fastset(const struct intel_crtc_state *old_crtc_state,
 static void commit_pipe_pre_planes(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
 	const struct intel_crtc_state *new_crtc_state =
@@ -6517,7 +6517,7 @@ static void commit_pipe_pre_planes(struct intel_atomic_state *state,
 static void commit_pipe_post_planes(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -6534,7 +6534,7 @@ static void commit_pipe_post_planes(struct intel_atomic_state *state,
 static void intel_enable_crtc(struct intel_atomic_state *state,
 			      struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -6556,7 +6556,7 @@ static void intel_enable_crtc(struct intel_atomic_state *state,
 static void intel_update_crtc(struct intel_atomic_state *state,
 			      struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc_state *new_crtc_state =
@@ -6627,7 +6627,7 @@ static void intel_old_crtc_state_disables(struct intel_atomic_state *state,
 					  struct intel_crtc_state *new_crtc_state,
 					  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 
 	/*
 	 * We need to disable pipe CRC before disabling the pipe,
@@ -6718,7 +6718,7 @@ static void intel_commit_modeset_enables(struct intel_atomic_state *state)
 
 static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc *crtc;
 	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
 	struct skl_ddb_entry entries[I915_MAX_PIPES] = {};
@@ -6859,7 +6859,7 @@ void intel_atomic_helper_free_state_worker(struct work_struct *work)
 static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_state)
 {
 	struct wait_queue_entry wait_fence, wait_reset;
-	struct drm_i915_private *dev_priv = to_i915(intel_state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_state->base.drm);
 
 	init_wait_entry(&wait_fence, 0);
 	init_wait_entry(&wait_reset, 0);
@@ -6887,7 +6887,7 @@ static void intel_atomic_cleanup_work(struct work_struct *work)
 {
 	struct intel_atomic_state *state =
 		container_of(work, struct intel_atomic_state, base.commit_work);
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_crtc_state *old_crtc_state;
 	struct intel_crtc *crtc;
 	int i;
@@ -6904,7 +6904,7 @@ static void intel_atomic_cleanup_work(struct work_struct *work)
 
 static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_plane *plane;
 	struct intel_plane_state *plane_state;
 	int i;
@@ -6947,7 +6947,7 @@ static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *s
 
 static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 {
-	struct drm_device *dev = state->base.dev;
+	struct drm_device *dev = state->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
 	struct intel_crtc *crtc;
@@ -7180,7 +7180,7 @@ intel_atomic_commit_ready(struct i915_sw_fence *fence,
 		break;
 	case FENCE_FREE:
 		{
-			struct drm_i915_private *i915 = to_i915(state->base.dev);
+			struct drm_i915_private *i915 = to_i915(state->base.drm);
 			struct intel_atomic_helper *helper =
 				&i915->display.atomic_helper;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index c744c021af23..9991dffe09ea 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -317,7 +317,7 @@ enum phy_fia {
 
 #define for_each_old_intel_plane_in_state(__state, plane, old_plane_state, __i) \
 	for ((__i) = 0; \
-	     (__i) < (__state)->base.dev->mode_config.num_total_plane && \
+	     (__i) < (__state)->base.drm->mode_config.num_total_plane && \
 		     ((plane) = to_intel_plane((__state)->base.planes[__i].ptr), \
 		      (old_plane_state) = to_intel_plane_state((__state)->base.planes[__i].old_state), 1); \
 	     (__i)++) \
@@ -325,7 +325,7 @@ enum phy_fia {
 
 #define for_each_old_intel_crtc_in_state(__state, crtc, old_crtc_state, __i) \
 	for ((__i) = 0; \
-	     (__i) < (__state)->base.dev->mode_config.num_crtc && \
+	     (__i) < (__state)->base.drm->mode_config.num_crtc && \
 		     ((crtc) = to_intel_crtc((__state)->base.crtcs[__i].ptr), \
 		      (old_crtc_state) = to_intel_crtc_state((__state)->base.crtcs[__i].old_state), 1); \
 	     (__i)++) \
@@ -333,7 +333,7 @@ enum phy_fia {
 
 #define for_each_new_intel_plane_in_state(__state, plane, new_plane_state, __i) \
 	for ((__i) = 0; \
-	     (__i) < (__state)->base.dev->mode_config.num_total_plane && \
+	     (__i) < (__state)->base.drm->mode_config.num_total_plane && \
 		     ((plane) = to_intel_plane((__state)->base.planes[__i].ptr), \
 		      (new_plane_state) = to_intel_plane_state((__state)->base.planes[__i].new_state), 1); \
 	     (__i)++) \
@@ -341,7 +341,7 @@ enum phy_fia {
 
 #define for_each_new_intel_crtc_in_state(__state, crtc, new_crtc_state, __i) \
 	for ((__i) = 0; \
-	     (__i) < (__state)->base.dev->mode_config.num_crtc && \
+	     (__i) < (__state)->base.drm->mode_config.num_crtc && \
 		     ((crtc) = to_intel_crtc((__state)->base.crtcs[__i].ptr), \
 		      (new_crtc_state) = to_intel_crtc_state((__state)->base.crtcs[__i].new_state), 1); \
 	     (__i)++) \
@@ -349,7 +349,7 @@ enum phy_fia {
 
 #define for_each_oldnew_intel_plane_in_state(__state, plane, old_plane_state, new_plane_state, __i) \
 	for ((__i) = 0; \
-	     (__i) < (__state)->base.dev->mode_config.num_total_plane && \
+	     (__i) < (__state)->base.drm->mode_config.num_total_plane && \
 		     ((plane) = to_intel_plane((__state)->base.planes[__i].ptr), \
 		      (old_plane_state) = to_intel_plane_state((__state)->base.planes[__i].old_state), \
 		      (new_plane_state) = to_intel_plane_state((__state)->base.planes[__i].new_state), 1); \
@@ -358,7 +358,7 @@ enum phy_fia {
 
 #define for_each_oldnew_intel_crtc_in_state(__state, crtc, old_crtc_state, new_crtc_state, __i) \
 	for ((__i) = 0; \
-	     (__i) < (__state)->base.dev->mode_config.num_crtc && \
+	     (__i) < (__state)->base.drm->mode_config.num_crtc && \
 		     ((crtc) = to_intel_crtc((__state)->base.crtcs[__i].ptr), \
 		      (old_crtc_state) = to_intel_crtc_state((__state)->base.crtcs[__i].old_state), \
 		      (new_crtc_state) = to_intel_crtc_state((__state)->base.crtcs[__i].new_state), 1); \
@@ -366,7 +366,7 @@ enum phy_fia {
 		for_each_if(crtc)
 
 #define for_each_oldnew_intel_crtc_in_state_reverse(__state, crtc, old_crtc_state, new_crtc_state, __i) \
-	for ((__i) = (__state)->base.dev->mode_config.num_crtc - 1; \
+	for ((__i) = (__state)->base.drm->mode_config.num_crtc - 1; \
 	     (__i) >= 0  && \
 	     ((crtc) = to_intel_crtc((__state)->base.crtcs[__i].ptr), \
 	      (old_crtc_state) = to_intel_crtc_state((__state)->base.crtcs[__i].old_state), \
@@ -377,7 +377,7 @@ enum phy_fia {
 #define intel_atomic_crtc_state_for_each_plane_state( \
 		  plane, plane_state, \
 		  crtc_state) \
-	for_each_intel_plane_mask(((crtc_state)->uapi.state->dev), (plane), \
+	for_each_intel_plane_mask(((crtc_state)->uapi.state->drm), (plane), \
 				((crtc_state)->uapi.plane_mask)) \
 		for_each_if ((plane_state = \
 			      to_intel_plane_state(__drm_atomic_get_current_plane_state((crtc_state)->uapi.state, &plane->base))))
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9f40da20e88d..8aec1cfd53b8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5100,7 +5100,7 @@ void intel_dp_encoder_shutdown(struct intel_encoder *intel_encoder)
 static int intel_modeset_tile_group(struct intel_atomic_state *state,
 				    int tile_group_id)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
 	int ret = 0;
@@ -5141,7 +5141,7 @@ static int intel_modeset_tile_group(struct intel_atomic_state *state,
 
 static int intel_modeset_affected_transcoders(struct intel_atomic_state *state, u8 transcoders)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc *crtc;
 
 	if (transcoders == 0)
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index e3f176a093d2..e4ef3833c1ed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -401,7 +401,7 @@ static unsigned int
 intel_dp_mst_transcoder_mask(struct intel_atomic_state *state,
 			     struct intel_dp *mst_port)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	const struct intel_digital_connector_state *conn_state;
 	struct intel_connector *connector;
 	u8 transcoders = 0;
@@ -454,7 +454,7 @@ static int
 intel_dp_mst_atomic_master_trans_check(struct intel_connector *connector,
 				       struct intel_atomic_state *state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct drm_connector_list_iter connector_list_iter;
 	struct intel_connector *connector_iter;
 	int ret = 0;
diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index 999badfe2906..b0fb96717932 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -936,7 +936,7 @@ static void i8xx_compute_dpll(struct intel_crtc_state *crtc_state,
 static int hsw_crtc_compute_clock(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_encoder *encoder =
@@ -965,7 +965,7 @@ static int hsw_crtc_compute_clock(struct intel_atomic_state *state,
 static int hsw_crtc_get_shared_dpll(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_encoder *encoder =
@@ -999,7 +999,7 @@ static int dg2_crtc_compute_clock(struct intel_atomic_state *state,
 static int mtl_crtc_compute_clock(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_encoder *encoder =
@@ -1140,7 +1140,7 @@ static void ilk_compute_dpll(struct intel_crtc_state *crtc_state,
 static int ilk_crtc_compute_clock(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_limit *limit;
@@ -1294,7 +1294,7 @@ static int vlv_crtc_compute_clock(struct intel_atomic_state *state,
 static int g4x_crtc_compute_clock(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_limit *limit;
@@ -1341,7 +1341,7 @@ static int g4x_crtc_compute_clock(struct intel_atomic_state *state,
 static int pnv_crtc_compute_clock(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_limit *limit;
@@ -1377,7 +1377,7 @@ static int pnv_crtc_compute_clock(struct intel_atomic_state *state,
 static int i9xx_crtc_compute_clock(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_limit *limit;
@@ -1415,7 +1415,7 @@ static int i9xx_crtc_compute_clock(struct intel_atomic_state *state,
 static int i8xx_crtc_compute_clock(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_limit *limit;
@@ -1495,7 +1495,7 @@ static const struct intel_dpll_funcs i8xx_dpll_funcs = {
 int intel_dpll_crtc_compute_clock(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	int ret;
@@ -1521,7 +1521,7 @@ int intel_dpll_crtc_compute_clock(struct intel_atomic_state *state,
 int intel_dpll_crtc_get_shared_dpll(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	int ret;
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 6b2d8a1e2aa9..ef039b1b34eb 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -129,12 +129,13 @@ intel_atomic_get_shared_dpll_state(struct drm_atomic_state *s)
 {
 	struct intel_atomic_state *state = to_intel_atomic_state(s);
 
-	drm_WARN_ON(s->dev, !drm_modeset_is_locked(&s->dev->mode_config.connection_mutex));
+	drm_WARN_ON(s->drm,
+		    !drm_modeset_is_locked(&s->drm->mode_config.connection_mutex));
 
 	if (!state->dpll_set) {
 		state->dpll_set = true;
 
-		intel_atomic_duplicate_dpll_state(to_i915(s->dev),
+		intel_atomic_duplicate_dpll_state(to_i915(s->drm),
 						  state->shared_dpll);
 	}
 
@@ -455,7 +456,7 @@ static void intel_put_dpll(struct intel_atomic_state *state,
  */
 void intel_shared_dpll_swap_state(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_shared_dpll_state *shared_dpll = state->shared_dpll;
 	enum intel_dpll_id i;
 
@@ -960,7 +961,7 @@ static int
 hsw_ddi_wrpll_compute_dpll(struct intel_atomic_state *state,
 			   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	unsigned int p, n2, r2;
@@ -3255,7 +3256,7 @@ static int icl_get_combo_phy_dpll(struct intel_atomic_state *state,
 static int icl_compute_tc_phy_dplls(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct icl_port_dpll *port_dpll =
@@ -3288,7 +3289,7 @@ static int icl_get_tc_phy_dplls(struct intel_atomic_state *state,
 				struct intel_crtc *crtc,
 				struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct icl_port_dpll *port_dpll =
@@ -3334,7 +3335,7 @@ static int icl_compute_dplls(struct intel_atomic_state *state,
 			     struct intel_crtc *crtc,
 			     struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 
 	if (intel_phy_is_combo(dev_priv, phy))
@@ -3351,7 +3352,7 @@ static int icl_get_dplls(struct intel_atomic_state *state,
 			 struct intel_crtc *crtc,
 			 struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 
 	if (intel_phy_is_combo(dev_priv, phy))
@@ -4201,7 +4202,7 @@ int intel_compute_shared_dplls(struct intel_atomic_state *state,
 			       struct intel_crtc *crtc,
 			       struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	const struct intel_dpll_mgr *dpll_mgr = dev_priv->display.dpll.mgr;
 
 	if (drm_WARN_ON(&dev_priv->drm, !dpll_mgr))
@@ -4234,7 +4235,7 @@ int intel_reserve_shared_dplls(struct intel_atomic_state *state,
 			       struct intel_crtc *crtc,
 			       struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	const struct intel_dpll_mgr *dpll_mgr = dev_priv->display.dpll.mgr;
 
 	if (drm_WARN_ON(&dev_priv->drm, !dpll_mgr))
@@ -4257,7 +4258,7 @@ int intel_reserve_shared_dplls(struct intel_atomic_state *state,
 void intel_release_shared_dplls(struct intel_atomic_state *state,
 				struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	const struct intel_dpll_mgr *dpll_mgr = dev_priv->display.dpll.mgr;
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 7f8b2d7713c7..3e43e15d50ce 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -971,7 +971,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc,
 				   struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_plane_state *plane_state =
@@ -1043,7 +1043,7 @@ static bool intel_fbc_is_ok(const struct intel_plane_state *plane_state)
 static int intel_fbc_check_plane(struct intel_atomic_state *state,
 				 struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_plane_state *plane_state =
 		intel_atomic_get_new_plane_state(state, plane);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
@@ -1218,7 +1218,7 @@ static bool __intel_fbc_pre_update(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc,
 				   struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_fbc *fbc = plane->fbc;
 	bool need_vblank_wait = false;
 
@@ -1427,7 +1427,7 @@ static void __intel_fbc_enable(struct intel_atomic_state *state,
 			       struct intel_crtc *crtc,
 			       struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_plane_state *plane_state =
 		intel_atomic_get_new_plane_state(state, plane);
 	struct intel_fbc *fbc = plane->fbc;
diff --git a/drivers/gpu/drm/i915/display/intel_global_state.c b/drivers/gpu/drm/i915/display/intel_global_state.c
index e8e8be54143b..09d72c3f3f95 100644
--- a/drivers/gpu/drm/i915/display/intel_global_state.c
+++ b/drivers/gpu/drm/i915/display/intel_global_state.c
@@ -84,7 +84,7 @@ static bool modeset_lock_is_held(struct drm_modeset_acquire_ctx *ctx,
 static void assert_global_state_read_locked(struct intel_atomic_state *state)
 {
 	struct drm_modeset_acquire_ctx *ctx = state->base.acquire_ctx;
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc *crtc;
 
 	for_each_intel_crtc(&dev_priv->drm, crtc) {
@@ -99,7 +99,7 @@ struct intel_global_state *
 intel_atomic_get_global_obj_state(struct intel_atomic_state *state,
 				  struct intel_global_obj *obj)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	int index, num_objs, i;
 	size_t size;
 	struct __intel_global_objs_state *arr;
@@ -173,7 +173,7 @@ intel_atomic_get_new_global_obj_state(struct intel_atomic_state *state,
 
 void intel_atomic_swap_global_state(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_global_state *old_obj_state, *new_obj_state;
 	struct intel_global_obj *obj;
 	int i;
@@ -220,7 +220,7 @@ void intel_atomic_clear_global_state(struct intel_atomic_state *state)
 int intel_atomic_lock_global_state(struct intel_global_state *obj_state)
 {
 	struct intel_atomic_state *state = obj_state->state;
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc *crtc;
 
 	for_each_intel_crtc(&dev_priv->drm, crtc) {
@@ -240,7 +240,7 @@ int intel_atomic_lock_global_state(struct intel_global_state *obj_state)
 int intel_atomic_serialize_global_state(struct intel_global_state *obj_state)
 {
 	struct intel_atomic_state *state = obj_state->state;
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc *crtc;
 
 	for_each_intel_crtc(&dev_priv->drm, crtc) {
@@ -259,7 +259,7 @@ int intel_atomic_serialize_global_state(struct intel_global_state *obj_state)
 bool
 intel_atomic_global_state_is_serialized(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_crtc *crtc;
 
 	for_each_intel_crtc(&i915->drm, crtc)
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 7ac5e6c5e00d..4b41a58fcb03 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2624,7 +2624,7 @@ static const struct drm_connector_funcs intel_hdmi_connector_funcs = {
 static int intel_hdmi_connector_atomic_check(struct drm_connector *connector,
 					     struct drm_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->dev);
+	struct drm_i915_private *i915 = to_i915(state->drm);
 
 	if (HAS_DDI(i915))
 		return intel_digital_connector_atomic_check(connector, state);
diff --git a/drivers/gpu/drm/i915/display/intel_pmdemand.c b/drivers/gpu/drm/i915/display/intel_pmdemand.c
index f7608d363634..adad6efe9354 100644
--- a/drivers/gpu/drm/i915/display/intel_pmdemand.c
+++ b/drivers/gpu/drm/i915/display/intel_pmdemand.c
@@ -41,7 +41,7 @@ static const struct intel_global_state_funcs intel_pmdemand_funcs = {
 static struct intel_pmdemand_state *
 intel_atomic_get_pmdemand_state(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_global_state *pmdemand_state =
 		intel_atomic_get_global_obj_state(state,
 						  &i915->display.pmdemand.obj);
@@ -55,7 +55,7 @@ intel_atomic_get_pmdemand_state(struct intel_atomic_state *state)
 static struct intel_pmdemand_state *
 intel_atomic_get_old_pmdemand_state(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_global_state *pmdemand_state =
 		intel_atomic_get_old_global_obj_state(state,
 						      &i915->display.pmdemand.obj);
@@ -69,7 +69,7 @@ intel_atomic_get_old_pmdemand_state(struct intel_atomic_state *state)
 static struct intel_pmdemand_state *
 intel_atomic_get_new_pmdemand_state(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_global_state *pmdemand_state =
 		intel_atomic_get_new_global_obj_state(state,
 						      &i915->display.pmdemand.obj);
@@ -235,7 +235,7 @@ intel_pmdemand_encoder_has_tc_phy(struct drm_i915_private *i915,
 static bool
 intel_pmdemand_connector_needs_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct drm_connector_state *old_conn_state;
 	struct drm_connector_state *new_conn_state;
 	struct drm_connector *connector;
@@ -305,7 +305,7 @@ static bool intel_pmdemand_needs_update(struct intel_atomic_state *state)
 
 int intel_pmdemand_atomic_check(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_bw_state *new_bw_state;
 	const struct intel_cdclk_state *new_cdclk_state;
 	const struct intel_dbuf_state *new_dbuf_state;
@@ -576,7 +576,7 @@ intel_pmdemand_state_changed(const struct intel_pmdemand_state *new,
 
 void intel_pmdemand_pre_plane_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_pmdemand_state *new_pmdemand_state =
 		intel_atomic_get_new_pmdemand_state(state);
 	const struct intel_pmdemand_state *old_pmdemand_state =
@@ -599,7 +599,7 @@ void intel_pmdemand_pre_plane_update(struct intel_atomic_state *state)
 
 void intel_pmdemand_post_plane_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_pmdemand_state *new_pmdemand_state =
 		intel_atomic_get_new_pmdemand_state(state);
 	const struct intel_pmdemand_state *old_pmdemand_state =
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index d58ed9b62e67..27bb8914a7ad 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1861,7 +1861,7 @@ static bool psr2_sel_fetch_pipe_state_supported(const struct intel_crtc_state *c
 int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 				struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
 	struct drm_rect pipe_clip = { .x1 = 0, .y1 = -1, .x2 = INT_MAX, .y2 = -1 };
 	struct intel_plane_state *new_plane_state, *old_plane_state;
@@ -2028,7 +2028,7 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 void intel_psr_pre_plane_update(struct intel_atomic_state *state,
 				struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
 	const struct intel_crtc_state *new_crtc_state =
@@ -2038,7 +2038,7 @@ void intel_psr_pre_plane_update(struct intel_atomic_state *state,
 	if (!HAS_PSR(i915))
 		return;
 
-	for_each_intel_encoder_mask_with_psr(state->base.dev, encoder,
+	for_each_intel_encoder_mask_with_psr(state->base.drm, encoder,
 					     old_crtc_state->uapi.encoder_mask) {
 		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 		struct intel_psr *psr = &intel_dp->psr;
@@ -2073,13 +2073,13 @@ void intel_psr_pre_plane_update(struct intel_atomic_state *state,
 static void _intel_psr_post_plane_update(const struct intel_atomic_state *state,
 					 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_encoder *encoder;
 
 	if (!crtc_state->has_psr)
 		return;
 
-	for_each_intel_encoder_mask_with_psr(state->base.dev, encoder,
+	for_each_intel_encoder_mask_with_psr(state->base.drm, encoder,
 					     crtc_state->uapi.encoder_mask) {
 		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 		struct intel_psr *psr = &intel_dp->psr;
@@ -2112,7 +2112,7 @@ static void _intel_psr_post_plane_update(const struct intel_atomic_state *state,
 
 void intel_psr_post_plane_update(const struct intel_atomic_state *state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(state->base.drm);
 	struct intel_crtc_state *crtc_state;
 	struct intel_crtc *crtc;
 	int i;
diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.c b/drivers/gpu/drm/i915/display/intel_snps_phy.c
index 88ef56b6e0fd..6f5cd530539c 100644
--- a/drivers/gpu/drm/i915/display/intel_snps_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_snps_phy.c
@@ -1995,7 +1995,7 @@ int intel_snps_phy_check_hdmi_link_rate(int clock)
 void intel_mpllb_state_verify(struct intel_atomic_state *state,
 			      struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_mpllb_state mpllb_hw_state = { 0 };
 	struct intel_mpllb_state *mpllb_sw_state = &new_crtc_state->mpllb_state;
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_wm.c b/drivers/gpu/drm/i915/display/intel_wm.c
index b615449e70b4..69179179e331 100644
--- a/drivers/gpu/drm/i915/display/intel_wm.c
+++ b/drivers/gpu/drm/i915/display/intel_wm.c
@@ -51,7 +51,7 @@ void intel_update_watermarks(struct drm_i915_private *i915)
 int intel_compute_pipe_wm(struct intel_atomic_state *state,
 			  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 
 	if (i915->display.funcs.wm->compute_pipe_wm)
 		return i915->display.funcs.wm->compute_pipe_wm(state, crtc);
@@ -62,7 +62,7 @@ int intel_compute_pipe_wm(struct intel_atomic_state *state,
 int intel_compute_intermediate_wm(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 
 	if (!i915->display.funcs.wm->compute_intermediate_wm)
 		return 0;
@@ -76,7 +76,7 @@ int intel_compute_intermediate_wm(struct intel_atomic_state *state,
 bool intel_initial_watermarks(struct intel_atomic_state *state,
 			      struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 
 	if (i915->display.funcs.wm->initial_watermarks) {
 		i915->display.funcs.wm->initial_watermarks(state, crtc);
@@ -89,7 +89,7 @@ bool intel_initial_watermarks(struct intel_atomic_state *state,
 void intel_atomic_update_watermarks(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 
 	if (i915->display.funcs.wm->atomic_update_watermarks)
 		i915->display.funcs.wm->atomic_update_watermarks(state, crtc);
@@ -98,7 +98,7 @@ void intel_atomic_update_watermarks(struct intel_atomic_state *state,
 void intel_optimize_watermarks(struct intel_atomic_state *state,
 			       struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 
 	if (i915->display.funcs.wm->optimize_watermarks)
 		i915->display.funcs.wm->optimize_watermarks(state, crtc);
@@ -106,7 +106,7 @@ void intel_optimize_watermarks(struct intel_atomic_state *state,
 
 int intel_compute_global_watermarks(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 
 	if (i915->display.funcs.wm->compute_global_watermarks)
 		return i915->display.funcs.wm->compute_global_watermarks(state);
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 063929a42a42..2e56ddd408ea 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -207,7 +207,7 @@ static void skl_sagv_disable(struct drm_i915_private *i915)
 
 static void skl_sagv_pre_plane_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_bw_state *new_bw_state =
 		intel_atomic_get_new_bw_state(state);
 
@@ -220,7 +220,7 @@ static void skl_sagv_pre_plane_update(struct intel_atomic_state *state)
 
 static void skl_sagv_post_plane_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_bw_state *new_bw_state =
 		intel_atomic_get_new_bw_state(state);
 
@@ -233,7 +233,7 @@ static void skl_sagv_post_plane_update(struct intel_atomic_state *state)
 
 static void icl_sagv_pre_plane_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_bw_state *old_bw_state =
 		intel_atomic_get_old_bw_state(state);
 	const struct intel_bw_state *new_bw_state =
@@ -265,7 +265,7 @@ static void icl_sagv_pre_plane_update(struct intel_atomic_state *state)
 
 static void icl_sagv_post_plane_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_bw_state *old_bw_state =
 		intel_atomic_get_old_bw_state(state);
 	const struct intel_bw_state *new_bw_state =
@@ -297,7 +297,7 @@ static void icl_sagv_post_plane_update(struct intel_atomic_state *state)
 
 void intel_sagv_pre_plane_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 
 	/*
 	 * Just return if we can't control SAGV or don't have it.
@@ -317,7 +317,7 @@ void intel_sagv_pre_plane_update(struct intel_atomic_state *state)
 
 void intel_sagv_post_plane_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 
 	/*
 	 * Just return if we can't control SAGV or don't have it.
@@ -433,7 +433,7 @@ bool intel_can_enable_sagv(struct drm_i915_private *i915,
 
 static int intel_compute_sagv_mask(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	int ret;
 	struct intel_crtc *crtc;
 	struct intel_crtc_state *new_crtc_state;
@@ -594,7 +594,7 @@ static void intel_crtc_dbuf_weights(const struct intel_dbuf_state *dbuf_state,
 				    unsigned int *weight_total)
 {
 	struct drm_i915_private *i915 =
-		to_i915(dbuf_state->base.state->base.dev);
+		to_i915(dbuf_state->base.state->base.drm);
 	enum pipe pipe;
 
 	*weight_start = 0;
@@ -2539,7 +2539,7 @@ skl_ddb_add_affected_planes(const struct intel_crtc_state *old_crtc_state,
 
 static u8 intel_dbuf_enabled_slices(const struct intel_dbuf_state *dbuf_state)
 {
-	struct drm_i915_private *i915 = to_i915(dbuf_state->base.state->base.dev);
+	struct drm_i915_private *i915 = to_i915(dbuf_state->base.state->base.drm);
 	u8 enabled_slices;
 	enum pipe pipe;
 
@@ -2558,7 +2558,7 @@ static u8 intel_dbuf_enabled_slices(const struct intel_dbuf_state *dbuf_state)
 static int
 skl_compute_ddb(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_dbuf_state *old_dbuf_state;
 	struct intel_dbuf_state *new_dbuf_state = NULL;
 	const struct intel_crtc_state *old_crtc_state;
@@ -2672,7 +2672,7 @@ static char enast(bool enable)
 static void
 skl_print_wm_changes(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_crtc_state *old_crtc_state;
 	const struct intel_crtc_state *new_crtc_state;
 	struct intel_plane *plane;
@@ -3446,7 +3446,7 @@ static const struct intel_global_state_funcs intel_dbuf_funcs = {
 struct intel_dbuf_state *
 intel_atomic_get_dbuf_state(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	struct intel_global_state *dbuf_state;
 
 	dbuf_state = intel_atomic_get_global_obj_state(state, &i915->display.dbuf.obj);
@@ -3476,7 +3476,7 @@ int intel_dbuf_init(struct drm_i915_private *i915)
  */
 static void update_mbus_pre_enable(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	u32 mbus_ctl, dbuf_min_tracker_val;
 	enum dbuf_slice slice;
 	const struct intel_dbuf_state *dbuf_state =
@@ -3511,7 +3511,7 @@ static void update_mbus_pre_enable(struct intel_atomic_state *state)
 
 void intel_dbuf_pre_plane_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_dbuf_state *new_dbuf_state =
 		intel_atomic_get_new_dbuf_state(state);
 	const struct intel_dbuf_state *old_dbuf_state =
@@ -3532,7 +3532,7 @@ void intel_dbuf_pre_plane_update(struct intel_atomic_state *state)
 
 void intel_dbuf_post_plane_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_dbuf_state *new_dbuf_state =
 		intel_atomic_get_new_dbuf_state(state);
 	const struct intel_dbuf_state *old_dbuf_state =
@@ -3570,7 +3570,7 @@ static bool xelpdp_is_only_pipe_per_dbuf_bank(enum pipe pipe, u8 active_pipes)
 
 void intel_mbus_dbox_update(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.drm);
 	const struct intel_dbuf_state *new_dbuf_state, *old_dbuf_state;
 	const struct intel_crtc_state *new_crtc_state;
 	const struct intel_crtc *crtc;
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.h b/drivers/gpu/drm/i915/display/skl_watermark.h
index f91a3d4ddc07..e99171b6cae5 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.h
+++ b/drivers/gpu/drm/i915/display/skl_watermark.h
@@ -64,9 +64,9 @@ intel_atomic_get_dbuf_state(struct intel_atomic_state *state);
 
 #define to_intel_dbuf_state(x) container_of((x), struct intel_dbuf_state, base)
 #define intel_atomic_get_old_dbuf_state(state) \
-	to_intel_dbuf_state(intel_atomic_get_old_global_obj_state(state, &to_i915(state->base.dev)->display.dbuf.obj))
+	to_intel_dbuf_state(intel_atomic_get_old_global_obj_state(state, &to_i915(state->base.drm)->display.dbuf.obj))
 #define intel_atomic_get_new_dbuf_state(state) \
-	to_intel_dbuf_state(intel_atomic_get_new_global_obj_state(state, &to_i915(state->base.dev)->display.dbuf.obj))
+	to_intel_dbuf_state(intel_atomic_get_new_global_obj_state(state, &to_i915(state->base.drm)->display.dbuf.obj))
 
 int intel_dbuf_init(struct drm_i915_private *i915);
 void intel_dbuf_pre_plane_update(struct intel_atomic_state *state);
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index ae2f3ab3e73d..8067c814aa66 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -831,7 +831,7 @@ static void bxt_dsi_enable(struct intel_atomic_state *state,
 			   const struct intel_crtc_state *crtc_state,
 			   const struct drm_connector_state *conn_state)
 {
-	drm_WARN_ON(state->base.dev, crtc_state->has_pch_encoder);
+	drm_WARN_ON(state->base.drm, crtc_state->has_pch_encoder);
 
 	intel_crtc_vblank_on(crtc_state);
 }
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 4a866ac60fff..6f0cf5c7f732 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -74,7 +74,7 @@ static const struct drm_mode_config_funcs imx_drm_mode_config_funcs = {
 
 static void imx_drm_atomic_commit_tail(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = state->dev;
+	struct drm_device *dev = state->drm;
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state, *new_plane_state;
 	bool plane_disabling = false;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index af3ce5a6a636..26301ccca2ff 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -736,7 +736,7 @@ int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector)
 
 static void mgag200_mode_config_helper_atomic_commit_tail(struct drm_atomic_state *state)
 {
-	struct mga_device *mdev = to_mga_device(state->dev);
+	struct mga_device *mdev = to_mga_device(state->drm);
 
 	/*
 	 * Concurrent operations could possibly trigger a call to
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa8499de1b9f..6c44e1e65fcc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -324,7 +324,7 @@ dpu_kms_get_existing_global_state(struct dpu_kms *dpu_kms)
  */
 struct dpu_global_state *dpu_kms_get_global_state(struct drm_atomic_state *s)
 {
-	struct msm_drm_private *priv = s->dev->dev_private;
+	struct msm_drm_private *priv = s->drm->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_private_state *priv_state;
 	int ret;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 323079cfd698..b7039b5102d6 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -81,7 +81,7 @@ mdp5_get_existing_global_state(struct mdp5_kms *mdp5_kms)
  */
 struct mdp5_global_state *mdp5_get_global_state(struct drm_atomic_state *s)
 {
-	struct msm_drm_private *priv = s->dev->dev_private;
+	struct msm_drm_private *priv = s->drm->dev_private;
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	struct drm_private_state *priv_state;
 	int ret;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
index 2536def2a000..cb6198f6c379 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
@@ -39,7 +39,7 @@ int mdp5_mixer_assign(struct drm_atomic_state *s, struct drm_crtc *crtc,
 		      uint32_t caps, struct mdp5_hw_mixer **mixer,
 		      struct mdp5_hw_mixer **r_mixer)
 {
-	struct msm_drm_private *priv = s->dev->dev_private;
+	struct msm_drm_private *priv = s->drm->dev_private;
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	struct mdp5_global_state *global_state = mdp5_get_global_state(s);
 	struct mdp5_hw_mixer_state *new_state;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
index e4b8a789835a..17e0a49f9b75 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
@@ -11,7 +11,7 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 		     struct mdp5_hw_pipe **hwpipe,
 		     struct mdp5_hw_pipe **r_hwpipe)
 {
-	struct msm_drm_private *priv = s->dev->dev_private;
+	struct msm_drm_private *priv = s->drm->dev_private;
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	struct mdp5_global_state *new_global_state, *old_global_state;
 	struct mdp5_hw_pipe_state *old_state, *new_state;
@@ -121,7 +121,7 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 
 int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
 {
-	struct msm_drm_private *priv = s->dev->dev_private;
+	struct msm_drm_private *priv = s->drm->dev_private;
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	struct mdp5_global_state *state;
 	struct mdp5_hw_pipe_state *new_state;
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 9c45d641b521..2068b3ade228 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -201,7 +201,7 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 
 void msm_atomic_commit_tail(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = state->dev;
+	struct drm_device *dev = state->drm;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	struct drm_crtc *async_crtc = NULL;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 9c942fbd836d..beeb73e033ea 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -292,7 +292,7 @@ void nv50_crc_atomic_init_notifier_contexts(struct drm_atomic_state *state)
 void nv50_crc_atomic_release_notifier_contexts(struct drm_atomic_state *state)
 {
 	const struct nv50_crc_func *func =
-		nv50_disp(state->dev)->core->func->crc;
+		nv50_disp(state->drm)->core->func->crc;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
 	int i;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 33066b3ab7f1..02f51144d228 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1941,7 +1941,7 @@ nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interlock)
 {
 	struct drm_dp_mst_topology_mgr *mgr;
 	struct drm_dp_mst_topology_state *mst_state;
-	struct nouveau_drm *drm = nouveau_drm(state->dev);
+	struct nouveau_drm *drm = nouveau_drm(state->drm);
 	struct nv50_disp *disp = nv50_disp(drm->dev);
 	struct nv50_core *core = disp->core;
 	struct nv50_mstm *mstm;
@@ -1987,7 +1987,7 @@ nv50_disp_atomic_commit_wndw(struct drm_atomic_state *state, u32 *interlock)
 static void
 nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = state->dev;
+	struct drm_device *dev = state->drm;
 	struct drm_crtc_state *new_crtc_state, *old_crtc_state;
 	struct drm_crtc *crtc;
 	struct drm_plane_state *new_plane_state;
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index e2697fe80e62..04c42b9f6e5d 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -67,7 +67,7 @@ static void omap_atomic_wait_for_completion(struct drm_device *dev,
 
 static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = old_state->drm;
 	struct omap_drm_private *priv = dev->dev_private;
 	bool fence_cookie = dma_fence_begin_signalling();
 
@@ -244,7 +244,7 @@ omap_get_existing_global_state(struct omap_drm_private *priv)
 struct omap_global_state *__must_check
 omap_get_global_state(struct drm_atomic_state *s)
 {
-	struct omap_drm_private *priv = s->dev->dev_private;
+	struct omap_drm_private *priv = s->drm->dev_private;
 	struct drm_private_state *priv_state;
 
 	priv_state = drm_atomic_get_private_obj_state(s, &priv->glob_obj);
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
index fb97c74386f2..32f7bd119c2c 100644
--- a/drivers/gpu/drm/omapdrm/omap_overlay.c
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
@@ -74,7 +74,7 @@ int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 	struct drm_plane **overlay_map = state->hwoverlay_to_plane;
 	struct omap_hw_overlay *ovl, *r_ovl;
 
-	ovl = omap_plane_find_free_overlay(s->dev, overlay_map, caps, fourcc);
+	ovl = omap_plane_find_free_overlay(s->drm, overlay_map, caps, fourcc);
 	if (!ovl)
 		return -ENOMEM;
 
@@ -82,7 +82,7 @@ int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 	*overlay = ovl;
 
 	if (r_overlay) {
-		r_ovl = omap_plane_find_free_overlay(s->dev, overlay_map,
+		r_ovl = omap_plane_find_free_overlay(s->drm, overlay_map,
 						     caps, fourcc);
 		if (!r_ovl) {
 			overlay_map[ovl->idx] = NULL;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index adfb36b0e815..0fc8bc9f3fbf 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -513,7 +513,7 @@ static int rcar_du_atomic_check(struct drm_device *dev,
 
 static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = old_state->drm;
 	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 335fd0edb904..1159e6da1b1d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -470,7 +470,7 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
 	struct drm_plane_state *plane_states[SUN4I_BACKEND_NUM_LAYERS] = { 0 };
 	struct sun4i_backend *backend = engine_to_sun4i_backend(engine);
 	struct drm_atomic_state *state = crtc_state->state;
-	struct drm_device *drm = state->dev;
+	struct drm_device *drm = state->drm;
 	struct drm_plane *plane;
 	unsigned int num_planes = 0;
 	unsigned int num_alpha_planes = 0;
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ff36171c8fb7..6cfea8bef59b 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -73,7 +73,7 @@ static void tegra_atomic_post_commit(struct drm_device *drm,
 
 static void tegra_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
-	struct drm_device *drm = old_state->dev;
+	struct drm_device *drm = old_state->drm;
 	struct tegra_drm *tegra = drm->dev_private;
 
 	if (tegra->hub) {
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index c979ad1af236..bd8b585db093 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -23,7 +23,7 @@
 
 static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
-	struct drm_device *ddev = old_state->dev;
+	struct drm_device *ddev = old_state->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 	bool fence_cookie = dma_fence_begin_signalling();
 
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
index 6e11fcc9ef45..8a34fbf2ecfb 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
@@ -65,7 +65,7 @@ int vc4_mock_atomic_add_output(struct kunit *test,
 			       struct drm_atomic_state *state,
 			       enum vc4_encoder_type type)
 {
-	struct drm_device *drm = state->dev;
+	struct drm_device *drm = state->drm;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	struct vc4_dummy_output *output;
@@ -103,7 +103,7 @@ int vc4_mock_atomic_del_output(struct kunit *test,
 			       struct drm_atomic_state *state,
 			       enum vc4_encoder_type type)
 {
-	struct drm_device *drm = state->dev;
+	struct drm_device *drm = state->drm;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	struct vc4_dummy_output *output;
diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
index ae0bd0f81698..9e66cc136f5b 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -124,7 +124,7 @@ get_vc4_crtc_state_for_encoder(struct kunit *test,
 			       const struct drm_atomic_state *state,
 			       enum vc4_encoder_type type)
 {
-	struct drm_device *drm = state->dev;
+	struct drm_device *drm = state->drm;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_encoder *encoder;
 	struct drm_crtc *crtc;
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 5495f2a94fa9..e66918d7ce69 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -46,7 +46,7 @@ struct vc4_load_tracker_state {
 static struct vc4_ctm_state *vc4_get_ctm_state(struct drm_atomic_state *state,
 					       struct drm_private_obj *manager)
 {
-	struct drm_device *dev = state->dev;
+	struct drm_device *dev = state->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_private_state *priv_state;
 	int ret;
@@ -169,7 +169,7 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
 struct vc4_hvs_state *
 vc4_hvs_get_new_global_state(const struct drm_atomic_state *state)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(state->drm);
 	struct drm_private_state *priv_state;
 
 	priv_state = drm_atomic_get_new_private_obj_state(state, &vc4->hvs_channels);
@@ -182,7 +182,7 @@ vc4_hvs_get_new_global_state(const struct drm_atomic_state *state)
 struct vc4_hvs_state *
 vc4_hvs_get_old_global_state(const struct drm_atomic_state *state)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(state->drm);
 	struct drm_private_state *priv_state;
 
 	priv_state = drm_atomic_get_old_private_obj_state(state, &vc4->hvs_channels);
@@ -195,7 +195,7 @@ vc4_hvs_get_old_global_state(const struct drm_atomic_state *state)
 struct vc4_hvs_state *
 vc4_hvs_get_global_state(struct drm_atomic_state *state)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(state->drm);
 	struct drm_private_state *priv_state;
 
 	priv_state = drm_atomic_get_private_obj_state(state, &vc4->hvs_channels);
@@ -322,7 +322,7 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 
 static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = state->dev;
+	struct drm_device *dev = state->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct drm_crtc_state *new_crtc_state;
@@ -571,7 +571,7 @@ vc4_ctm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 static int vc4_load_tracker_atomic_check(struct drm_atomic_state *state)
 {
 	struct drm_plane_state *old_plane_state, *new_plane_state;
-	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(state->drm);
 	struct vc4_load_tracker_state *load_state;
 	struct drm_private_state *priv_state;
 	struct drm_plane *plane;
@@ -920,7 +920,7 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 static int
 vc4_core_clock_atomic_check(struct drm_atomic_state *state)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(state->drm);
 	struct drm_private_state *priv_state;
 	struct vc4_hvs_state *hvs_new_state;
 	struct vc4_load_tracker_state *load_state;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e3c9c9571c8d..a58d7e0d3078 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -63,7 +63,7 @@ static void vkms_release(struct drm_device *dev)
 
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = old_state->drm;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	int i;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 9a022caacf93..675ee54f2a28 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -348,7 +348,7 @@ struct __drm_private_objs_state {
 /**
  * struct drm_atomic_state - the global state object for atomic updates
  * @ref: count of all references to this state (will not be freed until zero)
- * @dev: parent DRM device
+ * @drm: parent DRM device
  * @async_update: hint for asynchronous plane update
  * @planes: pointer to array of structures with per-plane data
  * @crtcs: pointer to array of CRTC pointers
@@ -365,7 +365,7 @@ struct __drm_private_objs_state {
 struct drm_atomic_state {
 	struct kref ref;
 
-	struct drm_device *dev;
+	struct drm_device *drm;
 
 	/**
 	 * @allow_modeset:
@@ -826,7 +826,7 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
  */
 #define for_each_oldnew_crtc_in_state(__state, crtc, old_crtc_state, new_crtc_state, __i) \
 	for ((__i) = 0;							\
-	     (__i) < (__state)->dev->mode_config.num_crtc;		\
+	     (__i) < (__state)->drm->mode_config.num_crtc;		\
 	     (__i)++)							\
 		for_each_if ((__state)->crtcs[__i].ptr &&		\
 			     ((crtc) = (__state)->crtcs[__i].ptr,	\
@@ -849,7 +849,7 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
  */
 #define for_each_old_crtc_in_state(__state, crtc, old_crtc_state, __i)	\
 	for ((__i) = 0;							\
-	     (__i) < (__state)->dev->mode_config.num_crtc;		\
+	     (__i) < (__state)->drm->mode_config.num_crtc;		\
 	     (__i)++)							\
 		for_each_if ((__state)->crtcs[__i].ptr &&		\
 			     ((crtc) = (__state)->crtcs[__i].ptr,	\
@@ -869,7 +869,7 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
  */
 #define for_each_new_crtc_in_state(__state, crtc, new_crtc_state, __i)	\
 	for ((__i) = 0;							\
-	     (__i) < (__state)->dev->mode_config.num_crtc;		\
+	     (__i) < (__state)->drm->mode_config.num_crtc;		\
 	     (__i)++)							\
 		for_each_if ((__state)->crtcs[__i].ptr &&		\
 			     ((crtc) = (__state)->crtcs[__i].ptr,	\
@@ -891,7 +891,7 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
  */
 #define for_each_oldnew_plane_in_state(__state, plane, old_plane_state, new_plane_state, __i) \
 	for ((__i) = 0;							\
-	     (__i) < (__state)->dev->mode_config.num_total_plane;	\
+	     (__i) < (__state)->drm->mode_config.num_total_plane;	\
 	     (__i)++)							\
 		for_each_if ((__state)->planes[__i].ptr &&		\
 			     ((plane) = (__state)->planes[__i].ptr,	\
@@ -913,7 +913,7 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
  * state delta needs to be considered, for example in atomic check functions.
  */
 #define for_each_oldnew_plane_in_state_reverse(__state, plane, old_plane_state, new_plane_state, __i) \
-	for ((__i) = ((__state)->dev->mode_config.num_total_plane - 1);	\
+	for ((__i) = ((__state)->drm->mode_config.num_total_plane - 1);	\
 	     (__i) >= 0;						\
 	     (__i)--)							\
 		for_each_if ((__state)->planes[__i].ptr &&		\
@@ -930,7 +930,7 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
  * @__i: int iteration cursor, for macro-internal use
  */
 #define for_each_new_plane_in_state_reverse(__state, plane, new_plane_state, __i) \
-	for ((__i) = ((__state)->dev->mode_config.num_total_plane - 1);	\
+	for ((__i) = ((__state)->drm->mode_config.num_total_plane - 1);	\
 	     (__i) >= 0;						\
 	     (__i)--)							\
 		for_each_if ((__state)->planes[__i].ptr &&		\
@@ -950,7 +950,7 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
  */
 #define for_each_old_plane_in_state(__state, plane, old_plane_state, __i) \
 	for ((__i) = 0;							\
-	     (__i) < (__state)->dev->mode_config.num_total_plane;	\
+	     (__i) < (__state)->drm->mode_config.num_total_plane;	\
 	     (__i)++)							\
 		for_each_if ((__state)->planes[__i].ptr &&		\
 			     ((plane) = (__state)->planes[__i].ptr,	\
@@ -968,7 +968,7 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
  */
 #define for_each_new_plane_in_state(__state, plane, new_plane_state, __i) \
 	for ((__i) = 0;							\
-	     (__i) < (__state)->dev->mode_config.num_total_plane;	\
+	     (__i) < (__state)->drm->mode_config.num_total_plane;	\
 	     (__i)++)							\
 		for_each_if ((__state)->planes[__i].ptr &&		\
 			     ((plane) = (__state)->planes[__i].ptr,	\
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 536a0b0091c3..cdddabfc5d57 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -186,7 +186,7 @@ int drm_atomic_helper_page_flip_target(
  * validate the incoming state.
  */
 #define drm_atomic_crtc_state_for_each_plane(plane, crtc_state) \
-	drm_for_each_plane_mask(plane, (crtc_state)->state->dev, (crtc_state)->plane_mask)
+	drm_for_each_plane_mask(plane, (crtc_state)->state->drm, (crtc_state)->plane_mask)
 
 /**
  * drm_atomic_crtc_state_for_each_plane_state - iterate over attached planes in new state
@@ -204,7 +204,7 @@ int drm_atomic_helper_page_flip_target(
  * active planes on this CRTC, but does not need to change it.
  */
 #define drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, crtc_state) \
-	drm_for_each_plane_mask(plane, (crtc_state)->state->dev, (crtc_state)->plane_mask) \
+	drm_for_each_plane_mask(plane, (crtc_state)->state->drm, (crtc_state)->plane_mask) \
 		for_each_if ((plane_state = \
 			      __drm_atomic_get_current_plane_state((crtc_state)->state, \
 								   plane)))
-- 
2.39.2

