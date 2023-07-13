Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C63A751B7E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDDB89F41;
	Thu, 13 Jul 2023 08:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3D210E62F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:25:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrch-0005zU-Bn; Thu, 13 Jul 2023 10:24:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcg-00E4k6-Dm; Thu, 13 Jul 2023 10:24:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcf-004VhZ-G8; Thu, 13 Jul 2023 10:24:25 +0200
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
Subject: [PATCH 14/17] drm/plane: Rename struct drm_plane::dev to drm
Date: Thu, 13 Jul 2023 10:24:05 +0200
Message-Id: <20230713082408.2266984-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=154513;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=6wXov2xjAZXKTLEElaAVDr3vvLMi8BdZCf5NwH5G0B8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7ScP9o+662yplvvJYGXJqYCDrCP2KKvm0X8C
 kSfrNXnsYSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0nAAKCRCPgPtYfRL+
 TtZUCACJFXSfx+uKBkcIvQ0XyF7u+g1+/2Z7tEFZMYaaXi1SxFAHOhYamGQURPbnrW4m2n/ha7K
 rrtyXbGSd2YyclN2GcYE7oD3ETyGlFfvE4NEj0vfN7owD51BXfLGK6TEcZxXvvfNGP/xdyqO5bX
 0/yfoeH18ejiOyWv18tWWXt1+cZbUuJqGa9cWrd2Msvi3ZlrG3KSxGJL+nTfEI3kqaL7H7BNR1h
 qS3DShaAXCAZyeDBwP7OJPtO0ua4IhvLiQPp/r7cCWaNJ/NcwnbneN7HDbx7Runpdd22xkQxpKy
 pMpyq7meay9bgkZcL8PJworJFMqF62yzGpo6YOL8kIcrsaO/
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
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +--
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 10 ++--
 .../gpu/drm/arm/display/komeda/komeda_plane.c |  2 +-
 drivers/gpu/drm/arm/hdlcd_crtc.c              |  4 +-
 drivers/gpu/drm/arm/malidp_planes.c           |  4 +-
 drivers/gpu/drm/armada/armada_overlay.c       |  6 +--
 drivers/gpu/drm/ast/ast_mode.c                | 12 ++---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  8 ++--
 drivers/gpu/drm/drm_atomic.c                  | 20 ++++----
 drivers/gpu/drm/drm_atomic_helper.c           | 20 ++++----
 drivers/gpu/drm/drm_atomic_uapi.c             | 16 +++----
 drivers/gpu/drm/drm_blend.c                   | 10 ++--
 drivers/gpu/drm/drm_color_mgmt.c              |  2 +-
 drivers/gpu/drm/drm_plane.c                   | 24 +++++-----
 drivers/gpu/drm/drm_plane_helper.c            |  4 +-
 drivers/gpu/drm/drm_simple_kms_helper.c       |  2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |  6 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    | 13 +++--
 drivers/gpu/drm/i915/display/i9xx_plane.c     | 36 +++++++-------
 drivers/gpu/drm/i915/display/i9xx_wm.c        |  4 +-
 .../gpu/drm/i915/display/intel_atomic_plane.c | 18 +++----
 drivers/gpu/drm/i915/display/intel_color.c    |  2 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   | 26 +++++-----
 drivers/gpu/drm/i915/display/intel_display.c  |  4 +-
 .../drm/i915/display/intel_display_trace.h    | 12 ++---
 drivers/gpu/drm/i915/display/intel_fb.c       |  6 +--
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      | 20 ++++----
 drivers/gpu/drm/i915/display/intel_psr.c      |  6 +--
 drivers/gpu/drm/i915/display/intel_sprite.c   | 48 +++++++++----------
 .../gpu/drm/i915/display/intel_sprite_uapi.c  |  4 +-
 drivers/gpu/drm/i915/display/skl_scaler.c     |  4 +-
 .../drm/i915/display/skl_universal_plane.c    | 48 +++++++++----------
 drivers/gpu/drm/i915/display/skl_watermark.c  | 10 ++--
 drivers/gpu/drm/imx/dcss/dcss-plane.c         |  8 ++--
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c       | 12 +++--
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  6 +--
 drivers/gpu/drm/kmb/kmb_plane.c               |  8 ++--
 drivers/gpu/drm/logicvc/logicvc_layer.c       |  6 +--
 drivers/gpu/drm/loongson/lsdc_plane.c         | 30 ++++++------
 drivers/gpu/drm/mgag200/mgag200_mode.c        |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |  6 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  4 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c             |  4 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  8 ++--
 drivers/gpu/drm/nouveau/dispnv04/overlay.c    | 10 ++--
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c   |  6 +--
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       | 16 +++----
 drivers/gpu/drm/omapdrm/omap_plane.c          | 19 ++++----
 drivers/gpu/drm/qxl/qxl_display.c             | 12 ++---
 .../gpu/drm/renesas/rcar-du/rcar_du_plane.c   |  2 +-
 .../drm/renesas/shmobile/shmob_drm_plane.c    |  6 +--
 drivers/gpu/drm/solomon/ssd130x.c             |  4 +-
 drivers/gpu/drm/sti/sti_cursor.c              |  2 +-
 drivers/gpu/drm/sti/sti_gdp.c                 |  2 +-
 drivers/gpu/drm/sti/sti_hqvdp.c               |  2 +-
 drivers/gpu/drm/stm/ltdc.c                    |  2 +-
 drivers/gpu/drm/tegra/dc.c                    |  2 +-
 drivers/gpu/drm/tegra/plane.c                 |  6 +--
 .../gpu/drm/tests/drm_damage_helper_test.c    |  2 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |  8 ++--
 drivers/gpu/drm/tilcdc/tilcdc_plane.c         |  8 ++--
 drivers/gpu/drm/tiny/cirrus.c                 |  2 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |  4 +-
 drivers/gpu/drm/tiny/simpledrm.c              |  4 +-
 drivers/gpu/drm/udl/udl_modeset.c             |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |  4 +-
 drivers/gpu/drm/vc4/vc4_plane.c               | 14 +++---
 drivers/gpu/drm/virtio/virtgpu_plane.c        | 10 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  6 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |  7 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |  4 +-
 include/drm/drm_plane.h                       |  4 +-
 76 files changed, 348 insertions(+), 345 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ebc22b9780c4..a7d639231380 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5075,11 +5075,11 @@ static inline void fill_dc_dirty_rect(struct drm_plane *plane,
 	dirty_rect->height = height;
 
 	if (ffu)
-		drm_dbg(plane->dev,
+		drm_dbg(plane->drm,
 			"[PLANE:%d] PSR FFU dirty rect size (%d, %d)\n",
 			plane->base.id, width, height);
 	else
-		drm_dbg(plane->dev,
+		drm_dbg(plane->drm,
 			"[PLANE:%d] PSR SU dirty rect at (%d, %d) size (%d, %d)",
 			plane->base.id, x, y, width, height);
 
@@ -5163,7 +5163,7 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
 		      old_plane_state->crtc_w != new_plane_state->crtc_w ||
 		      old_plane_state->crtc_h != new_plane_state->crtc_h);
 
-	drm_dbg(plane->dev,
+	drm_dbg(plane->drm,
 		"[PLANE:%d] PSR bb_changed:%d fb_changed:%d num_clips:%d\n",
 		new_plane_state->plane->base.id,
 		bb_changed, fb_changed, num_clips);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 7ea95dfde4e3..2991487e4f0e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1090,8 +1090,8 @@ int amdgpu_dm_plane_fill_dc_scaling_info(struct amdgpu_device *adev,
 	scaling_info->clip_rect = scaling_info->dst_rect;
 
 	/* Validate scaling per-format with DC plane caps */
-	if (state->plane && state->plane->dev && state->fb) {
-		get_min_max_dc_plane_scaling(state->plane->dev, state->fb,
+	if (state->plane && state->plane->drm && state->fb) {
+		get_min_max_dc_plane_scaling(state->plane->drm, state->fb,
 					     &min_downscale, &max_upscale);
 	} else {
 		min_downscale = 250;
@@ -1123,7 +1123,7 @@ static int dm_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	struct amdgpu_device *adev = drm_to_adev(plane->dev);
+	struct amdgpu_device *adev = drm_to_adev(plane->drm);
 	struct dc *dc = adev->dm.dc;
 	struct dm_plane_state *dm_plane_state;
 	struct dc_scaling_info scaling_info;
@@ -1214,7 +1214,7 @@ static int get_cursor_position(struct drm_plane *plane, struct drm_crtc *crtc,
 void amdgpu_dm_plane_handle_cursor_update(struct drm_plane *plane,
 				 struct drm_plane_state *old_plane_state)
 {
-	struct amdgpu_device *adev = drm_to_adev(plane->dev);
+	struct amdgpu_device *adev = drm_to_adev(plane->drm);
 	struct amdgpu_framebuffer *afb = to_amdgpu_framebuffer(plane->state->fb);
 	struct drm_crtc *crtc = afb ? plane->state->crtc : old_plane_state->crtc;
 	struct dm_crtc_state *crtc_state = crtc ? to_dm_crtc_state(crtc->state) : NULL;
@@ -1345,7 +1345,7 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
 					  uint32_t format,
 					  uint64_t modifier)
 {
-	struct amdgpu_device *adev = drm_to_adev(plane->dev);
+	struct amdgpu_device *adev = drm_to_adev(plane->drm);
 	const struct drm_format_info *info = drm_format_info(format);
 	int i;
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index c20ff72f0ae5..dc6477f32055 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -176,7 +176,7 @@ static bool
 komeda_plane_format_mod_supported(struct drm_plane *plane,
 				  u32 format, u64 modifier)
 {
-	struct komeda_dev *mdev = plane->dev->dev_private;
+	struct komeda_dev *mdev = plane->drm->dev_private;
 	struct komeda_plane *kplane = to_kplane(plane);
 	u32 layer_type = kplane->layer->layer_type;
 
diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index f7f2d101d476..d971ebe42770 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -274,7 +274,7 @@ static void hdlcd_plane_atomic_update(struct drm_plane *plane,
 	dest_h = drm_rect_height(&new_plane_state->dst);
 	scanout_start = drm_fb_dma_get_gem_addr(fb, new_plane_state, 0);
 
-	hdlcd = drm_to_hdlcd_priv(plane->dev);
+	hdlcd = drm_to_hdlcd_priv(plane->drm);
 	hdlcd_write(hdlcd, HDLCD_REG_FB_LINE_LENGTH, fb->pitches[0]);
 	hdlcd_write(hdlcd, HDLCD_REG_FB_LINE_PITCH, fb->pitches[0]);
 	hdlcd_write(hdlcd, HDLCD_REG_FB_LINE_COUNT, dest_h - 1);
@@ -303,7 +303,7 @@ static struct drm_plane *hdlcd_plane_init(struct drm_device *drm)
 	for (i = 0; i < ARRAY_SIZE(supported_formats); i++)
 		formats[i] = supported_formats[i].fourcc;
 
-	plane = drmm_universal_plane_alloc(drm, struct drm_plane, dev, 0xff,
+	plane = drmm_universal_plane_alloc(drm, struct drm_plane, drm, 0xff,
 					   &hdlcd_plane_funcs,
 					   formats, ARRAY_SIZE(formats),
 					   NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 34547edf1ee3..13048b213560 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -246,7 +246,7 @@ bool malidp_format_mod_supported(struct drm_device *drm,
 static bool malidp_format_mod_supported_per_plane(struct drm_plane *plane,
 						  u32 format, u64 modifier)
 {
-	return malidp_format_mod_supported(plane->dev, format, modifier);
+	return malidp_format_mod_supported(plane->drm, format, modifier);
 }
 
 static const struct drm_plane_funcs malidp_de_plane_funcs = {
@@ -304,7 +304,7 @@ static u32 malidp_get_pgsize_bitmap(struct malidp_plane *mp)
 {
 	struct iommu_domain *mmu_dom;
 
-	mmu_dom = iommu_get_domain_for_dev(mp->base.dev->dev);
+	mmu_dom = iommu_get_domain_for_dev(mp->base.drm->dev);
 	if (mmu_dom)
 		return mmu_dom->pgsize_bitmap;
 
diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index f21eb8fb76d8..a999231f6a35 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -267,7 +267,7 @@ armada_overlay_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
 				 crtc_x, crtc_y, crtc_w, crtc_h,
 				 src_x, src_y, src_w, src_h);
 
-	state = drm_atomic_state_alloc(plane->dev);
+	state = drm_atomic_state_alloc(plane->drm);
 	if (!state)
 		return -ENOMEM;
 
@@ -343,7 +343,7 @@ static int armada_overlay_set_property(struct drm_plane *plane,
 	struct drm_plane_state *state, struct drm_property *property,
 	uint64_t val)
 {
-	struct armada_private *priv = drm_to_armada_dev(plane->dev);
+	struct armada_private *priv = drm_to_armada_dev(plane->drm);
 
 #define K2R(val) (((val) >> 0) & 0xff)
 #define K2G(val) (((val) >> 8) & 0xff)
@@ -411,7 +411,7 @@ static int armada_overlay_get_property(struct drm_plane *plane,
 	const struct drm_plane_state *state, struct drm_property *property,
 	uint64_t *val)
 {
-	struct armada_private *priv = drm_to_armada_dev(plane->dev);
+	struct armada_private *priv = drm_to_armada_dev(plane->drm);
 
 #define C2K(c,s)	(((c) >> (s)) & 0xff)
 #define R2BGR(r,g,b,s)	(C2K(r,s) << 0 | C2K(g,s) << 8 | C2K(b,s) << 16)
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index bfbdc03c1ac9..02857761c3e6 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -598,7 +598,7 @@ static const uint32_t ast_primary_plane_formats[] = {
 static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 						 struct drm_atomic_state *state)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_crtc_state *new_crtc_state = NULL;
 	struct ast_crtc_state *new_ast_crtc_state;
@@ -640,7 +640,7 @@ static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src
 static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct ast_device *ast = to_ast_device(dev);
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
@@ -679,7 +679,7 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 static void ast_primary_plane_helper_atomic_enable(struct drm_plane *plane,
 						   struct drm_atomic_state *state)
 {
-	struct ast_device *ast = to_ast_device(plane->dev);
+	struct ast_device *ast = to_ast_device(plane->drm);
 	struct ast_plane *ast_plane = to_ast_plane(plane);
 
 	/*
@@ -695,7 +695,7 @@ static void ast_primary_plane_helper_atomic_enable(struct drm_plane *plane,
 static void ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 						    struct drm_atomic_state *state)
 {
-	struct ast_device *ast = to_ast_device(plane->dev);
+	struct ast_device *ast = to_ast_device(plane->drm);
 
 	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x20);
 }
@@ -884,7 +884,7 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
-	struct ast_device *ast = to_ast_device(plane->dev);
+	struct ast_device *ast = to_ast_device(plane->drm);
 	struct iosys_map src_map = shadow_plane_state->data[0];
 	struct drm_rect damage;
 	const u8 *src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
@@ -939,7 +939,7 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 static void ast_cursor_plane_helper_atomic_disable(struct drm_plane *plane,
 						   struct drm_atomic_state *state)
 {
-	struct ast_device *ast = to_ast_device(plane->dev);
+	struct ast_device *ast = to_ast_device(plane->drm);
 
 	ast_set_cursor_enabled(ast, false);
 }
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index daa508504f47..9d8421a472f3 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -830,7 +830,7 @@ void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
 	if (isr &
 	    (ATMEL_HLCDC_LAYER_OVR_IRQ(0) | ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
 	     ATMEL_HLCDC_LAYER_OVR_IRQ(2)))
-		dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
+		dev_dbg(plane->base.drm->dev, "overrun on plane %s\n",
 			desc->name);
 }
 
@@ -843,7 +843,7 @@ static const struct drm_plane_helper_funcs atmel_hlcdc_layer_plane_helper_funcs
 static int atmel_hlcdc_plane_alloc_dscrs(struct drm_plane *p,
 					 struct atmel_hlcdc_plane_state *state)
 {
-	struct atmel_hlcdc_dc *dc = p->dev->dev_private;
+	struct atmel_hlcdc_dc *dc = p->drm->dev_private;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(state->dscrs); i++) {
@@ -891,7 +891,7 @@ static void atmel_hlcdc_plane_reset(struct drm_plane *p)
 	if (state) {
 		if (atmel_hlcdc_plane_alloc_dscrs(p, state)) {
 			kfree(state);
-			dev_err(p->dev->dev,
+			dev_err(p->drm->dev,
 				"Failed to allocate initial plane state\n");
 			return;
 		}
@@ -926,7 +926,7 @@ static void atmel_hlcdc_plane_atomic_destroy_state(struct drm_plane *p,
 {
 	struct atmel_hlcdc_plane_state *state =
 			drm_plane_state_to_atmel_hlcdc_plane_state(s);
-	struct atmel_hlcdc_dc *dc = p->dev->dev_private;
+	struct atmel_hlcdc_dc *dc = p->drm->dev_private;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(state->dscrs); i++) {
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ab851e7b1a41..a415805ce6b0 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -546,7 +546,7 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 	state->planes[index].new_state = plane_state;
 	plane_state->state = state;
 
-	drm_dbg_atomic(plane->dev, "Added [PLANE:%d:%s] %p state to %p\n",
+	drm_dbg_atomic(plane->drm, "Added [PLANE:%d:%s] %p state to %p\n",
 		       plane->base.id, plane->name, plane_state, state);
 
 	if (plane_state->crtc) {
@@ -603,11 +603,13 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 
 	/* either *both* CRTC and FB must be set, or neither */
 	if (crtc && !fb) {
-		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
+		drm_dbg_atomic(plane->drm,
+			       "[PLANE:%d:%s] CRTC set but no FB\n",
 			       plane->base.id, plane->name);
 		return -EINVAL;
 	} else if (fb && !crtc) {
-		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] FB set but no CRTC\n",
+		drm_dbg_atomic(plane->drm,
+			       "[PLANE:%d:%s] FB set but no CRTC\n",
 			       plane->base.id, plane->name);
 		return -EINVAL;
 	}
@@ -618,7 +620,7 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 
 	/* Check whether this plane is usable on this CRTC */
 	if (!(plane->possible_crtcs & drm_crtc_mask(crtc))) {
-		drm_dbg_atomic(plane->dev,
+		drm_dbg_atomic(plane->drm,
 			       "Invalid [CRTC:%d:%s] for [PLANE:%d:%s]\n",
 			       crtc->base.id, crtc->name,
 			       plane->base.id, plane->name);
@@ -629,7 +631,7 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	ret = drm_plane_check_pixel_format(plane, fb->format->format,
 					   fb->modifier);
 	if (ret) {
-		drm_dbg_atomic(plane->dev,
+		drm_dbg_atomic(plane->drm,
 			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
 			       plane->base.id, plane->name,
 			       &fb->format->format, fb->modifier);
@@ -641,7 +643,7 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	    new_plane_state->crtc_x > INT_MAX - (int32_t) new_plane_state->crtc_w ||
 	    new_plane_state->crtc_h > INT_MAX ||
 	    new_plane_state->crtc_y > INT_MAX - (int32_t) new_plane_state->crtc_h) {
-		drm_dbg_atomic(plane->dev,
+		drm_dbg_atomic(plane->drm,
 			       "[PLANE:%d:%s] invalid CRTC coordinates %ux%u+%d+%d\n",
 			       plane->base.id, plane->name,
 			       new_plane_state->crtc_w, new_plane_state->crtc_h,
@@ -657,7 +659,7 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
 	    new_plane_state->src_h > fb_height ||
 	    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
-		drm_dbg_atomic(plane->dev,
+		drm_dbg_atomic(plane->drm,
 			       "[PLANE:%d:%s] invalid source coordinates "
 			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
 			       plane->base.id, plane->name,
@@ -684,7 +686,7 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 		    clips->y1 < 0 ||
 		    clips->x2 > fb_width ||
 		    clips->y2 > fb_height) {
-			drm_dbg_atomic(plane->dev,
+			drm_dbg_atomic(plane->drm,
 				       "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
 				       plane->base.id, plane->name, clips->x1,
 				       clips->y1, clips->x2, clips->y2);
@@ -695,7 +697,7 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	}
 
 	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
-		drm_dbg_atomic(plane->dev,
+		drm_dbg_atomic(plane->drm,
 			       "[PLANE:%d:%s] switching CRTC directly\n",
 			       plane->base.id, plane->name);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 39e8900e6283..910e477cb9cc 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -882,7 +882,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 	}
 
 	if (!crtc_state->enable && !can_update_disabled) {
-		drm_dbg_kms(plane_state->plane->dev,
+		drm_dbg_kms(plane_state->plane->drm,
 			    "Cannot update plane of a disabled CRTC.\n");
 		return -EINVAL;
 	}
@@ -893,7 +893,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
 	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
 	if (hscale < 0 || vscale < 0) {
-		drm_dbg_kms(plane_state->plane->dev,
+		drm_dbg_kms(plane_state->plane->drm,
 			    "Invalid scaling of plane\n");
 		drm_rect_debug_print("src: ", &plane_state->src, true);
 		drm_rect_debug_print("dst: ", &plane_state->dst, false);
@@ -918,7 +918,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 		return 0;
 
 	if (!can_position && !drm_rect_equals(dst, &clip)) {
-		drm_dbg_kms(plane_state->plane->dev,
+		drm_dbg_kms(plane_state->plane->drm,
 			    "Plane must cover entire CRTC\n");
 		drm_rect_debug_print("dst: ", dst, false);
 		drm_rect_debug_print("clip: ", &clip, false);
@@ -1002,7 +1002,7 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 
 		ret = funcs->atomic_check(plane, state);
 		if (ret) {
-			drm_dbg_atomic(plane->dev,
+			drm_dbg_atomic(plane->drm,
 				       "[PLANE:%d:%s] atomic driver check failed\n",
 				       plane->base.id, plane->name);
 			return ret;
@@ -2356,7 +2356,7 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 		 */
 		if (nonblock && old_plane_state->commit &&
 		    !try_wait_for_completion(&old_plane_state->commit->flip_done)) {
-			drm_dbg_atomic(plane->dev,
+			drm_dbg_atomic(plane->drm,
 				       "[PLANE:%d:%s] busy with a previous commit\n",
 				       plane->base.id, plane->name);
 
@@ -2420,7 +2420,7 @@ void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *old_state)
 	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
 		ret = drm_crtc_commit_wait(old_plane_state->commit);
 		if (ret)
-			drm_err(plane->dev,
+			drm_err(plane->drm,
 				"[PLANE:%d:%s] commit wait timed out\n",
 				plane->base.id, plane->name);
 	}
@@ -3125,7 +3125,7 @@ int drm_atomic_helper_update_plane(struct drm_plane *plane,
 	struct drm_plane_state *plane_state;
 	int ret = 0;
 
-	state = drm_atomic_state_alloc(plane->dev);
+	state = drm_atomic_state_alloc(plane->drm);
 	if (!state)
 		return -ENOMEM;
 
@@ -3176,7 +3176,7 @@ int drm_atomic_helper_disable_plane(struct drm_plane *plane,
 	struct drm_plane_state *plane_state;
 	int ret = 0;
 
-	state = drm_atomic_state_alloc(plane->dev);
+	state = drm_atomic_state_alloc(plane->drm);
 	if (!state)
 		return -ENOMEM;
 
@@ -3647,7 +3647,7 @@ int drm_atomic_helper_page_flip(struct drm_crtc *crtc,
 	struct drm_atomic_state *state;
 	int ret = 0;
 
-	state = drm_atomic_state_alloc(plane->dev);
+	state = drm_atomic_state_alloc(plane->drm);
 	if (!state)
 		return -ENOMEM;
 
@@ -3692,7 +3692,7 @@ int drm_atomic_helper_page_flip_target(struct drm_crtc *crtc,
 	struct drm_crtc_state *crtc_state;
 	int ret = 0;
 
-	state = drm_atomic_state_alloc(plane->dev);
+	state = drm_atomic_state_alloc(plane->drm);
 	if (!state)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 38a5f69f0c9c..d9d41d1b4f5d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -212,12 +212,12 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
 	}
 
 	if (crtc)
-		drm_dbg_atomic(plane->dev,
+		drm_dbg_atomic(plane->drm,
 			       "Link [PLANE:%d:%s] state %p to [CRTC:%d:%s]\n",
 			       plane->base.id, plane->name, plane_state,
 			       crtc->base.id, crtc->name);
 	else
-		drm_dbg_atomic(plane->dev,
+		drm_dbg_atomic(plane->drm,
 			       "Link [PLANE:%d:%s] state %p to [NOCRTC]\n",
 			       plane->base.id, plane->name, plane_state);
 
@@ -242,12 +242,12 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 	struct drm_plane *plane = plane_state->plane;
 
 	if (fb)
-		drm_dbg_atomic(plane->dev,
+		drm_dbg_atomic(plane->drm,
 			       "Set [FB:%d] for [PLANE:%d:%s] state %p\n",
 			       fb->base.id, plane->base.id, plane->name,
 			       plane_state);
 	else
-		drm_dbg_atomic(plane->dev,
+		drm_dbg_atomic(plane->drm,
 			       "Set [NOFB] for [PLANE:%d:%s] state %p\n",
 			       plane->base.id, plane->name, plane_state);
 
@@ -513,7 +513,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		struct drm_plane_state *state, struct drm_file *file_priv,
 		struct drm_property *property, uint64_t val)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct drm_mode_config *config = &dev->mode_config;
 	bool replaced = false;
 	int ret;
@@ -568,7 +568,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->pixel_blend_mode = val;
 	} else if (property == plane->rotation_property) {
 		if (!is_power_of_2(val & DRM_MODE_ROTATE_MASK)) {
-			drm_dbg_atomic(plane->dev,
+			drm_dbg_atomic(plane->drm,
 				       "[PLANE:%d:%s] bad rotation bitmask: 0x%llx\n",
 				       plane->base.id, plane->name, val);
 			return -EINVAL;
@@ -594,7 +594,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		return plane->funcs->atomic_set_property(plane, state,
 				property, val);
 	} else {
-		drm_dbg_atomic(plane->dev,
+		drm_dbg_atomic(plane->drm,
 			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
 			       plane->base.id, plane->name,
 			       property->base.id, property->name);
@@ -609,7 +609,7 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		const struct drm_plane_state *state,
 		struct drm_property *property, uint64_t *val)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct drm_mode_config *config = &dev->mode_config;
 
 	if (property == config->prop_fb_id) {
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index c390b8924e95..5993f1ef208e 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -220,7 +220,7 @@ int drm_plane_create_alpha_property(struct drm_plane *plane)
 {
 	struct drm_property *prop;
 
-	prop = drm_property_create_range(plane->dev, 0, "alpha",
+	prop = drm_property_create_range(plane->drm, 0, "alpha",
 					 0, DRM_BLEND_ALPHA_OPAQUE);
 	if (!prop)
 		return -ENOMEM;
@@ -287,7 +287,7 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
 	WARN_ON(!is_power_of_2(rotation & DRM_MODE_ROTATE_MASK));
 	WARN_ON(rotation & ~supported_rotations);
 
-	prop = drm_property_create_bitmask(plane->dev, 0, "rotation",
+	prop = drm_property_create_bitmask(plane->drm, 0, "rotation",
 					   props, ARRAY_SIZE(props),
 					   supported_rotations);
 	if (!prop)
@@ -372,7 +372,7 @@ int drm_plane_create_zpos_property(struct drm_plane *plane,
 {
 	struct drm_property *prop;
 
-	prop = drm_property_create_range(plane->dev, 0, "zpos", min, max);
+	prop = drm_property_create_range(plane->drm, 0, "zpos", min, max);
 	if (!prop)
 		return -ENOMEM;
 
@@ -410,7 +410,7 @@ int drm_plane_create_zpos_immutable_property(struct drm_plane *plane,
 {
 	struct drm_property *prop;
 
-	prop = drm_property_create_range(plane->dev, DRM_MODE_PROP_IMMUTABLE,
+	prop = drm_property_create_range(plane->drm, DRM_MODE_PROP_IMMUTABLE,
 					 "zpos", zpos, zpos);
 	if (!prop)
 		return -ENOMEM;
@@ -571,7 +571,7 @@ EXPORT_SYMBOL(drm_atomic_normalize_zpos);
 int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct drm_property *prop;
 	static const struct drm_prop_enum_list props[] = {
 		{ DRM_MODE_BLEND_PIXEL_NONE, "None" },
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 2a437d84e531..9abf578690bb 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -530,7 +530,7 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 				      enum drm_color_encoding default_encoding,
 				      enum drm_color_range default_range)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct drm_property *prop;
 	struct drm_prop_enum_list enum_list[max_t(int, DRM_COLOR_ENCODING_MAX,
 						       DRM_COLOR_RANGE_MAX)];
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 1cff3c23c2a1..f8d8f330c5c8 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -270,7 +270,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 	drm_modeset_lock_init(&plane->mutex);
 
 	plane->base.properties = &plane->properties;
-	plane->dev = dev;
+	plane->drm = dev;
 	plane->funcs = funcs;
 	plane->format_types = kmalloc_array(format_count, sizeof(uint32_t),
 					    GFP_KERNEL);
@@ -408,7 +408,7 @@ static void drmm_universal_plane_alloc_release(struct drm_device *dev, void *ptr
 {
 	struct drm_plane *plane = ptr;
 
-	if (WARN_ON(!plane->dev))
+	if (WARN_ON(!plane->drm))
 		return;
 
 	drm_plane_cleanup(plane);
@@ -535,7 +535,7 @@ void drm_plane_unregister_all(struct drm_device *dev)
  */
 void drm_plane_cleanup(struct drm_plane *plane)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 
 	drm_modeset_lock_fini(&plane->mutex);
 
@@ -606,7 +606,7 @@ void drm_plane_force_disable(struct drm_plane *plane)
 	if (!plane->fb)
 		return;
 
-	WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
+	WARN_ON(drm_drv_uses_atomic_modeset(plane->drm));
 
 	plane->old_fb = plane->fb;
 	ret = plane->funcs->disable_plane(plane, NULL);
@@ -859,7 +859,7 @@ static int __setplane_internal(struct drm_plane *plane,
 {
 	int ret = 0;
 
-	WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
+	WARN_ON(drm_drv_uses_atomic_modeset(plane->drm));
 
 	/* No fb means shut it down */
 	if (!fb) {
@@ -911,7 +911,7 @@ static int __setplane_atomic(struct drm_plane *plane,
 {
 	int ret;
 
-	WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
+	WARN_ON(!drm_drv_uses_atomic_modeset(plane->drm));
 
 	/* No fb means shut it down */
 	if (!fb)
@@ -947,10 +947,10 @@ static int setplane_internal(struct drm_plane *plane,
 	struct drm_modeset_acquire_ctx ctx;
 	int ret;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(plane->dev, ctx,
+	DRM_MODESET_LOCK_ALL_BEGIN(plane->drm, ctx,
 				   DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
 
-	if (drm_drv_uses_atomic_modeset(plane->dev))
+	if (drm_drv_uses_atomic_modeset(plane->drm))
 		ret = __setplane_atomic(plane, crtc, fb,
 					crtc_x, crtc_y, crtc_w, crtc_h,
 					src_x, src_y, src_w, src_h, &ctx);
@@ -959,7 +959,7 @@ static int setplane_internal(struct drm_plane *plane,
 					  crtc_x, crtc_y, crtc_w, crtc_h,
 					  src_x, src_y, src_w, src_h, &ctx);
 
-	DRM_MODESET_LOCK_ALL_END(plane->dev, ctx, ret);
+	DRM_MODESET_LOCK_ALL_END(plane->drm, ctx, ret);
 
 	return ret;
 }
@@ -1452,7 +1452,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
  */
 void drm_plane_enable_fb_damage_clips(struct drm_plane *plane)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct drm_mode_config *config = &dev->mode_config;
 
 	drm_object_attach_property(&plane->base, config->prop_fb_damage_clips,
@@ -1498,7 +1498,7 @@ __drm_plane_get_damage_clips(const struct drm_plane_state *state)
 struct drm_mode_rect *
 drm_plane_get_damage_clips(const struct drm_plane_state *state)
 {
-	struct drm_device *dev = state->plane->dev;
+	struct drm_device *dev = state->plane->drm;
 	struct drm_mode_config *config = &dev->mode_config;
 
 	/* check that drm_plane_enable_fb_damage_clips() was called */
@@ -1570,7 +1570,7 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 					     unsigned int supported_filters)
 {
 	struct drm_property *prop =
-		drm_create_scaling_filter_prop(plane->dev, supported_filters);
+		drm_create_scaling_filter_prop(plane->drm, supported_filters);
 
 	if (IS_ERR(prop))
 		return PTR_ERR(prop);
diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index d26c99fa7aee..e5ce73764379 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -196,7 +196,7 @@ int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *cr
 		.x2 = crtc_x + crtc_w,
 		.y2 = crtc_y + crtc_h,
 	};
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct drm_connector **connector_list;
 	int num_connectors, ret;
 	bool visible;
@@ -265,7 +265,7 @@ EXPORT_SYMBOL(drm_plane_helper_update_primary);
 int drm_plane_helper_disable_primary(struct drm_plane *plane,
 				     struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 
 	drm_WARN_ON_ONCE(dev, drm_drv_uses_atomic_modeset(dev));
 
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 270523ae36d4..598872d09713 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -262,7 +262,7 @@ static int drm_simple_kms_plane_prepare_fb(struct drm_plane *plane,
 
 	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
 	if (!pipe->funcs || !pipe->funcs->prepare_fb) {
-		if (WARN_ON_ONCE(!drm_core_check_feature(plane->dev, DRIVER_GEM)))
+		if (WARN_ON_ONCE(!drm_core_check_feature(plane->drm, DRIVER_GEM)))
 			return 0;
 
 		WARN_ON_ONCE(pipe->funcs && pipe->funcs->cleanup_fb);
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 794a87d16f88..ea5aae31bdc3 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -22,7 +22,7 @@
 
 static int fsl_dcu_drm_plane_index(struct drm_plane *plane)
 {
-	struct fsl_dcu_drm_device *fsl_dev = plane->dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = plane->drm->dev_private;
 	unsigned int total_layer = fsl_dev->soc->total_layer;
 	unsigned int index;
 
@@ -63,7 +63,7 @@ static int fsl_dcu_drm_plane_atomic_check(struct drm_plane *plane,
 static void fsl_dcu_drm_plane_atomic_disable(struct drm_plane *plane,
 					     struct drm_atomic_state *state)
 {
-	struct fsl_dcu_drm_device *fsl_dev = plane->dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = plane->drm->dev_private;
 	unsigned int value;
 	int index;
 
@@ -80,7 +80,7 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_atomic_state *state)
 
 {
-	struct fsl_dcu_drm_device *fsl_dev = plane->dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = plane->drm->dev_private;
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct drm_framebuffer *fb = plane->state->fb;
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 42b54119c57b..a50dd4ec0085 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -71,12 +71,13 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 		return PTR_ERR(crtc_state);
 
 	if (src_w != new_plane_state->crtc_w || src_h != new_plane_state->crtc_h) {
-		drm_dbg_atomic(plane->dev, "scale not support\n");
+		drm_dbg_atomic(plane->drm, "scale not support\n");
 		return -EINVAL;
 	}
 
 	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0) {
-		drm_dbg_atomic(plane->dev, "crtc_x/y of drm_plane state is invalid\n");
+		drm_dbg_atomic(plane->drm,
+			       "crtc_x/y of drm_plane state is invalid\n");
 		return -EINVAL;
 	}
 
@@ -87,12 +88,14 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 	    crtc_state->adjusted_mode.hdisplay ||
 	    new_plane_state->crtc_y + new_plane_state->crtc_h >
 	    crtc_state->adjusted_mode.vdisplay) {
-		drm_dbg_atomic(plane->dev, "visible portion of plane is invalid\n");
+		drm_dbg_atomic(plane->drm,
+			       "visible portion of plane is invalid\n");
 		return -EINVAL;
 	}
 
 	if (new_plane_state->fb->pitches[0] % 128 != 0) {
-		drm_dbg_atomic(plane->dev, "wrong stride with 128-byte aligned\n");
+		drm_dbg_atomic(plane->drm,
+			       "wrong stride with 128-byte aligned\n");
 		return -EINVAL;
 	}
 	return 0;
@@ -106,7 +109,7 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 	u32 reg;
 	s64 gpu_addr = 0;
 	u32 line_l;
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(plane->dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(plane->drm);
 	struct drm_gem_vram_object *gbo;
 
 	if (!new_state->fb)
diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index be31ce8ebb10..45ff769b5561 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -134,7 +134,7 @@ static struct intel_fbc *i9xx_plane_fbc(struct drm_i915_private *dev_priv,
 
 static bool i9xx_plane_has_windowing(struct intel_plane *plane)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
 
 	if (IS_CHERRYVIEW(dev_priv))
@@ -152,7 +152,7 @@ static u32 i9xx_plane_ctl(const struct intel_crtc_state *crtc_state,
 			  const struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
+		to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
 	u32 dspcntr;
@@ -224,7 +224,7 @@ static u32 i9xx_plane_ctl(const struct intel_crtc_state *crtc_state,
 int i9xx_check_plane_surface(struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
+		to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	int src_x, src_y, src_w;
 	u32 offset;
@@ -418,7 +418,7 @@ static void i9xx_plane_update_noarm(struct intel_plane *plane,
 				    const struct intel_crtc_state *crtc_state,
 				    const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
 
 	intel_de_write_fw(dev_priv, DSPSTRIDE(i9xx_plane),
@@ -446,7 +446,7 @@ static void i9xx_plane_update_arm(struct intel_plane *plane,
 				  const struct intel_crtc_state *crtc_state,
 				  const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
 	int x = plane_state->view.color_plane[0].x;
 	int y = plane_state->view.color_plane[0].y;
@@ -516,7 +516,7 @@ static void i830_plane_update_arm(struct intel_plane *plane,
 static void i9xx_plane_disable_arm(struct intel_plane *plane,
 				   const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
 	u32 dspcntr;
 
@@ -546,7 +546,7 @@ g4x_primary_async_flip(struct intel_plane *plane,
 		       const struct intel_plane_state *plane_state,
 		       bool async_flip)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	u32 dspcntr = plane_state->ctl | i9xx_plane_ctl_crtc(crtc_state);
 	u32 dspaddr_offset = plane_state->view.color_plane[0].offset;
 	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
@@ -566,7 +566,7 @@ vlv_primary_async_flip(struct intel_plane *plane,
 		       const struct intel_plane_state *plane_state,
 		       bool async_flip)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	u32 dspaddr_offset = plane_state->view.color_plane[0].offset;
 	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
 
@@ -577,7 +577,7 @@ vlv_primary_async_flip(struct intel_plane *plane,
 static void
 bdw_primary_enable_flip_done(struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 
 	spin_lock_irq(&i915->irq_lock);
@@ -588,7 +588,7 @@ bdw_primary_enable_flip_done(struct intel_plane *plane)
 static void
 bdw_primary_disable_flip_done(struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 
 	spin_lock_irq(&i915->irq_lock);
@@ -599,7 +599,7 @@ bdw_primary_disable_flip_done(struct intel_plane *plane)
 static void
 ivb_primary_enable_flip_done(struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 
 	spin_lock_irq(&i915->irq_lock);
 	ilk_enable_display_irq(i915, DE_PLANE_FLIP_DONE_IVB(plane->i9xx_plane));
@@ -609,7 +609,7 @@ ivb_primary_enable_flip_done(struct intel_plane *plane)
 static void
 ivb_primary_disable_flip_done(struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 
 	spin_lock_irq(&i915->irq_lock);
 	ilk_disable_display_irq(i915, DE_PLANE_FLIP_DONE_IVB(plane->i9xx_plane));
@@ -619,7 +619,7 @@ ivb_primary_disable_flip_done(struct intel_plane *plane)
 static void
 ilk_primary_enable_flip_done(struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 
 	spin_lock_irq(&i915->irq_lock);
 	ilk_enable_display_irq(i915, DE_PLANE_FLIP_DONE(plane->i9xx_plane));
@@ -629,7 +629,7 @@ ilk_primary_enable_flip_done(struct intel_plane *plane)
 static void
 ilk_primary_disable_flip_done(struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 
 	spin_lock_irq(&i915->irq_lock);
 	ilk_disable_display_irq(i915, DE_PLANE_FLIP_DONE(plane->i9xx_plane));
@@ -639,7 +639,7 @@ ilk_primary_disable_flip_done(struct intel_plane *plane)
 static void
 vlv_primary_enable_flip_done(struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 
 	spin_lock_irq(&i915->irq_lock);
@@ -650,7 +650,7 @@ vlv_primary_enable_flip_done(struct intel_plane *plane)
 static void
 vlv_primary_disable_flip_done(struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 
 	spin_lock_irq(&i915->irq_lock);
@@ -661,7 +661,7 @@ vlv_primary_disable_flip_done(struct intel_plane *plane)
 static bool i9xx_plane_get_hw_state(struct intel_plane *plane,
 				    enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum intel_display_power_domain power_domain;
 	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
 	intel_wakeref_t wakeref;
@@ -739,7 +739,7 @@ i9xx_plane_max_stride(struct intel_plane *plane,
 		      u32 pixel_format, u64 modifier,
 		      unsigned int rotation)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 
 	if (DISPLAY_VER(dev_priv) >= 3) {
 		if (modifier == I915_FORMAT_MOD_X_TILED)
diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index 876ce49a3c75..65a20c42117d 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -875,7 +875,7 @@ static u16 g4x_compute_wm(const struct intel_crtc_state *crtc_state,
 			  int level)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct drm_display_mode *pipe_mode =
 		&crtc_state->hw.pipe_mode;
 	unsigned int latency = dev_priv->display.wm.pri_latency[level] * 10;
@@ -1402,7 +1402,7 @@ static u16 vlv_compute_wm_level(const struct intel_crtc_state *crtc_state,
 				int level)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct drm_display_mode *pipe_mode =
 		&crtc_state->hw.pipe_mode;
 	unsigned int pixel_rate, htotal, cpp, width, wm;
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index e66f45e25201..37c190ebaca5 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -132,8 +132,8 @@ intel_plane_destroy_state(struct drm_plane *plane,
 {
 	struct intel_plane_state *plane_state = to_intel_plane_state(state);
 
-	drm_WARN_ON(plane->dev, plane_state->ggtt_vma);
-	drm_WARN_ON(plane->dev, plane_state->dpt_vma);
+	drm_WARN_ON(plane->drm, plane_state->ggtt_vma);
+	drm_WARN_ON(plane->drm, plane_state->dpt_vma);
 
 	__drm_atomic_helper_plane_destroy_state(&plane_state->uapi);
 	if (plane_state->hw.fb)
@@ -197,7 +197,7 @@ static bool
 use_min_ddb(const struct intel_crtc_state *crtc_state,
 	    struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 
 	return DISPLAY_VER(i915) >= 13 &&
 	       crtc_state->uapi.async_flip &&
@@ -248,7 +248,7 @@ int intel_plane_calc_min_cdclk(struct intel_atomic_state *state,
 			       struct intel_plane *plane,
 			       bool *need_cdclk_calc)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct intel_plane_state *plane_state =
 		intel_atomic_get_new_plane_state(state, plane);
 	struct intel_crtc *crtc = to_intel_crtc(plane_state->hw.crtc);
@@ -409,7 +409,7 @@ static bool intel_plane_do_async_flip(struct intel_plane *plane,
 				      const struct intel_crtc_state *old_crtc_state,
 				      const struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 
 	if (!plane->async_flip)
 		return false;
@@ -894,7 +894,7 @@ int intel_atomic_plane_check_clipping(struct intel_plane_state *plane_state,
 				      int min_scale, int max_scale,
 				      bool can_position)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	struct drm_framebuffer *fb = plane_state->hw.fb;
 	struct drm_rect *src = &plane_state->uapi.src;
 	struct drm_rect *dst = &plane_state->uapi.dst;
@@ -943,7 +943,7 @@ int intel_atomic_plane_check_clipping(struct intel_plane_state *plane_state,
 
 int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	struct drm_rect *src = &plane_state->uapi.src;
 	u32 src_x, src_y, src_w, src_h, hsub, vsub;
@@ -1021,7 +1021,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		to_intel_plane_state(_new_plane_state);
 	struct intel_atomic_state *state =
 		to_intel_atomic_state(new_plane_state->uapi.state);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct intel_plane_state *old_plane_state =
 		intel_atomic_get_old_plane_state(state, plane);
 	struct drm_i915_gem_object *obj = intel_fb_obj(new_plane_state->hw.fb);
@@ -1131,7 +1131,7 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
 		to_intel_plane_state(_old_plane_state);
 	struct intel_atomic_state *state =
 		to_intel_atomic_state(old_plane_state->uapi.state);
-	struct drm_i915_private *dev_priv = to_i915(plane->dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->drm);
 	struct drm_i915_gem_object *obj = intel_fb_obj(old_plane_state->hw.fb);
 
 	if (!obj)
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 72b840e374e0..297dd85ffa01 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1901,7 +1901,7 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 static bool need_plane_update(struct intel_plane *plane,
 			      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 
 	/*
 	 * On pre-SKL the pipe gamma enable and pipe csc enable for
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index b3eb7c38acd9..4dea76f6cdad 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -133,7 +133,7 @@ const char *intel_output_format_name(enum intel_output_format format)
 static void intel_dump_plane_state(const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 
 	if (!fb) {
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index b095fd85717f..3fc172957090 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -31,7 +31,7 @@ static const u32 intel_cursor_formats[] = {
 static u32 intel_cursor_base(const struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
+		to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	const struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 	u32 base;
@@ -68,7 +68,7 @@ static u32 intel_cursor_position(const struct intel_plane_state *plane_state)
 static bool intel_cursor_size_ok(const struct intel_plane_state *plane_state)
 {
 	const struct drm_mode_config *config =
-		&plane_state->uapi.plane->dev->mode_config;
+		&plane_state->uapi.plane->drm->mode_config;
 	int width = drm_rect_width(&plane_state->uapi.dst);
 	int height = drm_rect_height(&plane_state->uapi.dst);
 
@@ -79,7 +79,7 @@ static bool intel_cursor_size_ok(const struct intel_plane_state *plane_state)
 static int intel_cursor_check_surface(struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
+		to_i915(plane_state->uapi.plane->drm);
 	unsigned int rotation = plane_state->hw.rotation;
 	int src_x, src_y;
 	u32 offset;
@@ -132,7 +132,7 @@ static int intel_check_cursor(struct intel_crtc_state *crtc_state,
 			      struct intel_plane_state *plane_state)
 {
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	const struct drm_rect src = plane_state->uapi.src;
 	const struct drm_rect dst = plane_state->uapi.dst;
 	int ret;
@@ -213,7 +213,7 @@ static int i845_check_cursor(struct intel_crtc_state *crtc_state,
 			     struct intel_plane_state *plane_state)
 {
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	int ret;
 
 	ret = intel_check_cursor(crtc_state, plane_state);
@@ -258,7 +258,7 @@ static void i845_cursor_update_arm(struct intel_plane *plane,
 				   const struct intel_crtc_state *crtc_state,
 				   const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	u32 cntl = 0, base = 0, pos = 0, size = 0;
 
 	if (plane_state && plane_state->uapi.visible) {
@@ -303,7 +303,7 @@ static void i845_cursor_disable_arm(struct intel_plane *plane,
 static bool i845_cursor_get_hw_state(struct intel_plane *plane,
 				     enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum intel_display_power_domain power_domain;
 	intel_wakeref_t wakeref;
 	bool ret;
@@ -327,7 +327,7 @@ i9xx_cursor_max_stride(struct intel_plane *plane,
 		       u32 pixel_format, u64 modifier,
 		       unsigned int rotation)
 {
-	return plane->base.dev->mode_config.cursor_width * 4;
+	return plane->base.drm->mode_config.cursor_width * 4;
 }
 
 static u32 i9xx_cursor_ctl_crtc(const struct intel_crtc_state *crtc_state)
@@ -355,7 +355,7 @@ static u32 i9xx_cursor_ctl(const struct intel_crtc_state *crtc_state,
 			   const struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
+		to_i915(plane_state->uapi.plane->drm);
 	u32 cntl = 0;
 
 	if (IS_SANDYBRIDGE(dev_priv) || IS_IVYBRIDGE(dev_priv))
@@ -389,7 +389,7 @@ static u32 i9xx_cursor_ctl(const struct intel_crtc_state *crtc_state,
 static bool i9xx_cursor_size_ok(const struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
+		to_i915(plane_state->uapi.plane->drm);
 	int width = drm_rect_width(&plane_state->uapi.dst);
 	int height = drm_rect_height(&plane_state->uapi.dst);
 
@@ -428,7 +428,7 @@ static int i9xx_check_cursor(struct intel_crtc_state *crtc_state,
 			     struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	enum pipe pipe = plane->pipe;
 	int ret;
@@ -489,7 +489,7 @@ static void i9xx_cursor_update_arm(struct intel_plane *plane,
 				   const struct intel_crtc_state *crtc_state,
 				   const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 	u32 cntl = 0, base = 0, pos = 0, fbc_ctl = 0;
 
@@ -564,7 +564,7 @@ static void i9xx_cursor_disable_arm(struct intel_plane *plane,
 static bool i9xx_cursor_get_hw_state(struct intel_plane *plane,
 				     enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum intel_display_power_domain power_domain;
 	intel_wakeref_t wakeref;
 	bool ret;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 0c8beaa8f638..63095107ff9c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -331,7 +331,7 @@ void assert_transcoder(struct drm_i915_private *dev_priv,
 
 static void assert_plane(struct intel_plane *plane, bool state)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	enum pipe pipe;
 	bool cur_state;
 
@@ -535,7 +535,7 @@ unsigned int intel_remapped_info_size(const struct intel_remapped_info *rem_info
 bool intel_plane_uses_fence(const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 
 	return DISPLAY_VER(dev_priv) < 4 ||
 		(plane->fbc &&
diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
index dd5008dcf2fb..236ed9d1a993 100644
--- a/drivers/gpu/drm/i915/display/intel_display_trace.h
+++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
@@ -308,9 +308,6 @@ TRACE_EVENT(vlv_fifo_size,
 		      __entry->sprite0_start, __entry->sprite1_start, __entry->fifo_size)
 );
 
-#undef __dev_name_kms
-#define __dev_name_kms(obj) dev_name((obj)->base.dev->dev)
-
 TRACE_EVENT(intel_plane_update_noarm,
 	    TP_PROTO(struct intel_plane *plane, struct intel_crtc *crtc),
 	    TP_ARGS(plane, crtc),
@@ -411,7 +408,7 @@ TRACE_EVENT(intel_fbc_activate,
 			     ),
 
 	    TP_fast_assign(
-			   struct intel_crtc *crtc = intel_crtc_for_pipe(to_i915(plane->base.dev),
+			   struct intel_crtc *crtc = intel_crtc_for_pipe(to_i915(plane->base.drm),
 									 plane->pipe);
 			   __assign_str(dev, __dev_name_kms(plane));
 			   __assign_str(name, plane->base.name)
@@ -438,7 +435,7 @@ TRACE_EVENT(intel_fbc_deactivate,
 			     ),
 
 	    TP_fast_assign(
-			   struct intel_crtc *crtc = intel_crtc_for_pipe(to_i915(plane->base.dev),
+			   struct intel_crtc *crtc = intel_crtc_for_pipe(to_i915(plane->base.drm),
 									 plane->pipe);
 			   __assign_str(dev, __dev_name_kms(plane));
 			   __assign_str(name, plane->base.name)
@@ -465,7 +462,7 @@ TRACE_EVENT(intel_fbc_nuke,
 			     ),
 
 	    TP_fast_assign(
-			   struct intel_crtc *crtc = intel_crtc_for_pipe(to_i915(plane->base.dev),
+			   struct intel_crtc *crtc = intel_crtc_for_pipe(to_i915(plane->base.drm),
 									 plane->pipe);
 			   __assign_str(dev, __dev_name_kms(plane));
 			   __assign_str(name, plane->base.name)
@@ -479,9 +476,6 @@ TRACE_EVENT(intel_fbc_nuke,
 		      __entry->frame, __entry->scanline)
 );
 
-#undef __dev_name_kms
-#define __dev_name_kms(obj) dev_name((obj)->base.drm->dev)
-
 TRACE_EVENT(intel_crtc_vblank_work_start,
 	    TP_PROTO(struct intel_crtc *crtc),
 	    TP_ARGS(crtc),
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index e870a46ce12a..353b9231e2ac 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1073,7 +1073,7 @@ u32 intel_plane_compute_aligned_offset(int *x, int *y,
 				       int color_plane)
 {
 	struct intel_plane *intel_plane = to_intel_plane(state->uapi.plane);
-	struct drm_i915_private *i915 = to_i915(intel_plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_plane->base.drm);
 	const struct drm_framebuffer *fb = state->hw.fb;
 	unsigned int rotation = state->hw.rotation;
 	int pitch = state->view.color_plane[color_plane].mapping_stride;
@@ -1189,7 +1189,7 @@ static int intel_fb_check_ccs_xy(const struct drm_framebuffer *fb, int ccs_plane
 static bool intel_plane_can_remap(const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	int i;
 
@@ -1666,7 +1666,7 @@ int intel_fill_fb_info(struct drm_i915_private *i915, struct intel_framebuffer *
 static void intel_plane_remap_gtt(struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *i915 =
-		to_i915(plane_state->uapi.plane->dev);
+		to_i915(plane_state->uapi.plane->drm);
 	struct drm_framebuffer *fb = plane_state->hw.fb;
 	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
 	unsigned int rotation = plane_state->hw.rotation;
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index bee4ee229182..50a351e064e9 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -238,7 +238,7 @@ void intel_unpin_fb_vma(struct i915_vma *vma, unsigned long flags)
 int intel_plane_pin_fb(struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	struct drm_framebuffer *fb = plane_state->hw.fb;
 	struct i915_vma *vma;
 	bool phys_cursor =
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 851654891e19..6c1428da5519 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -145,7 +145,7 @@ static unsigned int _intel_fbc_cfb_stride(const struct intel_plane_state *plane_
 /* minimum acceptable cfb stride in bytes, assuming 1:1 compression limit */
 static unsigned int skl_fbc_min_cfb_stride(const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	unsigned int limit = 4; /* 1:4 compression limit is the worst case */
 	unsigned int cpp = 4; /* FBC always 4 bytes per pixel */
 	unsigned int width = drm_rect_width(&plane_state->uapi.src) >> 16;
@@ -175,7 +175,7 @@ static unsigned int skl_fbc_min_cfb_stride(const struct intel_plane_state *plane
 /* properly aligned cfb stride in bytes, assuming 1:1 compression limit */
 static unsigned int intel_fbc_cfb_stride(const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	unsigned int stride = _intel_fbc_cfb_stride(plane_state);
 
 	/*
@@ -191,7 +191,7 @@ static unsigned int intel_fbc_cfb_stride(const struct intel_plane_state *plane_s
 
 static unsigned int intel_fbc_cfb_size(const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	int lines = drm_rect_height(&plane_state->uapi.src) >> 16;
 
 	if (DISPLAY_VER(i915) == 7)
@@ -204,7 +204,7 @@ static unsigned int intel_fbc_cfb_size(const struct intel_plane_state *plane_sta
 
 static u16 intel_fbc_override_cfb_stride(const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	unsigned int stride_aligned = intel_fbc_cfb_stride(plane_state);
 	unsigned int stride = _intel_fbc_cfb_stride(plane_state);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
@@ -847,7 +847,7 @@ void intel_fbc_cleanup(struct drm_i915_private *i915)
 
 static bool stride_is_valid(const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int stride = intel_fbc_plane_stride(plane_state) *
 		fb->format->cpp[0];
@@ -879,7 +879,7 @@ static bool stride_is_valid(const struct intel_plane_state *plane_state)
 
 static bool pixel_format_is_valid(const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 
 	switch (fb->format->format) {
@@ -902,7 +902,7 @@ static bool pixel_format_is_valid(const struct intel_plane_state *plane_state)
 
 static bool rotation_is_valid(const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
 
@@ -924,7 +924,7 @@ static bool rotation_is_valid(const struct intel_plane_state *plane_state)
  */
 static bool intel_fbc_hw_tracking_covers_screen(const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	unsigned int effective_w, effective_h, max_w, max_h;
 
 	if (DISPLAY_VER(i915) >= 10) {
@@ -951,7 +951,7 @@ static bool intel_fbc_hw_tracking_covers_screen(const struct intel_plane_state *
 
 static bool tiling_is_valid(const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 
 	switch (fb->modifier) {
@@ -1005,7 +1005,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 
 static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 
 	/*
 	 * The use of a CPU fence is one of two ways to detect writes by the
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 2f60e3cc26e6..5a4fa3abc552 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1657,7 +1657,7 @@ static void psr_force_hw_tracking_exit(struct intel_dp *intel_dp)
 void intel_psr2_disable_plane_sel_fetch_arm(struct intel_plane *plane,
 					    const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 
 	if (!crtc_state->enable_psr2_sel_fetch)
@@ -1670,7 +1670,7 @@ void intel_psr2_program_plane_sel_fetch_arm(struct intel_plane *plane,
 					    const struct intel_crtc_state *crtc_state,
 					    const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 
 	if (!crtc_state->enable_psr2_sel_fetch)
@@ -1689,7 +1689,7 @@ void intel_psr2_program_plane_sel_fetch_noarm(struct intel_plane *plane,
 					      const struct intel_plane_state *plane_state,
 					      int color_plane)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 	const struct drm_rect *clip;
 	u32 val;
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 25034bbf1445..109b17620079 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -61,7 +61,7 @@ static void
 chv_sprite_update_csc(const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	enum plane_id plane_id = plane->id;
 	/*
@@ -133,7 +133,7 @@ static void
 vlv_sprite_update_clrc(const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	enum pipe pipe = plane->pipe;
 	enum plane_id plane_id = plane->id;
@@ -336,7 +336,7 @@ static u32 vlv_sprite_ctl(const struct intel_crtc_state *crtc_state,
 static void vlv_sprite_update_gamma(const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	enum pipe pipe = plane->pipe;
 	enum plane_id plane_id = plane->id;
@@ -361,7 +361,7 @@ vlv_sprite_update_noarm(struct intel_plane *plane,
 			const struct intel_crtc_state *crtc_state,
 			const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 	enum plane_id plane_id = plane->id;
 	int crtc_x = plane_state->uapi.dst.x1;
@@ -382,7 +382,7 @@ vlv_sprite_update_arm(struct intel_plane *plane,
 		      const struct intel_crtc_state *crtc_state,
 		      const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 	enum plane_id plane_id = plane->id;
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
@@ -430,7 +430,7 @@ static void
 vlv_sprite_disable_arm(struct intel_plane *plane,
 		       const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 	enum plane_id plane_id = plane->id;
 
@@ -442,7 +442,7 @@ static bool
 vlv_sprite_get_hw_state(struct intel_plane *plane,
 			enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum intel_display_power_domain power_domain;
 	enum plane_id plane_id = plane->id;
 	intel_wakeref_t wakeref;
@@ -636,7 +636,7 @@ static u32 ivb_sprite_ctl_crtc(const struct intel_crtc_state *crtc_state)
 static bool ivb_need_sprite_gamma(const struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
+		to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 
 	return fb->format->cpp[0] == 8 &&
@@ -647,7 +647,7 @@ static u32 ivb_sprite_ctl(const struct intel_crtc_state *crtc_state,
 			  const struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
+		to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
@@ -745,7 +745,7 @@ static void ivb_sprite_linear_gamma(const struct intel_plane_state *plane_state,
 static void ivb_sprite_update_gamma(const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 	u16 gamma[18];
 	int i;
@@ -776,7 +776,7 @@ ivb_sprite_update_noarm(struct intel_plane *plane,
 			const struct intel_crtc_state *crtc_state,
 			const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 	int crtc_x = plane_state->uapi.dst.x1;
 	int crtc_y = plane_state->uapi.dst.y1;
@@ -806,7 +806,7 @@ ivb_sprite_update_arm(struct intel_plane *plane,
 		      const struct intel_crtc_state *crtc_state,
 		      const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
 	u32 sprsurf_offset = plane_state->view.color_plane[0].offset;
@@ -852,7 +852,7 @@ static void
 ivb_sprite_disable_arm(struct intel_plane *plane,
 		       const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 
 	intel_de_write_fw(dev_priv, SPRCTL(pipe), 0);
@@ -866,7 +866,7 @@ static bool
 ivb_sprite_get_hw_state(struct intel_plane *plane,
 			enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum intel_display_power_domain power_domain;
 	intel_wakeref_t wakeref;
 	bool ret;
@@ -975,7 +975,7 @@ static u32 g4x_sprite_ctl(const struct intel_crtc_state *crtc_state,
 			  const struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
+		to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
@@ -1045,7 +1045,7 @@ static u32 g4x_sprite_ctl(const struct intel_crtc_state *crtc_state,
 static void g4x_sprite_update_gamma(const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	enum pipe pipe = plane->pipe;
 	u16 gamma[8];
@@ -1075,7 +1075,7 @@ static void ilk_sprite_linear_gamma(u16 gamma[17])
 static void ilk_sprite_update_gamma(const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	enum pipe pipe = plane->pipe;
 	u16 gamma[17];
@@ -1103,7 +1103,7 @@ g4x_sprite_update_noarm(struct intel_plane *plane,
 			const struct intel_crtc_state *crtc_state,
 			const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 	int crtc_x = plane_state->uapi.dst.x1;
 	int crtc_y = plane_state->uapi.dst.y1;
@@ -1132,7 +1132,7 @@ g4x_sprite_update_arm(struct intel_plane *plane,
 		      const struct intel_crtc_state *crtc_state,
 		      const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
 	u32 dvssurf_offset = plane_state->view.color_plane[0].offset;
@@ -1174,7 +1174,7 @@ static void
 g4x_sprite_disable_arm(struct intel_plane *plane,
 		       const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 
 	intel_de_write_fw(dev_priv, DVSCNTR(pipe), 0);
@@ -1187,7 +1187,7 @@ static bool
 g4x_sprite_get_hw_state(struct intel_plane *plane,
 			enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum intel_display_power_domain power_domain;
 	intel_wakeref_t wakeref;
 	bool ret;
@@ -1227,7 +1227,7 @@ static int
 g4x_sprite_check_scaling(struct intel_crtc_state *crtc_state,
 			 struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	const struct drm_rect *src = &plane_state->uapi.src;
 	const struct drm_rect *dst = &plane_state->uapi.dst;
@@ -1290,7 +1290,7 @@ g4x_sprite_check(struct intel_crtc_state *crtc_state,
 		 struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	int min_scale = DRM_PLANE_NO_SCALING;
 	int max_scale = DRM_PLANE_NO_SCALING;
 	int ret;
@@ -1336,7 +1336,7 @@ g4x_sprite_check(struct intel_crtc_state *crtc_state,
 int chv_plane_check_rotation(const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	unsigned int rotation = plane_state->hw.rotation;
 
 	/* CHV ignores the mirror bit when the rotate bit is set :( */
diff --git a/drivers/gpu/drm/i915/display/intel_sprite_uapi.c b/drivers/gpu/drm/i915/display/intel_sprite_uapi.c
index a76b48ebc2d3..bcffad2e17ec 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite_uapi.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite_uapi.c
@@ -17,7 +17,7 @@ static void intel_plane_set_ckey(struct intel_plane_state *plane_state,
 				 const struct drm_intel_sprite_colorkey *set)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
 
 	*key = *set;
@@ -80,7 +80,7 @@ int intel_sprite_set_colorkey_ioctl(struct drm_device *dev, void *data,
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	state = drm_atomic_state_alloc(plane->dev);
+	state = drm_atomic_state_alloc(plane->drm);
 	if (!state) {
 		ret = -ENOMEM;
 		goto out;
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 0d6c26d4453d..e8f808846ea4 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -269,7 +269,7 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
 {
 	struct intel_plane *intel_plane =
 		to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(intel_plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_plane->base.drm);
 	struct drm_framebuffer *fb = plane_state->hw.fb;
 	int ret;
 	bool force_detach = !fb || !plane_state->uapi.visible;
@@ -764,7 +764,7 @@ skl_program_plane_scaler(struct intel_plane *plane,
 			 const struct intel_crtc_state *crtc_state,
 			 const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	enum pipe pipe = plane->pipe;
 	int scaler_id = plane_state->scaler_id;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 5c02b9b805e2..1ff7f870df21 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -463,7 +463,7 @@ skl_plane_max_stride(struct intel_plane *plane,
 		     u32 pixel_format, u64 modifier,
 		     unsigned int rotation)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	const struct drm_format_info *info = drm_format_info(pixel_format);
 	int cpp = info->cpp[0];
 	int max_horizontal_pixels = 8192;
@@ -515,7 +515,7 @@ icl_program_input_csc(struct intel_plane *plane,
 		      const struct intel_crtc_state *crtc_state,
 		      const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 	enum plane_id plane_id = plane->id;
 
@@ -618,7 +618,7 @@ static void
 skl_plane_disable_arm(struct intel_plane *plane,
 		      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum plane_id plane_id = plane->id;
 	enum pipe pipe = plane->pipe;
 
@@ -632,7 +632,7 @@ static void
 icl_plane_disable_arm(struct intel_plane *plane,
 		      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum plane_id plane_id = plane->id;
 	enum pipe pipe = plane->pipe;
 
@@ -650,7 +650,7 @@ static bool
 skl_plane_get_hw_state(struct intel_plane *plane,
 		       enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum intel_display_power_domain power_domain;
 	enum plane_id plane_id = plane->id;
 	intel_wakeref_t wakeref;
@@ -898,7 +898,7 @@ static u32 skl_plane_ctl(const struct intel_crtc_state *crtc_state,
 			 const struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
+		to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
@@ -958,7 +958,7 @@ static u32 glk_plane_color_ctl(const struct intel_crtc_state *crtc_state,
 			       const struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
+		to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	u32 plane_color_ctl = 0;
@@ -996,7 +996,7 @@ static u32 glk_plane_color_ctl(const struct intel_crtc_state *crtc_state,
 static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 			    int color_plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	u32 offset = plane_state->view.color_plane[color_plane].offset;
 
@@ -1031,7 +1031,7 @@ static u32 skl_plane_surf(const struct intel_plane_state *plane_state,
 static u32 skl_plane_aux_dist(const struct intel_plane_state *plane_state,
 			      int color_plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	int aux_plane = skl_main_to_aux_plane(fb, color_plane);
 	u32 aux_dist;
@@ -1078,7 +1078,7 @@ static u32 skl_plane_keymsk(const struct intel_plane_state *plane_state)
 
 static void icl_plane_csc_load_black(struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	enum plane_id plane_id = plane->id;
 	enum pipe pipe = plane->pipe;
 
@@ -1114,7 +1114,7 @@ skl_plane_update_noarm(struct intel_plane *plane,
 		       const struct intel_crtc_state *crtc_state,
 		       const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum plane_id plane_id = plane->id;
 	enum pipe pipe = plane->pipe;
 	u32 stride = skl_plane_stride(plane_state, 0);
@@ -1144,7 +1144,7 @@ skl_plane_update_arm(struct intel_plane *plane,
 		     const struct intel_crtc_state *crtc_state,
 		     const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum plane_id plane_id = plane->id;
 	enum pipe pipe = plane->pipe;
 	u32 x = plane_state->view.color_plane[0].x;
@@ -1200,7 +1200,7 @@ icl_plane_update_noarm(struct intel_plane *plane,
 		       const struct intel_crtc_state *crtc_state,
 		       const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum plane_id plane_id = plane->id;
 	enum pipe pipe = plane->pipe;
 	int color_plane = icl_plane_color_plane(plane_state);
@@ -1275,7 +1275,7 @@ icl_plane_update_arm(struct intel_plane *plane,
 		     const struct intel_crtc_state *crtc_state,
 		     const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum plane_id plane_id = plane->id;
 	enum pipe pipe = plane->pipe;
 	int color_plane = icl_plane_color_plane(plane_state);
@@ -1312,7 +1312,7 @@ skl_plane_async_flip(struct intel_plane *plane,
 		     const struct intel_plane_state *plane_state,
 		     bool async_flip)
 {
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	enum plane_id plane_id = plane->id;
 	enum pipe pipe = plane->pipe;
 	u32 plane_ctl = plane_state->ctl;
@@ -1343,7 +1343,7 @@ static int skl_plane_check_fb(const struct intel_crtc_state *crtc_state,
 			      const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
 
@@ -1426,7 +1426,7 @@ static int skl_plane_check_dst_coordinates(const struct intel_crtc_state *crtc_s
 					   const struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(plane_state->uapi.plane->dev);
+		to_i915(plane_state->uapi.plane->drm);
 	int crtc_x = plane_state->uapi.dst.x1;
 	int crtc_w = drm_rect_width(&plane_state->uapi.dst);
 	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
@@ -1455,7 +1455,7 @@ static int skl_plane_check_dst_coordinates(const struct intel_crtc_state *crtc_s
 
 static int skl_plane_check_nv12_rotation(const struct intel_plane_state *plane_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
+	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
 	int src_w = drm_rect_width(&plane_state->uapi.src) >> 16;
@@ -1571,7 +1571,7 @@ int skl_calc_main_surface_offset(const struct intel_plane_state *plane_state,
 				 int *x, int *y, u32 *offset)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	const int aux_plane = skl_main_to_aux_plane(fb, 0);
 	const u32 aux_offset = plane_state->view.color_plane[aux_plane].offset;
@@ -1621,7 +1621,7 @@ int skl_calc_main_surface_offset(const struct intel_plane_state *plane_state,
 static int skl_check_main_surface(struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	const unsigned int rotation = plane_state->hw.rotation;
 	int x = plane_state->uapi.src.x1 >> 16;
@@ -1692,7 +1692,7 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
 static int skl_check_nv12_aux_surface(struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
 	int uv_plane = 1;
@@ -1869,7 +1869,7 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
 			   struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.drm);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	int min_scale = DRM_PLANE_NO_SCALING;
 	int max_scale = DRM_PLANE_NO_SCALING;
@@ -2146,7 +2146,7 @@ static const struct drm_plane_funcs gen12_plane_funcs = {
 static void
 skl_plane_enable_flip_done(struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 
 	spin_lock_irq(&i915->irq_lock);
@@ -2157,7 +2157,7 @@ skl_plane_enable_flip_done(struct intel_plane *plane)
 static void
 skl_plane_disable_flip_done(struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	enum pipe pipe = plane->pipe;
 
 	spin_lock_irq(&i915->irq_lock);
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index ecbf118ed0b0..76edd8fd0dc8 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -1351,7 +1351,7 @@ static bool
 use_minimal_wm0_only(const struct intel_crtc_state *crtc_state,
 		     struct intel_plane *plane)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 
 	return DISPLAY_VER(i915) >= 13 &&
 	       crtc_state->uapi.async_flip &&
@@ -2167,7 +2167,7 @@ static int icl_build_plane_wm(struct intel_crtc_state *crtc_state,
 			      const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	enum plane_id plane_id = plane->id;
 	struct skl_plane_wm *wm = &crtc_state->wm.skl.raw.planes[plane_id];
 	int ret;
@@ -2379,7 +2379,7 @@ static void skl_write_wm_level(struct drm_i915_private *i915,
 void skl_write_plane_wm(struct intel_plane *plane,
 			const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	enum plane_id plane_id = plane->id;
 	enum pipe pipe = plane->pipe;
 	const struct skl_pipe_wm *pipe_wm = &crtc_state->wm.skl.optimal;
@@ -2416,7 +2416,7 @@ void skl_write_plane_wm(struct intel_plane *plane,
 void skl_write_cursor_wm(struct intel_plane *plane,
 			 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	enum plane_id plane_id = plane->id;
 	enum pipe pipe = plane->pipe;
 	const struct skl_pipe_wm *pipe_wm = &crtc_state->wm.skl.optimal;
@@ -2807,7 +2807,7 @@ static bool skl_plane_selected_wm_equals(struct intel_plane *plane,
 					 const struct skl_pipe_wm *old_pipe_wm,
 					 const struct skl_pipe_wm *new_pipe_wm)
 {
-	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	struct drm_i915_private *i915 = to_i915(plane->base.drm);
 	int level;
 
 	for (level = 0; level < i915->display.wm.num_levels; level++) {
diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index ab6d32bad756..a3c6eabb8a2f 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -144,7 +144,7 @@ static int dcss_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct dcss_plane *dcss_plane = to_dcss_plane(plane);
-	struct dcss_dev *dcss = plane->dev->dev_private;
+	struct dcss_dev *dcss = plane->drm->dev_private;
 	struct drm_framebuffer *fb = new_plane_state->fb;
 	bool is_primary_plane = plane->type == DRM_PLANE_TYPE_PRIMARY;
 	struct drm_gem_dma_object *dma_obj;
@@ -215,7 +215,7 @@ static void dcss_plane_atomic_set_base(struct dcss_plane *dcss_plane)
 {
 	struct drm_plane *plane = &dcss_plane->base;
 	struct drm_plane_state *state = plane->state;
-	struct dcss_dev *dcss = plane->dev->dev_private;
+	struct dcss_dev *dcss = plane->drm->dev_private;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
 	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
@@ -273,7 +273,7 @@ static void dcss_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct dcss_plane *dcss_plane = to_dcss_plane(plane);
-	struct dcss_dev *dcss = plane->dev->dev_private;
+	struct dcss_dev *dcss = plane->drm->dev_private;
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_crtc_state *crtc_state;
 	bool modifiers_present;
@@ -354,7 +354,7 @@ static void dcss_plane_atomic_disable(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
 	struct dcss_plane *dcss_plane = to_dcss_plane(plane);
-	struct dcss_dev *dcss = plane->dev->dev_private;
+	struct dcss_dev *dcss = plane->drm->dev_private;
 
 	dcss_dpr_enable(dcss->dpr, dcss_plane->ch_num, false);
 	dcss_scaler_ch_enable(dcss->scaler, dcss_plane->ch_num, false);
diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index 80142d9a4a55..e5b501e30585 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -371,7 +371,7 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
 	struct drm_crtc_state *crtc_state;
-	struct device *dev = plane->dev->dev;
+	struct device *dev = plane->drm->dev;
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_framebuffer *old_fb = old_state->fb;
 	unsigned long eba, ubo, vbo, old_ubo, old_vbo, alpha_eba;
@@ -716,7 +716,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		ipu_cpmem_set_yuv_planar_full(ipu_plane->ipu_ch,
 					      fb->pitches[1], ubo, vbo);
 
-		dev_dbg(ipu_plane->base.dev->dev,
+		dev_dbg(ipu_plane->base.drm->dev,
 			"phy = %lu %lu %lu, x = %d, y = %d", eba, ubo, vbo,
 			new_state->src.x1 >> 16, new_state->src.y1 >> 16);
 		break;
@@ -727,7 +727,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		ipu_cpmem_set_yuv_planar_full(ipu_plane->ipu_ch,
 					      fb->pitches[1], ubo, ubo);
 
-		dev_dbg(ipu_plane->base.dev->dev,
+		dev_dbg(ipu_plane->base.drm->dev,
 			"phy = %lu %lu, x = %d, y = %d", eba, ubo,
 			new_state->src.x1 >> 16, new_state->src.y1 >> 16);
 		break;
@@ -740,7 +740,8 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		alpha_eba = drm_plane_state_to_eba(new_state, 1);
 		num_bursts = 0;
 
-		dev_dbg(ipu_plane->base.dev->dev, "phys = %lu %lu, x = %d, y = %d",
+		dev_dbg(ipu_plane->base.drm->dev,
+			"phys = %lu %lu, x = %d, y = %d",
 			eba, alpha_eba, new_state->src.x1 >> 16,
 			new_state->src.y1 >> 16);
 
@@ -758,7 +759,8 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		ipu_cpmem_set_buffer(ipu_plane->alpha_ch, 1, alpha_eba);
 		break;
 	default:
-		dev_dbg(ipu_plane->base.dev->dev, "phys = %lu, x = %d, y = %d",
+		dev_dbg(ipu_plane->base.drm->dev,
+			"phys = %lu, x = %d, y = %d",
 			eba, new_state->src.x1 >> 16, new_state->src.y1 >> 16);
 		break;
 	}
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index c8b4b988e20b..25461cda2cc7 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -458,7 +458,7 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 										 plane);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
+	struct ingenic_drm *priv = drm_device_get_priv(plane->drm);
 	struct ingenic_drm_private_state *priv_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc = new_plane_state->crtc ?: old_plane_state->crtc;
@@ -552,7 +552,7 @@ void ingenic_drm_plane_disable(struct device *dev, struct drm_plane *plane)
 static void ingenic_drm_plane_atomic_disable(struct drm_plane *plane,
 					     struct drm_atomic_state *state)
 {
-	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
+	struct ingenic_drm *priv = drm_device_get_priv(plane->drm);
 
 	ingenic_drm_plane_disable(priv->dev, plane);
 }
@@ -656,7 +656,7 @@ static void ingenic_drm_update_palette(struct ingenic_drm *priv,
 static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_atomic_state *state)
 {
-	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
+	struct ingenic_drm *priv = drm_device_get_priv(plane->drm);
 	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state, plane);
 	unsigned int width, height, cpp, next_id, plane_id;
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9e0562aa2bcb..e4590d4b6745 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -72,7 +72,7 @@ static unsigned int check_pixel_format(struct drm_plane *plane, u32 format)
 	int plane_id = kmb_plane->id;
 	struct disp_cfg init_disp_cfg;
 
-	kmb = to_kmb(plane->dev);
+	kmb = to_kmb(plane->drm);
 	init_disp_cfg = kmb->init_disp_cfg[plane_id];
 	/* Due to HW limitations, changing pixel format after initial
 	 * plane configuration is not supported.
@@ -102,7 +102,7 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 	struct drm_crtc_state *crtc_state;
 	bool can_position;
 
-	kmb = to_kmb(plane->dev);
+	kmb = to_kmb(plane->drm);
 	init_disp_cfg = kmb->init_disp_cfg[plane_id];
 	fb = new_plane_state->fb;
 	if (!fb || !new_plane_state->crtc)
@@ -145,7 +145,7 @@ static void kmb_plane_atomic_disable(struct drm_plane *plane,
 	int plane_id = kmb_plane->id;
 	struct kmb_drm_private *kmb;
 
-	kmb = to_kmb(plane->dev);
+	kmb = to_kmb(plane->drm);
 
 	if (WARN_ON(plane_id >= KMB_MAX_PLANES))
 		return;
@@ -369,7 +369,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	num_planes = fb->format->num_planes;
 	kmb_plane = to_kmb_plane(plane);
 
-	kmb = to_kmb(plane->dev);
+	kmb = to_kmb(plane->drm);
 	plane_id = kmb_plane->id;
 
 	spin_lock_irq(&kmb->irq_lock);
diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index 464000aea765..966dc5e74f9a 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -83,7 +83,7 @@ static bool logicvc_layer_format_inverted(uint32_t format)
 static int logicvc_plane_atomic_check(struct drm_plane *drm_plane,
 				      struct drm_atomic_state *state)
 {
-	struct drm_device *drm_dev = drm_plane->dev;
+	struct drm_device *drm_dev = drm_plane->drm;
 	struct logicvc_layer *layer = logicvc_layer(drm_plane);
 	struct logicvc_drm *logicvc = logicvc_drm(drm_dev);
 	struct drm_plane_state *new_state =
@@ -138,7 +138,7 @@ static void logicvc_plane_atomic_update(struct drm_plane *drm_plane,
 					struct drm_atomic_state *state)
 {
 	struct logicvc_layer *layer = logicvc_layer(drm_plane);
-	struct logicvc_drm *logicvc = logicvc_drm(drm_plane->dev);
+	struct logicvc_drm *logicvc = logicvc_drm(drm_plane->drm);
 	struct drm_device *drm_dev = &logicvc->drm_dev;
 	struct drm_plane_state *new_state =
 		drm_atomic_get_new_plane_state(state, drm_plane);
@@ -235,7 +235,7 @@ static void logicvc_plane_atomic_disable(struct drm_plane *drm_plane,
 					 struct drm_atomic_state *state)
 {
 	struct logicvc_layer *layer = logicvc_layer(drm_plane);
-	struct logicvc_drm *logicvc = logicvc_drm(drm_plane->dev);
+	struct logicvc_drm *logicvc = logicvc_drm(drm_plane->drm);
 	u32 index = layer->index;
 
 	regmap_write(logicvc->regmap, LOGICVC_LAYER_CTRL_REG(index), 0);
diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
index bd8a27106d16..b333e376e0a8 100644
--- a/drivers/gpu/drm/loongson/lsdc_plane.c
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -94,7 +94,7 @@ static void lsdc_primary_atomic_disable(struct drm_plane *plane,
 	 * Writing the format as LSDC_PF_NONE can disable the primary,
 	 * But it seems not necessary...
 	 */
-	drm_dbg(plane->dev, "%s disabled\n", plane->name);
+	drm_dbg(plane->drm, "%s disabled\n", plane->name);
 }
 
 static int lsdc_plane_prepare_fb(struct drm_plane *plane,
@@ -112,7 +112,7 @@ static int lsdc_plane_prepare_fb(struct drm_plane *plane,
 
 	ret = lsdc_bo_reserve(lbo);
 	if (unlikely(ret)) {
-		drm_err(plane->dev, "bo %p reserve failed\n", lbo);
+		drm_err(plane->drm, "bo %p reserve failed\n", lbo);
 		return ret;
 	}
 
@@ -121,14 +121,14 @@ static int lsdc_plane_prepare_fb(struct drm_plane *plane,
 	lsdc_bo_unreserve(lbo);
 
 	if (unlikely(ret)) {
-		drm_err(plane->dev, "bo %p pin failed\n", lbo);
+		drm_err(plane->drm, "bo %p pin failed\n", lbo);
 		return ret;
 	}
 
 	lsdc_bo_ref(lbo);
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR)
-		drm_dbg(plane->dev,
+		drm_dbg(plane->drm,
 			"%s[%p] pin at 0x%llx, bo size: %zu\n",
 			plane->name, lbo, gpu_vaddr, lsdc_bo_size(lbo));
 
@@ -149,7 +149,7 @@ static void lsdc_plane_cleanup_fb(struct drm_plane *plane,
 
 	ret = lsdc_bo_reserve(lbo);
 	if (unlikely(ret)) {
-		drm_err(plane->dev, "%p reserve failed\n", lbo);
+		drm_err(plane->drm, "%p reserve failed\n", lbo);
 		return;
 	}
 
@@ -160,7 +160,7 @@ static void lsdc_plane_cleanup_fb(struct drm_plane *plane,
 	lsdc_bo_unref(lbo);
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR)
-		drm_dbg(plane->dev, "%s unpin\n", plane->name);
+		drm_dbg(plane->drm, "%s unpin\n", plane->name);
 }
 
 static const struct drm_plane_helper_funcs lsdc_primary_helper_funcs = {
@@ -180,18 +180,18 @@ static int lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
 	new_state = drm_atomic_get_new_plane_state(state, plane);
 
 	if (!plane->state || !plane->state->fb) {
-		drm_dbg(plane->dev, "%s: state is NULL\n", plane->name);
+		drm_dbg(plane->drm, "%s: state is NULL\n", plane->name);
 		return -EINVAL;
 	}
 
 	if (new_state->crtc_w != new_state->crtc_h) {
-		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
+		drm_dbg(plane->drm, "unsupported cursor size: %ux%u\n",
 			new_state->crtc_w, new_state->crtc_h);
 		return -EINVAL;
 	}
 
 	if (new_state->crtc_w != 64 && new_state->crtc_w != 32) {
-		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
+		drm_dbg(plane->drm, "unsupported cursor size: %ux%u\n",
 			new_state->crtc_w, new_state->crtc_h);
 		return -EINVAL;
 	}
@@ -200,7 +200,7 @@ static int lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
 		crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
 	} else {
 		crtc_state = plane->crtc->state;
-		drm_dbg(plane->dev, "%s: atomic state is NULL\n", plane->name);
+		drm_dbg(plane->drm, "%s: atomic state is NULL\n", plane->name);
 	}
 
 	if (!crtc_state->active)
@@ -283,12 +283,12 @@ static int ls7a1000_cursor_plane_atomic_check(struct drm_plane *plane,
 
 	crtc = new_plane_state->crtc;
 	if (!crtc) {
-		drm_dbg(plane->dev, "%s is not bind to a crtc\n", plane->name);
+		drm_dbg(plane->drm, "%s is not bind to a crtc\n", plane->name);
 		return 0;
 	}
 
 	if (new_plane_state->crtc_w != 32 || new_plane_state->crtc_h != 32) {
-		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
+		drm_dbg(plane->drm, "unsupported cursor size: %ux%u\n",
 			new_plane_state->crtc_w, new_plane_state->crtc_h);
 		return -EINVAL;
 	}
@@ -356,18 +356,18 @@ static int ls7a2000_cursor_plane_atomic_check(struct drm_plane *plane,
 
 	crtc = new_plane_state->crtc;
 	if (!crtc) {
-		drm_dbg(plane->dev, "%s is not bind to a crtc\n", plane->name);
+		drm_dbg(plane->drm, "%s is not bind to a crtc\n", plane->name);
 		return 0;
 	}
 
 	if (new_plane_state->crtc_w != new_plane_state->crtc_h) {
-		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
+		drm_dbg(plane->drm, "unsupported cursor size: %ux%u\n",
 			new_plane_state->crtc_w, new_plane_state->crtc_h);
 		return -EINVAL;
 	}
 
 	if (new_plane_state->crtc_w != 64 && new_plane_state->crtc_w != 32) {
-		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
+		drm_dbg(plane->drm, "unsupported cursor size: %ux%u\n",
 			new_plane_state->crtc_w, new_plane_state->crtc_h);
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index f3c089b183eb..64a842e075db 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -493,7 +493,7 @@ int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
 void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_plane_state *plane_state = plane->state;
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(old_state, plane);
@@ -515,7 +515,7 @@ void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 void mgag200_primary_plane_helper_atomic_enable(struct drm_plane *plane,
 						struct drm_atomic_state *state)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	u8 seq1;
 
@@ -528,7 +528,7 @@ void mgag200_primary_plane_helper_atomic_enable(struct drm_plane *plane,
 void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 						 struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	u8 seq1;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..0f6588366eab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -98,7 +98,7 @@ static const uint64_t supported_format_modifiers[] = {
 
 static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
 {
-	struct msm_drm_private *priv = plane->dev->dev_private;
+	struct msm_drm_private *priv = plane->drm->dev_private;
 
 	return to_dpu_kms(priv->kms);
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index b689b618da78..b9062652d972 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -55,7 +55,7 @@ static int mdp4_plane_mode_set(struct drm_plane *plane,
 
 static struct mdp4_kms *get_kms(struct drm_plane *plane)
 {
-	struct msm_drm_private *priv = plane->dev->dev_private;
+	struct msm_drm_private *priv = plane->drm->dev_private;
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
@@ -95,7 +95,7 @@ static const struct drm_plane_funcs mdp4_plane_funcs = {
 static int mdp4_plane_prepare_fb(struct drm_plane *plane,
 				 struct drm_plane_state *new_state)
 {
-	struct msm_drm_private *priv = plane->dev->dev_private;
+	struct msm_drm_private *priv = plane->drm->dev_private;
 	struct msm_kms *kms = priv->kms;
 
 	if (!new_state->fb)
@@ -214,7 +214,7 @@ static int mdp4_plane_mode_set(struct drm_plane *plane,
 		uint32_t src_x, uint32_t src_y,
 		uint32_t src_w, uint32_t src_h)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct mdp4_plane *mdp4_plane = to_mdp4_plane(plane);
 	struct mdp4_kms *mdp4_kms = get_kms(plane);
 	enum mdp4_pipe pipe = mdp4_plane->pipe;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index bd2c4ac45601..6f47d3511764 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -29,7 +29,7 @@ static int mdp5_plane_mode_set(struct drm_plane *plane,
 
 static struct mdp5_kms *get_kms(struct drm_plane *plane)
 {
-	struct msm_drm_private *priv = plane->dev->dev_private;
+	struct msm_drm_private *priv = plane->drm->dev_private;
 	return to_mdp5_kms(to_mdp_kms(priv->kms));
 }
 
@@ -149,7 +149,7 @@ static const struct drm_plane_funcs mdp5_plane_funcs = {
 static int mdp5_plane_prepare_fb(struct drm_plane *plane,
 				 struct drm_plane_state *new_state)
 {
-	struct msm_drm_private *priv = plane->dev->dev_private;
+	struct msm_drm_private *priv = plane->drm->dev_private;
 	struct msm_kms *kms = priv->kms;
 	bool needs_dirtyfb = to_mdp5_plane_state(new_state)->needs_dirtyfb;
 
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index fb5e211c838f..8a6393d8f8a0 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -668,7 +668,7 @@ static int lcdif_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state,
 									     plane);
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(plane->dev);
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(plane->drm);
 	struct drm_crtc_state *crtc_state;
 
 	crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -683,7 +683,7 @@ static int lcdif_plane_atomic_check(struct drm_plane *plane,
 static void lcdif_plane_primary_atomic_update(struct drm_plane *plane,
 					      struct drm_atomic_state *state)
 {
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(plane->dev);
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(plane->drm);
 	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
 									    plane);
 	dma_addr_t paddr;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index d84e03a0c9eb..85b3d5ff3ad4 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -523,7 +523,7 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state,
 									     plane);
-	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->drm);
 	struct drm_crtc_state *crtc_state;
 
 	crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -538,7 +538,7 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
 static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
 					      struct drm_atomic_state *state)
 {
-	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->drm);
 	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
 									    plane);
 	dma_addr_t dma_addr;
@@ -553,7 +553,7 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(state,
 									    plane);
-	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->drm);
 	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
 									    plane);
 	dma_addr_t dma_addr;
@@ -614,7 +614,7 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 static void mxsfb_plane_overlay_atomic_disable(struct drm_plane *plane,
 					       struct drm_atomic_state *state)
 {
-	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->drm);
 
 	writel(0, mxsfb->base + LCDC_AS_CTRL);
 }
diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index 33f29736024a..17b836c4b671 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -117,7 +117,7 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 		  uint32_t src_w, uint32_t src_h,
 		  struct drm_modeset_acquire_ctx *ctx)
 {
-	struct nouveau_drm *drm = nouveau_drm(plane->dev);
+	struct nouveau_drm *drm = nouveau_drm(plane->drm);
 	struct nvif_object *dev = &drm->client.device.object;
 	struct nouveau_plane *nv_plane =
 		container_of(plane, struct nouveau_plane, base);
@@ -192,7 +192,7 @@ static int
 nv10_disable_plane(struct drm_plane *plane,
 		   struct drm_modeset_acquire_ctx *ctx)
 {
-	struct nvif_object *dev = &nouveau_drm(plane->dev)->client.device.object;
+	struct nvif_object *dev = &nouveau_drm(plane->drm)->client.device.object;
 	struct nouveau_plane *nv_plane =
 		container_of(plane, struct nouveau_plane, base);
 
@@ -216,7 +216,7 @@ nv_destroy_plane(struct drm_plane *plane)
 static void
 nv10_set_params(struct nouveau_plane *plane)
 {
-	struct nvif_object *dev = &nouveau_drm(plane->base.dev)->client.device.object;
+	struct nvif_object *dev = &nouveau_drm(plane->base.drm)->client.device.object;
 	u32 luma = (plane->brightness - 512) << 16 | plane->contrast;
 	u32 chroma = ((sin_mul(plane->hue, plane->saturation) & 0xffff) << 16) |
 		(cos_mul(plane->hue, plane->saturation) & 0xffff);
@@ -368,7 +368,7 @@ nv04_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 		  uint32_t src_w, uint32_t src_h,
 		  struct drm_modeset_acquire_ctx *ctx)
 {
-	struct nvif_object *dev = &nouveau_drm(plane->dev)->client.device.object;
+	struct nvif_object *dev = &nouveau_drm(plane->drm)->client.device.object;
 	struct nouveau_plane *nv_plane =
 		container_of(plane, struct nouveau_plane, base);
 	struct nouveau_bo *cur = nv_plane->cur;
@@ -443,7 +443,7 @@ static int
 nv04_disable_plane(struct drm_plane *plane,
 		   struct drm_modeset_acquire_ctx *ctx)
 {
-	struct nvif_object *dev = &nouveau_drm(plane->dev)->client.device.object;
+	struct nvif_object *dev = &nouveau_drm(plane->drm)->client.device.object;
 	struct nouveau_plane *nv_plane =
 		container_of(plane, struct nouveau_plane, base);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index a95ee5dcc2e3..1bd63408bbce 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -34,7 +34,7 @@
 bool
 curs507a_space(struct nv50_wndw *wndw)
 {
-	nvif_msec(&nouveau_drm(wndw->plane.dev)->client.device, 100,
+	nvif_msec(&nouveau_drm(wndw->plane.drm)->client.device, 100,
 		if (NVIF_TV32(&wndw->wimm.base.user, NV507A, FREE, COUNT, >=, 4))
 			return true;
 	);
@@ -78,7 +78,7 @@ static void
 curs507a_prepare(struct nv50_wndw *wndw, struct nv50_head_atom *asyh,
 		 struct nv50_wndw_atom *asyw)
 {
-	u32 handle = nv50_disp(wndw->plane.dev)->core->chan.vram.handle;
+	u32 handle = nv50_disp(wndw->plane.drm)->core->chan.vram.handle;
 	u32 offset = asyw->image.offset[0];
 	if (asyh->curs.handle != handle || asyh->curs.offset != offset) {
 		asyh->curs.handle = handle;
@@ -98,7 +98,7 @@ static int
 curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 		 struct nv50_head_atom *asyh)
 {
-	struct nouveau_drm *drm = nouveau_drm(wndw->plane.dev);
+	struct nouveau_drm *drm = nouveau_drm(wndw->plane.drm);
 	struct nv50_head *head = nv50_head(asyw->state.crtc);
 	struct drm_framebuffer *fb = asyw->state.fb;
 	int ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 0f48af3f2008..7b7b850fbbd0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -114,7 +114,7 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuffer *fb)
 int
 nv50_wndw_wait_armed(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nv50_disp *disp = nv50_disp(wndw->plane.dev);
+	struct nv50_disp *disp = nv50_disp(wndw->plane.drm);
 	if (asyw->set.ntfy) {
 		return wndw->func->ntfy_wait_begun(disp->sync,
 						   asyw->ntfy.offset,
@@ -179,7 +179,7 @@ nv50_wndw_flush_set(struct nv50_wndw *wndw, u32 *interlock,
 void
 nv50_wndw_ntfy_enable(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nv50_disp *disp = nv50_disp(wndw->plane.dev);
+	struct nv50_disp *disp = nv50_disp(wndw->plane.drm);
 
 	asyw->ntfy.handle = wndw->wndw.sync.handle;
 	asyw->ntfy.offset = wndw->ntfy;
@@ -195,7 +195,7 @@ nv50_wndw_atomic_check_release(struct nv50_wndw *wndw,
 			       struct nv50_wndw_atom *asyw,
 			       struct nv50_head_atom *asyh)
 {
-	struct nouveau_drm *drm = nouveau_drm(wndw->plane.dev);
+	struct nouveau_drm *drm = nouveau_drm(wndw->plane.drm);
 	NV_ATOMIC(drm, "%s release\n", wndw->plane.name);
 	wndw->func->release(wndw, asyw, asyh);
 	asyw->ntfy.handle = 0;
@@ -272,7 +272,7 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 			       struct nv50_head_atom *asyh)
 {
 	struct drm_framebuffer *fb = asyw->state.fb;
-	struct nouveau_drm *drm = nouveau_drm(wndw->plane.dev);
+	struct nouveau_drm *drm = nouveau_drm(wndw->plane.drm);
 	uint8_t kind;
 	uint32_t tile_mode;
 	int ret;
@@ -439,7 +439,7 @@ nv50_wndw_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	struct nouveau_drm *drm = nouveau_drm(plane->dev);
+	struct nouveau_drm *drm = nouveau_drm(plane->drm);
 	struct nv50_wndw *wndw = nv50_wndw(plane);
 	struct nv50_wndw_atom *armw = nv50_wndw_atom(wndw->plane.state);
 	struct nv50_wndw_atom *asyw = nv50_wndw_atom(new_plane_state);
@@ -517,7 +517,7 @@ nv50_wndw_atomic_check(struct drm_plane *plane,
 static void
 nv50_wndw_cleanup_fb(struct drm_plane *plane, struct drm_plane_state *old_state)
 {
-	struct nouveau_drm *drm = nouveau_drm(plane->dev);
+	struct nouveau_drm *drm = nouveau_drm(plane->drm);
 	struct nouveau_bo *nvbo;
 
 	NV_ATOMIC(drm, "%s cleanup: %p\n", plane->name, old_state->fb);
@@ -532,7 +532,7 @@ static int
 nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->fb;
-	struct nouveau_drm *drm = nouveau_drm(plane->dev);
+	struct nouveau_drm *drm = nouveau_drm(plane->drm);
 	struct nv50_wndw *wndw = nv50_wndw(plane);
 	struct nv50_wndw_atom *asyw = nv50_wndw_atom(state);
 	struct nouveau_bo *nvbo;
@@ -660,7 +660,7 @@ nv50_wndw_destroy(struct drm_plane *plane)
 static bool nv50_plane_format_mod_supported(struct drm_plane *plane,
 					    u32 format, u64 modifier)
 {
-	struct nouveau_drm *drm = nouveau_drm(plane->dev);
+	struct nouveau_drm *drm = nouveau_drm(plane->drm);
 	uint8_t i;
 
 	if (drm->client.device.info.chipset < 0xc0) {
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 24a2ded08b45..17c16e6f2ee6 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -63,7 +63,7 @@ static void omap_plane_cleanup_fb(struct drm_plane *plane,
 static void omap_plane_atomic_update(struct drm_plane *plane,
 				     struct drm_atomic_state *state)
 {
-	struct omap_drm_private *priv = plane->dev->dev_private;
+	struct omap_drm_private *priv = plane->drm->dev_private;
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
@@ -141,7 +141,7 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 			      omap_crtc_timings(new_state->crtc), false,
 			      omap_crtc_channel(new_state->crtc));
 	if (ret) {
-		dev_err(plane->dev->dev, "Failed to setup plane %s\n",
+		dev_err(plane->drm->dev, "Failed to setup plane %s\n",
 			plane->name);
 		dispc_ovl_enable(priv->dispc, ovl_id, false);
 		return;
@@ -154,7 +154,8 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 				      omap_crtc_timings(new_state->crtc), false,
 				      omap_crtc_channel(new_state->crtc));
 		if (ret) {
-			dev_err(plane->dev->dev, "Failed to setup plane right-overlay %s\n",
+			dev_err(plane->drm->dev,
+				"Failed to setup plane right-overlay %s\n",
 				plane->name);
 			dispc_ovl_enable(priv->dispc, r_ovl_id, false);
 			dispc_ovl_enable(priv->dispc, ovl_id, false);
@@ -168,7 +169,7 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 static void omap_plane_atomic_disable(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
-	struct omap_drm_private *priv = plane->dev->dev_private;
+	struct omap_drm_private *priv = plane->drm->dev_private;
 	struct omap_plane *omap_plane = to_omap_plane(plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
@@ -204,7 +205,7 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 										 plane);
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
 										 plane);
-	struct omap_drm_private *priv = plane->dev->dev_private;
+	struct omap_drm_private *priv = plane->drm->dev_private;
 	struct omap_plane_state *omap_state = to_omap_plane_state(new_plane_state);
 	struct omap_global_state *omap_overlay_global_state;
 	struct drm_crtc_state *crtc_state;
@@ -382,7 +383,7 @@ static void omap_plane_destroy(struct drm_plane *plane)
 void omap_plane_install_properties(struct drm_plane *plane,
 		struct drm_mode_object *obj)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct omap_drm_private *priv = dev->dev_private;
 
 	if (priv->has_dmm) {
@@ -462,7 +463,7 @@ static int omap_plane_atomic_set_property(struct drm_plane *plane,
 					  struct drm_property *property,
 					  u64 val)
 {
-	struct omap_drm_private *priv = plane->dev->dev_private;
+	struct omap_drm_private *priv = plane->drm->dev_private;
 
 	if (property == priv->zorder_prop)
 		state->zpos = val;
@@ -477,7 +478,7 @@ static int omap_plane_atomic_get_property(struct drm_plane *plane,
 					  struct drm_property *property,
 					  u64 *val)
 {
-	struct omap_drm_private *priv = plane->dev->dev_private;
+	struct omap_drm_private *priv = plane->drm->dev_private;
 
 	if (property == priv->zorder_prop)
 		*val = state->zpos;
@@ -501,7 +502,7 @@ static const struct drm_plane_funcs omap_plane_funcs = {
 
 static bool omap_plane_supports_yuv(struct drm_plane *plane)
 {
-	struct omap_drm_private *priv = plane->dev->dev_private;
+	struct omap_drm_private *priv = plane->drm->dev_private;
 	struct omap_plane *omap_plane = to_omap_plane(plane);
 	const u32 *formats = dispc_ovl_get_color_modes(priv->dispc, omap_plane->id);
 	u32 i;
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index d123a59c0c9f..f614aa85e0b3 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -472,7 +472,7 @@ static int qxl_primary_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	struct qxl_device *qdev = to_qxl(plane->dev);
+	struct qxl_device *qdev = to_qxl(plane->drm);
 	struct qxl_bo *bo;
 
 	if (!new_plane_state->crtc || !new_plane_state->fb)
@@ -641,7 +641,7 @@ static void qxl_primary_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
-	struct qxl_device *qdev = to_qxl(plane->dev);
+	struct qxl_device *qdev = to_qxl(plane->drm);
 	struct qxl_bo *bo = gem_to_qxl_bo(new_state->fb->obj[0]);
 	struct qxl_bo *primary;
 	struct drm_clip_rect norect = {
@@ -674,7 +674,7 @@ static void qxl_primary_atomic_disable(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct qxl_device *qdev = to_qxl(plane->dev);
+	struct qxl_device *qdev = to_qxl(plane->drm);
 
 	if (old_state->fb) {
 		struct qxl_bo *bo = gem_to_qxl_bo(old_state->fb->obj[0]);
@@ -693,7 +693,7 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 									   plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
-	struct qxl_device *qdev = to_qxl(plane->dev);
+	struct qxl_device *qdev = to_qxl(plane->drm);
 	struct drm_framebuffer *fb = new_state->fb;
 
 	if (fb != old_state->fb) {
@@ -708,7 +708,7 @@ static void qxl_cursor_atomic_disable(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct qxl_device *qdev = to_qxl(plane->dev);
+	struct qxl_device *qdev = to_qxl(plane->drm);
 	struct qxl_crtc *qcrtc;
 	struct qxl_release *release;
 	struct qxl_cursor_cmd *cmd;
@@ -830,7 +830,7 @@ static void qxl_prepare_shadow(struct qxl_device *qdev, struct qxl_bo *user_bo,
 static int qxl_plane_prepare_fb(struct drm_plane *plane,
 				struct drm_plane_state *new_state)
 {
-	struct qxl_device *qdev = to_qxl(plane->dev);
+	struct qxl_device *qdev = to_qxl(plane->drm);
 	struct drm_gem_object *obj;
 	struct qxl_bo *user_bo;
 	int ret;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
index d759e0192181..75b7fd27a6bc 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
@@ -593,7 +593,7 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
 				 struct drm_plane_state *state,
 				 const struct rcar_du_format_info **format)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct drm_crtc_state *crtc_state;
 	int ret;
 
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 850986cee848..ddd3b6aae69c 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -60,7 +60,7 @@ static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
 static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 				    struct drm_framebuffer *fb)
 {
-	struct shmob_drm_device *sdev = splane->plane.dev->dev_private;
+	struct shmob_drm_device *sdev = splane->plane.drm->dev_private;
 	u32 format;
 
 	/* TODO: Support ROP3 mode */
@@ -179,7 +179,7 @@ shmob_drm_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
 		       struct drm_modeset_acquire_ctx *ctx)
 {
 	struct shmob_drm_plane *splane = to_shmob_plane(plane);
-	struct shmob_drm_device *sdev = plane->dev->dev_private;
+	struct shmob_drm_device *sdev = plane->drm->dev_private;
 	const struct shmob_drm_format_info *format;
 
 	format = shmob_drm_format_info(fb->format->format);
@@ -211,7 +211,7 @@ static int shmob_drm_plane_disable(struct drm_plane *plane,
 				   struct drm_modeset_acquire_ctx *ctx)
 {
 	struct shmob_drm_plane *splane = to_shmob_plane(plane);
-	struct shmob_drm_device *sdev = plane->dev->dev_private;
+	struct shmob_drm_device *sdev = plane->drm->dev_private;
 
 	splane->format = NULL;
 
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 5d94b494a545..0f13b2206ac4 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -619,7 +619,7 @@ static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_atomic_helper_damage_iter iter;
-	struct drm_device *drm = plane->dev;
+	struct drm_device *drm = plane->drm;
 	struct drm_rect dst_clip;
 	struct drm_rect damage;
 	int idx;
@@ -643,7 +643,7 @@ static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 static void ssd130x_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 							struct drm_atomic_state *state)
 {
-	struct drm_device *drm = plane->dev;
+	struct drm_device *drm = plane->drm;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 	int idx;
 
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index db0a1eb53532..e9549090222b 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -343,7 +343,7 @@ static int sti_cursor_late_register(struct drm_plane *drm_plane)
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_cursor *cursor = to_sti_cursor(plane);
 
-	cursor_debugfs_init(cursor, drm_plane->dev->primary);
+	cursor_debugfs_init(cursor, drm_plane->drm->primary);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index 43c72c2604a0..6def1c5b89bc 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -900,7 +900,7 @@ static int sti_gdp_late_register(struct drm_plane *drm_plane)
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_gdp *gdp = to_sti_gdp(plane);
 
-	return gdp_debugfs_init(gdp, drm_plane->dev->primary);
+	return gdp_debugfs_init(gdp, drm_plane->drm->primary);
 }
 
 static const struct drm_plane_funcs sti_gdp_plane_helpers_funcs = {
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 0fb48ac044d8..2a43d18e090a 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1276,7 +1276,7 @@ static int sti_hqvdp_late_register(struct drm_plane *drm_plane)
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_hqvdp *hqvdp = to_sti_hqvdp(plane);
 
-	hqvdp_debugfs_init(hqvdp, drm_plane->dev->primary);
+	hqvdp_debugfs_init(hqvdp, drm_plane->drm->primary);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 7296cdebd712..ebf214f2f92c 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -489,7 +489,7 @@ static inline struct ltdc_device *crtc_to_ltdc(struct drm_crtc *crtc)
 
 static inline struct ltdc_device *plane_to_ltdc(struct drm_plane *plane)
 {
-	return (struct ltdc_device *)plane->dev->dev_private;
+	return (struct ltdc_device *) plane->drm->dev_private;
 }
 
 static inline struct ltdc_device *encoder_to_ltdc(struct drm_encoder *enc)
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 133175353fba..d99e0e8a2671 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -904,7 +904,7 @@ static void __tegra_cursor_atomic_update(struct drm_plane *plane,
 {
 	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
 	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
-	struct tegra_drm *tegra = plane->dev->dev_private;
+	struct tegra_drm *tegra = plane->drm->dev_private;
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
 	u64 dma_mask = *dc->dev->dma_mask;
 #endif
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index ffe5f06b770d..1fd1ab0f4f97 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -92,7 +92,7 @@ static bool tegra_plane_supports_sector_layout(struct drm_plane *plane)
 {
 	struct drm_crtc *crtc;
 
-	drm_for_each_crtc(crtc, plane->dev) {
+	drm_for_each_crtc(crtc, plane->drm) {
 		if (plane->possible_crtcs & drm_crtc_mask(crtc)) {
 			struct tegra_dc *dc = to_tegra_dc(crtc);
 
@@ -628,7 +628,7 @@ static int tegra_plane_check_transparency(struct tegra_plane *tegra,
 		return 0;
 
 	/* include all sibling planes into this commit */
-	drm_for_each_plane(plane, tegra->base.dev) {
+	drm_for_each_plane(plane, tegra->base.drm) {
 		struct tegra_plane *p = to_tegra_plane(plane);
 
 		/* skip this plane and planes on different CRTCs */
@@ -723,7 +723,7 @@ static int tegra_plane_setup_transparency(struct tegra_plane *tegra,
 	 * All planes are now in the atomic state, walk them up and update
 	 * transparency state for each plane.
 	 */
-	drm_for_each_plane(plane, tegra->base.dev) {
+	drm_for_each_plane(plane, tegra->base.drm) {
 		struct tegra_plane *p = to_tegra_plane(plane);
 
 		/* skip planes on different CRTCs */
diff --git a/drivers/gpu/drm/tests/drm_damage_helper_test.c b/drivers/gpu/drm/tests/drm_damage_helper_test.c
index 115034fc3421..0403e0e4450a 100644
--- a/drivers/gpu/drm/tests/drm_damage_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_damage_helper_test.c
@@ -43,7 +43,7 @@ static int drm_damage_helper_init(struct kunit *test)
 	/* just enough so that drm_plane_enable_fb_damage_clips() works */
 	mock->device.driver = &mock->driver;
 	mock->device.mode_config.prop_fb_damage_clips = &mock->prop;
-	mock->plane.dev = &mock->device;
+	mock->plane.drm = &mock->device;
 	mock->obj_props.count = 0;
 	mock->plane.base.properties = &mock->obj_props;
 	mock->prop.base.id = 1; /* 0 is an invalid id */
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 6bdd6e4a955a..033e8222e12f 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -24,7 +24,7 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	struct drm_device *ddev = plane->dev;
+	struct drm_device *ddev = plane->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_plane *tplane = to_tidss_plane(plane);
 	const struct drm_format_info *finfo;
@@ -107,7 +107,7 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
 static void tidss_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
-	struct drm_device *ddev = plane->dev;
+	struct drm_device *ddev = plane->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_plane *tplane = to_tidss_plane(plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
@@ -129,7 +129,7 @@ static void tidss_plane_atomic_update(struct drm_plane *plane,
 static void tidss_plane_atomic_enable(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
-	struct drm_device *ddev = plane->dev;
+	struct drm_device *ddev = plane->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_plane *tplane = to_tidss_plane(plane);
 
@@ -141,7 +141,7 @@ static void tidss_plane_atomic_enable(struct drm_plane *plane,
 static void tidss_plane_atomic_disable(struct drm_plane *plane,
 				       struct drm_atomic_state *state)
 {
-	struct drm_device *ddev = plane->dev;
+	struct drm_device *ddev = plane->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_plane *tplane = to_tidss_plane(plane);
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index cf77a8ce7398..a1afb8c69ed9 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -37,7 +37,7 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	if (new_state->crtc_x || new_state->crtc_y) {
-		dev_err(plane->dev->dev, "%s: crtc position must be zero.",
+		dev_err(plane->drm->dev, "%s: crtc position must be zero.",
 			__func__);
 		return -EINVAL;
 	}
@@ -50,7 +50,7 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 
 	if (crtc_state->mode.hdisplay != new_state->crtc_w ||
 	    crtc_state->mode.vdisplay != new_state->crtc_h) {
-		dev_err(plane->dev->dev,
+		dev_err(plane->drm->dev,
 			"%s: Size must match mode (%dx%d == %dx%d)", __func__,
 			crtc_state->mode.hdisplay, crtc_state->mode.vdisplay,
 			new_state->crtc_w, new_state->crtc_h);
@@ -60,13 +60,13 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 	pitch = crtc_state->mode.hdisplay *
 		new_state->fb->format->cpp[0];
 	if (new_state->fb->pitches[0] != pitch) {
-		dev_err(plane->dev->dev,
+		dev_err(plane->drm->dev,
 			"Invalid pitch: fb and crtc widths must be the same");
 		return -EINVAL;
 	}
 
 	if (old_state->fb && new_state->fb->format != old_state->fb->format) {
-		dev_dbg(plane->dev->dev,
+		dev_dbg(plane->drm->dev,
 			"%s(): pixel format change requires mode_change\n",
 			__func__);
 		crtc_state->mode_changed = true;
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 2f6763999360..c9788e4757ed 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -379,7 +379,7 @@ static int cirrus_primary_plane_helper_atomic_check(struct drm_plane *plane,
 static void cirrus_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						      struct drm_atomic_state *state)
 {
-	struct cirrus_device *cirrus = to_cirrus(plane->dev);
+	struct cirrus_device *cirrus = to_cirrus(plane->drm);
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct cirrus_primary_plane_state *primary_plane_state =
 		to_cirrus_primary_plane_state(plane_state);
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index ddc0ddb29434..43c376625ace 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -788,7 +788,7 @@ static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						     struct drm_atomic_state *state)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct ofdrm_device *odev = ofdrm_device_of_dev(dev);
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
@@ -828,7 +828,7 @@ static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 static void ofdrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 						      struct drm_atomic_state *state)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct ofdrm_device *odev = ofdrm_device_of_dev(dev);
 	struct iosys_map dst = odev->screen_base;
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index be02d12f80eb..59310065f338 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -484,7 +484,7 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
@@ -518,7 +518,7 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 							  struct drm_atomic_state *state)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
 	int idx;
 
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index bc0accd155c6..6b521d6f5334 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -263,7 +263,7 @@ static const uint64_t udl_primary_plane_fmtmods[] = {
 static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index f8f2dc3d3b1b..221077f38bf1 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -393,7 +393,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct vbox_private *vbox =
-		container_of(plane->dev, struct vbox_private, ddev);
+		container_of(plane->drm, struct vbox_private, ddev);
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(new_state->crtc);
 	struct drm_framebuffer *fb = new_state->fb;
 	u32 width = new_state->crtc_w;
@@ -442,7 +442,7 @@ static void vbox_cursor_atomic_disable(struct drm_plane *plane,
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
 	struct vbox_private *vbox =
-		container_of(plane->dev, struct vbox_private, ddev);
+		container_of(plane->drm, struct vbox_private, ddev);
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(old_state->crtc);
 	bool cursor_enabled = false;
 	struct drm_crtc *crtci;
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 00e713faecd5..25ee096323e1 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -297,7 +297,7 @@ static struct drm_plane_state *vc4_plane_duplicate_state(struct drm_plane *plane
 static void vc4_plane_destroy_state(struct drm_plane *plane,
 				    struct drm_plane_state *state)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(plane->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(plane->drm);
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 
 	if (drm_mm_node_allocated(&vc4_state->lbm)) {
@@ -550,7 +550,7 @@ static void vc4_write_ppf(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 static u32 vc4_lbm_size(struct drm_plane_state *state)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
-	struct vc4_dev *vc4 = to_vc4_dev(state->plane->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(state->plane->drm);
 	u32 pix_per_line;
 	u32 lbm;
 
@@ -684,7 +684,7 @@ static void vc4_plane_calc_load(struct drm_plane_state *state)
 
 static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(state->plane->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(state->plane->drm);
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 	unsigned long irqflags;
 	u32 lbm_size;
@@ -814,7 +814,7 @@ static u32 vc4_hvs5_get_alpha_blend_mode(struct drm_plane_state *state)
 static int vc4_plane_mode_set(struct drm_plane *plane,
 			      struct drm_plane_state *state)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(plane->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(plane->drm);
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	u32 ctl0_offset = vc4_state->dlist_count;
@@ -1317,7 +1317,7 @@ u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist)
 	int i;
 	int idx;
 
-	if (!drm_dev_enter(plane->dev, &idx))
+	if (!drm_dev_enter(plane->drm, &idx))
 		goto out;
 
 	vc4_state->hw_dlist = dlist;
@@ -1349,7 +1349,7 @@ void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 	uint32_t addr;
 	int idx;
 
-	if (!drm_dev_enter(plane->dev, &idx))
+	if (!drm_dev_enter(plane->drm, &idx))
 		return;
 
 	/* We're skipping the address adjustment for negative origin,
@@ -1381,7 +1381,7 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 	struct vc4_plane_state *vc4_state, *new_vc4_state;
 	int idx;
 
-	if (!drm_dev_enter(plane->dev, &idx))
+	if (!drm_dev_enter(plane->drm, &idx))
 		return;
 
 	swap(plane->state->fb, new_plane_state->fb);
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a2e045f3a000..e31397e0faa7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -125,7 +125,7 @@ static void virtio_gpu_resource_flush(struct drm_plane *plane,
 				      uint32_t x, uint32_t y,
 				      uint32_t width, uint32_t height)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_framebuffer *vgfb;
 	struct virtio_gpu_object *bo;
@@ -160,7 +160,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = NULL;
 	struct virtio_gpu_object *bo;
@@ -234,7 +234,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 				       struct drm_plane_state *new_state)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_framebuffer *vgfb;
 	struct virtio_gpu_object *bo;
@@ -277,7 +277,7 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct drm_device *dev = plane->dev;
+	struct drm_device *dev = plane->drm;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = NULL;
 	struct virtio_gpu_framebuffer *vgfb;
@@ -383,7 +383,7 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
 		funcs = &virtio_gpu_primary_helper_funcs;
 	}
 
-	plane = drmm_universal_plane_alloc(dev, struct drm_plane, dev,
+	plane = drmm_universal_plane_alloc(dev, struct drm_plane, drm,
 					   1 << index, &virtio_gpu_plane_funcs,
 					   formats, nformats, NULL, type, NULL);
 	if (IS_ERR(plane))
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index c332ad7e4e8f..6f01d06da2ef 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -38,7 +38,7 @@
 
 void vmw_du_cleanup(struct vmw_display_unit *du)
 {
-	struct vmw_private *dev_priv = vmw_priv(du->primary.dev);
+	struct vmw_private *dev_priv = vmw_priv(du->primary.drm);
 	drm_plane_cleanup(&du->primary);
 	if (vmw_cmd_supported(dev_priv))
 		drm_plane_cleanup(&du->cursor.base);
@@ -268,7 +268,7 @@ static void vmw_du_put_cursor_mob(struct vmw_cursor_plane *vcp,
 static int vmw_du_get_cursor_mob(struct vmw_cursor_plane *vcp,
 				 struct vmw_plane_state *vps)
 {
-	struct vmw_private *dev_priv = vcp->base.dev->dev_private;
+	struct vmw_private *dev_priv = vcp->base.drm->dev_private;
 	u32 size = vmw_du_cursor_mob_size(vps->base.crtc_w, vps->base.crtc_h);
 	u32 i;
 	u32 cursor_max_dim, mob_max_size;
@@ -498,7 +498,7 @@ void vmw_du_cursor_plane_destroy(struct drm_plane *plane)
 	struct vmw_cursor_plane *vcp = vmw_plane_to_vcp(plane);
 	u32 i;
 
-	vmw_cursor_update_position(plane->dev->dev_private, false, 0, 0);
+	vmw_cursor_update_position(plane->drm->dev_private, false, 0, 0);
 
 	for (i = 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++)
 		vmw_du_destroy_cursor_mob(&vcp->cursor_mobs[i]);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 289165b1b976..4a05b7e43135 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -340,7 +340,7 @@ vmw_ldu_primary_plane_atomic_update(struct drm_plane *plane,
 	struct drm_crtc *crtc = new_state->crtc ?: old_state->crtc;
 
 	ldu = vmw_crtc_to_ldu(crtc);
-	dev_priv = vmw_priv(plane->dev);
+	dev_priv = vmw_priv(plane->drm);
 	fb       = new_state->fb;
 
 	vfb = (fb) ? vmw_framebuffer_to_vfb(fb) : NULL;
@@ -370,8 +370,9 @@ vmw_ldu_primary_plane_atomic_update(struct drm_plane *plane,
 
 		ret = vmw_kms_ldu_do_bo_dirty(dev_priv, vfb, 0, 0, damage_rects, rect_count);
 
-		drm_WARN_ONCE(plane->dev, ret,
-			"vmw_kms_ldu_do_bo_dirty failed with: ret=%d\n", ret);
+		drm_WARN_ONCE(plane->drm, ret,
+			      "vmw_kms_ldu_do_bo_dirty failed with: ret=%d\n",
+			      ret);
 
 		vmw_cmd_flush(dev_priv, false);
 	}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index b3c3cdba00a8..1aecaa016b54 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -893,7 +893,7 @@ static int
 vmw_stdu_primary_plane_prepare_fb(struct drm_plane *plane,
 				  struct drm_plane_state *new_state)
 {
-	struct vmw_private *dev_priv = vmw_priv(plane->dev);
+	struct vmw_private *dev_priv = vmw_priv(plane->drm);
 	struct drm_framebuffer *new_fb = new_state->fb;
 	struct vmw_framebuffer *vfb;
 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 37bbfd838499..0e11243d2f0d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -77,7 +77,7 @@ static void zynqmp_dpsub_plane_atomic_disable(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(plane->dev);
+	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(plane->drm);
 	struct zynqmp_disp_layer *layer = dpsub->layers[plane->index];
 
 	if (!old_state->fb)
@@ -95,7 +95,7 @@ static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
-	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(plane->dev);
+	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(plane->drm);
 	struct zynqmp_disp_layer *layer = dpsub->layers[plane->index];
 	bool format_changed = false;
 
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 51291983ea44..74c38eb72b8d 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -591,8 +591,8 @@ enum drm_plane_type {
  * Management Properties`_ for details on that.
  */
 struct drm_plane {
-	/** @dev: DRM device this plane belongs to */
-	struct drm_device *dev;
+	/** @drm: DRM device this plane belongs to */
+	struct drm_device *drm;
 
 	/**
 	 * @head:
-- 
2.39.2

