Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E697CBDCD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 10:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8099A10E292;
	Tue, 17 Oct 2023 08:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC79F10E06E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 08:36:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 517F11FF0D;
 Tue, 17 Oct 2023 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697531815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Fqk3E7OxNycmAvJUp8+dEPzNJNt8sNAyCx8Vo8A/ks=;
 b=L3ne1KCa62xoM2JJPD0aZJFTtU0I8XBjq/px3zGhL7+uNOuvvYPa4iLwzbkSr000zsYkp1
 e7qS+NuJvCMhet6a8kJ691d6g/1HDiE6QXaDO/hBSGTgid4+Jpiex8eg4KBtQ9RfISZ1fz
 yRSCYvPioqEm9CUYIzyZJ4cxAaIIwQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697531815;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Fqk3E7OxNycmAvJUp8+dEPzNJNt8sNAyCx8Vo8A/ks=;
 b=fB4H7Ka3tOKdo0bqSo7ztxeM1i7UvcdhRje2hLeXJfeNj5hSB03p81g+BcqE1Cx7vRzuIL
 O6oVuJEPAcGyicDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A1801391B;
 Tue, 17 Oct 2023 08:36:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kHxwBadHLmVbUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Oct 2023 08:36:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 03/12] drm/ast: Rename AST_IO_VGA_ENABLE_PORT to AST_IO_VGAER
Date: Tue, 17 Oct 2023 10:31:59 +0200
Message-ID: <20231017083653.10063-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017083653.10063-1-tzimmermann@suse.de>
References: <20231017083653.10063-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.10
X-Spamd-Result: default: False [-6.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
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

Rename AST_IO_VGA_ENABLE_PORT to AST_IO_VGAER to align naming
in the driver with documentation. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  | 2 +-
 drivers/gpu/drm/ast/ast_main.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ff86db3604cda..e31ba929f18db 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -261,7 +261,7 @@ static inline bool __ast_gen_is_eq(struct ast_device *ast, unsigned long gen)
 
 #define AST_IO_VGAARI_W			(0x40)
 #define AST_IO_VGAMR_W			(0x42)
-#define AST_IO_VGA_ENABLE_PORT		(0x43)
+#define AST_IO_VGAER			(0x43)
 #define AST_IO_SEQ_PORT			(0x44)
 #define AST_IO_DAC_INDEX_READ		(0x47)
 #define AST_IO_DAC_INDEX_WRITE		(0x48)
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index f8a682c4cbd01..7db1f50044542 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -40,7 +40,7 @@ static bool ast_is_vga_enabled(struct drm_device *dev)
 	struct ast_device *ast = to_ast_device(dev);
 	u8 ch;
 
-	ch = ast_io_read8(ast, AST_IO_VGA_ENABLE_PORT);
+	ch = ast_io_read8(ast, AST_IO_VGAER);
 
 	return !!(ch & 0x01);
 }
@@ -49,7 +49,7 @@ static void ast_enable_vga(struct drm_device *dev)
 {
 	struct ast_device *ast = to_ast_device(dev);
 
-	ast_io_write8(ast, AST_IO_VGA_ENABLE_PORT, 0x01);
+	ast_io_write8(ast, AST_IO_VGAER, 0x01);
 	ast_io_write8(ast, AST_IO_VGAMR_W, 0x01);
 }
 
-- 
2.42.0

