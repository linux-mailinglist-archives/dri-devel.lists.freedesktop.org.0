Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A11455935
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E116EA21;
	Thu, 18 Nov 2021 10:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D366E9DF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3A9CB580912;
 Thu, 18 Nov 2021 05:38:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 18 Nov 2021 05:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=i8f9a2Tvng0L5
 lsExcAfmnFZq2JnhYVXK1NBvQdzZws=; b=fMsZMQgzAW1YDsd3S9XM/vqzjEjrG
 eA5TciycOZdBuvvJN3iUu0lkWQHztzuxPo3Y3Tkskl5U3IKdWAHEWf+OG1nXA6zP
 iNVMAcAAX+C1bLoViYEXFGADm57yZDr5LIeOCZLFfptytaM/AMSGapKEqdK4vjKH
 Ga0HtFL2f9YnNEHE9SCqJN+5Bq2whLa0boCE4p2e8EscAPTfopmgn7A9blqP5+4h
 MqbmknAb8ZIjHsUMNfssW1KCMu8DhVUXO802W7VVIjALPFZ3KkbFfGHv8FeTk2SF
 SXbT6m2A2YKoqv/XQbWh4TBzsDgBCoP0WIgNXOx911wpDe2siN3Vgo9Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=i8f9a2Tvng0L5lsExcAfmnFZq2JnhYVXK1NBvQdzZws=; b=ll6j2Wgz
 /AFCkVVjpvKrCshJ5iyZM1XpzRRBte5uAdEpQjPKxfXSNJYQxpzMR0CIS7lqg0Ft
 Y7oCWenykvgNoVIMALem+EQOQRhJ7HpAF6mG6MgPRvDFHO+gs4uImS2EYyYoDx3T
 AE/rd8cmu0ktyDQ4pf81zgJTe5a9JpYOIih3MccQPPKGkzpEviNgKmZLLN0MmS+p
 gKAv11QCbPL8wk1tlP/oTrLhy7pFEK58gdld3dJlmXs6HgUrLo4FxE9G5S9ps56S
 W0e/raD2gQAV5CvEyD2v4tu1eB2dZMkVNbn944XRZgRFnGnt+1C0f3dTpfR8Nvlw
 br+4P+JKumLbdw==
X-ME-Sender: <xms:JS2WYUU3tJ0RfMB8YIASGW_V-vPBdJR6QAoOty4pZ9eg69XbIsoBBw>
 <xme:JS2WYYmi9SD-bjH1KRL7rpn29nglGZVCGBFsMaFJ6UL9kvOwHwNlLhgYxjXpZoxZe
 w7pXHhnR51nUKJ_2iA>
X-ME-Received: <xmr:JS2WYYaiSVSGhBU2aQt08CC8HqnCG8IZ9HTQfXbMF1qwFTpvaZh50uQAZkvjP-tfiOCSl-iLGrQlevluvYJuNW-8B3kcEzH3gOTLUGb2e4Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JS2WYTUDylep6IrmcPf9mhS00TrrcpIQVgL7lN263ET6AWqf0m9P7w>
 <xmx:JS2WYem_BAe9F3cbasnvKc8FkJY9frrtp12ICogDy0yWK_MNKa2sEQ>
 <xmx:JS2WYYeoI7sj3YLihrwPTTtwWM13UzrhcqmqW39vJXVEdIbtYjBw0Q>
 <xmx:JS2WYThbak-EQGbQaHJ_U-jfuPun5DNTozwAv0ZqN3eWisuyezLIEg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:28 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 05/13] drm/vc4: hdmi: Constify drm_display_mode
Date: Thu, 18 Nov 2021 11:38:06 +0100
Message-Id: <20211118103814.524670-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118103814.524670-1-maxime@cerno.tech>
References: <20211118103814.524670-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 16 ++++++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 053fbaf765ca..b00fedb5b880 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -260,7 +260,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 
 	if (vc4_hdmi->disable_4kp60) {
 		struct drm_device *drm = connector->dev;
-		struct drm_display_mode *mode;
+		const struct drm_display_mode *mode;
 
 		list_for_each_entry(mode, &connector->probed_modes, head) {
 			if (vc4_hdmi_mode_needs_scrambling(mode)) {
@@ -574,7 +574,7 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 }
 
 static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
-					 struct drm_display_mode *mode)
+					 const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
@@ -597,7 +597,7 @@ static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long flags;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
@@ -812,7 +812,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 
 static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
-				 struct drm_display_mode *mode)
+				 const struct drm_display_mode *mode)
 {
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
@@ -863,7 +863,7 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 
 static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
-				 struct drm_display_mode *mode)
+				 const struct drm_display_mode *mode)
 {
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
@@ -1010,7 +1010,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	struct vc4_hdmi_connector_state *vc4_conn_state =
 		conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long pixel_rate = vc4_conn_state->pixel_rate;
 	unsigned long bvb_rate, hsm_rate;
 	unsigned long flags;
@@ -1113,7 +1113,7 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 					     struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	unsigned long flags;
 
@@ -1143,7 +1143,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 					      struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 36c0b082a43b..e6562bfa6fae 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -82,7 +82,7 @@ struct vc4_hdmi_variant {
 	/* Callback to configure the video timings in the HDMI block */
 	void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
 			    struct drm_connector_state *state,
-			    struct drm_display_mode *mode);
+			    const struct drm_display_mode *mode);
 
 	/* Callback to initialize the PHY according to the connector state */
 	void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
-- 
2.33.1

