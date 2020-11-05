Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153592A9155
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9A36E1B5;
	Fri,  6 Nov 2020 08:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0296ED80
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 13:57:08 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E3E7F580353;
 Thu,  5 Nov 2020 08:57:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 05 Nov 2020 08:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=a5JDWFfl8n0H4
 JAr9GTP0+0VT4IkLvGbm60dli/EgK0=; b=BQDxZuJ2VfkEobF6xP4FwmpoPaC4b
 LgG0L6R/MGEOKzOdea1D8iypz+W3j9oGm1RZvmZ4+2g9jdMV2wE/vp5jQoK9OZGa
 6jRE2E1KQ5FVEfJGlpzMyVsUaGkjLd6AccsJr19uOvj8YwaE6NiFpHFa8h8dyfV0
 8JcGMRRYt/nINEPIK14zaRfLKyfbB3DOY9wjKkKU2zjQ5lJIUD7zbAVb2gDqPRke
 hRAM1/4jJ9p4+whKMJiqHiaG4ZuYpyWHH2i6EJv1j8U1d6SVyOeJvlqOtJQC7TcO
 r9djFQrE7KCdzBLvIGTtA0649N70rpO1kU0wXS3ryE7wglswYatDficcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=a5JDWFfl8n0H4JAr9GTP0+0VT4IkLvGbm60dli/EgK0=; b=kR4UZ+nd
 knRtcBJ12WAoMvazV+13re/6570Cc9Mld1KchYvinzW0cYAcS3y/Ii1mifP8sVtt
 qKX1QBkDTiXrwrj5htW697pFfIv07HsZ7jj2YiABPR1QWjwIyxpzxDIRts/fxA48
 62SkGmPatAIIrRkyfuX+HCJHSNXc1WaoKt/bGJXBnm4zc9mJiFdbOC1QYKQdvzmm
 Is9Bhk3h4h8TZHclph5ufcJHvfIwFIRC6NTAR2VY8cX69d9kGuT1vyyh/hGSrnti
 5uYKC6Phz1l68nCCGsGYpUctHKQ14QFAx2GaDoY/hP96GbnGdANJEgB+qzcnw28J
 7nAQTCwyudnhzQ==
X-ME-Sender: <xms:swSkX0ElAvI1hOIPR1-xBiZedB6H6IBCCJ-vSyoRzLEmqrRRwuLcWg>
 <xme:swSkX9VeRPbfWJnSv8iKMPHCkzwBT3kT5U5pgRAYpK1NojhRJyZht6izsBI5kmXIv
 127cjPk9sILNbOzsjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtjedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepgeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:swSkX-IWDGL5ZIpVWzVG08DQZDDdgjTZrRZQz8CkSah0XLYMzu9Agw>
 <xmx:swSkX2E28PRUHzT4x3kUBVgo93qVAiSKewWZIWML3ttynJy764qSag>
 <xmx:swSkX6UR0pYywn05eyaUQXI_24yemHb3kV6E9vEVD0kz0XUWtgkvzw>
 <xmx:swSkX3WtbYxGFVPIeBWRvsDAEUUSXWotOY-AoPLQp0ajVbQ8NzGvig>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 52148306005E;
 Thu,  5 Nov 2020 08:57:07 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v3 6/7] drm/vc4: kms: Store the unassigned channel list in the
 state
Date: Thu,  5 Nov 2020 14:56:55 +0100
Message-Id: <20201105135656.383350-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105135656.383350-1-maxime@cerno.tech>
References: <20201105135656.383350-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
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
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h |   1 +
 drivers/gpu/drm/vc4/vc4_kms.c | 124 +++++++++++++++++++++++++++-------
 2 files changed, 100 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index bdbb9540d47d..014113823647 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -219,6 +219,7 @@ struct vc4_dev {
 
 	struct drm_modeset_lock ctm_state_lock;
 	struct drm_private_obj ctm_manager;
+	struct drm_private_obj hvs_channels;
 	struct drm_private_obj load_tracker;
 
 	/* List of vc4_debugfs_info_entry for adding to debugfs once
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 499c6914fce4..0a231ae500e5 100644
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
@@ -662,6 +673,70 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fini, NULL);
 }
 
+static struct drm_private_state *
+vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
+{
+	struct vc4_hvs_state *state;
+
+	state = kmemdup(obj->state, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
+
+	return &state->base;
+}
+
+static void vc4_hvs_channels_destroy_state(struct drm_private_obj *obj,
+					   struct drm_private_state *state)
+{
+	struct vc4_hvs_state *hvs_state;
+
+	hvs_state = to_vc4_hvs_state(state);
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
 /*
  * The BCM2711 HVS has up to 7 output connected to the pixelvalves and
  * the TXP (and therefore all the CRTCs found on that platform).
@@ -678,6 +753,14 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
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
@@ -687,46 +770,33 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 				      struct drm_atomic_state *state)
 {
-	unsigned long unassigned_channels = GENMASK(HVS_NUM_CHANNELS - 1, 0);
+	struct vc4_hvs_state *hvs_state;
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
+	hvs_state = vc4_hvs_get_global_state(state);
+	if (!hvs_state)
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
+			hvs_state->unassigned_channels |= BIT(old_vc4_crtc_state->assigned_channel);
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
@@ -752,12 +822,12 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 		 * the future, we will need to have something smarter,
 		 * but it works so far.
 		 */
-		matching_channels = unassigned_channels & vc4_crtc->data->hvs_available_channels;
+		matching_channels = hvs_state->unassigned_channels & vc4_crtc->data->hvs_available_channels;
 		if (matching_channels) {
 			unsigned int channel = ffs(matching_channels) - 1;
 
 			new_vc4_crtc_state->assigned_channel = channel;
-			unassigned_channels &= ~BIT(channel);
+			hvs_state->unassigned_channels &= ~BIT(channel);
 		} else {
 			return -EINVAL;
 		}
@@ -841,6 +911,10 @@ int vc4_kms_load(struct drm_device *dev)
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
