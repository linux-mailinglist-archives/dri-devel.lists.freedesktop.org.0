Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A97DBCF8A1
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6025910E310;
	Sat, 11 Oct 2025 17:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="bpdAM743";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ixLvw9ab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF7C10E310
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:05 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ckVL00C43z9sm3;
 Sat, 11 Oct 2025 19:03:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SC+/Y0nmVIFcQ2pWahGO/IJdntF+c5+bodHF9PVowes=;
 b=bpdAM743DEFe5YIgViwjz8+83tTREKdB49L9J6jrCCNy0NJf2HLnXGaQ1RII62qNuFLUVP
 nskSpWSDe0vWAb/bbiwzVNkMrjzdDy/IsysmPJID1ovb4jm6OTs/eDZ7TZLjHJsMC4U14x
 1hfUKIvIvmsQ0sIjqBPI3OxBOOfO2ZoeT9UoxZrkKmpRPhtL14Kdvm1u/o1GOgjBaA7VGl
 3k3+2GpXz0nVazkRpBFHO7SO+6NwFVXOypk167Ar3Svv2N85RRJy8KwpXiZPVhc9Qrj2Mb
 q6aT9aZKpDuZQ7HGabFCbZQNruuCqmY2Te9nB/ikMv4IYEOv30CQXwgHqE0OlQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ixLvw9ab;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SC+/Y0nmVIFcQ2pWahGO/IJdntF+c5+bodHF9PVowes=;
 b=ixLvw9abgHVEI0sZWQjxG9Dth/ksM86xmAnTuLBG6jlH5UDQRR6rnLnW/xo9nmY9eS6slf
 joEiPvEk5PhcXD2r8idWnYZoN2DkFbRHjsbI9rlpzQ06DMf5i9KNn+rKjkAkguL3ogcQV4
 fQe3UDrH/oRXMFAcvMjvb0G23aPXWNbdbg3j86zzhDwYkXznNmGak2m4mMvKkpVF3AbCXa
 AEmSgsnGZgnTxUc0eJFdaNG4FdLop1yXsBzPomopY0SYJ4r6hAOtITznt26TC+DEmk50y4
 p7Mmnbccao3YVYhxOAIEdIIJ0/IiMxQgSrvhu7hzrM70ibpTN4N3B3M9n23MaQ==
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
Subject: [PATCH 04/39] drm/imx: dc: Use bulk clock
Date: Sat, 11 Oct 2025 18:51:19 +0200
Message-ID: <20251011170213.128907-5-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3c19b5b512e3de1a7b6
X-MBO-RS-META: m6utjgyz4k4mj83qbrydrpkc6xgkcgte
X-Rspamd-Queue-Id: 4ckVL00C43z9sm3
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

Switch to bulk clock operations, as many of the blocks present in DC
use multiple clock on i.MX95. The use of bulk clock operations allows
the driver to seamlessly handle one or multiple clock.

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
 drivers/gpu/drm/imx/dc/dc-drv.c | 14 ++++++++------
 drivers/gpu/drm/imx/dc/dc-ic.c  | 14 ++++++++------
 drivers/gpu/drm/imx/dc/dc-pe.c  | 12 ++++++------
 drivers/gpu/drm/imx/dc/dc-pe.h  |  3 ++-
 4 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index f108964bf89f4..2717c92aba6c5 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -31,7 +31,8 @@
 
 struct dc_priv {
 	struct drm_device *drm;
-	struct clk *clk_cfg;
+	struct clk_bulk_data *clk_cfg;
+	int clk_cfg_count;
 };
 
 DEFINE_DRM_GEM_DMA_FOPS(dc_drm_driver_fops);
@@ -163,10 +164,11 @@ static int dc_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->clk_cfg = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(priv->clk_cfg))
-		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk_cfg),
+	ret = devm_clk_bulk_get_all(&pdev->dev, &priv->clk_cfg);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
 				     "failed to get cfg clock\n");
+	priv->clk_cfg_count = ret;
 
 	dev_set_drvdata(&pdev->dev, priv);
 
@@ -201,7 +203,7 @@ static int dc_runtime_suspend(struct device *dev)
 {
 	struct dc_priv *priv = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(priv->clk_cfg);
+	clk_bulk_disable_unprepare(priv->clk_cfg_count, priv->clk_cfg);
 
 	return 0;
 }
