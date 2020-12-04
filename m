Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8092D0C40
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45016E59D;
	Mon,  7 Dec 2020 08:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260886E193
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 15:11:48 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8BEDF58015D;
 Fri,  4 Dec 2020 10:11:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 04 Dec 2020 10:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=3IyXGS5ymUS34
 05wh7Vn1LpXoPFCqiG/lwbirO2LzKk=; b=B/YBb/oDUdlhygZMhhy7eiyo6+d+S
 pJaXqiY5jh3RQr7Y6No6JgSnKBE8a+9j/f2INyOQ/5RmNSYenOl8fQWl1bDZJN7P
 IJwCnWDPQQIzGRUbUMJrknz87SduSUmY1FM1Z3LYBjYd5ruUFx0A0HGFEKdtu8Vf
 5HfcNk2VzMBiN3rY7zHY6ETsecUvmta2CNVIDETMN9Dx1KtRjKMAH3JZMKUabAPD
 BChN8b62ebo8kE+Z3JknORhTLeXt1QZXf4Sb806cmW+MXnNWUWCNmUHlL8wVGuNx
 +QWVEDRYkKYYF8zNkzwmHA83vTBZceDiJnQuOKEBbAIrKRuCqnOKmo4Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=3IyXGS5ymUS3405wh7Vn1LpXoPFCqiG/lwbirO2LzKk=; b=jcWXgM6/
 fjhVO3fWDqLOC10qlYMJ8ghHkZRmEXZFZFQttVuG3gPyPeOgYTKX/581uDNZEJqS
 ZEzQQtKnlktyMaqbMOqqf4hnWeEaT+F9ITyeUgBMhp8OajxPeWyEhTAo7sKykpRh
 TwDwWPE3sM+fzDVOshyPLeCTM61aqH1zePNFwkX2rLFmpLUt+69DyNpeqh7WiIZX
 Pieiu/+j79ubWMLcHpvLdKaqxV3B5RyaIlwxHAv8ib+t1yU8pzap0ZTiANRi5OPU
 psRvpktL09jCRh53f8wQJo29xNFoLN7RXvijKUHjRILU1sxcjOKYcVFdq1u3MnK3
 fn/Brm/+KGmxJQ==
X-ME-Sender: <xms:s1HKX6ZukOsbr_PLLPs7GMeHOV1h61TcSkappH03dAWhWo5OXRo4SA>
 <xme:s1HKXzuErtncw9YK5OiS09kKSJm6LN5CjeOBk7VQitzTm1GjBZ1cYv5K4icK9fXEK
 wMX9bVus5kf8GhzBeI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeikedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:s1HKXxqmt6CdLc-L1buSUQBF9yPej1Gw2lTE39MpuotsdKcEfaEdyQ>
 <xmx:s1HKX7SNHBGbJ4btuh-HDjd4MrFgvGddXQktv1-1UOzRD5WpgwTsNg>
 <xmx:s1HKX-YUMcCYL7j47AgMx6dgY4V8x80EKA4mWb7Lu6mezdMOUIdI5Q>
 <xmx:s1HKX59j5Qw_leyyN_Moc_MdDoQRFVIoxkckizBUqZhoA3GCfGurNw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CB33F24005E;
 Fri,  4 Dec 2020 10:11:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 4/7] drm/vc4: kms: Wait on previous FIFO users before a
 commit
