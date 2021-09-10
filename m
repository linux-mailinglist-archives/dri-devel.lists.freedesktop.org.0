Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F00814069CE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297E46E9D5;
	Fri, 10 Sep 2021 10:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9246E9D5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:14:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 789FF2B013F5;
 Fri, 10 Sep 2021 06:14:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Sep 2021 06:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=THjyt/udMqvIS
 g7/C7BNDCUAlJStjMNR1MB6XhOeOzg=; b=os1ue1yYQlHuSypaKJXgRcobxzFOn
 KLQPB1ItAoZPXtNimByXgLZFOft9KD0rswZ/ljtTjM803FvgmpVpgUh3CLnBbTY0
 +nMXLnN1xuzdWGCM5HhgkBxW/u+yA3y2Q3UHB6rT3n1YWbdFpca1GY4UtHRchBKm
 COpjCIHHZcTBmkQdwgiv4Uan1QPqDKasI+L08A/RNNnbEf9+NDKdffpAvetiF9kq
 7MmNdm3LKfo1L5+uLBVrSc3eLYb5YJJZzBHJsttc2qEIEKPHKof41uhufmhduPtV
 7qewwX66bSERofVMxgg79lZNXb/5mnxIVCcwOWVnPBnpSDqFVSumenz9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=THjyt/udMqvISg7/C7BNDCUAlJStjMNR1MB6XhOeOzg=; b=Q0KUlGP3
 5KdAE/kmRk0YcujRCdB7e0GLja4wNw1lQuGdErGpwpOt5o1Uai7qISUJbKfU9E5u
 DhS0pRuYcChRHkPQFazXVXDlAHccyRoOK9NVgT9c5oAZImoMzxNR9f9+9kdp/dRG
 iUE7yPvIUE8MUKygMsPUkFNVJDPl9opXwhwiq2thmkvbGF5/+cI95sGw0Fah+//x
 GWG5N0HHME0qpbhavr8SY11w1e8nFmNd8P10rfb5bKliuavo/PGAsGEVJlKCq/Ca
 fkiu2l0oI4N8JMKVs5NT7f7qAh1n/gWS9+W7WzRBuSOlz5j1jyXyA0sY6+qNGlzl
 c3MnO7MJ+pBysQ==
X-ME-Sender: <xms:CzA7YdMhu3iTLixe02I63ClFyYUVOUN8nfj0rK3R9JKRSYSfj_L0vQ>
 <xme:CzA7Yf8Ui_id_eU3GTRWD7wVpCll385nG2thLcVrjNR4gasOJITCAxo01nymlRzUV
 SUScKHLJNxHH5LiLbo>
X-ME-Received: <xmr:CzA7YcRiiTw5xkGl5JhaHflTJyl8q92nAL3PnKZHqdmx4bUNbxe4VQLTBrOxPR2-3Jq9lux5Ft5all6m16a03fE9u31wvkPu5soW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CzA7YZuRzn4u0_5t8-e10A6krjJKBbwScWzVS7UBTUZ0TXXbtoTSqw>
 <xmx:CzA7YVcF7XWqV-91dmSyu7PK3C9oKOHKnvlxCFgM5JRGK5RBKhQdDA>
 <xmx:CzA7YV0M0gcE2OpSMZJvVcnwSBB5Q5kzC-YyvnuY33zK9_xBuUt8ww>
 <xmx:DDA7YaOrqgA3bperzcYGWWGF1DaEU7uJHdSFWXcLg1h3edluSjMMDJ-sZ5c>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:14:35 -0400 (EDT)
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
Subject: [PATCH v4 24/24] drm/exynos: dsi: Adjust probe order
Date: Fri, 10 Sep 2021 12:12:18 +0200
Message-Id: <20210910101218.1632297-25-maxime@cerno.tech>
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

Without proper care and an agreement between how DSI hosts and devices
drivers register their MIPI-DSI entities and potential components, we can
end up in a situation where the drivers can never probe.

Most drivers were taking evasive maneuvers to try to workaround this,
but not all of them were following the same conventions, resulting in
various incompatibilities between DSI hosts and devices.

Now that we have a sequence agreed upon and documented, let's convert
exynos to it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e39fac889edc..dfda2b259c44 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1529,6 +1529,7 @@ static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
 
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
 
+static const struct component_ops exynos_dsi_component_ops;
 static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
@@ -1536,6 +1537,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm = encoder->dev;
 	struct drm_bridge *out_bridge;
+	struct device *dev = host->dev;
 
 	out_bridge  = of_drm_find_bridge(device->dev.of_node);
 	if (out_bridge) {
@@ -1585,7 +1587,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
 
-	return 0;
+	return component_add(dev, &exynos_dsi_component_ops);
 }
 
 static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
@@ -1593,6 +1595,9 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->encoder.dev;
+	struct device *dev = host->dev;
+
+	component_del(dev, &exynos_dsi_component_ops);
 
 	if (dsi->panel) {
 		mutex_lock(&drm->mode_config.mutex);
@@ -1716,7 +1721,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 		of_node_put(in_bridge_node);
 	}
 
-	return mipi_dsi_host_register(&dsi->dsi_host);
+	return 0;
 }
 
 static void exynos_dsi_unbind(struct device *dev, struct device *master,
@@ -1726,8 +1731,6 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 	struct drm_encoder *encoder = &dsi->encoder;
 
 	exynos_dsi_disable(encoder);
-
-	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
 
 static const struct component_ops exynos_dsi_component_ops = {
@@ -1821,7 +1824,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	ret = component_add(dev, &exynos_dsi_component_ops);
+	ret = mipi_dsi_host_register(&dsi->dsi_host);
 	if (ret)
 		goto err_disable_runtime;
 
@@ -1835,10 +1838,12 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 static int exynos_dsi_remove(struct platform_device *pdev)
 {
+	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
+
+	mipi_dsi_host_unregister(&dsi->dsi_host);
+
 	pm_runtime_disable(&pdev->dev);
 
-	component_del(&pdev->dev, &exynos_dsi_component_ops);
-
 	return 0;
 }
 
-- 
2.31.1

