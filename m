Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD14B59C28
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 17:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E77B10E37F;
	Tue, 16 Sep 2025 15:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VX0UDv3k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oOZ8Fk1K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VX0UDv3k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oOZ8Fk1K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5484510E386
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:35:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 121E01F453;
 Tue, 16 Sep 2025 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFFv1TXPylHTxEMjA4NtOyyUOITRUuuc1lHB1vYVoZU=;
 b=VX0UDv3k+m0dCHiTGgTUtbTbXu3DNFkLXkd6Eb9iTpXimPGJi85WI6BlTl1Wu1Rix3DI9Z
 r1H2UP6bASiogzZol8w4SfANrFAxcTymORl0+wZVBciof2irFsSQDoN2rFt/TMo9kJf2Be
 zkprky7zxrwJSbq1wNLwBlAtSRU2GIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFFv1TXPylHTxEMjA4NtOyyUOITRUuuc1lHB1vYVoZU=;
 b=oOZ8Fk1KioyUyqKMLX4lBkypoIl7OXly9TY45H9f4+UuYeBGYsXE8u6RbmXHatuLMEHizD
 Y7bH9qYKbQXRptBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VX0UDv3k;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oOZ8Fk1K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFFv1TXPylHTxEMjA4NtOyyUOITRUuuc1lHB1vYVoZU=;
 b=VX0UDv3k+m0dCHiTGgTUtbTbXu3DNFkLXkd6Eb9iTpXimPGJi85WI6BlTl1Wu1Rix3DI9Z
 r1H2UP6bASiogzZol8w4SfANrFAxcTymORl0+wZVBciof2irFsSQDoN2rFt/TMo9kJf2Be
 zkprky7zxrwJSbq1wNLwBlAtSRU2GIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFFv1TXPylHTxEMjA4NtOyyUOITRUuuc1lHB1vYVoZU=;
 b=oOZ8Fk1KioyUyqKMLX4lBkypoIl7OXly9TY45H9f4+UuYeBGYsXE8u6RbmXHatuLMEHizD
 Y7bH9qYKbQXRptBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8B6C13AA4;
 Tue, 16 Sep 2025 15:35:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OKrKL8GDyWjFPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Sep 2025 15:35:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/12] drm/ast: Move display-clock tables to per-Gen source
 files
Date: Tue, 16 Sep 2025 17:26:11 +0200
Message-ID: <20250916153239.308027-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916153239.308027-1-tzimmermann@suse.de>
References: <20250916153239.308027-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 121E01F453
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -3.01
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

Move display-clock tables to the appropriate per-Gen source files.
The tables are almost identical, except for mode entries 0x17 and
0x1a. Rename to tables to match common style.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2000.c   | 34 ++++++++++++++++++
 drivers/gpu/drm/ast/ast_2500.c   | 34 ++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.h    |  2 ++
 drivers/gpu/drm/ast/ast_mode.c   |  4 +--
 drivers/gpu/drm/ast/ast_tables.h | 60 --------------------------------
 5 files changed, 72 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
index 41c2aa1e425a..a31daf7c2ceb 100644
--- a/drivers/gpu/drm/ast/ast_2000.c
+++ b/drivers/gpu/drm/ast/ast_2000.c
@@ -147,3 +147,37 @@ int ast_2000_post(struct ast_device *ast)
 
 	return 0;
 }
+
+/*
+ * Mode setting
+ */
+
+const struct ast_vbios_dclk_info ast_2000_dclk_table[] = {
+	{0x2c, 0xe7, 0x03},			/* 00: VCLK25_175	*/
+	{0x95, 0x62, 0x03},			/* 01: VCLK28_322	*/
+	{0x67, 0x63, 0x01},			/* 02: VCLK31_5		*/
+	{0x76, 0x63, 0x01},			/* 03: VCLK36		*/
+	{0xee, 0x67, 0x01},			/* 04: VCLK40		*/
+	{0x82, 0x62, 0x01},			/* 05: VCLK49_5		*/
+	{0xc6, 0x64, 0x01},			/* 06: VCLK50		*/
+	{0x94, 0x62, 0x01},			/* 07: VCLK56_25	*/
+	{0x80, 0x64, 0x00},			/* 08: VCLK65		*/
+	{0x7b, 0x63, 0x00},			/* 09: VCLK75		*/
+	{0x67, 0x62, 0x00},			/* 0a: VCLK78_75	*/
+	{0x7c, 0x62, 0x00},			/* 0b: VCLK94_5		*/
+	{0x8e, 0x62, 0x00},			/* 0c: VCLK108		*/
+	{0x85, 0x24, 0x00},			/* 0d: VCLK135		*/
+	{0x67, 0x22, 0x00},			/* 0e: VCLK157_5	*/
+	{0x6a, 0x22, 0x00},			/* 0f: VCLK162		*/
+	{0x4d, 0x4c, 0x80},			/* 10: VCLK154		*/
+	{0x68, 0x6f, 0x80},			/* 11: VCLK83.5		*/
+	{0x28, 0x49, 0x80},			/* 12: VCLK106.5	*/
+	{0x37, 0x49, 0x80},			/* 13: VCLK146.25	*/
+	{0x1f, 0x45, 0x80},			/* 14: VCLK148.5	*/
+	{0x47, 0x6c, 0x80},			/* 15: VCLK71		*/
+	{0x25, 0x65, 0x80},			/* 16: VCLK88.75	*/
+	{0x77, 0x58, 0x80},			/* 17: VCLK119		*/
+	{0x32, 0x67, 0x80},			/* 18: VCLK85_5		*/
+	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
+	{0x3b, 0x2c, 0x81},			/* 1a: VCLK118_25	*/
+};
diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
index 1e541498ea67..b12fec161f2b 100644
--- a/drivers/gpu/drm/ast/ast_2500.c
+++ b/drivers/gpu/drm/ast/ast_2500.c
@@ -567,3 +567,37 @@ int ast_2500_post(struct ast_device *ast)
 
 	return 0;
 }
