Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5699D4069CA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDA26E9D2;
	Fri, 10 Sep 2021 10:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C076E9D2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:14:25 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id CC4362B013EF;
 Fri, 10 Sep 2021 06:14:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 10 Sep 2021 06:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=1N8Q2OVDpki+l
 RDVNDJiIqx4Qf0s/gbBh5ALwV6H7GY=; b=n7FCoN6Wacsg9GCg/EGgKqHi1VdR7
 Ri+AoLuvKPC1l17ugd4wuM4giLogSsCQtNyABM/HXbkfLyXpkThHFDcGYsCGVNa2
 SYlhDUB8t8WgFG2YcP+Fd362xRnz97+Ur4cT/LTQwyJ2YGfIOWozW+/Gu54YSqVO
 8uHMlYIEjBf5tyUv5wKoQYpSc2+Fn1sC5iC9OzLuxs4SYepVWP87YBiVfylKI8cp
 EZIy5iYdXTdwQ6w9nMxvz21ToUmpxL11KI+rz7kLNcErIAJMj6VItDoaj/JO9io0
 oEl3mf+Xn1gJKp16G/Tme6y/lyeszAHqd83lpaNGZguHxZWUEOI3Np7PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=1N8Q2OVDpki+lRDVNDJiIqx4Qf0s/gbBh5ALwV6H7GY=; b=oHLL+aQp
 /LiUVytCV766GUwtlZqfPWLwJIZXU7DUT+vj930cO6YUq5lZPMCLOROVRP6MFvEk
 WkfAMYRfqudbq0dzrjDfMdETlep1IBnvWCEO77ScHDthuiYVAxPe12is49Tnwp2E
 H2leE7wO6bSg6cF4lU8myXtY9CbfpOT48YfNx+QXzsnOMNaZr1xS3Jn4twDPhj7O
 NOp5eMsxZZVjsYmR74ugxe0sOlpvaVgdHoWYppAcowSsTYYLxiSFHQX6l0BaNQH4
 54aC8Jp82A7CGDpLKAcChF98aiI6kdR32UKXEq/fSGNlEPVpSG/C3CDs2KECN84x
 9J9K4068b88FTg==
X-ME-Sender: <xms:_i87YTkHwwtcvUqSN8reBPtulEOZKi6Ox4s71SevAvPP0wI_Ra7Yug>
 <xme:_i87YW1lCZnlBbBXcWoQ1xFql5kG_t0Sdr0qCA6-8TLHk9-u0Zs_h51ORvHoCuSb8
 OZ1k2yC485JmlHXxyE>
X-ME-Received: <xmr:_i87YZp1_Jc5RxplbLkmo_5nvIjCNCMjci6-tpiDozUtokFf0_SUoRzurvMb3c069qu1onMd0DKMz3gfpIFVZ20L_xWk4N-DvYHE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_i87YbnaAcPg6vEG1pndzAqO2qD7byH2ih8-gaJ2f8SeWRsoPgb4VA>
 <xmx:_i87YR0bHP805syRT0O9yBCL_mbce_YyyxivOX0DtgKiLQGfh7gyzA>
 <xmx:_i87Yas19oQzAg4HZ4HACau-bakTX7BWLTUa-pLg740PMdR26yyk7g>
 <xmx:_i87YfGTU6ybL2Uqj9QWdjEsNzSLfxJvzQaGk_qgV3pFBXN5gfeFn5cd-rQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:14:21 -0400 (EDT)
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
Subject: [PATCH v4 21/24] drm/bridge: tc358775: Switch to devm MIPI-DSI helpers
Date: Fri, 10 Sep 2021 12:12:15 +0200
Message-Id: <20210910101218.1632297-22-maxime@cerno.tech>
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
the bridge.

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

