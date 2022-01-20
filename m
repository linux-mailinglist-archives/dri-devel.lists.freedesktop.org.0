Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D1049513E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5E210E47D;
	Thu, 20 Jan 2022 15:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF4D10E47D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:17:18 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 0760E2B00158;
 Thu, 20 Jan 2022 10:17:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 20 Jan 2022 10:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=7nAf39eyUOGHQCxi1E+JIB69OCUrUR
 QkvBDtCyY2nnk=; b=kyA09myiEeoWaPqK3h+g7gtPNaPiXVrIjvMcWS4dgaiFeu
 9ckgIMSIxFEJVYjZIL0mifG8D8ojN8GtfU+l2j7AZQZMxZ51iX9L5d23xKp6gJnW
 i90Du5KmS16O6LfbZnXl3FtGDQVcu2EZjG9fZ4N4ctqM000+7UyISOCs9EsMY1bN
 gxaVAYC+us9+ThtTdpagNeXjSCDcxPkH+BNHYZEL3fom6k58HWt2vb8zt3AR1Izb
 FNFrcg4AaaAGU5RstgmUb0+x56x8UoBwDl0GFspWfxD8aBYl4qWoRbx2tdLBekIL
 IRN9gUx8JSBvTzoJSobp+29lC59A5hR88RPel1ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7nAf39
 eyUOGHQCxi1E+JIB69OCUrURQkvBDtCyY2nnk=; b=Ws//YorLG9Mp948402KwzT
 XvbOVyEbL9awVWpLT/FvzMeigdhZsL1fP2YIlBAPxmQ32Sb5u1ItPrKPLNe/H8hb
 FAvw8XKxulfdtTpPOUdWYHdkiXz74OezVP4FLngERr1JwErHbc4L8ow1TPGP8Gce
 p0AMJLYVo8yBP5PLKntA0SCgdf2Qb0fm97Khe5BthMaC0YD6nhC7VM3YZ964bLmc
 oujJmWJY4+3z/XcGqG3OnlsqGNJ7FMPII/61JBMuurWBfxTCujkwD3fO9t+5yRoR
 dSB2haQx3xTfe/1QX3VNYMIWfvLzDYSN4tMCxD17zkUuoDxi2qlQb987oRprsPmA
 ==
X-ME-Sender: <xms:_HzpYZTQqyLbdcjcmjkkGU7QcJkZk_tbm-sCvciNJSq2J6PGWsvMjw>
 <xme:_HzpYSzj8gjT4vm1zCKCWKkYMgb9EejM9fBH-iuQhGycdQxvmhKieCKu79rz5SmTp
 T8mn7zcpHVvuK7gIVs>
X-ME-Received: <xmr:_HzpYe2ZdJPeTIuEaatQnFNVYkGXkCeg8RFF0Bc4_wOMnIIlATXi1GQtFIBraDVgXAB94Mih8Y1Z1JkhmyuZVVsNE9Ul01V9AstR8TI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_HzpYRDkTzwiC7aC_dxHW6AP--OnGCEUd4d15O3Nsakv6ECYSgZ3qw>
 <xmx:_HzpYSg_7s_-dKXuvVPgUn0vkjuRUEvV3p8WH3p_ej2AagR31mAvqA>
 <xmx:_HzpYVpw9f6Rd0m44l70h8x0zxaLcrRjSsbVfz5PexgW2y3ycPLlhA>
 <xmx:_HzpYXbrgtZgtKXTU_tKGw9xlNdrVFuC7SLIJV6TQUXvo4F18SddgPAKdyQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:17:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 12/16] drm/vc4: hdmi: Move clock calculation into its own
 function
Date: Thu, 20 Jan 2022 16:16:21 +0100
Message-Id: <20220120151625.594595-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-1-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
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
index 1b75e8cfd5d5..764f3c5cfa54 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1275,6 +1275,35 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 	return MODE_OK;
 }
 
+static unsigned long long
+vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
+				    unsigned int bpc)
+{
+	unsigned long long clock = mode->crtc_clock * 1000;
+
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		clock = clock * 2;
+
+	return clock * bpc / 8;
+}
+
+static int
+vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
+			       struct vc4_hdmi_connector_state *vc4_state,
+			       const struct drm_display_mode *mode,
+			       unsigned int bpc)
+{
+	unsigned long long clock;
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
2.34.1

