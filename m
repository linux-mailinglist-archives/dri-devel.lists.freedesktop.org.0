Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4FE2BBEAC
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533376E99D;
	Sat, 21 Nov 2020 11:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782546E8CA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 14:42:52 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 83795580118;
 Fri, 20 Nov 2020 09:42:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 20 Nov 2020 09:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=TcadsWpAQsUYr
 7ScQEtAH/vslubOaw4JaebVc1MpQhU=; b=Zaa+0sch6rp8hG3xih1VoU5qvXnBe
 xsKJntJbVVEe/qk+Nbj7OqX3F8xyJ69iMRZfBQ0hI08r/zPcLB1nM2GMXGxrt7Jj
 Bll3X8UR4jYGHfePC/ly2hHkjXQK7Xl51iJAijvVBdaEz01zHP58Z+RoHn9YkgOz
 kBNoTJ3HMT4QY/dqSJO/pIm+Ghzs0TH6mdyWMHaSnQ+oB1ulZcxBRcv/c16ZIBRC
 7wkfvogjB9DUs6IbB0BBqRurjC/o1oHHwZIGwfseHuSrVAocWQpwcBii1AGAzZ/U
 52chi77uRouQHtpdXtoFzCYAdr8248p4W2R58K22Chz8+IZIaDr8HXDbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=TcadsWpAQsUYr7ScQEtAH/vslubOaw4JaebVc1MpQhU=; b=TkdG00So
 Bapm/cOJgxyC4F9lPFw4tMyR9d9eRlKNpbxop++lhvvscv5tXdwwExnRdOUfoXKx
 omjTgfLMOGxfJkbz+AuKukdWBTolsx3IS+clUTcQS0TGO7rYqTJMFXh+F47i4buM
 PdKMx0LXeOgKWdtwdJKNuDxVftBNpH8ypacEhgON8OCh0ht+6d8A6Asy4BFOT6iu
 HLnWS6oURgrqt0zvNrsOZWMZb351pRwcFKq5GkSi40JrqPuYldmqosYKC5J+uTcz
 Kd+JO2HrbdxHXw3r1wZYjFwme3UMK/rVjBSwJczOFebg4/wUcZCXOzE/hO6IzVSF
 HqhlI0B2IH0K0A==
X-ME-Sender: <xms:6dW3X_WU2zBVTQHSNo5oWrDI_ydmCyomPRvJ-wpw3kYwsNT273g7FQ>
 <xme:6dW3X3mmJCV3DRTwTtrymXHcAj0u1eMLfcAnWJN5fzW7T-xirZYFf_bVf1ONMa3yk
 5puYkkqR5iVvhv9Eik>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegtddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:6dW3X7bvFxvOxsr6v0kCqhyziVDKPnmaKAaV-RpelK7nturzmUHcQQ>
 <xmx:6dW3X6UAOh-dGVLfNW_rjYeTSVq7mOYsaf3K2RxB254PpbUJV-Jp-Q>
 <xmx:6dW3X5lIplKOUVgjIOjCA1q6NL4-LE7RnXvDeCkzTIwzxwOIkTaj5A>
 <xmx:6dW3X_fZsPI36HHb3tSziRXbdHfCyOl0WqgTLJQRUP_97Tb9bXsB1Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C60E23064ABC;
 Fri, 20 Nov 2020 09:42:48 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 1/2] drm/vc4: kms: Store the unassigned channel list in the
 state
Date: Fri, 20 Nov 2020 15:42:44 +0100
Message-Id: <20201120144245.398711-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120144245.398711-1-maxime@cerno.tech>
References: <20201120144245.398711-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a CRTC is enabled but not active, and that we're then doing a page
flip on another CRTC, drm_atomic_get_crtc_state will bring the first
CRTC state into the global state, and will make us wait for its vblank
as well, even though that might never occur.

Instead of creating the list of the free channels each time atomic_check
is called, and calling drm_atomic_get_crtc_state to retrieve the
allocated channels, let's create a private state object in the main
atomic state, and use it to store the available channels.

