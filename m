Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D30145BE662
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 14:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A2F10E668;
	Tue, 20 Sep 2022 12:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6730110E1B0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 12:53:16 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4AA7B320094D;
 Tue, 20 Sep 2022 08:53:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 20 Sep 2022 08:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663678393; x=
 1663764793; bh=FuNSdoSlxTBK1onGoyUka3ZW50au1ZMFxxRRFbg42qE=; b=V
 t+e5CzSaC6zZ8BeJzKIZ3dfPZUvGPbIOZOjR0i+ggsyTOErklUM9pCI+LpwEkXZL
 6Mvv6EhMdiek1cQpxTr5J0f1EeXfX+7hhVVclBo57YOKx8JuCoDeiKSCV9kBRsKk
 lNhqtn374QMHpUbcH7L5YlxO9YC6XABizZbCGPb/ra4m/ZjVW/GOL5EEBUmYnx1Y
 U3jHTX3FqZLl1pE/UTvY4GJg88wWiKMk+JJwuo6KrvvBYRT7mMfn/I9MIkHX3vmG
 4RS3Xlle+u4Q5zou/Zw3F4Ohsf5AX5NrOGbrfTGSWnKYZefWcF3f1BSVx/E86gjv
 F1juZV6XiUkJfficbDL4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663678393; x=
 1663764793; bh=FuNSdoSlxTBK1onGoyUka3ZW50au1ZMFxxRRFbg42qE=; b=P
 l8/4htyvHyGRTl2Mzaar01EeYU4HU8PC3+uEkCRhfTm7DuBmtB76vkZK/XP/GuvN
 ZTR3DVYpsP6/VTILpOMkhSibr/V2D4y0jko26aPx3rnBUb3Cce5600JS2hEEkT7a
 IWajCwec8jyoKG4ZJSz/ChoX4fnMBB3Vxva3fPtHCyMp3PYnKM+phMIblWeMtiqt
 /LkuEJ/R33F5/pxBcFKUvhAkw7737RWH5cxKfcQvp4920EKctkVaEKDnqr+7HTlG
 CI5lyRLGu1BMoRFHDvxAcfPl0qsidTog2VeRgYoyilrRmaEftVz6h4yLz+v2N1Td
 2tXOWvWh9UAI59lz4TWFg==
X-ME-Sender: <xms:ubcpY89bwQ6sxsplIBlHTx4mZ-L501ZvQgiLQI8bqYyqPq61wOxWZw>
 <xme:ubcpY0stmm2YfUTVhw5ajonYdQBF1aQKrp99Q4W4PSxQTvxy1og6LSSFG_JZxP-hh
 Nc_YgMMsAXvgFmYU_Q>
X-ME-Received: <xmr:ubcpYyAD2_FfXDUF0BtJz-bbpEIrjahPHRCF0JcOJG5MAyHEeYlR9lHbn-li>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ubcpY8eAcqVaByaZnR-5LMHEhlQK96PiMK-_LmjfC75VoGPMUuBrwg>
 <xmx:ubcpYxNjK9dkLIVZsAJNa9I4yYeBDJ0hT0z4G0N-Bp2qPQ2W7IGHjg>
 <xmx:ubcpY2nd5uisJrnzqmH_MkU1E4TpQgVFkthT9gJF84seZaJgr04PlQ>
 <xmx:ubcpYyvORqd4Sa4ELuUgviiTOS_QpBIK7qLo8J8wwmh1e2dTJHHF6A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Sep 2022 08:53:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 20 Sep 2022 14:50:24 +0200
Subject: [PATCH v2 5/7] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v2-5-983276b83f62@cerno.tech>
References: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 David Airlie <airlied@linux.ie>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>,
 Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Ray Jui <rjui@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5578; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Ny/0l26k7lXuGdwY73KyuiuZ8LMTiHztBaP+/V6QoQw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMma2/k4b+/oYDzQP/1vV7JBfZds13FBNqX7bBZ3QyR6OJd8
 mXS6o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOR+MTw3/Pu+SlRXG0XTwf9f7MkZK
 P19u0/Ov/p/fA5fGVjaIF8dxvD/6CQIA/3ttgWLpED2wr78zwWP96xPLrJSOH+5KmaEm4H2AA=
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
index 1beb96b77b8c..09cdbdb7fff0 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -328,6 +328,8 @@ struct vc4_hvs {
 
 	struct clk *core_clk;
 
+	unsigned long max_core_rate;
+
 	/* Memory manager for CRTCs to allocate space in the display
 	 * list.  Units are dwords.
 	 */
@@ -339,6 +341,14 @@ struct vc4_hvs {
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
index 3b75ac6fa0db..f367f93ca832 100644
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
 	pm_runtime_enable(dev);
 
 	/*
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
index fbaa741dda5f..e28a13a75ec2 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -27,6 +27,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_vblank.h>
 
+#include <soc/bcm2835/raspberrypi-firmware.h>
+
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
@@ -671,12 +673,33 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
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
b4 0.10.0
