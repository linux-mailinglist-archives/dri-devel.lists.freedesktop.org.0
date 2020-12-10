Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E9A2D5E69
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C346EAAE;
	Thu, 10 Dec 2020 14:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908C06EA00
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:23:43 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 84A27C44;
 Thu, 10 Dec 2020 09:23:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 10 Dec 2020 09:23:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=/4Y+9bC9FNNxF
 6lXHaX+bfJNqcEt61/XPn4O5YFYRCM=; b=G87Ty2gT9BY1DnE04Fz69v9hKqbGs
 QMDFGvO9dCh+ZDfTk9v+7EtRM/TfE17JdG11BHEq0ZftKw4XE9TWQclahgMb+zgt
 l0OX4eZwVxsY/+1dl0cIxnU8l5cPV68xhYdnwJ0wUnTs38rvv05YGbVcSFPPRMwg
 sopdwbT4GKnTjGEdk/evzyenGZDuH+8RHFosuLj56lRxPmpkRMR8kwp5AB0We9Zt
 wjCK4CPJvyMOXVry16EkHybSD9D7glcYJvux0Q40v3E/n0CNtqn82Rlf/3syTzjp
 LRlnyz12wzutjivR5lKnA7rZtJ1RWPTlKJYXazfNFXLyoHZzfGifwlz0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/4Y+9bC9FNNxF6lXHaX+bfJNqcEt61/XPn4O5YFYRCM=; b=msN8McLV
 U3ZYK1oVuymrPZpX0E7FlaS3cv9T/rfmQhYB8zpLsRDbRb8zkIsyDY1qcXvaObVV
 EPXhprYmxGkddGFceBi4Am0w5qD3Hd5e5m+DEjsImbiFiC9lEBrr4Hg7sY9s0LDh
 Wyu8HjlcrwtvBoc+neoFBJPHz6ijRhzgsqvjMWEaceEegcve1V1Zfb2E17oBmf9O
 Hn1BiGN8ZQp8MJyNM5ckEDX1Cz+E+Qt52MSwaKpcEbt9QWwMXze3NMTZvTzqOl1L
 LR8xLeRY/eaRtRwDyD40T99rdWz3wigITeOvASyCpJrOLWN9w81XeW2GSr80I5yz
 TTSybTX1o8/90A==
X-ME-Sender: <xms:bC_SX28Yr6gBH2sPAdEkahU3Dsod-wtnf8KFprWIroesqbVx9HGBDw>
 <xme:bC_SX2qiSlO89Bxymy1l75VK1BkgNrXftxCzjm276rYzP3DHolhBYY7asrumm_jRI
 czABKK5hUjXfoNYW_s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bC_SX45Yj8v2kyb1lmxBfyR0QEc0mP2uk3_MMYYzdmT9PL-7J-FvbQ>
 <xmx:bC_SX2M1K_57tpFLhIq1WTOBWPwAp-Cr-kkDNeQLLtjAaegz3HTPlw>
 <xmx:bC_SX6O2nyr55csuFE8Wk3pJLhRVQ5UA9yAGZCSWHZV3Td3RrQzgbA>
 <xmx:bi_SX_28mQAEy6MaOrwT4K_9EU0m8eQUcpa-9sdD7iL6UcVg6sm7xta5oRw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EFCB6240066;
 Thu, 10 Dec 2020 09:23:39 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v6 7/9] drm/vc4: hdmi: Use the connector state pixel rate for
 the PHY
Date: Thu, 10 Dec 2020 15:23:27 +0100
Message-Id: <20201210142329.10640-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210142329.10640-1-maxime@cerno.tech>
References: <20201210142329.10640-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PHY initialisation parameters are not based on the pixel clock but
the TMDS clock rate which can be the pixel clock in the standard case,
but could be adjusted based on some parameters like the bits per color.

Since the TMDS clock rate is stored in our custom connector state
already, let's reuse it from there instead of computing it again.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c     |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h     | 11 +++++------
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c |  8 +++++---
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 682b3aca2c35..553176f9e28d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -718,7 +718,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		vc4_hdmi->variant->reset(vc4_hdmi);
 
 	if (vc4_hdmi->variant->phy_init)
-		vc4_hdmi->variant->phy_init(vc4_hdmi, mode);
+		vc4_hdmi->variant->phy_init(vc4_hdmi, vc4_conn_state);
 
 	HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
 		   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index bca6943de884..60c53d7c9bad 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -21,10 +21,9 @@ to_vc4_hdmi_encoder(struct drm_encoder *encoder)
 	return container_of(encoder, struct vc4_hdmi_encoder, base.base);
 }
 
-struct drm_display_mode;
-
 struct vc4_hdmi;
 struct vc4_hdmi_register;
+struct vc4_hdmi_connector_state;
 
 enum vc4_hdmi_phy_channel {
 	PHY_LANE_0 = 0,
@@ -80,9 +79,9 @@ struct vc4_hdmi_variant {
 	void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
 			    struct drm_display_mode *mode);
 
-	/* Callback to initialize the PHY according to the mode */
+	/* Callback to initialize the PHY according to the connector state */
 	void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
-			 struct drm_display_mode *mode);
+			 struct vc4_hdmi_connector_state *vc4_conn_state);
 
 	/* Callback to disable the PHY */
 	void (*phy_disable)(struct vc4_hdmi *vc4_hdmi);
@@ -192,13 +191,13 @@ conn_state_to_vc4_hdmi_conn_state(struct drm_connector_state *conn_state)
 }
 
 void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
-		       struct drm_display_mode *mode);
+		       struct vc4_hdmi_connector_state *vc4_conn_state);
 void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
 void vc4_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi);
 void vc4_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi);
 
 void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
-		       struct drm_display_mode *mode);
+		       struct vc4_hdmi_connector_state *vc4_conn_state);
 void vc5_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
 void vc5_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi);
 void vc5_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
index 057796b54c51..36535480f8e2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
@@ -127,7 +127,8 @@
 
 #define OSCILLATOR_FREQUENCY	54000000
 
-void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi, struct drm_display_mode *mode)
+void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
+		       struct vc4_hdmi_connector_state *conn_state)
 {
 	/* PHY should be in reset, like
 	 * vc4_hdmi_encoder_disable() does.
@@ -339,11 +340,12 @@ static void vc5_hdmi_reset_phy(struct vc4_hdmi *vc4_hdmi)
 	HDMI_WRITE(HDMI_TX_PHY_POWERDOWN_CTL, BIT(10));
 }
 
-void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi, struct drm_display_mode *mode)
+void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
+		       struct vc4_hdmi_connector_state *conn_state)
 {
 	const struct phy_lane_settings *chan0_settings, *chan1_settings, *chan2_settings, *clock_settings;
 	const struct vc4_hdmi_variant *variant = vc4_hdmi->variant;
-	unsigned long long pixel_freq = mode->clock * 1000;
+	unsigned long long pixel_freq = conn_state->pixel_rate;
 	unsigned long long vco_freq;
 	unsigned char word_sel;
 	u8 vco_sel, vco_div;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
