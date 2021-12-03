Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B834675B2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B93A73386;
	Fri,  3 Dec 2021 10:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82A373387
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:54:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 15DF45801B2;
 Fri,  3 Dec 2021 05:54:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 03 Dec 2021 05:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=cKesw8Q5I232e
 Cd/hSnouSArKavvjcyRmS9zlH1bjBw=; b=mQj3zDuLsibcdFSgbsgESjha5pjbf
 9/0XZ5dXyRWZCTcfbQoDJ92r4fTqNVLW2uNkY5vwUNfcm+JF19usHd4aBcNVJwe0
 X0OIJPPY2wixnQ8km97RvH/jL6SxBaGugBQtEnOJ32HiX8WajSbg+M7T+pIuRLfJ
 yylAz5aOTxKJG5lPA+95cWf4dZzw4tO/J7uddFbdCq5lsDGgIyPo9KKMa0p4aNkS
 QZoCeUE/JX/0hQI6KEPyZFcTNehKBY+bb7uKASDjZJ/mknVId5kGZ0Cge5QaSOor
 wthreaz2JWJ/4Xfh1eyLWsGwzs7m+AJmsurFZM83vt2+CkoCW2i5B3Q0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=cKesw8Q5I232eCd/hSnouSArKavvjcyRmS9zlH1bjBw=; b=NkILt102
 SDbymrcZsXpqyAj1cOItXDuNnL2c0uSWNgEdNL4/xiQg4WBZzYlryn8gK/W+HC08
 gfa3Si3y4K2iF1XzYoZwTEBvTFnOvJm2ZhM1Pow88l2B21NmVJJ4lkqSfV8Opbu4
 JxH72HRJ5S00u/+Ipj2Q0xU6kFy8MyqITabAGu62B/r2Qrk+EVZyV2/vXQhkyGbZ
 a8dybnMduMbwlHIkxQTSp1dAenL7V5hnYAxDgs6fOb09HwABgSgZS90bfutdgstb
 xzNCNOBWruG+T7sCk/eYK1yAf15gXW+KBsAkOymX4Vo3K/V2rYqQLgNyQQzYgZUQ
 ieOVRlUy0KkyLA==
X-ME-Sender: <xms:b_epYW0lLaS4sniprPSscT3MfmLDUhvcY7kbSRyLMQyMSCmWZzO5qA>
 <xme:b_epYZH5SsX_7s1aspHiG-b8xr2Gf1jjP_7lz-aNTiBgm7p2if8Enk9zTz1By_9DM
 ufM0WvmiNLdeQi_nQE>
X-ME-Received: <xmr:b_epYe7gMCThup24n9qf2Ox91j_1f8yYHeu-q-1tsPZpNbZp1Kdf61jE-Gt9HfmhZXd-P-977EcsjzPycTjYgKqZ6IZ5iAqO0o96w1tFr0yXnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:b_epYX0FMVcxPv-B8PtHuItEs9zZdp89eP3gu8TcVHZp8CqJhGK2lg>
 <xmx:b_epYZFoTdxQh_ZLLaLyDq7wIoskbjJh1LQluV73RLBcWUrI4Gv-1A>
 <xmx:b_epYQ9oev0ktdHf5TzAX1z-nWkTqXeFQvUNQoNCNzSIWvqz4HE4UA>
 <xmx:cPepYYB_Nv-aRbGvE-6U8mzFkNRntrvg6jAkFrWRCU76nCFsJI2WQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 05:54:39 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 08/11] drm/vc4: hdmi: Move clock validation to its own function
Date: Fri,  3 Dec 2021 11:54:17 +0100
Message-Id: <20211203105420.573494-9-maxime@cerno.tech>
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

Our code is doing the same clock rate validation in multiple instances.
Let's create a helper to share the rate validation.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d79a70bae7f2..9952b13eeb6e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1262,6 +1262,19 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
+static enum drm_mode_status
+vc4_hdmi_encoder_clock_valid(struct vc4_hdmi *vc4_hdmi,
+			     unsigned long clock)
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

