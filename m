Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16FEAF58D9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 15:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D5710E700;
	Wed,  2 Jul 2025 13:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="12i//v0c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ulWky2jW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="12i//v0c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ulWky2jW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0CF10E707
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 13:28:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AA96D1F45E;
 Wed,  2 Jul 2025 13:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAz0wY9H8S5FhNhk3wyjBd6FhT8NeyiW6jQlWbB/+Jg=;
 b=12i//v0cec5DgkJij9aMzmRCi3fpiXqi2RgBI4nd9zjM0oBwF8OuyeokR6l/GREMd6Ehse
 fTiZ3ZHS+tTwCrmdcmhihX1cnAGbhrG/QvoJbpc3qHtOUTmKe5HQdVanGmH8OaVQT+A78n
 sPgrbhGC4KiRuKcmcgaR7oy9hX5ANRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAz0wY9H8S5FhNhk3wyjBd6FhT8NeyiW6jQlWbB/+Jg=;
 b=ulWky2jWps83PztMUMw1+UFDzn9NysoaSv/RL8q18nFv8QIV/rVgRp4TvPlCJsnCZQy60H
 PhoNpPdB+ecDlDAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="12i//v0c";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ulWky2jW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAz0wY9H8S5FhNhk3wyjBd6FhT8NeyiW6jQlWbB/+Jg=;
 b=12i//v0cec5DgkJij9aMzmRCi3fpiXqi2RgBI4nd9zjM0oBwF8OuyeokR6l/GREMd6Ehse
 fTiZ3ZHS+tTwCrmdcmhihX1cnAGbhrG/QvoJbpc3qHtOUTmKe5HQdVanGmH8OaVQT+A78n
 sPgrbhGC4KiRuKcmcgaR7oy9hX5ANRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAz0wY9H8S5FhNhk3wyjBd6FhT8NeyiW6jQlWbB/+Jg=;
 b=ulWky2jWps83PztMUMw1+UFDzn9NysoaSv/RL8q18nFv8QIV/rVgRp4TvPlCJsnCZQy60H
 PhoNpPdB+ecDlDAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82E4813A54;
 Wed,  2 Jul 2025 13:27:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QJKbHsszZWj0MAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Jul 2025 13:27:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/10] drm/ast: Split ast_set_def_ext_reg() by chip generation
Date: Wed,  2 Jul 2025 15:12:56 +0200
Message-ID: <20250702132431.249329-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132431.249329-1-tzimmermann@suse.de>
References: <20250702132431.249329-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AA96D1F45E
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
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

Duplicate ast_set_def_ext_reg() for individual chip generations
and move call it into per-chip source files. Remove the original
code. AST2100 and AST2500 reuse the function from earlier chips.
AST2600 appears to be incorrect as it uses an older function. Keep
this behavior for now.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2000.c | 32 +++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_2100.c |  2 ++
 drivers/gpu/drm/ast/ast_2300.c | 33 ++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_2500.c |  2 ++
 drivers/gpu/drm/ast/ast_2600.c | 33 ++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_post.c | 40 ----------------------------------
 drivers/gpu/drm/ast/ast_post.h |  9 ++++++++
 7 files changed, 111 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
index 93f13ecc74dc..41c2aa1e425a 100644
--- a/drivers/gpu/drm/ast/ast_2000.c
+++ b/drivers/gpu/drm/ast/ast_2000.c
@@ -35,6 +35,36 @@
  * POST
  */
 
