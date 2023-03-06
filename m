Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90826ABD4D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F0110E268;
	Mon,  6 Mar 2023 10:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A434F10E221
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 10:49:51 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 06E4F5C024C;
 Mon,  6 Mar 2023 05:49:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 06 Mar 2023 05:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1678099791; x=1678186191; bh=krfDOlTMEX6NMuZifF8fsycLCd1Sm7BNd63
 6r55wqgo=; b=dOUo4m0lSiOb6scovVsJ+A2E8cvfBCB6ch6Bf5TNivioYhjxsHf
 NIrV2FhIQ8TMNTLB2ZylymwkRPM7Pa2YNgvMOZNJ48oHULJSyfsqLdVbt1ekE8ki
 FE/RiC3iAXKC8xeFcdvj5KYsKbrN0Jz7eXQpfbyCoN45yOsV2ArbhzZyMG0kj6tH
 FGOG6H5JH6sWm2zYWkhUraCwTDvc/YhpNchgFymv0yuFmdqUui5OjCv/j2UudAFY
 WORIeaFywpEOQsvGaj+aez1ZwmhilRK9zwKOFhhrQ9zIIHpWDuWsxldCeowz+xW5
 u8fKJy6fNhleOlcjy/nDspWiOGBykCSGrrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678099791; x=1678186191; bh=krfDOlTMEX6NMuZifF8fsycLCd1Sm7BNd63
 6r55wqgo=; b=aStXbmi4wpe6Ewp9YnyYVyN0lOF/XkVfCk0WJA2OjwDyqUiV0Ap
 +tL9hQX1UD6YpaSIYxxO/aObcXgP4KlyBDAmKGzEbSK04oeJzNUKjuh5qoP1PP1l
 alRDciAdPcK3+T8654+SE++ilu7lr4SC5Er+I75f28FaTx1/L6OyGKexh+/r3bCU
 6qC+/Z14GfTs4mBIcoS2bc3gPmqf+8JlVteQUCf8Sl0D/V89kzGVocX3xBO29vLg
 Shphqcgw64oHVWQjE0j2NSPRleeiMofRBBoZ/bvvOfdGVRA9vK9GRRZ9Zdd04peR
 bekHZ7wiWlcGe7m3JnzJGIwuIVf3bmmTOoQ==
X-ME-Sender: <xms:TsUFZPeWgC9eRjvMsq55l699Wbs4UTTYCpDS7FcoCuP8y4nEwb8_cg>
 <xme:TsUFZFNNDGd7bD_ILtdiZ2WhcnvNy7WJQqgRMclP9Rixy5Frh08SJOTyOYJBq8l8w
 nbm-cJtX02y5V1NqTI>
X-ME-Received: <xmr:TsUFZIjWmSezTMh3odWou6ZyrY_hygv-NXUyfUeY0_z0pyz0v8pkiH5KABmgu2n-jQZI_d5E0CRSYCxbouHkwte-7GgSz9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtiedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TsUFZA_0gQ0b07oD3hL2JsjW5Zf-bA-BNX9d4Obxh70MytELNXcBeA>
 <xmx:TsUFZLsosr15ltbEI44H2Wj4YUP2BBI9avras4Xq_zbZAjWx7oZZ1g>
 <xmx:TsUFZPH1vQyy539tYWY9ac3FOmjTlXbrRoEtj82mgIKtHDeFUPvZuw>
 <xmx:T8UFZGkhDMWdyBYdpBr8E0h7eCIulFI4PMoWnozdmo6GhqM6NmxQyg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 05:49:50 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 06 Mar 2023 11:46:46 +0100
Subject: [PATCH v3 5/9] drm/vc4: hdmi: Swap CSC matrix channels for YUV444
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v3-5-bdd54f66884e@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3982; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=82ngVmZANnzei7Xxy7a1H4a9x+IIfQ/+X+g9NLSgDK4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmsR6bv+aQsuM30uteJZV+k/s9ROWzDUy3gIXW3z8+yz4g7
 XeZERykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbCX8zIcJVLdGLF/o9ctVm7GbY0ym
 lONDrddvfRr/c9MjdiI4KKFjMydGad3qNqvf/gFFeu6Nuda85e6ZyzqOpp4YWE42uYF549wQkA
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

