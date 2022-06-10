Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2BE546227
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C560311A678;
	Fri, 10 Jun 2022 09:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B63B11A01D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A5EFD5C01AC;
 Fri, 10 Jun 2022 05:29:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 05:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853391; x=1654939791; bh=YU
 TNfp8xtWgEhOs31hSmQFh0ViDqCvFvS2dRCIGTHfE=; b=AYtIFpduK3tm2JNkJB
 7qUHTAniNcPLasxHvFBPH3U/y83T61vpDTTqjcheq9nJc9z1quHoe9a20a8YM32l
 mHRzqpoIBEvDfcqiXL3szC27t8KypwvMYbqUZPw1Ve32G0tmJ52on12QH48IHjyq
 IeC0jzHCFdYXd5vkdp7bA1oJZ57lqarxlRK2KVmIJmRSGIb4TuaSKCNfqzrAhMCY
 UNqRDmic62rCwa2D5eDnTyHyn06cDU9prVQROfNgojGwFONe5fDKhSyc2vgXgJ7z
 aZMGAD7vz7Pc1/CalCfl3qx7e8YsDeryuxLlkyj9IQYkJ3KQLqYEC6ruuBqrsGEh
 O1QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853391; x=1654939791; bh=YUTNfp8xtWgEh
 Os31hSmQFh0ViDqCvFvS2dRCIGTHfE=; b=T9YwrJa6on/ZidoAqOoCoc3D85tfe
 yv+vgUsXn4T3xVOCUQRMobyBFH+tBPyirkPhK3rsstDXaGtQrR+5aebbrSOfTU+E
 4enilwVPIVZKxMYl6kMsHl75/QwO3KCyh0TaK1jn/4dOvBtDctflU4dqqQqQvnep
 Ky+jOtXODGqIPy28TfrsrirJlIJ7haq0NmGqRphIpaNcVM+a/Nn7PY3UHGpX8r2j
 ach2RHWSLHC0N621+QFyL3iGJtEqQecN/6+vZAqf2rcw7KjXLP03lK5wOEQ8DyiF
 nKlMzmnrDonyub4TbI55vEB35iPm5cFTieyrStCK6wEf2Ukmn5VZ50cyQ==
X-ME-Sender: <xms:Dw-jYmNbCGjmazzSR7d4ynl9_0emgvcEynO6M5_h9iguxhnat2eLCg>
 <xme:Dw-jYk_34y4RcRpYA7Fozkodo42Oq3Tphvf0zZcYTVttHm2pRTHSaKFjz3BYo3wuy
 Qjr0gGbhTQHU4OF-f0>
X-ME-Received: <xmr:Dw-jYtSedT3k0DCfbzbbUFDymMtPCJVxJuttOpzooZKWN65IeAJHCEnMsJ4qbQxShIafQ5SQjCgFlmTm-afS1oK3sPqQWbg4puyuKco>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Dw-jYmuEGmBilmmsWGAW3d2rxVeFJxj3pyDOlsltzMgE07VQGOVsqg>
 <xmx:Dw-jYudHKtcGTN0NwGCpCHkWCFyg3B-qf_8iiuCXaT2_iwwXzGuV9A>
 <xmx:Dw-jYq3DdLUG2dBXUTU6rZ0HeoXqf7g967lkPJWIO2-XUCmXwk9IyQ>
 <xmx:Dw-jYt4V8koo_fOZ-BzpkLUCXdQJgusAaoJPZEhT4GnVcm5h5ArUnw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 13/64] drm/vc4: hvs: Protect device resources after removal
