Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AD7925A58
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A14210E7AE;
	Wed,  3 Jul 2024 10:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="PYCslsCh";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZfslVYK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C8510E7AF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:56:56 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 6C9DF1380623;
 Wed,  3 Jul 2024 06:56:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 03 Jul 2024 06:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1720004215; x=
 1720090615; bh=asU8+Nqt7cy+lZl9y77QC5cILOzbIRtNt4Znv4iFO1I=; b=P
 YCslsChuvlCGqTYeiLdAgjzBBg/FsV4ccqiCAnjVgWX1vfYWMDxlDHV/7WjkGMFM
 EBBD+Xyq/AvR3DDPClB7DcCxf/XwDwpqbsUHbUUGfWWIq13Fj8C/W6yHAbNWweOk
 uUexqexVJAEnMJu87ixLG2MAHV17AP5QgfbkPZGHUmWEauwAPMxHhx9/T5OLKMIc
 Kmeqi+OYCT0qHAAf48Fp5Zj0pJB3F3bN8e4aR6qZiYk3uC60NyVBx/dKXksN2XpA
 vLWmOZuC57p1zqQ3+Hnr8hYU3HaO9XNhmkrHs8Y6PlAZGVpf44PIzpohHylntO23
 dCxPw1r1f3jz1QEe6kvug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004215; x=
 1720090615; bh=asU8+Nqt7cy+lZl9y77QC5cILOzbIRtNt4Znv4iFO1I=; b=Z
 fslVYK5eM6EG78tsOLWQ1wR8RXLRWwPWazuL/S6gTHKQWGfQQi++ziun+xk1lONl
 V8pG2ql1H6pm/qXE+v1q2R2f749GsGdeAv29PAOd0oC0Rlscq/BOtxWEObOo2lHi
 cLc6ihOUy3gARq8l/FkuOOwguCxw8nTp1DQG+HADT3ug/V0VYu/zNZQreSfNEtCD
 zLG4m4kLXEwKXv6MHMCsyxV8V3wFLpeIqSktelMyV9itVZiFMUcV7fc2MAS5MP47
 q3LfoCf+iQjb0zoUn6gb92XPK8bvUe5/3sbN28hZdG/p6GsqNHfJkJwXrHT4zGjc
 RTaLUmHYFSsPa3GCOfDnA==
X-ME-Sender: <xms:dy6FZp-_mMeLDbdXZKbR_9ocZyA3sJLtYJnuZSIh2dVSlLzvsc1xTA>
 <xme:dy6FZtuMvAj_2CUDrtLCYXCJj5LUy1IciIE5NbH9qp_ShGl5eiQAWz30M1X1mqrog
 L8n61ptYd-NT2N5jQ>
X-ME-Received: <xmr:dy6FZnATGdrXZ7ooA5l84IIOk4gAPdeNXS4dXtu_QhWwwPsbd-31xqWNpjWUurnkHvjhgzUkczx5e5zE7hcX4Vpm5_uz_AaYa9vYJ7NrtkACGHIr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
 heetnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:dy6FZtdSR7Qq1SLv-BC7U8jfhtQpGXbTycvCQ8abE91OjfV4N88POQ>
 <xmx:dy6FZuMzQ-MNYBV8gLX-wAmzgR05Amb_BmXOeFQpziWleRX7gnDsjg>
 <xmx:dy6FZvmlZVTSDPNeHfl2FzgQNaPGb9GJuiXv-pBlXFLhrS0h1CPXxw>
 <xmx:dy6FZovyjqRDJnt5n4LRYIjcNEVodoDKbCg5jZ5axlDrLvTkXDwcCQ>
 <xmx:dy6FZl8VGeupcZ6e0ttioS6oyxjS5nNKdhV_ew16hzN8eDnXWaM75khB>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:56:49 -0400 (EDT)
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
Subject: [PATCH v2 16/23] drm: sun4i: de2/de3: make blender register
 references generic
Date: Wed,  3 Jul 2024 22:51:06 +1200
Message-ID: <20240703105454.41254-17-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703105454.41254-1-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
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

The DE2 and DE3 engines have a single register range, whereas the DE33
separates these out into top and display groups.

Prepare for this by adding a function to look these up based on the DE
type.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  6 ++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 17 +++++++++++------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++++++------
 3 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 19052c594f8c2..ed7370688d52e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -204,6 +204,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
+static inline struct regmap *
+sun8i_blender_regmap(struct sun8i_mixer *mixer)
+{
+	return mixer->engine.regs;
+}
+
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 91781b5bbbbce..7f4d4dcfdc03d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -24,14 +24,17 @@
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_ui_scaler.h"
+#include "sun8i_vi_scaler.h"
 
 static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
 				  int overlay, bool enable, unsigned int zpos,
 				  unsigned int old_zpos)
 {
 	u32 val, bld_base, ch_base;
+	struct regmap *bld_regs;
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	DRM_DEBUG_DRIVER("%sabling channel %d overlay %d\n",
@@ -47,12 +50,12 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
 
 	if (!enable || zpos != old_zpos) {
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 				   SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
 				   0);
 
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
 				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
 				   0);
@@ -61,13 +64,13 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
 	if (enable) {
 		val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 				   val, val);
 
 		val = channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
 				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
 				   val);
@@ -101,6 +104,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
+	struct regmap *bld_regs;
 	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -109,6 +113,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 channel, overlay);
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -153,10 +158,10 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
 			 state->dst.x1, state->dst.y1);
 	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 3cc387c248619..448a696df5c39 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -23,8 +23,10 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
 				  unsigned int old_zpos)
 {
 	u32 val, bld_base, ch_base;
+	struct regmap *bld_regs;
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	DRM_DEBUG_DRIVER("%sabling VI channel %d overlay %d\n",
@@ -40,12 +42,12 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN, val);
 
 	if (!enable || zpos != old_zpos) {
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 				   SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
 				   0);
 
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
 				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
 				   0);
@@ -54,13 +56,13 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
 	if (enable) {
 		val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 				   val, val);
 
 		val = channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 
-		regmap_update_bits(mixer->engine.regs,
+		regmap_update_bits(bld_regs,
 				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
 				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
 				   val);
@@ -104,6 +106,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
 	u32 src_w, src_h, dst_w, dst_h;
+	struct regmap *bld_regs;
 	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -115,6 +118,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 channel, overlay);
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -231,10 +235,10 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
 			 state->dst.x1, state->dst.y1);
 	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
 
-- 
2.45.2

