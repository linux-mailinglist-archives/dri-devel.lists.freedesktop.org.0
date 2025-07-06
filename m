Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9999AFA684
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 18:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D7C10E3AF;
	Sun,  6 Jul 2025 16:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="E+/kYPrD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PzQTaDI8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E+/kYPrD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PzQTaDI8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4927910E3AF
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 16:28:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 753C3211B5;
 Sun,  6 Jul 2025 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751819301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrLb4ytxQOVwy2pfxWrDjmQ3QcCkUpn7bU+6xyU/6tM=;
 b=E+/kYPrDD99H5ivs/yj8NHh7TGBxZFPKjHt6oZCzXMkW8zrGHggbdPykGezAMVEw2jWIaM
 JrqJ2NPC5iMxSlJW2G/d5yhA4dcNmf3B8Z66Fp3BLhqbJW2MhFyXaVDmy7UjEplShxg3kz
 hNmnY4T6FHk+PgrQ2KnWWo+7M4TdxZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751819301;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrLb4ytxQOVwy2pfxWrDjmQ3QcCkUpn7bU+6xyU/6tM=;
 b=PzQTaDI8Vlm7eemHja6oqqpp+prd/zKiAF6zzoUb3OWUFggkJjhLbV1c3JfFMgOL7aL3vR
 aLAgxi1o9u1RFmAg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="E+/kYPrD";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PzQTaDI8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751819301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrLb4ytxQOVwy2pfxWrDjmQ3QcCkUpn7bU+6xyU/6tM=;
 b=E+/kYPrDD99H5ivs/yj8NHh7TGBxZFPKjHt6oZCzXMkW8zrGHggbdPykGezAMVEw2jWIaM
 JrqJ2NPC5iMxSlJW2G/d5yhA4dcNmf3B8Z66Fp3BLhqbJW2MhFyXaVDmy7UjEplShxg3kz
 hNmnY4T6FHk+PgrQ2KnWWo+7M4TdxZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751819301;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrLb4ytxQOVwy2pfxWrDjmQ3QcCkUpn7bU+6xyU/6tM=;
 b=PzQTaDI8Vlm7eemHja6oqqpp+prd/zKiAF6zzoUb3OWUFggkJjhLbV1c3JfFMgOL7aL3vR
 aLAgxi1o9u1RFmAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4274913A29;
 Sun,  6 Jul 2025 16:28:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2CHZDiWkamjJSgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Jul 2025 16:28:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 09/10] drm/ast: Gen7: Disable VGASR0[1] as on Gen4+
Date: Sun,  6 Jul 2025 18:26:44 +0200
Message-ID: <20250706162816.211552-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250706162816.211552-1-tzimmermann@suse.de>
References: <20250706162816.211552-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 R_RATELIMIT(0.00)[to_ip_from(RLshs48ja9yam3qja8i6gi8aeo)];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 753C3211B5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

Set VGACRB6[5], which disables asynchronous sequencer resets via
VGASR0[1]. This was most likely an oversight when adding support
for Gen7. Aligns Gen7 with the earlier Gen4+.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_2600.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
index 08614090068d..01fd0e2d96e1 100644
--- a/drivers/gpu/drm/ast/ast_2600.c
+++ b/drivers/gpu/drm/ast/ast_2600.c
@@ -60,6 +60,7 @@ void ast_2600_set_def_ext_reg(struct ast_device *ast)
 
 	/* Enable RAMDAC for A1 */
 	reg = 0x04;
+	reg |= 0x20;
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
 }
 
-- 
2.50.0

