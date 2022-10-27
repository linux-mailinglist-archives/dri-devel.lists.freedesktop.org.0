Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956F160F823
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 14:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE9510E612;
	Thu, 27 Oct 2022 12:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5C210E61E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 12:53:09 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E0AA33200920;
 Thu, 27 Oct 2022 08:53:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 27 Oct 2022 08:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666875187; x=
 1666961587; bh=/lP7mRQNZwC+DIVzTIWVHxZtiQP5jHZfOcSA/VH1Pac=; b=y
 x+doSjKu2OHAvyskihyNTBnrsCVbZONWQbSmQjt85NB7uc2k1F10YxO8M64wNRRN
 GYLQOBQTgtAlcsKQhvnyTTBSzb9hB8SYUNlQbVL+b57aRdP9QLSySONDzgF86EBI
 ZAXzhv8bd/SlcYKeROuWgIEUgbV89DBBo5GZ4hOZzWH5fSlNuRzx8DbwseDcFFWg
 w0c+tCM3lBZ+nahOolcR/UmfCQjohjQn1meq3wMsnc1YshO1SIqSb0ujZxEtea7N
 ejyTDzUqS4kyjLUeA6laLsFc+rZHLVEzkKW6nrJm2Fau1bQS29Ld6ICEyR1h+YG/
 hObGJdMicMbTPc7jmLwiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666875187; x=
 1666961587; bh=/lP7mRQNZwC+DIVzTIWVHxZtiQP5jHZfOcSA/VH1Pac=; b=d
 PCeXxGpAqwccpmrOq/dgVyFUoNQK/Tse9BfTXfe74pnw240o17X6q1ewrIjhhCmF
 5cK/LJdCan2MabWmQ79+gxHDDELyWo0aab3lRijXpqHEwEzEniw7nCMZhkZYcl9q
 PIMQpR8wAtV47M/Xsk0zj2M7BrHLqI7v/QmYXEksuFHCumg1VYHiTdQ0N6jockta
 tG0zVCY9Um17mfI1zbgK7yCJUnGbGZLwZD6n+2e6nkqAHHucvzBnvSN1+9YwwDDN
 tYkAQntsj6KyFUls3KfNQ6fUHlKO1QIRjsNCjNxGPHEdEFQB9hOGAvJhUGVRuVqi
 bLCMvbI0nXgdtqN+/IGXQ==
X-ME-Sender: <xms:M39aY8dHt0rDZlIDog-BDtfvGnh2iX2BtAKaGNMKhXFLcAz7Gsx8UA>
 <xme:M39aY-N18H_JMkNyoJDDSdBDcoSYXHQTwA0cPbQfL0mSwGHoDhWrSM9nV1QhpDkOI
 1WE--8SbZyy5yxqYnc>
X-ME-Received: <xmr:M39aY9h78AEFYxuO4kSQYiB90oXLPmoZ7dFP1Zr4-kqeOYMduRrKafzbmWbV1_vHxr66rQXqlFN01foWQZrL5-pehITSdN09wK_19LANsOmCGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:M39aYx83rKLL67yT1ox4-dM2gmiSPp38-NWt1kNfKS7DAJE5QAKbYQ>
 <xmx:M39aY4sWseuTiQF_0D8vzBN3vECnUL5fkWk6sPmfTClBZyBrX7M6nA>
 <xmx:M39aY4EXskdB2bfcsAcyt3H-hVB1vcxx7yJf1T9e9CtfMp_R2GwWKA>
 <xmx:M39aY4QLGdpzhWeqd1OACJtT9QFTK9THAgQ1J-zMTtdSlSMyou1TuA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Oct 2022 08:53:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 27 Oct 2022 14:52:45 +0200
