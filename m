Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F20A5C937
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 16:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E8110E5FE;
	Tue, 11 Mar 2025 15:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DhXUTb/i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q2ThJqFO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DhXUTb/i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q2ThJqFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E5210E607
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 15:55:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 58CF821185;
 Tue, 11 Mar 2025 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741708494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MlMXXFdQxI/n+TKAq4PasfKR7Xggh6ISrSBylzxHnYo=;
 b=DhXUTb/iC5eyGYFM8watz4DW/hkJMGd9JcPa/tgnIVFDiJJFtf91i0fvQR26f00aTWCsuN
 nfVuuL2WLHeSLOvizdMva2lWIWCwQUgtA71pFCDb9fZdCokrS3fRutFzmq86rzmv9RHJ+0
 iuhao6zVOS2L93zgyi1raYHbQB+Rh1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741708494;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MlMXXFdQxI/n+TKAq4PasfKR7Xggh6ISrSBylzxHnYo=;
 b=Q2ThJqFOQhpqBYA2FOTtUmRLXrBmkYP0VqLqBAj39dB5c4tKcRXXVPA8rmZn5ygc7Iyk6B
 0o9H4CtRMORYuvDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="DhXUTb/i";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Q2ThJqFO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741708494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MlMXXFdQxI/n+TKAq4PasfKR7Xggh6ISrSBylzxHnYo=;
 b=DhXUTb/iC5eyGYFM8watz4DW/hkJMGd9JcPa/tgnIVFDiJJFtf91i0fvQR26f00aTWCsuN
 nfVuuL2WLHeSLOvizdMva2lWIWCwQUgtA71pFCDb9fZdCokrS3fRutFzmq86rzmv9RHJ+0
 iuhao6zVOS2L93zgyi1raYHbQB+Rh1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741708494;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MlMXXFdQxI/n+TKAq4PasfKR7Xggh6ISrSBylzxHnYo=;
 b=Q2ThJqFOQhpqBYA2FOTtUmRLXrBmkYP0VqLqBAj39dB5c4tKcRXXVPA8rmZn5ygc7Iyk6B
 0o9H4CtRMORYuvDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C291413AFE;
 Tue, 11 Mar 2025 15:54:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CIsbLs1c0GdUdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:54:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
 tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v4 11/25] drm/loongson: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:15 +0100
Message-ID: <20250311155120.442633-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
References: <20250311155120.442633-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 58CF821185
X-Spam-Level: 
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[22];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,linux.dev:email];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_TRACE(0.00)[suse.de:+]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51
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

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch according to hardware requirements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/loongson/lsdc_gem.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
index a720d8f53209..9f982b85301f 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.c
+++ b/drivers/gpu/drm/loongson/lsdc_gem.c
@@ -6,6 +6,7 @@
 #include <linux/dma-buf.h>
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_prime.h>
@@ -204,45 +205,31 @@ int lsdc_dumb_create(struct drm_file *file, struct drm_device *ddev,
 	const struct lsdc_desc *descp = ldev->descp;
 	u32 domain = LSDC_GEM_DOMAIN_VRAM;
 	struct drm_gem_object *gobj;
-	size_t size;
-	u32 pitch;
-	u32 handle;
 	int ret;
 
-	if (!args->width || !args->height)
-		return -EINVAL;
-
-	if (args->bpp != 32 && args->bpp != 16)
-		return -EINVAL;
-
-	pitch = args->width * args->bpp / 8;
-	pitch = ALIGN(pitch, descp->pitch_align);
-	size = pitch * args->height;
-	size = ALIGN(size, PAGE_SIZE);
+	ret = drm_mode_size_dumb(ddev, args, descp->pitch_align, 0);
+	if (ret)
+		return ret;
 
 	/* Maximum single bo size allowed is the half vram size available */
-	if (size > ldev->vram_size / 2) {
-		drm_err(ddev, "Requesting(%zuMiB) failed\n", size >> 20);
+	if (args->size > ldev->vram_size / 2) {
+		drm_err(ddev, "Requesting(%zuMiB) failed\n", (size_t)(args->size >> PAGE_SHIFT));
 		return -ENOMEM;
 	}
 
-	gobj = lsdc_gem_object_create(ddev, domain, size, false, NULL, NULL);
+	gobj = lsdc_gem_object_create(ddev, domain, args->size, false, NULL, NULL);
 	if (IS_ERR(gobj)) {
 		drm_err(ddev, "Failed to create gem object\n");
 		return PTR_ERR(gobj);
 	}
 
-	ret = drm_gem_handle_create(file, gobj, &handle);
+	ret = drm_gem_handle_create(file, gobj, &args->handle);
 
 	/* drop reference from allocate, handle holds it now */
 	drm_gem_object_put(gobj);
 	if (ret)
 		return ret;
 
-	args->pitch = pitch;
-	args->size = size;
-	args->handle = handle;
-
 	return 0;
 }
 
-- 
2.48.1