+
+/*
+ * Mode setting
+ */
+
+const struct ast_vbios_dclk_info ast_2500_dclk_table[] = {
+	{0x2c, 0xe7, 0x03},			/* 00: VCLK25_175	*/
+	{0x95, 0x62, 0x03},			/* 01: VCLK28_322	*/
+	{0x67, 0x63, 0x01},			/* 02: VCLK31_5		*/
+	{0x76, 0x63, 0x01},			/* 03: VCLK36		*/
+	{0xee, 0x67, 0x01},			/* 04: VCLK40		*/
+	{0x82, 0x62, 0x01},			/* 05: VCLK49_5		*/
+	{0xc6, 0x64, 0x01},			/* 06: VCLK50		*/
+	{0x94, 0x62, 0x01},			/* 07: VCLK56_25	*/
+	{0x80, 0x64, 0x00},			/* 08: VCLK65		*/
+	{0x7b, 0x63, 0x00},			/* 09: VCLK75		*/
+	{0x67, 0x62, 0x00},			/* 0a: VCLK78_75	*/
+	{0x7c, 0x62, 0x00},			/* 0b: VCLK94_5		*/
+	{0x8e, 0x62, 0x00},			/* 0c: VCLK108		*/
+	{0x85, 0x24, 0x00},			/* 0d: VCLK135		*/
+	{0x67, 0x22, 0x00},			/* 0e: VCLK157_5	*/
+	{0x6a, 0x22, 0x00},			/* 0f: VCLK162		*/
+	{0x4d, 0x4c, 0x80},			/* 10: VCLK154		*/
+	{0x68, 0x6f, 0x80},			/* 11: VCLK83.5		*/
+	{0x28, 0x49, 0x80},			/* 12: VCLK106.5	*/
+	{0x37, 0x49, 0x80},			/* 13: VCLK146.25	*/
+	{0x1f, 0x45, 0x80},			/* 14: VCLK148.5	*/
+	{0x47, 0x6c, 0x80},			/* 15: VCLK71		*/
+	{0x25, 0x65, 0x80},			/* 16: VCLK88.75	*/
+	{0x58, 0x01, 0x42},			/* 17: VCLK119		*/
+	{0x32, 0x67, 0x80},			/* 18: VCLK85_5		*/
+	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
+	{0x44, 0x20, 0x43},			/* 1a: VCLK118_25	*/
+};
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index c15aef014f69..482d1eb79d64 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -417,6 +417,7 @@ int ast_mm_init(struct ast_device *ast);
 
 /* ast_2000.c */
 int ast_2000_post(struct ast_device *ast);
+extern const struct ast_vbios_dclk_info ast_2000_dclk_table[];
 
 /* ast_2100.c */
 int ast_2100_post(struct ast_device *ast);
@@ -427,6 +428,7 @@ int ast_2300_post(struct ast_device *ast);
 /* ast_2500.c */
 void ast_2500_patch_ahb(void __iomem *regs);
 int ast_2500_post(struct ast_device *ast);
+extern const struct ast_vbios_dclk_info ast_2500_dclk_table[];
 
 /* ast_2600.c */
 int ast_2600_post(struct ast_device *ast);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index b4e8edc7c767..6b9d510c509d 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -373,9 +373,9 @@ static void ast_set_dclk_reg(struct ast_device *ast,
 	const struct ast_vbios_dclk_info *clk_info;
 
 	if (IS_AST_GEN6(ast) || IS_AST_GEN7(ast))
-		clk_info = &dclk_table_ast2500[vmode->dclk_index];
+		clk_info = &ast_2500_dclk_table[vmode->dclk_index];
 	else
-		clk_info = &dclk_table[vmode->dclk_index];
+		clk_info = &ast_2000_dclk_table[vmode->dclk_index];
 
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc0, 0x00, clk_info->param1);
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc1, 0x00, clk_info->param2);
diff --git a/drivers/gpu/drm/ast/ast_tables.h b/drivers/gpu/drm/ast/ast_tables.h
index f1c9f7e1f1fc..7da5b5c60f41 100644
--- a/drivers/gpu/drm/ast/ast_tables.h
+++ b/drivers/gpu/drm/ast/ast_tables.h
@@ -33,66 +33,6 @@
 #define HiCModeIndex		3
 #define TrueCModeIndex		4
 
