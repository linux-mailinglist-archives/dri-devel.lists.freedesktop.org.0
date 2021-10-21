Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56949435BE9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B056EB98;
	Thu, 21 Oct 2021 07:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335F06EB98
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:40:06 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 5A0092B01309;
 Thu, 21 Oct 2021 03:40:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 21 Oct 2021 03:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=5Gfw0Ye3DNK3r
 X7uzANKxwehGkFTMuyO1T3oqn+/K9k=; b=mUYoLNefos0oyMTHxyQzb6chVUBUW
 9OwxHF1x1JVdo+srGiKB1k5CicggExjga8HwFmKckbv7v350M4jAs80fikRfEHcm
 6+YApNeN5J7/NZeQ5TSBGMMKJcnvlsnpxjWR+ypFGvCiFaWThM6gmmUPdhRDdU7l
 /hoeZ9XJ1rJiNRZRFUhQ7KDfIfOYkGsDT8GVTaYKv3eTmaUhxZENxyNYv5lNu1qZ
 bt/k9gqhOZ5qpbbjNT3Xfi1GxC7W37nQhe/99rRB0309LHESgKpWh0/Gp8ruLpoA
 KL+SBWLGJDkIuFV1myM44lJuIuDolKRMqNixMtH3vZYKHKgMlPc2iNnDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=5Gfw0Ye3DNK3rX7uzANKxwehGkFTMuyO1T3oqn+/K9k=; b=T/tnVtey
 Lj6bDuTLOAQY9OBYy04TcL5e7bFlrD+kKyq6ElMlyQepd6Y8ZQE8wHPchzZjpQee
 SgPcaSYsFKHnMVYCQTvcHCHsSYy2Z0ihlxh0/0NElq3CLLb8v968o1DESFBoP6kW
 lGQegh/nM9HETuZ813ZhaUDkvgmqQvSDVpswlVjJIXl4RxuP7Mprk6X81dpWeI1H
 puxsUGk6WbKc7w5dKJSE7gLcM3pMRhOaobDrf8o6Bq7Ula0WZGNcypYcS5rfj35m
 Ia5R5IFcfZJZE9vTs5hZJIRZ1Yt9PWp0XPuBnBBeqwwuiKwZKuGRHYxMd1x5GiDk
 uqqa++IR/cpcjw==
X-ME-Sender: <xms:URlxYfI96Z8em7eDDW2v4nPvm87NMNT8UAYrCvAq4qiJihBrMBo-kQ>
 <xme:URlxYTLoBOPCUEgCpUyzdYGt3sGeQI8ruiB-OUzSTohadqA21vu1Z9k16pdbvZV-Q
 RHfAvjK4pbMZ8cRLrU>
X-ME-Received: <xmr:URlxYXshLHOnHSAPywIqnTRo3Dx_tDcN59xy_wSC94O-OZ3TR_ecVpRGePYkSupHuUY-sOddNVVfiv-VireWlJFfu2P_a1_gEyqQJ5zK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:URlxYYYvJnzCRU1TLiAFiyMbKRhqcEd97iu0zKlqAFRe8uJgJsMq3A>
 <xmx:URlxYWZkwGqnyo9HQi3rHQPf0vxbEJdi3DAxWFdaVlQ6sZYmqwynAQ>
 <xmx:URlxYcD_DNGeSsIRSzQ1UDD2FC6O49No6GbWzrvscXY4f5MrSvh0Jg>
 <xmx:UhlxYYYMCnMhmIFa7D4evtTVdiJgT2JHiEtu8Y7z_6TVqJ8tKSSTseS_xy0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:40:01 -0400 (EDT)
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
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 02/21] drm/bridge: adv7511: Register and attach our DSI
 device at probe
Date: Thu, 21 Oct 2021 09:39:28 +0200
Message-Id: <20211021073947.499373-3-maxime@cerno.tech>
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

