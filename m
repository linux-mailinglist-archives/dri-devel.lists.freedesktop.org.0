Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801C843983D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 16:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C601D6E086;
	Mon, 25 Oct 2021 14:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F11C6E055
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 14:11:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id DC7F05805BE;
 Mon, 25 Oct 2021 10:11:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 25 Oct 2021 10:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=4Aqmym0elkF3v
 /hiHKelXviWr1n8l/+lCUn8w3iv3xI=; b=OAo4C9SNBoCbU3fN0jf0YKQm9sNUY
 CzymvKFKlIeg4eLW2Sj/q2sUbxFXkf+Vx3TVaTPQPAEqYSBS92JPvB7ETecHcb2+
 DXAsndh6nyAfG6/Yqj+0nXC/ldUXJYvC7ya4dFV17VnvQoZEogW7+MpenbR5udgL
 asciHA5qvuL/xaWyrDWCr9VqTZshtFnSVLTvld4NhCECKk/YrEv8we2uw0lvthxu
 F4wWujVJdQg6mZhGtaG4sHBl4RFlcMBGBqbYEh7250HRvYv3OiJlKKsIJ14K1uOt
 qUlB96iF8IpIrMsNhz7t0lMv4iQQYMBM0s+vaPM/D8USHNzymmG8H5rIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=4Aqmym0elkF3v/hiHKelXviWr1n8l/+lCUn8w3iv3xI=; b=Nl1RJESX
 umb5mKLAwiB4SnuG1GudrftQjd6IErF75ntg9LDdRUJtvjzwRoCfJD6lHhdr9CXm
 jtlIipACqU6BQy0zaLq6Xdbak97gO8uebBhdBSc2DGrz5vVxTE58x0BZWALg8dEJ
 rKP7fUPTU8djbg5PtsNplzfxqPOB1JFQHnBIOeRFuP1Pddbf7ArBiRblWBniHt0k
 7pJKmJ5G4cYAfpmepeSLyO6iwpOMdx3EA6PrhqQxVxp6GyknzwSPjYbngGrOTHPD
 L3on1GGFulcWTc3tNkAuAoLonIBs+IRaeJUzzRHicoY9mApUjcW7UMjpWjMLgfMv
 1cucMvcRfrKW4Q==
X-ME-Sender: <xms:Ert2YdxvY5gO8rJzZk9rU6qRm77ftKXjvtskW736JjN3z2PmIxwaKQ>
 <xme:Ert2YdRknGfkx7RYVYPiZmLmUeCYr1oFxb9RSe7oufpwMSD4kji2b3o1-xj0u9Qns
 2_qYpldtYeCEEnZxAw>
X-ME-Received: <xmr:Ert2YXW-_WJ3dqw-AzOu4BRxG1eqaeEDS67fSQ1GZ69MBTLZbuWN3s9ExOKaEiVw48ucJuHAafHM6-HifDJ5Q-5a0fDEU7nX9IOl2LEx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeetueeludeikefgheethfefgfektdfgheefleetheffuddvleegffekvdfh
 vdffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ert2Yfih5m0dQOwau-syjy8uVLQi9lCUZhv48z06MuoT7hVOHDO3rg>
 <xmx:Ert2YfCKm50_9xputsh4nDG5xP7cNQnJoICAsXEii8QXajJB9udJZw>
 <xmx:Ert2YYJkNJALl1fcR9H4lXpFcLvcY-5cjyeH5DQERg20raqGSiTD3w>
 <xmx:Ert2YbswSDY23969liiV2XoZJG6DwIqHkHVCdx4NaLGRM2zox9G0PA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 10:11:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 6/9] drm/vc4: hdmi: Prevent access to crtc->state outside of
 KMS
Date: Mon, 25 Oct 2021 16:11:10 +0200
Message-Id: <20211025141113.702757-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025141113.702757-1-maxime@cerno.tech>
References: <20211025141113.702757-1-maxime@cerno.tech>
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

Accessing the crtc->state pointer from outside the modesetting context
is not allowed. We thus need to copy whatever we need from the KMS state
to our structure in order to access it.

