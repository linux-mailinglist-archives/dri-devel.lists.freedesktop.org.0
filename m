Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF04069C5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9B16E9CC;
	Fri, 10 Sep 2021 10:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F95A6E9CC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:13:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E5D382B013E6;
 Fri, 10 Sep 2021 06:13:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Sep 2021 06:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=10+tjkzC+mYma
 4yPEcpt+NjCwb1ACX57ylS/TuAaTks=; b=qe+NnVP9M8tDM/7ywGi6UdOyiPXSX
 0FSpcx+zilCydaHR0GYoebC51HjRZv7lzB6UHLrFAwuCFMH9fOrZqt6I0pGDGK7J
 hK0UeY6Tau1MMk88Jl3yAKu3iRXLzAt6BgFPRE639h/4j9bZoqLoofkPNqP+RU15
 FjTksnJYXZoVCa1NiJ8uJpXRmrtkFLT7zfw5wUr9uT628vO+Lsq6MH7701lG6cqP
 w3iNeCGHGYJi1RXPZrQCiIpg+gbp4c9w+8anSAeVdtgXwhcwSmGLfDHlOBNPQlPR
 Jq6CQOlUEKGcR554262/KwlLOj01+pTY4RIWYXYlSK5GQWJl3FSmlt4VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=10+tjkzC+mYma4yPEcpt+NjCwb1ACX57ylS/TuAaTks=; b=SZjcAyT9
 ccpBEemGWdkhaYNDMSHrlT2FqaF7MUS8poSq4yU+DuxSHfqzBWUx+mb3+atR6R89
 LWk95sAJqu7AsKJXRgpkByKBbwLU3lWPuenKVrXKh1dp+aW6hxbV0gFQj7I6ulyL
 86TfAvoQ4y9wbaYBfCeb8yMuJdniRIdfrBPCloh+z9vwc/JGYnSvwg0qKNOZEfbN
 Ba50D6OpNDtPX4mXm7pIH0vgY53u0UBnaLMlD2GRarGYlrCzYnDI0wsjjeTlcIm0
 Y1LzKfIWn4qI85QHuxK/V/vTIUCvkU3LB0CrVYzlLHBoH4exRFklL1mwNRwFwmQl
 dW1NF1CI8lJ75w==
X-ME-Sender: <xms:4y87YZfDH7ECBa8WKu9XBQJ6bMvjyTfTxXLJ44ZcQzu-2cmfMbwktQ>
 <xme:4y87YXMNan3XOhCKWtZ98HhgqDrVwQZ27VmPM34qF0TU3YwrH1IW08KAqiZRB1vRb
 Pv6WBOB3AXeqlWjckM>
X-ME-Received: <xmr:4y87YShkocXLr3TzVdK3CsV4ve9okoVSuOVhHDmbgAY_3YbOEbD0fixy-c9IEhitkq4jiPOpDW99-dSBn18RRQXZMvKvQ0Vf5mRE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4y87YS8Bd28y7AXYer-c55zDQfrNXU4Nixe7X8onR0uBPV46bw5Dyg>
 <xmx:4y87YVt_U3YdfpsWDyX68jaXOMUmeX19m-zo4BbRMxt5LtMmSiP-hw>
 <xmx:4y87YRGYwzhO77kfwpicn0yt_pnZDvaA025zJgmhitnrdKqOkBSzSg>
 <xmx:4y87YVch8Oa9iTwZFfLj4I_3_hib4GCoTJceZMfs2Uz8MaFr2z39iLqvkjU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:13:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao <tiantao6@hisilicon.com>,
 Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, John Stultz <john.stultz@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v4 16/24] drm/bridge: ps8640: Register and attach our DSI
 device at probe
Date: Fri, 10 Sep 2021 12:12:10 +0200
Message-Id: <20210910101218.1632297-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910101218.1632297-1-maxime@cerno.tech>
References: <20210910101218.1632297-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 97 +++++++++++++++-----------
 1 file changed, 55 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index c943045f3370..8d161b6cdbb2 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -215,52 +215,10 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 				enum drm_bridge_attach_flags flags)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
-	struct device *dev = &ps_bridge->page[0]->dev;
-	struct device_node *in_ep, *dsi_node;
-	struct mipi_dsi_device *dsi;
-	struct mipi_dsi_host *host;
-	int ret;
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
-	ret = devm_mipi_dsi_attach(dev, dsi);
-	if (ret)
-		return ret;
-
 	/* Attach the panel-bridge to the dsi bridge */
 	return drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
 				 &ps_bridge->bridge, flags);
@@ -307,6 +265,53 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
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
@@ -373,7 +378,15 @@ static int ps8640_probe(struct i2c_client *client)
 
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

