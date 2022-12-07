Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC240645E71
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D353210E3E9;
	Wed,  7 Dec 2022 16:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4092E10E3E5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 16:09:24 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 97F9A5C00C5;
 Wed,  7 Dec 2022 11:09:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 07 Dec 2022 11:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670429363; x=
 1670515763; bh=o3govFPZ9TDXWjhwGjG9dUBjhZnBpew2lQenIBrTic0=; b=L
 pky/gaTHoHPSiTmxucEilxu9Aucfqj03cabHlZqFv9joCzF4kuw82zwjaSLKSBp7
 fW0qrqK+lXUdCq5L82tY5XnSHwivbuew+sAJyv+T7V0O4EAYiUE9L23eefAWROVs
 Xt3y0c2SUrT05qm57CEPzWq/M/u9lEm+mkO7RN4/sHradi+Ymqd7EglVsxMt/OqO
 dc6LGQK4zUFdoOO+q05lGNnmXPmHHS3lwz5NPlVh3Ddj0662tMCMUgSmo++wzjJ1
 +18nS1a1K11JeN/lSzFpdfBEVu6tx48uffpaPksLbP9VTMw2kphH2QIFxg42OJtT
 Rmkolgvvto+jX2ZeXY8AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670429363; x=
 1670515763; bh=o3govFPZ9TDXWjhwGjG9dUBjhZnBpew2lQenIBrTic0=; b=C
 m0a8s3Ykv+j1YiMnCxiI7GH9WWjqFmAji3VOlRJEIfDG+CPxpbEzPTfBmZb8SLGl
 imi4a7LG58Aou3x9JgeJKWyttHvETaaXUuvE0ImBQ9UcxddvC1Smz7JY7TmjcPlb
 MfUaZXtDFxNl2+xIsxVbty/mMOJs531vtCWsNgpMl+Hxx7ZlOwy0Kb3YY8508+lA
 2wJ+0d6uq6mlRCTtelLvxGWFpSChGRRUo2sa6For8CmbSmG8uwqjkGmhZndN2FYJ
 HslNFvdeygnQhI0TjvgnREXTYpZJmKJNgvqG6nLh8dV7GcqxbZ0ShQF+NlZNpgex
 HMULWfeQQrTmubK79ZM1g==
X-ME-Sender: <xms:s7qQYz3UnxeBBN2mvH78EnE0CaFc64vnk86iDe8-fGNp_k6Y0ZpgvQ>
 <xme:s7qQYyFI7n3H5XW0npAqQtd9t--I1dxdtWYdfDu0hUxcX4KMEwk90mKGd9ibLW-9r
 EcOOt8gMj4fLjVtqcI>
X-ME-Received: <xmr:s7qQYz60DsfRmHh7uM2OYX7vDNj2mxj_zPXziWMGaOkToIyM2BUEuSZCnwwCIh3Le1YhV_g2IPbg8pmU46fFrFYcwZ1Rs57gvdmvtmS5npj7Mw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:s7qQY43ePSng4V8HQ4xGJhE24lLqgXv_z1f5vkDAvWDhagIoTKYmdg>
 <xmx:s7qQY2E0itFqqqRwBilE-y7QMKd-nIJuqwUvAZbdpjFJYrs8BYe8MQ>
 <xmx:s7qQY58POks7rzTqhSm4bLpFgyUgDTIGHmo_SxxXDSIpBfcGujhjeQ>
 <xmx:s7qQYzcEhAAacaiYBVy733s8-8XC9A8NSriOE6HWkmSkbC-I3fv1qA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 11:09:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 17:07:53 +0100
Subject: [PATCH 9/9] drm/vc4: hdmi: Add BT.2020 Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v1-9-6b15f774c13a@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=7EgvINvx0LZ5GQlV8rxr2sFz+Jzwj1VfMAT/EoLsgRo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTdgU7T0hc8v+wYqTmitC7ZuIb++csueHh2P9OS45p+Qvp
 7dEnO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRQ0wM/6zu6ueol0qsszoQkv1S8C
 WzfOVF66U3L9ZGxRqsryvmLmP47+27j2Pv756ItwohC7duTG+wSEk3e7y9UkZMUlKkeVUuDwA=
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

Even though we report that we support the BT.2020 Colorspace, we were
always using the BT.709 conversion matrices. Let's add the BT.2020 ones.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e3428fb2c22d..2734cab34660 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1277,6 +1277,37 @@ static const u16 vc5_hdmi_csc_full_rgb_to_yuv_bt709[2][3][4] = {
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
@@ -1322,6 +1353,13 @@ static const u16
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
2.38.1
