Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA67CBDC6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 10:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310A810E280;
	Tue, 17 Oct 2023 08:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E50910E280
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 08:36:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 788E61FF0E;
 Tue, 17 Oct 2023 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697531815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UagAtCznBj0CHyafkvVlUxWjhUsZKgI4sM3a6ERJ6NY=;
 b=LwXtwyrGTxUjpR9Oiw/AO6N4QA+dP0xTfqMoUYkTeQf3KHO1h9wcahEg7+WKZkEcdUJxOu
 +27G07zVXLzUh3NMEZm5tUAQlJFmRaV8ZYQqI9FSCvdldf7nljpK4V0r41B99jKq97d1/t
 tf1LURzow9nnbZkUZd1h2U6/P4U756E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697531815;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UagAtCznBj0CHyafkvVlUxWjhUsZKgI4sM3a6ERJ6NY=;
 b=iy59XDRe5Np6SUN2tfQew8zOKmmzBK+nNRHaxkYboewuMx5VZvZnTP/TXTuUKOHqgTjRx3
 GqiGcrWshZsSvoAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AB5513584;
 Tue, 17 Oct 2023 08:36:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8NVVEadHLmVbUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Oct 2023 08:36:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 04/12] drm/ast: Rename AST_IO_SEQ_PORT to AST_IO_VGASRI
Date: Tue, 17 Oct 2023 10:32:00 +0200
Message-ID: <20231017083653.10063-5-tzimmermann@suse.de>
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

Rename AST_IO_VGA_SEQ_PORT to AST_IO_VGASRI to align naming
in the driver with documentation. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_mode.c | 22 +++++++++++-----------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index e31ba929f18db..dc8b4d86ca9a5 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -262,7 +262,7 @@ static inline bool __ast_gen_is_eq(struct ast_device *ast, unsigned long gen)
 #define AST_IO_VGAARI_W			(0x40)
 #define AST_IO_VGAMR_W			(0x42)
 #define AST_IO_VGAER			(0x43)
-#define AST_IO_SEQ_PORT			(0x44)
+#define AST_IO_VGASRI			(0x44)
 #define AST_IO_DAC_INDEX_READ		(0x47)
 #define AST_IO_DAC_INDEX_WRITE		(0x48)
 #define AST_IO_DAC_DATA		        (0x49)
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 3f52648c20a09..6f8375dd80a39 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -56,13 +56,13 @@ static inline void ast_load_palette_index(struct ast_device *ast,
 				     u8 blue)
 {
 	ast_io_write8(ast, AST_IO_DAC_INDEX_WRITE, index);
-	ast_io_read8(ast, AST_IO_SEQ_PORT);
+	ast_io_read8(ast, AST_IO_VGASRI);
 	ast_io_write8(ast, AST_IO_DAC_DATA, red);
-	ast_io_read8(ast, AST_IO_SEQ_PORT);
+	ast_io_read8(ast, AST_IO_VGASRI);
 	ast_io_write8(ast, AST_IO_DAC_DATA, green);
-	ast_io_read8(ast, AST_IO_SEQ_PORT);
+	ast_io_read8(ast, AST_IO_VGASRI);
 	ast_io_write8(ast, AST_IO_DAC_DATA, blue);
-	ast_io_read8(ast, AST_IO_SEQ_PORT);
+	ast_io_read8(ast, AST_IO_VGASRI);
 }
 
 static void ast_crtc_set_gamma_linear(struct ast_device *ast,
@@ -301,11 +301,11 @@ static void ast_set_std_reg(struct ast_device *ast,
 	ast_io_write8(ast, AST_IO_VGAMR_W, jreg);
 
 	/* Set SEQ; except Screen Disable field */
-	ast_set_index_reg(ast, AST_IO_SEQ_PORT, 0x00, 0x03);
-	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xdf, stdtable->seq[0]);
+	ast_set_index_reg(ast, AST_IO_VGASRI, 0x00, 0x03);
+	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, stdtable->seq[0]);
 	for (i = 1; i < 4; i++) {
 		jreg = stdtable->seq[i];
-		ast_set_index_reg(ast, AST_IO_SEQ_PORT, (i + 1), jreg);
+		ast_set_index_reg(ast, AST_IO_VGASRI, (i + 1), jreg);
 	}
 
 	/* Set CRTC; except base address and offset */
@@ -689,7 +689,7 @@ static void ast_primary_plane_helper_atomic_enable(struct drm_plane *plane,
 	 * Therefore only reprogram the address after enabling the plane.
 	 */
 	ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
-	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
+	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x1, 0xdf, 0x00);
 }
 
 static void ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
@@ -697,7 +697,7 @@ static void ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 {
 	struct ast_device *ast = to_ast_device(plane->dev);
 
-	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x20);
+	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x1, 0xdf, 0x20);
 }
 
 static const struct drm_plane_helper_funcs ast_primary_plane_helper_funcs = {
@@ -1014,7 +1014,7 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 	 */
 	switch (mode) {
 	case DRM_MODE_DPMS_ON:
-		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0);
+		ast_set_index_reg_mask(ast, AST_IO_VGASRI,  0x01, 0xdf, 0);
 		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, 0);
 		if (ast->tx_chip_types & AST_TX_DP501_BIT)
 			ast_set_dp501_video_output(crtc->dev, 1);
@@ -1051,7 +1051,7 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 			ast_dp_power_on_off(crtc->dev, AST_DP_POWER_OFF);
 		}
 
-		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0x20);
+		ast_set_index_reg_mask(ast, AST_IO_VGASRI,  0x01, 0xdf, 0x20);
 		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, ch);
 		break;
 	}
-- 
2.42.0

