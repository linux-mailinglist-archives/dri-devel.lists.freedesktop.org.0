Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D9F570910
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB3C90308;
	Mon, 11 Jul 2022 17:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D288FF8C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 70EE65C015E;
 Mon, 11 Jul 2022 13:40:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561209; x=1657647609; bh=9S
 vn5KwHsDBnd0nH/vrs8vibh17XyMdjMHptXyfFTpw=; b=wfNXE8DWV5dzoG4+SW
 smnl1LD1NtQb88IUhVBHUqjEK0SJCbH+5HohEOEL2PO7vFbFVj1Uoqxx/WZP3xP0
 yEdiLuqASgYMyyqt2Kone4i5ajCl/99iTtJWxgPijQ5mpfvcUxzau4bt1fNdM3wo
 H2KBySQ4wnGFpIjTQ5QQ6wg8u/mbsmcDQUOq44Uph/PzxR2Ayzg5XBhwxFaX2hlg
 uxWNHVyvRsNxtXQNM1pBWO8zmLgttfHALpbaRBriKNFAlBRhyEUuraMMTvCyt0FB
 kpAcMPZkc3fp2/znTBiB/DHWFICyY7SOqpSykUpiRk2yKPBE3Y+6vn1MY3XGu9Q9
 vkgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561209; x=1657647609; bh=9Svn5KwHsDBnd
 0nH/vrs8vibh17XyMdjMHptXyfFTpw=; b=OHCg7eFukqHtM7A0ab7fnar92pZCF
 YElcq7kLmUGwIo934rJtGz10VxtpWk1ZEMKDeLl7LIE2ejOGWzip1nxcIGjEO6dT
 PK6eZYgd5U1SrGQ7Nh+kO7aUpckn8XyIEX2KlbMzmAh7wrKWFx28yk3Noe6DOsVS
 MYeJ3uFG28eI80VlUWmnUwZMeyLjzWO5Mbw08PAr2wHAMbAtunpGCV1Pl16QRaBd
 b5F8Wcswr+c7Tn6BOlM3kWs2uzAdVT8t1RmqCFHMU0HSVslenNbSsrwpUazlCFzT
 Bq12QRLehVAHq1oivLAObnu25nuT7W268iAFFH5Y6+PsT5Z9kSgg1MLcQ==
X-ME-Sender: <xms:eWDMYoFoWrZREpYzt9knVSyJG2y6FQbObLxbwNsMkoKqclcP5kXiMQ>
 <xme:eWDMYhWBRFs3ThkL9Q29RsY4f0Ylv4SrRKuUwpi5mSu0umxzzCtJyjVgl2Ua5nflt
 J63aQJJF4RlDfEDpyA>
X-ME-Received: <xmr:eWDMYiIs4JTPcXJsqBf_AKaLUwhP3UigH2CxG9s1wRapbRH0I8YcY9qQAKK9Alaf3h2F53kICiXZCnPCetc64iip2BspuZwE9mskWzk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eWDMYqHCVDs-nB59Bb5783aeThCNquyLEmy0O_A5RS-lMOXx0ViedQ>
 <xmx:eWDMYuVIo7CLQtQOYKegmoYYCiGKb2TGPhZZtsr6kokyO15zvSRrBA>
 <xmx:eWDMYtNjBjNB6puoVJMXLXDxvyi-M9iK_SukL4TEmXJ3sthsWEJbCw>
 <xmx:eWDMYsyBNpKmqqZk0U2qiTWi7c-YJOWwwm1DhBrgwQKriM0XfxErow>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 15/69] drm/vc4: hvs: Protect device resources after removal
Date: Mon, 11 Jul 2022 19:38:45 +0200
Message-Id: <20220711173939.1132294-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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
for the section protected by those calls. Let's add them to the HVS driver.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 99 ++++++++++++++++++++++++++++++++---
 1 file changed, 93 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index fbaa741dda5f..f2d6e62e7585 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -25,6 +25,7 @@
 #include <linux/platform_device.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_vblank.h>
 
 #include "vc4_drv.h"
