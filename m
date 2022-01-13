Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA2048D971
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4F310E4DA;
	Thu, 13 Jan 2022 14:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B283310E4DA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1CC5B5807FF;
 Thu, 13 Jan 2022 09:07:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 13 Jan 2022 09:07:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ftFxgd+iRfBbU
 1N05P7hPMsIOCRbCDIKb5HI/p5Zxyw=; b=nmbDL3o2SQjU31JfiSgO92r8pLA8a
 9W+YhHEyKVqUFiYWIUWF7CCe6XCj6QwAeVcXe0N7ykSXS88KsXSPkttZOZYd8Ap4
 nIEPj4HDy4521sfnPfqvfPkEQo1wtZEmYr+evxyNPQRV8XI0Cf7aQKP4SIgSAszK
 /E0ZsrUOKZrQByw48aERo/9Iktry1P3BJevZ/LP6mH1KFCraOCj/Ep0V9mtwz5Ho
 WY8/PvFb33jJr2+1k5U6FFUowcirx1soRnM701ZMOCsRQFdOHMZCz9yrlRW+O2dM
 y1GKkXUuzwXi9n/bE+ekr7SL+S+SmhNyTUNF+YaRzHySVlhTrvbSz6dtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ftFxgd+iRfBbU1N05P7hPMsIOCRbCDIKb5HI/p5Zxyw=; b=kPFre3Rj
 CMCa4sipB+AJVzJEpJ5PmZ5c5rfTsBbQESdxQCkVdOoxLufupdLOOEqW0hUUyL38
 Rp9IwoxmZQEx9ZtMSbzG87VMoYfF+KdGKRU+g6sWR00G6T/KAkXzOvLlpI4PZKrV
 koVmRemGnezwjWkN+rZy8rpWdfUKgyp7cIF8UW+7c5eQfVa+dJrGkPxQ18JbsxFT
 Vv2DbfopoZARbVuJGzcDxp+jQ17LLgT7Pc0CZ8ZfXS3p5IDhGZZcwRmh1zgcOQEx
 lBVBshKZdIJzDUX3l5/Y0Ie3L4VoakUvRK+CN5sSCAu5qXam2K+NIdqP/dLBwaxk
 R5bjvy1rxEU/0Q==
X-ME-Sender: <xms:MDLgYZ390A-V7i7f3YQ8Nf6IaGa2zTmBH-tsxZpy2x2VFJnjp32qzQ>
 <xme:MDLgYQEmibqU9od4rC7_QfhYVIJuHNgOfq6kTJ5MDgeIGO_grcojejsJi6c_Y4pzm
 _qoLagJdtb80v1WMAQ>
X-ME-Received: <xmr:MDLgYZ5s1oK3N_H6jBrWZvgBgC55Hj7YVPsYPfFbfPLZ-70EjUPWzqgBlsCJCprzLUctdHnr0DH96gdDIepx2HlFvcrLZsl6qNDbsjk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MDLgYW2fbcWKewO5okJds1S_PN5hCtNT9FuFpoIvF9olM8oC61XOEw>
 <xmx:MDLgYcGTqEd4jDgrPTZRqOjjrvZz1UI_O5iD9XlOnH0f-zwJJwgZ-Q>
 <xmx:MDLgYX_rWAyDB2P1Be2PEcogB48xOGUbXYmkUl2MKyjzIO6DRkHxog>
 <xmx:MTLgYU-Yz2aaGfy8vSCxyQCvSOcIvZeaf-WSDzSQKn1jS56PNd5DQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 09/16] drm/vc4: hdmi: Define colorspace matrices
Date: Thu, 13 Jan 2022 15:07:13 +0100
Message-Id: <20220113140720.1678907-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113140720.1678907-1-maxime@cerno.tech>
References: <20220113140720.1678907-1-maxime@cerno.tech>
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
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
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

