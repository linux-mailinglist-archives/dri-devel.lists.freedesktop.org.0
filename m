Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712BF435C07
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99A56EC10;
	Thu, 21 Oct 2021 07:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C166EC0F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:41:04 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 53F8A2B01369;
 Thu, 21 Oct 2021 03:41:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 21 Oct 2021 03:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=0jRcvudXPXM/a
 o9XoLGKBfJZiC+x5dQANxi83lap800=; b=i0DVqyBnsgn61Oug3e6F+qsKn3uLr
 oHieJUvqsbmE5+oIOjYj9QSddX9SCznqQnKRb3l38mZqItabypEpc+6gmzrX+gg6
 eDDYrihtVf2qVffz8A8u1ekWj5GhFgprcFnZnPTc/N/cuzZZuoQXQa7AxCzTXeDO
 NWKpMJq1TeuZFRjpCmXNfGs4OXSEEBQYWk9+1LW61p18WlcUG6g4alhvkxoHsQHa
 32AQ4IfIiQrbOeHlVZUVrSx2PZ8cK3UZ3VY0Jfw/9nXQSkZ1YXwJiw8h0kur70fZ
 R8/vyMGT3icdsMP+9837Wi8mqbPRZQyhTO6YdAYTVi55e0ObGRMoZ2iFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=0jRcvudXPXM/ao9XoLGKBfJZiC+x5dQANxi83lap800=; b=EQHjyDMc
 ISKgCe3Y7JB5VoKirdU7szRzg3R7hYZoF3az9GZOc/ioJppa8aeQe+WYNrFZ5RJ4
 pKEYdBELm8N2JmhSTkgrSfV0/d/DgUhG+R2srZ2cjDje9NoS/pKyxm+WIX/tcll+
 LHwpdGLZRr5oU2aPvQl4GS5D5So5mh7Ar182rszMe0p/03APNU5n0S/XFU9P80lL
 AdtJNGPKcOqewBTzeozaU3cKKpfBo3ACavV3sf+3DmNIB0Z5h9c82gp4xudgGJYz
 +KB6B9XBHphFc4Y5KuDdEl21rE7pVeLf2+oFavZ/hmZAZpdgv93ITe0yyDP+B2zq
 dT7UMJK7fddn5g==
X-ME-Sender: <xms:jRlxYdltYaK9fUln97DM6_Y_LyaTbr8gMDCPOc9zUy-8HzQIjvOUWA>
 <xme:jRlxYY3XLmb8_qjoEglK0dw8l8YLm3-6mSh4lhMUFg6C3UHB2CoYFw96jUoImL2pN
 q7yNkyVpwBRS98eWBo>
X-ME-Received: <xmr:jRlxYTrN9orJTDXn_vCqSw3WpkJI920dYo3p8_3I1cjkJSoh3izIk1Xj6nnNOvhO4jW9LPTm9HzXCcY9BMdB3sWrpGVbRCZjiIC7WVgu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jRlxYdnp0qlxxi0uJ88ZzwtfKYllaIEs3LHF6N5rXW80vzqhQvcpHQ>
 <xmx:jRlxYb1LNsv9NqAmVJxs-ecj-MLscuWP00DdtF4ZfkQXl60C8QD_3w>
 <xmx:jRlxYcupTIcZ9E0DZpSGPittAPu8pkpH37tKA--DqkyN2zpEcQRN2Q>
 <xmx:jRlxYaBG2527C49FScNm2x19x82E0uL8LZVySiHyYnp930mfdVdwdERL1_Y>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:41:01 -0400 (EDT)
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
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 15/21] drm/bridge: sn65dsi83: Register and attach our DSI
 device at probe
Date: Thu, 21 Oct 2021 09:39:41 +0200
Message-Id: <20211021073947.499373-16-maxime@cerno.tech>
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

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time. Let's do this.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 80 +++++++++++++++------------
 1 file changed, 46 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 539edd2c19f5..945f08de45f1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -245,40 +245,6 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
 			    enum drm_bridge_attach_flags flags)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
-	struct device *dev = ctx->dev;
-	struct mipi_dsi_device *dsi;
-	struct mipi_dsi_host *host;
-	int ret = 0;
-
-	const struct mipi_dsi_device_info info = {
-		.type = "sn65dsi83",
-		.channel = 0,
-		.node = NULL,
-	};
-
-	host = of_find_mipi_dsi_host_by_node(ctx->host_node);
-	if (!host) {
-		dev_err(dev, "failed to find dsi host\n");
-		return -EPROBE_DEFER;
-	}
-
-	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
-	if (IS_ERR(dsi)) {
-		return dev_err_probe(dev, PTR_ERR(dsi),
-				     "failed to create dsi device\n");
-	}
-
-	ctx->dsi = dsi;
-
-	dsi->lanes = ctx->dsi_lanes;
-	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
-
-	ret = devm_mipi_dsi_attach(dev, dsi);
-	if (ret < 0) {
-		dev_err(dev, "failed to attach dsi to host\n");
-		return ret;
-	}
 
 	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
 				 &ctx->bridge, flags);
@@ -636,6 +602,44 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 	return 0;
 }
 
+static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
+{
+	struct device *dev = ctx->dev;
+	struct mipi_dsi_device *dsi;
+	struct mipi_dsi_host *host;
+	const struct mipi_dsi_device_info info = {
+		.type = "sn65dsi83",
+		.channel = 0,
+		.node = NULL,
+	};
+	int ret;
+
+	host = of_find_mipi_dsi_host_by_node(ctx->host_node);
+	if (!host) {
+		dev_err(dev, "failed to find dsi host\n");
+		return -EPROBE_DEFER;
+	}
+
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
+	if (IS_ERR(dsi))
+		return dev_err_probe(dev, PTR_ERR(dsi),
+				     "failed to create dsi device\n");
+
+	ctx->dsi = dsi;
+
+	dsi->lanes = ctx->dsi_lanes;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		dev_err(dev, "failed to attach dsi to host: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int sn65dsi83_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
@@ -679,7 +683,15 @@ static int sn65dsi83_probe(struct i2c_client *client,
 	ctx->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ctx->bridge);
 
+	ret = sn65dsi83_host_attach(ctx);
+	if (ret)
+		goto err_remove_bridge;
+
 	return 0;
+
+err_remove_bridge:
+	drm_bridge_remove(&ctx->bridge);
+	return ret;
 }
 
 static int sn65dsi83_remove(struct i2c_client *client)
-- 
2.31.1

