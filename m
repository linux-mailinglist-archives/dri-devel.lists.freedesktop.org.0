Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84C57CBDCC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 10:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54C210E28E;
	Tue, 17 Oct 2023 08:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F06210E280
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 08:36:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D809421D0C;
 Tue, 17 Oct 2023 08:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697531814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QViwy6T67xX9nFXJVLrBX08aWwfUWU8nMYnbxkTgHjM=;
 b=y7XIye73y2MzXIz5qKCckw9j/6bawTfMaSFKvzofJxrMK8ebUPVKHf5tt/+A1/fZsqreFD
 hv8BQsM2dAXN9KBrd5Y2SgaaKzcQIu6l7rRfP+H1Po/TPIzKi+j9DT31TIjAg17TGub1bt
 lU6JjaYqssOe60zfYpkMToiN5d99Gr4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697531814;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QViwy6T67xX9nFXJVLrBX08aWwfUWU8nMYnbxkTgHjM=;
 b=0Isj0dMC+hc/xPET20GIoIFqMcQ0kwimIrkgsNUYehEvnI49yvzWf/j49Nb4pkTKSgSa9v
 4w2vv/eJP1tKolBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACC8A1391B;
 Tue, 17 Oct 2023 08:36:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MEhKKaZHLmVbUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Oct 2023 08:36:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 01/12] drm/ast: Rename AST_IO_AR_PORT_WRITE to AST_IO_VGAARI_W
Date: Tue, 17 Oct 2023 10:31:57 +0200
Message-ID: <20231017083653.10063-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017083653.10063-1-tzimmermann@suse.de>
References: <20231017083653.10063-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.10
X-Spamd-Result: default: False [-3.10 / 50.00]; ARC_NA(0.00)[];
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
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[]
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

Rename AST_IO_AR_PORT_WRITE to AST_IO_VGAARI_W to align naming
in the driver with documentation. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_mode.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 848a9f1403e89..3d64dc356d699 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -259,7 +259,7 @@ static inline bool __ast_gen_is_eq(struct ast_device *ast, unsigned long gen)
 #define IS_AST_GEN6(__ast)	__ast_gen_is_eq(__ast, 6)
 #define IS_AST_GEN7(__ast)	__ast_gen_is_eq(__ast, 7)
 
-#define AST_IO_AR_PORT_WRITE		(0x40)
+#define AST_IO_VGAARI_W			(0x40)
 #define AST_IO_MISC_PORT_WRITE		(0x42)
 #define AST_IO_VGA_ENABLE_PORT		(0x43)
 #define AST_IO_SEQ_PORT			(0x44)
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 32f04ec6c386f..1ccbfdf27356e 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -321,14 +321,14 @@ static void ast_set_std_reg(struct ast_device *ast,
 	jreg = ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ);
 	for (i = 0; i < 20; i++) {
 		jreg = stdtable->ar[i];
-		ast_io_write8(ast, AST_IO_AR_PORT_WRITE, (u8)i);
-		ast_io_write8(ast, AST_IO_AR_PORT_WRITE, jreg);
+		ast_io_write8(ast, AST_IO_VGAARI_W, (u8)i);
+		ast_io_write8(ast, AST_IO_VGAARI_W, jreg);
 	}
-	ast_io_write8(ast, AST_IO_AR_PORT_WRITE, 0x14);
-	ast_io_write8(ast, AST_IO_AR_PORT_WRITE, 0x00);
+	ast_io_write8(ast, AST_IO_VGAARI_W, 0x14);
+	ast_io_write8(ast, AST_IO_VGAARI_W, 0x00);
 
 	jreg = ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ);
-	ast_io_write8(ast, AST_IO_AR_PORT_WRITE, 0x20);
+	ast_io_write8(ast, AST_IO_VGAARI_W, 0x20);
 
 	/* Set GR */
 	for (i = 0; i < 9; i++)
-- 
2.42.0

