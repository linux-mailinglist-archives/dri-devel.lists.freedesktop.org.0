Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96C550D350
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F9F10FCB8;
	Sun, 24 Apr 2022 16:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F0810FC55
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 16:26:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E749B5C006B;
 Sun, 24 Apr 2022 12:26:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 24 Apr 2022 12:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1650817608; x=1650904008; bh=zP
 MfdJ+AkEeakwFL7LUNwjIAuII+q7EgUSIMik380Dc=; b=HfK2f99OU9vTsedYRA
 42mjxc5zUGDhz9PBL2ppA9hgIVNvOLsA8dgP1bctn37enBeBNY4aoVx9wkAV9Tnb
 IiI4Qs7xVoL9ny70CGUy/OIKbqqX51krq8y+0Mh9DwhQXT7L1DrwWMVXkdg343mU
 MT6pJEBPh3x3sMNwUgIPSbX7r6ctNUhdqZ7zOIatrJFd9ckBQ6HvxZC+fNSk8npB
 WWe33MGKgQPYjQOT+6xFD317SItKKziDwc2v6hdJ51lOyzlPkfVJsixpKRHh0nZG
 x8mV59umyDAM4fqkQGQC/wq4CwX8olHkmOtTmgaEbOjoEISk4p/PyFvJ29/caq6X
 6jfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650817608; x=1650904008; bh=zPMfdJ+AkEeakwFL7LUNwjIAuII+q7EgUSI
 Mik380Dc=; b=Db4GtYidafdqQpNx0VKUjiThPnx9M3elJpRZzuYSDpwlzbUyArr
 CKNcMUflYuxDpzAoZySip7zNHUgr7AGTO0MK7jr/phBO9MsYt+DNlXSVlHJLWHpy
 PEmuaffdEqm6fJ8Qgxv1y/Z6ySYArZNKHBFdeJ1vz0nqmk6MlM32pD7eeoHc64aV
 +tRHtV3c2kNtfLrtvPJDE082hY4W/8sxGo79WFxAgdm0i1k7zYCfsdpKLiQhzEZN
 WhLGDYPLcQC7vb3ojn8mRxwUHoVZa92eocv8MhhYA0I/V0+mixha/Pn+/pkpq258
 WZHMEcsoCjBqQr7b15e3HOgfqGgrinikUQQ==
X-ME-Sender: <xms:SHplYmtriUj_s7OoUWOns1MvFuZV-IpMk1r8QFcYf3C6VDkg3_NtDA>
 <xme:SHplYrf6nnG9zvU3OsJbTvVdv4Xwfzq7V5IWa63RFTO_zQoOGmrlA2PXL_LlmBUuB
 LRrW8xO-9NqG2D1yg>
X-ME-Received: <xmr:SHplYhyCBQB6UXVX_NZMZmiKXyKH9PhakF_va-1C3X4wFeOZjaZD_YK3LHudCOLcgaPGiow20JCoOL2s6AOqShQV8uQV3gyIWwLumxb7NHaHadAmZxd5lJc7SSyH3Uv3FBepOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:SHplYhP68HP3cvVDtyBPP3LgoE3xasJclRMEM_LUL2hS5JXp4aApXg>
 <xmx:SHplYm9QDx6BPHPpwNbqOdfbYqjobRxi64oH5h7TOYXI1QgU2C9zaw>
 <xmx:SHplYpWVA3hWlz7n5sgwzUHpE7hi5Qoy1poAegEyRGtduGUjv-I8OA>
 <xmx:SHplYpU3LmaYwIDZf6-rzEDC-AHQ2DWFlsMmT_outi3RKEIGB34KmA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 12:26:48 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 07/14] sun4i/drm: backend: use mode_set engine callback
Date: Sun, 24 Apr 2022 11:26:25 -0500
Message-Id: <20220424162633.12369-8-samuel@sholland.org>
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
place for setting backend output size and interlace mode for following
reasons:
1. Aforementioned properties change only when mode changes, so it's
   enough to be set only once per mode set. Currently it's done whenever
   properties of primary plane are changed.
2. It's assumed that primary plane will always cover whole screen. While
   this is true most of the time, it's not always. Planes are universal.
   There is no reason to add artificial limitation to primary plane.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
