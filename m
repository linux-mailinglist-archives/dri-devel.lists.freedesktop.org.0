Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0027C1B802F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BB06EB3C;
	Fri, 24 Apr 2020 20:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425D06E081
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 42E5E1448;
 Fri, 24 Apr 2020 11:36:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=asGQCYI8B0Fsa
 QYIYT8hwgAfkciP2fjwzTYJ5GfBnVw=; b=Rb88M8Lotjs13+oJgdw6Gf1TSZowv
 uM6uk3W/4iipyAr7sMD3PFytraD+DTed7TVl8/aRyWcu2A8TK5vDYg5ChTHucAXZ
 Y4+IJFCGZs1fRto9x7tT2a1TDyFoQtvH2yE8W4tv2UqclZ6s1Jlh611f+aw6F0EI
 5FfZFM9RoGMK1LibgHkZQzLtk5Ip9HjylFOey2WVHyt8CfDWJY05tMBUwL0FYXMP
 FDfu0qqEqfnXXnppHyj+oe/KinDkSx/Uf52QzR7Lm8wz9xejroysdfQmc8QyR3al
 6tml6oQWIC/9/os4W4deRixLoT+9Sy0jkOmMCQwrUuLvoe+HJlG8+dMUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=asGQCYI8B0FsaQYIYT8hwgAfkciP2fjwzTYJ5GfBnVw=; b=s9YK70OA
 Ee4Ea7u9ogsu3p61VwJ6giiS0bDFrwtalthvZIAB6YPMVP/0ranNUpfpOCFJ1gzL
 KxcnhJ7RXrVXmg3BHAP1RVh7L3TVRJQJ2XpVgEkRy30560HcGrWTZP8AlwTTx5pn
 CD+mMcf4xrEuVBhahMQxbjyrJUbhzEU3hxxobDv/QmvCeNgLbW2OWFsaF6+CQ+8Y
 FWlfxlkzEh/MfvD/l/xWsU96yIeAB8uIzvdDVKSqBMK7HWhcm3Yj1ySSQgcZCJz0
 wldDqUqpkny08Frjdq9rJh9shDb9ATpDlDcM4U7SunZzS5Eghou0uuqm7nPolfJA
 1Q0IoHlM1byKxw==
X-ME-Sender: <xms:kwejXkk9ACMhBJdSygTfJKyYYLxRicR9uTNgV_IT6TZXh8Mnwakc8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeehheenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kwejXj8_MS5LxSauV8uoIBuBgGFJjckEjNWHWB-Il49xxRlt08gQgA>
 <xmx:kwejXqGcE2Hsj9VvtGTBpiY3gb1ftTbK8Ta1NSl_Oh5HKnVTVNQLGg>
 <xmx:kwejXnL2RKNC4kQOM1ruqCqYUMTosbrxVZad9skI7rqRPI-W6ddJCg>
 <xmx:kwejXuu7v93QKKY6U5sY-LK73q6LIE2mgeZHzZjZUp2w5LMvKvOo1GDZlGs>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 80D493280068;
 Fri, 24 Apr 2020 11:36:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 64/91] drm/vc4: hdmi: Remove DDC argument to connector_init
Date: Fri, 24 Apr 2020 17:34:45 +0200
Message-Id: <3c5197d086da18a2b0d637b6ab10f3a05e63fd52.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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

Now that we are passing the vc4_hdmi structure to the connector init
function, we can simply use the pointer in that structure instead of
having the pointer as an argument.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ba3b589af30d..32de99d48a2a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -191,8 +191,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 };
 
 static int vc4_hdmi_connector_init(struct drm_device *dev,
-				   struct vc4_hdmi *vc4_hdmi,
-				   struct i2c_adapter *ddc)
+				   struct vc4_hdmi *vc4_hdmi)
 {
 	struct vc4_hdmi_connector *hdmi_connector = &vc4_hdmi->connector;
 	struct drm_connector *connector = &hdmi_connector->base;
@@ -204,7 +203,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	drm_connector_init_with_ddc(dev, connector,
 				    &vc4_hdmi_connector_funcs,
 				    DRM_MODE_CONNECTOR_HDMIA,
-				    ddc);
+				    vc4_hdmi->ddc);
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/* Create and attach TV margin props to this connector. */
@@ -1329,7 +1328,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			 DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(encoder, &vc4_hdmi_encoder_helper_funcs);
 
-	ret = vc4_hdmi_connector_init(drm, hdmi, hdmi->ddc);
+	ret = vc4_hdmi_connector_init(drm, hdmi);
 	if (ret)
 		goto err_destroy_encoder;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
