Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0876ABD52
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645BD10E22B;
	Mon,  6 Mar 2023 10:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA77110E228
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 10:50:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2F8125C0249;
 Mon,  6 Mar 2023 05:50:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 06 Mar 2023 05:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1678099800; x=1678186200; bh=6eoGrQcwaexD/rm/MylmiHZat3xXP2tZ2Cn
 2eZX6KLc=; b=iWwoIK+Z+MAXcB42fJPUnXOrPmUVRsSsvaQ5o4S1ofnAvAMVLXI
 yer0cQxnO3Xq2n9nJGrqQLvysRa4WPisnrm1w+xnPCyhll3wRR56ZIJNBlYBftF1
 8Ziq/tky6E/091IQpE8xVtplQThFfYhBPQZp1KgEZ9aXPCeesq9hJbrFVn3HuocH
 Vgqkyx0usD/g8dRLj3VoHKCRuzoX9RmD2A9glSbpGH/sVy2N8NeqNkhXyGJI7ADh
 sCDXivC6bd68wO/YYSYuLG9IDbi9g6+eYiUBhO1h3J4cGP6sLfvPaXwwpNKWaXAE
 P4EDkEEitmGSdvn2u8zNOQYqK8SuEQcdV4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678099800; x=1678186200; bh=6eoGrQcwaexD/rm/MylmiHZat3xXP2tZ2Cn
 2eZX6KLc=; b=owOq8F45Wm7DCoZANWJ/CTsic5e33gBtWihR2HMrpUoXcKxXquH
 1m6ST8zX8yPzqWJGd7I1R4u2eDdE9DgNOKdV+mqcFygVP5eLWKalIZJxkkWoE/vr
 jwtjBeq8xAd8qUje0p1Cj4uUZD5TD2e/XtAy0XkAB3d7kOn0FEHh3FsX6tMyEULj
 JZZlJ1IR16IZV1PtS/QihuAigGRgcbU2EUm+bh3nAio6YSaNo7df5Bt7tlSk4xcE
 Y5cDYsbnn894ED62rK+zXhkIohL7kNg3N0NBuNTduBPhKvsyQTcvlu8N7FRj7rW1
 VHDvSb++oGf7wzByN6vyGGe00AEGe0ReoaA==
X-ME-Sender: <xms:WMUFZIiTjsntbwDXM45qzz-KERx3vGvRYnyuqj6jUL_dGNadfJLvDA>
 <xme:WMUFZBAdlyOEAOmWaZPxhD2JcxVYW4_kZInP0RqDkc4w1gqN_txs7ukj78BDSV_yy
 DRgAitMVDntCtz6AtE>
X-ME-Received: <xmr:WMUFZAEYlI2k7Hmk3k1eVVWIwi3TH5y7e6u9GgxKJhj-6L5Nm14KjxD4MqgM24UJloZDLKXWT-0mMMmyKdBaky1NufILR50>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtiedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WMUFZJSKbplh-79F17VofHv5V0sKGfSK0au6hNthEPAUDE29yOyulQ>
 <xmx:WMUFZFy9RfmX6UpPz2wbXm6rWonICCuGjP3A528tF4HJ355eUVe3Mw>
 <xmx:WMUFZH7kiKS1L_SLIa8YP4QQy-bmSTUZSKg7bOBV1jcGDfJYtyK9qw>
 <xmx:WMUFZGq7NJcyW6Nprf5U_jahyZVz-FRXOUvS-UGhSQzQVbUj38ujFQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 05:49:59 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 06 Mar 2023 11:46:50 +0100
Subject: [PATCH v3 9/9] drm/vc4: hdmi: Add BT.2020 Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v3-9-bdd54f66884e@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=p7y74BMTOFXpAKXaHOFAbcxdR3Y3fjhhLH8Fd1pRb58=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmsR2YYXjt/JMr59aTIlJhnU9iDPte5qiRnX1uboXGkX/Fn
 4H3/jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwkpozhn+4MtX97TWNv7nn+mrtaKd
 ho+Vv7hdPdQ4wn+/Y6J6hZFDIyLJ6yMG7d8v86doqWEWu3l79RffepiWNZ7Jln3H+1xLJSOQA=
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

Even though we report that we support the BT.2020 Colorspace, we were
always using the BT.709 conversion matrices. Let's add the BT.2020 ones.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ad38cac3d1b9..2787284e60ea 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1303,6 +1303,37 @@ static const u16 vc5_hdmi_csc_full_rgb_to_yuv_bt709[2][3][4] = {
 	},
 };
 
+/*
+ * Conversion between Full Range RGB and YUV using the BT.2020 Colorspace
+ *
+ * Matrices are signed 2p13 fixed point, with signed 9p6 offsets
+ */
+static const u16 vc5_hdmi_csc_full_rgb_to_yuv_bt2020[2][3][4] = {
+	{
+		/*
+		 * Full Range
+		 *
+		 * [  0.262700  0.678000  0.059300  0   ]
+		 * [ -0.139630 -0.360370  0.500000  128 ]
+		 * [  0.500000 -0.459786 -0.040214  128 ]
+		 */
+		{ 0x0868, 0x15b2, 0x01e6, 0x0000 },
+		{ 0xfb89, 0xf479, 0x1000, 0x2000 },
+		{ 0x1000, 0xf14a, 0xfeb8, 0x2000 },
+	},
+	{
+		/* Limited Range
+		 *
+		 * [  0.224732  0.580008  0.050729  16  ]
+		 * [ -0.122176 -0.315324  0.437500  128 ]
+		 * [  0.437500 -0.402312 -0.035188  128 ]
+		 */
+		{ 0x082f, 0x1012, 0x031f, 0x0400 },
+		{ 0xfb48, 0xf6ba, 0x0e00, 0x2000 },
+		{ 0x0e00, 0xf448, 0xfdba, 0x2000 },
+	},
+};
+
 static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
 				    const u16 coeffs[3][4])
 {
@@ -1348,6 +1379,13 @@ static const u16
 	case DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED:
 	case DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT:
 		return vc5_hdmi_csc_full_rgb_to_yuv_bt709[limited];
+
+	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
+	case DRM_MODE_COLORIMETRY_BT2020_YCC:
+	case DRM_MODE_COLORIMETRY_BT2020_RGB:
+	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
+	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
+		return vc5_hdmi_csc_full_rgb_to_yuv_bt2020[limited];
 	}
 }
 

-- 
2.39.2

