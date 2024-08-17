Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE97D955A5B
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 01:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7589010E150;
	Sat, 17 Aug 2024 23:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="KqDGzYxs";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="twXq6eaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh1-smtp.messagingengine.com
 (fhigh1-smtp.messagingengine.com [103.168.172.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A004510E13D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 23:16:14 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal
 [10.202.2.43])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 0253B114EADE;
 Sat, 17 Aug 2024 19:07:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Sat, 17 Aug 2024 19:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1723936069; x=
 1724022469; bh=TL1ypg3vK7hGaaLjHp6RaXu6Xp0FCrRqQAP99FdQ5R4=; b=K
 qDGzYxsJ0PRZ8ltzMUn/JVVEl/I/Tq2XQKy+b6JTxElsa1TeW/djmNCf7YO97pzp
 2YJqoHZ5lv8Z3KcE45VSmBEvKyYiNblzSmefatNueIcE94fP4FXnt7JHuIT6cfKx
 7LMwEP4L+ilZ0lKGwAMuRvf9/4IV5Uyx4IFVqem/nPwq0TYfkQbRr0aRLBocMJBU
 wyrUKoSR+q8AHxDTIS1itGPZcE0FdCbbl11+/f3IMXlLAsTlbIsH910R1Yq/oX70
 zVyyo0G/ai4skKDcdjBK7BOv6wlmU6LZREM1PBbcqRQiQAtL2wzJvCaXlf1cmwXR
 ll0Wg+Ob/033bGgH5O9fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723936069; x=
 1724022469; bh=TL1ypg3vK7hGaaLjHp6RaXu6Xp0FCrRqQAP99FdQ5R4=; b=t
 wXq6eaMcABM9S1QIY3qH3Ue0sGoUK8cg/+4N0+PZyralbBYKsHX6FMPAMx8DvG2g
 aW/ZG4sc/EC3qsZjDruaCR/+weG3SOCt7sDL4rCd3OBTzDYRV9vecb7wnRw9UWHL
 Tbq3d25Shw4lPy9b3HjFs//vwReS7UtObvbZieIh4H+7wRAA0Qdslmcq+DNYXKLN
 UlkF5CVhN8wARrDywNwjt94ndevSPruvaSTaxB8hwS0ntcQqohvUaf3YQMAbQp0m
 SpQNBc8BtmQ7+ZockXtvrPJvVL+FrY0Hfwa61cpC/iHT5u/krLDNGsIHdH61aUqa
 lO2EIeTZUnFHx8K6DDZ1g==
X-ME-Sender: <xms:RS3BZutGy2GBYlP5nTHv4SFM5IG9D-pkR5NBViV1mE-vx4V3E9QNVQ>
 <xme:RS3BZjdw3rct5TV8uG_jPYlcRDwjok4zwiQz1ccxQAcyV3cdXDTpfkD_pv4XTNjaO
 BXNfMUcKnaD_IeNOQ>
X-ME-Received: <xmr:RS3BZpyJmz4OAX22LLSpMlBtRX8-JhRsyQ7hA-t2RHH9LjZOU8sRXfUoFW2t8WSx9DQSk6wrHfX5-88dRfEMI9PRgFK6HfQZ67uVkf_dOO6WuSL7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
 ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
 gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
 ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
 thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
 thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
 homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
 oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
 hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
 htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:RS3BZpMrj8677Dx4EmAMqlSCDCLqDrJvlwc4hP5_dfoTArpeaZU5VA>
 <xmx:RS3BZu9j43XIF5NXXddxLRDZa2HoJptIJSkhM6EWrpitvz_IoCBHYg>
 <xmx:RS3BZhXj1GChT0NYOC0VEr8CxjMdqFXkSdtfRlIMm3brD4VS1Q_4Xw>
 <xmx:RS3BZncfo36hwe6YFaCAjfGoRDXArR9xylj_uUAoAt962mI3ur6TZQ>
 <xmx:RS3BZqsyfcrro4UhXnzHdTj5ApiB47ofF4BPtp8OqF1fgie-shWqnEG_>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:07:42 -0400 (EDT)
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
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v3 18/26] drm: sun4i: de3: Implement AFBC support
Date: Sun, 18 Aug 2024 10:46:05 +1200
Message-ID: <20240817230503.158889-19-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817230503.158889-1-ryan@testtoast.com>
References: <20240817230503.158889-1-ryan@testtoast.com>
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

