Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6608F439A2B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CDD6E14F;
	Mon, 25 Oct 2021 15:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6373D6E0BC;
 Mon, 25 Oct 2021 15:16:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9EF3B5806C6;
 Mon, 25 Oct 2021 11:16:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=/QMqV2xNvARcz
 7m7ICXmWasIz89maW9VgPKXP0jtMvU=; b=coO6P4VH5A8Ej0CNGlnVd3ln37LGX
 E0k9sNt6J5hnux9DwmVPfmhaGYQ/BRGbjOMRqfdWaMa6M6AqfNjeZcextg2/lZHn
 knxCpg1tsIIrZLmSVXRvlgZI5OILJTAAWlrq1ZD/lIlNxgkZXMCkPUb/Pn+TYZPW
 Poj7a3qKRc7VmOUEeqB6dsDW9dtBrmSVRksUbmk1/7yN15EbzSjlZ3y+rQMTr8gk
 STfFE55JRWnw58g8DiA1rEqLgGa16cFeFiUpLt9o/fH3USuVRgtP4ix/6vLu2tWZ
 JTqdecLViLz9proSeiWz5vDY98kQA2y3vkmeDDarzYP332D+6M1/H96IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/QMqV2xNvARcz7m7ICXmWasIz89maW9VgPKXP0jtMvU=; b=dUJIuxky
 uxiMQam3PPl3OgbRmqB4uM8VLCiUEBoDJ0UU4MNVSwGyxaeNuMo2PHLos8ljH9mA
 ODyxgkpdsKP8fnA1ozfGIv4159Nntar2JBL4JT626QIDQwNqLACYmsXs69AsIhBa
 UQTnDfEigTtJ/sB9KLPKQAh/S6e1CBbBnkcP70zhXjSh7slw0quzbxk1KcHmtLwY
 Eq9xsH+29/kECouLbp3FLi/Ub+cnP+Wj/WeVz6kW0ULMcW4vV7mVuPYZtwFDubhv
 saS1SelAd9Uq9FFDIeSiQ6uVEsfQHk012iq5ej2DKfiSq7dLEBlwA+KUuD4CG6x1
 r9Yd5X6Bx9b/Nw==
X-ME-Sender: <xms:S8p2YR2PFaU2oTAseWWUQ4dQWh-hDWNEWTY77MQrtLr0OXn6WH-uWQ>
 <xme:S8p2YYEZdAW0K-QDtrIsrSdBQS619fdRFjBfqcWasY20rkXdlK6qnpZ5YKmxYak7x
 vT_PmaRQqRBwB-e0eU>
X-ME-Received: <xmr:S8p2YR4apfna_VEDFzWpQziFWxCw5pcGu7H3oA_K8c5S0P2TGCp4cVioZExVEoFbHkDnmN3eZkIaZsbAkoAVz8bPK1RnANjx6Jkdywun>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:S8p2Ye1-Tv3DgI1jcalcT1TwgEbUNNe8etQTUoxoEno3Vj-LeRzMQQ>
 <xmx:S8p2YUG9NCWEHazrpoZxVq5nOOaGeLPoQQko3QCqBoaKoGOuynSKSw>
 <xmx:S8p2Yf-WT5DVIJh27x59AaKtt9miW806v8hzoLTbgjaOnejvx-gfCA>
 <xmx:S8p2YUUvvMJPfC5eKeqiR6An92n8j_db-UHsIEMGlbVkHayQAsKtrw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:26 -0400 (EDT)
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
Subject: [PATCH v6 18/21] drm/bridge: tc358775: Switch to devm MIPI-DSI helpers
Date: Mon, 25 Oct 2021 17:15:33 +0200
Message-Id: <20211025151536.1048186-19-maxime@cerno.tech>
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
our secondary device. This also avoids leaking the device when we detach
the bridge.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/tc358775.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 2272adcc5b4a..35e66d1b6456 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -610,11 +610,10 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 		return -EPROBE_DEFER;
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		dev_err(dev, "failed to create dsi device\n");
-		ret = PTR_ERR(dsi);
-		goto err_dsi_device;
+		return PTR_ERR(dsi);
 	}
 
 	tc->dsi = dsi;
@@ -623,19 +622,15 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach dsi to host\n");
-		goto err_dsi_attach;
+		return ret;
 	}
 
 	/* Attach the panel-bridge to the dsi bridge */
 	return drm_bridge_attach(bridge->encoder, tc->panel_bridge,
 				 &tc->bridge, flags);
-err_dsi_attach:
-	mipi_dsi_device_unregister(dsi);
-err_dsi_device:
-	return ret;
 }
 
 static const struct drm_bridge_funcs tc_bridge_funcs = {
-- 
2.31.1

