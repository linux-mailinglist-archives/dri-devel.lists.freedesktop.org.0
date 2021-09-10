Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC134069C8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D226E9CF;
	Fri, 10 Sep 2021 10:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B2B6E9CF
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:14:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id CAE6C2B013EB;
 Fri, 10 Sep 2021 06:14:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Sep 2021 06:14:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=6oSOGrV3c51E2
 vx3kAJOM4HAYluSnWowEHh3mzTFbPI=; b=nkONDs10kcf4P2uJCO3xoPwIjQ/1W
 CJvIljhSC5JqaSIUTiAvqMhFnm61F6l0YwyvQhZCciUf1DHQwEhEkiOuSnQcPRF0
 DC5Mgeq/+YJekbmCflecCq4+SL7JARUF5+QB2taUcpc7NZX8I0q5WNIwxazZBicc
 +EmkrDn5nkuXKeqsm0jtMKYDyQzCOcSuoIJy7RlbXBLfdJnwnmy8HGE0JZNwF7cx
 Uohb+DlryhaxwwEZkXOw787JQoDH3SrlHmnKPSXMACoiUZSSfWIz/sUk1w7Zgv6D
 AKcjeZEANFgf6FFU8QEDKdw2hI2gS1zCPJPQShXXY/zPxqsgSFahOiJmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=6oSOGrV3c51E2vx3kAJOM4HAYluSnWowEHh3mzTFbPI=; b=QW6oPdy0
 +fngzonTtpe0TwIh1RZaktq4NtEZ44teKFkQ4z5yr90Hs0OuV6PD/cqIqcfq72zv
 w/Wn26V9AfvwkdEgvnr8HSfIpmNfVK3r6oNAFU2wtdj/wGSrWletdRRVBCB8cyVi
 74kKOFMWuWp1Wf6yOio6ptkgymBLHag43jMHyeqHeh8DpF3u1LiH3YRn75KXPQxI
 ltdW5dr69RBSijT3i/bKgq4WDdxjJRAL0GhIwUx/M/sybZK7XSQxaccbtbok3cXp
 Li4gSqukEfKQKmvYMEw0WUHET2Ktf/CQsssEQ/Ae6suNw6olGPaqrZeYkjQstnwO
 pCZ0S0zs5fegdw==
X-ME-Sender: <xms:8S87YT4DHOp7tI5adgsejz-jhEifBCgBzlpgxGtQo5u97iXPuX43rQ>
 <xme:8S87YY4x9eFIpDm4PY4qGH78EHzeAiRY5cFibxudbVxfSU-bEX10Jz-1aI3Em3Hag
 yRAcYmR5UVU9J8JcmU>
X-ME-Received: <xmr:8S87YacFNEpOfvNmhozYf3ET5xjxrzUFfU0YkCWYXrhwqpvtUnxNvhRz-jjRq26l_2vuLWF17VfVwcsT-SPwEfNCh_u-Pcu_kQm4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8S87YULeEaJHbpXS2msO-fTeZTqBEIGpJBJLe6m3SY-56K7xECHWqQ>
 <xmx:8S87YXKyZmw7MWF-HzoodV8hrNAi4xAMYAEFfQKcGFtfcRvrhuYM5A>
 <xmx:8S87YdwCC0p4_J-1zJAzjFe8djhBh6EtBS0dYg_ZoR7C09vtJQU1mA>
 <xmx:8y87YaLNMzzft7Rofv_LdkkljQs_HBMzRt3tSFRrYc9_z4-EUEiIZn64yNM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:14:09 -0400 (EDT)
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
Subject: [PATCH v4 19/24] drm/bridge: sn65dsi86: Switch to devm MIPI-DSI
 helpers
Date: Fri, 10 Sep 2021 12:12:13 +0200
Message-Id: <20210910101218.1632297-20-maxime@cerno.tech>
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
our secondary device. This also avoids leaking the device when we detach
the bridge.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 41d48a393e7f..b5662269ff95 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -674,6 +674,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
+	struct device *dev = pdata->dev;
 	const struct mipi_dsi_device_info info = { .type = "ti_sn_bridge",
 						   .channel = 0,
 						   .node = NULL,
@@ -713,7 +714,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		goto err_dsi_host;
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		DRM_ERROR("failed to create dsi device\n");
 		ret = PTR_ERR(dsi);
@@ -726,16 +727,16 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
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
 
@@ -746,14 +747,10 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
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
@@ -1236,11 +1233,6 @@ static void ti_sn_bridge_remove(struct auxiliary_device *adev)
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

