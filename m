Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3192BB59C2F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 17:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C34D10E388;
	Tue, 16 Sep 2025 15:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gAzvLZsD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="28PM6W9A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gAzvLZsD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="28PM6W9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0C910E386
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:35:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CE2ED1F792;
 Tue, 16 Sep 2025 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOi5H3GEOP5NLo0CkVkB9r0DlGYfbMz11xsPce4uCuk=;
 b=gAzvLZsDluriDBClJE0FjJuunYPs9Fad262T3IA7odEAkq1+4D9sMr2O5qUclIgbmm8gd8
 rdhyofqVmrqYZwSSCTPEPsIRa7Lh8H974zZUfcmEnl0WBrU0x2CKe/hkCWKAlZl8+G6SUX
 nck5Z9sWuTbIruiLkhS5/L996mgQ/cY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOi5H3GEOP5NLo0CkVkB9r0DlGYfbMz11xsPce4uCuk=;
 b=28PM6W9AagJzAZVsneVron3MNbpoV9Sa/gwrNw7ZJecVlcM8AL9kqA0NR5CH58svxV7ifH
 k2epTl+afB05S7AQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gAzvLZsD;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=28PM6W9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOi5H3GEOP5NLo0CkVkB9r0DlGYfbMz11xsPce4uCuk=;
 b=gAzvLZsDluriDBClJE0FjJuunYPs9Fad262T3IA7odEAkq1+4D9sMr2O5qUclIgbmm8gd8
 rdhyofqVmrqYZwSSCTPEPsIRa7Lh8H974zZUfcmEnl0WBrU0x2CKe/hkCWKAlZl8+G6SUX
 nck5Z9sWuTbIruiLkhS5/L996mgQ/cY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOi5H3GEOP5NLo0CkVkB9r0DlGYfbMz11xsPce4uCuk=;
 b=28PM6W9AagJzAZVsneVron3MNbpoV9Sa/gwrNw7ZJecVlcM8AL9kqA0NR5CH58svxV7ifH
 k2epTl+afB05S7AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95F2C139CB;
 Tue, 16 Sep 2025 15:35:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GGcrI8KDyWjFPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Sep 2025 15:35:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/12] drm/ast: Prepare per-Gen device initialization
Date: Tue, 16 Sep 2025 17:26:14 +0200
Message-ID: <20250916153239.308027-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916153239.308027-1-tzimmermann@suse.de>
References: <20250916153239.308027-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: CE2ED1F792
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

Switch device creation by hardware Gen. Return the value from the
call to ast_detect_chip(). All generations are still initialized
by ast_device_create().

Also add ast_device_init() for setting some common fields in struct
ast_device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.c  | 25 ++++++++++++++++++++++---
 drivers/gpu/drm/ast/ast_drv.h  |  5 +++++
 drivers/gpu/drm/ast/ast_main.c |  5 +----
 3 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index c653ea5570d8..a1b3c25ded20 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -47,6 +47,18 @@ static int ast_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, ast_modeset, int, 0400);
 
+void ast_device_init(struct ast_device *ast,
+		     enum ast_chip chip,
+		     enum ast_config_mode config_mode,
+		     void __iomem *regs,
+		     void __iomem *ioregs)
+{
+	ast->chip = chip;
+	ast->config_mode = config_mode;
+	ast->regs = regs;
+	ast->ioregs = ioregs;
+}
+
 void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip)
 {
 	static const char * const info_str[] = {
@@ -281,7 +293,7 @@ static int ast_detect_chip(struct pci_dev *pdev,
 	*chip_out = chip;
 	*config_mode_out = config_mode;
 
-	return 0;
+	return __AST_CHIP_GEN(chip);
 }
 
 static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
@@ -292,6 +304,7 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	void __iomem *ioregs;
 	enum ast_config_mode config_mode;
 	enum ast_chip chip;
+	unsigned int chip_gen;
 	struct drm_device *drm;
 	bool need_post = false;
 
@@ -364,10 +377,16 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return ret;
 
 	ret = ast_detect_chip(pdev, regs, ioregs, &chip, &config_mode);
-	if (ret)
+	if (ret < 0)
 		return ret;
+	chip_gen = ret;
 
-	drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs, need_post);
+	switch (chip_gen) {
+	default:
+		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
+					need_post);
+		break;
+	}
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 	pci_set_drvdata(pdev, drm);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ae8e6083bc2b..8868cbdd99d0 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -416,6 +416,11 @@ struct ast_crtc_state {
 int ast_mm_init(struct ast_device *ast);
 
 /* ast_drv.c */
+void ast_device_init(struct ast_device *ast,
+		     enum ast_chip chip,
+		     enum ast_config_mode config_mode,
+		     void __iomem *regs,
+		     void __iomem *ioregs);
 void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip);
 
 /* ast_2000.c */
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 8ed15563173c..d1c54700686b 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -112,10 +112,7 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
 		return ERR_CAST(ast);
 	dev = &ast->base;
 
-	ast->chip = chip;
-	ast->config_mode = config_mode;
-	ast->regs = regs;
-	ast->ioregs = ioregs;
+	ast_device_init(ast, chip, config_mode, regs, ioregs);
 
 	if (AST_GEN(ast) >= 4)
 		ast_2300_detect_tx_chip(ast);
-- 
2.51.0

