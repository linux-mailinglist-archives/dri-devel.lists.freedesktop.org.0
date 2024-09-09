Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845259717EE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 13:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981E510E488;
	Mon,  9 Sep 2024 11:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZCqlQk+L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9ARLqZb8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZCqlQk+L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9ARLqZb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDD710E416;
 Mon,  9 Sep 2024 11:36:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8C9AD21BD9;
 Mon,  9 Sep 2024 11:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/PqLVv5R28GeXf8S28jva92g8vZt4UTBJhiJLIJAt0o=;
 b=ZCqlQk+LmlVBfBcT2SXDCHmxttUCFC+2EsjTytXxtpBpTurFRahZg9snbgLmTJA1E4of2c
 b+1NKIUBFRTMSqVWH8P39l3B59hHKGO6Qm0bleYh4I3DspUVsRj8ZSN3PO5jKQQHLBV5F8
 DbBO+RiPQEbvQunmPc/EfMJE3mwwNc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881814;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/PqLVv5R28GeXf8S28jva92g8vZt4UTBJhiJLIJAt0o=;
 b=9ARLqZb8naEq+BzdCSbK5Iv+YYST9ukUeE7NnTS0R/FqjwCI9M+JQEuzauHHE04uCfUdpm
 FTx4evupRXTscxCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/PqLVv5R28GeXf8S28jva92g8vZt4UTBJhiJLIJAt0o=;
 b=ZCqlQk+LmlVBfBcT2SXDCHmxttUCFC+2EsjTytXxtpBpTurFRahZg9snbgLmTJA1E4of2c
 b+1NKIUBFRTMSqVWH8P39l3B59hHKGO6Qm0bleYh4I3DspUVsRj8ZSN3PO5jKQQHLBV5F8
 DbBO+RiPQEbvQunmPc/EfMJE3mwwNc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881814;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/PqLVv5R28GeXf8S28jva92g8vZt4UTBJhiJLIJAt0o=;
 b=9ARLqZb8naEq+BzdCSbK5Iv+YYST9ukUeE7NnTS0R/FqjwCI9M+JQEuzauHHE04uCfUdpm
 FTx4evupRXTscxCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 380DA13A84;
 Mon,  9 Sep 2024 11:36:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KGd9DNbd3malNAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Sep 2024 11:36:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH v4 40/80] drm/sun4i: Run DRM default client setup
Date: Mon,  9 Sep 2024 13:30:46 +0200
Message-ID: <20240909113633.595465-41-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909113633.595465-1-tzimmermann@suse.de>
References: <20240909113633.595465-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TAGGED_RCPT(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,kernel.org,csie.org,gmail.com,sholland.org];
 FROM_HAS_DN(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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

The sun4i driver specifies as preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 35d7a7ffd208..c3342789e3b0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -16,6 +16,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -55,6 +56,7 @@ static const struct drm_driver sun4i_drv_driver = {
 
 	/* GEM Operations */
 	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(drm_sun4i_gem_dumb_create),
+	DRM_FBDEV_DMA_DRIVER_OPS,
 };
 
 static int sun4i_drv_bind(struct device *dev)
@@ -111,7 +113,7 @@ static int sun4i_drv_bind(struct device *dev)
 	if (ret)
 		goto finish_poll;
 
-	drm_fbdev_dma_setup(drm, 32);
+	drm_client_setup(drm, NULL);
 
 	dev_set_drvdata(dev, drm);
 
-- 
2.46.0

