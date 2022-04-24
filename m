Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A7850D34E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98A910FC85;
	Sun, 24 Apr 2022 16:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6287910FC55
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 16:26:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AAD6F5C00D0;
 Sun, 24 Apr 2022 12:26:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 24 Apr 2022 12:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1650817610; x=1650904010; bh=VA
 bSZxVzIGNAQAD06Zb2HEHcQCKmbXdF4OwgsGA6Zho=; b=XnuLBhQ1TaMX7ScUVL
 TnOoKFKEFJM5ss6c76CB9h7/Yo8Ilg9R4YBv6aOz99t3ooiibmuG9wIfzX3DlY3f
 ejCw8fCRVtkKCbnSpFpVIq995dLxKyXMAZIRxNMV9a47yO3CdIJPwhwrszhqyEb7
 h7BnlTgwlLIny5wc/GadgisnR3bR36nnJsd5vcW25EuDZUv17QQgsoen9tyE6BNx
 0pqFJRQNUmL5UFJgdzmSbNc0WWwZ2cssg8TTIXEpsgqhvx00M8tFEQMO55BA31Jw
 cY1pmvPg6sIzXsGxDWaRxmcnAMw/SKiThivZIzUU0SM2vhJw4osMokUdG0Y4U8N2
 vveQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650817610; x=1650904010; bh=VAbSZxVzIGNAQAD06Zb2HEHcQCKmbXdF4Ow
 gsGA6Zho=; b=MWHxoS6DPWO/ht0YNT6BOjE8h5LKFrlIRiqGXuH4fYfmkjTaf+U
 eVlXbqjrupUJTdEXUejtchDuHIqE6DxdL5rlv+ggQcP+0drb/Xhk59bs4ySljy1Z
 S326/ZuCyafh4Kr1/QAW/ZJtrhospb9fBts7ehq9OX7ud0aSAd9gG6kJ5+fBPZAM
 o1G00diM4nH6L4IZ6NjaUzCPeCdgM4hK/VOx8xaLh/3enZhSuXyd9xg3XxkLTf8t
 L7iMfz81MdvBRiwUnAW2JtP20nZWUynpEjIkqHa4bSkaFFoIRnqmA80xN+o75ulf
 mk8wF+Eb+TQEzDBgM3ZiJnwxjgtR18N/TRQ==
X-ME-Sender: <xms:SnplYty9PuXbYSQjzfylmGnHXfuZWKlGbSFLavDkrZQe8ZEHcirMTA>
 <xme:SnplYtSaEBGubAeCuDxpVYAGACdw1w4oVvFBXk7lbJw4bw6E_ZeRjiHHNAOiiNke8
 v0Dc2sA-CUOnHB2XA>
X-ME-Received: <xmr:SnplYnW8_LlAEwk8yDCmCpgVeJHuRwoR2Ya6aHBE1zgsJ09rTdbayIOMSX2dbmNNj2WiRSOSNMUm2Mwsgdo4jDsq1mYRUdSxmXC67Xn3V4S_mx32a4Ax73NO9aAYc07NvObB7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:SnplYvjHrLjeZZC1zXQsBOdw_Rbmp4tABAu5nbdulb7NLlmfRdeqkg>
 <xmx:SnplYvC4HYLBjCoU2p3xIKO4sLyD18zzlnv5r3LYjfD0X7zr8T8z2A>
 <xmx:SnplYoL69TilQwqpECjG5eV2SAPJDnT0BTIeUbj0jmivAYw3TycFFQ>
 <xmx:SnplYsKx5-Pm0dsGWgXc-Le4M0jnbQP4BaSqzuWWk1YdQ8L6YzVutw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 12:26:50 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 08/14] sun4i/drm: sun8i: use mode_set engine callback
Date: Sun, 24 Apr 2022 11:26:26 -0500
Message-Id: <20220424162633.12369-9-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-1-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Newly introduced mode_set callback in engine structure is a much better
place for setting mixer output size and interlace mode for the following
reasons:
1. Aforementioned properties change only when mode changes, so it's
   enough to be set only once per mode set. Currently it's done whenever
   properties of primary plane are changed.
2. It's assumed that primary plane will always cover whole screen. While
   this is true most of the time, it's not always. DE2/3 planes are
   universal and mostly equal in functionality. There is no reason to
   add artificial limitation to primary planes.
3. The current code only works for UI layers, but some mixers do not
   have any UI layers.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
[Samuel: update commit message]
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v2)

Changes in v2:
 - Use Jernej's patches for mixer mode setting.

 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 30 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 30 --------------------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index f5e8aeaa3cdf..6b1711a9a71f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -298,9 +298,39 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	return planes;
 }
 
+static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
+				 const struct drm_display_mode *mode)
+{
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	u32 bld_base, size, val;
+	bool interlaced;
+
+	bld_base = sun8i_blender_base(mixer);
+	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
+	size = SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
+
+	DRM_DEBUG_DRIVER("Updating global size W: %u H: %u\n",
+			 mode->hdisplay, mode->vdisplay);
+
+	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_SIZE, size);
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
+
+	if (interlaced)
+		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
+	else
+		val = 0;
+
+	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
+			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
+
+	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
+			 interlaced ? "on" : "off");
+}
+
 static const struct sunxi_engine_ops sun8i_engine_ops = {
 	.commit		= sun8i_mixer_commit,
 	.layers_init	= sun8i_layers_init,
+	.mode_set	= sun8i_mixer_mode_set,
 };
 
 static const struct regmap_config sun8i_mixer_regmap_config = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7845c2a53a7f..4632dea2dc1e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -120,36 +120,6 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	insize = SUN8I_MIXER_SIZE(src_w, src_h);
 	outsize = SUN8I_MIXER_SIZE(dst_w, dst_h);
 
-	if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
-		bool interlaced = false;
-		u32 val;
-
-		DRM_DEBUG_DRIVER("Primary layer, updating global size W: %u H: %u\n",
-				 dst_w, dst_h);
-		regmap_write(mixer->engine.regs,
-			     SUN8I_MIXER_GLOBAL_SIZE,
-			     outsize);
-		regmap_write(mixer->engine.regs,
-			     SUN8I_MIXER_BLEND_OUTSIZE(bld_base), outsize);
-
-		if (state->crtc)
-			interlaced = state->crtc->state->adjusted_mode.flags
-				& DRM_MODE_FLAG_INTERLACE;
-
-		if (interlaced)
-			val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
-		else
-			val = 0;
-
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_OUTCTL(bld_base),
-				   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
-				   val);
-
-		DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
-				 interlaced ? "on" : "off");
-	}
-
 	/* Set height and width */
 	DRM_DEBUG_DRIVER("Layer source offset X: %d Y: %d\n",
 			 state->src.x1 >> 16, state->src.y1 >> 16);
-- 
2.35.1

