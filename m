Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ECF2DBD11
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167A76E039;
	Wed, 16 Dec 2020 08:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFF86E3FE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 15:42:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 1495F61F;
 Tue, 15 Dec 2020 10:42:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 15 Dec 2020 10:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=bOY+sSC7VBBNP
 GNYaDSVhyFAh5vJSnEfCCmAHQg74SU=; b=Ae5AmQsL0vZORKEhuI/WK4oxF9jVk
 WlGuT5Z4RNUIlvTX0CTQkLDK9+eDXao7oaBnfDmKBQ0+4wCvfn0BVQqwM3kVfGiQ
 +xUQpUxBtHcqSzWAt7S1qMxtlu2QHAOCIZSRRP9yOSItGRRlSodxp9gZqLNcIWYB
 fBcp4EDp2r4S1u7NvhxbMz1EKI/A6e4mYT3DDIpr+/KryH7uoH6QLGy896OCb4Q6
 IjqbwkrIswvilzok2eLsB482gjRVlcpbl/b/uw8dtmIdKEE8VfBqG9cBckdoAJ/D
 gS8g4FJNqILFkAYqy5GvN4EsbXfzqmNZM5Wu4N3/XoLFRErQrtMhviv2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=bOY+sSC7VBBNPGNYaDSVhyFAh5vJSnEfCCmAHQg74SU=; b=U6cgPbWZ
 SDP1iD41vWinJnbODcjkeTbxb3AnvI3Go3ujqCbJO8+zucitMF1uAnz6+ZrdhLae
 sUEHTCYpDhKK/tCNUHzbq4Lb1W2UeLVvgPxpH/TdTJJwTmN5eggmKnbt3OQuvvHw
 olwdKDj6gDUmCXMQ/Od+Aa7/duxsvn8JfUCDW36AxvP9tkCaA/5a+qqiruGHsndF
 vVVpqfLZb+lda+QM9nqDiHyd7pufEHkzoVMNfg7bepn3iP4qSFwU1N8Jse+vLmZy
 HECAt+8n+/WM0hzyRZwnbzOUR5y1WDBd7ymd9OA1DMBF6s7NPNRXhFN7l5ghf2If
 N2almrYrf8GHbA==
X-ME-Sender: <xms:d9nYX7zseCmiQpt4x3jnaDLEaUYgFcH1depcjyNy0RcVeVOH-y931A>
 <xme:d9nYXzTQc9r_ZgrD_Mmdf_dU6UvX36-OsA5IVg2Z1suO4p5DHCpHzi_rfDfZkP98j
 bxAqJshlC5MP4L9gBk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:d9nYX1W2rg_tsAjlWPMS6blLMqQlAIwkbY3EY3LTZ_EhC010gLxT2Q>
 <xmx:d9nYX1hsc7aATx9K1Y2lzrY536VBpb8xiGX0HK9tWNP2DNgbqoykbA>
 <xmx:d9nYX9D138-6DyWe016njvQmRLJ6HdVM-C2K9RueOllfU5TaE2S77w>
 <xmx:eNnYXx3e-w7RjHunItpJV27pjc2JEA3JzRmXVEPhTSJWD4RP3C4dt2pnMiY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D8AC124005D;
 Tue, 15 Dec 2020 10:42:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v7 1/9] drm/vc4: hvs: Align the HVS atomic hooks to the new API
Date: Tue, 15 Dec 2020 16:42:35 +0100
Message-Id: <20201215154243.540115-2-maxime@cerno.tech>
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

Since the CRTC setup in vc4 is split between the PixelValves/TXP and the
HVS, only the PV/TXP atomic hooks were updated in the previous commits, but
it makes sense to update the HVS ones too.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  6 ++----
 drivers/gpu/drm/vc4/vc4_drv.h  |  9 ++++-----
 drivers/gpu/drm/vc4/vc4_hvs.c  | 18 ++++++++++--------
 drivers/gpu/drm/vc4/vc4_txp.c  | 10 +++-------
 4 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index ee4f657a5ce0..95b2dd9d7a38 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -503,8 +503,6 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
