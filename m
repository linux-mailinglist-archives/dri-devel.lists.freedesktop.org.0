Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A274435C0F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637B16EC14;
	Thu, 21 Oct 2021 07:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F306EC16
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:41:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 3FDAE2B0046A;
 Thu, 21 Oct 2021 03:41:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 21 Oct 2021 03:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=3aQjtC+OIX1dD
 SUs4abOhDu7UcQuzLgRDPAEOeXSI5o=; b=XmjkmpdKYLBYTdvxEy78AkuiGSYiA
 146qEjXfHcrB3u+hM/kxxcPR6+L+EKwrFfWNXTDK7jiP8nvM7TrxAV+DdJTtGAgt
 jHkgiDXq5ANdBK3eHQaCghZLB/RFEj4lM8WSv8SCOvz7a06Fl5wmaY/k0o8NfE+3
 c/TF6gb4JprZjWjlo3oB3A0DEucNz6TMW8I/dTn72IQEPKNKduDk72DG6eOUuOoO
 poFf3z2L694G0c7XjQmsd84csbstbhHiSavaJ4S/Zv1PquM2nKnjCjaCJ+1tdVIX
 M7Cfe3t83oF/0iq+pVTw7Zfc+jYFHi3AV+aiy1+V2MxzTHfafkxoavB5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=3aQjtC+OIX1dDSUs4abOhDu7UcQuzLgRDPAEOeXSI5o=; b=kwO5iryX
 GO9W54hNqi2TgLB/eMj3vG8fbe2X6+Q8KTYgOp3Kgf7ZnNAmoXMSPChYjiNxNiNs
 H7BAqmt+kgszPN8BqhaXl0BAX7tqxU0AcBqCZV7nUNbUK8YBCSifSUTa3NMrfgbO
 1PuqNkm7pD6SC/Ji1kH7Sd74C0Sfo0ebNBXzr3CHIgEeWrJRtGi/OnfsAycDEXpH
 MCaZAh8Ue6LH4oZwsHhlbJtHtYQZOh5wNRoeynayiZdzpRfvDx9J2x5MbpZ77+ch
 3+96yrtEa/lx8uX19efqqe+yhAgW5iqTMbcnGeuKebVdO2zXccwwZzSS/OkHrziu
 oN33cIwV+U48mw==
X-ME-Sender: <xms:pBlxYX1RfIo2sSuxB3dEnDrwQ65xrufjNiEyKuvmHhFDNsPMq-5bmQ>
 <xme:pBlxYWEcV3XS8sK3nETApzEReNR21O14bNT2nKDwjrFuVipRykEjVwvrmC2sHsNxj
 3xX0eRoFsyltlo-Gck>
X-ME-Received: <xmr:pBlxYX6TYnjPhPrMYJOYu8m2bFDP-dl25f1hqzOwS37GxA2cbH8IfmcJvfaEBkGf9SAzPXGNAmsw5sFAstRboRBZb9T-34LgbnXHRZI4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pBlxYc1sh1PeczIwCqe3IimL5kdBg0jfC1FvxWQpVQPkgvwMaMzGbA>
 <xmx:pBlxYaFFqYsHfAZbko1KxuVSbPxcMgQBzFl0qiElCaFCG69thtisfw>
 <xmx:pBlxYd_n89ryD5zIKSUM4KxYcwa4tU2mpAcyVMwWGSz9017Lry90eg>
 <xmx:pBlxYSVwOtUkm4E_yvc8QcMUnJK9T5U_Olpf8VmWOjr_aYQ7OuDKojiRYoE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:41:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tian Tao <tiantao6@hisilicon.com>,
 freedreno@lists.freedesktop.org, Chen Feng <puck.chen@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 John Stultz <john.stultz@linaro.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Inki Dae <inki.dae@samsung.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 20/21] drm/kirin: dsi: Adjust probe order
Date: Thu, 21 Oct 2021 09:39:46 +0200
Message-Id: <20211021073947.499373-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021073947.499373-1-maxime@cerno.tech>
References: <20211021073947.499373-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without proper care and an agreement between how DSI hosts and devices
drivers register their MIPI-DSI entities and potential components, we can
end up in a situation where the drivers can never probe.

