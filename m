Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9F1435C09
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34856EC0C;
	Thu, 21 Oct 2021 07:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E186EC0E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:41:13 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 369122B0041E;
 Thu, 21 Oct 2021 03:41:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 21 Oct 2021 03:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=IjJ7Xg/H84lYB
 rLNnbeRdHfHU/7mTRchCznYNagdcAY=; b=LyUaKYLH0kcqISbLnmU7sV/YXwVDW
 ZK+PFB/ikBYxIRt68IJ/5hhqvdPT67JRYSFehAGwBsdlkN+512JrGFLY9lFUo1wq
 wF0fYONzSi9K4b3W7pdiRvbqElia23ZhW+yd+fmBn69XAowp7yTw8ySFx820AdnR
 E8hg0pkrWjDk43dEzQV+ulRWgI13RyOhjUrTEbleBD0D5PoDW4Xlks2HM8zbaHbj
 q0S6BAHDNiGGe8iJtLDdZQYTizHoZ0Hp0E4k/4TxDGvamHqgQOnF405Ow954YI/E
 JnphBWBVNOIp97KueoVp9s4tsoDUtINCqz2F244W5uqhyW42FF9eZ3QDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=IjJ7Xg/H84lYBrLNnbeRdHfHU/7mTRchCznYNagdcAY=; b=eKCsAx4T
 OIsGhqbGD3/BfVNYl4xAVnV6IuBCGNV8lo824neSJ9Q0JBRxcJWGMLXOH/tmAAzl
 5nHmiLJNVvkgtBpzmST98uG2Ik6HutWL2dzoWns3ML9Wrf64YUyAriGunE71C1bm
 5D2T/LiQv3e2C2hKR4ci9kwm3XmQ52r0MupwLJZps+hSJAxs34fwNYhu6OmQ4Gez
 Xa2so4NPoMpl/v5eybeh+k9tjxXruwj7DYszOP7tikRGaA7aQzeJFN13xOz+YFbV
 S3wSJGPuQoIhuZrUFZLTLEMzWT3aR8e97FaPuYX1cmh/0Ok0JhSYjit+BPzkRkwV
 54u+8Edhigz8GQ==
X-ME-Sender: <xms:lhlxYZDBTrLEhSJWHXB9hcFhHNzWdXuyF9npYSFymJO8arCwZPbctA>
 <xme:lhlxYXjmJUaZ-NeAMK11c4j5t5VlZXOEiLSz4R6pjobtCY4Qxcm6TsH2aw2SE8ZXK
 3uYjkoKyQt9OC-C7QY>
X-ME-Received: <xmr:lhlxYUlJM2mtKPqQI4_AUwlt0UfGlNYEv4U1orFhM-PQu1cWry_w3czm1iBErBdhu6JD7A-mexZbFkEuuVihMRnLPa2Va8tEC6_9akO3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lhlxYTw23QBCKAxwbdENIU5oF9vYG8Fc9hcdZn_8XG4baIlXfVVZtA>
 <xmx:lhlxYeTDfWAeAmX8NQQXbs5Soy9jWz5UPJpzKmyptinIUygugr-kxA>
 <xmx:lhlxYWbcoeJD_XmbRWzbM6ft-NZ0ZHlnbfJ75yysuXyHWGfgF8eHwg>
 <xmx:lhlxYSw0-DFrhuLXjNp1t5dP5KXB1YC18W3v7BM4r0RaUkuIS6cm8ISrSYY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:41:10 -0400 (EDT)
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
Subject: [PATCH v5 17/21] drm/bridge: sn65dsi86: Register and attach our DSI
 device at probe
Date: Thu, 21 Oct 2021 09:39:43 +0200
Message-Id: <20211021073947.499373-18-maxime@cerno.tech>
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
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 77 ++++++++++++++-------------
 1 file changed, 40 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 36a82e3d17ab..b6ce6776cdf1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -655,58 +655,27 @@ static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
 	return container_of(bridge, struct ti_sn65dsi86, bridge);
 }
 
-static int ti_sn_bridge_attach(struct drm_bridge *bridge,
-			       enum drm_bridge_attach_flags flags)
+static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
 {
 	int ret, val;
-	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
 	struct device *dev = pdata->dev;
 	const struct mipi_dsi_device_info info = { .type = "ti_sn_bridge",
 						   .channel = 0,
 						   .node = NULL,
-						 };
+	};
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
-	pdata->aux.drm_dev = bridge->dev;
-	ret = drm_dp_aux_register(&pdata->aux);
-	if (ret < 0) {
-		drm_err(bridge->dev, "Failed to register DP AUX channel: %d\n", ret);
-		return ret;
-	}
-
-	ret = ti_sn_bridge_connector_init(pdata);
-	if (ret < 0)
-		goto err_conn_init;
-
-	/*
-	 * TODO: ideally finding host resource and dsi dev registration needs
-	 * to be done in bridge probe. But some existing DSI host drivers will
-	 * wait for any of the drm_bridge/drm_panel to get added to the global
-	 * bridge/panel list, before completing their probe. So if we do the
-	 * dsi dev registration part in bridge probe, before populating in
-	 * the global bridge list, then it will cause deadlock as dsi host probe
-	 * will never complete, neither our bridge probe. So keeping it here
-	 * will satisfy most of the existing host drivers. Once the host driver
-	 * is fixed we can move the below code to bridge probe safely.
-	 */
 	host = of_find_mipi_dsi_host_by_node(pdata->host_node);
 	if (!host) {
 		DRM_ERROR("failed to find dsi host\n");
-		ret = -ENODEV;
-		goto err_dsi_host;
+		return -ENODEV;
 	}
 
 	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		DRM_ERROR("failed to create dsi device\n");
-		ret = PTR_ERR(dsi);
-		goto err_dsi_host;
+		return PTR_ERR(dsi);
 	}
 
 	/* TODO: setting to 4 MIPI lanes always for now */
@@ -721,12 +690,38 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	if (!(val & DPPLL_CLK_SRC_DSICLK))
 		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
+	pdata->dsi = dsi;
+
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		DRM_ERROR("failed to attach dsi to host\n");
-		goto err_dsi_host;
+		return ret;
 	}
-	pdata->dsi = dsi;
+
+	return 0;
+}
+
+static int ti_sn_bridge_attach(struct drm_bridge *bridge,
+			       enum drm_bridge_attach_flags flags)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	int ret;
+
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
+	pdata->aux.drm_dev = bridge->dev;
+	ret = drm_dp_aux_register(&pdata->aux);
+	if (ret < 0) {
+		drm_err(bridge->dev, "Failed to register DP AUX channel: %d\n", ret);
+		return ret;
+	}
+
+	ret = ti_sn_bridge_connector_init(pdata);
+	if (ret < 0)
+		goto err_conn_init;
 
 	/* We never want the next bridge to *also* create a connector: */
 	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
@@ -1224,7 +1219,15 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 
 	drm_bridge_add(&pdata->bridge);
 
+	ret = ti_sn_attach_host(pdata);
+	if (ret)
+		goto err_remove_bridge;
+
 	return 0;
+
+err_remove_bridge:
+	drm_bridge_remove(&pdata->bridge);
+	return ret;
 }
 
 static void ti_sn_bridge_remove(struct auxiliary_device *adev)
-- 
2.31.1

