Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272B9435C03
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755966EBFF;
	Thu, 21 Oct 2021 07:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C866EBFF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:40:46 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id B40312B0134C;
 Thu, 21 Oct 2021 03:40:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 21 Oct 2021 03:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=iaT5PVQQV1J3N
 O3ZCJQqw6ZfLRU5QGqUsJkfrgMTcgM=; b=QA2AfUgJTN6Odfzl/Os8U1ZwheHj+
 +VCJ/6g0ff+Xf9V/vdxJcVJEcxaJprwUt7y11VxUpI3i8/PaDfQpapAXlTGnzcni
 Jf5GWuWjblhxYBQ3zNAjZIkwMeq1uIRZ+E0PImXm2XlTCwvvfMANPi4Yeo10vRf3
 cMyQ7O3RSXZtO9MH+A4BYEWiJ/M4cNwypCDl189Rcc+DIw296lsfygxnc13HqvRW
 9mpYYrgomGVSSL7KGmgSLQMXHTLrGKJiCcS+DEqsGoDbe97B2ytNBTyzOItrFypI
 LxcPgkvFIC/Df5gJ9QQ7HX/7XVWP95jpxBmsblYYmLKdSOau3fIJa/2hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=iaT5PVQQV1J3NO3ZCJQqw6ZfLRU5QGqUsJkfrgMTcgM=; b=abp4hxHn
 Htc/1yVOEeIw0IckS+SonQ2uQzjyj4a1y8I4mhmQsXauEBxBi4ZE5JS9J+leMNHy
 SA9tR4PgPa2b09qfLf0mriyBxRdATSpDRwayGeyO59dbQEsAU2MUSZexCBUoGNeI
 T3HfpzwkhXMHJ3cmZUO5ju6hphvIDKby5CrrqB4K2IFki/9FY/UbLc4z6sWkKU65
 TLKGICMT9rhnSn6DUZbQhddkB08U6j1uyR1h1pEMmJTXkpGYJITcKXsvWRKa8V26
 ckynuieMZRxDCRDNqrtxRe65q2+rR9MAcVdbefl4g9ngmKfc3xEFc6WOuDTHiI+e
 q4Cq6yo7FciEKw==
X-ME-Sender: <xms:fBlxYfkd9xDVuIgsRttOg1_5DvgnExRE9xMaX-xlEyfmE2kZl8v-vw>
 <xme:fBlxYS2VpxXuTKGHc2Nd2AdVS8W-TRu1JwbzHap0KVOlt6HMu1f3P-UIqMy_AcEXE
 dmPJvdP7ez6N-Lwq2s>
X-ME-Received: <xmr:fBlxYVpKPUthDp1AbY5MzI02p_oJeIP4BZB4_2u6D4gEuEgU4bGAHu1nBbEeRi2jimcF_Nqg8pOOSPCc8k0jZ6WmlnwP6eyJ4ORPGwZS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fBlxYXnwwPViqouvHmZDUUyRCs3g4w8AAPvT-FquXFH0N9wqjuqWLQ>
 <xmx:fBlxYd3dAtVuHxlXMGrNUqc7cJ8pdHyYECbJmkW-w16QjGycSjoS-g>
 <xmx:fBlxYWuhL_S5y14jbWNKjpB_CZpIZOwfiVUjqHi16xSBfOsrDRBvwQ>
 <xmx:fBlxYbHfbXW8OFroMhQ4cLNr1WP13jV5BuGyaqmXBOevnR-epe1GbIUY1c8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:40:43 -0400 (EDT)
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
Subject: [PATCH v5 11/21] drm/bridge: ps8640: Switch to devm MIPI-DSI helpers
Date: Thu, 21 Oct 2021 09:39:37 +0200
Message-Id: <20211021073947.499373-12-maxime@cerno.tech>
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

