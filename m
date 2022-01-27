Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE58549E431
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE3810EEDD;
	Thu, 27 Jan 2022 14:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A87B10EEDE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 14:10:26 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 98441580644;
 Thu, 27 Jan 2022 09:10:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 27 Jan 2022 09:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=VusnnL++oQUSGwpOjUjdL4XYB8Ps4k
 thpOZUIiblgnA=; b=kJKiiTE5lWRhHQqixxeOTS/I+m01cXhyFQia8eUfmRKGDr
 1I3cnPZU1KUs5JJ7sbaDZkPhpi/AdjSTUaYaI2gfB4uTtFPGdC1aH1QVsgizosuA
 8Na5/XW3uPGqR6/IO0v3VRqtmDmsfw774iOzPnhJg1v278mL0PE76EyKGk1OD9mt
 ULXG1ePwO3IiW1ML+Se27Oauz5z04lycVT+9cLzh70Cqae9rx8IGjs2cZ3jG4Qh4
 4l4MdSk5NSKRJOaqWsBBM5TmbGIYsSYRj1bi8xttFIfFNCEDV5vKLn41+DJzwqDi
 cUsgmZF49WHWsRyLaJ4b4537OQWOYAzhjCrosx0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=VusnnL
 ++oQUSGwpOjUjdL4XYB8Ps4kthpOZUIiblgnA=; b=ZYvg6xEKZbSyZbVMoW/bvq
 fOQdilVEiA+LvOldFcwxMU++IpDbomOAZsD4YYC8AItrVFNsdMsG1GcqFr1aFWF2
 YouCuM9nWeg90KsqHNVwqTO/srUQyJCcht3coumOd02tkq+d8vEvGls2sO0PUeKW
 ZjCXn4sls8Nf+4peL2/AWsiOu5pnaEbMBOG/timqhbR/FvD+j7w+RgGtoQFWPVyM
 83UaqeiyRl4RRxJY1f0/+mNnH3bQBInYVimlzDcgb/BUOj3KkZUM24bMi/6z3keV
 LgGG65n/SQ1aP2I5zuTuh9VMvUOrlnjTTrxJT+kuZ27rnn/3GxXVIB+nfBa6BD9A
 ==
X-ME-Sender: <xms:0afyYSmX4tUVrIXfbEnUj33tLBWSoT27jpsUa5ste1tKdherWnlzbQ>
 <xme:0afyYZ1OC9UJjYcKEcjTlADxbb2PfBTZ30BCB7K33ADrLrPv8w90USr-9gLkyKq_b
 kf63O1sGTL6ahMWQZQ>
X-ME-Received: <xmr:0afyYQrfjXTrZbRwPWHtaWjT2dPjHVMEEliadpEnFwPxYG3CwBlvXSUape_tz-snAnES-p6MrtIewhbGHqp1XagfOh5ZfZRJJXXY-FQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0afyYWlf5qTTGNDISn989q5iX7AfIkXBihm1eBEvXYVcWE8n03ko4g>
 <xmx:0afyYQ263m4ac8wLVPXpn-kW4uU1UdX3uIuKOypAr3M0lEy0Qm8SeQ>
 <xmx:0afyYduB35oli6ZSrwGnYca8_7O99iZrFyPCfiDRg9myoyWsw7cOjw>
 <xmx:0afyYZvpS6LpszqtBGwq2OhNw7c6jmrrQ09Y3OWYtAoxgOpKvLO_sQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 09:10:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v5 1/6] drm/vc4: hdmi: Move clock validation to its own
 function
Date: Thu, 27 Jan 2022 15:10:16 +0100
Message-Id: <20220127141021.302482-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127141021.302482-1-maxime@cerno.tech>
References: <20220127141021.302482-1-maxime@cerno.tech>
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
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
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
index e3121eb5f605..105911644b02 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1261,6 +1261,19 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
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
 
@@ -1304,10 +1317,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		pixel_rate = pixel_rate * 2;
 
-	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
-		return -EINVAL;
-
-	if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
+	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, pixel_rate) != MODE_OK)
 		return -EINVAL;
 
 	vc4_state->pixel_rate = pixel_rate;
@@ -1326,13 +1336,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
-		return MODE_CLOCK_HIGH;
-
-	if (vc4_hdmi->disable_4kp60 && vc4_hdmi_mode_needs_scrambling(mode))
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
+	return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode->clock * 1000);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
-- 
2.34.1

