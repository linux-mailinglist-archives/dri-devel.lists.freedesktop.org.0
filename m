Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D75B6439A08
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A85A6E0F7;
	Mon, 25 Oct 2021 15:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241546E0AC;
 Mon, 25 Oct 2021 15:16:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0EECC5806B0;
 Mon, 25 Oct 2021 11:16:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Z7ANxwSCuwS0R
 URLyvuze3uqYVQmNE0MSkpaXoK8tPE=; b=lrLNFA1Vstcpm9VyxaiJVSWyu17AN
 tRP5pPCm1GnQO4pW/Xdf9MTBUAD/MGrlzVifez0Ra0iJZyLY256gTYtDU9HZtWUC
 70slgGnrYHqx+1QAxXtLKOVBd17kudsLt01LaAEFlkAPExyo3iq+Z06R8NvUZ6ag
 vSERMbxXl7uZMlZXoNukNF6xheaA3+1www9lcAETz4p0Bos6VH1ANCAxOXX9wy4/
 uu46tGjh6kFVL1UO1656Nu6G0FIOBts7Ry6/0Ao86x2q2O6qr0LSeMj4UWkhIVPS
 UJ22wm8MPDksIlJEbhjnDsRBhIYNPDkOh3MrMFT/N8MSlsTSHKWKl/4mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Z7ANxwSCuwS0RURLyvuze3uqYVQmNE0MSkpaXoK8tPE=; b=g6SZc2xU
 CKtectEAIxdawUW7z8v7UYLFe6C5MG9X53x8wtaszUJtajPqVNmS1sxmxTY/dqwS
 dBKNIh1FCfhpdh66KbOuH5DIqZM+w2/9ADd2gh/FjKaVtCgt/6Z/b85nMbRrCfUu
 IYvSnHaUeSgfD0LF3/uPKQpConhvhf6WAB+DQvOEV/FSCeKgDX799zq5jwN7OVVz
 Bb7lYHYnZF+d0U6WRoi/0YSPsrcHiJa+ZzZ1YSgxaN3k29eFKst4C6u7bZPZPM0Y
 QVLpJKgCi8uTJZlrbu5M2R8NSlnvbKvVqLvIBASIka1StQxkPuVjGfslDelzHqnY
 q0tQYLR/UdHhDA==
X-ME-Sender: <xms:MMp2YYd2C-FMtTyCOTP1UkU1uNknadBvJjXDGpz5EzHeE2uVC1PhgQ>
 <xme:MMp2YaPdyLxr2CQac7gQf0VUamkNSTDICppkKEumsqoyXXDw7786zx514dFefGAEk
 o-Sx4x-ftpvdlwD66E>
X-ME-Received: <xmr:MMp2YZgoS3xI5ksxjHDNh-CFmm2Ip_Rh05kivJ-Ct_EReUy-xInbc-eVyX-5GIbYGI6pGzNBLYI0W9nvqXGA7s4ka0Ndvxg1tjeXi1q_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MMp2Yd9EfPPm_EF08iHkVt8tQJyrcwVwAPRx5oCbYySTt2VVKqTz6w>
 <xmx:MMp2YUtxoW17lpqM7W1fAxdFGMqGwENCv61f34lC04SX_1cGeyN87A>
 <xmx:MMp2YUE7kbUWubwpxr85LzDNVuWZpvKeyv7mSB2HJ0VgyrFORS0CfA>
 <xmx:Mcp2YYccv879PemulmAS8PkX4sEB_nSRcmQMqqP4xeWYC8gQGXrcpQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:00 -0400 (EDT)
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
Subject: [PATCH v6 07/21] drm/bridge: lt9611: Switch to devm MIPI-DSI helpers
Date: Mon, 25 Oct 2021 17:15:22 +0200
Message-Id: <20211025151536.1048186-8-maxime@cerno.tech>
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
Tested-by: John Stultz <john.stultz@linaro.org>
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

