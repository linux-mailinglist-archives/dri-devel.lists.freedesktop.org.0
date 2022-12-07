Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BBA645E72
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4DE10E3EB;
	Wed,  7 Dec 2022 16:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7754710E3E3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 16:09:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CE3655C018B;
 Wed,  7 Dec 2022 11:09:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 07 Dec 2022 11:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670429361; x=
 1670515761; bh=YHRLmuQhYpWVXrMM0zJgMc8WtAAfUasmH7iyil8sVlg=; b=Q
 BIQ1OfmHXibD+vIWxQJj8IeuQ0eJRI1lyD2CIfN86rxVJfv+WA1UcDUDXq9Tal6b
 L0NuDfzknTYOgIcqqMgvaZ4cycHCG/tGbBgfiqrchxHVHHm3iYxTl2tLYYzQMtKv
 LfuZsVyszV3Gl4+LGm51ODuSIXzJGl+C2MCNf1N824tRYH9y5lpD3uhRIlPxcJ2+
 wGU3cbQeZ7C5yA1vXiUBd7anQ5iATJ0GumbJcJSiOpbPHiq8qMn0I0hxA0VpOVAS
 cbs8SOIw51Xx0W+ZTglhJAdS/WGFjzWhXiLTTlvXKB33csLJCQWYNIGeGhk+4Yyv
 DKuYnl77ImdRDhvV5txvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670429361; x=
 1670515761; bh=YHRLmuQhYpWVXrMM0zJgMc8WtAAfUasmH7iyil8sVlg=; b=s
 gG5OWanettho9cIYEbb0lTxRJ8HdaTrAgZ8JkVdTtA/ZAuAoNBtq0eAkJuxBTIzD
 QZtzfn4OVutL8eG1hJw7pfgSAJ1NBOmCausFWBvT4HCSbRARWAD/LLcwHIicBrup
 GXZfY8z6MuevjYMHxGcI9P80AtDZMpt9ffNXv+Ju7QeTKp7gwyv2WLPyn6ihHtyB
 wOMFmSY0xHFsPn4pi6f2z3YkgAH2WNU6BzCQRmzv4ieg2Kh7LzHYIgrH50ifRIP5
 3geR5hL2WEXMcY4RVK3ST8QNpO1yw35kZrgcBSSbgH1CcZU+fZIzGcbegnui8YWK
 S0m+EuzujkLzikjwqXmvg==
X-ME-Sender: <xms:sbqQY_xWnPsCwzTTfs77uSyjOW5QsLuB5I28G5l1FU7NvWYwqjGz3Q>
 <xme:sbqQY3SN_ZdAgFRofgZFCO7dkUnqcJ_A35y63_lQJmPhB61Ab3xl4lyI1qoOkvS-y
 9yxCW78Ex_qXBaIaPI>
X-ME-Received: <xmr:sbqQY5XKW3rQHQgrwAMuxCEF8zoObBTWN7SWkNnYbl3jN5NEKvoj9JWAQ2m1XlIO25iy1cacmL1-fmgwy-IhMwUmffnZNqoVe_e6xoGdyYx2pA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sbqQY5iLVs2JoR6pGniu1RvrbPda4Sz67nfHiTdjuMzUr2Q3UTi-JA>
 <xmx:sbqQYxDEp-sKDArbtWIYkhBo4x_NmUpcEUoccehwMLWv1BnSR1CNog>
 <xmx:sbqQYyJ3OzB5cpBr2hma0-ZSC-HE3pgg_JRXHvo2ITeFXIy84anwGw>
 <xmx:sbqQY5alAvSLsSvOAAqcxfzy6xrWHM171wnIqoj8vZR1b5xIBFaoPg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 11:09:21 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 17:07:52 +0100
Subject: [PATCH 8/9] drm/vc4: hdmi: Add BT.601 Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v1-8-6b15f774c13a@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=2131; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=iIbI5HLac1bVrGiMm7IXYnTLI/x/+D9iamG0JUy4yek=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTdgUbLdBY/JRru++U1SzMb1593THxwZXbb+Zv4EvyZuR+
 yvPBsaOUhUGMi0FWTJElRth8SdypWa872fjmwcxhZQIZwsDFKQATma7H8D80ybLxv2Ziy+M8tkozG1
 e/0DM3Cs5/n56mkN90Z01FmS/DP9PstU3zJm43lJypuzCNc5NQQ+zk9WLtc5rqVeve61+5zgoA
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

Even though we report that we support the BT601 Colorspace, we were
always using the BT.709 conversion matrices. Let's add the BT601 ones.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cd6775429b5e..e3428fb2c22d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1214,6 +1214,37 @@ static const u16 vc5_hdmi_csc_full_rgb_to_rgb[2][3][4] = {
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
@@ -1277,6 +1308,13 @@ static const u16
 (*vc5_hdmi_get_yuv_csc_coeffs(struct vc4_hdmi *vc4_hdmi, u32 colorspace, bool limited))[4]
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
2.38.1
