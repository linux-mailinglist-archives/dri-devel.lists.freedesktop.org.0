Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C689AFA685
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 18:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8949F10E3AC;
	Sun,  6 Jul 2025 16:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GXktXz65";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4uUngaFi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GXktXz65";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4uUngaFi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4CC10E3BC
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 16:28:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D086E1F449;
 Sun,  6 Jul 2025 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751819300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/kKJNdLZopbxvdOeWRjIDyZ1i8uJNe06uclONzjDAc=;
 b=GXktXz65XtOvlbOknCEU9qk8I0Nt8oMbLZ0KEgsZ7ZmENnctyhcq2clS/KIlZgfFSmt5r2
 cCQM2oTogQ16ZQZqIf4FoULwRSVtl2jlOc7fJz2otS6gZAtodigm8/0l/OuEpd9RhzJI+E
 SpJqbzU26nOauEfPiqcGXY8pplz3Eck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751819300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/kKJNdLZopbxvdOeWRjIDyZ1i8uJNe06uclONzjDAc=;
 b=4uUngaFifXTB0dCap6M38OiBo1xwoRprGZfnK4IDJsgni5tWn0Ph4fUVCrT2IMV2QqrgyX
 mLJbTjQN7iFxsoAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GXktXz65;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4uUngaFi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751819300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/kKJNdLZopbxvdOeWRjIDyZ1i8uJNe06uclONzjDAc=;
 b=GXktXz65XtOvlbOknCEU9qk8I0Nt8oMbLZ0KEgsZ7ZmENnctyhcq2clS/KIlZgfFSmt5r2
 cCQM2oTogQ16ZQZqIf4FoULwRSVtl2jlOc7fJz2otS6gZAtodigm8/0l/OuEpd9RhzJI+E
 SpJqbzU26nOauEfPiqcGXY8pplz3Eck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751819300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/kKJNdLZopbxvdOeWRjIDyZ1i8uJNe06uclONzjDAc=;
 b=4uUngaFifXTB0dCap6M38OiBo1xwoRprGZfnK4IDJsgni5tWn0Ph4fUVCrT2IMV2QqrgyX
 mLJbTjQN7iFxsoAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A843F13A7D;
 Sun,  6 Jul 2025 16:28:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0DTEJySkamjJSgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Jul 2025 16:28:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 06/10] drm/ast: Move struct ast_dramstruct to ast_post.h
Date: Sun,  6 Jul 2025 18:26:41 +0200
Message-ID: <20250706162816.211552-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250706162816.211552-1-tzimmermann@suse.de>
References: <20250706162816.211552-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D086E1F449
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
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

Declare struct ast_dramstruct in ast_post.h and remove its original
header file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_2000.c        |  2 +-
 drivers/gpu/drm/ast/ast_2100.c        |  2 +-
 drivers/gpu/drm/ast/ast_dram_tables.h | 11 -----------
 drivers/gpu/drm/ast/ast_post.h        |  6 ++++++
 4 files changed, 8 insertions(+), 13 deletions(-)
 delete mode 100644 drivers/gpu/drm/ast/ast_dram_tables.h

diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
index 099c90e1402f..b2ad2ea5056b 100644
--- a/drivers/gpu/drm/ast/ast_2000.c
+++ b/drivers/gpu/drm/ast/ast_2000.c
@@ -28,8 +28,8 @@
 
 #include <linux/delay.h>
 
-#include "ast_dram_tables.h"
 #include "ast_drv.h"
+#include "ast_post.h"
 
 /*
  * POST
diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
index f41c778e02da..ee40f3911ca4 100644
--- a/drivers/gpu/drm/ast/ast_2100.c
+++ b/drivers/gpu/drm/ast/ast_2100.c
@@ -28,8 +28,8 @@
 
 #include <linux/delay.h>
 
-#include "ast_dram_tables.h"
 #include "ast_drv.h"
+#include "ast_post.h"
 
 /*
  * POST
diff --git a/drivers/gpu/drm/ast/ast_dram_tables.h b/drivers/gpu/drm/ast/ast_dram_tables.h
deleted file mode 100644
index 6c191e2c4e6c..000000000000
--- a/drivers/gpu/drm/ast/ast_dram_tables.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef AST_DRAM_TABLES_H
-#define AST_DRAM_TABLES_H
-
-/* DRAM timing tables */
-struct ast_dramstruct {
-	u16 index;
-	u32 data;
-};
-
-#endif
diff --git a/drivers/gpu/drm/ast/ast_post.h b/drivers/gpu/drm/ast/ast_post.h
index 314fa0475c79..3a55c32a7eb7 100644
--- a/drivers/gpu/drm/ast/ast_post.h
+++ b/drivers/gpu/drm/ast/ast_post.h
@@ -7,6 +7,12 @@
 
 struct ast_device;
 
+/* DRAM timing tables */
+struct ast_dramstruct {
+	u16 index;
+	u32 data;
+};
+
 u32 __ast_mindwm(void __iomem *regs, u32 r);
 void __ast_moutdwm(void __iomem *regs, u32 r, u32 v);
 
-- 
2.50.0

