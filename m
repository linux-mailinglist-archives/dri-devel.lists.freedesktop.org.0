Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1307CBDC2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 10:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336FD10E06E;
	Tue, 17 Oct 2023 08:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65EB10E280
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 08:36:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 408051F894;
 Tue, 17 Oct 2023 08:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697531816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bVdg/ea0hnoZdOb6zhVnyOyC6Y+12MkNXkYI0moTsoc=;
 b=mq05sFSWxIExC0Laht/DWqw/1IeUPQ+P2oE4D2rVchTeUiroP6j/fWMAsjVsulZEG6SDaR
 2akiHY9JZZ5BELggujn08PKVADTZKojTWDGfnilhWyHQFbTEeMpaF0XcV9djgWx2VJLE3X
 kkouLWQBQrefJmox5eZeNt5I6aq+PhQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697531816;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bVdg/ea0hnoZdOb6zhVnyOyC6Y+12MkNXkYI0moTsoc=;
 b=HVPGhy0oxaxzTS51B/SjhDjTSkcZ0g2eQXlwjDGesrexGln27AdTrTecGvIGXVf8K5H5GB
 BLAit2l7QOvRecDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13D8E13584;
 Tue, 17 Oct 2023 08:36:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QHLvA6hHLmVbUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Oct 2023 08:36:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 08/12] drm/ast: Rename AST_IO_GR_PORT to AST_IO_VGAGRI
Date: Tue, 17 Oct 2023 10:32:04 +0200
Message-ID: <20231017083653.10063-9-tzimmermann@suse.de>
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

Rename AST_IO_GR_PORT to AST_IO_VGAGRI to align naming
in the driver with documentation. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  | 2 +-
 drivers/gpu/drm/ast/ast_mode.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 43d1861d62624..86860ab547113 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -266,7 +266,7 @@ static inline bool __ast_gen_is_eq(struct ast_device *ast, unsigned long gen)
 #define AST_IO_VGADRR			(0x47)
 #define AST_IO_VGADWR			(0x48)
 #define AST_IO_VGAPDR		        (0x49)
-#define AST_IO_GR_PORT			(0x4E)
+#define AST_IO_VGAGRI			(0x4E)
 #define AST_IO_CRTC_PORT		(0x54)
 #define AST_IO_INPUT_STATUS1_READ	(0x5A)
 #define AST_IO_MISC_PORT_READ		(0x4C)
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index fa21cdfd6c4f5..19dc050d6e815 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -332,7 +332,7 @@ static void ast_set_std_reg(struct ast_device *ast,
 
 	/* Set GR */
 	for (i = 0; i < 9; i++)
-		ast_set_index_reg(ast, AST_IO_GR_PORT, i, stdtable->gr[i]);
+		ast_set_index_reg(ast, AST_IO_VGAGRI, i, stdtable->gr[i]);
 }
 
 static void ast_set_crtc_reg(struct ast_device *ast,
-- 
2.42.0

