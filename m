Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4389C47590D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0D110ECC4;
	Wed, 15 Dec 2021 12:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01DF10ECC3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:44:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 20BE12B0024D;
 Wed, 15 Dec 2021 07:44:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 15 Dec 2021 07:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=8d6kP5NBMAEzV
 oHUpQsTJyhAxR501T+k5vh01Jxgj2s=; b=dhB60lTB9u/5jLdsuKbejFc7pJMDp
 DCrgJN4WKu987JPWSFpF5YCI3v653Y/spepi1RHYw4UkqfpKt6nOzJufUHVUeo1L
 l3BSR2T8oQnb+n/YUTe8tgcN7pxECVI4pVX5MjZu5Awm9agwxuT83P55d8WVD0ou
 aF4smYWr4lJIsZO9FPPxibTY8N+mewgNbXbx4Mnl5hwuam7YVWUn/mfhRCzJyhhV
 QOjuyG72+dtAD3SmOG59oz6wAH8hLGmkj9p0YYahr6Kwd9VMHSCw9cCBLinXk/Yr
 BZDl4E3/YO+bSex7Ef08iunYJL2X/t4D74mrTNIscpP/LWK2dzxTYgkvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=8d6kP5NBMAEzVoHUpQsTJyhAxR501T+k5vh01Jxgj2s=; b=LEJpAW1T
 UjNj+JAerNIqkNlPP3Adym2iew9aF8AYN7zxEiJZzqA3yCuATOGzgYMgzq9vL7NH
 wu/hiCiXy52evqDlT6a/L6L9mcVD3D9WmK3knT8Vcfut0vgq7rWIsb6U9FUVNZLt
 JXuIx/sYNbrzXf7nLTySWZQ2Aa/gSR9q5yBLPu4dEkvT9XBvXifYcDuJC3zgaibO
 hz0HKUsDl7uqTcctO5BzRJdND7U3E6PMVhI5Zxo5OGpgU0Tj5Km1zC4PuMAV1xuo
 u7CB7axbpYrYXBvA9h32zM1D9yFpqQtUSDbedJ7+omQ8WPzoomviMLe0BCIOEOiA
 YW+61yYyRMjbwQ==
X-ME-Sender: <xms:PuO5YQ49m2TTHpSeh9b7IeEQ8mioCLlI_1MP6m0UoMQu76oCPUntvg>
 <xme:PuO5YR6v0QPpE1b-_-tmB67g6q7Xev9zVrydKGN7ijz5kHn_0383IEn03zWTIg25z
 EV73svC-wkvFhC2Ycw>
X-ME-Received: <xmr:PuO5YffbpG7lU1svCcnZjUcUzlu1jxxjQDSXZWPl5f7txfanjp5wsXsY1tgAOxD07INAL-par9nB9Xeqx3QYwLdpGsc6OhRw3KNt4DQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PuO5YVL-aHhguUmW8iYlop2Dkjd6kxpe14Z16jfKdN1beo1FTKlMew>
 <xmx:PuO5YUK5DWUaTXT2tl55Fr7TZIXBExHMpsEyyqmXNfwJoHJw0P90TQ>
 <xmx:PuO5YWzJB-E7soZrG0NbKj1ESEAa2SWP8ANnRR7JG9BjeBdt3AXAQw>
 <xmx:PuO5YRAgPQbZ3X0Z-GBHu0lEQ3JTmaXjOA5I7e9neSbgjBpD1lTLj9s_mSk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:44:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 09/14] drm/vc4: hdmi: Move clock validation to its own
 function
Date: Wed, 15 Dec 2021 13:44:01 +0100
Message-Id: <20211215124406.340180-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215124406.340180-1-maxime@cerno.tech>
References: <20211215124406.340180-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our code is doing the same clock rate validation in multiple instances.
Let's create a helper to share the rate validation.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d79a70bae7f2..8b6204df66bb 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1262,6 +1262,19 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
+static enum drm_mode_status
+vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
+			     unsigned long long clock)
+{
+	if (clock > vc4_hdmi->variant->max_pixel_clock)
+		return MODE_CLOCK_HIGH;
+
+	if (vc4_hdmi->disable_4kp60 && clock > HDMI_14_MAX_TMDS_CLK)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
@@ -1305,10 +1318,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		pixel_rate = pixel_rate * 2;
 
-	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
-		return -EINVAL;
-
-	if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
+	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, pixel_rate) != MODE_OK)
 		return -EINVAL;
 
 	vc4_state->pixel_rate = pixel_rate;
@@ -1327,13 +1337,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
-		return MODE_CLOCK_HIGH;
-
-	if (vc4_hdmi->disable_4kp60 && vc4_hdmi_mode_needs_scrambling(mode))
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
+	return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode->crtc_clock * 1000);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
-- 
2.33.1

