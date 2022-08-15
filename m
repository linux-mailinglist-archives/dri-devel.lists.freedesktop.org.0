Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 279825931F3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 17:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A568CC5DF;
	Mon, 15 Aug 2022 15:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A116FCC55E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 15:32:02 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B3B5B3200920;
 Mon, 15 Aug 2022 11:32:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 15 Aug 2022 11:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1660577520; x=
 1660663920; bh=qP/467pZY5ly6Rty1X/nn+s37d/wnSWh6/LYVda1pUE=; b=C
 CnDOX/R5xfUMx7y4vZCNHV+1X3b68wULJjlbAgD9pQzS+yXmOXJN1MKBOWAbCg8w
 vE/rBz9UlpFDmFkmRw93GfG0ZSR+XXV18nQ+NYKCQJ3X6A6/Ot9etzyRuMR5Tsgi
 tlHDMU5UVhHXRA9S+n0H722mgbuAwXTPkxbtRGOostAxvDT8gLKJJQJvlU3eyWtn
 XC72hxci4p/7Kzho7OXcIOBLARclJ2icMiS+znewIa5kC+P23GxYOjbmvWHcZrMI
 BBb9eUQb5KaD1qITluznI3XYVfQzLHoSgwnFXTpb8hbL4R58TrBg3keTVjPaaDMA
 IeI8ld6u5cEvOl8nAJlvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660577520; x=
 1660663920; bh=qP/467pZY5ly6Rty1X/nn+s37d/wnSWh6/LYVda1pUE=; b=i
 2vXyXk5WwIyh2sa9zj4UFE9rF/kIK/eCa3BMnu+sXIO/KpdjsEAa8ritM08e5+Sg
 y/YxpnzQqoh22KL/MOcLm271/dORmea4CB7j5h3obisHG8cgjvDwjopA6bQm2pKo
 6yrY/vSbEyD06xTPuSZPxAiWMQ1UaabYe97ag62cAIuYHdImXkFJTReeWtXo0Ult
 HAMmhkGM8jmiRiL1XtF2ZzcZ2ogtZCTM20ABAzo2AVsPdQLUKsZ43X5oPI2B2qob
 WNSBBdvfArsd4vBkPS2IKFoyAJHM1wZh5tsugnzpIZQ/08boqQgohLT3YZaQgW3u
 1vzct2lMWRd1XbtXfU39Q==
X-ME-Sender: <xms:72b6YhVWnB6nW2F6dvwwsRuus6dwG5RsAOPw5Es7TAfIsDCJD3dvXw>
 <xme:72b6YhmhOVdxRzr8Flq3CXKWomroPpcIH_76zw9epUqpG19lYHxU0aSd0YyZn1zwy
 nmdtRFalC0eCNi_0XY>
X-ME-Received: <xmr:72b6YtZlshIaj7p3NmQrA6xNB7sWaBXBMHAO20QKYFCLK9wEiFTbA6Z30GY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpefgfffgteffuddulefhveeiffffudelvefggeekueetgfffjeehleel
 keejfefhjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:72b6YkUMn_fZ9RplLUwnfHrS2bYzs7QTsRS7BLIRuo9-ZxoqBAFSSg>
 <xmx:72b6Yrn7nbX7Z9MM3lx5cuYHoV3h6Ijd6F1pmBFyt_1thrQ3QltC3w>
 <xmx:72b6YhcA30FEsCqM5BIAfeJZE6Qw3R00sSyeTZ1sKsnRAndQRtwnJQ>
 <xmx:8Gb6Yjmt1tqOCZwU9crEvuJpFGc7uD-0XWDv3JVW10XhXR3DwXHGZw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:31:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>
Subject: [PATCH v1 5/7] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection code
Date: Mon, 15 Aug 2022 17:31:27 +0200
Message-Id: <20220815-rpi-fix-4k-60-v1-5-c52bd642f7c6@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-a76f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=5106; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=2OFfhn+YR/EOSwLn+smsOxwFt7ryFbFluOVjjlHJZXw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDEm/0k5E9EusuzlH6L/tgS03j3qw+6Vszd7pLx4kpcDns6P/
 SPXmjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEyE3YiR4Y7LrPmmd8T4n1uweht+7R
 Z6dPx8vMK139mrpH/c/p7JOJnhv0vWjJaV908vu67+VPnRpRVzzgYlXRIOsa+0uW+9sS3LhgUA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support higher HDMI frequencies, users have to set the