Since vc4 has a semaphore (with a value of 1, so a lock) in its commit
implementation to serialize all the commits, even the nonblocking ones, we
are free from the use-after-free race if two subsequent commits are not ran
in their submission order.

Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h |   1 +
 drivers/gpu/drm/vc4/vc4_kms.c | 126 +++++++++++++++++++++++++++-------
 2 files changed, 102 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 19b75bebd35f..fcfeef0949af 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -219,6 +219,7 @@ struct vc4_dev {
 
 	struct drm_modeset_lock ctm_state_lock;
 	struct drm_private_obj ctm_manager;
+	struct drm_private_obj hvs_channels;
 	struct drm_private_obj load_tracker;
 
 	/* List of vc4_debugfs_info_entry for adding to debugfs once
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 0f44fc526fd2..0bbd7b554275 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -37,6 +37,17 @@ static struct vc4_ctm_state *to_vc4_ctm_state(struct drm_private_state *priv)
 	return container_of(priv, struct vc4_ctm_state, base);
 }
 
+struct vc4_hvs_state {
+	struct drm_private_state base;
+	unsigned int unassigned_channels;
+};
+
+static struct vc4_hvs_state *
+to_vc4_hvs_state(struct drm_private_state *priv)
+{
+	return container_of(priv, struct vc4_hvs_state, base);
+}
+
 struct vc4_load_tracker_state {
 	struct drm_private_state base;
 	u64 hvs_load;
@@ -171,6 +182,19 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
 		  VC4_SET_FIELD(ctm_state->fifo, SCALER_OLEDOFFS_DISPFIFO));
 }
 
+static struct vc4_hvs_state *
+vc4_hvs_get_global_state(struct drm_atomic_state *state)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
+	struct drm_private_state *priv_state;
+
+	priv_state = drm_atomic_get_private_obj_state(state, &vc4->hvs_channels);
+	if (IS_ERR(priv_state))
+		return ERR_CAST(priv_state);
+
+	return to_vc4_hvs_state(priv_state);
+}
+
 static void vc4_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 				     struct drm_atomic_state *state)
 {
@@ -662,6 +686,59 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fini, NULL);
 }
 
+static struct drm_private_state *
+vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
+{
+	struct vc4_hvs_state *old_state = to_vc4_hvs_state(obj->state);
+	struct vc4_hvs_state *state;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
+
+	state->unassigned_channels = old_state->unassigned_channels;
+
+	return &state->base;
+}
+
+static void vc4_hvs_channels_destroy_state(struct drm_private_obj *obj,
+					   struct drm_private_state *state)
+{
+	struct vc4_hvs_state *hvs_state = to_vc4_hvs_state(state);
+
+	kfree(hvs_state);
+}
+
+static const struct drm_private_state_funcs vc4_hvs_state_funcs = {
+	.atomic_duplicate_state = vc4_hvs_channels_duplicate_state,
+	.atomic_destroy_state = vc4_hvs_channels_destroy_state,
+};
+
+static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+
+	drm_atomic_private_obj_fini(&vc4->hvs_channels);
+}
+
+static int vc4_hvs_channels_obj_init(struct vc4_dev *vc4)
+{
+	struct vc4_hvs_state *state;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	state->unassigned_channels = GENMASK(HVS_NUM_CHANNELS - 1, 0);
+	drm_atomic_private_obj_init(&vc4->base, &vc4->hvs_channels,
+				    &state->base,
+				    &vc4_hvs_state_funcs);
+
+	return drmm_add_action_or_reset(&vc4->base, vc4_hvs_channels_obj_fini, NULL);
+}
+
 /*
  * The BCM2711 HVS has up to 7 outputs connected to the pixelvalves and
  * the TXP (and therefore all the CRTCs found on that platform).
@@ -678,6 +755,14 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
  *   need to consider all the running CRTCs in the DRM device to assign
  *   a FIFO, not just the one in the state.
  *
+ * - To fix the above, we can't use drm_atomic_get_crtc_state on all
+ *   enabled CRTCs to pull their CRTC state into the global state, since
+ *   a page flip would start considering their vblank to complete. Since
+ *   we don't have a guarantee that they are actually active, that
+ *   vblank might never happen, and shouldn't even be considered if we
+ *   want to do a page flip on a single CRTC. That can be tested by
+ *   doing a modetest -v first on HDMI1 and then on HDMI0.
+ *
  * - Since we need the pixelvalve to be disabled and enabled back when
  *   the FIFO is changed, we should keep the FIFO assigned for as long
  *   as the CRTC is enabled, only considering it free again once that
@@ -687,46 +772,33 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 				      struct drm_atomic_state *state)
 {
-	unsigned long unassigned_channels = GENMASK(HVS_NUM_CHANNELS - 1, 0);
+	struct vc4_hvs_state *hvs_new_state;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_crtc *crtc;
 	unsigned int i;
 
-	/*
-	 * Since the HVS FIFOs are shared across all the pixelvalves and
-	 * the TXP (and thus all the CRTCs), we need to pull the current
-	 * state of all the enabled CRTCs so that an update to a single
-	 * CRTC still keeps the previous FIFOs enabled and assigned to
-	 * the same CRTCs, instead of evaluating only the CRTC being
-	 * modified.
-	 */
-	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		struct drm_crtc_state *crtc_state;
-
-		if (!crtc->state->enable)
-			continue;
-
-		crtc_state = drm_atomic_get_crtc_state(state, crtc);
-		if (IS_ERR(crtc_state))
-			return PTR_ERR(crtc_state);
-	}
+	hvs_new_state = vc4_hvs_get_global_state(state);
+	if (!hvs_new_state)
+		return -EINVAL;
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		struct vc4_crtc_state *old_vc4_crtc_state =
+			to_vc4_crtc_state(old_crtc_state);
 		struct vc4_crtc_state *new_vc4_crtc_state =
 			to_vc4_crtc_state(new_crtc_state);
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 		unsigned int matching_channels;
 
