Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDA92CB6D1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4556A6EA44;
	Wed,  2 Dec 2020 08:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD176E52F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 13:12:57 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3695B5805CE;
 Tue,  1 Dec 2020 08:12:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 01 Dec 2020 08:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=sLoTsxGPo0S/M
 5tEsjlrORiNbeAbKZUiy9QTJphBuDI=; b=JZmeIdoA1310CmUwcfuq6fm8VytO0
 j81VoRkdS1ZdeL6117na0zT+JJ86eoEScX/r3KJMgtBjq4v3xyYZTwOsalQFvetv
 +d8Tq+mKdxuh/GD0yc7GIytH7Uprt+ThJIp7ffpkKyJpogSwNtkIHzYQAKK6loYb
 2SJec3CeA7jpIEUMvzou66IT2RZHV88dGrOwzlPmpEARxSkD0YJ38gI1b9m1XNsd
 kix25CHedRzaR44dhqYDs0SYBc+02xRmzVQ4NOt65PALlKmK9KT/olOqkg1gE+hf
 6QVuVAaHG0R79fKKd0t1E2CxhpEuuFuK9MWbj6kz+M+2aU4WmuyFz3MHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=sLoTsxGPo0S/M5tEsjlrORiNbeAbKZUiy9QTJphBuDI=; b=MgFI91rh
 E6h2ByR/DKbKWykgnC6UiSQ++6XrLPaJXM3/qxr8w+XqfvB/1ELwvh3SCiOY4pw/
 sgoGJOUy5LIhaHqv0crsCufZt0/rgjvg1teRJYhDddhCmT+vN25vDfursRpqNL5b
 bmQ0mLxIh+joayqP9XYp/e/6LF+cJzcU6rXO9nt+IebrOK+2CB3WMtf4/cTnITE3
 KH9aWPuVwor3ISDEoFt5k+1+5Kb6eZ/H2w7aSOvFmPTSy/i9EQ6DAZepQ7WfgKqO
 l+X+RmkMkmZYXIc/ZuE6yQw+UeU75xj4jMrHeVKQs1J3bRTnrUqkVfnYOjdKe4OO
 selebi1ZS4CH4A==
X-ME-Sender: <xms:WEHGX5eOCfTbli8-aMAmU6lTbDfznGLO1wQIB80wMymT7DiRIT1Sug>
 <xme:WEHGX3N8VyssEEr-BA0agYHRoCJqMGJzDhINUXUmiXG_ZgTpEsRq8si9rjJ1rZoB5
 F0Qu_P_wd97w0v1PFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WEHGXyinc3k706HQi1CbjoHZRQeiVb0qP3DwPavUZ5IopMkia0MKJA>
 <xmx:WEHGXy-IL6xIJVveRt9z8sDC-TiSRBbZdJ31FmyMQl8iEckTTjf0yA>
 <xmx:WEHGX1v6Lo6a-ETSQBu6E8ZT4AQICrTqlSuPW-bmvV6b54Q-ymz-tA>
 <xmx:WUHGX7CperMf7m96XkAy1KoIbDU-2qvUxm570yk1IBPlb1dN94XQfg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A4D0D108005B;
 Tue,  1 Dec 2020 08:12:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 4/7] drm/vc4: hdmi: Store pixel frequency in the connector
 state
Date: Tue,  1 Dec 2020 14:12:46 +0100
Message-Id: <20201201131249.438273-5-maxime@cerno.tech>
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
index 9fb7a77c86e8..61baf3c39d43 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -192,6 +192,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 	if (!new_state)
 		return NULL;
 
+	new_state->pixel_rate = vc4_state->pixel_rate;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	return &new_state->base;
@@ -609,9 +610,29 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
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
@@ -623,7 +644,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		return;
 	}
 
-	pixel_rate = mode->clock * 1000 * ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1);
+	pixel_rate = vc4_conn_state->pixel_rate;
 	ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
@@ -795,6 +816,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
 {
+	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long long pixel_rate = mode->clock * 1000;
@@ -822,6 +844,8 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
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
