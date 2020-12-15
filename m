Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4584B2DBD0D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE1A89D66;
	Wed, 16 Dec 2020 08:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861F96E40D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 15:42:55 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 9057F811;
 Tue, 15 Dec 2020 10:42:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 15 Dec 2020 10:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=0lcZfsHNcnRwm
 zKI549VEABAICgRMg0+rE5TUoiiyr4=; b=qddKfySfhuHbI9YEeYVo/FJW+jCf3
 LYjn7ae7QvFMqbTqAMCOQ2dgkRXD8sQ/h/d3cn2uyLV+3b9c39tKtcgMg1oUmfW1
 2mWs/lMq8cU5CDtNrJqfBn++imV+I6RNMhzjqfFAudHd6un9ORUfxt4Jha1NKbkh
 sMWCBGU78yHqfdAZichLgFyFd0TlmFqnczzNDVWHgfoDb4Dwjn0kTz0RwaeK44Ou
 fWGN22P1D8wZII66uP12OpJR7zI1QB6xlUS0H2nizd0lr1AL+wJudqwVqvAS3eOO
 ei+ClPiKSz2Y73xk+L7qtwjJoKel3LXbEqU/I9be+3UhKCGl3W0850NiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=0lcZfsHNcnRwmzKI549VEABAICgRMg0+rE5TUoiiyr4=; b=Ca19E6Fx
 /T+tl2l7b29pBzaD3c6SReRL/sGhaMyspy9ANndziAykHRP+QUfAFnb3UkdrsN6O
 g8O1IjZn8v3RZeyUm46fPSmEa8Zl5MczGwKRA1oNL1y0sFeAnifJ6nQtV7X3bKly
 zF0T3sVjc4zZ3IctvEnPcG8hi/fUsPq0kJDFolRfU0fqCl312vXrTlBsqCnSIazw
 l7jTpjNrJ4d3ijaIzdqz8AMBsOK14VD8mKAoxpHabuo8Jzw75IE5QtDrUI/TXpaz
 mNJpoJTVWR7W4/p3tP7+pr4d9M8OUAdSKJp/BXkP+e2Yg8oPEV2pFMzmu8J+v3oE
 xDL1h75LL7FeTw==
X-ME-Sender: <xms:ftnYX0ImL3PWDRHmSJPelUArFuZ2giRL9WMrmXe2ugeibAXumX485A>
 <xme:ftnYXxhuaERbLYDQNo5b_EFdRa8MpDBi_FC3B4fvL-1iMYQ1JgU90kHCs4A8UvDix
 9Eq-3VPayq_B4FBAHE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ftnYX8DnghoAScObQXKezhYQNEdjtiwC3FClCNTiHccxaVUpzGWtJg>
 <xmx:ftnYX76Vs55uzHRKJDwlywdSA0APyxqH6Yds_eUeIzoUt4ZLV9gSvQ>
 <xmx:ftnYX5GGmXwJo-Jiv4DmYaYQ-TTP10mx31aRoxKrYXacub-9dtRlcQ>
 <xmx:ftnYX42elMKK4mEOYGO-IvHUXOPnQ1EGhW-8Hg4NL-hXwWaItgGQqc_la_4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EDD1524005E;
 Tue, 15 Dec 2020 10:42:53 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v7 6/9] drm/vc4: hdmi: Store pixel frequency in the connector
 state
Date: Tue, 15 Dec 2020 16:42:40 +0100
Message-Id: <20201215154243.540115-7-maxime@cerno.tech>
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
index d22a0dbd0ce2..a6422d7af019 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -198,6 +198,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 	if (!new_state)
 		return NULL;
 
+	new_state->pixel_rate = vc4_state->pixel_rate;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	return &new_state->base;
@@ -618,9 +619,29 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
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
@@ -632,7 +653,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		return;
 	}
 
-	pixel_rate = mode->clock * 1000 * ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1);
+	pixel_rate = vc4_conn_state->pixel_rate;
 	ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
@@ -804,6 +825,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
 {
+	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long long pixel_rate = mode->clock * 1000;
@@ -834,6 +856,8 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
