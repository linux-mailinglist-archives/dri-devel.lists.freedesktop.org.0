Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C782D4399D4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7FA89FED;
	Mon, 25 Oct 2021 15:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A1E6E049;
 Mon, 25 Oct 2021 15:15:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E34B4580683;
 Mon, 25 Oct 2021 11:15:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jf5aJah++UV+M
 Th4CVC9+SEI69qBu7q3NX/pnOTWeXY=; b=YM/iUcpEx4GAQ89d47X5lG8hswgtx
 nUIxa6t3A/UUzJEUj8cTJZQSCTCEVEbVEL1RLT2c53OMM4D1+/XiQPGyUN4FG7Kq
 /x1PjS2H52k2BZ2pwF1buYzbusaJH5sjqofCm4UHCO6zxYxOTGiaDs+CFLTOwMvM
 qNx/RAUWV6IhKKHYaP46xQWcyuTsvJ90EYlhXg3lb1K6oPBVszMlLT2wOlkpPP2Y
 pL+hs1EjYuY5xj3W4TiVBp/ac2+zS288mKZuLwx8BTPTt255e7b9OmR9OejuxKKF
 asPpoi2Hrtj0vpdB8u4Faz3USzQsz3eZzj/wSejzodWWLjCrJVEubhDNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=jf5aJah++UV+MTh4CVC9+SEI69qBu7q3NX/pnOTWeXY=; b=SBOn2wOV
 O47vaSgEvrlb9SOnwMi5fOCv1+fafl80Lt5fwqC7KufvF4ENgjaLKFMzGVb/lvtl
 +0qhaNFALLk6Jn9TDHecipmnPNhN//IRTiLjQ3eA1OQuUzuKnA3hmKWqzubnAOUC
 so07E25hF8t2oQbuWOPILakwIkA9zrkKxl/+dMxukhzk2wWBUSBuBTln1Cqdu4vY
 Z3UWHUvTT6PIDX75kPIm+1iqBgqWRTikqkZVWVqy5WkaJ08EtFRsJAOK56giOHmk
 79RHCNWm9SW0C6bkAAd1SaFMerjYK6B/4e/bJxDm1buuyB3sl3P/787xgiodEVtZ
 nO6fc0PS163WrQ==
X-ME-Sender: <xms:Isp2YTx1vldVkMcQZabCZQkM93FpN97lK8R2gYrby9Csn6gZY2narA>
 <xme:Isp2YbTusdwqLgrjtlVdWYju8rQtKd6Sntfs-nGthwyQbCNkCTz5bSVwfOyyonqqx
 -onSCEiOgmjGFLxJhk>
X-ME-Received: <xmr:Isp2YdWyiPHon8JdLKikbmpSEch_Ym0U7BcdTcSm7h9Kex4DF--p9kQB2oMQ3DIgDjNR5z3C0PHWkYXpJg5L_1huo66UDaVBN5GYHnfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Isp2YdjuHn_2S2rotJIqrqMZOIrbbIrJgznUzeLiqMI_lFPX8ssSKw>
 <xmx:Isp2YVCGJaZU07c1qXiAGoxSCh_I9VfL3Q9O2DxovbiYZ8TS1I9-8Q>
 <xmx:Isp2YWKsTCfPwPDiN_98FS2iVE15o6DZIyq1G-Gk8YUdk6qBi4wK4g>
 <xmx:Isp2YSiylohgAtgX1xUDcA0aHMkh_Je_6daPd7zsR0_BQ4YhKn_76A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:15:46 -0400 (EDT)
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
Subject: [PATCH v6 01/21] drm/bridge: adv7533: Switch to devm MIPI-DSI helpers
Date: Mon, 25 Oct 2021 17:15:16 +0200
Message-Id: <20211025151536.1048186-2-maxime@cerno.tech>
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
Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 -
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  2 --
 drivers/gpu/drm/bridge/adv7511/adv7533.c     | 20 ++++----------------
 3 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 05e3abb5a0c9..592ecfcf00ca 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -401,7 +401,6 @@ void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode);
 int adv7533_patch_registers(struct adv7511 *adv);
 int adv7533_patch_cec_registers(struct adv7511 *adv);
 int adv7533_attach_dsi(struct adv7511 *adv);
-void adv7533_detach_dsi(struct adv7511 *adv);
 int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv);
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 76555ae64e9c..9e3585f23cf1 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1307,8 +1307,6 @@ static int adv7511_remove(struct i2c_client *i2c)
 {
 	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
 
-	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
-		adv7533_detach_dsi(adv7511);
 	i2c_unregister_device(adv7511->i2c_cec);
 	clk_disable_unprepare(adv7511->cec_clk);
 
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 59d718bde8c4..eb7579dec40a 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -153,11 +153,10 @@ int adv7533_attach_dsi(struct adv7511 *adv)
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
 
 	adv->dsi = dsi;
@@ -167,24 +166,13 @@ int adv7533_attach_dsi(struct adv7511 *adv)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 			  MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
 
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
-void adv7533_detach_dsi(struct adv7511 *adv)
-{
-	mipi_dsi_detach(adv->dsi);
-	mipi_dsi_device_unregister(adv->dsi);
 }
 
 int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
-- 
2.31.1

