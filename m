Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49538A50106
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCB910E781;
	Wed,  5 Mar 2025 13:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sETPLvD3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Ofqvccc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sETPLvD3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Ofqvccc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5CB10E781
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:47:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E0A4A211B8;
 Wed,  5 Mar 2025 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741182419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2mgo53dRUad8ekPYh68Omgq+gc6o5g5VielRosfzLhI=;
 b=sETPLvD3L/pfcTUxAWcuDF2s+7tEMOaTzlaLneNDFVIqg7KvoCvj4xX0fooKv125rbAH9T
 pdVzynKSYwFiqJgF3tFQW29MztH8Tw2ZlYg2s300dFr8q9yrqePwW3jBX2eM1hjx4ZZCKC
 ygG2d/ifQzcNfE0O6Gj6fpzWJjg8QkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741182419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2mgo53dRUad8ekPYh68Omgq+gc6o5g5VielRosfzLhI=;
 b=4OfqvcccwCKpppLWEB+MvDM01/3TEASjvB/wMaycdHXcHUDELMPwrfhw8QTmQlvC5zMwEp
 DgV+37yKu7UYRCCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741182419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2mgo53dRUad8ekPYh68Omgq+gc6o5g5VielRosfzLhI=;
 b=sETPLvD3L/pfcTUxAWcuDF2s+7tEMOaTzlaLneNDFVIqg7KvoCvj4xX0fooKv125rbAH9T
 pdVzynKSYwFiqJgF3tFQW29MztH8Tw2ZlYg2s300dFr8q9yrqePwW3jBX2eM1hjx4ZZCKC
 ygG2d/ifQzcNfE0O6Gj6fpzWJjg8QkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741182419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2mgo53dRUad8ekPYh68Omgq+gc6o5g5VielRosfzLhI=;
 b=4OfqvcccwCKpppLWEB+MvDM01/3TEASjvB/wMaycdHXcHUDELMPwrfhw8QTmQlvC5zMwEp
 DgV+37yKu7UYRCCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BBF861399F;
 Wed,  5 Mar 2025 13:46:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GI2/LNNVyGfYQwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 13:46:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/7] drm/ast: Remove vram_fb_available from struct ast_device
Date: Wed,  5 Mar 2025 14:35:46 +0100
Message-ID: <20250305134401.60609-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305134401.60609-1-tzimmermann@suse.de>
References: <20250305134401.60609-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
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

Helpers compute the offset and size of the available framebuffer
memory. Remove the obsolete field vram_fb_available from struct
ast_device. Also define the cursor-signature size next to its only
user.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 15 ++-------------
 drivers/gpu/drm/ast/ast_drv.h    |  4 ----
 drivers/gpu/drm/ast/ast_mm.c     |  1 -
 3 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 05e297f30b4e..f48207a45359 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -37,6 +37,7 @@
  */
 
 /* define for signature structure */
+#define AST_HWC_SIGNATURE_SIZE		SZ_32
 #define AST_HWC_SIGNATURE_CHECKSUM	0x00
 #define AST_HWC_SIGNATURE_SizeX		0x04
 #define AST_HWC_SIGNATURE_SizeY		0x08
@@ -294,20 +295,10 @@ int ast_cursor_plane_init(struct ast_device *ast)
 	long offset;
 	int ret;
 
-	/*
-	 * Allocate backing storage for cursors. The BOs are permanently
-	 * pinned to the top end of the VRAM.
-	 */
-
-	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
-
-	if (ast->vram_fb_available < size)
-		return -ENOMEM;
-
-	vaddr = ast->vram + ast->vram_fb_available - size;
 	offset = ast_cursor_vram_offset(ast);
 	if (offset < 0)
 		return offset;
+	vaddr = ast->vram + offset;
 
 	ret = ast_plane_init(dev, ast_plane, vaddr, offset, size,
 			     0x01, &ast_cursor_plane_funcs,
@@ -320,7 +311,5 @@ int ast_cursor_plane_init(struct ast_device *ast)
 	drm_plane_helper_add(cursor_plane, &ast_cursor_plane_helper_funcs);
 	drm_plane_enable_fb_damage_clips(cursor_plane);
 
-	ast->vram_fb_available -= size;
-
 	return 0;
 }
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ec9ec77260e9..d9da2328d46b 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -112,12 +112,9 @@ enum ast_config_mode {
 
 #define AST_MAX_HWC_WIDTH	64
 #define AST_MAX_HWC_HEIGHT	64
-
 #define AST_HWC_PITCH		(AST_MAX_HWC_WIDTH * SZ_2)
 #define AST_HWC_SIZE		(AST_MAX_HWC_HEIGHT * AST_HWC_PITCH)
 
-#define AST_HWC_SIGNATURE_SIZE	32
-
 /*
  * Planes
  */
@@ -183,7 +180,6 @@ struct ast_device {
 	void __iomem	*vram;
 	unsigned long	vram_base;
 	unsigned long	vram_size;
-	unsigned long	vram_fb_available;
 
 	struct mutex modeset_lock; /* Protects access to modeset I/O registers in ioregs */
 
diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index 3d03ef556d0a..0bc140319464 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -92,7 +92,6 @@ int ast_mm_init(struct ast_device *ast)
 
 	ast->vram_base = base;
 	ast->vram_size = vram_size;
-	ast->vram_fb_available = vram_size;
 
 	return 0;
 }
-- 
2.48.1

