Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31425D1D8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AC76EA90;
	Fri,  4 Sep 2020 07:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FE66E57E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5FE7DB66;
 Thu,  3 Sep 2020 04:03:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=HU8H5gGsrcRTb
 FysH3oF2DX+CTcMF3UKI1bxBtxQt/k=; b=pskCT+/xyE/4uuZrx5nzvpji8M5mp
 lFsmKbZuh2kvtP9erSI+41HNEkfTZOPVYeF0UfjUercMLqX5sIxc3ZFHN41YgVD5
 Kb8+zLC3IAIwcJ61hDnsskMDlE/C8PPbeV2VrApgBgi27h9s8fynba4CggsrBp3u
 kjxYJR5YvsTLD0P/we0/EH4HjxPvdj/+LnRGFBZ87bQmMn7JujobWbLyuJr9CAPh
 EP2N0tTVT3kuFyiQ6/4Ba9VcgSVpA3CmegiV5mxYPL6r4Z5bSAhtNmzGtxHs6Ddq
 3XFi2MpGsTt6TtOE052Ag0AsG8OTwPXASICBIkGUivwT9ezrRGMV0my0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=HU8H5gGsrcRTbFysH3oF2DX+CTcMF3UKI1bxBtxQt/k=; b=mVDrpWUY
 sB03y47dEL/PalDRiGfKv3RYX1odVS5cCfeYdmGzramxJAJPHptUIrRwJaUBJHbn
 eMpyRUu2Pm1vIoIb5GkfwAo/mNLnSAZXtDRkgEyOqWFb2lHpNH5qdo1AWkSSLpXq
 Fy938y/QxICEFav1Q7fWmxGOZilXhAgGltW7ah4wBpccJZu6UCTu6+WxksEoS6lS
 TykJ1aaIy4OcGvU6nEf72MkiOoL1q5s5JWDwgHi7wm7MyJA7eJDbSqqDUUSLcGiF
 Q0+7QzTPWXu4adecCrSBLW75Lt5C5DEgVHBq+JcHKVPUIQTKwHzfXDnErePPOKxd
 84tQKdpwSxcwGQ==
X-ME-Sender: <xms:P6NQX_yLdoEWIZSwpdwVY0ksbai8aKaCbFy-MEfAfRRbqJTf6XasCA>
 <xme:P6NQX3QehH2eT5TqFkjNhUd9l5hHfhPBsvnJJfuoAOoygXnzWCp6iOcGRfpGkdW_T
 bRBXdRydknZH0scuWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeegle
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:P6NQX5WH7cZBO0zQIcSUfYJ4xAa0_XKngep-IzM3Rv1QOgIQmZui5w>
 <xmx:P6NQX5gEMpO_XzbC-PWUTXwPsvgSuCjosgTaw96atgPnrcXMjq2o6A>
 <xmx:P6NQXxBJ0OT0GeejAKrIk5Qa83K3jbMVJ-iAuPf6lpK7ChYxdvzwqA>
 <xmx:QKNQX2J3rqpXFaFVqH4sSdCHXcy_HBvx7AJcmhRW-MUDdm-qybeG7vXLe6Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9EFEA306005B;
 Thu,  3 Sep 2020 04:03:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 55/80] drm/vc4: hdmi: Add a CSC setup callback
Date: Thu,  3 Sep 2020 10:01:27 +0200
Message-Id: <5c19bbf10153cb42ca0fb67e08606c8295c17236.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similarly to the previous patches, the CSC setup is slightly different in
the BCM2711 than in the previous generations. Let's add a callback for it.

Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 70 +++++++++++++++++++++--------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 ++-
 2 files changed, 45 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index c29376c3fd8a..532618e02399 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -334,6 +334,41 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 		DRM_ERROR("Failed to release power domain: %d\n", ret);
 }
 
