Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A849E434
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7329A10EEE6;
	Thu, 27 Jan 2022 14:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A7510EEE5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 14:10:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2D9365805AF;
 Thu, 27 Jan 2022 09:10:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 27 Jan 2022 09:10:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=r+wDKEsDBVZTL2Sut88WjF/DMZjQQV
 /17QsoK6DM1Dc=; b=p9r95XTGbgxHOA9CkDNvNJi+7HRK6jWv4dzWd2qDQ/JNls
 Kg2ZXQ+dZaQ/dHrzBXOQjid54MkAypymCvjDjE7KiqI26WmBARivJQN7zFJadKAn
 AXylJorZ3/aDeaOyDMpTLoC/JM0MsrAEeSpX3toXTKEthZlk6Xd00gOdK0zJAd4c
 5BfsX5qEWgl8tGRdgqFh4MyifKkihY+C/ro17f4KR7nE9Gj2+HqMVv9EgZ/HD+Ys
 r7ohiG9x5B1yyOsG7d5RwvtPG2fZy1hkF9CZGIbpipwoieo8MCezToetzfGuL6f6
 YUAsAIX90VpxWc8sXfw3MdAwbgERTWoZ71jwFV9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=r+wDKE
 sDBVZTL2Sut88WjF/DMZjQQV/17QsoK6DM1Dc=; b=k1ZSdoFWPoMYTwK1MLoXrG
 N/Ey7+XnWbdi+aiZGHMesOfyOrVJm1rt8bHBDEwSP/YFgje6FjoWEKF2u4o5icbG
 iVcgdcRBIwI92huYUPrq9znouMw5ziLkzVnTniEn939Qc+SPmrFwdwsYq5B2PR6J
 tb6wlRkfwqrbIrl0C6ImmsXLu2toyGU0Ji3d9qBxklDps5k6afnLnGutmHvBC/w4
 iXO3U5YpThRwwEYiYrWpQeXmZbc2EFtXJ5kuYCRfd2tAFgSN5eH2DBeYa29FPXEZ
 xf1IkuqihbXIe+CG69yn2UPTw/OAvImVozV+eNoWdyiWpmiEJ71/VPZxaLSL3tYQ
 ==
X-ME-Sender: <xms:2KfyYdH-MEXKxJ_80MuKfSdO4WP6HUJMDaCauKC8ZfaJJ2CstcQTmA>
 <xme:2KfyYSVhbum7GB3p_Rlg4IzWKVR5w2fjuLR6VBrgVnojLQMAs5QwWOni_Tetb_xsu
 8fMV8WCk41XfxXzGXU>
X-ME-Received: <xmr:2KfyYfLywio_ea95enhnyRlk7OCIB2Ev-gK2MGqrw7dfob0_x1XXavHyybu-o-gd35G9JLCWDZ0oPW10oZ1pN7SomsQRfHaMtgFqDP8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2KfyYTFJQnPibwkfycpeVuGZ8q22gTNSujZ82gh_qJYto4SrGLb_jg>
 <xmx:2KfyYTX0atSorK7CZZDrj-vSj27y3pYNsJdxvNJkezRspgLkHftRyw>
 <xmx:2KfyYeM0tCD5EmT1sRh207F8TOKybhpqLakDtN9WWggQBf8fTZR3Zw>
 <xmx:2KfyYcP9et3oMGmKWwHgz3MF5oxxdOzZy6tOHVHzRO7VeCgLpsiCwQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 09:10:31 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v5 4/6] drm/vc4: hdmi: Take bpp into account for the scrambler
Date: Thu, 27 Jan 2022 15:10:19 +0100
Message-Id: <20220127141021.302482-5-maxime@cerno.tech>
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
index 4c3a5959c7f5..03d0813992a7 100644
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
@@ -1255,6 +1263,7 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
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

