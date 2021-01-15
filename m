Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E842F8CFE
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849446E588;
	Sat, 16 Jan 2021 10:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AA489B68
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 12:57:13 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C0B735807A1;
 Fri, 15 Jan 2021 07:57:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 15 Jan 2021 07:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=7GgtgiJWFFDfJ
 XrTHh89Naulu2DOsYhcCMPVJgOp8Vo=; b=DUfjf+cJTpSiJES8+B/QYDLqK2g3K
 BZgQnz9vjUE/t0ZVWGMl4ZVuNOuh0KTOqyDHcST8q5QNHN/1ESuAztTuBp9kB3dr
 u+RfTppo8k6E2TAReDph/bZos5p1C3INYJSUlFjB5ENO6fj/R43OuQd5j1AeAfNp
 E4YlXQ5JPzc7TLHW9stTZG8YchxyFmoDD89n+HjSg1NwTsIoW2nR6ORzjtvncWgY
 jMygVaH4oOaOpnJTSqkD7UR+r/H6LxWslUtE22KQS4KSevvq2tNyjg6hZHUDwIeg
 qCm8O8sNtbf8E8oAe8Nx71/6WtKRykPHMW+3op6y5J+1ZWgcnmgX82g6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=7GgtgiJWFFDfJXrTHh89Naulu2DOsYhcCMPVJgOp8Vo=; b=aqRJLbwp
 i+Uky15IyAFmP9aKPa0XS4FG5JMHcV1u/+bI/ZF0etBTTHO3eeB+2MQ33DLTguKD
 PxekTG9gLacoGyNMU0roPXZKA+EARxUA9ZqKR6JQ6cnacUa4LizXIXSOLKQHvKud
 HGhT1wKu4Ofcvg8G02AgK1tmAGMkKixHdX65FOZkv27pUsQ5WddcOW0Y+6thv53A
 JDTc/+x+7z6iMl954lKZijrEPwO8TrVpyX8zYv0+z85SLF56VX4+ek4iNvDM52wE
 jm9up7UeAhE5eMdlvHX9fTeTqCtXV7VxC07YuzxEBf9tE+WvqbF4U49UMR3IbZcl
 1ub7BwzUzwo6sg==
X-ME-Sender: <xms:J5EBYNccK-YXJiboQ0i0bGK8VnPhML27EbuosvKBPJoEhjb82WdiOA>
 <xme:J5EBYLONbgyHmfEdaV5VaAfiTVNF04LpLOZnmicfJeorl5ZXZInG9boBi0vG_RIsF
 O35heY9YNEi7h9UJZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:J5EBYGh_xXCV7fhzAOZbWnGb7MwbV7vsp2tYJpSKMS2gHr0pZPaiPg>
 <xmx:J5EBYG8bUl0_58zfXYsMhC0A9YqwyaYquESnlUf_zwOO3IVE8NJh0w>
 <xmx:J5EBYJssM0lCN4-xmlUgDLcM86QoQAuJW5tG02I3TG2AU7_ik2_0oQ>
 <xmx:KJEBYFGloZvLmW_UrzXpdfEYMJ81fCtdzkDC7Mn4EjT5Vh4Md7yR4w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 999161080064;
 Fri, 15 Jan 2021 07:57:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 03/10] drm/atmel-hlcdc: Rename custom plane state variable
