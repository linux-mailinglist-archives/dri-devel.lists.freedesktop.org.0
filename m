Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C02AA3D803
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 12:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C310110E943;
	Thu, 20 Feb 2025 11:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rY63Rqul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF57010E94E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 11:15:11 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54626a71b40so797786e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 03:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740050110; x=1740654910; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B+FSEAZwM3JMz4x3mQU5rxG2ANMYWACSorMBKNolQMw=;
 b=rY63RqulXXLxUzs6DWAW7Pjis9X7Mi32HkSu1M1Lt/91Oo7gWKEE2mJR5nWkVpky1E
 tnHSSCMjdX09y8Eorxc+apRJS96SnxBfetNc+pBAw0KGfSHgm08Q5YGmJ48iqoD296Ne
 /RunYKu1oODPo47bihL7ITQIxoChGcYXHBrFSaGxwe172UNei4mTdRPgX5oY5JclZpqb
 STsU5AT8+CqCNDUE7tpNI7UyL576EX0svpp8tk0HVcIjy5/CY38uqlj77GkQvrkl5Vvq
 fo96t3x8dGlXzlbVDh0Q4GDaV7olmF5qUloSPmLENyOmCH4U1O3JVi1p9ePiRknmRgfh
 uzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740050110; x=1740654910;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+FSEAZwM3JMz4x3mQU5rxG2ANMYWACSorMBKNolQMw=;
 b=pOQ3pBO/nhU6fpuur1lUgATOMRYA7enZxJtXyfcNc+KxdJHYtnbSxpcl7+hL6QyxuI
 7FbevGtpVVTgu8q/uVjlRCmwba3W2PlEaZ0RY6kn3WNq2zlvI1GEjcQQ+SkXuEyIMQxt
 YW6CRJ62+vajb9K12LAY+n2g2P4wXBk4ggGCgS6SY5vRAGLiA8RvEARvPnKvoWRHnuqw
 Wcf14OOe0cUjWl5bnhW8sF/RyrW1+ssgbGGBA36bpKGWZ/WPYe4bTbpRzw6IYPttNibd
 qOPmfaMQ027XkUnCsSYjXFaSBnXEiGPU11a4y5wqf5DA044nO+FxYfuU1QlKEinq+69R
 kQlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX8KgPaolY43W8zaNv5lzg90Ru7dDN3iwSd2wr9bodHc4W23cCDH7keXxJreTLNAyEX516/o9xK/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQIaX9Sr18j8IpI+6tH75fc8vH46PYQlUA9s9IfU9PaGCqDfoW
 jdo5JWBWbehD1nqMlFI2GJ4y+0qqtsGFKBO5qdq1nRZthUWM+PFKdv4WAcMzN0E=
X-Gm-Gg: ASbGncsBkb+22GR7Vh61zbAOt+IHwlyUVkiNZQLMlOh4DaLBF6bPpGxbtzD3jO6nR3Z
 uBvBuMG5i3+cXn1UzCAYFn7yvOxtiGDTlYzzHk4YpgJrl6YQ+ltyHiaYEUxO705q/UWDkUVtLDd
 a2SU06DjpXh5diVKmtTXwPVaQOh4vQnbkKxG+HmDtj3ov0i2u+nmW/7Flw40uCyjjOKTfGlqmv/
 fgNb6FzXS4D3zsF4J57WJIaLkGP9TqcTXhyKKhgWBG1aP/T8nvXEwrctsnz79F4qT12uadLa+zi
 CIv2GoRBtGp1tfrG1OLU0tk=
X-Google-Smtp-Source: AGHT+IFLmuofJZAPPdn/voaRPjKCsN8RM7jaAav41hPT/JRZmj1CezRyZIpCTJVK79XnKgaiPolXoQ==
X-Received: by 2002:a05:6512:304d:b0:546:3052:4202 with SMTP id
 2adb3069b0e04-546305242bamr2422240e87.27.1740050109865; 
 Thu, 20 Feb 2025 03:15:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545297856c6sm2056164e87.142.2025.02.20.03.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 03:15:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 13:14:48 +0200
