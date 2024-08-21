Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7E0959D37
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 15:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E6910E974;
	Wed, 21 Aug 2024 13:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fRK5YmW8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z0UMIevw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fRK5YmW8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z0UMIevw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60FE10E930;
 Wed, 21 Aug 2024 13:04:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6C20E22268;
 Wed, 21 Aug 2024 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YB9ZhvWV/hek4csgA4ytj4N7MaaNnG/oVkRQyt/p3mY=;
 b=fRK5YmW87WhcLCiTUmkOPLufj5/17nCLzHGHT1bONYj3GQbsFATSymbo1ZXAHA8+lM+HuA
 k2nj3cTAPGYPfLY21a8qTLNetL867MNIEbfYCg/wkSCLvxzpu5CTd0wVhPyUTWJWzZtqGd
 jdlTzimaXYsKiIxoOwtqUIbxqffdjI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245440;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YB9ZhvWV/hek4csgA4ytj4N7MaaNnG/oVkRQyt/p3mY=;
 b=z0UMIevwtmaahseVkJME+5ufdVLGA66AwMokMPItpQlO+woS1u7Axf1poYMIsQF2g90Lcf
 aD5Rc9LLqV2+ukDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YB9ZhvWV/hek4csgA4ytj4N7MaaNnG/oVkRQyt/p3mY=;
 b=fRK5YmW87WhcLCiTUmkOPLufj5/17nCLzHGHT1bONYj3GQbsFATSymbo1ZXAHA8+lM+HuA
 k2nj3cTAPGYPfLY21a8qTLNetL867MNIEbfYCg/wkSCLvxzpu5CTd0wVhPyUTWJWzZtqGd
 jdlTzimaXYsKiIxoOwtqUIbxqffdjI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245440;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YB9ZhvWV/hek4csgA4ytj4N7MaaNnG/oVkRQyt/p3mY=;
 b=z0UMIevwtmaahseVkJME+5ufdVLGA66AwMokMPItpQlO+woS1u7Axf1poYMIsQF2g90Lcf
 aD5Rc9LLqV2+ukDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2565013B1E;
 Wed, 21 Aug 2024 13:04:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YKfwB8DlxWbXGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 13:04:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2 24/86] drm/logicvc: Run DRM default client setup
Date: Wed, 21 Aug 2024 14:59:21 +0200
Message-ID: <20240821130348.73038-25-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
References: <20240821130348.73038-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[11]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

The logicvc driver specifies a preferred color mode from the value
in struct drm_mode_config.preferred_depth. The fbdev client also
looks at this value for the default pixel format. Thus remove the
format selection from logicvc.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/gpu/drm/logicvc/logicvc_drm.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index 01a37e28c080..e4d90701b29d 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -16,8 +16,10 @@
 #include <linux/types.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_print.h>
 
@@ -55,6 +57,7 @@ static struct drm_driver logicvc_drm_driver = {
 	.minor				= 0,
 
 	DRM_GEM_DMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(logicvc_drm_gem_dma_dumb_create),
+	DRM_FBDEV_DMA_DRIVER_OPS,
 };
 
 static struct regmap_config logicvc_drm_regmap_config = {
@@ -301,7 +304,6 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	struct regmap *regmap = NULL;
 	struct resource res;
 	void __iomem *base;
-	unsigned int preferred_bpp;
 	int irq;
 	int ret;
 
@@ -439,17 +441,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		goto error_mode;
 	}
 
-	switch (drm_dev->mode_config.preferred_depth) {
-	case 16:
-		preferred_bpp = 16;
-		break;
-	case 24:
-	case 32:
-	default:
-		preferred_bpp = 32;
-		break;
-	}
-	drm_fbdev_dma_setup(drm_dev, preferred_bpp);
+	drm_client_setup(drm_dev, NULL);
 
 	return 0;
 
-- 
2.46.0

