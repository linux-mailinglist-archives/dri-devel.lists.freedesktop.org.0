Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12062A500FA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AD710E7A2;
	Wed,  5 Mar 2025 13:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0f+yjPGP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YwzO9Mkr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0f+yjPGP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YwzO9Mkr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E04110E777
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:47:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2221D1F455;
 Wed,  5 Mar 2025 13:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741182420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MbZTiRTva+KnMECbr7+A5P96efrzXOtUzRnnr3nmRd4=;
 b=0f+yjPGPFzlyzgMbRbIaB7Rtaf0x2vz7j34O3hyt++7X6H/dDTTDtVIpT/fkvLZh0bMu4C
 yRnYSEKJc22g/XH0gRx7tTZmqVdDrFyY8OqggxDnYWc818Pt8+ayetAjwbRxjzKALUJBZE
 2JzT70RVXlg7cXJiwLHePFmG3jjUwNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741182420;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MbZTiRTva+KnMECbr7+A5P96efrzXOtUzRnnr3nmRd4=;
 b=YwzO9Mkr/Q1yrEezgiFL35jqSxBiKEN+Gja1Gye2x0xZ4u/1WB6bzQdBSvqnrA/AO4xB81
 gKd59sC1mFpu+5AQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0f+yjPGP;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YwzO9Mkr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741182420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MbZTiRTva+KnMECbr7+A5P96efrzXOtUzRnnr3nmRd4=;
 b=0f+yjPGPFzlyzgMbRbIaB7Rtaf0x2vz7j34O3hyt++7X6H/dDTTDtVIpT/fkvLZh0bMu4C
 yRnYSEKJc22g/XH0gRx7tTZmqVdDrFyY8OqggxDnYWc818Pt8+ayetAjwbRxjzKALUJBZE
 2JzT70RVXlg7cXJiwLHePFmG3jjUwNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741182420;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MbZTiRTva+KnMECbr7+A5P96efrzXOtUzRnnr3nmRd4=;
 b=YwzO9Mkr/Q1yrEezgiFL35jqSxBiKEN+Gja1Gye2x0xZ4u/1WB6bzQdBSvqnrA/AO4xB81
 gKd59sC1mFpu+5AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E6CF71366F;
 Wed,  5 Mar 2025 13:46:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SDL5NtNVyGfYQwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 13:46:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 7/7] drm/ast: cursor: Drop page alignment
Date: Wed,  5 Mar 2025 14:35:47 +0100
Message-ID: <20250305134401.60609-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305134401.60609-1-tzimmermann@suse.de>
References: <20250305134401.60609-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2221D1F455
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

The cursor scanout address requires alignment to a multiple of 8,
but does not require page alignment. Change the offset calculation
accordingly. Frees up a few more bytes for the primary framebuffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index f48207a45359..297aa4b54a65 100644
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

