Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7352EAB9A82
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 12:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F82C10EA47;
	Fri, 16 May 2025 10:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Quc2KkGY";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="n2i4RQ/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530B210EA47
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 10:52:12 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 0F2AF11400E2;
 Fri, 16 May 2025 06:52:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Fri, 16 May 2025 06:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1747392730; x=
 1747479130; bh=9yFrvj5K9GBkBsQxRxUtewJEzDRXB0/5KbKND/7qwYk=; b=Q
 uc2KkGYRhk2wP0JwvGG/B7nGN8G0/ncBinUo/ahsPjI/0mzBGdX3wSIdpVHVS0BW
 RaWz8WTXBoUQ8XdzsdHBEy1WDLc0+amZSRzFrkjarK9z7oB9FhsiAPpdfcTdx+I4
 W0LPlo7ag7F+LNtRptCb7PUraQvGZ14DNVkVgwmyFFyY0IIJ3Mo77H37gTgobRn7
 ClsRhvQBZLNZ25Ss6hD1skXmJ+xHd4VpsWv33x3DzK8T/rccfok/uwlksWRBdJdl
 CoQYKbLf1uNHKLzFvGfrNmtN+kjb/2aHA63nL82rP5PL3Bins+m7KXUdOUJD1v0g
 3kcnCgQiSMcW5hOcdUcSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1747392730; x=1747479130; bh=9
 yFrvj5K9GBkBsQxRxUtewJEzDRXB0/5KbKND/7qwYk=; b=n2i4RQ/3kGvhH71+T
 CABGBWi0p4apHlULwFfpRgjmLQFJZmQPdm/UJs3EA1j0NOiSigeBmd2UUV2A2Dvm
 dl72E5aQy3isQf0B6H+qBKjssOCxGNOZGB4Z5YahLtK+lGg8PTxedgz9PZHkgQJj
 V30TtxeP9jw5lz862y8MBNRNkjer3UMMHKi0A45Aczts7rb0kqs+qPQWGH8K+ia9
 5PZzz8Qu8F5Wg4HOQFKzCcDp3GoImCz1JP6iredSTjTuE3fCiu+tWxIO/ZJvgLDP
 qeQe8MYq6q2WGWydlryyvxniobIbkZQqwMyeDsteMUsOl8uzfd5dzuNE6mvjuQk8
 vejKA==
X-ME-Sender: <xms:2hgnaE4aAwlfXQgzFE-EuJgzsFE65x4X6sAFaGjm-kQJA0h9JQyTCg>
 <xme:2hgnaF5j0svg0KlWfyP5_5eVtQfzVaniGSJmKF5-1Z9ERerVAxCwVQ-E9Lfoyteul
 QVlw-80rV-ni2kmXg>
X-ME-Received: <xmr:2hgnaDcb4-PxgJOKnHRl6jJHP_fo_vG5Gh-sbIIGhLzwMSwTciyVng8Z9giBpMBNLkAyBHrnNJt9tJfO_9rNVIjTl1fTv3AM2PfIzij-SPKe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvheeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
 htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
 keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrh
 grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
 tghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
 gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
 tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
 drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
 thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
 esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
 ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
 gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:2hgnaJJsvR-1dEHNqtLhn1N9IB33EdKoI_ESIy9kiHa-BsqH6pL90A>
 <xmx:2hgnaIIqDqJIko9gp-uG1_AGcQSgh_QpnzUdxpQ3rHy0q75RsZSgPw>
 <xmx:2hgnaKyB9yYXr1R0opkYJccUCXpM9E-yvtZuvvbkyoQJ2QzVQNl_CQ>
 <xmx:2hgnaMJPEBvs-AU67b_lFbHlQwtnGLlIVn5ckPqXnkKTe6SsutQzyA>
 <xmx:2hgnaKw_sCe7TUgbo5NimTbcz8XQ-F53bNlvPebpSW0rCuX8amPuZxUA>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 May 2025 06:52:04 -0400 (EDT)
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
Subject: [PATCH v11 4/8] drm: sun4i: de2/de3: use generic register reference
 function for layer configuration
Date: Fri, 16 May 2025 22:44:21 +1200
Message-ID: <20250516105101.11650-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516105101.11650-1-ryan@testtoast.com>
References: <20250516105101.11650-1-ryan@testtoast.com>
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

Use the new blender register lookup function where required in the layer
commit and update code.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Maxime Ripard <mripard@kernel.org>

---
Changelog v2..v3:
- Refactor for 6.11 layer init/modesetting changes
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 5 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 +++++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index fd2650153492..86e5211a843b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -274,6 +274,7 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	u32 bld_base = sun8i_blender_base(mixer);
+	struct regmap *bld_regs = sun8i_blender_regmap(mixer);
 	struct drm_plane_state *plane_state;
 	struct drm_plane *plane;
 	u32 route = 0, pipe_en = 0;
@@ -313,8 +314,8 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 	}
 
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
 	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index b90e5edef4e8..7a21d32ff1e4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -23,6 +23,7 @@
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_ui_scaler.h"
+#include "sun8i_vi_scaler.h"
 
 static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 					int overlay, struct drm_plane *plane)
@@ -51,6 +52,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
+	struct regmap *bld_regs;
 	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -59,6 +61,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 channel, overlay);
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -103,10 +106,10 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
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
index 112f0a37cf4a..a09ee4097537 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -55,6 +55,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
 	u32 src_w, src_h, dst_w, dst_h;
+	struct regmap *bld_regs;
 	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -66,6 +67,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 channel, overlay);
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -183,10 +185,10 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
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
2.49.0

