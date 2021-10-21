Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EF7435BE8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3B66EBA4;
	Thu, 21 Oct 2021 07:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1D66EB9D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:39:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 23B102B012EF;
 Thu, 21 Oct 2021 03:39:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 21 Oct 2021 03:39:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jf5aJah++UV+M
 Th4CVC9+SEI69qBu7q3NX/pnOTWeXY=; b=cLmbFkQsEc72FIAxu6FKVrzTYEwTA
 SUKxiKFkXjOcYtYdVbURn192QLNpEB/VSgsNJQDHkwg7hoKTvQLjrat7m5/RZc8t
 Octwm24AX3dCV3cJVsYFLyzz05SGkmZpV79afIyj9PuL0QXJ4cYLFKuod2+8QsOv
 25H9Mg5YJrI9wfPqKg2sm3Ziq/8NOfCPWLTomnFCzvSKMHdlRaWEHyax25mnMvsy
 JynxfMbZUHfrIs1H3kB1vM3yI86a7ldzK5TVUik9bVf3Wmp8kfV7vpGfY0P/gSyx
 tcA0i6gHcZrkVDN7+v8B28MMZGDtEkf+OhVLlOd+CKRXVDnctNLDzYwNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=jf5aJah++UV+MTh4CVC9+SEI69qBu7q3NX/pnOTWeXY=; b=kMAHnTGf
 zfZFoOhCDgA6vimE3DawRuSjt9iu/u5KL0Rwd9uLRJHh53PB//e1EdKV36rujzdk
 mgPJeC7VjzSsJsj/BQM9NwlBxoFcUT3Dzf79mrK/mFy1SMYDY1G/8m8NW7paHj4A
 zfkrR02AV6iZ9ghzD7lyNcfrVGDdeE4MRJoYxPCwqaPjljbWYmSSVsDBO6RarwlF
 sy8kYwgcOpwXV/otL4M8hJQQRyxagYNPMxP5aUkC7w0pp8EBwB6Mx8+L+v8FnPTM
 flP7lVBrgO2/m6g1WDrUN2EGorLlVRzoAggB6SivNDCvjGSr2fx2+v5K/3FqI178
 9SOz5bppDda/AA==
X-ME-Sender: <xms:TBlxYQeQxoJiS4JCAgtIPF6g6SUcm8nnKCwPiKQeWAqfGK8vOhmbmg>
 <xme:TBlxYSO5WzSTTgY3iw-dJAJZW4hXgPJ_qVG5fHCZG6do_eIBXxHvNHPK9rKXGZrSw
 z4tbXAGdapthUkau08>
X-ME-Received: <xmr:TBlxYRieB7ET98AHw5IdBLBj5ID__2IowyCXLK70_Fc-B8cu-WFqJ0MrKFfIBsZyWSXixsDo86yhpNdKV6M17EHCgvg29nnWnZwea5-T>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TBlxYV9MSwu7T_0hOwvCWJZFu_tR1XeEyWC7OlRcQteOqU3_2osWuQ>
 <xmx:TBlxYcuihHt8lBIoqrGI0NugFc4kd5sLe5Pj9oOQS8qG13yKfj-Ujg>
 <xmx:TBlxYcFOxl9eHx4bBDzR3ir4iSjRZc9CrK-6nnEcBsg9RQ1QQKhrZA>
 <xmx:TBlxYQfwg8Yo0mA-1MeXIkOLRuAWMX-5w2V7M-nk8kiIo8vPAJ8lUrmWCTY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:39:56 -0400 (EDT)
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
Subject: [PATCH v5 01/21] drm/bridge: adv7533: Switch to devm MIPI-DSI helpers
Date: Thu, 21 Oct 2021 09:39:27 +0200
Message-Id: <20211021073947.499373-2-maxime@cerno.tech>
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

Let's switch to the new devm MIPI-DSI function to register and attach
our secondary device. This also avoids leaking the device when we detach
the bridge.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 -
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  2 --
 drivers/gpu/drm/bridge/adv7511/adv7533.c     | 20 ++++----------------
 3 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 05e3abb5a0c9..592ecfcf00ca 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -401,7 +401,6 @@ void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode);
 int adv7533_patch_registers(struct adv7511 *adv);
 int adv7533_patch_cec_registers(struct adv7511 *adv);
 int adv7533_attach_dsi(struct adv7511 *adv);
-void adv7533_detach_dsi(struct adv7511 *adv);
 int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv);
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 76555ae64e9c..9e3585f23cf1 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1307,8 +1307,6 @@ static int adv7511_remove(struct i2c_client *i2c)
 {
 	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
 
-	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
-		adv7533_detach_dsi(adv7511);
 	i2c_unregister_device(adv7511->i2c_cec);
 	clk_disable_unprepare(adv7511->cec_clk);
 
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 59d718bde8c4..eb7579dec40a 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -153,11 +153,10 @@ int adv7533_attach_dsi(struct adv7511 *adv)
 		return -EPROBE_DEFER;
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		dev_err(dev, "failed to create dsi device\n");
-		ret = PTR_ERR(dsi);
-		goto err_dsi_device;
+		return PTR_ERR(dsi);
 	}
 
 	adv->dsi = dsi;
@@ -167,24 +166,13 @@ int adv7533_attach_dsi(struct adv7511 *adv)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 			  MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach dsi to host\n");
-		goto err_dsi_attach;
+		return ret;
 	}
 
 	return 0;
-
-err_dsi_attach:
-	mipi_dsi_device_unregister(dsi);
-err_dsi_device:
-	return ret;
-}
-
-void adv7533_detach_dsi(struct adv7511 *adv)
-{
-	mipi_dsi_detach(adv->dsi);
-	mipi_dsi_device_unregister(adv->dsi);
 }
 
 int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
-- 
2.31.1