-									 crtc);
 	struct drm_device *dev = crtc->dev;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
@@ -517,7 +515,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	 */
 	drm_crtc_vblank_on(crtc);
 
-	vc4_hvs_atomic_enable(crtc, old_state);
+	vc4_hvs_atomic_enable(crtc, state);
 
 	if (vc4_encoder->pre_crtc_configure)
 		vc4_encoder->pre_crtc_configure(encoder);
@@ -593,7 +591,7 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 	struct drm_connector_state *conn_state;
 	int ret, i;
 
-	ret = vc4_hvs_atomic_check(crtc, crtc_state);
+	ret = vc4_hvs_atomic_check(crtc, state);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 6db4c944ecba..5a115bc62cc8 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -913,11 +913,10 @@ void vc4_irq_reset(struct drm_device *dev);
 extern struct platform_driver vc4_hvs_driver;
 void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int output);
 int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int output);
-int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state);
-void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
-void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
-void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
-			  struct drm_atomic_state *state);
+int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state);
+void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state);
+void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state);
+void vc4_hvs_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_dump_state(struct drm_device *dev);
 void vc4_hvs_unmask_underrun(struct drm_device *dev, int channel);
 void vc4_hvs_mask_underrun(struct drm_device *dev, int channel);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index cccd341e5d67..2b3a597fa65f 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -326,10 +326,10 @@ void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int chan)
 		     SCALER_DISPSTATX_EMPTY);
 }
 
-int vc4_hvs_atomic_check(struct drm_crtc *crtc,
-			 struct drm_crtc_state *state)
+int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(state);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_plane *plane;
@@ -341,10 +341,10 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc,
 	/* The pixelvalve can only feed one encoder (and encoders are
 	 * 1:1 with connectors.)
 	 */
-	if (hweight32(state->connector_mask) > 1)
+	if (hweight32(crtc_state->connector_mask) > 1)
 		return -EINVAL;
 
-	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, state)
+	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, crtc_state)
 		dlist_count += vc4_plane_dlist_size(plane_state);
 
 	dlist_count++; /* Account for SCALER_CTL0_END. */
@@ -391,11 +391,12 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 }
 
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
-			   struct drm_crtc_state *old_state)
+			   struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(new_crtc_state);
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	bool oneshot = vc4_state->feed_txp;
 
@@ -404,9 +405,10 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 }
 
 void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
-			    struct drm_crtc_state *old_state)
+			    struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state, crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(old_state);
 	unsigned int chan = vc4_state->assigned_channel;
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 8aa5220885f4..0f4e7bee4255 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -395,7 +395,7 @@ static int vc4_txp_atomic_check(struct drm_crtc *crtc,
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
 	int ret;
 
-	ret = vc4_hvs_atomic_check(crtc, crtc_state);
+	ret = vc4_hvs_atomic_check(crtc, state);
 	if (ret)
 		return ret;
 
@@ -408,23 +408,19 @@ static int vc4_txp_atomic_check(struct drm_crtc *crtc,
 static void vc4_txp_atomic_enable(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
-									 crtc);
 	drm_crtc_vblank_on(crtc);
-	vc4_hvs_atomic_enable(crtc, old_state);
+	vc4_hvs_atomic_enable(crtc, state);
 }
 
 static void vc4_txp_atomic_disable(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
-									 crtc);
 	struct drm_device *dev = crtc->dev;
 
 	/* Disable vblank irq handling before crtc is disabled. */
 	drm_crtc_vblank_off(crtc);
 
-	vc4_hvs_atomic_disable(crtc, old_state);
+	vc4_hvs_atomic_disable(crtc, state);
 
 	/*
 	 * Make sure we issue a vblank event after disabling the CRTC if
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
