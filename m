Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A289D546258
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C0311BA88;
	Fri, 10 Jun 2022 09:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3765811B30D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9645A5C01B7;
 Fri, 10 Jun 2022 05:30:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 05:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853444; x=1654939844; bh=di
 imn5LVyLrMydADLsf/fNLUkWhDb+8lRLb52ewMqgQ=; b=FHOKwv8Pk6dGW/NYnW
 1La+lpQwwscGDU6pUqkVdN3B5w62qTIVyBnlJNdV2CW7oHGCdVC+0J1DPfX5krDT
 cMvmHG6jCGj3ITZ9i+5P9FplNfpG0UXcZETyXc/NX7UWSdWjM6+NePS15yYiPmRj
 cHKTqt3yWh2volHfHqjE97TJkeDBnWnXgiF2d3g98A0jGM6Iz5lSEsVWW0gidWuf
 7lf2KZ7BG2svIqRUxF/tKgrUZuUJ1tYeFCfO1lhYqByGiZgl2C+IVSExfL8Ji5Ls
 WC1ZHNs7R13IBFA77S5v/+CWBudfZwXb+JVtFcRw02eRgzLYoG2KrCpYeEUa8g4H
 +RkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853444; x=1654939844; bh=diimn5LVyLrMy
 dADLsf/fNLUkWhDb+8lRLb52ewMqgQ=; b=M2LiSGAuc9y9GS8gN8PFyLXDB+TBd
 eTjwgLlgBqminFYCYtB5DW8ovpmIMkHvYZZe6T3l20Q1hdWrEAANpwTiR9QqVkxS
 JqnX66e5BZNkjHsqluMF1X3rY24t0COUKcIneOUiY5k4uD/9ipxGGZxdPg2HZUZ1
 YUeP1k5n3u4ql8SCuCn5d7R8dk5B9qFlw1vf2IRCI/Yi7+YOlJ72ot+mbyBcFuSX
 OoUxn1EQylLBmp5eotXb31EYgFHVdr8jiS5mCNo5BCh7JiXply3Fx8NbIeJTHMyq
 Llppp3djttlFc/KN3Cppozyy8Sn+tHwoSJMm4PWKOp3cQaYO4gQcRIjMw==
X-ME-Sender: <xms:RA-jYvfw7pxhrTozzgVW_ysg_uzskmcDoKvtQOXMUCWTIOb7fzEPkg>
 <xme:RA-jYlOf5Bu73LIPlvb8g_A1eIRrgmgVwoEyWYUjs5q_pwyJBYIR-KV-FUECdrIz3
 JnrLFJ13Xeo2jnPtzc>
X-ME-Received: <xmr:RA-jYojAYBmeFYvpyIOhViB3u_C8CbOlelGzRRVxFGEqvRO6HwkZhrq63Bu257rVzhM0VlzSS6u-_pPrXS-pOEGu4dv11uC75eZhzyk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RA-jYg-Wb22Zec07BCx_Vos0HJgIZPXYqdkmXdHq1pDr5cjtEoZ0cg>
 <xmx:RA-jYrsibG0rnrXbwKFwLy4Ss58DTk9_zItLdyZEZJWdjepvX9wvRQ>
 <xmx:RA-jYvFniW1pJgIsXtnFLfbtR5SL1mb_7TW-oQOKb6ZyNWsW4KWeuw>
 <xmx:RA-jYlLJtS1pY8R_bJSPGl9nyAZ5chKMDps7gJWjInZKWZ4PXp-o5g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 43/64] drm/vc4: hdmi: Protect device resources after removal
Date: Fri, 10 Jun 2022 11:29:03 +0200
Message-Id: <20220610092924.754942-44-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Whenever the device and driver are unbound, the main device and all the
subdevices will be removed by calling their unbind() method.

However, the DRM device itself will only be freed when the last user will
have closed it.

It means that there is a time window where the device and its resources
aren't there anymore, but the userspace can still call into our driver.

