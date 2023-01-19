Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C9D674F07
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C32610EA69;
	Fri, 20 Jan 2023 08:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFC910E20D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 18:49:25 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id f34so4531595lfv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 10:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KjYSoLcwf7EqtitvVcOTllqc2UQ4a0rkK6OglvdaZqI=;
 b=XakzkJo1d7N4N7DkKi9mHmh1lucNCw3Ur4cZb3/FtRcHSG6kK0fg0VmQOrJjpSHFbv
 gDAhsVrSB2wFhL/Cj3BWGcCRfK14n75kTvu9o0WuA1p27Oy/w3S6l9tL0T43D7CJhT6i
 lmclIQ9IsbKkFAN2ITAdZzY0PPUfj2rlMGatAY4F6ZCgiSgnvEuwOUwVcI9zhTp0rJvt
 QBVqK+Inm1tiZiPBixukk1vATXLjsC+OBU4UHo5XcNQf3OC7VGNkTHAghBYjjIrDWQxx
 /jGLUhDmQ21wZDDTuA02kDGvpzPBhoSVcttWo9j9OvA+VQ6JAoIn91fADMZTvgJ9c/wd
 ta+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KjYSoLcwf7EqtitvVcOTllqc2UQ4a0rkK6OglvdaZqI=;
 b=a8tPF3AH+RogmmgEdNqv6Lmn4qc9lggOWBVCklV8I6Xmecq1rW3jXurn7oWHBy2sEZ
 NtgSdbfNFsL+gdAqOJo8hW34acDiCaPl6NiqzKfeW3GB5Ty7wO3S6rx4KvdSaZKUVnBp
 zu2Sg6O/WMCgQqobt+5F/IK3hDQggMgfQ+r/qSpWqqer38PLUbEUvNmSaTCB2ZJxiTQH
 dRvVqLJmVZiVeEU8KdBWzrdP/ectCOZrngyb4gm1h1s3YSxknyqptbvBNEoaxdlGGkO6
 1ij6F/K7l/BOev3uyggw91FJUOVk7wNZ3P43KqEzZWUvkBozKCza/M3gtR+3jc4OOqD8
 EYQg==
X-Gm-Message-State: AFqh2krh8z2SNTiimg0HZG/H5aGkCqDXTLRTENbp7qGIlu4Hppu4hxER
 Y8ie1yJwIRZ0VVahHsGWDh4=
X-Google-Smtp-Source: AMrXdXv1pJP5S8AZ+yVAIwUdPkFLt0kCm3GHTmVeWhx46YujL7HwAwoo4UkMmOKA8DqpaG1bcv0ZzQ==
X-Received: by 2002:a05:6512:12d1:b0:4ca:5013:b0e7 with SMTP id
 p17-20020a05651212d100b004ca5013b0e7mr4114837lfg.59.1674154163242; 
 Thu, 19 Jan 2023 10:49:23 -0800 (PST)
Received: from U19.ag.local (static.187.76.181.135.clients.your-server.de.
 [135.181.76.187]) by smtp.gmail.com with ESMTPSA id
 b31-20020a0565120b9f00b004d30752a561sm2112737lfv.298.2023.01.19.10.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:49:22 -0800 (PST)
From: Alibek Omarov <a1ba.omarov@gmail.com>
To: 
Subject: [PATCH 1/3] drm/rockchip: lvds: add rk3568 support
Date: Thu, 19 Jan 2023 21:48:03 +0300
Message-Id: <20230119184807.171132-2-a1ba.omarov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119184807.171132-1-a1ba.omarov@gmail.com>
References: <20230119184807.171132-1-a1ba.omarov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Jan 2023 08:07:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, Peter Geis <pgwipeout@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 alexander.sverdlin@siemens.com, linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, macromorgan@hotmail.com,
 a1ba.omarov@gmail.com, linux-arm-kernel@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One of the ports of RK3568 can be configured as LVDS, re-using the DSI DPHY

Signed-off-by: Alibek Omarov <a1ba.omarov@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 144 +++++++++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_lvds.h |  10 ++
 2 files changed, 147 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 68f6ebb33460..83c60240af85 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -433,6 +433,90 @@ static void px30_lvds_encoder_disable(struct drm_encoder *encoder)
 	drm_panel_unprepare(lvds->panel);
 }
 