YUV444 and YUV422 actually require the same matrix, but programmed
differently.

We've dealt with it in the past by having two matrices, with the one
for YUV444 reordered to accomodate the hardware.

This gets in the way of subsequent reworks so let's define a function
that will take the coefficients swap into account, and remove the now
redundant YUV444 matrix.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index f0d8da241f24..f051e501efe6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1236,7 +1236,7 @@ static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] = {
 };
 
 /*
- * Conversion between Full Range RGB and Full Range YUV422 using the
+ * Conversion between Full Range RGB and Limited Range YUV using the
  * BT.709 Colorspace
  *
  *
@@ -1246,28 +1246,12 @@ static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] = {
  *
  * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
  */
-static const u16 vc5_hdmi_csc_full_rgb_to_limited_yuv422_bt709[3][4] = {
+static const u16 vc5_hdmi_csc_full_rgb_to_limited_bt709[3][4] = {
 	{ 0x05d2, 0x1394, 0x01fa, 0x0400 },
 	{ 0xfccc, 0xf536, 0x0e00, 0x2000 },
 	{ 0x0e00, 0xf34a, 0xfeb8, 0x2000 },
 };
 
-/*
- * Conversion between Full Range RGB and Full Range YUV444 using the
- * BT.709 Colorspace
- *
- * [ -0.100268 -0.337232  0.437500  128 ]
- * [  0.437500 -0.397386 -0.040114  128 ]
- * [  0.181906  0.611804  0.061758  16  ]
- *
- * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
- */
-static const u16 vc5_hdmi_csc_full_rgb_to_limited_yuv444_bt709[3][4] = {
-	{ 0xfccc, 0xf536, 0x0e00, 0x2000 },
-	{ 0x0e00, 0xf34a, 0xfeb8, 0x2000 },
-	{ 0x05d2, 0x1394, 0x01fa, 0x0400 },
-};
-
 static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
 				    const u16 coeffs[3][4])
 {
@@ -1281,6 +1265,20 @@ static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_CSC_34_33, (coeffs[2][3] << 16) | coeffs[2][2]);
 }
 
+static void vc5_hdmi_set_csc_coeffs_swap(struct vc4_hdmi *vc4_hdmi,
+					 const u16 coeffs[3][4])
+{
+	lockdep_assert_held(&vc4_hdmi->hw_lock);
+
+	/* YUV444 needs the CSC matrices using the channels in a different order */
+	HDMI_WRITE(HDMI_CSC_12_11, (coeffs[1][1] << 16) | coeffs[1][0]);
+	HDMI_WRITE(HDMI_CSC_14_13, (coeffs[1][3] << 16) | coeffs[1][2]);
+	HDMI_WRITE(HDMI_CSC_22_21, (coeffs[2][1] << 16) | coeffs[2][0]);
+	HDMI_WRITE(HDMI_CSC_24_23, (coeffs[2][3] << 16) | coeffs[2][2]);
+	HDMI_WRITE(HDMI_CSC_32_31, (coeffs[0][1] << 16) | coeffs[0][0]);
+	HDMI_WRITE(HDMI_CSC_34_33, (coeffs[0][3] << 16) | coeffs[0][2]);
+}
+
 static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
@@ -1303,7 +1301,8 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 	switch (vc4_state->output_format) {
 	case VC4_HDMI_OUTPUT_YUV444:
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_yuv444_bt709);
+		vc5_hdmi_set_csc_coeffs_swap(vc4_hdmi,
+					     vc5_hdmi_csc_full_rgb_to_limited_bt709);
 		break;
 
 	case VC4_HDMI_OUTPUT_YUV422:
@@ -1318,7 +1317,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 		if_cfg |= VC4_SET_FIELD(VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_FORMAT_422_LEGACY,
 					VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422);
 
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_yuv422_bt709);
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_bt709);
 		break;
 
 	case VC4_HDMI_OUTPUT_RGB:

-- 
2.39.2

