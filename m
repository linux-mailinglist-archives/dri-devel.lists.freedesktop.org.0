Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD38C2D5E79
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7996EAA4;
	Thu, 10 Dec 2020 14:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBE06E95F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:23:40 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 518CD6DA;
 Thu, 10 Dec 2020 09:23:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 10 Dec 2020 09:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=xtO8EABYuPSD4
 jdJZtx5oLPeW1mD5jPHmkLZsFDjMYY=; b=AM1JQpW2bxFizrMicxdZX+Fv20HL9
 jPF50BPvulprgGZzkR3aXq6zGe+BZ50rnGwplHjle+qzE4Z8bQ5KosJE4mVwLT8x
 uV2L+V1qlBZ1gXM0Ahudxq8QyUbmR/0Xrl+5J4tL97rfYXsuJ2m53cA+HENlPdtk
 U9qbS5loiS0EhAjjQioW0nX1hAbeWXd7mnb1K970UQ7ppDAyNE9YIi/zoB8AS6nx
 YUXnjywbbUV4lHYN94/pQ3tSxjsVH5EluTBSTHN2MCCQn3sB9qUNMEgic2AEA8cu
 prwdxfKwPMSKnf/waS+c33Z1T9veA3goLfeeNpYBUe4POIa3rwXXnjokg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=xtO8EABYuPSD4jdJZtx5oLPeW1mD5jPHmkLZsFDjMYY=; b=aE4yvDhz
 zA2n3dwNggeBZR9JSzYMBo9xVT0I/GNEHcmDCkeWk4Kyf4j1ZvvmBLirJnrKGsfq
 Y4fln9XO3mo8K4Q5AyHAdAnOcRXtK5FbnGuRjACUQXGXiNXoqL0yickDdOhNH9N3
 /Byeilr0KaIr3hANvnOJ0qF/a8yn+LMgbXM/pIbI2xRZK2HauwYe5hzQ8UoTtE/H
 x6UC3ijWwRgWS2d+5tPorK+qybIBL6mI/n3kru0Q+zcKGoSoLCUUGs/BNRfJ/nXA
 7lY3fPoEA8hZss0Uz1mEnqPg4v/J14gj7mIlRb88WB3ESkOqNsLXby0a800p8PZW
 7RJb6NGRjV2QOQ==
X-ME-Sender: <xms:ai_SX7KcPKLVKxgxR3rvEBw4ne7ZAnOTJGG4437iSVoFhedGGsBUQg>
 <xme:ai_SX6HC3uciN8vuKxIg0E2BEDRoHTdaKq0cM7zg6HQJfUQVmMcLKlESInao420NA
 0tJ5dTNAje56kOc7S4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ai_SXyv7KfXpNXqIlqNFvO21JDqtOvtaNnPJNrJARbFTL-l3cBL_pA>
 <xmx:ai_SX5uX-u6WbTS3Clo4MeZNB2ZI_BD04GFQpdgc71nKXpzcghEmFA>
 <xmx:ai_SXwCrD_3IDClcLPOrGRugAinh4Ltw3YypcSbDKMD29dUlwGW7RA>
 <xmx:ai_SXzZ-TpVqYdi_uS9mMlBeJSmV-bVEzTyD6ncGSb61wLGN0ytaUNhFgBY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A0B4A240057;
 Thu, 10 Dec 2020 09:23:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v6 6/9] drm/vc4: hdmi: Store pixel frequency in the connector
 state
Date: Thu, 10 Dec 2020 15:23:26 +0100
Message-Id: <20201210142329.10640-7-maxime@cerno.tech>
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

The pixel rate is for now quite simple to compute, but with more features
(30 and 36 bits output, YUV output, etc.) will depend on a bunch of
connectors properties.

Let's store the rate we have to run the pixel clock at in our custom
connector state, and compute it in atomic_check.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 +++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8978df3f0ca4..682b3aca2c35 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -198,6 +198,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 	if (!new_state)
 		return NULL;
 
+	new_state->pixel_rate = vc4_state->pixel_rate;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	return &new_state->base;
@@ -615,9 +616,29 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
 		  "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
 }
 
+static struct drm_connector_state *
+vc4_hdmi_encoder_get_connector_state(struct drm_encoder *encoder,
+				     struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state;
+	struct drm_connector *connector;
+	unsigned int i;
+
+	for_each_new_connector_in_state(state, connector, conn_state, i) {
+		if (conn_state->best_encoder == encoder)
+			return conn_state;
+	}
+
+	return NULL;
+}
+
 static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 						struct drm_atomic_state *state)
 {
+	struct drm_connector_state *conn_state =
+		vc4_hdmi_encoder_get_connector_state(encoder, state);
+	struct vc4_hdmi_connector_state *vc4_conn_state =
+		conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long pixel_rate, hsm_rate;
@@ -629,7 +650,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		return;
 	}
 
-	pixel_rate = mode->clock * 1000 * ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1);
+	pixel_rate = vc4_conn_state->pixel_rate;
 	ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
@@ -801,6 +822,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
 {
+	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long long pixel_rate = mode->clock * 1000;
@@ -831,6 +853,8 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
+	vc4_state->pixel_rate = pixel_rate;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 2cf5362052e2..bca6943de884 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -182,6 +182,7 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 
 struct vc4_hdmi_connector_state {
 	struct drm_connector_state	base;
+	unsigned long long		pixel_rate;
 };
 
 static inline struct vc4_hdmi_connector_state *
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