[Samuel: drop unused 'interlaced' variable]
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v2)

Changes in v2:
 - Use Jernej's patches for mixer mode setting.

 drivers/gpu/drm/sun4i/sun4i_backend.c | 40 +++++++++++++--------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index f52ff4e6c662..decd95ad519d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -172,14 +172,6 @@ int sun4i_backend_update_layer_coord(struct sun4i_backend *backend,
 
 	DRM_DEBUG_DRIVER("Updating layer %d\n", layer);
 
-	if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
-		DRM_DEBUG_DRIVER("Primary layer, updating global size W: %u H: %u\n",
-				 state->crtc_w, state->crtc_h);
-		regmap_write(backend->engine.regs, SUN4I_BACKEND_DISSIZE_REG,
-			     SUN4I_BACKEND_DISSIZE(state->crtc_w,
-						   state->crtc_h));
-	}
-
 	/* Set height and width */
 	DRM_DEBUG_DRIVER("Layer size W: %u H: %u\n",
 			 state->crtc_w, state->crtc_h);
@@ -259,7 +251,6 @@ int sun4i_backend_update_layer_formats(struct sun4i_backend *backend,
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
-	bool interlaced = false;
 	u32 val;
 	int ret;
 
@@ -267,17 +258,6 @@ int sun4i_backend_update_layer_formats(struct sun4i_backend *backend,
 	regmap_update_bits(backend->engine.regs, SUN4I_BACKEND_ATTCTL_REG0(layer),
 			   SUN4I_BACKEND_ATTCTL_REG0_LAY_YUVEN, 0);
 
-	if (plane->state->crtc)
-		interlaced = plane->state->crtc->state->adjusted_mode.flags
-			& DRM_MODE_FLAG_INTERLACE;
-
-	regmap_update_bits(backend->engine.regs, SUN4I_BACKEND_MODCTL_REG,
-			   SUN4I_BACKEND_MODCTL_ITLMOD_EN,
-			   interlaced ? SUN4I_BACKEND_MODCTL_ITLMOD_EN : 0);
-
-	DRM_DEBUG_DRIVER("Switching display backend interlaced mode %s\n",
-			 interlaced ? "on" : "off");
-
 	val = SUN4I_BACKEND_ATTCTL_REG0_LAY_GLBALPHA(state->alpha >> 8);
 	if (state->alpha != DRM_BLEND_ALPHA_OPAQUE)
 		val |= SUN4I_BACKEND_ATTCTL_REG0_LAY_GLBALPHA_EN;
@@ -654,6 +634,25 @@ static void sun4i_backend_vblank_quirk(struct sunxi_engine *engine)
 	spin_unlock(&backend->frontend_lock);
 };
 
+static void sun4i_backend_mode_set(struct sunxi_engine *engine,
+				   const struct drm_display_mode *mode)
+{
+	bool interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
+
+	DRM_DEBUG_DRIVER("Updating global size W: %u H: %u\n",
+			 mode->hdisplay, mode->vdisplay);
+
+	regmap_write(engine->regs, SUN4I_BACKEND_DISSIZE_REG,
+		     SUN4I_BACKEND_DISSIZE(mode->hdisplay, mode->vdisplay));
+
+	regmap_update_bits(engine->regs, SUN4I_BACKEND_MODCTL_REG,
+			   SUN4I_BACKEND_MODCTL_ITLMOD_EN,
+			   interlaced ? SUN4I_BACKEND_MODCTL_ITLMOD_EN : 0);
+
+	DRM_DEBUG_DRIVER("Switching display backend interlaced mode %s\n",
+			 interlaced ? "on" : "off");
+}
+
 static int sun4i_backend_init_sat(struct device *dev) {
 	struct sun4i_backend *backend = dev_get_drvdata(dev);
 	int ret;
@@ -765,6 +764,7 @@ static const struct sunxi_engine_ops sun4i_backend_engine_ops = {
 	.apply_color_correction		= sun4i_backend_apply_color_correction,
 	.disable_color_correction	= sun4i_backend_disable_color_correction,
 	.vblank_quirk			= sun4i_backend_vblank_quirk,
+	.mode_set			= sun4i_backend_mode_set,
 };
 
 static const struct regmap_config sun4i_backend_regmap_config = {
-- 
2.35.1