Date: Fri, 15 Jan 2021 13:56:55 +0100
Message-Id: <20210115125703.1315064-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115125703.1315064-1-maxime@cerno.tech>
References: <20210115125703.1315064-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Subsequent reworks will pass the global atomic state in the function
prototype, and atomic_check and atomic_update already have such a
variable already. Let's change them to ease the rework.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 118 +++++++++---------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 15bc93163833..c62e930bccad 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -596,16 +596,16 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 					  struct drm_plane_state *s)
 {
 	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
-	struct atmel_hlcdc_plane_state *state =
+	struct atmel_hlcdc_plane_state *hstate =
 				drm_plane_state_to_atmel_hlcdc_plane_state(s);
 	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
-	struct drm_framebuffer *fb = state->base.fb;
+	struct drm_framebuffer *fb = hstate->base.fb;
 	const struct drm_display_mode *mode;
 	struct drm_crtc_state *crtc_state;
 	int ret;
 	int i;
 
-	if (!state->base.crtc || WARN_ON(!fb))
+	if (!hstate->base.crtc || WARN_ON(!fb))
 		return 0;
 
 	crtc_state = drm_atomic_get_existing_crtc_state(s->state, s->crtc);
@@ -617,94 +617,94 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 	if (ret || !s->visible)
 		return ret;
 
-	state->src_x = s->src.x1;
-	state->src_y = s->src.y1;
-	state->src_w = drm_rect_width(&s->src);
-	state->src_h = drm_rect_height(&s->src);
-	state->crtc_x = s->dst.x1;
-	state->crtc_y = s->dst.y1;
-	state->crtc_w = drm_rect_width(&s->dst);
-	state->crtc_h = drm_rect_height(&s->dst);
+	hstate->src_x = s->src.x1;
+	hstate->src_y = s->src.y1;
+	hstate->src_w = drm_rect_width(&s->src);
+	hstate->src_h = drm_rect_height(&s->src);
+	hstate->crtc_x = s->dst.x1;
+	hstate->crtc_y = s->dst.y1;
+	hstate->crtc_w = drm_rect_width(&s->dst);
+	hstate->crtc_h = drm_rect_height(&s->dst);
 
-	if ((state->src_x | state->src_y | state->src_w | state->src_h) &
+	if ((hstate->src_x | hstate->src_y | hstate->src_w | hstate->src_h) &
 	    SUBPIXEL_MASK)
 		return -EINVAL;
 
-	state->src_x >>= 16;
-	state->src_y >>= 16;
-	state->src_w >>= 16;
-	state->src_h >>= 16;
+	hstate->src_x >>= 16;
+	hstate->src_y >>= 16;
+	hstate->src_w >>= 16;
+	hstate->src_h >>= 16;
 
-	state->nplanes = fb->format->num_planes;
-	if (state->nplanes > ATMEL_HLCDC_LAYER_MAX_PLANES)
+	hstate->nplanes = fb->format->num_planes;
+	if (hstate->nplanes > ATMEL_HLCDC_LAYER_MAX_PLANES)
 		return -EINVAL;
 
-	for (i = 0; i < state->nplanes; i++) {
+	for (i = 0; i < hstate->nplanes; i++) {
 		unsigned int offset = 0;
 		int xdiv = i ? fb->format->hsub : 1;
 		int ydiv = i ? fb->format->vsub : 1;
 
-		state->bpp[i] = fb->format->cpp[i];
-		if (!state->bpp[i])
+		hstate->bpp[i] = fb->format->cpp[i];
+		if (!hstate->bpp[i])
 			return -EINVAL;
 
-		switch (state->base.rotation & DRM_MODE_ROTATE_MASK) {
+		switch (hstate->base.rotation & DRM_MODE_ROTATE_MASK) {
 		case DRM_MODE_ROTATE_90:
-			offset = (state->src_y / ydiv) *
+			offset = (hstate->src_y / ydiv) *
 				 fb->pitches[i];
-			offset += ((state->src_x + state->src_w - 1) /
-				   xdiv) * state->bpp[i];
-			state->xstride[i] = -(((state->src_h - 1) / ydiv) *
+			offset += ((hstate->src_x + hstate->src_w - 1) /
+				   xdiv) * hstate->bpp[i];
+			hstate->xstride[i] = -(((hstate->src_h - 1) / ydiv) *
 					    fb->pitches[i]) -
-					  (2 * state->bpp[i]);
-			state->pstride[i] = fb->pitches[i] - state->bpp[i];
+					  (2 * hstate->bpp[i]);
+			hstate->pstride[i] = fb->pitches[i] - hstate->bpp[i];
 			break;
 		case DRM_MODE_ROTATE_180:
-			offset = ((state->src_y + state->src_h - 1) /
+			offset = ((hstate->src_y + hstate->src_h - 1) /
 				  ydiv) * fb->pitches[i];
-			offset += ((state->src_x + state->src_w - 1) /
-				   xdiv) * state->bpp[i];
-			state->xstride[i] = ((((state->src_w - 1) / xdiv) - 1) *
-					   state->bpp[i]) - fb->pitches[i];
-			state->pstride[i] = -2 * state->bpp[i];
+			offset += ((hstate->src_x + hstate->src_w - 1) /
+				   xdiv) * hstate->bpp[i];
+			hstate->xstride[i] = ((((hstate->src_w - 1) / xdiv) - 1) *
+					   hstate->bpp[i]) - fb->pitches[i];
+			hstate->pstride[i] = -2 * hstate->bpp[i];
 			break;
 		case DRM_MODE_ROTATE_270:
-			offset = ((state->src_y + state->src_h - 1) /
+			offset = ((hstate->src_y + hstate->src_h - 1) /
 				  ydiv) * fb->pitches[i];
-			offset += (state->src_x / xdiv) * state->bpp[i];
-			state->xstride[i] = ((state->src_h - 1) / ydiv) *
+			offset += (hstate->src_x / xdiv) * hstate->bpp[i];
+			hstate->xstride[i] = ((hstate->src_h - 1) / ydiv) *
 					  fb->pitches[i];
-			state->pstride[i] = -fb->pitches[i] - state->bpp[i];
+			hstate->pstride[i] = -fb->pitches[i] - hstate->bpp[i];
 			break;
 		case DRM_MODE_ROTATE_0:
 		default:
-			offset = (state->src_y / ydiv) * fb->pitches[i];
-			offset += (state->src_x / xdiv) * state->bpp[i];
-			state->xstride[i] = fb->pitches[i] -
-					  ((state->src_w / xdiv) *
-					   state->bpp[i]);
-			state->pstride[i] = 0;
+			offset = (hstate->src_y / ydiv) * fb->pitches[i];
+			offset += (hstate->src_x / xdiv) * hstate->bpp[i];
+			hstate->xstride[i] = fb->pitches[i] -
+					  ((hstate->src_w / xdiv) *
+					   hstate->bpp[i]);
+			hstate->pstride[i] = 0;
 			break;
 		}
 
-		state->offsets[i] = offset + fb->offsets[i];
+		hstate->offsets[i] = offset + fb->offsets[i];
 	}
 
 	/*
 	 * Swap width and size in case of 90 or 270 degrees rotation
 	 */
-	if (drm_rotation_90_or_270(state->base.rotation)) {
-		swap(state->src_w, state->src_h);
+	if (drm_rotation_90_or_270(hstate->base.rotation)) {
+		swap(hstate->src_w, hstate->src_h);
 	}
 
 	if (!desc->layout.size &&
-	    (mode->hdisplay != state->crtc_w ||
-	     mode->vdisplay != state->crtc_h))
+	    (mode->hdisplay != hstate->crtc_w ||
+	     mode->vdisplay != hstate->crtc_h))
 		return -EINVAL;
 
-	if ((state->crtc_h != state->src_h || state->crtc_w != state->src_w) &&
+	if ((hstate->crtc_h != hstate->src_h || hstate->crtc_w != hstate->src_w) &&
 	    (!desc->layout.memsize ||
-	     state->base.fb->format->has_alpha))
+	     hstate->base.fb->format->has_alpha))
 		return -EINVAL;
 
 	return 0;
@@ -733,24 +733,24 @@ static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
 					    struct drm_plane_state *old_s)
 {
 	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
-	struct atmel_hlcdc_plane_state *state =
+	struct atmel_hlcdc_plane_state *hstate =
 			drm_plane_state_to_atmel_hlcdc_plane_state(p->state);
 	u32 sr;
 
 	if (!p->state->crtc || !p->state->fb)
 		return;
 
-	if (!state->base.visible) {
+	if (!hstate->base.visible) {
 		atmel_hlcdc_plane_atomic_disable(p, old_s);
 		return;
 	}
 
-	atmel_hlcdc_plane_update_pos_and_size(plane, state);
-	atmel_hlcdc_plane_update_general_settings(plane, state);
-	atmel_hlcdc_plane_update_format(plane, state);
-	atmel_hlcdc_plane_update_clut(plane, state);
-	atmel_hlcdc_plane_update_buffers(plane, state);
-	atmel_hlcdc_plane_update_disc_area(plane, state);
+	atmel_hlcdc_plane_update_pos_and_size(plane, hstate);
+	atmel_hlcdc_plane_update_general_settings(plane, hstate);
+	atmel_hlcdc_plane_update_format(plane, hstate);
+	atmel_hlcdc_plane_update_clut(plane, hstate);
+	atmel_hlcdc_plane_update_buffers(plane, hstate);
+	atmel_hlcdc_plane_update_disc_area(plane, hstate);
 
 	/* Enable the overrun interrupts. */
 	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IER,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
