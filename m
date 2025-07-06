Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34B1AF58D7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 15:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40DF10E70D;
	Wed,  2 Jul 2025 13:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LX3yte5k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6iLRUdDs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LX3yte5k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6iLRUdDs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20C410E70D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 13:27:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 87C951F45B;
 Wed,  2 Jul 2025 13:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQ6xprRbuXTVWTpAZ3AscGaImh5RuqmF9q9E+uPWBTQ=;
 b=LX3yte5kJoUgzBbsOrZRDUeU6xIloOsuayeGbvsryK6F8/2dHfjzRQnK9qpG/0NFXi4EAL
 /78oyMnzts+wdhSrVzK4v8SrG/gi8RDPO4JC2LGFDm4zEh+0JM7DKoJkDS7RTEa8uPZv1e
 CmKjb16NtYCGPrt0ZBZZYTGbSvNxe/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQ6xprRbuXTVWTpAZ3AscGaImh5RuqmF9q9E+uPWBTQ=;
 b=6iLRUdDsXsaYtHFMJACBKlcQ+5ZLpsIhjKbP/Q9Hql/QBZp4M1jbHUw3J0IOmTbjxs+jMX
 I5K4d2tLhbfuAiBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LX3yte5k;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6iLRUdDs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQ6xprRbuXTVWTpAZ3AscGaImh5RuqmF9q9E+uPWBTQ=;
 b=LX3yte5kJoUgzBbsOrZRDUeU6xIloOsuayeGbvsryK6F8/2dHfjzRQnK9qpG/0NFXi4EAL
 /78oyMnzts+wdhSrVzK4v8SrG/gi8RDPO4JC2LGFDm4zEh+0JM7DKoJkDS7RTEa8uPZv1e
 CmKjb16NtYCGPrt0ZBZZYTGbSvNxe/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQ6xprRbuXTVWTpAZ3AscGaImh5RuqmF9q9E+uPWBTQ=;
 b=6iLRUdDsXsaYtHFMJACBKlcQ+5ZLpsIhjKbP/Q9Hql/QBZp4M1jbHUw3J0IOmTbjxs+jMX
 I5K4d2tLhbfuAiBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 546201369C;
 Wed,  2 Jul 2025 13:27:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2ENiE8szZWj0MAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Jul 2025 13:27:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/10] drm/ast: Handle known struct ast_dramstruct with helpers
Date: Wed,  2 Jul 2025 15:12:55 +0200
Message-ID: <20250702132431.249329-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132431.249329-1-tzimmermann@suse.de>
References: <20250702132431.249329-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 87C951F45B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Most of struct ast_dramstruct stores hardware state. Some index
values have known or special meaning. The known values are

- 0xffff - Terminal entry in the array
- 0xff00 - Delays the programming for usecs
- 0x0004 - Sets the type of DRAM

Add constants and helper macros for these cases. Also add a helper
macro for testing. Update Gen1 and Gen2+ accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2000.c | 16 ++++++++--------
 drivers/gpu/drm/ast/ast_2100.c | 22 +++++++++++-----------
 drivers/gpu/drm/ast/ast_post.h | 22 ++++++++++++++++++++++
 3 files changed, 41 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
