Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4473CFAFA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A5989E19;
	Tue, 20 Jul 2021 13:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECE589EA3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:45:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 182F22B01189;
 Tue, 20 Jul 2021 09:45:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 20 Jul 2021 09:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=s1/AGqxR15g+h
 Pk2op+DrdT6xO3KSQkr55JaRssrGcY=; b=EbC4yCxjXxo6DS/vKoYyfM/ORjISk
 uu1uLEFJgthMaHxG/pUXxz+5mWDCMlFnLNDbC5VFYOv7D5niZCh+Blu6JnC2mwFj
 lxMJkHlSzAWeFT0JI95aLwSQy5SwTBUy+RtzQGLoRt1K+J+H7P7GcsY13taMNbfP
 mf6gq2TYoS6EyjKnZgzwUGDkwx3UGDnAKVS/isoD/wWRxGSLQ97iJeCpoBH57Oa0
 HK3CJkBQ3fAFlpH5rlvld/be4BSiZeTfLH1ahn08TaRrQjHkd+mU6a5/OqrcRelP
 U401+gqmX2ThdL0BwXMitE9zAEuIqOoHs4L7lQqmxmoy5qT9sjRF8eZFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=s1/AGqxR15g+hPk2op+DrdT6xO3KSQkr55JaRssrGcY=; b=Iq0S8KeP
 N1NUOw1XSE+kw9ebJzm8UXOa4J8Vae2JAldVuBioqFD0D7kaSYjSwLUAsXDx/V6S
 Vojze0ZW4HXvy0hhOSWUFQMUhU/WuT336lfIFbLrqlJSwr0pS2QFx/L7UOL9bvyy
 JHPZYUuyy6Nl7LKxXJ7YtILMtgC7zJ4qmSZiq/iCdk9rC/N7lwSxchfz83OmxwNk
 nxR2EFtXLg1Sogwb2PBdDTEbRfF70IhvszqX75nGiUKmcJPVZFX+fMexGIDOYOC0
 DDFmMLR3Fl5fpK4v5piGb3E+MbVwJ+8VwXYX0uAcfOSQ+4A9efyTO+twCDP0dYft
 pnTVjynvzGbhgA==
X-ME-Sender: <xms:ftP2YDLR4odIl0zz2dO3Pg1oncTEQm8CMIWXvobXHfbCdg1H1jlL2g>
 <xme:ftP2YHIalCFSkEt4FnqRpmEIR4bwIo1t1j0nqKqwrbwvR0GSYcmk__XBm79njqHAT
 Dw-UnMLDw72Jg9jlUE>
X-ME-Received: <xmr:ftP2YLsGSpB8UML5w2M7Ye6-AplPjY0H3CeVGQOEnLroQB9lDd8MWykJUMoLHxox51r1E2iwxuMohez_a4WM1uci9i-AU5NlHM0j>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ftP2YMZL2JSk0OvdvKoHKrNG7Yfp-ncfdZ5U0SZNEEzjRSwQ936MLQ>
 <xmx:ftP2YKbr937UhCXD0RpI5spebW-cCCknxGgPzpeBTueK4GiMzDLcjg>
 <xmx:ftP2YAAWNX-k01TWcYVxzej_BvFuQI3pnc_GBPbLG0Ro3WbGn6Bkqw>
 <xmx:f9P2YCqXiQIddCna21XWNvS2eBwKREEO60bdoW1xjjo9gJGlAYYSsUWhyW0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 09:45:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 01/10] Revert "drm/vc4: dsi: Only register our component once
 a DSI device is attached"
Date: Tue, 20 Jul 2021 15:45:16 +0200
Message-Id: <20210720134525.563936-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720134525.563936-1-maxime@cerno.tech>
References: <20210720134525.563936-1-maxime@cerno.tech>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 7213246a803f9b8da0677adb9ae06a3d8b806d02.

The commit 7213246a803f ("drm/vc4: dsi: Only register our component once
a DSI device is attached") aimed at preventing an endless probe loop
between the DSI host driver and its panel/bridge where both would wait
for each other to probe.

The solution implemented in that commit however relies on the fact that
MIPI-DSI device will either be a MIPI-DSI device, or would call
mipi_dsi_device_register_full() at probe time.

This assumption isn't true for bridges though where most drivers will do
so in the bridge attach hook. However, the drm_bridge_attach is usually
called in the DSI host bind hook, and thus we never get this far,
resulting in a DSI bridge that will never have its attach run, and the
DSI host that will never be bound, effectively creating the same
situation we were trying to avoid for panels.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index a55256ed0955..6dfcbd9e234e 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1257,12 +1257,10 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 	return ret;
 }
 
-static const struct component_ops vc4_dsi_ops;
 static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
 			       struct mipi_dsi_device *device)
 {
 	struct vc4_dsi *dsi = host_to_dsi(host);
-	int ret;
 
 	dsi->lanes = device->lanes;
 	dsi->channel = device->channel;
@@ -1297,12 +1295,6 @@ static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
 		return 0;
 	}
 
-	ret = component_add(&dsi->pdev->dev, &vc4_dsi_ops);
-	if (ret) {
-		mipi_dsi_host_unregister(&dsi->dsi_host);
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -1689,6 +1681,7 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct vc4_dsi *dsi;
+	int ret;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
@@ -1696,10 +1689,26 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, dsi);
 
 	dsi->pdev = pdev;
+
+	/* Note, the initialization sequence for DSI and panels is
+	 * tricky.  The component bind above won't get past its
+	 * -EPROBE_DEFER until the panel/bridge probes.  The
+	 * panel/bridge will return -EPROBE_DEFER until it has a
+	 * mipi_dsi_host to register its device to.  So, we register
+	 * the host during pdev probe time, so vc4 as a whole can then
+	 * -EPROBE_DEFER its component bind process until the panel
+	 * successfully attaches.
+	 */
 	dsi->dsi_host.ops = &vc4_dsi_host_ops;
 	dsi->dsi_host.dev = dev;
 	mipi_dsi_host_register(&dsi->dsi_host);
 
+	ret = component_add(&pdev->dev, &vc4_dsi_ops);
+	if (ret) {
+		mipi_dsi_host_unregister(&dsi->dsi_host);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.31.1

