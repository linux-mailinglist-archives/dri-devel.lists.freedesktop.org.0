Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B183BE4A3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 10:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2AE6E849;
	Wed,  7 Jul 2021 08:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88C06E849
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 08:48:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 79B192B00945;
 Wed,  7 Jul 2021 04:48:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Jul 2021 04:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ylBfC59buHvrN
 A7vQx7pQlbEfIpO6A7a7nF+fVnD5G4=; b=fkgBlU1sEBua4971yfAkXLoU2Wa7F
 EK9QQ/yWMjXbbsIub738LJwbj6octBuxYjTMhYjc+E+vjCq1kbMDGx8anmAUs7Ug
 kGW7Cw91h0ouNuZ3UlgOOxzji5evOWKAJVfgv2ei+6Cq/WQnP1EhXH8QnoxrmxDN
 SujvI7xq5w3U9sMDbaeVFP0hgW7rdn1LtcksGgBaoW/R7Z9es09a8M1OhgrD8IVU
 EEVYqFnXrz+83BLkwyAvze9xAHMJcTbnfdP5OT/NsbiLq2VORIb49uteE/n6/rdx
 h63NnMDe0OrKD2XNJj8MlIs0273iDxVndDqnfYmBw3CXNWGVpM5sUvcMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ylBfC59buHvrNA7vQx7pQlbEfIpO6A7a7nF+fVnD5G4=; b=bb4DlxFl
 7OGMneEbTN8D7S/4m9wUnoxlIHsBSljG/NmJtCNwRDRzzvp22yOcQS5aPEU8Hdw6
 pWRF/sdN2RRLEKfgwdkgA3tlbCCeOIQj9ZY3WhIk1KNF9DawhgXDuhGDZaxoHzWU
 Tsl1lbEepYuvaQljGBcUSg0b3ueL2f9l39hUd+n/mZEeEKHoQSSwKqOFIT6RhiPc
 7MrmlI6n6Z0LdS6G/v+x+iPxlHNLYpefS/sQ+Sm0lmqf/wBqhEvmGcwIcWE0AM9s
 GXol28PtfjlNVJtpCDpNst99MG4lnndLz/CDNdaXRuTUlFo4pHK7kOuewx0OWkKV
 Jb13/paw2CfU9A==
X-ME-Sender: <xms:W2rlYGuTi3ONvfHWJS1TXqDmb1exxLwYyJsqsrbQATBm9-_80Rd6mw>
 <xme:W2rlYLcCepFtds5rp-fBrIXbFvvfXSrYUvixL4NQuKr1hUllGUXMK8q4Ke12qWDfO
 Efv57JkkpV_Jy0w_cE>
X-ME-Received: <xmr:W2rlYBzqd7nyAw114XjzN3fxW3SaNpxYrbv76KinK-UcVols4ik044hTG27LY_DOAdL27y9ax9MJkKgH2EaP1qsI84PJiLciE2EN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:W2rlYBNCFxNma1YegiKNPkvve0N_mWy4J2QO3gDDO3Swe90GFAeWbQ>
 <xmx:W2rlYG_4C6aNXuY8wJ-RHrUYOvyoVqij0d7shXxyDbt6dsD4ds9XQg>
 <xmx:W2rlYJUdhz3J7s4wB2oXLPh7GuSA0EhCgGWelztJsyjTVQ3Sy7qdBQ>
 <xmx:W2rlYKXSXl2yUN4U5uzsDFBN0LQddLROMJDZzTTd2r3yPNj90BJaswKyCKs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 04:48:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 10/10] drm/vc4: Increase the core clock based on HVS load
Date: Wed,  7 Jul 2021 10:47:45 +0200
Message-Id: <20210707084745.1365390-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707084745.1365390-1-maxime@cerno.tech>
References: <20210707084745.1365390-1-maxime@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Emma Anholt <emma@anholt.net>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Depending on a given HVS output (HVS to PixelValves) and input (planes
attached to a channel) load, the HVS needs for the core clock to be
raised above its boot time default.

Failing to do so will result in a vblank timeout and a stalled display
pipeline.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  15 +++++
 drivers/gpu/drm/vc4/vc4_drv.h  |   3 +
 drivers/gpu/drm/vc4/vc4_kms.c  | 110 ++++++++++++++++++++++++++++++---
 3 files changed, 119 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 073b7e528175..c733b2091d3c 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -642,12 +642,27 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
 	struct drm_connector *conn;
 	struct drm_connector_state *conn_state;
+	struct drm_encoder *encoder;
 	int ret, i;
 
 	ret = vc4_hvs_atomic_check(crtc, state);
 	if (ret)
 		return ret;
 
