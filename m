Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB39023C6AF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152756E4FF;
	Wed,  5 Aug 2020 07:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789616E096
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 21:53:46 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v12so15009285ljc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 14:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K3K3L4xTeO8WJCN+4NojLDn6Y8YSzCs4qmbjou++O18=;
 b=MWmWPfyuzwdNg9q2g+29NTxHzaGLOrxeuTRC408PBWbTE+YkaEz8HSqsobjqtOaQ/z
 70d6L8UAUiHz1p+VcjNPfU7naDCdM+DjhDAeaJWS7f+bnknAb14wg/GJKiMkVCn0n/6G
 IdgWZypumOkDEVOvhqDqgFPyee1My/OXeufFtVZxBjZjyFkCZKudZOoHN3apGwWO4LdI
 3rw8PGAHaxIlLlZ6jBsaew9768f1eKqLiTBlQPjKO0QlGLxow1y3Yp/QTTTHtzyK6QN3
 9ZFMR5GpLgwP8ERIyhLs9veF3GJzia5gQTvmNbc6CzYyZDOSwlFL1VUHO9/kA2Vjessl
 EdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K3K3L4xTeO8WJCN+4NojLDn6Y8YSzCs4qmbjou++O18=;
 b=A3rFIkVRI5tOupQeSTcWUklCustfpEu7goQIEJ+ghjFi8qKQcP/zacvqsQPA2DMYoJ
 rGbum/yeyMYrQxcLNctHK53RS8EFYGthXhyp7job8/whvigKNImeZid81JFwrejDDSeD
 nXg6PR8lJhiNjmnSLW4cRbR/gZIoqk0+Vistv4twWYPuT6af2WO4CU3abVGV0BcLeFfP
 4qMoSyih3nyq6F+NmK8CDVW35ssGC5x99llLXIFdIIUNsrBK5ZYL4TnEBm8GJ1S5QF52
 eraqe3STfJajjeB+Qa0G8JDaOCf2DHA79/GfK43n9OU8sSpvxS87bLJ6k0/sjzY4iztG
 zSzg==
X-Gm-Message-State: AOAM532UMYpTpManVK/4LkPQtCOMldvBf6rFY+xOowdwBDEJPkE/f5x9
 qD5lj63Xwe8kpG40CVNPTRE=
X-Google-Smtp-Source: ABdhPJwiC0cpr3FJfUYKJrqCch2gBqlXqGqNcWWZqSugmiQnC2850yxYAawikNYWZXTD4a66x8o2yg==
X-Received: by 2002:a2e:9643:: with SMTP id z3mr4685419ljh.282.1596578024897; 
 Tue, 04 Aug 2020 14:53:44 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se.
 [82.196.111.59])
 by smtp.gmail.com with ESMTPSA id 15sm5534378ljw.92.2020.08.04.14.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 14:53:44 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@siol.net
Subject: [PATCH] drm/sun4i: Constify static structs
Date: Tue,  4 Aug 2020 23:53:37 +0200
Message-Id: <20200804215337.54594-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A number of static variables are not modified and can be made const to
allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
Perhaps it should be split up? If so, some guidance on how would be
appreciated.

 drivers/gpu/drm/sun4i/sun4i_backend.c     | 2 +-
 drivers/gpu/drm/sun4i/sun4i_framebuffer.c | 2 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c    | 2 +-
 drivers/gpu/drm/sun4i/sun4i_lvds.c        | 2 +-
 drivers/gpu/drm/sun4i/sun4i_rgb.c         | 4 ++--
 drivers/gpu/drm/sun4i/sun4i_tcon.c        | 2 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c          | 6 +++---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c    | 2 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c    | 2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c       | 2 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c    | 2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c    | 2 +-
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 072ea113e6be..f025534eb30c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -769,7 +769,7 @@ static const struct sunxi_engine_ops sun4i_backend_engine_ops = {
 	.vblank_quirk			= sun4i_backend_vblank_quirk,
 };
 
