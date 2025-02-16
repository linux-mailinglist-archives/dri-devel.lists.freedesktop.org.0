Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD97DA372E4
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 09:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150B310E22C;
	Sun, 16 Feb 2025 08:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="NCFaN9bd";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="DItXBZuK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C8010E22C
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 08:59:08 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id B07D825400CE;
 Sun, 16 Feb 2025 03:59:07 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 03:59:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739696347; x=
 1739782747; bh=BAR8VoU78pWZnpFbmMbAmvTHr51g90Cutu+w7Df6Rt8=; b=N
 CFaN9bdrl3RkKNu1oTzS15oTvayfhX1GQhnSlGZFYVMNFNWDKYXhIrH+NAyYtimo
 IWRBphLqCX1iFPj0+Hqk18NZCHc7QtkoISNAWlUH0eNYcHRSdVwszVfeMqSGXyC4
 /iESfac7l2h0OhRLRigXPZATvLlNlWMeDDrUBgWa2Ou0Vh9p3u/T0p/l5K1P23ZJ
 ofmAWc8zwczWur16+Mpe1iPv7wBhmW//1ljdnfN6TKQjg5K0rxsItXsL9kyQe7gm
 jXx0zU78ViKNSRkdsGhFVNmT8Ikg1sGliiqztI5V/y3bUwZEz4yMNDhfz218ZVPH
 NL5WuxUG6jvlXm5rgxPyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739696347; x=1739782747; bh=B
 AR8VoU78pWZnpFbmMbAmvTHr51g90Cutu+w7Df6Rt8=; b=DItXBZuKq6FSF1NTz
 tF1/sKJlcRRF7tL8QKZo1SnXL1J2+glrZo9HWQSItfKkfg6FR2Q8BDuv4Io7/0Z/
 XVtpy7Kiy9mbopkolVXH+EVaBnSME2ysalmUsgqB5ervu3gzUc3qFCAd3WSlzNO/
 3OTAnAUTbvg+ZzS4d8dBxEcPG7p0lS+palcuk/8HyIZLVr0u9zW5HLgZTCJ+zQL+
 iYshcdzihnvEg8FhvtnV7izJNVo6Ok3YdaY29gy7sJw2iOUMgiE1sZmTIykFwntu
 SJzexzhOQmcDTDXIG+kLJn8va4FWrNZ6DTQN6vNNoDFCTcmOgyX4X6uJJS1rqgb0
 GMNOA==
X-ME-Sender: <xms:26ixZzeHzzelJ_elSeJpkiSYqR61A6AtxSAv6rXlNGtwN8z1Aj76jA>
 <xme:26ixZ5MYgteNLt6QtmC_w60QoYxuFwfjM_xS9psPS4irrW4Tq2O7lzw33oyoY-i9-
 l3L1Ytmr4f-X4QgBw>
X-ME-Received: <xmr:26ixZ8jgXL2rzsGE_qu1722jR3-9n1K0VaJFXj7F9PQDwtd_wP-0Ap4LS0sT-qHmGEBtGwzeSWawp0LSdCwX3W9aEWnyufkp-t1XD8icWfd7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
 drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
 veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrg
 hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
 phhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
 phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
 gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
 thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
 hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
 lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
 hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:26ixZ0_Rwv-ajuG0HvhYDBqBfS-ACNJSwh3v-va5kGS2tAE6UDkHkg>
 <xmx:26ixZ_vcF6F4stL1wtxYjAVXFm0-ZlgfJnsA9IPUHQ6RhspFU9WhWQ>
 <xmx:26ixZzE1_emZXnjG4vy7yIeb0teoI5TXf0SEfmDUr_21WOuNGadloA>
 <xmx:26ixZ2M9YxhCyPGuInLkpICoqeMvuFOAJvElfAXtFBtOvXBJVqrC_Q>
 <xmx:26ixZ70qCGSPNmLmsL4R00W3P4y5N6K6KBxwfCyJMPy0EMDnuzX7QwIP>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:59:00 -0500 (EST)
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
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v6 27/27] drm: sun4i: de33: csc: add Display Engine 3.3 (DE33)
 support
Date: Sun, 16 Feb 2025 21:50:58 +1300
Message-ID: <20250216085432.6373-29-ryan@testtoast.com>
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

Like earlier DE versions, the DE33 has a CSC (Color Space Correction)
module. which provides color space conversion between BT2020/BT709, and
dynamic range conversion between SDR/ST2084/HLG.

