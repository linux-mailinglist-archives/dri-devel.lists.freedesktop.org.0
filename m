Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3FD4069BC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C10B6E9C9;
	Fri, 10 Sep 2021 10:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90ECC6E9C8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:13:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id F2E7A2B013DF;
 Fri, 10 Sep 2021 06:13:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 10 Sep 2021 06:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=hWUbssSfCvqRA
 Kay+bkeStkUSFLI0CXLVu9IaDJimgs=; b=RIdpKnKI6aBGDalgfRiQEFGYsXU6T
 WSAISNpOw+vmAd5SY+XolEn8sBZH799gBtbKTTfmUhUD6ZHo97RgwMOBZHL/LbZL
 MOLBOfAsKRvwjnTR+tNEZzdT1/vJBM6sc0CxpMC9dHB6QNKMY0Y30kzN3dvwKfLa
 gIGIGyciXxJtdQZFQI/I1hvWheBrV2jokVHkCG/d+xECZ8AcHGcKcaB8nN5wkAnL
 B7eiHrISxUeqcdBYxs4ZRx2uMLQ47Tc7uYQPrjSSQfg7RHZRRpHqVB8AtpttRp/P
 krDW1KzEXKO9CPugnu+dNzEnwIOVTn5RAKeGvOyKyZG1HtqzhP0+Tznbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=hWUbssSfCvqRAKay+bkeStkUSFLI0CXLVu9IaDJimgs=; b=WzP4QejH
 b6/13OiY4m1RrAbi0cMHTeLM7hJtvcK2RxN3FZahyB0TCbQ9U1xyj5x5nQEffcP+
 zNgl/lMC5H3w+hlORepB04RybHm3W6d+MtUd42gbQczew2EE78442w3Xiu1zzMyI
 6+o2P+FeEfpsZvB3Cs9NxMq3+jOWfjIFY/gsnmkVlogMW06ighEoajXYy+Y1TT/m
 s9gRWGexZumk+eSIPOKznvYWabVQUXgnisHEdcUU/SacxgtDpsXy6iLDbrmY8rIJ
 4WhRVgd3f2GAAsuUOF2x6JaVgg2fF69iWri50GLEdA2+aeauSazkOZor+aZZp1Ut
 tH+OB/WNLkcF7w==
X-ME-Sender: <xms:0y87YTHf2upxduWcx_LJygTUOvgFDHdEUMDhknEZV3nlWFMpsTha1A>
 <xme:0y87YQUq2SoI-F_0d7EJbqt3dSMTLY2-Blwc7tJB6wGc4l4DhFO-Mz7jVhtQRYvyo
 MeVAo-IKVcPOBX1Jio>
X-ME-Received: <xmr:0y87YVK6M2RvI9pxWYyivurciyNeAiTq37eboHRjGnGFPUudlBfEYwqIbJLka2Zx813-o9vK4KJUTbqd2EPyew-qRl9uIWqH8ORV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0y87YRFt50efDhwBB6qGlWOK3dLG4Eefdi3PEEDcXCHZMm3BwKETkg>
 <xmx:0y87YZV6dg_hUwl83m7HoIvlcRGF-HZ5vUaJqyBVLUhPLJASwLiN4g>
 <xmx:0y87YcOr1r8cHSyxAuXnsur632d6A4iI_JvKY7JWZ7BfAkvw_kgYQQ>
 <xmx:0y87YQn24CTctOLPq2iFO1NeFdLeund7C_RTya18C9wl-XbutNaLlWDCKYw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:13:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao <tiantao6@hisilicon.com>,
 Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, John Stultz <john.stultz@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v4 13/24] drm/bridge: lt9611uxc: Switch to devm MIPI-DSI
 helpers
Date: Fri, 10 Sep 2021 12:12:07 +0200
Message-Id: <20210910101218.1632297-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910101218.1632297-1-maxime@cerno.tech>
References: <20210910101218.1632297-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 38 +++++-----------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 3cac16db970f..e5083bdf4c89 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -257,17 +257,18 @@ static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
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
 
@@ -276,10 +277,9 @@ static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
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
 
@@ -352,19 +352,6 @@ static int lt9611uxc_connector_init(struct drm_bridge *bridge, struct lt9611uxc
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
@@ -385,19 +372,11 @@ static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
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
@@ -541,7 +520,6 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs lt9611uxc_bridge_funcs = {
 	.attach = lt9611uxc_bridge_attach,
-	.detach = lt9611uxc_bridge_detach,
 	.mode_valid = lt9611uxc_bridge_mode_valid,
 	.mode_set = lt9611uxc_bridge_mode_set,
 	.detect = lt9611uxc_bridge_detect,
-- 
2.31.1

