Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F689278129
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E806EC0E;
	Fri, 25 Sep 2020 07:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7F86EB30
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 15:31:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E72CBD43;
 Thu, 24 Sep 2020 11:31:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 24 Sep 2020 11:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=e8+ZHL0Yggv5u
 5R0ibzPYbHV/tGomMr0mo7KRoAkb0A=; b=YXDwNlDinBBLQjFiqr/jJJDm1qBIG
 7+nGkITiC65jrqpyX1Tio+cL8CILtKco05Q9Ve2yFaDMQ2zUVxSUJt++GOAwstSl
 M2h8tbOI34OEcMYwxH15xKrerIskWQW1XZYQcl1ZpqXEWcFu5UVv4qFcvQZAJPP7
 qAqinNJr0vJ08B1uaHHIlUnDnEpBw2B41vWKy50C9A9aaewBK6SWX8kYJEUFgbNf
 rKDq4hQ+MndUd39LN9Q2qh8AO++JHs1/Km6B9focvNLd5LByDbAA5SIEm5E7KFOt
 yXE7tRoJfHTGVOHoR7h6PieiqFUXFneBw8ZZL+G4prO1d2WjNEHq7WsMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=e8+ZHL0Yggv5u5R0ibzPYbHV/tGomMr0mo7KRoAkb0A=; b=eNfpsRfk
 TBdK4P9DjmMZgFy6aOfKtfMv6Nqz9ZsWwBVkuHVWJEkS/tmBtRM99qIoNhHRWODr
 1t63v2ks8O1RnPIPwZN2KNEzY+v78Uq16m1rKRJ+gAf9aZsIJ9xcUr0iOhiumxb2
 BvnaZv+pbm2smIAGiWSUkZYY+8nzzhXGciGecXWBwZ31X7VTF4raJEgGuDNUKsGJ
 P0dOHeGkvjFgY89e/pogCJMppeeC9p13DGMkN7LWPc3H4W7hbEfINAtcuLbD6gg9
 Tv6HVtIWCJ+YVtFeW2Ev0miU4/H0+1FQfoPrw/Ytyig0+xVju8ze/zzLdhMbIoB2
 5hX4/wlH9uQYVQ==
X-ME-Sender: <xms:v7tsX6yQHlOkXYFRO0EwLGkNbnzcBMxxVzcC_ubYZxh8qdBxXbw8iA>
 <xme:v7tsX2Q9hKgUUOB2x1sarxrouvjg07rOXoh7cSS6r8P34dmsMv3wjibfERx4Rdh4C
 pD1qor7LwUsJ7qCZw8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeegnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:v7tsX8VTBtepbex_0UFhdAIsCrTJrC5j5dJdUQXEh54QItWv7lWu1g>
 <xmx:v7tsXwgVdJFV_8y9voocO58XM-8KydvUBHrZ8NTJFWtU2LQPHA6GBg>
 <xmx:v7tsX8Do9cjSJE3ficfhHazyOwtJ98WHfXNkPBI9KmQlfyril_1MHg>
 <xmx:v7tsXw4rqPnA_nL5Mx1uXbce_10WSv8KsmLKdkWzC-rIpwRIQWMGMUKzqXk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0B3C33064680;
 Thu, 24 Sep 2020 11:31:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 5/6] drm/vc4: hdmi: Store pixel frequency in the connector
 state
Date: Thu, 24 Sep 2020 17:31:00 +0200
Message-Id: <4f9b30af834245e9398b5e60ec72d9e055a1707b.1600961400.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.0400f261220da59b7ef16523e267aeaa5e06b648.1600961400.git-series.maxime@cerno.tech>
References: <cover.0400f261220da59b7ef16523e267aeaa5e06b648.1600961400.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 44 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5e4ebb51a750..21d20c8494e8 100644
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
@@ -788,6 +809,26 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 {
 }
 
+static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
+					 struct drm_crtc_state *crtc_state,
+					 struct drm_connector_state *conn_state)
+{
+	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	unsigned long long pixel_rate = mode->clock * 1000;
+
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		pixel_rate *= 2;
+
+	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
+		return -EINVAL;
+
+	vc4_state->pixel_rate = pixel_rate;
+
+	return 0;
+}
+
 static enum drm_mode_status
 vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
@@ -801,6 +842,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
+	.atomic_check = vc4_hdmi_encoder_atomic_check,
 	.mode_valid = vc4_hdmi_encoder_mode_valid,
 	.disable = vc4_hdmi_encoder_disable,
 	.enable = vc4_hdmi_encoder_enable,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index d53d9fd88bfe..dbe2393ae043 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -171,6 +171,7 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 
 struct vc4_hdmi_connector_state {
 	struct drm_connector_state	base;
+	unsigned long long		pixel_rate;
 };
 
 static inline struct vc4_hdmi_connector_state *
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