Add support for the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Tested-by: Philippe Simons <simons.philippe@gmail.com>
Tested-by: Chris Morgan <macromorgan@hotmail.com>

--
Changelog v5..v6:
- Amend format_type to sun8i_format_type
- Add Tested-by: tags
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 98 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h |  3 +
 2 files changed, 101 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 53b00fbf6f332..60accc0773dea 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -238,6 +238,14 @@ static const u32 yuv2yuv_de3[2][3][3][12] = {
 	},
 };
 
+static u32 sun8i_csc_base(struct sun8i_mixer *mixer, int layer)
+{
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return sun8i_channel_base(mixer, layer) - 0x800;
+	else
+		return ccsc_base[mixer->cfg->ccsc][layer];
+}
+
 static void sun8i_csc_setup(struct regmap *map, u32 base,
 			    enum sun8i_format_type fmt_type,
 			    enum drm_color_encoding encoding,
@@ -345,6 +353,92 @@ static void sun8i_de3_ccsc_setup(struct sun8i_mixer *mixer, int layer,
 			   mask, val);
 }
 
+/* extract constant from high word and invert sign if necessary */
+static u32 sun8i_de33_ccsc_get_constant(u32 value)
+{
+	value >>= 16;
+
+	if (value & BIT(15))
+		return 0x400 - (value & 0x3ff);
+
+	return value;
+}
+
+static void sun8i_de33_convert_table(const u32 *src, u32 *dst)
+{
+	dst[0] = sun8i_de33_ccsc_get_constant(src[3]);
+	dst[1] = sun8i_de33_ccsc_get_constant(src[7]);
+	dst[2] = sun8i_de33_ccsc_get_constant(src[11]);
+	memcpy(&dst[3], src, sizeof(u32) * 12);
+	dst[6] &= 0xffff;
+	dst[10] &= 0xffff;
+	dst[14] &= 0xffff;
+}
+
+static void sun8i_de33_ccsc_setup(struct sun8i_mixer *mixer, int layer,
+				  enum sun8i_format_type fmt_type,
+				  enum drm_color_encoding encoding,
+				  enum drm_color_range range)
+{
+	u32 addr, val = 0, base, csc[15];
+	struct sunxi_engine *engine;
+	struct regmap *map;
+	const u32 *table;
+	int i;
+	struct sun8i_color_model model;
+
+	table = yuv2rgb_de3[range][encoding];
+	base = sun8i_csc_base(mixer, layer);
+	model = mixer->color_model;
+	engine = &mixer->engine;
+	map = engine->regs;
+
+	switch (fmt_type) {
+	case FORMAT_TYPE_RGB:
+		if (mixer->color_model.format == MEDIA_BUS_FMT_RGB888_1X24)
+			break;
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(rgb2yuv_de3[mixer->color_model.encoding], csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case FORMAT_TYPE_YUV:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    model.format,
+						    model.encoding);
+		if (!table)
+			break;
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case FORMAT_TYPE_YVU:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    model.format,
+						    model.encoding);
+		if (!table)
+			table = yuv2yuv_de3[range][encoding][encoding];
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		for (i = 0; i < 15; i++) {
+			addr = SUN50I_CSC_COEFF(base, i);
+			if (i > 3) {
+				if (((i - 3) & 3) == 1)
+					addr = SUN50I_CSC_COEFF(base, i + 1);
+				else if (((i - 3) & 3) == 2)
+					addr = SUN50I_CSC_COEFF(base, i - 1);
+			}
+			regmap_write(map, addr, csc[i]);
+		}
+		break;
+	default:
+		val = 0;
+		DRM_WARN("Wrong CSC mode specified.\n");
+		return;
+	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
+}
+
 void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 			enum sun8i_format_type fmt_type,
 			enum drm_color_encoding encoding,
@@ -356,6 +450,10 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 		sun8i_de3_ccsc_setup(mixer, layer,
 				     fmt_type, encoding, range);
 		return;
+	} else if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		sun8i_de33_ccsc_setup(mixer, layer, fmt_type,
+				      encoding, range);
+		return;
 	}
 
 	if (layer < mixer->cfg->vi_num) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 9b63c92782f56..4a06fc43de2d0 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -20,6 +20,9 @@ struct sun8i_mixer;
 #define SUN8I_CSC_CTRL(base)		((base) + 0x0)
 #define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
+#define SUN50I_CSC_COEFF(base, i)	((base) + 0x04 + 4 * (i))
+#define SUN50I_CSC_ALPHA(base)		((base) + 0x40)
+
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
 enum sun8i_format_type {
-- 
2.48.1

