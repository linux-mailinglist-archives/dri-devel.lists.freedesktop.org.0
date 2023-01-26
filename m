Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E53BF67CCA0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624C010E8FF;
	Thu, 26 Jan 2023 13:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9F210E8F7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 13:48:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 18FEE5C04A1;
 Thu, 26 Jan 2023 08:48:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Jan 2023 08:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674740896; x=
 1674827296; bh=7Ocr1OPj0XEAK6K/oP9BSLvRt/V3DbsreKFmkSzzphQ=; b=L
 rjpBoA074uT/3xYJgNlGmm+1+kMUYi0PtUvZEW7qsTmzmkwspUlLsexK6NeQda2n
 +e6UtoqHrzbu9N3y4khr+CnUmLaOdC7uLI+/HetqwAHzsX644D59rQhbbt0uyAaF
 Yao7+P5l0H7gabLuujjsW4TCefDC3uPXrt+Zu1JSrgZI0txfrmb+exgRnUufbiGo
 Nun0W5UQZwbrqe/Ikx1P1SeAmIUj24jNpLWzDVs2RQfhUXM5bKiFtBNLbT4/BcFC
 OoomhKmRLzGdQ5JCiGa8cluwIjMnDuMUtxSrwWiHwcyWeDZbxPQ7l6JOTq2p/7rg
 plHIT3UzVWbS8kxWue/HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674740896; x=
 1674827296; bh=7Ocr1OPj0XEAK6K/oP9BSLvRt/V3DbsreKFmkSzzphQ=; b=Q
 RM1zNde83JaVyifELnjKcDE1Ao9BmIy8lm0jEvWH3pgNWuKuBNPaOd1BqMH0ugFn
 ux57g2toRDNPLx+whyzlzeJsYcvyBo2h5Pvt8Qvqjnmf0HXasGbxAJPQEFnkkRGp
 NMvDrhpmEg+z34UE7TGtM8oWEJGeXn1E0a+iQXhwqx2hbwR1eu6BQ0jueaPEOcfh
 /mGX6WxYGcqNbfZbtJ/NMNbg1MANrp6ZFMYwbH0KvrbOOwW3Tp4qG8slbsOHsbs0
 rHz+9wOwK8/DgHFNxqaBjyeUswnp9Yxbqr9BkiMP9dUBcT7cO71b+XUoufxiyLdG
 54lC0O0QEcHsKHKb7Y2KQ==
X-ME-Sender: <xms:n4TSYzPtFnIovQLCu_46YfQr5n_6baZT7gg7fLzFUWyaU3SfrhoXrg>
 <xme:n4TSY9_s2FnX8w8xrR9_FrUnhcwVhGgoxNy2J5awR-0YlPRqyKNOogTZRZRCgaaV2
 RwmVkAgh9GVblqh6ZM>
X-ME-Received: <xmr:n4TSYySNId3c7aQomHO709tSK-nAn9Wkxdn1_I6H6WXZ9JbPDvSOm0x3Hx3k_3uBjuDHzqkPeD_frcQV6-fULN4mps1PCWqcDkk8tB1iOBnOAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:n4TSY3vcKuZHYKf6TCqsSFeuHbwB5SL6M3gOQpzAkyycKwsAMJEpFQ>
 <xmx:n4TSY7cm_qlSM6wF1l9ikbaBFzJVROdhBLgJfWDiiZnnqxmuO5kJCg>
 <xmx:n4TSYz2CmZuKLXfJGX5UwFi67QarwYCrXAWxmLlrjVhjc49WUUYRFg>
 <xmx:oITSY2saBvsomAxOML9fOULYeq2y8oR38PTpJT6zLCC8M5skn0qIjA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 08:48:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 26 Jan 2023 14:46:42 +0100
Subject: [PATCH v2 8/9] drm/vc4: hdmi: Add BT.601 Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v2-8-8ace2d8221ad@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2186; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=eSsypKbbtQQn/VQJzOqV5FzksiiFE/c/tMFcoMAuIuY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXWlxkp/au7hbSP5DBEGAgXV24mtvaJv8cI8vkU7e+fhBt
 3O/VUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIl8Ocbwz8BQ7Nj1428z6yV4Ch9MPX
 bpnV3c//avK/4u4Nmo5zR7aTIjw8so5tRor6bwC4u/f191beWRvdf/3NWyLIw5uUl9XaNzGg8A
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

Even though we report that we support the BT601 Colorspace, we were
always using the BT.709 conversion matrices. Let's add the BT601 ones.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index c74a01f97de5..5d37952d620b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1237,6 +1237,37 @@ static const u16 vc5_hdmi_csc_full_rgb_to_rgb[2][3][4] = {
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
@@ -1300,6 +1331,13 @@ static const u16
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
2.39.1
