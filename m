Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C2A2D260C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4876E970;
	Tue,  8 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B27989C19
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:39:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C7E0F580362;
 Mon,  7 Dec 2020 08:39:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 08:39:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=7mgWpBMjGNSq5
 D7vOVEEbtcWs6vl7Q8ZodMNFWsWhTw=; b=j1VaEZMKJwF460YhI4TOXtRb6jG10
 LgWa2AOPBEyCA0TuBVH2AoBcJ9tLh6BExjW6LW0KEYaX2UDQfgvnvEZEbv1y7TbV
 I+7+2yvNT85jdfdLAX60ufQm6ydiMHivRqV87XQ8CzVPOr2bFl44dvEQmXAfHCEc
 Hlwgo1bi3D2mBmBdlZhwX3zLxjvkrRhvDNBn9ijBnBPE0a+f6S2CD5E10yCSan5j
 VRKULE5ArIPNbUl33N/4N7u7Lqde/ReaxGybm6WUwDPAfzd5HTgd5sR8HEucYML9
 mgn04nSp1dGpwkxTw3nFBRif/MDcCwdLKJvGwQZdHaE0jwTYy+X3aMZjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=7mgWpBMjGNSq5D7vOVEEbtcWs6vl7Q8ZodMNFWsWhTw=; b=OXfDuqr0
 CgX33XborfqxyMhkO/EwXHGhMchiBapbEo7Q1DqXM8AmkbSJMjbiOB2buXLGlHP5
 5HBCSrYY4KkR9vrDo2rJ77IqpZ2T0DEg9ZO8wmUsKVik7UylVYewVz4bC/y9LrGG
 2+qI+HuDJ2xBN4+b7iDwBE5u2eZvIYwANjbEll7Zhr8TdJKjCUVXHs+yykJPVzpN
 mMNd0fMBeXcfFBW5PzGJurG9XC0faLQIbJiw+dLp20PvEFMlBQom0J2OnBxeSobR
 w2Zw+IeVlEV18UA+uCqhqhWq5olgD2vjtiMaNRlEZjHElDRmpCwcSDfF9GibDQVQ
 zs6E2FGwjNrIRg==
X-ME-Sender: <xms:rTDOX9iDSrdiNC5IImIrB8c_nnC2AN7RaT3DY8_0I6hf0fLxLdJ_ng>
 <xme:rTDOXyBPRCBpWMeEWcSwa-xKuMLCcK8lSNCWho07jfeOKAlIezQ-vCV0m2wk2pP6T
 FVXiLXqTJas-oiPKSE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rTDOX9HIDMUd0b4N_BRePE1P3lR7X-R7ihyk9Oz0N3PpoRuNYiuOdQ>
 <xmx:rTDOXySzbAb6IOjkK6c4ODTr5UlK-4jNa5icSVJJV5xXUtHj_aP2fg>
 <xmx:rTDOX6xirv6dRgNTFpnk66JhuPArCz9cSs_Q83Wy7WeqT3DPLIU3Vw>
 <xmx:rTDOX5mHM7hK4v4uZfqlEKSUsk7M-vE5QFP7vhMIaLXje0zszpV1jQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 551B61080063;
 Mon,  7 Dec 2020 08:39:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 5/8] drm/vc4: hdmi: Store pixel frequency in the connector
 state
Date: Mon,  7 Dec 2020 14:39:45 +0100
Message-Id: <20201207133948.2109194-6-maxime@cerno.tech>
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

The pixel rate is for now quite simple to compute, but with more features
(30 and 36 bits output, YUV output, etc.) will depend on a bunch of
connectors properties.

Let's store the rate we have to run the pixel clock at in our custom
connector state, and compute it in atomic_check.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 +++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 862c93708e9a..c1667cfe37db 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -194,6 +194,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 	if (!new_state)
 		return NULL;
 
+	new_state->pixel_rate = vc4_state->pixel_rate;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	return &new_state->base;
@@ -611,9 +612,29 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
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
@@ -625,7 +646,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		return;
 	}
 
-	pixel_rate = mode->clock * 1000 * ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1);
+	pixel_rate = vc4_conn_state->pixel_rate;
 	ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
@@ -797,6 +818,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
 {
+	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long long pixel_rate = mode->clock * 1000;
@@ -824,6 +846,8 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
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
