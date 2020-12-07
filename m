Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 763C62D260B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF32A6E97A;
	Tue,  8 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BA289C53
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:39:59 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4059A580366;
 Mon,  7 Dec 2020 08:39:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 08:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ArEvAbsUPUaHN
 zituFTJrzWqUw7vdN/jJJYw2HseLc8=; b=Q3+hkqYIc1C0fDr8xTeV/jCFV0o5l
 AnvL1BlC/Lyc2nSgZKBsuphSsPc6xnfCbqEEETF2te2A2Syq8uZ3Biy1Xc73YSdH
 YHewdvnG1OvzHNDt+BPGhe65dFmM4BM86alk6RnzYhXY/CzV1tbIIDuiy3WBNrjQ
 xGX7kBUjFaZ2tYUahM8U5aTkPG4+ijDnEuT4QTiI7PgeI3FYOioxEHRzm4mIcq2t
 yUoJbDUyPfY6rxiQt/RcNFlgkXbKwTRsfnbbzYzYjBPEgcwjLrCSMVMrUuWfXrRJ
 QoNyeiIMQTFCr6D3mJiHgu/KSpvGx1IpJvwFxO0KxRzsa2/Ji7cPBqvfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ArEvAbsUPUaHNzituFTJrzWqUw7vdN/jJJYw2HseLc8=; b=gbwRlPiK
 V9UBkMBhL1f1Okfvd0WXVpxbdoM2TFDducZOcpE2Q3E2vxu4b4DwexyOcFpLUUNe
 +zz2Mb/sSo7eB5MsCPNUFXM6LHp/3RoVow2H09/22hLDypUVlJcy6TnME/vZESm/
 zgJQhPSZHdhPt14XaMXy0gX4MflcNLTqtHaU1dtRIp+vmNRcI0Y6S8N8dBRc3PIk
 pK5BDJ1Dm5+bDfpRuwgrcb3aZoaxAuAmSVd4T2qYbZnLfFQ/T8WJMxua4QNKWV3p
 GAiXS2qJEScCO39E7pYIRM5HMUeQ7/ech4lJnyeWSwogzsJg8lJVmNt4wpMKsfSw
 gf3LPren1s2U7w==
X-ME-Sender: <xms:rjDOX_FSlFgCicz_EWqML4uiIekLsek_quFqG0MkOnLJtEeGuuRbaQ>
 <xme:rjDOX8XyzbU3JJOuFcWi5jzTmhuHsCAOU8RksEoMRbXuOxU6yx0KPI8_29nbE8L45
 7oGexeHZc3Ryun51Tc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rzDOXxK0yQsjCYna-ORiSYTaJWnHVtjUK5bKC9nLKt6BPGtr_iiiNQ>
 <xmx:rzDOX9FDJR5-Qz1Y2F5ZTE9z6IGOZawbOEicHXGnJ-8qpPrYM4ayXw>
 <xmx:rzDOX1Vqu0_tHgpEFAknCguiBOUfTYm-qsOvv3G8-ej9gOPj9fNvYQ>
 <xmx:rzDOXxrFdSESrcuC3btbWYY354KUEF2090cGc8bGnJpIweamwEkhnA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BD5291080064;
 Mon,  7 Dec 2020 08:39:58 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 6/8] drm/vc4: hdmi: Use the connector state pixel rate for
 the PHY
Date: Mon,  7 Dec 2020 14:39:46 +0100
Message-Id: <20201207133948.2109194-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207133948.2109194-1-maxime@cerno.tech>
References: <20201207133948.2109194-1-maxime@cerno.tech>
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c     | 2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h     | 9 ++++-----
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c | 8 +++++---
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index c1667cfe37db..795fd23c8f58 100644
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
index bca6943de884..6cc5b6652cca 100644
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
@@ -82,7 +81,7 @@ struct vc4_hdmi_variant {
 
 	/* Callback to initialize the PHY according to the mode */
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
