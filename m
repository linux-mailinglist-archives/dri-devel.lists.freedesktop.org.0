Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F1E645E6A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0C410E3E4;
	Wed,  7 Dec 2022 16:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77A410E3E4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 16:09:16 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 502FB5C018F;
 Wed,  7 Dec 2022 11:09:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 07 Dec 2022 11:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670429356; x=
 1670515756; bh=nzYXVlpHr4DJEniOQFydXkuv2oHucdJP3nm3LsVi7Wg=; b=c
 aji4xJiESE4sWG1qqfVNzHZJmcLRaGZPSu1L/m5MRBqef9QOjSJO4UBgGLtpt7sZ
 RjscuSTIkVho93yh6AapcbfwdTimKok0+03k460+mmIHqvrM8kFXFNAg2sqEM087
 um2/QDrsIygN5cj/D4HwwfKDf0yOCwm2zclL5uhXJXK1MY6FA6BUQVyhzA3kipAQ
 fq6MfOgWM5h0jWlb/QyhtGVlRroNMxkBVc2GoQ0Y5O71I3i242+3GQyI/HieVodt
 9xro4GndnsD76M8C2DELUmCEGAFkOW7nSVAh5ascCutrkMMWg0CBgey5VZTMCS3m
 F4WPU7zftAg8ZfsKxPKoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670429356; x=
 1670515756; bh=nzYXVlpHr4DJEniOQFydXkuv2oHucdJP3nm3LsVi7Wg=; b=w
 WYx8Bpss8nIwjHu69NP2rtZ0AyYXQpmpUiXnPQ08LDc7aRt5IT0E9xYnKeMboS/A
 RV5Y5r5O1cgnGdVlLoCNKIgsz5APfD95h3f5yjS3w8/mU3HMjQ7ugwuj2mlGU7Gf
 3VFm0UEhOjLAL0zbOzgXM1iXtsVAW7ZGo/BdbL0X20weyphj8jHtr3sfvpw1HAWl
 Is5p766dEfN0JCdX2gAxVve7e4GqXHbi55M1nOnfptZzG6wp7S5DF8fQsvYlbCsb
 G1T7+YhbKLWOyUVEDpUbpogTtwDHIwunFxTkiqhSe9bUiGx6uoAjlwkAMs5z8/pA
 sZ/kGlMdKS18OpBqi6/zA==
X-ME-Sender: <xms:rLqQY9qwctTlhEQxnjTSQeKFyGt1MkoQgyiC0suetrqlZjntKvCv3g>
 <xme:rLqQY_pEp9ySluT0NWiocz0PFBOvjM9Dj2MXBeVTqsIqZOpR4tyW3RRwK7GJf66Eu
 bHX_A5YG15yr_so98M>
X-ME-Received: <xmr:rLqQY6NSCZWpxqbCofIOvcrU3VeujSQelQReBYTiVr0WntIxH6S8RyqNyjTa4zSumUAOgLUkuIlu6Gg8CSFu8GVktjobwg9Ab_xEymCDAqaqBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rLqQY44NXqJDzf6HvP2YJD_X8uy4xCbdfEuYPqJIZd9XUFL5R-FwBg>
 <xmx:rLqQY84dZYF6utItkMYTk2QJ5SRPNrKOvFYxoxAxmPVpVlccO04tZg>
 <xmx:rLqQYwhho49WeM9QJJDfeRh-NrZ9BYKok9d_GgEMVxsSC2e9CH_XpA>
 <xmx:rLqQY7RAMI-7OA8qTy7NAm6otpz-7mqaIfBvTWko19D_yoCJBc983g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 11:09:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 17:07:49 +0100
Subject: [PATCH 5/9] drm/vc4: hdmi: Rework the CSC matrices organization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v1-5-6b15f774c13a@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=6415; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=G1kYxw4a/X7kQqYgZh8cknQwFpSgW5utRkEkpGJILs4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTdgV9y4zdJ/v/y/2z7qL7bp77qCV9LN801c15on/KSfsK
 piMnO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRzbcZGWZk2L0z5FKcbuTQYLPRce
 PNz45rt52e3BZcf7mu6dbCRe8Y/iltiX9zs/How6jTk8y/8D8Mennf0nX/qUruE1sUTj8TKeUBAA==
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The CSC matrices were stored as separate matrix for each colorspace, and
if we wanted a limited or full RGB output.

This created some gaps in our support and we would not always pick the
relevant matrix.

Let's rework our data structure to store one per colorspace, and then a
matrix for limited range and one for full range. This makes us add a new
matrix to support full range BT709 YUV output, and drops the redundant
(but somehow different) BT709 YUV444 vs YUV422 matrix.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 124 +++++++++++++++++++++--------------------
 1 file changed, 63 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 51469939a8b4..299a8fe7a2ae 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1178,68 +1178,72 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 }
 
 /*
- * If we need to output Full Range RGB, then use the unity matrix
+ * Matrices for (internal) RGB to RGB output.
  *
- * [ 1      0      0      0]
- * [ 0      1      0      0]
- * [ 0      0      1      0]
- *
- * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
- */
-static const u16 vc5_hdmi_csc_full_rgb_unity[3][4] = {
-	{ 0x2000, 0x0000, 0x0000, 0x0000 },
-	{ 0x0000, 0x2000, 0x0000, 0x0000 },
-	{ 0x0000, 0x0000, 0x2000, 0x0000 },
-};
-
-/*
- * CEA VICs other than #1 require limited range RGB output unless
- * overridden by an AVI infoframe. Apply a colorspace conversion to
- * squash 0-255 down to 16-235. The matrix here is:
- *
- * [ 0.8594 0      0      16]
- * [ 0      0.8594 0      16]
- * [ 0      0      0.8594 16]
- *
- * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
+ * Matrices are signed 2p13 fixed point, with signed 9p6 offsets
  */