Subject: [PATCH v5 5/7] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v5-5-fe9e7ac8b111@cerno.tech>
References: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, 
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=5872; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=INDW0a5una5zRFWbX7uc/PTjMkDbjQ3ZNB721BUZisQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlR9TIfJn61KYibVVfvmvvepHj69iju0wcv8FSzxpfprrqx
 aVl8RykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACaS9Jrhr8yF5uR3Vh2fGzPibXUK9w
 k8eiTIPLV83SXtZ9kH3/5ZcpSR4V9XpcqMufHzUv69NVzZGBnp+VbEpP7MmmtduvOMEwpvMgAA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
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
---
 drivers/gpu/drm/vc4/vc4_drv.h  | 10 ++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++-----------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  8 --------
 drivers/gpu/drm/vc4/vc4_hvs.c  | 23 +++++++++++++++++++++++
 4 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 418a8242691f..8da2b80fdbd3 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -326,6 +326,8 @@ struct vc4_hvs {
 
 	struct clk *core_clk;
 
+	unsigned long max_core_rate;
+
 	/* Memory manager for CRTCs to allocate space in the display
 	 * list.  Units are dwords.
 	 */
@@ -337,6 +339,14 @@ struct vc4_hvs {
 	struct drm_mm_node mitchell_netravali_filter;
 
 	struct debugfs_regset32 regset;
+
+	/*
+	 * Even if HDMI0 on the RPi4 can output modes requiring a pixel
+	 * rate higher than 297MHz, it needs some adjustments in the
+	 * config.txt file to be able to do so and thus won't always be
+	 * available.
+	 */
+	bool vc5_hdmi_enable_hdmi_20;
 };
 
 struct vc4_plane {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3acc1858c55f..98a6643821bb 100644
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
@@ -460,6 +459,7 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
+	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
 	int ret = 0;
 	struct edid *edid;
 
@@ -483,7 +483,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	ret = drm_add_edid_modes(connector, edid);
 	kfree(edid);
 
-	if (vc4_hdmi->disable_4kp60) {
+	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20) {
 		struct drm_device *drm = connector->dev;
 		const struct drm_display_mode *mode;
 
@@ -1757,11 +1757,12 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 {
 	const struct drm_connector *connector = &vc4_hdmi->connector;
 	const struct drm_display_info *info = &connector->display_info;
+	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
 
 	if (clock > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
-	if (vc4_hdmi->disable_4kp60 && clock > HDMI_14_MAX_TMDS_CLK)
+	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20 && clock > HDMI_14_MAX_TMDS_CLK)
 		return MODE_CLOCK_HIGH;
 
 	if (info->max_tmds_clock && clock > (info->max_tmds_clock * 1000))
@@ -3428,14 +3429,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi->disable_wifi_frequencies =
 		of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
 
-	if (variant->max_pixel_clock == 600000000) {
-		struct vc4_dev *vc4 = to_vc4_dev(drm);
-		unsigned int max_rate = rpi_firmware_clk_get_max_rate(vc4->hvs->core_clk);
-
-		if (max_rate < 550000000)
-			vc4_hdmi->disable_4kp60 = true;
-	}
-
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index db823efb2563..e3619836ca17 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -156,14 +156,6 @@ struct vc4_hdmi {
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
index 4ac9f5a2d5f9..fc4b7310bf63 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -28,6 +28,8 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_vblank.h>
 
+#include <soc/bcm2835/raspberrypi-firmware.h>
+
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
@@ -791,12 +793,33 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
 
 	if (vc4->is_vc5) {
+		struct rpi_firmware *firmware;
+		struct device_node *node;
+		unsigned int max_rate;
+
+		node = rpi_firmware_find_node();
+		if (!node)
+			return -EINVAL;
+
+		firmware = rpi_firmware_get(node);
+		of_node_put(node);
+		if (!firmware)
+			return -EPROBE_DEFER;
+
 		hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
 		if (IS_ERR(hvs->core_clk)) {
 			dev_err(&pdev->dev, "Couldn't get core clock\n");
 			return PTR_ERR(hvs->core_clk);
 		}
 
+		max_rate = rpi_firmware_clk_get_max_rate(firmware,
+							 RPI_FIRMWARE_CORE_CLK_ID);
+		rpi_firmware_put(firmware);
+		if (max_rate >= 550000000)
+			hvs->vc5_hdmi_enable_hdmi_20 = true;
+
+		hvs->max_core_rate = max_rate;
+
 		ret = clk_prepare_enable(hvs->core_clk);
 		if (ret) {
 			dev_err(&pdev->dev, "Couldn't enable the core clock\n");

-- 
b4 0.11.0-dev-99e3a
