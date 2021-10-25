Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9706B439A26
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118046E13C;
	Mon, 25 Oct 2021 15:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974256E0F4;
 Mon, 25 Oct 2021 15:16:11 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6F1995806B2;
 Mon, 25 Oct 2021 11:16:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 25 Oct 2021 11:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=iaT5PVQQV1J3N
 O3ZCJQqw6ZfLRU5QGqUsJkfrgMTcgM=; b=hN3mZMGzKW8/yHkDd1m8/UyOcbRQD
 184FpAHBKvjZNyjplpO4fb7htpFzHOoaeQC7Wg1lJFtGmg4C7erIrCuIrSzDepMQ
 doe14HmHKDq9W36F+AufHUrhk8+JqWfVZdWhPXjFStJRsJwpJ2XHdBUlocpNhEUm
 pNYOtQSGT7EU8ovomLlm/Kf8CaP5zjanGP1H6Ml/HOhxOp/tvEKoO65jtv4QDxQq
 If0dzjUxg+SmsPSs8fe8xI3vxXjosqIEiWz69r4QWq0ltTEon9+TF7b2h0tGVk5b
 2dBRfUCvZZlUz+a/NW6XJ2/PxXWoppnTRrAVBBwzs6E+ArUKtV7pU8Xrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=iaT5PVQQV1J3NO3ZCJQqw6ZfLRU5QGqUsJkfrgMTcgM=; b=k6r+zB43
 oqsMg2sr/8QLF2FVlmmH7qi2V0k1P5jmqLOsxhgVDUR91YzrVvNR7pcdNMIn8XVt
 AyWqL0rom9sOXWp0NlBdmtYrbrP5dSLNqidzLop0TgFksGowJoXKRv4QYieait/t
 0wtxrmzBelp+qikDpNKx6mVyHC94BrMBu49T+Tt61xo7xw9UvTWERKVk8wA8ueR4
 GS0XfPtrlaKoiZOqj9Ehehtf0EdAlTKOY4O9XOrowHMNl7H0HBUoqJQE5GRB10FC
 Kf0WkMhtSmdjZPsie6vyJfZa+cWrMtTPQSUX6Y9OTro0pDBlAQllo8rU4q0OuWg2
 lGEF2H/QpMzAIQ==
X-ME-Sender: <xms:Osp2YfsRGQbHo-XAUloEGIAYoHhIiHx1QfQxcL2OoV6DZIVOtz91ww>
 <xme:Osp2YQdGLqTHmn7Cfd24AIstnA-_EpPQRRaiXdXqflpQC2C-M48qROVSCH4fGeMYh
 vhAAai8XiaCV0Qh3Co>
X-ME-Received: <xmr:Osp2YSxzchI1VoQ9o2hHN-xrVxX37gzfFu3CzCvLdSILgXnKMOFPnOALpXzbypsFCTvxm5eGMW_rwvl7m52mwgaDk9WMU4ZN2gV28ucE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Osp2YeP9p0cw7ksxd-r6Aec2Ucj2b3zq6SEpnqQwH3SylqiTUCOSpg>
 <xmx:Osp2Yf_PKJQpQRyg1TndPs5iyz3XReh7TIo1_DtmMF3Bhq0vVxKMvA>
 <xmx:Osp2YeVFOiKP7AW-FBQTyW4v6stjMMTZXVJRyCvNauEE_m0JBQfKIg>
 <xmx:Osp2YStJlgYGh_yllNP2F3lDaPnINf4jvfOOcm5kXdANdIXP28Wt2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:09 -0400 (EDT)
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
Subject: [PATCH v6 11/21] drm/bridge: ps8640: Switch to devm MIPI-DSI helpers
Date: Mon, 25 Oct 2021 17:15:26 +0200
Message-Id: <20211025151536.1048186-12-maxime@cerno.tech>
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
our secondary device. This also avoids leaking the device on removal.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 3aaa90913bf8..5ae15fc407c5 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -428,7 +428,7 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 	if (!host)
 		return -ENODEV;
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		dev_err(dev, "failed to create dsi device\n");
 		ret = PTR_ERR(dsi);
@@ -442,27 +442,22 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = NUM_MIPI_LANES;
-	ret = mipi_dsi_attach(dsi);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret) {
 		dev_err(dev, "failed to attach dsi device: %d\n", ret);
-		goto err_dsi_attach;
+		return ret;
 	}
 
 	ret = drm_dp_aux_register(&ps_bridge->aux);
 	if (ret) {
 		dev_err(dev, "failed to register DP AUX channel: %d\n", ret);
-		goto err_aux_register;
+		return ret;
 	}
 
 	/* Attach the panel-bridge to the dsi bridge */
 	return drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
 				 &ps_bridge->bridge, flags);
-
-err_aux_register:
-	mipi_dsi_detach(dsi);
-err_dsi_attach:
-	mipi_dsi_device_unregister(dsi);
-	return ret;
 }
 
 static void ps8640_bridge_detach(struct drm_bridge *bridge)
-- 
2.31.1