-static struct regmap_config sun4i_backend_regmap_config = {
+static const struct regmap_config sun4i_backend_regmap_config = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
diff --git a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
index 1568f68f9a9e..6825ef46f43f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
@@ -35,7 +35,7 @@ static const struct drm_mode_config_funcs sun4i_de_mode_config_funcs = {
 	.fb_create		= drm_gem_fb_create,
 };
 
-static struct drm_mode_config_helper_funcs sun4i_de_mode_config_helpers = {
+static const struct drm_mode_config_helper_funcs sun4i_de_mode_config_helpers = {
 	.atomic_commit_tail	= drm_atomic_helper_commit_tail_rpm,
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index ec2a032e07b9..b51cc685c13a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -545,7 +545,7 @@ int sun4i_frontend_enable(struct sun4i_frontend *frontend)
 }
 EXPORT_SYMBOL(sun4i_frontend_enable);
 
-static struct regmap_config sun4i_frontend_regmap_config = {
+static const struct regmap_config sun4i_frontend_regmap_config = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
diff --git a/drivers/gpu/drm/sun4i/sun4i_lvds.c b/drivers/gpu/drm/sun4i/sun4i_lvds.c
index ffda3184aa12..ea430b0ab0f3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_lvds.c
+++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
@@ -47,7 +47,7 @@ static int sun4i_lvds_get_modes(struct drm_connector *connector)
 	return drm_panel_get_modes(lvds->panel, connector);
 }
 
-static struct drm_connector_helper_funcs sun4i_lvds_con_helper_funcs = {
+static const struct drm_connector_helper_funcs sun4i_lvds_con_helper_funcs = {
 	.get_modes	= sun4i_lvds_get_modes,
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index 5a7d43939ae6..20a49c1963cc 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -138,7 +138,7 @@ static enum drm_mode_status sun4i_rgb_mode_valid(struct drm_encoder *crtc,
 	return MODE_OK;
 }
 
-static struct drm_connector_helper_funcs sun4i_rgb_con_helper_funcs = {
+static const struct drm_connector_helper_funcs sun4i_rgb_con_helper_funcs = {
 	.get_modes	= sun4i_rgb_get_modes,
 };
 
@@ -183,7 +183,7 @@ static void sun4i_rgb_encoder_disable(struct drm_encoder *encoder)
 	}
 }
 
-static struct drm_encoder_helper_funcs sun4i_rgb_enc_helper_funcs = {
+static const struct drm_encoder_helper_funcs sun4i_rgb_enc_helper_funcs = {
 	.disable	= sun4i_rgb_encoder_disable,
 	.enable		= sun4i_rgb_encoder_enable,
 	.mode_valid	= sun4i_rgb_mode_valid,
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 359b56e43b83..ae177b2bcf4b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -825,7 +825,7 @@ static int sun4i_tcon_init_irq(struct device *dev,
 	return 0;
 }
 
-static struct regmap_config sun4i_tcon_regmap_config = {
+static const struct regmap_config sun4i_tcon_regmap_config = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 63f4428ac3bf..cb91bc11a0c7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -468,7 +468,7 @@ static void sun4i_tv_mode_set(struct drm_encoder *encoder,
 	regmap_write(tv->regs, SUN4I_TVE_SLAVE_REG, 0);
 }
 
-static struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
+static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
 	.disable	= sun4i_tv_disable,
 	.enable		= sun4i_tv_enable,
 	.mode_set	= sun4i_tv_mode_set,
@@ -504,7 +504,7 @@ static int sun4i_tv_comp_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
-static struct drm_connector_helper_funcs sun4i_tv_comp_connector_helper_funcs = {
+static const struct drm_connector_helper_funcs sun4i_tv_comp_connector_helper_funcs = {
 	.get_modes	= sun4i_tv_comp_get_modes,
 	.mode_valid	= sun4i_tv_comp_mode_valid,
 };
@@ -523,7 +523,7 @@ static const struct drm_connector_funcs sun4i_tv_comp_connector_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
-static struct regmap_config sun4i_tv_regmap_config = {
+static const struct regmap_config sun4i_tv_regmap_config = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index aa67cb037e9d..76822c6902c0 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -820,7 +820,7 @@ static int sun6i_dsi_get_modes(struct drm_connector *connector)
 	return drm_panel_get_modes(dsi->panel, connector);
 }
 
-static struct drm_connector_helper_funcs sun6i_dsi_connector_helper_funcs = {
+static const struct drm_connector_helper_funcs sun6i_dsi_connector_helper_funcs = {
 	.get_modes	= sun6i_dsi_get_modes,
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 156d00e5165b..35c2133724e2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -534,7 +534,7 @@ void sun8i_hdmi_phy_set_ops(struct sun8i_hdmi_phy *phy,
 	}
 }
 
-static struct regmap_config sun8i_hdmi_phy_regmap_config = {
+static const struct regmap_config sun8i_hdmi_phy_regmap_config = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index cc4fb916318f..4b59806b30df 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -303,7 +303,7 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
 	.layers_init	= sun8i_layers_init,
 };
 
-static struct regmap_config sun8i_mixer_regmap_config = {
+static const struct regmap_config sun8i_mixer_regmap_config = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 54f937a7d5e7..816ad4ce8996 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -298,7 +298,7 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 			      true, zpos, old_zpos);
 }
 
-static struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs = {
+static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs = {
 	.prepare_fb	= drm_gem_fb_prepare_fb,
 	.atomic_check	= sun8i_ui_layer_atomic_check,
 	.atomic_disable	= sun8i_ui_layer_atomic_disable,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 22c8c5375d0d..a360697a4a4a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -401,7 +401,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 			      true, zpos, old_zpos);
 }
 
-static struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
+static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
 	.prepare_fb	= drm_gem_fb_prepare_fb,
 	.atomic_check	= sun8i_vi_layer_atomic_check,
 	.atomic_disable	= sun8i_vi_layer_atomic_disable,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
