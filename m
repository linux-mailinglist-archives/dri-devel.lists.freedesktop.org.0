Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F5167CC9D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4BE10E8F9;
	Thu, 26 Jan 2023 13:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A78210E8F7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 13:48:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 831F65C0051;
 Thu, 26 Jan 2023 08:48:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 26 Jan 2023 08:48:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674740892; x=
 1674827292; bh=gQddrZfTsheamKKxKHXVLxyt3cVC0iF9SaFezEVOhEQ=; b=Y
 RtDH4h2USdFu4a4bVHFfUhowcdbaH1aVs4FQ3qmAQssteu3cZQBO8O9Mdq6ehZ7s
 JMsmKc/DggBcc+WveQDyG969hYlYbaYRPiHQxbwIt2Hf5pm4e8mvBSAR2vMC96wQ
 f+W2SMAqhp0iXV422DYGRRLLOQzA/lMtbuRrWM7CYjCNdLghAM5wEOGDoGId7wb0
 v7u7xPjoO1PHcxw2Rd8k5mkX+Md6wGxiqriOcwvCb5NVazviYMcdH+wuPxcJ2uIe
 EvAn4uTNQN5szmgQmzcLL+ClspBXLFFlVKGq1HdUssPnsHAoFE0i8rNNom0496GE
 DvVPGKLu+VJH/4s5zJatA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674740892; x=
 1674827292; bh=gQddrZfTsheamKKxKHXVLxyt3cVC0iF9SaFezEVOhEQ=; b=l
 wDjDvXQe9rsL0k2Jy5V0SH2ZJRQ9B1jp/yfRTqO0LJgwxJN0TGSS52jKG7HIDOqI
 7sGZkZQisNeL6yH1OJKznf/HQAAcR3AwrZ6BHcPPvYztjz/xrDUBBQsLwTEMSYC4
 qFf/hA0FSJK40wFJ4nKWCX0Avjh5ViA2FHmVtm4iauK4GcNlzqpbd0YhF+Kmv2Mj
 h17Jhop1oxAl0UC74SVH2XIqTYdS6QSOdWvDYoTTdv9xu6kAdDTjo0Tz4VJtBOc9
 bxpvAS9efYgbLN2H1s5zevvVkdoRCMLtBtiQs/mCWtqAi0vXos9wHxdbos23utrV
 kwjaheaoQ4CMGMy2SH9gA==
X-ME-Sender: <xms:nITSY26MKMOT5a0FvIV4d_XdjCJfcXWJUef7GfZ_ZK-V5WBRW7nOCg>
 <xme:nITSY_66zKfJEWmj4Bit4xc83vF6fwtCjKCHHZ-aJx7DdDSA-qnNBkO6QHiu0D3lA
 x0tfYszwxARjl0ggOE>
X-ME-Received: <xmr:nITSY1cqtP-wRDxAzLFAsjj1TlvsM96Z4E0-FLArgJnMaRlraJ5OuP4RQV4KZ9HLdUOoKNHV0CvXALIX1Fq1T0B9vbLvMQhShWqOEJHXem5gIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:nITSYzKd13wJeznj2aZqd27vehJm0Xbq-ftpAVY0p2NRsInX20AmHg>
 <xmx:nITSY6KeZGHmgvfLwM9Sv3KZOMDDYorU3lXS7QOx4MbGkXVt_7j12Q>
 <xmx:nITSY0yzmxj-ldhQNRTvvyLR5k6S7w18Ff79815BTT92P3I1ysogMA>
 <xmx:nITSY75VZ1H7Cl0Jm4_-_XEEupdyCg7jgJhwpEVg6r6VvvfXSCUyXA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 08:48:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 26 Jan 2023 14:46:40 +0100
