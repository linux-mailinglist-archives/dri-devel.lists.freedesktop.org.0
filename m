Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A337CBDCE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 10:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9881A10E293;
	Tue, 17 Oct 2023 08:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054FF10E28B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 08:36:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6BF31FF11;
 Tue, 17 Oct 2023 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697531815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oy+8arAnK7tiqK+kFFYd06YQ8G4Ue/IGJxKW5Qt+NFU=;
 b=KOl0mFnbeEnEGWsDbqh6XE2TzGmPX3y/eY2c1Y/8kS5Frl223iSIPkfmKSjqL+rXiV6Nii
 XFI7vQxI0CUhDAt/GRhWVhqhTYBgQ88v1bqsBKDJG5zBuIvC1JTckc5KG678bhVzelZke+
 PiKzljLvujcVCVXt5+5zN65wxU+GhSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697531815;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oy+8arAnK7tiqK+kFFYd06YQ8G4Ue/IGJxKW5Qt+NFU=;
 b=96BE4HBDJyP/2kAUD7KB+Qnxsv6Spsh99vEMxFkK2R63ImOBU34QMPY6B4dzeZD/AQPGEv
 A7zE8eDQX1Zh+aCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB9AB13584;
 Tue, 17 Oct 2023 08:36:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YEr1KKdHLmVbUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Oct 2023 08:36:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 06/12] drm/ast: Rename AST_IO_DAC_INDEX_WRITE to AST_IO_VGADWR
Date: Tue, 17 Oct 2023 10:32:02 +0200
Message-ID: <20231017083653.10063-7-tzimmermann@suse.de>
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

Rename AST_IO_DAC_INDEX_WRITE to AST_IO_VGADWR to align naming
in the driver with documentation. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  | 2 +-
 drivers/gpu/drm/ast/ast_mode.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ff95b8f088f8d..2b46fafd3467f 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -264,7 +264,7 @@ static inline bool __ast_gen_is_eq(struct ast_device *ast, unsigned long gen)
 #define AST_IO_VGAER			(0x43)
 #define AST_IO_VGASRI			(0x44)
 #define AST_IO_VGADRR			(0x47)
-#define AST_IO_DAC_INDEX_WRITE		(0x48)
+#define AST_IO_VGADWR			(0x48)
 #define AST_IO_DAC_DATA		        (0x49)
 #define AST_IO_GR_PORT			(0x4E)
 #define AST_IO_CRTC_PORT		(0x54)
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 6f8375dd80a39..a719f6c9493dc 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -55,7 +55,7 @@ static inline void ast_load_palette_index(struct ast_device *ast,
 				     u8 index, u8 red, u8 green,
 				     u8 blue)
 {
-	ast_io_write8(ast, AST_IO_DAC_INDEX_WRITE, index);
+	ast_io_write8(ast, AST_IO_VGADWR, index);
 	ast_io_read8(ast, AST_IO_VGASRI);
 	ast_io_write8(ast, AST_IO_DAC_DATA, red);
 	ast_io_read8(ast, AST_IO_VGASRI);
-- 
2.42.0

