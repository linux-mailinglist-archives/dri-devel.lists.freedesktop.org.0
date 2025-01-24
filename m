Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C58CAA1B14F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BB810E90A;
	Fri, 24 Jan 2025 08:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30C010E900
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:05:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B367121172;
 Fri, 24 Jan 2025 08:05:54 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F3B3139CB;
 Fri, 24 Jan 2025 08:05:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mDnGIeJJk2coNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 08:05:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/15] drm/ast: Align naming in widescreen detection code to
 manual
Date: Fri, 24 Jan 2025 08:57:40 +0100
Message-ID: <20250124080546.9956-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124080546.9956-1-tzimmermann@suse.de>
References: <20250124080546.9956-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B367121172
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Rename variables and register constants to align with the programming
manual. Add new constants where necessary.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.c  |  2 +-
 drivers/gpu/drm/ast/ast_main.c |  8 ++++----
 drivers/gpu/drm/ast/ast_post.c |  2 +-
 drivers/gpu/drm/ast/ast_reg.h  | 11 ++++++-----
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index cddd69972e89d..6fbf62a99c48d 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -170,7 +170,7 @@ static int ast_detect_chip(struct pci_dev *pdev,
 
 			/* Patch AST2500/AST2510 */
 			if ((pdev->revision & 0xf0) == 0x40) {
-				if (!(vgacrd0 & AST_VRAM_INIT_STATUS_MASK))
+				if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_STATUS_MASK))
 					ast_patch_ahb_2500(regs);
 			}
 
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index ba69280b33e78..2a813f0128eb8 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -38,7 +38,7 @@
 
 static void ast_detect_widescreen(struct ast_device *ast)
 {
-	u8 jreg;
+	u8 vgacrd0;
 
 	/* Check if we support wide screen */
 	switch (AST_GEN(ast)) {
@@ -46,10 +46,10 @@ static void ast_detect_widescreen(struct ast_device *ast)
 		ast->support_wide_screen = false;
 		break;
 	default:
-		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
-		if (!(jreg & 0x80))
+		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
+		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
 			ast->support_wide_screen = true;
-		else if (jreg & 0x01)
+		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
 			ast->support_wide_screen = true;
 		else {
 			ast->support_wide_screen = false;
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 0daa8e52a092a..91e85e457bdf3 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -2062,7 +2062,7 @@ void ast_post_chip_2500(struct ast_device *ast)
 	u8 reg;
 
 	reg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
-	if ((reg & AST_VRAM_INIT_STATUS_MASK) == 0) {/* vga only */
+	if ((reg & AST_IO_VGACRD0_VRAM_INIT_STATUS_MASK) == 0) {/* vga only */
 		/* Clear bus lock condition */
 		ast_patch_ahb_2500(ast->regs);
 
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 0745d58e5b450..b4ff38949a565 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -38,6 +38,12 @@
 #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
 #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
 
+/* mirrors SCU100[7:0] */
+#define AST_IO_VGACRD0_VRAM_INIT_STATUS_MASK	GENMASK(7, 6)
+#define AST_IO_VGACRD0_VRAM_INIT_BY_BMC		BIT(7)
+#define AST_IO_VGACRD0_VRAM_INIT_READY		BIT(6)
+#define AST_IO_VGACRD0_IKVM_WIDESCREEN		BIT(0)
+
 #define AST_IO_VGACRD1_MCU_FW_EXECUTING		BIT(5)
 /* Display Transmitter Type */
 #define AST_IO_VGACRD1_TX_TYPE_MASK		GENMASK(3, 1)
@@ -61,11 +67,6 @@
 #define AST_IO_VGAIR1_R			(0x5A)
 #define AST_IO_VGAIR1_VREFRESH		BIT(3)
 
-
-#define AST_VRAM_INIT_STATUS_MASK	GENMASK(7, 6)
-//#define AST_VRAM_INIT_BY_BMC		BIT(7)
-//#define AST_VRAM_INIT_READY		BIT(6)
-
 /*
  * AST DisplayPort
  */
-- 
2.47.1

