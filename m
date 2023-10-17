Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 931887CBDC8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 10:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD7210E28B;
	Tue, 17 Oct 2023 08:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAC510E06E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 08:36:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B5C6C21D02;
 Tue, 17 Oct 2023 08:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697531816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJiyiVgp78HNJDJflvg+Z7LLjPXwHd4E/ADDe6ycI4g=;
 b=ONNKakXoPUgDwFDg658uxJUKKanVNOVNtAd9qdw88hsYHlx+SqfSO2i5Uh6Kbkogn3J07B
 0hG44eSQzTFATmCXd1yauZLReSJzmGRTh6VrfRMSkhCQAJsxOcQK1KvBmdx8pjqB62J1k7
 5Oj25vjROvn6waczph1KPj8ieDSmBZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697531816;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJiyiVgp78HNJDJflvg+Z7LLjPXwHd4E/ADDe6ycI4g=;
 b=AWedbw8cElnqjRza3mdSF24WN4rdQlqjyVqsAbzaP79wGbAlq/na46xHzygYvh6lp0y7WH
 kD9BkxcQZ5YHqkDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 842B613584;
 Tue, 17 Oct 2023 08:36:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0B5RH6hHLmVbUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Oct 2023 08:36:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 10/12] drm/ast: Rename AST_IO_INPUT_STATUS1_READ to
 AST_IO_VGAIR1_R
Date: Tue, 17 Oct 2023 10:32:06 +0200
Message-ID: <20231017083653.10063-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017083653.10063-1-tzimmermann@suse.de>
References: <20231017083653.10063-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.10
X-Spamd-Result: default: False [-6.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RL5hwym8k7wjfpcebf457xyjzi)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename AST_IO_INPUT_STATUS1_READ to AST_IO_VGAIR1_R to align naming
in the driver with documentation. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  | 2 +-
 drivers/gpu/drm/ast/ast_mode.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index a8bcb1903294e..03f1edf95e73c 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -268,7 +268,7 @@ static inline bool __ast_gen_is_eq(struct ast_device *ast, unsigned long gen)
 #define AST_IO_VGAPDR		        (0x49)
 #define AST_IO_VGAGRI			(0x4E)
 #define AST_IO_VGACRI			(0x54)
-#define AST_IO_INPUT_STATUS1_READ	(0x5A)
+#define AST_IO_VGAIR1_R			(0x5A)
 #define AST_IO_MISC_PORT_READ		(0x4C)
 
 #define AST_IO_MM_OFFSET		(0x380)
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index c4381342af04b..289e32227f6b9 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -318,7 +318,7 @@ static void ast_set_std_reg(struct ast_device *ast,
 		ast_set_index_reg(ast, AST_IO_VGACRI, i, stdtable->crtc[i]);
 
 	/* set AR */
-	jreg = ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ);
+	jreg = ast_io_read8(ast, AST_IO_VGAIR1_R);
 	for (i = 0; i < 20; i++) {
 		jreg = stdtable->ar[i];
 		ast_io_write8(ast, AST_IO_VGAARI_W, (u8)i);
@@ -327,7 +327,7 @@ static void ast_set_std_reg(struct ast_device *ast,
 	ast_io_write8(ast, AST_IO_VGAARI_W, 0x14);
 	ast_io_write8(ast, AST_IO_VGAARI_W, 0x00);
 
-	jreg = ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ);
+	jreg = ast_io_read8(ast, AST_IO_VGAIR1_R);
 	ast_io_write8(ast, AST_IO_VGAARI_W, 0x20);
 
 	/* Set GR */
@@ -558,7 +558,7 @@ static void ast_wait_for_vretrace(struct ast_device *ast)
 	u8 vgair1;
 
 	do {
-		vgair1 = ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ);
+		vgair1 = ast_io_read8(ast, AST_IO_VGAIR1_R);
 	} while (!(vgair1 & AST_IO_VGAIR1_VREFRESH) && time_before(jiffies, timeout));
 }
 
-- 
2.42.0

