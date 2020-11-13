Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D782B3AF9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6076189D84;
	Mon, 16 Nov 2020 01:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B316E550
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:32:29 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EBB2358033F;
 Fri, 13 Nov 2020 10:32:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 13 Nov 2020 10:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=pNCE75IFT3GN2
 gjmB20aOrW8DrjSJSZ2nrwdlZs1m6c=; b=lWFbwCfOIcuJ5UP6wfPoibK083WtY
 I5BKq6tGnZpsir6aNlZ83Sg3jgqGfQ/jh9BYwdi/EikB4Qe/1Js0ADpcwdLz0au6
 9pL1luZmRPQBGkI+kqIe2XWJYsQM8Ete6TNrk7/umpFZDvBAMCLXo1PzVy5qFHpw
 iYAl33emFX0e0fWT+eMY4iXw1EV/2wQn4NQ6myQGluFCJEMPm8fuwqpFQ8i//T8G
 WBxdH2CvF79tccINdGpescV5sgNc+TndGpSgGk+oNHbI9jZwzLr7YAHE7pJDCn9y
 B6jwqWVl3sJgnx9SyjKOz8CJPMK6uZgQGmwZ64BedZQh6vhfhSF+blqjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=pNCE75IFT3GN2gjmB20aOrW8DrjSJSZ2nrwdlZs1m6c=; b=o0Y028XU
 /0X8sPVw8kPcsqbulsxv+1q7sXCVupViBhYpi9z6qSC/LTiGZ+INEPhOT44Ui+Do
 xcmLBA9IHLBqr7vvLq4ilKyQxwN4tTKtvLHxi3PTaAShkjK5oN8Kk8ADyXCsAmtH
 c42SYgbmMwcEgbGJdLfk+hdTOFJ6P9AuDhEv6pcStvESSW2rptzRfFOrVf/ZTiMR
 h/zwv32WUkDTXQe9z4J05FxONH0U5WSdOCWGePM6dqPE5RN6BUrs6Pbw/5Xo9WIy
 Db+fAzzqQ6J6xaZt/Z+75SBavhtnh9olVUPk6vsAki7MHDX+zkBoq5uHww7wmIyG
 bZNTs22pv2d7hQ==
X-ME-Sender: <xms:DKeuX_UwIO6oIdz-HHVC0Dh1sCSU_SrzIC_dfs_c0ZzXr1MW4VOxqQ>
 <xme:DKeuX3kSgy-2ZBYTkhqYWpu-TeZXqd83Zkl45Ts57COdEnw11nXt28ChDdKGEPC9p
 DdWSC8EKK_as-tUevs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepieenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DKeuX7brU-pS8pG5wDlQGZH4W-vzoTcmqZEQNNvTOdg0Vm9dgfRKNg>
 <xmx:DKeuX6VMLJCFtfOXkABypq8hT11nCIMHvDqj-v3NnFTDP5sxm_J2QQ>
 <xmx:DKeuX5mkGCotD_W4eMH-35hKhS7C_XBjPSLCYIRscZiAKCMipXXLKQ>
 <xmx:DKeuX--dpEFNStNqmOjxlcjmvdBTklq-VndoULJ_VYxF_zq8X1mBEg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 60B113064AAE;
 Fri, 13 Nov 2020 10:32:28 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 6/8] drm/vc4: kms: Wait on previous FIFO users before a commit
Date: Fri, 13 Nov 2020 16:29:54 +0100
Message-Id: <20201113152956.139663-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201113152956.139663-1-maxime@cerno.tech>
References: <20201113152956.139663-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we're having two subsequent, non-blocking, commits on two different
CRTCs that share no resources, there's no guarantee on the order of
execution of both commits.

However, the second one will consider the first one as the old state,
and will be in charge of freeing it once that second commit is done.

If the first commit happens after that second commit, it might access
some resources related to its state that has been freed, resulting in a
use-after-free bug.

The standard DRM objects are protected against this, but our HVS private
state isn't so let's make sure we wait for all the previous FIFO users
to finish their commit before going with our own.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 118 +++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 3034a5a6637e..849bc6b4cea4 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -40,6 +40,11 @@ static struct vc4_ctm_state *to_vc4_ctm_state(struct drm_private_state *priv)
 struct vc4_hvs_state {
 	struct drm_private_state base;
 	unsigned int unassigned_channels;
+
+	struct {
+		unsigned in_use: 1;
+		struct drm_crtc_commit *last_user;
+	} fifo_state[HVS_NUM_CHANNELS];
 };
 
 static struct vc4_hvs_state *
@@ -182,6 +187,32 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
 		  VC4_SET_FIELD(ctm_state->fifo, SCALER_OLEDOFFS_DISPFIFO));
 }
 