-static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] = {
-	{ 0x1b80, 0x0000, 0x0000, 0x0400 },
-	{ 0x0000, 0x1b80, 0x0000, 0x0400 },
-	{ 0x0000, 0x0000, 0x1b80, 0x0400 },
+static const u16 vc5_hdmi_csc_full_rgb_to_rgb[2][3][4] = {
+	{
+		/*
+		 * Full range - unity
+		 *
+		 * [ 1      0      0      0]
+		 * [ 0      1      0      0]
+		 * [ 0      0      1      0]
+		 */
+		{ 0x2000, 0x0000, 0x0000, 0x0000 },
+		{ 0x0000, 0x2000, 0x0000, 0x0000 },
+		{ 0x0000, 0x0000, 0x2000, 0x0000 },
+	},
+	{
+		/*
+		 * Limited range
+		 *
+		 * CEA VICs other than #1 require limited range RGB
+		 * output unless overridden by an AVI infoframe. Apply a
+		 * colorspace conversion to squash 0-255 down to 16-235.
+		 * The matrix here is:
+		 *
+		 * [ 0.8594 0      0      16]
+		 * [ 0      0.8594 0      16]
+		 * [ 0      0      0.8594 16]
+		 */
+		{ 0x1b80, 0x0000, 0x0000, 0x0400 },
+		{ 0x0000, 0x1b80, 0x0000, 0x0400 },
+		{ 0x0000, 0x0000, 0x1b80, 0x0400 },
+	},
 };
 
 /*
- * Conversion between Full Range RGB and Full Range YUV422 using the
- * BT.709 Colorspace
- *
- *
- * [  0.181906  0.611804  0.061758  16  ]
- * [ -0.100268 -0.337232  0.437500  128 ]
- * [  0.437500 -0.397386 -0.040114  128 ]
- *
- * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
- */
-static const u16 vc5_hdmi_csc_full_rgb_to_limited_yuv422_bt709[3][4] = {
-	{ 0x05d2, 0x1394, 0x01fa, 0x0400 },
-	{ 0xfccc, 0xf536, 0x0e00, 0x2000 },
-	{ 0x0e00, 0xf34a, 0xfeb8, 0x2000 },
-};
-
-/*
- * Conversion between Full Range RGB and Full Range YUV444 using the
- * BT.709 Colorspace
- *
- * [ -0.100268 -0.337232  0.437500  128 ]
- * [  0.437500 -0.397386 -0.040114  128 ]
- * [  0.181906  0.611804  0.061758  16  ]
+ * Conversion between Full Range RGB and YUV using the BT.709 Colorspace
  *
- * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
+ * Matrices are signed 2p13 fixed point, with signed 9p6 offsets
  */
-static const u16 vc5_hdmi_csc_full_rgb_to_limited_yuv444_bt709[3][4] = {
-	{ 0xfccc, 0xf536, 0x0e00, 0x2000 },
-	{ 0x0e00, 0xf34a, 0xfeb8, 0x2000 },
-	{ 0x05d2, 0x1394, 0x01fa, 0x0400 },
+static const u16 vc5_hdmi_csc_full_rgb_to_yuv_bt709[2][3][4] = {
+	{
+		/*
+		 * Full Range
+		 *
+		 * [  0.212600  0.715200  0.072200  0   ]
+		 * [ -0.114572 -0.385428  0.500000  128 ]
+		 * [  0.500000 -0.454153 -0.045847  128 ]
+		 */
+		{ 0x06ce, 0x16e3, 0x024f, 0x0000 },
+		{ 0xfc56, 0xf3ac, 0x1000, 0x2000 },
+		{ 0x1000, 0xf179, 0xfe89, 0x2000 },
+	},
+	{
+		/*
+		 * Limited Range
+		 *
+		 * [  0.181906  0.611804  0.061758  16  ]
+		 * [ -0.100268 -0.337232  0.437500  128 ]
+		 * [  0.437500 -0.397386 -0.040114  128 ]
+		 */
+		{ 0x05d2, 0x1394, 0x01fa, 0x0400 },
+		{ 0xfccc, 0xf536, 0x0e00, 0x2000 },
+		{ 0x0e00, 0xf34a, 0xfeb8, 0x2000 },
+	},
 };
 
 static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
@@ -1262,6 +1266,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct vc4_hdmi_connector_state *vc4_state =
 		conn_state_to_vc4_hdmi_conn_state(state);
+	unsigned int lim_range = vc4_hdmi_is_full_range(vc4_hdmi, mode) ? 0 : 1;
 	unsigned long flags;
 	u32 if_cfg = 0;
 	u32 if_xbar = 0x543210;
@@ -1277,7 +1282,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 	switch (vc4_state->output_format) {
 	case VC4_HDMI_OUTPUT_YUV444:
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_yuv444_bt709);
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_yuv_bt709[lim_range]);
 		break;
 
 	case VC4_HDMI_OUTPUT_YUV422:
@@ -1292,16 +1297,13 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 		if_cfg |= VC4_SET_FIELD(VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_FORMAT_422_LEGACY,
 					VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422);
 
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_yuv422_bt709);
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_yuv_bt709[lim_range]);
 		break;
 
 	case VC4_HDMI_OUTPUT_RGB:
 		if_xbar = 0x354021;
 
-		if (!vc4_hdmi_is_full_range(vc4_hdmi, mode))
-			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_rgb);
-		else
-			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_rgb[lim_range]);
 		break;
 
 	default:

-- 
2.38.1