Fortunately, the DRM framework provides the drm_dev_enter() and
drm_dev_exit() functions to make sure our underlying device is still there
for the section protected by those calls. Let's add them to the HDMI driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 286 +++++++++++++++++++++++++++++++--
 1 file changed, 269 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 814517c1fdaa..b4fd581861ea 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -34,6 +34,7 @@
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
@@ -140,17 +141,33 @@ static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct vc4_hdmi *vc4_hdmi = node->info_ent->data;
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct drm_printer p = drm_seq_file_printer(m);
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return -ENODEV;
 
 	drm_print_regset32(&p, &vc4_hdmi->hdmi_regset);
 	drm_print_regset32(&p, &vc4_hdmi->hd_regset);
 
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
 static void vc4_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 {
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
+	int idx;
+
+	/*
+	 * We can be called by our bind callback, when the
+	 * connector->dev pointer might not be initialised yet.
+	 */
+	if (drm && !drm_dev_enter(drm, &idx))
+		return;
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -167,11 +184,23 @@ static void vc4_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 	HDMI_WRITE(HDMI_SW_RESET_CONTROL, 0);
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
+	if (drm)
+		drm_dev_exit(idx);
 }
 
 static void vc5_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 {
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
+	int idx;
+
+	/*
+	 * We can be called by our bind callback, when the
+	 * connector->dev pointer might not be initialised yet.
+	 */
+	if (drm && !drm_dev_enter(drm, &idx))
+		return;
 
 	reset_control_reset(vc4_hdmi->reset);
 
@@ -183,15 +212,25 @@ static void vc5_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 		   HDMI_READ(HDMI_CLOCK_STOP) | VC4_DVP_HT_CLOCK_STOP_PIXEL);
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
+	if (drm)
+		drm_dev_exit(idx);
 }
 
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 {
-	unsigned long cec_rate = clk_get_rate(vc4_hdmi->cec_clock);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
+	unsigned long cec_rate;
 	unsigned long flags;
 	u16 clk_cnt;
 	u32 value;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	cec_rate = clk_get_rate(vc4_hdmi->cec_clock);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -207,6 +246,8 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
+	drm_dev_exit(idx);
 }
 #else
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
@@ -427,25 +468,34 @@ static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
 				bool poll)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	u32 packet_id = type - 0x80;
 	unsigned long flags;
+	int ret = 0;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return -ENODEV;
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
 		   HDMI_READ(HDMI_RAM_PACKET_CONFIG) & ~BIT(packet_id));
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
-	if (!poll)
-		return 0;
+	if (poll) {
+		ret = wait_for(!(HDMI_READ(HDMI_RAM_PACKET_STATUS) &
+				 BIT(packet_id)), 100);
+	}
 
-	return wait_for(!(HDMI_READ(HDMI_RAM_PACKET_STATUS) &
-			  BIT(packet_id)), 100);
+	drm_dev_exit(idx);
+	return ret;
 }
 
 static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 				     union hdmi_infoframe *frame)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	u32 packet_id = frame->any.type - 0x80;
 	const struct vc4_hdmi_register *ram_packet_start =
 		&vc4_hdmi->variant->registers[HDMI_RAM_PACKET_START];
@@ -456,6 +506,10 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 	unsigned long flags;
 	ssize_t len, i;
 	int ret;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
 
 	WARN_ONCE(!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
 		    VC4_HDMI_RAM_PACKET_ENABLE),
@@ -463,12 +517,12 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 
 	len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
 	if (len < 0)
-		return;
+		goto out;
 
 	ret = vc4_hdmi_stop_packet(encoder, frame->any.type, true);
 	if (ret) {
 		DRM_ERROR("Failed to wait for infoframe to go idle: %d\n", ret);
-		return;
+		goto out;
 	}
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
@@ -497,6 +551,9 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 			BIT(packet_id)), 100);
 	if (ret)
 		DRM_ERROR("Failed to wait for infoframe to start: %d\n", ret);
+
+out:
+	drm_dev_exit(idx);
 }
 
 static void vc4_hdmi_avi_infoframe_colorspace(struct hdmi_avi_infoframe *frame,
@@ -644,8 +701,10 @@ static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long flags;
+	int idx;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
@@ -657,6 +716,9 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 					    vc4_hdmi->output_format))
 		return;
 
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
 	drm_scdc_set_scrambling(vc4_hdmi->ddc, true);
 
