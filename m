Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC404BDA01
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 14:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF19610E3AA;
	Mon, 21 Feb 2022 13:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D5410E392
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 13:42:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A1A15C0230;
 Mon, 21 Feb 2022 08:42:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 21 Feb 2022 08:42:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=Rn9acsUzu5w23+5zjHRbakKoPFjFn3
 H+WvWPiuOPElY=; b=GJaEtakRJKfZDhWoayjkRAM0onMLOKR0nDxMu0RjtZb/Nk
 3bMTD0VrBTrnhB7l3Lv59p4464SWmsB7rIA22qsdJx6BT2hFPTvQHQANMGYLuMa3
 dHTN7D/Z/s8zUYufbIVNz4MKNNsEYIi9Ls4Tk8ziGslM3f0j3uA6dsPPYpchBItu
 FKlbeHrfuyD5phlm9x2doo6Mekpioj9kbyvFuZdZ3czDE26+QSqB/oC7jYT0HKYm
 t4A6sysuDvH+WHqh55m6iiN7lco6RGtXJF/qcVdYJsGDfNdFsW5jc+622rFyPWCl
 z26NiMwvi2y7vVwIdNNwkgHYSJkKnS11STGnuQVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Rn9acs
 Uzu5w23+5zjHRbakKoPFjFn3H+WvWPiuOPElY=; b=i4p9WR5jtD0AmumvwBTxxu
 UMHCKL/BZYdCk8otKo3SFRT52Z15hGEy5jR2dgA+B9Ot7Fh1MB/ROtnfuenQBiAI
 tbyFp0ok4vEiIir9nrdNc7q0M+Kziyv6yG/HIAzQpb/unMXJeZXDlgrRffoDE6ft
 pETfq9BnEn7ASVkcs8ixafCFIIzHCg+rAxIRjZJdGHAzw5tHD9McZ1EYYx/ra4yi
 FRdW1hVNmisCYSvQfrLOYFJkgVJyw62EfvdwIh9/sMAJIMaJv8zmOkrkD0wiWAGE
 8Lj80VCKcKS/Gradryqm7InQh+YQTRI4Q+AiOayI+DxExZWYtbaJj7mB2busClTQ
 ==
X-ME-Sender: <xms:t5YTYtEGvaaGYpv0Q7J4lpREqYCvKsojQ1R8TXgVBKuYfBYwbQ9RBw>
 <xme:t5YTYiXJPaElcBXZu3xJvzpC8-swvTj6wss7CHjkbhVWKmZAyNNEZj2e3FJ6JWJt8
 EVzWDHZ8-RIhCDO0hA>
X-ME-Received: <xmr:t5YTYvI6gqU3cU3ktx2waoioAKX4N2DqwXz5Nh2AhK7wBwOWQQX9dEYlbUlT7H1JF6-XNPs2tpJDIOoKiZYAucJDMQVB3HT_fTcVqwE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:t5YTYjHxY_ExiXW5aztjpT1DwcVp0yDTSSAJt3qG_fVNDRctFvjTKw>
 <xmx:t5YTYjV8r6XX08sYs5ZtedopnAlEU7RjDuQ4JZBgpi5x-fAS5QCgSg>
 <xmx:t5YTYuMcEi0Spjh2UQdWnRk-rhf21dME9d2e643sxmitU7od9QZPbQ>
 <xmx:t5YTYvrD3bem8N_vC78T2w8S2Iys8GNToRZJt8OBV0sAc37rEcHVpA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 08:42:14 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 7/8] drm/vc4: hvs: Use pointer to HVS in HVS_READ and
 HVS_WRITE macros
Date: Mon, 21 Feb 2022 14:41:54 +0100
Message-Id: <20220221134155.125447-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221134155.125447-1-maxime@cerno.tech>
References: <20220221134155.125447-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Those macros are really about the HVS itself, and thus its associated
structure vc4_hvs, rather than the entire (virtual) vc4 device.

