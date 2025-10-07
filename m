Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324B7BC1DCC
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CE310E6D2;
	Tue,  7 Oct 2025 15:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RRzeTLba";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mGZDCe1M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ErnWTePU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cxT5O7qw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B0D10E6CE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:06:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9604E33722;
 Tue,  7 Oct 2025 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759849591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXETO9adK4P4lhNu6fQRavzpIi3dnu1nWvNyUe45nkE=;
 b=RRzeTLbaEMv12HVIHCG6Zb0SXdnixuu/hY1tjr+T4T3oL6ogXroOFwbgx+XY20WXKal1TL
 hZ2ltrIQSIUsC3+URI8wTXGGXrwVBgyDxUvFrFQ+ZVlFowE/qNmJYOGjt54KSO0XBO9+Ip
 w+ZFcn93cugypwsWnzoQeay5Ls/cBZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759849591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXETO9adK4P4lhNu6fQRavzpIi3dnu1nWvNyUe45nkE=;
 b=mGZDCe1MUTAVGldOKd/PcXIqGDLNuGJMnSx2bOJsHKpk3EFF21oEI1gKHAhcK6AGgGGsb7
 onHfh2k4MbD4zgBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ErnWTePU;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cxT5O7qw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759849590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXETO9adK4P4lhNu6fQRavzpIi3dnu1nWvNyUe45nkE=;
 b=ErnWTePUT6mAmCWzHzwGzvSSX5p2BdLXngiZG6aZVjJdxUMvktYlABpOBsLLigN0pY7nqw
 vj3oMB95o9pADPRyIg0qhlNo92sxMNAGTxu5GMfg1/7PnVwYAtL7wng3+84MMDYGlNpBUT
 +/yANvUkaOyRaiNFrx5+9WQtddu+/j4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759849590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXETO9adK4P4lhNu6fQRavzpIi3dnu1nWvNyUe45nkE=;
 b=cxT5O7qwtNJ5iuAZtK8r5/ME4OEu8VIlRt1uaRLNNClR8XhzeobNKBhFBDgn7chOImd3u3
 R4tNmbeEG+Va+lBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 732D813693;
 Tue,  7 Oct 2025 15:06:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ePSvGnYs5Wh1SAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Oct 2025 15:06:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/5] drm/ast: Store HSync adjustment in device quirks
Date: Tue,  7 Oct 2025 16:54:46 +0200
Message-ID: <20251007150343.273718-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007150343.273718-1-tzimmermann@suse.de>
References: <20251007150343.273718-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 9604E33722
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

Add the add4 flag to struct ast_device_quirks and set it on AST2600.
Replaces a call to IS_AST_GEN7() in ast_set_crtc_reg().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2600.c | 1 +
 drivers/gpu/drm/ast/ast_drv.h  | 6 ++++++
 drivers/gpu/drm/ast/ast_mode.c | 3 +--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
index 7cde5ce9c41f..dee78fd5b022 100644
--- a/drivers/gpu/drm/ast/ast_2600.c
+++ b/drivers/gpu/drm/ast/ast_2600.c
@@ -63,6 +63,7 @@ static const struct ast_device_quirks ast_2600_device_quirks = {
 	.crtc_mem_req_threshold_low = 160,
 	.crtc_mem_req_threshold_high = 224,
 	.crtc_hsync_precatch_needed = true,
+	.crtc_hsync_add4_needed = true,
 };
 
 struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 76969244d36f..7be36a358e74 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -176,6 +176,12 @@ struct ast_device_quirks {
 	 * by AST2500PreCatchCRT in VBIOS mode flags.
 	 */
 	bool crtc_hsync_precatch_needed;
+
+	/*
+	 * Workaround for modes with HSync Time that is not a multiple
+	 * of 8 (e.g., 1920x1080@60Hz, HSync +44 pixels).
+	 */
+	bool crtc_hsync_add4_needed;
 };
 
 struct ast_device {
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index ebb1ec82d904..a8917ab7028c 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -288,8 +288,7 @@ static void ast_set_crtc_reg(struct ast_device *ast, struct drm_display_mode *mo
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xAC, 0x00, jregAC);
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xAD, 0x00, jregAD);
 
-	// Workaround for HSync Time non octave pixels (1920x1080@60Hz HSync 44 pixels);
-	if (IS_AST_GEN7(ast) && (mode->crtc_vdisplay == 1080))
+	if (ast->quirks->crtc_hsync_add4_needed && mode->crtc_vdisplay == 1080)
 		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xFC, 0xFD, 0x02);
 	else
 		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xFC, 0xFD, 0x00);
-- 
2.51.0

