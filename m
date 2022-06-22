Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B40554D25
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E689E1129D0;
	Wed, 22 Jun 2022 14:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131081129D0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:01 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D272332009A4;
 Wed, 22 Jun 2022 10:32:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908379; x=1655994779; bh=/8
 PF0ZPGKe5oG49zo12MjaEO/UX68mFizAjvwbsF824=; b=JUsfuUlrjUbt9iEcTT
 eJm12SENQMh92GNTyfsUdUSASOuHcaNOWcQflBP6hqa/hNdIkSH4xcruAIt2Af9U
 cJ++c2uW8VTJfP0PFNFhz5oKbf+IspmR8ICBLoUtEc3/SjnIxNbguJCTLCTBcwL6
 Bd2+7w8pAmuE0iD3BVM6KahD66754QDjVs1kH6I7YxPM5TjQoZwIfYCJQYKU7ftw
 fGqrQS139Vb7otCHd8AiEwo2rPAjCGK8Q9dsyUUzday0Piko1O00fHtCEMZk7JxS
 RwuO6JFAf+9zYEPTRFzxOHUsO1uhIkBctAjsyNH6fVtmXkXslOTY2fuHtflNb8nN
 NF7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908379; x=1655994779; bh=/8PF0ZPGKe5oG
 49zo12MjaEO/UX68mFizAjvwbsF824=; b=ezSo+dAQJ7rLpkq4U5MdCv7shJjlI
 ql7ZBKZTMPEYQTSf9Q+jHRyu90xwVO+FLRTOFE3iV2UjqmFpxh4JiQi7REGrhg27
 VwV8UNtthd4+vNFnlco2+4hd9iu38/JPkaX7QGjD3DTpN4DIzM95V+RDgKkgyuGY
 vYpjat4NC6ii+jYxxCS2ZRttIjjZVnNxrrF6//oyW0Nxi8pkcoajjKZXITybnwD1
 k4BnUvd3QxEccRNyQdiJ3i+lIx8jd09ZR/77X48gJnxlCOpJGBjErwrP94zt0OGY
 YYC8FViPshGR6azvhh4KjRML1PFN0SMMSQFIjYo3qzw4bJDj4Ib2lL+Ow==
X-ME-Sender: <xms:GyizYmUKA4j6qyPhXv6XNtfuSuIUVQIjKVUyAo7werTSk_S4jyNZfA>
 <xme:GyizYilHtBdG1bckgcF980OvM0BuohxXfzi3G5oGn4Ir0-zDZBMCcsizx0Zp6B0xv
 aJlmSd6e-qFmajjfys>
X-ME-Received: <xmr:GyizYqZ63S5uueJmU1ka-qu5JFi21JJsuyYYXqNjd-ZZciYhWwX6clbr9Nzn9Fz_E7LBj1ns8riJz9FZIEgK0JsPUQNHCsoONfRqttU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GyizYtXIaTrmzYXyb0Omfjj85cPiEHAiygr-5QBSxXQhnQkoCIeRiA>
 <xmx:GyizYgmlGQD2-8QLDqzyt2dQ8VBE_6PBMfP7bKE_Zd4_8QXZh5MdtA>
 <xmx:GyizYif3Y4i1n7y7eqXMouZVMGF-f_RHLD18Ag9Yi3DwbmxfMkS6dg>
 <xmx:GyizYhDJXei2RUgFXeBExRF9b5p0aUgGUe_ZZtcLcNIQNPD07KnKzw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 14/68] drm/vc4: hvs: Protect device resources after removal
Date: Wed, 22 Jun 2022 16:31:15 +0200
Message-Id: <20220622143209.600298-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 99 ++++++++++++++++++++++++++++++++---
 1 file changed, 93 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index ba2c8e5a9b64..c02243bcb61f 100644
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
@@ -135,6 +142,11 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
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
@@ -159,10 +171,15 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
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
@@ -177,6 +194,8 @@ static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
 		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_g[i]);
 	for (i = 0; i < crtc->gamma_size; i++)
 		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_b[i]);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_hvs_update_gamma_lut(struct vc4_hvs *hvs,
@@ -198,7 +217,12 @@ static void vc4_hvs_update_gamma_lut(struct vc4_hvs *hvs,
 
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
@@ -215,6 +239,7 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 		break;
 	}
 
+	drm_dev_exit(idx);
 	return field;
 }
 
@@ -227,6 +252,12 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
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
@@ -275,12 +306,17 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
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
@@ -322,13 +358,21 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
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
@@ -345,6 +389,9 @@ void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 	WARN_ON_ONCE((HVS_READ(SCALER_DISPSTATX(chan)) &
 		      (SCALER_DISPSTATX_FULL | SCALER_DISPSTATX_EMPTY)) !=
 		     SCALER_DISPSTATX_EMPTY);
+
+out:
+	drm_dev_exit(idx);
 }
 
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
@@ -386,9 +433,15 @@ static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
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
@@ -473,6 +526,12 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
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
@@ -543,26 +602,44 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
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
@@ -583,6 +660,17 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
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
 
@@ -615,10 +703,9 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
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