@@ -665,6 +727,8 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 		   VC5_HDMI_SCRAMBLER_CTL_ENABLE);
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	drm_dev_exit(idx);
+
 	vc4_hdmi->scdc_enabled = true;
 
 	queue_delayed_work(system_wq, &vc4_hdmi->scrambling_work,
@@ -674,7 +738,9 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
+	int idx;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
@@ -686,6 +752,9 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 	if (delayed_work_pending(&vc4_hdmi->scrambling_work))
 		cancel_delayed_work_sync(&vc4_hdmi->scrambling_work);
 
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) &
 		   ~VC5_HDMI_SCRAMBLER_CTL_ENABLE);
@@ -693,6 +762,8 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 
 	drm_scdc_set_scrambling(vc4_hdmi->ddc, false);
 	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, false);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_hdmi_scrambling_wq(struct work_struct *work)
@@ -715,10 +786,15 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 					       struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
+	int idx;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
+	if (!drm_dev_enter(drm, &idx))
+		goto out;
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
@@ -736,6 +812,9 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 
 	vc4_hdmi_disable_scrambling(encoder);
 
+	drm_dev_exit(idx);
+
+out:
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
@@ -743,11 +822,16 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 						 struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int ret;
+	int idx;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
+	if (!drm_dev_enter(drm, &idx))
+		goto out;
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
@@ -763,6 +847,9 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 	if (ret < 0)
 		DRM_ERROR("Failed to release power domain: %d\n", ret);
 
