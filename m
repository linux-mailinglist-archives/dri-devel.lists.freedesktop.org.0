Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA604069C9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A196E9D1;
	Fri, 10 Sep 2021 10:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8EA6E9D1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:14:20 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 16AF12B013ED;
 Fri, 10 Sep 2021 06:14:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 10 Sep 2021 06:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=WtjEAevFJH9gd
 dqFf5pSS5vREbqHJjV3Z9vN93mF+IY=; b=uxcv2ie+3BcvUq+ai7GJLQJYJhpQv
 1E7wlcw4GrYX8jYH2ia7qSgfQidk1v5taRx3cBVggCaYD0xb+yO5BVvdV80aojon
 tkIhWRkMpKEVOiNdKpGKRKoYXIMwhNugKjSIHLHRwnBUSaILhJ/kALnLK4VZkU2S
 xpz5cTT0EwQMV+gYRwPlO5zXRYkZyymR662bewifiGlKaZhEg8taqn8WdNIOzyP4
 cKm05QK/Mscsl25crxR+eQC7m3qChtRjJR+u0Cs/raGm3deteNvjJLbPwW8EphKl
 UaiTxE80NL96+2fpF/l7Vm/MuxfcK5lUSkttCb6zyHxoNHWhBX13WhF/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=WtjEAevFJH9gddqFf5pSS5vREbqHJjV3Z9vN93mF+IY=; b=U1kS0ho1
 udzFTqZSQHktrHFomZxntM3Vz9nrQnjbCQlgyGx3sKTMw4DsXLqv7EL4QPcQeqlp
 pQv6qoTULYlwxPJnJKvdGJFZPbP5DKXIbJk8YafEE9KP8J0CBHnZ8bt5WILuhDnS
 1ykYQZxRjKndXjb5hXkqWhLsfjPsxXdugUIB5DkSk50wrR1296/ecARC/E4/SAWK
 i5OAubZW7985Nk+eUf/dKPfLfreavqLZQecw4xjjD0PwFF0ag3LihZYxsVRry0Jo
 HV/Z85I/hqW66Kfka/L5qiQ8yWbsRthwnjh6J5twb+2LB4CrRRtwR7SLwO+2MrHb
 97D0nRvu8Wk8sQ==
X-ME-Sender: <xms:9y87YdSAXzibrkxwGVFEZqe2W9oiVpAqw5KsqtlpEbAJbjxb8C9ZOw>
 <xme:9y87YWxuzrEXdmQyc51rQawE8CQL3taK4TiJ0n0S-0LODgwCmvR7ZfKB94qjPS2fk
 SHw4MUjDW6ZIjwYMFo>
X-ME-Received: <xmr:9y87YS1kCpefRPjD-cIl3X11ZV94DIBwLjB6VfARjJs-ZMB72aUkkER9aZrZ18PR1sYofTdjJve6YfgDdHHMF9o3K-4A2plCqFtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9y87YVCBzEnrZA2cpOyFRbNj5hLJy5e40PLcsX1sa2IM4EZuRlSCeA>
 <xmx:9y87YWizRPoJKlLhJk_-258oCsXM6W80kGg6pibDrztX85OAaRoQ1A>
 <xmx:9y87YZpvNl3RDVgHVmQRKaXMhmyP-vuITouIQb0CBjjzfhsAYIJx1w>
 <xmx:-S87YWBxeuFAJL82lB-id0BnQR2ArtwprTEYvwy3kfF4e-CiMto_N-wg5w4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:14:15 -0400 (EDT)
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
Subject: [PATCH v4 20/24] drm/bridge: sn65dsi86: Register and attach our DSI
 device at probe
Date: Fri, 10 Sep 2021 12:12:14 +0200
Message-Id: <20210910101218.1632297-21-maxime@cerno.tech>
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

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time. Let's do this.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 74 ++++++++++++++-------------
 1 file changed, 38 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index b5662269ff95..7f71329536a2 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -667,58 +667,27 @@ static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
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
@@ -736,10 +705,35 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		DRM_ERROR("failed to attach dsi to host\n");
-		goto err_dsi_host;
+		return ret;
 	}
 	pdata->dsi = dsi;
 
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
+
 	/* We never want the next bridge to *also* create a connector: */
 	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
 
@@ -1223,7 +1217,15 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 
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

