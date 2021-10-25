Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13315439A16
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB136E11E;
	Mon, 25 Oct 2021 15:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4573C6E0BC;
 Mon, 25 Oct 2021 15:16:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 843165806C8;
 Mon, 25 Oct 2021 11:16:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 25 Oct 2021 11:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=IjJ7Xg/H84lYB
 rLNnbeRdHfHU/7mTRchCznYNagdcAY=; b=R01IMQsQubPcRDWE2GlBH4AIDc3D2
 EET5TfO4ywfbDTyNRci5bICiqRELgdd+nEj6y7q1tX0z0YaNsjllOLV1750tEcXR
 Gi/3RtGQ9ctYc89JePj5LYYyiWMKJHfNEGeJXDa3GkGjMK5bCZb2yBtd0mVJP/s3
 twi0zH0XI0n1xTJ+Wv5Iyg6PCuoLawyBW9l4e1P8j9cQYhXAeJMl4CbPfK3EBzhR
 PYJt//+W7Q99z5ANpQ+rsBt3qqIFHcLWXkziAAKA7HWEQ9JVYqXkyziYFYzNs+gM
 eYj/8lEwdnOfXt7DWMc0RzhmIFtexOc0hgt4Sn89AnVY6mL/pFe9K6/uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=IjJ7Xg/H84lYBrLNnbeRdHfHU/7mTRchCznYNagdcAY=; b=UcVn30XD
 xR4RoOVOppi6NtCNg7XyhJlWtTwPGcPLMpXz3faNjkmVP1NAOP3RWzCITIYHjxfS
 Q/S6g8tozBIDszBo1iUQ6ojpm7pQEtiesuGspDzlRcfjahUHVyKeqXPLGxArG14N
 yklMXspsF1TtO93IbOHcyGKj/349d1/JZBaJYkSqTQ3Qv1ouBE0Qke0rN83KaWJF
 kQ3GlwQDz5OnlEd2hW0cBaCFNfiduo9T6FubXeoP7tXqILSKcJSbFLn/adz37Hxg
 aWdGPLen42lEHZ+iKvdKrnBrPzVAgO7m5LZzWUgy3UJKxWL3YZ1ss+lK6YMQyL2f
 BYTo5jICk9751A==
X-ME-Sender: <xms:SMp2Yb78rx3HE2Jw_vPoKMRpjU1RBmZJTVio8YgTVTRujF1WHeLQWA>
 <xme:SMp2YQ5tH8ytkaDJl-IEsDHE-2XEFUp0CBpTJCids-3dOyKrZyM6GwhS3nKBQvy4K
 KY3gPISpXoHqycIuVw>
X-ME-Received: <xmr:SMp2YSdbpMn8vjrlyjaNE8Fq0KsQW7Ma8vWM5eWOiOMUKS7nUf9U4yhCCQE-OgS543ISELnisFjhaVa2gP4hfAVjxmlIuFhnhTdpeHQ2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SMp2YcJFt6OZrd4WV_8eEGJUhkSbA4eEe-EpQIYmochFY7BREW7mSw>
 <xmx:SMp2YfLD0CRajhCAjdfVdqJmgritsFkfSRiMTpsb8LZLDHnWZul_zw>
 <xmx:SMp2YVx27Tz3jlUFMGOfXgqHlb-mH8hc0Wofz2j01GViqWIB2Hj4Mg>
 <xmx:Scp2YSIB1j6MDvuUNOJHsOrCgMyTjVNMWYVwwzUxTwojGN1FyF9dmA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:24 -0400 (EDT)
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
Subject: [PATCH v6 17/21] drm/bridge: sn65dsi86: Register and attach our DSI
 device at probe
Date: Mon, 25 Oct 2021 17:15:32 +0200
Message-Id: <20211025151536.1048186-18-maxime@cerno.tech>
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

