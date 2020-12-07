Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4B42D2621
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CFF6E9A5;
	Tue,  8 Dec 2020 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3386E899
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 15:57:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id ECE38580339;
 Mon,  7 Dec 2020 10:57:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 10:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=QZ2Ve3+TuDyj+
 ow43JH6DIbAAZNzpL61/YlTtRjbEfc=; b=uijUiwqgUAW0slrHEyo6SMEKemfjC
 y5pZTEYoWi7onPFVAzSwssi26B+1WMV5TYjGOiaJcKEgZlfdCACFYZOHmjXp+lNG
 c92JX8ZbmFtdM3tlMDSydu+SqkJxMcV9Y0I7A3gyW27neyBZACHm2pWuHHSuPHhG
 WrrQ82Aepv84yAMXzPtAgvdfRHL6i9ADb+s9dBECjYfUvIT2ozDEnxO0jV+y6Mwd
 hYo/0817U4q4UUnRDFzJbuQmfoQ90JkF+1s0H6hTaBW1v2GM6q92RkjDn/vRpsco
 UFdx+/mfMxdcLVIL6TXA/jUWrn4BFeJI1lfTExcpqhSzF0S9QXs8nmayg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=QZ2Ve3+TuDyj+ow43JH6DIbAAZNzpL61/YlTtRjbEfc=; b=cpcK/caT
 kkO5Om0tiCNtF8MSbgLINvQgr1ug4NduBnXJErmVQdJayOKfCqCRyE0HzgrVgJq3
 1YaRMdnPcoJhpuyuG+z+yMp3KssQQ65ce0Ntl6P1W21cotwzQC8f7HoyqsPta2lY
 uxifn6lvr+Aqmi3ZgQkSsHQqZqiJiALGdr2kddfxRbbmE/kwY9M3S7YJJeUVIVQW
 Ej8bSDtBhfRzpLb5VgUGCuAdvM4RoShU6N6b7TSCbPHp3JBKLRuwfWdnG2fjHlgT
 M1cz9lAM1OPFfhMi7/jR/DsLD1iMUn6m1QDBjaYTy/So80EVk53pm7l/jko1e0yO
 R4yY8oysCYUpUw==
X-ME-Sender: <xms:6lDOXzpXGAMAwwFUe633TRq01xp94dDyf6wtvR62CgX1jaKBPe-7IQ>
 <xme:6lDOX9pbKS1b1SWnbJccjDYjjzlGposOlXZYiN7lhckv1vCNIOdkCifKBsYFSc52w
 wc-agT2hpozUgO0fQk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:6lDOXwNQehON0am_UHczwtuD30kZHjVnTpYE31OaEDg7HIxUyWE6Rg>
 <xmx:6lDOX24vntClmNg86tM6-teUiKxganzUegnmWTDsKyjM-_GVhSPOrg>
 <xmx:6lDOXy7KokuEpzugCNaRgOPJuZIuxTXAZxVz3SeOm7KbZ3tDQ51hQw>
 <xmx:6lDOX0s_uX9meOd2kC2npKDQd9IRdAjOvDS4xCiKvDfEJXz-p-D7lg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 750661080059;
 Mon,  7 Dec 2020 10:57:30 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 7/9] drm/vc4: hdmi: Use the connector state pixel rate for
 the PHY
Date: Mon,  7 Dec 2020 16:57:17 +0100
Message-Id: <20201207155719.17149-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207155719.17149-1-maxime@cerno.tech>
References: <20201207155719.17149-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
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
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c     |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h     | 11 +++++------
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c |  8 +++++---
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 83699105c7a5..5310e06efc82 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -714,7 +714,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
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
