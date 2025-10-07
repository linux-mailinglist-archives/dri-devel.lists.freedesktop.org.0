Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D78BC1DC0
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0978610E6CA;
	Tue,  7 Oct 2025 15:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ccLE2DuK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OhumcUcp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ccLE2DuK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OhumcUcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E78B10E6CB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:06:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E33A81F788;
 Tue,  7 Oct 2025 15:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759849589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOPqA04hNbUd+q3VG36BjUX+U15AvtGlRYRwfjy739A=;
 b=ccLE2DuKwNVc05O9836L3HsgAYwcQ3Uwfuo3s1SpjGOerscrvJLbhPbCjD+M0CwTQ5098m
 fritnXo7N6+4Tf99oeZYxeSEa2kcbvCeqE/AXYtqFafIm/PqY2uesWd9hCLdmlPnmgzide
 WWfixtGxzwpD7I0fszH1Cz5zcvX8NQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759849589;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOPqA04hNbUd+q3VG36BjUX+U15AvtGlRYRwfjy739A=;
 b=OhumcUcpFkgETUM7XfWEtdhtZ0uIZp8KplV6zK6z5M/VV2L+ZUiyioeexeYJjvWnz/UxhS
 F2dH1ODu0BLFUnBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ccLE2DuK;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OhumcUcp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759849589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOPqA04hNbUd+q3VG36BjUX+U15AvtGlRYRwfjy739A=;
 b=ccLE2DuKwNVc05O9836L3HsgAYwcQ3Uwfuo3s1SpjGOerscrvJLbhPbCjD+M0CwTQ5098m
 fritnXo7N6+4Tf99oeZYxeSEa2kcbvCeqE/AXYtqFafIm/PqY2uesWd9hCLdmlPnmgzide
 WWfixtGxzwpD7I0fszH1Cz5zcvX8NQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759849589;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOPqA04hNbUd+q3VG36BjUX+U15AvtGlRYRwfjy739A=;
 b=OhumcUcpFkgETUM7XfWEtdhtZ0uIZp8KplV6zK6z5M/VV2L+ZUiyioeexeYJjvWnz/UxhS
 F2dH1ODu0BLFUnBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF4FF13AC2;
 Tue,  7 Oct 2025 15:06:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yHtILXUs5Wh1SAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Oct 2025 15:06:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/5] drm/ast: Store DRAM clock table in struct ast_device
Date: Tue,  7 Oct 2025 16:54:42 +0200
Message-ID: <20251007150343.273718-2-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: E33A81F788
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

Init the new field dclk_table in struct ast_device to the per-gen
table of DRAM clock parameters. Use the field during modesetting.

The table is static, so a setup is only required once. Removes the
call to IS_AST_GEN() from the atomic commit's code path.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2000.c | 2 ++
 drivers/gpu/drm/ast/ast_2100.c | 2 ++
 drivers/gpu/drm/ast/ast_2200.c | 2 ++
 drivers/gpu/drm/ast/ast_2300.c | 2 ++
 drivers/gpu/drm/ast/ast_2400.c | 2 ++
 drivers/gpu/drm/ast/ast_2500.c | 2 ++
 drivers/gpu/drm/ast/ast_2600.c | 2 ++
 drivers/gpu/drm/ast/ast_drv.h  | 2 ++
 drivers/gpu/drm/ast/ast_mode.c | 7 +------
 9 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
