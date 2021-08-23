Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72C13F46D6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 10:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611EF89D2E;
	Mon, 23 Aug 2021 08:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3139C89D2E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 08:47:49 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A1A68580C63;
 Mon, 23 Aug 2021 04:47:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 23 Aug 2021 04:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=t/SKmLWmYjueN
 K244TlAYIicugAW8+1V0g1/mYOybmM=; b=XiRLKXhE77OvkP8kat/mbd8Krn9ol
 aW2kRjz2KTnsq8YTXWmVfRlvJ4uchc71jWQ7PQcAuOxu4OPS4x3W9ELXB9iNswkB
 SAWwbM+RObdFmZUU0vlFfHGQWZHryjxKGxi7XYamvkduc+fJZxGO6zzx+Hzy0h2I
 aHVQmdGN+VfQ21LrR/+mpSdLsyf/PeoH8xrRkaOuCVEMo8mqeOvRjR20XtDiUooY
 tV8JDfLajWtcKidM/xjia57Z89hqlbO0v2Idw74dP6x3Vkp4oFfsdsBDJT2aLTgj
 mq45nm6v8VcVWwdJi2cRtX5Q4suMgZZJOmVed21cMmKvwKEuc5RjWq8uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=t/SKmLWmYjueNK244TlAYIicugAW8+1V0g1/mYOybmM=; b=GKAl/8ro
 557QPPpFq5m6GIcTIjr/XaRmVYr9CEzuPFF42vIKlWTUzddBi7P5VNAc7PynVJ9U
 CtvoKVnjL+pnwONP3MWx+1m6bTVv2LQ4CPbIy0Lv9pWCglTd/LFqbwsmG4dYFwJg
 WSqRGSIEciewK4J9S03iko3uhomU6KU7mV/O4cQugqaeLH0EiAqrsZlweDA6qD9b
 gq2FwYBwksC9UeZRhaU6YfHiFk9/XcAOTd5xOBn1lbPxytB1S56JrtIVtGeDuqUu
 TUCKdf2YsqfvMC6bdrQ33BevEkRGGbCwdSJlrCcEHxQve2G8qBc0YBHzR8Zk1Abd
 mMpueC/2AEhrlA==
X-ME-Sender: <xms:s2AjYbVbaalkCE3KEbPyOmZM8lTP98kCaHLnyPN86OZoRtqTHAowrQ>
 <xme:s2AjYTnGEpP08YIkzMcIoji6amvR3pmonLB-3MLQNGxVMcmQjEzqX3qJKPjSgfO8h
 EHsPK35Vn17jg5DnU4>
X-ME-Received: <xmr:s2AjYXb0AZ-N2AJ0SjFocG6OZUpFeVLG_jufBk2dxLqTYGGmM6eGv31g9Xi9K9vbHnjGgtvXO61SbxHimdp9OzJj0dDCNpkQgnoi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:s2AjYWWGImuRk8-NN7Ri4OumEOaZZNSmZlEB9syF9F2vinoq7fKRRw>
 <xmx:s2AjYVm70Vmx9DP-GQUAwk0Yrot9To-gtuLf-ITsUtKSNacNz7w1qw>
 <xmx:s2AjYTdXkRFHCmpa5u4-dE25pGD7pxvGvfOv0vZMUaBhOD7E4nnkmQ>
 <xmx:tGAjYXn-3DCyHKqS6MPLGo-GGSXUhF_o9ShXT9EoIjOdSwSkAAkT3w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Aug 2021 04:47:47 -0400 (EDT)
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
Subject: [PATCH v3 7/8] drm/bridge: sn65dsi83: Switch to devm MIPI-DSI helpers
Date: Mon, 23 Aug 2021 10:47:22 +0200
Message-Id: <20210823084723.1493908-8-maxime@cerno.tech>
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

Let's switch to the new devm MIPI-DSI function to register and attach
our secondary device. This also avoids leaking the device when we detach
the bridge but don't remove its driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index a32f70bc68ea..db4d39082705 100644
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
 
 static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
@@ -697,8 +693,6 @@ static int sn65dsi83_remove(struct i2c_client *client)
 {
 	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
 
-	mipi_dsi_detach(ctx->dsi);
-	mipi_dsi_device_unregister(ctx->dsi);
 	drm_bridge_remove(&ctx->bridge);
 	of_node_put(ctx->host_node);
 
-- 
2.31.1

