Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E4BAF58DB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 15:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C54A10E707;
	Wed,  2 Jul 2025 13:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BBlms17d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NIZr98gt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BBlms17d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NIZr98gt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4E410E707
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 13:28:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1CE1A1F45F;
 Wed,  2 Jul 2025 13:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9JNud8fmynA3Jdnss/tWGMshpA+2Tkzfvy7VpWFrkos=;
 b=BBlms17dR3Yw1q22FcirIFt6yWznkXT/UcTgv9kbYFWYJRqZTSI1G/g46fCkzldqZmNOXU
 Gap7fDBpa1DjYJv0GO6jZB1Lo0KasigQetlYCdgKPF2HoOetGF2n5zuw+aAzxbFBXSm3vV
 E8uFvlOFsnCS96jufIGpRnr8IZ6p8yM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9JNud8fmynA3Jdnss/tWGMshpA+2Tkzfvy7VpWFrkos=;
 b=NIZr98gtUXfYWVbFOMR0y7uf0757H42QA1JU+X/LTlWFzE1DIQ6lnVpaiEQbJxceM0W2Wn
 jpO2ivY4LmrbkbBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BBlms17d;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NIZr98gt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9JNud8fmynA3Jdnss/tWGMshpA+2Tkzfvy7VpWFrkos=;
 b=BBlms17dR3Yw1q22FcirIFt6yWznkXT/UcTgv9kbYFWYJRqZTSI1G/g46fCkzldqZmNOXU
 Gap7fDBpa1DjYJv0GO6jZB1Lo0KasigQetlYCdgKPF2HoOetGF2n5zuw+aAzxbFBXSm3vV
 E8uFvlOFsnCS96jufIGpRnr8IZ6p8yM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9JNud8fmynA3Jdnss/tWGMshpA+2Tkzfvy7VpWFrkos=;
 b=NIZr98gtUXfYWVbFOMR0y7uf0757H42QA1JU+X/LTlWFzE1DIQ6lnVpaiEQbJxceM0W2Wn
 jpO2ivY4LmrbkbBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9C1413A54;
 Wed,  2 Jul 2025 13:27:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UECrN8szZWj0MAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Jul 2025 13:27:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/10] drm/ast: Gen7: Switch default registers to gen4+ state
Date: Wed,  2 Jul 2025 15:12:58 +0200
Message-ID: <20250702132431.249329-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132431.249329-1-tzimmermann@suse.de>
References: <20250702132431.249329-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1CE1A1F45F
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
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email];
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

Change the default register settings for Gen7 to mach Gen4 and
later. Gen7 currently uses the settings for Gen1, which is most
likely incorrect.

Using Gen4+ settings enables E2M linear-access modes in VGACRA2.
It appears to be related to the chip's PCIE2MBOX feature, which
is unused.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2600.c | 33 +--------------------------------
 drivers/gpu/drm/ast/ast_post.h |  3 ---
 2 files changed, 1 insertion(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
index a426a981949e..3a3ef21684ad 100644
--- a/drivers/gpu/drm/ast/ast_2600.c
+++ b/drivers/gpu/drm/ast/ast_2600.c
@@ -33,42 +33,11 @@
  * POST
  */
 
-void ast_2600_set_def_ext_reg(struct ast_device *ast)
-{
-	static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
-	u8 i, index, reg;
-	const u8 *ext_reg_info;
-
-	/* reset scratch */
-	for (i = 0x81; i <= 0x9f; i++)
-		ast_set_index_reg(ast, AST_IO_VGACRI, i, 0x00);
-
-	ext_reg_info = extreginfo;
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
-	reg |= 0x20;
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
-}
-
 int ast_2600_post(struct ast_device *ast)
 {
 	int ret;
 
-	ast_2600_set_def_ext_reg(ast);
+	ast_2300_set_def_ext_reg(ast);
 
 	if (ast->tx_chip == AST_TX_ASTDP) {
 		ret = ast_dp_launch(ast);
diff --git a/drivers/gpu/drm/ast/ast_post.h b/drivers/gpu/drm/ast/ast_post.h
index 9f3108ddeae8..aa5d247bebe8 100644
--- a/drivers/gpu/drm/ast/ast_post.h
+++ b/drivers/gpu/drm/ast/ast_post.h
@@ -47,7 +47,4 @@ void ast_2000_set_def_ext_reg(struct ast_device *ast);
 /* ast_2300.c */
 void ast_2300_set_def_ext_reg(struct ast_device *ast);
 
-/* ast_2600.c */
-void ast_2600_set_def_ext_reg(struct ast_device *ast);
-
 #endif
-- 
2.50.0

