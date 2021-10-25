Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F25439A1F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E5B6E12D;
	Mon, 25 Oct 2021 15:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07026E0BC;
 Mon, 25 Oct 2021 15:16:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C70A35806C4;
 Mon, 25 Oct 2021 11:16:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=R42zJVFPqXWis
 ftwmhRtrrTmMiiujU+L/s0xKJb/r2o=; b=G8sbIhRWJRjFM0oxtIOygCDXFkJaP
 OUQZMkypGyaWhvsaPc/2q9LWELPOE6BlD63OmqHvRC41sj0n2E7ITJaJ/GG7DEbx
 fK/9Fw68nBJV5rUqY5ZcWhaS67vdLAZpWv0kzaHKsYLd7c+VFJ+lRk/Gw0SXEDDx
 KLpDTL4+CqT7QAhnNJQjmPdXyCsxkMQQB7AdTyFXOVvB6WTdLmvEhSrQ4FngAjJU
 YFR9OplVESE6wrzBj7bD9V+Jres7fWpMUSaoB8C+XYBBCiNRoxmBoqsauyN/L8M7
 7ElY40JBSddbWBigiwogvGajaBEukmkPVFATL9upG4wX6LyoeK1JEed3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=R42zJVFPqXWisftwmhRtrrTmMiiujU+L/s0xKJb/r2o=; b=N+e9m8RI
 FV/EKYQ+/XOEEx5lvqdghY7c06ZbXMpwNhVNB+zogu+7QjKAd7Hxa6GgPtUL+6M2
 MwKnIGrSylLHEj0N6tWuZv/fuvx37ic9nuU4k+jURY0mB2lOqbAmKsL1MY8Mb1wX
 xkM37wszviEfUzHxFODtiNRUrO8J0aYgkYaCl5OnhaR0cC71Tfmbcbxi7GBouJEq
 js7OIQKJpgpczFE18f2UAXKfkmfwlaZ36IxNQ3y4aqZjK7KZT9mgLjJSEL6+R1i4
 vec0Xk+DI1xFgrj+z7MfWqhEpOuKGTKDaWxklzw6t89Oth0jilFHO9ifvciNFySz
 IbtesvdLrFEU0Q==
X-ME-Sender: <xms:Rsp2YZiXXzFLNuv11TWcwg-vGcHs5nzieYL2hMCZqI6PWklSCTLZIA>
 <xme:Rsp2YeA3_L9uSGBdHWt-v5YR43U9CCcLQM8w7iQxdmMNPceUXCnArP_SsrbQNFybL
 BEg9rgvZevgebNbSVI>
X-ME-Received: <xmr:Rsp2YZFidxLin4qCeD5sQR5MUIMcQbQABgjKbLOzL9m-TFIwumb-2ufJaYelR-rH7cDGTpyO2qAhebcVV_Mg5QzaqJFuAYgU6O5LmUGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Rsp2YeSp8v8Is9GPzbA2tQMWboRe3CVC7Q7Mwx_OAECLn-zO_nkoMg>
 <xmx:Rsp2YWzyaJGxSqeDC5lHRHav0xlk2PscEnAv6_uN0qVtqTXlucfSxg>
 <xmx:Rsp2YU7c8tcM7mraG91yZ0XrxcXWwb262V6vabETnrUXMivhsi24YQ>
 <xmx:Rsp2YRRIjx22vhZgKAPx4hK-LEq00UvxdM4HLNFOnQqWp5ReWEJsZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:22 -0400 (EDT)
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
Subject: [PATCH v6 16/21] drm/bridge: sn65dsi86: Switch to devm MIPI-DSI
 helpers
Date: Mon, 25 Oct 2021 17:15:31 +0200
Message-Id: <20211025151536.1048186-17-maxime@cerno.tech>
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
our secondary device. This also avoids leaking the device when we detach
the bridge.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6154bed0af5b..36a82e3d17ab 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -662,6 +662,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
+	struct device *dev = pdata->dev;
 	const struct mipi_dsi_device_info info = { .type = "ti_sn_bridge",
 						   .channel = 0,
 						   .node = NULL,
@@ -701,7 +702,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		goto err_dsi_host;
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		DRM_ERROR("failed to create dsi device\n");
 		ret = PTR_ERR(dsi);
@@ -714,16 +715,16 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
 
 	/* check if continuous dsi clock is required or not */
-	pm_runtime_get_sync(pdata->dev);
+	pm_runtime_get_sync(dev);
 	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
-	pm_runtime_put_autosuspend(pdata->dev);
+	pm_runtime_put_autosuspend(dev);
 	if (!(val & DPPLL_CLK_SRC_DSICLK))
 		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		DRM_ERROR("failed to attach dsi to host\n");
-		goto err_dsi_attach;
+		goto err_dsi_host;
 	}
 	pdata->dsi = dsi;
 
@@ -734,14 +735,10 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
 				&pdata->bridge, flags);
 	if (ret < 0)
-		goto err_dsi_detach;
+		goto err_dsi_host;
 
 	return 0;
 
-err_dsi_detach:
-	mipi_dsi_detach(dsi);
-err_dsi_attach:
-	mipi_dsi_device_unregister(dsi);
 err_dsi_host:
 	drm_connector_cleanup(&pdata->connector);
 err_conn_init:
@@ -1237,11 +1234,6 @@ static void ti_sn_bridge_remove(struct auxiliary_device *adev)
 	if (!pdata)
 		return;
 
-	if (pdata->dsi) {
-		mipi_dsi_detach(pdata->dsi);
-		mipi_dsi_device_unregister(pdata->dsi);
-	}
-
 	drm_bridge_remove(&pdata->bridge);
 
 	of_node_put(pdata->host_node);
-- 
2.31.1

