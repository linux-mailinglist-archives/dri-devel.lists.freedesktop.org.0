Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFDF4675B0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DCD7336A;
	Fri,  3 Dec 2021 10:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0087336A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:54:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id E3AAE5801B2;
 Fri,  3 Dec 2021 05:54:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 03 Dec 2021 05:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=HrbpVFfsXC7q4
 fkEMtOWIoXHxQ21FQNgxcb3cRwrCXw=; b=VtAVzFDmIzkuIDUUmKgrbdhXgVU7S
 /v5KFe2SEfUSJFWkf/EV0g2JZjC5EE5XSL03qgoRUgz0rE4u5A1r4UTiJmpc8EDx
 IE4k+zK/UmIZnAfJuMJafFF4uvSQaSNsgpJH9fQO5FqO/xGv+Adcixa0apR/ofk6
 0cZCaTym6ZmctlFr59LjXPfQl9fLh3UJVZmx/BIsf84FhZm8ESkSAl2l8b3IVulq
 R3ryXUh/V3+vEBfL1VL3xAOuvu0j//xK6dhadvb9DUj1ftMBuZxntLVMu7h985V0
 ZOI3uKOy38jFftPTF1p0RztcVKfkXmV2LL0KrYJy2JusPPeT4JCUJ9tBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=HrbpVFfsXC7q4fkEMtOWIoXHxQ21FQNgxcb3cRwrCXw=; b=IfCYQMlC
 b/0nNn7OIOBYcKMqqC9i/zcZl9Uge8xaZxhXN+Vwn+bJ3W7kyjsEUwmb583oCcXO
 ZaACSoV3HF6kgXY452SW6D4oBXmB3MDMc14CnUm1L7M/J9gHlRlZtXTzE2UIV7yJ
 vj5P7kWCh86r0B3NhBt6SuOGtArGUNDMY3a7oP8PWNq1Z5YbaDhCYignsEzcfSTI
 azpCmb6nj6wBTKyZ7XIY1uOMPQYO4AIgadoRqHfnLbDJVuzBq8jbQL8cpn+Kmpbn
 hyWKKiwcy1fbL8EarudYFZhVadyphs3hG5KiUWolfvI2H3dJ1B7GSzf+0yG9ZXqi
 pK1YZqrFpFMpdw==
X-ME-Sender: <xms:a_epYSLKpXmgzpA5yt-v4yx3G4kv0bx9VlqCzJtkgqH_R1IUxlpRYQ>
 <xme:a_epYaK4f9ohMK3yrxA3Tub3alGcUJ7q3y_jN-7Ae9CqonY6S1sruHCL4lOWlcMn1
 X5aZlOmOZUUM-yjjvU>
X-ME-Received: <xmr:a_epYSuB-3DG3iX7Hq7_WF8fFyaNC_yOG7X3seRRo_R8UI90r45uPU-gQ_Oh7GvCuKA3HNt4Er1dY2hkCkEOJXIFUt6GuoLCNaqux2NajFjcOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:a_epYXYNqrOpqMacGgsy0aka3jbwSqenHTUKu_nBxzQaymWTdJgx0Q>
 <xmx:a_epYZaDi0CekoY-ZZSy0Tc1YEzSowQfPhZCfsoYHPqkC-EXbze2hw>
 <xmx:a_epYTBnzrb3afLLaoTPbtDEpZ7ZeUmzJ0iyy1MIHYTEpW38fRbYnQ>
 <xmx:a_epYbl31Wi-3t_xOqrzZV07-wHmnGkoyerTQ7zl9NJKb6zWvmIeCw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 05:54:35 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 06/11] drm/vc4: hdmi: Define colorspace matrices
Date: Fri,  3 Dec 2021 11:54:15 +0100
Message-Id: <20211203105420.573494-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203105420.573494-1-maxime@cerno.tech>
References: <20211203105420.573494-1-maxime@cerno.tech>
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
2.33.1

