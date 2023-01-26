Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D067CC9F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A1610E8FD;
	Thu, 26 Jan 2023 13:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A9210E8F7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 13:48:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C86FE5C00ED;
 Thu, 26 Jan 2023 08:48:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 26 Jan 2023 08:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674740890; x=
 1674827290; bh=VyRefU5Aq6YeN6sKzbecpukjT1UK8lBHWpRvWflgq+c=; b=N
 25AsFHHnTdqFN2JNV5t7J3OUD6bk5Adl8OMcGnzWCsBn7SuiWvMn3a6kB0oou68I
 ynHNmm3NwOVCnZAG/U+bgsIn2ukxDeRx8zhiBLtrVg3iY6F/3f1L5OnUgKqiCVnx
 gRLt8UeCO5YI5+l7y3VEZg4DVCdGGJxUmjCK+rvukKpcgf+CahbhCJ4jn+bgi8Of
 tg+2H3TvzRIkz0/CM7xcYMFMIbxoN+PnsUm4kt6Znh9ex2pben49FrvQl0qSGI2d
 xXy5AKEmVUX6eTru/dhLmhh3Vk9dIz9dhnipGEjrJd85Z2uY+zDTFmkKOXGiQ51k
 5IIbaJbusWdJ/ZPtkWJiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674740890; x=
 1674827290; bh=VyRefU5Aq6YeN6sKzbecpukjT1UK8lBHWpRvWflgq+c=; b=d
 RJLXvSRdgPu5XnU1Ac2KmnWsgV/TEm5SoFtdAvwlMS8BFRh1OGhnbvDJBNhNMjNs
 CyJDwu5q5hzdjinWhj3xqqarcCSj30Ip6/f2bNOENhlMRyPc0xMqWue5mdu5fHAS
 AWCKk2R8lVlROU79ObH2zf99FZwhh5b/lzzBkunOB7ayrfRR0KVrxP/MChLrHo3L
 COXATd+GC/B65oF7cyk/IRX2gUg+PyXEHL/2WkEDMJ/muylIRQLl7z3U2ieZq+P4
 l0lMPqyzA5V1O7SlLwsnaDPbwkXDzEAjhkQCUQg5tWXqWLmG47RZw5eg8/qoWzEy
 oA+7nkh2XR/qQrbHU0swQ==
X-ME-Sender: <xms:moTSYyWEIJTQxe6kyFU0r7EsN1Zh-jfQVpeI68-qZS11ZyUZ71spJw>
 <xme:moTSY-mdo3j62-m02zUBXQ7IBtYnjzfCh4yp_5-nJqfBmxh0YDN5WTZIHHGH2mn-8
 59AINpy-DBkudIz04A>
X-ME-Received: <xmr:moTSY2bqtfUD24tmc3HDgipvAYeZHHlLmppGw2dYk6fIgcKG42SEtlTeGyMBNsDp45u-orenHrA1zXIMnoLKqT_ml5qgaJ4JNrD5DVCBO807zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:moTSY5Xd993lUbn5wQLJ4z0sHtW3ZFU8mgPpztap1ZaDj0NBtvYl3Q>
 <xmx:moTSY8n6POtdtU0qoLcKay8TDd82YHGyJCOv8OtTBuyjsEFba-Mgiw>
 <xmx:moTSY-f5efK89XSiYAeop4QM87pCFxs5jv4fAOtHAxH9NswQpB_0aQ>
 <xmx:moTSY20CDK2CXqUQFpJSjh7J-stZvhPjz0m2EcCSgOLMsXDeSwrV0A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 08:48:10 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 26 Jan 2023 14:46:39 +0100
Subject: [PATCH v2 5/9] drm/vc4: hdmi: Swap CSC matrix channels for YUV444
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v2-5-8ace2d8221ad@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3982; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=UwqOqS6r27oEfGDwQDiRBXO6hHK4sEFg3b7mVees1oE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXWlzmHNiedZSz41bj8pxaxQePtk++wfupqbN8lvqSmwfL
 JbwSOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRLykM/wNbg9U2CzmFtWy+sX2VmI
 xK21T/l73mRnZP/p+fEGB67QIjw4rlduEP950pMNlhMcN5XY5G3ZoPmqma217sDONeuo3RnAEA
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
index e5e7fe4c6a63..78c17166f296 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1233,7 +1233,7 @@ static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] = {
 };
 
 /*
- * Conversion between Full Range RGB and Full Range YUV422 using the
+ * Conversion between Full Range RGB and Limited Range YUV using the
  * BT.709 Colorspace
  *
  *
@@ -1243,28 +1243,12 @@ static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] = {
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
@@ -1278,6 +1262,20 @@ static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
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
@@ -1300,7 +1298,8 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 	switch (vc4_state->output_format) {
 	case VC4_HDMI_OUTPUT_YUV444:
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_yuv444_bt709);
+		vc5_hdmi_set_csc_coeffs_swap(vc4_hdmi,
+					     vc5_hdmi_csc_full_rgb_to_limited_bt709);
 		break;
 
 	case VC4_HDMI_OUTPUT_YUV422:
@@ -1315,7 +1314,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 		if_cfg |= VC4_SET_FIELD(VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_FORMAT_422_LEGACY,
 					VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422);
 
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_yuv422_bt709);
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_bt709);
 		break;
 
 	case VC4_HDMI_OUTPUT_RGB:

-- 
2.39.1
