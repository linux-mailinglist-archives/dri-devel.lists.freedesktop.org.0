Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEBA5AF30E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3A910E717;
	Tue,  6 Sep 2022 17:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9608910E0D7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 17:48:32 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 c9-20020a4a4f09000000b0044e1294a737so2050696oob.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 10:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Z861jG7BMhx/UqAm+BGR/UQTJzU7P1PboLjcZWY5WRs=;
 b=LqcTc00u+oeRZejpL1N3HqNcfAJDrWhIBRQ2xgjGMPx6CmMtjgbLbbeJm+Pj/0lqWa
 1bm/L8YEZdDIKdB2QCxPD8HzVkB8cD687s8croIEOkwnf2VonIynKgO2BTriZsqRWeUv
 FhvbQnrSLzRnjH68kAiZRHm0h3tkV+E0niHAQYWwWt79ukPNrTRsZv66suR5DCrRB6p0
 YVkFfeB/tcmYUMgz7UCb9ukJsFrCg8LZeSq/ulRBC/VZlKQdYVjPHkP6+nrUTVrh8Fxz
 Ah7tTNV2DV6FFVqz59tjTeDQTz2QHHDMcdn0MsFBSjEPpSot4DlokBofMQNW/LBLgSn7
 GT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Z861jG7BMhx/UqAm+BGR/UQTJzU7P1PboLjcZWY5WRs=;
 b=MRXf2xEClNKSi37CrMgfgXaU53hoEq5HEDA6iafke0C4e5e+yhIcRZAqjIjrElA5vD
 GsDzezZzShQWayWB2oMb0ltdHt2JkREsbLe3ln+e2eg9BySJ6M6sqco0rCUKcu1fERJo
 Rf2xu8NgPD65v6VnxaOzgQLpld6KBmxLDOZI7k0Mp1y24AXhqrVoe0uS5cyzZvLYk2Dm
 8ImAJsVWA+alGO9NrGcXHWZ2jnjPQ+V6G7kn/sNoQNBR0ll7+ctB4RBwv6UCS5YZEOHF
 JF3zitZUMZP05q/k3mhFBcSiMSXNhkQ8cTUiQ9bCombo90FopF4/H5YV1koYzdVl8NIH
 NDWA==
X-Gm-Message-State: ACgBeo326sylhZmeNNw+sVNgMXw4hNA7DsevQVDCv5l3ZQhqy9f2SVnG
 qEVZqI9Xzr6vOeIs7dA89U8A5OJH1K0=
X-Google-Smtp-Source: AA6agR5s+SV66YlDAHlmbOWm3Y9nLF+z1E5cig2we8mv7ZwsFpF1I68ZOTDKjho4zGBrFodk5eHsMw==
X-Received: by 2002:a4a:dcc2:0:b0:449:129e:17cd with SMTP id
 h2-20020a4adcc2000000b00449129e17cdmr18648183oou.98.1662486511693; 
 Tue, 06 Sep 2022 10:48:31 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 o186-20020aca41c3000000b00344afa2b08bsm5568065oia.26.2022.09.06.10.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:48:31 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH v2 3/5] drm/rockchip: dsi: add rk3568 support
Date: Tue,  6 Sep 2022 12:48:21 -0500
Message-Id: <20220906174823.28561-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906174823.28561-1-macroalpha82@gmail.com>
References: <20220906174823.28561-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, s.hauer@pengutronix.de,
 Chris Morgan <macromorgan@hotmail.com>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, pgwipeout@gmail.com, linux-phy@lists.infradead.org,
 cl@rock-chips.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the compatible and GRF definitions for the RK3568 soc.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 51 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 110e83aad9bb..bf6948125b84 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -179,6 +179,23 @@
 #define RK3399_TXRX_SRC_SEL_ISP0	BIT(4)
 #define RK3399_TXRX_TURNREQUEST		GENMASK(3, 0)
 
