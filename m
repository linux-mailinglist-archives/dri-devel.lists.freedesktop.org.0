Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF557521E8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 14:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FD910E691;
	Thu, 13 Jul 2023 12:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9E210E633
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:26:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrce-0005sr-VU; Thu, 13 Jul 2023 10:24:25 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrce-00E4jf-4c; Thu, 13 Jul 2023 10:24:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcd-004VhC-1w; Thu, 13 Jul 2023 10:24:23 +0200
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
Subject: [PATCH 08/17] drm/encoder: Rename struct drm_encoder::dev to drm
Date: Thu, 13 Jul 2023 10:23:59 +0200
Message-Id: <20230713082408.2266984-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=419928;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ZFrIXXWPn6b6ckh71ASCJieLyUDMfseUuXwtnftQXZ8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7SRKRZvhQxm/pOG+SqHmSnKkTy6Y9FHKrGU9
 xHegmq5S3aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0kQAKCRCPgPtYfRL+
 Tlr3B/91ONXViULZwvbgZ7l82yWOi6zUzoAkc98mKtg9XnETDHW0nJAHpLn23RaXoYneeZNO1f8
 RdgY2JnmJgF3bDUPmjELv3e3DsyjWy4MmeEcSzMBsgCXgG+06n7oqYw9w0+XqQjKrVj6qoAFDUD
 7HGPCrJthVFsehetFQmle/z1t2vlpHwxs+tuke3CWBTw1ZS8NiYSjXH5nfBSOjYGVPYkbLucX/y
 tCTZT2EgdlsEdsE0fn8DJcwcFtiGzSmdnXHlPXnsO2E2mJJ1Q2lSxfrFtlbeFdVHl7WzGSv/fRm
 Ij3iw8GZMchvEFUzN7vmzJDRGxr14X5t5MejCBkbjxohi/cp
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 13 Jul 2023 12:53:45 +0000
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
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c  |   8 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c      |   2 +-
 .../gpu/drm/amd/amdgpu/atombios_encoders.c    |  30 +--
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  24 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  24 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  34 +--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  24 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
 drivers/gpu/drm/arm/malidp_mw.c               |   2 +-
 drivers/gpu/drm/bridge/tc358775.c             |   2 +-
 drivers/gpu/drm/drm_atomic.c                  |   2 +-
 drivers/gpu/drm/drm_atomic_helper.c           |  19 +-
 drivers/gpu/drm/drm_bridge.c                  |   2 +-
 drivers/gpu/drm/drm_crtc_helper.c             |   4 +-
 drivers/gpu/drm/drm_encoder.c                 |   8 +-
 drivers/gpu/drm/drm_mode_config.c             |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c       |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       |   4 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c          |   2 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c        |   4 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c         |  30 +--
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c       |   4 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c       |  12 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c        |   4 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c        |   8 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c       |  12 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c       |  20 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |   2 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c  |   2 +-
 drivers/gpu/drm/i2c/ch7006_drv.c              |  12 +-
 drivers/gpu/drm/i915/display/g4x_dp.c         |  32 +--
 drivers/gpu/drm/i915/display/g4x_hdmi.c       |  26 +--
 drivers/gpu/drm/i915/display/icl_dsi.c        |  73 +++---
 drivers/gpu/drm/i915/display/intel_audio.c    |  34 +--
 drivers/gpu/drm/i915/display/intel_bios.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |  24 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |  28 +--
 drivers/gpu/drm/i915/display/intel_ddi.c      | 208 +++++++++---------
 .../drm/i915/display/intel_ddi_buf_trans.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   8 +-
 .../drm/i915/display/intel_display_debugfs.c  |   2 +-
 .../i915/display/intel_display_power_well.c   |   2 +-
 .../drm/i915/display/intel_display_types.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  62 +++---
 drivers/gpu/drm/i915/display/intel_dp_aux.c   |  10 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  24 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  20 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |  26 +--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  24 +-
 drivers/gpu/drm/i915/display/intel_dvo.c      |  10 +-
 drivers/gpu/drm/i915/display/intel_fdi.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |   6 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 118 +++++-----
 drivers/gpu/drm/i915/display/intel_hotplug.c  |   2 +-
 .../gpu/drm/i915/display/intel_hotplug_irq.c  |  34 +--
 .../gpu/drm/i915/display/intel_load_detect.c  |   4 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c   |   8 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     |  16 +-
 .../drm/i915/display/intel_modeset_setup.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
 drivers/gpu/drm/i915/display/intel_pps.c      |   6 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |   4 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  46 ++--
 drivers/gpu/drm/i915/display/intel_snps_phy.c |  10 +-
 drivers/gpu/drm/i915/display/intel_tc.c       |  30 +--
 drivers/gpu/drm/i915/display/intel_tv.c       |  12 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |  48 ++--
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c    |  26 +--
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   2 +-
 drivers/gpu/drm/logicvc/logicvc_interface.c   |   2 +-
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c |   4 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c |  12 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  28 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   2 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |   2 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  |   4 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  10 +-
 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |  13 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  |   4 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c        |  24 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  22 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c       |   2 +-
 .../gpu/drm/nouveau/dispnv04/tvmodesnv17.c    |   6 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c     |   8 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  26 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  48 ++--
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |  16 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c          |   4 +-
 drivers/gpu/drm/omapdrm/omap_encoder.c        |   2 +-
 drivers/gpu/drm/radeon/atombios_dp.c          |   4 +-
 drivers/gpu/drm/radeon/atombios_encoders.c    |  56 ++---
 drivers/gpu/drm/radeon/cik.c                  |   2 +-
 drivers/gpu/drm/radeon/dce3_1_afmt.c          |  12 +-
 drivers/gpu/drm/radeon/dce6_afmt.c            |  10 +-
 drivers/gpu/drm/radeon/evergreen.c            |   2 +-
 drivers/gpu/drm/radeon/evergreen_hdmi.c       |  22 +-
 drivers/gpu/drm/radeon/r600.c                 |   2 +-
 drivers/gpu/drm/radeon/r600_hdmi.c            |  18 +-
 drivers/gpu/drm/radeon/radeon_atombios.c      |  14 +-
 drivers/gpu/drm/radeon/radeon_audio.c         |   8 +-
 drivers/gpu/drm/radeon/radeon_combios.c       |  22 +-
 drivers/gpu/drm/radeon/radeon_connectors.c    |   4 +-
 drivers/gpu/drm/radeon/radeon_encoders.c      |  16 +-
 .../gpu/drm/radeon/radeon_legacy_encoders.c   |  66 +++---
 drivers/gpu/drm/radeon/radeon_legacy_tv.c     |  12 +-
 drivers/gpu/drm/radeon/rs600.c                |   2 +-
 .../drm/renesas/rcar-du/rcar_du_writeback.c   |   2 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c |   4 +-
 drivers/gpu/drm/solomon/ssd130x.c             |   4 +-
 drivers/gpu/drm/sti/sti_tvout.c               |   2 +-
 drivers/gpu/drm/stm/ltdc.c                    |   8 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   6 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                 |   8 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
 drivers/gpu/drm/vc4/vc4_txp.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_vec.c                 |   6 +-
 include/drm/drm_encoder.h                     |   4 +-
 124 files changed, 950 insertions(+), 945 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index d8b446a64b5b..4ba7c8f45181 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -381,7 +381,7 @@ static void amdgpu_get_native_mode(struct drm_connector *connector)
 static struct drm_display_mode *
 amdgpu_connector_lcd_native_mode(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_display_mode *mode = NULL;
 	struct drm_display_mode *native_mode = &amdgpu_encoder->native_mode;
@@ -419,7 +419,7 @@ amdgpu_connector_lcd_native_mode(struct drm_encoder *encoder)
 static void amdgpu_connector_add_common_modes(struct drm_encoder *encoder,
 					       struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_display_mode *mode = NULL;
 	struct drm_display_mode *native_mode = &amdgpu_encoder->native_mode;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
index 3aaeed2d3562..b72c4eafd1fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c
@@ -61,7 +61,7 @@ amdgpu_link_encoder_connector(struct drm_device *dev)
 
 void amdgpu_encoder_set_active_device(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
@@ -83,7 +83,7 @@ void amdgpu_encoder_set_active_device(struct drm_encoder *encoder)
 struct drm_connector *
 amdgpu_get_connector_for_encoder(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector, *found = NULL;
 	struct drm_connector_list_iter iter;
@@ -104,7 +104,7 @@ amdgpu_get_connector_for_encoder(struct drm_encoder *encoder)
 struct drm_connector *
 amdgpu_get_connector_for_encoder_init(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector, *found = NULL;
 	struct drm_connector_list_iter iter;
@@ -124,7 +124,7 @@ amdgpu_get_connector_for_encoder_init(struct drm_encoder *encoder)
 
 struct drm_encoder *amdgpu_get_external_encoder(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_encoder *other_encoder;
 	struct amdgpu_encoder *other_amdgpu_encoder;
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
index 968888ba326e..8edbaa5d3666 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
@@ -720,7 +720,7 @@ amdgpu_atombios_dp_link_train_ce(struct amdgpu_atombios_dp_link_train_info *dp_i
 void amdgpu_atombios_dp_link_train(struct drm_encoder *encoder,
 			    struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_connector *amdgpu_connector;
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index ac55c615dad0..758ebf37784f 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -70,7 +70,7 @@ amdgpu_atombios_encoder_set_backlight_level_to_reg(struct amdgpu_device *adev,
 u8
 amdgpu_atombios_encoder_get_backlight_level(struct amdgpu_encoder *amdgpu_encoder)
 {
-	struct drm_device *dev = amdgpu_encoder->base.dev;
+	struct drm_device *dev = amdgpu_encoder->base.drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (!(adev->mode_info.firmware_flags & ATOM_BIOS_INFO_BL_CONTROLLED_BY_GPU))
@@ -84,7 +84,7 @@ amdgpu_atombios_encoder_set_backlight_level(struct amdgpu_encoder *amdgpu_encode
 				     u8 level)
 {
 	struct drm_encoder *encoder = &amdgpu_encoder->base;
-	struct drm_device *dev = amdgpu_encoder->base.dev;
+	struct drm_device *dev = amdgpu_encoder->base.drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder_atom_dig *dig;
 
@@ -150,7 +150,7 @@ amdgpu_atombios_encoder_get_backlight_brightness(struct backlight_device *bd)
 {
 	struct amdgpu_backlight_privdata *pdata = bl_get_data(bd);
 	struct amdgpu_encoder *amdgpu_encoder = pdata->encoder;
-	struct drm_device *dev = amdgpu_encoder->base.dev;
+	struct drm_device *dev = amdgpu_encoder->base.drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	return amdgpu_atombios_encoder_get_backlight_level_from_reg(adev);
@@ -164,7 +164,7 @@ static const struct backlight_ops amdgpu_atombios_encoder_backlight_ops = {
 void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *amdgpu_encoder,
 				     struct drm_connector *drm_connector)
 {
-	struct drm_device *dev = amdgpu_encoder->base.dev;
+	struct drm_device *dev = amdgpu_encoder->base.drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct backlight_device *bd;
 	struct backlight_properties props;
@@ -234,7 +234,7 @@ void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *amdgpu_encode
 void
 amdgpu_atombios_encoder_fini_backlight(struct amdgpu_encoder *amdgpu_encoder)
 {
-	struct drm_device *dev = amdgpu_encoder->base.dev;
+	struct drm_device *dev = amdgpu_encoder->base.drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct backlight_device *bd = NULL;
 	struct amdgpu_encoder_atom_dig *dig;
@@ -312,7 +312,7 @@ bool amdgpu_atombios_encoder_mode_fixup(struct drm_encoder *encoder,
 static void
 amdgpu_atombios_encoder_setup_dac(struct drm_encoder *encoder, int action)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	DAC_ENCODER_CONTROL_PS_ALLOCATION args;
@@ -375,7 +375,7 @@ union dvo_encoder_control {
 static void
 amdgpu_atombios_encoder_setup_dvo(struct drm_encoder *encoder, int action)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	union dvo_encoder_control args;
@@ -560,7 +560,7 @@ void
 amdgpu_atombios_encoder_setup_dig_encoder(struct drm_encoder *encoder,
 				   int action, int panel_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -749,7 +749,7 @@ void
 amdgpu_atombios_encoder_setup_dig_transmitter(struct drm_encoder *encoder, int action,
 					      uint8_t lane_num, uint8_t lane_set)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1191,7 +1191,7 @@ amdgpu_atombios_encoder_setup_external_encoder(struct drm_encoder *encoder,
 					struct drm_encoder *ext_encoder,
 					int action)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder *ext_amdgpu_encoder = to_amdgpu_encoder(ext_encoder);
@@ -1432,7 +1432,7 @@ union crtc_source_param {
 void
 amdgpu_atombios_encoder_set_crtc_source(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
@@ -1667,7 +1667,7 @@ static bool
 amdgpu_atombios_encoder_dac_load_detect(struct drm_encoder *encoder,
 				 struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
@@ -1717,7 +1717,7 @@ enum drm_connector_status
 amdgpu_atombios_encoder_dac_detect(struct drm_encoder *encoder,
 			    struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
@@ -1756,7 +1756,7 @@ enum drm_connector_status
 amdgpu_atombios_encoder_dig_detect(struct drm_encoder *encoder,
 			    struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
@@ -1965,7 +1965,7 @@ union lvds_info {
 struct amdgpu_encoder_atom_dig *
 amdgpu_atombios_encoder_get_lcd_info(struct amdgpu_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_mode_info *mode_info = &adev->mode_info;
 	int index = GetIndexIntoMasterTable(DATA, LVDS_Info);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 1c745d8adb63..7255ba6012e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -506,7 +506,7 @@ void dce_v10_0_disable_dce(struct amdgpu_device *adev)
 
 static void dce_v10_0_program_fmt(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
@@ -1212,7 +1212,7 @@ static struct amdgpu_audio_pin *dce_v10_0_audio_get_pin(struct amdgpu_device *ad
 
 static void dce_v10_0_afmt_audio_select_pin(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
+	struct amdgpu_device *adev = drm_to_adev(encoder->drm);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	u32 tmp;
@@ -1228,7 +1228,7 @@ static void dce_v10_0_afmt_audio_select_pin(struct drm_encoder *encoder)
 static void dce_v10_0_audio_write_latency_fields(struct drm_encoder *encoder,
 						struct drm_display_mode *mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1274,7 +1274,7 @@ static void dce_v10_0_audio_write_latency_fields(struct drm_encoder *encoder,
 
 static void dce_v10_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1330,7 +1330,7 @@ static void dce_v10_0_audio_write_speaker_allocation(struct drm_encoder *encoder
 
 static void dce_v10_0_audio_write_sad_regs(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1485,7 +1485,7 @@ static void dce_v10_0_audio_fini(struct amdgpu_device *adev)
  */
 static void dce_v10_0_afmt_update_ACR(struct drm_encoder *encoder, uint32_t clock)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_afmt_acr acr = amdgpu_afmt_acr(clock);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
@@ -1521,7 +1521,7 @@ static void dce_v10_0_afmt_update_ACR(struct drm_encoder *encoder, uint32_t cloc
 static void dce_v10_0_afmt_update_avi_infoframe(struct drm_encoder *encoder,
 					       void *buffer, size_t size)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1540,7 +1540,7 @@ static void dce_v10_0_afmt_update_avi_infoframe(struct drm_encoder *encoder,
 
 static void dce_v10_0_audio_set_dto(struct drm_encoder *encoder, u32 clock)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1571,7 +1571,7 @@ static void dce_v10_0_audio_set_dto(struct drm_encoder *encoder, u32 clock)
 static void dce_v10_0_afmt_setmode(struct drm_encoder *encoder,
 				  struct drm_display_mode *mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1751,7 +1751,7 @@ static void dce_v10_0_afmt_setmode(struct drm_encoder *encoder,
 
 static void dce_v10_0_afmt_enable(struct drm_encoder *encoder, bool enable)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -3363,7 +3363,7 @@ dce_v10_0_encoder_mode_set(struct drm_encoder *encoder,
 
 static void dce_v10_0_encoder_prepare(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
+	struct amdgpu_device *adev = drm_to_adev(encoder->drm);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
 
@@ -3402,7 +3402,7 @@ static void dce_v10_0_encoder_prepare(struct drm_encoder *encoder)
 
 static void dce_v10_0_encoder_commit(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	/* need to call this here as we need the crtc set up */
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index e9d97d7f3c38..d896c86a3f31 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -532,7 +532,7 @@ void dce_v11_0_disable_dce(struct amdgpu_device *adev)
 
 static void dce_v11_0_program_fmt(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
@@ -1238,7 +1238,7 @@ static struct amdgpu_audio_pin *dce_v11_0_audio_get_pin(struct amdgpu_device *ad
 
 static void dce_v11_0_afmt_audio_select_pin(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
+	struct amdgpu_device *adev = drm_to_adev(encoder->drm);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	u32 tmp;
@@ -1254,7 +1254,7 @@ static void dce_v11_0_afmt_audio_select_pin(struct drm_encoder *encoder)
 static void dce_v11_0_audio_write_latency_fields(struct drm_encoder *encoder,
 						struct drm_display_mode *mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1300,7 +1300,7 @@ static void dce_v11_0_audio_write_latency_fields(struct drm_encoder *encoder,
 
 static void dce_v11_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1356,7 +1356,7 @@ static void dce_v11_0_audio_write_speaker_allocation(struct drm_encoder *encoder
 
 static void dce_v11_0_audio_write_sad_regs(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1527,7 +1527,7 @@ static void dce_v11_0_audio_fini(struct amdgpu_device *adev)
  */
 static void dce_v11_0_afmt_update_ACR(struct drm_encoder *encoder, uint32_t clock)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_afmt_acr acr = amdgpu_afmt_acr(clock);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
@@ -1563,7 +1563,7 @@ static void dce_v11_0_afmt_update_ACR(struct drm_encoder *encoder, uint32_t cloc
 static void dce_v11_0_afmt_update_avi_infoframe(struct drm_encoder *encoder,
 					       void *buffer, size_t size)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1582,7 +1582,7 @@ static void dce_v11_0_afmt_update_avi_infoframe(struct drm_encoder *encoder,
 
 static void dce_v11_0_audio_set_dto(struct drm_encoder *encoder, u32 clock)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1613,7 +1613,7 @@ static void dce_v11_0_audio_set_dto(struct drm_encoder *encoder, u32 clock)
 static void dce_v11_0_afmt_setmode(struct drm_encoder *encoder,
 				  struct drm_display_mode *mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1793,7 +1793,7 @@ static void dce_v11_0_afmt_setmode(struct drm_encoder *encoder,
 
 static void dce_v11_0_afmt_enable(struct drm_encoder *encoder, bool enable)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -3486,7 +3486,7 @@ dce_v11_0_encoder_mode_set(struct drm_encoder *encoder,
 
 static void dce_v11_0_encoder_prepare(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
+	struct amdgpu_device *adev = drm_to_adev(encoder->drm);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
 
@@ -3525,7 +3525,7 @@ static void dce_v11_0_encoder_prepare(struct drm_encoder *encoder)
 
 static void dce_v11_0_encoder_commit(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	/* need to call this here as we need the crtc set up */
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index e226b57b8ef8..899c74f28c5e 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -403,7 +403,7 @@ void dce_v6_0_disable_dce(struct amdgpu_device *adev)
 static void dce_v6_0_program_fmt(struct drm_encoder *encoder)
 {
 
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
@@ -1116,7 +1116,7 @@ static struct amdgpu_audio_pin *dce_v6_0_audio_get_pin(struct amdgpu_device *ade
 
 static void dce_v6_0_audio_select_pin(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
+	struct amdgpu_device *adev = drm_to_adev(encoder->drm);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 
@@ -1131,7 +1131,7 @@ static void dce_v6_0_audio_select_pin(struct drm_encoder *encoder)
 static void dce_v6_0_audio_write_latency_fields(struct drm_encoder *encoder,
 						struct drm_display_mode *mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1175,7 +1175,7 @@ static void dce_v6_0_audio_write_latency_fields(struct drm_encoder *encoder,
 
 static void dce_v6_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1236,7 +1236,7 @@ static void dce_v6_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 
 static void dce_v6_0_audio_write_sad_regs(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1393,7 +1393,7 @@ static void dce_v6_0_audio_fini(struct amdgpu_device *adev)
 
 static void dce_v6_0_audio_set_vbi_packet(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1409,7 +1409,7 @@ static void dce_v6_0_audio_set_vbi_packet(struct drm_encoder *encoder)
 static void dce_v6_0_audio_set_acr(struct drm_encoder *encoder,
 				   uint32_t clock, int bpc)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_afmt_acr acr = amdgpu_afmt_acr(clock);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
@@ -1447,7 +1447,7 @@ static void dce_v6_0_audio_set_acr(struct drm_encoder *encoder,
 static void dce_v6_0_audio_set_avi_infoframe(struct drm_encoder *encoder,
 					       struct drm_display_mode *mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1489,7 +1489,7 @@ static void dce_v6_0_audio_set_avi_infoframe(struct drm_encoder *encoder,
 
 static void dce_v6_0_audio_set_dto(struct drm_encoder *encoder, u32 clock)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
 	int em = amdgpu_atombios_encoder_get_encoder_mode(encoder);
@@ -1523,7 +1523,7 @@ static void dce_v6_0_audio_set_dto(struct drm_encoder *encoder, u32 clock)
 
 static void dce_v6_0_audio_set_packet(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1567,7 +1567,7 @@ static void dce_v6_0_audio_set_packet(struct drm_encoder *encoder)
 
 static void dce_v6_0_audio_set_mute(struct drm_encoder *encoder, bool mute)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1580,7 +1580,7 @@ static void dce_v6_0_audio_set_mute(struct drm_encoder *encoder, bool mute)
 
 static void dce_v6_0_audio_hdmi_enable(struct drm_encoder *encoder, bool enable)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1617,7 +1617,7 @@ static void dce_v6_0_audio_hdmi_enable(struct drm_encoder *encoder, bool enable)
 
 static void dce_v6_0_audio_dp_enable(struct drm_encoder *encoder, bool enable)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1646,7 +1646,7 @@ static void dce_v6_0_audio_dp_enable(struct drm_encoder *encoder, bool enable)
 static void dce_v6_0_afmt_setmode(struct drm_encoder *encoder,
 				  struct drm_display_mode *mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1715,7 +1715,7 @@ static void dce_v6_0_afmt_setmode(struct drm_encoder *encoder,
 
 static void dce_v6_0_afmt_enable(struct drm_encoder *encoder, bool enable)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -3167,7 +3167,7 @@ dce_v6_0_encoder_mode_set(struct drm_encoder *encoder,
 static void dce_v6_0_encoder_prepare(struct drm_encoder *encoder)
 {
 
-	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
+	struct amdgpu_device *adev = drm_to_adev(encoder->drm);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
 
@@ -3207,7 +3207,7 @@ static void dce_v6_0_encoder_prepare(struct drm_encoder *encoder)
 static void dce_v6_0_encoder_commit(struct drm_encoder *encoder)
 {
 
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	/* need to call this here as we need the crtc set up */
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index e17b9e3a21fc..7b3dbe6318e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -446,7 +446,7 @@ void dce_v8_0_disable_dce(struct amdgpu_device *adev)
 
 static void dce_v8_0_program_fmt(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
@@ -1149,7 +1149,7 @@ static struct amdgpu_audio_pin *dce_v8_0_audio_get_pin(struct amdgpu_device *ade
 
 static void dce_v8_0_afmt_audio_select_pin(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
+	struct amdgpu_device *adev = drm_to_adev(encoder->drm);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
 	u32 offset;
@@ -1166,7 +1166,7 @@ static void dce_v8_0_afmt_audio_select_pin(struct drm_encoder *encoder)
 static void dce_v8_0_audio_write_latency_fields(struct drm_encoder *encoder,
 						struct drm_display_mode *mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1227,7 +1227,7 @@ static void dce_v8_0_audio_write_latency_fields(struct drm_encoder *encoder,
 
 static void dce_v8_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1280,7 +1280,7 @@ static void dce_v8_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 
 static void dce_v8_0_audio_write_sad_regs(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1448,7 +1448,7 @@ static void dce_v8_0_audio_fini(struct amdgpu_device *adev)
  */
 static void dce_v8_0_afmt_update_ACR(struct drm_encoder *encoder, uint32_t clock)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_afmt_acr acr = amdgpu_afmt_acr(clock);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
@@ -1471,7 +1471,7 @@ static void dce_v8_0_afmt_update_ACR(struct drm_encoder *encoder, uint32_t clock
 static void dce_v8_0_afmt_update_avi_infoframe(struct drm_encoder *encoder,
 					       void *buffer, size_t size)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1491,7 +1491,7 @@ static void dce_v8_0_afmt_update_avi_infoframe(struct drm_encoder *encoder,
 
 static void dce_v8_0_audio_set_dto(struct drm_encoder *encoder, u32 clock)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1518,7 +1518,7 @@ static void dce_v8_0_audio_set_dto(struct drm_encoder *encoder, u32 clock)
 static void dce_v8_0_afmt_setmode(struct drm_encoder *encoder,
 				  struct drm_display_mode *mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -1680,7 +1680,7 @@ static void dce_v8_0_afmt_setmode(struct drm_encoder *encoder,
 
 static void dce_v8_0_afmt_enable(struct drm_encoder *encoder, bool enable)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig = amdgpu_encoder->enc_priv;
@@ -3256,7 +3256,7 @@ dce_v8_0_encoder_mode_set(struct drm_encoder *encoder,
 
 static void dce_v8_0_encoder_prepare(struct drm_encoder *encoder)
 {
-	struct amdgpu_device *adev = drm_to_adev(encoder->dev);
+	struct amdgpu_device *adev = drm_to_adev(encoder->drm);
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_connector *connector = amdgpu_get_connector_for_encoder(encoder);
 
@@ -3295,7 +3295,7 @@ static void dce_v8_0_encoder_prepare(struct drm_encoder *encoder)
 
 static void dce_v8_0_encoder_commit(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	/* need to call this here as we need the crtc set up */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ce694e9ed5a3..ebc22b9780c4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6991,7 +6991,7 @@ amdgpu_dm_create_common_mode(struct drm_encoder *encoder,
 			     char *name,
 			     int hdisplay, int vdisplay)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct drm_display_mode *mode = NULL;
 	struct drm_display_mode *native_mode = &amdgpu_encoder->native_mode;
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 0dd21bc77dd8..e34e496b0627 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -129,7 +129,7 @@ malidp_mw_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_connector_state *conn_state)
 {
 	struct malidp_mw_connector_state *mw_state = to_mw_state(conn_state);
-	struct malidp_drm *malidp = drm_to_malidp(encoder->dev);
+	struct malidp_drm *malidp = drm_to_malidp(encoder->drm);
 	struct drm_framebuffer *fb;
 	int i, n_planes;
 
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 90a89d70d832..7bb7f9f3bda5 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -363,7 +363,7 @@ static void d2l_write(struct i2c_client *i2c, u16 addr, u32 val)
 /* helper function to access bus_formats */
 static struct drm_connector *get_connector(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_connector *connector;
 
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head)
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 58101873a651..dfcd7aa474b7 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1241,7 +1241,7 @@ drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,
 	if (!encoder)
 		return 0;
 
-	drm_dbg_atomic(encoder->dev,
+	drm_dbg_atomic(encoder->drm,
 		       "Adding all bridges for [encoder:%d:%s] to %p\n",
 		       encoder->base.id, encoder->name, state);
 
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9828f630fdd2..39e8900e6283 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -272,7 +272,7 @@ steal_encoder(struct drm_atomic_state *state,
 
 		encoder_crtc = old_connector_state->crtc;
 
-		drm_dbg_atomic(encoder->dev,
+		drm_dbg_atomic(encoder->drm,
 			       "[ENCODER:%d:%s] in use on [CRTC:%d:%s], stealing it\n",
 			       encoder->base.id, encoder->name,
 			       encoder_crtc->base.id, encoder_crtc->name);
@@ -452,7 +452,8 @@ mode_fixup(struct drm_atomic_state *state)
 						    new_crtc_state,
 						    new_conn_state);
 		if (ret) {
-			drm_dbg_atomic(encoder->dev, "Bridge atomic check failed\n");
+			drm_dbg_atomic(encoder->drm,
+				       "Bridge atomic check failed\n");
 			return ret;
 		}
 
@@ -460,7 +461,7 @@ mode_fixup(struct drm_atomic_state *state)
 			ret = funcs->atomic_check(encoder, new_crtc_state,
 						  new_conn_state);
 			if (ret) {
-				drm_dbg_atomic(encoder->dev,
+				drm_dbg_atomic(encoder->drm,
 					       "[ENCODER:%d:%s] check failed\n",
 					       encoder->base.id, encoder->name);
 				return ret;
@@ -469,7 +470,7 @@ mode_fixup(struct drm_atomic_state *state)
 			ret = funcs->mode_fixup(encoder, &new_crtc_state->mode,
 						&new_crtc_state->adjusted_mode);
 			if (!ret) {
-				drm_dbg_atomic(encoder->dev,
+				drm_dbg_atomic(encoder->drm,
 					       "[ENCODER:%d:%s] fixup failed\n",
 					       encoder->base.id, encoder->name);
 				return -EINVAL;
@@ -514,7 +515,7 @@ static enum drm_mode_status mode_valid_path(struct drm_connector *connector,
 
 	ret = drm_encoder_mode_valid(encoder, mode);
 	if (ret != MODE_OK) {
-		drm_dbg_atomic(encoder->dev,
+		drm_dbg_atomic(encoder->drm,
 			       "[ENCODER:%d:%s] mode_valid() failed\n",
 			       encoder->base.id, encoder->name);
 		return ret;
@@ -524,13 +525,14 @@ static enum drm_mode_status mode_valid_path(struct drm_connector *connector,
 	ret = drm_bridge_chain_mode_valid(bridge, &connector->display_info,
 					  mode);
 	if (ret != MODE_OK) {
-		drm_dbg_atomic(encoder->dev, "[BRIDGE] mode_valid() failed\n");
+		drm_dbg_atomic(encoder->drm, "[BRIDGE] mode_valid() failed\n");
 		return ret;
 	}
 
 	ret = drm_crtc_mode_valid(crtc, mode);
 	if (ret != MODE_OK) {
-		drm_dbg_atomic(encoder->dev, "[CRTC:%d:%s] mode_valid() failed\n",
+		drm_dbg_atomic(encoder->drm,
+			       "[CRTC:%d:%s] mode_valid() failed\n",
 			       crtc->base.id, crtc->name);
 		return ret;
 	}
@@ -821,7 +823,8 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
 		if (fb->format->format == formats[i])
 			return 0;
 
-	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
+	drm_dbg_kms(encoder->drm, "Invalid pixel format %p4cc\n",
+		    &fb->format->format);
 
 	return -EINVAL;
 }
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index cdc373f56ce6..f952b6d7e128 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -311,7 +311,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	if (bridge->drm)
 		return -EBUSY;
 
-	bridge->drm = encoder->dev;
+	bridge->drm = encoder->drm;
 	bridge->encoder = encoder;
 
 	if (previous)
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index d610c9e740d0..c5dbfec52c0e 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -108,7 +108,7 @@ bool drm_helper_encoder_in_use(struct drm_encoder *encoder)
 {
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 
 	WARN_ON(drm_drv_uses_atomic_modeset(dev));
 
@@ -839,7 +839,7 @@ static int drm_helper_choose_encoder_dpms(struct drm_encoder *encoder)
 	int dpms = DRM_MODE_DPMS_OFF;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter)
diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 1143bc7f3252..e4ded7cd329b 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -109,7 +109,7 @@ static int __drm_encoder_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	encoder->dev = dev;
+	encoder->drm = dev;
 	encoder->encoder_type = encoder_type;
 	encoder->funcs = funcs;
 	if (name) {
@@ -182,7 +182,7 @@ EXPORT_SYMBOL(drm_encoder_init);
  */
 void drm_encoder_cleanup(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_bridge *bridge, *next;
 
 	/* Note that the encoder_list is considered to be static; should we
@@ -207,7 +207,7 @@ static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
 {
 	struct drm_encoder *encoder = ptr;
 
-	if (WARN_ON(!encoder->dev))
+	if (WARN_ON(!encoder->drm))
 		return;
 
 	drm_encoder_cleanup(encoder);
@@ -300,7 +300,7 @@ EXPORT_SYMBOL(drmm_encoder_init);
 static struct drm_crtc *drm_encoder_get_crtc(struct drm_encoder *encoder)
 {
 	struct drm_connector *connector;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	bool uses_atomic = false;
 	struct drm_connector_list_iter conn_iter;
 
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 87eb591fe9b5..f9eed0916fe1 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -584,7 +584,7 @@ static void fixup_encoder_possible_clones(struct drm_encoder *encoder)
 
 static void validate_encoder_possible_clones(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	u32 encoder_mask = full_encoder_mask(dev);
 	struct drm_encoder *other;
 
@@ -621,7 +621,7 @@ static u32 full_crtc_mask(struct drm_device *dev)
 
 static void validate_encoder_possible_crtcs(struct drm_encoder *encoder)
 {
-	u32 crtc_mask = full_crtc_mask(encoder->dev);
+	u32 crtc_mask = full_crtc_mask(encoder->drm);
 
 	WARN((encoder->possible_crtcs & crtc_mask) == 0 ||
 	     (encoder->possible_crtcs & ~crtc_mask) != 0,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 395c79eb438f..368e2e14c831 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -221,8 +221,8 @@ struct exynos_drm_crtc *exynos_drm_crtc_get_by_type(struct drm_device *drm_dev,
 int exynos_drm_set_possible_crtcs(struct drm_encoder *encoder,
 		enum exynos_drm_output_type out_type)
 {
-	struct exynos_drm_crtc *crtc = exynos_drm_crtc_get_by_type(encoder->dev,
-						out_type);
+	struct exynos_drm_crtc *crtc = exynos_drm_crtc_get_by_type(encoder->drm,
+								   out_type);
 
 	if (IS_ERR(crtc))
 		return PTR_ERR(crtc);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 16bef23c6a73..def6679d7c51 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -99,7 +99,7 @@ static int exynos_dpi_create_connector(struct drm_encoder *encoder)
 
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 
-	ret = drm_connector_init(encoder->dev, connector,
+	ret = drm_connector_init(encoder->drm, connector,
 				 &exynos_dpi_connector_funcs,
 				 DRM_MODE_CONNECTOR_VGA);
 	if (ret) {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index fc81f728e6ba..5bd77acd0d28 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -37,7 +37,7 @@ static int exynos_dsi_host_attach(struct samsung_dsim *dsim,
 {
 	struct exynos_dsi *dsi = dsim->priv;
 	struct drm_encoder *encoder = &dsi->encoder;
-	struct drm_device *drm = encoder->dev;
+	struct drm_device *drm = encoder->drm;
 
 	drm_bridge_attach(encoder, &dsim->bridge,
 			  list_first_entry_or_null(&encoder->bridge_chain,
@@ -64,7 +64,7 @@ static void exynos_dsi_host_detach(struct samsung_dsim *dsim,
 				   struct mipi_dsi_device *device)
 {
 	struct exynos_dsi *dsi = dsim->priv;
-	struct drm_device *drm = dsi->encoder.dev;
+	struct drm_device *drm = dsi->encoder.drm;
 
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index b7c11bdce2c8..1a4cec02dd0c 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -989,7 +989,7 @@ static bool hdmi_mode_fixup(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode,
 			    struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_connector *connector;
 	struct drm_display_mode *m;
 	struct drm_connector_list_iter conn_iter;
diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/gma500/cdv_intel_crt.c
index 2bb9b92aa414..587478c1e0f2 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
@@ -42,7 +42,7 @@
 
 static void cdv_intel_crt_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	u32 temp, reg;
 	reg = ADPA;
 
@@ -90,7 +90,7 @@ static void cdv_intel_crt_mode_set(struct drm_encoder *encoder,
 			       struct drm_display_mode *adjusted_mode)
 {
 
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_crtc *crtc = encoder->crtc;
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	int dpll_md_reg;
diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index e525a6782245..2f71ce9ae848 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -375,7 +375,7 @@ cdv_intel_dp_max_data_rate(int max_link_clock, int max_lanes)
 
 static void cdv_intel_edp_panel_vdd_on(struct gma_encoder *intel_encoder)
 {
-	struct drm_device *dev = intel_encoder->base.dev;
+	struct drm_device *dev = intel_encoder->base.drm;
 	struct cdv_intel_dp *intel_dp = intel_encoder->dev_priv;
 	u32 pp;
 
@@ -395,7 +395,7 @@ static void cdv_intel_edp_panel_vdd_on(struct gma_encoder *intel_encoder)
 
 static void cdv_intel_edp_panel_vdd_off(struct gma_encoder *intel_encoder)
 {
-	struct drm_device *dev = intel_encoder->base.dev;
+	struct drm_device *dev = intel_encoder->base.drm;
 	u32 pp;
 
 	DRM_DEBUG_KMS("\n");
@@ -410,7 +410,7 @@ static void cdv_intel_edp_panel_vdd_off(struct gma_encoder *intel_encoder)
 /* Returns true if the panel was already on when called */
 static bool cdv_intel_edp_panel_on(struct gma_encoder *intel_encoder)
 {
-	struct drm_device *dev = intel_encoder->base.dev;
+	struct drm_device *dev = intel_encoder->base.drm;
 	struct cdv_intel_dp *intel_dp = intel_encoder->dev_priv;
 	u32 pp, idle_on_mask = PP_ON | PP_SEQUENCE_NONE;
 
@@ -437,7 +437,7 @@ static bool cdv_intel_edp_panel_on(struct gma_encoder *intel_encoder)
 
 static void cdv_intel_edp_panel_off (struct gma_encoder *intel_encoder)
 {
-	struct drm_device *dev = intel_encoder->base.dev;
+	struct drm_device *dev = intel_encoder->base.drm;
 	u32 pp, idle_off_mask = PP_ON ;
 	struct cdv_intel_dp *intel_dp = intel_encoder->dev_priv;
 
@@ -469,7 +469,7 @@ static void cdv_intel_edp_panel_off (struct gma_encoder *intel_encoder)
 
 static void cdv_intel_edp_backlight_on (struct gma_encoder *intel_encoder)
 {
-	struct drm_device *dev = intel_encoder->base.dev;
+	struct drm_device *dev = intel_encoder->base.drm;
 	u32 pp;
 
 	DRM_DEBUG_KMS("\n");
@@ -489,7 +489,7 @@ static void cdv_intel_edp_backlight_on (struct gma_encoder *intel_encoder)
 
 static void cdv_intel_edp_backlight_off (struct gma_encoder *intel_encoder)
 {
-	struct drm_device *dev = intel_encoder->base.dev;
+	struct drm_device *dev = intel_encoder->base.drm;
 	struct cdv_intel_dp *intel_dp = intel_encoder->dev_priv;
 	u32 pp;
 
@@ -569,7 +569,7 @@ cdv_intel_dp_aux_ch(struct gma_encoder *encoder,
 {
 	struct cdv_intel_dp *intel_dp = encoder->dev_priv;
 	uint32_t output_reg = intel_dp->output_reg;
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	uint32_t ch_ctl = output_reg + 0x10;
 	uint32_t ch_data = ch_ctl + 4;
 	int i;
@@ -892,7 +892,7 @@ static bool
 cdv_intel_dp_mode_fixup(struct drm_encoder *encoder, const struct drm_display_mode *mode,
 		    struct drm_display_mode *adjusted_mode)
 {
-	struct drm_psb_private *dev_priv = to_drm_psb_private(encoder->dev);
+	struct drm_psb_private *dev_priv = to_drm_psb_private(encoder->drm);
 	struct gma_encoder *intel_encoder = to_gma_encoder(encoder);
 	struct cdv_intel_dp *intel_dp = intel_encoder->dev_priv;
 	int lane_count, clock;
@@ -1040,7 +1040,7 @@ cdv_intel_dp_mode_set(struct drm_encoder *encoder, struct drm_display_mode *mode
 	struct drm_crtc *crtc = encoder->crtc;
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	struct cdv_intel_dp *intel_dp = intel_encoder->dev_priv;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 
 	intel_dp->DP = DP_VOLTAGE_0_4 | DP_PRE_EMPHASIS_0;
 	intel_dp->DP |= intel_dp->color_range;
@@ -1168,7 +1168,7 @@ cdv_intel_dp_dpms(struct drm_encoder *encoder, int mode)
 {
 	struct gma_encoder *intel_encoder = to_gma_encoder(encoder);
 	struct cdv_intel_dp *intel_dp = intel_encoder->dev_priv;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	uint32_t dp_reg = REG_READ(intel_dp->output_reg);
 	int edp = is_edp(intel_encoder);
 
@@ -1354,7 +1354,7 @@ cdv_intel_dp_set_link_train(struct gma_encoder *encoder,
 			uint32_t dp_reg_value,
 			uint8_t dp_train_pat)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	int ret;
 	struct cdv_intel_dp *intel_dp = encoder->dev_priv;
 
@@ -1398,7 +1398,7 @@ cdv_intel_dplink_set_level(struct gma_encoder *encoder,
 static void
 cdv_intel_dp_set_vswing_premph(struct gma_encoder *encoder, uint8_t signal_level)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct cdv_intel_dp *intel_dp = encoder->dev_priv;
 	struct ddi_regoff *ddi_reg;
 	int vswing, premph, index;
@@ -1464,7 +1464,7 @@ cdv_intel_dp_set_vswing_premph(struct gma_encoder *encoder, uint8_t signal_level
 static void
 cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct cdv_intel_dp *intel_dp = encoder->dev_priv;
 	int i;
 	uint8_t voltage;
@@ -1557,7 +1557,7 @@ cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
 static void
 cdv_intel_dp_complete_link_train(struct gma_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct cdv_intel_dp *intel_dp = encoder->dev_priv;
 	int tries, cr_tries;
 	u32 reg;
@@ -1640,7 +1640,7 @@ cdv_intel_dp_complete_link_train(struct gma_encoder *encoder)
 static void
 cdv_intel_dp_link_down(struct gma_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct cdv_intel_dp *intel_dp = encoder->dev_priv;
 	uint32_t DP = intel_dp->DP;
 
diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index 555c33d51ffe..e42b6aa79c45 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -62,7 +62,7 @@ static void cdv_hdmi_mode_set(struct drm_encoder *encoder,
 			struct drm_display_mode *mode,
 			struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct gma_encoder *gma_encoder = to_gma_encoder(encoder);
 	struct mid_intel_hdmi_priv *hdmi_priv = gma_encoder->dev_priv;
 	u32 hdmib;
@@ -90,7 +90,7 @@ static void cdv_hdmi_mode_set(struct drm_encoder *encoder,
 
 static void cdv_hdmi_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct gma_encoder *gma_encoder = to_gma_encoder(encoder);
 	struct mid_intel_hdmi_priv *hdmi_priv = gma_encoder->dev_priv;
 	u32 hdmib;
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 605cc7031015..4d9e0021f58f 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -136,7 +136,7 @@ static void cdv_intel_lvds_set_power(struct drm_device *dev,
 
 static void cdv_intel_lvds_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	if (mode == DRM_MODE_DPMS_ON)
 		cdv_intel_lvds_set_power(dev, encoder, true);
 	else
@@ -181,7 +181,7 @@ static bool cdv_intel_lvds_mode_fixup(struct drm_encoder *encoder,
 				  const struct drm_display_mode *mode,
 				  struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 	struct drm_encoder *tmp_encoder;
@@ -228,7 +228,7 @@ static bool cdv_intel_lvds_mode_fixup(struct drm_encoder *encoder,
 
 static void cdv_intel_lvds_prepare(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 
@@ -246,7 +246,7 @@ static void cdv_intel_lvds_prepare(struct drm_encoder *encoder)
 
 static void cdv_intel_lvds_commit(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 
@@ -261,7 +261,7 @@ static void cdv_intel_lvds_mode_set(struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(encoder->crtc);
 	u32 pfit_control;
@@ -381,7 +381,7 @@ static int cdv_intel_lvds_set_property(struct drm_connector *connector,
 							value))
 			return -1;
 		else
-                        gma_backlight_set(encoder->dev, value);
+                        gma_backlight_set(encoder->drm, value);
 	} else if (!strcmp(property->name, "DPMS") && encoder) {
 		const struct drm_encoder_helper_funcs *helpers =
 					encoder->helper_private;
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index e0ac4c88c762..79baee98cf74 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -496,7 +496,7 @@ static void oaktrail_hdmi_dpms(struct drm_encoder *encoder, int mode)
 {
 	static int dpms_mode = -1;
 
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct oaktrail_hdmi_dev *hdmi_dev = dev_priv->hdmi_priv;
 	u32 temp;
@@ -592,7 +592,7 @@ static void oaktrail_hdmi_mode_set(struct drm_encoder *encoder,
 			       struct drm_display_mode *mode,
 			       struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 
 	oaktrail_hdmi_audio_enable(dev);
 	return;
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index d974d0c60d2a..bec28856ca09 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -68,7 +68,7 @@ static void oaktrail_lvds_set_power(struct drm_device *dev,
 
 static void oaktrail_lvds_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct gma_encoder *gma_encoder = to_gma_encoder(encoder);
 
 	if (mode == DRM_MODE_DPMS_ON)
@@ -83,7 +83,7 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
 			       struct drm_display_mode *mode,
 			       struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 	struct drm_connector_list_iter conn_iter;
@@ -156,7 +156,7 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
 
 static void oaktrail_lvds_prepare(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_encoder *gma_encoder = to_gma_encoder(encoder);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
@@ -192,7 +192,7 @@ static u32 oaktrail_lvds_get_max_backlight(struct drm_device *dev)
 
 static void oaktrail_lvds_commit(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_encoder *gma_encoder = to_gma_encoder(encoder);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 48e1a8b0d869..cf679051bca6 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -240,7 +240,7 @@ static void psb_intel_lvds_set_power(struct drm_device *dev, bool on)
 
 static void psb_intel_lvds_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 
 	if (mode == DRM_MODE_DPMS_ON)
 		psb_intel_lvds_set_power(dev, true);
@@ -362,7 +362,7 @@ bool psb_intel_lvds_mode_fixup(struct drm_encoder *encoder,
 				  const struct drm_display_mode *mode,
 				  struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 	struct gma_crtc *gma_crtc = to_gma_crtc(encoder->crtc);
@@ -423,7 +423,7 @@ bool psb_intel_lvds_mode_fixup(struct drm_encoder *encoder,
 
 static void psb_intel_lvds_prepare(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 
@@ -441,7 +441,7 @@ static void psb_intel_lvds_prepare(struct drm_encoder *encoder)
 
 static void psb_intel_lvds_commit(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 
@@ -456,7 +456,7 @@ static void psb_intel_lvds_mode_set(struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	u32 pfit_control;
 
@@ -576,7 +576,7 @@ int psb_intel_lvds_set_property(struct drm_connector *connector,
 							value))
 			goto set_prop_error;
 		else
-                        gma_backlight_set(encoder->dev, value);
+                        gma_backlight_set(encoder->drm, value);
 	} else if (!strcmp(property->name, "DPMS")) {
 		const struct drm_encoder_helper_funcs *hfuncs
 						= encoder->helper_private;
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index 91b5aa9d92ed..68357c67b5e8 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -230,7 +230,7 @@ psb_intel_sdvo_create_enhance_property(struct psb_intel_sdvo *psb_intel_sdvo,
  */
 static void psb_intel_sdvo_write_sdvox(struct psb_intel_sdvo *psb_intel_sdvo, u32 val)
 {
-	struct drm_device *dev = psb_intel_sdvo->base.base.dev;
+	struct drm_device *dev = psb_intel_sdvo->base.base.drm;
 	u32 bval = val, cval = val;
 	int i, j;
 	int need_aux = IS_MRST(dev) ? 1 : 0;
@@ -405,7 +405,7 @@ static const struct _sdvo_cmd_name {
 static void psb_intel_sdvo_debug_write(struct psb_intel_sdvo *psb_intel_sdvo,
 				       u8 cmd, const void *args, int args_len)
 {
-	struct drm_device *dev = psb_intel_sdvo->base.base.dev;
+	struct drm_device *dev = psb_intel_sdvo->base.base.drm;
 	int i, pos = 0;
 	char buffer[73];
 
@@ -506,7 +506,7 @@ static bool psb_intel_sdvo_write_cmd(struct psb_intel_sdvo *psb_intel_sdvo, u8 c
 static bool psb_intel_sdvo_read_response(struct psb_intel_sdvo *psb_intel_sdvo,
 					 void *response, int response_len)
 {
-	struct drm_device *dev = psb_intel_sdvo->base.base.dev;
+	struct drm_device *dev = psb_intel_sdvo->base.base.drm;
 	char buffer[73];
 	int i, pos = 0;
 	u8 retry = 5;
@@ -989,7 +989,7 @@ static void psb_intel_sdvo_mode_set(struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_crtc *crtc = encoder->crtc;
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	struct psb_intel_sdvo *psb_intel_sdvo = to_psb_intel_sdvo(encoder);
@@ -1094,7 +1094,7 @@ static void psb_intel_sdvo_mode_set(struct drm_encoder *encoder,
 
 static void psb_intel_sdvo_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct psb_intel_sdvo *psb_intel_sdvo = to_psb_intel_sdvo(encoder);
 	u32 temp;
 	int i;
@@ -1786,7 +1786,7 @@ static void psb_intel_sdvo_enc_destroy(struct drm_encoder *encoder)
 	struct psb_intel_sdvo *psb_intel_sdvo = to_psb_intel_sdvo(encoder);
 
 	if (psb_intel_sdvo->sdvo_lvds_fixed_mode != NULL)
-		drm_mode_destroy(encoder->dev,
+		drm_mode_destroy(encoder->drm,
 				 psb_intel_sdvo->sdvo_lvds_fixed_mode);
 
 	i2c_del_adapter(&psb_intel_sdvo->ddc);
@@ -1939,7 +1939,7 @@ static void
 psb_intel_sdvo_connector_init(struct psb_intel_sdvo_connector *connector,
 			  struct psb_intel_sdvo *encoder)
 {
-	drm_connector_init(encoder->base.base.dev,
+	drm_connector_init(encoder->base.base.drm,
 			   &connector->base.base,
 			   &psb_intel_sdvo_connector_funcs,
 			   connector->base.base.connector_type);
@@ -2181,7 +2181,7 @@ static bool psb_intel_sdvo_tv_create_property(struct psb_intel_sdvo *psb_intel_s
 					  struct psb_intel_sdvo_connector *psb_intel_sdvo_connector,
 					  int type)
 {
-	struct drm_device *dev = psb_intel_sdvo->base.base.dev;
+	struct drm_device *dev = psb_intel_sdvo->base.base.drm;
 	struct psb_intel_sdvo_tv_format format;
 	uint32_t format_map, i;
 
@@ -2246,7 +2246,7 @@ psb_intel_sdvo_create_enhance_property_tv(struct psb_intel_sdvo *psb_intel_sdvo,
 				      struct psb_intel_sdvo_connector *psb_intel_sdvo_connector,
 				      struct psb_intel_sdvo_enhancements_reply enhancements)
 {
-	struct drm_device *dev = psb_intel_sdvo->base.base.dev;
+	struct drm_device *dev = psb_intel_sdvo->base.base.drm;
 	struct drm_connector *connector = &psb_intel_sdvo_connector->base.base;
 	uint16_t response, data_value[2];
 
@@ -2361,7 +2361,7 @@ psb_intel_sdvo_create_enhance_property_lvds(struct psb_intel_sdvo *psb_intel_sdv
 					struct psb_intel_sdvo_connector *psb_intel_sdvo_connector,
 					struct psb_intel_sdvo_enhancements_reply enhancements)
 {
-	struct drm_device *dev = psb_intel_sdvo->base.base.dev;
+	struct drm_device *dev = psb_intel_sdvo->base.base.drm;
 	struct drm_connector *connector = &psb_intel_sdvo_connector->base.base;
 	uint16_t response, data_value[2];
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 380125fd8bcb..7be72e916889 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -71,7 +71,7 @@ static void hibmc_encoder_mode_set(struct drm_encoder *encoder,
 				   struct drm_display_mode *adj_mode)
 {
 	u32 reg;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 
 	reg = readl(priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 566de4658719..8df594c8eccc 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -653,7 +653,7 @@ static enum drm_mode_status dsi_encoder_mode_valid(struct drm_encoder *encoder,
 	 * mode_fixup to figure out the adjusted mode before we
 	 * validate it.
 	 */
-	drm_for_each_crtc(crtc, encoder->dev) {
+	drm_for_each_crtc(crtc, encoder->drm) {
 		/*
 		 * reset adj_mode to the mode value each time,
 		 * so we don't adjust the mode twice
diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 131512a5f3bd..5979e5502b25 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -44,7 +44,7 @@ static void ch7006_encoder_destroy(struct drm_encoder *encoder)
 {
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 
-	drm_property_destroy(encoder->dev, priv->scale_property);
+	drm_property_destroy(encoder->drm, priv->scale_property);
 
 	kfree(priv);
 	to_encoder_slave(encoder)->slave_priv = NULL;
@@ -217,8 +217,8 @@ static enum drm_connector_status ch7006_encoder_detect(struct drm_encoder *encod
 		priv->subconnector = DRM_MODE_SUBCONNECTOR_Unknown;
 
 	drm_object_property_set_value(&connector->base,
-			encoder->dev->mode_config.tv_subconnector_property,
-							priv->subconnector);
+			encoder->drm->mode_config.tv_subconnector_property,
+			priv->subconnector);
 
 	return priv->subconnector ? connector_status_connected :
 					connector_status_disconnected;
@@ -237,7 +237,7 @@ static int ch7006_encoder_get_modes(struct drm_encoder *encoder,
 			continue;
 
 		drm_mode_probed_add(connector,
-				drm_mode_duplicate(encoder->dev, &mode->mode));
+				drm_mode_duplicate(encoder->drm, &mode->mode));
 
 		n++;
 	}
@@ -249,7 +249,7 @@ static int ch7006_encoder_create_resources(struct drm_encoder *encoder,
 					   struct drm_connector *connector)
 {
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_mode_config *conf = &dev->mode_config;
 
 	drm_mode_create_tv_properties_legacy(dev, NUM_TV_NORMS, ch7006_tv_norm_names);
@@ -288,7 +288,7 @@ static int ch7006_encoder_set_property(struct drm_encoder *encoder,
 	struct i2c_client *client = drm_i2c_encoder_get_client(encoder);
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 	struct ch7006_state *state = &priv->state;
-	struct drm_mode_config *conf = &encoder->dev->mode_config;
+	struct drm_mode_config *conf = &encoder->drm->mode_config;
 	struct drm_crtc *crtc = encoder->crtc;
 	bool modes_changed = false;
 
diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c b/drivers/gpu/drm/i915/display/g4x_dp.c
index 85ad8466bc81..a17669cdb86a 100644
--- a/drivers/gpu/drm/i915/display/g4x_dp.c
+++ b/drivers/gpu/drm/i915/display/g4x_dp.c
@@ -56,7 +56,7 @@ const struct dpll *vlv_get_dpll(struct drm_i915_private *i915)
 void g4x_dp_set_clock(struct intel_encoder *encoder,
 		      struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	const struct dpll *divisor = NULL;
 	int i, count = 0;
 
@@ -88,7 +88,7 @@ void g4x_dp_set_clock(struct intel_encoder *encoder,
 static void intel_dp_prepare(struct intel_encoder *encoder,
 			     const struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	enum port port = encoder->port;
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
@@ -166,7 +166,7 @@ static void intel_dp_prepare(struct intel_encoder *encoder,
 static void assert_dp_port(struct intel_dp *intel_dp, bool state)
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
-	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.drm);
 	bool cur_state = intel_de_read(dev_priv, intel_dp->output_reg) & DP_PORT_EN;
 
 	I915_STATE_WARN(dev_priv, cur_state != state,
@@ -296,7 +296,7 @@ bool g4x_dp_port_enabled(struct drm_i915_private *dev_priv,
 static bool intel_dp_get_hw_state(struct intel_encoder *encoder,
 				  enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	intel_wakeref_t wakeref;
 	bool ret;
@@ -332,7 +332,7 @@ static void g4x_dp_get_m_n(struct intel_crtc_state *crtc_state)
 static void intel_dp_get_config(struct intel_encoder *encoder,
 				struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	u32 tmp, flags = 0;
 	enum port port = encoder->port;
@@ -403,7 +403,7 @@ static void
 intel_dp_link_down(struct intel_encoder *encoder,
 		   const struct intel_crtc_state *old_crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 	enum port port = encoder->port;
@@ -540,7 +540,7 @@ static void chv_post_disable_dp(struct intel_atomic_state *state,
 				const struct intel_crtc_state *old_crtc_state,
 				const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	intel_dp_link_down(encoder, old_crtc_state);
 
@@ -637,7 +637,7 @@ static void intel_enable_dp(struct intel_atomic_state *state,
 			    const struct intel_crtc_state *pipe_config,
 			    const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	u32 dp_reg = intel_de_read(dev_priv, intel_dp->output_reg);
 	intel_wakeref_t wakeref;
@@ -991,7 +991,7 @@ static void
 g4x_set_signal_levels(struct intel_encoder *encoder,
 		      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	u8 train_set = intel_dp->train_set[0];
 	u32 signal_levels;
@@ -1039,7 +1039,7 @@ static void
 snb_cpu_edp_set_signal_levels(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	u8 train_set = intel_dp->train_set[0];
 	u32 signal_levels;
@@ -1091,7 +1091,7 @@ static void
 ivb_cpu_edp_set_signal_levels(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	u8 train_set = intel_dp->train_set[0];
 	u32 signal_levels;
@@ -1153,7 +1153,7 @@ intel_dp_hotplug(struct intel_encoder *encoder,
 
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
-	drm_WARN(encoder->base.dev, ret,
+	drm_WARN(encoder->base.drm, ret,
 		 "Acquiring modeset locks failed with %i\n", ret);
 
 	/*
@@ -1168,7 +1168,7 @@ intel_dp_hotplug(struct intel_encoder *encoder,
 
 static bool ibx_digital_port_connected(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 bit = dev_priv->display.hotplug.pch_hpd[encoder->hpd_pin];
 
 	return intel_de_read(dev_priv, SDEISR) & bit;
@@ -1176,7 +1176,7 @@ static bool ibx_digital_port_connected(struct intel_encoder *encoder)
 
 static bool g4x_digital_port_connected(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 bit;
 
 	switch (encoder->hpd_pin) {
@@ -1199,7 +1199,7 @@ static bool g4x_digital_port_connected(struct intel_encoder *encoder)
 
 static bool ilk_digital_port_connected(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 bit = dev_priv->display.hotplug.hpd[encoder->hpd_pin];
 
 	return intel_de_read(dev_priv, DEISR) & bit;
@@ -1228,7 +1228,7 @@ enum pipe vlv_active_pipe(struct intel_dp *intel_dp)
 
 static void intel_dp_encoder_reset(struct drm_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(to_intel_encoder(encoder));
 
 	intel_dp->DP = intel_de_read(dev_priv, intel_dp->output_reg);
diff --git a/drivers/gpu/drm/i915/display/g4x_hdmi.c b/drivers/gpu/drm/i915/display/g4x_hdmi.c
index 7f3743dea587..8acab6eb529e 100644
--- a/drivers/gpu/drm/i915/display/g4x_hdmi.c
+++ b/drivers/gpu/drm/i915/display/g4x_hdmi.c
@@ -25,7 +25,7 @@
 static void intel_hdmi_prepare(struct intel_encoder *encoder,
 			       const struct intel_crtc_state *crtc_state)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
@@ -64,7 +64,7 @@ static void intel_hdmi_prepare(struct intel_encoder *encoder,
 static bool intel_hdmi_get_hw_state(struct intel_encoder *encoder,
 				    enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
 	intel_wakeref_t wakeref;
 	bool ret;
@@ -131,7 +131,7 @@ static int g4x_hdmi_compute_config(struct intel_encoder *encoder,
 {
 	struct intel_atomic_state *state = to_intel_atomic_state(crtc_state->uapi.state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	if (HAS_PCH_SPLIT(i915))
 		crtc_state->has_pch_encoder = true;
@@ -149,7 +149,7 @@ static void intel_hdmi_get_config(struct intel_encoder *encoder,
 				  struct intel_crtc_state *pipe_config)
 {
 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	u32 tmp, flags = 0;
 	int dotclock;
@@ -216,7 +216,7 @@ static void intel_hdmi_get_config(struct intel_encoder *encoder,
 static void g4x_hdmi_enable_port(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
 	u32 temp;
@@ -236,7 +236,7 @@ static void g4x_enable_hdmi(struct intel_atomic_state *state,
 			    const struct intel_crtc_state *pipe_config,
 			    const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	g4x_hdmi_enable_port(encoder, pipe_config);
 
@@ -250,7 +250,7 @@ static void ibx_enable_hdmi(struct intel_atomic_state *state,
 			    const struct intel_crtc_state *pipe_config,
 			    const struct drm_connector_state *conn_state)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
 	u32 temp;
@@ -303,7 +303,7 @@ static void cpt_enable_hdmi(struct intel_atomic_state *state,
 			    const struct intel_crtc_state *pipe_config,
 			    const struct drm_connector_state *conn_state)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
@@ -358,7 +358,7 @@ static void vlv_enable_hdmi(struct intel_atomic_state *state,
 			    const struct intel_crtc_state *pipe_config,
 			    const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	drm_WARN_ON(&dev_priv->drm, pipe_config->has_audio &&
 		    !pipe_config->has_hdmi_sink);
@@ -370,7 +370,7 @@ static void intel_disable_hdmi(struct intel_atomic_state *state,
 			       const struct intel_crtc_state *old_crtc_state,
 			       const struct drm_connector_state *old_conn_state)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
 	struct intel_digital_port *dig_port =
@@ -471,7 +471,7 @@ static void vlv_hdmi_pre_enable(struct intel_atomic_state *state,
 				const struct drm_connector_state *conn_state)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	vlv_phy_pre_encoder_enable(encoder, pipe_config);
 
@@ -531,7 +531,7 @@ static void chv_hdmi_post_disable(struct intel_atomic_state *state,
 				  const struct intel_crtc_state *old_crtc_state,
 				  const struct drm_connector_state *old_conn_state)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 
 	vlv_dpio_get(dev_priv);
@@ -548,7 +548,7 @@ static void chv_hdmi_pre_enable(struct intel_atomic_state *state,
 				const struct drm_connector_state *conn_state)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 
 	chv_phy_pre_encoder_enable(encoder, pipe_config);
diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index 995ba2ed1e87..da401441cd5a 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -97,7 +97,7 @@ static enum transcoder dsi_port_to_transcoder(enum port port)
 
 static void wait_for_cmds_dispatched_to_panel(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	struct mipi_dsi_device *dsi;
 	enum port port;
@@ -141,7 +141,7 @@ static int dsi_send_pkt_payld(struct intel_dsi_host *host,
 			      const struct mipi_dsi_packet *packet)
 {
 	struct intel_dsi *intel_dsi = host->intel_dsi;
-	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.drm);
 	enum transcoder dsi_trans = dsi_port_to_transcoder(host->port);
 	const u8 *data = packet->payload;
 	u32 len = packet->payload_length;
@@ -173,7 +173,7 @@ static int dsi_send_pkt_hdr(struct intel_dsi_host *host,
 			    bool enable_lpdt)
 {
 	struct intel_dsi *intel_dsi = host->intel_dsi;
-	struct drm_i915_private *dev_priv = to_i915(intel_dsi->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_dsi->base.base.drm);
 	enum transcoder dsi_trans = dsi_port_to_transcoder(host->port);
 	u32 tmp;
 
@@ -230,7 +230,7 @@ void icl_dsi_frame_update(struct intel_crtc_state *crtc_state)
 
 static void dsi_program_swing_and_deemphasis(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum phy phy;
 	u32 tmp, mask, val;
@@ -276,7 +276,7 @@ static void dsi_program_swing_and_deemphasis(struct intel_encoder *encoder)
 static void configure_dual_link_mode(struct intel_encoder *encoder,
 				     const struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	i915_reg_t dss_ctl1_reg, dss_ctl2_reg;
 	u32 dss_ctl1;
@@ -340,7 +340,7 @@ static int afe_clk(struct intel_encoder *encoder,
 static void gen11_dsi_program_esc_clk_div(struct intel_encoder *encoder,
 					  const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 	int afe_clk_khz;
@@ -396,7 +396,7 @@ static void get_dsi_io_power_domains(struct drm_i915_private *dev_priv,
 
 static void gen11_dsi_enable_io_power(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -409,7 +409,7 @@ static void gen11_dsi_enable_io_power(struct intel_encoder *encoder)
 
 static void gen11_dsi_power_up_lanes(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum phy phy;
 
@@ -420,7 +420,7 @@ static void gen11_dsi_power_up_lanes(struct intel_encoder *encoder)
 
 static void gen11_dsi_config_phy_lanes_sequence(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum phy phy;
 	u32 tmp;
@@ -461,7 +461,7 @@ static void gen11_dsi_config_phy_lanes_sequence(struct intel_encoder *encoder)
 
 static void gen11_dsi_voltage_swing_program_seq(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	u32 tmp;
 	enum phy phy;
@@ -504,7 +504,7 @@ static void gen11_dsi_voltage_swing_program_seq(struct intel_encoder *encoder)
 
 static void gen11_dsi_enable_ddi_buffer(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -523,7 +523,7 @@ static void
 gen11_dsi_setup_dphy_timings(struct intel_encoder *encoder,
 			     const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 	enum phy phy;
@@ -583,7 +583,7 @@ gen11_dsi_setup_dphy_timings(struct intel_encoder *encoder,
 
 static void gen11_dsi_gate_clocks(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	u32 tmp;
 	enum phy phy;
@@ -599,7 +599,7 @@ static void gen11_dsi_gate_clocks(struct intel_encoder *encoder)
 
 static void gen11_dsi_ungate_clocks(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	u32 tmp;
 	enum phy phy;
@@ -615,7 +615,7 @@ static void gen11_dsi_ungate_clocks(struct intel_encoder *encoder)
 
 static bool gen11_dsi_is_clock_enabled(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	bool clock_enabled = false;
 	enum phy phy;
@@ -634,7 +634,7 @@ static bool gen11_dsi_is_clock_enabled(struct intel_encoder *encoder)
 static void gen11_dsi_map_pll(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	enum phy phy;
@@ -663,7 +663,7 @@ static void
 gen11_dsi_configure_transcoder(struct intel_encoder *encoder,
 			       const struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	enum pipe pipe = crtc->pipe;
@@ -823,7 +823,7 @@ static void
 gen11_dsi_set_transcoder_timings(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
@@ -987,7 +987,7 @@ gen11_dsi_set_transcoder_timings(struct intel_encoder *encoder,
 
 static void gen11_dsi_enable_transcoder(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 	enum transcoder dsi_trans;
@@ -1007,7 +1007,7 @@ static void gen11_dsi_enable_transcoder(struct intel_encoder *encoder)
 static void gen11_dsi_setup_timeouts(struct intel_encoder *encoder,
 				     const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 	enum transcoder dsi_trans;
@@ -1054,7 +1054,7 @@ static void gen11_dsi_setup_timeouts(struct intel_encoder *encoder,
 static void gen11_dsi_config_util_pin(struct intel_encoder *encoder,
 				      bool enable)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	u32 tmp;
 
@@ -1111,7 +1111,7 @@ gen11_dsi_enable_port_and_phy(struct intel_encoder *encoder,
 
 static void gen11_dsi_powerup_panel(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	struct mipi_dsi_device *dsi;
 	enum port port;
@@ -1191,7 +1191,7 @@ static void gen11_dsi_pre_enable(struct intel_atomic_state *state,
 static void icl_apply_kvmr_pipe_a_wa(struct intel_encoder *encoder,
 				     enum pipe pipe, bool enable)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	if (DISPLAY_VER(dev_priv) == 11 && pipe == PIPE_B)
 		intel_de_rmw(dev_priv, CHICKEN_PAR1_1,
@@ -1207,7 +1207,7 @@ static void icl_apply_kvmr_pipe_a_wa(struct intel_encoder *encoder,
  */
 static void adlp_set_lp_hs_wakeup_gb(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -1247,7 +1247,7 @@ static void gen11_dsi_enable(struct intel_atomic_state *state,
 
 static void gen11_dsi_disable_transcoder(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 	enum transcoder dsi_trans;
@@ -1280,7 +1280,7 @@ static void gen11_dsi_powerdown_panel(struct intel_encoder *encoder)
 
 static void gen11_dsi_deconfigure_trancoder(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 	enum transcoder dsi_trans;
@@ -1326,7 +1326,7 @@ static void gen11_dsi_deconfigure_trancoder(struct intel_encoder *encoder)
 
 static void gen11_dsi_disable_port(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -1346,7 +1346,7 @@ static void gen11_dsi_disable_port(struct intel_encoder *encoder)
 
 static void gen11_dsi_disable_io_power(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -1460,7 +1460,7 @@ static void gen11_dsi_get_timings(struct intel_encoder *encoder,
 
 static bool gen11_dsi_is_periodic_cmd_mode(struct intel_dsi *intel_dsi)
 {
-	struct drm_device *dev = intel_dsi->base.base.dev;
+	struct drm_device *dev = intel_dsi->base.base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum transcoder dsi_trans;
 	u32 val;
@@ -1513,7 +1513,7 @@ static void gen11_dsi_get_config(struct intel_encoder *encoder,
 static void gen11_dsi_sync_state(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *intel_crtc;
 	enum pipe pipe;
 
@@ -1535,7 +1535,7 @@ static void gen11_dsi_sync_state(struct intel_encoder *encoder,
 static int gen11_dsi_dsc_compute_config(struct intel_encoder *encoder,
 					struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
 	int dsc_max_bpc = DISPLAY_VER(dev_priv) >= 12 ? 12 : 10;
 	bool use_dsc;
@@ -1583,7 +1583,7 @@ static int gen11_dsi_compute_config(struct intel_encoder *encoder,
 				    struct intel_crtc_state *pipe_config,
 				    struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = container_of(encoder, struct intel_dsi,
 						   base);
 	struct intel_connector *intel_connector = intel_dsi->attached_connector;
@@ -1636,7 +1636,7 @@ static int gen11_dsi_compute_config(struct intel_encoder *encoder,
 static void gen11_dsi_get_power_domains(struct intel_encoder *encoder,
 					struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	get_dsi_io_power_domains(i915,
 				 enc_to_intel_dsi(encoder));
@@ -1645,7 +1645,7 @@ static void gen11_dsi_get_power_domains(struct intel_encoder *encoder,
 static bool gen11_dsi_get_hw_state(struct intel_encoder *encoder,
 				   enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum transcoder dsi_trans;
 	intel_wakeref_t wakeref;
@@ -1691,7 +1691,8 @@ static bool gen11_dsi_initial_fastset_check(struct intel_encoder *encoder,
 					    struct intel_crtc_state *crtc_state)
 {
 	if (crtc_state->dsc.compression_enable) {
-		drm_dbg_kms(encoder->base.dev, "Forcing full modeset due to DSC being enabled\n");
+		drm_dbg_kms(encoder->base.drm,
+			    "Forcing full modeset due to DSC being enabled\n");
 		crtc_state->uapi.mode_changed = true;
 
 		return false;
@@ -1789,7 +1790,7 @@ static const struct mipi_dsi_host_ops gen11_dsi_host_ops = {
 
 static void icl_dphy_param_init(struct intel_dsi *intel_dsi)
 {
-	struct drm_device *dev = intel_dsi->base.base.dev;
+	struct drm_device *dev = intel_dsi->base.base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_connector *connector = intel_dsi->attached_connector;
 	struct mipi_config *mipi_config = connector->panel.vbt.dsi.config;
diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 82fb23692c15..3b9ee53b5712 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -319,7 +319,7 @@ static int g4x_eld_buffer_size(struct drm_i915_private *i915)
 static void g4x_audio_codec_get_config(struct intel_encoder *encoder,
 				       struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	u32 *eld = (u32 *)crtc_state->eld;
 	int eld_buffer_size, len, i;
 	u32 tmp;
@@ -341,7 +341,7 @@ static void g4x_audio_codec_disable(struct intel_encoder *encoder,
 				    const struct intel_crtc_state *old_crtc_state,
 				    const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 
 	/* Invalidate ELD */
@@ -356,7 +356,7 @@ static void g4x_audio_codec_enable(struct intel_encoder *encoder,
 				   const struct intel_crtc_state *crtc_state,
 				   const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	const u32 *eld = (const u32 *)crtc_state->eld;
 	int eld_buffer_size, len, i;
@@ -385,7 +385,7 @@ static void
 hsw_dp_audio_config_update(struct intel_encoder *encoder,
 			   const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct i915_audio_component *acomp = i915->display.audio.component;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	enum port port = encoder->port;
@@ -433,7 +433,7 @@ static void
 hsw_hdmi_audio_config_update(struct intel_encoder *encoder,
 			     const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct i915_audio_component *acomp = i915->display.audio.component;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	enum port port = encoder->port;
@@ -485,7 +485,7 @@ static void hsw_audio_codec_disable(struct intel_encoder *encoder,
 				    const struct intel_crtc_state *old_crtc_state,
 				    const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
 
@@ -517,7 +517,7 @@ static void hsw_audio_codec_disable(struct intel_encoder *encoder,
 static unsigned int calc_hblank_early_prog(struct intel_encoder *encoder,
 					   const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	unsigned int link_clks_available, link_clks_required;
 	unsigned int tu_data, tu_line, link_clks_active;
 	unsigned int h_active, h_total, hblank_delta, pixel_clk;
@@ -580,7 +580,7 @@ static unsigned int calc_samples_room(const struct intel_crtc_state *crtc_state)
 static void enable_audio_dsc_wa(struct intel_encoder *encoder,
 				const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	unsigned int hblank_early_prog, samples_room;
 	unsigned int val;
@@ -626,7 +626,7 @@ static void hsw_audio_codec_enable(struct intel_encoder *encoder,
 				   const struct intel_crtc_state *crtc_state,
 				   const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
@@ -687,7 +687,7 @@ static void ibx_audio_codec_disable(struct intel_encoder *encoder,
 				    const struct intel_crtc_state *old_crtc_state,
 				    const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 	enum port port = encoder->port;
 	enum pipe pipe = crtc->pipe;
@@ -723,7 +723,7 @@ static void ibx_audio_codec_enable(struct intel_encoder *encoder,
 				   const struct intel_crtc_state *crtc_state,
 				   const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum port port = encoder->port;
 	enum pipe pipe = crtc->pipe;
@@ -762,7 +762,7 @@ static void ibx_audio_codec_enable(struct intel_encoder *encoder,
 void intel_audio_sdp_split_update(struct intel_encoder *encoder,
 				  const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum transcoder trans = crtc_state->cpu_transcoder;
 
 	if (HAS_DP20(i915))
@@ -774,7 +774,7 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
 				struct intel_crtc_state *crtc_state,
 				struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct drm_connector *connector = conn_state->connector;
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
@@ -807,7 +807,7 @@ void intel_audio_codec_enable(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *crtc_state,
 			      const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct i915_audio_component *acomp = i915->display.audio.component;
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
@@ -866,7 +866,7 @@ void intel_audio_codec_disable(struct intel_encoder *encoder,
 			       const struct intel_crtc_state *old_crtc_state,
 			       const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct i915_audio_component *acomp = i915->display.audio.component;
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
@@ -911,7 +911,7 @@ void intel_audio_codec_disable(struct intel_encoder *encoder,
 static void intel_acomp_get_config(struct intel_encoder *encoder,
 				   struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	struct intel_audio_state *audio_state;
 
@@ -928,7 +928,7 @@ static void intel_acomp_get_config(struct intel_encoder *encoder,
 void intel_audio_codec_get_config(struct intel_encoder *encoder,
 				  struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	if (!crtc_state->has_audio)
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 34a397adbd6b..b6dbb2de0aea 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -3550,7 +3550,7 @@ bool intel_bios_get_dsc_params(struct intel_encoder *encoder,
 			       struct intel_crtc_state *crtc_state,
 			       int dsc_max_bpc)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct intel_bios_encoder_data *devdata;
 
 	list_for_each_entry(devdata, &i915->display.vbt.display_devices, node) {
diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index 608ec14776d5..61d0287167f7 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -99,7 +99,7 @@ bool intel_crt_port_enabled(struct drm_i915_private *dev_priv,
 static bool intel_crt_get_hw_state(struct intel_encoder *encoder,
 				   enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crt *crt = intel_encoder_to_crt(encoder);
 	intel_wakeref_t wakeref;
 	bool ret;
@@ -118,7 +118,7 @@ static bool intel_crt_get_hw_state(struct intel_encoder *encoder,
 
 static unsigned int intel_crt_get_flags(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crt *crt = intel_encoder_to_crt(encoder);
 	u32 tmp, flags = 0;
 
@@ -167,7 +167,7 @@ static void intel_crt_set_dpms(struct intel_encoder *encoder,
 			       const struct intel_crtc_state *crtc_state,
 			       int mode)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crt *crt = intel_encoder_to_crt(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
@@ -240,7 +240,7 @@ static void hsw_disable_crt(struct intel_atomic_state *state,
 			    const struct intel_crtc_state *old_crtc_state,
 			    const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	drm_WARN_ON(&dev_priv->drm, !old_crtc_state->has_pch_encoder);
 
@@ -253,7 +253,7 @@ static void hsw_post_disable_crt(struct intel_atomic_state *state,
 				 const struct drm_connector_state *old_conn_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	intel_crtc_vblank_off(old_crtc_state);
 
@@ -281,7 +281,7 @@ static void hsw_pre_pll_enable_crt(struct intel_atomic_state *state,
 				   const struct intel_crtc_state *crtc_state,
 				   const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	drm_WARN_ON(&dev_priv->drm, !crtc_state->has_pch_encoder);
 
@@ -293,7 +293,7 @@ static void hsw_pre_enable_crt(struct intel_atomic_state *state,
 			       const struct intel_crtc_state *crtc_state,
 			       const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum pipe pipe = crtc->pipe;
 
@@ -311,7 +311,7 @@ static void hsw_enable_crt(struct intel_atomic_state *state,
 			   const struct intel_crtc_state *crtc_state,
 			   const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum pipe pipe = crtc->pipe;
 
@@ -422,7 +422,7 @@ static int hsw_crt_compute_config(struct intel_encoder *encoder,
 				  struct intel_crtc_state *pipe_config,
 				  struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
 
@@ -648,7 +648,7 @@ static int intel_crt_ddc_get_modes(struct drm_connector *connector,
 static bool intel_crt_detect_ddc(struct drm_connector *connector)
 {
 	struct intel_crt *crt = intel_attached_crt(to_intel_connector(connector));
-	struct drm_i915_private *dev_priv = to_i915(crt->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crt->base.base.drm);
 	const struct drm_edid *drm_edid;
 	struct i2c_adapter *i2c;
 	bool ret = false;
@@ -686,7 +686,7 @@ static bool intel_crt_detect_ddc(struct drm_connector *connector)
 static enum drm_connector_status
 intel_crt_load_detect(struct intel_crt *crt, enum pipe pipe)
 {
-	struct drm_device *dev = crt->base.base.dev;
+	struct drm_device *dev = crt->base.base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum transcoder cpu_transcoder = (enum transcoder)pipe;
 	u32 save_bclrpat;
@@ -946,7 +946,7 @@ static int intel_crt_get_modes(struct drm_connector *connector)
 
 void intel_crt_reset(struct drm_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->drm);
 	struct intel_crt *crt = intel_encoder_to_crt(to_intel_encoder(encoder));
 
 	if (DISPLAY_VER(dev_priv) >= 5) {
diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 41837b17602d..183024d2ca4a 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -63,7 +63,7 @@ assert_dc_off(struct drm_i915_private *i915)
  */
 static intel_wakeref_t intel_cx0_phy_transaction_begin(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
 	intel_psr_pause(intel_dp);
@@ -72,7 +72,7 @@ static intel_wakeref_t intel_cx0_phy_transaction_begin(struct intel_encoder *enc
 
 static void intel_cx0_phy_transaction_end(struct intel_encoder *encoder, intel_wakeref_t wakeref)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
 	intel_psr_resume(intel_dp);
@@ -357,7 +357,7 @@ static u8 intel_c10_get_tx_term_ctl(const struct intel_crtc_state *crtc_state)
 void intel_cx0_phy_set_signal_levels(struct intel_encoder *encoder,
 				     const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct intel_ddi_buf_trans *trans;
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 	intel_wakeref_t wakeref;
@@ -1763,7 +1763,7 @@ intel_c10pll_tables_get(struct intel_crtc_state *crtc_state,
 static void intel_c10pll_update_pll(struct intel_crtc_state *crtc_state,
 				    struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_cx0pll_state *pll_state = &crtc_state->cx0pll_state;
 	int i;
 
@@ -1809,7 +1809,7 @@ static int intel_c10pll_calc_state(struct intel_crtc_state *crtc_state,
 void intel_c10pll_readout_hw_state(struct intel_encoder *encoder,
 				   struct intel_c10pll_state *pll_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	u8 lane = INTEL_CX0_LANE0;
 	intel_wakeref_t wakeref;
 	int i;
@@ -2042,7 +2042,7 @@ static int intel_c20pll_calc_state(struct intel_crtc_state *crtc_state,
 int intel_cx0pll_calc_state(struct intel_crtc_state *crtc_state,
 			    struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	if (intel_is_c10phy(i915, phy))
@@ -2062,7 +2062,7 @@ static bool intel_c20_use_mplla(u32 clock)
 void intel_c20pll_readout_hw_state(struct intel_encoder *encoder,
 				   struct intel_c20pll_state *pll_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	bool cntx;
 	intel_wakeref_t wakeref;
 	int i;
@@ -2410,7 +2410,7 @@ static void intel_program_port_clock_ctl(struct intel_encoder *encoder,
 					 const struct intel_crtc_state *crtc_state,
 					 bool lane_reversal)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	u32 val = 0;
 
 	intel_de_rmw(i915, XELPDP_PORT_BUF_CTL1(encoder->port), XELPDP_PORT_REVERSAL,
@@ -2697,7 +2697,7 @@ static u32 intel_cx0_get_pclk_pll_ack(u8 lane_mask)
 static void intel_cx0pll_enable(struct intel_encoder *encoder,
 				const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	bool lane_reversal = dig_port->saved_port_bits & DDI_BUF_PORT_REVERSAL;
@@ -2772,7 +2772,7 @@ static void intel_cx0pll_enable(struct intel_encoder *encoder,
 
 int intel_mtl_tbt_calc_port_clock(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	u32 clock;
 	u32 val = intel_de_read(i915, XELPDP_PORT_CLOCK_CTL(encoder->port));
 
@@ -2817,7 +2817,7 @@ static int intel_mtl_tbt_clock_select(struct drm_i915_private *i915, int clock)
 static void intel_mtl_tbt_pll_enable(struct intel_encoder *encoder,
 				     const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 	u32 val = 0;
 
@@ -2878,7 +2878,7 @@ void intel_mtl_pll_enable(struct intel_encoder *encoder,
 
 static void intel_cx0pll_disable(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 	bool is_c10 = intel_is_c10phy(i915, phy);
 	intel_wakeref_t wakeref = intel_cx0_phy_transaction_begin(encoder);
@@ -2930,7 +2930,7 @@ static void intel_cx0pll_disable(struct intel_encoder *encoder)
 
 static void intel_mtl_tbt_pll_disable(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	/*
@@ -2980,7 +2980,7 @@ enum icl_port_dpll_id
 intel_mtl_port_pll_type(struct intel_encoder *encoder,
 			const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	/*
 	 * TODO: Determine the PLL type from the SW state, once MTL PLL
 	 * handling is done via the standard shared DPLL framework.
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 26955a3efb3e..abe754da87c7 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -117,7 +117,7 @@ static bool has_iboost(struct drm_i915_private *i915)
 void hsw_prepare_dp_ddi_buffers(struct intel_encoder *encoder,
 				const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 iboost_bit = 0;
 	int i, n_entries;
 	enum port port = encoder->port;
@@ -148,7 +148,7 @@ void hsw_prepare_dp_ddi_buffers(struct intel_encoder *encoder,
 static void hsw_prepare_hdmi_ddi_buffers(struct intel_encoder *encoder,
 					 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	int level = intel_ddi_level(encoder, crtc_state, 0);
 	u32 iboost_bit = 0;
 	int n_entries;
@@ -323,7 +323,7 @@ static u32 ddi_buf_phy_link_rate(int port_clock)
 static void intel_ddi_init_dp_buf_reg(struct intel_encoder *encoder,
 				      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
@@ -451,7 +451,7 @@ static void
 intel_ddi_config_transcoder_dp2(struct intel_encoder *encoder,
 				const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 val = 0;
 
@@ -670,7 +670,7 @@ int intel_ddi_toggle_hdcp_bits(struct intel_encoder *intel_encoder,
 			       enum transcoder cpu_transcoder,
 			       bool enable, u32 hdcp_mask)
 {
-	struct drm_device *dev = intel_encoder->base.dev;
+	struct drm_device *dev = intel_encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	intel_wakeref_t wakeref;
 	int ret = 0;
@@ -756,7 +756,7 @@ bool intel_ddi_connector_get_hw_state(struct intel_connector *intel_connector)
 static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
 					u8 *pipe_mask, bool *is_dp_mst)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum port port = encoder->port;
 	intel_wakeref_t wakeref;
@@ -889,7 +889,7 @@ static enum intel_display_power_domain
 intel_ddi_main_link_aux_domain(struct intel_digital_port *dig_port,
 			       const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	enum phy phy = intel_port_to_phy(i915, dig_port->base.port);
 
 	/*
@@ -919,7 +919,7 @@ static void
 main_link_aux_power_domain_get(struct intel_digital_port *dig_port,
 			       const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	enum intel_display_power_domain domain =
 		intel_ddi_main_link_aux_domain(dig_port, crtc_state);
 
@@ -935,7 +935,7 @@ static void
 main_link_aux_power_domain_put(struct intel_digital_port *dig_port,
 			       const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	enum intel_display_power_domain domain =
 		intel_ddi_main_link_aux_domain(dig_port, crtc_state);
 	intel_wakeref_t wf;
@@ -950,7 +950,7 @@ main_link_aux_power_domain_put(struct intel_digital_port *dig_port,
 static void intel_ddi_get_power_domains(struct intel_encoder *encoder,
 					struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port;
 
 	/*
@@ -1031,7 +1031,7 @@ static void skl_ddi_set_iboost(struct intel_encoder *encoder,
 			       int level)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u8 iboost;
 
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
@@ -1066,7 +1066,7 @@ static u8 intel_ddi_dp_voltage_max(struct intel_dp *intel_dp,
 				   const struct intel_crtc_state *crtc_state)
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	int n_entries;
 
 	encoder->get_buf_trans(encoder, crtc_state, &n_entries);
@@ -1106,7 +1106,7 @@ static u32 icl_combo_phy_loadgen_select(const struct intel_crtc_state *crtc_stat
 static void icl_ddi_combo_vswing_program(struct intel_encoder *encoder,
 					 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	const struct intel_ddi_buf_trans *trans;
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 	int n_entries, ln;
@@ -1170,7 +1170,7 @@ static void icl_ddi_combo_vswing_program(struct intel_encoder *encoder,
 static void icl_combo_phy_set_signal_levels(struct intel_encoder *encoder,
 					    const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 	u32 val;
 	int ln;
@@ -1221,7 +1221,7 @@ static void icl_combo_phy_set_signal_levels(struct intel_encoder *encoder,
 static void icl_mg_phy_set_signal_levels(struct intel_encoder *encoder,
 					 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum tc_port tc_port = intel_port_to_tc(dev_priv, encoder->port);
 	const struct intel_ddi_buf_trans *trans;
 	int n_entries, ln;
@@ -1322,7 +1322,7 @@ static void icl_mg_phy_set_signal_levels(struct intel_encoder *encoder,
 static void tgl_dkl_phy_set_signal_levels(struct intel_encoder *encoder,
 					  const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum tc_port tc_port = intel_port_to_tc(dev_priv, encoder->port);
 	const struct intel_ddi_buf_trans *trans;
 	int n_entries, ln;
@@ -1424,7 +1424,7 @@ int intel_ddi_level(struct intel_encoder *encoder,
 		    const struct intel_crtc_state *crtc_state,
 		    int lane)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct intel_ddi_buf_trans *trans;
 	int level, n_entries;
 
@@ -1448,7 +1448,7 @@ static void
 hsw_set_signal_levels(struct intel_encoder *encoder,
 		      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	int level = intel_ddi_level(encoder, crtc_state, 0);
 	enum port port = encoder->port;
@@ -1519,7 +1519,7 @@ _icl_ddi_get_pll(struct drm_i915_private *i915, i915_reg_t reg,
 static void adls_ddi_enable_clock(struct intel_encoder *encoder,
 				  const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
@@ -1534,7 +1534,7 @@ static void adls_ddi_enable_clock(struct intel_encoder *encoder,
 
 static void adls_ddi_disable_clock(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	_icl_ddi_disable_clock(i915, ADLS_DPCLKA_CFGCR(phy),
@@ -1543,7 +1543,7 @@ static void adls_ddi_disable_clock(struct intel_encoder *encoder)
 
 static bool adls_ddi_is_clock_enabled(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	return _icl_ddi_is_clock_enabled(i915, ADLS_DPCLKA_CFGCR(phy),
@@ -1552,7 +1552,7 @@ static bool adls_ddi_is_clock_enabled(struct intel_encoder *encoder)
 
 static struct intel_shared_dpll *adls_ddi_get_pll(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	return _icl_ddi_get_pll(i915, ADLS_DPCLKA_CFGCR(phy),
@@ -1563,7 +1563,7 @@ static struct intel_shared_dpll *adls_ddi_get_pll(struct intel_encoder *encoder)
 static void rkl_ddi_enable_clock(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
@@ -1578,7 +1578,7 @@ static void rkl_ddi_enable_clock(struct intel_encoder *encoder,
 
 static void rkl_ddi_disable_clock(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	_icl_ddi_disable_clock(i915, ICL_DPCLKA_CFGCR0,
@@ -1587,7 +1587,7 @@ static void rkl_ddi_disable_clock(struct intel_encoder *encoder)
 
 static bool rkl_ddi_is_clock_enabled(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	return _icl_ddi_is_clock_enabled(i915, ICL_DPCLKA_CFGCR0,
@@ -1596,7 +1596,7 @@ static bool rkl_ddi_is_clock_enabled(struct intel_encoder *encoder)
 
 static struct intel_shared_dpll *rkl_ddi_get_pll(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	return _icl_ddi_get_pll(i915, ICL_DPCLKA_CFGCR0,
@@ -1607,7 +1607,7 @@ static struct intel_shared_dpll *rkl_ddi_get_pll(struct intel_encoder *encoder)
 static void dg1_ddi_enable_clock(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
@@ -1631,7 +1631,7 @@ static void dg1_ddi_enable_clock(struct intel_encoder *encoder,
 
 static void dg1_ddi_disable_clock(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	_icl_ddi_disable_clock(i915, DG1_DPCLKA_CFGCR0(phy),
@@ -1640,7 +1640,7 @@ static void dg1_ddi_disable_clock(struct intel_encoder *encoder)
 
 static bool dg1_ddi_is_clock_enabled(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	return _icl_ddi_is_clock_enabled(i915, DG1_DPCLKA_CFGCR0(phy),
@@ -1649,7 +1649,7 @@ static bool dg1_ddi_is_clock_enabled(struct intel_encoder *encoder)
 
 static struct intel_shared_dpll *dg1_ddi_get_pll(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 	enum intel_dpll_id id;
 	u32 val;
@@ -1673,7 +1673,7 @@ static struct intel_shared_dpll *dg1_ddi_get_pll(struct intel_encoder *encoder)
 static void icl_ddi_combo_enable_clock(struct intel_encoder *encoder,
 				       const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
@@ -1688,7 +1688,7 @@ static void icl_ddi_combo_enable_clock(struct intel_encoder *encoder,
 
 static void icl_ddi_combo_disable_clock(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	_icl_ddi_disable_clock(i915, ICL_DPCLKA_CFGCR0,
@@ -1697,7 +1697,7 @@ static void icl_ddi_combo_disable_clock(struct intel_encoder *encoder)
 
 static bool icl_ddi_combo_is_clock_enabled(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	return _icl_ddi_is_clock_enabled(i915, ICL_DPCLKA_CFGCR0,
@@ -1706,7 +1706,7 @@ static bool icl_ddi_combo_is_clock_enabled(struct intel_encoder *encoder)
 
 struct intel_shared_dpll *icl_ddi_combo_get_pll(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	return _icl_ddi_get_pll(i915, ICL_DPCLKA_CFGCR0,
@@ -1717,7 +1717,7 @@ struct intel_shared_dpll *icl_ddi_combo_get_pll(struct intel_encoder *encoder)
 static void jsl_ddi_tc_enable_clock(struct intel_encoder *encoder,
 				    const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	enum port port = encoder->port;
 
@@ -1735,7 +1735,7 @@ static void jsl_ddi_tc_enable_clock(struct intel_encoder *encoder,
 
 static void jsl_ddi_tc_disable_clock(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 
 	icl_ddi_combo_disable_clock(encoder);
@@ -1745,7 +1745,7 @@ static void jsl_ddi_tc_disable_clock(struct intel_encoder *encoder)
 
 static bool jsl_ddi_tc_is_clock_enabled(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	u32 tmp;
 
@@ -1760,7 +1760,7 @@ static bool jsl_ddi_tc_is_clock_enabled(struct intel_encoder *encoder)
 static void icl_ddi_tc_enable_clock(struct intel_encoder *encoder,
 				    const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	enum tc_port tc_port = intel_port_to_tc(i915, encoder->port);
 	enum port port = encoder->port;
@@ -1781,7 +1781,7 @@ static void icl_ddi_tc_enable_clock(struct intel_encoder *encoder,
 
 static void icl_ddi_tc_disable_clock(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum tc_port tc_port = intel_port_to_tc(i915, encoder->port);
 	enum port port = encoder->port;
 
@@ -1797,7 +1797,7 @@ static void icl_ddi_tc_disable_clock(struct intel_encoder *encoder)
 
 static bool icl_ddi_tc_is_clock_enabled(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum tc_port tc_port = intel_port_to_tc(i915, encoder->port);
 	enum port port = encoder->port;
 	u32 tmp;
@@ -1814,7 +1814,7 @@ static bool icl_ddi_tc_is_clock_enabled(struct intel_encoder *encoder)
 
 static struct intel_shared_dpll *icl_ddi_tc_get_pll(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum tc_port tc_port = intel_port_to_tc(i915, encoder->port);
 	enum port port = encoder->port;
 	enum intel_dpll_id id;
@@ -1844,7 +1844,7 @@ static struct intel_shared_dpll *icl_ddi_tc_get_pll(struct intel_encoder *encode
 
 static struct intel_shared_dpll *bxt_ddi_get_pll(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum intel_dpll_id id;
 
 	switch (encoder->port) {
@@ -1868,7 +1868,7 @@ static struct intel_shared_dpll *bxt_ddi_get_pll(struct intel_encoder *encoder)
 static void skl_ddi_enable_clock(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	enum port port = encoder->port;
 
@@ -1888,7 +1888,7 @@ static void skl_ddi_enable_clock(struct intel_encoder *encoder,
 
 static void skl_ddi_disable_clock(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 
 	mutex_lock(&i915->display.dpll.lock);
@@ -1901,7 +1901,7 @@ static void skl_ddi_disable_clock(struct intel_encoder *encoder)
 
 static bool skl_ddi_is_clock_enabled(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 
 	/*
@@ -1913,7 +1913,7 @@ static bool skl_ddi_is_clock_enabled(struct intel_encoder *encoder)
 
 static struct intel_shared_dpll *skl_ddi_get_pll(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	enum intel_dpll_id id;
 	u32 tmp;
@@ -1936,7 +1936,7 @@ static struct intel_shared_dpll *skl_ddi_get_pll(struct intel_encoder *encoder)
 void hsw_ddi_enable_clock(struct intel_encoder *encoder,
 			  const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	enum port port = encoder->port;
 
@@ -1948,7 +1948,7 @@ void hsw_ddi_enable_clock(struct intel_encoder *encoder,
 
 void hsw_ddi_disable_clock(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 
 	intel_de_write(i915, PORT_CLK_SEL(port), PORT_CLK_SEL_NONE);
@@ -1956,7 +1956,7 @@ void hsw_ddi_disable_clock(struct intel_encoder *encoder)
 
 bool hsw_ddi_is_clock_enabled(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 
 	return intel_de_read(i915, PORT_CLK_SEL(port)) != PORT_CLK_SEL_NONE;
@@ -1964,7 +1964,7 @@ bool hsw_ddi_is_clock_enabled(struct intel_encoder *encoder)
 
 static struct intel_shared_dpll *hsw_ddi_get_pll(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	enum intel_dpll_id id;
 	u32 tmp;
@@ -2015,7 +2015,7 @@ void intel_ddi_disable_clock(struct intel_encoder *encoder)
 
 void intel_ddi_sanitize_encoder_pll_mapping(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	u32 port_mask;
 	bool ddi_clk_needed;
 
@@ -2080,7 +2080,7 @@ static void
 icl_program_mg_dp_mode(struct intel_digital_port *dig_port,
 		       const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.drm);
 	enum tc_port tc_port = intel_port_to_tc(dev_priv, dig_port->base.port);
 	enum phy phy = intel_port_to_phy(dev_priv, dig_port->base.port);
 	u32 ln0, ln1, pin_assignment;
@@ -2173,7 +2173,7 @@ tgl_dp_tp_transcoder(const struct intel_crtc_state *crtc_state)
 i915_reg_t dp_tp_ctl_reg(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	if (DISPLAY_VER(dev_priv) >= 12)
 		return TGL_DP_TP_CTL(tgl_dp_tp_transcoder(crtc_state));
@@ -2184,7 +2184,7 @@ i915_reg_t dp_tp_ctl_reg(struct intel_encoder *encoder,
 i915_reg_t dp_tp_status_reg(struct intel_encoder *encoder,
 			    const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	if (DISPLAY_VER(dev_priv) >= 12)
 		return TGL_DP_TP_STATUS(tgl_dp_tp_transcoder(crtc_state));
@@ -2224,7 +2224,7 @@ static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp,
 static void intel_ddi_enable_fec(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	if (!crtc_state->fec_enable)
 		return;
@@ -2236,7 +2236,7 @@ static void intel_ddi_enable_fec(struct intel_encoder *encoder,
 static void intel_ddi_disable_fec_state(struct intel_encoder *encoder,
 					const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	if (!crtc_state->fec_enable)
 		return;
@@ -2249,7 +2249,7 @@ static void intel_ddi_disable_fec_state(struct intel_encoder *encoder,
 static void intel_ddi_power_up_lanes(struct intel_encoder *encoder,
 				     const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
@@ -2354,7 +2354,7 @@ static u8 mtl_get_port_width(u8 lane_count)
 static void
 mtl_ddi_enable_d2d(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 
 	intel_de_rmw(dev_priv, XELPDP_PORT_BUF_CTL1(port), 0,
@@ -2370,7 +2370,7 @@ mtl_ddi_enable_d2d(struct intel_encoder *encoder)
 static void mtl_port_buf_ctl_program(struct intel_encoder *encoder,
 				     const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	enum port port = encoder->port;
 	u32 val;
@@ -2393,7 +2393,7 @@ static void mtl_port_buf_ctl_program(struct intel_encoder *encoder,
 
 static void mtl_port_buf_ctl_io_selection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	u32 val;
 
@@ -2513,7 +2513,7 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 				  const struct drm_connector_state *conn_state)
 {
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
 
@@ -2651,7 +2651,7 @@ static void hsw_ddi_pre_enable_dp(struct intel_atomic_state *state,
 				  const struct drm_connector_state *conn_state)
 {
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
@@ -2715,7 +2715,7 @@ static void intel_ddi_pre_enable_dp(struct intel_atomic_state *state,
 				    const struct intel_crtc_state *crtc_state,
 				    const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	if (HAS_DP20(dev_priv))
 		intel_dp_128b132b_sdp_crc16(enc_to_intel_dp(encoder),
@@ -2742,7 +2742,7 @@ static void intel_ddi_pre_enable_hdmi(struct intel_atomic_state *state,
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	struct intel_hdmi *intel_hdmi = &dig_port->hdmi;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	intel_dp_dual_mode_set_tmds_output(intel_hdmi, true);
 	intel_ddi_enable_clock(encoder, crtc_state);
@@ -2807,7 +2807,7 @@ static void intel_ddi_pre_enable(struct intel_atomic_state *state,
 static void
 mtl_ddi_disable_d2d_link(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 
 	intel_de_rmw(dev_priv, XELPDP_PORT_BUF_CTL1(port),
@@ -2822,7 +2822,7 @@ mtl_ddi_disable_d2d_link(struct intel_encoder *encoder)
 static void mtl_disable_ddi_buf(struct intel_encoder *encoder,
 				const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	u32 val;
 
@@ -2849,7 +2849,7 @@ static void mtl_disable_ddi_buf(struct intel_encoder *encoder,
 static void disable_ddi_buf(struct intel_encoder *encoder,
 			    const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	bool wait = false;
 	u32 val;
@@ -2875,7 +2875,7 @@ static void disable_ddi_buf(struct intel_encoder *encoder,
 static void intel_disable_ddi_buf(struct intel_encoder *encoder,
 				  const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	if (DISPLAY_VER(dev_priv) >= 14) {
 		mtl_disable_ddi_buf(encoder, crtc_state);
@@ -2892,7 +2892,7 @@ static void intel_ddi_post_disable_dp(struct intel_atomic_state *state,
 				      const struct intel_crtc_state *old_crtc_state,
 				      const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	struct intel_dp *intel_dp = &dig_port->dp;
 	intel_wakeref_t wakeref;
@@ -2955,7 +2955,7 @@ static void intel_ddi_post_disable_hdmi(struct intel_atomic_state *state,
 					const struct intel_crtc_state *old_crtc_state,
 					const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	struct intel_hdmi *intel_hdmi = &dig_port->hdmi;
 	intel_wakeref_t wakeref;
@@ -2987,7 +2987,7 @@ static void intel_ddi_post_disable(struct intel_atomic_state *state,
 				   const struct intel_crtc_state *old_crtc_state,
 				   const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *slave_crtc;
 
 	if (!intel_crtc_has_type(old_crtc_state, INTEL_OUTPUT_DP_MST)) {
@@ -3042,7 +3042,7 @@ static void intel_ddi_post_pll_disable(struct intel_atomic_state *state,
 				       const struct intel_crtc_state *old_crtc_state,
 				       const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 	bool is_tc_port = intel_phy_is_tc(i915, phy);
@@ -3095,7 +3095,7 @@ static void intel_enable_ddi_dp(struct intel_atomic_state *state,
 				const struct intel_crtc_state *crtc_state,
 				const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	enum port port = encoder->port;
@@ -3139,7 +3139,7 @@ static void intel_enable_ddi_hdmi(struct intel_atomic_state *state,
 				  const struct intel_crtc_state *crtc_state,
 				  const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	struct drm_connector *connector = conn_state->connector;
 	enum port port = encoder->port;
@@ -3290,7 +3290,7 @@ static void intel_disable_ddi_hdmi(struct intel_atomic_state *state,
 				   const struct intel_crtc_state *old_crtc_state,
 				   const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct drm_connector *connector = old_conn_state->connector;
 
 	intel_audio_codec_disable(encoder, old_crtc_state, old_conn_state);
@@ -3350,7 +3350,7 @@ void intel_ddi_update_active_dpll(struct intel_atomic_state *state,
 				  struct intel_encoder *encoder,
 				  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_crtc *slave_crtc;
@@ -3372,7 +3372,7 @@ intel_ddi_pre_pll_enable(struct intel_atomic_state *state,
 			 const struct intel_crtc_state *crtc_state,
 			 const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 	bool is_tc_port = intel_phy_is_tc(dev_priv, phy);
@@ -3400,7 +3400,7 @@ intel_ddi_pre_pll_enable(struct intel_atomic_state *state,
 
 static void adlp_tbt_to_dp_alt_switch_wa(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum tc_port tc_port = intel_port_to_tc(i915, encoder->port);
 	int ln;
 
@@ -3413,7 +3413,7 @@ static void mtl_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct intel_encoder *encoder = &dig_port->base;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	u32 dp_tp_ctl;
 
@@ -3460,7 +3460,7 @@ static void intel_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct intel_encoder *encoder = &dig_port->base;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	u32 dp_tp_ctl, ddi_buf_ctl;
 	bool wait = false;
@@ -3510,7 +3510,7 @@ static void intel_ddi_set_link_train(struct intel_dp *intel_dp,
 				     u8 dp_train_pat)
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 temp;
 
 	temp = intel_de_read(dev_priv, dp_tp_ctl_reg(encoder, crtc_state));
@@ -3541,7 +3541,7 @@ static void intel_ddi_set_idle_link_train(struct intel_dp *intel_dp,
 					  const struct intel_crtc_state *crtc_state)
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 
 	intel_de_rmw(dev_priv, dp_tp_ctl_reg(encoder, crtc_state),
@@ -3651,7 +3651,7 @@ static void bdw_get_trans_port_sync_config(struct intel_crtc_state *crtc_state)
 static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
 				    struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	enum transcoder cpu_transcoder = pipe_config->cpu_transcoder;
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
@@ -3771,7 +3771,7 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
 static void intel_ddi_get_config(struct intel_encoder *encoder,
 				 struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum transcoder cpu_transcoder = pipe_config->cpu_transcoder;
 
 	/* XXX: DSI transcoder paranoia */
@@ -3826,7 +3826,7 @@ void intel_ddi_get_clock(struct intel_encoder *encoder,
 			 struct intel_crtc_state *crtc_state,
 			 struct intel_shared_dpll *pll)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum icl_port_dpll_id port_dpll_id = ICL_PORT_DPLL_DEFAULT;
 	struct icl_port_dpll *port_dpll = &crtc_state->icl_port_dplls[port_dpll_id];
 	bool pll_active;
@@ -3847,7 +3847,7 @@ void intel_ddi_get_clock(struct intel_encoder *encoder,
 static void mtl_ddi_get_config(struct intel_encoder *encoder,
 			       struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 
@@ -3912,7 +3912,7 @@ static enum icl_port_dpll_id
 icl_ddi_tc_port_pll_type(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 
 	if (drm_WARN_ON(&i915->drm, !pll))
@@ -3938,7 +3938,7 @@ static void icl_ddi_tc_get_clock(struct intel_encoder *encoder,
 				 struct intel_crtc_state *crtc_state,
 				 struct intel_shared_dpll *pll)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum icl_port_dpll_id port_dpll_id;
 	struct icl_port_dpll *port_dpll;
 	bool pll_active;
@@ -3997,7 +3997,7 @@ void hsw_ddi_get_config(struct intel_encoder *encoder,
 static void intel_ddi_sync_state(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	if (intel_phy_is_tc(i915, phy))
@@ -4011,7 +4011,7 @@ static void intel_ddi_sync_state(struct intel_encoder *encoder,
 static bool intel_ddi_initial_fastset_check(struct intel_encoder *encoder,
 					    struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 	bool fastset = true;
 
@@ -4052,7 +4052,7 @@ static int intel_ddi_compute_config(struct intel_encoder *encoder,
 				    struct drm_connector_state *conn_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	int ret;
 
@@ -4167,7 +4167,7 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
 					 struct intel_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct drm_connector *connector = conn_state->connector;
 	u8 port_sync_transcoders = 0;
 
@@ -4199,7 +4199,7 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
 
 static void intel_ddi_encoder_destroy(struct drm_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->dev);
+	struct drm_i915_private *i915 = to_i915(encoder->drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(to_intel_encoder(encoder));
 	enum phy phy = intel_port_to_phy(i915, dig_port->base.port);
 
@@ -4215,7 +4215,7 @@ static void intel_ddi_encoder_destroy(struct drm_encoder *encoder)
 
 static void intel_ddi_encoder_reset(struct drm_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->dev);
+	struct drm_i915_private *i915 = to_i915(encoder->drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(to_intel_encoder(encoder));
 	struct intel_digital_port *dig_port = enc_to_dig_port(to_intel_encoder(encoder));
 	enum phy phy = intel_port_to_phy(i915, dig_port->base.port);
@@ -4246,7 +4246,7 @@ static const struct drm_encoder_funcs intel_ddi_funcs = {
 static struct intel_connector *
 intel_ddi_init_dp_connector(struct intel_digital_port *dig_port)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_connector *connector;
 	enum port port = dig_port->base.port;
 
@@ -4271,7 +4271,7 @@ intel_ddi_init_dp_connector(struct intel_digital_port *dig_port)
 	}
 
 	if (dig_port->base.type == INTEL_OUTPUT_EDP) {
-		struct drm_device *dev = dig_port->base.base.dev;
+		struct drm_device *dev = dig_port->base.base.drm;
 		struct drm_privacy_screen *privacy_screen;
 
 		privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
@@ -4318,7 +4318,7 @@ static int modeset_pipe(struct drm_crtc *crtc,
 static int intel_hdmi_reset_link(struct intel_encoder *encoder,
 				 struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_hdmi *hdmi = enc_to_intel_hdmi(encoder);
 	struct intel_connector *connector = hdmi->attached_connector;
 	struct i2c_adapter *adapter =
@@ -4392,7 +4392,7 @@ static enum intel_hotplug_state
 intel_ddi_hotplug(struct intel_encoder *encoder,
 		  struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	struct intel_dp *intel_dp = &dig_port->dp;
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
@@ -4418,7 +4418,7 @@ intel_ddi_hotplug(struct intel_encoder *encoder,
 				ret = intel_dp_retrain_link(encoder, &ctx);
 		}
 
-		drm_WARN_ON(encoder->base.dev, ret);
+		drm_WARN_ON(encoder->base.drm, ret);
 	}
 
 	/*
@@ -4453,7 +4453,7 @@ intel_ddi_hotplug(struct intel_encoder *encoder,
 
 static bool lpt_digital_port_connected(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 bit = dev_priv->display.hotplug.pch_hpd[encoder->hpd_pin];
 
 	return intel_de_read(dev_priv, SDEISR) & bit;
@@ -4461,7 +4461,7 @@ static bool lpt_digital_port_connected(struct intel_encoder *encoder)
 
 static bool hsw_digital_port_connected(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 bit = dev_priv->display.hotplug.hpd[encoder->hpd_pin];
 
 	return intel_de_read(dev_priv, DEISR) & bit;
@@ -4469,7 +4469,7 @@ static bool hsw_digital_port_connected(struct intel_encoder *encoder)
 
 static bool bdw_digital_port_connected(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 bit = dev_priv->display.hotplug.hpd[encoder->hpd_pin];
 
 	return intel_de_read(dev_priv, GEN8_DE_PORT_ISR) & bit;
@@ -4493,7 +4493,7 @@ intel_ddi_init_hdmi_connector(struct intel_digital_port *dig_port)
 
 static bool intel_ddi_a_force_4_lanes(struct intel_digital_port *dig_port)
 {
-	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.drm);
 
 	if (dig_port->base.port != PORT_A)
 		return false;
@@ -4513,7 +4513,7 @@ static bool intel_ddi_a_force_4_lanes(struct intel_digital_port *dig_port)
 static int
 intel_ddi_max_lanes(struct intel_digital_port *dig_port)
 {
-	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.drm);
 	enum port port = dig_port->base.port;
 	int max_lanes = 4;
 
diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index b7d20485bde5..d8431f3929f3 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1387,7 +1387,7 @@ tgl_get_combo_buf_trans_dp(struct intel_encoder *encoder,
 			   const struct intel_crtc_state *crtc_state,
 			   int *n_entries)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	if (crtc_state->port_clock > 270000) {
 		if (IS_TGL_UY(dev_priv)) {
@@ -1671,7 +1671,7 @@ mtl_get_cx0_buf_trans(struct intel_encoder *encoder,
 		      const struct intel_crtc_state *crtc_state,
 		      int *n_entries)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	if (intel_crtc_has_dp_encoder(crtc_state) && crtc_state->port_clock >= 1000000)
@@ -1684,7 +1684,7 @@ mtl_get_cx0_buf_trans(struct intel_encoder *encoder,
 
 void intel_ddi_buf_trans_init(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 
 	if (DISPLAY_VER(i915) >= 14) {
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5d381ca03aa2..0c8beaa8f638 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1822,7 +1822,7 @@ enum tc_port intel_port_to_tc(struct drm_i915_private *dev_priv, enum port port)
 enum intel_display_power_domain
 intel_aux_power_domain(struct intel_digital_port *dig_port)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 
 	if (intel_tc_port_in_tbt_alt_mode(dig_port))
 		return intel_display_power_tbt_aux_domain(i915, dig_port->aux_ch);
@@ -3967,7 +3967,7 @@ int intel_crtc_dotclock(const struct intel_crtc_state *pipe_config)
 struct drm_display_mode *
 intel_encoder_current_mode(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc_state *crtc_state;
 	struct drm_display_mode *mode;
 	struct intel_crtc *crtc;
@@ -7328,7 +7328,7 @@ int intel_get_pipe_from_crtc_id_ioctl(struct drm_device *dev, void *data,
 
 static u32 intel_encoder_possible_clones(struct intel_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct intel_encoder *source_encoder;
 	u32 possible_clones = 0;
 
@@ -7342,7 +7342,7 @@ static u32 intel_encoder_possible_clones(struct intel_encoder *encoder)
 
 static u32 intel_encoder_possible_crtcs(struct intel_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct intel_crtc *crtc;
 	u32 possible_crtcs = 0;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 53d577a71c2b..a4b818da32ed 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1264,7 +1264,7 @@ static ssize_t i915_dsc_fec_support_write(struct file *file,
 	struct drm_connector *connector =
 		((struct seq_file *)file->private_data)->private;
 	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
 	if (len == 0)
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 916009894d89..e5930ca68f12 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -1596,7 +1596,7 @@ bool chv_phy_powergate_ch(struct drm_i915_private *dev_priv, enum dpio_phy phy,
 void chv_phy_powergate_lanes(struct intel_encoder *encoder,
 			     bool override, unsigned int mask)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct i915_power_domains *power_domains = &dev_priv->display.power.domains;
 	enum dpio_phy phy = vlv_dig_port_to_phy(enc_to_dig_port(encoder));
 	enum dpio_channel ch = vlv_dig_port_to_channel(enc_to_dig_port(encoder));
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 731f2ec04d5c..4e24ca3fc63c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1978,7 +1978,7 @@ dp_to_lspcon(struct intel_dp *intel_dp)
 	return &dp_to_dig_port(intel_dp)->lspcon;
 }
 
-#define dp_to_i915(__intel_dp) to_i915(dp_to_dig_port(__intel_dp)->base.base.dev)
+#define dp_to_i915(__intel_dp) to_i915(dp_to_dig_port(__intel_dp)->base.base.drm)
 
 #define CAN_PSR(intel_dp) ((intel_dp)->psr.sink_support && \
 			   (intel_dp)->psr.source_support)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 79d0e99a9a76..0c1d60661bbc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -391,7 +391,7 @@ bool intel_dp_can_bigjoiner(struct intel_dp *intel_dp)
 {
 	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
 	struct intel_encoder *encoder = &intel_dig_port->base;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	return DISPLAY_VER(dev_priv) >= 12 ||
 		(DISPLAY_VER(dev_priv) == 11 &&
@@ -406,7 +406,7 @@ static int dg2_max_source_rate(struct intel_dp *intel_dp)
 static int icl_max_source_rate(struct intel_dp *intel_dp)
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
-	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.drm);
 	enum phy phy = intel_port_to_phy(dev_priv, dig_port->base.port);
 
 	if (intel_phy_is_combo(dev_priv, phy) && !intel_dp_is_edp(intel_dp))
@@ -426,7 +426,7 @@ static int ehl_max_source_rate(struct intel_dp *intel_dp)
 static int mtl_max_source_rate(struct intel_dp *intel_dp)
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	enum phy phy = intel_port_to_phy(i915, dig_port->base.port);
 
 	if (intel_is_c10phy(i915, phy))
@@ -480,7 +480,7 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
 		162000, 270000
 	};
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
-	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.drm);
 	const int *source_rates;
 	int size, max_rate = 0, vbt_max_rate;
 
@@ -1564,7 +1564,7 @@ static int intel_dp_get_slice_height(int vactive)
 static int intel_dp_dsc_compute_params(struct intel_encoder *encoder,
 				       struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
 	u8 line_buf_depth;
@@ -1650,7 +1650,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				bool compute_pipe_bpp)
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
-	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.drm);
 	const struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
 	int pipe_bpp;
@@ -1793,7 +1793,7 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 			     struct drm_connector_state *conn_state,
 			     bool respect_downstream_limits)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	const struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
@@ -2164,7 +2164,7 @@ intel_dp_drrs_compute_config(struct intel_connector *connector,
 static bool intel_dp_has_audio(struct intel_encoder *encoder,
 			       const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_connector *connector = intel_dp->attached_connector;
 	const struct intel_digital_connector_state *intel_conn_state =
@@ -2185,7 +2185,7 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
 			       struct drm_connector_state *conn_state,
 			       bool respect_downstream_limits)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_connector *connector = intel_dp->attached_connector;
 	const struct drm_display_info *info = &connector->base.display_info;
@@ -2228,7 +2228,7 @@ intel_dp_audio_compute_config(struct intel_encoder *encoder,
 			      struct intel_crtc_state *pipe_config,
 			      struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct drm_connector *connector = conn_state->connector;
 
 	pipe_config->sdp_split_enable =
@@ -2245,7 +2245,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 			struct intel_crtc_state *pipe_config,
 			struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	const struct drm_display_mode *fixed_mode;
@@ -2471,7 +2471,7 @@ void intel_dp_wait_source_oui(struct intel_dp *intel_dp)
 void intel_dp_set_power(struct intel_dp *intel_dp, u8 mode)
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	int ret, i;
 
 	/* Should have a valid DPCD by this point */
@@ -2545,7 +2545,7 @@ void intel_dp_sync_state(struct intel_encoder *encoder,
 bool intel_dp_initial_fastset_check(struct intel_encoder *encoder,
 				    struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	bool fastset = true;
 
@@ -3034,7 +3034,7 @@ static void intel_edp_mso_mode_fixup(struct intel_connector *connector,
 
 void intel_edp_fixup_vbt_bpp(struct intel_encoder *encoder, int pipe_bpp)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_connector *connector = intel_dp->attached_connector;
 
@@ -3099,7 +3099,7 @@ static bool
 intel_edp_init_dpcd(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
+		to_i915(dp_to_dig_port(intel_dp)->base.base.drm);
 
 	/* this function is meant to be called only once */
 	drm_WARN_ON(&dev_priv->drm, intel_dp->dpcd[DP_DPCD_REV] != 0);
@@ -3469,7 +3469,7 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
 			       unsigned int type)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct dp_sdp sdp = {};
 	ssize_t len;
 
@@ -3503,7 +3503,7 @@ void intel_write_dp_vsc_sdp(struct intel_encoder *encoder,
 			    const struct drm_dp_vsc_sdp *vsc)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct dp_sdp sdp = {};
 	ssize_t len;
 
@@ -3521,7 +3521,7 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
 			     const struct intel_crtc_state *crtc_state,
 			     const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	i915_reg_t reg = HSW_TVIDEO_DIP_CTL(crtc_state->cpu_transcoder);
 	u32 dip_enable = VIDEO_DIP_ENABLE_AVI_HSW | VIDEO_DIP_ENABLE_GCP_HSW |
 			 VIDEO_DIP_ENABLE_VS_HSW | VIDEO_DIP_ENABLE_GMP_HSW |
@@ -3667,7 +3667,7 @@ static void intel_read_dp_vsc_sdp(struct intel_encoder *encoder,
 				  struct drm_dp_vsc_sdp *vsc)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	unsigned int type = DP_SDP_VSC;
 	struct dp_sdp sdp = {};
 	int ret;
@@ -3693,7 +3693,7 @@ static void intel_read_dp_hdr_metadata_infoframe_sdp(struct intel_encoder *encod
 						     struct hdmi_drm_infoframe *drm_infoframe)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	unsigned int type = HDMI_PACKET_TYPE_GAMUT_METADATA;
 	struct dp_sdp sdp = {};
 	int ret;
@@ -3882,7 +3882,7 @@ static void intel_dp_phy_pattern_update(struct intel_dp *intel_dp,
 					const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv =
-			to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
+			to_i915(dp_to_dig_port(intel_dp)->base.base.drm);
 	struct drm_dp_phy_test_params *data =
 			&intel_dp->compliance.test_data.phytest;
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -4042,7 +4042,7 @@ static bool intel_dp_link_ok(struct intel_dp *intel_dp,
 			     u8 link_status[DP_LINK_STATUS_SIZE])
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	bool uhbr = intel_dp->link_rate >= 1000000;
 	bool ok;
 
@@ -4080,7 +4080,7 @@ intel_dp_mst_hpd_irq(struct intel_dp *intel_dp, u8 *esi, u8 *ack)
 static bool intel_dp_mst_link_status(struct intel_dp *intel_dp)
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	u8 link_status[DP_LINK_STATUS_SIZE] = {};
 	const size_t esi_link_status_size = DP_LINK_STATUS_SIZE - 2;
 
@@ -4298,7 +4298,7 @@ static bool intel_dp_is_connected(struct intel_dp *intel_dp)
 int intel_dp_retrain_link(struct intel_encoder *encoder,
 			  struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_crtc *crtc;
 	u8 pipe_mask;
@@ -4422,7 +4422,7 @@ static int intel_dp_prep_phy_test(struct intel_dp *intel_dp,
 static int intel_dp_do_phy_test(struct intel_encoder *encoder,
 				struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_crtc *crtc;
 	u8 pipe_mask;
@@ -4480,7 +4480,7 @@ void intel_dp_phy_test(struct intel_encoder *encoder)
 
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
-	drm_WARN(encoder->base.dev, ret,
+	drm_WARN(encoder->base.drm, ret,
 		 "Acquiring modeset locks failed with %i\n", ret);
 }
 
@@ -4673,7 +4673,7 @@ edp_detect(struct intel_dp *intel_dp)
  */
 bool intel_digital_port_connected(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	bool is_connected = false;
 	intel_wakeref_t wakeref;
@@ -4968,7 +4968,7 @@ intel_dp_force(struct drm_connector *connector)
 	struct intel_dp *intel_dp = intel_attached_dp(to_intel_connector(connector));
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct intel_encoder *intel_encoder = &dig_port->base;
-	struct drm_i915_private *dev_priv = to_i915(intel_encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_encoder->base.drm);
 	enum intel_display_power_domain aux_domain =
 		intel_aux_power_domain(dig_port);
 	intel_wakeref_t wakeref;
@@ -5278,7 +5278,7 @@ static const struct drm_connector_helper_funcs intel_dp_connector_helper_funcs =
 enum irqreturn
 intel_dp_hpd_pulse(struct intel_digital_port *dig_port, bool long_hpd)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_dp *intel_dp = &dig_port->dp;
 
 	if (dig_port->base.type == INTEL_OUTPUT_EDP &&
@@ -5345,7 +5345,7 @@ bool intel_dp_is_port_edp(struct drm_i915_private *i915, enum port port)
 static bool
 has_gamut_metadata_dip(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 
 	if (intel_bios_encoder_is_lspcon(encoder->devdata))
@@ -5610,7 +5610,7 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 	struct drm_connector *connector = &intel_connector->base;
 	struct intel_dp *intel_dp = &dig_port->dp;
 	struct intel_encoder *intel_encoder = &dig_port->base;
-	struct drm_device *dev = intel_encoder->base.dev;
+	struct drm_device *dev = intel_encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum port port = intel_encoder->port;
 	enum phy phy = intel_port_to_phy(dev_priv, port);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 197c6e81db14..aa72aba432ca 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -151,7 +151,7 @@ static u32 g4x_get_aux_send_ctl(struct intel_dp *intel_dp,
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct drm_i915_private *dev_priv =
-			to_i915(dig_port->base.base.dev);
+			to_i915(dig_port->base.base.drm);
 	u32 timeout;
 
 	/* Max timeout value on G4x-BDW: 1.6ms */
@@ -176,7 +176,7 @@ static u32 skl_get_aux_send_ctl(struct intel_dp *intel_dp,
 				u32 unused)
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
-	struct drm_i915_private *i915 =	to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 =	to_i915(dig_port->base.base.drm);
 	u32 ret;
 
 	/*
@@ -215,7 +215,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct drm_i915_private *i915 =
-			to_i915(dig_port->base.base.dev);
+			to_i915(dig_port->base.base.drm);
 	enum phy phy = intel_port_to_phy(i915, dig_port->base.port);
 	bool is_tc_port = intel_phy_is_tc(i915, phy);
 	i915_reg_t ch_ctl, ch_data[5];
@@ -783,7 +783,7 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
 
 static enum aux_ch default_aux_ch(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	/* SKL has DDI E but no AUX E */
 	if (DISPLAY_VER(i915) == 9 && encoder->port == PORT_E)
@@ -794,7 +794,7 @@ static enum aux_ch default_aux_ch(struct intel_encoder *encoder)
 
 enum aux_ch intel_dp_aux_ch(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum aux_ch aux_ch;
 
 	aux_ch = intel_bios_dp_aux_ch(encoder->devdata);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 631d60184b4b..22511f8cc655 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -52,7 +52,7 @@ static
 int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
 				u8 *an)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	u8 aksv[DRM_HDCP_KSV_LEN] = {};
 	ssize_t dpcd_ret;
 
@@ -87,7 +87,7 @@ int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
 static int intel_dp_hdcp_read_bksv(struct intel_digital_port *dig_port,
 				   u8 *bksv)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	ssize_t ret;
 
 	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BKSV, bksv,
@@ -103,7 +103,7 @@ static int intel_dp_hdcp_read_bksv(struct intel_digital_port *dig_port,
 static int intel_dp_hdcp_read_bstatus(struct intel_digital_port *dig_port,
 				      u8 *bstatus)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	ssize_t ret;
 
 	/*
@@ -125,7 +125,7 @@ static
 int intel_dp_hdcp_read_bcaps(struct intel_digital_port *dig_port,
 			     u8 *bcaps)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	ssize_t ret;
 
 	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BCAPS,
@@ -158,7 +158,7 @@ static
 int intel_dp_hdcp_read_ri_prime(struct intel_digital_port *dig_port,
 				u8 *ri_prime)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	ssize_t ret;
 
 	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_RI_PRIME,
@@ -175,7 +175,7 @@ static
 int intel_dp_hdcp_read_ksv_ready(struct intel_digital_port *dig_port,
 				 bool *ksv_ready)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	ssize_t ret;
 	u8 bstatus;
 
@@ -194,7 +194,7 @@ static
 int intel_dp_hdcp_read_ksv_fifo(struct intel_digital_port *dig_port,
 				int num_downstream, u8 *ksv_fifo)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	ssize_t ret;
 	int i;
 
@@ -219,7 +219,7 @@ static
 int intel_dp_hdcp_read_v_prime_part(struct intel_digital_port *dig_port,
 				    int i, u32 *part)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	ssize_t ret;
 
 	if (i >= DRM_HDCP_V_PRIME_NUM_PARTS)
@@ -249,7 +249,7 @@ static
 bool intel_dp_hdcp_check_link(struct intel_digital_port *dig_port,
 			      struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	ssize_t ret;
 	u8 bstatus;
 
@@ -334,7 +334,7 @@ static int
 intel_dp_hdcp2_read_rx_status(struct intel_digital_port *dig_port,
 			      u8 *rx_status)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	ssize_t ret;
 
 	ret = drm_dp_dpcd_read(&dig_port->dp.aux,
@@ -386,7 +386,7 @@ static ssize_t
 intel_dp_hdcp2_wait_for_msg(struct intel_digital_port *dig_port,
 			    const struct hdcp2_dp_msg_data *hdcp2_msg_data)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_dp *dp = &dig_port->dp;
 	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
 	u8 msg_id = hdcp2_msg_data->msg_id;
@@ -497,7 +497,7 @@ static
 int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
 			    u8 msg_id, void *buf, size_t size)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_dp *dp = &dig_port->dp;
 	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
 	unsigned int offset;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 0f327ce194bd..b6a51477b1e0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -271,7 +271,7 @@ static int intel_dp_mst_update_slots(struct intel_encoder *encoder,
 				     struct intel_crtc_state *crtc_state,
 				     struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
 	struct intel_dp *intel_dp = &intel_mst->primary->dp;
 	struct drm_dp_mst_topology_mgr *mgr = &intel_dp->mst_mgr;
@@ -307,7 +307,7 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 				       struct intel_crtc_state *pipe_config,
 				       struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
 	struct intel_dp *intel_dp = &intel_mst->primary->dp;
 	const struct drm_display_mode *adjusted_mode =
@@ -527,7 +527,7 @@ intel_dp_mst_atomic_check(struct drm_connector *connector,
 static void clear_act_sent(struct intel_encoder *encoder,
 			   const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	intel_de_write(i915, dp_tp_status_reg(encoder, crtc_state),
 		       DP_TP_STATUS_ACT_SENT);
@@ -536,7 +536,7 @@ static void clear_act_sent(struct intel_encoder *encoder,
 static void wait_for_act_sent(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
 	struct intel_dp *intel_dp = &intel_mst->primary->dp;
 
@@ -692,7 +692,7 @@ static void intel_mst_pre_enable_dp(struct intel_atomic_state *state,
 	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
 	struct intel_digital_port *dig_port = intel_mst->primary;
 	struct intel_dp *intel_dp = &dig_port->dp;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
 	struct drm_dp_mst_topology_state *mst_state =
@@ -752,7 +752,7 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
 	struct intel_digital_port *dig_port = intel_mst->primary;
 	struct intel_dp *intel_dp = &dig_port->dp;
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct drm_dp_mst_topology_state *mst_state =
 		drm_atomic_get_new_mst_topology_state(&state->base, &intel_dp->mst_mgr);
 	enum transcoder trans = pipe_config->cpu_transcoder;
@@ -1091,7 +1091,7 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 {
 	struct intel_dp *intel_dp = container_of(mgr, struct intel_dp, mst_mgr);
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
-	struct drm_device *dev = dig_port->base.base.dev;
+	struct drm_device *dev = dig_port->base.base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_connector *intel_connector;
 	struct drm_connector *connector;
@@ -1161,7 +1161,7 @@ intel_dp_create_fake_mst_encoder(struct intel_digital_port *dig_port, enum pipe
 {
 	struct intel_dp_mst_encoder *intel_mst;
 	struct intel_encoder *intel_encoder;
-	struct drm_device *dev = dig_port->base.base.dev;
+	struct drm_device *dev = dig_port->base.base.drm;
 
 	intel_mst = kzalloc(sizeof(*intel_mst), GFP_KERNEL);
 
@@ -1210,7 +1210,7 @@ static bool
 intel_dp_create_fake_mst_encoders(struct intel_digital_port *dig_port)
 {
 	struct intel_dp *intel_dp = &dig_port->dp;
-	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.drm);
 	enum pipe pipe;
 
 	for_each_pipe(dev_priv, pipe)
@@ -1227,7 +1227,7 @@ intel_dp_mst_encoder_active_links(struct intel_digital_port *dig_port)
 int
 intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_dp *intel_dp = &dig_port->dp;
 	enum port port = dig_port->base.port;
 	int ret;
diff --git a/drivers/gpu/drm/i915/display/intel_dpio_phy.c b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
index 62b93d097e44..567537ca3e60 100644
--- a/drivers/gpu/drm/i915/display/intel_dpio_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
@@ -272,7 +272,7 @@ void bxt_port_to_phy_channel(struct drm_i915_private *dev_priv, enum port port,
 void bxt_ddi_phy_set_signal_levels(struct intel_encoder *encoder,
 				   const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	int level = intel_ddi_level(encoder, crtc_state, 0);
 	const struct intel_ddi_buf_trans *trans;
 	enum dpio_channel ch;
@@ -589,7 +589,7 @@ bxt_ddi_phy_calc_lane_lat_optim_mask(u8 lane_count)
 void bxt_ddi_phy_set_lane_optim_mask(struct intel_encoder *encoder,
 				     u8 lane_lat_optim_mask)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	enum dpio_phy phy;
 	enum dpio_channel ch;
@@ -617,7 +617,7 @@ void bxt_ddi_phy_set_lane_optim_mask(struct intel_encoder *encoder,
 u8
 bxt_ddi_phy_get_lane_lat_optim_mask(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	enum dpio_phy phy;
 	enum dpio_channel ch;
@@ -685,7 +685,7 @@ void chv_set_phy_signal_level(struct intel_encoder *encoder,
 			      u32 deemph_reg_value, u32 margin_reg_value,
 			      bool uniq_trans_scale)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum dpio_channel ch = vlv_dig_port_to_channel(dig_port);
@@ -781,7 +781,7 @@ void chv_data_lane_soft_reset(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *crtc_state,
 			      bool reset)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum dpio_channel ch = vlv_dig_port_to_channel(enc_to_dig_port(encoder));
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum pipe pipe = crtc->pipe;
@@ -826,7 +826,7 @@ void chv_phy_pre_pll_enable(struct intel_encoder *encoder,
 			    const struct intel_crtc_state *crtc_state)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum dpio_channel ch = vlv_dig_port_to_channel(dig_port);
 	enum pipe pipe = crtc->pipe;
@@ -907,7 +907,7 @@ void chv_phy_pre_encoder_enable(struct intel_encoder *encoder,
 {
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum dpio_channel ch = vlv_dig_port_to_channel(dig_port);
 	enum pipe pipe = crtc->pipe;
@@ -985,7 +985,7 @@ void chv_phy_pre_encoder_enable(struct intel_encoder *encoder,
 void chv_phy_release_cl2_override(struct intel_encoder *encoder)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	if (dig_port->release_cl2_override) {
 		chv_phy_powergate_ch(dev_priv, DPIO_PHY0, DPIO_CH1, false);
@@ -996,7 +996,7 @@ void chv_phy_release_cl2_override(struct intel_encoder *encoder)
 void chv_phy_post_pll_disable(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *old_crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum pipe pipe = to_intel_crtc(old_crtc_state->uapi.crtc)->pipe;
 	u32 val;
 
@@ -1032,7 +1032,7 @@ void vlv_set_phy_signal_level(struct intel_encoder *encoder,
 			      u32 demph_reg_value, u32 preemph_reg_value,
 			      u32 uniqtranscale_reg_value, u32 tx3_demph)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum dpio_channel port = vlv_dig_port_to_channel(dig_port);
@@ -1060,7 +1060,7 @@ void vlv_phy_pre_pll_enable(struct intel_encoder *encoder,
 			    const struct intel_crtc_state *crtc_state)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum dpio_channel port = vlv_dig_port_to_channel(dig_port);
 	enum pipe pipe = crtc->pipe;
@@ -1090,7 +1090,7 @@ void vlv_phy_pre_encoder_enable(struct intel_encoder *encoder,
 {
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum dpio_channel port = vlv_dig_port_to_channel(dig_port);
 	enum pipe pipe = crtc->pipe;
@@ -1119,7 +1119,7 @@ void vlv_phy_reset_lanes(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 	enum dpio_channel port = vlv_dig_port_to_channel(dig_port);
 	enum pipe pipe = crtc->pipe;
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index ca96d98ac285..ced242623619 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4287,7 +4287,7 @@ void intel_update_active_dpll(struct intel_atomic_state *state,
 			      struct intel_crtc *crtc,
 			      struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	const struct intel_dpll_mgr *dpll_mgr = dev_priv->display.dpll.mgr;
 
 	if (drm_WARN_ON(&dev_priv->drm, !dpll_mgr))
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 2668362be33a..0f39e9ff9932 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -152,7 +152,7 @@ static enum port intel_dsi_seq_port_to_port(struct intel_dsi *intel_dsi,
 static const u8 *mipi_exec_send_packet(struct intel_dsi *intel_dsi,
 				       const u8 *data)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_dsi->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_dsi->base.base.drm);
 	struct mipi_dsi_device *dsi_device;
 	u8 type, flags, seq_port;
 	u16 len;
@@ -232,7 +232,7 @@ static const u8 *mipi_exec_send_packet(struct intel_dsi *intel_dsi,
 
 static const u8 *mipi_exec_delay(struct intel_dsi *intel_dsi, const u8 *data)
 {
-	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.drm);
 	u32 delay = *((const u32 *) data);
 
 	drm_dbg_kms(&i915->drm, "\n");
@@ -461,7 +461,7 @@ static void icl_native_gpio_set_value(struct drm_i915_private *dev_priv,
 
 static const u8 *mipi_exec_gpio(struct intel_dsi *intel_dsi, const u8 *data)
 {
-	struct drm_device *dev = intel_dsi->base.base.dev;
+	struct drm_device *dev = intel_dsi->base.base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_connector *connector = intel_dsi->attached_connector;
 	u8 gpio_source, gpio_index = 0, gpio_number;
@@ -534,7 +534,7 @@ static int i2c_adapter_lookup(struct acpi_resource *ares, void *data)
 static void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
 				  const u16 slave_addr)
 {
-	struct drm_device *drm_dev = intel_dsi->base.base.dev;
+	struct drm_device *drm_dev = intel_dsi->base.base.drm;
 	struct acpi_device *adev = ACPI_COMPANION(drm_dev->dev);
 	struct i2c_adapter_lookup lookup = {
 		.slave_addr = slave_addr,
@@ -555,7 +555,7 @@ static inline void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
 
 static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
 {
-	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.drm);
 	struct i2c_adapter *adapter;
 	struct i2c_msg msg;
 	int ret;
@@ -603,7 +603,7 @@ static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
 
 static const u8 *mipi_exec_spi(struct intel_dsi *intel_dsi, const u8 *data)
 {
-	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.drm);
 
 	drm_dbg_kms(&i915->drm, "Skipping SPI element execution\n");
 
@@ -612,7 +612,7 @@ static const u8 *mipi_exec_spi(struct intel_dsi *intel_dsi, const u8 *data)
 
 static const u8 *mipi_exec_pmic(struct intel_dsi *intel_dsi, const u8 *data)
 {
-	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.drm);
 #ifdef CONFIG_PMIC_OPREGION
 	u32 value, mask, reg_address;
 	u16 i2c_address;
@@ -679,7 +679,7 @@ static const char *sequence_name(enum mipi_seq seq_id)
 static void intel_dsi_vbt_exec(struct intel_dsi *intel_dsi,
 			       enum mipi_seq seq_id)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_dsi->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_dsi->base.base.drm);
 	struct intel_connector *connector = intel_dsi->attached_connector;
 	const u8 *data;
 	fn_mipi_elem_exec mipi_elem_exec;
@@ -765,7 +765,7 @@ void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
 
 void intel_dsi_log_params(struct intel_dsi *intel_dsi)
 {
-	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.drm);
 
 	drm_dbg_kms(&i915->drm, "Pclk %d\n", intel_dsi->pclk);
 	drm_dbg_kms(&i915->drm, "Pixel overlap %d\n",
@@ -817,7 +817,7 @@ void intel_dsi_log_params(struct intel_dsi *intel_dsi)
 
 bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
 {
-	struct drm_device *dev = intel_dsi->base.base.dev;
+	struct drm_device *dev = intel_dsi->base.base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_connector *connector = intel_dsi->attached_connector;
 	struct mipi_config *mipi_config = connector->panel.vbt.dsi.config;
@@ -956,7 +956,7 @@ static const struct pinctrl_map soc_pwm_pinctrl_map[] = {
 
 void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 {
-	struct drm_device *dev = intel_dsi->base.base.dev;
+	struct drm_device *dev = intel_dsi->base.base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_connector *connector = intel_dsi->attached_connector;
 	struct mipi_config *mipi_config = connector->panel.vbt.dsi.config;
@@ -1012,7 +1012,7 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 
 void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
 {
-	struct drm_device *dev = intel_dsi->base.base.dev;
+	struct drm_device *dev = intel_dsi->base.base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_connector *connector = intel_dsi->attached_connector;
 	struct mipi_config *mipi_config = connector->panel.vbt.dsi.config;
diff --git a/drivers/gpu/drm/i915/display/intel_dvo.c b/drivers/gpu/drm/i915/display/intel_dvo.c
index d69f288ce644..8eaa6d3fc97b 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo.c
+++ b/drivers/gpu/drm/i915/display/intel_dvo.c
@@ -143,7 +143,7 @@ static bool intel_dvo_connector_get_hw_state(struct intel_connector *connector)
 static bool intel_dvo_get_hw_state(struct intel_encoder *encoder,
 				   enum pipe *pipe)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	u32 tmp;
 
@@ -157,7 +157,7 @@ static bool intel_dvo_get_hw_state(struct intel_encoder *encoder,
 static void intel_dvo_get_config(struct intel_encoder *encoder,
 				 struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	u32 tmp, flags = 0;
 
@@ -183,7 +183,7 @@ static void intel_disable_dvo(struct intel_atomic_state *state,
 			      const struct intel_crtc_state *old_crtc_state,
 			      const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dvo *intel_dvo = enc_to_dvo(encoder);
 	enum port port = encoder->port;
 
@@ -198,7 +198,7 @@ static void intel_enable_dvo(struct intel_atomic_state *state,
 			     const struct intel_crtc_state *pipe_config,
 			     const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dvo *intel_dvo = enc_to_dvo(encoder);
 	enum port port = encoder->port;
 
@@ -282,7 +282,7 @@ static void intel_dvo_pre_enable(struct intel_atomic_state *state,
 				 const struct intel_crtc_state *pipe_config,
 				 const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	const struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 	enum port port = encoder->port;
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index 1f89020787fc..9353376e3d46 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -869,7 +869,7 @@ void hsw_fdi_link_train(struct intel_encoder *encoder,
 
 void hsw_fdi_disable(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	/*
 	 * Bspec lists this as both step 13 (before DDI_BUF_CTL disable)
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 31a1ac69dbcf..dcbd28eb812f 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -120,7 +120,7 @@ static
 int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
 			       const struct intel_hdcp_shim *shim, u8 *bksv)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	int ret, i, tries = 2;
 
 	/* HDCP spec states that we must retry the bksv if it is invalid */
@@ -2293,7 +2293,7 @@ intel_hdcp_set_streams(struct intel_digital_port *dig_port,
 	struct drm_connector_list_iter conn_iter;
 	struct intel_digital_port *conn_dig_port;
 	struct intel_connector *connector;
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
 
 	if (!intel_encoder_is_mst(&dig_port->base)) {
@@ -2337,7 +2337,7 @@ int intel_hdcp_enable(struct intel_atomic_state *state,
 		      const struct intel_crtc_state *pipe_config,
 		      const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 2c819d1b191b..549505084891 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -61,7 +61,7 @@
 
 inline struct drm_i915_private *intel_hdmi_to_i915(struct intel_hdmi *intel_hdmi)
 {
-	return to_i915(hdmi_to_dig_port(intel_hdmi)->base.base.dev);
+	return to_i915(hdmi_to_dig_port(intel_hdmi)->base.base.drm);
 }
 
 static void
@@ -203,7 +203,7 @@ static void g4x_write_infoframe(struct intel_encoder *encoder,
 				const void *frame, ssize_t len)
 {
 	const u32 *data = frame;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 val = intel_de_read(dev_priv, VIDEO_DIP_CTL);
 	int i;
 
@@ -238,7 +238,7 @@ static void g4x_read_infoframe(struct intel_encoder *encoder,
 			       unsigned int type,
 			       void *frame, ssize_t len)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 *data = frame;
 	int i;
 
@@ -252,7 +252,7 @@ static void g4x_read_infoframe(struct intel_encoder *encoder,
 static u32 g4x_infoframes_enabled(struct intel_encoder *encoder,
 				  const struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 val = intel_de_read(dev_priv, VIDEO_DIP_CTL);
 
 	if ((val & VIDEO_DIP_ENABLE) == 0)
@@ -271,7 +271,7 @@ static void ibx_write_infoframe(struct intel_encoder *encoder,
 				const void *frame, ssize_t len)
 {
 	const u32 *data = frame;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	i915_reg_t reg = TVIDEO_DIP_CTL(crtc->pipe);
 	u32 val = intel_de_read(dev_priv, reg);
@@ -309,7 +309,7 @@ static void ibx_read_infoframe(struct intel_encoder *encoder,
 			       unsigned int type,
 			       void *frame, ssize_t len)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	u32 *data = frame;
 	int i;
@@ -324,7 +324,7 @@ static void ibx_read_infoframe(struct intel_encoder *encoder,
 static u32 ibx_infoframes_enabled(struct intel_encoder *encoder,
 				  const struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum pipe pipe = to_intel_crtc(pipe_config->uapi.crtc)->pipe;
 	i915_reg_t reg = TVIDEO_DIP_CTL(pipe);
 	u32 val = intel_de_read(dev_priv, reg);
@@ -346,7 +346,7 @@ static void cpt_write_infoframe(struct intel_encoder *encoder,
 				const void *frame, ssize_t len)
 {
 	const u32 *data = frame;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	i915_reg_t reg = TVIDEO_DIP_CTL(crtc->pipe);
 	u32 val = intel_de_read(dev_priv, reg);
@@ -387,7 +387,7 @@ static void cpt_read_infoframe(struct intel_encoder *encoder,
 			       unsigned int type,
 			       void *frame, ssize_t len)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	u32 *data = frame;
 	int i;
@@ -402,7 +402,7 @@ static void cpt_read_infoframe(struct intel_encoder *encoder,
 static u32 cpt_infoframes_enabled(struct intel_encoder *encoder,
 				  const struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum pipe pipe = to_intel_crtc(pipe_config->uapi.crtc)->pipe;
 	u32 val = intel_de_read(dev_priv, TVIDEO_DIP_CTL(pipe));
 
@@ -420,7 +420,7 @@ static void vlv_write_infoframe(struct intel_encoder *encoder,
 				const void *frame, ssize_t len)
 {
 	const u32 *data = frame;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	i915_reg_t reg = VLV_TVIDEO_DIP_CTL(crtc->pipe);
 	u32 val = intel_de_read(dev_priv, reg);
@@ -459,7 +459,7 @@ static void vlv_read_infoframe(struct intel_encoder *encoder,
 			       unsigned int type,
 			       void *frame, ssize_t len)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	u32 *data = frame;
 	int i;
@@ -475,7 +475,7 @@ static void vlv_read_infoframe(struct intel_encoder *encoder,
 static u32 vlv_infoframes_enabled(struct intel_encoder *encoder,
 				  const struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum pipe pipe = to_intel_crtc(pipe_config->uapi.crtc)->pipe;
 	u32 val = intel_de_read(dev_priv, VLV_TVIDEO_DIP_CTL(pipe));
 
@@ -496,7 +496,7 @@ void hsw_write_infoframe(struct intel_encoder *encoder,
 			 const void *frame, ssize_t len)
 {
 	const u32 *data = frame;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	i915_reg_t ctl_reg = HSW_TVIDEO_DIP_CTL(cpu_transcoder);
 	int data_size;
@@ -535,7 +535,7 @@ void hsw_read_infoframe(struct intel_encoder *encoder,
 			const struct intel_crtc_state *crtc_state,
 			unsigned int type, void *frame, ssize_t len)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 *data = frame;
 	int i;
@@ -548,7 +548,7 @@ void hsw_read_infoframe(struct intel_encoder *encoder,
 static u32 hsw_infoframes_enabled(struct intel_encoder *encoder,
 				  const struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 val = intel_de_read(dev_priv,
 				HSW_TVIDEO_DIP_CTL(pipe_config->cpu_transcoder));
 	u32 mask;
@@ -588,7 +588,7 @@ u32 intel_hdmi_infoframe_enable(unsigned int type)
 u32 intel_hdmi_infoframes_enabled(struct intel_encoder *encoder,
 				  const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	u32 val, ret = 0;
 	int i;
@@ -641,12 +641,12 @@ static void intel_write_infoframe(struct intel_encoder *encoder,
 	     intel_hdmi_infoframe_enable(type)) == 0)
 		return;
 
-	if (drm_WARN_ON(encoder->base.dev, frame->any.type != type))
+	if (drm_WARN_ON(encoder->base.drm, frame->any.type != type))
 		return;
 
 	/* see comment above for the reason for this offset */
 	len = hdmi_infoframe_pack_only(frame, buffer + 1, sizeof(buffer) - 1);
-	if (drm_WARN_ON(encoder->base.dev, len < 0))
+	if (drm_WARN_ON(encoder->base.drm, len < 0))
 		return;
 
 	/* Insert the 'hole' (see big comment above) at position 3 */
@@ -679,13 +679,13 @@ void intel_read_infoframe(struct intel_encoder *encoder,
 	/* see comment above for the reason for this offset */
 	ret = hdmi_infoframe_unpack(frame, buffer + 1, sizeof(buffer) - 1);
 	if (ret) {
-		drm_dbg_kms(encoder->base.dev,
+		drm_dbg_kms(encoder->base.drm,
 			    "Failed to unpack infoframe type 0x%02x\n", type);
 		return;
 	}
 
 	if (frame->any.type != type)
-		drm_dbg_kms(encoder->base.dev,
+		drm_dbg_kms(encoder->base.drm,
 			    "Found the wrong infoframe type 0x%x (expected 0x%02x)\n",
 			    frame->any.type, type);
 }
@@ -722,7 +722,7 @@ intel_hdmi_compute_avi_infoframe(struct intel_encoder *encoder,
 	drm_hdmi_avi_infoframe_colorimetry(frame, conn_state);
 
 	/* nonsense combination */
-	drm_WARN_ON(encoder->base.dev, crtc_state->limited_color_range &&
+	drm_WARN_ON(encoder->base.drm, crtc_state->limited_color_range &&
 		    crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
 
 	if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_RGB) {
@@ -741,7 +741,7 @@ intel_hdmi_compute_avi_infoframe(struct intel_encoder *encoder,
 	/* TODO: handle pixel repetition for YCBCR420 outputs */
 
 	ret = hdmi_avi_infoframe_check(frame);
-	if (drm_WARN_ON(encoder->base.dev, ret))
+	if (drm_WARN_ON(encoder->base.drm, ret))
 		return false;
 
 	return true;
@@ -752,7 +752,7 @@ intel_hdmi_compute_spd_infoframe(struct intel_encoder *encoder,
 				 struct intel_crtc_state *crtc_state,
 				 struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct hdmi_spd_infoframe *frame = &crtc_state->infoframes.spd.spd;
 	int ret;
 
@@ -767,13 +767,13 @@ intel_hdmi_compute_spd_infoframe(struct intel_encoder *encoder,
 	else
 		ret = hdmi_spd_infoframe_init(frame, "Intel", "Integrated gfx");
 
-	if (drm_WARN_ON(encoder->base.dev, ret))
+	if (drm_WARN_ON(encoder->base.drm, ret))
 		return false;
 
 	frame->sdi = HDMI_SPD_SDI_PC;
 
 	ret = hdmi_spd_infoframe_check(frame);
-	if (drm_WARN_ON(encoder->base.dev, ret))
+	if (drm_WARN_ON(encoder->base.drm, ret))
 		return false;
 
 	return true;
@@ -799,11 +799,11 @@ intel_hdmi_compute_hdmi_infoframe(struct intel_encoder *encoder,
 	ret = drm_hdmi_vendor_infoframe_from_display_mode(frame,
 							  conn_state->connector,
 							  &crtc_state->hw.adjusted_mode);
-	if (drm_WARN_ON(encoder->base.dev, ret))
+	if (drm_WARN_ON(encoder->base.drm, ret))
 		return false;
 
 	ret = hdmi_vendor_infoframe_check(frame);
-	if (drm_WARN_ON(encoder->base.dev, ret))
+	if (drm_WARN_ON(encoder->base.drm, ret))
 		return false;
 
 	return true;
@@ -815,7 +815,7 @@ intel_hdmi_compute_drm_infoframe(struct intel_encoder *encoder,
 				 struct drm_connector_state *conn_state)
 {
 	struct hdmi_drm_infoframe *frame = &crtc_state->infoframes.drm.drm;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	int ret;
 
 	if (DISPLAY_VER(dev_priv) < 10)
@@ -849,7 +849,7 @@ static void g4x_set_infoframes(struct intel_encoder *encoder,
 			       const struct intel_crtc_state *crtc_state,
 			       const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	struct intel_hdmi *intel_hdmi = &dig_port->hdmi;
 	i915_reg_t reg = VIDEO_DIP_CTL;
@@ -961,7 +961,7 @@ static bool intel_hdmi_set_gcp_infoframe(struct intel_encoder *encoder,
 					 const struct intel_crtc_state *crtc_state,
 					 const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	i915_reg_t reg;
 
@@ -986,7 +986,7 @@ static bool intel_hdmi_set_gcp_infoframe(struct intel_encoder *encoder,
 void intel_hdmi_read_gcp_infoframe(struct intel_encoder *encoder,
 				   struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	i915_reg_t reg;
 
@@ -1010,7 +1010,7 @@ static void intel_hdmi_compute_gcp_infoframe(struct intel_encoder *encoder,
 					     struct intel_crtc_state *crtc_state,
 					     struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	if (IS_G4X(dev_priv) || !crtc_state->has_infoframe)
 		return;
@@ -1033,7 +1033,7 @@ static void ibx_set_infoframes(struct intel_encoder *encoder,
 			       const struct intel_crtc_state *crtc_state,
 			       const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	struct intel_hdmi *intel_hdmi = &dig_port->hdmi;
@@ -1092,7 +1092,7 @@ static void cpt_set_infoframes(struct intel_encoder *encoder,
 			       const struct intel_crtc_state *crtc_state,
 			       const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
 	i915_reg_t reg = TVIDEO_DIP_CTL(crtc->pipe);
@@ -1141,7 +1141,7 @@ static void vlv_set_infoframes(struct intel_encoder *encoder,
 			       const struct intel_crtc_state *crtc_state,
 			       const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
 	i915_reg_t reg = VLV_TVIDEO_DIP_CTL(crtc->pipe);
@@ -1199,7 +1199,7 @@ static void hsw_set_infoframes(struct intel_encoder *encoder,
 			       const struct intel_crtc_state *crtc_state,
 			       const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	i915_reg_t reg = HSW_TVIDEO_DIP_CTL(crtc_state->cpu_transcoder);
 	u32 val = intel_de_read(dev_priv, reg);
 
@@ -1256,7 +1256,7 @@ void intel_dp_dual_mode_set_tmds_output(struct intel_hdmi *hdmi, bool enable)
 static int intel_hdmi_hdcp_read(struct intel_digital_port *dig_port,
 				unsigned int offset, void *buffer, size_t size)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_hdmi *hdmi = &dig_port->hdmi;
 	struct i2c_adapter *adapter = intel_gmbus_get_adapter(i915,
 							      hdmi->ddc_bus);
@@ -1285,7 +1285,7 @@ static int intel_hdmi_hdcp_read(struct intel_digital_port *dig_port,
 static int intel_hdmi_hdcp_write(struct intel_digital_port *dig_port,
 				 unsigned int offset, void *buffer, size_t size)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_hdmi *hdmi = &dig_port->hdmi;
 	struct i2c_adapter *adapter = intel_gmbus_get_adapter(i915,
 							      hdmi->ddc_bus);
@@ -1319,7 +1319,7 @@ static
 int intel_hdmi_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
 				  u8 *an)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_hdmi *hdmi = &dig_port->hdmi;
 	struct i2c_adapter *adapter = intel_gmbus_get_adapter(i915,
 							      hdmi->ddc_bus);
@@ -1344,7 +1344,7 @@ int intel_hdmi_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
 static int intel_hdmi_hdcp_read_bksv(struct intel_digital_port *dig_port,
 				     u8 *bksv)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 
 	int ret;
 	ret = intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_BKSV, bksv,
@@ -1359,7 +1359,7 @@ static
 int intel_hdmi_hdcp_read_bstatus(struct intel_digital_port *dig_port,
 				 u8 *bstatus)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 
 	int ret;
 	ret = intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_BSTATUS,
@@ -1374,7 +1374,7 @@ static
 int intel_hdmi_hdcp_repeater_present(struct intel_digital_port *dig_port,
 				     bool *repeater_present)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	int ret;
 	u8 val;
 
@@ -1392,7 +1392,7 @@ static
 int intel_hdmi_hdcp_read_ri_prime(struct intel_digital_port *dig_port,
 				  u8 *ri_prime)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 
 	int ret;
 	ret = intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_RI_PRIME,
@@ -1407,7 +1407,7 @@ static
 int intel_hdmi_hdcp_read_ksv_ready(struct intel_digital_port *dig_port,
 				   bool *ksv_ready)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	int ret;
 	u8 val;
 
@@ -1425,7 +1425,7 @@ static
 int intel_hdmi_hdcp_read_ksv_fifo(struct intel_digital_port *dig_port,
 				  int num_downstream, u8 *ksv_fifo)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	int ret;
 	ret = intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_KSV_FIFO,
 				   ksv_fifo, num_downstream * DRM_HDCP_KSV_LEN);
@@ -1441,7 +1441,7 @@ static
 int intel_hdmi_hdcp_read_v_prime_part(struct intel_digital_port *dig_port,
 				      int i, u32 *part)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	int ret;
 
 	if (i >= DRM_HDCP_V_PRIME_NUM_PARTS)
@@ -1527,7 +1527,7 @@ static
 bool intel_hdmi_hdcp_check_link_once(struct intel_digital_port *dig_port,
 				     struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	enum port port = dig_port->base.port;
 	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
 	int ret;
@@ -1558,7 +1558,7 @@ static
 bool intel_hdmi_hdcp_check_link(struct intel_digital_port *dig_port,
 				struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	int retry;
 
 	for (retry = 0; retry < 3; retry++)
@@ -1616,7 +1616,7 @@ hdcp2_detect_msg_availability(struct intel_digital_port *dig_port,
 			      u8 msg_id, bool *msg_ready,
 			      ssize_t *msg_sz)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	u8 rx_status[HDCP_2_2_HDMI_RXSTATUS_LEN];
 	int ret;
 
@@ -1643,7 +1643,7 @@ static ssize_t
 intel_hdmi_hdcp2_wait_for_msg(struct intel_digital_port *dig_port,
 			      u8 msg_id, bool paired)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	bool msg_ready = false;
 	int timeout, ret;
 	ssize_t msg_sz = 0;
@@ -1678,7 +1678,7 @@ static
 int intel_hdmi_hdcp2_read_msg(struct intel_digital_port *dig_port,
 			      u8 msg_id, void *buf, size_t size)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_hdmi *hdmi = &dig_port->hdmi;
 	struct intel_hdcp *hdcp = &hdmi->attached_connector->hdcp;
 	unsigned int offset;
@@ -1768,7 +1768,7 @@ static const struct intel_hdcp_shim intel_hdmi_hdcp_shim = {
 
 static int intel_hdmi_source_max_tmds_clock(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	int max_tmds_clock, vbt_max_tmds_clock;
 
 	if (DISPLAY_VER(dev_priv) >= 10)
@@ -2109,7 +2109,7 @@ static int intel_hdmi_compute_clock(struct intel_encoder *encoder,
 				    struct intel_crtc_state *crtc_state,
 				    bool respect_downstream_limits)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int bpc, clock = adjusted_mode->crtc_clock;
@@ -2281,7 +2281,7 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
 			      struct intel_crtc_state *pipe_config,
 			      struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 	struct drm_connector *connector = conn_state->connector;
 	struct drm_scdc *scdc = &connector->display_info.hdmi.scdc;
@@ -2680,7 +2680,7 @@ bool intel_hdmi_handle_sink_scrambling(struct intel_encoder *encoder,
 				       bool high_tmds_clock_ratio,
 				       bool scrambling)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct drm_scrambling *sink_scrambling =
 		&connector->display_info.hdmi.scdc.scrambling;
 
@@ -2882,7 +2882,7 @@ static u8 g4x_port_to_ddc_pin(struct drm_i915_private *dev_priv,
 
 static u8 intel_hdmi_ddc_pin(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum port port = encoder->port;
 	u8 ddc_pin;
 
@@ -2927,7 +2927,7 @@ static u8 intel_hdmi_ddc_pin(struct intel_encoder *encoder)
 void intel_infoframe_init(struct intel_digital_port *dig_port)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(dig_port->base.base.dev);
+		to_i915(dig_port->base.base.drm);
 
 	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
 		dig_port->write_infoframe = vlv_write_infoframe;
@@ -2970,7 +2970,7 @@ void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 	struct drm_connector *connector = &intel_connector->base;
 	struct intel_hdmi *intel_hdmi = &dig_port->hdmi;
 	struct intel_encoder *intel_encoder = &dig_port->base;
-	struct drm_device *dev = intel_encoder->base.dev;
+	struct drm_device *dev = intel_encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct i2c_adapter *ddc;
 	enum port port = intel_encoder->port;
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index bec50f2d6650..1786027ae867 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -354,7 +354,7 @@ static void i915_digport_work_func(struct work_struct *work)
  */
 void intel_hpd_trigger_irq(struct intel_digital_port *dig_port)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 
 	spin_lock_irq(&i915->irq_lock);
 	i915->display.hotplug.short_port_mask |= BIT(dig_port->base.port);
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
index f95fa793fabb..e16c72d38ce0 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
@@ -700,7 +700,7 @@ static u32 ibx_hotplug_mask(enum hpd_pin hpd_pin)
 
 static u32 ibx_hotplug_enables(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	switch (encoder->hpd_pin) {
 	case HPD_PORT_A:
@@ -738,7 +738,7 @@ static void ibx_hpd_detection_setup(struct drm_i915_private *dev_priv)
 
 static void ibx_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	intel_uncore_rmw(&i915->uncore, PCH_PORT_HOTPLUG,
 			 ibx_hotplug_mask(encoder->hpd_pin),
@@ -804,7 +804,7 @@ static void icp_ddi_hpd_detection_setup(struct drm_i915_private *dev_priv)
 
 static void icp_ddi_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	intel_uncore_rmw(&i915->uncore, SHOTPLUG_CTL_DDI,
 			 icp_ddi_hotplug_mask(encoder->hpd_pin),
@@ -820,7 +820,7 @@ static void icp_tc_hpd_detection_setup(struct drm_i915_private *dev_priv)
 
 static void icp_tc_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	intel_uncore_rmw(&i915->uncore, SHOTPLUG_CTL_TC,
 			 icp_tc_hotplug_mask(encoder->hpd_pin),
@@ -880,7 +880,7 @@ static void dg1_hpd_invert(struct drm_i915_private *i915)
 
 static void dg1_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	dg1_hpd_invert(i915);
 	icp_hpd_enable_detection(encoder);
@@ -901,7 +901,7 @@ static void gen11_tc_hpd_detection_setup(struct drm_i915_private *dev_priv)
 
 static void gen11_tc_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	intel_uncore_rmw(&i915->uncore, GEN11_TC_HOTPLUG_CTL,
 			 gen11_hotplug_mask(encoder->hpd_pin),
@@ -917,7 +917,7 @@ static void gen11_tbt_hpd_detection_setup(struct drm_i915_private *dev_priv)
 
 static void gen11_tbt_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	intel_uncore_rmw(&i915->uncore, GEN11_TBT_HOTPLUG_CTL,
 			 gen11_hotplug_mask(encoder->hpd_pin),
@@ -926,7 +926,7 @@ static void gen11_tbt_hpd_enable_detection(struct intel_encoder *encoder)
 
 static void gen11_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	gen11_tc_hpd_enable_detection(encoder);
 	gen11_tbt_hpd_enable_detection(encoder);
@@ -996,7 +996,7 @@ static void mtp_ddi_hpd_detection_setup(struct drm_i915_private *i915)
 
 static void mtp_ddi_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	intel_de_rmw(i915, SHOTPLUG_CTL_DDI,
 		     mtp_ddi_hotplug_mask(encoder->hpd_pin),
@@ -1012,7 +1012,7 @@ static void mtp_tc_hpd_detection_setup(struct drm_i915_private *i915)
 
 static void mtp_tc_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	intel_de_rmw(i915, SHOTPLUG_CTL_DDI,
 		     mtp_tc_hotplug_mask(encoder->hpd_pin),
@@ -1035,7 +1035,7 @@ static void mtp_hpd_invert(struct drm_i915_private *i915)
 
 static void mtp_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	mtp_hpd_invert(i915);
 	mtp_ddi_hpd_enable_detection(encoder);
@@ -1078,7 +1078,7 @@ static void _xelpdp_pica_hpd_detection_setup(struct drm_i915_private *i915,
 
 static void xelpdp_pica_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	_xelpdp_pica_hpd_detection_setup(i915, encoder->hpd_pin, true);
 }
@@ -1177,7 +1177,7 @@ static void spt_hpd_detection_setup(struct drm_i915_private *dev_priv)
 
 static void spt_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	/* Display WA #1179 WaHardHangonHotPlug: cnp */
 	if (HAS_PCH_CNP(i915)) {
@@ -1246,7 +1246,7 @@ static void ilk_hpd_detection_setup(struct drm_i915_private *dev_priv)
 
 static void ilk_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	intel_uncore_rmw(&i915->uncore, DIGITAL_PORT_HOTPLUG_CNTRL,
 			 ilk_hotplug_mask(encoder->hpd_pin),
@@ -1320,7 +1320,7 @@ static void bxt_hpd_detection_setup(struct drm_i915_private *dev_priv)
 
 static void bxt_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	intel_uncore_rmw(&i915->uncore, PCH_PORT_HOTPLUG,
 			 bxt_hotplug_mask(encoder->hpd_pin),
@@ -1341,7 +1341,7 @@ static void bxt_hpd_irq_setup(struct drm_i915_private *dev_priv)
 
 static void i915_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	u32 hotplug_en = hpd_mask_i915[encoder->hpd_pin];
 
 	/* HPD sense and interrupt enable are one and the same */
@@ -1400,7 +1400,7 @@ HPD_FUNCS(ilk);
 
 void intel_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	if (i915->display.funcs.hotplug)
 		i915->display.funcs.hotplug->hpd_enable_detection(encoder);
diff --git a/drivers/gpu/drm/i915/display/intel_load_detect.c b/drivers/gpu/drm/i915/display/intel_load_detect.c
index d5a0aecf3e8f..015b1586ef5f 100644
--- a/drivers/gpu/drm/i915/display/intel_load_detect.c
+++ b/drivers/gpu/drm/i915/display/intel_load_detect.c
@@ -52,7 +52,7 @@ intel_load_detect_get_pipe(struct drm_connector *connector,
 		intel_attached_encoder(to_intel_connector(connector));
 	struct intel_crtc *possible_crtc;
 	struct intel_crtc *crtc = NULL;
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_atomic_state *state = NULL, *restore_state = NULL;
@@ -206,7 +206,7 @@ void intel_load_detect_release_pipe(struct drm_connector *connector,
 {
 	struct intel_encoder *intel_encoder =
 		intel_attached_encoder(to_intel_connector(connector));
-	struct drm_i915_private *i915 = to_i915(intel_encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_encoder->base.drm);
 	struct drm_encoder *encoder = &intel_encoder->base;
 	int ret;
 
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index bb3b5355a0d9..f3f07113a555 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -514,7 +514,7 @@ void lspcon_set_infoframes(struct intel_encoder *encoder,
 	u8 buf[VIDEO_DIP_DATA_SIZE];
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	struct intel_lspcon *lspcon = &dig_port->lspcon;
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
@@ -551,7 +551,7 @@ void lspcon_set_infoframes(struct intel_encoder *encoder,
 	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, conn_state);
 
 	/* nonsense combination */
-	drm_WARN_ON(encoder->base.dev, crtc_state->limited_color_range &&
+	drm_WARN_ON(encoder->base.drm, crtc_state->limited_color_range &&
 		    crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
 
 	if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_RGB) {
@@ -613,7 +613,7 @@ u32 lspcon_infoframes_enabled(struct intel_encoder *encoder,
 {
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_lspcon *lspcon = enc_to_intel_lspcon(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	bool infoframes_enabled;
 	u32 val = 0;
 	u32 mask, tmp;
@@ -685,7 +685,7 @@ u32 intel_lspcon_infoframes_enabled(struct intel_encoder *encoder,
 void lspcon_resume(struct intel_digital_port *dig_port)
 {
 	struct intel_lspcon *lspcon = &dig_port->lspcon;
-	struct drm_device *dev = dig_port->base.base.dev;
+	struct drm_device *dev = dig_port->base.base.drm;
 	struct drm_i915_private *i915 = to_i915(dev);
 	enum drm_lspcon_mode expected_mode;
 
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index c7b96ea7666c..ca98d81d1ed0 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -105,7 +105,7 @@ bool intel_lvds_port_enabled(struct drm_i915_private *i915,
 static bool intel_lvds_get_hw_state(struct intel_encoder *encoder,
 				    enum pipe *pipe)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_lvds_encoder *lvds_encoder = to_lvds_encoder(encoder);
 	intel_wakeref_t wakeref;
 	bool ret;
@@ -124,7 +124,7 @@ static bool intel_lvds_get_hw_state(struct intel_encoder *encoder,
 static void intel_lvds_get_config(struct intel_encoder *encoder,
 				  struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_lvds_encoder *lvds_encoder = to_lvds_encoder(encoder);
 	u32 tmp, flags = 0;
 
@@ -236,7 +236,7 @@ static void intel_pre_enable_lvds(struct intel_atomic_state *state,
 				  const struct drm_connector_state *conn_state)
 {
 	struct intel_lvds_encoder *lvds_encoder = to_lvds_encoder(encoder);
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	enum pipe pipe = crtc->pipe;
@@ -317,7 +317,7 @@ static void intel_enable_lvds(struct intel_atomic_state *state,
 			      const struct drm_connector_state *conn_state)
 {
 	struct intel_lvds_encoder *lvds_encoder = to_lvds_encoder(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	intel_de_rmw(dev_priv, lvds_encoder->reg, 0, LVDS_PORT_EN);
 
@@ -337,7 +337,7 @@ static void intel_disable_lvds(struct intel_atomic_state *state,
 			       const struct drm_connector_state *old_conn_state)
 {
 	struct intel_lvds_encoder *lvds_encoder = to_lvds_encoder(encoder);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	intel_de_rmw(dev_priv, PP_CONTROL(0), PANEL_POWER_ON, 0);
 	if (intel_de_wait_for_clear(dev_priv, PP_STATUS(0), PP_ON, 1000))
@@ -377,7 +377,7 @@ static void pch_post_disable_lvds(struct intel_atomic_state *state,
 
 static void intel_lvds_shutdown(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	if (intel_de_wait_for_clear(dev_priv, PP_STATUS(0), PP_CYCLE_DELAY_ACTIVE, 5000))
 		drm_err(&dev_priv->drm,
@@ -411,7 +411,7 @@ static int intel_lvds_compute_config(struct intel_encoder *encoder,
 				     struct intel_crtc_state *crtc_state,
 				     struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_lvds_encoder *lvds_encoder = to_lvds_encoder(encoder);
 	struct intel_connector *connector = lvds_encoder->attached_connector;
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
@@ -783,7 +783,7 @@ bool intel_is_dual_link_lvds(struct drm_i915_private *i915)
 
 static bool compute_is_dual_link_lvds(struct intel_lvds_encoder *lvds_encoder)
 {
-	struct drm_i915_private *i915 = to_i915(lvds_encoder->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(lvds_encoder->base.base.drm);
 	struct intel_connector *connector = lvds_encoder->attached_connector;
 	const struct drm_display_mode *fixed_mode =
 		intel_panel_preferred_fixed_mode(connector);
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index 508ca534ab04..c588bf7faaf5 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -115,7 +115,7 @@ static void set_encoder_for_connector(struct intel_connector *connector,
 
 static void reset_encoder_connector_state(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_pmdemand_state *pmdemand_state =
 		to_intel_pmdemand_state(i915->display.pmdemand.obj.state);
 	struct intel_connector *connector;
@@ -408,7 +408,7 @@ static bool intel_crtc_needs_link_reset(struct intel_crtc *crtc)
 
 static struct intel_connector *intel_encoder_find_connector(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct drm_connector_list_iter conn_iter;
 	struct intel_connector *connector;
 	struct intel_connector *found_connector = NULL;
@@ -558,7 +558,7 @@ static bool has_bogus_dpll_config(const struct intel_crtc_state *crtc_state)
 
 static void intel_sanitize_encoder(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_connector *connector;
 	struct intel_crtc *crtc = to_intel_crtc(encoder->base.crtc);
 	struct intel_crtc_state *crtc_state = crtc ?
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index 246002019175..e2fcd783b92d 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -359,7 +359,7 @@ static int swsci(struct drm_i915_private *dev_priv,
 int intel_opregion_notify_encoder(struct intel_encoder *intel_encoder,
 				  bool enable)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_encoder->base.drm);
 	u32 parm = 0;
 	u32 type = 0;
 	u32 port;
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index efe52b20dea0..de93c6ab1827 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -390,7 +390,7 @@ pps_initial_setup(struct intel_dp *intel_dp)
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
 	struct intel_connector *connector = intel_dp->attached_connector;
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 
 	lockdep_assert_held(&i915->display.pps.mutex);
 
@@ -1110,7 +1110,7 @@ void intel_pps_backlight_power(struct intel_connector *connector, bool enable)
 static void vlv_detach_power_sequencer(struct intel_dp *intel_dp)
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
-	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.drm);
 	enum pipe pipe = intel_dp->pps.pps_pipe;
 	i915_reg_t pp_on_reg = PP_ON_DELAYS(pipe);
 
@@ -1171,7 +1171,7 @@ static void vlv_steal_power_sequencer(struct drm_i915_private *dev_priv,
 void vlv_pps_init(struct intel_encoder *encoder,
 		  const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index f91e4f2f926a..2f60e3cc26e6 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -412,7 +412,7 @@ static void intel_dp_get_su_granularity(struct intel_dp *intel_dp)
 void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
+		to_i915(dp_to_dig_port(intel_dp)->base.base.drm);
 
 	drm_dp_dpcd_read(&intel_dp->aux, DP_PSR_SUPPORT, intel_dp->psr_dpcd,
 			 sizeof(intel_dp->psr_dpcd));
@@ -1154,7 +1154,7 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 void intel_psr_get_config(struct intel_encoder *encoder,
 			  struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	enum transcoder cpu_transcoder = pipe_config->cpu_transcoder;
 	struct intel_dp *intel_dp;
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 28d9f3654dfb..6918979f48da 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -214,7 +214,7 @@ intel_sdvo_create_enhance_property(struct intel_sdvo *intel_sdvo,
  */
 static void intel_sdvo_write_sdvox(struct intel_sdvo *intel_sdvo, u32 val)
 {
-	struct drm_device *dev = intel_sdvo->base.base.dev;
+	struct drm_device *dev = intel_sdvo->base.base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	u32 bval = val, cval = val;
 	int i;
@@ -415,7 +415,7 @@ static const char *sdvo_cmd_name(u8 cmd)
 static void intel_sdvo_debug_write(struct intel_sdvo *intel_sdvo, u8 cmd,
 				   const void *args, int args_len)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.drm);
 	const char *cmd_name;
 	int i, pos = 0;
 	char buffer[64];
@@ -538,7 +538,7 @@ static bool intel_sdvo_write_cmd(struct intel_sdvo *intel_sdvo, u8 cmd,
 static bool intel_sdvo_read_response(struct intel_sdvo *intel_sdvo,
 				     void *response, int response_len)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.drm);
 	const char *cmd_status;
 	u8 retry = 15; /* 5 quick checks, followed by 10 long checks */
 	u8 status;
@@ -1093,7 +1093,7 @@ static bool intel_sdvo_compute_avi_infoframe(struct intel_sdvo *intel_sdvo,
 					     struct intel_crtc_state *crtc_state,
 					     struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.drm);
 	struct hdmi_avi_infoframe *frame = &crtc_state->infoframes.avi.avi;
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
@@ -1128,7 +1128,7 @@ static bool intel_sdvo_compute_avi_infoframe(struct intel_sdvo *intel_sdvo,
 static bool intel_sdvo_set_avi_infoframe(struct intel_sdvo *intel_sdvo,
 					 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.drm);
 	u8 sdvo_data[HDMI_INFOFRAME_SIZE(AVI)];
 	const union hdmi_infoframe *frame = &crtc_state->infoframes.avi;
 	ssize_t len;
@@ -1187,7 +1187,7 @@ static void intel_sdvo_get_avi_infoframe(struct intel_sdvo *intel_sdvo,
 static void intel_sdvo_get_eld(struct intel_sdvo *intel_sdvo,
 			       struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(intel_sdvo->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_sdvo->base.base.drm);
 	ssize_t len;
 	u8 val;
 
@@ -1357,7 +1357,7 @@ static int intel_sdvo_compute_config(struct intel_encoder *encoder,
 	pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
 	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
 
-	if (HAS_PCH_SPLIT(to_i915(encoder->base.dev)))
+	if (HAS_PCH_SPLIT(to_i915(encoder->base.drm)))
 		pipe_config->has_pch_encoder = true;
 
 	/*
@@ -1498,7 +1498,7 @@ static void intel_sdvo_pre_enable(struct intel_atomic_state *state,
 				  const struct intel_crtc_state *crtc_state,
 				  const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	const struct intel_sdvo_connector_state *sdvo_state =
@@ -1659,7 +1659,7 @@ bool intel_sdvo_port_enabled(struct drm_i915_private *dev_priv,
 static bool intel_sdvo_get_hw_state(struct intel_encoder *encoder,
 				    enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_sdvo *intel_sdvo = to_sdvo(encoder);
 	u16 active_outputs = 0;
 	bool ret;
@@ -1674,7 +1674,7 @@ static bool intel_sdvo_get_hw_state(struct intel_encoder *encoder,
 static void intel_sdvo_get_config(struct intel_encoder *encoder,
 				  struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_sdvo *intel_sdvo = to_sdvo(encoder);
 	struct intel_sdvo_dtd dtd;
@@ -1800,7 +1800,7 @@ static void intel_disable_sdvo(struct intel_atomic_state *state,
 			       const struct intel_crtc_state *old_crtc_state,
 			       const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_sdvo *intel_sdvo = to_sdvo(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 	u32 temp;
@@ -1864,7 +1864,7 @@ static void intel_enable_sdvo(struct intel_atomic_state *state,
 			      const struct intel_crtc_state *pipe_config,
 			      const struct drm_connector_state *conn_state)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_sdvo *intel_sdvo = to_sdvo(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
@@ -1992,7 +1992,7 @@ static u8 intel_sdvo_get_colorimetry_cap(struct intel_sdvo *intel_sdvo)
 
 static u16 intel_sdvo_get_hotplug_support(struct intel_sdvo *intel_sdvo)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.drm);
 	u16 hotplug;
 
 	if (!I915_HAS_HOTPLUG(dev_priv))
@@ -2705,10 +2705,10 @@ intel_sdvo_connector_init(struct intel_sdvo_connector *connector,
 	int ret;
 
 	drm_connector = &connector->base.base;
-	ret = drm_connector_init(encoder->base.base.dev,
-			   drm_connector,
-			   &intel_sdvo_connector_funcs,
-			   connector->base.base.connector_type);
+	ret = drm_connector_init(encoder->base.base.drm,
+				 drm_connector,
+				 &intel_sdvo_connector_funcs,
+				 connector->base.base.connector_type);
 	if (ret < 0)
 		return ret;
 
@@ -2881,7 +2881,7 @@ static bool
 intel_sdvo_lvds_init(struct intel_sdvo *intel_sdvo, u16 type)
 {
 	struct drm_encoder *encoder = &intel_sdvo->base.base;
-	struct drm_i915_private *i915 = to_i915(encoder->dev);
+	struct drm_i915_private *i915 = to_i915(encoder->drm);
 	struct drm_connector *connector;
 	struct intel_connector *intel_connector;
 	struct intel_sdvo_connector *intel_sdvo_connector;
@@ -2982,7 +2982,7 @@ intel_sdvo_output_setup(struct intel_sdvo *intel_sdvo)
 		SDVO_OUTPUT_LVDS0,
 		SDVO_OUTPUT_LVDS1,
 	};
-	struct drm_i915_private *i915 = to_i915(intel_sdvo->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(intel_sdvo->base.base.drm);
 	u16 flags;
 	int i;
 
@@ -3015,7 +3015,7 @@ intel_sdvo_output_setup(struct intel_sdvo *intel_sdvo)
 
 static void intel_sdvo_output_cleanup(struct intel_sdvo *intel_sdvo)
 {
-	struct drm_device *dev = intel_sdvo->base.base.dev;
+	struct drm_device *dev = intel_sdvo->base.base.drm;
 	struct drm_connector *connector, *tmp;
 
 	list_for_each_entry_safe(connector, tmp,
@@ -3031,7 +3031,7 @@ static bool intel_sdvo_tv_create_property(struct intel_sdvo *intel_sdvo,
 					  struct intel_sdvo_connector *intel_sdvo_connector,
 					  int type)
 {
-	struct drm_device *dev = intel_sdvo->base.base.dev;
+	struct drm_device *dev = intel_sdvo->base.base.drm;
 	struct intel_sdvo_tv_format format;
 	u32 format_map, i;
 
@@ -3095,7 +3095,7 @@ intel_sdvo_create_enhance_property_tv(struct intel_sdvo *intel_sdvo,
 				      struct intel_sdvo_connector *intel_sdvo_connector,
 				      struct intel_sdvo_enhancements_reply enhancements)
 {
-	struct drm_device *dev = intel_sdvo->base.base.dev;
+	struct drm_device *dev = intel_sdvo->base.base.drm;
 	struct drm_connector *connector = &intel_sdvo_connector->base.base;
 	struct drm_connector_state *conn_state = connector->state;
 	struct intel_sdvo_connector_state *sdvo_state =
@@ -3209,7 +3209,7 @@ intel_sdvo_create_enhance_property_lvds(struct intel_sdvo *intel_sdvo,
 					struct intel_sdvo_connector *intel_sdvo_connector,
 					struct intel_sdvo_enhancements_reply enhancements)
 {
-	struct drm_device *dev = intel_sdvo->base.base.dev;
+	struct drm_device *dev = intel_sdvo->base.base.drm;
 	struct drm_connector *connector = &intel_sdvo_connector->base.base;
 	u16 response, data_value[2];
 
diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.c b/drivers/gpu/drm/i915/display/intel_snps_phy.c
index 6f5cd530539c..30b28cdf37c0 100644
--- a/drivers/gpu/drm/i915/display/intel_snps_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_snps_phy.c
@@ -61,7 +61,7 @@ void intel_snps_phy_update_psr_power_state(struct drm_i915_private *i915,
 void intel_snps_phy_set_signal_levels(struct intel_encoder *encoder,
 				      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	const struct intel_ddi_buf_trans *trans;
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 	int n_entries, ln;
@@ -1785,7 +1785,7 @@ intel_mpllb_tables_get(struct intel_crtc_state *crtc_state,
 int intel_mpllb_calc_state(struct intel_crtc_state *crtc_state,
 			   struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	const struct intel_mpllb_state * const *tables;
 	int i;
 
@@ -1820,7 +1820,7 @@ int intel_mpllb_calc_state(struct intel_crtc_state *crtc_state,
 void intel_mpllb_enable(struct intel_encoder *encoder,
 			const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	const struct intel_mpllb_state *pll_state = &crtc_state->mpllb_state;
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 	i915_reg_t enable_reg = (phy <= PHY_D ?
@@ -1878,7 +1878,7 @@ void intel_mpllb_enable(struct intel_encoder *encoder,
 
 void intel_mpllb_disable(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(i915, encoder->port);
 	i915_reg_t enable_reg = (phy <= PHY_D ?
 				 DG2_PLL_ENABLE(phy) : MG_PLL_ENABLE(0));
@@ -1950,7 +1950,7 @@ int intel_mpllb_calc_port_clock(struct intel_encoder *encoder,
 void intel_mpllb_readout_hw_state(struct intel_encoder *encoder,
 				  struct intel_mpllb_state *pll_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 
 	pll_state->mpllb_cp = intel_de_read(dev_priv, SNPS_PHY_MPLLB_CP(phy));
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 3ebf41859043..c53cedb21d1e 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -94,13 +94,13 @@ static struct intel_tc_port *to_tc_port(struct intel_digital_port *dig_port)
 
 static struct drm_i915_private *tc_to_i915(struct intel_tc_port *tc)
 {
-	return to_i915(tc->dig_port->base.base.dev);
+	return to_i915(tc->dig_port->base.base.drm);
 }
 
 static bool intel_tc_port_in_mode(struct intel_digital_port *dig_port,
 				  enum tc_port_mode mode)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	enum phy phy = intel_port_to_phy(i915, dig_port->base.port);
 	struct intel_tc_port *tc = to_tc_port(dig_port);
 
@@ -172,7 +172,7 @@ bool intel_tc_port_in_legacy_mode(struct intel_digital_port *dig_port)
  */
 bool intel_tc_cold_requires_aux_pw(struct intel_digital_port *dig_port)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_tc_port *tc = to_tc_port(dig_port);
 
 	return tc_phy_cold_off_domain(tc) ==
@@ -262,7 +262,7 @@ assert_tc_port_power_enabled(struct intel_tc_port *tc)
 
 u32 intel_tc_port_get_lane_mask(struct intel_digital_port *dig_port)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_tc_port *tc = to_tc_port(dig_port);
 	u32 lane_mask;
 
@@ -277,7 +277,7 @@ u32 intel_tc_port_get_lane_mask(struct intel_digital_port *dig_port)
 
 u32 intel_tc_port_get_pin_assignment_mask(struct intel_digital_port *dig_port)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_tc_port *tc = to_tc_port(dig_port);
 	u32 pin_mask;
 
@@ -292,7 +292,7 @@ u32 intel_tc_port_get_pin_assignment_mask(struct intel_digital_port *dig_port)
 
 static int mtl_tc_port_get_pin_assignment_mask(struct intel_digital_port *dig_port)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	intel_wakeref_t wakeref;
 	u32 pin_mask;
 
@@ -313,7 +313,7 @@ static int mtl_tc_port_get_pin_assignment_mask(struct intel_digital_port *dig_po
 
 int intel_tc_port_fia_max_lane_count(struct intel_digital_port *dig_port)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_tc_port *tc = to_tc_port(dig_port);
 	enum phy phy = intel_port_to_phy(i915, dig_port->base.port);
 	intel_wakeref_t wakeref;
@@ -351,7 +351,7 @@ int intel_tc_port_fia_max_lane_count(struct intel_digital_port *dig_port)
 void intel_tc_port_set_fia_lane_count(struct intel_digital_port *dig_port,
 				      int required_lanes)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_tc_port *tc = to_tc_port(dig_port);
 	bool lane_reversal = dig_port->saved_port_bits & DDI_BUF_PORT_REVERSAL;
 	u32 val;
@@ -1161,7 +1161,7 @@ static bool tc_phy_is_connected(struct intel_tc_port *tc,
 				enum icl_port_dpll_id port_pll_type)
 {
 	struct intel_encoder *encoder = &tc->dig_port->base;
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	bool phy_is_ready = tc_phy_is_ready(tc);
 	bool phy_is_owned = tc_phy_is_owned(tc);
 	bool is_connected;
@@ -1423,7 +1423,7 @@ static bool tc_port_is_enabled(struct intel_tc_port *tc)
  */
 void intel_tc_port_init_mode(struct intel_digital_port *dig_port)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_tc_port *tc = to_tc_port(dig_port);
 	bool update_mode = false;
 
@@ -1509,7 +1509,7 @@ static bool tc_port_has_active_links(struct intel_tc_port *tc,
 void intel_tc_port_sanitize_mode(struct intel_digital_port *dig_port,
 				 const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_tc_port *tc = to_tc_port(dig_port);
 
 	mutex_lock(&tc->lock);
@@ -1552,7 +1552,7 @@ void intel_tc_port_sanitize_mode(struct intel_digital_port *dig_port,
 bool intel_tc_port_connected_locked(struct intel_encoder *encoder)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_tc_port *tc = to_tc_port(dig_port);
 	u32 mask = ~0;
 
@@ -1594,7 +1594,7 @@ static bool __intel_tc_port_link_needs_reset(struct intel_tc_port *tc)
 
 bool intel_tc_port_link_needs_reset(struct intel_digital_port *dig_port)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	enum phy phy = intel_port_to_phy(i915, dig_port->base.port);
 
 	if (!intel_phy_is_tc(i915, phy))
@@ -1699,7 +1699,7 @@ bool intel_tc_port_link_reset(struct intel_digital_port *dig_port)
 
 void intel_tc_port_link_cancel_reset_work(struct intel_digital_port *dig_port)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	enum phy phy = intel_port_to_phy(i915, dig_port->base.port);
 	struct intel_tc_port *tc = to_tc_port(dig_port);
 
@@ -1817,7 +1817,7 @@ void intel_tc_port_put_link(struct intel_digital_port *dig_port)
 
 int intel_tc_port_init(struct intel_digital_port *dig_port, bool is_legacy)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.drm);
 	struct intel_tc_port *tc;
 	enum port port = dig_port->base.port;
 	enum tc_port tc_port = intel_port_to_tc(i915, port);
diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index 5f2c9ba488d9..3ee095ce47af 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -912,7 +912,7 @@ static struct intel_tv *intel_attached_tv(struct intel_connector *connector)
 static bool
 intel_tv_get_hw_state(struct intel_encoder *encoder, enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 tmp = intel_de_read(dev_priv, TV_CTL);
 
 	*pipe = (tmp & TV_ENC_PIPE_SEL_MASK) >> TV_ENC_PIPE_SEL_SHIFT;
@@ -926,7 +926,7 @@ intel_enable_tv(struct intel_atomic_state *state,
 		const struct intel_crtc_state *pipe_config,
 		const struct drm_connector_state *conn_state)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 
 	/* Prevents vblank waits from timing out in intel_tv_detect_type() */
@@ -941,7 +941,7 @@ intel_disable_tv(struct intel_atomic_state *state,
 		 const struct intel_crtc_state *old_crtc_state,
 		 const struct drm_connector_state *old_conn_state)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 
 	intel_de_rmw(dev_priv, TV_CTL, TV_ENC_ENABLE, 0);
@@ -1087,7 +1087,7 @@ static void
 intel_tv_get_config(struct intel_encoder *encoder,
 		    struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
 	struct drm_display_mode mode = {};
@@ -1190,7 +1190,7 @@ intel_tv_compute_config(struct intel_encoder *encoder,
 	struct intel_atomic_state *state =
 		to_intel_atomic_state(pipe_config->uapi.state);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_tv_connector_state *tv_conn_state =
 		to_intel_tv_connector_state(conn_state);
 	const struct tv_mode *tv_mode = intel_tv_mode_find(conn_state);
@@ -1433,7 +1433,7 @@ static void intel_tv_pre_enable(struct intel_atomic_state *state,
 				const struct intel_crtc_state *pipe_config,
 				const struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	struct intel_tv *intel_tv = enc_to_tv(encoder);
 	const struct intel_tv_connector_state *tv_conn_state =
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 129e00578a28..5992e003dac8 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -85,7 +85,7 @@ enum mipi_dsi_pixel_format pixel_format_from_register_bits(u32 fmt)
 void vlv_dsi_wait_for_fifo_empty(struct intel_dsi *intel_dsi, enum port port)
 {
 	struct drm_encoder *encoder = &intel_dsi->base.base;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	u32 mask;
 
@@ -131,7 +131,7 @@ static ssize_t intel_dsi_host_transfer(struct mipi_dsi_host *host,
 				       const struct mipi_dsi_msg *msg)
 {
 	struct intel_dsi_host *intel_dsi_host = to_intel_dsi_host(host);
-	struct drm_device *dev = intel_dsi_host->intel_dsi->base.base.dev;
+	struct drm_device *dev = intel_dsi_host->intel_dsi->base.base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum port port = intel_dsi_host->port;
 	struct mipi_dsi_packet packet;
@@ -225,7 +225,7 @@ static int dpi_send_cmd(struct intel_dsi *intel_dsi, u32 cmd, bool hs,
 			enum port port)
 {
 	struct drm_encoder *encoder = &intel_dsi->base.base;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	u32 mask;
 
@@ -271,7 +271,7 @@ static int intel_dsi_compute_config(struct intel_encoder *encoder,
 				    struct intel_crtc_state *pipe_config,
 				    struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = container_of(encoder, struct intel_dsi,
 						   base);
 	struct intel_connector *intel_connector = intel_dsi->attached_connector;
@@ -328,7 +328,7 @@ static int intel_dsi_compute_config(struct intel_encoder *encoder,
 
 static bool glk_dsi_enable_io(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 	bool cold_boot = false;
@@ -368,7 +368,7 @@ static bool glk_dsi_enable_io(struct intel_encoder *encoder)
 
 static void glk_dsi_device_ready(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -430,7 +430,7 @@ static void glk_dsi_device_ready(struct intel_encoder *encoder)
 
 static void bxt_dsi_device_ready(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 	u32 val;
@@ -456,7 +456,7 @@ static void bxt_dsi_device_ready(struct intel_encoder *encoder)
 
 static void vlv_dsi_device_ready(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -496,7 +496,7 @@ static void vlv_dsi_device_ready(struct intel_encoder *encoder)
 
 static void intel_dsi_device_ready(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	if (IS_GEMINILAKE(dev_priv))
 		glk_dsi_device_ready(encoder);
@@ -508,7 +508,7 @@ static void intel_dsi_device_ready(struct intel_encoder *encoder)
 
 static void glk_dsi_enter_low_power_mode(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -535,7 +535,7 @@ static void glk_dsi_enter_low_power_mode(struct intel_encoder *encoder)
 
 static void glk_dsi_disable_mipi_io(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -562,7 +562,7 @@ static void glk_dsi_clear_device_ready(struct intel_encoder *encoder)
 
 static void vlv_dsi_clear_device_ready(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -605,7 +605,7 @@ static void vlv_dsi_clear_device_ready(struct intel_encoder *encoder)
 static void intel_dsi_port_enable(struct intel_encoder *encoder,
 				  const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
@@ -657,7 +657,7 @@ static void intel_dsi_port_enable(struct intel_encoder *encoder,
 
 static void intel_dsi_port_disable(struct intel_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
@@ -845,7 +845,7 @@ static void intel_dsi_disable(struct intel_atomic_state *state,
 			      const struct intel_crtc_state *old_crtc_state,
 			      const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	struct drm_i915_private *i915 = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -869,7 +869,7 @@ static void intel_dsi_disable(struct intel_atomic_state *state,
 
 static void intel_dsi_clear_device_ready(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	if (IS_GEMINILAKE(dev_priv))
 		glk_dsi_clear_device_ready(encoder);
@@ -882,7 +882,7 @@ static void intel_dsi_post_disable(struct intel_atomic_state *state,
 				   const struct intel_crtc_state *old_crtc_state,
 				   const struct drm_connector_state *old_conn_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -953,7 +953,7 @@ static void intel_dsi_shutdown(struct intel_encoder *encoder)
 static bool intel_dsi_get_hw_state(struct intel_encoder *encoder,
 				   enum pipe *pipe)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	intel_wakeref_t wakeref;
 	enum port port;
@@ -1029,7 +1029,7 @@ static bool intel_dsi_get_hw_state(struct intel_encoder *encoder,
 static void bxt_dsi_get_pipe_config(struct intel_encoder *encoder,
 				    struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct drm_display_mode *adjusted_mode =
 					&pipe_config->hw.adjusted_mode;
@@ -1192,7 +1192,7 @@ static void bxt_dsi_get_pipe_config(struct intel_encoder *encoder,
 static void intel_dsi_get_config(struct intel_encoder *encoder,
 				 struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	u32 pclk;
 
@@ -1232,7 +1232,7 @@ static u16 txclkesc(u32 divider, unsigned int us)
 static void set_dsi_timings(struct drm_encoder *encoder,
 			    const struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(to_intel_encoder(encoder));
 	enum port port;
@@ -1322,7 +1322,7 @@ static void intel_dsi_prepare(struct intel_encoder *intel_encoder,
 			      const struct intel_crtc_state *pipe_config)
 {
 	struct drm_encoder *encoder = &intel_encoder->base;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(to_intel_encoder(encoder));
@@ -1528,7 +1528,7 @@ static void intel_dsi_prepare(struct intel_encoder *intel_encoder,
 
 static void intel_dsi_unprepare(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -1603,7 +1603,7 @@ static void vlv_dsi_add_properties(struct intel_connector *connector)
 
 static void vlv_dphy_param_init(struct intel_dsi *intel_dsi)
 {
-	struct drm_device *dev = intel_dsi->base.base.dev;
+	struct drm_device *dev = intel_dsi->base.base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_connector *connector = intel_dsi->attached_connector;
 	struct mipi_config *mipi_config = connector->panel.vbt.dsi.config;
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi_pll.c b/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
index ae0a0b11bae3..e1b627530df7 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
@@ -116,7 +116,7 @@ static int dsi_calc_mnp(struct drm_i915_private *dev_priv,
 static int vlv_dsi_pclk(struct intel_encoder *encoder,
 			struct intel_crtc_state *config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	int bpp = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
 	u32 dsi_clock;
@@ -175,7 +175,7 @@ static int vlv_dsi_pclk(struct intel_encoder *encoder,
 int vlv_dsi_pll_compute(struct intel_encoder *encoder,
 			struct intel_crtc_state *config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	int pclk, dsi_clk, ret;
 
@@ -213,7 +213,7 @@ int vlv_dsi_pll_compute(struct intel_encoder *encoder,
 void vlv_dsi_pll_enable(struct intel_encoder *encoder,
 			const struct intel_crtc_state *config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	drm_dbg_kms(&dev_priv->drm, "\n");
 
@@ -245,7 +245,7 @@ void vlv_dsi_pll_enable(struct intel_encoder *encoder,
 
 void vlv_dsi_pll_disable(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 tmp;
 
 	drm_dbg_kms(&dev_priv->drm, "\n");
@@ -301,7 +301,7 @@ bool bxt_dsi_pll_is_enabled(struct drm_i915_private *dev_priv)
 
 void bxt_dsi_pll_disable(struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 
 	drm_dbg_kms(&dev_priv->drm, "\n");
 
@@ -320,7 +320,7 @@ void bxt_dsi_pll_disable(struct intel_encoder *encoder)
 u32 vlv_dsi_get_pclk(struct intel_encoder *encoder,
 		     struct intel_crtc_state *config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 pll_ctl, pll_div;
 
 	drm_dbg_kms(&dev_priv->drm, "\n");
@@ -352,7 +352,7 @@ static int bxt_dsi_pclk(struct intel_encoder *encoder,
 u32 bxt_dsi_get_pclk(struct intel_encoder *encoder,
 		     struct intel_crtc_state *config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	u32 pclk;
 
 	config->dsi_pll.ctrl = intel_de_read(dev_priv, BXT_DSI_PLL_CTL);
@@ -366,7 +366,7 @@ u32 bxt_dsi_get_pclk(struct intel_encoder *encoder,
 void vlv_dsi_reset_clocks(struct intel_encoder *encoder, enum port port)
 {
 	u32 temp;
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 
 	temp = intel_de_read(dev_priv, MIPI_CTRL(port));
@@ -478,7 +478,7 @@ static void bxt_dsi_program_clocks(struct drm_device *dev, enum port port,
 int bxt_dsi_pll_compute(struct intel_encoder *encoder,
 			struct intel_crtc_state *config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	u8 dsi_ratio, dsi_ratio_min, dsi_ratio_max;
 	u32 dsi_clk;
@@ -536,7 +536,7 @@ int bxt_dsi_pll_compute(struct intel_encoder *encoder,
 void bxt_dsi_pll_enable(struct intel_encoder *encoder,
 			const struct intel_crtc_state *config)
 {
-	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.drm);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
@@ -549,9 +549,9 @@ void bxt_dsi_pll_enable(struct intel_encoder *encoder,
 	/* Program TX, RX, Dphy clocks */
 	if (IS_BROXTON(dev_priv)) {
 		for_each_dsi_port(port, intel_dsi->ports)
-			bxt_dsi_program_clocks(encoder->base.dev, port, config);
+			bxt_dsi_program_clocks(encoder->base.drm, port, config);
 	} else {
-		glk_dsi_program_esc_clock(encoder->base.dev, config);
+		glk_dsi_program_esc_clock(encoder->base.drm, config);
 	}
 
 	/* Enable DSI PLL */
@@ -571,7 +571,7 @@ void bxt_dsi_pll_enable(struct intel_encoder *encoder,
 void bxt_dsi_reset_clocks(struct intel_encoder *encoder, enum port port)
 {
 	u32 tmp;
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 
 	/* Clear old configurations */
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 868d4979e464..c8b4b988e20b 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -730,7 +730,7 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 						struct drm_crtc_state *crtc_state,
 						struct drm_connector_state *conn_state)
 {
-	struct ingenic_drm *priv = drm_device_get_priv(encoder->dev);
+	struct ingenic_drm *priv = drm_device_get_priv(encoder->drm);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct ingenic_drm_bridge *bridge = to_ingenic_drm_bridge(encoder);
 	unsigned int cfg, rgbcfg = 0;
diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c b/drivers/gpu/drm/logicvc/logicvc_interface.c
index 689049d395c0..2424eb593ffd 100644
--- a/drivers/gpu/drm/logicvc/logicvc_interface.c
+++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
@@ -30,7 +30,7 @@
 
 static void logicvc_encoder_enable(struct drm_encoder *drm_encoder)
 {
-	struct logicvc_drm *logicvc = logicvc_drm(drm_encoder->dev);
+	struct logicvc_drm *logicvc = logicvc_drm(drm_encoder->drm);
 	struct logicvc_interface *interface =
 		logicvc_interface_from_drm_encoder(drm_encoder);
 
diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a1000.c b/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
index 6fc8dd1c7d9a..f7612aa51197 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
@@ -102,7 +102,7 @@ static const struct drm_connector_funcs ls7a1000_dpi_connector_funcs = {
 
 static void ls7a1000_pipe0_encoder_reset(struct drm_encoder *encoder)
 {
-	struct drm_device *ddev = encoder->dev;
+	struct drm_device *ddev = encoder->drm;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 
 	/*
@@ -115,7 +115,7 @@ static void ls7a1000_pipe0_encoder_reset(struct drm_encoder *encoder)
 
 static void ls7a1000_pipe1_encoder_reset(struct drm_encoder *encoder)
 {
-	struct drm_device *ddev = encoder->dev;
+	struct drm_device *ddev = encoder->drm;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 
 	/*
diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
index 5ef9fe52bffc..9b230c56d6bd 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
@@ -227,7 +227,7 @@ static const struct drm_connector_funcs ls7a2000_hdmi_connector_funcs[2] = {
  */
 static void ls7a2000_hdmi0_encoder_reset(struct drm_encoder *encoder)
 {
-	struct drm_device *ddev = encoder->dev;
+	struct drm_device *ddev = encoder->drm;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	u32 val;
 
@@ -249,7 +249,7 @@ static void ls7a2000_hdmi0_encoder_reset(struct drm_encoder *encoder)
 
 static void ls7a2000_hdmi1_encoder_reset(struct drm_encoder *encoder)
 {
-	struct drm_device *ddev = encoder->dev;
+	struct drm_device *ddev = encoder->drm;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	u32 val;
 
@@ -286,7 +286,7 @@ static int ls7a2000_hdmi_set_avi_infoframe(struct drm_encoder *encoder,
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
 	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
 	unsigned int index = dispipe->index;
-	struct drm_device *ddev = encoder->dev;
+	struct drm_device *ddev = encoder->drm;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct hdmi_avi_infoframe infoframe;
 	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
@@ -337,7 +337,7 @@ static void ls7a2000_hdmi_atomic_disable(struct drm_encoder *encoder,
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
 	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
 	unsigned int index = dispipe->index;
-	struct drm_device *ddev = encoder->dev;
+	struct drm_device *ddev = encoder->drm;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	u32 val;
 
@@ -357,7 +357,7 @@ static void ls7a2000_hdmi_atomic_disable(struct drm_encoder *encoder,
 static void ls7a2000_hdmi_atomic_enable(struct drm_encoder *encoder,
 					struct drm_atomic_state *state)
 {
-	struct drm_device *ddev = encoder->dev;
+	struct drm_device *ddev = encoder->drm;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
 	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
@@ -484,7 +484,7 @@ static void ls7a2000_hdmi_atomic_mode_set(struct drm_encoder *encoder,
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
 	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
 	unsigned int index = dispipe->index;
-	struct drm_device *ddev = encoder->dev;
+	struct drm_device *ddev = encoder->drm;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct drm_display_mode *mode = &crtc_state->mode;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0a8e0a13f516..e7e443c56bb6 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1245,11 +1245,11 @@ static void mtk_hdmi_hpd_event(bool hpd, struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 
-	if (hdmi && hdmi->bridge.encoder && hdmi->bridge.encoder->dev) {
+	if (hdmi && hdmi->bridge.encoder && hdmi->bridge.encoder->drm) {
 		static enum drm_connector_status status;
 
 		status = mtk_hdmi_detect(hdmi);
-		drm_helper_hpd_irq_event(hdmi->bridge.encoder->dev);
+		drm_helper_hpd_irq_event(hdmi->bridge.encoder->drm);
 		drm_bridge_hpd_notify(&hdmi->bridge, status);
 	}
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 493905a5b63a..4421d23f4a39 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -617,7 +617,7 @@ static int dpu_encoder_virt_atomic_check(
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-	priv = drm_enc->dev->dev_private;
+	priv = drm_enc->drm->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
 	adj_mode = &crtc_state->adjusted_mode;
 	global_state = dpu_kms_get_global_state(crtc_state->state);
@@ -683,7 +683,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 
 	drm_enc = &dpu_enc->base;
 	/* this pointers are checked in virt_enable_helper */
-	priv = drm_enc->dev->dev_private;
+	priv = drm_enc->drm->dev_private;
 
 	dpu_kms = to_dpu_kms(priv->kms);
 	hw_mdptop = dpu_kms->hw_mdp;
@@ -747,7 +747,7 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc;
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
-	priv = drm_enc->dev->dev_private;
+	priv = drm_enc->drm->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
 
 	trace_dpu_enc_rc_helper(DRMID(drm_enc), enable);
@@ -781,12 +781,12 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 	struct msm_drm_private *priv;
 	bool is_vid_mode = false;
 
-	if (!drm_enc || !drm_enc->dev || !drm_enc->crtc) {
+	if (!drm_enc || !drm_enc->drm || !drm_enc->crtc) {
 		DPU_ERROR("invalid parameters\n");
 		return -EINVAL;
 	}
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
-	priv = drm_enc->dev->dev_private;
+	priv = drm_enc->drm->dev_private;
 	is_vid_mode = !dpu_enc->disp_info.is_cmd_mode;
 
 	/*
@@ -1045,7 +1045,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-	priv = drm_enc->dev->dev_private;
+	priv = drm_enc->drm->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
 
 	global_state = dpu_kms_get_existing_global_state(dpu_kms);
@@ -1127,7 +1127,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int i;
 
-	if (!drm_enc || !drm_enc->dev) {
+	if (!drm_enc || !drm_enc->drm) {
 		DPU_ERROR("invalid parameters\n");
 		return;
 	}
@@ -1322,7 +1322,7 @@ void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
 
 	/* trigger dump only on the first underrun */
 	if (atomic_read(&phy_enc->underrun_cnt) == 1)
-		msm_disp_snapshot_state(drm_enc->dev);
+		msm_disp_snapshot_state(drm_enc->drm);
 
 	trace_dpu_enc_underrun_cb(DRMID(drm_enc),
 				  atomic_read(&phy_enc->underrun_cnt));
@@ -1568,7 +1568,7 @@ static void dpu_encoder_helper_hw_reset(struct dpu_encoder_phys *phys_enc)
 	rc = ctl->ops.reset(ctl);
 	if (rc) {
 		DPU_ERROR_ENC(dpu_enc, "ctl %d reset failure\n",  ctl->idx);
-		msm_disp_snapshot_state(drm_enc->dev);
+		msm_disp_snapshot_state(drm_enc->drm);
 	}
 
 	phys_enc->enable_state = DPU_ENC_ENABLED;
@@ -1762,12 +1762,12 @@ static void dpu_encoder_vsync_event_handler(struct timer_list *t)
 	struct msm_drm_private *priv;
 	struct msm_drm_thread *event_thread;
 
-	if (!drm_enc->dev || !drm_enc->crtc) {
+	if (!drm_enc->drm || !drm_enc->crtc) {
 		DPU_ERROR("invalid parameters\n");
 		return;
 	}
 
-	priv = drm_enc->dev->dev_private;
+	priv = drm_enc->drm->dev_private;
 
 	if (drm_enc->crtc->index >= ARRAY_SIZE(priv->event_thread)) {
 		DPU_ERROR("invalid crtc index\n");
@@ -2162,7 +2162,7 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 
 	char name[12];
 
-	if (!drm_enc->dev) {
+	if (!drm_enc->drm) {
 		DPU_ERROR("invalid encoder or kms\n");
 		return -EINVAL;
 	}
@@ -2171,7 +2171,7 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 
 	/* create overall sub-directory for the encoder */
 	dpu_enc->debugfs_root = debugfs_create_dir(name,
-			drm_enc->dev->primary->debugfs_root);
+			drm_enc->drm->primary->debugfs_root);
 
 	/* don't error check these */
 	debugfs_create_file("status", 0600,
@@ -2353,7 +2353,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 	struct drm_encoder *drm_enc = &dpu_enc->base;
 	u32 event;
 
-	if (!drm_enc->dev) {
+	if (!drm_enc->drm) {
 		DPU_ERROR("invalid parameters\n");
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index b856c6286c85..8b06543bc005 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -195,7 +195,7 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 			  phys_enc->hw_ctl->idx - CTL_0,
 			  cmd_enc->pp_timeout_report_cnt,
 			  atomic_read(&phys_enc->pending_kickoff_cnt));
-		msm_disp_snapshot_state(drm_enc->dev);
+		msm_disp_snapshot_state(drm_enc->drm);
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
 				phys_enc->irq[INTR_IDX_RDPTR]);
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 662d74ded1b9..c0f132772ee5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -512,7 +512,7 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
 	if (rc) {
 		DPU_ERROR_VIDENC(phys_enc, "ctl %d reset failure: %d\n",
 				ctl->idx, rc);
-		msm_disp_snapshot_state(drm_enc->dev);
+		msm_disp_snapshot_state(drm_enc->drm);
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
 				phys_enc->irq[INTR_IDX_VSYNC]);
 	}
@@ -524,7 +524,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 	int ret;
 	struct intf_status intf_status = {0};
 
-	if (!phys_enc->parent || !phys_enc->parent->dev) {
+	if (!phys_enc->parent || !phys_enc->parent->drm) {
 		DPU_ERROR("invalid encoder/device\n");
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index a466ff70a4d6..c663e9e56080 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -418,7 +418,7 @@ static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
 	wb_enc->wb_done_timeout_cnt++;
 
 	if (wb_enc->wb_done_timeout_cnt == 1)
-		msm_disp_snapshot_state(phys_enc->parent->dev);
+		msm_disp_snapshot_state(phys_enc->parent->drm);
 
 	atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
index 39b8fe53c29d..bf2cb7491b9a 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
@@ -22,7 +22,7 @@ struct mdp4_dsi_encoder {
 
 static struct mdp4_kms *get_kms(struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = encoder->dev->dev_private;
+	struct msm_drm_private *priv = encoder->drm->dev_private;
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
index 88645dbc3785..36dffbdd90ae 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
@@ -21,7 +21,7 @@ struct mdp4_dtv_encoder {
 
 static struct mdp4_kms *get_kms(struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = encoder->dev->dev_private;
+	struct msm_drm_private *priv = encoder->drm->dev_private;
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
@@ -122,7 +122,7 @@ static void mdp4_dtv_encoder_disable(struct drm_encoder *encoder)
 
 static void mdp4_dtv_encoder_enable(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct mdp4_dtv_encoder *mdp4_dtv_encoder = to_mdp4_dtv_encoder(encoder);
 	struct mdp4_kms *mdp4_kms = get_kms(encoder);
 	unsigned long pc = mdp4_dtv_encoder->pixclock;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 10eb3e5b218e..7383f9997a0f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -26,7 +26,7 @@ struct mdp4_lcdc_encoder {
 
 static struct mdp4_kms *get_kms(struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = encoder->dev->dev_private;
+	struct msm_drm_private *priv = encoder->drm->dev_private;
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
@@ -45,7 +45,7 @@ static const struct drm_encoder_funcs mdp4_lcdc_encoder_funcs = {
 /* this should probably be a helper: */
 static struct drm_connector *get_connector(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_connector *connector;
 
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head)
@@ -57,7 +57,7 @@ static struct drm_connector *get_connector(struct drm_encoder *encoder)
 
 static void setup_phy(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_connector *connector = get_connector(encoder);
 	struct mdp4_kms *mdp4_kms = get_kms(encoder);
 	uint32_t lvds_intf = 0, lvds_phy_cfg0 = 0;
@@ -271,7 +271,7 @@ static void mdp4_lcdc_encoder_mode_set(struct drm_encoder *encoder,
 
 static void mdp4_lcdc_encoder_disable(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
 			to_mdp4_lcdc_encoder(encoder);
 	struct mdp4_kms *mdp4_kms = get_kms(encoder);
@@ -312,7 +312,7 @@ static void mdp4_lcdc_encoder_disable(struct drm_encoder *encoder)
 
 static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
 			to_mdp4_lcdc_encoder(encoder);
 	unsigned long pc = mdp4_lcdc_encoder->pixclock;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
index a640af22eafc..cdb3ea59a83d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
@@ -12,7 +12,7 @@
 
 static struct mdp5_kms *get_kms(struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = encoder->dev->dev_private;
+	struct msm_drm_private *priv = encoder->drm->dev_private;
 	return to_mdp5_kms(to_mdp_kms(priv->kms));
 }
 
@@ -21,7 +21,7 @@ static int pingpong_tearcheck_setup(struct drm_encoder *encoder,
 				    struct drm_display_mode *mode)
 {
 	struct mdp5_kms *mdp5_kms = get_kms(encoder);
-	struct device *dev = encoder->dev->dev;
+	struct device *dev = encoder->drm->dev;
 	u32 total_lines, vclks_line, cfg;
 	long vsync_clk_speed;
 	struct mdp5_hw_mixer *mixer = mdp5_crtc_get_mixer(encoder->crtc);
@@ -84,14 +84,15 @@ static int pingpong_tearcheck_enable(struct drm_encoder *encoder)
 	ret = clk_set_rate(mdp5_kms->vsync_clk,
 		clk_round_rate(mdp5_kms->vsync_clk, VSYNC_CLK_RATE));
 	if (ret) {
-		DRM_DEV_ERROR(encoder->dev->dev,
-			"vsync_clk clk_set_rate failed, %d\n", ret);
+		DRM_DEV_ERROR(encoder->drm->dev,
+			      "vsync_clk clk_set_rate failed, %d\n", ret);
 		return ret;
 	}
 	ret = clk_prepare_enable(mdp5_kms->vsync_clk);
 	if (ret) {
-		DRM_DEV_ERROR(encoder->dev->dev,
-			"vsync_clk clk_prepare_enable failed, %d\n", ret);
+		DRM_DEV_ERROR(encoder->drm->dev,
+			      "vsync_clk clk_prepare_enable failed, %d\n",
+			      ret);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
index 79d67c495780..ede57f77d4bf 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
@@ -12,7 +12,7 @@
 
 static struct mdp5_kms *get_kms(struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = encoder->dev->dev_private;
+	struct msm_drm_private *priv = encoder->drm->dev_private;
 	return to_mdp5_kms(to_mdp_kms(priv->kms));
 }
 
@@ -33,7 +33,7 @@ static void mdp5_vid_encoder_mode_set(struct drm_encoder *encoder,
 {
 	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
 	struct mdp5_kms *mdp5_kms = get_kms(encoder);
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_connector *connector;
 	int intf = mdp5_encoder->intf->num;
 	uint32_t dtv_hsync_skew, vsync_period, vsync_len, ctrl_pol;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c b/drivers/gpu/drm/nouveau/dispnv04/dac.c
index 417de5d0b540..fe8ff17f1720 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
@@ -132,7 +132,7 @@ static int sample_load_twice(struct drm_device *dev, bool sense[2])
 static enum drm_connector_status nv04_dac_detect(struct drm_encoder *encoder,
 						 struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	uint8_t saved_seq1, saved_pi, saved_rpc1, saved_cr_mode;
@@ -234,7 +234,7 @@ static enum drm_connector_status nv04_dac_detect(struct drm_encoder *encoder,
 
 uint32_t nv17_dac_sample_load(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
 	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
@@ -335,7 +335,7 @@ uint32_t nv17_dac_sample_load(struct drm_encoder *encoder)
 static enum drm_connector_status
 nv17_dac_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 {
-	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
+	struct nouveau_drm *drm = nouveau_drm(encoder->drm);
 	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
 
 	if (nv04_dac_in_use(encoder))
@@ -364,7 +364,7 @@ static bool nv04_dac_mode_fixup(struct drm_encoder *encoder,
 static void nv04_dac_prepare(struct drm_encoder *encoder)
 {
 	const struct drm_encoder_helper_funcs *helper = encoder->helper_private;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	int head = nouveau_crtc(encoder->crtc)->index;
 
 	helper->dpms(encoder, DRM_MODE_DPMS_OFF);
@@ -376,7 +376,7 @@ static void nv04_dac_mode_set(struct drm_encoder *encoder,
 			      struct drm_display_mode *mode,
 			      struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	int head = nouveau_crtc(encoder->crtc)->index;
 
@@ -412,7 +412,7 @@ static void nv04_dac_mode_set(struct drm_encoder *encoder,
 static void nv04_dac_commit(struct drm_encoder *encoder)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
+	struct nouveau_drm *drm = nouveau_drm(encoder->drm);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
 	const struct drm_encoder_helper_funcs *helper = encoder->helper_private;
 
@@ -425,7 +425,7 @@ static void nv04_dac_commit(struct drm_encoder *encoder)
 
 void nv04_dac_update_dacclk(struct drm_encoder *encoder, bool enable)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
 
 	if (nv_gf4_disp_arch(dev)) {
@@ -450,17 +450,17 @@ void nv04_dac_update_dacclk(struct drm_encoder *encoder, bool enable)
  * someone else. */
 bool nv04_dac_in_use(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
 
-	return nv_gf4_disp_arch(encoder->dev) &&
+	return nv_gf4_disp_arch(encoder->drm) &&
 		(nv04_display(dev)->dac_users[ffs(dcb->or) - 1] & ~(1 << dcb->index));
 }
 
 static void nv04_dac_dpms(struct drm_encoder *encoder, int mode)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
+	struct nouveau_drm *drm = nouveau_drm(encoder->drm);
 
 	if (nv_encoder->last_dpms == mode)
 		return;
@@ -475,7 +475,7 @@ static void nv04_dac_dpms(struct drm_encoder *encoder, int mode)
 static void nv04_dac_save(struct drm_encoder *encoder)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 
 	if (nv_gf4_disp_arch(dev))
 		nv_encoder->restore.output = NVReadRAMDAC(dev, 0, NV_PRAMDAC_DACCLK +
@@ -485,7 +485,7 @@ static void nv04_dac_save(struct drm_encoder *encoder)
 static void nv04_dac_restore(struct drm_encoder *encoder)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 
 	if (nv_gf4_disp_arch(dev))
 		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK + nv04_dac_output_offset(encoder),
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index 4469e00f43ad..f97a5f1c5c6e 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -112,7 +112,7 @@ void nv04_dfp_disable(struct drm_device *dev, int head)
 
 void nv04_dfp_update_fp_control(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_crtc *crtc;
 	struct nouveau_crtc *nv_crtc;
 	uint32_t *fpc;
@@ -151,7 +151,7 @@ void nv04_dfp_update_fp_control(struct drm_encoder *encoder, int mode)
 
 static struct drm_encoder *get_tmds_slave(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
 	struct drm_encoder *slave;
 
@@ -246,7 +246,7 @@ static void nv04_dfp_prepare(struct drm_encoder *encoder)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	const struct drm_encoder_helper_funcs *helper = encoder->helper_private;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	int head = nouveau_crtc(encoder->crtc)->index;
 	struct nv04_crtc_reg *crtcstate = nv04_display(dev)->mode_reg.crtc_reg;
 	uint8_t *cr_lcd = &crtcstate[head].CRTC[NV_CIO_CRE_LCD__INDEX];
@@ -281,7 +281,7 @@ static void nv04_dfp_mode_set(struct drm_encoder *encoder,
 			      struct drm_display_mode *mode,
 			      struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
@@ -445,7 +445,7 @@ static void nv04_dfp_mode_set(struct drm_encoder *encoder,
 
 static void nv04_dfp_commit(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	const struct drm_encoder_helper_funcs *helper = encoder->helper_private;
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
@@ -486,7 +486,7 @@ static void nv04_dfp_commit(struct drm_encoder *encoder)
 static void nv04_dfp_update_backlight(struct drm_encoder *encoder, int mode)
 {
 #ifdef __powerpc__
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
@@ -513,7 +513,7 @@ static inline bool is_powersaving_dpms(int mode)
 
 static void nv04_lvds_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_crtc *crtc = encoder->crtc;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
@@ -561,7 +561,7 @@ static void nv04_lvds_dpms(struct drm_encoder *encoder, int mode)
 
 static void nv04_tmds_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
+	struct nouveau_drm *drm = nouveau_drm(encoder->drm);
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 
 	if (nv_encoder->last_dpms == mode)
@@ -578,7 +578,7 @@ static void nv04_tmds_dpms(struct drm_encoder *encoder, int mode)
 static void nv04_dfp_save(struct drm_encoder *encoder)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 
 	if (nv_two_heads(dev))
 		nv_encoder->restore.head =
@@ -588,7 +588,7 @@ static void nv04_dfp_save(struct drm_encoder *encoder)
 static void nv04_dfp_restore(struct drm_encoder *encoder)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	int head = nv_encoder->restore.head;
 
 	if (nv_encoder->dcb->type == DCB_OUTPUT_LVDS) {
@@ -623,7 +623,7 @@ static void nv04_dfp_destroy(struct drm_encoder *encoder)
 
 static void nv04_tmds_slave_init(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index e9ac3fb27ff7..d210e9d197f9 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -38,7 +38,7 @@
 struct nouveau_connector *
 nv04_encoder_get_connector(struct nouveau_encoder *encoder)
 {
-	struct drm_device *dev = to_drm_encoder(encoder)->dev;
+	struct drm_device *dev = to_drm_encoder(encoder)->drm;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 	struct nouveau_connector *nv_connector = NULL;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c
index a3fedd226854..2658034467e8 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c
@@ -469,7 +469,7 @@ const struct drm_display_mode nv17_tv_modes[] = {
 
 void nv17_tv_update_properties(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
 	struct nv17_tv_state *regs = &tv_enc->state;
 	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
@@ -524,7 +524,7 @@ void nv17_tv_update_properties(struct drm_encoder *encoder)
 
 void nv17_tv_update_rescaler(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
 	struct nv17_tv_state *regs = &tv_enc->state;
 
@@ -540,7 +540,7 @@ void nv17_tv_update_rescaler(struct drm_encoder *encoder)
 
 void nv17_ctv_update_rescaler(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
 	int head = nouveau_crtc(encoder->crtc)->index;
 	struct nv04_crtc_reg *regs = &nv04_display(dev)->mode_reg.crtc_reg[head];
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
index ed989f19aba6..d7af5aa1ee24 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
@@ -73,7 +73,7 @@ int nv04_tv_identify(struct drm_device *dev, int i2c_index)
 
 static void nv04_tv_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv04_mode_state *state = &nv04_display(dev)->mode_reg;
@@ -123,7 +123,7 @@ static void nv04_tv_bind(struct drm_device *dev, int head, bool bind)
 
 static void nv04_tv_prepare(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	int head = nouveau_crtc(encoder->crtc)->index;
 	const struct drm_encoder_helper_funcs *helper = encoder->helper_private;
 
@@ -141,7 +141,7 @@ static void nv04_tv_mode_set(struct drm_encoder *encoder,
 			     struct drm_display_mode *mode,
 			     struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
 
@@ -164,7 +164,7 @@ static void nv04_tv_mode_set(struct drm_encoder *encoder,
 static void nv04_tv_commit(struct drm_encoder *encoder)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
 	const struct drm_encoder_helper_funcs *helper = encoder->helper_private;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 315b30a3befc..c4ca063c57e0 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -45,7 +45,7 @@ module_param_named(tv_norm, nouveau_tv_norm, charp, 0400);
 
 static uint32_t nv42_tv_sample_load(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
 	uint32_t testval, regoffset = nv04_dac_output_offset(encoder);
@@ -144,7 +144,7 @@ get_tv_detect_quirks(struct drm_device *dev, uint32_t *pin_mask)
 static enum drm_connector_status
 nv17_tv_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct drm_mode_config *conf = &dev->mode_config;
 	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
@@ -208,7 +208,7 @@ static int nv17_tv_get_ld_modes(struct drm_encoder *encoder,
 	for (tv_mode = nv17_tv_modes; tv_mode->hdisplay; tv_mode++) {
 		struct drm_display_mode *mode;
 
-		mode = drm_mode_duplicate(encoder->dev, tv_mode);
+		mode = drm_mode_duplicate(encoder->drm, tv_mode);
 
 		mode->clock = tv_norm->tv_enc_mode.vrefresh *
 			mode->htotal / 1000 *
@@ -257,11 +257,11 @@ static int nv17_tv_get_hd_modes(struct drm_encoder *encoder,
 
 		if (modes[i].hdisplay == output_mode->hdisplay &&
 		    modes[i].vdisplay == output_mode->vdisplay) {
-			mode = drm_mode_duplicate(encoder->dev, output_mode);
+			mode = drm_mode_duplicate(encoder->drm, output_mode);
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		} else {
-			mode = drm_cvt_mode(encoder->dev, modes[i].hdisplay,
+			mode = drm_cvt_mode(encoder->drm, modes[i].hdisplay,
 					    modes[i].vdisplay, 60, false,
 					    (output_mode->flags &
 					     DRM_MODE_FLAG_INTERLACE), false);
@@ -361,7 +361,7 @@ static bool nv17_tv_mode_fixup(struct drm_encoder *encoder,
 
 static void  nv17_tv_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
 	struct nv17_tv_state *regs = &to_tv_enc(encoder)->state;
@@ -396,7 +396,7 @@ static void  nv17_tv_dpms(struct drm_encoder *encoder, int mode)
 
 static void nv17_tv_prepare(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	const struct drm_encoder_helper_funcs *helper = encoder->helper_private;
 	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
@@ -459,7 +459,7 @@ static void nv17_tv_mode_set(struct drm_encoder *encoder,
 			     struct drm_display_mode *drm_mode,
 			     struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	int head = nouveau_crtc(encoder->crtc)->index;
 	struct nv04_crtc_reg *regs = &nv04_display(dev)->mode_reg.crtc_reg[head];
@@ -572,7 +572,7 @@ static void nv17_tv_mode_set(struct drm_encoder *encoder,
 
 static void nv17_tv_commit(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
@@ -606,7 +606,7 @@ static void nv17_tv_commit(struct drm_encoder *encoder)
 
 static void nv17_tv_save(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
 
 	nouveau_encoder(encoder)->restore.output =
@@ -621,7 +621,7 @@ static void nv17_tv_save(struct drm_encoder *encoder)
 
 static void nv17_tv_restore(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 
 	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_DACCLK +
 				nv04_dac_output_offset(encoder),
@@ -635,7 +635,7 @@ static void nv17_tv_restore(struct drm_encoder *encoder)
 static int nv17_tv_create_resources(struct drm_encoder *encoder,
 				    struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct drm_mode_config *conf = &dev->mode_config;
 	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
@@ -686,7 +686,7 @@ static int nv17_tv_set_property(struct drm_encoder *encoder,
 				struct drm_property *property,
 				uint64_t val)
 {
-	struct drm_mode_config *conf = &encoder->dev->mode_config;
+	struct drm_mode_config *conf = &encoder->drm->mode_config;
 	struct drm_crtc *crtc = encoder->crtc;
 	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
 	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index a6f6319c92b1..06a803f8c075 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -327,7 +327,7 @@ nv50_outp_atomic_check_view(struct drm_encoder *encoder,
 	struct drm_display_mode *mode = &crtc_state->mode;
 	struct drm_connector *connector = conn_state->connector;
 	struct nouveau_conn_atom *asyc = nouveau_conn_atom(conn_state);
-	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
+	struct nouveau_drm *drm = nouveau_drm(encoder->drm);
 
 	NV_ATOMIC(drm, "%s atomic_check\n", encoder->name);
 	asyc->scaler.full = false;
@@ -472,7 +472,7 @@ static void
 nv50_dac_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nv50_core *core = nv50_disp(encoder->dev)->core;
+	struct nv50_core *core = nv50_disp(encoder->drm)->core;
 	const u32 ctrl = NVDEF(NV507D, DAC_SET_CONTROL, OWNER, NONE);
 
 	core->func->dac->ctrl(core, nv_encoder->outp.or.id, ctrl, NULL);
@@ -487,7 +487,7 @@ nv50_dac_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	struct nouveau_crtc *nv_crtc = nv50_outp_get_new_crtc(state, nv_encoder);
 	struct nv50_head_atom *asyh =
 		nv50_head_atom(drm_atomic_get_new_crtc_state(state, &nv_crtc->base));
-	struct nv50_core *core = nv50_disp(encoder->dev)->core;
+	struct nv50_core *core = nv50_disp(encoder->drm)->core;
 	u32 ctrl = 0;
 
 	switch (nv_crtc->index) {
@@ -517,7 +517,7 @@ nv50_dac_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 	u32 loadval;
 	int ret;
 
-	loadval = nouveau_drm(encoder->dev)->vbios.dactestval;
+	loadval = nouveau_drm(encoder->drm)->vbios.dactestval;
 	if (loadval == 0)
 		loadval = 340;
 
@@ -707,7 +707,7 @@ nv50_audio_component_fini(struct nouveau_drm *drm)
 static bool
 nv50_audio_supported(struct drm_encoder *encoder)
 {
-	struct nv50_disp *disp = nv50_disp(encoder->dev);
+	struct nv50_disp *disp = nv50_disp(encoder->drm);
 
 	if (disp->disp->object.oclass <= GT200_DISP ||
 	    disp->disp->object.oclass == GT206_DISP)
@@ -719,7 +719,7 @@ nv50_audio_supported(struct drm_encoder *encoder)
 static void
 nv50_audio_disable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc)
 {
-	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
+	struct nouveau_drm *drm = nouveau_drm(encoder->drm);
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nvif_outp *outp = &nv_encoder->outp;
 
@@ -742,7 +742,7 @@ nv50_audio_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 		  struct nouveau_connector *nv_connector, struct drm_atomic_state *state,
 		  struct drm_display_mode *mode)
 {
-	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
+	struct nouveau_drm *drm = nouveau_drm(encoder->drm);
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nvif_outp *outp = &nv_encoder->outp;
 
@@ -769,7 +769,7 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 		 struct nouveau_connector *nv_connector, struct drm_atomic_state *state,
 		 struct drm_display_mode *mode, bool hda)
 {
-	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
+	struct nouveau_drm *drm = nouveau_drm(encoder->drm);
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct drm_hdmi_info *hdmi = &nv_connector->base.display_info.hdmi;
 	union hdmi_infoframe infoframe = { 0 };
@@ -886,7 +886,7 @@ nv50_msto_cleanup(struct drm_atomic_state *state,
 		  struct drm_dp_mst_topology_mgr *mgr,
 		  struct nv50_msto *msto)
 {
-	struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
+	struct nouveau_drm *drm = nouveau_drm(msto->encoder.drm);
 	struct drm_dp_mst_atomic_payload *payload =
 		drm_atomic_get_mst_payload_state(mst_state, msto->mstc->port);
 
@@ -907,7 +907,7 @@ nv50_msto_prepare(struct drm_atomic_state *state,
 		  struct drm_dp_mst_topology_mgr *mgr,
 		  struct nv50_msto *msto)
 {
-	struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
+	struct nouveau_drm *drm = nouveau_drm(msto->encoder.drm);
 	struct nv50_mstc *mstc = msto->mstc;
 	struct nv50_mstm *mstm = mstc->mstm;
 	struct drm_dp_mst_atomic_payload *payload;
@@ -1010,7 +1010,7 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	struct drm_connector_list_iter conn_iter;
 	u8 proto;
 
-	drm_connector_list_iter_begin(encoder->dev, &conn_iter);
+	drm_connector_list_iter_begin(encoder->drm, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		if (connector->state->best_encoder == &msto->encoder) {
 			mstc = nv50_mstc(connector);
@@ -1228,7 +1228,7 @@ static int
 nv50_mstc_new(struct nv50_mstm *mstm, struct drm_dp_mst_port *port,
 	      const char *path, struct nv50_mstc **pmstc)
 {
-	struct drm_device *dev = mstm->outp->base.base.dev;
+	struct drm_device *dev = mstm->outp->base.base.drm;
 	struct drm_crtc *crtc;
 	struct nv50_mstc *mstc;
 	int ret;
@@ -1271,13 +1271,13 @@ nv50_mstm_cleanup(struct drm_atomic_state *state,
 		  struct drm_dp_mst_topology_state *mst_state,
 		  struct nv50_mstm *mstm)
 {
-	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.drm);
 	struct drm_encoder *encoder;
 
 	NV_ATOMIC(drm, "%s: mstm cleanup\n", mstm->outp->base.base.name);
 	drm_dp_check_act_status(&mstm->mgr);
 
-	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
+	drm_for_each_encoder(encoder, mstm->outp->base.base.drm) {
 		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
 			struct nv50_msto *msto = nv50_msto(encoder);
 			struct nv50_mstc *mstc = msto->mstc;
@@ -1294,13 +1294,13 @@ nv50_mstm_prepare(struct drm_atomic_state *state,
 		  struct drm_dp_mst_topology_state *mst_state,
 		  struct nv50_mstm *mstm)
 {
-	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.drm);
 	struct drm_encoder *encoder;
 
 	NV_ATOMIC(drm, "%s: mstm prepare\n", mstm->outp->base.base.name);
 
 	/* Disable payloads first */
-	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
+	drm_for_each_encoder(encoder, mstm->outp->base.base.drm) {
 		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
 			struct nv50_msto *msto = nv50_msto(encoder);
 			struct nv50_mstc *mstc = msto->mstc;
@@ -1312,7 +1312,7 @@ nv50_mstm_prepare(struct drm_atomic_state *state,
 	/* Add payloads for new heads, while also updating the start slots of any unmodified (but
 	 * active) heads that may have had their VC slots shifted left after the previous step
 	 */
-	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
+	drm_for_each_encoder(encoder, mstm->outp->base.base.drm) {
 		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
 			struct nv50_msto *msto = nv50_msto(encoder);
 			struct nv50_mstc *mstc = msto->mstc;
@@ -1482,7 +1482,7 @@ nv50_mstm_new(struct nouveau_encoder *outp, struct drm_dp_aux *aux, int aux_max,
 	      int conn_base_id, struct nv50_mstm **pmstm)
 {
 	const int max_payloads = hweight8(outp->dcb->heads);
-	struct drm_device *dev = outp->base.base.dev;
+	struct drm_device *dev = outp->base.base.drm;
 	struct nv50_mstm *mstm;
 	int ret;
 
@@ -1506,7 +1506,7 @@ static void
 nv50_sor_update(struct nouveau_encoder *nv_encoder, u8 head,
 		struct nv50_head_atom *asyh, u8 proto, u8 depth)
 {
-	struct nv50_disp *disp = nv50_disp(nv_encoder->base.base.dev);
+	struct nv50_disp *disp = nv50_disp(nv_encoder->base.base.drm);
 	struct nv50_core *core = disp->core;
 
 	if (!asyh) {
@@ -1534,7 +1534,7 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
 	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.drm);
 	struct nouveau_backlight *backlight = nv_connector->backlight;
 #endif
 	struct drm_dp_aux *aux = &nv_connector->aux;
@@ -1574,9 +1574,9 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 	struct nv50_head_atom *asyh =
 		nv50_head_atom(drm_atomic_get_new_crtc_state(state, &nv_crtc->base));
 	struct drm_display_mode *mode = &asyh->state.adjusted_mode;
-	struct nv50_disp *disp = nv50_disp(encoder->dev);
+	struct nv50_disp *disp = nv50_disp(encoder->drm);
 	struct nvif_outp *outp = &nv_encoder->outp;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_connector *nv_connector;
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
@@ -1807,7 +1807,7 @@ static void
 nv50_pior_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nv50_core *core = nv50_disp(encoder->dev)->core;
+	struct nv50_core *core = nv50_disp(encoder->drm)->core;
 	const u32 ctrl = NVDEF(NV507D, PIOR_SET_CONTROL, OWNER, NONE);
 
 	core->func->pior->ctrl(core, nv_encoder->outp.or.id, ctrl, NULL);
@@ -1822,7 +1822,7 @@ nv50_pior_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	struct nouveau_crtc *nv_crtc = nv50_outp_get_new_crtc(state, nv_encoder);
 	struct nv50_head_atom *asyh =
 		nv50_head_atom(drm_atomic_get_new_crtc_state(state, &nv_crtc->base));
-	struct nv50_core *core = nv50_disp(encoder->dev)->core;
+	struct nv50_core *core = nv50_disp(encoder->drm)->core;
 	u32 ctrl = 0;
 
 	switch (nv_crtc->index) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 13b40f0383f0..71e013bbc55a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -64,7 +64,7 @@ static int
 nv40_get_intensity(struct backlight_device *bd)
 {
 	struct nouveau_encoder *nv_encoder = bl_get_data(bd);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.drm);
 	struct nvif_object *device = &drm->client.device.object;
 	int val = (nvif_rd32(device, NV40_PMC_BACKLIGHT) &
 		   NV40_PMC_BACKLIGHT_MASK) >> 16;
@@ -76,7 +76,7 @@ static int
 nv40_set_intensity(struct backlight_device *bd)
 {
 	struct nouveau_encoder *nv_encoder = bl_get_data(bd);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.drm);
 	struct nvif_object *device = &drm->client.device.object;
 	int val = bd->props.brightness;
 	int reg = nvif_rd32(device, NV40_PMC_BACKLIGHT);
@@ -98,7 +98,7 @@ nv40_backlight_init(struct nouveau_encoder *encoder,
 		    struct backlight_properties *props,
 		    const struct backlight_ops **ops)
 {
-	struct nouveau_drm *drm = nouveau_drm(encoder->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(encoder->base.base.drm);
 	struct nvif_object *device = &drm->client.device.object;
 
 	if (!(nvif_rd32(device, NV40_PMC_BACKLIGHT) & NV40_PMC_BACKLIGHT_MASK))
@@ -113,7 +113,7 @@ static int
 nv50_get_intensity(struct backlight_device *bd)
 {
 	struct nouveau_encoder *nv_encoder = bl_get_data(bd);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.drm);
 	struct nvif_object *device = &drm->client.device.object;
 	int or = ffs(nv_encoder->dcb->or) - 1;
 	u32 div = 1025;
@@ -128,7 +128,7 @@ static int
 nv50_set_intensity(struct backlight_device *bd)
 {
 	struct nouveau_encoder *nv_encoder = bl_get_data(bd);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.drm);
 	struct nvif_object *device = &drm->client.device.object;
 	int or = ffs(nv_encoder->dcb->or) - 1;
 	u32 div = 1025;
@@ -241,7 +241,7 @@ static int
 nva3_get_intensity(struct backlight_device *bd)
 {
 	struct nouveau_encoder *nv_encoder = bl_get_data(bd);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.drm);
 	struct nvif_object *device = &drm->client.device.object;
 	int or = ffs(nv_encoder->dcb->or) - 1;
 	u32 div, val;
@@ -259,7 +259,7 @@ static int
 nva3_set_intensity(struct backlight_device *bd)
 {
 	struct nouveau_encoder *nv_encoder = bl_get_data(bd);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.drm);
 	struct nvif_object *device = &drm->client.device.object;
 	int or = ffs(nv_encoder->dcb->or) - 1;
 	u32 div, val;
@@ -297,7 +297,7 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 		    struct backlight_properties *props,
 		    const struct backlight_ops **ops)
 {
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.drm);
 	struct nvif_object *device = &drm->client.device.object;
 
 	/*
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 6a4980b2d4d4..0c41f21e822c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -100,7 +100,7 @@ int
 nouveau_dp_detect(struct nouveau_connector *nv_connector,
 		  struct nouveau_encoder *nv_encoder)
 {
-	struct drm_device *dev = nv_encoder->base.base.dev;
+	struct drm_device *dev = nv_encoder->base.base.drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct drm_connector *connector = &nv_connector->base;
 	struct nv50_mstm *mstm = nv_encoder->dp.mstm;
@@ -229,7 +229,7 @@ nouveau_dp_irq(struct work_struct *work)
 		container_of(work, typeof(*nv_connector), irq_work);
 	struct drm_connector *connector = &nv_connector->base;
 	struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
-	struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(outp->base.base.drm);
 	struct nv50_mstm *mstm;
 	u64 hpd = 0;
 	int ret;
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 4dd05bc732da..7c382f7dfe03 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -75,7 +75,7 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 {
 	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
 	struct omap_dss_device *output = omap_encoder->output;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_connector *connector;
 	struct drm_bridge *bridge;
 	struct videomode vm = { 0 };
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index 3a3fc5eee5d9..9c0ef4ee9f87 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -410,7 +410,7 @@ bool radeon_dp_getdpcd(struct radeon_connector *radeon_connector)
 int radeon_dp_get_panel_mode(struct drm_encoder *encoder,
 			     struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 	int panel_mode = DP_PANEL_MODE_EXTERNAL_DP_MODE;
@@ -784,7 +784,7 @@ static int radeon_dp_link_train_ce(struct radeon_dp_link_train_info *dp_info)
 void radeon_dp_link_train(struct drm_encoder *encoder,
 			  struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig;
diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index 717cd6d71aff..31f20a457e9d 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -84,7 +84,7 @@ radeon_atom_set_backlight_level_to_reg(struct radeon_device *rdev,
 u8
 atombios_get_backlight_level(struct radeon_encoder *radeon_encoder)
 {
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (!(rdev->mode_info.firmware_flags & ATOM_BIOS_INFO_BL_CONTROLLED_BY_GPU))
@@ -97,7 +97,7 @@ void
 atombios_set_backlight_level(struct radeon_encoder *radeon_encoder, u8 level)
 {
 	struct drm_encoder *encoder = &radeon_encoder->base;
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder_atom_dig *dig;
 	DISPLAY_DEVICE_OUTPUT_CONTROL_PS_ALLOCATION args;
@@ -173,7 +173,7 @@ static int radeon_atom_backlight_get_brightness(struct backlight_device *bd)
 {
 	struct radeon_backlight_privdata *pdata = bl_get_data(bd);
 	struct radeon_encoder *radeon_encoder = pdata->encoder;
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	return radeon_atom_get_backlight_level_from_reg(rdev);
@@ -187,7 +187,7 @@ static const struct backlight_ops radeon_atom_backlight_ops = {
 void radeon_atom_backlight_init(struct radeon_encoder *radeon_encoder,
 				struct drm_connector *drm_connector)
 {
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct backlight_device *bd;
 	struct backlight_properties props;
@@ -263,7 +263,7 @@ void radeon_atom_backlight_init(struct radeon_encoder *radeon_encoder,
 
 static void radeon_atom_backlight_exit(struct radeon_encoder *radeon_encoder)
 {
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct backlight_device *bd = NULL;
 	struct radeon_encoder_atom_dig *dig;
@@ -297,7 +297,7 @@ static bool radeon_atom_mode_fixup(struct drm_encoder *encoder,
 				   struct drm_display_mode *adjusted_mode)
 {
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	/* set the active encoder to connector routing */
@@ -343,7 +343,7 @@ static bool radeon_atom_mode_fixup(struct drm_encoder *encoder,
 static void
 atombios_dac_setup(struct drm_encoder *encoder, int action)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	DAC_ENCODER_CONTROL_PS_ALLOCATION args;
@@ -395,7 +395,7 @@ atombios_dac_setup(struct drm_encoder *encoder, int action)
 static void
 atombios_tv_setup(struct drm_encoder *encoder, int action)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	TV_ENCODER_CONTROL_PS_ALLOCATION args;
@@ -484,7 +484,7 @@ union dvo_encoder_control {
 void
 atombios_dvo_setup(struct drm_encoder *encoder, int action)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	union dvo_encoder_control args;
@@ -556,7 +556,7 @@ union lvds_encoder_control {
 void
 atombios_digital_setup(struct drm_encoder *encoder, int action)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
@@ -669,7 +669,7 @@ atombios_digital_setup(struct drm_encoder *encoder, int action)
 int
 atombios_get_encoder_mode(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_connector *connector;
@@ -829,7 +829,7 @@ union dig_encoder_control {
 void
 atombios_dig_encoder_setup2(struct drm_encoder *encoder, int action, int panel_mode, int enc_override)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
@@ -999,7 +999,7 @@ union dig_transmitter_control {
 void
 atombios_dig_transmitter_setup2(struct drm_encoder *encoder, int action, uint8_t lane_num, uint8_t lane_set, int fe)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
@@ -1423,7 +1423,7 @@ atombios_external_encoder_setup(struct drm_encoder *encoder,
 				struct drm_encoder *ext_encoder,
 				int action)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder *ext_radeon_encoder = to_radeon_encoder(ext_encoder);
@@ -1524,7 +1524,7 @@ atombios_external_encoder_setup(struct drm_encoder *encoder,
 static void
 atombios_yuv_setup(struct drm_encoder *encoder, bool enable)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(encoder->crtc);
@@ -1561,7 +1561,7 @@ atombios_yuv_setup(struct drm_encoder *encoder, bool enable)
 static void
 radeon_atom_encoder_dpms_avivo(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	DISPLAY_DEVICE_OUTPUT_CONTROL_PS_ALLOCATION args;
@@ -1648,7 +1648,7 @@ radeon_atom_encoder_dpms_avivo(struct drm_encoder *encoder, int mode)
 static void
 radeon_atom_encoder_dpms_dig(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_encoder *ext_encoder = radeon_get_external_encoder(encoder);
@@ -1762,7 +1762,7 @@ radeon_atom_encoder_dpms_dig(struct drm_encoder *encoder, int mode)
 static void
 radeon_atom_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	int encoder_mode = atombios_get_encoder_mode(encoder);
@@ -1843,7 +1843,7 @@ union crtc_source_param {
 static void
 atombios_set_encoder_crtc_source(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(encoder->crtc);
@@ -1992,7 +1992,7 @@ static void
 atombios_apply_encoder_quirks(struct drm_encoder *encoder,
 			      struct drm_display_mode *mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(encoder->crtc);
@@ -2045,7 +2045,7 @@ void radeon_atom_release_dig_encoder(struct radeon_device *rdev, int enc_idx)
 
 int radeon_atom_pick_dig_encoder(struct drm_encoder *encoder, int fe_idx)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(encoder->crtc);
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
@@ -2208,7 +2208,7 @@ radeon_atom_encoder_mode_set(struct drm_encoder *encoder,
 			     struct drm_display_mode *mode,
 			     struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
@@ -2271,7 +2271,7 @@ radeon_atom_encoder_mode_set(struct drm_encoder *encoder,
 static bool
 atombios_dac_load_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
@@ -2320,7 +2320,7 @@ atombios_dac_load_detect(struct drm_encoder *encoder, struct drm_connector *conn
 static enum drm_connector_status
 radeon_atom_dac_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
@@ -2361,7 +2361,7 @@ radeon_atom_dac_detect(struct drm_encoder *encoder, struct drm_connector *connec
 static enum drm_connector_status
 radeon_atom_dig_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
@@ -2419,7 +2419,7 @@ radeon_atom_ext_encoder_setup_ddc(struct drm_encoder *encoder)
 
 static void radeon_atom_encoder_prepare(struct drm_encoder *encoder)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
 
@@ -2479,7 +2479,7 @@ static void radeon_atom_encoder_commit(struct drm_encoder *encoder)
 
 static void radeon_atom_encoder_disable(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig;
@@ -2622,7 +2622,7 @@ static const struct drm_encoder_funcs radeon_atom_enc_funcs = {
 static struct radeon_encoder_atom_dac *
 radeon_atombios_set_dac_info(struct radeon_encoder *radeon_encoder)
 {
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder_atom_dac *dac = kzalloc(sizeof(struct radeon_encoder_atom_dac), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 5819737c21c6..3b1025c18e2f 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -8722,7 +8722,7 @@ void cik_fini(struct radeon_device *rdev)
 
 void dce8_program_fmt(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(encoder->crtc);
diff --git a/drivers/gpu/drm/radeon/dce3_1_afmt.c b/drivers/gpu/drm/radeon/dce3_1_afmt.c
index e8fe239b9d79..1531c6d9bb5f 100644
--- a/drivers/gpu/drm/radeon/dce3_1_afmt.c
+++ b/drivers/gpu/drm/radeon/dce3_1_afmt.c
@@ -30,7 +30,7 @@
 void dce3_2_afmt_hdmi_write_speaker_allocation(struct drm_encoder *encoder,
 	u8 *sadb, int sad_count)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	u32 tmp;
 
 	/* program the speaker allocation */
@@ -48,7 +48,7 @@ void dce3_2_afmt_hdmi_write_speaker_allocation(struct drm_encoder *encoder,
 void dce3_2_afmt_dp_write_speaker_allocation(struct drm_encoder *encoder,
 	u8 *sadb, int sad_count)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	u32 tmp;
 
 	/* program the speaker allocation */
@@ -67,7 +67,7 @@ void dce3_2_afmt_write_sad_regs(struct drm_encoder *encoder,
 	struct cea_sad *sads, int sad_count)
 {
 	int i;
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	static const u16 eld_reg_to_type[][2] = {
 		{ AZ_F0_CODEC_PIN0_CONTROL_AUDIO_DESCRIPTOR0, HDMI_AUDIO_CODING_TYPE_PCM },
 		{ AZ_F0_CODEC_PIN0_CONTROL_AUDIO_DESCRIPTOR1, HDMI_AUDIO_CODING_TYPE_AC3 },
@@ -170,7 +170,7 @@ void dce3_2_audio_set_dto(struct radeon_device *rdev,
 void dce3_2_hdmi_update_acr(struct drm_encoder *encoder, long offset,
 	const struct radeon_hdmi_acr *acr)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	WREG32(DCE3_HDMI0_ACR_PACKET_CONTROL + offset,
@@ -201,7 +201,7 @@ void dce3_2_hdmi_update_acr(struct drm_encoder *encoder, long offset,
 
 void dce3_2_set_audio_packet(struct drm_encoder *encoder, u32 offset)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	WREG32(HDMI0_AUDIO_PACKET_CONTROL + offset,
@@ -222,7 +222,7 @@ void dce3_2_set_audio_packet(struct drm_encoder *encoder, u32 offset)
 
 void dce3_2_set_mute(struct drm_encoder *encoder, u32 offset, bool mute)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (mute)
diff --git a/drivers/gpu/drm/radeon/dce6_afmt.c b/drivers/gpu/drm/radeon/dce6_afmt.c
index 4a1d5447eac1..2955df1ca124 100644
--- a/drivers/gpu/drm/radeon/dce6_afmt.c
+++ b/drivers/gpu/drm/radeon/dce6_afmt.c
@@ -110,7 +110,7 @@ struct r600_audio_pin *dce6_audio_get_pin(struct radeon_device *rdev)
 
 void dce6_afmt_select_pin(struct drm_encoder *encoder)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
 
@@ -125,7 +125,7 @@ void dce6_afmt_write_latency_fields(struct drm_encoder *encoder,
 				    struct drm_connector *connector,
 				    struct drm_display_mode *mode)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
 	u32 tmp = 0;
@@ -153,7 +153,7 @@ void dce6_afmt_write_latency_fields(struct drm_encoder *encoder,
 void dce6_afmt_hdmi_write_speaker_allocation(struct drm_encoder *encoder,
 					     u8 *sadb, int sad_count)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
 	u32 tmp;
@@ -178,7 +178,7 @@ void dce6_afmt_hdmi_write_speaker_allocation(struct drm_encoder *encoder,
 void dce6_afmt_dp_write_speaker_allocation(struct drm_encoder *encoder,
 					   u8 *sadb, int sad_count)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
 	u32 tmp;
@@ -206,7 +206,7 @@ void dce6_afmt_write_sad_regs(struct drm_encoder *encoder,
 	int i;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	static const u16 eld_reg_to_type[][2] = {
 		{ AZ_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR0, HDMI_AUDIO_CODING_TYPE_PCM },
 		{ AZ_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR1, HDMI_AUDIO_CODING_TYPE_AC3 },
diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index 4f06356d9ce2..0892206e2849 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -1290,7 +1290,7 @@ void evergreen_fix_pci_max_read_req_size(struct radeon_device *rdev)
 
 void dce4_program_fmt(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(encoder->crtc);
diff --git a/drivers/gpu/drm/radeon/evergreen_hdmi.c b/drivers/gpu/drm/radeon/evergreen_hdmi.c
index 5f3078f8ab95..b2f60315ff59 100644
--- a/drivers/gpu/drm/radeon/evergreen_hdmi.c
+++ b/drivers/gpu/drm/radeon/evergreen_hdmi.c
@@ -68,7 +68,7 @@ void dce4_audio_enable(struct radeon_device *rdev,
 void evergreen_hdmi_update_acr(struct drm_encoder *encoder, long offset,
 	const struct radeon_hdmi_acr *acr)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	int bpc = 8;
 
@@ -98,7 +98,7 @@ void evergreen_hdmi_update_acr(struct drm_encoder *encoder, long offset,
 void dce4_afmt_write_latency_fields(struct drm_encoder *encoder,
 		struct drm_connector *connector, struct drm_display_mode *mode)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	u32 tmp = 0;
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
@@ -120,7 +120,7 @@ void dce4_afmt_write_latency_fields(struct drm_encoder *encoder,
 void dce4_afmt_hdmi_write_speaker_allocation(struct drm_encoder *encoder,
 	u8 *sadb, int sad_count)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	u32 tmp;
 
 	/* program the speaker allocation */
@@ -138,7 +138,7 @@ void dce4_afmt_hdmi_write_speaker_allocation(struct drm_encoder *encoder,
 void dce4_afmt_dp_write_speaker_allocation(struct drm_encoder *encoder,
 	u8 *sadb, int sad_count)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	u32 tmp;
 
 	/* program the speaker allocation */
@@ -157,7 +157,7 @@ void evergreen_hdmi_write_sad_regs(struct drm_encoder *encoder,
 	struct cea_sad *sads, int sad_count)
 {
 	int i;
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	static const u16 eld_reg_to_type[][2] = {
 		{ AZ_F0_CODEC_PIN0_CONTROL_AUDIO_DESCRIPTOR0, HDMI_AUDIO_CODING_TYPE_PCM },
 		{ AZ_F0_CODEC_PIN0_CONTROL_AUDIO_DESCRIPTOR1, HDMI_AUDIO_CODING_TYPE_AC3 },
@@ -306,7 +306,7 @@ void dce4_dp_audio_set_dto(struct radeon_device *rdev,
 
 void dce4_set_vbi_packet(struct drm_encoder *encoder, u32 offset)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	WREG32(HDMI_VBI_PACKET_CONTROL + offset,
@@ -317,7 +317,7 @@ void dce4_set_vbi_packet(struct drm_encoder *encoder, u32 offset)
 
 void dce4_hdmi_set_color_depth(struct drm_encoder *encoder, u32 offset, int bpc)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
 	uint32_t val;
@@ -354,7 +354,7 @@ void dce4_hdmi_set_color_depth(struct drm_encoder *encoder, u32 offset, int bpc)
 
 void dce4_set_audio_packet(struct drm_encoder *encoder, u32 offset)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	WREG32(AFMT_INFOFRAME_CONTROL0 + offset,
@@ -389,7 +389,7 @@ void dce4_set_audio_packet(struct drm_encoder *encoder, u32 offset)
 
 void dce4_set_mute(struct drm_encoder *encoder, u32 offset, bool mute)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (mute)
@@ -400,7 +400,7 @@ void dce4_set_mute(struct drm_encoder *encoder, u32 offset, bool mute)
 
 void evergreen_hdmi_enable(struct drm_encoder *encoder, bool enable)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
@@ -440,7 +440,7 @@ void evergreen_hdmi_enable(struct drm_encoder *encoder, bool enable)
 
 void evergreen_dp_enable(struct drm_encoder *encoder, bool enable)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
index 382795a8b3c0..1aa341b22124 100644
--- a/drivers/gpu/drm/radeon/r600.c
+++ b/drivers/gpu/drm/radeon/r600.c
@@ -295,7 +295,7 @@ int r600_set_uvd_clocks(struct radeon_device *rdev, u32 vclk, u32 dclk)
 
 void dce3_program_fmt(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(encoder->crtc);
diff --git a/drivers/gpu/drm/radeon/r600_hdmi.c b/drivers/gpu/drm/radeon/r600_hdmi.c
index f3551ebaa2f0..b4d0a1af9a03 100644
--- a/drivers/gpu/drm/radeon/r600_hdmi.c
+++ b/drivers/gpu/drm/radeon/r600_hdmi.c
@@ -178,7 +178,7 @@ struct r600_audio_pin *r600_audio_get_pin(struct radeon_device *rdev)
 void r600_hdmi_update_acr(struct drm_encoder *encoder, long offset,
 	const struct radeon_hdmi_acr *acr)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	/* DCE 3.0 uses register that's normally for CRC_CONTROL */
@@ -244,7 +244,7 @@ void r600_set_avi_packet(struct radeon_device *rdev, u32 offset,
 static void r600_hdmi_update_audio_infoframe(struct drm_encoder *encoder,
 					     const void *buffer, size_t size)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
@@ -262,7 +262,7 @@ static void r600_hdmi_update_audio_infoframe(struct drm_encoder *encoder,
  */
 static bool r600_hdmi_is_audio_buffer_filled(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
@@ -295,7 +295,7 @@ int r600_hdmi_buffer_status_changed(struct drm_encoder *encoder)
  */
 void r600_hdmi_audio_workaround(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
@@ -340,7 +340,7 @@ void r600_hdmi_audio_set_dto(struct radeon_device *rdev,
 
 void r600_set_vbi_packet(struct drm_encoder *encoder, u32 offset)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	WREG32_OR(HDMI0_VBI_PACKET_CONTROL + offset,
@@ -351,7 +351,7 @@ void r600_set_vbi_packet(struct drm_encoder *encoder, u32 offset)
 
 void r600_set_audio_packet(struct drm_encoder *encoder, u32 offset)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	WREG32_P(HDMI0_AUDIO_PACKET_CONTROL + offset,
@@ -393,7 +393,7 @@ void r600_set_audio_packet(struct drm_encoder *encoder, u32 offset)
 
 void r600_set_mute(struct drm_encoder *encoder, u32 offset, bool mute)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (mute)
@@ -411,7 +411,7 @@ void r600_set_mute(struct drm_encoder *encoder, u32 offset, bool mute)
  */
 void r600_hdmi_update_audio_settings(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
@@ -469,7 +469,7 @@ void r600_hdmi_update_audio_settings(struct drm_encoder *encoder)
  */
 void r600_hdmi_enable(struct drm_encoder *encoder, bool enable)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 96b5f55c908f..b588acdf445c 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -1323,7 +1323,7 @@ bool radeon_atombios_sideport_present(struct radeon_device *rdev)
 bool radeon_atombios_get_tmds_info(struct radeon_encoder *encoder,
 				   struct radeon_encoder_int_tmds *tmds)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_mode_info *mode_info = &rdev->mode_info;
 	int index = GetIndexIntoMasterTable(DATA, TMDS_Info);
@@ -1612,7 +1612,7 @@ struct radeon_encoder_atom_dig *radeon_atombios_get_lvds_info(struct
 							      radeon_encoder
 							      *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_mode_info *mode_info = &rdev->mode_info;
 	int index = GetIndexIntoMasterTable(DATA, LVDS_Info);
@@ -1755,7 +1755,7 @@ struct radeon_encoder_atom_dig *radeon_atombios_get_lvds_info(struct
 struct radeon_encoder_primary_dac *
 radeon_atombios_get_primary_dac_info(struct radeon_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_mode_info *mode_info = &rdev->mode_info;
 	int index = GetIndexIntoMasterTable(DATA, CompassionateData);
@@ -1941,7 +1941,7 @@ radeon_atombios_get_tv_info(struct radeon_device *rdev)
 struct radeon_encoder_tv_dac *
 radeon_atombios_get_tv_dac_info(struct radeon_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_mode_info *mode_info = &rdev->mode_info;
 	int index = GetIndexIntoMasterTable(DATA, CompassionateData);
@@ -4131,7 +4131,7 @@ void radeon_restore_bios_scratch_regs(struct radeon_device *rdev)
 
 void radeon_atom_output_lock(struct drm_encoder *encoder, bool lock)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t bios_6_scratch;
 
@@ -4344,7 +4344,7 @@ radeon_atombios_connected_scratch_regs(struct drm_connector *connector,
 void
 radeon_atombios_encoder_crtc_scratch_regs(struct drm_encoder *encoder, int crtc)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	uint32_t bios_3_scratch;
@@ -4399,7 +4399,7 @@ radeon_atombios_encoder_crtc_scratch_regs(struct drm_encoder *encoder, int crtc)
 void
 radeon_atombios_encoder_dpms_scratch_regs(struct drm_encoder *encoder, bool on)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	uint32_t bios_2_scratch;
diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index fbc2ea8bcae8..b1d76942adcb 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -361,7 +361,7 @@ static void radeon_audio_write_latency_fields(struct drm_encoder *encoder,
 
 struct r600_audio_pin* radeon_audio_get_pin(struct drm_encoder *encoder)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 
 	if (radeon_encoder->audio && radeon_encoder->audio->get_pin)
@@ -437,7 +437,7 @@ void radeon_audio_fini(struct radeon_device *rdev)
 
 static void radeon_audio_set_dto(struct drm_encoder *encoder, unsigned int clock)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_crtc *crtc = to_radeon_crtc(encoder->crtc);
 
@@ -448,7 +448,7 @@ static void radeon_audio_set_dto(struct drm_encoder *encoder, unsigned int clock
 static int radeon_audio_set_avi_packet(struct drm_encoder *encoder,
 				       struct drm_display_mode *mode)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
 	struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
@@ -673,7 +673,7 @@ static void radeon_audio_hdmi_mode_set(struct drm_encoder *encoder,
 static void radeon_audio_dp_mode_set(struct drm_encoder *encoder,
 				     struct drm_display_mode *mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index 9a0eb4130c3b..7beaa0f64b93 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -859,7 +859,7 @@ struct radeon_encoder_primary_dac *radeon_combios_get_primary_dac_info(struct
 								       radeon_encoder
 								       *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint16_t dac_info;
 	uint8_t rev, bg, dac;
@@ -1010,7 +1010,7 @@ struct radeon_encoder_tv_dac *radeon_combios_get_tv_dac_info(struct
 							     radeon_encoder
 							     *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint16_t dac_info;
 	uint8_t rev, bg, dac;
@@ -1169,7 +1169,7 @@ static struct radeon_encoder_lvds *radeon_legacy_get_lvds_info_from_regs(struct
 struct radeon_encoder_lvds *radeon_combios_get_lvds_info(struct radeon_encoder
 							 *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint16_t lcd_info;
 	uint32_t panel_setup;
@@ -1314,7 +1314,7 @@ static const struct radeon_tmds_pll default_tmds_pll[CHIP_LAST][4] = {
 bool radeon_legacy_get_tmds_info_from_table(struct radeon_encoder *encoder,
 					    struct radeon_encoder_int_tmds *tmds)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	int i;
 
@@ -1330,7 +1330,7 @@ bool radeon_legacy_get_tmds_info_from_table(struct radeon_encoder *encoder,
 bool radeon_legacy_get_tmds_info_from_combios(struct radeon_encoder *encoder,
 					      struct radeon_encoder_int_tmds *tmds)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint16_t tmds_info;
 	int i, n;
@@ -1383,7 +1383,7 @@ bool radeon_legacy_get_tmds_info_from_combios(struct radeon_encoder *encoder,
 bool radeon_legacy_get_ext_tmds_info_from_table(struct radeon_encoder *encoder,
 						struct radeon_encoder_ext_tmds *tmds)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_i2c_bus_rec i2c_bus;
 
@@ -1407,7 +1407,7 @@ bool radeon_legacy_get_ext_tmds_info_from_table(struct radeon_encoder *encoder,
 bool radeon_legacy_get_ext_tmds_info_from_combios(struct radeon_encoder *encoder,
 						  struct radeon_encoder_ext_tmds *tmds)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint16_t offset;
 	uint8_t ver;
@@ -2882,7 +2882,7 @@ void radeon_external_tmds_setup(struct drm_encoder *encoder)
 
 bool radeon_combios_external_tmds_setup(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	uint16_t offset;
@@ -3439,7 +3439,7 @@ void radeon_combios_initialize_bios_scratch_regs(struct drm_device *dev)
 
 void radeon_combios_output_lock(struct drm_encoder *encoder, bool lock)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t bios_6_scratch;
 
@@ -3559,7 +3559,7 @@ radeon_combios_connected_scratch_regs(struct drm_connector *connector,
 void
 radeon_combios_encoder_crtc_scratch_regs(struct drm_encoder *encoder, int crtc)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	uint32_t bios_5_scratch = RREG32(RADEON_BIOS_5_SCRATCH);
@@ -3594,7 +3594,7 @@ radeon_combios_encoder_crtc_scratch_regs(struct drm_encoder *encoder, int crtc)
 void
 radeon_combios_encoder_dpms_scratch_regs(struct drm_encoder *encoder, bool on)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	uint32_t bios_6_scratch = RREG32(RADEON_BIOS_6_SCRATCH);
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 0215f88b3b70..d107954785c4 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -443,7 +443,7 @@ radeon_connector_analog_encoder_conflict_solve(struct drm_connector *connector,
 
 static struct drm_display_mode *radeon_fp_native_mode(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_display_mode *mode = NULL;
 	struct drm_display_mode *native_mode = &radeon_encoder->native_mode;
@@ -478,7 +478,7 @@ static struct drm_display_mode *radeon_fp_native_mode(struct drm_encoder *encode
 
 static void radeon_add_common_modes(struct drm_encoder *encoder, struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_display_mode *mode = NULL;
 	struct drm_display_mode *native_mode = &radeon_encoder->native_mode;
diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
index b3518a8f95a0..9b5ded0d04cd 100644
--- a/drivers/gpu/drm/radeon/radeon_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_encoders.c
@@ -38,7 +38,7 @@
 
 static uint32_t radeon_encoder_clones(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_encoder *clone_encoder;
@@ -160,7 +160,7 @@ radeon_get_encoder_enum(struct drm_device *dev, uint32_t supported_device, uint8
 static void radeon_encoder_add_backlight(struct radeon_encoder *radeon_encoder,
 					 struct drm_connector *connector)
 {
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	bool use_bl = false;
 
@@ -227,7 +227,7 @@ radeon_link_encoder_connector(struct drm_device *dev)
 
 void radeon_encoder_set_active_device(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_connector *connector;
 
@@ -245,7 +245,7 @@ void radeon_encoder_set_active_device(struct drm_encoder *encoder)
 struct drm_connector *
 radeon_get_connector_for_encoder(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_connector *connector;
 	struct radeon_connector *radeon_connector;
@@ -261,7 +261,7 @@ radeon_get_connector_for_encoder(struct drm_encoder *encoder)
 struct drm_connector *
 radeon_get_connector_for_encoder_init(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_connector *connector;
 	struct radeon_connector *radeon_connector;
@@ -276,7 +276,7 @@ radeon_get_connector_for_encoder_init(struct drm_encoder *encoder)
 
 struct drm_encoder *radeon_get_external_encoder(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_encoder *other_encoder;
 	struct radeon_encoder *other_radeon_encoder;
@@ -317,7 +317,7 @@ void radeon_panel_mode_fixup(struct drm_encoder *encoder,
 			     struct drm_display_mode *adjusted_mode)
 {
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_display_mode *native_mode = &radeon_encoder->native_mode;
 	unsigned hblank = native_mode->htotal - native_mode->hdisplay;
@@ -363,7 +363,7 @@ void radeon_panel_mode_fixup(struct drm_encoder *encoder,
 bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
 				    u32 pixel_clock)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_connector *connector;
 	struct radeon_connector *radeon_connector;
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
index 601d35d34eab..f9cd456164a3 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
@@ -55,7 +55,7 @@ static void radeon_legacy_encoder_disable(struct drm_encoder *encoder)
 
 static void radeon_legacy_lvds_update(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	uint32_t lvds_gen_cntl, lvds_pll_cntl, pixclks_cntl, disp_pwr_man;
@@ -144,7 +144,7 @@ static void radeon_legacy_lvds_update(struct drm_encoder *encoder, int mode)
 
 static void radeon_legacy_lvds_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	DRM_DEBUG("\n");
 
@@ -163,7 +163,7 @@ static void radeon_legacy_lvds_dpms(struct drm_encoder *encoder, int mode)
 
 static void radeon_legacy_lvds_prepare(struct drm_encoder *encoder)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 
 	if (rdev->is_atom_bios)
 		radeon_atom_output_lock(encoder, true);
@@ -174,7 +174,7 @@ static void radeon_legacy_lvds_prepare(struct drm_encoder *encoder)
 
 static void radeon_legacy_lvds_commit(struct drm_encoder *encoder)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 
 	radeon_legacy_lvds_dpms(encoder, DRM_MODE_DPMS_ON);
 	if (rdev->is_atom_bios)
@@ -187,7 +187,7 @@ static void radeon_legacy_lvds_mode_set(struct drm_encoder *encoder,
 					struct drm_display_mode *mode,
 					struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(encoder->crtc);
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
@@ -282,7 +282,7 @@ static const struct drm_encoder_helper_funcs radeon_legacy_lvds_helper_funcs = {
 u8
 radeon_legacy_get_backlight_level(struct radeon_encoder *radeon_encoder)
 {
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	u8 backlight_level;
 
@@ -295,7 +295,7 @@ radeon_legacy_get_backlight_level(struct radeon_encoder *radeon_encoder)
 void
 radeon_legacy_set_backlight_level(struct radeon_encoder *radeon_encoder, u8 level)
 {
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	int dpms_mode = DRM_MODE_DPMS_ON;
 
@@ -354,7 +354,7 @@ static int radeon_legacy_backlight_get_brightness(struct backlight_device *bd)
 {
 	struct radeon_backlight_privdata *pdata = bl_get_data(bd);
 	struct radeon_encoder *radeon_encoder = pdata->encoder;
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint8_t backlight_level;
 
@@ -372,7 +372,7 @@ static const struct backlight_ops radeon_backlight_ops = {
 void radeon_legacy_backlight_init(struct radeon_encoder *radeon_encoder,
 				  struct drm_connector *drm_connector)
 {
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct backlight_device *bd;
 	struct backlight_properties props;
@@ -465,7 +465,7 @@ void radeon_legacy_backlight_init(struct radeon_encoder *radeon_encoder,
 
 static void radeon_legacy_backlight_exit(struct radeon_encoder *radeon_encoder)
 {
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct backlight_device *bd = NULL;
 
@@ -511,7 +511,7 @@ static const struct drm_encoder_funcs radeon_legacy_lvds_enc_funcs = {
 
 static void radeon_legacy_primary_dac_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t crtc_ext_cntl = RREG32(RADEON_CRTC_EXT_CNTL);
 	uint32_t dac_cntl = RREG32(RADEON_DAC_CNTL);
@@ -553,7 +553,7 @@ static void radeon_legacy_primary_dac_dpms(struct drm_encoder *encoder, int mode
 
 static void radeon_legacy_primary_dac_prepare(struct drm_encoder *encoder)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 
 	if (rdev->is_atom_bios)
 		radeon_atom_output_lock(encoder, true);
@@ -564,7 +564,7 @@ static void radeon_legacy_primary_dac_prepare(struct drm_encoder *encoder)
 
 static void radeon_legacy_primary_dac_commit(struct drm_encoder *encoder)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 
 	radeon_legacy_primary_dac_dpms(encoder, DRM_MODE_DPMS_ON);
 
@@ -578,7 +578,7 @@ static void radeon_legacy_primary_dac_mode_set(struct drm_encoder *encoder,
 					       struct drm_display_mode *mode,
 					       struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(encoder->crtc);
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
@@ -634,7 +634,7 @@ static void radeon_legacy_primary_dac_mode_set(struct drm_encoder *encoder,
 static enum drm_connector_status radeon_legacy_primary_dac_detect(struct drm_encoder *encoder,
 								  struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t vclk_ecp_cntl, crtc_ext_cntl;
 	uint32_t dac_ext_cntl, dac_cntl, dac_macro_cntl, tmp;
@@ -723,7 +723,7 @@ static const struct drm_encoder_funcs radeon_legacy_primary_dac_enc_funcs = {
 
 static void radeon_legacy_tmds_int_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t fp_gen_cntl = RREG32(RADEON_FP_GEN_CNTL);
 	DRM_DEBUG_KMS("\n");
@@ -750,7 +750,7 @@ static void radeon_legacy_tmds_int_dpms(struct drm_encoder *encoder, int mode)
 
 static void radeon_legacy_tmds_int_prepare(struct drm_encoder *encoder)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 
 	if (rdev->is_atom_bios)
 		radeon_atom_output_lock(encoder, true);
@@ -761,7 +761,7 @@ static void radeon_legacy_tmds_int_prepare(struct drm_encoder *encoder)
 
 static void radeon_legacy_tmds_int_commit(struct drm_encoder *encoder)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 
 	radeon_legacy_tmds_int_dpms(encoder, DRM_MODE_DPMS_ON);
 
@@ -775,7 +775,7 @@ static void radeon_legacy_tmds_int_mode_set(struct drm_encoder *encoder,
 					    struct drm_display_mode *mode,
 					    struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(encoder->crtc);
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
@@ -887,7 +887,7 @@ static const struct drm_encoder_funcs radeon_legacy_tmds_int_enc_funcs = {
 
 static void radeon_legacy_tmds_ext_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t fp2_gen_cntl = RREG32(RADEON_FP2_GEN_CNTL);
 	DRM_DEBUG_KMS("\n");
@@ -916,7 +916,7 @@ static void radeon_legacy_tmds_ext_dpms(struct drm_encoder *encoder, int mode)
 
 static void radeon_legacy_tmds_ext_prepare(struct drm_encoder *encoder)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 
 	if (rdev->is_atom_bios)
 		radeon_atom_output_lock(encoder, true);
@@ -927,7 +927,7 @@ static void radeon_legacy_tmds_ext_prepare(struct drm_encoder *encoder)
 
 static void radeon_legacy_tmds_ext_commit(struct drm_encoder *encoder)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 	radeon_legacy_tmds_ext_dpms(encoder, DRM_MODE_DPMS_ON);
 
 	if (rdev->is_atom_bios)
@@ -940,7 +940,7 @@ static void radeon_legacy_tmds_ext_mode_set(struct drm_encoder *encoder,
 					    struct drm_display_mode *mode,
 					    struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(encoder->crtc);
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
@@ -1030,7 +1030,7 @@ static const struct drm_encoder_funcs radeon_legacy_tmds_ext_enc_funcs = {
 
 static void radeon_legacy_tv_dac_dpms(struct drm_encoder *encoder, int mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	uint32_t fp2_gen_cntl = 0, crtc2_gen_cntl = 0, tv_dac_cntl = 0;
@@ -1121,7 +1121,7 @@ static void radeon_legacy_tv_dac_dpms(struct drm_encoder *encoder, int mode)
 
 static void radeon_legacy_tv_dac_prepare(struct drm_encoder *encoder)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 
 	if (rdev->is_atom_bios)
 		radeon_atom_output_lock(encoder, true);
@@ -1132,7 +1132,7 @@ static void radeon_legacy_tv_dac_prepare(struct drm_encoder *encoder)
 
 static void radeon_legacy_tv_dac_commit(struct drm_encoder *encoder)
 {
-	struct radeon_device *rdev = encoder->dev->dev_private;
+	struct radeon_device *rdev = encoder->drm->dev_private;
 
 	radeon_legacy_tv_dac_dpms(encoder, DRM_MODE_DPMS_ON);
 
@@ -1146,7 +1146,7 @@ static void radeon_legacy_tv_dac_mode_set(struct drm_encoder *encoder,
 		struct drm_display_mode *mode,
 		struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(encoder->crtc);
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
@@ -1299,7 +1299,7 @@ static void radeon_legacy_tv_dac_mode_set(struct drm_encoder *encoder,
 static bool r300_legacy_tv_detect(struct drm_encoder *encoder,
 				  struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t crtc2_gen_cntl, tv_dac_cntl, dac_cntl2, dac_ext_cntl;
 	uint32_t disp_output_cntl, gpiopad_a, tmp;
@@ -1370,7 +1370,7 @@ static bool r300_legacy_tv_detect(struct drm_encoder *encoder,
 static bool radeon_legacy_tv_detect(struct drm_encoder *encoder,
 				    struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t tv_dac_cntl, dac_cntl2;
 	uint32_t config_cntl, tv_pre_dac_mux_cntl, tv_master_cntl, tmp;
@@ -1434,7 +1434,7 @@ static bool radeon_legacy_tv_detect(struct drm_encoder *encoder,
 static bool radeon_legacy_ext_dac_detect(struct drm_encoder *encoder,
 					 struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t gpio_monid, fp2_gen_cntl, disp_output_cntl, crtc2_gen_cntl;
 	uint32_t disp_lin_trans_grph_a, disp_lin_trans_grph_b, disp_lin_trans_grph_c;
@@ -1524,7 +1524,7 @@ static bool radeon_legacy_ext_dac_detect(struct drm_encoder *encoder,
 static enum drm_connector_status radeon_legacy_tv_dac_detect(struct drm_encoder *encoder,
 							     struct drm_connector *connector)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t crtc2_gen_cntl = 0, tv_dac_cntl, dac_cntl2, dac_ext_cntl;
 	uint32_t gpiopad_a = 0, pixclks_cntl, tmp;
@@ -1690,7 +1690,7 @@ static const struct drm_encoder_funcs radeon_legacy_tv_dac_enc_funcs = {
 
 static struct radeon_encoder_int_tmds *radeon_legacy_get_tmds_info(struct radeon_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder_int_tmds *tmds = NULL;
 	bool ret;
@@ -1713,7 +1713,7 @@ static struct radeon_encoder_int_tmds *radeon_legacy_get_tmds_info(struct radeon
 
 static struct radeon_encoder_ext_tmds *radeon_legacy_get_ext_tmds_info(struct radeon_encoder *encoder)
 {
-	struct drm_device *dev = encoder->base.dev;
+	struct drm_device *dev = encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder_ext_tmds *tmds = NULL;
 	bool ret;
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_tv.c b/drivers/gpu/drm/radeon/radeon_legacy_tv.c
index 12e180b119ac..df910657cfbe 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_tv.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_tv.c
@@ -236,7 +236,7 @@ static const struct radeon_tv_mode_constants available_tv_modes[] = {
 static const struct radeon_tv_mode_constants *radeon_legacy_tv_get_std_mode(struct radeon_encoder *radeon_encoder,
 									    uint16_t *pll_ref_freq)
 {
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc;
 	struct radeon_encoder_tv_dac *tv_dac = radeon_encoder->enc_priv;
@@ -276,7 +276,7 @@ static long SLOPE_limit[5] = { 6, 5, 4, 3, 2 };
 static void radeon_wait_pll_lock(struct drm_encoder *encoder, unsigned n_tests,
 				 unsigned n_wait_loops, unsigned cnt_threshold)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t save_pll_test;
 	unsigned int i, j;
@@ -300,7 +300,7 @@ static void radeon_wait_pll_lock(struct drm_encoder *encoder, unsigned n_tests,
 static void radeon_legacy_tv_write_fifo(struct radeon_encoder *radeon_encoder,
 					uint16_t addr, uint32_t value)
 {
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t tmp;
 	int i = 0;
@@ -385,7 +385,7 @@ static uint16_t radeon_get_vtiming_tables_addr(uint32_t tv_uv_adr)
 
 static void radeon_restore_tv_timing_tables(struct radeon_encoder *radeon_encoder)
 {
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder_tv_dac *tv_dac = radeon_encoder->enc_priv;
 	uint16_t h_table, v_table;
@@ -412,7 +412,7 @@ static void radeon_restore_tv_timing_tables(struct radeon_encoder *radeon_encode
 
 static void radeon_legacy_write_tv_restarts(struct radeon_encoder *radeon_encoder)
 {
-	struct drm_device *dev = radeon_encoder->base.dev;
+	struct drm_device *dev = radeon_encoder->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder_tv_dac *tv_dac = radeon_encoder->enc_priv;
 	WREG32(RADEON_TV_FRESTART, tv_dac->tv.frestart);
@@ -524,7 +524,7 @@ void radeon_legacy_tv_mode_set(struct drm_encoder *encoder,
 			       struct drm_display_mode *mode,
 			       struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_tv_dac *tv_dac = radeon_encoder->enc_priv;
diff --git a/drivers/gpu/drm/radeon/rs600.c b/drivers/gpu/drm/radeon/rs600.c
index 8cf87a0a2b2a..6a400bf7a300 100644
--- a/drivers/gpu/drm/radeon/rs600.c
+++ b/drivers/gpu/drm/radeon/rs600.c
@@ -164,7 +164,7 @@ bool rs600_page_flip_pending(struct radeon_device *rdev, int crtc_id)
 
 void avivo_program_fmt(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 3ce190c67055..356d8019e941 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -146,7 +146,7 @@ static int rcar_du_wb_enc_atomic_check(struct drm_encoder *encoder,
 	struct rcar_du_wb_conn_state *wb_state =
 		to_rcar_wb_conn_state(conn_state);
 	const struct drm_display_mode *mode = &crtc_state->mode;
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_framebuffer *fb;
 
 	if (!conn_state->writeback_job)
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index c8d8f86cd67c..80f3973e40ff 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -530,7 +530,7 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 static void shmob_drm_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
 	struct shmob_drm_encoder *senc = to_shmob_encoder(encoder);
-	struct shmob_drm_device *sdev = encoder->dev->dev_private;
+	struct shmob_drm_device *sdev = encoder->drm->dev_private;
 	struct shmob_drm_connector *scon = &sdev->connector;
 
 	if (senc->dpms == mode)
@@ -545,7 +545,7 @@ static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 					 const struct drm_display_mode *mode,
 					 struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct shmob_drm_device *sdev = dev->dev_private;
 	struct drm_connector *connector = &sdev->connector.connector;
 	const struct drm_display_mode *panel_mode;
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index e435d5ef5736..251d0a11ed86 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -707,7 +707,7 @@ static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
 static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 						 struct drm_atomic_state *state)
 {
-	struct drm_device *drm = encoder->dev;
+	struct drm_device *drm = encoder->drm;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 	int ret;
 
@@ -737,7 +737,7 @@ static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 static void ssd130x_encoder_helper_atomic_disable(struct drm_encoder *encoder,
 						  struct drm_atomic_state *state)
 {
-	struct drm_device *drm = encoder->dev;
+	struct drm_device *drm = encoder->drm;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 
 	backlight_disable(ssd130x->bl_dev);
diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index 64615638b79a..929d497855e5 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -607,7 +607,7 @@ static int sti_tvout_late_register(struct drm_encoder *encoder)
 	if (tvout->debugfs_registered)
 		return 0;
 
-	tvout_debugfs_init(tvout, encoder->dev->primary);
+	tvout_debugfs_init(tvout, encoder->drm->primary);
 
 	tvout->debugfs_registered = true;
 	return 0;
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index b27b73975bc1..7296cdebd712 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -494,7 +494,7 @@ static inline struct ltdc_device *plane_to_ltdc(struct drm_plane *plane)
 
 static inline struct ltdc_device *encoder_to_ltdc(struct drm_encoder *enc)
 {
-	return (struct ltdc_device *)enc->dev->dev_private;
+	return (struct ltdc_device *) enc->drm->dev_private;
 }
 
 static inline enum ltdc_pix_fmt to_ltdc_pixelformat(u32 drm_fmt)
@@ -1722,7 +1722,7 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 
 static void ltdc_encoder_disable(struct drm_encoder *encoder)
 {
-	struct drm_device *ddev = encoder->dev;
+	struct drm_device *ddev = encoder->drm;
 	struct ltdc_device *ldev = ddev->dev_private;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -1736,7 +1736,7 @@ static void ltdc_encoder_disable(struct drm_encoder *encoder)
 
 static void ltdc_encoder_enable(struct drm_encoder *encoder)
 {
-	struct drm_device *ddev = encoder->dev;
+	struct drm_device *ddev = encoder->drm;
 	struct ltdc_device *ldev = ddev->dev_private;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -1753,7 +1753,7 @@ static void ltdc_encoder_mode_set(struct drm_encoder *encoder,
 				  struct drm_display_mode *mode,
 				  struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *ddev = encoder->dev;
+	struct drm_device *ddev = encoder->drm;
 
 	DRM_DEBUG_DRIVER("\n");
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index b07ccee78cc1..b644a389f124 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -45,7 +45,7 @@ static struct drm_connector *sun4i_tcon_get_connector(const struct drm_encoder *
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 
-	drm_connector_list_iter_begin(encoder->dev, &iter);
+	drm_connector_list_iter_begin(encoder->drm, &iter);
 	drm_for_each_connector_iter(connector, &iter)
 		if (connector->encoder == encoder) {
 			drm_connector_list_iter_end(&iter);
@@ -1340,7 +1340,7 @@ static void sun4i_tcon_remove(struct platform_device *pdev)
 static int sun4i_a10_tcon_set_mux(struct sun4i_tcon *tcon,
 				  const struct drm_encoder *encoder)
 {
-	struct sun4i_tcon *tcon0 = sun4i_get_tcon0(encoder->dev);
+	struct sun4i_tcon *tcon0 = sun4i_get_tcon0(encoder->drm);
 	u32 shift;
 
 	if (!tcon0)
@@ -1380,7 +1380,7 @@ static int sun5i_a13_tcon_set_mux(struct sun4i_tcon *tcon,
 static int sun6i_tcon_set_mux(struct sun4i_tcon *tcon,
 			      const struct drm_encoder *encoder)
 {
-	struct sun4i_tcon *tcon0 = sun4i_get_tcon0(encoder->dev);
+	struct sun4i_tcon *tcon0 = sun4i_get_tcon0(encoder->drm);
 	u32 shift;
 
 	if (!tcon0)
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 366c28ae2396..ffdb2269d28c 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -119,7 +119,7 @@ static const struct debugfs_reg32 dpi_regs[] = {
 
 static void vc4_dpi_encoder_disable(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
 	int idx;
 
@@ -133,7 +133,7 @@ static void vc4_dpi_encoder_disable(struct drm_encoder *encoder)
 
 static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 {
-	struct drm_device *dev = encoder->dev;
+	struct drm_device *dev = encoder->drm;
 	struct drm_display_mode *mode = &encoder->crtc->mode;
 	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
 	struct drm_connector_list_iter conn_iter;
@@ -262,7 +262,7 @@ static const struct drm_encoder_helper_funcs vc4_dpi_encoder_helper_funcs = {
 
 static int vc4_dpi_late_register(struct drm_encoder *encoder)
 {
-	struct drm_device *drm = encoder->dev;
+	struct drm_device *drm = encoder->drm;
 	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
 
 	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
@@ -284,7 +284,7 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
  */
 static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 {
-	struct drm_device *drm = dpi->encoder.base.dev;
+	struct drm_device *drm = dpi->encoder.base.drm;
 	struct device *dev = &dpi->pdev->dev;
 	struct drm_bridge *bridge;
 
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 5011fe0fef87..58ff88e8e73d 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1419,7 +1419,7 @@ static const struct drm_bridge_funcs vc4_dsi_bridge_funcs = {
 
 static int vc4_dsi_late_register(struct drm_encoder *encoder)
 {
-	struct drm_device *drm = encoder->dev;
+	struct drm_device *drm = encoder->drm;
 	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 
 	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 58388eb9237f..1539a671ef98 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2233,7 +2233,7 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
 
 static int vc4_hdmi_late_register(struct drm_encoder *encoder)
 {
-	struct drm_device *drm = encoder->dev;
+	struct drm_device *drm = encoder->drm;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	const struct vc4_hdmi_variant *variant = vc4_hdmi->variant;
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index ec46ea639dd2..8bffa84bb86b 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -361,7 +361,7 @@ static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 
 static void vc4_txp_encoder_disable(struct drm_encoder *encoder)
 {
-	struct drm_device *drm = encoder->dev;
+	struct drm_device *drm = encoder->drm;
 	struct vc4_txp *txp = encoder_to_vc4_txp(encoder);
 	int idx;
 
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 725531d030a1..ec22ecc11a1d 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -511,7 +511,7 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 static void vc4_vec_encoder_disable(struct drm_encoder *encoder,
 				    struct drm_atomic_state *state)
 {
-	struct drm_device *drm = encoder->dev;
+	struct drm_device *drm = encoder->drm;
 	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
 	int idx, ret;
 
@@ -543,7 +543,7 @@ static void vc4_vec_encoder_disable(struct drm_encoder *encoder,
 static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 				   struct drm_atomic_state *state)
 {
-	struct drm_device *drm = encoder->dev;
+	struct drm_device *drm = encoder->drm;
 	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
 	struct drm_connector *connector = &vec->connector;
 	struct drm_connector_state *conn_state =
@@ -710,7 +710,7 @@ static const struct drm_encoder_helper_funcs vc4_vec_encoder_helper_funcs = {
 
 static int vc4_vec_late_register(struct drm_encoder *encoder)
 {
-	struct drm_device *drm = encoder->dev;
+	struct drm_device *drm = encoder->drm;
 	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
 
 	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 3a09682af685..f1f76a767432 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -85,7 +85,7 @@ struct drm_encoder_funcs {
 
 /**
  * struct drm_encoder - central DRM encoder structure
- * @dev: parent DRM device
+ * @drm: parent DRM device
  * @head: list management
  * @base: base KMS object
  * @name: human readable name, can be overwritten by the driver
@@ -96,7 +96,7 @@ struct drm_encoder_funcs {
  * appropriate for a given connector or set of connectors.
  */
 struct drm_encoder {
-	struct drm_device *dev;
+	struct drm_device *drm;
 	struct list_head head;
 
 	struct drm_mode_object base;
-- 
2.39.2