Let's change those macros to use the hvs pointer directly, and change
the calling sites accordingly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 14 +++++--
 drivers/gpu/drm/vc4/vc4_drv.h  | 16 +++----
 drivers/gpu/drm/vc4/vc4_hvs.c  | 77 +++++++++++++++++-----------------
 drivers/gpu/drm/vc4/vc4_kms.c  |  5 ++-
 4 files changed, 60 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 72fadce38d32..5bb4027e479e 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -70,6 +70,7 @@ static const struct debugfs_reg32 crtc_regs[] = {
 static unsigned int
 vc4_crtc_get_cob_allocation(struct vc4_dev *vc4, unsigned int channel)
 {
+	struct vc4_hvs *hvs = vc4->hvs;
 	u32 dispbase = HVS_READ(SCALER_DISPBASEX(channel));
 	/* Top/base are supposed to be 4-pixel aligned, but the
 	 * Raspberry Pi firmware fills the low bits (which are
@@ -89,6 +90,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
 	unsigned int cob_size;
@@ -123,7 +125,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 		*vpos /= 2;
 
 		/* Use hpos to correct for field offset in interlaced mode. */
-		if (vc4_hvs_get_fifo_frame_count(dev, vc4_crtc_state->assigned_channel) % 2)
+		if (vc4_hvs_get_fifo_frame_count(hvs, vc4_crtc_state->assigned_channel) % 2)
 			*hpos += mode->crtc_htotal / 2;
 	}
 
@@ -413,6 +415,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 static void require_hvs_enabled(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hvs *hvs = vc4->hvs;
 
 	WARN_ON_ONCE((HVS_READ(SCALER_DISPCTRL) & SCALER_DISPCTRL_ENABLE) !=
 		     SCALER_DISPCTRL_ENABLE);
@@ -426,6 +429,7 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int ret;
 
 	CRTC_WRITE(PV_V_CONTROL,
@@ -455,7 +459,7 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 		vc4_encoder->post_crtc_disable(encoder, state);
 
 	vc4_crtc_pixelvalve_reset(crtc);
-	vc4_hvs_stop_channel(dev, channel);
+	vc4_hvs_stop_channel(vc4->hvs, channel);
 
 	if (vc4_encoder && vc4_encoder->post_crtc_powerdown)
 		vc4_encoder->post_crtc_powerdown(encoder, state);
@@ -481,6 +485,7 @@ static struct drm_encoder *vc4_crtc_get_encoder_by_type(struct drm_crtc *crtc,
 int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 {
 	struct drm_device *drm = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	enum vc4_encoder_type encoder_type;
 	const struct vc4_pv_data *pv_data;
@@ -502,7 +507,7 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 	if (!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN))
 		return 0;
 
-	channel = vc4_hvs_get_fifo_from_output(drm, vc4_crtc->data->hvs_output);
+	channel = vc4_hvs_get_fifo_from_output(vc4->hvs, vc4_crtc->data->hvs_output);
 	if (channel < 0)
 		return 0;
 
@@ -715,6 +720,7 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 	struct drm_crtc *crtc = &vc4_crtc->base;
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hvs *hvs = vc4->hvs;
 	u32 chan = vc4_crtc->current_hvs_channel;
 	unsigned long flags;
 
@@ -733,7 +739,7 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 		 * the CRTC and encoder already reconfigured, leading to
 		 * underruns. This can be seen when reconfiguring the CRTC.
 		 */
-		vc4_hvs_unmask_underrun(dev, chan);
+		vc4_hvs_unmask_underrun(hvs, chan);
 	}
 	spin_unlock(&vc4_crtc->irq_lock);
 	spin_unlock_irqrestore(&dev->event_lock, flags);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 801da3e8ebdb..15e0c2ac3940 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -574,8 +574,8 @@ to_vc4_crtc_state(struct drm_crtc_state *crtc_state)
 
 #define V3D_READ(offset) readl(vc4->v3d->regs + offset)
 #define V3D_WRITE(offset, val) writel(val, vc4->v3d->regs + offset)
-#define HVS_READ(offset) readl(vc4->hvs->regs + offset)
-#define HVS_WRITE(offset, val) writel(val, vc4->hvs->regs + offset)
+#define HVS_READ(offset) readl(hvs->regs + offset)
+#define HVS_WRITE(offset, val) writel(val, hvs->regs + offset)
 
 #define VC4_REG32(reg) { .name = #reg, .offset = reg }
 
@@ -933,17 +933,17 @@ void vc4_irq_reset(struct drm_device *dev);
 
 /* vc4_hvs.c */
 extern struct platform_driver vc4_hvs_driver;
-void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int output);
-int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int output);
-u8 vc4_hvs_get_fifo_frame_count(struct drm_device *dev, unsigned int fifo);
+void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int output);
+int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output);
+u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo);
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_begin(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state);
-void vc4_hvs_dump_state(struct drm_device *dev);
-void vc4_hvs_unmask_underrun(struct drm_device *dev, int channel);
-void vc4_hvs_mask_underrun(struct drm_device *dev, int channel);
+void vc4_hvs_dump_state(struct vc4_hvs *hvs);
+void vc4_hvs_unmask_underrun(struct vc4_hvs *hvs, int channel);
+void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel);
 
 /* vc4_kms.c */
 int vc4_kms_load(struct drm_device *dev);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 5db125dc2358..50faa5227cf1 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -64,22 +64,21 @@ static const struct debugfs_reg32 hvs_regs[] = {
 	VC4_REG32(SCALER_OLEDCOEF2),
 };
 