Buffers, compressed with AFBC, are supported by the DE3 and above, and
are generally more efficient for memory transfers. Add support for them.

Currently it's implemented only for VI layers, but vendor code and
documentation suggest UI layers can have them too. However, I haven't
observed any SoC with such feature.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/Makefile         |   2 +-
 drivers/gpu/drm/sun4i/sun50i_afbc.c    | 250 +++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_afbc.h    |  87 +++++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  85 +++++++--
 4 files changed, 410 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.h

diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index 3f516329f51ee..78290f1660fbd 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -17,7 +17,7 @@ sun8i-drm-hdmi-y		+= sun8i_hdmi_phy_clk.o
 sun8i-mixer-y			+= sun8i_mixer.o sun8i_ui_layer.o \
 				   sun8i_vi_layer.o sun8i_ui_scaler.o \
 				   sun8i_vi_scaler.o sun8i_csc.o \
-				   sun50i_fmt.o
+				   sun50i_fmt.o sun50i_afbc.o
 
 sun4i-tcon-y			+= sun4i_crtc.o
 sun4i-tcon-y			+= sun4i_tcon_dclk.o
diff --git a/drivers/gpu/drm/sun4i/sun50i_afbc.c b/drivers/gpu/drm/sun4i/sun50i_afbc.c
new file mode 100644
index 0000000000000..b55e1c5533714
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_afbc.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) Jernej Skrabec <jernej.skrabec@gmail.com>
+ */
+
+#include <drm/drm_blend.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_plane.h>
+#include <uapi/drm/drm_fourcc.h>
+
+#include "sun50i_afbc.h"
+#include "sun8i_mixer.h"
+
+static u32 sun50i_afbc_get_base(struct sun8i_mixer *mixer, unsigned int channel)
+{
+	u32 base = sun8i_channel_base(mixer, channel);
+
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
+		return base + SUN50I_AFBC_CH_OFFSET;
+
+	return base + 0x4000;
+}
+
+bool sun50i_afbc_format_mod_supported(struct sun8i_mixer *mixer,
+				      u32 format, u64 modifier)
+{
+	u64 mode;
+
+	if (modifier == DRM_FORMAT_MOD_INVALID)
+		return false;
+
+	if (modifier == DRM_FORMAT_MOD_LINEAR) {
+		if (format == DRM_FORMAT_YUV420_8BIT ||
+		    format == DRM_FORMAT_YUV420_10BIT ||
+		    format == DRM_FORMAT_Y210)
+			return false;
+		return true;
+	}
+
+	if (mixer->cfg->de_type == sun8i_mixer_de2)
+		return false;
+
+	mode = AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |
+	       AFBC_FORMAT_MOD_SPARSE |
+	       AFBC_FORMAT_MOD_SPLIT;
+
+	switch (format) {
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGBA4444:
+	case DRM_FORMAT_RGBA5551:
+	case DRM_FORMAT_RGBA1010102:
+		mode |= AFBC_FORMAT_MOD_YTR;
+		break;
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_Y210:
+	case DRM_FORMAT_YUV420_8BIT:
+	case DRM_FORMAT_YUV420_10BIT:
+		break;
+	default:
+		return false;
+	}
+
+	return modifier == DRM_FORMAT_MOD_ARM_AFBC(mode);
+}
+
+void sun50i_afbc_atomic_update(struct sun8i_mixer *mixer, unsigned int channel,
+			       struct drm_plane *plane)
+{
+	struct drm_plane_state *state = plane->state;
+	struct drm_framebuffer *fb = state->fb;
+	const struct drm_format_info *format = fb->format;
+	struct drm_gem_dma_object *gem;
+	u32 base, val, src_w, src_h;
+	u32 def_color0, def_color1;
+	struct regmap *regs;
+	dma_addr_t dma_addr;
+
+	base = sun50i_afbc_get_base(mixer, channel);
+	regs = mixer->engine.regs;
+
+	src_w = drm_rect_width(&state->src) >> 16;
+	src_h = drm_rect_height(&state->src) >> 16;
+
+	val = SUN50I_FBD_SIZE_HEIGHT(src_h);
+	val |= SUN50I_FBD_SIZE_WIDTH(src_w);
+	regmap_write(regs, SUN50I_FBD_SIZE(base), val);
+
+	val = SUN50I_FBD_BLK_SIZE_HEIGHT(DIV_ROUND_UP(src_h, 16));
+	val = SUN50I_FBD_BLK_SIZE_WIDTH(DIV_ROUND_UP(src_w, 16));
+	regmap_write(regs, SUN50I_FBD_BLK_SIZE(base), val);
+
+	val = SUN50I_FBD_SRC_CROP_TOP(0);
+	val |= SUN50I_FBD_SRC_CROP_LEFT(0);
+	regmap_write(regs, SUN50I_FBD_SRC_CROP(base), val);
+
+	val = SUN50I_FBD_LAY_CROP_TOP(state->src.y1 >> 16);
+	val |= SUN50I_FBD_LAY_CROP_LEFT(state->src.x1 >> 16);
+	regmap_write(regs, SUN50I_FBD_LAY_CROP(base), val);
+
+	/*
+	 * Default color is always set to white, in colorspace and bitness
+	 * that coresponds to used format. If it is actually used or not
+	 * depends on AFBC buffer. At least in Cedrus it can be turned on
+	 * or off.
+	 * NOTE: G and B channels are off by 1 (up). It's unclear if this
+	 * is because HW need such value or it is due to good enough code
+	 * in vendor driver and HW clips the value anyway.
+	 */
+	def_color0 = 0;
+	def_color1 = 0;
+
+	val = 0;
+	switch (format->format) {
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_YUV420_10BIT:
+		val |= SUN50I_FBD_FMT_SBS1(2);
+		val |= SUN50I_FBD_FMT_SBS0(1);
+		break;
+	case DRM_FORMAT_Y210:
+		val |= SUN50I_FBD_FMT_SBS1(3);
+		val |= SUN50I_FBD_FMT_SBS0(2);
+		break;
+	default:
+		val |= SUN50I_FBD_FMT_SBS1(1);
+		val |= SUN50I_FBD_FMT_SBS0(1);
+		break;
+	}
+	switch (format->format) {
+	case DRM_FORMAT_RGBA8888:
+		val |= SUN50I_FBD_FMT_YUV_TRAN;
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGBA_8888);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(255) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(255);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(256) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(256);
+		break;
+	case DRM_FORMAT_RGB888:
+		val |= SUN50I_FBD_FMT_YUV_TRAN;
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGB_888);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(255);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(256) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(256);
+		break;
+	case DRM_FORMAT_RGB565:
+		val |= SUN50I_FBD_FMT_YUV_TRAN;
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGB_565);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(31);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(64) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(32);
+		break;
+	case DRM_FORMAT_RGBA4444:
+		val |= SUN50I_FBD_FMT_YUV_TRAN;
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGBA_4444);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(15) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(15);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(16) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(16);
+		break;
+	case DRM_FORMAT_RGBA5551:
+		val |= SUN50I_FBD_FMT_YUV_TRAN;
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGBA_5551);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(1) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(31);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(32) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(32);
+		break;
+	case DRM_FORMAT_RGBA1010102:
+		val |= SUN50I_FBD_FMT_YUV_TRAN;
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_RGBA1010102);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(3) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(1023);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(1024) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(1024);
+		break;
+	case DRM_FORMAT_YUV420_8BIT:
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_YUV420);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(255);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(128) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(128);
+		break;
+	case DRM_FORMAT_YUYV:
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_YUV422);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(255);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(128) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(128);
+		break;
+	case DRM_FORMAT_YUV420_10BIT:
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_P010);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(1023);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(512) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(512);
+		break;
+	case DRM_FORMAT_Y210:
+		val |= SUN50I_FBD_FMT_IN_FMT(SUN50I_AFBC_P210);
+		def_color0 = SUN50I_FBD_DEFAULT_COLOR0_ALPHA(0) |
+			     SUN50I_FBD_DEFAULT_COLOR0_YR(1023);
+		def_color1 = SUN50I_FBD_DEFAULT_COLOR1_UG(512) |
+			     SUN50I_FBD_DEFAULT_COLOR1_VB(512);
+		break;
+	}
+	regmap_write(regs, SUN50I_FBD_FMT(base), val);
+
+	/* Get the physical address of the buffer in memory */
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
+
+	DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
+
+	/* Compute the start of the displayed memory */
+	dma_addr = gem->dma_addr + fb->offsets[0];
+
+	regmap_write(regs, SUN50I_FBD_LADDR(base), lower_32_bits(dma_addr));
+	regmap_write(regs, SUN50I_FBD_HADDR(base), upper_32_bits(dma_addr));
+
+	val = SUN50I_FBD_OVL_SIZE_HEIGHT(src_h);
+	val |= SUN50I_FBD_OVL_SIZE_WIDTH(src_w);
+	regmap_write(regs, SUN50I_FBD_OVL_SIZE(base), val);
+
+	val = SUN50I_FBD_OVL_COOR_Y(0);
+	val |= SUN50I_FBD_OVL_COOR_X(0);
+	regmap_write(regs, SUN50I_FBD_OVL_COOR(base), val);
+
+	regmap_write(regs, SUN50I_FBD_OVL_BG_COLOR(base),
+		     SUN8I_MIXER_BLEND_COLOR_BLACK);
+	regmap_write(regs, SUN50I_FBD_DEFAULT_COLOR0(base), def_color0);
+	regmap_write(regs, SUN50I_FBD_DEFAULT_COLOR1(base), def_color1);
+
+	val = SUN50I_FBD_CTL_GLB_ALPHA(state->alpha >> 16);
+	val |= SUN50I_FBD_CTL_CLK_GATE;
+	val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+		SUN50I_FBD_CTL_ALPHA_MODE_PIXEL :
+		SUN50I_FBD_CTL_ALPHA_MODE_COMBINED;
+	val |= SUN50I_FBD_CTL_FBD_EN;
+	regmap_write(regs, SUN50I_FBD_CTL(base), val);
+}
+
+void sun50i_afbc_disable(struct sun8i_mixer *mixer, unsigned int channel)
+{
+	u32 base = sun50i_afbc_get_base(mixer, channel);
+
+	regmap_write(mixer->engine.regs, SUN50I_FBD_CTL(base), 0);
+}
diff --git a/drivers/gpu/drm/sun4i/sun50i_afbc.h b/drivers/gpu/drm/sun4i/sun50i_afbc.h
new file mode 100644
index 0000000000000..cea685c868550
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_afbc.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) Jernej Skrabec <jernej.skrabec@gmail.com>
+ */
+
+#ifndef _SUN50I_AFBC_H_
+#define _SUN50I_AFBC_H_
+
+#include <linux/types.h>
+
+#define SUN50I_AFBC_CH_OFFSET 0x300
+
+#define SUN50I_AFBC_RGBA_8888	0x02
+#define SUN50I_AFBC_RGB_888	0x08
+#define SUN50I_AFBC_RGB_565	0x0a
+#define SUN50I_AFBC_RGBA_4444	0x0e
+#define SUN50I_AFBC_RGBA_5551	0x12
+#define SUN50I_AFBC_RGBA1010102	0x16
+#define SUN50I_AFBC_YUV422	0x26
+#define SUN50I_AFBC_YUV420	0x2a
+#define SUN50I_AFBC_P010	0x30
+#define SUN50I_AFBC_P210	0x32
+
+#define SUN50I_FBD_CTL(base)			((base) + 0x00)
+#define SUN50I_FBD_CTL_GLB_ALPHA(v)		((v) << 24)
+#define SUN50I_FBD_CTL_CLK_GATE			BIT(4)
+#define SUN50I_FBD_CTL_ALPHA_MODE_PIXEL		((0) << 2)
+#define SUN50I_FBD_CTL_ALPHA_MODE_LAYER		((1) << 2)
+#define SUN50I_FBD_CTL_ALPHA_MODE_COMBINED	((2) << 2)
+#define SUN50I_FBD_CTL_FBD_FCEN			BIT(1)
+#define SUN50I_FBD_CTL_FBD_EN			BIT(0)
+
+#define SUN50I_FBD_SIZE(base)			((base) + 0x08)
+#define SUN50I_FBD_SIZE_HEIGHT(v)		(((v) - 1) << 16)
+#define SUN50I_FBD_SIZE_WIDTH(v)		(((v) - 1) << 0)
+
+#define SUN50I_FBD_BLK_SIZE(base)		((base) + 0x0c)
+#define SUN50I_FBD_BLK_SIZE_HEIGHT(v)		((v) << 16)
+#define SUN50I_FBD_BLK_SIZE_WIDTH(v)		((v) << 0)
+
+#define SUN50I_FBD_SRC_CROP(base)		((base) + 0x10)
+#define SUN50I_FBD_SRC_CROP_TOP(v)		((v) << 16)
+#define SUN50I_FBD_SRC_CROP_LEFT(v)		((v) << 0)
+
+#define SUN50I_FBD_LAY_CROP(base)		((base) + 0x14)
+#define SUN50I_FBD_LAY_CROP_TOP(v)		((v) << 16)
+#define SUN50I_FBD_LAY_CROP_LEFT(v)		((v) << 0)
+
+#define SUN50I_FBD_FMT(base)			((base) + 0x18)
+#define SUN50I_FBD_FMT_SBS1(v)			((v) << 18)
+#define SUN50I_FBD_FMT_SBS0(v)			((v) << 16)
+#define SUN50I_FBD_FMT_YUV_TRAN			BIT(7)
+#define SUN50I_FBD_FMT_IN_FMT(v)		((v) << 0)
+
+#define SUN50I_FBD_LADDR(base)			((base) + 0x20)
+#define SUN50I_FBD_HADDR(base)			((base) + 0x24)
+
+#define SUN50I_FBD_OVL_SIZE(base)		((base) + 0x30)
+#define SUN50I_FBD_OVL_SIZE_HEIGHT(v)		(((v) - 1) << 16)
+#define SUN50I_FBD_OVL_SIZE_WIDTH(v)		(((v) - 1) << 0)
+
+#define SUN50I_FBD_OVL_COOR(base)		((base) + 0x34)
+#define SUN50I_FBD_OVL_COOR_Y(v)		((v) << 16)
+#define SUN50I_FBD_OVL_COOR_X(v)		((v) << 0)
+
+#define SUN50I_FBD_OVL_BG_COLOR(base)		((base) + 0x38)
+#define SUN50I_FBD_OVL_FILL_COLOR(base)		((base) + 0x3c)
+
+#define SUN50I_FBD_DEFAULT_COLOR0(base)		((base) + 0x50)
+#define SUN50I_FBD_DEFAULT_COLOR0_ALPHA(v)	((v) << 16)
+#define SUN50I_FBD_DEFAULT_COLOR0_YR(v)		((v) << 0)
+
+#define SUN50I_FBD_DEFAULT_COLOR1(base)		((base) + 0x54)
+#define SUN50I_FBD_DEFAULT_COLOR1_VB(v)		((v) << 16)
+#define SUN50I_FBD_DEFAULT_COLOR1_UG(v)		((v) << 0)
+
+struct sun8i_mixer;
+struct drm_plane;
+
+bool sun50i_afbc_format_mod_supported(struct sun8i_mixer *mixer,
+				      u32 format, u64 modifier);
+
+void sun50i_afbc_atomic_update(struct sun8i_mixer *mixer, unsigned int channel,
+			       struct drm_plane *plane);
+void sun50i_afbc_disable(struct sun8i_mixer *mixer, unsigned int channel);
+
+#endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index d19349eecc9de..a2c4bf2ab97ad 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -11,8 +11,10 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "sun50i_afbc.h"
 #include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 #include "sun8i_vi_layer.h"
