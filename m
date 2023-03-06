Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CB56ABD51
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7809910E228;
	Mon,  6 Mar 2023 10:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897D510E226
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 10:49:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E2F365C01D1;
 Mon,  6 Mar 2023 05:49:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 06 Mar 2023 05:49:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1678099797; x=1678186197; bh=3LgWprbX5kA5Va6btukRYvTCS0RBMIhdHYR
 4XuAfLz0=; b=afEgjWaZ9jP611VXN/fYX6bLaJqszML5NEiQnCn4MSVmsxLB6pc
 dM4u8YHKHV918ptc41kqgx5QyEdNIxMNVf8nXaricQaOQxYUzmns8y+NnP9XlnhT
 qxqHF5rFz7Ck8bP43Mvw3pbg8IW3K4xTPmgZJfgGY5vXx0eEkhEB4K36GqlxeF5P
 OIMsG8p0ZP66eWwKsb3VntJOLyqL15ndsjV2/3n9eUORpm13oWX+O6h1UFSYYGii
 Hsppjp0+Qdp7hbUPDhSyxoaCdRd+tb44LJv9P7HvStRWPd3Rb4ZPq1V3JMAst4EG
 xPyOFnVlmzu0pRsHHeczENYn0P37T6YGJSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678099797; x=1678186197; bh=3LgWprbX5kA5Va6btukRYvTCS0RBMIhdHYR
 4XuAfLz0=; b=DDy9neEkmfzCQ7YhCL0ka9SaAdNkguHqmXmUUVHwDAwttD12KRs
 KalbVrB4ZbohDmAMHSximmXFhDggODlbO+Kdvit1y1PlohTbYdPm3N+UE7otrtHx
 tlZAa3YwrlYTCkH4FEC8tIfy0obkKLF5h0Y3HGcazyNTglnmiuxYTNdMbnqC9yQu
 GMRTY2JzC4rOgpwzlVONrpYW3VNn4cM4HmqP7/FLiaFkRiLyHBTK/Nt9nPYfRhFD
 IxZvpg9+O5zq0F132tYKQbs7uEvpAv8xD1s60/50hjcoRCO4zziTYgvUu4RQtzE0
 UyzXnVgewwZAuQi3r8aMOnzRqJNmIuqDc1g==
X-ME-Sender: <xms:VcUFZCqJGJFkjy6xCD0z2GPWCOqI6vctcmvecpz2Qv7YH1vnNIA-7g>
 <xme:VcUFZAo_XPmCYlzJ_qya83iYaMXUFAAdKYI6UIGW2dBO6A0v33vBzMd9n41kycrNv
 jI6KjS3z8rDkmsl2yQ>
X-ME-Received: <xmr:VcUFZHMrgs3KoKRAPQZKs3ugwooLujsmUt003pqa2kxzD9O6cxTEirFSiXGh1m6n-E3llVomoUdUv6xy5IWUp50-EFsXdJk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtiedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VcUFZB4-XYDbJ2nAbi43JsHz7SsBpBoLSgPtY_naI1DWpptAc4GXHw>
 <xmx:VcUFZB4rbvG9tkr2amFIz258Fl5dF1H06DfKZwo5fdH4YoiZPDf_xw>
 <xmx:VcUFZBjsMwsgDDeD8Tg7hrbMAKFuvTzTJyyTY4lue13x4qrYIGvs_w>
 <xmx:VcUFZOxjuQ4-5VmDnJYkXJ3OJJD6pVTOVMev3xVmrPh559nDwu7M4Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 05:49:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 06 Mar 2023 11:46:49 +0100
Subject: [PATCH v3 8/9] drm/vc4: hdmi: Add BT.601 Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v3-8-bdd54f66884e@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2186; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ycrDK940BO7WIBUGy7jz8rSeJQgc2LgRhkJYTmg16KI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmsR2ZsndDGfDvypHiFoebbCo/3iTM5LG2Cb2Z02yStnN6w
 90NFRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbSp8Xwzzbl5YsjgVr+Tzm7xb7vS3
 r5vc7rY+Tx8BzZfFFFicnTKhgZXsu7TynP6pLefNY77nIBy3y5P7UfXR0q3ty1Vvu68X82PwA=
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

Even though we report that we support the BT601 Colorspace, we were
always using the BT.709 conversion matrices. Let's add the BT601 ones.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1424835bd83e..ad38cac3d1b9 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1240,6 +1240,37 @@ static const u16 vc5_hdmi_csc_full_rgb_to_rgb[2][3][4] = {
 	},
 };
 
+/*
+ * Conversion between Full Range RGB and YUV using the BT.601 Colorspace
+ *
+ * Matrices are signed 2p13 fixed point, with signed 9p6 offsets
+ */
+static const u16 vc5_hdmi_csc_full_rgb_to_yuv_bt601[2][3][4] = {
+	{
+		/*
+		 * Full Range
+		 *
+		 * [  0.299000  0.587000  0.114000  0   ]
+		 * [ -0.168736 -0.331264  0.500000  128 ]
+		 * [  0.500000 -0.418688 -0.081312  128 ]
+		 */
+		{ 0x0991, 0x12c9, 0x03a6, 0x0000 },
+		{ 0xfa9b, 0xf567, 0x1000, 0x2000 },
+		{ 0x1000, 0xf29b, 0xfd67, 0x2000 },
+	},
+	{
+		/* Limited Range
+		 *
+		 * [  0.255785  0.502160  0.097523  16  ]
+		 * [ -0.147644 -0.289856  0.437500  128 ]
+		 * [  0.437500 -0.366352 -0.071148  128 ]
+		 */
+		{ 0x082f, 0x1012, 0x031f, 0x0400 },
+		{ 0xfb48, 0xf6ba, 0x0e00, 0x2000 },
+		{ 0x0e00, 0xf448, 0xfdba, 0x2000 },
+	},
+};
+
 /*
  * Conversion between Full Range RGB and YUV using the BT.709 Colorspace
  *
@@ -1303,6 +1334,13 @@ static const u16
 (*vc5_hdmi_find_yuv_csc_coeffs(struct vc4_hdmi *vc4_hdmi, u32 colorspace, bool limited))[4]
 {
 	switch (colorspace) {
+	case DRM_MODE_COLORIMETRY_SMPTE_170M_YCC:
+	case DRM_MODE_COLORIMETRY_XVYCC_601:
+	case DRM_MODE_COLORIMETRY_SYCC_601:
+	case DRM_MODE_COLORIMETRY_OPYCC_601:
+	case DRM_MODE_COLORIMETRY_BT601_YCC:
+		return vc5_hdmi_csc_full_rgb_to_yuv_bt601[limited];
+
 	default:
 	case DRM_MODE_COLORIMETRY_NO_DATA:
 	case DRM_MODE_COLORIMETRY_BT709_YCC:

-- 
2.39.2

