Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78506495137
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D47410E439;
	Thu, 20 Jan 2022 15:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF6C10E47C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:17:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id A71E82B00155;
 Thu, 20 Jan 2022 10:17:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 20 Jan 2022 10:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=ftFxgd+iRfBbU1N05P7hPMsIOCRbCD
 IKb5HI/p5Zxyw=; b=K1SEYFEVIuner7HWRgmYPTKGQNM8ZYyOscmJ7wSMz4l9ty
 qdI+WA1/NVNpgiuxGdgzjIVIGtpG9wHGUveG822HWO135xCZlJP2mMPIAwbW2uRD
 Ud9zVRedQcG4B+6oMcxUm3tHTQle6rI6HbMVTq1+VWt+by5wDmjdAmFKKM+cYhYs
 uEMxw8VCJ5pZwOw1gaj/vPmL/EY30er+n71kcaaLx/2pEzRUCkaSHRyQm/LanHiW
 JCt9+EryvY0I3NhkvJO0U1AUI6JqQ9DVv5SvThVmmuuLROdaeDN47E1o+YFD89ir
 Prt2Hh/jOvuVjWXYsw66k95oX4czHq8zhZ3c31uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ftFxgd
 +iRfBbU1N05P7hPMsIOCRbCDIKb5HI/p5Zxyw=; b=dAbtOWGsLyeilhl8xMWdH/
 mdDmxo2CWuHGAhR66fNJZ8BJfooTutr0MkbhwtukPyBjJZy8yw8M+wSsFWt8DAZO
 rlAvwZpLqc+VYfSgubkoPJNdevi8vMET1ZoBYYeLtD78MS+FIbdzCT47NZbXP6kZ
 3QPQGVNRk4rdoNh4zcb6T4GeQECF2deKOVpUz3T5x1GKw/WPHRdYsPN6wSfukFcq
 ENESdPsg/XYidULGqhaAAsxPLoKQ94HIslVWWMs+9kO4nv63pTxFXUJvE9nTMq8M
 vk0oj9nBTT5Elt1XlP3R4N+6nAvdGSaO0Bii5arprCxiSWBts0omC3w0zNzOjQGg
 ==
X-ME-Sender: <xms:8XzpYWjQadXejM4GNBjmSc5VjPH8TEhNjxDYcXC16svz0fUNJLATzQ>
 <xme:8XzpYXBIIYcw6jmW0y1FfCyY8Ib9wDxh9TatcAUukLSgKDgRe-6atcc51y98WqYzq
 Uqha6aTkqF_3cBG0RQ>
X-ME-Received: <xmr:8XzpYeHP4E7RULh3cxVOUAuThskdgiZsRegIBpIwqtgjJf7-FMa-4s7UXA9dnPRhmGNYjebj_F8wGf028nSHYGPH6BkOHx0wVsLSO_4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8XzpYfQUzJaD4lN52lSANGlQHWwoN8A86mO_6Lgib3lIueG-_mxu8A>
 <xmx:8XzpYTzo67Q357wI8_FK4mF--yFBL62ZKcEFXs4PpmfH54LhCnA7zw>
 <xmx:8XzpYd5lTpujvof1Gdioyjv-IqTYxkYJeukgIQEXe5CcaC5Fr79OkA>
 <xmx:8XzpYYoBTRPpkaHJQNTxDRZ8bSoAx0kDdc-cg4JfuxUq-wAPlT942OuZrpg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:17:04 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 09/16] drm/vc4: hdmi: Define colorspace matrices
Date: Thu, 20 Jan 2022 16:16:18 +0100
Message-Id: <20220120151625.594595-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-1-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current CSC setup code for the BCM2711 uses a sequence of register
writes to configure the CSC depending on whether we output using a full
or limited range.

However, with the upcoming introduction of the YUV output, we're going
to add new matrices to perform the conversions, so we should switch to
something a bit more flexible that takes the matrix as an argument and
programs the CSC accordingly.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 79 +++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 682c3c907cbe..7fdb49e790f3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -775,6 +775,52 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
+
+/*
+ * If we need to output Full Range RGB, then use the unity matrix
+ *
+ * [ 1      0      0      0]
+ * [ 0      1      0      0]
+ * [ 0      0      1      0]
+ *
+ * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
+ */
+static const u16 vc5_hdmi_csc_full_rgb_unity[3][4] = {
+	{ 0x2000, 0x0000, 0x0000, 0x0000 },
+	{ 0x0000, 0x2000, 0x0000, 0x0000 },
+	{ 0x0000, 0x0000, 0x2000, 0x0000 },
+};
+
+/*
+ * CEA VICs other than #1 require limited range RGB output unless
+ * overridden by an AVI infoframe. Apply a colorspace conversion to
+ * squash 0-255 down to 16-235. The matrix here is:
+ *
+ * [ 0.8594 0      0      16]
+ * [ 0      0.8594 0      16]
+ * [ 0      0      0.8594 16]
+ *
+ * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
+ */
+static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] = {
+	{ 0x1b80, 0x0000, 0x0000, 0x0400 },
+	{ 0x0000, 0x1b80, 0x0000, 0x0400 },
+	{ 0x0000, 0x0000, 0x1b80, 0x0400 },
+};
+
+static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
+				    const u16 coeffs[3][4])
+{
+	lockdep_assert_held(&vc4_hdmi->hw_lock);
+
+	HDMI_WRITE(HDMI_CSC_12_11, (coeffs[0][1] << 16) | coeffs[0][0]);
+	HDMI_WRITE(HDMI_CSC_14_13, (coeffs[0][3] << 16) | coeffs[0][2]);
+	HDMI_WRITE(HDMI_CSC_22_21, (coeffs[1][1] << 16) | coeffs[1][0]);
+	HDMI_WRITE(HDMI_CSC_24_23, (coeffs[1][3] << 16) | coeffs[1][2]);
+	HDMI_WRITE(HDMI_CSC_32_31, (coeffs[2][1] << 16) | coeffs[2][0]);
+	HDMI_WRITE(HDMI_CSC_34_33, (coeffs[2][3] << 16) | coeffs[2][2]);
+}
+
 static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       const struct drm_display_mode *mode)
 {
@@ -786,35 +832,10 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
 
-	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
-		/* CEA VICs other than #1 requre limited range RGB
-		 * output unless overridden by an AVI infoframe.
-		 * Apply a colorspace conversion to squash 0-255 down
-		 * to 16-235.  The matrix here is:
-		 *
-		 * [ 0.8594 0      0      16]
-		 * [ 0      0.8594 0      16]
-		 * [ 0      0      0.8594 16]
-		 * [ 0      0      0       1]
-		 * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
-		 */
-		HDMI_WRITE(HDMI_CSC_12_11, (0x0000 << 16) | 0x1b80);
-		HDMI_WRITE(HDMI_CSC_14_13, (0x0400 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_22_21, (0x1b80 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_24_23, (0x0400 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_32_31, (0x0000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_34_33, (0x0400 << 16) | 0x1b80);
-	} else {
-		/* Still use the matrix for full range, but make it unity.
-		 * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
-		 */
-		HDMI_WRITE(HDMI_CSC_12_11, (0x0000 << 16) | 0x2000);
-		HDMI_WRITE(HDMI_CSC_14_13, (0x0000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_22_21, (0x2000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_24_23, (0x0000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_32_31, (0x0000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_34_33, (0x0000 << 16) | 0x2000);
-	}
+	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_rgb);
+	else
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);
 
 	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
 
-- 
2.34.1