+static int rk3568_lvds_poweron(struct rockchip_lvds *lvds)
+{
+	int ret;
+
+	ret = clk_enable(lvds->pclk);
+	if (ret < 0) {
+		DRM_DEV_ERROR(lvds->dev, "failed to enable lvds pclk %d\n", ret);
+		return ret;
+	}
+
+	ret = pm_runtime_get_sync(lvds->dev);
+	if (ret < 0) {
+		DRM_DEV_ERROR(lvds->dev, "failed to get pm runtime: %d\n", ret);
+		clk_disable(lvds->pclk);
+		return ret;
+	}
+
+	/* Enable LVDS mode */
+	return regmap_update_bits(lvds->grf, RK3568_GRF_VO_CON2,
+				  RK3568_LVDS0_MODE_EN(1),
+				  RK3568_LVDS0_MODE_EN(1));
+}
+
+static void rk3568_lvds_poweroff(struct rockchip_lvds *lvds)
+{
+	regmap_update_bits(lvds->grf, RK3568_GRF_VO_CON2,
+			   RK3568_LVDS0_MODE_EN(1) | RK3568_LVDS0_P2S_EN(1),
+			   RK3568_LVDS0_MODE_EN(0) | RK3568_LVDS0_P2S_EN(0));
+
+	pm_runtime_put(lvds->dev);
+	clk_disable(lvds->pclk);
+}
+
+static int rk3568_lvds_grf_config(struct drm_encoder *encoder,
+				struct drm_display_mode *mode)
+{
+	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
+
+	if (lvds->output != DISPLAY_OUTPUT_LVDS) {
+		DRM_DEV_ERROR(lvds->dev, "Unsupported display output %d\n",
+			      lvds->output);
+		return -EINVAL;
+	}
+
+	/* Set format */
+	return regmap_update_bits(lvds->grf, RK3568_GRF_VO_CON0,
+				  RK3568_LVDS0_SELECT(3),
+				  RK3568_LVDS0_SELECT(lvds->format));
+}
+
+static void rk3568_lvds_encoder_enable(struct drm_encoder *encoder)
+{
+	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
+	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
+	int ret;
+
+	drm_panel_prepare(lvds->panel);
+
+	ret = rk3568_lvds_poweron(lvds);
+	if (ret) {
+		DRM_DEV_ERROR(lvds->dev, "failed to power on LVDS: %d\n", ret);
+		drm_panel_unprepare(lvds->panel);
+		return;
+	}
+
+	ret = rk3568_lvds_grf_config(encoder, mode);
+	if (ret) {
+		DRM_DEV_ERROR(lvds->dev, "failed to configure LVDS: %d\n", ret);
+		drm_panel_unprepare(lvds->panel);
+		return;
+	}
+
+	drm_panel_enable(lvds->panel);
+}
+
+static void rk3568_lvds_encoder_disable(struct drm_encoder *encoder)
+{
+	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
+
+	drm_panel_disable(lvds->panel);
+	rk3568_lvds_poweroff(lvds);
+	drm_panel_unprepare(lvds->panel);
+}
+
 static const
 struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
 	.enable = rk3288_lvds_encoder_enable,
@@ -447,6 +531,13 @@ struct drm_encoder_helper_funcs px30_lvds_encoder_helper_funcs = {
 	.atomic_check = rockchip_lvds_encoder_atomic_check,
 };
 
+static const
+struct drm_encoder_helper_funcs rk3568_lvds_encoder_helper_funcs = {
+	.enable = rk3568_lvds_encoder_enable,
+	.disable = rk3568_lvds_encoder_disable,
+	.atomic_check = rockchip_lvds_encoder_atomic_check,
+};
+
 static int rk3288_lvds_probe(struct platform_device *pdev,
 			     struct rockchip_lvds *lvds)
 {
@@ -491,6 +582,26 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
 	return 0;
 }
 