Most drivers were taking evasive maneuvers to try to workaround this,
but not all of them were following the same conventions, resulting in
various incompatibilities between DSI hosts and devices.

Now that we have a sequence agreed upon and documented, let's convert
kirin to it.

Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 52 +++++++++++++-------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 952cfdb1961d..1d556482bb46 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -81,7 +81,7 @@ struct dsi_hw_ctx {
 
 struct dw_dsi {
 	struct drm_encoder encoder;
-	struct drm_bridge *bridge;
+	struct device *dev;
 	struct mipi_dsi_host host;
 	struct drm_display_mode cur_mode;
 	struct dsi_hw_ctx *ctx;
@@ -720,10 +720,13 @@ static int dw_drm_encoder_init(struct device *dev,
 	return 0;
 }
 
+static const struct component_ops dsi_ops;
 static int dsi_host_attach(struct mipi_dsi_host *host,
 			   struct mipi_dsi_device *mdsi)
 {
 	struct dw_dsi *dsi = host_to_dsi(host);
+	struct device *dev = host->dev;
+	int ret;
 
 	if (mdsi->lanes < 1 || mdsi->lanes > 4) {
 		DRM_ERROR("dsi device params invalid\n");
@@ -734,13 +737,20 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = mdsi->format;
 	dsi->mode_flags = mdsi->mode_flags;
 
+	ret = component_add(dev, &dsi_ops);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
 static int dsi_host_detach(struct mipi_dsi_host *host,
 			   struct mipi_dsi_device *mdsi)
 {
-	/* do nothing */
+	struct device *dev = host->dev;
+
+	component_del(dev, &dsi_ops);
+
 	return 0;
 }
 
@@ -768,7 +778,17 @@ static int dsi_host_init(struct device *dev, struct dw_dsi *dsi)
 static int dsi_bridge_init(struct drm_device *dev, struct dw_dsi *dsi)
 {
 	struct drm_encoder *encoder = &dsi->encoder;
-	struct drm_bridge *bridge = dsi->bridge;
+	struct drm_bridge *bridge;
+	struct device_node *np = dsi->dev->of_node;
+	int ret;
+
+	/*
+	 * Get the endpoint node. In our case, dsi has one output port1
+	 * to which the external HDMI bridge is connected.
+	 */
+	ret = drm_of_find_panel_or_bridge(np, 1, 0, NULL, &bridge);
+	if (ret)
+		return ret;
 
 	/* associate the bridge to dsi encoder */
 	return drm_bridge_attach(encoder, bridge, NULL, 0);
@@ -785,10 +805,6 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = dsi_host_init(dev, dsi);
-	if (ret)
-		return ret;
-
 	ret = dsi_bridge_init(drm_dev, dsi);
 	if (ret)
 		return ret;
@@ -809,17 +825,7 @@ static const struct component_ops dsi_ops = {
 static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 {
 	struct dsi_hw_ctx *ctx = dsi->ctx;
-	struct device_node *np = pdev->dev.of_node;
 	struct resource *res;
-	int ret;
-
-	/*
-	 * Get the endpoint node. In our case, dsi has one output port1
-	 * to which the external HDMI bridge is connected.
-	 */
-	ret = drm_of_find_panel_or_bridge(np, 1, 0, NULL, &dsi->bridge);
-	if (ret)
-		return ret;
 
 	ctx->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(ctx->pclk)) {
@@ -852,6 +858,7 @@ static int dsi_probe(struct platform_device *pdev)
 	dsi = &data->dsi;
 	ctx = &data->ctx;
 	dsi->ctx = ctx;
+	dsi->dev = &pdev->dev;
 
 	ret = dsi_parse_dt(pdev, dsi);
 	if (ret)
@@ -859,12 +866,19 @@ static int dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
-	return component_add(&pdev->dev, &dsi_ops);
+	ret = dsi_host_init(&pdev->dev, dsi);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static int dsi_remove(struct platform_device *pdev)
 {
-	component_del(&pdev->dev, &dsi_ops);
+	struct dsi_data *data = platform_get_drvdata(pdev);
+	struct dw_dsi *dsi = &data->dsi;
+
+	mipi_dsi_host_unregister(&dsi->host);
 
 	return 0;
 }
-- 
2.31.1