index b2ad2ea5056b..93f13ecc74dc 100644
--- a/drivers/gpu/drm/ast/ast_2000.c
+++ b/drivers/gpu/drm/ast/ast_2000.c
@@ -38,9 +38,9 @@
 static const struct ast_dramstruct ast2000_dram_table_data[] = {
 	{ 0x0108, 0x00000000 },
 	{ 0x0120, 0x00004a21 },
-	{ 0xFF00, 0x00000043 },
+	AST_DRAMSTRUCT_UDELAY(67u),
 	{ 0x0000, 0xFFFFFFFF },
-	{ 0x0004, 0x00000089 },
+	AST_DRAMSTRUCT_INIT(DRAM_TYPE, 0x00000089),
 	{ 0x0008, 0x22331353 },
 	{ 0x000C, 0x0d07000b },
 	{ 0x0010, 0x11113333 },
@@ -49,18 +49,18 @@ static const struct ast_dramstruct ast2000_dram_table_data[] = {
 	{ 0x0024, 0x00000001 },
 	{ 0x001C, 0x00000000 },
 	{ 0x0014, 0x00000003 },
-	{ 0xFF00, 0x00000043 },
+	AST_DRAMSTRUCT_UDELAY(67u),
 	{ 0x0018, 0x00000131 },
 	{ 0x0014, 0x00000001 },
-	{ 0xFF00, 0x00000043 },
+	AST_DRAMSTRUCT_UDELAY(67u),
 	{ 0x0018, 0x00000031 },
 	{ 0x0014, 0x00000001 },
-	{ 0xFF00, 0x00000043 },
+	AST_DRAMSTRUCT_UDELAY(67u),
 	{ 0x0028, 0x1e0828f1 },
 	{ 0x0024, 0x00000003 },
 	{ 0x002C, 0x1f0f28fb },
 	{ 0x0030, 0xFFFFFE01 },
-	{ 0xFFFF, 0xFFFFFFFF }
+	AST_DRAMSTRUCT_INVALID,
 };
 
 static void ast_post_chip_2000(struct ast_device *ast)
@@ -81,8 +81,8 @@ static void ast_post_chip_2000(struct ast_device *ast)
 			;
 		} while (ast_read32(ast, 0x10100) != 0xa8);
 