-void vc4_hvs_dump_state(struct drm_device *dev)
+void vc4_hvs_dump_state(struct vc4_hvs *hvs)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_printer p = drm_info_printer(&vc4->hvs->pdev->dev);
+	struct drm_printer p = drm_info_printer(&hvs->pdev->dev);
 	int i;
 
-	drm_print_regset32(&p, &vc4->hvs->regset);
+	drm_print_regset32(&p, &hvs->regset);
 
 	DRM_INFO("HVS ctx:\n");
 	for (i = 0; i < 64; i += 4) {
 		DRM_INFO("0x%08x (%s): 0x%08x 0x%08x 0x%08x 0x%08x\n",
 			 i * 4, i < HVS_BOOTLOADER_DLIST_END ? "B" : "D",
-			 readl((u32 __iomem *)vc4->hvs->dlist + i + 0),
-			 readl((u32 __iomem *)vc4->hvs->dlist + i + 1),
-			 readl((u32 __iomem *)vc4->hvs->dlist + i + 2),
-			 readl((u32 __iomem *)vc4->hvs->dlist + i + 3));
+			 readl((u32 __iomem *)hvs->dlist + i + 0),
+			 readl((u32 __iomem *)hvs->dlist + i + 1),
+			 readl((u32 __iomem *)hvs->dlist + i + 2),
+			 readl((u32 __iomem *)hvs->dlist + i + 3));
 	}
 }
 
@@ -157,11 +156,10 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
 	return 0;
 }
 
-static void vc4_hvs_lut_load(struct drm_crtc *crtc)
+static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
+			     struct vc4_crtc *vc4_crtc)
 {
-	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct drm_crtc *crtc = &vc4_crtc->base;
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	u32 i;
 
@@ -181,11 +179,12 @@ static void vc4_hvs_lut_load(struct drm_crtc *crtc)
 		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_b[i]);
 }
 
-static void vc4_hvs_update_gamma_lut(struct drm_crtc *crtc)
+static void vc4_hvs_update_gamma_lut(struct vc4_hvs *hvs,
+				     struct vc4_crtc *vc4_crtc)
 {
-	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct drm_color_lut *lut = crtc->state->gamma_lut->data;
-	u32 length = drm_color_lut_size(crtc->state->gamma_lut);
+	struct drm_crtc_state *crtc_state = vc4_crtc->base.state;
+	struct drm_color_lut *lut = crtc_state->gamma_lut->data;
+	u32 length = drm_color_lut_size(crtc_state->gamma_lut);
 	u32 i;
 
 	for (i = 0; i < length; i++) {
@@ -194,12 +193,11 @@ static void vc4_hvs_update_gamma_lut(struct drm_crtc *crtc)
 		vc4_crtc->lut_b[i] = drm_color_lut_extract(lut[i].blue, 8);
 	}
 
-	vc4_hvs_lut_load(crtc);
+	vc4_hvs_lut_load(hvs, vc4_crtc);
 }
 
-u8 vc4_hvs_get_fifo_frame_count(struct drm_device *dev, unsigned int fifo)
+u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	u8 field = 0;
 
 	switch (fifo) {
@@ -220,13 +218,12 @@ u8 vc4_hvs_get_fifo_frame_count(struct drm_device *dev, unsigned int fifo)
 	return field;
 }
 
-int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int output)
+int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	u32 reg;
 	int ret;
 
-	if (!vc4->hvs->hvs5)
+	if (!hvs->hvs5)
 		return output;
 
 	switch (output) {
@@ -273,9 +270,10 @@ int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int output)
 	}
 }
 
-static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
+static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 				struct drm_display_mode *mode, bool oneshot)
 {
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
 	unsigned int chan = vc4_crtc_state->assigned_channel;
 	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
@@ -293,7 +291,7 @@ static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
 	 */
 	dispctrl = SCALER_DISPCTRLX_ENABLE;
 
-	if (!vc4->hvs->hvs5)
+	if (!hvs->hvs5)
 		dispctrl |= VC4_SET_FIELD(mode->hdisplay,
 					  SCALER_DISPCTRLX_WIDTH) |
 			    VC4_SET_FIELD(mode->vdisplay,
@@ -314,21 +312,19 @@ static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
 
 	HVS_WRITE(SCALER_DISPBKGNDX(chan), dispbkgndx |
 		  SCALER_DISPBKGND_AUTOHS |
-		  ((!vc4->hvs->hvs5) ? SCALER_DISPBKGND_GAMMA : 0) |
+		  ((!hvs->hvs5) ? SCALER_DISPBKGND_GAMMA : 0) |
 		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
 
 	/* Reload the LUT, since the SRAMs would have been disabled if
 	 * all CRTCs had SCALER_DISPBKGND_GAMMA unset at once.
 	 */
-	vc4_hvs_lut_load(crtc);
+	vc4_hvs_lut_load(hvs, vc4_crtc);
 
 	return 0;
 }
 
-void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int chan)
+void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-
 	if (HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_ENABLE)
 		return;
 
@@ -386,6 +382,7 @@ static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 
 	HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
@@ -442,18 +439,19 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 
 	vc4_hvs_install_dlist(crtc);
 	vc4_hvs_update_dlist(crtc);
-	vc4_hvs_init_channel(vc4, crtc, mode, oneshot);
+	vc4_hvs_init_channel(vc4->hvs, crtc, mode, oneshot);
 }
 
 void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
 			    struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state, crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(old_state);
 	unsigned int chan = vc4_state->assigned_channel;
 
