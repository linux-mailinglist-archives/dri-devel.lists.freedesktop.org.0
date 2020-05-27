Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E77CC1E596D
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0769A6E452;
	Thu, 28 May 2020 07:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1546E339
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:44 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B3FBC5820B3;
 Wed, 27 May 2020 11:50:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=P60EMhfBagvbN
 CYsash0laZNNpJmdalqtze5MocJiC8=; b=VmBFaM76vEge6Z0d+XLGWJbq05u6y
 nT3QKUCyo/p2UmRZ4A/I7yujmq3lj4IJvHIsXuQZ/ZJBk9CANQrlILyPXIUzDjEm
 pKmrfYdt91xFxzH5umMh64X6FfVAdxOCqVK079lqbAYt5cfgSxdOsQr6pSBg/ikw
 +BJFd7bxwpFuXq1f6Gs+8pNP9A5lXrDa4Cygv4TFX7hx3SThjd4jwKHXMttPFXHY
 Mbd9MtHzIDPg9OIOiRis8CAv0S7j84WuWQPkMma9qwfRGafBLinKD7yOjkQcNi8/
 4ERSVQiKCSnsQqsqZZtDrRZjcUH8Da9hyvA3GhHZ9chVnGStjj6UVEkTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=P60EMhfBagvbNCYsash0laZNNpJmdalqtze5MocJiC8=; b=Cghlw0OL
 YCDeBLvW+8F/luj+HI3Wa768qbFC3ek/HT9XPMraN+d5wXtavtE/MD95rkEfVF85
 RK2va8xxAlcJ0XhD0ctB7AqsfA0uTZ1QGE1NOKKp8QVrfcp1OrR7xzfMT4+k4TwG
 L2SpSlvf+w+UykdNeYrLswnDCgQoSfkTdjo3e6bqz7H/Qv7Ujp6ByqkK6JwuBW5B
 oHnk/Im77LVeJFbMIakR9rWtanMOBAQl9vykPpKO01d97K1dQFPTdu8jsIiPH2ip
 XgUIFriyWF96MmiBi91CUA1kytHBm1JkyX+bVd0diq/0Tc14+Jz8c7kbKxAoh2nc
 j9bfBcUuephtIg==
X-ME-Sender: <xms:U4zOXgFzBz6z5_9ldDZCALE2zp6bQ-dD52RT_v5J2nvWgtjReNQnyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeeine
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:U4zOXpX5YEXhimSsHOrXSqTe-RhpnEwghXvESkWMbGjvdLDAUJN7-g>
 <xmx:U4zOXqJ6Qu0_Gw0uZ-C32Pz4nnUgXuQRVDfO4qU3Me8mIJcFMEJInA>
 <xmx:U4zOXiEvt40mYFqEJ_Ovxdquj_SOqtIJGV3NyIc8lQcq2TV6ZXMV5Q>
 <xmx:U4zOXhETgEknnihzYaOUMqffcPGRph0zJ7Dp8U4B6Su0afnJYzN1xg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 69D953280066;
 Wed, 27 May 2020 11:50:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 054/105] drm/vc4: hvs: Make the stop_channel function public
Date: Wed, 27 May 2020 17:48:24 +0200
Message-Id: <4e35aebe56e1bb32d3b64012cf0d455f1b32ef28.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During the transition from the firmware to the KMS driver, we need to pay
particular attention to how we deal with the pixelvalves that have already
been enabled, otherwise either timeouts or stuck pixels can occur. We'll
thus need to call the function to stop an HVS channel at boot.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index ba24bad86905..d51b695732e0 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -879,6 +879,7 @@ void vc4_irq_reset(struct drm_device *dev);
 
 /* vc4_hvs.c */
 extern struct platform_driver vc4_hvs_driver;
+void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int output);
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state);
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
 void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index ec58870acb7b..1785c49534cf 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -248,7 +248,7 @@ static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
 	return 0;
 }
 
-static void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int chan)
+void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int chan)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
