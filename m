Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 843B156B625
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BC111383A;
	Fri,  8 Jul 2022 09:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE574113835
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 847DD32007E8;
 Fri,  8 Jul 2022 05:57:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 05:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274275; x=1657360675; bh=9S
 vn5KwHsDBnd0nH/vrs8vibh17XyMdjMHptXyfFTpw=; b=S2zfXcfYQE4/ExAzFw
 lacg386Hqwu+6CnwjeD3S7lG0OTQXo6MijYQP6rO6p/wvAtSojh96N7Mf4tzUSLH
 EI8s6vVNni88yFwVbl1q2DgoxvzDOByLFPbGad3duXVt1GalJ6194lX9Uzi66zkv
 8aBicp0j4qpnM851w5EYT6M4oa1OHh/yoTKi9OzsAfUBE+3BpeZZVa7JfR9Jw+aE
 OxU6aTbhwiZURg0KF7frRfBju531Ht/M99LiOZ7gugAXwZ2si2d9aVtLEgaTb4xD
 ASQsvqYLZ1n+Kjboe3YiLuoxp7sL6HlbrARLZePlSL9hoH1x1PrCa+Q0wL2YFNx5
 nnbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274275; x=1657360675; bh=9Svn5KwHsDBnd
 0nH/vrs8vibh17XyMdjMHptXyfFTpw=; b=BFDFE6xFWsUPlUABFgF4hOH/Wzc6J
 mIbY8zfzaGaCqA8rtT+cAlEmxor1+hensAgnPEsZY3QcfUnbX1cmOVO8rLCZ6t+q
 SeCY/VnPVhbRd77RTqms/NLmjykJynuCV3r+iOFj8FvJaYLE4rlbxRPdXmyTGzN2
 zTtvBer0DQ3UwOjW9nMY8SFFKxZd6PXQTOxTA6YxmPgat9DpvuYbCdyiowBVArSB
 EkCEEele+rdo2KmjTn3pc150kgpyS/QmcZFo54VnTfd5Tiivea5r/9U8bnAlXunM
 eTNGW4wgr6swKUZXA7gEzp9iy20eEu8K2NYbJHdTq9n+NIVjLbBxW03Dw==
X-ME-Sender: <xms:ov_HYiFhxsPDoe_E8I0kn4xyNqLYs8nb6ufOVCEk9WMPsp-RGL1EvA>
 <xme:ov_HYjUdHQf2pUIromvPIFABTotgcdr6vAXxdHUlNrju-ZIKPjwIgNm_BE0s4ZIOQ
 YyMWnnKxty_Sw8FBlA>
X-ME-Received: <xmr:ov_HYsJl3wlDvFn16_kkU6zK1MgIv64myNsBhIErmOiDUoLlNo-KQHkb3d05-563kZ4QdTzC6ruiKVqHLKLhhLJaQU2lOmx_iyp-bFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ov_HYsELRjlwn19hzkLim-DBJ7MHO88pdHDWNSjw2O58xkXTV-impw>
 <xmx:ov_HYoUrksEz0JnHBSEZlFZW_Sfr60d8TwQ_B_4gRP_oAHm-HyeQAg>
 <xmx:ov_HYvOh2LNZF2Oz0AIK9ROpx2i_RoZ54svE2NLh79K8B2y7F6neHw>
 <xmx:o__HYmyJ4vCEEVtcjZHdVs84gzdyQrGHPWhRSidFJTTMJ5uPQW7mgA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 15/69] drm/vc4: hvs: Protect device resources after removal
Date: Fri,  8 Jul 2022 11:56:13 +0200
Message-Id: <20220708095707.257937-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

