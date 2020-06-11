Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6EA1F82B3
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2566E420;
	Sat, 13 Jun 2020 10:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99466E90B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 13:38:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3ECBB5801CA;
 Thu, 11 Jun 2020 09:38:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Jun 2020 09:38:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+m2swhblseBEj
 aiFoqtzMYXrHCzU7TlekXk/VtxTAlY=; b=To4PYdMPAf/bml31uVUxUulqZ0j+3
 JPh41Jbs6tqPisSFfJboxZfwim72edaQUbr5FH6EbunqRMKYQV8CyClc4ngqIvNQ
 FqD1kRG35GiHH0dT3sSYBXr/KDpyTbE5C6KskrbyO+/sHpiiOxxibrdu9QMtfwkf
 F+VVwaGCP6zZu9nu1j9OqISz2tJ0SjzEVz/RuSYqGMh0OujYIQvIhlDt6n7lgHha
 yTah+yqtxPJBu/k6F4+Dd/1t+BXOQmvA5/E+XWOJx+HRJMfgI53N9W5opL4fqOVM
 7BvglswYJ6saGr3NOtvO1StZmWuNRVd9vx6QyI+0zVcyyn3dNvm49K7ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+m2swhblseBEjaiFoqtzMYXrHCzU7TlekXk/VtxTAlY=; b=oAiEGbdG
 ha6YsvrHqu9/HW7P4BmQpdIr+lBWQf/yPTt3WscX3WHTXdvtp8rHIwK4JCLc8CK/
 6XFYDGMcltl4rdejRYB5ljDr2FSGkJFUHlK0XEsqlTpaYk3Qnr1+Q0YNIolLiknU
 QQMfTdDLIETIVdn0W9T8Vsj8MgLAInCpGWWWAd7zIQ/b68EQfTnF9c7cPEwznK6p
 R1rk5yWPdENQ2/MEqWGu2RDM5xQySN/ZdbCEO2g2UD59yd8zBet4nxqrEKyU1JcP
 DzPuFbn5JlI426hkAjY9POgdyXeD4ZNMYNS3zhPOGT8ZQw7mkETbTizR7vvDx7sP
 W3Qun4R2YwDrvQ==
X-ME-Sender: <xms:3zPiXl5ZogcOyCQCiqVGKz3FFnK_97bNVW_VJm0prdYcHrndVDPMWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehledggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeelvdetvddugeeiffetffektdfggfduheeulefgveehgeefgeejvdffueeu
 fefgnecuffhomhgrihhnpehmrghrghhinhhsrdhtohhpnecukfhppeeltddrkeelrdeike
 drjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 mhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3zPiXi6dCEuPehJUzrz0ZqOTmdZhaOZRe4IYqDc1eBmd7w0U0BAHfA>
 <xmx:3zPiXseYqnEHo0lAu00IchBdKSB1PlLPCLQNNGKx78fgqwQQKxhrTw>
 <xmx:3zPiXuJCPVkVmRkJnOdl_bY1JRFXa0-z4TWeXvDaRUbC_zKQYfp0BQ>
 <xmx:3zPiXurOq4l2ESW-X6spf2sO07P_OPRmKfpKzI4eqqCo6hJmb8HZGg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3854C30666A2;
 Thu, 11 Jun 2020 09:37:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 8/9] drm/vc4: txp: Turn the TXP into a CRTC of its own
Date: Thu, 11 Jun 2020 15:36:53 +0200
Message-Id: <20f387f881b57f3474fa42d94cfd8bc1b7b80595.1591882579.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
References: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  19 +------
 drivers/gpu/drm/vc4/vc4_txp.c  | 100 +++++++++++++++++++++++++++++++++-
 2 files changed, 99 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 82ebdf8da108..0c9d14c70485 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -475,17 +475,6 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
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
@@ -828,7 +817,6 @@ static void vc4_set_crtc_possible_masks(struct drm_device *drm,
 					struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
 	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
 	const enum vc4_encoder_type *encoder_types = pv_data->encoder_types;
 	struct drm_encoder *encoder;
@@ -837,13 +825,6 @@ static void vc4_set_crtc_possible_masks(struct drm_device *drm,
 		struct vc4_encoder *vc4_encoder;
 		int i;
 
-		/* HVS FIFO2 can feed the TXP IP. */
-		if (crtc_data->hvs_channel == 2 &&
-		    encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL) {
-			encoder->possible_crtcs |= drm_crtc_mask(crtc);
-			continue;
-		}
-
 		vc4_encoder = to_vc4_encoder(encoder);
 		for (i = 0; i < ARRAY_SIZE(pv_data->encoder_types); i++) {
 			if (vc4_encoder->type == encoder_types[i]) {
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index d9a8ab87ad25..a7c3af0005a0 100644
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
+	.mode_set_nofb	= vc4_hvs_mode_set_nofb,
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
+	.hvs_channel = 2,
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
