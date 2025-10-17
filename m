Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897EABEA07D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4396110EC68;
	Fri, 17 Oct 2025 15:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="iVr+wcSN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="M2vdZSh1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C7910EC68
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 15:40:50 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cp8DJ5PL7z9stY;
 Fri, 17 Oct 2025 17:40:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760715648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0w+B/tCledBrlOq6HIpAHqdVg2SY76LtseeOT2jub/4=;
 b=iVr+wcSNqhY0cAOxIloMmCqxI1pOJ6NLEZ4Ekr1cbwb00IZPv19HJPsVM1jGoQ1Xq/36eb
 kyEYsc+tvacqMl2tVv4e6rE55SEuEL1yhF3zZZ7nsNEjA+c8m6XHEFXZWl60KJYhVKfZsh
 Z50hgV2EyM3V4h3s7nzlqiYWbBd0k3mUmLwfB03j50uikADnf/1ux40m1Q/OKoRzhh7cbW
 6j0eVPY3vbs/F12cYiHxpwz7706+76/RToU7NXXiqtQF8IGUBUs8I1V4domUB+DsKgjvzf
 KERWlYXYUr8ovm3WpO580jWATqGlONbZomso9AiENEJXUuoJfj8RIMLkinpKxw==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=M2vdZSh1;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760715646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0w+B/tCledBrlOq6HIpAHqdVg2SY76LtseeOT2jub/4=;
 b=M2vdZSh1ah2zIbwb5jDUsDqLWG3Jj8lJ30k26oXZWEqPg0TCRJnst1D3GrdBFpgCd0plds
 8a7rghvolSpA2X2nLu6XEv/GDyMHGt/l+0OSvLjOeLT0gsfrEE1S7E4sJHtqmT2CTYd13t
 qSAlTGKLl2/85Te8WeNTr4hJ4JDLGj/6RQpEVmV48BN1hRccpiZemMGkiuNipSmrKxhT4o
 Tc6vT+NvfEzG9wIxu2oNrvcpzONVm0Ova/fcseLkPaeT70YEcEAmCNWwZIexXAVZ99O5/e
 xQph+CDk4t+aHxmuFr1IRP+G7VFeo5i9Sfry1clEYYvktMXPBWlPb2dp/GC+HA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH] drm/bridge: fsl-ldb: Parse register offsets from DT
Date: Fri, 17 Oct 2025 17:39:33 +0200
Message-ID: <20251017154029.105099-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 03a1ed152bce17d94f4
X-MBO-RS-META: pccptyfowt41qqwww3cqkzb3ibd7zxtd
X-Rspamd-Queue-Id: 4cp8DJ5PL7z9stY
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

The DT binding for this bridge describe register offsets for the LDB,
parse the register offsets from DT instead of hard-coding them in the
driver. No functional change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 42 ++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bce..c54caea0b63fc 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -61,24 +61,16 @@ enum fsl_ldb_devtype {
 };
 
 struct fsl_ldb_devdata {
-	u32 ldb_ctrl;
-	u32 lvds_ctrl;
 	bool lvds_en_bit;
 	bool single_ctrl_reg;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 	[IMX6SX_LDB] = {
-		.ldb_ctrl = 0x18,
 		.single_ctrl_reg = true,
 	},
-	[IMX8MP_LDB] = {
-		.ldb_ctrl = 0x5c,
-		.lvds_ctrl = 0x128,
-	},
+	[IMX8MP_LDB] = { },
 	[IMX93_LDB] = {
-		.ldb_ctrl = 0x20,
-		.lvds_ctrl = 0x24,
 		.lvds_en_bit = true,
 	},
 };
@@ -90,6 +82,8 @@ struct fsl_ldb {
 	struct clk *clk;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
+	u32 ldb_ctrl;
+	u32 lvds_ctrl;
 	bool ch0_enabled;
 	bool ch1_enabled;
 };
@@ -204,7 +198,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 		reg |=	(fsl_ldb->ch0_enabled ? LDB_CTRL_DI0_VSYNC_POLARITY : 0) |
 			(fsl_ldb->ch1_enabled ? LDB_CTRL_DI1_VSYNC_POLARITY : 0);
 
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, reg);
 
 	if (fsl_ldb->devdata->single_ctrl_reg)
 		return;
@@ -212,7 +206,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	/* Program LVDS_CTRL */
 	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
 	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
 
 	/* Wait for VBG to stabilize. */
 	usleep_range(15, 20);
@@ -220,7 +214,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	reg |=	(fsl_ldb->ch0_enabled ? LVDS_CTRL_CH0_EN : 0) |
 		(fsl_ldb->ch1_enabled ? LVDS_CTRL_CH1_EN : 0);
 
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
 }
 
 static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
@@ -231,12 +225,12 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
 	/* Stop channel(s). */
 	if (fsl_ldb->devdata->lvds_en_bit)
 		/* Set LVDS_CTRL_LVDS_EN bit to disable. */
-		regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl,
+		regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl,
 			     LVDS_CTRL_LVDS_EN);
 	else
 		if (!fsl_ldb->devdata->single_ctrl_reg)
-			regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
+			regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, 0);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, 0);
 
 	clk_disable_unprepare(fsl_ldb->clk);
 }
@@ -296,7 +290,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	struct device_node *remote1, *remote2;
 	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
-	int dual_link;
+	int dual_link, idx, ret;
 
 	fsl_ldb = devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &funcs);
 	if (IS_ERR(fsl_ldb))
@@ -309,6 +303,22 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	fsl_ldb->dev = &pdev->dev;
 	fsl_ldb->bridge.of_node = dev->of_node;
 
+	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
+	if (idx < 0)
+		return idx;
+
+	ret = of_property_read_u32_index(dev->of_node, "reg", 2 * idx, &fsl_ldb->ldb_ctrl);
+	if (ret)
+		return ret;
+
+	idx = of_property_match_string(dev->of_node, "reg-names", "lvds");
+	if (idx < 0)
+		return idx;
+
+	ret = of_property_read_u32_index(dev->of_node, "reg", 2 * idx, &fsl_ldb->lvds_ctrl);
+	if (ret)
+		return ret;
+
 	fsl_ldb->clk = devm_clk_get(dev, "ldb");
 	if (IS_ERR(fsl_ldb->clk))
 		return PTR_ERR(fsl_ldb->clk);
-- 
2.51.0