-	vc4_hvs_stop_channel(dev, chan);
+	vc4_hvs_stop_channel(vc4->hvs, chan);
 }
 
 void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
@@ -463,6 +461,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 									 crtc);
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hvs *hvs = vc4->hvs;
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	unsigned int channel = vc4_state->assigned_channel;
 	struct drm_plane *plane;
@@ -477,7 +477,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 
 	if (debug_dump_regs) {
 		DRM_INFO("CRTC %d HVS before:\n", drm_crtc_index(crtc));
-		vc4_hvs_dump_state(dev);
+		vc4_hvs_dump_state(hvs);
 	}
 
 	/* Copy all the active planes' dlist contents to the hardware dlist. */
@@ -528,7 +528,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(channel));
 
 		if (crtc->state->gamma_lut) {
-			vc4_hvs_update_gamma_lut(crtc);
+			vc4_hvs_update_gamma_lut(hvs, vc4_crtc);
 			dispbkgndx |= SCALER_DISPBKGND_GAMMA;
 		} else {
 			/* Unsetting DISPBKGND_GAMMA skips the gamma lut step
@@ -542,13 +542,12 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 
 	if (debug_dump_regs) {
 		DRM_INFO("CRTC %d HVS after:\n", drm_crtc_index(crtc));
-		vc4_hvs_dump_state(dev);
+		vc4_hvs_dump_state(hvs);
 	}
 }
 
-void vc4_hvs_mask_underrun(struct drm_device *dev, int channel)
+void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	u32 dispctrl = HVS_READ(SCALER_DISPCTRL);
 
 	dispctrl &= ~SCALER_DISPCTRL_DSPEISLUR(channel);
@@ -556,9 +555,8 @@ void vc4_hvs_mask_underrun(struct drm_device *dev, int channel)
 	HVS_WRITE(SCALER_DISPCTRL, dispctrl);
 }
 
-void vc4_hvs_unmask_underrun(struct drm_device *dev, int channel)
+void vc4_hvs_unmask_underrun(struct vc4_hvs *hvs, int channel)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	u32 dispctrl = HVS_READ(SCALER_DISPCTRL);
 
 	dispctrl |= SCALER_DISPCTRL_DSPEISLUR(channel);
@@ -580,6 +578,7 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
 {
 	struct drm_device *dev = data;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hvs *hvs = vc4->hvs;
 	irqreturn_t irqret = IRQ_NONE;
 	int channel;
 	u32 control;
@@ -592,7 +591,7 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
 		/* Interrupt masking is not always honored, so check it here. */
 		if (status & SCALER_DISPSTAT_EUFLOW(channel) &&
 		    control & SCALER_DISPCTRL_DSPEISLUR(channel)) {
-			vc4_hvs_mask_underrun(dev, channel);
+			vc4_hvs_mask_underrun(hvs, channel);
 			vc4_hvs_report_underrun(dev);
 
 			irqret = IRQ_HANDLED;
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 992d6a240002..0cee33464491 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -157,6 +157,7 @@ static u16 vc4_ctm_s31_32_to_s0_9(u64 in)
 static void
 vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
 {
+	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_ctm_state *ctm_state = to_vc4_ctm_state(vc4->ctm_manager.state);
 	struct drm_color_ctm *ctm = ctm_state->ctm;
 
@@ -230,6 +231,7 @@ vc4_hvs_get_global_state(struct drm_atomic_state *state)
 static void vc4_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 				     struct drm_atomic_state *state)
 {
+	struct vc4_hvs *hvs = vc4->hvs;
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
 	unsigned int i;
@@ -270,6 +272,7 @@ static void vc4_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 				     struct drm_atomic_state *state)
 {
+	struct vc4_hvs *hvs = vc4->hvs;
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
 	unsigned char mux;
@@ -362,7 +365,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 			continue;
 
 		vc4_crtc_state = to_vc4_crtc_state(new_crtc_state);
-		vc4_hvs_mask_underrun(dev, vc4_crtc_state->assigned_channel);
+		vc4_hvs_mask_underrun(hvs, vc4_crtc_state->assigned_channel);
 	}
 
 	for (channel = 0; channel < HVS_NUM_CHANNELS; channel++) {
-- 
2.35.1