-		if (old_crtc_state->enable && !new_crtc_state->enable)
+		if (old_crtc_state->enable && !new_crtc_state->enable) {
+			hvs_new_state->unassigned_channels |= BIT(old_vc4_crtc_state->assigned_channel);
 			new_vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
+		}
 
 		if (!new_crtc_state->enable)
 			continue;
 
-		if (new_vc4_crtc_state->assigned_channel != VC4_HVS_CHANNEL_DISABLED) {
-			unassigned_channels &= ~BIT(new_vc4_crtc_state->assigned_channel);
+		if (new_vc4_crtc_state->assigned_channel != VC4_HVS_CHANNEL_DISABLED)
 			continue;
-		}
 
 		/*
 		 * The problem we have to solve here is that we have
@@ -752,12 +824,12 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 		 * the future, we will need to have something smarter,
 		 * but it works so far.
 		 */
-		matching_channels = unassigned_channels & vc4_crtc->data->hvs_available_channels;
+		matching_channels = hvs_new_state->unassigned_channels & vc4_crtc->data->hvs_available_channels;
 		if (matching_channels) {
 			unsigned int channel = ffs(matching_channels) - 1;
 
 			new_vc4_crtc_state->assigned_channel = channel;
-			unassigned_channels &= ~BIT(channel);
+			hvs_new_state->unassigned_channels &= ~BIT(channel);
 		} else {
 			return -EINVAL;
 		}
@@ -841,6 +913,10 @@ int vc4_kms_load(struct drm_device *dev)
 	if (ret)
 		return ret;
 
+	ret = vc4_hvs_channels_obj_init(vc4);
+	if (ret)
+		return ret;
+
 	drm_mode_config_reset(dev);
 
 	drm_kms_helper_poll_init(dev);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
