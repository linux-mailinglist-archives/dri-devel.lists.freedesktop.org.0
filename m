Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAB64BFF01
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65B110E846;
	Tue, 22 Feb 2022 16:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F3110E84D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 16:40:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1BF7B5803B2;
 Tue, 22 Feb 2022 11:40:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 22 Feb 2022 11:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=Ji+T38KlmwjE8F
 vjr2Nda/x/9denKzPBBP4Oh8HGSCY=; b=FvKJegoBTTGnorZTjAUzFCKtZYRoxS
 XDP+0PCUwHZO9sJKUbDuyOw5nIziE2O/gKqIk5/dS9enkaBIHAiP1dlJ7cEcxOEe
 o712AVs8cBqejQ9xfbD9IocXfwiBa8A/ZBxXPO23kjBcCGozWxV8XIuUxPmoscZ+
 NoGD/X3ZQV3WYCX1UkJP9djqDQNLK2fohFa3DR03zogYyKgI0+fK2yDA3XQoHC2B
 BLfsJ76MFkoChs5OSo4yNLi1WRn7qCV/ntOIhgyOUXgGsSH05dcEjIv26O5d7T0c
 hfqSOZBhQ+n5alVlAH11BrMoZQFDIVyZ5s7DXyDepXiic7uiTSc14e7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Ji+T38KlmwjE8Fvjr2Nda/x/9denKzPBBP4Oh8HGS
 CY=; b=csPeRFco4uOIVrRpuk/SyHeyhqS8SsO0CI+mY/P+TOcemagoqgu/MoSch
 SNobqcmUv68CTsvWfQY3CkAwYistPb0ihIdro+bBWIr3+dd5LQRIseMsg7o229Do
 NarxawC60IAofSD/n4migIdLl5S88oh6x5YuTOupvtJfumXKoApETtd5Yzq/SHkJ
 M/ITThjEY6hUMns6Ep6eIfrFogy0sPYclqHwvD4u5DSqKXcrursuToJdsYEDCUji
 5xCrmU41DmwLx0a3YBWPdNB4IVXF9pVfqYbKrn6ILPXYY5nGJ13oGIHTZB3Cxh3u
 h2wmfCfk9VUhlBUbG85Wj8WVLoCdQ==
X-ME-Sender: <xms:ERIVYhhkFbFDf_wQL9NO4qDcvE8jNz_zYzofJdhxvSUsuI6lpalacw>
 <xme:ERIVYmBKH_y2SjHdLQoju44sBQ-QLJR3AuPe_HQQTApBgrI_D1_440nvaTlGPt3hb
 WwVkqpRqKaVwXQU4qI>
X-ME-Received: <xmr:ERIVYhFDBT4GSNFTyDcEFdXuFP5qUgfToOMpstNw61QaqAFYwpNpUEeQz0XEqVMHY0ZMcFUGHM2DAx2PrjVKVlyHNWFPkdKz55h2pzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ERIVYmRADvlyL1VlWselRt0GA_7v58x8X_Uel4PIHQLVlfTXz-v1hw>
 <xmx:ERIVYuwGXynuc8AFeWRaKYXfbll4mF_p-koMVewkAk_fpoMUtO6mww>
 <xmx:ERIVYs6WJIiHuiE2Qsei0yZ20ezy8M92qqO39MD2ybzwP4mppouSbw>
 <xmx:EhIVYjoshXKlJtC7fyq8osByX3ApCRlxVCxQ8bhYncwS3yOJwigLeQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 11:40:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v6 1/7] drm/vc4: hdmi: Rename pixel_rate variable
Date: Tue, 22 Feb 2022 17:40:36 +0100
Message-Id: <20220222164042.403112-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222164042.403112-1-maxime@cerno.tech>
References: <20220222164042.403112-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The pixel_rate field in the vc4_hdmi_connector_state struct actually
stores the TMDS character rate, let's rename it for consistency.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c     | 40 +++++++++++++++---------------
 drivers/gpu/drm/vc4/vc4_hdmi.h     |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c |  2 +-
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 335385f5b3fb..c70e5059b077 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -343,7 +343,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 	if (!new_state)
 		return NULL;
 
-	new_state->pixel_rate = vc4_state->pixel_rate;
+	new_state->tmds_char_rate = vc4_state->tmds_char_rate;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	return &new_state->base;
@@ -1028,7 +1028,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	struct vc4_hdmi_connector_state *vc4_conn_state =
 		conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	unsigned long pixel_rate = vc4_conn_state->pixel_rate;
