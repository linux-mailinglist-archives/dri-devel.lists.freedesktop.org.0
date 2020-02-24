Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B588516A2DA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364806E354;
	Mon, 24 Feb 2020 09:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D246E220
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id A942B64A;
 Mon, 24 Feb 2020 04:10:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=fKUtkVEVE/+S6
 t7yErfktxu5bVcjic2Qk85kQZ+xCE0=; b=xEuwelAcKNSUneO2IDMTqujzRhlr9
 fDQ03TAPiAu8elnTRlYpd216W+D44z8wqjgsxz5DdHpmUOiiSfq33muujIm9+5EQ
 gm4iCWRJQbWW0/5SqjgtFLp5ZExaPew6yuqsjnRHd1ksK9vIkht2/+r0T3EMGfn5
 AcWH5+bZAOKZXhsY3C5DjjmeEiLP6aYCoOCpX3Rj+20Ez2Yl6+eDMjHf8Lfjyj/E
 yRvfpniZMI0CbPVmvxkS+rrib1RcassFu+3NwknjlgBzHttj9UX6FDH/b/Su0lUD
 LPXZcloo/9lukBgfZ1B8iU1RVhT3Tb1DzOhUaPrwSO8d5bWPorW9/xtbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=fKUtkVEVE/+S6t7yErfktxu5bVcjic2Qk85kQZ+xCE0=; b=twzyhnzx
 Q6BUjboiIDi+zmnmMexsVdamTJFLEh4TS0zpy3GOjG1Uw5UED/GQT6PZg5ACMo2F
 hjeC9shCEsfIOYfcn/8JJbRIO+rkVLwqkbID8++Agu/LlAM1L/epEgO27jB+COXd
 f62C63xlo+lPyTw/wb6C+l+Ro4c6TE0DFVPz9sydc9hXoIYqmiJRhGHNUDKktlny
 k1v4C900fkGMJRR9B2FUL0iZVkV5UvFWnQ4b3vr/1wEzbq2nvY3aWiQBDBgRjOD9
 HDPn3MOD+jH5Tzdjm7bBChTpXeFcChbFZCqnOE3Dy+D/l5OJfiFzxQDwzyNGXy+5
 2mMkFToLZ5O8Mw==
X-ME-Sender: <xms:HZNTXp_Z1yeY-bKlswBgHqa9GAM-1qLv8poy8U77a_7ZPrw-EbFCNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepvdefnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HZNTXvzF1LQZPhDps5q6lRbH1cG8uELcHp0Sj0Dl7OS5kc_aNmhvRg>
 <xmx:HZNTXlK6na1j4YpdvSHHPTjmHp1Lr3o9OzFv8ihLUpKeWqV3ouoVXQ>
 <xmx:HZNTXiZ1-yx-cB9mgKVBEAheLZsoxq8FUrwNIpssASjZ3rMLJoDEIg>
 <xmx:HZNTXk2lVAPmY4ij4CDeg0ZaXUlo13tPoLlcbz5JCkjpyvAVu6cRIZOeB3o>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E556D328005E;
 Mon, 24 Feb 2020 04:10:52 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 86/89] drm/vc4: hdmi: Adjust HSM clock rate depending on pixel
 rate
Date: Mon, 24 Feb 2020 10:07:28 +0100
Message-Id: <abf64b907cd23488e06d2aca4991ac1be216ec8f.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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

The HSM clock needs to be setup at around 110% of the pixel rate. This
was done previously by setting the clock rate to 148.5MHz * 108% at
probe time and only check in mode_valid whether the mode pixel clock was
under 148.5MHz or not.

However, with 4k we need to change that frequency to a higher frequency
than 148.5MHz.

Let's change that logic a bit by setting the clock rate of the HSM clock
to the pixel rate at encoder_enable time. This would work for the
BCM2711 that support 4k resolutions and has a clock that can provide it,
but we still have to take care of a 4k panel plugged on a BCM283x SoCs
that wouldn't be able to use those modes, so let's define the limit in
the variant.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 55 ++++++++++++++++-------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 ++-
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 2cbb950f5d5a..079bec993598 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -52,7 +52,6 @@
 #include "vc4_hdmi_regs.h"
 #include "vc4_regs.h"
 
