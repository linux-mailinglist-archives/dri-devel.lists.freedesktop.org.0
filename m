Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 879FD3F46D9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 10:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50E989D49;
	Mon, 23 Aug 2021 08:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF45189CF7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 08:47:46 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2B82F580C68;
 Mon, 23 Aug 2021 04:47:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 23 Aug 2021 04:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=8iW02l1q8DDSd
 g6lLbPN+gmQrdVsTCyZKHUgVjlXuFc=; b=xfDyIZI9nDm1X1ACag7h0Yl49AcOm
 YBLeneoo/tC/a05sUFKXYdW9GclEGPvkSNOxa5kgpD0AQG/d37AYvM4w8U3f0KpL
 jTuOs+45g1MmOzqbYKqGv4Foc29jmd7N25hmkNCb/o5LGDIpNDLRJ/0gx8F3uiww
 rDVf3SUHVrSfFtDncUk98rbu2Wym1XHxQWLK9WDz1gYyZLBnYOy7w1WGOmlKXzzq
 MFvcFe7zfR2GNSXV7nBmjT8/3cWUhjK38vn3VFOQkA0BwTlBzI48+/2QwGOrZwRM
 CZKyhtIikOP7/D8Px0o1YJmCkmxISSfLTHEbH2lp7U4jLwrm7zIW1SJ7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=8iW02l1q8DDSdg6lLbPN+gmQrdVsTCyZKHUgVjlXuFc=; b=cQV3/6JK
 qv+tx7czw/v/yx4rxY235DPBctWhakOITN2v0YjEGDUsiiz5X1vPI/hsOvTe4Fzm
 WGPpeXq1vqeV27NOf2Q6FZf3tytd59+Pf0wSRBK6W0GtFmHmsAv9dWoXlUKAew3d
 z+bUKhIYAllxyu4/fUteKLTWzhPCy0R7It4vT9V/GehP/NJXspv0Y8IcB756qPmi
 Wv9X0XTA86sScD5qM+LcV9aYY8t4RJ/EdFvtjAH1tn2hp3EOri6v2qvadQRKb5UX
 6e/gpt+kA3Ku/PDl2dT/3Jmk8rrwX4jZycgTe+HJvZp1hiSc///FSogn3MqBt9Re
 v18bCYdZYI2ckg==
X-ME-Sender: <xms:smAjYevS0r7YI4b7066ktEso-UCB2fUozycie7QRhsgvULb845SX3A>
 <xme:smAjYTcM3St28VJWIRue_jTZke6WbYlicc6EFnKK4LyInxfvVZLM-CD-XaJhEf-Do
 uYKS0q_RhO9rDi84nk>
X-ME-Received: <xmr:smAjYZz1KzIMeT3u0N0W4-e5fKQ9R_YhfQwHwuFUiDsMBJ--nCvrF_W1sjZ73isZM9dOBqFGAqYbWqcXBNiF2MHxiap4Bx-MBxiX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:smAjYZMnFdSTZnEmTd6F7DwFJ2Y-okBtn5g3_xt69nb_8lAbuTqFkQ>
 <xmx:smAjYe-vV4AiD53bfBcxv-VpCnoaRQ638xkVb0IrWr5WXst5Mptwfg>
 <xmx:smAjYRU_oWAf7jA2LOy6BDLP5Yf3zf_Q5VsDQZfp7TfkjEF5Btz1Ag>
 <xmx:smAjYQdkx-Vc9zVoXpxYycLxqeExpSDg0YLcw_NLVu64KCVjNWE3_g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Aug 2021 04:47:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/8] drm/bridge: ps8640: Register and attach our DSI device
 at probe
Date: Mon, 23 Aug 2021 10:47:21 +0200
Message-Id: <20210823084723.1493908-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823084723.1493908-1-maxime@cerno.tech>
References: <20210823084723.1493908-1-maxime@cerno.tech>
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
 drivers/gpu/drm/bridge/parade-ps8640.c | 93 ++++++++++++++------------
 1 file changed, 51 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 794c9516b05d..37f7d166a3c6 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -213,52 +213,10 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
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
-	dsi->lanes = DP_NUM_LANES;
-	ret = devm_mipi_dsi_attach(dev, dsi);
-	if (ret)
-		return ret;
-
 	/* Attach the panel-bridge to the dsi bridge */
 	return drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
 				 &ps_bridge->bridge, flags);
@@ -305,6 +263,53 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
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
+	dsi->lanes = DP_NUM_LANES;
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
@@ -371,6 +376,10 @@ static int ps8640_probe(struct i2c_client *client)
 
 	drm_bridge_add(&ps_bridge->bridge);
 
+	ret = ps8640_bridge_host_attach(dev, ps_bridge);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.31.1

