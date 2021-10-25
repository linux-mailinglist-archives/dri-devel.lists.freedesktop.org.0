Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 077824399E2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5C16E0B6;
	Mon, 25 Oct 2021 15:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825886E0A2;
 Mon, 25 Oct 2021 15:15:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id C2F9F5806A3;
 Mon, 25 Oct 2021 11:15:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 25 Oct 2021 11:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=5Gfw0Ye3DNK3r
 X7uzANKxwehGkFTMuyO1T3oqn+/K9k=; b=P5EMnb1ekZDI1k/CC/mvv7kCx4xnA
 3pU3+repiQefiSkwTQB947q0AwcW+YzZRGjB4MwGPWCueIPmg5KMvKVdcrA2e1fL
 RApAa/lc41R/oR0oqAuAAPubiylpiTqG70nVJyO8mnwHtAijKT6p50qBUHhTc712
 rmdoDFy9NSG7Knu4bLTVcvs5/v0n/rqBmCMkatfWg8L0h/qqUpFR9nfpmlWoaql1
 Nlm2o4cxnZF7XNKfiXa/6ZSpTGuiRARksqm5peLbE68CipMCAOh/jhwzgKt0t6nJ
 paYKcmxKyY9S/uJgTEOM02ZYKqM8dUWrKzLv2iPjOabyXkBNb2RSqJkQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=5Gfw0Ye3DNK3rX7uzANKxwehGkFTMuyO1T3oqn+/K9k=; b=nA7BuaK2
 2GzKm571kgkoP0wHtx6tVdnJ5+4IS/dQHwIIQaBQ3iXXMADSyNXktBPLRT9zeY8p
 8QlUuRVKux3TSM6Gb6XyuAmJj/wKjTRcbDQuQI9vOwweOWbEj4AYSNANNbcUQejV
 E4KiArFZWmbmBFSmaaZYXRpuqtOnUPV8i22QEWLWuCNJ3M2eh8oufBDYAu5BBd5F
 hEXIp7W9iLr4mDwXqF+xtt7YfMDuOW6UWnBEOQnts68yD8xvgWUuNjBezlfoNTYj
 +mlgsQuKAqAJ272GUGrGImyM1bYN5hJijPxegtNK9CwejeZimFG6mwwTWFjvR5Tq
 RrJVj45y0cLQhg==
X-ME-Sender: <xms:JMp2Ya1J3VacOp6wDP6JnIbJUSzYPfdquakm7RII3oPrFXAKTwleVw>
 <xme:JMp2YdHo2wVNtRBhQmUf6o5P4y_OmuA0SdQm8yGgI247PjW2jZuQGSPvzIBaBuB3l
 oJ8cR9DmAZXeii1YQM>
X-ME-Received: <xmr:JMp2YS4_2uctAOlnpm3K7-6UnK7_4GUcnqbW8Mv-Ho_Aqn9tV0wCmF9yV5hlqV1IAr2gf2K843DnRLS9BTZKf1h6_DfpWcIdVdB9nA0K>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JMp2Yb2m-zPEt5gHKKXjwa2crV34RXNnFQDzN-zkdHCpQaR0N6DcSg>
 <xmx:JMp2YdGQcxI21fQXZTWtgATevpTYRFLlSoxBGTqNLmFnNjBTnTO2hQ>
 <xmx:JMp2YU8L4-6Qn0QWqQwdeGDnWzmgRIEMzynFoBrjZd3gP-JYgOVFQQ>
 <xmx:Jcp2YZULML5K9YIilgvg23KJnGl3-ZUt_xAfbAfVuFNVWOHMu7rLQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:15:48 -0400 (EDT)
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
Subject: [PATCH v6 02/21] drm/bridge: adv7511: Register and attach our DSI
 device at probe
Date: Mon, 25 Oct 2021 17:15:17 +0200
Message-Id: <20211025151536.1048186-3-maxime@cerno.tech>
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

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time. Let's do this.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 9e3585f23cf1..f8e5da148599 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -910,9 +910,6 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 			return ret;
 	}
 
-	if (adv->type == ADV7533 || adv->type == ADV7535)
-		ret = adv7533_attach_dsi(adv);
-
 	if (adv->i2c_main->irq)
 		regmap_write(adv->regmap, ADV7511_REG_INT_ENABLE(0),
 			     ADV7511_INT0_HPD);
@@ -1288,8 +1285,18 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	drm_bridge_add(&adv7511->bridge);
 
 	adv7511_audio_init(dev, adv7511);
+
+	if (adv7511->type == ADV7533 || adv7511->type == ADV7535) {
+		ret = adv7533_attach_dsi(adv7511);
+		if (ret)
+			goto err_unregister_audio;
+	}
+
 	return 0;
 
+err_unregister_audio:
+	adv7511_audio_exit(adv7511);
+	drm_bridge_remove(&adv7511->bridge);
 err_unregister_cec:
 	i2c_unregister_device(adv7511->i2c_cec);
 	clk_disable_unprepare(adv7511->cec_clk);
-- 
2.31.1

