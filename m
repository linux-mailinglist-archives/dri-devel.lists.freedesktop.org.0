Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C6A3BE992
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 16:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990726E0AB;
	Wed,  7 Jul 2021 14:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8023A6E0AB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 14:19:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id C3A0A58066F;
 Wed,  7 Jul 2021 10:19:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 07 Jul 2021 10:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=QeBI3eGw009zrELtwQ+M7K5WLX
 lCfxkhnK0nRXC/tho=; b=fV3qt1eGqQIuq2Ftab5inX+Lr6UDMH8JYxWJhjoJau
 aqfT7040cafPdEKuCaFGfGyZBTEiHmM/XBrnMP9EMQKvoEEo/AW0ICe5RYpsfc+0
 YAjK5BH/K8LTX6QLRTY1NI6TOWpvJDe++6YtXYqKBfsAHLFZmbAuZRCgtdDf+5ev
 SgyRcItio8oBuJqQaYuQanrDH3dW5vE7HGrY9vQ3zaOluqGAdvNVChrAQETzz91h
 VSdRioOhEaMfc4YB3MSpifav/Swf/nS8jp2r10RfK7Erwja0M4A7ptqZLvgXy12S
 8RIh7VtUX3WVfXCQ9soZ50bqbm0bGHe9PPy3U5HdxFiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QeBI3eGw009zrELtw
 Q+M7K5WLXlCfxkhnK0nRXC/tho=; b=uCEi9KZUj/6IhNN84gQgoe6JqNHfu5iZ+
 /0lqj3h2iaV+9l7TIW0EwDvCQdKoa7gD3BgkRWpbf0Bl2LwphwD36SS532rPk5GF
 u24sO5yWUmB6CMcL21T3hg9Wz7/IwOsRImXAxN2fry4y/rAaKDVBhir42wkTCB1e
 eFDso9TfwK4zr5LOiAz4KTwYPWveaLm/gxo0FT/mUYcPnZIKvdTGW0Lb4N6k0Qi1
 LZGHtb0/D1WzGb4xvVs7A0YXb2ic2rMQrC9ne7Wl2azQ5HnucbDS65vxsfs1RT+E
 vwk/s3YIpSASS7LsBwynLx6+EAcdjKy2yQPtuwwqggaNEsg8ZPJHw==
X-ME-Sender: <xms:-LflYDsmmjUkdtH6UV2lBBGW2itqckX55K-jj9TLvVLZQs22UZiD2A>
 <xme:-LflYEdlVQGP1A62IlL_zaKgcGPup6GormmHlRRutvB0bg2_06EZiPwrlelY8gUSl
 Uudzm0uGA2XVG9pJg0>
X-ME-Received: <xmr:-LflYGxBLjFc4YLQqMp3qIV8Yn6jh9dvQIKKGQPFqN5ISMn1MlvOpCUnnlC580Xj6AoLCdGxd6ChN7gT4um-BTeEMD1RqY-wMQxx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-LflYCNP7LszrsCwJEG2gOD2M6uybNCpixld43Uzx1IUxFy8zaFrJw>
 <xmx:-LflYD_oPt0Q6HEnxq48x5ZvOTc8hAB5C1PukteM0yWH8JA2LaAIuw>
 <xmx:-LflYCUZbPXXZX0j703b7S3uGUQpkD9V-sX4nb7OTByLMo4lQkAHgA>
 <xmx:-rflYCW__qs9nmvVd1hZ3CqJvwQ9KtqTDZCkLECTJHLivvX3pSkJ1g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 10:19:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/vc4: hdmi: Remove drm_encoder->crtc usage
Date: Wed,  7 Jul 2021 16:19:30 +0200
Message-Id: <20210707141930.1811128-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_encoder crtc pointer isn't really fit for an atomic driver,
let's rely on the connector state instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 39 ++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index aab1b36ceb3c..dbd762f41cad 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -435,7 +435,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_connector_state *cstate = connector->state;
-	struct drm_crtc *crtc = encoder->crtc;
+	struct drm_crtc *crtc = cstate->crtc;
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	union hdmi_infoframe frame;
 	int ret;
@@ -545,8 +545,11 @@ static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
 
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
@@ -567,17 +570,18 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
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
@@ -898,7 +902,9 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
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
@@ -983,7 +989,11 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
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
 
@@ -1006,7 +1016,11 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
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
@@ -1192,8 +1206,8 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi)
 
 static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
-	struct drm_crtc *crtc = encoder->crtc;
+	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_crtc *crtc = connector->state->crtc;
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	u32 samplerate = vc4_hdmi->audio.samplerate;
 	u32 n, cts;
@@ -1228,7 +1242,6 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	int ret;
 
@@ -1241,7 +1254,7 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
 	 * If the HDMI encoder hasn't probed, or the encoder is
 	 * currently in DVI mode, treat the codec dai as missing.
 	 */
-	if (!encoder->crtc || !(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
+	if (!connector->state || !(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
 				VC4_HDMI_RAM_PACKET_ENABLE))
 		return -ENODEV;
 
-- 
2.31.1