+static int rockchip_lvds_phy_probe(struct platform_device *pdev,
+				   struct rockchip_lvds *lvds)
+{
+	int ret;
+
+	lvds->dphy = devm_phy_get(&pdev->dev, "dphy");
+	if (IS_ERR(lvds->dphy))
+		return PTR_ERR(lvds->dphy);
+
+	ret = phy_init(lvds->dphy);
+	if (ret)
+		return ret;
+
+	ret = phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
+	if (ret)
+		return ret;
+
+	return phy_power_on(lvds->dphy);
+}
+
 static int px30_lvds_probe(struct platform_device *pdev,
 			   struct rockchip_lvds *lvds)
 {
@@ -503,20 +614,28 @@ static int px30_lvds_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	/* PHY */
-	lvds->dphy = devm_phy_get(&pdev->dev, "dphy");
-	if (IS_ERR(lvds->dphy))
-		return PTR_ERR(lvds->dphy);
+	return rockchip_lvds_phy_probe(pdev, lvds);
+}
 
-	ret = phy_init(lvds->dphy);
+static int rk3568_lvds_probe(struct platform_device *pdev,
+			     struct rockchip_lvds *lvds)
+{
+	int ret;
+
+	ret = regmap_update_bits(lvds->grf, RK3568_GRF_VO_CON0,
+				  RK3568_LVDS0_MSBSEL(1),
+				  RK3568_LVDS0_MSBSEL(1));
 	if (ret)
 		return ret;
 
-	ret = phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
+	ret = regmap_update_bits(lvds->grf, RK3568_GRF_VO_CON2,
+				 RK3568_LVDS0_P2S_EN(1),
+				 RK3568_LVDS0_P2S_EN(1));
+
 	if (ret)
 		return ret;
 
-	return phy_power_on(lvds->dphy);
+	return rockchip_lvds_phy_probe(pdev, lvds);
 }
 
 static const struct rockchip_lvds_soc_data rk3288_lvds_data = {
@@ -529,6 +648,11 @@ static const struct rockchip_lvds_soc_data px30_lvds_data = {
 	.helper_funcs = &px30_lvds_encoder_helper_funcs,
 };
 
+static const struct rockchip_lvds_soc_data rk3568_lvds_data = {
+	.probe = rk3568_lvds_probe,
+	.helper_funcs = &rk3568_lvds_encoder_helper_funcs,
+};
+
 static const struct of_device_id rockchip_lvds_dt_ids[] = {
 	{
 		.compatible = "rockchip,rk3288-lvds",
@@ -538,6 +662,10 @@ static const struct of_device_id rockchip_lvds_dt_ids[] = {
 		.compatible = "rockchip,px30-lvds",
 		.data = &px30_lvds_data
 	},
+	{
+		.compatible = "rockchip,rk3568-lvds",
+		.data = &rk3568_lvds_data
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, rockchip_lvds_dt_ids);
@@ -612,6 +740,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 	encoder = &lvds->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dev->of_node);
+	rockchip_drm_encoder_set_crtc_endpoint_id(&lvds->encoder,
+						  dev->of_node, 0, 0);
 
 	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_LVDS);
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.h b/drivers/gpu/drm/rockchip/rockchip_lvds.h
index 4ce967d23813..57decb33f779 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.h
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.h
@@ -120,4 +120,14 @@
 #define   PX30_LVDS_P2S_EN(val)			HIWORD_UPDATE(val,  6,  6)
 #define   PX30_LVDS_VOP_SEL(val)		HIWORD_UPDATE(val,  1,  1)
 
+#define RK3568_GRF_VO_CON0			0x0360
+#define   RK3568_LVDS0_SELECT(val)		HIWORD_UPDATE(val,  5,  4)
+#define   RK3568_LVDS0_MSBSEL(val)		HIWORD_UPDATE(val,  3,  3)
+
+#define RK3568_GRF_VO_CON2			0x0368
+#define   RK3568_LVDS0_DCLK_INV_SEL(val)	HIWORD_UPDATE(val,  9,  9)
+#define   RK3568_LVDS0_DCLK_DIV2_SEL(val)	HIWORD_UPDATE(val,  8,  8)
+#define   RK3568_LVDS0_MODE_EN(val)		HIWORD_UPDATE(val,  1,  1)
+#define   RK3568_LVDS0_P2S_EN(val)		HIWORD_UPDATE(val,  0,  0)
+
 #endif /* _ROCKCHIP_LVDS_ */
-- 
2.34.1

