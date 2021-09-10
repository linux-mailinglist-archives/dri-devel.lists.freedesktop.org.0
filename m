Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 809E54069A3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92426E9C1;
	Fri, 10 Sep 2021 10:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57106E9C2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:13:16 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 27DCF2B012B6;
 Fri, 10 Sep 2021 06:13:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 10 Sep 2021 06:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=f7+8rOA2zq11N
 06RP7ErbqsdE2zZLyFKicXjgncFrp8=; b=hDJqzOlWGKIGekmk5j7vrdoL/C5cA
 NabEDOqP0Elhw7Ta/TVcdLrp4Eg2KUejSVQh4DvZegjT7AGCQoykELygYMOa1b4V
 xr+UQrl3iB7bzB/ZsxwEuOddFxPAcjEk69QUyh5YBGVWi1fX6ZdeyVsxpM5gimGk
 P3bxDK4IKIsZvcbcQ1GkMzRnpMsFXy1swaMfesFQCb5rDaG4i2d4g5BFZpYCA7RV
 jPvvi/81cHa72F9Mrjg9tTtmNhTHnSdDi841e4H0kZyWxj0cuJa33dDHajEqfpH/
 5SdsEud3pRTUwUE0ZqFHVyGN5+AVc3Bh0HKledQoSN2FFsxtGEtj4g/cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=f7+8rOA2zq11N06RP7ErbqsdE2zZLyFKicXjgncFrp8=; b=Y3mV7C3H
 g76lPMblNGpqcUbqArr7lcpTdEfxjgfU0mqcP8kUkZR1EFWFfAQOR6Ys6MUSkAvJ
 uAGn1EAo51MHjfmY6il3Mbey5tF6rvWfbbIKhujcZCpTC4GyQBWiH2loPQcmAbfA
 U2lUcbRuBalTLFO5Eyj/vFux9iImORCRN9tqULHEq9NH6P8yqQun0JZFAshkxCUv
 o+AP4InnE1Uw9TeBxaJHQQSgKNM5UNJZhw09fAJhv2dOO5OQip8B+Aj4hbvZ6DxQ
 e2ZZ76aqUKv0EGrnH0d5ltu8xSK4lbVq6xgVhzcjOHBt63+lmNnbMYSBG+Kf3T32
 FxebiIYMseWvZQ==
X-ME-Sender: <xms:ty87YbE7_5edAPxuY0W1iJr3Xqmgdg0M7VX3fFgXPT04fNEm0n1cPg>
 <xme:ty87YYWMb9T9aA3ZGpcPwgxwe6Kfh30cksEfH5FEnyoWom5mjscHdNBXM3hzO3wUi
 h6vILdS3wh43FuQaX4>
X-ME-Received: <xmr:ty87YdKquoP8H92FVH4C5iysTMKGbiO1cV6NFKHDWl9FobY4U3kfcCmMS0xGhmjxfgbN2fgObXmzr87UVkn7bmIG16JWFmbZJxQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ty87YZHTbqb1HdrDlESsZtVlAOrGCjV6pV1Rr_Y4CaAXrklnY75xtA>
 <xmx:ty87YRUfNHMPcdGDxi9vxJnNVx6s3cU_qUgQAxjAKSAdm6tX5v5hwg>
 <xmx:ty87YUO2YD_JlfgXyPZVabapgm9BNKz4vUngxZHfaH10mslgWsax1w>
 <xmx:uS87YYlAwur81MXrCrz4QOAofXdcC-g5ki_V6uH_0boRHpP4BwF6GP4Ax7g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:13:10 -0400 (EDT)
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
Subject: [PATCH v4 08/24] drm/bridge: anx7625: Register and attach our DSI
 device at probe
Date: Fri, 10 Sep 2021 12:12:02 +0200
Message-Id: <20210910101218.1632297-9-maxime@cerno.tech>
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
 drivers/gpu/drm/bridge/analogix/anx7625.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 4adeb2bad03a..d0317651cd75 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1367,12 +1367,6 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 		return -ENODEV;
 	}
 
-	err = anx7625_attach_dsi(ctx);
-	if (err) {
-		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
-		return err;
-	}
-
 	if (ctx->pdata.panel_bridge) {
 		err = drm_bridge_attach(bridge->encoder,
 					ctx->pdata.panel_bridge,
@@ -1845,10 +1839,24 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	platform->bridge.type = DRM_MODE_CONNECTOR_eDP;
 	drm_bridge_add(&platform->bridge);
 
+	ret = anx7625_attach_dsi(platform);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
+		goto unregister_bridge;
+	}
+
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
 
 	return 0;
 
+unregister_bridge:
+	drm_bridge_remove(&platform->bridge);
+
+	if (!platform->pdata.low_power_mode)
+		pm_runtime_put_sync_suspend(&client->dev);
+
+	anx7625_unregister_i2c_dummy_clients(platform);
+
 free_wq:
 	if (platform->workqueue)
 		destroy_workqueue(platform->workqueue);
-- 
2.31.1