+void ast_2000_set_def_ext_reg(struct ast_device *ast)
+{
+	static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
+	u8 i, index, reg;
+	const u8 *ext_reg_info;
+
+	/* reset scratch */
+	for (i = 0x81; i <= 0x9f; i++)
+		ast_set_index_reg(ast, AST_IO_VGACRI, i, 0x00);
+
+	ext_reg_info = extreginfo;
+	index = 0xa0;
+	while (*ext_reg_info != 0xff) {
+		ast_set_index_reg_mask(ast, AST_IO_VGACRI, index, 0x00, *ext_reg_info);
+		index++;
+		ext_reg_info++;
+	}
+
+	/* disable standard IO/MEM decode if secondary */
+	/* ast_set_index_reg-mask(ast, AST_IO_VGACRI, 0xa1, 0xff, 0x3); */
+
+	/* Set Ext. Default */
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x8c, 0x00, 0x01);
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb7, 0x00, 0x00);
+
+	/* Enable RAMDAC for A1 */
+	reg = 0x04;
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
+}
+
 static const struct ast_dramstruct ast2000_dram_table_data[] = {
 	{ 0x0108, 0x00000000 },
 	{ 0x0120, 0x00004a21 },
@@ -104,6 +134,8 @@ static void ast_post_chip_2000(struct ast_device *ast)
 
 int ast_2000_post(struct ast_device *ast)
 {
+	ast_2000_set_def_ext_reg(ast);
+
 	if (ast->config_mode == ast_use_p2a) {
 		ast_post_chip_2000(ast);
 	} else {
diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
index 1cabac647584..477ee15eff5d 100644
--- a/drivers/gpu/drm/ast/ast_2100.c
+++ b/drivers/gpu/drm/ast/ast_2100.c
@@ -333,6 +333,8 @@ static void ast_post_chip_2100(struct ast_device *ast)
 
 int ast_2100_post(struct ast_device *ast)
 {
+	ast_2000_set_def_ext_reg(ast);
+
 	if (ast->config_mode == ast_use_p2a) {
 		ast_post_chip_2100(ast);
 	} else {
diff --git a/drivers/gpu/drm/ast/ast_2300.c b/drivers/gpu/drm/ast/ast_2300.c
index 7a2c3fde09d2..dc2a32244689 100644
--- a/drivers/gpu/drm/ast/ast_2300.c
+++ b/drivers/gpu/drm/ast/ast_2300.c
@@ -35,6 +35,37 @@
  *  POST
  */
 
+void ast_2300_set_def_ext_reg(struct ast_device *ast)
+{
+	static const u8 extreginfo[] = { 0x0f, 0x04, 0x1f, 0xff };
+	u8 i, index, reg;
+	const u8 *ext_reg_info;
+
+	/* reset scratch */
+	for (i = 0x81; i <= 0x9f; i++)
+		ast_set_index_reg(ast, AST_IO_VGACRI, i, 0x00);
+
+	ext_reg_info = extreginfo;
+	index = 0xa0;
+	while (*ext_reg_info != 0xff) {
+		ast_set_index_reg_mask(ast, AST_IO_VGACRI, index, 0x00, *ext_reg_info);
+		index++;
+		ext_reg_info++;
+	}
+
+	/* disable standard IO/MEM decode if secondary */
+	/* ast_set_index_reg-mask(ast, AST_IO_VGACRI, 0xa1, 0xff, 0x3); */
+
+	/* Set Ext. Default */
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x8c, 0x00, 0x01);
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb7, 0x00, 0x00);
+
+	/* Enable RAMDAC for A1 */
+	reg = 0x04;
+	reg |= 0x20;
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
+}
+
 /* AST 2300 DRAM settings */
 #define AST_DDR3 0
 #define AST_DDR2 1
@@ -1281,6 +1312,8 @@ static void ast_post_chip_2300(struct ast_device *ast)
 
 int ast_2300_post(struct ast_device *ast)
 {
+	ast_2300_set_def_ext_reg(ast);
+
 	if (ast->config_mode == ast_use_p2a) {
 		ast_post_chip_2300(ast);
 		ast_init_3rdtx(ast);
diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
index e5b3e0c63222..1e541498ea67 100644
--- a/drivers/gpu/drm/ast/ast_2500.c
+++ b/drivers/gpu/drm/ast/ast_2500.c
@@ -554,6 +554,8 @@ static void ast_post_chip_2500(struct ast_device *ast)
 
 int ast_2500_post(struct ast_device *ast)
 {
+	ast_2300_set_def_ext_reg(ast);
+
 	if (ast->config_mode == ast_use_p2a) {
 		ast_post_chip_2500(ast);
 	} else {
diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
index 556571efa0b2..f9b96c631d4c 100644
--- a/drivers/gpu/drm/ast/ast_2600.c
+++ b/drivers/gpu/drm/ast/ast_2600.c
@@ -27,15 +27,48 @@
  */
 
 #include "ast_drv.h"
+#include "ast_post.h"
 
 /*
  * POST
  */
 
+void ast_2600_set_def_ext_reg(struct ast_device *ast)
+{
+	static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
+	u8 i, index, reg;
+	const u8 *ext_reg_info;
+
+	/* reset scratch */
+	for (i = 0x81; i <= 0x9f; i++)
+		ast_set_index_reg(ast, AST_IO_VGACRI, i, 0x00);
+
+	ext_reg_info = extreginfo;
+	index = 0xa0;
+	while (*ext_reg_info != 0xff) {
+		ast_set_index_reg_mask(ast, AST_IO_VGACRI, index, 0x00, *ext_reg_info);
+		index++;
+		ext_reg_info++;
+	}
+
+	/* disable standard IO/MEM decode if secondary */
+	/* ast_set_index_reg-mask(ast, AST_IO_VGACRI, 0xa1, 0xff, 0x3); */
+
+	/* Set Ext. Default */
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x8c, 0x00, 0x01);
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb7, 0x00, 0x00);
+
+	/* Enable RAMDAC for A1 */
+	reg = 0x04;
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
+}
+
 int ast_2600_post(struct ast_device *ast)
 {
 	int ret;
 
+	ast_2600_set_def_ext_reg(ast);
+
 	if (ast->tx_chip == AST_TX_ASTDP) {
 		ret = ast_dp_launch(ast);
 		if (ret)
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 8e575e713f19..b72914dbed38 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -34,44 +34,6 @@
 #include "ast_drv.h"
 #include "ast_post.h"
 
-static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
-static const u8 extreginfo_ast2300[] = { 0x0f, 0x04, 0x1f, 0xff };
-
-static void ast_set_def_ext_reg(struct ast_device *ast)
-{
-	u8 i, index, reg;
-	const u8 *ext_reg_info;
-
-	/* reset scratch */
-	for (i = 0x81; i <= 0x9f; i++)
-		ast_set_index_reg(ast, AST_IO_VGACRI, i, 0x00);
-
-	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast))
-		ext_reg_info = extreginfo_ast2300;
-	else
-		ext_reg_info = extreginfo;
-
-	index = 0xa0;
-	while (*ext_reg_info != 0xff) {
-		ast_set_index_reg_mask(ast, AST_IO_VGACRI, index, 0x00, *ext_reg_info);
-		index++;
-		ext_reg_info++;
-	}
-
-	/* disable standard IO/MEM decode if secondary */
-	/* ast_set_index_reg-mask(ast, AST_IO_VGACRI, 0xa1, 0xff, 0x3); */
-
-	/* Set Ext. Default */
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x8c, 0x00, 0x01);
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb7, 0x00, 0x00);
-
-	/* Enable RAMDAC for A1 */
-	reg = 0x04;
-	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast))
-		reg |= 0x20;
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
-}
-
 u32 __ast_mindwm(void __iomem *regs, u32 r)
 {
 	u32 data;
@@ -114,8 +76,6 @@ int ast_post_gpu(struct ast_device *ast)
 {
 	int ret;
 
-	ast_set_def_ext_reg(ast);
-
 	if (AST_GEN(ast) >= 7) {
 		ret = ast_2600_post(ast);
 		if (ret)
diff --git a/drivers/gpu/drm/ast/ast_post.h b/drivers/gpu/drm/ast/ast_post.h
index 44136856952f..9f3108ddeae8 100644
--- a/drivers/gpu/drm/ast/ast_post.h
+++ b/drivers/gpu/drm/ast/ast_post.h
@@ -41,4 +41,13 @@ void __ast_moutdwm(void __iomem *regs, u32 r, u32 v);
 bool mmc_test(struct ast_device *ast, u32 datagen, u8 test_ctl);
 bool mmc_test_burst(struct ast_device *ast, u32 datagen);
 
+/* ast_2000.c */
+void ast_2000_set_def_ext_reg(struct ast_device *ast);
+
+/* ast_2300.c */
+void ast_2300_set_def_ext_reg(struct ast_device *ast);
+
+/* ast_2600.c */
+void ast_2600_set_def_ext_reg(struct ast_device *ast);
+
 #endif
-- 
2.50.0