+#define RK3568_GRF_VO_CON2		0x0368
+#define RK3568_DSI0_SKEWCALHS		(0x1f << 11)
+#define RK3568_DSI0_FORCETXSTOPMODE	(0xf << 4)
+#define RK3568_DSI0_TURNDISABLE		BIT(2)
+#define RK3568_DSI0_FORCERXMODE		BIT(0)
+
+/*
+ * Note these registers do not appear in the datasheet, they are
+ * however present in the BSP driver which is where these values
+ * come from. Name GRF_VO_CON3 is assumed.
+ */
+#define RK3568_GRF_VO_CON3		0x36c
+#define RK3568_DSI1_SKEWCALHS		(0x1f << 11)
+#define RK3568_DSI1_FORCETXSTOPMODE	(0xf << 4)
+#define RK3568_DSI1_TURNDISABLE		BIT(2)
+#define RK3568_DSI1_FORCERXMODE		BIT(0)
+
 #define HIWORD_UPDATE(val, mask)	(val | (mask) << 16)
 
 enum {
@@ -735,8 +752,9 @@ static void dw_mipi_dsi_rockchip_config(struct dw_mipi_dsi_rockchip *dsi)
 static void dw_mipi_dsi_rockchip_set_lcdsel(struct dw_mipi_dsi_rockchip *dsi,
 					    int mux)
 {
-	regmap_write(dsi->grf_regmap, dsi->cdata->lcdsel_grf_reg,
-		mux ? dsi->cdata->lcdsel_lit : dsi->cdata->lcdsel_big);
+	if (dsi->cdata->lcdsel_grf_reg < 0)
+		regmap_write(dsi->grf_regmap, dsi->cdata->lcdsel_grf_reg,
+			mux ? dsi->cdata->lcdsel_lit : dsi->cdata->lcdsel_big);
 }
 
 static int
@@ -963,6 +981,8 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
 		DRM_DEV_ERROR(dev, "Failed to create drm encoder\n");
 		goto out_pll_clk;
 	}
+	rockchip_drm_encoder_set_crtc_endpoint_id(&dsi->encoder,
+						  dev->of_node, 0, 0);
 
 	ret = dw_mipi_dsi_bind(dsi->dmd, &dsi->encoder.encoder);
 	if (ret) {
@@ -1612,6 +1632,30 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
+	{
+		.reg = 0xfe060000,
+		.lcdsel_grf_reg = -1,
+		.lanecfg1_grf_reg = RK3568_GRF_VO_CON2,
+		.lanecfg1 = HIWORD_UPDATE(0, RK3568_DSI0_SKEWCALHS |
+					  RK3568_DSI0_FORCETXSTOPMODE |
+					  RK3568_DSI0_TURNDISABLE |
+					  RK3568_DSI0_FORCERXMODE),
+		.max_data_lanes = 4,
+	},
+	{
+		.reg = 0xfe070000,
+		.lcdsel_grf_reg = -1,
+		.lanecfg1_grf_reg = RK3568_GRF_VO_CON3,
+		.lanecfg1 = HIWORD_UPDATE(0, RK3568_DSI1_SKEWCALHS |
+					  RK3568_DSI1_FORCETXSTOPMODE |
+					  RK3568_DSI1_TURNDISABLE |
+					  RK3568_DSI1_FORCERXMODE),
+		.max_data_lanes = 4,
+	},
+	{ /* sentinel */ }
+};
+
 static const struct of_device_id dw_mipi_dsi_rockchip_dt_ids[] = {
 	{
 	 .compatible = "rockchip,px30-mipi-dsi",
@@ -1622,6 +1666,9 @@ static const struct of_device_id dw_mipi_dsi_rockchip_dt_ids[] = {
 	}, {
 	 .compatible = "rockchip,rk3399-mipi-dsi",
 	 .data = &rk3399_chip_data,
+	}, {
+	 .compatible = "rockchip,rk3568-mipi-dsi",
+	 .data = &rk3568_chip_data,
 	},
 	{ /* sentinel */ }
 };
-- 
2.25.1

