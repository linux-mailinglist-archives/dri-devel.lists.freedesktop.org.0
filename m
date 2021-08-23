Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E7B3F46D0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 10:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D425A89D02;
	Mon, 23 Aug 2021 08:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E065E89CF6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 08:47:44 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5CB1E580C67;
 Mon, 23 Aug 2021 04:47:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 23 Aug 2021 04:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=MCO6uj0/cISIN
 Kyz7JVIjMPz/3XnbFvJs0ZE6EpqQk0=; b=qLq/L86sCsef405+r498FzfiyU9T7
 FYNl2vhqVRNIE7zpfC1bn4pNVzRPZAUax9HavMkyv75mYUALb7qVBfufBnJsuRiP
 qKWaT01wubS0DDsfLPckWBLFLL2rEFNLGjpInY78LW7ydd+OfaXF7xUFZ9qy/SDj
 4fwUtIFDqOirWGIcqLGu3b8iUiQITG+342zv6QfxcDHGtxzkEXegQpveI6PYGwFV
 iUkdrSG76KNmrEd3sCHrXUim87ySv/o5z8Ftmnl2AEqaKMkIPAvx08Gx+DLy+rl/
 bddNmRoHw9nhcvhAAVg1PitrZrsx+d2ZekxayDJkVey5eZiYp818OnGjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=MCO6uj0/cISINKyz7JVIjMPz/3XnbFvJs0ZE6EpqQk0=; b=kHnY4+JO
 5+9XXosuqdoRAm2iOFrEozsZhAUCjpRwaKnYwNr3eHbRIYoblE8wL+W6jIdBzMnw
 kac8S9lXRncAo5eeZXmeu/BvFsupjkea/3EK0d6UVctn3+5l0iJdBvjWP7GgvOIv
 wfbQbmrkkIIqjbdqNSAHSQLrzv2D+ggr3ixpjrjt3kpeyZGh3w3BD6T1AL+XIqgK
 APXEKOw7RTErSEAFrxthtgBM6HmSrXfofJ/TlEaDDTs30+Z2yaVP91k4F3LvY6yk
 sXmuxeMV0HZTQnRoscLu+vrKUXGXaqV/sfKqOyj609HzIgIF4AP6d4XY8t4FOegF
 Q0YcZE17QyKGlg==
X-ME-Sender: <xms:r2AjYepBtjz9Qx7U9ByUgHPyg7STjxYIrqhJN7OsRnzhxUEhrGqHBQ>
 <xme:r2AjYcpogJDWVf8SJFuZKKhYcIQE-B31IF3yokHkGXS_0rFs8ufOCCYlNfhbpAbXi
 BSIIRfYQfhGSC1TZxA>
X-ME-Received: <xmr:r2AjYTNyaqIk59a9210sHIfiC6jgKBKKLrQCa2p3qH1zPG6-hqcefo6VHWguN0a_0hPuFfl7usnpwTbBB1096MqQ8q1yRrplXuF5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:r2AjYd7d048pm0Yh4Zpt1CVOwFhpOuI4m0gE1jvpzkUAa0AyzpPzsA>
 <xmx:r2AjYd6vdt8MaERAwc2x_GQP-foAW82WVVCE1L-ePdUBjzvf8pXDWA>
 <xmx:r2AjYdjxGO1hc5L4pXtVHTSRpg8odpKuUf9W5x7eFVmK6ZmyOcSBtg>
 <xmx:sGAjYcJIk2eYJgZAoq8X3g4_TEx-HRJAHqeeqFRGX49mx0evTf1xMg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Aug 2021 04:47:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/8] drm/bridge: ps8640: Switch to devm MIPI-DSI helpers
Date: Mon, 23 Aug 2021 10:47:20 +0200
Message-Id: <20210823084723.1493908-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823084723.1493908-1-maxime@cerno.tech>
References: <20210823084723.1493908-1-maxime@cerno.tech>
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
our secondary device. This also avoids leaking the device on removal.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 7bd0affa057a..794c9516b05d 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -241,7 +241,7 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 	if (!host)
 		return -ENODEV;
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		dev_err(dev, "failed to create dsi device\n");
 		ret = PTR_ERR(dsi);
@@ -255,17 +255,13 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = DP_NUM_LANES;
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret)
-		goto err_dsi_attach;
+		return ret;
 
 	/* Attach the panel-bridge to the dsi bridge */
 	return drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
 				 &ps_bridge->bridge, flags);
-
-err_dsi_attach:
-	mipi_dsi_device_unregister(dsi);
-	return ret;
 }
 
 static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
-- 
2.31.1

