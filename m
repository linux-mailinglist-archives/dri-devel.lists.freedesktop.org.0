Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F670417654
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 15:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81606EE1D;
	Fri, 24 Sep 2021 13:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310F36EE1D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 13:55:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 959DC5C023B;
 Fri, 24 Sep 2021 09:55:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 24 Sep 2021 09:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=E9M1U0KPzsJHJ
 rmVUnGglYC29d6QIZ61vTsg1uA/oeU=; b=c4sYDdBwXL4HE2vhsz7V7wwCOLv1k
 +d6ayP6Cnix0ariYKO2C3snKYtrK5zDlmDqi310ABYp2PupUAUQLDulizBVvTaPa
 /Pxp9/4+ySo08rovCguwh4IcYwx30f4HBXnM8qptGORqJ0JM2Cza+G9UjVvL5vF7
 bLFYOCEBwAZ1qhsm0fM2LU+Bj7orUEpWBo39UGiZHVtDaIAc+p4pz6qFK7MZlTcP
 a2+u3ugoV2i27pe3dyK2sxpE3M3JKeOnbk7K9Qp4acWsnZSOAeiPDc+jCbRjhkTI
 fuz92O6s/5RO2EUuen8VGxzrSAvGLc39rzMs68kqnNGtctOO3AFp/2x3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=E9M1U0KPzsJHJrmVUnGglYC29d6QIZ61vTsg1uA/oeU=; b=ePYD1gEp
 lwEjo/noQ3w3rIZ1J4RhcvfndALw3VbHKd2AjSMzRkcWJ9yrV8VKGfPNI2UMT894
 AW6TwxbTuaSn626v32IiNa/qxrgfqZxl40SsFN5/rLcrh3pHm37q2+biwTNLpo3y
 IpLvMsUFB8CmSPFuqnoPcyE7fQgv/kXDPaRkLKGcGmbJGljmVhWvF6nlw3DSY29h
 kHnjPXVeFz6kcgIa4yFXfWixEZ5suHkXX3ju1LKrFiY6N4W5eTOTl2sLHiUEkNXy
 hiFMhpE3fLOa6y91CPCneaZy21DGQJTngi5NgbFB2JUduitbChHqoMm2CUg5nxT9
 Vkh1w6hFhI8SeQ==
X-ME-Sender: <xms:2NhNYdqYe6FNPMhwajdJtOShfbLGVAGBt7Jfi-YG6qw0ZsiOei2gJw>
 <xme:2NhNYfoM4gnNJvR8fhCflDwKfq-05O1T2jQAB3WYA0zJFrg5N9O2hM5eYss--bXDD
 hKlAoskMLwuf1bvdWE>
X-ME-Received: <xmr:2NhNYaN6wAYZWKSLMvkyCCKwN9J7q1NBY9Mru46Js5NXh9o5FwBtAmDLungoeqJFKtOPV4fUHGNsV-4oUNghlhfXtve0F87yKmzU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2NhNYY4VSnulamS2sSudNlmPO2TC586jFC_ZM--nI4mpfrK7EAaYPQ>
 <xmx:2NhNYc6FFE31UMygcZxb6fIenlNlHUY9lxIJVf9ejxdyP_lhLv0vaQ>
 <xmx:2NhNYQipwsBTLHXYq9X778qplfZWoW8kNZ0ZbEDEvLiU3LayGCnDvw>
 <xmx:2NhNYbbJMNqqxHTIVJbog3MGbezufZnrzj9PITLZf1hhnHgisE2IEg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 09:55:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 2/2] drm/vc4: hdmi: Remove drm_encoder->crtc usage
Date: Fri, 24 Sep 2021 15:55:30 +0200
Message-Id: <20210924135530.1036564-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924135530.1036564-1-maxime@cerno.tech>
References: <20210924135530.1036564-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_encoder crtc pointer isn't really fit for an atomic driver,
let's rely on the connector state instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 50 ++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 74f9df38815e..4bd01178ef9a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -432,7 +432,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_connector_state *cstate = connector->state;
-	struct drm_crtc *crtc = encoder->crtc;
+	struct drm_crtc *crtc = cstate->crtc;
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	union hdmi_infoframe frame;
 	int ret;
@@ -537,8 +537,11 @@ static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
 
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_connector_state *cstate = connector->state;
+	struct drm_crtc *crtc = cstate->crtc;
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 
 	if (!vc4_hdmi_supports_scrambling(encoder, mode))
 		return;
@@ -559,17 +562,18 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_crtc *crtc = encoder->crtc;
+	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_connector_state *cstate = connector->state;
 
 	/*
-	 * At boot, encoder->crtc will be NULL. Since we don't know the
+	 * At boot, connector->state will be NULL. Since we don't know the
 	 * state of the scrambler and in order to avoid any
 	 * inconsistency, let's disable it all the time.
 	 */
-	if (crtc && !vc4_hdmi_supports_scrambling(encoder, &crtc->mode))
+	if (cstate && !vc4_hdmi_supports_scrambling(encoder, &cstate->crtc->mode))
 		return;
 
-	if (crtc && !vc4_hdmi_mode_needs_scrambling(&crtc->mode))
+	if (cstate && !vc4_hdmi_mode_needs_scrambling(&cstate->crtc->mode))
 		return;
 
 	if (delayed_work_pending(&vc4_hdmi->scrambling_work))
@@ -891,7 +895,9 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		vc4_hdmi_encoder_get_connector_state(encoder, state);
 	struct vc4_hdmi_connector_state *vc4_conn_state =
 		conn_state_to_vc4_hdmi_conn_state(conn_state);
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
+	struct drm_crtc_state *crtc_state =
+		drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long bvb_rate, pixel_rate, hsm_rate;
 	int ret;
@@ -985,7 +991,11 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 					     struct drm_atomic_state *state)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
+	struct drm_connector_state *conn_state =
+		vc4_hdmi_encoder_get_connector_state(encoder, state);
+	struct drm_crtc_state *crtc_state =
+		drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
@@ -1008,7 +1018,11 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 					      struct drm_atomic_state *state)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
+	struct drm_connector_state *conn_state =
+		vc4_hdmi_encoder_get_connector_state(encoder, state);
+	struct drm_crtc_state *crtc_state =
+		drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -1196,8 +1210,8 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
 
 static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi, unsigned int samplerate)
 {
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
-	struct drm_crtc *crtc = encoder->crtc;
+	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_crtc *crtc = connector->state->crtc;
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	u32 n, cts;
 	u64 tmp;
@@ -1229,12 +1243,20 @@ static inline struct vc4_hdmi *dai_to_hdmi(struct snd_soc_dai *dai)
 
 static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
+	struct drm_connector *connector = &vc4_hdmi->connector;
 
 	/*
-	 * The encoder doesn't have a CRTC until the first modeset.
+	 * The HDMI connector doesn't have a state until
+	 * drm_mode_config_reset() is called.
 	 */
-	if (!encoder->crtc)
+	if (!connector->state)
+		return false;
+
+	/*
+	 * If the connector is disabled, its state won't have a pointer
+	 * to the CRTC.
+	 */
+	if (!connector->state->crtc)
 		return false;
 
 	/*
-- 
2.31.1

