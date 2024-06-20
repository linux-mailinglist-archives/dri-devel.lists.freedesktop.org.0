Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F569102C3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F51B10E939;
	Thu, 20 Jun 2024 11:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="hwIco65K";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="TSuKHMvO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBB710E937
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:33:39 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 29ED51380503;
 Thu, 20 Jun 2024 07:33:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 20 Jun 2024 07:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1718883219; x=
 1718969619; bh=asU8+Nqt7cy+lZl9y77QC5cILOzbIRtNt4Znv4iFO1I=; b=h
 wIco65KnWASAJ9bsa2eJHNdc211GmAsVIAZdCQzWarKzPId5cmqjEwfDU11H0Nu4
 xI7hdK1DnZ8kthNEltXzxZGSbiKaPih94Rw0MRIgF/2o0OTKjHzB9AmUMgiFDVLK
 s4Jn+fp9MtrfTSiFPFkqtZ7oV/O528g4sQpng6MEdg8yyRUCijLostpq4fELPhbU
 OBQX98kqUQOXdAx9lP0Nco2FG2bUpDo94FVyoqcqLi6O9yvwqu6HOSIO4Ey/Yic2
 1J17wmlHcwuJZMGdNd8uEj/br1D/pbH8JcJKtmygy+3SiPSRxDPh39R0RA5W0gQS
 g1Rqkur1RQGmsYMziZaMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883219; x=
 1718969619; bh=asU8+Nqt7cy+lZl9y77QC5cILOzbIRtNt4Znv4iFO1I=; b=T
 SuKHMvOCAHRghm/D2z8nLO7hUY4L+7P7FSe0MNO3P4tFDuqxtyvPjEnGDAgchfwn
 ghXWPONNzvHK2MKxEdCr8eKuosHM7gypUlpTdjhvtdTr6mrKmq7pCOKn5pqp/xLz
 eRnVvHqiwqkumyT7QXXNEUDsAna1QujQHPgcwDBgqrrGFMOdLPGRoye0BLLkuXbr
 VBUlZYBM/eWRcUmUFZUZj92GnoDs0UVO1sr/t78iYcFT+uq4T77MCgpH3RGy3/Kv
 TZiCNOJCS9vjMS88aPJZLAWnPvwabBtJsGQpq/Kwtymp+CaSzHvg3g24cjEj882f
 Ncl54M+aGnuVaqf6BreHQ==
X-ME-Sender: <xms:khN0ZkLBYSdClGOGNNQBfNsPgKK3SBCvA1VuL-gGdvCXvvdWH-_NUA>
 <xme:khN0ZkKxDkWLe1Vf_9tWEE1sircWCc-exZS0DdOSiU_2mFTmQkNICZX6v3YTlfMPs
 ctYhPUX_tcLlre9MQ>
X-ME-Received: <xmr:khN0ZksduzZTUnlZctjrPRQMKPxWjSEvYZAJ_0ZDFJtMPMbgVhGorw_WYzJdJW4LFZpUrYI_DsXEGJYc1Y75pyei19eKZihT3ZwL8x9J_PzpDpGW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
 ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
 ieehteenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:khN0ZhZHBLoeXRk2lGMTdDuBhz2kd54zJDiCf39KPCEDhplfoILJUA>
 <xmx:khN0ZrbMO-SH_RxvSqepzIukpPH4BCk1rcCdA1LttOsF3Q2Rr10_2g>
 <xmx:khN0ZtBJEPTXbpGxt6pXkKP5dcQ2B8lweP6qTMmRuqSJx7dtpGsz-A>
 <xmx:khN0ZhbfnWuVgSJr-zpD5wBUm4U5J1_Kr0_hhAu96w-Ct-P9GPf9yQ>
 <xmx:kxN0ZoKkagWbmherpMC_amJ_2qzVkTO7-fKIxdN-sv74Zco2LsMMYqzd>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:33:33 -0400 (EDT)
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
Subject: [PATCH 16/23] drm: sun4i: de2/de3: make blender register references
 generic
Date: Thu, 20 Jun 2024 23:29:54 +1200
Message-ID: <20240620113150.83466-17-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620113150.83466-1-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
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

