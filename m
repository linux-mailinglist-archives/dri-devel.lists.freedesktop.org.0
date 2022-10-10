Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE2C5F9CE4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 12:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE45810E46E;
	Mon, 10 Oct 2022 10:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDCF10E445
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 10:36:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9EDE61F8D5;
 Mon, 10 Oct 2022 10:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665398188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aamPatNM1d/3QzLxFnCa6fBeaOnH0rzMSdIKHqEEuwY=;
 b=pov4J3LBCWyJwfxBcMW2Oc5+7e7u0IwMDItWfGVsIzzspzjYgXsFzWYlY12lq/KJ+DrQRJ
 7nTkbPvAHzNeaeRaDpIq6l94cPojMdtWJWaWuOyMXRAkoUIRs8IZFTqUuEigTd30kDjXSq
 PM1JHRjf+hBUWi48c15beCWuzufqx7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665398188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aamPatNM1d/3QzLxFnCa6fBeaOnH0rzMSdIKHqEEuwY=;
 b=d4AG9eG+2ygqo3DRcp4hMVJvtBBehTTL5u5diqql1wPBY3egrWDz8svztWet/x6d1b735P
 B4P36qhlOUWCqyCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 63ED613ACA;
 Mon, 10 Oct 2022 10:36:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kN5HF6z1Q2M4LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Oct 2022 10:36:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 ilpo.jarvinen@cs.helsinki.fi
Subject: [PATCH 6/8] drm/ast: Style cleanups in plane code
Date: Mon, 10 Oct 2022 12:36:23 +0200
Message-Id: <20221010103625.19958-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010103625.19958-1-tzimmermann@suse.de>
References: <20221010103625.19958-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename some of the variables in the plane code to better reflect the
old and new state during checks and updates. Change some indention as
well. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 104 ++++++++++++++-------------------
 1 file changed, 45 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 00257db864ba..59c70fd5b925 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -579,16 +579,15 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 						 struct drm_atomic_state *state)
 {
 	struct drm_device *dev = plane->dev;
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
-										 plane);
-	struct drm_crtc_state *crtc_state = NULL;
-	struct ast_crtc_state *ast_crtc_state;
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc_state *new_crtc_state = NULL;
+	struct ast_crtc_state *new_ast_crtc_state;
 	int ret;
 
 	if (new_plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
 
-	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
 						  DRM_PLANE_NO_SCALING,
 						  DRM_PLANE_NO_SCALING,
 						  false, true);
@@ -601,30 +600,28 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 			return 0;
 	}
 
-	ast_crtc_state = to_ast_crtc_state(crtc_state);
+	new_ast_crtc_state = to_ast_crtc_state(new_crtc_state);
 
-	ast_crtc_state->format = new_plane_state->fb->format;
+	new_ast_crtc_state->format = new_plane_state->fb->format;
 
 	return 0;
 }
 
-static void
-ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
-				       struct drm_atomic_state *state)
+static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
+						   struct drm_atomic_state *state)
 {
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
-									   plane);
 	struct drm_device *dev = plane->dev;
 	struct ast_private *ast = to_ast_private(dev);
-	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
-									   plane);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_framebuffer *old_fb = old_plane_state->fb;
 	struct drm_gem_vram_object *gbo;
 	s64 gpu_addr;
-	struct drm_framebuffer *fb = new_state->fb;
-	struct drm_framebuffer *old_fb = old_state->fb;
 
 	if (!old_fb || (fb->format != old_fb->format)) {
-		struct drm_crtc_state *crtc_state = new_state->crtc->state;
+		struct drm_crtc *crtc = plane_state->crtc;
+		struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 		struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
 		struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
 
@@ -643,9 +640,8 @@ ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
 }
 
-static void
-ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
-					struct drm_atomic_state *state)
+static void ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
+						    struct drm_atomic_state *state)
 {
 	struct ast_private *ast = to_ast_private(plane->dev);
 
@@ -803,39 +799,36 @@ static const uint32_t ast_cursor_plane_formats[] = {
 static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
 						struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
-										 plane);
-	struct drm_framebuffer *fb = new_plane_state->fb;
-	struct drm_crtc_state *crtc_state = NULL;
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_framebuffer *new_fb = new_plane_state->fb;
+	struct drm_crtc_state *new_crtc_state = NULL;
 	int ret;
 
 	if (new_plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
 
-	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
 						  DRM_PLANE_NO_SCALING,
 						  DRM_PLANE_NO_SCALING,
 						  true, true);
 	if (ret || !new_plane_state->visible)
 		return ret;
 
-	if (fb->width > AST_MAX_HWC_WIDTH || fb->height > AST_MAX_HWC_HEIGHT)
+	if (new_fb->width > AST_MAX_HWC_WIDTH || new_fb->height > AST_MAX_HWC_HEIGHT)
 		return -EINVAL;
 
 	return 0;
 }
 