+	encoder = vc4_get_crtc_encoder(crtc, crtc_state);
+	if (encoder) {
+		const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+		struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
+
+		mode = &crtc_state->adjusted_mode;
+		if (vc4_encoder->type == VC4_ENCODER_TYPE_HDMI0) {
+			vc4_state->hvs_load = max(mode->clock * mode->hdisplay / mode->htotal + 1000,
+						  mode->clock * 9 / 10) * 1000;
+		} else {
+			vc4_state->hvs_load = mode->clock * 1000;
+		}
+	}
+
 	for_each_new_connector_in_state(state, conn, conn_state,
 					i) {
 		if (conn_state->crtc != crtc)
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index ac8021639d03..08e3a055f7f6 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -319,6 +319,7 @@ struct vc4_hvs {
 	u32 __iomem *dlist;
 
 	struct clk *core_clk;
+	struct clk_request *core_req;
 
 	/* Memory manager for CRTCs to allocate space in the display
 	 * list.  Units are dwords.
@@ -530,6 +531,8 @@ struct vc4_crtc_state {
 		unsigned int bottom;
 	} margins;
 
+	unsigned long hvs_load;
+
 	/* Transitional state below, only valid during atomic commits */
 	bool update_muxing;
 };
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index d6b707711f58..e443cfbe3049 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -39,9 +39,11 @@ static struct vc4_ctm_state *to_vc4_ctm_state(struct drm_private_state *priv)
 
 struct vc4_hvs_state {
 	struct drm_private_state base;
+	unsigned long core_clock_rate;
 
 	struct {
 		unsigned in_use: 1;
+		unsigned long fifo_load;
 		struct drm_crtc_commit *pending_commit;
 	} fifo_state[HVS_NUM_CHANNELS];
 };
@@ -339,10 +341,19 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_state *new_crtc_state;
+	struct vc4_hvs_state *new_hvs_state;
 	struct drm_crtc *crtc;
 	struct vc4_hvs_state *old_hvs_state;
 	int i;
 
+	old_hvs_state = vc4_hvs_get_old_global_state(state);
+	if (WARN_ON(!old_hvs_state))
+		return;
+
+	new_hvs_state = vc4_hvs_get_new_global_state(state);
+	if (WARN_ON(!new_hvs_state))
+		return;
+
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 		struct vc4_crtc_state *vc4_crtc_state;
 
@@ -353,12 +364,13 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		vc4_hvs_mask_underrun(dev, vc4_crtc_state->assigned_channel);
 	}
 
-	if (vc4->hvs->hvs5)
-		clk_set_min_rate(hvs->core_clk, 500000000);
+	if (vc4->hvs->hvs5) {
+		unsigned long core_rate = max_t(unsigned long,
+						500000000,
+						new_hvs_state->core_clock_rate);
 
-	old_hvs_state = vc4_hvs_get_old_global_state(state);
-	if (!old_hvs_state)
-		return;
+		clk_set_min_rate(hvs->core_clk, core_rate);
+	}
 
 	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
 		struct vc4_crtc_state *vc4_crtc_state =
@@ -398,8 +410,12 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 
 	drm_atomic_helper_cleanup_planes(dev, state);
 
-	if (vc4->hvs->hvs5)
-		clk_set_min_rate(hvs->core_clk, 0);
+	if (vc4->hvs->hvs5) {
+		drm_dbg(dev, "Running the core clock at %lu Hz\n",
+			new_hvs_state->core_clock_rate);
+
+		clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate);
+	}
 }
 
 static int vc4_atomic_commit_setup(struct drm_atomic_state *state)
@@ -656,9 +672,9 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
 
 	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
 
-
 	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
 		state->fifo_state[i].in_use = old_state->fifo_state[i].in_use;
+		state->fifo_state[i].fifo_load = old_state->fifo_state[i].fifo_load;
 
 		if (!old_state->fifo_state[i].pending_commit)
 			continue;
@@ -667,6 +683,8 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
 			drm_crtc_commit_get(old_state->fifo_state[i].pending_commit);
 	}
 
+	state->core_clock_rate = old_state->core_clock_rate;
+
 	return &state->base;
 }
 
@@ -821,6 +839,76 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 	return 0;
 }
 
+static int
+vc4_core_clock_atomic_check(struct drm_atomic_state *state)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
+	struct drm_private_state *priv_state;
+	struct vc4_hvs_state *hvs_new_state;
+	struct vc4_load_tracker_state *load_state;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int num_outputs;
+	unsigned long pixel_rate;
+	unsigned long cob_rate;
+	unsigned int i;
+
+	priv_state = drm_atomic_get_private_obj_state(state,
+						      &vc4->load_tracker);
+	if (IS_ERR(priv_state))
+		return PTR_ERR(priv_state);
+
+	load_state = to_vc4_load_tracker_state(priv_state);
+
+	hvs_new_state = vc4_hvs_get_global_state(state);
+	if (!hvs_new_state)
+		return -EINVAL;
+
+	for_each_oldnew_crtc_in_state(state, crtc,
+				      old_crtc_state,
+				      new_crtc_state,
+				      i) {
+		if (old_crtc_state->active) {
+			struct vc4_crtc_state *old_vc4_state =
+				to_vc4_crtc_state(old_crtc_state);
+			unsigned int channel = old_vc4_state->assigned_channel;
+
+			hvs_new_state->fifo_state[channel].fifo_load = 0;
+		}
+
+		if (new_crtc_state->active) {
+			struct vc4_crtc_state *new_vc4_state =
+				to_vc4_crtc_state(new_crtc_state);
+			unsigned int channel = new_vc4_state->assigned_channel;
+
+			hvs_new_state->fifo_state[channel].fifo_load =
+				new_vc4_state->hvs_load;
+		}
+	}
+
+	cob_rate = 0;
+	num_outputs = 0;
+	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
+		if (!hvs_new_state->fifo_state[i].in_use)
+			continue;
+
+		num_outputs++;
+		cob_rate += hvs_new_state->fifo_state[i].fifo_load;
+	}
+
+	pixel_rate = load_state->hvs_load;
+	if (num_outputs > 1) {
+		pixel_rate = (pixel_rate * 40) / 100;
+	} else {
+		pixel_rate = (pixel_rate * 60) / 100;
+	}
+
+	hvs_new_state->core_clock_rate = max(cob_rate, pixel_rate);
+
+	return 0;
+}
+
+
 static int
 vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 {
@@ -838,7 +926,11 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 	if (ret)
 		return ret;
 
-	return vc4_load_tracker_atomic_check(state);
+	ret = vc4_load_tracker_atomic_check(state);
+	if (ret)
+		return ret;
+
+	return vc4_core_clock_atomic_check(state);
 }
 
 static struct drm_mode_config_helper_funcs vc4_mode_config_helpers = {
-- 
2.31.1