Date: Fri, 10 Jun 2022 11:28:33 +0200
Message-Id: <20220610092924.754942-14-maxime@cerno.tech>
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
for the section protected by those calls. Let's add them to the HVS driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h |   1 +
 drivers/gpu/drm/vc4/vc4_hvs.c | 106 +++++++++++++++++++++++++++++++---
 2 files changed, 99 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index aa4c5910ea05..080deae55f64 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -317,6 +317,7 @@ struct vc4_v3d {
 };
 
 struct vc4_hvs {
+	struct drm_device *dev;
 	struct platform_device *pdev;
 	void __iomem *regs;
 	u32 __iomem *dlist;
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 2a58fc421cf6..483053e7b14f 100644
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
+	struct drm_device *drm = hvs->dev;
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
@@ -132,14 +139,18 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
 					struct drm_mm_node *space,
 					const u32 *kernel)
 {
-	int ret, i;
+	struct drm_device *drm = hvs->dev;
+	int idx, ret, i;
 	u32 __iomem *dst_kernel;
 
+	if (!drm_dev_enter(drm, &idx))
+		return -ENODEV;
+
 	ret = drm_mm_insert_node(&hvs->dlist_mm, space, VC4_KERNEL_DWORDS);
 	if (ret) {
 		DRM_ERROR("Failed to allocate space for filter kernel: %d\n",
 			  ret);
-		return ret;
+		goto err_dev_exit;
 	}
 
 	dst_kernel = hvs->dlist + space->start;
@@ -153,16 +164,26 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
 		}
 	}
 
+	drm_dev_exit(idx);
 	return 0;
+
+err_dev_exit:
+	drm_dev_exit(idx);
+	return ret;
 }
 
 static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
 			     struct vc4_crtc *vc4_crtc)
 {
+	struct drm_device *drm = hvs->dev;
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
@@ -177,6 +198,8 @@ static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
 		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_g[i]);
 	for (i = 0; i < crtc->gamma_size; i++)
 		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_b[i]);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_hvs_update_gamma_lut(struct vc4_hvs *hvs,
@@ -198,7 +221,12 @@ static void vc4_hvs_update_gamma_lut(struct vc4_hvs *hvs,
 
 u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 {
+	struct drm_device *drm = hvs->dev;
 	u8 field = 0;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return 0;
 
 	switch (fifo) {
 	case 0:
@@ -215,6 +243,7 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 		break;
 	}
 
+	drm_dev_exit(idx);
 	return field;
 }
 
@@ -226,6 +255,12 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
 	if (!hvs->hvs5)
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
@@ -273,12 +308,17 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
 static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 				struct drm_display_mode *mode, bool oneshot)
 {
+	struct drm_device *drm = hvs->dev;
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
@@ -320,13 +360,21 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 	 */
 	vc4_hvs_lut_load(hvs, vc4_crtc);
 
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
 void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 {
+	struct drm_device *drm = hvs->dev;
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
@@ -343,6 +391,9 @@ void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 	WARN_ON_ONCE((HVS_READ(SCALER_DISPSTATX(chan)) &
 		      (SCALER_DISPSTATX_FULL | SCALER_DISPSTATX_EMPTY)) !=
 		     SCALER_DISPSTATX_EMPTY);
+
+out:
+	drm_dev_exit(idx);
 }
 
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
@@ -384,9 +435,15 @@ static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
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
@@ -471,6 +528,10 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	bool enable_bg_fill = false;
 	u32 __iomem *dlist_start = vc4->hvs->dlist + vc4_state->mm.start;
 	u32 __iomem *dlist_next = dlist_start;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	if (debug_dump_regs) {
 		DRM_INFO("CRTC %d HVS before:\n", drm_crtc_index(crtc));
@@ -541,26 +602,44 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 		DRM_INFO("CRTC %d HVS after:\n", drm_crtc_index(crtc));
 		vc4_hvs_dump_state(hvs);
 	}
+
+	drm_dev_exit(idx);
 }
 
 void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel)
 {
-	u32 dispctrl = HVS_READ(SCALER_DISPCTRL);
+	struct drm_device *drm = hvs->dev;
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
+	struct drm_device *drm = hvs->dev;
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
@@ -581,6 +660,17 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
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
 
@@ -613,10 +703,10 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	u32 dispctrl;
 	u32 reg;
 
-	hvs = devm_kzalloc(&pdev->dev, sizeof(*hvs), GFP_KERNEL);
+	hvs = drmm_kzalloc(drm, sizeof(*hvs), GFP_KERNEL);
 	if (!hvs)
 		return -ENOMEM;
-
+	hvs->dev = drm;
 	hvs->pdev = pdev;
 
 	if (of_device_is_compatible(pdev->dev.of_node, "brcm,bcm2711-hvs"))
-- 
2.36.1

