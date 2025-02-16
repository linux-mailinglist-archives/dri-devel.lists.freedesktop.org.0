Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CC8A372F1
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 10:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC8510E257;
	Sun, 16 Feb 2025 09:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Ps0sPvx1";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="h5Jcwdtt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5478110E233
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 09:02:44 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 53ADF1140113;
 Sun, 16 Feb 2025 03:57:03 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 03:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739696223; x=
 1739782623; bh=oNtQL9sxppnGlWKrImLnx1rLFbj0k2zmSqYqt+MhF00=; b=P
 s0sPvx1DbPPaDtLWoyB3FL1C/qbk8VXiBlg+a9luLomSUGHMTxLQYfYCltRKSWUq
 qE+1Wp8d/koepl4UqLrBa444xbWbiPEMr9D/6LgO3Tm0iXiKPKnWvYmfIBQJVx/w
 1kJrkVmDmv3ykvKHkJBiPXCEiOr9v/EqhOccQw3li5M18+FyxJScwNfthyE8IU2u
 /YitYHYBZ43384paUF1Pq5qdkbuLHXW4sZq6tSf1rrq957Kqnv+KVf9ZNL5rcIIl
 zgxA3LXPUWEJmo6N1mDFKfyMWH776J6Jf1d09ENwTyEr7CtHgnB8eOQev3idgXBD
 OVDN97NP8hVLvefoVAJbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739696223; x=1739782623; bh=o
 NtQL9sxppnGlWKrImLnx1rLFbj0k2zmSqYqt+MhF00=; b=h5JcwdttwManKY6Fo
 Ff67XqaoMG6Zc4oNGRPewN1kLWTBD30Po36zhFI0kSeyioaUjBvnTuHOmDEa3zdF
 +dGE1Mhj4zruXLzfP1T7pIfhYXM5eeCj0+QpmmhBmlm2od9e75nDataoiR8O9B4U
 8DZ4uctQlLdgcwpGxci+wSMwEdTrjcRH77E86pt37vrvHI6bpJBav/E5QTLBH+sL
 l9S2JPBPkz/t0oojF9ajSrctt3v680pKoxnt3OnuyB6mvQtQq6z3083hic9zYmaL
 sSGbrTvpwpnAAgS9tNam9gDiVbWx07OjH2poeJGOxuEF3gsbVUBWyJ6afrghq3R+
 L5M3Q==
X-ME-Sender: <xms:X6ixZwNrKKXzeRJqQ0VXgmekKd24b4PrrPhLw26WQOoHJZtBaKTmjQ>
 <xme:X6ixZ29eFCt6MLFApboyHq5TAwF5l501WXC5uVArd6WU432dGI-NR_UHD2y-yE6HW
 xwHK1Dc3TzIqEODOA>
X-ME-Received: <xmr:X6ixZ3RHOOywmz0AdnpDXAIujzVQVzMukX9y30XA0YrDErDKsQPxWlEVO4EoZ4iYXV8wOIcZdH5GAxPCF6rWdt11GEptEXvp-pbe5Bs9XM1B>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
 drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
 veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrg
 hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
 phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
 phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
 gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
 thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
 hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
 lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
 hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:X6ixZ4sQ_N_kAlFZTr-fWxUUj3oAERMwhO278ry6k85APm4R5S9hYw>
 <xmx:X6ixZ4exl9v2ba689X1ey7NoiNL8XX8YhTwTbFFURaqz5VJoppPcLg>
 <xmx:X6ixZ818cASfe1NLBjBS0MloGXZUN5m8D_c8w1BLd2fX9SbW4dJsPw>
 <xmx:X6ixZ8_injmwwPRmy87QUsKFRflDtEhKWWbhKcyNZ-_LpSPrhkEODA>
 <xmx:X6ixZ5vzO2T-uk89aozwtqylW5D3i_A1ebRtEW6HgImw8JS0LMgaYyvV>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:56:56 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v6 11/27] drm: sun4i: de3: add YUV support to the color space
 correction module
