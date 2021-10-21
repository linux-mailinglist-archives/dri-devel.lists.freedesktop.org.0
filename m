Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC532435BEF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382226EB9D;
	Thu, 21 Oct 2021 07:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A21D6EB9D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:40:11 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id DC1902B01317;
 Thu, 21 Oct 2021 03:40:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 21 Oct 2021 03:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=f9BQnijAQr4DY
 oEIbbbe0kkw4raHj0/3cZnDXHN/PgY=; b=K3v63ZGEZ/gO68tO8YtPquDkjAzBv
 3BD2faSb+iuFSq3vAXm0iLRwG3CPZmnngfz6XQO0j1ishb+/RzQvpMh0g62j3jmi
 TwVF1qbcIRDntAL5GNRxmkiZiRT7H23uiwHwBS/AlK7fC81EvFGGAJeyIGRUV88i
 MmiAgJd1kVW0jFEhfIxUX4brUpPG60GXAUueuUbh6yh4hnoiVORzbzeMmTJ68xnh
 u+yEREEJEXljqP/zxC3jomvc7w0BhW3bLd5TD7/FH40TZLjWZHsnTGAn8I2gEtMl
 +QxN0E5nqyKK8zrGNjtRpbNJBsaTKH6z8VUWqxTVImj7kcS4U7CxC7AJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=f9BQnijAQr4DYoEIbbbe0kkw4raHj0/3cZnDXHN/PgY=; b=L+a+eKW6
 W8oPzki8dKr61DYy8Wyvk2hdymsGAufNUPV2EyHV3Pdxzf7FlP5IQmjhrcSRryfm
 BmFjcK8xnpFx2VCsiCiQV2GS2XC9DTezJZ3yHNFBBJmKtXLytjZnualp6FwQHXur
 q2y3tFoXph2jZwhBA9cu0ntFGNKmPSm60iHTXeIFN2Xhr7C5bg0eajwNyaTeQOm1
 hCHNe972qlYjriuL17sRyrrkOmV/cABP004UfAMc0AWyOQJM1GNoOCQgxYZhjBJN
 3TEk6aJTsmakKDG0eirxC81cSQOg+wgoiLuDQx/8NdyC0V1026hTQqAiufjgfe1I
 j5SqihnM9xKFKg==
X-ME-Sender: <xms:VxlxYUnuPV6_bcRyLAg3Q8xU-ONuVrYJdEZRlMtLiorVD2_j88GETg>
 <xme:VxlxYT0ntgVEnqXtd15VDIJfJwGwuptxlzVww5Vt7tDlzg4tPoKXBmVr9PbMyZJXn
 z9kaAaU2PFZx1rEsDA>
X-ME-Received: <xmr:VxlxYSrbax9hCr6nNHckQD6mYBDl1vVi7PaE9ZrtXomykeDP0aL3MF0-QnJbdX_xZQR0uoeErW-NoPUNgSpRTGs_uMCHgD2zn54hBX2d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VxlxYQl5bwMwTe7ip4lMyP6dsAXcA1mFwelWv6CyNtyM7dVGf_KIow>
 <xmx:VxlxYS1jxDuskkj2UnJhK80mLdMqqDXWyp-6cZAJWJt5La8k_wGCiA>
 <xmx:VxlxYXtEG9hBZXPkMKVSaMuDLfLh-rEp4nYMp1Thn9IZOmT46cTlzg>
 <xmx:WBlxYcFKuE0-kWbnd82suY1vH0jcozfEQIAkROPb5PKmfLSmtMe6QFsn0xE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:40:07 -0400 (EDT)
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
Subject: [PATCH v5 03/21] drm/bridge: anx7625: Switch to devm MIPI-DSI helpers
Date: Thu, 21 Oct 2021 09:39:29 +0200
Message-Id: <20211021073947.499373-4-maxime@cerno.tech>
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
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 1a871f6b6822..4adeb2bad03a 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1316,6 +1316,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		.channel = 0,
 		.node = NULL,
 	};
+	int ret;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "attach dsi\n");
 
@@ -1325,7 +1326,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		return -EINVAL;
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		DRM_DEV_ERROR(dev, "fail to create dsi device.\n");
 		return -EINVAL;
@@ -1337,10 +1338,10 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
 		MIPI_DSI_MODE_VIDEO_HSE;
 
-	if (mipi_dsi_attach(dsi) < 0) {
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret) {
 		DRM_DEV_ERROR(dev, "fail to attach dsi to host.\n");
-		mipi_dsi_device_unregister(dsi);
-		return -EINVAL;
+		return ret;
 	}
 
 	ctx->dsi = dsi;
@@ -1350,16 +1351,6 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 	return 0;
 }
 
-static void anx7625_bridge_detach(struct drm_bridge *bridge)
-{
-	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
-
-	if (ctx->dsi) {
-		mipi_dsi_detach(ctx->dsi);
-		mipi_dsi_device_unregister(ctx->dsi);
-	}
-}
-
 static int anx7625_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
@@ -1624,7 +1615,6 @@ static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs anx7625_bridge_funcs = {
 	.attach = anx7625_bridge_attach,
-	.detach = anx7625_bridge_detach,
 	.disable = anx7625_bridge_disable,
 	.mode_valid = anx7625_bridge_mode_valid,
 	.mode_set = anx7625_bridge_mode_set,
-- 
2.31.1

