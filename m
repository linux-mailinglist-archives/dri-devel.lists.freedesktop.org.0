Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C75A50508
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 17:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ABA10E80D;
	Wed,  5 Mar 2025 16:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="P2iEBeO1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UeiDKvKQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P2iEBeO1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UeiDKvKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2015110E80D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 16:35:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D3688211CD;
 Wed,  5 Mar 2025 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741192506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGdBRbRvOuGT82TjydmrfBspyITBxhWhTFdUHdfco1U=;
 b=P2iEBeO1Xrj7JR2KbQ6d6tKcoi2UksKL1S/EPNbfFp2usiDn/ubrntp/fyPd58UMQaetnO
 wSPkVyp9EqyZywFqxMItd88hHeaGsirKD4mCdTOaII/QCyK1pi0mIry4qRSIJc9ETf98L+
 szHlOYP6YaYBbrfcMLAlAEXmteEWKNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741192506;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGdBRbRvOuGT82TjydmrfBspyITBxhWhTFdUHdfco1U=;
 b=UeiDKvKQNNh8y6zqPON8z6JruoFSK/iFyswlYGoE+JWuacQAygOAUELXQqORsOGj2ZhwjC
 XIrzY+vzr3HlJIBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741192506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGdBRbRvOuGT82TjydmrfBspyITBxhWhTFdUHdfco1U=;
 b=P2iEBeO1Xrj7JR2KbQ6d6tKcoi2UksKL1S/EPNbfFp2usiDn/ubrntp/fyPd58UMQaetnO
 wSPkVyp9EqyZywFqxMItd88hHeaGsirKD4mCdTOaII/QCyK1pi0mIry4qRSIJc9ETf98L+
 szHlOYP6YaYBbrfcMLAlAEXmteEWKNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741192506;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGdBRbRvOuGT82TjydmrfBspyITBxhWhTFdUHdfco1U=;
 b=UeiDKvKQNNh8y6zqPON8z6JruoFSK/iFyswlYGoE+JWuacQAygOAUELXQqORsOGj2ZhwjC
 XIrzY+vzr3HlJIBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AEEE01399F;
 Wed,  5 Mar 2025 16:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2FxCKTp9yGfxfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 16:35:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 7/7] drm/ast: cursor: Drop page alignment
Date: Wed,  5 Mar 2025 17:30:46 +0100
Message-ID: <20250305163207.267650-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305163207.267650-1-tzimmermann@suse.de>
References: <20250305163207.267650-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
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

The cursor scanout address requires alignment to a multiple of 8,
but does not require page alignment. Change the offset calculation
accordingly. Frees up a few more bytes for the primary framebuffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index cb0c48d47207..5ee724bfd682 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -58,7 +58,7 @@ long ast_cursor_vram_offset(struct ast_device *ast)
 	if (size > ast->vram_size)
 		return -EINVAL;
 
-	return PAGE_ALIGN_DOWN(ast->vram_size - size);
+	return ALIGN_DOWN(ast->vram_size - size, SZ_8);
 }
 
 static u32 ast_cursor_calculate_checksum(const void *src, unsigned int width, unsigned int height)
-- 
2.48.1