@@ -66,11 +67,15 @@ static const struct debugfs_reg32 hvs_regs[] = {
 
 void vc4_hvs_dump_state(struct vc4_hvs *hvs)
 {
+	struct drm_device *drm = &hvs->vc4->base;
 	struct drm_printer p = drm_info_printer(&hvs->pdev->dev);
-	int i;
+	int idx, i;
 
 	drm_print_regset32(&p, &hvs->regset);
 
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	DRM_INFO("HVS ctx:\n");
 	for (i = 0; i < 64; i += 4) {
 		DRM_INFO("0x%08x (%s): 0x%08x 0x%08x 0x%08x 0x%08x\n",
@@ -80,6 +85,8 @@ void vc4_hvs_dump_state(struct vc4_hvs *hvs)
 			 readl((u32 __iomem *)hvs->dlist + i + 2),
 			 readl((u32 __iomem *)hvs->dlist + i + 3));
 	}
+
+	drm_dev_exit(idx);
 }
 
 static int vc4_hvs_debugfs_underrun(struct seq_file *m, void *data)
@@ -175,6 +182,11 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
 	int ret, i;
 	u32 __iomem *dst_kernel;
 
+	/*
+	 * NOTE: We don't need a call to drm_dev_enter()/drm_dev_exit()
+	 * here since that function is only called from vc4_hvs_bind().
+	 */
+
 	ret = drm_mm_insert_node(&hvs->dlist_mm, space, VC4_KERNEL_DWORDS);
 	if (ret) {
 		DRM_ERROR("Failed to allocate space for filter kernel: %d\n",
@@ -199,10 +211,15 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
 static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
 			     struct vc4_crtc *vc4_crtc)
 {
+	struct drm_device *drm = &hvs->vc4->base;
 	struct drm_crtc *crtc = &vc4_crtc->base;
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	int idx;
 	u32 i;
 
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	/* The LUT memory is laid out with each HVS channel in order,
 	 * each of which takes 256 writes for R, 256 for G, then 256
 	 * for B.
@@ -217,6 +234,8 @@ static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
 		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_g[i]);
 	for (i = 0; i < crtc->gamma_size; i++)
 		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_b[i]);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_hvs_update_gamma_lut(struct vc4_hvs *hvs,
@@ -238,7 +257,12 @@ static void vc4_hvs_update_gamma_lut(struct vc4_hvs *hvs,
 
 u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 {
+	struct drm_device *drm = &hvs->vc4->base;
 	u8 field = 0;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return 0;
 
 	switch (fifo) {
 	case 0:
@@ -255,6 +279,7 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 		break;
 	}
 
+	drm_dev_exit(idx);
 	return field;
 }
 
@@ -267,6 +292,12 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
 	if (!vc4->is_vc5)
 		return output;
 
+	/*
+	 * NOTE: We should probably use drm_dev_enter()/drm_dev_exit()
+	 * here, but this function is only used during the DRM device
+	 * initialization, so we should be fine.
+	 */
+
 	switch (output) {
 	case 0:
 		return 0;
@@ -315,12 +346,17 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 				struct drm_display_mode *mode, bool oneshot)
 {
 	struct vc4_dev *vc4 = hvs->vc4;
+	struct drm_device *drm = &vc4->base;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
 	unsigned int chan = vc4_crtc_state->assigned_channel;
 	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
 	u32 dispbkgndx;
 	u32 dispctrl;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return -ENODEV;
 
 	HVS_WRITE(SCALER_DISPCTRLX(chan), 0);
 	HVS_WRITE(SCALER_DISPCTRLX(chan), SCALER_DISPCTRLX_RESET);
@@ -362,13 +398,21 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 	 */
 	vc4_hvs_lut_load(hvs, vc4_crtc);
 
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
 void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 {
+	struct drm_device *drm = &hvs->vc4->base;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	if (HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_ENABLE)
-		return;
+		goto out;
 
 	HVS_WRITE(SCALER_DISPCTRLX(chan),
 		  HVS_READ(SCALER_DISPCTRLX(chan)) | SCALER_DISPCTRLX_RESET);
@@ -385,6 +429,9 @@ void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 	WARN_ON_ONCE((HVS_READ(SCALER_DISPSTATX(chan)) &
 		      (SCALER_DISPSTATX_FULL | SCALER_DISPSTATX_EMPTY)) !=
 		     SCALER_DISPSTATX_EMPTY);
+
+out:
+	drm_dev_exit(idx);
 }
 
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
@@ -426,9 +473,15 @@ static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
 		  vc4_state->mm.start);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
@@ -513,6 +566,12 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	bool enable_bg_fill = false;
 	u32 __iomem *dlist_start = vc4->hvs->dlist + vc4_state->mm.start;
 	u32 __iomem *dlist_next = dlist_start;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx)) {
+		vc4_crtc_send_vblank(crtc);
+		return;
+	}
 
 	if (debug_dump_regs) {
 		DRM_INFO("CRTC %d HVS before:\n", drm_crtc_index(crtc));
@@ -583,26 +642,44 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 		DRM_INFO("CRTC %d HVS after:\n", drm_crtc_index(crtc));
 		vc4_hvs_dump_state(hvs);
 	}
+
+	drm_dev_exit(idx);
 }
 
 void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel)
 {
-	u32 dispctrl = HVS_READ(SCALER_DISPCTRL);
+	struct drm_device *drm = &hvs->vc4->base;
+	u32 dispctrl;
+	int idx;
 
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	dispctrl = HVS_READ(SCALER_DISPCTRL);
 	dispctrl &= ~SCALER_DISPCTRL_DSPEISLUR(channel);
 
 	HVS_WRITE(SCALER_DISPCTRL, dispctrl);
+
+	drm_dev_exit(idx);
 }
 
 void vc4_hvs_unmask_underrun(struct vc4_hvs *hvs, int channel)
 {
-	u32 dispctrl = HVS_READ(SCALER_DISPCTRL);
+	struct drm_device *drm = &hvs->vc4->base;
+	u32 dispctrl;
+	int idx;
 
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	dispctrl = HVS_READ(SCALER_DISPCTRL);
 	dispctrl |= SCALER_DISPCTRL_DSPEISLUR(channel);
 
 	HVS_WRITE(SCALER_DISPSTAT,
 		  SCALER_DISPSTAT_EUFLOW(channel));
 	HVS_WRITE(SCALER_DISPCTRL, dispctrl);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_hvs_report_underrun(struct drm_device *dev)
@@ -623,6 +700,17 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
 	u32 control;
 	u32 status;
 
+	/*
+	 * NOTE: We don't need to protect the register access using
+	 * drm_dev_enter() there because the interrupt handler lifetime
+	 * is tied to the device itself, and not to the DRM device.
+	 *
+	 * So when the device will be gone, one of the first thing we
+	 * will be doing will be to unregister the interrupt handler,
+	 * and then unregister the DRM device. drm_dev_enter() would
+	 * thus always succeed if we are here.
+	 */
+
 	status = HVS_READ(SCALER_DISPSTAT);
 	control = HVS_READ(SCALER_DISPCTRL);
 
@@ -655,10 +743,9 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	u32 dispctrl;
 	u32 reg;
 
-	hvs = devm_kzalloc(&pdev->dev, sizeof(*hvs), GFP_KERNEL);
+	hvs = drmm_kzalloc(drm, sizeof(*hvs), GFP_KERNEL);
 	if (!hvs)
 		return -ENOMEM;
-
 	hvs->vc4 = vc4;
 	hvs->pdev = pdev;
 
-- 
2.36.1