Subject: [PATCH v2 6/7] drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-fd-mdp4-lvds-v2-6-15afe5578a31@linaro.org>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10669;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=90eJnitNHrEK/bHG/5dquibI/K0ZaJ2fO88HjDQ4Cno=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntw6rtOhBVgnhA1cDBrmo3nWNRXGCQYlsACeFE
 SrvA3JYiRaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cOqwAKCRCLPIo+Aiko
 1WB+B/sGNxABjeQAlXGWahE6pllJa60BD2dJK6JoWb6ygju1p7TpDAMrrzrN/Hhu6UpsgF2b0Vp
 xBkGYh5ze/VPFoiEWAJBfAFybO7frnetNtDUDHdAs7pV+QgKYpQ+xBZJMs/AnNAMvm+5UUaQajN
 /6GiFhzpK1zS9XxmXpxo9/eq1D/wK20M0GJPd4ZycQXPsEw7eLxUFwLdBBAtky6eoBWRRrh8q76
 9raK63egGli8/RYgC0hXKk0kKYhQpyP/FmvHJcl/O9KK/2DkclMrwi54uXNTf3chpDvSUevQcZ4
 aB9FW9iG3kZL6VNh67QhnSwTkfVMnBUcmdhCV9CAFBL5DuCM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

LVDS support in MDP4 driver makes use of drm_connector directly. However
LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
them to use drm_panel_bridge/drm_bridge_connector. This allows using
standard interface for the drm_panel and also inserting additional
bridges between encoder and panel.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
 5 files changed, 28 insertions(+), 133 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 5df20cbeafb8bf07c825a1fd72719d5a56c38613..7a2ada6e2d74a902879e4f12a78ed475e5209ec2 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -48,7 +48,6 @@ msm-display-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_dsi_encoder.o \
 	disp/mdp4/mdp4_dtv_encoder.o \
 	disp/mdp4/mdp4_lcdc_encoder.o \
-	disp/mdp4/mdp4_lvds_connector.o \
 	disp/mdp4/mdp4_lvds_pll.o \
 	disp/mdp4/mdp4_irq.o \
 	disp/mdp4/mdp4_kms.o \
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 689e210660a5218ed1e2d116073723215af5a187..93c9411eb422bc67b7fedb5ffce4c330310b520f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -6,6 +6,8 @@
 
 #include <linux/delay.h>
 
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_vblank.h>
 
 #include "msm_drv.h"
@@ -189,7 +191,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
-	struct device_node *panel_node;
+	struct drm_bridge *next_bridge;
 	int dsi_id;
 	int ret;
 
@@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		 * bail out early if there is no panel node (no need to
 		 * initialize LCDC encoder and LVDS connector)
 		 */
-		panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
-		if (!panel_node)
-			return 0;
+		next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
+		if (IS_ERR(next_bridge)) {
+			ret = PTR_ERR(next_bridge);
+			if (ret == -ENODEV)
+				return 0;
+			return ret;
+		}
 
-		encoder = mdp4_lcdc_encoder_init(dev, panel_node);
+		encoder = mdp4_lcdc_encoder_init(dev);
 		if (IS_ERR(encoder)) {
 			DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
-			of_node_put(panel_node);
 			return PTR_ERR(encoder);
 		}
 
 		/* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
 		encoder->possible_crtcs = 1 << DMA_P;
 
-		connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
+		ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (ret) {
+			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
+
+			return ret;
+		}
+
+		connector = drm_bridge_connector_init(dev, encoder);
 		if (IS_ERR(connector)) {
 			DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
-			of_node_put(panel_node);
 			return PTR_ERR(connector);
 		}
 
+		ret = drm_connector_attach_encoder(connector, encoder);
+		if (ret) {
+			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
+
+			return ret;
+		}
+
 		break;
 	case DRM_MODE_ENCODER_TMDS:
 		encoder = mdp4_dtv_encoder_init(dev);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index e0380d3b7e0cee99c4c376bf6369887106f44ede..306f5ca8f810aaeecea56e74065933bbffcb67ec 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -191,11 +191,7 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
 
-struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
-		struct device_node *panel_node);
-
-struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
-		struct device_node *panel_node, struct drm_encoder *encoder);
+struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev);
 
 #ifdef CONFIG_DRM_MSM_DSI
 struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index cfcedd8a635cf0297365e845ef415a8f0d553183..a4f3edabefbd06286bfb8fbcd7f8c0a4281e5ef1 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -14,7 +14,6 @@
 
 struct mdp4_lcdc_encoder {
 	struct drm_encoder base;
-	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct clk *lcdc_clk;
 	unsigned long int pixclock;
@@ -262,19 +261,12 @@ static void mdp4_lcdc_encoder_disable(struct drm_encoder *encoder)
 	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
 			to_mdp4_lcdc_encoder(encoder);
 	struct mdp4_kms *mdp4_kms = get_kms(encoder);
-	struct drm_panel *panel;
 
 	if (WARN_ON(!mdp4_lcdc_encoder->enabled))
 		return;
 
 	mdp4_write(mdp4_kms, REG_MDP4_LCDC_ENABLE, 0);
 
-	panel = of_drm_find_panel(mdp4_lcdc_encoder->panel_node);
-	if (!IS_ERR(panel)) {
-		drm_panel_disable(panel);
-		drm_panel_unprepare(panel);
-	}
-
 	/*
 	 * Wait for a vsync so we know the ENABLE=0 latched before
 	 * the (connector) source of the vsync's gets disabled,
@@ -300,7 +292,6 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 			to_mdp4_lcdc_encoder(encoder);
 	unsigned long pc = mdp4_lcdc_encoder->pixclock;
 	struct mdp4_kms *mdp4_kms = get_kms(encoder);
-	struct drm_panel *panel;
 	uint32_t config;
 	int ret;
 
@@ -335,12 +326,6 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	if (ret)
 		DRM_DEV_ERROR(dev->dev, "failed to enable lcdc_clk: %d\n", ret);
 
-	panel = of_drm_find_panel(mdp4_lcdc_encoder->panel_node);
-	if (!IS_ERR(panel)) {
-		drm_panel_prepare(panel);
-		drm_panel_enable(panel);
-	}
-
 	setup_phy(encoder);
 
 	mdp4_write(mdp4_kms, REG_MDP4_LCDC_ENABLE, 1);
@@ -375,8 +360,7 @@ static const struct drm_encoder_helper_funcs mdp4_lcdc_encoder_helper_funcs = {
 };
 
 /* initialize encoder */
-struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
-		struct device_node *panel_node)
+struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev)
 {
 	struct drm_encoder *encoder;
 	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder;
@@ -387,8 +371,6 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 	if (IS_ERR(mdp4_lcdc_encoder))
 		return ERR_CAST(mdp4_lcdc_encoder);
 
-	mdp4_lcdc_encoder->panel_node = panel_node;
-
 	encoder = &mdp4_lcdc_encoder->base;
 
 	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
deleted file mode 100644
index 4755eb13ef79f313d2be088145c8cd2e615226fe..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ /dev/null
@@ -1,100 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2014 Red Hat
- * Author: Rob Clark <robdclark@gmail.com>
- * Author: Vinay Simha <vinaysimha@inforcecomputing.com>
- */
-
-#include "mdp4_kms.h"
-
-struct mdp4_lvds_connector {
-	struct drm_connector base;
-	struct drm_encoder *encoder;
-	struct device_node *panel_node;
-	struct drm_panel *panel;
-};
-#define to_mdp4_lvds_connector(x) container_of(x, struct mdp4_lvds_connector, base)
-
-static enum drm_connector_status mdp4_lvds_connector_detect(
-		struct drm_connector *connector, bool force)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-
-	if (!mdp4_lvds_connector->panel) {
-		mdp4_lvds_connector->panel =
-			of_drm_find_panel(mdp4_lvds_connector->panel_node);
-		if (IS_ERR(mdp4_lvds_connector->panel))
-			mdp4_lvds_connector->panel = NULL;
-	}
-
-	return mdp4_lvds_connector->panel ?
-			connector_status_connected :
-			connector_status_disconnected;
-}
-
-static void mdp4_lvds_connector_destroy(struct drm_connector *connector)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-
-	drm_connector_cleanup(connector);
-
-	kfree(mdp4_lvds_connector);
-}
-
-static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-	struct drm_panel *panel = mdp4_lvds_connector->panel;
-	int ret = 0;
-
-	if (panel)
-		ret = drm_panel_get_modes(panel, connector);
-
-	return ret;
-}
-
-static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
-	.detect = mdp4_lvds_connector_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = mdp4_lvds_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static const struct drm_connector_helper_funcs mdp4_lvds_connector_helper_funcs = {
-	.get_modes = mdp4_lvds_connector_get_modes,
-};
-
-/* initialize connector */
-struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
-		struct device_node *panel_node, struct drm_encoder *encoder)
-{
-	struct drm_connector *connector = NULL;
-	struct mdp4_lvds_connector *mdp4_lvds_connector;
-
-	mdp4_lvds_connector = kzalloc(sizeof(*mdp4_lvds_connector), GFP_KERNEL);
-	if (!mdp4_lvds_connector)
-		return ERR_PTR(-ENOMEM);
-
-	mdp4_lvds_connector->encoder = encoder;
-	mdp4_lvds_connector->panel_node = panel_node;
-
-	connector = &mdp4_lvds_connector->base;
-
-	drm_connector_init(dev, connector, &mdp4_lvds_connector_funcs,
-			DRM_MODE_CONNECTOR_LVDS);
-	drm_connector_helper_add(connector, &mdp4_lvds_connector_helper_funcs);
-
-	connector->polled = 0;
-
-	connector->interlace_allowed = 0;
-	connector->doublescan_allowed = 0;
-
-	drm_connector_attach_encoder(connector, encoder);
-
-	return connector;
-}

-- 
2.39.5

