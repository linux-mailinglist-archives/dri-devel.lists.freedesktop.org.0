Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1382AC4071
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4375510E2A5;
	Mon, 26 May 2025 13:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="n5K4CPYV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zr5NfKQv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n5K4CPYV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zr5NfKQv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F086A10E2FB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:30:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 651061FDEE;
 Mon, 26 May 2025 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748266204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZ9aESIQxC0mSRB716GD5+RliHnc9PRFEmLet4enOPQ=;
 b=n5K4CPYVgJ4LXmFsAn10W0R/JFmcfrjg23EchIlUjeb70Kf6fXPvocosltofHLhxw0XYbi
 16j2ZVycSkj5LYNedoJVFoPluNn67FUmgsHf1woH/ouprtPweL9PUl3ZZiYwPA7aCRkxeJ
 /iYsUm5DAtp6B9c/Wap6qX4Rji7ZdA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748266204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZ9aESIQxC0mSRB716GD5+RliHnc9PRFEmLet4enOPQ=;
 b=zr5NfKQvfGXwRAKhDMi8xMfO8BV69MObsPq3XnNEjGqEIsvBf2m03z9zC0wfyxBBV2CmeJ
 MEBk63OKLFgIMECQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=n5K4CPYV;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zr5NfKQv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748266204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZ9aESIQxC0mSRB716GD5+RliHnc9PRFEmLet4enOPQ=;
 b=n5K4CPYVgJ4LXmFsAn10W0R/JFmcfrjg23EchIlUjeb70Kf6fXPvocosltofHLhxw0XYbi
 16j2ZVycSkj5LYNedoJVFoPluNn67FUmgsHf1woH/ouprtPweL9PUl3ZZiYwPA7aCRkxeJ
 /iYsUm5DAtp6B9c/Wap6qX4Rji7ZdA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748266204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZ9aESIQxC0mSRB716GD5+RliHnc9PRFEmLet4enOPQ=;
 b=zr5NfKQvfGXwRAKhDMi8xMfO8BV69MObsPq3XnNEjGqEIsvBf2m03z9zC0wfyxBBV2CmeJ
 MEBk63OKLFgIMECQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2AF3413984;
 Mon, 26 May 2025 13:30:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uF85CdxsNGgTOQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 26 May 2025 13:30:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, dmitry.osipenko@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/4] drm/client: Do not pin in drm_client_buffer_vmap()
Date: Mon, 26 May 2025 15:25:17 +0200
Message-ID: <20250526132634.531789-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526132634.531789-1-tzimmermann@suse.de>
References: <20250526132634.531789-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 651061FDEE
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_TO(0.00)[collabora.com,gmail.com,ffwll.ch,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Pin and vmap are two distict operations. Do not mix them.

The helper drm_client_buffer_vmap() maps the pages for fbdev-dma
and fbdev-shmem. In both cases, the vmap operation ensures that
the pages are available until the vunmap happens. And as the pages
in DMA or SHMEM areas cannot be moved, there is no reason to call
pin. Hence remove the pin call.

Update drm_client_buffer_vunmap() accordingly.

v2:
- call 'locked' variants of GEM helpers (Dmitry)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_client.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index f1de7faf9fb4..f7197a07c045 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -303,34 +303,17 @@ EXPORT_SYMBOL(drm_client_buffer_vunmap_local);
  * Returns:
  *	0 on success, or a negative errno code otherwise.
  */
-int
-drm_client_buffer_vmap(struct drm_client_buffer *buffer,
-		       struct iosys_map *map_copy)
+int drm_client_buffer_vmap(struct drm_client_buffer *buffer,
+			   struct iosys_map *map_copy)
 {
-	struct drm_gem_object *gem = buffer->gem;
-	struct iosys_map *map = &buffer->map;
 	int ret;
 
-	drm_gem_lock(gem);
-
-	ret = drm_gem_pin_locked(gem);
-	if (ret)
-		goto err_drm_gem_pin_locked;
-	ret = drm_gem_vmap_locked(gem, map);
+	ret = drm_gem_vmap(buffer->gem, &buffer->map);
 	if (ret)
-		goto err_drm_gem_vmap;
-
-	drm_gem_unlock(gem);
-
-	*map_copy = *map;
+		return ret;
+	*map_copy = buffer->map;
 
 	return 0;
-
-err_drm_gem_vmap:
-	drm_gem_unpin_locked(buffer->gem);
-err_drm_gem_pin_locked:
-	drm_gem_unlock(gem);
-	return ret;
 }
 EXPORT_SYMBOL(drm_client_buffer_vmap);
 
@@ -344,13 +327,7 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
  */
 void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 {
-	struct drm_gem_object *gem = buffer->gem;
-	struct iosys_map *map = &buffer->map;
-
-	drm_gem_lock(gem);
-	drm_gem_vunmap_locked(gem, map);
-	drm_gem_unpin_locked(gem);
-	drm_gem_unlock(gem);
+	drm_gem_vunmap(buffer->gem, &buffer->map);
 }
 EXPORT_SYMBOL(drm_client_buffer_vunmap);
 
-- 
2.49.0

