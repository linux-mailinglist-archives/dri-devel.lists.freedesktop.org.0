Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3931F8C0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 13:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D556EB0F;
	Fri, 19 Feb 2021 12:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF076EB15
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 12:00:46 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 988A29C2;
 Fri, 19 Feb 2021 07:00:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 19 Feb 2021 07:00:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=pQ9qr/b27IsVG
 tGWxX7xmA4oqODc5Tlym74Te1nNU7E=; b=v77wVOK7Xmtp0XvKsSNuiPZxRpdal
 l7Hp+k6StZgvlmHH/NX3ekp81JaoxK71DlpnZP+FwYJDAnG2Hy6jYXwaxR27Dwyc
 k8fQLFazoVqY6DOePzvgMyG69CjTcJnuC72v+sW2iwfCjPG1iB9WlxP1HqRIIqUa
 PT3BwxvWlZqn6Jb46Oy8X4JgkhQSseW+TeFzHFS99TbY2QFo0NE6O6a+X7OmPtNE
 MbCHYCroZrnIFtu/JS5hsrCvhKMrxLRPbBp4SZrAYXJE3hBhnhp48rvEXri3b0yj
 VySd21oSipWdBJm/E+OEwMEm3gx6ykb78QDCIL5rP2JDx3FfQWPAEM5cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=pQ9qr/b27IsVGtGWxX7xmA4oqODc5Tlym74Te1nNU7E=; b=ch0nhENT
 +/CCMYqREqDLoEHYt3SfOtomMw/tQ8cvGXYElHzlKabN602VxFghThnk1kn0cM03
 zzyMcKjiWK7PnBtK/uPb9+WiQq4gFd4wsusPNAOOgIOaV6LDn6D3tTlyE3ya+X0s
 hrGje7rmks22HRuY5cualPgChkoNSur1heyNetX/5yHxBk80Wyu4m3bJsJ+Juo7Y
 t6ex+N/AKdGcP3KYp3w95byYM8edturetl7z5CKaRWCIeDwdri06dqu2NyuhhGcY
 dJ6obPagHswmZodWPXbGCMf2TSPKOBIaaq1pA7ryLRarffmA57p2fqirKsn/jjyC
 osXS4nZWpj6nNg==
X-ME-Sender: <xms:aagvYH9P6q79J4ePUllfFhme-KnHMzVMt8r_mOGEVKraeHXzXfeoiQ>
 <xme:aagvYPco0mTbVHlks0YKG-cMODRSbXIU3z8x2yKEMZm4G_PSkE9R0l_N2tU9YqGPJ
 vvz23QrwRqrZ2Y1qzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aagvYHwsa1MnBHFSRdjyy5uvPioKo8S0-h_Te5yyPp9vk--Bvv9QDQ>
 <xmx:aagvYJdXz0gTXzOeKkWe9qm5g_p-wEZFpA4e2azhzCk4Pn_RZsf7fQ>
 <xmx:aagvYF8TEIOiBr_oxCr_putpNyraQjkMalDrgiD7ws2YrLtKeUZDgA>
 <xmx:bKgvYFS1QaJIuGylEeP52Si-pVx4tWT-QOYOI0CqTDXQbH2i19nlRgYHpOY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 499591080059;
 Fri, 19 Feb 2021 07:00:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 03/11] drm/atmel-hlcdc: Rename custom plane state variable
Date: Fri, 19 Feb 2021 13:00:23 +0100
Message-Id: <20210219120032.260676-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210219120032.260676-1-maxime@cerno.tech>
References: <20210219120032.260676-1-maxime@cerno.tech>
MIME-Version: 1.0
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

Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