-static const struct ast_vbios_dclk_info dclk_table[] = {
-	{0x2C, 0xE7, 0x03},			/* 00: VCLK25_175	*/
-	{0x95, 0x62, 0x03},			/* 01: VCLK28_322	*/
-	{0x67, 0x63, 0x01},			/* 02: VCLK31_5		*/
-	{0x76, 0x63, 0x01},			/* 03: VCLK36		*/
-	{0xEE, 0x67, 0x01},			/* 04: VCLK40		*/
-	{0x82, 0x62, 0x01},			/* 05: VCLK49_5		*/
-	{0xC6, 0x64, 0x01},			/* 06: VCLK50		*/
-	{0x94, 0x62, 0x01},			/* 07: VCLK56_25	*/
-	{0x80, 0x64, 0x00},			/* 08: VCLK65		*/
-	{0x7B, 0x63, 0x00},			/* 09: VCLK75		*/
-	{0x67, 0x62, 0x00},			/* 0A: VCLK78_75	*/
-	{0x7C, 0x62, 0x00},			/* 0B: VCLK94_5		*/
-	{0x8E, 0x62, 0x00},			/* 0C: VCLK108		*/
-	{0x85, 0x24, 0x00},			/* 0D: VCLK135		*/
-	{0x67, 0x22, 0x00},			/* 0E: VCLK157_5	*/
-	{0x6A, 0x22, 0x00},			/* 0F: VCLK162		*/
-	{0x4d, 0x4c, 0x80},			/* 10: VCLK154		*/
-	{0x68, 0x6f, 0x80},			/* 11: VCLK83.5		*/
-	{0x28, 0x49, 0x80},			/* 12: VCLK106.5	*/
-	{0x37, 0x49, 0x80},			/* 13: VCLK146.25	*/
-	{0x1f, 0x45, 0x80},			/* 14: VCLK148.5	*/
-	{0x47, 0x6c, 0x80},			/* 15: VCLK71		*/
-	{0x25, 0x65, 0x80},			/* 16: VCLK88.75	*/
-	{0x77, 0x58, 0x80},			/* 17: VCLK119		*/
-	{0x32, 0x67, 0x80},			/* 18: VCLK85_5		*/
-	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
-	{0x3b, 0x2c, 0x81},			/* 1A: VCLK118_25	*/
-};
-
-static const struct ast_vbios_dclk_info dclk_table_ast2500[] = {
-	{0x2C, 0xE7, 0x03},			/* 00: VCLK25_175	*/
-	{0x95, 0x62, 0x03},			/* 01: VCLK28_322	*/
-	{0x67, 0x63, 0x01},			/* 02: VCLK31_5		*/
-	{0x76, 0x63, 0x01},			/* 03: VCLK36		*/
-	{0xEE, 0x67, 0x01},			/* 04: VCLK40		*/
-	{0x82, 0x62, 0x01},			/* 05: VCLK49_5		*/
-	{0xC6, 0x64, 0x01},			/* 06: VCLK50		*/
-	{0x94, 0x62, 0x01},			/* 07: VCLK56_25	*/
-	{0x80, 0x64, 0x00},			/* 08: VCLK65		*/
-	{0x7B, 0x63, 0x00},			/* 09: VCLK75		*/
-	{0x67, 0x62, 0x00},			/* 0A: VCLK78_75	*/
-	{0x7C, 0x62, 0x00},			/* 0B: VCLK94_5		*/
-	{0x8E, 0x62, 0x00},			/* 0C: VCLK108		*/
-	{0x85, 0x24, 0x00},			/* 0D: VCLK135		*/
-	{0x67, 0x22, 0x00},			/* 0E: VCLK157_5	*/
-	{0x6A, 0x22, 0x00},			/* 0F: VCLK162		*/
-	{0x4d, 0x4c, 0x80},			/* 10: VCLK154		*/
-	{0x68, 0x6f, 0x80},			/* 11: VCLK83.5		*/
-	{0x28, 0x49, 0x80},			/* 12: VCLK106.5	*/
-	{0x37, 0x49, 0x80},			/* 13: VCLK146.25	*/
-	{0x1f, 0x45, 0x80},			/* 14: VCLK148.5	*/
-	{0x47, 0x6c, 0x80},			/* 15: VCLK71		*/
-	{0x25, 0x65, 0x80},			/* 16: VCLK88.75	*/
-	{0x58, 0x01, 0x42},			/* 17: VCLK119		*/
-	{0x32, 0x67, 0x80},			/* 18: VCLK85_5		*/
-	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
-	{0x44, 0x20, 0x43},			/* 1A: VCLK118_25	*/
-};
-
 static const struct ast_vbios_stdtable vbios_stdtable[] = {
 	/* MD_2_3_400 */
 	{
-- 
2.51.0