hdmi_enable_4kp60 parameter in their config.txt file.

This will have the side-effect of raising the maximum of the core clock,
tied to the HVS, and managed by the HVS driver.

However, we are querying this in the HDMI driver by poking into the HVS
structure to get our struct clk handle.

Let's make this part of the HVS bind implementation to have all the core
clock related setup in the same place.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 1beb96b77b8c..d48ef302af42 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -339,6 +339,14 @@ struct vc4_hvs {
 	struct drm_mm_node mitchell_netravali_filter;
 
 	struct debugfs_regset32 regset;
+
+	/*
+	 * Even if HDMI0 on the RPi4 can output modes requiring a pixel
+	 * rate higher than 297MHz, it needs some adjustments in the
+	 * config.txt file to be able to do so and thus won't always be
+	 * available.
+	 */
+	bool vc5_hdmi_enable_scrambling;
 };
 
 struct vc4_plane {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index aa3ebda55e04..371fbc05bf5a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -46,7 +46,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/rational.h>
 #include <linux/reset.h>
-#include <soc/bcm2835/raspberrypi-clocks.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/hdmi-codec.h>
 #include <sound/pcm_drm_eld.h>
@@ -277,6 +276,7 @@ static void vc4_hdmi_connector_destroy(struct drm_connector *connector)
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
+	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
 	int ret = 0;
 	struct edid *edid;
 
@@ -293,7 +293,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	ret = drm_add_edid_modes(connector, edid);
 	kfree(edid);
 
-	if (vc4_hdmi->disable_4kp60) {
+	if (!vc4->hvs->vc5_hdmi_enable_scrambling) {
 		struct drm_device *drm = connector->dev;
 		struct drm_display_mode *mode;
 
@@ -1480,11 +1480,12 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 {
 	const struct drm_connector *connector = &vc4_hdmi->connector;
 	const struct drm_display_info *info = &connector->display_info;
+	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
 
 	if (clock > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
-	if (vc4_hdmi->disable_4kp60 && clock > HDMI_14_MAX_TMDS_CLK)
+	if (!vc4->hvs->vc5_hdmi_enable_scrambling && clock > HDMI_14_MAX_TMDS_CLK)
 		return MODE_CLOCK_HIGH;
 
 	if (info->max_tmds_clock && clock > (info->max_tmds_clock * 1000))
@@ -2965,14 +2966,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi->disable_wifi_frequencies =
 		of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
 
-	if (variant->max_pixel_clock == 600000000) {
-		struct vc4_dev *vc4 = to_vc4_dev(drm);
-		unsigned long max_rate = rpi_firmware_clk_get_max_rate(vc4->hvs->core_clk);
-
-		if (max_rate < 550000000)
-			vc4_hdmi->disable_4kp60 = true;
-	}
-
 	/*
 	 * We need to have the device powered up at this point to call
 	 * our reset hook and for the CEC init.
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index c3ed2b07df23..7506943050cf 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -155,14 +155,6 @@ struct vc4_hdmi {
 	 */
 	bool disable_wifi_frequencies;
 
-	/*
-	 * Even if HDMI0 on the RPi4 can output modes requiring a pixel
-	 * rate higher than 297MHz, it needs some adjustments in the
-	 * config.txt file to be able to do so and thus won't always be
-	 * available.
-	 */
-	bool disable_4kp60;
-
 	struct cec_adapter *cec_adap;
 	struct cec_msg cec_rx_msg;
 	bool cec_tx_ok;
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index fbaa741dda5f..3fdd2c4356f6 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -27,6 +27,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_vblank.h>
 
+#include <soc/bcm2835/raspberrypi-clocks.h>
+
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
@@ -671,12 +673,18 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
 
 	if (vc4->is_vc5) {
+		unsigned long max_rate;
+
 		hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
 		if (IS_ERR(hvs->core_clk)) {
 			dev_err(&pdev->dev, "Couldn't get core clock\n");
 			return PTR_ERR(hvs->core_clk);
 		}
 
+		max_rate = rpi_firmware_clk_get_max_rate(hvs->core_clk);
+		if (max_rate >= 550000000)
+			hvs->vc5_hdmi_enable_scrambling = true;
+
 		ret = clk_prepare_enable(hvs->core_clk);
 		if (ret) {
 			dev_err(&pdev->dev, "Couldn't enable the core clock\n");

-- 
b4 0.10.0-dev-a76f5
