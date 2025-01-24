Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E43AA1B152
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539DD10E90C;
	Fri, 24 Jan 2025 08:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4675A10E900
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:05:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 16FF81F392;
 Fri, 24 Jan 2025 08:05:55 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E522713AA3;
 Fri, 24 Jan 2025 08:05:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KOKlNuJJk2coNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 08:05:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/15] drm/ast: Rename support_widescreen to support_wsxga_p
Date: Fri, 24 Jan 2025 08:57:42 +0100
Message-ID: <20250124080546.9956-5-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 16FF81F392
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

The flag support_widescreen in struct ast_device selects devices that
support resolutions of at least 1680x1050 (WSXGA+). Name it accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c | 26 +++++++++++++-------------
 drivers/gpu/drm/ast/ast_mode.c |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index cf9edef8fca66..ec5b204be1dae 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -205,7 +205,7 @@ struct ast_device {
 		} astdp;
 	} output;
 
-	bool support_wide_screen;
+	bool support_wsxga_p; /* 1680x1050 */
 
 	u8 *dp501_fw_addr;
 	const struct firmware *dp501_fw;	/* dp501 fw */
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 4f402e0b9b5c1..e1cfb2a1a5448 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -40,40 +40,40 @@ static void ast_detect_widescreen(struct ast_device *ast)
 {
 	u8 vgacrd0;
 
-	ast->support_wide_screen = false;
+	ast->support_wsxga_p = false;
 
 	if (AST_GEN(ast) >= 7) {
-		ast->support_wide_screen = true;
+		ast->support_wsxga_p = true;
 	} else if (AST_GEN(ast) >= 6) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
-			ast->support_wide_screen = true;
+			ast->support_wsxga_p = true;
 		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
-			ast->support_wide_screen = true;
+			ast->support_wsxga_p = true;
 		else if (ast->chip == AST2510)
-			ast->support_wide_screen = true;
+			ast->support_wsxga_p = true;
 	} else if (AST_GEN(ast) >= 5) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
-			ast->support_wide_screen = true;
+			ast->support_wsxga_p = true;
 		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
-			ast->support_wide_screen = true;
+			ast->support_wsxga_p = true;
 		else if (ast->chip == AST1400)
-			ast->support_wide_screen = true;
+			ast->support_wsxga_p = true;
 	} else if (AST_GEN(ast) >= 4) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
-			ast->support_wide_screen = true;
+			ast->support_wsxga_p = true;
 		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
-			ast->support_wide_screen = true;
+			ast->support_wsxga_p = true;
 		else if (ast->chip == AST1300)
-			ast->support_wide_screen = true;
+			ast->support_wsxga_p = true;
 	} else if (AST_GEN(ast) >= 2) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
-			ast->support_wide_screen = true;
+			ast->support_wsxga_p = true;
 		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
-			ast->support_wide_screen = true;
+			ast->support_wsxga_p = true;
 	}
 }
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index b533eb6e233ed..d1b3136b37693 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1024,7 +1024,7 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
 	enum drm_mode_status status;
 	uint32_t jtemp;
 
-	if (ast->support_wide_screen) {
+	if (ast->support_wsxga_p) {
 		if ((mode->hdisplay == 1680) && (mode->vdisplay == 1050))
 			return MODE_OK;
 		if ((mode->hdisplay == 1280) && (mode->vdisplay == 800))
-- 
2.47.1

