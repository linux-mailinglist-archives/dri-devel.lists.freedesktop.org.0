Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93DD4069A1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF166E9C5;
	Fri, 10 Sep 2021 10:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3486E9C1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:13:09 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id F2EC22B00949;
 Fri, 10 Sep 2021 06:13:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 10 Sep 2021 06:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=3jjbep7aYkKtz
 HJrCVgdlqOXkJlt6QrmU7gPROvp2+k=; b=KJn4UARhgxXWiO0rQC5x2xvphsAxG
 YN5cw+35EjwCjwx6k19GryQAS1c619aY7n1jqTEfggtcGY+t267x7N9fQcVvvCr6
 fwOe7iNLXqh8/v7k/RFD1YNVyPrKAWrXOjuAAiSRb4eC1/wI03pRpdynJTJYbTMa
 qH7oPSulE5yb+RUdA1zvLWFwKZ3YY7nakfMIJmpJR4XcD9nn25au3n3mFbq8HVgL
 AW8uhgV6dTTcbA5Lss94HG8oYak7PQoDOhAxqOV+azB1DykuvX60C5kvikGa/laH
 HOg9QrXvfFLSAsMluKDNy/VewrIRW2CxuNCMCH0K/tp2INIC9droDrkKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=3jjbep7aYkKtzHJrCVgdlqOXkJlt6QrmU7gPROvp2+k=; b=mi0wDuw7
 K8r9Fhi83dvlkbQ83308yX4pHzk9vBo8lYM8Vu09ZBeycFt4w/oU5aS1VCFKbCTF
 LULLpZJR97JQWCg7OcQ1MwXHzYasmwGyvV9LOFU/x/5hSx6/ip7lVnwpW1e2fWp1
 g3aQYjKGlNIHbUA9jgLxeUxxzcS2ba35AoZHfz1luOpQhPKasLcXQsRbkmKvcH7k
 UFFeDUfMVYUoRz9EfydZSO7pRVNhFIzt8rB9/aJmv5iypAoYWZBr2uhBBGYFI7Ji
 QafRhb8DcdW738EnMQHfjmyjvg2NX7CwWkGI1/1L+ZZvLIEkd2K8FR4/+I2yvIFy
 IW4mJVAfyhmYpw==
X-ME-Sender: <xms:sC87YbPrGbXDGPIBN2rslTBgObXMrU3WrSunHzxdEk4pX0q0RPOzMQ>
 <xme:sC87YV9JxjAZ-a9QwV5Ib74nalUxRw-lBSh8JvWvGoEdbohkdgINmap6eIR6pGq7U
 OiohWNxkruVlKyPjKM>
X-ME-Received: <xmr:sC87YaTvTOdbAygwAdlhoMamdOYQqUNg4HRRiuoOoE3vw1bLqLfSGXRSEcSIp9BlsEzS6RXtt-51r8skgvNrC4RFtfW2LaHHSHL9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sC87YfvMIgMiLQV9bbWlQzk5M3123eK-31XlHgo3ZQG8zxmwq0_AAA>
 <xmx:sC87YTeNone5ID_hKqQJhdUZJbXraqzY4z8D_AIJGaOp8ggintcSig>
 <xmx:sC87Yb0msFxokr42S9L5G6Y2zfJgAr2aczsrBgKCfClcQICCE521-w>
 <xmx:si87YQN2hUnYQsOgGvQTvrxTFtNspjeSypBFOHI5g2EpTPJd1ymhMjJQt9o>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:13:03 -0400 (EDT)
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
Subject: [PATCH v4 07/24] drm/bridge: anx7625: Switch to devm MIPI-DSI helpers
Date: Fri, 10 Sep 2021 12:12:01 +0200
Message-Id: <20210910101218.1632297-8-maxime@cerno.tech>
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

Let's switch to the new devm MIPI-DSI function to register and attach
our secondary device.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 1a871f6b6822..4adeb2bad03a 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1316,6 +1316,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		.channel = 0,
 		.node = NULL,
 	};
+	int ret;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "attach dsi\n");
 
@@ -1325,7 +1326,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		return -EINVAL;
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		DRM_DEV_ERROR(dev, "fail to create dsi device.\n");
 		return -EINVAL;
@@ -1337,10 +1338,10 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
 		MIPI_DSI_MODE_VIDEO_HSE;
 
-	if (mipi_dsi_attach(dsi) < 0) {
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret) {
 		DRM_DEV_ERROR(dev, "fail to attach dsi to host.\n");
-		mipi_dsi_device_unregister(dsi);
-		return -EINVAL;
+		return ret;
 	}
 
 	ctx->dsi = dsi;
@@ -1350,16 +1351,6 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 	return 0;
 }
 
-static void anx7625_bridge_detach(struct drm_bridge *bridge)
-{
-	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
-
-	if (ctx->dsi) {
-		mipi_dsi_detach(ctx->dsi);
-		mipi_dsi_device_unregister(ctx->dsi);
-	}
-}
-
 static int anx7625_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
@@ -1624,7 +1615,6 @@ static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs anx7625_bridge_funcs = {
 	.attach = anx7625_bridge_attach,
-	.detach = anx7625_bridge_detach,
 	.disable = anx7625_bridge_disable,
 	.mode_valid = anx7625_bridge_mode_valid,
 	.mode_set = anx7625_bridge_mode_set,
-- 
2.31.1

