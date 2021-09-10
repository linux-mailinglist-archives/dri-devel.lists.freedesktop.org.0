Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7904069AF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F5D6E9C3;
	Fri, 10 Sep 2021 10:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6153B6E9C3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:13:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D36B02B012D3;
 Fri, 10 Sep 2021 06:13:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 10 Sep 2021 06:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+UpsXSHbIVDyd
 OpRIRThCG8UYaC5O3WER8EzRNWX41I=; b=UXG0Iptj0nQKxsb7MStx5CTCo8B/o
 UcEND43wdIeySN7GsCP0PTVKQkGde3/zGXHgpy61AyyKflFTzT1I5h8tNE9Dhi38
 RheuUYB3PashKL+94nTOQq4iMTMh6UkryZcLtshI7YAd36fSOQfi6xVhWRSrPAst
 fFUd3ZlNHfTJ90wyd7SbzrFfG9MBK6nuECm6qYbRTuxVSsNo8MObahlq13YlHo2u
 J9XSkM2oMk5N9ERqrZvf6Eq6HYUu5ux8zUSedq0KCrveCM5ZYJr/VnD5718R56If
 xgPuAuo7rgdHGrwXvKoA9p8lzhntjnlZxXjn4MKwLYCZEesqLwysmqBpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+UpsXSHbIVDydOpRIRThCG8UYaC5O3WER8EzRNWX41I=; b=ntQXVpaY
 vHxdtFfrxHI4T3s29LOi/xYqu47FqGYrST2GAf4RykPpe1lpaT23GRl9KAEPE7S1
 46JP/HUXy79fXDjLf8JD0fKT16hKvbsK+ff+9sv1PpEp/pOomcyo/3YRL5zA5jC3
 9BF9nDuYWuHtzJ2VUi+SwCdwgfjZ2xHnrRU8SHGT8gQ+AmwlGeK2Sw0ggXw8Eqdt
 HOBdIFpa+OhRltH4Nra4NUDiheNeu5fgT3EwfYtxzIJ2ItGDUThyplpX/CngNuHa
 NrKfeBTJN1FBkK4m5GOz5oGo8cY2b0l9ZyzHPvBGiQGRiJn5/fpBMU3JLij8gSdq
 zCjVEHw9FDep1g==
X-ME-Sender: <xms:vi87YccTbdqmroPaQQW_HCFwlymir4_uYp5kDvemARU8ehGu51rxyw>
 <xme:vi87YeNRoBWYfrhp4H1dLEQHWf3uelwOyp5C-dqLat4BLiV9pTw6m5JIqeadTMpDJ
 6XESck99sTd56yRc3M>
X-ME-Received: <xmr:vi87YdgneY3RAQd_1Zi-4X329w4NVjlnDCC90dYnXIuuFKMZ2yjZ1Bj2hbp1EiEpEi72Wh792sMIwieIVbROzXCG6AC4tVBn1K15>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vi87YR9zZWaGjI32qAZPhn0wHWET5N0tUBUDos9GaSYGfcScabjBOg>
 <xmx:vi87YYuid_1p_XNx0IpSYkbtbx_MAgOKLcLdCpcBR_PjZqqKslfz_g>
 <xmx:vi87YYGzA0u8WDhtgFef9Njp8ThU5mXhlfvQ-amLmtYW8PblwlSqDw>
 <xmx:vi87Yce0EuI6r3NceRv7tInON6elKawhsxAu-C2d4IYBbGi_-uNPDZ7KRlE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:13:17 -0400 (EDT)
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
Subject: [PATCH v4 09/24] drm/bridge: lt8912b: Switch to devm MIPI-DSI helpers
Date: Fri, 10 Sep 2021 12:12:03 +0200
Message-Id: <20210910101218.1632297-10-maxime@cerno.tech>
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
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 1b0c7eaf6c84..cc968d65936b 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -472,11 +472,11 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 		return -EPROBE_DEFER;
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		ret = PTR_ERR(dsi);
 		dev_err(dev, "failed to create dsi device (%d)\n", ret);
-		goto err_dsi_device;
+		return ret;
 	}
 
 	lt->dsi = dsi;
@@ -489,24 +489,13 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 			  MIPI_DSI_MODE_LPM |
 			  MIPI_DSI_MODE_NO_EOT_PACKET;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach dsi to host\n");
-		goto err_dsi_attach;
+		return ret;
 	}
 
 	return 0;
-
-err_dsi_attach:
-	mipi_dsi_device_unregister(dsi);
-err_dsi_device:
-	return ret;
-}
-
-static void lt8912_detach_dsi(struct lt8912 *lt)
-{
-	mipi_dsi_detach(lt->dsi);
-	mipi_dsi_device_unregister(lt->dsi);
 }
 
 static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
@@ -573,7 +562,6 @@ static void lt8912_bridge_detach(struct drm_bridge *bridge)
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 
 	if (lt->is_attached) {
-		lt8912_detach_dsi(lt);
 		lt8912_hard_power_off(lt);
 		drm_connector_unregister(&lt->connector);
 		drm_connector_cleanup(&lt->connector);
-- 
2.31.1

