Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3B425D20C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD996EAE2;
	Fri,  4 Sep 2020 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC66A6E4DD
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 703F3B44;
 Thu,  3 Sep 2020 04:02:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=t6YKz0s4uqL7c
 rKb1yiXPGovELO7Uq6rm4zeG9kzD20=; b=c+s/IEs8krpgBfHGFbYYJLGMaA4Im
 CdvNd2WipuAMs1gypWIyRoGXAXr5PasZCyBWQ1TdRcVhQpQuT3drlTE33XtnWwl0
 tGzL16sakjyGR39ObTm7meTHmz49NoooIGEuvlGVDycRdeRpsGf3QqSDEGo7+QUo
 S4EjOh8/Y/3WyV1tnPOElTMTFsNe9PojZq9rMP0KmXPcE0AN5339fVGJQojcgh//
 DAS/PEdCSwll4yv8KQsyLaH/62z4ppkXihhTKeuAtJK/rvKJvYX+hQw5bYMGtxzS
 Yl84S2DlLKlbwgTbbjHyfiqx6mt2dwoGS89zA+mWVbhpAlftByGWoniAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=t6YKz0s4uqL7crKb1yiXPGovELO7Uq6rm4zeG9kzD20=; b=jINBPKGT
 dMoqVCd/MGxLm5z2pi7LJA7KrWDL2B8vzuJEOu+8r+x64hMFZqWwpRKBdfWYuMDu
 8oGuDqgb3u8qeojB6w0TJJY3auTe9fbpZeSNLpo2EgoMDCNi/9A0sblGCaqsrPXw
 1/zveDi9ksR0YpAhcwOw+PDd7yG0c7B5A3n397L4IAmMtJEgUJ65MhkYf6jwtav5
 CdkkepKoEIYDVs3oKkelIQsRDIz2H6kLxcvk8INb7TckXR+N63kfqqkHMb54A8yR
 R/uwLPfUN90d6lElwgoMlKRrCNjzNhAWJG3YtQL5h8ROHcLNXxkw1OPnvLU9tddR
 SjSLYrJ8cN4ifA==
X-ME-Sender: <xms:KqNQXxwH-0osK_d4BM1_KeJ4E9S8kU6plFRFt_jXc9bX9h_lVrPFyw>
 <xme:KqNQXxRLC5P6MTBJzrqgD0CwjCR_gZZTcUdzPpkx1TeMV9VnpDDHVMyf4X-MGVmmQ
 fmZZflMg94TDtukJ8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefie
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KqNQX7VHE0cBTQ12Mh3opKYroCCnh6PVazXgsa2QlYTpKJ60_rePPQ>
 <xmx:KqNQXziSYetknAVlt_lGclPhdme_ZUQmVffrBo2tBpM9kcV0Nfl4kg>
 <xmx:KqNQXzBWzXkSIcmpe685oaoV48ParPoaOlsi4AS0uM2soNuCyr19dQ>
 <xmx:K6NQXwK2OmOMRHSk04raWS-PXWgt7-NSoHIqbUmbJKOZq-oiU6Z7IDZOs0U>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A91C2306005F;
 Thu,  3 Sep 2020 04:02:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 41/80] drm/vc4: hdmi: Remove DDC argument to connector_init
Date: Thu,  3 Sep 2020 10:01:13 +0200
Message-Id: <4fe1b45fe45e4ba57d40154da010807d4e5db86c.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we are passing the vc4_hdmi structure to the connector init
function, we can simply use the pointer in that structure instead of
having the pointer as an argument.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9a0612a87fb8..1f350b068fcd 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -192,8 +192,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 };
 
 static int vc4_hdmi_connector_init(struct drm_device *dev,
-				   struct vc4_hdmi *vc4_hdmi,
-				   struct i2c_adapter *ddc)
+				   struct vc4_hdmi *vc4_hdmi)
 {
 	struct vc4_hdmi_connector *hdmi_connector = &vc4_hdmi->connector;
 	struct drm_connector *connector = &hdmi_connector->base;
@@ -205,7 +204,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	drm_connector_init_with_ddc(dev, connector,
 				    &vc4_hdmi_connector_funcs,
 				    DRM_MODE_CONNECTOR_HDMIA,
-				    ddc);
+				    vc4_hdmi->ddc);
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/* Create and attach TV margin props to this connector. */
@@ -1322,7 +1321,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
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