-		while (dram_reg_info->index != 0xffff) {
-			if (dram_reg_info->index == 0xff00) {/* delay fn */
+		while (!AST_DRAMSTRUCT_IS(dram_reg_info, INVALID)) {
+			if (AST_DRAMSTRUCT_IS(dram_reg_info, UDELAY)) {
 				for (i = 0; i < 15; i++)
 					udelay(dram_reg_info->data);
 			} else {
diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
index ee40f3911ca4..1cabac647584 100644
--- a/drivers/gpu/drm/ast/ast_2100.c
+++ b/drivers/gpu/drm/ast/ast_2100.c
@@ -38,11 +38,11 @@
 static const struct ast_dramstruct ast1100_dram_table_data[] = {
 	{ 0x2000, 0x1688a8a8 },
 	{ 0x2020, 0x000041f0 },
-	{ 0xFF00, 0x00000043 },
+	AST_DRAMSTRUCT_UDELAY(67u),
 	{ 0x0000, 0xfc600309 },
 	{ 0x006C, 0x00909090 },
 	{ 0x0064, 0x00050000 },
-	{ 0x0004, 0x00000585 },
+	AST_DRAMSTRUCT_INIT(DRAM_TYPE, 0x00000585),
 	{ 0x0008, 0x0011030f },
 	{ 0x0010, 0x22201724 },
 	{ 0x0018, 0x1e29011a },
@@ -68,7 +68,7 @@ static const struct ast_dramstruct ast1100_dram_table_data[] = {
 	{ 0x0078, 0x00000000 },
 	{ 0x007C, 0x00000000 },
 	{ 0x0034, 0x00000001 },
-	{ 0xFF00, 0x00000043 },
+	AST_DRAMSTRUCT_UDELAY(67u),
 	{ 0x002C, 0x00000732 },
 	{ 0x0030, 0x00000040 },
 	{ 0x0028, 0x00000005 },
@@ -85,17 +85,17 @@ static const struct ast_dramstruct ast1100_dram_table_data[] = {
 	{ 0x000C, 0x00005a21 },
 	{ 0x0034, 0x00007c03 },
 	{ 0x0120, 0x00004c41 },
-	{ 0xffff, 0xffffffff },
+	AST_DRAMSTRUCT_INVALID,
 };
 
 static const struct ast_dramstruct ast2100_dram_table_data[] = {
 	{ 0x2000, 0x1688a8a8 },
 	{ 0x2020, 0x00004120 },
-	{ 0xFF00, 0x00000043 },
+	AST_DRAMSTRUCT_UDELAY(67u),
 	{ 0x0000, 0xfc600309 },
 	{ 0x006C, 0x00909090 },
 	{ 0x0064, 0x00070000 },
-	{ 0x0004, 0x00000489 },
+	AST_DRAMSTRUCT_INIT(DRAM_TYPE, 0x00000489),
 	{ 0x0008, 0x0011030f },
 	{ 0x0010, 0x32302926 },
 	{ 0x0018, 0x274c0122 },
@@ -121,7 +121,7 @@ static const struct ast_dramstruct ast2100_dram_table_data[] = {
 	{ 0x0078, 0x00000000 },
 	{ 0x007C, 0x00000000 },
 	{ 0x0034, 0x00000001 },
-	{ 0xFF00, 0x00000043 },
+	AST_DRAMSTRUCT_UDELAY(67u),
 	{ 0x002C, 0x00000942 },
 	{ 0x0030, 0x00000040 },
 	{ 0x0028, 0x00000005 },
@@ -138,7 +138,7 @@ static const struct ast_dramstruct ast2100_dram_table_data[] = {
 	{ 0x000C, 0x00005a21 },
 	{ 0x0034, 0x00007c03 },
 	{ 0x0120, 0x00005061 },
-	{ 0xffff, 0xffffffff },
+	AST_DRAMSTRUCT_INVALID,
 };
 
 /*
@@ -287,11 +287,11 @@ static void ast_post_chip_2100(struct ast_device *ast)
 			;
 		} while (ast_read32(ast, 0x10000) != 0x01);
 
-		while (dram_reg_info->index != 0xffff) {
-			if (dram_reg_info->index == 0xff00) {/* delay fn */
+		while (!AST_DRAMSTRUCT_IS(dram_reg_info, INVALID)) {
+			if (AST_DRAMSTRUCT_IS(dram_reg_info, UDELAY)) {
 				for (i = 0; i < 15; i++)
 					udelay(dram_reg_info->data);
-			} else if (dram_reg_info->index == 0x4) {
+			} else if (AST_DRAMSTRUCT_IS(dram_reg_info, DRAM_TYPE)) {
 				data = dram_reg_info->data;
 				if (ast->dram_type == AST_DRAM_1Gx16)
 					data = 0x00000d89;
diff --git a/drivers/gpu/drm/ast/ast_post.h b/drivers/gpu/drm/ast/ast_post.h
index 3a55c32a7eb7..44136856952f 100644
--- a/drivers/gpu/drm/ast/ast_post.h
+++ b/drivers/gpu/drm/ast/ast_post.h
@@ -3,6 +3,7 @@
 #ifndef AST_POST_H
 #define AST_POST_H
 
+#include <linux/limits.h>
 #include <linux/types.h>
 
 struct ast_device;
@@ -13,6 +14,27 @@ struct ast_dramstruct {
 	u32 data;
 };
 
+/* hardware fields */
+#define __AST_DRAMSTRUCT_DRAM_TYPE      0x0004
+
+/* control commands */
+#define __AST_DRAMSTRUCT_UDELAY         0xff00
+#define __AST_DRAMSTRUCT_INVALID        0xffff
+
+#define __AST_DRAMSTRUCT_INDEX(_name) \
+	(__AST_DRAMSTRUCT_ ## _name)
+
+#define AST_DRAMSTRUCT_INIT(_name, _value) \
+	{ __AST_DRAMSTRUCT_INDEX(_name), (_value) }
+
+#define AST_DRAMSTRUCT_UDELAY(_usecs) \
+	AST_DRAMSTRUCT_INIT(UDELAY, _usecs)
+#define AST_DRAMSTRUCT_INVALID \
+	AST_DRAMSTRUCT_INIT(INVALID, U32_MAX)
+
+#define AST_DRAMSTRUCT_IS(_entry, _name) \
+	((_entry)->index == __AST_DRAMSTRUCT_INDEX(_name))
+
 u32 __ast_mindwm(void __iomem *regs, u32 r);
 void __ast_moutdwm(void __iomem *regs, u32 r, u32 v);
 
-- 
2.50.0

