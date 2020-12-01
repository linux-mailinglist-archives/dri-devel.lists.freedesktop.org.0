Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A1B2CB6C0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BD16EA30;
	Wed,  2 Dec 2020 08:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019936E530
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 13:12:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6D4F55805D1;
 Tue,  1 Dec 2020 08:12:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 01 Dec 2020 08:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=+dEIWqAdGUsmY
 BC0AS/PefmsgsJjaYz2FoM4Ey5HcCo=; b=sZQjvEP4jTYTIy3pFVN7tUQS2n68a
 0/EMFgmTHKZKHEpGXa1FTP4IPOgiEgvzyIfHIO/xuW2pV+YUvDYUOtydBkDuExKx
 tAu27+3VtuU/zA8gqrIrb+wlPjWWeS7joP89H6q03YMfg0S+HDY57MggUyHjxLcQ
 ooOAoknEruHB+KZBjZhRlXWO6dXxccflVrfQ7VZ9/VxLpwN7ZxBkDnhCjWhvQ8V/
 ISt3mBAgmP04QOBnMCI1ippGR/nDjBtEZxXcgzqo4rDgO9F6GI8cb6cLqHIncVNi
 hEZI8ZixOtld5jQBFBQJFAL71UL/VTh2cS7xJ8pWrlyycMxiHCKMQ0XuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=+dEIWqAdGUsmYBC0AS/PefmsgsJjaYz2FoM4Ey5HcCo=; b=Co+aUYBI
 Os5sBsij1HPg8C71gkz18KRrzwHdtXFs07OZSNacpL0hDtfKiV8bM4WwBhgWB136
 lBv0xEREfwN4GG1YJbdJ+NU2zsWp0M7Tgm528X+FP/f0zFf8e5+0rtyYaQs9vb1D
 2+9CSP/la8/nYgMKoJmmpw9ksBE5hhulZJ8H17qy+fXUF0n6Lvca3J16iy54u1l8
 0wI9wtUZaAKqUpZYFrBryTxVR3sAr/Gt4UNlR4JjpzWxjcZreLf6t1F0SDxTIvbM
 rl924zBmyhHgZhnjj6kb3fWPXdksSQtgl5E4vKCKELrYfrTRWOyHjYiKeV5cX51b
 z3hkjeXc62Xmjw==
X-ME-Sender: <xms:WkHGX8ZnOs7kzZx2qZUUPkNhFv5PGzJsBS6g7uu6t6vPbxgE_gZP3w>
 <xme:WkHGX3YvmO4F5ISPj-puZhr758t9s52WQXiYJGmbDGT0T3KokPypB67w1ZjpcBTIH
 MX7dQ0Qjk9SJimxTAk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WkHGX2-RmF1Ux_vPkFg8joHJcpjrb1_wYN0lXcF8ltZmmBAqOnn1XA>
 <xmx:WkHGX2oS14VLzSKpjXgTFV4sxrEJpyxTOeqlKln9Wzn8RIuvVYYvIA>
 <xmx:WkHGX3rXGVmhbULYjdQ_ZmgZHc8iLPt16rGawxBVpFS7-QvsKkRoeg>
 <xmx:WkHGX7ez2rItSkteJKyuezC5yuJYsQn5N0laKAWs9mV_3JBz758BUg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1B8E108005E;
 Tue,  1 Dec 2020 08:12:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 5/7] drm/vc4: hdmi: Use the connector state pixel rate for
 the PHY
Date: Tue,  1 Dec 2020 14:12:47 +0100
Message-Id: <20201201131249.438273-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201201131249.438273-1-maxime@cerno.tech>
References: <20201201131249.438273-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c     | 2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h     | 9 ++++-----
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c | 8 +++++---
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 61baf3c39d43..64eff72d60b2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -712,7 +712,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
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
