Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BDE983E6D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9482310E5B0;
	Tue, 24 Sep 2024 07:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FeNVOsY+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="one2nJ8K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FeNVOsY+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="one2nJ8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8FD10E529;
 Tue, 24 Sep 2024 07:17:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A6E721BA1;
 Tue, 24 Sep 2024 07:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGU+OEstwQdnK/fxH1W5Wb/JkBj5tU5zCOVt0aWwehg=;
 b=FeNVOsY+2CrDgMIl44jG7PLu+KQt+yWY5Ck8BbSqRCL45bwpeZdGTA6h+utNX54lceTv1Z
 rDzEmwDutHD8qDZpMMPwrR62s6KAKXVfSQE6FIR5n/KmCkzItEp1dTbcylaEJm4COep/xO
 LyNg+CSFT9EC7q6VSDeBPWJkB+7gQHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162266;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGU+OEstwQdnK/fxH1W5Wb/JkBj5tU5zCOVt0aWwehg=;
 b=one2nJ8KNjCrYiWhoi+BI7j0hLSMZVFnhah/PZ7pzNfGN127yfduETiLyIwwdrjZfN8Grc
 ysweb9jXUyosyZAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FeNVOsY+;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=one2nJ8K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGU+OEstwQdnK/fxH1W5Wb/JkBj5tU5zCOVt0aWwehg=;
 b=FeNVOsY+2CrDgMIl44jG7PLu+KQt+yWY5Ck8BbSqRCL45bwpeZdGTA6h+utNX54lceTv1Z
 rDzEmwDutHD8qDZpMMPwrR62s6KAKXVfSQE6FIR5n/KmCkzItEp1dTbcylaEJm4COep/xO
 LyNg+CSFT9EC7q6VSDeBPWJkB+7gQHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162266;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGU+OEstwQdnK/fxH1W5Wb/JkBj5tU5zCOVt0aWwehg=;
 b=one2nJ8KNjCrYiWhoi+BI7j0hLSMZVFnhah/PZ7pzNfGN127yfduETiLyIwwdrjZfN8Grc
 ysweb9jXUyosyZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B2811386E;
 Tue, 24 Sep 2024 07:17:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4HR9BZpn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v5 24/80] drm/logicvc: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:12:22 +0200
Message-ID: <20240924071734.98201-25-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5A6E721BA1
X-Spam-Level: 
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[10];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.01
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

v5:
- select DRM_CLIENT_SELECTION

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/logicvc/Kconfig       |  1 +
 drivers/gpu/drm/logicvc/logicvc_drm.c | 16 ++++------------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicvc/Kconfig
index 1df22a852a23..579a358ed5cf 100644
--- a/drivers/gpu/drm/logicvc/Kconfig
+++ b/drivers/gpu/drm/logicvc/Kconfig
@@ -2,6 +2,7 @@ config DRM_LOGICVC
 	tristate "LogiCVC DRM"
 	depends on DRM
 	depends on OF || COMPILE_TEST
+	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_KMS_DMA_HELPER
 	select DRM_GEM_DMA_HELPER
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

