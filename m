Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BA6A50101
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8406810E77B;
	Wed,  5 Mar 2025 13:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NBFj1gFU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+Io5vU/8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NBFj1gFU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+Io5vU/8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59AD10E781
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:47:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 62B11211AC;
 Wed,  5 Mar 2025 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741182419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nh8ZCVvlP0V76lJ+oM1/bdey6uNrFq2svDTS79Lg2E8=;
 b=NBFj1gFUEkAImiANJ05FhATIz5OeomwC+kjJinvLPUvjQ4ezooHBPnUuEksK+DLDKSkRUF
 B9+02B2BbA8c9VgOayOpJptHOofD6WhVsMU1HoGTIkSjb76Ib3+3s0o2oLqdPhwOi3C0oB
 S40Yic4oLdv34f1WJpUEuDhRi9GH87o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741182419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nh8ZCVvlP0V76lJ+oM1/bdey6uNrFq2svDTS79Lg2E8=;
 b=+Io5vU/8YaveImn7pr9Z3C3OaO2fElsT3RfDIbMbn9DlgEel6qctX9nPOv27yk606y5odP
 gS1ArMQvGhT3U+BQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NBFj1gFU;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="+Io5vU/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741182419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nh8ZCVvlP0V76lJ+oM1/bdey6uNrFq2svDTS79Lg2E8=;
 b=NBFj1gFUEkAImiANJ05FhATIz5OeomwC+kjJinvLPUvjQ4ezooHBPnUuEksK+DLDKSkRUF
 B9+02B2BbA8c9VgOayOpJptHOofD6WhVsMU1HoGTIkSjb76Ib3+3s0o2oLqdPhwOi3C0oB
 S40Yic4oLdv34f1WJpUEuDhRi9GH87o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741182419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nh8ZCVvlP0V76lJ+oM1/bdey6uNrFq2svDTS79Lg2E8=;
 b=+Io5vU/8YaveImn7pr9Z3C3OaO2fElsT3RfDIbMbn9DlgEel6qctX9nPOv27yk606y5odP
 gS1ArMQvGhT3U+BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D4851366F;
 Wed,  5 Mar 2025 13:46:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gGKmDdNVyGfYQwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 13:46:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/7] drm/ast: Add VGACR99 register constants
Date: Wed,  5 Mar 2025 14:35:43 +0100
Message-ID: <20250305134401.60609-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305134401.60609-1-tzimmermann@suse.de>
References: <20250305134401.60609-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 62B11211AC
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
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

Add register constants for VGACR99 and use them when detecting the
size of the VGA memory. Aligns the code with the programming manual.
Also replace literal size values with Linux' SZ_ size constants.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mm.c  | 13 ++++++-------
 drivers/gpu/drm/ast/ast_reg.h |  1 +
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index 8d8aac8c0814..3d03ef556d0a 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -35,9 +35,8 @@
 
 static u32 ast_get_vram_size(struct ast_device *ast)
 {
-	u8 jreg;
 	u32 vram_size;
-	u8 vgacraa;
+	u8 vgacr99, vgacraa;
 
 	vgacraa = ast_get_index_reg(ast, AST_IO_VGACRI, 0xaa);
 	switch (vgacraa & AST_IO_VGACRAA_VGAMEM_SIZE_MASK) {
@@ -55,16 +54,16 @@ static u32 ast_get_vram_size(struct ast_device *ast)
 		break;
 	}
 
-	jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0x99, 0xff);
-	switch (jreg & 0x03) {
+	vgacr99 = ast_get_index_reg(ast, AST_IO_VGACRI, 0x99);
+	switch (vgacr99 & AST_IO_VGACR99_VGAMEM_RSRV_MASK) {
 	case 1:
-		vram_size -= 0x100000;
+		vram_size -= SZ_1M;
 		break;
 	case 2:
-		vram_size -= 0x200000;
+		vram_size -= SZ_2M;
 		break;
 	case 3:
-		vram_size -= 0x400000;
+		vram_size -= SZ_4M;
 		break;
 	}
 
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 039b93bed19e..e15adaf3a80e 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -30,6 +30,7 @@
 
 #define AST_IO_VGACRI			(0x54)
 #define AST_IO_VGACR80_PASSWORD		(0xa8)
+#define AST_IO_VGACR99_VGAMEM_RSRV_MASK	GENMASK(1, 0)
 #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
 #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
 #define AST_IO_VGACRA3_DVO_ENABLED	BIT(7)
-- 
2.48.1

