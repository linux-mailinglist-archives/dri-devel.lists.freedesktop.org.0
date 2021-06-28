Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04863B5E43
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 14:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC636E455;
	Mon, 28 Jun 2021 12:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E2F6E452
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 12:43:19 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3F20A580502;
 Mon, 28 Jun 2021 08:43:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 28 Jun 2021 08:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ylBfC59buHvrN
 A7vQx7pQlbEfIpO6A7a7nF+fVnD5G4=; b=lHSppW+/AI61bdxnLO11aPvza8Y4z
 IGWNzbmAu9MAIk1Q8LR5nbeAqgAK81LyBkqBbciYV8mSkqlYWIBUiz0KWeh4fqrt
 qWtiPLijjsJX5fvOA87MITg5LyaVDIPic7t+dt+wez4COfHbNt3uhb3sRWdDhhus
 /u4pNvVC01Jkt7u9EyRuQQ25xG0qVtUenmLW6juAcBv7JZiKS7pTVRCw58owWL7d
 fG1r7mTKxUY+rVO560FtYIRXFOFR+tM4UV3O8pWrrXjoWoCjvVnptffd1UWfJ41z
 oafkx4F8BNuSskjnqlye1VpNjQm+QqRFURHz6CzlRHzMbk7ITC88Z1YNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ylBfC59buHvrNA7vQx7pQlbEfIpO6A7a7nF+fVnD5G4=; b=uT0+81/t
 LZCwlbqYi99k2nNaO8Y3xlKQbVxKwBWANMjvog2bztq123iKvmBOTu6LkY0etY+Z
 MgwB7gps/B8InETjsMMK8yK1CiTYmj8pw0ay1AFRfqZIl8NoCP65aZDTvjRk1K61
 nxbcX3ZSZ0fr/ypFbqNOm8YlAVAskRhfc/LhoeTS7dqRtM47NdwEjY9qnJ5XK5LG
 xXPSh4HZoHyJj5kutJnI4doS/+UHiixVJJ566Ee+wZJFRqjB+WkOvhcxd0PnGVK1
 sOajctRAbwL0p5HSsFuo6u+fwdxhEDUJIFpfrhMPrlLrF8cWGwoMAITOYhk3DWr1
 0t2FsGQodA2kQw==
X-ME-Sender: <xms:58PZYFmahotIVz-Z2sfUt7TCCat9VGFgDdn30Xyjs-PXqDlyhurVbA>
 <xme:58PZYA3K_Ra_cfJ_Cxa8qRlSFRiIMtlGH1XZukKdpgW0hpyJYpC2G_vuH4KkvrG7N
 0klmw-SX2vqypaczf0>
X-ME-Received: <xmr:58PZYLoN8065rroctAjkpd6ZmEbfaD0J1vOq5KoR2nqhdaxNTtLp8EJ5jH0gQFgElQ710eoidZ5oNN6D5j1pBakmfEg0NRhSyMvh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:58PZYFlgLTR_1VgLocrnFbIXvMkSy06FimYWxvp1lkr40w7NQpjySQ>
 <xmx:58PZYD3AMTgTNgHGgmIocr-nSl2W1H2xN9e7zd7kNPiNFHqIBA-Qyg>
 <xmx:58PZYEtECD_foyrenm8saEM8QNEbsbjhKAeHGF6C1wYE8u1FHE5rKQ>
 <xmx:58PZYK1FP2mhFB0_I0Q_oCMTmI5s_pOM-c9Dq36H9Npm6fbYe9USwg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 08:43:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 10/10] drm/vc4: Increase the core clock based on HVS load
Date: Mon, 28 Jun 2021 14:42:57 +0200
Message-Id: <20210628124257.140453-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628124257.140453-1-maxime@cerno.tech>
References: <20210628124257.140453-1-maxime@cerno.tech>
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
 Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 Phil Elwell <phil@raspberrypi.com>
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