Subject: [PATCH v2 6/9] drm/vc4: hdmi: Rework the CSC matrices organization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v2-6-8ace2d8221ad@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5801; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=9mWtiavcMAMWQYdNf4lsjPBInIWnS6JaAa/lz5o6k1o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXWlz2NT1+onXZYLHGhF+bTO7qeK13nzPp2fltqe3bvlqy
 LP1l01HKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJNB5lZPjq5/5itnbs3SC52ui0Z4
 1r92q4bdAs3pcZvVHqhEV2ihzD/+J/P9wCny9ufFJ3/oXJu1tCOeFdEjyP/90S5DrquzVkARsA
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
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
matrix to support full range BT709 YUV output.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 108 ++++++++++++++++++++++++-----------------
 1 file changed, 63 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 78c17166f296..53e4afcacc6f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1201,52 +1201,72 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
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
+ * Matrices are signed 2p13 fixed point, with signed 9p6 offsets
  */
-static const u16 vc5_hdmi_csc_full_rgb_unity[3][4] = {
-	{ 0x2000, 0x0000, 0x0000, 0x0000 },
-	{ 0x0000, 0x2000, 0x0000, 0x0000 },
-	{ 0x0000, 0x0000, 0x2000, 0x0000 },
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
- * CEA VICs other than #1 require limited range RGB output unless
- * overridden by an AVI infoframe. Apply a colorspace conversion to
- * squash 0-255 down to 16-235. The matrix here is:
- *
- * [ 0.8594 0      0      16]
- * [ 0      0.8594 0      16]
- * [ 0      0      0.8594 16]
- *
- * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
- */
-static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] = {
-	{ 0x1b80, 0x0000, 0x0000, 0x0400 },
-	{ 0x0000, 0x1b80, 0x0000, 0x0400 },
-	{ 0x0000, 0x0000, 0x1b80, 0x0400 },
-};
-
-/*
- * Conversion between Full Range RGB and Limited Range YUV using the
- * BT.709 Colorspace
- *
- *
- * [  0.181906  0.611804  0.061758  16  ]
- * [ -0.100268 -0.337232  0.437500  128 ]
- * [  0.437500 -0.397386 -0.040114  128 ]
+ * Conversion between Full Range RGB and YUV using the BT.709 Colorspace
  *
- * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
+ * Matrices are signed 2p13 fixed point, with signed 9p6 offsets
  */
-static const u16 vc5_hdmi_csc_full_rgb_to_limited_bt709[3][4] = {
-	{ 0x05d2, 0x1394, 0x01fa, 0x0400 },
-	{ 0xfccc, 0xf536, 0x0e00, 0x2000 },
-	{ 0x0e00, 0xf34a, 0xfeb8, 0x2000 },
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
@@ -1283,6 +1303,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct vc4_hdmi_connector_state *vc4_state =
 		conn_state_to_vc4_hdmi_conn_state(state);
+	unsigned int lim_range = vc4_hdmi_is_full_range(vc4_hdmi, vc4_state) ? 0 : 1;
 	unsigned long flags;
 	u32 if_cfg = 0;
 	u32 if_xbar = 0x543210;
@@ -1299,7 +1320,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	switch (vc4_state->output_format) {
 	case VC4_HDMI_OUTPUT_YUV444:
 		vc5_hdmi_set_csc_coeffs_swap(vc4_hdmi,
-					     vc5_hdmi_csc_full_rgb_to_limited_bt709);
+					     vc5_hdmi_csc_full_rgb_to_yuv_bt709[lim_range]);
 		break;
 
 	case VC4_HDMI_OUTPUT_YUV422:
@@ -1314,16 +1335,13 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 		if_cfg |= VC4_SET_FIELD(VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_FORMAT_422_LEGACY,
 					VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422);
 
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_bt709);
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_yuv_bt709[lim_range]);
 		break;
 
 	case VC4_HDMI_OUTPUT_RGB:
 		if_xbar = 0x354021;
 
-		if (!vc4_hdmi_is_full_range(vc4_hdmi, vc4_state))
-			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_rgb);
-		else
-			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_rgb[lim_range]);
 		break;
 
 	default:

-- 
2.39.1
