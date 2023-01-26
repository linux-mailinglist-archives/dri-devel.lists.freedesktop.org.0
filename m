Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EBF67CC9A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A7A10E8FB;
	Thu, 26 Jan 2023 13:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A7210E8F7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 13:48:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id DE0665C049F;
 Thu, 26 Jan 2023 08:48:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 26 Jan 2023 08:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674740897; x=
 1674827297; bh=EFCszt7mMoi4GmfPSY0XcTDr+E65T3khWEeN25Yggv4=; b=B
 ZYaycmgbMfTX1BRGlPtMLro/KjywPCJlUY9hdsiNJqRGsNgC63Vh+FcCty0Zo7+v
 gaIz3YU/njcSZIP0vB7rPSElAYrwOHMAPgErZUbBYLiQ+ABN2Jcl+BEbNkV8UhpO
 LDtl9RPW0PSqvkilJx4wGmI92AQDSBdhA3hUotGUqpzv0xC5iL1kcqsmwJS6d9Fc
 x/j/mPxYMrriGvenkBXJeHsoKBH1McIMKp5tekFkvYkqLZxmAaNYZHooxR1DOtJP
 KZiOMpH5nnV25QYr5BbeBLKa7So5SrmsIfq0zxDjS12ma+suBAZ8mYmu3Yw+V9P8
 wQaSPoWmUAt3O15o5VtiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674740897; x=
 1674827297; bh=EFCszt7mMoi4GmfPSY0XcTDr+E65T3khWEeN25Yggv4=; b=g
 N+p4WnWIggwn1/qGmQdLcGhNvQaKDzxeGGEbN2uicLairbQRP33QRpChJHrZ3ACN
 EGdg9C0bI4982jR6g57bAw/z9UZ6muqBaxDy9ZWUOXTbShQWJYNPiQtRMNqvjqVF
 XURPv5AGr0xxIxsBtPlLY4s+JdnrcMCPbISNPPor+eZc+nAMs6qe1xojovq/B/pI
 frrpnRo1CFLx2Ve0OwCgu+5jrNRTSoOz1p59UdyQo2uJHxVTw53Pi49bbUfxxJSh
 uXFHFOKpbGY0mYXEJ0YOKiMytxcpdlO8LFspOMSescv86+TVFYx3cKYXUoJNH0Be
 AphIrggfPnxfk/72vjYIA==
X-ME-Sender: <xms:oYTSY5Aj6LWvbamQqrBdoUpxf420rQ7XsaaqI8B3NSUg4lWlV7x5IA>
 <xme:oYTSY3iggPQkYuvaVC2ZV5yjbeeKStz0cHtX9k7RHyz2N32m3hwwp_EDyHzpRW96B
 J5N33eo14mhKnhXJec>
X-ME-Received: <xmr:oYTSY0l78KDn5YJ4sBfrLfbnrsKHq-EzlVzWrN--CC-ChI2Q8CO5CvFc5e0tFSiZo-AvRAEfKdd-J9A6MHcYzBHxHN0iJbOe_bwLaM8lJMVC9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oYTSYzyAV8-WIp-tLJcpKi3jVtM0UZKY0tTeawosEJZGOpq3kKtPzg>
 <xmx:oYTSY-RFC2HPHoGfEliGbHgXKy_tfsDCXiNHSCRYsF3vwBEjUwO-VA>
 <xmx:oYTSY2Y2rhlrrpz7ezYjQFOlyqLMTPsPA8ebKOylN7CJRCaevs409g>
 <xmx:oYTSY3DDPxsNRF5zQe0C6bCqEpf71fhGUrTat_d3tn02qALeASlOdA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 08:48:17 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 26 Jan 2023 14:46:43 +0100
Subject: [PATCH v2 9/9] drm/vc4: hdmi: Add BT.2020 Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v2-9-8ace2d8221ad@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Y/Qg484RrEzTOyvcWs4U+TlZS8r2m4kTGgXaUZsHHeY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXWlyC9pyY61uX+rNOqdB8y9ElS/P5vRx8997asuPyowmb
 8u/4dZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAifYGMDCcq3F3+vHq/wO9rem3u3x
 07hK1bo90OfTonuy68/Iq/8SdGhulcz66Vz627Wree1cXofuczrUkzyz++uvH35J/vR2Y4ePEAAA==
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

Even though we report that we support the BT.2020 Colorspace, we were
always using the BT.709 conversion matrices. Let's add the BT.2020 ones.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5d37952d620b..523b55a18409 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1300,6 +1300,37 @@ static const u16 vc5_hdmi_csc_full_rgb_to_yuv_bt709[2][3][4] = {
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
@@ -1345,6 +1376,13 @@ static const u16
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
2.39.1
