Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87839439A0C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEE96E0CD;
	Mon, 25 Oct 2021 15:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3120D6E0CD;
 Mon, 25 Oct 2021 15:16:07 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7626A5806B6;
 Mon, 25 Oct 2021 11:16:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 25 Oct 2021 11:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=RyGY+A4bMARCP
 Cc0cLwmXfEa8Ojs0eyLuWNCplLnI/w=; b=Z0d11qmfymG9+E6B+Q7a0NuoiiH09
 OvsuHAMN29qJioXgVCllRB+3SmpDxNaOMiNZwYLmcJCqAcg6TVaPr7B21zQKWQ20
 ZDwUiZrIJU3emGvOqqkS730pHN4F9MKcGODXnDlQyfsDVMu+h9A3Vh9f8nzwIbph
 qKRQ5GD+g8OU6xkkuef3LYV9bgT7S6Ma7gAOxl5M45h/DvMKMeNFFJ9U+SwTnKSo
 Z3NYK6oz2TQRfdC3rmLYLJyGwL+vKhPSKpDJq13hQdSZABCBlNUbiyYJEFvqKC37
 TX17uJWC0ppD2To4QOYCG0lZMCQkqd3gUtpQtKKEMt+gdBZjpzBtXo6xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=RyGY+A4bMARCPCc0cLwmXfEa8Ojs0eyLuWNCplLnI/w=; b=dJSbZUIx
 hJQy0NPOUflbdeJ1wS/6wuVXLO9Mk7+R8HtA/w3+LZ+9Oh5kAfztc8mRIQmpRMZn
 dqyUSCVu/f5Hib+/jWSHT/3Z6Le/YKTCOepl25qXiR6Bxm9gHKL6uaEkZcSH+F6P
 It6Khi41R3rXnjYUHYKGlNLnfEHWLc3LfTnWl8280ZYBTRLlFgoZr8MAAn7fCr0K
 1zvJXP7wSObMfkV62fVWHzAxJzS3WGmTMhu2HZK0RrDyihiGIUSzTX3kUE4DLCjF
 rXTaBl9KQfHEwtPSoFljr1VrU6BSjNy3T88c/gf88tZYqz7c1bFyEmXBcmfgZmLR
 pDWJUg/5AETA8A==
X-ME-Sender: <xms:Ncp2YRrhWBFz869LvrziZuE-3iqrx2Umhae-4z7aP6lGTljanKy2PQ>
 <xme:Ncp2YTpQA5WB1kgxbEvanIyDJg81W10M_2JIKRCYGeFeys3eOyFLvacQbvxOVJn8L
 5oOiE6S0vBYMPA7Nc4>
X-ME-Received: <xmr:Ncp2YeOcVaWEYCtcnYMVvnUSRMZBbfKtoXHjhYCCPW_kisHA0_U9yPaClRpq3M4IBcPHTIPO3i2E5BPCbVJSU9ltdgLj_7qrILg6UihK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Ncp2Yc4qjxBeaAuI0Axga50lhhaZCAnOUWqhG5phxRzVTAU5g0O_SQ>
 <xmx:Ncp2YQ4SlgNEp7bHbUCiVeb1sJkTychRyPcOpSTPqcGb2eqiI6RUwg>
 <xmx:Ncp2YUjg7KRGLt2ICR57UNhIm4z5yBl0tGtfa-HOKHq0XG7wz0TSjg>
 <xmx:Nsp2YQ7RTOKRbSLC8IIi2IbQJp_mVYA5PeqYllPDuwstwE2nqQAQRQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:05 -0400 (EDT)
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
Subject: [PATCH v6 09/21] drm/bridge: lt9611uxc: Switch to devm MIPI-DSI
 helpers
Date: Mon, 25 Oct 2021 17:15:24 +0200
Message-Id: <20211025151536.1048186-10-maxime@cerno.tech>
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