However, in the vc4 HDMI driver we do use that pointer in the ALSA code
path, and potentially in the hotplug interrupt handler path.

These paths both need access to the CRTC adjusted mode in order for the
proper dividers to be set for ALSA, and the scrambler state to be
reinstated properly for hotplug.

Let's copy this mode into our private encoder structure and reference it
from there when needed. Since that part is shared between KMS and other
paths, we need to protect it using our mutex.

Link: https://lore.kernel.org/all/YWgteNaNeaS9uWDe@phenom.ffwll.local/
Fixes: bb7d78568814 ("drm/vc4: Add HDMI audio support")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 38 +++++++++++++++++++++++-----------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  6 ++++++
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 814f98414f2b..cb444571a3f7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -483,8 +483,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_connector_state *cstate = connector->state;
-	struct drm_crtc *crtc = encoder->crtc;
-	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	union hdmi_infoframe frame;
 	int ret;
 
@@ -596,8 +595,8 @@ static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
 
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long flags;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
@@ -623,18 +622,21 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_crtc *crtc = encoder->crtc;
 	unsigned long flags;
 
+	lockdep_assert_held(&vc4_hdmi->mutex);
+
 	/*
 	 * At boot, encoder->crtc will be NULL. Since we don't know the
 	 * state of the scrambler and in order to avoid any
 	 * inconsistency, let's disable it all the time.
 	 */
-	if (crtc && !vc4_hdmi_supports_scrambling(encoder, &crtc->mode))
+	if (crtc && !vc4_hdmi_supports_scrambling(encoder, mode))
 		return;
 
-	if (crtc && !vc4_hdmi_mode_needs_scrambling(&crtc->mode))
+	if (crtc && !vc4_hdmi_mode_needs_scrambling(mode))
 		return;
 
 	if (delayed_work_pending(&vc4_hdmi->scrambling_work))
@@ -1007,8 +1009,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		vc4_hdmi_encoder_get_connector_state(encoder, state);
 	struct vc4_hdmi_connector_state *vc4_conn_state =
 		conn_state_to_vc4_hdmi_conn_state(conn_state);
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long pixel_rate = vc4_conn_state->pixel_rate;
 	unsigned long bvb_rate, hsm_rate;
 	unsigned long flags;
@@ -1110,9 +1112,9 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 					     struct drm_atomic_state *state)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	unsigned long flags;
 
 	mutex_lock(&vc4_hdmi->mutex);
@@ -1140,8 +1142,8 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 					      struct drm_atomic_state *state)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
@@ -1217,6 +1219,19 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 {
 }
 
+static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
+					     struct drm_crtc_state *crtc_state,
+					     struct drm_connector_state *conn_state)
+{
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+
+	mutex_lock(&vc4_hdmi->mutex);
+	memcpy(&vc4_hdmi->saved_adjusted_mode,
+	       &crtc_state->adjusted_mode,
+	       sizeof(vc4_hdmi->saved_adjusted_mode));
+	mutex_unlock(&vc4_hdmi->mutex);
+}
+
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
@@ -1293,6 +1308,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
 	.atomic_check = vc4_hdmi_encoder_atomic_check,
+	.atomic_mode_set = vc4_hdmi_encoder_atomic_mode_set,
 	.mode_valid = vc4_hdmi_encoder_mode_valid,
 	.disable = vc4_hdmi_encoder_disable,
 	.enable = vc4_hdmi_encoder_enable,
@@ -1346,9 +1362,7 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
 
 static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi, unsigned int samplerate)
 {
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
-	struct drm_crtc *crtc = encoder->crtc;
-	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	u32 n, cts;
 	u64 tmp;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index cf9bb21a8ef7..a43cc5614d19 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -197,6 +197,12 @@ struct vc4_hdmi {
 	 * be resilient to that.
 	 */
 	struct mutex mutex;
+
+	/**
+	 * @saved_adjusted_mode: Copy of @drm_crtc_state.adjusted_mode
+	 * for use by ALSA hooks and interrupt handlers. Protected by @mutex.
+	 */
+	struct drm_display_mode saved_adjusted_mode;
 };
 
 static inline struct vc4_hdmi *
-- 
2.31.1