+	drm_dev_exit(idx);
+
+out:
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
@@ -779,8 +866,13 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
 {
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	u32 csc_ctl;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -815,6 +907,8 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
+	drm_dev_exit(idx);
 }
 
 /*
@@ -899,6 +993,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
 {
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct vc4_hdmi_connector_state *vc4_state =
 		conn_state_to_vc4_hdmi_conn_state(state);
 	unsigned long flags;
@@ -907,6 +1002,10 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	u32 csc_chan_ctl = 0;
 	u32 csc_ctl = VC5_MT_CP_CSC_CTL_ENABLE | VC4_SET_FIELD(VC4_HD_CSC_CTL_MODE_CUSTOM,
 							       VC5_MT_CP_CSC_CTL_MODE);
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -949,12 +1048,15 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
@@ -973,6 +1075,10 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 					interlaced,
 					VC4_HDMI_VERTB_VBP));
 	unsigned long flags;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -1000,12 +1106,15 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
+	drm_dev_exit(idx);
 }
 
 static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	const struct vc4_hdmi_connector_state *vc4_state =
 		conn_state_to_vc4_hdmi_conn_state(state);
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -1029,6 +1138,10 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	unsigned char gcp;
 	bool gcp_en;
 	u32 reg;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -1100,13 +1213,20 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_CLOCK_STOP, 0);
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
 {
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	u32 drift;
 	int ret;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -1135,12 +1255,15 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
 		       VC4_HDMI_FIFO_CTL_RECENTER_DONE, 1);
 	WARN_ONCE(ret, "Timeout waiting for "
 		  "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 						struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
@@ -1151,9 +1274,13 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	unsigned long bvb_rate, hsm_rate;
 	unsigned long flags;
 	int ret;
+	int idx;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
+	if (!drm_dev_enter(drm, &idx))
+		goto out;
+
 	/*
 	 * As stated in RPi's vc4 firmware "HDMI state machine (HSM) clock must
 	 * be faster than pixel clock, infinitesimally faster, tested in
@@ -1174,13 +1301,13 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, hsm_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
-		goto out;
+		goto err_dev_exit;
 	}
 
 	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to retain power domain: %d\n", ret);
-		goto out;
+		goto err_dev_exit;
 	}
 
 	ret = clk_set_rate(vc4_hdmi->pixel_clock, tmds_char_rate);
@@ -1232,6 +1359,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	if (vc4_hdmi->variant->set_timings)
 		vc4_hdmi->variant->set_timings(vc4_hdmi, conn_state, mode);
 
+	drm_dev_exit(idx);
+
 	mutex_unlock(&vc4_hdmi->mutex);
 
 	return;
@@ -1240,6 +1369,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 err_put_runtime_pm:
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
+err_dev_exit:
+	drm_dev_exit(idx);
 out:
 	mutex_unlock(&vc4_hdmi->mutex);
 	return;
@@ -1249,14 +1380,19 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 					     struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
 	unsigned long flags;
+	int idx;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	if (vc4_hdmi->variant->csc_setup)
 		vc4_hdmi->variant->csc_setup(vc4_hdmi, conn_state, mode);
 
@@ -1264,6 +1400,8 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	drm_dev_exit(idx);
+
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
@@ -1271,15 +1409,20 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 					      struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	unsigned long flags;
 	int ret;
+	int idx;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	HDMI_WRITE(HDMI_VID_CTL,
@@ -1340,6 +1483,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
 	vc4_hdmi_enable_scrambling(encoder);
 
+	drm_dev_exit(idx);
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
@@ -1675,13 +1819,20 @@ static u32 vc5_hdmi_channel_map(struct vc4_hdmi *vc4_hdmi, u32 channel_mask)
 
 static bool vc5_hdmi_hp_detect(struct vc4_hdmi *vc4_hdmi)
 {
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	u32 hotplug;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return false;
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	hotplug = HDMI_READ(HDMI_HOTPLUG);
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	drm_dev_exit(idx);
+
 	return !!(hotplug & VC4_HDMI_HOTPLUG_CONNECTED);
 }
 
@@ -1689,10 +1840,16 @@ static bool vc5_hdmi_hp_detect(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
 					 unsigned int samplerate)
 {
-	u32 hsm_clock = clk_get_rate(vc4_hdmi->audio_clock);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
+	u32 hsm_clock;
 	unsigned long flags;
 	unsigned long n, m;
+	int idx;
 
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	hsm_clock = clk_get_rate(vc4_hdmi->audio_clock);
 	rational_best_approximation(hsm_clock, samplerate,
 				    VC4_HD_MAI_SMP_N_MASK >>
 				    VC4_HD_MAI_SMP_N_SHIFT,
@@ -1705,6 +1862,8 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
 		   VC4_SET_FIELD(n, VC4_HD_MAI_SMP_N) |
 		   VC4_SET_FIELD(m - 1, VC4_HD_MAI_SMP_M));
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi, unsigned int samplerate)
@@ -1764,13 +1923,21 @@ static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
 static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
+	int ret = 0;
+	int idx;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
+	if (!drm_dev_enter(drm, &idx)) {
+		ret = -ENODEV;
+		goto out;
+	}
+
 	if (!vc4_hdmi_audio_can_stream(vc4_hdmi)) {
-		mutex_unlock(&vc4_hdmi->mutex);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto out_dev_exit;
 	}
 
 	vc4_hdmi->audio.streaming = true;
@@ -1787,9 +1954,12 @@ static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 	if (vc4_hdmi->variant->phy_rng_enable)
 		vc4_hdmi->variant->phy_rng_enable(vc4_hdmi);
 
+out_dev_exit:
+	drm_dev_exit(idx);
+out:
 	mutex_unlock(&vc4_hdmi->mutex);
 
-	return 0;
+	return ret;
 }
 
 static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
@@ -1818,10 +1988,15 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_audio_shutdown(struct device *dev, void *data)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
+	int idx;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
+	if (!drm_dev_enter(drm, &idx))
+		goto out;
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	HDMI_WRITE(HDMI_MAI_CTL,
@@ -1837,6 +2012,9 @@ static void vc4_hdmi_audio_shutdown(struct device *dev, void *data)
 	vc4_hdmi->audio.streaming = false;
 	vc4_hdmi_audio_reset(vc4_hdmi);
 
+	drm_dev_exit(idx);
+
+out:
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
@@ -1884,6 +2062,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 				  struct hdmi_codec_params *params)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
@@ -1892,15 +2071,22 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	u32 channel_map;
 	u32 mai_audio_format;
 	u32 mai_sample_rate;
+	int ret = 0;
+	int idx;
 
 	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		sample_rate, params->sample_width, channels);
 
 	mutex_lock(&vc4_hdmi->mutex);
 
+	if (!drm_dev_enter(drm, &idx)) {
+		ret = -ENODEV;
+		goto out;
+	}
+
 	if (!vc4_hdmi_audio_can_stream(vc4_hdmi)) {
-		mutex_unlock(&vc4_hdmi->mutex);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_dev_exit;
 	}
 
 	vc4_hdmi_audio_set_mai_clock(vc4_hdmi, sample_rate);
@@ -1957,9 +2143,12 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	memcpy(&vc4_hdmi->audio.infoframe, &params->cea, sizeof(params->cea));
 	vc4_hdmi_set_audio_infoframe(encoder);
 
+out_dev_exit:
+	drm_dev_exit(idx);
+out:
 	mutex_unlock(&vc4_hdmi->mutex);
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_component_driver vc4_hdmi_audio_cpu_dai_comp = {
@@ -2294,6 +2483,17 @@ static irqreturn_t vc4_cec_irq_handler_tx_bare_locked(struct vc4_hdmi *vc4_hdmi)
 {
 	u32 cntrl1;
 
+	/*
+	 * We don't need to protect the register access using
+	 * drm_dev_enter() there because the interrupt handler lifetime
+	 * is tied to the device itself, and not to the DRM device.
+	 *
+	 * So when the device will be gone, one of the first thing we
+	 * will be doing will be to unregister the interrupt handler,
+	 * and then unregister the DRM device. drm_dev_enter() would
+	 * thus always succeed if we are here.
+	 */
+
 	lockdep_assert_held(&vc4_hdmi->hw_lock);
 
 	cntrl1 = HDMI_READ(HDMI_CEC_CNTRL_1);
