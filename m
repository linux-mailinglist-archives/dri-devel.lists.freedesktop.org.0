Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00CD439A2F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3016E159;
	Mon, 25 Oct 2021 15:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A00B6E145;
 Mon, 25 Oct 2021 15:16:34 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 78AE75806CB;
 Mon, 25 Oct 2021 11:16:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 25 Oct 2021 11:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=3aQjtC+OIX1dD
 SUs4abOhDu7UcQuzLgRDPAEOeXSI5o=; b=DXVutIx4vLJSSVZuWU1+VeaaSvNhC
 x5OCf3D5+/ShDtgWSnF4CyMsTej+0yeY7fWz3pTidlcNCLUqMYRlrz8TLCAdZ5Rm
 iowNDegVwX52xr+CCKcJk3aYIF6q1UM+0csUyWrZAOxK0C9l4OW9YRXTBIfPEYQB
 q7PXAZ86cShMXd5CCSFUy6TJnl9M5MwVDlp0/k8STuBQWLOwFvDmEndhi6s48aH6
 KW7yyC84eQLG3LMVt+mnyOybB4iG7lTE0biD0zJXmtFBUtLQ4LwnK2em6gCXHv6+
 GxB14oYuPcU7QtGEWzi4stI14o+TKEWpXG4BomLcFJKvA83nSFuAO31xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=3aQjtC+OIX1dDSUs4abOhDu7UcQuzLgRDPAEOeXSI5o=; b=XvpO4CIX
 M59z3QWJeiBot1DVWZ7MbO9wiSAIKCtCt4nWXfdO+qBNb9fj7ZYgiT1IhvasWoDx
 v4aw4k8yxnPBhc63if+yfeaGff3BH1qKtbJWbfAopqE4VfRNeIMVrBW+8VNiki9y
 l41/Sm4KEjlSv1ZJk8RaJUxufCwMA3nS0BKg41ekoKUSofSBpnOTgITsHEfuBPaq
 clihJqApc3peNE5vDIRj/6cxI2e/YvQMlQ4RqTfrP25GTn/wH0FoMYz2WSYOAYF+
 ZICiuY/6ig53o7rKY2SMlbh/QxEFh15NIIxALMT3y6qH8uMNUWteIIcQbdzQYpY+
 /YVTAm+TWfE42g==
X-ME-Sender: <xms:UMp2YS0WhDWH0Q8Np8QJl9eW20sleEXRW-vW6Dzip9AMgmAR01JnlA>
 <xme:UMp2YVH7mzR8_nchJte47Y_47D_W42_LEdGV0Jl9g5hi-XKom4GTyKDMOOY0Ca5Js
 m4xZbAZjnVga5sZyBM>
X-ME-Received: <xmr:UMp2Ya4fQW72O78VLNCboxCjgDk5lnWjBcK05D5bkB2yfq4r-Jv5dy8Q0Fn62wW-8htM7RPw6sDN3xyIzl-gFMQGEdI_cRZ1TacnMzUS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UMp2YT09fNFdID_fXdl377iluV4MpJ9CUwqGl4AUGALE8dJP0xZRfw>
 <xmx:UMp2YVGlameb3Thucmpvs2DZgmtWPxyZdBvxBQ_Oa9gchohdg5MbiA>
 <xmx:UMp2Yc_Fgf5ltSITEcdyXO87-1yp-UFoMFoujanfAtvD5J3LkeirxA>
 <xmx:UMp2YRUGPqzrchIK-mhNL8Fay_TAgfaEL2dbCHOBu2OypP5aQbGwxA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Tian Tao <tiantao6@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Xinliang Liu <xinliang.liu@linaro.org>,
 John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org,
 Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Subject: [PATCH v6 20/21] drm/kirin: dsi: Adjust probe order
Date: Mon, 25 Oct 2021 17:15:35 +0200
Message-Id: <20211025151536.1048186-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-1-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
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

