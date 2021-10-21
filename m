Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D96435BFA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B1A6EBC4;
	Thu, 21 Oct 2021 07:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B456EBC4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:40:38 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 0DF1D2B01341;
 Thu, 21 Oct 2021 03:40:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 21 Oct 2021 03:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=RyGY+A4bMARCP
 Cc0cLwmXfEa8Ojs0eyLuWNCplLnI/w=; b=U7ALZ4/pTf6yJ1Koo+KUqL9ouLPE+
 VBN8X5YgAoEc2EXj8agZOdowhulx8qnZH8ihrIbytgiEsKq3XQ1yeToWg5SYQ3C6
 dUNPeCmlIATmQHor4h0KTZVsVr2AZDLbFm/T9C1t+hhnrxsISz7mmagszafVTftM
 MvhqclLDuhLI2D8E3676D5EoASlU00+YrEYKPxhOaD4Y3Q3JCyGqWUlxfnEKPwdS
 IbzdI6CqEGJ2Q6vv73MewK3McOmWr0hnKu8jvVKWFi9C9xFPTYaqGrbzVbxXjgz5
 r4HNSVYzTYe2k6uaEBMhENw76nDiM6CAxrNLvJJ0bkarjZFXR1BbWNMcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=RyGY+A4bMARCPCc0cLwmXfEa8Ojs0eyLuWNCplLnI/w=; b=EUqe09NE
 eF2xYGIuvQ2xNqhXrbzoLJijng1fX8mwN9wQAXMRQoQqrE7ERKamOybLSkpT3M21
 51hFFRrnHG5PbgrkwaKtRf0ZqkK7S/DkhzxqJ53TRURMtX6jaRE7/jJMkKEOnmTV
 j1vjEcRI6JUz+/GweGhfeEb3CQncrQOwIsJ48AhrPUbKwQH1b+cUprnE0r8teW/+
 r3aN25hRLqQ72L8St2Br/eQOM/lfyHvVbVB6ffQaJgkOYVWv1FQ0uulRM1cdRJHy
 G1UFPKvIvnVIvFPEiEzWvZENAEqE7JVNSGmgiWbjSTU/AH03+T3N4fIMypPQgXqa
 yvLy9JbGvyGv5g==
X-ME-Sender: <xms:cxlxYdZmQZO_XzM7dLmZ9MZ3GkMmmrgJexwDG3MzEJ48n3a3IXQ8Qw>
 <xme:cxlxYUYpex4xEXsFSFgIQ_sgZeYS2Xpr7MxbVs3MkSQMkd4VMDS-fLP2VmFvBFV4I
 UvrsSKea-I91bZKfis>
X-ME-Received: <xmr:cxlxYf_ObVlducqC_d2vVY_dKzTZoMvw2o7CnmhGXWf7VjkDdO7iSkidl9uPdfXvoVuDA8vngC96e7SrVpJSA5uVLdvzb7vpG4RAKg5f>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cxlxYbqosfWy8XVqFa9PupoR-sqObvtYJQeFAx6LMs0UdnA9VfMakw>
 <xmx:cxlxYYq39039RWcJan3DJMzaANRpZXtnJWakt4rhypKVKX_PZwt6LQ>
 <xmx:cxlxYRS-fSEYbp__oqF1CiBElVrowmkdlyJynU7AlG7AGvAujdvkLw>
 <xmx:cxlxYdqEfEZxVYoMnHgUYR2R0qy6LpuqZAcrDLYYgogovA7w9dFIpjgjgj4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:40:34 -0400 (EDT)
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
Subject: [PATCH v5 09/21] drm/bridge: lt9611uxc: Switch to devm MIPI-DSI
 helpers
Date: Thu, 21 Oct 2021 09:39:35 +0200
Message-Id: <20211021073947.499373-10-maxime@cerno.tech>
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
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 38 +++++-----------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 010657ea7af7..ab1a0c00aad8 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -258,17 +258,18 @@ static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
 	const struct mipi_dsi_device_info info = { "lt9611uxc", 0, NULL };
 	struct mipi_dsi_device *dsi;
 	struct mipi_dsi_host *host;
+	struct device *dev = lt9611uxc->dev;
 	int ret;
 
 	host = of_find_mipi_dsi_host_by_node(dsi_node);
 	if (!host) {
-		dev_err(lt9611uxc->dev, "failed to find dsi host\n");
+		dev_err(dev, "failed to find dsi host\n");
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
-		dev_err(lt9611uxc->dev, "failed to create dsi device\n");
+		dev_err(dev, "failed to create dsi device\n");
 		return dsi;
 	}
 
@@ -277,10 +278,9 @@ static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 			  MIPI_DSI_MODE_VIDEO_HSE;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
-		dev_err(lt9611uxc->dev, "failed to attach dsi to host\n");
-		mipi_dsi_device_unregister(dsi);
+		dev_err(dev, "failed to attach dsi to host\n");
 		return ERR_PTR(ret);
 	}
 
@@ -355,19 +355,6 @@ static int lt9611uxc_connector_init(struct drm_bridge *bridge, struct lt9611uxc
 	return drm_connector_attach_encoder(&lt9611uxc->connector, bridge->encoder);
 }
 
-static void lt9611uxc_bridge_detach(struct drm_bridge *bridge)
-{
-	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
-
-	if (lt9611uxc->dsi1) {
-		mipi_dsi_detach(lt9611uxc->dsi1);
-		mipi_dsi_device_unregister(lt9611uxc->dsi1);
-	}
-
-	mipi_dsi_detach(lt9611uxc->dsi0);
-	mipi_dsi_device_unregister(lt9611uxc->dsi0);
-}
-
 static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
 				   enum drm_bridge_attach_flags flags)
 {
@@ -388,19 +375,11 @@ static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
 	/* Attach secondary DSI, if specified */
 	if (lt9611uxc->dsi1_node) {
 		lt9611uxc->dsi1 = lt9611uxc_attach_dsi(lt9611uxc, lt9611uxc->dsi1_node);
-		if (IS_ERR(lt9611uxc->dsi1)) {
-			ret = PTR_ERR(lt9611uxc->dsi1);
-			goto err_unregister_dsi0;
-		}
+		if (IS_ERR(lt9611uxc->dsi1))
+			return PTR_ERR(lt9611uxc->dsi1);
 	}
 
 	return 0;
-
-err_unregister_dsi0:
-	mipi_dsi_detach(lt9611uxc->dsi0);
-	mipi_dsi_device_unregister(lt9611uxc->dsi0);
-
-	return ret;
 }
 
 static enum drm_mode_status
@@ -544,7 +523,6 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs lt9611uxc_bridge_funcs = {
 	.attach = lt9611uxc_bridge_attach,
-	.detach = lt9611uxc_bridge_detach,
 	.mode_valid = lt9611uxc_bridge_mode_valid,
 	.mode_set = lt9611uxc_bridge_mode_set,
 	.detect = lt9611uxc_bridge_detect,
-- 
2.31.1

