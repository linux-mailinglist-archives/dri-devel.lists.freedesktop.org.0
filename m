Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3397B8F96D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 10:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C14D10E3ED;
	Mon, 22 Sep 2025 08:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GyV3zQz4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HN/hWXgI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GyV3zQz4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HN/hWXgI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79B810E3E6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:40:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 181AC2204E;
 Mon, 22 Sep 2025 08:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758530402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydwoz+nvqYdqxJsdTos0+LWZWmU6oJjFiPSfM4QamuU=;
 b=GyV3zQz45qBwh6E3Un8yVWjg3r2yfDZP2IZpGSQXEEgjzriVd6ZgmkpJHfb/DMGIPh1OEg
 LkamwrvEJlrJt3zbOEeiJ7llzGfIK9XY8Gpel8NA6Bv2sF+R+reRVwUC3QAi2AlpA25tTU
 sf2VIeV1R7y5kbAlXKut2v/gPDgPOIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758530402;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydwoz+nvqYdqxJsdTos0+LWZWmU6oJjFiPSfM4QamuU=;
 b=HN/hWXgIn0qIS2NqQ7LTQEM/Olr1XVof1sqnF9t4uh5/9sIn4u6cVFN2j+Jcph5ec3A0Fc
 nwxkkMHiTgQrcTCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758530402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydwoz+nvqYdqxJsdTos0+LWZWmU6oJjFiPSfM4QamuU=;
 b=GyV3zQz45qBwh6E3Un8yVWjg3r2yfDZP2IZpGSQXEEgjzriVd6ZgmkpJHfb/DMGIPh1OEg
 LkamwrvEJlrJt3zbOEeiJ7llzGfIK9XY8Gpel8NA6Bv2sF+R+reRVwUC3QAi2AlpA25tTU
 sf2VIeV1R7y5kbAlXKut2v/gPDgPOIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758530402;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydwoz+nvqYdqxJsdTos0+LWZWmU6oJjFiPSfM4QamuU=;
 b=HN/hWXgIn0qIS2NqQ7LTQEM/Olr1XVof1sqnF9t4uh5/9sIn4u6cVFN2j+Jcph5ec3A0Fc
 nwxkkMHiTgQrcTCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2F051388C;
 Mon, 22 Sep 2025 08:40:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CMNNMmEL0WikFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 22 Sep 2025 08:40:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/12] drm/ast: Move Gen6 device initialization into
 separate helper
Date: Mon, 22 Sep 2025 10:36:10 +0200
Message-ID: <20250922083708.45564-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922083708.45564-1-tzimmermann@suse.de>
References: <20250922083708.45564-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[8];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_COUNT_TWO(0.00)[2]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

Split off device initialization for Gen6 hardware into the helpers
ast_2500_device_create() and ast_2500_detect_wide_screen(). The new
functions are duplicates of their counterparts in ast_main.c, but
stripped from most non-Gen6 support.

Simplifies maintenance as the driver's number of supported hardware
generations grows.

v2:
- simplify widescreen-detection logic

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_2500.c | 64 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.c  |  4 +++
 drivers/gpu/drm/ast/ast_drv.h  |  7 ++++
 3 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
index b12fec161f2b..2c56db644f06 100644
--- a/drivers/gpu/drm/ast/ast_2500.c
+++ b/drivers/gpu/drm/ast/ast_2500.c
@@ -27,7 +27,9 @@
  */
 
 #include <linux/delay.h>
+#include <linux/pci.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_print.h>
 
 #include "ast_drv.h"
@@ -601,3 +603,65 @@ const struct ast_vbios_dclk_info ast_2500_dclk_table[] = {
 	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
 	{0x44, 0x20, 0x43},			/* 1a: VCLK118_25	*/
 };
+
+/*
+ * Device initialization
+ */
+
+static void ast_2500_detect_widescreen(struct ast_device *ast)
+{
+	if (__ast_2100_detect_wsxga_p(ast) || ast->chip == AST2510) {
+		ast->support_wsxga_p = true;
+		ast->support_fullhd = true;
+	}
+	if (__ast_2100_detect_wuxga(ast))
+		ast->support_wuxga = true;
+}
+
+struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
+					  const struct drm_driver *drv,
+					  enum ast_chip chip,
+					  enum ast_config_mode config_mode,
+					  void __iomem *regs,
+					  void __iomem *ioregs,
+					  bool need_post)
+{
+	struct drm_device *dev;
+	struct ast_device *ast;
+	int ret;
+
+	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
+	if (IS_ERR(ast))
+		return ERR_CAST(ast);
+	dev = &ast->base;
+
+	ast_device_init(ast, chip, config_mode, regs, ioregs);
+
+	ast_2300_detect_tx_chip(ast);
+
+	if (need_post) {
+		ret = ast_post_gpu(ast);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	ret = ast_mm_init(ast);
+	if (ret)
+		return ERR_PTR(ret);
+
+	/* map reserved buffer */
+	ast->dp501_fw_buf = NULL;
+	if (ast->vram_size < pci_resource_len(pdev, 0)) {
+		ast->dp501_fw_buf = pci_iomap_range(pdev, 0, ast->vram_size, 0);
+		if (!ast->dp501_fw_buf)
+			drm_info(dev, "failed to map reserved buffer!\n");
+	}
+
+	ast_2500_detect_widescreen(ast);
+
+	ret = ast_mode_config_init(ast);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return dev;
+}
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 475a8d5f58cd..2f9a4c969a17 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -402,6 +402,10 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		drm = ast_2400_device_create(pdev, &ast_driver, chip, config_mode,
 					     regs, ioregs, need_post);
 		break;
+	case 6:
+		drm = ast_2500_device_create(pdev, &ast_driver, chip, config_mode,
+					     regs, ioregs, need_post);
+		break;
 	default:
 		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
 					need_post);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index c9744b3efda0..fef9b9e6cb42 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -480,6 +480,13 @@ struct drm_device *ast_2400_device_create(struct pci_dev *pdev,
 void ast_2500_patch_ahb(void __iomem *regs);
 int ast_2500_post(struct ast_device *ast);
 extern const struct ast_vbios_dclk_info ast_2500_dclk_table[];
+struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
+					  const struct drm_driver *drv,
+					  enum ast_chip chip,
+					  enum ast_config_mode config_mode,
+					  void __iomem *regs,
+					  void __iomem *ioregs,
+					  bool need_post);
 
 /* ast_2600.c */
 int ast_2600_post(struct ast_device *ast);
-- 
2.51.0

