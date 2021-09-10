Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 933434069C4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297AF6E9CB;
	Fri, 10 Sep 2021 10:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37096E9CB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:13:53 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 4D8A22B013E3;
 Fri, 10 Sep 2021 06:13:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 10 Sep 2021 06:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ElwsU250aG/tu
 9y6tqB4Q8NGUP8iiIiI7vQRc+08/+w=; b=VF2K0F/P2QiCc1Cs8Q+aI+t6kNyiV
 tmWi6oryyVsvBvTYIhar+XpYdpwmFYoQrDbbsd6s5x1bJZnW3/kNQxDeVSsWGMoJ
 z07CtEcYLcNuUZxRnshPwfw6ssK4uZXqJ3NhAYVFxw+hALCpW/nPJyiW37hxZaa5
 4tcrwTcatkqVYERWDPEazgcHreEXq/1BmVRBklGsE3Y+Ah3MRkTkHTBFVU8UuSPY
 yZeWv75jiHIMdB0O7Uwm4XdPnrRqYTS/X4cjRORBxxbdpq2sY8tkcfkLGeocpc4V
 05eD4f7vTqAH3mebp/Re55GEhqcgwhiafmZiPBYRG39QPCW5pGcerH4BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ElwsU250aG/tu9y6tqB4Q8NGUP8iiIiI7vQRc+08/+w=; b=kEExk7L/
 9bf2Zp2eRTdaShQkrhIidnZCMkBXPZ4mv+jCZ83BUqPtGDfgq5be4U+PpwP1AEUo
 sY9vIn4aGylNa/3b6syKjgcoCFecfxoE9y0BXWclWDmMjM3nibvbfaqH0Flnu3mc
 JW8U8loQ0cdV6CAHG6HjHTjy2zOzB/plhWA/eIiX+CGeScRfMBepRKNtncgPhG+n
 0TESBpuX6cZqz4P35vOgOIITt8djZtYfY7XcsJGQBTUZ8P/r0EVjXeLuEfC0XTVy
 rWOgqs/MgVFnm4nsD3fc9I9LLtLCghIoPBiks50CsuEjLcLgWKCYGZ9MxT69wvmz
 ZiclNzS7+VJTJw==
X-ME-Sender: <xms:3C87YR2qM4JMrVmEXPSP_EZtBfHKhtdTLWmmSojyg1et2aK0UIPvcw>
 <xme:3C87YYGYhxupgcckAyf_m6NylFH7XiGYk5jlQlzuk958BVYeYLZ8hMEyyNd_OipLs
 PJKY33efI7priiAFfE>
X-ME-Received: <xmr:3C87YR4tDPhMt5es4pACsKCti3X3Smdd7n6i_CRzP7RzqZc8uUpqONzVfMJZ36fsQa2qTLUglv5DCuDKihfMA-tIzZwDJmzQqLN3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3C87Ye2VQ27Oj_dV3-egQLiEJV_NHUiTag2v69vcfDA80Y67OcAWgQ>
 <xmx:3C87YUGIOaRcptO1uZmuCh4cJIN_qjwWS1ecr4XtZoffVNZo4lSxRg>
 <xmx:3C87Yf8FvBfeCzPFPHYTXzwWUPwdhLEStg3x008iWQVoh1CaPjgFTw>
 <xmx:3i87YUUeDDzEpkgEB3he3_eBF3UKQjSJ93LwbD0re7sCZ5u0hv2vKn_XzT0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:13:48 -0400 (EDT)
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
Subject: [PATCH v4 15/24] drm/bridge: ps8640: Switch to devm MIPI-DSI helpers
Date: Fri, 10 Sep 2021 12:12:09 +0200
Message-Id: <20210910101218.1632297-16-maxime@cerno.tech>
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
our secondary device. This also avoids leaking the device on removal.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 685e9c38b2db..c943045f3370 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -243,7 +243,7 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 	if (!host)
 		return -ENODEV;
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		dev_err(dev, "failed to create dsi device\n");
 		ret = PTR_ERR(dsi);
@@ -257,17 +257,13 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = NUM_MIPI_LANES;
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