+	unsigned long tmds_char_rate = vc4_conn_state->tmds_char_rate;
 	unsigned long bvb_rate, hsm_rate;
 	unsigned long flags;
 	int ret;
@@ -1051,7 +1051,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	 * Additionally, the AXI clock needs to be at least 25% of
 	 * pixel clock, but HSM ends up being the limiting factor.
 	 */
-	hsm_rate = max_t(unsigned long, 120000000, (pixel_rate / 100) * 101);
+	hsm_rate = max_t(unsigned long, 120000000, (tmds_char_rate / 100) * 101);
 	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, hsm_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
@@ -1064,7 +1064,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		goto out;
 	}
 
-	ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
+	ret = clk_set_rate(vc4_hdmi->pixel_clock, tmds_char_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
 		goto err_put_runtime_pm;
@@ -1079,9 +1079,9 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 
 	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
 
-	if (pixel_rate > 297000000)
+	if (tmds_char_rate > 297000000)
 		bvb_rate = 300000000;
-	else if (pixel_rate > 148500000)
+	else if (tmds_char_rate > 148500000)
 		bvb_rate = 150000000;
 	else
 		bvb_rate = 75000000;
@@ -1255,8 +1255,8 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long pixel_rate = mode->clock * 1000;
-	unsigned long long tmds_rate;
+	unsigned long long tmds_char_rate = mode->clock * 1000;
+	unsigned long long tmds_bit_rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
@@ -1269,32 +1269,32 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	 * bandwidth). Slightly lower the frequency to bring it out of
 	 * the WiFi range.
 	 */
-	tmds_rate = pixel_rate * 10;
+	tmds_bit_rate = tmds_char_rate * 10;
 	if (vc4_hdmi->disable_wifi_frequencies &&
-	    (tmds_rate >= WIFI_2_4GHz_CH1_MIN_FREQ &&
-	     tmds_rate <= WIFI_2_4GHz_CH1_MAX_FREQ)) {
+	    (tmds_bit_rate >= WIFI_2_4GHz_CH1_MIN_FREQ &&
+	     tmds_bit_rate <= WIFI_2_4GHz_CH1_MAX_FREQ)) {
 		mode->clock = 238560;
-		pixel_rate = mode->clock * 1000;
+		tmds_char_rate = mode->clock * 1000;
 	}
 
 	if (conn_state->max_bpc == 12) {
-		pixel_rate = pixel_rate * 150;
-		do_div(pixel_rate, 100);
+		tmds_char_rate = tmds_char_rate * 150;
+		do_div(tmds_char_rate, 100);
 	} else if (conn_state->max_bpc == 10) {
-		pixel_rate = pixel_rate * 125;
-		do_div(pixel_rate, 100);
+		tmds_char_rate = tmds_char_rate * 125;
+		do_div(tmds_char_rate, 100);
 	}
 
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		pixel_rate = pixel_rate * 2;
+		tmds_char_rate = tmds_char_rate * 2;
 
-	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
+	if (tmds_char_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
-	if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
+	if (vc4_hdmi->disable_4kp60 && (tmds_char_rate > HDMI_14_MAX_TMDS_CLK))
 		return -EINVAL;
 
-	vc4_state->pixel_rate = pixel_rate;
+	vc4_state->tmds_char_rate = tmds_char_rate;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 2b6aaafc020a..37a87d7e167a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -234,7 +234,7 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 
 struct vc4_hdmi_connector_state {
 	struct drm_connector_state	base;
-	unsigned long long		pixel_rate;
+	unsigned long long		tmds_char_rate;
 };
 
 static inline struct vc4_hdmi_connector_state *
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
index 62148f0dc284..ec24999bf96d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
@@ -365,7 +365,7 @@ void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
 {
 	const struct phy_lane_settings *chan0_settings, *chan1_settings, *chan2_settings, *clock_settings;
 	const struct vc4_hdmi_variant *variant = vc4_hdmi->variant;
-	unsigned long long pixel_freq = conn_state->pixel_rate;
+	unsigned long long pixel_freq = conn_state->tmds_char_rate;
 	unsigned long long vco_freq;
 	unsigned char word_sel;
 	unsigned long flags;
-- 
2.35.1

