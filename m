Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0434069B1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13C16E9C6;
	Fri, 10 Sep 2021 10:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0ACB6E9C7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:13:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 2E3942B013D8;
 Fri, 10 Sep 2021 06:13:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Sep 2021 06:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=E75MrqcA1hNXw
 LdITFuDpITXEnmnHVfHlh1ucveRPPo=; b=UFKIlzH5tqE5lbPekBfNfesDkDNve
 WhYBZvMFt62reRRX3+tSUTNxORLHLRQe+jsLkdATz7y3KBOULEJftddujKyHUoRR
 tK/jUadDIPNAURennMQM2o2kY6v+5OE558Y6VMhl5/q7QgB05uUQLd0VTb6em9in
 H5r0Q8NNHlKxUV6jdfy9Aeg6YZLmvgI8OBqi825fXei5RVj5HgmPDS26s7LqIYsa
 GOaUCNeS0Sqajf1R3j8rB/V4odEH6Qwycmx1hOa5A5jseBkjz5E0uf36x/EITVzI
 gf8kfRC3FnC3ALyXnd7WlFgshlrkyLg+UyXCtCIB5AENMuTxjn1S0iWhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=E75MrqcA1hNXwLdITFuDpITXEnmnHVfHlh1ucveRPPo=; b=IkPwLofU
 /ODUhJ7kRshPJQeupKsklSxR+8c6krmu44TXVcAAsoISORN3/GpZgTWKME/nNNmR
 ko4sJoq/5eFlQbxuQtzs1Jc959g/B9bCwyKFY8+l2sL9tZEX88h5FxiOLhYS8zMD
 G1BY896Gs245FSf1jbt8O652YlZ14A15+yK7jL1bSdVM+87PlAvi7vlouXrFTErp
 HTzrhaC1QTNu4GlahnlEYtcEWiO5Ff/L4CZbmy+iBwkjAgVeQeOCD6qSPwslm33D
 3VTdZ7vG887eV7aTCLsPoUs18wGbJSvZevw+Pva7XBReiHM9ql8bUOvnFF1FO7tN
 1VYZ7/T7p0r/og==
X-ME-Sender: <xms:xy87YQeqE9byhspHoSmB0WWMAkKo7wh2hr5MjvyvzdBEZvqNdT68rA>
 <xme:xy87YSPLi-ngwgx92bV99fhZwsa4CPK1AUtJYEh1OQ64Rqj8rjHW_FTwQdJC5tvMf
 FJCHCmai1kJzsHzN0E>
X-ME-Received: <xmr:xy87YRhIq57vd0aPm4yMtWF3n_XhutBz0qvZasVGvi3B9tOVuAHMqHVKmw9tjE11eFLA-z_9p8USAJtdZ4LsiHZxPWPq7hWg7D4l>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xy87YV-utvwo8SlTba-1kMbNyMPquDHthxw0YZPVWLKllxEtPnlNNw>
 <xmx:xy87YctcSRjWEJaRRzO799zTaXPPvbDAsP-zttmnQW0SDsn6YXYVag>
 <xmx:xy87YcGApVZlAqjEUpvHxdbuWNDYo2Dkv1zO79ZRzNhv4cD4yh20KQ>
 <xmx:xy87YQci5OZGneVRGVR2Kv0jZoLJtYEldEy5QwJON2ko90j1N4Gs2B8hkxE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:13:27 -0400 (EDT)
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
Subject: [PATCH v4 11/24] drm/bridge: lt9611: Switch to devm MIPI-DSI helpers
Date: Fri, 10 Sep 2021 12:12:05 +0200
Message-Id: <20210910101218.1632297-12-maxime@cerno.tech>
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
 drivers/gpu/drm/bridge/lontium-lt9611.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 29b1ce2140ab..654131aca5ed 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -760,6 +760,7 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 	const struct mipi_dsi_device_info info = { "lt9611", 0, NULL };
 	struct mipi_dsi_device *dsi;
 	struct mipi_dsi_host *host;
+	struct device *dev = lt9611->dev;
 	int ret;
 
 	host = of_find_mipi_dsi_host_by_node(dsi_node);
@@ -768,7 +769,7 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		dev_err(lt9611->dev, "failed to create dsi device\n");
 		return dsi;
@@ -779,29 +780,15 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 			  MIPI_DSI_MODE_VIDEO_HSE;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
-		dev_err(lt9611->dev, "failed to attach dsi to host\n");
-		mipi_dsi_device_unregister(dsi);
+		dev_err(dev, "failed to attach dsi to host\n");
 		return ERR_PTR(ret);
 	}
 
 	return dsi;
 }
 
-static void lt9611_bridge_detach(struct drm_bridge *bridge)
-{
-	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-
-	if (lt9611->dsi1) {
-		mipi_dsi_detach(lt9611->dsi1);
-		mipi_dsi_device_unregister(lt9611->dsi1);
-	}
-
-	mipi_dsi_detach(lt9611->dsi0);
-	mipi_dsi_device_unregister(lt9611->dsi0);
-}
-
 static int lt9611_connector_init(struct drm_bridge *bridge, struct lt9611 *lt9611)
 {
 	int ret;
@@ -855,9 +842,7 @@ static int lt9611_bridge_attach(struct drm_bridge *bridge,
 	return 0;
 
 err_unregister_dsi0:
-	lt9611_bridge_detach(bridge);
 	drm_connector_cleanup(&lt9611->connector);
-	mipi_dsi_device_unregister(lt9611->dsi0);
 
 	return ret;
 }
@@ -952,7 +937,6 @@ static void lt9611_bridge_hpd_enable(struct drm_bridge *bridge)
 
 static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
-	.detach = lt9611_bridge_detach,
 	.mode_valid = lt9611_bridge_mode_valid,
 	.enable = lt9611_bridge_enable,
 	.disable = lt9611_bridge_disable,
-- 
2.31.1