Date: Sun, 16 Feb 2025 21:50:42 +1300
Message-ID: <20250216085432.6373-13-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Add coefficients and support for YUV formats to the display engine
colorspace and dynamic range correction submodule.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 151 +++++++++++++++++++++++++++++-
 1 file changed, 149 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 7f3dc6a7b550d..0db946ef30b1b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -5,6 +5,8 @@
 
 #include <drm/drm_print.h>
 
+#include <uapi/linux/media-bus-format.h>
+
 #include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 
@@ -107,6 +109,135 @@ static const u32 yuv2rgb_de3[2][3][12] = {
 	},
 };
 
+/* always convert to limited mode */
+static const u32 rgb2yuv_de3[3][12] = {
+	[DRM_COLOR_YCBCR_BT601] = {
+		0x0000837A, 0x0001021D, 0x00003221, 0x00000040,
+		0xFFFFB41C, 0xFFFF6B03, 0x0000E0E1, 0x00000200,
+		0x0000E0E1, 0xFFFF43B1, 0xFFFFDB6E, 0x00000200,
+	},
+	[DRM_COLOR_YCBCR_BT709] = {
+		0x00005D7C, 0x00013A7C, 0x00001FBF, 0x00000040,
+		0xFFFFCC78, 0xFFFF52A7, 0x0000E0E1, 0x00000200,
+		0x0000E0E1, 0xFFFF33BE, 0xFFFFEB61, 0x00000200,
+	},
+	[DRM_COLOR_YCBCR_BT2020] = {
+		0x00007384, 0x00012A21, 0x00001A13, 0x00000040,
+		0xFFFFC133, 0xFFFF5DEC, 0x0000E0E1, 0x00000200,
+		0x0000E0E1, 0xFFFF3135, 0xFFFFEDEA, 0x00000200,
+	},
+};
+
+/* always convert to limited mode */
+static const u32 yuv2yuv_de3[2][3][3][12] = {
+	[DRM_COLOR_YCBCR_LIMITED_RANGE] = {
+		[DRM_COLOR_YCBCR_BT601] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x00020000, 0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00020000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00020000, 0x00000000,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x00020000, 0xFFFFC4D7, 0xFFFF9589, 0xFFC00040,
+				0x00000000, 0x0002098B, 0x00003AAF, 0xFE000200,
+				0x00000000, 0x0000266D, 0x00020CF8, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x00020000, 0xFFFFBFCE, 0xFFFFC5FF, 0xFFC00040,
+				0x00000000, 0x00020521, 0x00001F89, 0xFE000200,
+				0x00000000, 0x00002C87, 0x00020F07, 0xFE000200,
+			},
+		},
+		[DRM_COLOR_YCBCR_BT709] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x00020000, 0x000032D9, 0x00006226, 0xFFC00040,
+				0x00000000, 0x0001FACE, 0xFFFFC759, 0xFE000200,
+				0x00000000, 0xFFFFDAE7, 0x0001F780, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x00020000, 0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00020000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00020000, 0x00000000,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x00020000, 0xFFFFF782, 0x00003036, 0xFFC00040,
+				0x00000000, 0x0001FD99, 0xFFFFE5CA, 0xFE000200,
+				0x00000000, 0x000005E4, 0x0002015A, 0xFE000200,
+			},
+		},
+		[DRM_COLOR_YCBCR_BT2020] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x00020000, 0x00003B03, 0x000034D2, 0xFFC00040,
+				0x00000000, 0x0001FD8C, 0xFFFFE183, 0xFE000200,
+				0x00000000, 0xFFFFD4F3, 0x0001F3FA, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x00020000, 0x00000916, 0xFFFFD061, 0xFFC00040,
+				0x00000000, 0x0002021C, 0x00001A40, 0xFE000200,
+				0x00000000, 0xFFFFFA19, 0x0001FE5A, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x00020000, 0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00020000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00020000, 0x00000000,
+			},
+		},
+	},
+	[DRM_COLOR_YCBCR_FULL_RANGE] = {
+		[DRM_COLOR_YCBCR_BT601] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x0001B7B8, 0x00000000, 0x00000000, 0x00000040,
+				0x00000000, 0x0001C1C2, 0x00000000, 0xFE000200,
+				0x00000000, 0x00000000, 0x0001C1C2, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x0001B7B8, 0xFFFFCC08, 0xFFFFA27B, 0x00000040,
+				0x00000000, 0x0001CA24, 0x0000338D, 0xFE000200,
+				0x00000000, 0x000021C1, 0x0001CD26, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x0001B7B8, 0xFFFFC79C, 0xFFFFCD0C, 0x00000040,
+				0x00000000, 0x0001C643, 0x00001BB4, 0xFE000200,
+				0x00000000, 0x0000271D, 0x0001CEF5, 0xFE000200,
+			},
+		},
+		[DRM_COLOR_YCBCR_BT709] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x0001B7B8, 0x00002CAB, 0x00005638, 0x00000040,
+				0x00000000, 0x0001BD32, 0xFFFFCE3C, 0xFE000200,
+				0x00000000, 0xFFFFDF6A, 0x0001BA4A, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x0001B7B8, 0x00000000, 0x00000000, 0x00000040,
+				0x00000000, 0x0001C1C2, 0x00000000, 0xFE000200,
+				0x00000000, 0x00000000, 0x0001C1C2, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x0001B7B8, 0xFFFFF88A, 0x00002A5A, 0x00000040,
+				0x00000000, 0x0001BFA5, 0xFFFFE8FA, 0xFE000200,
+				0x00000000, 0x0000052D, 0x0001C2F1, 0xFE000200,
+			},
+		},
+		[DRM_COLOR_YCBCR_BT2020] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x0001B7B8, 0x000033D6, 0x00002E66, 0x00000040,
+				0x00000000, 0x0001BF9A, 0xFFFFE538, 0xFE000200,
+				0x00000000, 0xFFFFDA2F, 0x0001B732, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x0001B7B8, 0x000007FB, 0xFFFFD62B, 0x00000040,
+				0x00000000, 0x0001C39D, 0x0000170F, 0xFE000200,
+				0x00000000, 0xFFFFFAD1, 0x0001C04F, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x0001B7B8, 0x00000000, 0x00000000, 0x00000040,
+				0x00000000, 0x0001C1C2, 0x00000000, 0xFE000200,
+				0x00000000, 0x00000000, 0x0001C1C2, 0xFE000200,
+			},
+		},
+	},
+};
+
 static void sun8i_csc_setup(struct regmap *map, u32 base,
 			    enum sun8i_format_type fmt_type,
 			    enum drm_color_encoding encoding,
@@ -153,25 +284,41 @@ static void sun8i_de3_ccsc_setup(struct sun8i_mixer *mixer, int layer,
 				 enum drm_color_encoding encoding,
 				 enum drm_color_range range)
 {
-	u32 addr, val, mask;
+	u32 addr, val = 0, mask;
 	struct regmap *map;
 	const u32 *table;
 	int i;
+	struct sun8i_color_model model;
 
 	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
 	table = yuv2rgb_de3[range][encoding];
 	map = mixer->engine.regs;
+	model = mixer->color_model;
 
 	switch (fmt_type) {
 	case FORMAT_TYPE_RGB:
-		val = 0;
+		if (model.format == MEDIA_BUS_FMT_RGB888_1X24)
+			break;
+		val = mask;
+		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
+		regmap_bulk_write(map, addr, rgb2yuv_de3[model.encoding], 12);
 		break;
 	case FORMAT_TYPE_YUV:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    model.format,
+						    model.encoding);
+		if (!table)
+			break;
 		val = mask;
 		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
 		regmap_bulk_write(map, addr, table, 12);
 		break;
 	case FORMAT_TYPE_YVU:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    model.format,
+						    model.encoding);
+		if (!table)
+			table = yuv2yuv_de3[range][encoding][encoding];
 		val = mask;
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
-- 
2.48.1