+static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
+{
+	u32 csc_ctl;
+
+	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
+				VC4_HD_CSC_CTL_ORDER);
+
+	if (enable) {
+		/* CEA VICs other than #1 requre limited range RGB
+		 * output unless overridden by an AVI infoframe.
+		 * Apply a colorspace conversion to squash 0-255 down
+		 * to 16-235.  The matrix here is:
+		 *
+		 * [ 0      0      0.8594 16]
+		 * [ 0      0.8594 0      16]
+		 * [ 0.8594 0      0      16]
+		 * [ 0      0      0       1]
+		 */
+		csc_ctl |= VC4_HD_CSC_CTL_ENABLE;
+		csc_ctl |= VC4_HD_CSC_CTL_RGB2YCC;
+		csc_ctl |= VC4_SET_FIELD(VC4_HD_CSC_CTL_MODE_CUSTOM,
+					 VC4_HD_CSC_CTL_MODE);
+
+		HDMI_WRITE(HDMI_CSC_12_11, (0x000 << 16) | 0x000);
+		HDMI_WRITE(HDMI_CSC_14_13, (0x100 << 16) | 0x6e0);
+		HDMI_WRITE(HDMI_CSC_22_21, (0x6e0 << 16) | 0x000);
+		HDMI_WRITE(HDMI_CSC_24_23, (0x100 << 16) | 0x000);
+		HDMI_WRITE(HDMI_CSC_32_31, (0x000 << 16) | 0x6e0);
+		HDMI_WRITE(HDMI_CSC_34_33, (0x100 << 16) | 0x000);
+	}
+
+	/* The RGB order applies even when CSC is disabled. */
+	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
+}
+
 static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
@@ -357,7 +392,6 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 					mode->crtc_vsync_end -
 					interlaced,
 					VC4_HDMI_VERTB_VBP));
-	u32 csc_ctl;
 	int ret;
 
 	ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
@@ -428,41 +462,20 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 		   (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
 		   (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
 
-	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
-				VC4_HD_CSC_CTL_ORDER);
 
 	if (vc4_encoder->hdmi_monitor &&
-	    drm_default_rgb_quant_range(mode) ==
-	    HDMI_QUANTIZATION_RANGE_LIMITED) {
-		/* CEA VICs other than #1 requre limited range RGB
-		 * output unless overridden by an AVI infoframe.
-		 * Apply a colorspace conversion to squash 0-255 down
-		 * to 16-235.  The matrix here is:
-		 *
-		 * [ 0      0      0.8594 16]
-		 * [ 0      0.8594 0      16]
-		 * [ 0.8594 0      0      16]
-		 * [ 0      0      0       1]
-		 */
-		csc_ctl |= VC4_HD_CSC_CTL_ENABLE;
-		csc_ctl |= VC4_HD_CSC_CTL_RGB2YCC;
-		csc_ctl |= VC4_SET_FIELD(VC4_HD_CSC_CTL_MODE_CUSTOM,
-					 VC4_HD_CSC_CTL_MODE);
+	    drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
+		if (vc4_hdmi->variant->csc_setup)
+			vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
 
-		HDMI_WRITE(HDMI_CSC_12_11, (0x000 << 16) | 0x000);
-		HDMI_WRITE(HDMI_CSC_14_13, (0x100 << 16) | 0x6e0);
-		HDMI_WRITE(HDMI_CSC_22_21, (0x6e0 << 16) | 0x000);
-		HDMI_WRITE(HDMI_CSC_24_23, (0x100 << 16) | 0x000);
-		HDMI_WRITE(HDMI_CSC_32_31, (0x000 << 16) | 0x6e0);
-		HDMI_WRITE(HDMI_CSC_34_33, (0x100 << 16) | 0x000);
 		vc4_encoder->limited_rgb_range = true;
 	} else {
+		if (vc4_hdmi->variant->csc_setup)
+			vc4_hdmi->variant->csc_setup(vc4_hdmi, false);
+
 		vc4_encoder->limited_rgb_range = false;
 	}
 
-	/* The RGB order applies even when CSC is disabled. */
-	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
-
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
 
 	if (debug_dump_regs) {
@@ -1430,6 +1443,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
 	.init_resources		= vc4_hdmi_init_resources,
+	.csc_setup		= vc4_hdmi_csc_setup,
 	.reset			= vc4_hdmi_reset,
 	.phy_init		= vc4_hdmi_phy_init,
 	.phy_disable		= vc4_hdmi_phy_disable,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 950accbc44e4..c8fd58548ea2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -41,6 +41,9 @@ struct vc4_hdmi_variant {
 	/* Callback to reset the HDMI block */
 	void (*reset)(struct vc4_hdmi *vc4_hdmi);
 
+	/* Callback to enable / disable the CSC */
+	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi, bool enable);
+
 	/* Callback to initialize the PHY according to the mode */
 	void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
 			 struct drm_display_mode *mode);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
