Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6024439A1D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFFB6E133;
	Mon, 25 Oct 2021 15:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FEB6E10F;
 Mon, 25 Oct 2021 15:16:13 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id C7EDD5806BA;
 Mon, 25 Oct 2021 11:16:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 25 Oct 2021 11:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=pKsXIpawviE80
 s0oa0W5dndDA61ycx6od8LAHKcClaI=; b=dqjk0sHSSFa/0hUJPQz1HRW5r+qow
 03PslNDo5gk12C2NFya9xBZirCpDP2v9Tmqj0YeuGjCrn9bBAN4LAWRbdkyfErIA
 hamstcjRQXHNKA1gb9tEhnKMx1AkfCRLeHQvQrN2AbYsxb8uRw+qfqszkNyeTsfu
 nfeDitkSlQjxdsZq1g4qV23CdqbKlxTRWwbJa4+CwAKfW6mHhmrSA2t76lRBsAqY
 lT/VNrDa2qJ4ZVsw8F2EQICK72hZ/FLtiyXIua4Q87l5lqZ/eZj6EsWRGFZ7JlDQ
 exqwVpnn5EYCFgA/rghNyja5WuJxXUTHtswP0Ni2wnWZsWovhSfrp7Cpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=pKsXIpawviE80s0oa0W5dndDA61ycx6od8LAHKcClaI=; b=fcsVy2P3
 +o0bw6GyAppNh0a5NvvkPoLlt6PhIu592jHt/h46K0RXZr7Re8FuW0IZ41juDzHv
 fIGhTWcSRCzBa7twX/0iObl2Zd57FG1JSnz6DVRwuKtVN2MSQFqlb9SGD6ql+fZC
 WrwFQNNhjcfsmyltQtnPWTKAzTVmDOWXuZyzW3S2awvOt1R8cuxAq+2kWuXpFwfX
 ALwoLAgs9iIPq7t4ZIcnPmRyHnG2q07IaT9joCR3Uxsq+vNflNMRyjWgy9KI4KEH
 kbRzAXjezT1CHzZMt32hbJk84kHT8uXk0rQXF0NU6pY09Q1RYITiyh4kUOb4/1Yu
 y4Uxyho5kjiR5Q==
X-ME-Sender: <xms:PMp2YQAGqLSEb6ASLsbwmfa53ZRoUJAyVNg35OawV5_yD34D5P1DTA>
 <xme:PMp2YSiq5LAC5VHdSEGM6MTeJe9uj8hZMiFXpNqsr9bk104QzU5NpACKAlPgm-IQy
 PFoQvqMO87AeG9JKV0>
X-ME-Received: <xmr:PMp2YTm7fEYcq8FOrt3C0Wmre7RNVsElCHUw7DyZffqXna1M2646u0Ti2XGQ90YWFW3E8W0cUEdoVqO_RUhDiRJ00kksL_NBz6k8X3wV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PMp2YWxZwF5BUqCYV7OEy2ECe_qfx45bqK90j0dj1Mu7o7mOfKVNOw>
 <xmx:PMp2YVTfEHwz46FN2d5DNhibDzW06jzfVCbd4qbSa1KtUxkRXnuSRA>
 <xmx:PMp2YRYrKzZXhkguEFMcbEwyP-aiaFGV_9Fq5ymTGtY3HHB9Fpj1pg>
 <xmx:PMp2YdyaPr21fehM2y6yG7lefK6cG11aDoL2agv_jKCJfx6FTDxwtQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:12 -0400 (EDT)
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
Subject: [PATCH v6 12/21] drm/bridge: ps8640: Register and attach our DSI
 device at probe
Date: Mon, 25 Oct 2021 17:15:27 +0200
Message-Id: <20211025151536.1048186-13-maxime@cerno.tech>
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

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time. Let's do this.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 98 +++++++++++++++-----------
 1 file changed, 55 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 5ae15fc407c5..4b36e4dc78f1 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -401,54 +401,11 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 	struct device *dev = &ps_bridge->page[0]->dev;
-	struct device_node *in_ep, *dsi_node;
-	struct mipi_dsi_device *dsi;
-	struct mipi_dsi_host *host;
 	int ret;
-	const struct mipi_dsi_device_info info = { .type = "ps8640",
-						   .channel = 0,
-						   .node = NULL,
-						 };
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	/* port@0 is ps8640 dsi input port */
-	in_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
-	if (!in_ep)
-		return -ENODEV;
-
-	dsi_node = of_graph_get_remote_port_parent(in_ep);
-	of_node_put(in_ep);
-	if (!dsi_node)
-		return -ENODEV;
-
-	host = of_find_mipi_dsi_host_by_node(dsi_node);
-	of_node_put(dsi_node);
-	if (!host)
-		return -ENODEV;
-
-	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
-	if (IS_ERR(dsi)) {
-		dev_err(dev, "failed to create dsi device\n");
-		ret = PTR_ERR(dsi);
-		return ret;
-	}
-
-	ps_bridge->dsi = dsi;
-
-	dsi->host = host;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
-			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
-	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->lanes = NUM_MIPI_LANES;
-
-	ret = devm_mipi_dsi_attach(dev, dsi);
-	if (ret) {
-		dev_err(dev, "failed to attach dsi device: %d\n", ret);
-		return ret;
-	}
-
 	ret = drm_dp_aux_register(&ps_bridge->aux);
 	if (ret) {
 		dev_err(dev, "failed to register DP AUX channel: %d\n", ret);
@@ -507,6 +464,53 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
 	.pre_enable = ps8640_pre_enable,
 };
 
+static int ps8640_bridge_host_attach(struct device *dev, struct ps8640 *ps_bridge)
+{
+	struct device_node *in_ep, *dsi_node;
+	struct mipi_dsi_device *dsi;
+	struct mipi_dsi_host *host;
+	int ret;
+	const struct mipi_dsi_device_info info = { .type = "ps8640",
+						   .channel = 0,
+						   .node = NULL,
+						 };
+
+	/* port@0 is ps8640 dsi input port */
+	in_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
+	if (!in_ep)
+		return -ENODEV;
+
+	dsi_node = of_graph_get_remote_port_parent(in_ep);
+	of_node_put(in_ep);
+	if (!dsi_node)
+		return -ENODEV;
+
+	host = of_find_mipi_dsi_host_by_node(dsi_node);
+	of_node_put(dsi_node);
+	if (!host)
+		return -EPROBE_DEFER;
+
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
+	if (IS_ERR(dsi)) {
+		dev_err(dev, "failed to create dsi device\n");
+		return PTR_ERR(dsi);
+	}
+
+	ps_bridge->dsi = dsi;
+
+	dsi->host = host;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
+			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->lanes = NUM_MIPI_LANES;
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int ps8640_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -584,7 +588,15 @@ static int ps8640_probe(struct i2c_client *client)
 
 	drm_bridge_add(&ps_bridge->bridge);
 
+	ret = ps8640_bridge_host_attach(dev, ps_bridge);
+	if (ret)
+		goto err_bridge_remove;
+
 	return 0;
+
+err_bridge_remove:
+	drm_bridge_remove(&ps_bridge->bridge);
+	return ret;
 }
 
 static int ps8640_remove(struct i2c_client *client)
-- 
2.31.1