@@ -2322,6 +2522,17 @@ static irqreturn_t vc4_cec_irq_handler_rx_bare_locked(struct vc4_hdmi *vc4_hdmi)
 
 	lockdep_assert_held(&vc4_hdmi->hw_lock);
 
+	/*
+	 * We don't need to protect the register access using
+	 * drm_dev_enter() there because the interrupt handler lifetime
+	 * is tied to the device itself, and not to the DRM device.
+	 *
+	 * So when the device will be gone, one of the first thing we
+	 * will be doing will be to unregister the interrupt handler,
+	 * and then unregister the DRM device. drm_dev_enter() would
+	 * thus always succeed if we are here.
+	 */
+
 	vc4_hdmi->cec_rx_msg.len = 0;
 	cntrl1 = HDMI_READ(HDMI_CEC_CNTRL_1);
 	vc4_cec_read_msg(vc4_hdmi, cntrl1);
@@ -2353,6 +2564,17 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 	irqreturn_t ret;
 	u32 cntrl5;
 
+	/*
+	 * We don't need to protect the register access using
+	 * drm_dev_enter() there because the interrupt handler lifetime
+	 * is tied to the device itself, and not to the DRM device.
+	 *
+	 * So when the device will be gone, one of the first thing we
+	 * will be doing will be to unregister the interrupt handler,
+	 * and then unregister the DRM device. drm_dev_enter() would
+	 * thus always succeed if we are here.
+	 */
+
 	if (!(stat & VC4_HDMI_CPU_CEC))
 		return IRQ_NONE;
 
@@ -2373,11 +2595,13 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
 	unsigned long flags;
 	u32 val;
 	int ret;
+	int idx;
 
 	/*
 	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
@@ -2390,9 +2614,14 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 	 * keep it in mind if we were to change that assumption.
 	 */
 
+	if (!drm_dev_enter(drm, &idx))
+		return -ENODEV;
+
 	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
-	if (ret)
+	if (ret) {
+		drm_dev_exit(idx);
 		return ret;
+	}
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -2428,13 +2657,20 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
 static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return -ENODEV;
 
 	/*
 	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
@@ -2459,6 +2695,8 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
 
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
@@ -2473,7 +2711,9 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
+	int idx;
 
 	/*
 	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
@@ -2486,12 +2726,17 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 	 * keep it in mind if we were to change that assumption.
 	 */
 
+	if (!drm_dev_enter(drm, &idx))
+		return -ENODEV;
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_CEC_CNTRL_1,
 		   (HDMI_READ(HDMI_CEC_CNTRL_1) & ~VC4_HDMI_CEC_ADDR_MASK) |
 		   (log_addr & 0xf) << VC4_HDMI_CEC_ADDR_SHIFT);
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
@@ -2503,6 +2748,7 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	unsigned long flags;
 	u32 val;
 	unsigned int i;
+	int idx;
 
 	/*
 	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
@@ -2515,8 +2761,12 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	 * keep it in mind if we were to change that assumption.
 	 */
 
+	if (!drm_dev_enter(dev, &idx))
+		return -ENODEV;
+
 	if (msg->len > 16) {
 		drm_err(dev, "Attempting to transmit too much data (%d)\n", msg->len);
+		drm_dev_exit(idx);
 		return -ENOMEM;
 	}
 
@@ -2540,6 +2790,8 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
-- 
2.36.1

