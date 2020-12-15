Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7342DBD15
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA9D89D57;
	Wed, 16 Dec 2020 08:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51F36E40D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 15:42:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id EAC92ABF;
 Tue, 15 Dec 2020 10:42:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 15 Dec 2020 10:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=S3W/pUcnNKk4Q
 1bYwm3mXBrWfthCZoXb+rPIcs8gxK8=; b=InPJBjnA6r6zyq3wQzuX4jQRolNye
 0RVmq6YwCHeIc4ED1VVGTbQqIiwgat5A0fWnmB4j4YioDgBspK7MAHM/dOuAIxZv
 yxdyyejSJpRtKGSFIrT2NfZuCbJ4Bbq1o+kdFdooI91OxV7drxOMs/Kju9cFDwCm
 R0J+ephhGK5hHkdRgkQXR3ElIRpnlV7xPs5ydtd6S1x+w/MsnV1r3UAt0oJU+vnh
 PJBX9WKaL8+C/PuIzisB7IO0MaKVX9bCquj58aSZkYgxF1tv36mlHRu63BlkyeH5
 /aDDnkVNZqTNBbCapBgPlkTTyigOb2JtHgW3W2754DcLRGG3K6597OPsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=S3W/pUcnNKk4Q1bYwm3mXBrWfthCZoXb+rPIcs8gxK8=; b=MnCgQD+m
 ADUzh28O7iN3xKN7ftA/hWbKWfcUiuuTTCYGC/00saErFrp3m3BqRDzXm3nSSSIX
 cm3yKu8l5DpUA/Lg55UlKJgAWvCfWntaRZFWSnzvJbXhvx/4UtjFv/82WvJwx+Ru
 htrVxy/COuDkDJ87ntCMSA+2ZA8OS8lILXeekBfsKitxOtqNeCYvAcE7IL/enYus
 Ff4LLJy8R70RCo/ENxz+M5s+KGzqaBZM7jX9sG+bhc+MxgjE9hgYQFkwUNWs/b+J
 K4JpR4/BSz3TKhL5eGXoSYM3okdI8apJVjkL1wYpZNhflRIu0YVQuSeUaTkvnFhd
 rowisk3D7ZI/YQ==
X-ME-Sender: <xms:f9nYX9I6oGjqkxXdRQ3uRionl96AyzvABlvdqz3siGsrHA7JaU3ZqQ>
 <xme:f9nYX10DVORae3N7jHygkxMAES3MoQptignW2uUWyDUYIv4ewxdSc7J7y89am45Hs
 Se3h52a6sU1rxMhlZs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:f9nYX5nfdOyhbfQr8UcOt4lWk1LKzrZwhJ0ksSiUTCBiyT4PmgNBNw>
 <xmx:f9nYX4ideBuNYLm2rXiAZJdFo06u2Y5Wd63zc_aqtfGnNFe-imrKPg>
 <xmx:f9nYX4SQugB3FvEdhHJ3loCaepDdalHQ4lKYjK5YjTK5Pjf1bw-KDg>
 <xmx:f9nYX67kFgDWNv3Hw9DDaZgnocbvpVEZQFqCsiTNODw7MHSP0ndp3ekRft4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5563B240065;
 Tue, 15 Dec 2020 10:42:55 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v7 7/9] drm/vc4: hdmi: Use the connector state pixel rate for
 the PHY
Date: Tue, 15 Dec 2020 16:42:41 +0100
Message-Id: <20201215154243.540115-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215154243.540115-1-maxime@cerno.tech>
References: <20201215154243.540115-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
index a6422d7af019..dbe516d89726 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -721,7 +721,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
