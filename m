Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ACD495141
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A2D10E47E;
	Thu, 20 Jan 2022 15:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FD710E480
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:17:26 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id C35D82B00158;
 Thu, 20 Jan 2022 10:17:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 20 Jan 2022 10:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=G4f+mKYUvZE9ZvWeBznATAoYZi3c0G
 0EF6ueZcw6SJA=; b=JqfEjiP0B2QCUwR4s+PhfdOJehWLiu/TRyEr90AZY/pY5W
 L44LCLg1u0hwAEpiZQblc21h0ub0z7URgmOkC+HwW0hFg1lSunUcsImgYG53BjZY
 ABa4i3BbysFKyV2bFEFzsKPJ46iMZBVKRIaVmM8aJ7yZGalGqiYAY5/GdExYY+fs
 ZvRUvnbESwnO+/H1eCZmbf1QhhddZlHpIMZM9sqAWM1U0RAVthVb5tjhLjaZzR4+
 65iiknSSW0nfCg8A9CGwdbxLach2sCdXAx3x4oeW1C3g5wSeM7VLikF7tqGbTtFi
 esLqkLmwPflRPdBbbfRtWurTpvI15RjM1rlMAHCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=G4f+mK
 YUvZE9ZvWeBznATAoYZi3c0G0EF6ueZcw6SJA=; b=MC7EKILgybjb1X7JWp2ReM
 7WtNs76owS+F+VXnjIquxDBbz2ILeBlJGnh8v3MI3gemuwNzTaU/Ools4BvM0Yoh
 lJ69Xc4vORaZN6k63P5H8eGoUySe2Tl8Bq8GUj2xhszj3Owjzo1lDDY3PTTkLm80
 esa99Qco9vJvNJwkrqya72r442Hgnu2lWpADdqM6uLDAw1zf9nJ9rk2riXXkPcJp
 oAPwo0OxgtG20QoZnUgAUJSpphTHSHVUasCcHZa/yxuxF34hWPm3GeqLR3EtM8K/
 wdeb0+MTIlkDv5AV8IspMLmjQPpr6CtTZZWNt36svUXLVX4LwuNP3jOvwTjP3xKQ
 ==
X-ME-Sender: <xms:BH3pYf1todLeoxHhoEUm7l7WczQRNyyQDLxZx-qV--VrJqqYZgRTAA>
 <xme:BH3pYeE-v8owAWAK4G6KYykBHkql5_SgkqxRJm0ydjVdGJdghAXPVhn1KD-8Qa7iF
 QRfsjemFzsVmYvbxqU>
X-ME-Received: <xmr:BH3pYf5DuDKZK4kU2MvVb8KoF-E_gKIPm7pJNP23WlSbO8esChVo1jCZZljEVnSbje2rDCOvGOq7RYo2ss1JUFPdPFYQ281qEmuBXIU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BH3pYU2TllxLoKpujnz994zFYU-ISVMn8L8BnGnguSPJH1B3SR4iDg>
 <xmx:BH3pYSGqs4H1I7OaDMZC43lVUko0nXs9KL06_b26knrwB34QLnBxHQ>
 <xmx:BH3pYV-yq5kmAdsf57RvU9_L_q8adJ3PRX4F3ZzM8gqcmFGny7wJZQ>
 <xmx:BH3pYa8GTV0FZMbrrT_5ABIzlhrzml80S-VlYHWlF33FWEsoRAj_pJG6WXI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:17:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 14/16] drm/vc4: hdmi: Take bpp into account for the
 scrambler
Date: Thu, 20 Jan 2022 16:16:23 +0100
Message-Id: <20220120151625.594595-15-maxime@cerno.tech>
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

The current code only base its decision for whether the scrambler must be
enabled or not on the pixel clock of the mode, but doesn't take the bits
per color into account.

Let's leverage the new function to compute the clock rate in the
scrambler setup code.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++----
 drivers/gpu/drm/vc4/vc4_hdmi.h |  5 +++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b68d3626d1a3..86801019ceb1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -99,9 +99,17 @@
 
 #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
 
-static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode)
+
+static unsigned long long
+vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
+				    unsigned int bpc);
+
+static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
+					   unsigned int bpc)
 {
-	return (mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK;
+	unsigned long long clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc);
+
+	return clock > HDMI_14_MAX_TMDS_CLK;
 }
 
 static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
@@ -272,7 +280,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		struct drm_display_mode *mode;
 
 		list_for_each_entry(mode, &connector->probed_modes, head) {
-			if (vc4_hdmi_mode_needs_scrambling(mode)) {
+			if (vc4_hdmi_mode_needs_scrambling(mode, 8)) {
 				drm_warn_once(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
 				drm_warn_once(drm, "Please change your config.txt file to add hdmi_enable_4kp60.");
 			}
@@ -613,7 +621,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 	if (!vc4_hdmi_supports_scrambling(encoder, mode))
 		return;
 
-	if (!vc4_hdmi_mode_needs_scrambling(mode))
+	if (!vc4_hdmi_mode_needs_scrambling(mode, vc4_hdmi->output_bpc))
 		return;
 
 	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
@@ -1256,6 +1264,7 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
 	mutex_lock(&vc4_hdmi->mutex);
+	vc4_hdmi->output_bpc = conn_state->max_bpc;
 	memcpy(&vc4_hdmi->saved_adjusted_mode,
 	       &crtc_state->adjusted_mode,
 	       sizeof(vc4_hdmi->saved_adjusted_mode));
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 2b6aaafc020a..31b7d27deb8e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -216,6 +216,11 @@ struct vc4_hdmi {
 	 * the scrambler on? Protected by @mutex.
 	 */
 	bool scdc_enabled;
+
+	/**
+	 * @output_bpc: BPC currently being used. Protected by @mutex.
+	 */
+	unsigned int output_bpc;
 };
 
 static inline struct vc4_hdmi *
-- 
2.34.1