+static struct vc4_hvs_state *
+vc4_hvs_get_new_global_state(struct drm_atomic_state *state)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
+	struct drm_private_state *priv_state;
+
+	priv_state = drm_atomic_get_new_private_obj_state(state, &vc4->hvs_channels);
+	if (IS_ERR(priv_state))
+		return ERR_CAST(priv_state);
+
+	return to_vc4_hvs_state(priv_state);
+}
+
+static struct vc4_hvs_state *
+vc4_hvs_get_old_global_state(struct drm_atomic_state *state)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
+	struct drm_private_state *priv_state;
+
+	priv_state = drm_atomic_get_old_private_obj_state(state, &vc4->hvs_channels);
+	if (IS_ERR(priv_state))
+		return ERR_CAST(priv_state);
+
+	return to_vc4_hvs_state(priv_state);
+}
+
 static struct vc4_hvs_state *
 vc4_hvs_get_global_state(struct drm_atomic_state *state)
 {
@@ -310,6 +341,7 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
+	struct vc4_hvs_state *old_hvs_state;
 	int i;
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
@@ -329,6 +361,32 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 
 	drm_atomic_helper_wait_for_dependencies(state);
 
+	old_hvs_state = vc4_hvs_get_old_global_state(state);
+	if (!old_hvs_state)
+		return;
+
+	for_each_old_crtc_in_state(state, crtc, crtc_state, i) {
+		struct vc4_crtc_state *vc4_crtc_state =
+			to_vc4_crtc_state(crtc_state);
+		unsigned int channel =
+			vc4_crtc_state->assigned_channel;
+
+		if (channel == VC4_HVS_CHANNEL_DISABLED)
+			continue;
+
+		if (!old_hvs_state->fifo_state[channel].in_use)
+			continue;
+
+		commit = old_hvs_state->fifo_state[i].last_user;
+		ret = wait_for_completion_timeout(&commit->hw_done, 10 * HZ);
+		if (!ret)
+			DRM_DEV_ERROR(dev, "Timed out waiting for hw_done\n");
+
+		ret = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
+		if (!ret)
+			DRM_DEV_ERROR(dev, "Timed out waiting for flip_done\n");
+	}
+
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
 	vc4_ctm_commit(vc4, state);
@@ -368,6 +426,36 @@ static void commit_work(struct work_struct *work)
 	vc4_atomic_complete_commit(state);
 }
 
+static int vc4_atomic_commit_setup(struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct vc4_hvs_state *hvs_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	hvs_state = vc4_hvs_get_new_global_state(state);
+	if (!hvs_state)
+		return -EINVAL;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct vc4_crtc_state *vc4_crtc_state =
+			to_vc4_crtc_state(crtc_state);
+		unsigned int channel =
+			vc4_crtc_state->assigned_channel;
+
+		if (channel == VC4_HVS_CHANNEL_DISABLED)
+			continue;
+
+		if (!hvs_state->fifo_state[channel].in_use)
+			continue;
+
+		hvs_state->fifo_state[channel].last_user =
+			drm_crtc_commit_get(crtc_state->commit);
+	}
+
+	return 0;
+}
+
 /**
  * vc4_atomic_commit - commit validated state object
  * @dev: DRM device
@@ -697,6 +785,7 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
 {
 	struct vc4_hvs_state *old_state = to_vc4_hvs_state(obj->state);
 	struct vc4_hvs_state *state;
+	unsigned int i;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
@@ -706,6 +795,16 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
 
 	state->unassigned_channels = old_state->unassigned_channels;
 
+	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
+		state->fifo_state[i].in_use = old_state->fifo_state[i].in_use;
+
+		if (!old_state->fifo_state[i].last_user)
+			continue;
+
+		state->fifo_state[i].last_user =
+			drm_crtc_commit_get(old_state->fifo_state[i].last_user);
+	}
+
 	return &state->base;
 }
 
@@ -713,6 +812,14 @@ static void vc4_hvs_channels_destroy_state(struct drm_private_obj *obj,
 					   struct drm_private_state *state)
 {
 	struct vc4_hvs_state *hvs_state = to_vc4_hvs_state(state);
+	unsigned int i;
+
+	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
+		if (!hvs_state->fifo_state[i].last_user)
+			continue;
+
+		drm_crtc_commit_put(hvs_state->fifo_state[i].last_user);
+	}
 
 	kfree(hvs_state);
 }
@@ -808,7 +915,10 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 
 		/* If we're disabling our CRTC, we put back our channel */
 		if (old_crtc_state->enable && !new_crtc_state->enable) {
-			hvs_state->unassigned_channels |= BIT(old_vc4_crtc_state->assigned_channel);
+			channel = old_vc4_crtc_state->assigned_channel;
+
+			hvs_state->unassigned_channels |= BIT(channel);
+			hvs_state->fifo_state[channel].in_use = false;
 			new_vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
 			continue;
 		}
@@ -844,6 +954,7 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 		channel = ffs(matching_channels) - 1;
 		new_vc4_crtc_state->assigned_channel = channel;
 		hvs_state->unassigned_channels &= ~BIT(channel);
+		hvs_state->fifo_state[channel].in_use = true;
 	}
 
 	return 0;
@@ -869,6 +980,10 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 	return vc4_load_tracker_atomic_check(state);
 }
 
+static struct drm_mode_config_helper_funcs vc4_mode_config_helpers = {
+	.atomic_commit_setup	= vc4_atomic_commit_setup,
+};
+
 static const struct drm_mode_config_funcs vc4_mode_funcs = {
 	.atomic_check = vc4_atomic_check,
 	.atomic_commit = vc4_atomic_commit,
@@ -912,6 +1027,7 @@ int vc4_kms_load(struct drm_device *dev)
 	}
 
 	dev->mode_config.funcs = &vc4_mode_funcs;
+	dev->mode_config.helper_private = &vc4_mode_config_helpers;
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.async_page_flip = true;
 	dev->mode_config.allow_fb_modifiers = true;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