@@ -50,7 +52,7 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 
 static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 				       int overlay, struct drm_plane *plane,
-				       unsigned int zpos)
+				       unsigned int zpos, bool afbc)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
@@ -135,7 +137,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 
 		required = src_h * 100 / dst_h;
 
-		if (ability < required) {
+		if (!afbc && ability < required) {
 			DRM_DEBUG_DRIVER("Using vertical coarse scaling\n");
 			vm = src_h;
 			vn = (u32)ability * dst_h / 100;
@@ -145,7 +147,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		/* it seems that every RGB scaler has buffer for 2048 pixels */
 		scanline = subsampled ? mixer->cfg->scanline_yuv : 2048;
 
-		if (src_w > scanline) {
+		if (!afbc && src_w > scanline) {
 			DRM_DEBUG_DRIVER("Using horizontal coarse scaling\n");
 			hm = src_w;
 			hn = scanline;
@@ -308,6 +310,15 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	return 0;
 }
 
+static void sun8i_vi_layer_prepare_non_linear(struct sun8i_mixer *mixer,
+					      int channel, int overlay)
+{
+	u32 base = sun8i_channel_base(mixer, channel);
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(base, overlay), 0);
+}
+
 static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 				       struct drm_atomic_state *state)
 {
@@ -348,18 +359,46 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	unsigned int zpos = new_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
+	struct drm_framebuffer *fb = plane->state->fb;
+	bool afbc = drm_is_afbc(fb->modifier);
 
-	if (!new_state->crtc || !new_state->visible)
+	if (!new_state->crtc || !new_state->visible) {
+		if (mixer->cfg->de_type >= sun8i_mixer_de3)
+			sun50i_afbc_disable(mixer, layer->channel);
 		return;
+	}
 
 	sun8i_vi_layer_update_coord(mixer, layer->channel,
-				    layer->overlay, plane, zpos);
-	sun8i_vi_layer_update_alpha(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_vi_layer_update_formats(mixer, layer->channel,
-				      layer->overlay, plane);
-	sun8i_vi_layer_update_buffer(mixer, layer->channel,
-				     layer->overlay, plane);
+				    layer->overlay, plane, zpos, afbc);
+
+	if (afbc) {
+		u32 fmt_type;
+
+		sun8i_vi_layer_prepare_non_linear(mixer, layer->channel,
+						  layer->overlay);
+		sun50i_afbc_atomic_update(mixer, layer->channel, plane);
+
+		fmt_type = sun8i_vi_layer_get_format_type(fb->format);
+		sun8i_csc_set_ccsc(mixer, layer->channel, fmt_type,
+				   plane->state->color_encoding,
+				   plane->state->color_range);
+	} else {
+		sun8i_vi_layer_update_alpha(mixer, layer->channel,
+					    layer->overlay, plane);
+		sun8i_vi_layer_update_formats(mixer, layer->channel,
+					      layer->overlay, plane);
+		sun8i_vi_layer_update_buffer(mixer, layer->channel,
+					     layer->overlay, plane);
+	}
+
+}
+
+static bool sun8i_vi_layer_format_mod_supported(struct drm_plane *plane,
+						u32 format, u64 modifier)
+{
+	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
+
+	return sun50i_afbc_format_mod_supported(layer->mixer, format, modifier);
 }
 
 static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
@@ -374,6 +413,7 @@ static const struct drm_plane_funcs sun8i_vi_layer_funcs = {
 	.disable_plane		= drm_atomic_helper_disable_plane,
 	.reset			= drm_atomic_helper_plane_reset,
 	.update_plane		= drm_atomic_helper_update_plane,
+	.format_mod_supported   = sun8i_vi_layer_format_mod_supported,
 };
 
 /*
@@ -457,6 +497,11 @@ static const u32 sun8i_vi_layer_de3_formats[] = {
 	DRM_FORMAT_YVU411,
 	DRM_FORMAT_YVU420,
 	DRM_FORMAT_YVU422,
+
+	/* AFBC only formats */
+	DRM_FORMAT_YUV420_8BIT,
+	DRM_FORMAT_YUV420_10BIT,
+	DRM_FORMAT_Y210,
 };
 
 static const uint64_t sun8i_layer_modifiers[] = {
@@ -464,6 +509,18 @@ static const uint64_t sun8i_layer_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+static const uint64_t sun50i_layer_de3_modifiers[] = {
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |
+				AFBC_FORMAT_MOD_SPARSE |
+				AFBC_FORMAT_MOD_SPLIT),
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |
+				AFBC_FORMAT_MOD_YTR |
+				AFBC_FORMAT_MOD_SPARSE |
+				AFBC_FORMAT_MOD_SPLIT),
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    int index)
@@ -472,6 +529,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	u32 supported_encodings, supported_ranges;
 	unsigned int plane_cnt, format_count;
 	struct sun8i_layer *layer;
+	const uint64_t *modifiers;
 	const u32 *formats;
 	int ret;
 
@@ -487,9 +545,11 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		modifiers = sun50i_layer_de3_modifiers;
 	} else {
 		formats = sun8i_vi_layer_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
+		modifiers = sun8i_layer_modifiers;
 	}
 
 	if (!mixer->cfg->ui_num && index == 0)
@@ -499,8 +559,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
 				       &sun8i_vi_layer_funcs,
 				       formats, format_count,
-				       sun8i_layer_modifiers,
-				       type, NULL);
+				       modifiers, type, NULL);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't initialize layer\n");
 		return ERR_PTR(ret);
-- 
2.46.0

