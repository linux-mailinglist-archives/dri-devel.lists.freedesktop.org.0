Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941725F9CE3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 12:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1540C10E442;
	Mon, 10 Oct 2022 10:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B83610E442
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 10:36:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74DED1F8D2;
 Mon, 10 Oct 2022 10:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665398188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VAa1tjQD4eelPby7tXw6QYWE0p/n0Ho+pKSIvU7jNWg=;
 b=J18uU0Pj44fzlEpkisBmKbBKmBM7bM6EBqxlV7OQKuC1d9yEbXLDA/1JRIcST1o/vewMfF
 He8mTkpBwsmsjSIt4PH6V3ETnQr5E9xUa1UruXVj2WTIITEf34yISld2Ss7XpUGiI2j7pX
 cSxKwW+F7FUF0rheKqhkHZKzxYd3hR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665398188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VAa1tjQD4eelPby7tXw6QYWE0p/n0Ho+pKSIvU7jNWg=;
 b=GmHWQ/CtQ8Rnwrwa1jvVyfT18Uf4RL8ja3o/EI8X6rkTMGInbObjyrDHNIHtRhq/ZwQIrU
 KHaLTbRxPvi3z1Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F24A13AF9;
 Mon, 10 Oct 2022 10:36:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eHRUCqz1Q2M4LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Oct 2022 10:36:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 ilpo.jarvinen@cs.helsinki.fi
Subject: [PATCH 5/8] drm/ast: Rename struct ast_cursor_plane to struct
 ast_plane
Date: Mon, 10 Oct 2022 12:36:22 +0200
Message-Id: <20221010103625.19958-6-tzimmermann@suse.de>
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

Rename the plane structure struct ast_cursor_plane to struct
ast_plane as it will be used for the primary plane as well. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  | 15 +++++++++------
 drivers/gpu/drm/ast/ast_mode.c | 22 +++++++++++-----------
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 12294c74d0fc..02120025b7ac 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -87,7 +87,7 @@ enum ast_tx_chip {
 #define AST_DRAM_8Gx16   8
 
 /*
- * Cursor plane
+ * Hardware cursor
  */
 
 #define AST_MAX_HWC_WIDTH	64
@@ -105,7 +105,11 @@ enum ast_tx_chip {
 #define AST_HWC_SIGNATURE_HOTSPOTX	0x14
 #define AST_HWC_SIGNATURE_HOTSPOTY	0x18
 
-struct ast_cursor_plane {
+/*
+ * Planes
+ */
+
+struct ast_plane {
 	struct drm_plane base;
 
 	struct drm_gem_vram_object *gbo;
@@ -113,10 +117,9 @@ struct ast_cursor_plane {
 	u64 off;
 };
 
-static inline struct ast_cursor_plane *
-to_ast_cursor_plane(struct drm_plane *plane)
+static inline struct ast_plane *to_ast_plane(struct drm_plane *plane)
 {
-	return container_of(plane, struct ast_cursor_plane, base);
+	return container_of(plane, struct ast_plane, base);
 }
 
 /*
@@ -170,7 +173,7 @@ struct ast_private {
 	uint32_t mclk;
 
 	struct drm_plane primary_plane;
-	struct ast_cursor_plane cursor_plane;
+	struct ast_plane cursor_plane;
 	struct drm_crtc crtc;
 	struct {
 		struct {
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 06ee79ec86f1..00257db864ba 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -829,7 +829,7 @@ static void
 ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
-	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
+	struct ast_plane *ast_plane = to_ast_plane(plane);
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
@@ -837,8 +837,8 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(new_state);
 	struct drm_framebuffer *fb = new_state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
-	struct iosys_map dst_map = ast_cursor_plane->map;
-	u64 dst_off = ast_cursor_plane->off;
+	struct iosys_map dst_map = ast_plane->map;
+	u64 dst_off = ast_plane->off;
 	struct iosys_map src_map = shadow_plane_state->data[0];
 	unsigned int offset_x, offset_y;
 	u16 x, y;
@@ -910,9 +910,9 @@ static const struct drm_plane_helper_funcs ast_cursor_plane_helper_funcs = {
 
 static void ast_cursor_plane_destroy(struct drm_plane *plane)
 {
-	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
-	struct drm_gem_vram_object *gbo = ast_cursor_plane->gbo;
-	struct iosys_map map = ast_cursor_plane->map;
+	struct ast_plane *ast_plane = to_ast_plane(plane);
+	struct drm_gem_vram_object *gbo = ast_plane->gbo;
+	struct iosys_map map = ast_plane->map;
 
 	drm_gem_vram_vunmap(gbo, &map);
 	drm_gem_vram_unpin(gbo);
@@ -931,8 +931,8 @@ static const struct drm_plane_funcs ast_cursor_plane_funcs = {
 static int ast_cursor_plane_init(struct ast_private *ast)
 {
 	struct drm_device *dev = &ast->base;
-	struct ast_cursor_plane *ast_cursor_plane = &ast->cursor_plane;
-	struct drm_plane *cursor_plane = &ast_cursor_plane->base;
+	struct ast_plane *ast_plane = &ast->cursor_plane;
+	struct drm_plane *cursor_plane = &ast_plane->base;
 	size_t size;
 	struct drm_gem_vram_object *gbo;
 	struct iosys_map map;
@@ -963,9 +963,9 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 		goto err_drm_gem_vram_vunmap;
 	}
 
-	ast_cursor_plane->gbo = gbo;
-	ast_cursor_plane->map = map;
-	ast_cursor_plane->off = off;
+	ast_plane->gbo = gbo;
+	ast_plane->map = map;
+	ast_plane->off = off;
 
 	/*
 	 * Create the cursor plane. The plane's destroy callback will release
-- 
2.37.3

