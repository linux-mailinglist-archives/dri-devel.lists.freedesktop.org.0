Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEB833F421
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30BE6E82F;
	Wed, 17 Mar 2021 15:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B286E82B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:25 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id F3670580A59;
 Wed, 17 Mar 2021 11:44:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Mar 2021 11:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=3pIGIGVRygS/S
 2XEgvA7hkuxHjDJWPKyEV6aU58KKqg=; b=JBOqOizBjnfxE2VXy+DFOgdU2BZJT
 JQC7wuiaO9/HOrkCatJNpTaGi9zuWjfMC/2KoVZBdFCJTRlu1NYKIIDANpQXp3wY
 j0h+oJGK9BThc0wm33TdPDa4KN2y8jeaZ6grMHvU4aRc8Rd1dQ9ZOCUYXSlA5ygr
 v7OhP9IjlmF+oosrn6/ldsbXGgIInDHeBb07Hg8vyr/+XpgCDgSIvrFgv5Emboxo
 W8bdabb3GUAIsjI6LVt/7/aLKF6MWkHmgsDVyvUMNwXwuv9l5dJM8JHRgLrnP0cc
 Op4V09CM5YS3RPUdtgwLW85W4NC3z9d2DzQ1+TDzZA6zIQ+KiqOfewwMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=3pIGIGVRygS/S2XEgvA7hkuxHjDJWPKyEV6aU58KKqg=; b=Rebb9Em/
 FSr/rjWt1U9FyXEEUHqbPUPKWivxOI5naJ/pwxyMsJxAo09B148CdW1Kjt0yScrZ
 TOu5hIGerNDXsqfLfl3we2EXujCKlxhOf+5gcNApZFXSoRBILOf8xTBoT7EqjQR/
 kH9+D55pdgJ8gTkoO8LK9zNGJ1YeqODElKALleIMOkdEgEL6DDZhN9BKtfjSM1Dn
 YNyHPZTLHHJY9D3R9s6SyqDa35oyhT5AUt1GvtYjxEWc1TFnj9xYpJsR8h5qZpXB
 rTiRv8E3YekxIjRDd/a7Ctc4ngtXYz3Cf++AeuOj8AQ3szXyYlIlhLxxlpyK3ycv
 49qI8+7aKf4IOg==
X-ME-Sender: <xms:2CNSYPuTqhnG2o43z8Vjyu8vQzl_loR9k8-G1VJlnY2BCf8hpeOlVA>
 <xme:2CNSYFIHqWOgELgM9QkZUe6-3YIJA0mnAnHbNsxxjmPQLePN5xMbWIoksNEbUqtlK
 J9OOFF4elflubLW9es>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2CNSYDAyEoquPWnwT0QhUOBd1GWBHnNnHT1RIFaQqqSGjXAVkYk1CQ>
 <xmx:2CNSYCW71hFg4PJysQ0On2YFRYGx9aU9R225YCq3I9AiTiCj4fcMoQ>
 <xmx:2CNSYE41FrTWqwvaF1uHtbZTOSsVo-yyNh35ENm3xfY0tcDZhUeyKw>
 <xmx:2CNSYM3EBiUzUM2kuPJToL8C95E8X6cjH76O1X-OmivXFh3YwQyKQA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AF770240065;
 Wed, 17 Mar 2021 11:44:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 18/18] drm/vc4: hdmi: Force YUV422 if the rate is too high
Date: Wed, 17 Mar 2021 16:43:52 +0100
Message-Id: <20210317154352.732095-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When using the modes that need the highest pixel rate we support (such
as 4k at 60Hz), using a 10 or 12 bpc output will put us over the limit
of what we can achieve.

In such a case, let's force our output to be YUV422 so that we can go
back down under the required clock rate.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 37 +++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index c4f91d39d91c..12eda1e76338 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1029,6 +1029,41 @@ static unsigned long vc4_hdmi_calc_pixel_rate(struct drm_bridge *bridge,
 	return pixel_rate;
 }
 
+static u32 *vc4_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+						       struct drm_bridge_state *bridge_state,
+						       struct drm_crtc_state *crtc_state,
+						       struct drm_connector_state *conn_state,
+						       unsigned int *num_output_fmts)
+{
+	struct vc4_hdmi *vc4_hdmi = bridge_to_vc4_hdmi(bridge);
+	unsigned long long pixel_rate = vc4_hdmi_calc_pixel_rate(bridge,
+								 bridge_state,
+								 crtc_state,
+								 conn_state);
+
+	/*
+	 * If our pixel rate is too fast, force YUV422 and hope it works
+	 */
+	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock) {
+		u32 *output_fmts;
+
+		output_fmts = kzalloc(sizeof(*output_fmts), GFP_KERNEL);
+		if (!output_fmts)
+			return NULL;
+
+		*output_fmts = MEDIA_BUS_FMT_UYVY8_1X16;
+		*num_output_fmts = 1;
+
+		return output_fmts;
+	}
+
+	return drm_atomic_helper_bridge_hdmi_get_output_bus_fmts(bridge,
+								 bridge_state,
+								 crtc_state,
+								 conn_state,
+								 num_output_fmts);
+}
+
 static int vc4_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
 					struct drm_bridge_state *bridge_state,
 					struct drm_crtc_state *crtc_state,
@@ -1088,7 +1123,7 @@ static const struct drm_bridge_funcs vc4_hdmi_bridge_funcs = {
 	.atomic_check =	vc4_hdmi_bridge_atomic_check,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-	.atomic_get_output_bus_fmts = drm_atomic_helper_bridge_hdmi_get_output_bus_fmts,
+	.atomic_get_output_bus_fmts = vc4_hdmi_bridge_atomic_get_output_bus_fmts,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.mode_valid =	vc4_hdmi_bridge_mode_valid,
 };
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
