Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E74069C6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F301B6E9CD;
	Fri, 10 Sep 2021 10:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706156E9CD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:14:03 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 920CF2B013E7;
 Fri, 10 Sep 2021 06:14:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 10 Sep 2021 06:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=t/SKmLWmYjueN
 K244TlAYIicugAW8+1V0g1/mYOybmM=; b=g4tQvPvB8IVKaFjjlLAoN0zd5psRo
 mzc/Sd1gHGikX46Q/69eTijzxnQRzPRklZvHv7eA6KEOVdKvTww6P7DR5YyHOOP4
 ud2U0B67WgQ2qdK8oS2df3MYMxv3YUARm8z76be8uBGn6DZw4oDz/yK1Kd+ZFY5V
 Kr064jPlvWMkWxYCmFiSx5usTNLmLoXpZxG3a2+k3E4BFyPLAAbP+RTrnxYsjXnK
 OBK8eosbDeO04bs+zKgWfw/d1+AkkADOZ/n45fflDa2x6qIqNL0zh8F9z9UxjQmt
 A6nLkDdY3z4amM+KVhvMcg6Y2TeLl2kpVF7dX9TYAUuSUuXsH8gD5WLwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=t/SKmLWmYjueNK244TlAYIicugAW8+1V0g1/mYOybmM=; b=iaSCw21v
 cMtsJLFxNmNB2ikpaqQzPUxFq7/1hwbMMq8nS7HcCTlLEd5jF3iY+MgQktZakHkb
 SEPHVYnzfP3iQzmLzMhxLNPAuSrBZ26GJbHa2alNlQkZpAS8qjo7GPLkWVv0pILB
 X2chU08CYSd0lTr6sIFxGz+k/STLNcn85mS33vqomHhDD+ZNc7+afUluCULO2Ono
 AQDbB47WfY6yfQVYY/YSBAA0MnYoYQnb/VLYcNMvRL9eYmGVoc5cSsrPGPjzM0Rd
 mFu43gowI8gOGfjKs4PdY3VF0J1xvb5qLhuULpdOL71pv1Zwt21J48T4jhC2xg+j
 4OXQSrBRJH5Caw==
X-ME-Sender: <xms:6C87YdKGjwmwAgsbqDqd4urngLVJJnxmrBOcL-bZOrJJnxJSe0jWEA>
 <xme:6C87YZIvy7Iyk1AHC4wPKatnD8qclR_6Ns0Tba4yjBCNVaeXY67uHrgMSlnXsuZrl
 Bs__43LukiGUoK5S60>
X-ME-Received: <xmr:6C87YVvFOBtKSNFBAGNw7gpEIAD6tUaQ5bmXInqN4RZOc3RXX5tfrWPGgFSVImSRkyqfvulncEXQEu6OHUWKpSOQwl8acrOew33x>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:6C87YeY1Q7chE6HdWU7OInupirzKQCeeSkSYEN7jX6KUIerdlqdSsw>
 <xmx:6C87YUZbVsrlmZMLAtAI7d8r95QzEn7noHJFT7chSNMpdCL0nSWsjQ>
 <xmx:6C87YSBdNBYiIREKzywwqoKayOhe51iaum513PRiiWH3hdRZ9jfNwg>
 <xmx:6C87YeaZC5F8HXS-lbgiyEegKjkFD6Xxr90hvlbL1F2IuOn-Fu9T9OTZXxc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:13:59 -0400 (EDT)
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
Subject: [PATCH v4 17/24] drm/bridge: sn65dsi83: Switch to devm MIPI-DSI
 helpers
Date: Fri, 10 Sep 2021 12:12:11 +0200
Message-Id: <20210910101218.1632297-18-maxime@cerno.tech>
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
the bridge but don't remove its driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index a32f70bc68ea..db4d39082705 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -262,7 +262,7 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
 		return -EPROBE_DEFER;
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		return dev_err_probe(dev, PTR_ERR(dsi),
 				     "failed to create dsi device\n");
@@ -274,18 +274,14 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach dsi to host\n");
-		goto err_dsi_attach;
+		return ret;
 	}
 
 	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
 				 &ctx->bridge, flags);
-
-err_dsi_attach:
-	mipi_dsi_device_unregister(dsi);
-	return ret;
 }
 
 static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
@@ -697,8 +693,6 @@ static int sn65dsi83_remove(struct i2c_client *client)
 {
 	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
 
-	mipi_dsi_detach(ctx->dsi);
-	mipi_dsi_device_unregister(ctx->dsi);
 	drm_bridge_remove(&ctx->bridge);
 	of_node_put(ctx->host_node);
 
-- 
2.31.1