Date: Fri,  4 Dec 2020 16:11:35 +0100
Message-Id: <20201204151138.1739736-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204151138.1739736-1-maxime@cerno.tech>
References: <20201204151138.1739736-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
 drivers/gpu/drm/vc4/vc4_kms.c | 123 +++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 8937eb0b751d..fdd698df5fbe 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -40,6 +40,11 @@ static struct vc4_ctm_state *to_vc4_ctm_state(struct drm_private_state *priv)
 struct vc4_hvs_state {
 	struct drm_private_state base;
 	unsigned int unassigned_channels;
+
+	struct {
+		unsigned in_use: 1;
+		struct drm_crtc_commit *pending_commit;
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
@@ -308,8 +339,10 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 	struct drm_device *dev = state->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
+	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
+	struct vc4_hvs_state *old_hvs_state;
 	int i;
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
@@ -329,6 +362,36 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 
 	drm_atomic_helper_wait_for_dependencies(state);
 
+	old_hvs_state = vc4_hvs_get_old_global_state(state);
+	if (!old_hvs_state)
+		return;
+
+	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
+		struct vc4_crtc_state *vc4_crtc_state =
+			to_vc4_crtc_state(old_crtc_state);
+		struct drm_crtc_commit *commit;
+		unsigned int channel = vc4_crtc_state->assigned_channel;
+		unsigned long done;
+
+		if (channel == VC4_HVS_CHANNEL_DISABLED)
+			continue;
+
+		if (!old_hvs_state->fifo_state[channel].in_use)
+			continue;
+
+		commit = old_hvs_state->fifo_state[i].pending_commit;
+		if (!commit)
+			continue;
+
+		done = wait_for_completion_timeout(&commit->hw_done, 10 * HZ);
+		if (!done)
+			drm_err(dev, "Timed out waiting for hw_done\n");
+
+		done = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
+		if (!done)
+			drm_err(dev, "Timed out waiting for flip_done\n");
+	}
+
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
 	vc4_ctm_commit(vc4, state);
@@ -368,6 +431,36 @@ static void commit_work(struct work_struct *work)
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
+		hvs_state->fifo_state[channel].pending_commit =
+			drm_crtc_commit_get(crtc_state->commit);
+	}
+
+	return 0;
+}
+
 /**
  * vc4_atomic_commit - commit validated state object
  * @dev: DRM device
@@ -697,6 +790,7 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
 {
 	struct vc4_hvs_state *old_state = to_vc4_hvs_state(obj->state);
 	struct vc4_hvs_state *state;
+	unsigned int i;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
@@ -706,6 +800,16 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
 
 	state->unassigned_channels = old_state->unassigned_channels;
 
+	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
+		state->fifo_state[i].in_use = old_state->fifo_state[i].in_use;
+
+		if (!old_state->fifo_state[i].pending_commit)
+			continue;
+
+		state->fifo_state[i].pending_commit =
+			drm_crtc_commit_get(old_state->fifo_state[i].pending_commit);
+	}
+
 	return &state->base;
 }
 
@@ -713,6 +817,14 @@ static void vc4_hvs_channels_destroy_state(struct drm_private_obj *obj,
 					   struct drm_private_state *state)
 {
 	struct vc4_hvs_state *hvs_state = to_vc4_hvs_state(state);
+	unsigned int i;
+
+	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
+		if (!hvs_state->fifo_state[i].pending_commit)
+			continue;
+
+		drm_crtc_commit_put(hvs_state->fifo_state[i].pending_commit);
+	}
 
 	kfree(hvs_state);
 }
@@ -805,7 +917,10 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 
 		/* If we're disabling our CRTC, we put back our channel */
 		if (!new_crtc_state->enable) {
-			hvs_new_state->unassigned_channels |= BIT(old_vc4_crtc_state->assigned_channel);
+			channel = old_vc4_crtc_state->assigned_channel;
+
+			hvs_new_state->unassigned_channels |= BIT(channel);
+			hvs_new_state->fifo_state[channel].in_use = false;
 			new_vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
 			continue;
 		}
@@ -841,6 +956,7 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 		channel = ffs(matching_channels) - 1;
 		new_vc4_crtc_state->assigned_channel = channel;
 		hvs_new_state->unassigned_channels &= ~BIT(channel);
+		hvs_new_state->fifo_state[channel].in_use = true;
 	}
 
 	return 0;
@@ -866,6 +982,10 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 	return vc4_load_tracker_atomic_check(state);
 }
 
+static struct drm_mode_config_helper_funcs vc4_mode_config_helpers = {
+	.atomic_commit_setup	= vc4_atomic_commit_setup,
+};
+
 static const struct drm_mode_config_funcs vc4_mode_funcs = {
 	.atomic_check = vc4_atomic_check,
 	.atomic_commit = vc4_atomic_commit,
@@ -909,6 +1029,7 @@ int vc4_kms_load(struct drm_device *dev)
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
