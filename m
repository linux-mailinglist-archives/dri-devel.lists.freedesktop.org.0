Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B44C74399F0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB476E0BF;
	Mon, 25 Oct 2021 15:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5C26E0B8;
 Mon, 25 Oct 2021 15:15:55 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 13F9F5806A9;
 Mon, 25 Oct 2021 11:15:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=5DYu0cvmP8Ovg
 zPcAQBqcadRggWOBGnej15W0Sy1/ns=; b=Ar9uGz3NNJ9t/5XsSK3cwvVDPB90+
 71fD5H0qMEXdWie5ihdnKsEUO+yQjcFUlKiLVLnqWoL4rQJtrpXX8C7ukpr4FQcM
 RCa6CuCHeQJYigRsR3DavXUdnbX83al8/3pT9GwqkDTDUEANBpNEyWAsdt4FL7+q
 Edh5EnKdqErQ+urS1Zrw/o7uYA8CZbDgBHfa2PTs90pWfb1pvlxOj6H32EY+U4aw
 XCLFrMN6HgravU/3PmtOHDpcZCY6NbMHKdgn1igpYUy+s+45K6Bly2M65eqKNmT6
 Y/3zuhSaTvRNNSFNelF8Zy8i3WtqI3hHJuOvVSV4tDLfXvGr3lz0lHLSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=5DYu0cvmP8OvgzPcAQBqcadRggWOBGnej15W0Sy1/ns=; b=FhzUKQ02
 NKiUb+M9ZvncJRW1IYlcPE0idpg/t5x+T8Q2pZ07N9C6PRABhoREtFq4eXECghrn
 UGQu4WpAYmsGLvx0vzwVaeT4zu0TelO668U6asRs2vclAVGmddcdkh16XOT5u0iB
 TLgk6u/JxPzeKSUf3eXipWfGmN3LkOQfS5HthnNl9dZ76B+dUdvjruFJK//CQSqW
 BdzLcKsCzkK9iGT8umKBwWeR+dVOHK5P2qoosccPoelOKwMX7jTJH4CrAjAxSsLX
 xJH5N3LeopQSdgJL4Cje2SRyOWHpHXwAcOBvun2/fY0oB5mSRDNVgQ6/JLoPw89M
 U/6Iz/FrEzu8VA==
X-ME-Sender: <xms:Ksp2YXbaGXG4YUXlVqCJel-pxmO95pKsFqhtVJb-PIghHlQOWcHy7Q>
 <xme:Ksp2YWYkBmOvPTtL7RE6qvAWo9tAdJ5lQIrK1tydKS_thOvJsYVBcQ5meh4K5DrKB
 7u-QGkwYsbPC2L49Do>
X-ME-Received: <xmr:Ksp2YZ97uad_OalQOqUy9vvaeb-fAZvmxyImGU1V1AOsep8hC6YM9aULoZxDFjbBg-F5nfCnCT3bJz8uQIDHah8SzeiWUGljkUn9NRdW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Ksp2YdrogSydRDO7Sv2d3qQ1h1wpjRiEINHpA7CP2dldal4o0kE5yg>
 <xmx:Ksp2YSrFv5s82Fqp_MdWXOC5KbUaT6tCKgjJxWn8oHT2rNlcjYW-Ww>
 <xmx:Ksp2YTRLaUtHEk86_8pEVHTpV0VVpOgFV3a6VaaHkZS4OR3qLHLNFg>
 <xmx:K8p2Yfoh1bMNDGFxvxu_wq182z687I7wdVFBIsu9cV_YRs9dLMYOnA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:15:54 -0400 (EDT)
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
Subject: [PATCH v6 04/21] drm/bridge: anx7625: Register and attach our DSI
 device at probe
Date: Mon, 25 Oct 2021 17:15:19 +0200
Message-Id: <20211025151536.1048186-5-maxime@cerno.tech>
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

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time. Let's do this.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 4adeb2bad03a..d0317651cd75 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1367,12 +1367,6 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 		return -ENODEV;
 	}
 
-	err = anx7625_attach_dsi(ctx);
-	if (err) {
-		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
-		return err;
-	}
-
 	if (ctx->pdata.panel_bridge) {
 		err = drm_bridge_attach(bridge->encoder,
 					ctx->pdata.panel_bridge,
@@ -1845,10 +1839,24 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	platform->bridge.type = DRM_MODE_CONNECTOR_eDP;
 	drm_bridge_add(&platform->bridge);
 
+	ret = anx7625_attach_dsi(platform);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
+		goto unregister_bridge;
+	}
+
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
 
 	return 0;
 
+unregister_bridge:
+	drm_bridge_remove(&platform->bridge);
+
+	if (!platform->pdata.low_power_mode)
+		pm_runtime_put_sync_suspend(&client->dev);
+
+	anx7625_unregister_i2c_dummy_clients(platform);
+
 free_wq:
 	if (platform->workqueue)
 		destroy_workqueue(platform->workqueue);
-- 
2.31.1