@@ -211,7 +213,7 @@ static int dc_runtime_resume(struct device *dev)
 	struct dc_priv *priv = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(priv->clk_cfg);
+	ret = clk_bulk_prepare_enable(priv->clk_cfg_count, priv->clk_cfg);
 	if (ret)
 		dev_err(dev, "failed to enable cfg clock: %d\n", ret);
 
diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
index a270ae4030cdc..67441b349a7d2 100644
--- a/drivers/gpu/drm/imx/dc/dc-ic.c
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -30,7 +30,8 @@
 
 struct dc_ic_data {
 	struct regmap		*regs;
-	struct clk		*clk_axi;
+	struct clk_bulk_data	*clk_axi;
+	int			clk_axi_count;
 	int			irq[IRQ_COUNT];
 	struct irq_domain	*domain;
 };
@@ -136,10 +137,11 @@ static int dc_ic_probe(struct platform_device *pdev)
 	if (IS_ERR(data->regs))
 		return PTR_ERR(data->regs);
 
-	data->clk_axi = devm_clk_get(dev, NULL);
-	if (IS_ERR(data->clk_axi))
-		return dev_err_probe(dev, PTR_ERR(data->clk_axi),
+	ret = devm_clk_bulk_get_all(dev, &data->clk_axi);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
 				     "failed to get AXI clock\n");
+	data->clk_axi_count = ret;
 
 	for (i = 0; i < IRQ_COUNT; i++) {
 		/* skip the reserved IRQ */
@@ -242,7 +244,7 @@ static int dc_ic_runtime_suspend(struct device *dev)
 {
 	struct dc_ic_data *data = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(data->clk_axi);
+	clk_bulk_disable_unprepare(data->clk_axi_count, data->clk_axi);
 
 	return 0;
 }
@@ -252,7 +254,7 @@ static int dc_ic_runtime_resume(struct device *dev)
 	struct dc_ic_data *data = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(data->clk_axi);
+	ret = clk_bulk_prepare_enable(data->clk_axi_count, data->clk_axi);
 	if (ret)
 		dev_err(dev, "failed to enable AXI clock: %d\n", ret);
 
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.c b/drivers/gpu/drm/imx/dc/dc-pe.c
index 6676c22f3f458..eb96a6206cc6d 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.c
+++ b/drivers/gpu/drm/imx/dc/dc-pe.c
@@ -27,10 +27,10 @@ static int dc_pe_bind(struct device *dev, struct device *master, void *data)
 	if (!pe)
 		return -ENOMEM;
 
-	pe->clk_axi = devm_clk_get(dev, NULL);
-	if (IS_ERR(pe->clk_axi))
-		return dev_err_probe(dev, PTR_ERR(pe->clk_axi),
-				     "failed to get AXI clock\n");
+	ret = devm_clk_bulk_get_all(dev, &pe->clk_axi);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get AXI clock\n");
+	pe->clk_axi_count = ret;
 
 	pe->dev = dev;
 
@@ -99,7 +99,7 @@ static int dc_pe_runtime_suspend(struct device *dev)
 {
 	struct dc_pe *pe = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(pe->clk_axi);
+	clk_bulk_disable_unprepare(pe->clk_axi_count, pe->clk_axi);
 
 	return 0;
 }
@@ -109,7 +109,7 @@ static int dc_pe_runtime_resume(struct device *dev)
 	struct dc_pe *pe = dev_get_drvdata(dev);
 	int i, ret;
 
-	ret = clk_prepare_enable(pe->clk_axi);
+	ret = clk_bulk_prepare_enable(pe->clk_axi_count, pe->clk_axi);
 	if (ret) {
 		dev_err(dev, "failed to enable AXI clock: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index f5e01a6eb9e91..ffeb1c7af1c9f 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -67,7 +67,8 @@ struct dc_lb {
 
 struct dc_pe {
 	struct device *dev;
-	struct clk *clk_axi;
+	struct clk_bulk_data *clk_axi;
+	int clk_axi_count;
 	struct dc_cf *cf_safe[DC_DISPLAYS];
 	struct dc_cf *cf_cont[DC_DISPLAYS];
 	struct dc_ed *ed_safe[DC_DISPLAYS];
-- 
2.51.0

