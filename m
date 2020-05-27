Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A13C81E59AC
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBD86E49D;
	Thu, 28 May 2020 07:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42046E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 179F75820E5;
 Wed, 27 May 2020 11:51:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=phMcnikxY9Yem
 NSUM3gM7sfHRLZYeHD44iyBhWJvsEU=; b=v+WZhmNoPJp1wKWwaEN0+MRZ3er31
 zhxI7jnpvEAsKYHhkH6rqHB3PNMmjN5752qdlzzoBHb4SKrJ7hbk2SXQEXdgv3mR
 zZQGAstOsi3WSnY1d4YIdSsovsHw66zIrsC6QIkob5FCj0QHgqBBrTPZVPvqdtw2
 YDxdlULYs/pvRE/URkAlR0G6o5EHlsAUtZMIdXDM5waKDi539iNN6ro6c1kSi1Cd
 zm/W/1l0T1fxtHQbP0x4LZcS64kQkG8UxFmieSLYl0phf5TQjO2yUOFFrGfZcoNI
 Z3+42lm1sS/HEZCkkI94tcAdpYIiBplkDFVfYtJezlDOJph4X+rebCT9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=phMcnikxY9YemNSUM3gM7sfHRLZYeHD44iyBhWJvsEU=; b=BNFUvXeH
 +lnWxIbwguw/FxyCu+U/4ab/zuj8YAfCLY2iei1QLh/MM5mjhv6+CCow2G4bFlp5
 ysHveEUoC6TXhJbpgYMdtKrexSc37Oyq12G0uhcTyIQ8KHT8ZU6YH06/FVDHCcaw
 LBohcaoa73p2giBXzfq9yVmpoN1+ditp3Osxbrk4mFSFxA9FQSdiTAuwWbZto7CE
 M2siYUOXaSLCUFWR7xVnBLx7BzYYD8iEzwmq/g+BAZefHlE/sa4lMmFKJ2D6/Alk
 MhSff17tgREfh93Zovrqwd8FMHuNCp88zPIDUkFAuth6CQ8MyxGJRuysjriKCOWS
 INIx5I2f3hZ4Tw==
X-ME-Sender: <xms:ZozOXsDiv7k0b5jaT2tWoPlAz0rF3jZQIqzjsneRazGwStSKZj_vjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeelvdetvddugeeiffetffektdfggfduheeulefgveehgeefgeejvdffueeu
 fefgnecuffhomhgrihhnpehmrghrghhinhhsrdhtohhpnecukfhppeeltddrkeelrdeike
 drjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 mhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZozOXugnYk2-f--nz0i-8qwuibeoFpZOvUQ2mCGulQnyKwNaPVRslA>
 <xmx:ZozOXvnF5RPSrIqB_ap1gESD4jhwwhm5yR-IxdGBLz8It8dADQvuQQ>
 <xmx:ZozOXixtIp2pNgKyIfdRZkH0aBAJMzI-OTHq9w6EJ1ibuBVMcFibTQ>
 <xmx:ZozOXiR8xXErdRAa7UkmcqRb94QPvX0RkjKTM0Czo_kVXBBKmTM8ww>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C03CC3280063;
 Wed, 27 May 2020 11:51:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 066/105] drm/vc4: txp: Turn the TXP into a CRTC of its own
Date: Wed, 27 May 2020 17:48:36 +0200
Message-Id: <e9bc87e240b62c80617ea7825144121a470a2d44.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TXP so far has been leveraging the PixelValve infrastructure in the
driver, that was really two things: the interaction with DRM's CRTC
concept, the setup of the underlying pixelvalve and the setup of the shared
HVS, the pixelvalve part being irrelevant to the TXP since it accesses the
HVS directly.

Now that we have a clear separation between the three parts, we can
represent the TXP as a CRTC of its own, leveraging the common CRTC and HVS
code, but leaving aside the pixelvalve setup.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  19 +------
 drivers/gpu/drm/vc4/vc4_txp.c  | 100 +++++++++++++++++++++++++++++++++-
 2 files changed, 99 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index fbddd38ba6a9..d6eca130644d 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -583,17 +583,6 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 		if (conn_state->crtc != crtc)
 			continue;
 
-		/* The writeback connector is implemented using the transposer
-		 * block which is directly taking its data from the HVS FIFO.
-		 */
-		if (conn->connector_type == DRM_MODE_CONNECTOR_WRITEBACK) {
-			state->no_vblank = true;
-			vc4_state->feed_txp = true;
-		} else {
-			state->no_vblank = false;
-			vc4_state->feed_txp = false;
-		}
-
 		vc4_state->margins.left = conn_state->tv.margins.left;
 		vc4_state->margins.right = conn_state->tv.margins.right;
 		vc4_state->margins.top = conn_state->tv.margins.top;
