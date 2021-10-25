Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0272C439A1B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C6A6E0BC;
	Mon, 25 Oct 2021 15:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D23B6E0BC;
 Mon, 25 Oct 2021 15:16:19 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7B2E55806C0;
 Mon, 25 Oct 2021 11:16:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 25 Oct 2021 11:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=aINb3yyNPEGy8
 1/IksR4f28ybF+VpRvrF3mAjvmMCck=; b=m2TmID25oAKCCRNJ4zWZNB5aWejsb
 n7WYWtbVGlSbS0dMzMv26gC+9l3Ehzj1obMWdyE0HxGW4wYaOZRZTw3QID9X8hmL
 xqvP2IQN8PUm/BeQhW6w5hGZwZ3tZWS1tJXdqoQ9uzjn+u9Lw76Ah6E+VmHHN4LR
 fkK6E/YNGkMKh3B6Fpz4A3sN5p85QttLz2ElZA2z+62sCkfJRJwQTJWT55sgArtf
 N9wGiVQWtE2LMMccBAQkh6eO3ZHEKHapJUlQvoOQ58iOHIvAIkrZzbRyjKDo7G4z
 7oN/ckPA+2s5aEqpwgE3IAAf1zIYRY/PKnxPiq0v6dsgUbJYj6AadW9HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=aINb3yyNPEGy81/IksR4f28ybF+VpRvrF3mAjvmMCck=; b=QxNL/KMm
 gNifumTn7jZ7sn7osNTjOBm3g6jfTZLQcPqfKACTlaimUdZHOTUQuBG314n00h3o
 DF1hY/WuQOEKndIeYbvxaqbbuSdVO3zxoK4bVHzjE7y5ZyCBpxyp8gJqdQgG8v3a
 cTWDz0IvbMW6tuZUGNtst8qxHnXOEQQKe1lad+N3yScaOtRgmnKlAHizs8Q8E19b
 LChRUUPOv35KT+X+wFgrYduKWmdW0rUon8YI9ZcL81YY4cCi54T2Zq5JY5ZdiAR7
 TLY5LXquoydjcgOjA8bFF+jhdcohvz5nGQ21eHcpfUyPO5S27tgi7ss+yqgIU9w5
 5gl3jD+3WbeG6w==
X-ME-Sender: <xms:Qcp2Yd3miyaDSKImCrIn8vRRjzb54BMLmpBV3jfirkqNPyU4c-vvRQ>
 <xme:Qcp2YUH2rdyEAUBuOXsSJJRrjheUCfaQDWeg9B_T-jb8ybnz70EfeLMZddyFfvhf5
 26rT8oNHtNSpJ5CIJ0>
X-ME-Received: <xmr:Qcp2Yd6XnJrpjkiOzXw1WWw-Tg-wlDBe2L03AGyDNCejVhkXHXbyILMbxBFPFmk2PxgozTMc08HgVxGdxtnxKEDr5mKmxfLZ9EtDWBXb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Qcp2Ya2JqU6_KPZPHBBq765PY7QbY8Y1MTCJuRrm-4WuBkqY6n7BIQ>
 <xmx:Qcp2YQHRoP1EfOxMEwKIxGqpvt8TIWwew7kurU1HtHhD2_5tNCDbTA>
 <xmx:Qcp2Yb9_EoV1H9wFWTbBrgqxXKd5ttt0rPB14UmdRwrXdMI4as3i9w>
 <xmx:Qsp2YYTZTia2MsZtFevDNy7LfHr2nrpqMKmzKCXCLBsU13CciTrKuA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:16 -0400 (EDT)
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
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v6 14/21] drm/bridge: sn65dsi83: Switch to devm MIPI-DSI
 helpers
Date: Mon, 25 Oct 2021 17:15:29 +0200
Message-Id: <20211025151536.1048186-15-maxime@cerno.tech>
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
our secondary device. This also avoids leaking the device when we detach
the bridge but don't remove its driver.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 3bfd07caf8d7..539edd2c19f5 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -262,7 +262,7 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
 		return -EPROBE_DEFER;
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		return dev_err_probe(dev, PTR_ERR(dsi),
 				     "failed to create dsi device\n");
@@ -274,18 +274,14 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach dsi to host\n");
-		goto err_dsi_attach;
+		return ret;
 	}
 
 	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
 				 &ctx->bridge, flags);
-
-err_dsi_attach:
-	mipi_dsi_device_unregister(dsi);
-	return ret;
 }
 
 static void sn65dsi83_detach(struct drm_bridge *bridge)
@@ -295,8 +291,6 @@ static void sn65dsi83_detach(struct drm_bridge *bridge)
 	if (!ctx->dsi)
 		return;
 
-	mipi_dsi_detach(ctx->dsi);
-	mipi_dsi_device_unregister(ctx->dsi);
 	ctx->dsi = NULL;
 }
 
-- 
2.31.1

