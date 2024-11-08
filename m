Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5219C20E3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 16:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D29510E9F4;
	Fri,  8 Nov 2024 15:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="W8J1A5Xg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="doyXSJFc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W8J1A5Xg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="doyXSJFc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DEE10E9F2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 15:46:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4EC8C1FE5C;
 Fri,  8 Nov 2024 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731080766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hPHP+Z9AqOfbMC10VUIcA7yH/vjh6suPmPyd6zOEcE=;
 b=W8J1A5XgIzEmUpzEDLKDpP65HgOlRkiGoj5VzenEThYJAAO5XLK5glRKf7u1G7z5csQw+E
 NFA7EV1scYih2OVxg5mB9Uh/gZAhOhFIctyklPm/Wnb5C1ByqtjFBfjFM8a+bXSMaRIyrO
 TRxrVxqOhYV/IECRmQW27uQDBZu2uQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731080766;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hPHP+Z9AqOfbMC10VUIcA7yH/vjh6suPmPyd6zOEcE=;
 b=doyXSJFcm2TOt7dMD33V6//YX+tkZGHID+S/iiqRXve46BH1DhWp3S0jNna9r13kTBf2LU
 Ec316rj7JSuCyVAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W8J1A5Xg;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=doyXSJFc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731080766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hPHP+Z9AqOfbMC10VUIcA7yH/vjh6suPmPyd6zOEcE=;
 b=W8J1A5XgIzEmUpzEDLKDpP65HgOlRkiGoj5VzenEThYJAAO5XLK5glRKf7u1G7z5csQw+E
 NFA7EV1scYih2OVxg5mB9Uh/gZAhOhFIctyklPm/Wnb5C1ByqtjFBfjFM8a+bXSMaRIyrO
 TRxrVxqOhYV/IECRmQW27uQDBZu2uQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731080766;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hPHP+Z9AqOfbMC10VUIcA7yH/vjh6suPmPyd6zOEcE=;
 b=doyXSJFcm2TOt7dMD33V6//YX+tkZGHID+S/iiqRXve46BH1DhWp3S0jNna9r13kTBf2LU
 Ec316rj7JSuCyVAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FC3013A6E;
 Fri,  8 Nov 2024 15:46:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kHaDAj4yLmcAHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Nov 2024 15:46:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm/fbdev-client: Unexport drm_fbdev_client_setup()
Date: Fri,  8 Nov 2024 16:42:39 +0100
Message-ID: <20241108154600.126162-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108154600.126162-1-tzimmermann@suse.de>
References: <20241108154600.126162-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4EC8C1FE5C
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,kernel.org,linux.intel.com,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

DRM drivers invoke drm_client_setup() to set up in-kernel clients.
No driver should call drm_fbdev_client_setup() directly. Therefore,
unexport the symbol and move the declaration to the internal header
drm_client_internal.h.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 .../gpu/drm/clients/drm_client_internal.h                     | 4 ++--
 drivers/gpu/drm/clients/drm_client_setup.c                    | 3 ++-
 drivers/gpu/drm/clients/drm_fbdev_client.c                    | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)
 rename include/drm/drm_fbdev_client.h => drivers/gpu/drm/clients/drm_client_internal.h (85%)

diff --git a/include/drm/drm_fbdev_client.h b/drivers/gpu/drm/clients/drm_client_internal.h
similarity index 85%
rename from include/drm/drm_fbdev_client.h
rename to drivers/gpu/drm/clients/drm_client_internal.h
index e11a5614f127..23258934956a 100644
--- a/include/drm/drm_fbdev_client.h
+++ b/drivers/gpu/drm/clients/drm_client_internal.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: MIT */
 
-#ifndef DRM_FBDEV_CLIENT_H
-#define DRM_FBDEV_CLIENT_H
+#ifndef DRM_CLIENT_INTERNAL_H
+#define DRM_CLIENT_INTERNAL_H
 
 struct drm_device;
 struct drm_format_info;
diff --git a/drivers/gpu/drm/clients/drm_client_setup.c b/drivers/gpu/drm/clients/drm_client_setup.c
index c6a295d5de50..4b211a4812b5 100644
--- a/drivers/gpu/drm/clients/drm_client_setup.c
+++ b/drivers/gpu/drm/clients/drm_client_setup.c
@@ -2,10 +2,11 @@
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fbdev_client.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_print.h>
 
+#include "drm_client_internal.h"
+
 /**
  * drm_client_setup() - Setup in-kernel DRM clients
  * @dev: DRM device
diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
index 246fb63ab250..f894ba52bdb5 100644
--- a/drivers/gpu/drm/clients/drm_fbdev_client.c
+++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
@@ -3,11 +3,12 @@
 #include <drm/drm_client.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_client.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_print.h>
 
+#include "drm_client_internal.h"
+
 /*
  * struct drm_client_funcs
  */
@@ -164,4 +165,3 @@ int drm_fbdev_client_setup(struct drm_device *dev, const struct drm_format_info
 	kfree(fb_helper);
 	return ret;
 }
-EXPORT_SYMBOL(drm_fbdev_client_setup);
-- 
2.47.0