index 03b0dcea43d1..74a041e99061 100644
--- a/drivers/gpu/drm/ast/ast_2000.c
+++ b/drivers/gpu/drm/ast/ast_2000.c
@@ -230,6 +230,8 @@ struct drm_device *ast_2000_device_create(struct pci_dev *pdev,
 
 	ast_device_init(ast, chip, config_mode, regs, ioregs);
 
+	ast->dclk_table = ast_2000_dclk_table;
+
 	ast_2000_detect_tx_chip(ast, need_post);
 
 	if (need_post) {
diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
index 540972daec52..eb3336c84833 100644
--- a/drivers/gpu/drm/ast/ast_2100.c
+++ b/drivers/gpu/drm/ast/ast_2100.c
@@ -451,6 +451,8 @@ struct drm_device *ast_2100_device_create(struct pci_dev *pdev,
 
 	ast_device_init(ast, chip, config_mode, regs, ioregs);
 
+	ast->dclk_table = ast_2000_dclk_table;
+
 	ast_2000_detect_tx_chip(ast, need_post);
 
 	if (need_post) {
diff --git a/drivers/gpu/drm/ast/ast_2200.c b/drivers/gpu/drm/ast/ast_2200.c
index 4795966dc2a7..391034d5f425 100644
--- a/drivers/gpu/drm/ast/ast_2200.c
+++ b/drivers/gpu/drm/ast/ast_2200.c
@@ -62,6 +62,8 @@ struct drm_device *ast_2200_device_create(struct pci_dev *pdev,
 
 	ast_device_init(ast, chip, config_mode, regs, ioregs);
 
+	ast->dclk_table = ast_2000_dclk_table;
+
 	ast_2000_detect_tx_chip(ast, need_post);
 
 	if (need_post) {
diff --git a/drivers/gpu/drm/ast/ast_2300.c b/drivers/gpu/drm/ast/ast_2300.c
index d1d63e58f3d6..3c9e1960b90c 100644
--- a/drivers/gpu/drm/ast/ast_2300.c
+++ b/drivers/gpu/drm/ast/ast_2300.c
@@ -1426,6 +1426,8 @@ struct drm_device *ast_2300_device_create(struct pci_dev *pdev,
 
 	ast_device_init(ast, chip, config_mode, regs, ioregs);
 
+	ast->dclk_table = ast_2000_dclk_table;
+
 	ast_2300_detect_tx_chip(ast);
 
 	if (need_post) {
diff --git a/drivers/gpu/drm/ast/ast_2400.c b/drivers/gpu/drm/ast/ast_2400.c
index 596338ea22f4..be866d1cd06a 100644
--- a/drivers/gpu/drm/ast/ast_2400.c
+++ b/drivers/gpu/drm/ast/ast_2400.c
@@ -63,6 +63,8 @@ struct drm_device *ast_2400_device_create(struct pci_dev *pdev,
 
 	ast_device_init(ast, chip, config_mode, regs, ioregs);
 
+	ast->dclk_table = ast_2000_dclk_table;
+
 	ast_2300_detect_tx_chip(ast);
 
 	if (need_post) {
diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
index 2c56db644f06..086c74682a55 100644
--- a/drivers/gpu/drm/ast/ast_2500.c
+++ b/drivers/gpu/drm/ast/ast_2500.c
@@ -637,6 +637,8 @@ struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
 
 	ast_device_init(ast, chip, config_mode, regs, ioregs);
 
+	ast->dclk_table = ast_2500_dclk_table;
+
 	ast_2300_detect_tx_chip(ast);
 
 	if (need_post) {
diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
index 30490c473797..1f709486f491 100644
--- a/drivers/gpu/drm/ast/ast_2600.c
+++ b/drivers/gpu/drm/ast/ast_2600.c
@@ -78,6 +78,8 @@ struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
 
 	ast_device_init(ast, chip, config_mode, regs, ioregs);
 
+	ast->dclk_table = ast_2500_dclk_table;
+
 	ast_2300_detect_tx_chip(ast);
 
 	switch (ast->tx_chip) {
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 35c476c85b9a..b2b30a0e4ffb 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -174,6 +174,8 @@ struct ast_device {
 	enum ast_config_mode config_mode;
 	enum ast_chip chip;
 
+	const struct ast_vbios_dclk_info *dclk_table;
+
 	void __iomem	*vram;
 	unsigned long	vram_base;
 	unsigned long	vram_size;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 6b9d510c509d..a9ffda1b1dea 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -370,12 +370,7 @@ static void ast_set_dclk_reg(struct ast_device *ast,
 			     struct drm_display_mode *mode,
 			     const struct ast_vbios_enhtable *vmode)
 {
-	const struct ast_vbios_dclk_info *clk_info;
-
-	if (IS_AST_GEN6(ast) || IS_AST_GEN7(ast))
-		clk_info = &ast_2500_dclk_table[vmode->dclk_index];
-	else
-		clk_info = &ast_2000_dclk_table[vmode->dclk_index];
+	const struct ast_vbios_dclk_info *clk_info = &ast->dclk_table[vmode->dclk_index];
 
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc0, 0x00, clk_info->param1);
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc1, 0x00, clk_info->param2);
-- 
2.51.0

