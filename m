Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B4439A84
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CC46E113;
	Mon, 25 Oct 2021 15:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213086E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:29:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6B0F75806D9;
 Mon, 25 Oct 2021 11:29:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 25 Oct 2021 11:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=mp6cz8UQwSXIu
 9XzMAUzRz14RPXoQ+fUCMUWKoQ0dEE=; b=FvGulLlKF/p1j/ffhSoyilciPsdFz
 3vtPYWe9hBIXStZCVkOqEyJxjZCi5GAcbaNZY4TdpUvuSCUurEmELqdAV1XsX2aW
 etlLMB+bU9ss9JGzDvEbwdONyhlMQLQ3kmFVnUM6ANMzQvrf1pXyKRgRHAbeQipX
 TS7xeLb1OqLbVtgWWR82MGBDx2KDjd2Z6QUdzONE7VYVChw5zbWkdLdT1mstgEZ0
 FbBHM5E661+Hb1L/3hnHyEbYIcteDz7T8MUIQXfl/ja+zOUdiXuQ+xjn7jX55Ku6
 QFapUQbBpEbpwjezZujRZ3D4PKPwHTjgsq5W/I4zRFE7rFkgyaXgxb2cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=mp6cz8UQwSXIu9XzMAUzRz14RPXoQ+fUCMUWKoQ0dEE=; b=ZlZYaGhH
 8BfOPmB171iJg6nSFWjKuKsZ08Uhht62py+11uwWsEfhAEt2u4IY5rYo5vpaXV4x
 y0WglrWII8eJaGe3f+LsGsVIKf9RDwkzKOa0h1yGffbr/QIc0bfWxxCAGgfu3RIM
 yFxGf8aFyWXTlkXa4Y+F3KVctvnv1kvbUGMOfv3TXN59sWk6rqpOammkq/XABCD3
 L4uNCoVPx98ZOY0GMMMPfPZbqgUJj/2kRLCviOvNotw3rSmF84zQmuLjZVwXwYG2
 Bk1/+tKyh1OnpaCnsc8ORJpAPKY89+n7Bdcnkb8qi2hMP3zIGSmdpeZVCqr0tucY
 tAJk+dx7xQ0dPw==
X-ME-Sender: <xms:WM12Yeo2itTRJOd94pQXVPVT0bQHtVUrLO8wEfTihjg1T66kSJWztQ>
 <xme:WM12Ycq53X9OInMrPMY-th7OD2bcZavn_C5NJcu84RBia5CUvH8EaCGtPY7ixYDnu
 ptIACoL2sYYbpF3MZE>
X-ME-Received: <xmr:WM12YTPv6w8sr6GVXTIRMzqXRz8VyrDhYwnQXS6w64QtFYLHOKF_CWQeV26O2fIdNxzDe9vtQInYGig0Pmar_YHhdDjNHAv7D1lG_Uoi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WM12Yd4WRMLccbl40e6AcwWn7lNvIoq7O6mQOqL-E4ca1I4QFHhdzA>
 <xmx:WM12Yd70dLiXt5L0I67CusYcZ_xVkDiYRJn_EpAXOvHrSGbDRj-e_w>
 <xmx:WM12YdhSWl8M00vBZzKbSewZ7wL9oBt0eU3jEmoCjzGj-CtXvTZbCQ>
 <xmx:WM12YcScigXw6nmNvRgvpODfW5FVrxYt0LkxFbnYXij7F4uT6uquFw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:29:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Subject: [PATCH v8 10/10] drm/vc4: Increase the core clock based on HVS load
Date: Mon, 25 Oct 2021 17:29:03 +0200
Message-Id: <20211025152903.1088803-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025152903.1088803-1-maxime@cerno.tech>
References: <20211025152903.1088803-1-maxime@cerno.tech>
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

Depending on a given HVS output (HVS to PixelValves) and input (planes
attached to a channel) load, the HVS needs for the core clock to be
raised above its boot time default.

Failing to do so will result in a vblank timeout and a stalled display
pipeline.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  15 +++++
 drivers/gpu/drm/vc4/vc4_drv.h  |   2 +
 drivers/gpu/drm/vc4/vc4_kms.c  | 110 ++++++++++++++++++++++++++++++---
 3 files changed, 118 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 6decaa12a078..287dbc89ad64 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -659,12 +659,27 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
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
index 813c5d0ea98e..4329e09d357c 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -558,6 +558,8 @@ struct vc4_crtc_state {
 		unsigned int bottom;
 	} margins;
 
+	unsigned long hvs_load;
+
 	/* Transitional state below, only valid during atomic commits */
 	bool update_muxing;
 };
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 41cb4869da50..79d4d9dd1394 100644
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
@@ -340,10 +342,19 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
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
 
@@ -354,12 +365,13 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
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
@@ -399,8 +411,12 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 
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
@@ -657,9 +673,9 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
 
 	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
 
-
 	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
 		state->fifo_state[i].in_use = old_state->fifo_state[i].in_use;
+		state->fifo_state[i].fifo_load = old_state->fifo_state[i].fifo_load;
 
 		if (!old_state->fifo_state[i].pending_commit)
 			continue;
@@ -668,6 +684,8 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
 			drm_crtc_commit_get(old_state->fifo_state[i].pending_commit);
 	}
 
+	state->core_clock_rate = old_state->core_clock_rate;
+
 	return &state->base;
 }
 
@@ -822,6 +840,76 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
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
@@ -839,7 +927,11 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
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

