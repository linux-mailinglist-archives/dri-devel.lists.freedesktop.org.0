Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC3A4BFF05
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687C610E866;
	Tue, 22 Feb 2022 16:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2AF10E866
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 16:41:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 024F558012A;
 Tue, 22 Feb 2022 11:41:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 22 Feb 2022 11:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=j5Hb3vQPQF+4/CvPhMJ8z1Na+KMA8+
 RnY6t+w6y8mqY=; b=Gl5L9jfeqApcrgXAThw/gwOL23t3zqLCQENW2bSfNxQleO
 J6wnDHZ8MCpcGh00o9vyN1MCnEttnYAzjihGrsrHzWfeHmfWVMvWl8VVbfayt/Ne
 Km0a1sZpFsidCkx/fCzF1B5K+Vef+Gsus55yDw7Wus02PaK0i4sJ0FMo/4O9anAo
 5vIVY2iYJKWw6hnSVAHbBsfWMSMs/q696uuQ3I95/P1olX6Nzj9GU+dxQP0z9HRO
 7RC05G0OLqAJMfZ3Igz2SxdBkJtt32mjUarM48AVJDgLS7ERPSUqGOIT0F7raS8q
 Sgs+h0HdoU6mfZfcu3z5++NWKmbX9tokUeE+C9yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=j5Hb3v
 QPQF+4/CvPhMJ8z1Na+KMA8+RnY6t+w6y8mqY=; b=WkyZJcWiy+adT/AFqUtXzo
 1cixGq55C2sLc/S2VO8NbzFdi/1T3mWNJ61ZyatQdxVeMlQHEc0mI0oP4kI/jEmO
 4/5wVPZM0+poynHHkSdYr9dp26ahliEaTbKk9+diqxzbbyR21fXWL0G+VjxqQRw6
 7tGdrr4aJNhBeuLaCfa4R8YbamxjV5tFWzLS6C8zBgFr1yVPV6/zOHFdjctw//Er
 t+Cnlw4/88qvq2yrsux5kCn/w3gM2ka9KNBcc2j65bOVTx24jxKVSVjFZ7pGLrho
 4AlX5ja06hohVe9agvgk8f0o3C5qEAqBS2wGycruUTcZZk4KFtg4e3qYk0oJo/IQ
 ==
X-ME-Sender: <xms:GxIVYiCt3B16IoXKHsQtt1v2QZeuY7PO4Gzdt_g6DHohUMpdJY5L5g>
 <xme:GxIVYsiS9ptgmUU4uMrF867bPr4O57qvXMF4lgNq5S-XiHTwmf-7pn4mR0SkVp0pe
 HEUsvcBiOyy0A8V1Ok>
X-ME-Received: <xmr:GxIVYlmHnKdvqV96BghIBOrW0PAUXdjpvSs14GJR2crHGuGyihPeeIyaTjVeaoGuprLl4TyfY6BUyUoGlXaDNiGvtwff-aXDXa4YDvY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GxIVYgwDLzhKON3GFPJgZopgS5X8PoOYQiZwXnmV38fZHK6wNo3skA>
 <xmx:GxIVYnTYFJx0EE-qQesupaUOvDiAzD35ImkubYJwSq2AiPmrJrQIWg>
 <xmx:GxIVYrb9LtPAH4YxE9BL5oXQoWEpLaDAwl12CFybLlSwQ1SgYinjrA>
 <xmx:GxIVYsJv8u8S8IN99ukeskGSQYsSIYKNN9DlxhN5sNYjxRxbdAVJ4A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 11:40:59 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v6 5/7] drm/vc4: hdmi: Take bpp into account for the scrambler
Date: Tue, 22 Feb 2022 17:40:40 +0100
Message-Id: <20220222164042.403112-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222164042.403112-1-maxime@cerno.tech>
References: <20220222164042.403112-1-maxime@cerno.tech>
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
index e8e70727b5f3..c97ded028a2a 100644
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
@@ -1242,6 +1250,7 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	mutex_lock(&vc4_hdmi->mutex);
 	drm_mode_copy(&vc4_hdmi->saved_adjusted_mode,
 		      &crtc_state->adjusted_mode);
+	vc4_hdmi->output_bpc = conn_state->max_bpc;
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 37a87d7e167a..cb744bc5489b 100644
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
2.35.1

