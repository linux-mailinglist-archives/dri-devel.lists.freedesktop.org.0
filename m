Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FA329E5FF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B8A6E89A;
	Thu, 29 Oct 2020 08:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5F06E51C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 12:41:15 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 97307580154;
 Wed, 28 Oct 2020 08:41:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 28 Oct 2020 08:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=76/R/DGDT6E79
 uWpjINfyLdHm6auJmj2+t+BCC5coDo=; b=hBCZNE67Nzg5vzbPaUdemj4m0eyQf
 3kM3KfSqBp7qb9omju6NCflifC4Aocjg0jSKz3jbQlDaWdA9dCaV9FopLFy6iaVW
 DY1NEtra7fbO0+xdzUJMeqXSI2p0aht8S3kGM0cvAjr6FSo8CWhKozCHYa47ioh5
 0q+IPd01lYGM1+2lK+65YKyyq+qO59kQeCazvo9ilCtytJL1xaG/PHzY/wdsE973
 OUwFVc3qES9/d29K3Gjf45kNZfu+Vhrz6sBJ0FyVyPgWvXCrxPffOxy4Ikd0pRCj
 Pueeh2VLnSKsdyLxsYdEag1s7gJ8SOz+olsCecZhDBBZz/RnbNy6nfN0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=76/R/DGDT6E79uWpjINfyLdHm6auJmj2+t+BCC5coDo=; b=j8NdGw8a
 yX4Q1cCe/XMjEyp9d95AszSUjInEpkF51vw0nxoAdVfvIlQgj4bKB4NHS7kPs4sq
 A71BpdSJaa6+zKSY9B4o9RU0LwgNX3PnctOt5nLPfWxKo8G5dZ7QuTJ/HHRulN0r
 5OOCDu9/ieO2PLroYkTo9M1i0GSxvE7OAHkgs8uFnZHIJz13B/Q6LOxcUvYfvPmM
 G6jfkG/HmVFB4tDWlSKDiQzqMuCeyNnF02jgNWARsKLjnIEgV882pvqJbz7okRsm
 j7PtM9VP7lQdFtQNFzqWJo57q4lR6NBxHzlvZzHo9W6vdOcW1eNJ84jgfGMsKeTs
 xVMTvEMlhKDAjg==
X-ME-Sender: <xms:6maZX3Ud_teHmfetGq9rG77DIkjpxNZGLYvsvk0cEXcuYWvf98jf1Q>
 <xme:6maZX_nEeys5LOYEVhvYtkTWvldYmMfBu7ISSzWMzEV8X3w-Ljy86CKQqm1aq4ibE
 hM4G7bkGPx9THkkJU4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrledugdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6maZXzbsljF1Apy_YCf8w1bDYX4UcKthI7UTEMHhpk3zHoHAgFGmQg>
 <xmx:6maZXyWDJpB_vK1_DjElr7WuZrhGdjAM5_4RbwH6eVCLRZAc3O0Yfg>
 <xmx:6maZXxnZmDKFQQhXNlq4GaHAzlOyPlmGNVCpXSt67m57ln1YSFa-aw>
 <xmx:6maZXxkltfUTWShR_GYnrNc7LqJgiTctFLImp_5IibsI4x13Q5PvGw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 09E503064686;
 Wed, 28 Oct 2020 08:41:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 6/7] drm/vc4: kms: Store the unassigned channel list in the
 state
Date: Wed, 28 Oct 2020 13:41:03 +0100
Message-Id: <86c871c0c2737e0dd076a5719a4a3abbcd919608.1603888799.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
References: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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

Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h |   1 +-
 drivers/gpu/drm/vc4/vc4_kms.c | 126 ++++++++++++++++++++++++++++-------
 2 files changed, 102 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 836fdca5e643..c6208b040f77 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -218,6 +218,7 @@ struct vc4_dev {
 
 	struct drm_modeset_lock ctm_state_lock;
 	struct drm_private_obj ctm_manager;
+	struct drm_private_obj hvs_channels;
 	struct drm_private_obj load_tracker;
 
 	/* List of vc4_debugfs_info_entry for adding to debugfs once
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 2cac556f7799..2aa726b7422c 100644
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
@@ -650,6 +661,71 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 	return 0;
 }
 
+static void vc4_load_tracker_obj_fini(struct vc4_dev *vc4)
+{
+	if (!vc4->load_tracker_available)
+		return;
+
+	drm_atomic_private_obj_fini(&vc4->load_tracker);
+}
+
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
+static int vc4_hvs_channels_obj_init(struct vc4_dev *vc4)
+{
+	struct vc4_hvs_state *state;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	state->unassigned_channels = GENMASK(HVS_NUM_CHANNELS - 1, 0);
+	drm_atomic_private_obj_init(vc4->dev, &vc4->hvs_channels,
+				    &state->base,
+				    &vc4_hvs_state_funcs);
+
+	return 0;
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
@@ -666,6 +742,14 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
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
@@ -675,29 +759,14 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
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
 		struct vc4_crtc_state *new_vc4_crtc_state =
@@ -705,16 +774,16 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
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
@@ -740,12 +809,12 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
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
@@ -829,12 +898,19 @@ int vc4_kms_load(struct drm_device *dev)
 	if (ret)
 		goto ctm_fini;
 
+	ret = vc4_hvs_channels_obj_init(vc4);
+	if (ret)
+		goto load_tracker_fini;
+
 	drm_mode_config_reset(dev);
 
 	drm_kms_helper_poll_init(dev);
 
 	return 0;
 
+load_tracker_fini:
+	vc4_load_tracker_obj_fini(vc4);
+
 ctm_fini:
 	vc4_ctm_obj_fini(vc4);
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
