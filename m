Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE9A5FD6C5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C244410E68D;
	Thu, 13 Oct 2022 09:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBA910E55F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:13:21 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D7785C009B;
 Thu, 13 Oct 2022 05:13:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 13 Oct 2022 05:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665652401; x=
 1665738801; bh=2JSMy2S6xUR+ZHeYAulhRYzlIjCrNr0csZYZefwkoR8=; b=O
 MUGa4dzGhLRMSNRLmAR0jDbypSzSMfqPEkSlpzyQ7CvJzYrwKdIC8Ryxcycy3PF3
 wUim0iW4UTjpigXSdNUcw3ewWQy8caPLTQAchTpzIVNyzERTcI6Dg8XxcStowR1A
 9+BPYTYguYMRJFx5wYBlRUuHWpLxNtS+f5YafuVDZngM/riqOvfJMIeszogaevgW
 T193oukcZnoN/IT1SZq3BnPnJtLpUXXPJyLVBEjjOJScL6Ujg+4kAeDbdOfGmUqe
 FzixXTkug5jgaJtQv5LNob2vh/ZC1vGJWrrZW2VG4Lhd8CLPIyZuMeqNS6ZKGojR
 7b0iHFiLVGUSDeRXrUPhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665652401; x=
 1665738801; bh=2JSMy2S6xUR+ZHeYAulhRYzlIjCrNr0csZYZefwkoR8=; b=A
 dXu5h0MxThMcz8HuEYg1nSc1QHA/BHjNBsINpe+hhmO7D/N/znd1j/OOGyLz07C4
 5PkULwbRBL0xp2HlrbzavzcOqEbbJh2IAobzAzQgXEA8xZ1QYdSeplkwa8/XOSrZ
 nC0OeNSEaUwfI2Fnr9wz+UASE6TTTyPH/t3Pk4pCfr6BTWJFPhvc3s1yC1k0ZSr1
 N8YeKL+9B5uW1AlqxRg83bpcS6cwoE8PyK68VIJMw/WVJor9UOLe3m6qY3CeLCS8
 skYk/hRzaXvDAc3w0Sykrf+U4bRPDtGgJxwxBUd1QNMpOSNo7dDm3nEpNmfPmqiP
 IjC9qb5yfolJn5UTDLs7A==
X-ME-Sender: <xms:sdZHYzDQ5H1mUUFsQ_DVJcxPGe0lkHlEzDeaXBcATZHIyYQfoMAGyg>
 <xme:sdZHY5jgrQG4_LQnmdhspesqS4R6wixUqm1QTlJLFcTVC6Y5Qsj1OKpVAjd2ie2uN
 AS0kwOn1QjeR7TKLYk>
X-ME-Received: <xmr:sdZHY-mIUcKg45zRqzExRYp66hBbEPHNpEUKWtKji1clLgHpYPavmIaWrbfeTqOIxdQOm6vmsrhVnKZLM7wsDhc3XHXjx1SYc-ui>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sdZHY1wNaIdf3Fl-tuMvJCwpM8yzGG5fLcJv44FOMzSA1PS6kjI9KA>
 <xmx:sdZHY4QcYnh7ZT2h4UneHSURLxfUNpGV7xIgaSTRl2d-CWzZGErF1A>
 <xmx:sdZHY4ZY-6k45ozmz5fzN78gSkWguufLx8nrclmrYD21fC0iX9BYLg>
 <xmx:sdZHYxCNZL2vin6OK3txR2GTfVI-wcUYK4-qAs93jH-45BKYTCI6gQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 05:13:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 11:13:12 +0200
Subject: [PATCH v3 5/7] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v3-5-fc56729d11fe@cerno.tech>
References: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Emma Anholt <emma@anholt.net>, 
 Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=5858; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=DuTFZxWsGq/sZk7xQ05Ey8kf6JSb104QwOLdz5GnoB8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMnu15aoiD6OXct+bWenhoulu8480+NeE24WfLC/JKArKyW4
 UuNiRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACaiO5eR4U64+YQ7Xc0BTsnfG5Kdwt
 Ozteu3dOYvn8Rd6bt62jk2BkaG56W1T5Ic44Vddz4zWqf+yOL/mWsPgpv7bzLY7brjwRPHDQA=
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
b4 0.11.0-dev-7da52