-#define HSM_CLOCK_FREQ 163682864
 #define CEC_CLOCK_FREQ 40000
 
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
@@ -328,6 +327,7 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
 
+	clk_disable_unprepare(vc4_hdmi->hsm_clock);
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 
 	ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
@@ -425,6 +425,7 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	bool debug_dump_regs = false;
+	unsigned long pixel_rate, hsm_rate;
 	int ret;
 
 	ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
@@ -433,9 +434,8 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
-	ret = clk_set_rate(vc4_hdmi->pixel_clock,
-			   mode->clock * 1000 *
-			   ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1));
+	pixel_rate = mode->clock * 1000 * ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1);
+	ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
 		return;
@@ -447,6 +447,24 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
+	/*
+	 * The HSM rate needs to be at 108% of the pixel clock, with a
+	 * minimum of 108MHz.
+	 */
+	hsm_rate = max_t(unsigned long, 108000000, (pixel_rate / 100) * 108);
+	ret = clk_set_rate(vc4_hdmi->hsm_clock, hsm_rate);
+	if (ret) {
+		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
+		return;
+	}
+
+	ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
+	if (ret) {
+		DRM_ERROR("Failed to turn on HSM clock: %d\n", ret);
+		clk_disable_unprepare(vc4_hdmi->pixel_clock);
+		return;
+	}
+
 	if (vc4_hdmi->variant->reset)
 		vc4_hdmi->variant->reset(vc4_hdmi);
 
@@ -561,11 +579,9 @@ static enum drm_mode_status
 vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
-	/* HSM clock must be 108% of the pixel clock.  Additionally,
-	 * the AXI clock needs to be at least 25% of pixel clock, but
-	 * HSM ends up being the limiting factor.
-	 */
-	if (mode->clock > HSM_CLOCK_FREQ / (1000 * 108 / 100))
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+
+	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
@@ -1338,23 +1354,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		return -EPROBE_DEFER;
 	}
 
-	/* This is the rate that is set by the firmware.  The number
-	 * needs to be a bit higher than the pixel clock rate
-	 * (generally 148.5Mhz).
-	 */
-	ret = clk_set_rate(vc4_hdmi->hsm_clock, HSM_CLOCK_FREQ);
-	if (ret) {
-		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
-		goto err_put_i2c;
-	}
-
-	ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
-	if (ret) {
-		DRM_ERROR("Failed to turn on HDMI state machine clock: %d\n",
-			  ret);
-		goto err_put_i2c;
-	}
-
 	/* Only use the GPIO HPD pin if present in the DT, otherwise
 	 * we'll use the HDMI core's register.
 	 */
@@ -1412,9 +1411,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 err_destroy_encoder:
 	vc4_hdmi_encoder_destroy(encoder);
 err_unprepare_hsm:
-	clk_disable_unprepare(vc4_hdmi->hsm_clock);
 	pm_runtime_disable(dev);
-err_put_i2c:
 	put_device(&vc4_hdmi->ddc->dev);
 
 	return ret;
@@ -1437,7 +1434,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
 	vc4_hdmi_encoder_destroy(&vc4_hdmi->encoder.base.base);
 
-	clk_disable_unprepare(vc4_hdmi->hsm_clock);
 	pm_runtime_disable(dev);
 
 	put_device(&vc4_hdmi->ddc->dev);
@@ -1460,6 +1456,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
 }
 
 struct vc4_hdmi_variant bcm2835_variant = {
+	.max_pixel_clock	= 148500000,
 	.audio_available	= true,
 	.cec_available		= true,
 	.registers		= vc4_hdmi_fields,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index cbb1d3ab85d7..ee9753255b68 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -38,6 +38,9 @@ struct vc4_hdmi_variant {
 	/* Set to true when the CEC support is available */
 	bool cec_available;
 
+	/* Maximum pixel clock supported by the controller (in Hz) */
+	unsigned long long max_pixel_clock;
+
 	/* List of the registers available on that variant */
 	const struct vc4_hdmi_register *registers;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
