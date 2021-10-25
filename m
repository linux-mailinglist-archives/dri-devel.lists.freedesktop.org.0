Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D09B2439A00
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06906E0E9;
	Mon, 25 Oct 2021 15:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A9C6E0B7;
 Mon, 25 Oct 2021 15:15:53 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D9D735806A6;
 Mon, 25 Oct 2021 11:15:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 25 Oct 2021 11:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=f9BQnijAQr4DY
 oEIbbbe0kkw4raHj0/3cZnDXHN/PgY=; b=bVpuUjCsz9JvKZNwHNbImG5cv9yXE
 SwYJuod/vXSvyNnQ60n6/EwPX/IXD2rCYwcDTfZG9fM4J2IZV31Rt3JZhp/OMK9y
 I1kLkNg4lR78mcnplr3/j97Z+Z+LD6rT4snSpPTzdP2ZvlIpuLStXCehIOtoZXMn
 U0jQ9mVMtfiB6pV9yan0GnW2LCHGU67yQ6fwWAsqHyolKcpISxqOnsTdYC3owYA8
 3uXPUftRiZo05a/tmL6s2Q0AZqYsG8myN89bkrtE2WTjpMuqpnmarSylHrZkZsCl
 MEx8rophf3hZdJIsnVK+q5jJw9xDkTLt8iPA4d9QoN3r+tgyu2jTNgLow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=f9BQnijAQr4DYoEIbbbe0kkw4raHj0/3cZnDXHN/PgY=; b=A9Lkt3L/
 5Til/Uu30VvxsNLEKKMCeIaZC6cW0qiAnybd3cjxw3gLhuwddsYd9sC5fczK9zm+
 iENY/RFsdkl6uzHPq70b2cd0fUwp+mOqDjwh4P4y9VhEZy03vB752o3Ib/RJO+a3
 sTd6oW718zNfiTgTtc1SHHQPYnph1bOOFGWBiVaKLuNYYquTcZBw5FFBTCgbW7fg
 3YieI7CAZ6+Ud+Yy9HEtHB6+LiOVdygqLOQaqOm1kraY2wVYkGuZ0mGatbXCw52E
 vRg6HhEsSaHPO5uDFkaGKT/l4ArLzwO1s2/PSt9W/Mt15kHotjoUQpeB/pY7ziiH
 4Txl+fPltBUOvw==
X-ME-Sender: <xms:J8p2YYrQQGflRfWGF-iV2__R825FIZ9ZqHQWVUfb8jenJmipTFiosA>
 <xme:J8p2YeriImUf-0xpDS1i_9sRLz3MHyaUwGGNge99OVA2Rdh-HmKOlG-_0bS28QdWi
 kZhnklCw98MR9Yr0K4>
X-ME-Received: <xmr:J8p2YdMx0Xr5vUWx277SQEuauf707WaURaa1lWdgu22XrDwEe4apmFUWZpZ9C54d7VMLAqvCzMeKIa2u_Bk2A2xZSc2qePitpw7exgIX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:J8p2Yf40PWuzDhkJ87-M1n8kkyPCQvAa-3hvAJcoDDt8tQVDSkmRNw>
 <xmx:J8p2YX6IFwHM0c20wBvs8yvAhnfhG5acjyvu9LphJiwLxt0JhmI8zw>
 <xmx:J8p2YfjttDShjSgcWzL08JngNCYqLPUdczh6SLPfuwmsxd3nFnPQ8Q>
 <xmx:KMp2Yb52HYNWDHwk7jqGWi00yUmV6FnrEcJdmiLbB0XJDMWh0V5AhA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:15:51 -0400 (EDT)
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
Subject: [PATCH v6 03/21] drm/bridge: anx7625: Switch to devm MIPI-DSI helpers
Date: Mon, 25 Oct 2021 17:15:18 +0200
Message-Id: <20211025151536.1048186-4-maxime@cerno.tech>
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

Let's switch to the new devm MIPI-DSI function to register and attach
our secondary device.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
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

