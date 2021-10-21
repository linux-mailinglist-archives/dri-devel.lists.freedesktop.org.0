Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD1F435BF8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620596EBA6;
	Thu, 21 Oct 2021 07:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DB46EBA6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:40:28 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id C97472B01326;
 Thu, 21 Oct 2021 03:40:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 21 Oct 2021 03:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Z7ANxwSCuwS0R
 URLyvuze3uqYVQmNE0MSkpaXoK8tPE=; b=S1EzMFnxy4kNWJo+cTu2XtTqcpphR
 D3XH1/o7K8R9yLShBNpgQ8+Dm+LsSREMt0FtUyX6WybOTk8X7yrgSR1orFq6Vxg1
 oPvHYR1pXmBLU52pxByDkTmysXnA0vyK9mj9QZI/YFh3tpeD7J/IKska6j7MN1uh
 PY7rXv+x0hcXHFx12YsACALyfgpNR76rtmA6wBETJ8OTo5H5mNvCllIs/Jjgjiej
 gZ5W7a6qQDZbtY6XrBK0JlVRevu4xVHvBzJYXZxbs4S21iKgR/T8pcDWpmcC2INy
 Vmkr0GvolbqcN5qLyLlpNf+hhs5M8PZ2+J2i//Q63uIa1Qk9UW0h/3sjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Z7ANxwSCuwS0RURLyvuze3uqYVQmNE0MSkpaXoK8tPE=; b=giF8fL1D
 1OeOW0QDfp7EvRHqtSETGDuhyr5gyLK9mMWoZcgWpBrAiQ8DwUFeFiTnqojTM2Ng
 1h087Ch3E9L3pYIz/wzPh0VYa0bDs8dspatLEhcyIfJVkD5WAfQiqn6gSh1HfIUB
 lSCaPU4kSI2By50Di5zJI4x2myRtyLnchstibCJFhsnUvVUjZruN2wtJQk+TR/4P
 8e0ju+DB8mNYLXovh9GE21s+c/4UBoATqDzGG5CHOMm8XA+EdcMRuTbozsFcIdFO
 9QFz2C+bmzU+laVoLEcr8XKu+R9LdpY08WWDXfgYX1eyTHab9PazasRP7AvUQzZb
 CNmTXVMM5NBgVA==
X-ME-Sender: <xms:ahlxYY9gei7rOIUjf8j4VbWGlJAn8LEnuxZuTUsSRJwQxylVZUMcOw>
 <xme:ahlxYQuzpQrImdNuUZCuNywGmkNT5TNqeIinZlMy0NTcJH4OBK9Tr0nWMp_RGSawf
 tBdyoz50ZGWezzNImA>
X-ME-Received: <xmr:ahlxYeB17fah-IsZBRPuzjjbMQnSts_s8vlV1jxJ_jy7mPaK_31zdZHcmYjfkzEFPOOnYjkABPngWIOIeigJspyf3yFB4EGacfijAYx2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ahlxYYfcZarsFdSfx2K0FIjaWKYIMhI_RvLb9sTKuUrEMQQHTH89rw>
 <xmx:ahlxYdPzN6zq0vQtLQPF0lFudVn7m2htMvthqgeHiGf25iQNjpX70Q>
 <xmx:ahlxYSn_TNqahGYXSOhfmnDsGEURjajY_kwa86EWLjuC_iq5f_6K4Q>
 <xmx:ahlxYW_0cmp0oZrpZXs92btWCQa8KFt8kQz083AEEvp4AeUd9pZl1vlXm4M>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:40:25 -0400 (EDT)
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
Subject: [PATCH v5 07/21] drm/bridge: lt9611: Switch to devm MIPI-DSI helpers
Date: Thu, 21 Oct 2021 09:39:33 +0200
Message-Id: <20211021073947.499373-8-maxime@cerno.tech>
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
our secondary device.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 29b1ce2140ab..654131aca5ed 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -760,6 +760,7 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 	const struct mipi_dsi_device_info info = { "lt9611", 0, NULL };
 	struct mipi_dsi_device *dsi;
 	struct mipi_dsi_host *host;
+	struct device *dev = lt9611->dev;
 	int ret;
 
 	host = of_find_mipi_dsi_host_by_node(dsi_node);
@@ -768,7 +769,7 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		dev_err(lt9611->dev, "failed to create dsi device\n");
 		return dsi;
@@ -779,29 +780,15 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 			  MIPI_DSI_MODE_VIDEO_HSE;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
-		dev_err(lt9611->dev, "failed to attach dsi to host\n");
-		mipi_dsi_device_unregister(dsi);
+		dev_err(dev, "failed to attach dsi to host\n");
 		return ERR_PTR(ret);
 	}
 
 	return dsi;
 }
 
-static void lt9611_bridge_detach(struct drm_bridge *bridge)
-{
-	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-
-	if (lt9611->dsi1) {
-		mipi_dsi_detach(lt9611->dsi1);
-		mipi_dsi_device_unregister(lt9611->dsi1);
-	}
-
-	mipi_dsi_detach(lt9611->dsi0);
-	mipi_dsi_device_unregister(lt9611->dsi0);
-}
-
 static int lt9611_connector_init(struct drm_bridge *bridge, struct lt9611 *lt9611)
 {
 	int ret;
@@ -855,9 +842,7 @@ static int lt9611_bridge_attach(struct drm_bridge *bridge,
 	return 0;
 
 err_unregister_dsi0:
-	lt9611_bridge_detach(bridge);
 	drm_connector_cleanup(&lt9611->connector);
-	mipi_dsi_device_unregister(lt9611->dsi0);
 
 	return ret;
 }
@@ -952,7 +937,6 @@ static void lt9611_bridge_hpd_enable(struct drm_bridge *bridge)
 
 static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
-	.detach = lt9611_bridge_detach,
 	.mode_valid = lt9611_bridge_mode_valid,
 	.enable = lt9611_bridge_enable,
 	.disable = lt9611_bridge_disable,
-- 
2.31.1

