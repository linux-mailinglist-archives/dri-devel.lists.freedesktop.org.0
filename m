Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C3A591246
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 16:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCD512B550;
	Fri, 12 Aug 2022 14:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C7812A182
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 14:32:55 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 j66-20020a9d17c8000000b00636b0377a8cso683042otj.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 07:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Z861jG7BMhx/UqAm+BGR/UQTJzU7P1PboLjcZWY5WRs=;
 b=RmPB7YB/RZJpHwqeBcu+PkPPyHv7N2fInWOSLc8+7HagSm77fxUwDXAW0f0o2rSC5e
 uMUOrtvDz9qZbqS2FKvcg5GShPRqkYE2dAzWbB2FhH5W3A3jWInUpnNL3o/VsUl+11hU
 tpheMZ00CQT538nzsmUypQNSB3hbugUodOpCK4LRo5EeXiCahjTnrwR3YwmX3ENuzag+
 o9nuM4EhSzLyenCF+fIYLw3KbuolaZDk5xguMKtB95N5t/ipvYCyORoK3ViFfHTMi9eU
 iwdZ/j5ZBbseVA5vJ7ieQp86G4c8ikWbFvXUJARByDMTEnPAP/LdoEEFkdnRAq40ZfuS
 goBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Z861jG7BMhx/UqAm+BGR/UQTJzU7P1PboLjcZWY5WRs=;
 b=YdGcQePjcXtECRnd+huCj8xnrkO6RU+FsDDUpgJ8/iMwkaDPQQp7VkODcmdL8IY0YQ
 h3mg4wUhg2WnUxTHUJm3C9L7U7JhKjCEf1aSJTGK6oICaZdGoV2AtpYzu/2/uq9qeMcR
 vfVODvVSm2Wi8xSaPdP6i8rLNno2i1lDA4Eut/+U2V26x0XC1pyNGPrbFyiJHtjI6hgr
 dKe761QJqPnxTV9fmfYtLtLKfIA3dN1z45nvNuYlz1i9DQbqNylJvwnrTptxReAFgE47
 fDenN9sxeQG8BNjT7E7iSr/KWsjPrmmiAFy/3qDX7Q5kECF3FRBDMYrPtnAoXd3fkHGK
 BPGA==
X-Gm-Message-State: ACgBeo1IdFgUqzptmNtQRX5xxbO6flRZ12X2Lkp9Tn06TeDCEeVlZ+Xz
 Tio9WvcX0i9rnhncQT+Riiw=
X-Google-Smtp-Source: AA6agR7QtAT5mXjQhzxM/chs9icZWvO85teHKtiA9oDENOvnbOuz9aOqNNNFrhRSL7CkTGWm2BTR9A==
X-Received: by 2002:a9d:2cb:0:b0:636:dd6a:b3e6 with SMTP id
 69-20020a9d02cb000000b00636dd6ab3e6mr1455445otl.254.1660314774879; 
 Fri, 12 Aug 2022 07:32:54 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 n28-20020a0568080a1c00b003436fa2c23bsm282879oij.7.2022.08.12.07.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 07:32:54 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [RFC 3/4] drm/rockchip: dsi: add rk3568 support
Date: Fri, 12 Aug 2022 09:32:46 -0500
Message-Id: <20220812143247.25825-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812143247.25825-1-macroalpha82@gmail.com>
References: <20220812143247.25825-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 Chris Morgan <macromorgan@hotmail.com>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org
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

