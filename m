Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF95F4675B3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BE673388;
	Fri,  3 Dec 2021 10:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F2F73388
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:54:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id F028F5801B2;
 Fri,  3 Dec 2021 05:54:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 03 Dec 2021 05:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=O/NTNHjGaU9L3
 NKP4O1yoBe1MSGu0syBhx3RI9W7KLU=; b=mw7IJ+gVRPLqwNpJ1FUadX8Whl2Wm
 FcjwPWhVncZ/RnFLYqR566zxJiT6KheJGrXe2YFXu4dEohCK51z3froLjhQxA3gm
 3UFjhvmhBddarz9uFLXZItBXv9XHoSAr3/cV7JvUlQ7upNI36Bz6wWXfgerki9i/
 Qu/1nuHHI0YWvmgANGy3W8w8HGNE22mzFr7I9UM9nX1SjspbpRmV7FyoK3l3yN4N
 FkdwFqxfFInmjxqZFoiwjUod9eVlI4GPF0TdD40hAgZErE6rgYiZfyonOWIFQFQH
 p5fBovZjNpN4itVM4OneKpQg9fVECO/oouUdos3RXJ7W9/5IdtMPa/6JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=O/NTNHjGaU9L3NKP4O1yoBe1MSGu0syBhx3RI9W7KLU=; b=Ug8pnPKF
 w4qBW78qR+W4Z6nELjVTejif9hdURdINcvxG3d6xzP1uwYNTbSO8HGGyxu/lQ/jf
 spTIVpE/3Nom3jQzOjCgp7MI2H1A3dP2V1S4wk1JfKGArqP4CTqQbOBxnJf2cKEN
 dmeWnarnmLxMCBudRvyPr1l9vn0wHpmJKrSLL/3tg2nB9K2PLHkegOps9NFh1F58
 GrTmq9T0uTBjK+6G9kgrxJG4+7Zd4WV110Z26GhlCR00xpNfOs2OLbxnLQL1DlmA
 Nm3jTZI0/1gughU4JJ7GiMs9HCHdWlDEFsCHL1ZqcIBTclbHmfgxevsOaLRpZ37V
 IPi6xDpIfLdhlg==
X-ME-Sender: <xms:cfepYb8wdmNhtHKuFwsrSFFdzZ2MtadmI9n9mEPkp-bmwMXgBgVtww>
 <xme:cfepYXt3KGM6pH_kNMg1TDWnJmI5CcD-6bVFLfuzOe6K211hJjcCTRVhRAuJQM7e0
 CV8AMcVehnRk7R1BYU>
X-ME-Received: <xmr:cfepYZC5V1pSaTvHuXEM2r5HU_o9fpsrgFJd5SXfdWIQJE1-4hMF3c2WlgkV3ixH7mPe4m6Z8AQ6AH8h0ixD0hocjRSiEi2jA7of0PudLmI3Uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cfepYXfOtH2S09fFU92h9f9FJfiCsqralXC-G42Qs-lmYGhD_3-0rQ>
 <xmx:cfepYQOXcrsqk6TgAodNAMPrUoQxN-dGGlVlCpzfy0ZWtUQgq68iIw>
 <xmx:cfepYZmaIRVP9UP7hSV5aAkpbeVqaR25D0c8qlw1egzV5D0vbnO5rg>
 <xmx:cfepYfp6hp8vNpRC-G334la_FVtWvTH1V1gTUk0JtEAjmnkO2ANOig>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 05:54:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 09/11] drm/vc4: hdmi: Move clock calculation into its own
 function
Date: Fri,  3 Dec 2021 11:54:18 +0100
Message-Id: <20211203105420.573494-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203105420.573494-1-maxime@cerno.tech>
References: <20211203105420.573494-1-maxime@cerno.tech>
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

The code to compute our clock rate for a given setup will be called in
multiple places in the next patches, so let's create a separate function
for it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 49 +++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9952b13eeb6e..3d649fbc480a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1275,6 +1275,35 @@ vc4_hdmi_encoder_clock_valid(struct vc4_hdmi *vc4_hdmi,
 	return MODE_OK;
 }
 
+static unsigned long
+vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
+				    unsigned int bpc)
+{
+	unsigned long clock = mode->crtc_clock * 1000;
+
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		clock = clock * 2;
+
+	return clock * bpc / 8;
+}
+
+static int
+vc4_hdmi_encoder_compute_clock(struct vc4_hdmi *vc4_hdmi,
+			       struct vc4_hdmi_connector_state *vc4_state,
+			       const struct drm_display_mode *mode,
+			       unsigned int bpc)
+{
+	unsigned long clock;
+
+	clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc);
+	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, clock) != MODE_OK)
+		return -EINVAL;
+
+	vc4_state->pixel_rate = clock;
+
+	return 0;
+}
+
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
@@ -1287,6 +1316,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long long pixel_rate = mode->clock * 1000;
 	unsigned long long tmds_rate;
+	int ret;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
@@ -1307,21 +1337,10 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		pixel_rate = mode->clock * 1000;
 	}
 
-	if (conn_state->max_bpc == 12) {
-		pixel_rate = pixel_rate * 150;
-		do_div(pixel_rate, 100);
-	} else if (conn_state->max_bpc == 10) {
-		pixel_rate = pixel_rate * 125;
-		do_div(pixel_rate, 100);
-	}
-
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		pixel_rate = pixel_rate * 2;
-
-	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, pixel_rate) != MODE_OK)
-		return -EINVAL;
-
-	vc4_state->pixel_rate = pixel_rate;
+	ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state, mode,
+					     conn_state->max_bpc);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.33.1

