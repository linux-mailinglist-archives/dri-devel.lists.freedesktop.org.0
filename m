Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0417A605AD5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A1A10E5E9;
	Thu, 20 Oct 2022 09:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4BF10E58F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 09:13:47 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id A3D802B05E55;
 Thu, 20 Oct 2022 05:13:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Oct 2022 05:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666257224; x=
 1666264424; bh=6dwoVo8+Jq1eYdQA07l5dabcDlribV6O5KPjdwSe9j4=; b=l
 poads41GErrUQnxHq6jkGZDhYtLAslAnMdgdYHIeFmmMWR7obNaDluBJ0y1LJ5xp
 8kIS0MtMznGBCzMGeB/A33aFA/RzUMoIFQXpibOMqluEvrbnEKWLS9BGbzCO6Mzc
 3wn7mNVBDmABepusr2fkHeMsmJbZ1H0GjHlQ6Iire6/e0C1JwFcAberQ1eQOno6s
 zGVJ5mnNgT1xc7d8Ju+kdj2XxKqVpZ0JIGHD+EcPx3J65hVrmaGYi5MaLidWibCY
 EKfnRMCtUAdIdrNKXnAZ0SP0H7Lmtc1amoCHnr7E+oC8r9v1FvN7huPpK2wjZGmg
 86UkzzbsQQUwu5UFOd58Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666257224; x=
 1666264424; bh=6dwoVo8+Jq1eYdQA07l5dabcDlribV6O5KPjdwSe9j4=; b=B
 RpCskWq1pH+2a5Cu+mh0dz2wazIBeTGp3v2sTELf1eLgkd41FaOQhjzcMLYztx0R
 f5qkFsV1EpUjZss7K6ymQTbpzorxd1S5rigTS/KC1Ro9fbzicdNTU7p/3V8Rz+hp
 oJyucu3v/+EWvXtvX4SmWqrsoZNnkEBMuCjVLCFNU1F36B6KoPGV9MmYlZ3IogSK
 OEDems16ZIF3IHWa7flh6U5JS7ElLjCjWpo99Se1rzPLqg/O4t/08YSVI+NajU9F
 vxC5WBRbyQNCqWxKL19heBBfqThvrrfj/K1LIh1jlYRWkg9W+lnSHQ8TQ8bBLdvk
 +n5dsV4j285aCw4w5dAzw==
X-ME-Sender: <xms:SBFRYyfXz_-M1xkZCkN2HY-8hV6DCzNd1tnWRiG1X8p_Hvoqmm-tlQ>
 <xme:SBFRY8PBtRgL2QUt8bjU6PuKibvtaNreH1IEyTAl-BYQGwdu-pegPvOGgBsIEvRuZ
 s0rDRtbJh_MAVch1LI>
X-ME-Received: <xmr:SBFRYzgKnYK2xbPt64qQsD44QPSVvNeQWjEUDlydMa36X8LsmrVlqhheZgYH6ml-vi5-6ovsuLaFxRsnrjYnfxbKY59hNyqOyqcKhCD6KYhuZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpehmrgig
 ihhmvgestggvrhhnohdrthgvtghhnecuggftrfgrthhtvghrnhepfeduhfegveehhfeftd
 euveeuleduuddttedutddvvdegkeehleevhfetkeetiefhnecuvehluhhsthgvrhfuihii
 vgepudenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvg
 gthh
X-ME-Proxy: <xmx:SBFRY_8Vj_QxVCkckpLWEnESu48POykpErzDy2pJsZ2gF7bMb0CoHw>
 <xmx:SBFRY-s7B1QA9YDIXA-fUkD6-AXT1pBoyWlp_B2Tb0ypMsJ5UkElKg>
 <xmx:SBFRY2FBdM4OLInl432WNUqG48Kef87fDf864NgtdLkY_NeL1EJiiQ>
 <xmx:SBFRY1NoHfdB0BHgxMf1jGckgfLkhvjRq1giCjfngTuZDi21LFoKt_7O32E>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 05:13:43 -0400 (EDT)
From: maxime@cerno.tech
Date: Thu, 20 Oct 2022 11:12:13 +0200
Subject: [PATCH v4 5/7] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v4-5-a1b40526df3e@cerno.tech>
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Ray Jui <rjui@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5876; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=PO31vnQmNp3a4bMZwotcRmoN9WaGejWzAdZOqpYrwoo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmBAq8MuXQWGB0SuZl6cqf1/3TGpKaGdU4Xc8tkuH5lLDwa
 93hVRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZieoqRYcGk3s3tace4N8Q1RgpufK
 YU4DDBbuuPBXt3CXfdDIs9eoLhn/LDxooZQcV3Lzz3OPXbuK9t+v4VHWbywpeKtM8ZqtsXcwMA
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
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
index 418a8242691f..8b2b1af565f9 100644
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
+	bool vc5_hdmi_enable_scrambling;
 };
 
 struct vc4_plane {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 87961d4de5aa..afe3daa2173e 100644
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
+	if (!vc4->hvs->vc5_hdmi_enable_scrambling) {
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
+	if (!vc4->hvs->vc5_hdmi_enable_scrambling && clock > HDMI_14_MAX_TMDS_CLK)
 		return MODE_CLOCK_HIGH;
 
 	if (info->max_tmds_clock && clock > (info->max_tmds_clock * 1000))
@@ -3428,14 +3429,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
index 4ac9f5a2d5f9..300ac0b57571 100644
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
+		unsigned long max_rate;
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
+			hvs->vc5_hdmi_enable_scrambling = true;
+
+		hvs->max_core_rate = max_rate;
+
 		ret = clk_prepare_enable(hvs->core_clk);
 		if (ret) {
 			dev_err(&pdev->dev, "Couldn't enable the core clock\n");

-- 
b4 0.10.1