@@ -1017,7 +1006,6 @@ static void vc4_set_crtc_possible_masks(struct drm_device *drm,
 					struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
 	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
 	const enum vc4_encoder_type *encoder_types = pv_data->encoder_types;
 	struct drm_encoder *encoder;
@@ -1026,13 +1014,6 @@ static void vc4_set_crtc_possible_masks(struct drm_device *drm,
 		struct vc4_encoder *vc4_encoder;
 		int i;
 
-		/* HVS FIFO2 can feed the TXP IP. */
-		if (crtc_data->hvs_output == 2 &&
-		    encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL) {
-			encoder->possible_crtcs |= drm_crtc_mask(crtc);
-			continue;
-		}
-
 		vc4_encoder = to_vc4_encoder(encoder);
 		for (i = 0; i < ARRAY_SIZE(pv_data->encoder_types); i++) {
 			if (vc4_encoder->type == encoder_types[i]) {
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index d9a8ab87ad25..849dcafbfff1 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -19,6 +19,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
 
 #include "vc4_drv.h"
@@ -145,6 +146,8 @@
 #define TXP_WRITE(offset, val) writel(val, txp->regs + (offset))
 
 struct vc4_txp {
+	struct vc4_crtc	base;
+
 	struct platform_device *pdev;
 
 	struct drm_writeback_connector connector;
@@ -362,23 +365,105 @@ static const struct drm_encoder_helper_funcs vc4_txp_encoder_helper_funcs = {
 	.disable = vc4_txp_encoder_disable,
 };
 
+static int vc4_txp_enable_vblank(struct drm_crtc *crtc)
+{
+	return 0;
+}
+
+static void vc4_txp_disable_vblank(struct drm_crtc *crtc) {}
+
+static const struct drm_crtc_funcs vc4_txp_crtc_funcs = {
+	.set_config		= drm_atomic_helper_set_config,
+	.destroy		= vc4_crtc_destroy,
+	.page_flip		= vc4_page_flip,
+	.reset			= vc4_crtc_reset,
+	.atomic_duplicate_state	= vc4_crtc_duplicate_state,
+	.atomic_destroy_state	= vc4_crtc_destroy_state,
+	.gamma_set		= drm_atomic_helper_legacy_gamma_set,
+	.enable_vblank		= vc4_txp_enable_vblank,
+	.disable_vblank		= vc4_txp_disable_vblank,
+};
+
+static int vc4_txp_atomic_check(struct drm_crtc *crtc,
+				struct drm_crtc_state *state)
+{
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(state);
+	int ret;
+
+	ret = vc4_hvs_atomic_check(crtc, state);
+	if (ret)
+		return ret;
+
+	state->no_vblank = true;
+	vc4_state->feed_txp = true;
+
+	return 0;
+}
+
+static void vc4_txp_atomic_enable(struct drm_crtc *crtc,
+				  struct drm_crtc_state *old_state)
+{
+	drm_crtc_vblank_on(crtc);
+	vc4_hvs_atomic_enable(crtc, old_state);
+}
+
+static void vc4_txp_atomic_disable(struct drm_crtc *crtc,
+				   struct drm_crtc_state *old_state)
+{
+	struct drm_device *dev = crtc->dev;
+
+	/* Disable vblank irq handling before crtc is disabled. */
+	drm_crtc_vblank_off(crtc);
+
+	vc4_hvs_atomic_disable(crtc, old_state);
+
+	/*
+	 * Make sure we issue a vblank event after disabling the CRTC if
+	 * someone was waiting it.
+	 */
+	if (crtc->state->event) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&dev->event_lock, flags);
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+		spin_unlock_irqrestore(&dev->event_lock, flags);
+	}
+}
+
+static const struct drm_crtc_helper_funcs vc4_txp_crtc_helper_funcs = {
+	.atomic_check	= vc4_txp_atomic_check,
+	.atomic_flush	= vc4_hvs_atomic_flush,
+	.atomic_enable	= vc4_txp_atomic_enable,
+	.atomic_disable	= vc4_txp_atomic_disable,
+};
+
 static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 {
 	struct vc4_txp *txp = data;
+	struct vc4_crtc *vc4_crtc = &txp->base;
 
 	TXP_WRITE(TXP_DST_CTRL, TXP_READ(TXP_DST_CTRL) & ~TXP_EI);
-	vc4_crtc_handle_vblank(to_vc4_crtc(txp->connector.base.state->crtc));
+	vc4_crtc_handle_vblank(vc4_crtc);
 	drm_writeback_signal_completion(&txp->connector, 0);
 
 	return IRQ_HANDLED;
 }
 
+static const struct vc4_crtc_data vc4_txp_crtc_data = {
+	.hvs_available_channels = BIT(2),
+	.hvs_output = 2,
+};
+
 static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	struct vc4_crtc *vc4_crtc;
 	struct vc4_txp *txp;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
 	int ret, irq;
 
 	irq = platform_get_irq(pdev, 0);
@@ -388,6 +473,11 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	txp = devm_kzalloc(dev, sizeof(*txp), GFP_KERNEL);
 	if (!txp)
 		return -ENOMEM;
+	vc4_crtc = &txp->base;
+	crtc = &vc4_crtc->base;
+
+	vc4_crtc->pdev = pdev;
+	vc4_crtc->data = &vc4_txp_crtc_data;
 
 	txp->pdev = pdev;
 
@@ -407,6 +497,14 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	ret = vc4_crtc_init(drm, vc4_crtc,
+			    &vc4_txp_crtc_funcs, &vc4_txp_crtc_helper_funcs);
+	if (ret)
+		return ret;
+
+	encoder = &txp->connector.encoder;
+	encoder->possible_crtcs |= drm_crtc_mask(crtc);
+
 	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
 			       dev_name(dev), txp);
 	if (ret)
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
