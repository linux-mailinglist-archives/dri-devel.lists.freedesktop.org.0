Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5863F46DA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 10:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBB289D64;
	Mon, 23 Aug 2021 08:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2C189D4D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 08:47:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 67C56580C67;
 Mon, 23 Aug 2021 04:47:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 23 Aug 2021 04:47:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=QEg7Vp8gCjMDX
 hvK4uZ6lD3DQNesVKp5J6Tnbairaz8=; b=0vzzcRaawN90SVLYfNwd8T+dAdW2+
 NR5OWaThZchQK6iPu+4SvBwSv+6f3uVIlVUODHk+TE7s31aRxf5Kf1Q/rhS+yXRC
 sCjUE9Re1DbA+7K49HmgkSKflElrQBskdFiRU3HMK/+prWoTif6iozvwmamtJIu+
 bVEMabWrPuSusquuf6pQ6Ag8yHY/+SawUxl8s4zN7i5TQaD4AtrsVGPV5YnMDuR7
 tNbRjjxnRBU+DuA7otf92PsxthRhmzbPsC73vh2Bx5Nj2FyVwbuSMZoWxJCGKupY
 qOl0tErhpy9pWNCEcwB/DaofbZeQjRHR7IeV3hxglkUxFxc3c+xHLS46Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=QEg7Vp8gCjMDXhvK4uZ6lD3DQNesVKp5J6Tnbairaz8=; b=ZvLUJ0gN
 iz5kR7wzYQj9NKD5lfU10T+LEio36Fvk0maroQFGx3+tFSKVvvReb66/1lbIB4Dj
 i8Q+lK81HhgDtRTZnJDo4eVQ3ReK99kpX5eKI5kAf2yRWxL1y++XZ8YVkIGFsCkL
 yCcvwF1GU9/g+asunStUqnVBm2Y2ZZ691371hpUGEhDFckcKNpvFEE96qVruvdwL
 SWDkIp8s+y5zieqlsNjn1I4+J0O+H4USBf2DRUt8hagTe0FjyimByWsbtjkLsMfD
 gmlV9AW5rj6RsiWLS7emKLTCYK0zOk5TG91S+Qe5R0X4iQtHuy00880g4jK+1lCA
 U2Qn2SaEepbqMA==
X-ME-Sender: <xms:tmAjYQCFsNEgNhNARCKt5Bh6-T7bRnAoPgNl8ZgByKYJ40sTzl_PNw>
 <xme:tmAjYSi9nMPHqU88ig-vdlzYCIMhlfoOONM5YvYipTPi583W_71DsItXzEhBnAGLD
 vhbn2btIBZOivofygg>
X-ME-Received: <xmr:tmAjYTnS7iPz-j16-b6VzIAa0GS_UwPReGq8ahCn0dHmO_atcf4xOubhBuEXjzir3cvcQk1cnqOtZokDnHAIaYLSOdsRtYR0irY_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tmAjYWwk_lydBk-_Pbl6sNAFDq6EG79x5opdt-25JG8ErkrW4J9QBg>
 <xmx:tmAjYVROwmToSt6nrrKTWeR0j2yV_VvxlniagyPuoAmxvQ2Re-7VtQ>
 <xmx:tmAjYRZucQd6Bc5NIplUGHswyqruRu_LPi24vpaXjWFWZugAf3bVHA>
 <xmx:tmAjYbDh66Ndxm4S6OkvdVs2RsNwVaxH7ICbaemQ7Ir1VBTyxzuzdg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Aug 2021 04:47:49 -0400 (EDT)
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
Subject: [PATCH v3 8/8] drm/bridge: sn65dsi83: Register and attach our DSI
 device at probe
Date: Mon, 23 Aug 2021 10:47:23 +0200
Message-Id: <20210823084723.1493908-9-maxime@cerno.tech>
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
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 76 +++++++++++++++------------
 1 file changed, 42 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index db4d39082705..3a75224b7348 100644
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
@@ -646,6 +612,44 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
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
@@ -686,6 +690,10 @@ static int sn65dsi83_probe(struct i2c_client *client,
 	ctx->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ctx->bridge);
 
+	ret = sn65dsi83_host_attach(ctx);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.31.1