-static void
-ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
-				      struct drm_atomic_state *state)
+static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
+						  struct drm_atomic_state *state)
 {
 	struct ast_plane *ast_plane = to_ast_plane(plane);
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
-									   plane);
-	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
-									   plane);
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(new_state);
-	struct drm_framebuffer *fb = new_state->fb;
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_framebuffer *old_fb = old_plane_state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
 	struct iosys_map dst_map = ast_plane->map;
 	u64 dst_off = ast_plane->off;
@@ -858,32 +851,32 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 
 	ast_update_cursor_image(dst, src, fb->width, fb->height);
 
-	if (new_state->fb != old_state->fb)
+	if (fb != old_fb)
 		ast_set_cursor_base(ast, dst_off);
 
 	/*
 	 * Update location in HWC signature and registers.
 	 */
 
-	writel(new_state->crtc_x, sig + AST_HWC_SIGNATURE_X);
-	writel(new_state->crtc_y, sig + AST_HWC_SIGNATURE_Y);
+	writel(plane_state->crtc_x, sig + AST_HWC_SIGNATURE_X);
+	writel(plane_state->crtc_y, sig + AST_HWC_SIGNATURE_Y);
 
 	offset_x = AST_MAX_HWC_WIDTH - fb->width;
 	offset_y = AST_MAX_HWC_HEIGHT - fb->height;
 
-	if (new_state->crtc_x < 0) {
-		x_offset = (-new_state->crtc_x) + offset_x;
+	if (plane_state->crtc_x < 0) {
+		x_offset = (-plane_state->crtc_x) + offset_x;
 		x = 0;
 	} else {
 		x_offset = offset_x;
-		x = new_state->crtc_x;
+		x = plane_state->crtc_x;
 	}
-	if (new_state->crtc_y < 0) {
-		y_offset = (-new_state->crtc_y) + offset_y;
+	if (plane_state->crtc_y < 0) {
+		y_offset = (-plane_state->crtc_y) + offset_y;
 		y = 0;
 	} else {
 		y_offset = offset_y;
-		y = new_state->crtc_y;
+		y = plane_state->crtc_y;
 	}
 
 	ast_set_cursor_location(ast, x, y, x_offset, y_offset);
@@ -892,9 +885,8 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	ast_set_cursor_enabled(ast, true);
 }
 
-static void
-ast_cursor_plane_helper_atomic_disable(struct drm_plane *plane,
-				       struct drm_atomic_state *state)
+static void ast_cursor_plane_helper_atomic_disable(struct drm_plane *plane,
+						   struct drm_atomic_state *state)
 {
 	struct ast_private *ast = to_ast_private(plane->dev);
 
@@ -1204,13 +1196,11 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 		ast_dp_set_mode(crtc, vbios_mode_info);
 }
 
-static void
-ast_crtc_helper_atomic_enable(struct drm_crtc *crtc,
-			      struct drm_atomic_state *state)
+static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct ast_private *ast = to_ast_private(dev);
-	struct drm_crtc_state *crtc_state = crtc->state;
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
 	struct ast_vbios_mode_info *vbios_mode_info =
 		&ast_crtc_state->vbios_mode_info;
@@ -1227,12 +1217,9 @@ ast_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 	ast_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
 }
 
-static void
-ast_crtc_helper_atomic_disable(struct drm_crtc *crtc,
-			       struct drm_atomic_state *state)
+static void ast_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
-									      crtc);
+	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
 	struct drm_device *dev = crtc->dev;
 	struct ast_private *ast = to_ast_private(dev);
 
@@ -1787,7 +1774,6 @@ int ast_mode_config_init(struct ast_private *ast)
 
 	dev->mode_config.helper_private = &ast_mode_config_helper_funcs;
 
-
 	ret = ast_primary_plane_init(ast);
 	if (ret)
 		return ret;
-- 
2.37.3

