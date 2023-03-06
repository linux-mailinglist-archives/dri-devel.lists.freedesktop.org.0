Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A886D6ABD4E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C544610E29A;
	Mon,  6 Mar 2023 10:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FB410E226
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 10:49:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A8A65C0190;
 Mon,  6 Mar 2023 05:49:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 06 Mar 2023 05:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1678099793; x=1678186193; bh=B/Z+p1AK5jc8n7UUDbdl2pFRQGJ8lrqKYlG
 LcuSbBV8=; b=Ql3zfqpmtqzU/S6Z7gn7nL4ugeY8xvP5wgGlLbloGmI6bjjNU6/
 +0wkoyAZyr3FjeEJrhG2lxpvru6NX5B5KDzAgH44hwnMtYGZHUA+TkfeU2AXaIa6
 5W7j8aB+AYrt4fnDibye61N3ByXCH9A7zLQvrTtklm2nN/KsJAGb0eQmW17Pwiqg
 d+h01d/DJJojBXpc5cveisvG3gGwhRSotuefKWgSmiSUhGJmtsYEshjipx/Fqsdf
 vrMA7MfIMBmqIbt1m2l0E1MsidJCtBXCBg5P2Quq1CHclDSU7iVsLyeo1kZHD8lv
 gK6q0V4TSUDHBgy7UQsiO6aXjjlpKrZ+Xcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678099793; x=1678186193; bh=B/Z+p1AK5jc8n7UUDbdl2pFRQGJ8lrqKYlG
 LcuSbBV8=; b=rLALT+cYPH597oWNX5B7cxkaDtN0Azvft/QrI02KdfwR/42+pt2
 Md1LTiZGdtZrOrQ7OaQfXrzW5oIWV0Q0ic4pRi6cZzOMo4/vqxfsqqjO3p+INgI1
 c69C9MAwKpeAGVRd/dB9zwY+KJNrhqhEVHoLZjRk3GimCKXqhj3G4YULHQ4SdA8R
 UooxoSCS2qoWOBrF0xTNYRUMcwu8QCAwq+P1LLPnQj5s6nZg5XXGIqx/KK9u1nkq
 9ISO7RIt7pJGscXUupQlJU4hSbf95vEPTEyWg42BZjc/V3IiWrFUqHnkPeQJXomC
 msErEBHy+RTdU2UOBm3PZmJEZAl7kS6XI/g==
X-ME-Sender: <xms:UcUFZHxEDED14M7bmslIz5n0wE9QSwN754MdAx4p9CAr4V9md3u98g>
 <xme:UcUFZPSsBj2ziPePS4lk_0n-LJ3K5Zpopof0FaXoXIkuz_yjjy_WTdFJkEw__1u00
 -131T5vOp485iwXz_s>
X-ME-Received: <xmr:UcUFZBU0i_tWTCpmntvPaR1RL8a3ZUIDeEgSNDVnYS8EYMlMMFXsNn4OtSaMQ1mZHt-iIY7G94SaTDlqitRi8JHpXlk04XA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtiedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UcUFZBh3T6luNqRezF8YTKuR1-RB-K9lyN7Pd2ISleiDlRsKi2sHvA>
 <xmx:UcUFZJAJOVKIPm-F2AzOBzcdXr8GXmo2FKzqGqoxN4x8zosoy9JY6w>
 <xmx:UcUFZKIOh3J-x1H1rtH1pLWoijL26lvH612Go2E10ZkXMIfsBzFU0A>
 <xmx:UcUFZLx0Ehwesehq0bMT-JR1xodl9CZFF9j6mltwgWKUC7B5CyD6zw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 05:49:52 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 06 Mar 2023 11:46:47 +0100
Subject: [PATCH v3 6/9] drm/vc4: hdmi: Rework the CSC matrices organization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v3-6-bdd54f66884e@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5801; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=rxeJvK6JSutlcyZ/g6klgHxw9zXFlnP7Vh4aySwW3nU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmsR2YExfKEHXE8m63I+XXSBeZniz9ds+z2O7Ho2ov3wlev
 nyu+11HKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJ2Isx/Hd4zD3n50PW3Vy97sfKdV
 68Od9gHb/HZZ11UxODXd3dR/8Z/oo09J2NTlc1OTjl3OQjwYtzz4uE5M5uYfun3HOR62rpTQ4A
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Maxime Ripard <maxime@cerno.tech>,
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
index f051e501efe6..a3e0bf00e4c6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1204,52 +1204,72 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
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
@@ -1286,6 +1306,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct vc4_hdmi_connector_state *vc4_state =
 		conn_state_to_vc4_hdmi_conn_state(state);
+	unsigned int lim_range = vc4_hdmi_is_full_range(vc4_hdmi, vc4_state) ? 0 : 1;
 	unsigned long flags;
 	u32 if_cfg = 0;
 	u32 if_xbar = 0x543210;
@@ -1302,7 +1323,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	switch (vc4_state->output_format) {
 	case VC4_HDMI_OUTPUT_YUV444:
 		vc5_hdmi_set_csc_coeffs_swap(vc4_hdmi,
-					     vc5_hdmi_csc_full_rgb_to_limited_bt709);
+					     vc5_hdmi_csc_full_rgb_to_yuv_bt709[lim_range]);
 		break;
 
 	case VC4_HDMI_OUTPUT_YUV422:
@@ -1317,16 +1338,13 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
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
2.39.2

