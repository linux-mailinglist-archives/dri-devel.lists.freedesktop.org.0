Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEA8C0D6B9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908D510E46F;
	Mon, 27 Oct 2025 12:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FPEOWNb4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kue7iAyN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k9/ZDj/Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lb3zpmue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA3310E451
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:11:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EF16C1F45F;
 Mon, 27 Oct 2025 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761567053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fHffMmC+vqGoqoswvQNTvrm+9ChLswQYw+q5pDqF0Qo=;
 b=FPEOWNb4Na1Wb77kSTL7OulKyAvC5yHndR1An3Av7zfFgNsYTDclVv0W7TFDC6LYZUO21e
 Ti66abtBJAfM8NgQUNJOyMFGTHtjZ5+RbKfLGVG+SYi/5bjHAdIscaLbhXRJRbWYtif+76
 uHL0TyDFIrfCrwg3pp9IrzUMA+mst1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761567053;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fHffMmC+vqGoqoswvQNTvrm+9ChLswQYw+q5pDqF0Qo=;
 b=kue7iAyNXBjUkU+u7Z52mw108yeNMilL2Hm6MU8w2tr8Upk2ITESyBmCgtU3aBVOi/2v6g
 Wd3LkZVzayP03lCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="k9/ZDj/Z";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Lb3zpmue
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761567052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fHffMmC+vqGoqoswvQNTvrm+9ChLswQYw+q5pDqF0Qo=;
 b=k9/ZDj/ZzKLjO/tHpKNiZrAvxNyddcItji0KZ0dAeMpO6tz1K6BHi1cwtfqwzvJIh3oY8X
 X86FbQqoJmoTQ59h+9xJB20VzinqDbFWjI2inwjTiDfnJ9twHbF22WZuzA8GRUyj9tFKJ1
 N5+M/IylS6eLCq/hFZy/jPTPTkxEZ0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761567052;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fHffMmC+vqGoqoswvQNTvrm+9ChLswQYw+q5pDqF0Qo=;
 b=Lb3zpmueu8PzOYewC6fU4tCoUF0haBurERsLgJ3dSwnULYC/smUdhL5tIolJqWTnWOGfk/
 /tW/vpMS30cJKADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B228D13693;
 Mon, 27 Oct 2025 12:10:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aGJMKkxh/2gDAwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 12:10:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, francesco@valla.it,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 7/7] drm/client: Flush client buffers with
 drm_client_buffer_sync()
Date: Mon, 27 Oct 2025 13:09:18 +0100
Message-ID: <20251027121042.143588-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027121042.143588-1-tzimmermann@suse.de>
References: <20251027121042.143588-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: EF16C1F45F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,valla.it,gmail.com];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9];
 R_RATELIMIT(0.00)[to_ip_from(RLo585esf9b7txaosbn5shab9z)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Rename drm_client_framebuffer_flush() to drm_cient_buffer_flush() and
adapt its callers. The old name was left over from previous naming
conventions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/clients/drm_log.c | 4 ++--
 drivers/gpu/drm/drm_client.c      | 8 ++++----
 include/drm/drm_client.h          | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index 48636bb1a21e..19e55aa0ed74 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -100,7 +100,7 @@ static void drm_log_clear_line(struct drm_log_scanout *scanout, u32 line)
 		return;
 	iosys_map_memset(&map, r.y1 * fb->pitches[0], 0, height * fb->pitches[0]);
 	drm_client_buffer_vunmap_local(scanout->buffer);
-	drm_client_framebuffer_flush(scanout->buffer, &r);
+	drm_client_buffer_flush(scanout->buffer, &r);
 }
 
 static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
@@ -133,7 +133,7 @@ static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
 	if (scanout->line >= scanout->rows)
 		scanout->line = 0;
 	drm_client_buffer_vunmap_local(scanout->buffer);
-	drm_client_framebuffer_flush(scanout->buffer, &r);
+	drm_client_buffer_flush(scanout->buffer, &r);
 }
 
 static void drm_log_draw_new_line(struct drm_log_scanout *scanout,
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index e7dfbdeca45a..504ec5bdfa2c 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -430,8 +430,8 @@ drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 heig
 EXPORT_SYMBOL(drm_client_buffer_create_dumb);
 
 /**
- * drm_client_framebuffer_flush - Manually flush client framebuffer
- * @buffer: DRM client buffer (can be NULL)
+ * drm_client_buffer_flush - Manually flush client buffer
+ * @buffer: DRM client buffer
  * @rect: Damage rectangle (if NULL flushes all)
  *
  * This calls &drm_framebuffer_funcs->dirty (if present) to flush buffer changes
@@ -440,7 +440,7 @@ EXPORT_SYMBOL(drm_client_buffer_create_dumb);
  * Returns:
  * Zero on success or negative error code on failure.
  */
-int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect)
+int drm_client_buffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect)
 {
 	if (!buffer || !buffer->fb || !buffer->fb->funcs->dirty)
 		return 0;
@@ -460,4 +460,4 @@ int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_re
 	return buffer->fb->funcs->dirty(buffer->fb, buffer->client->file,
 					0, 0, NULL, 0);
 }
-EXPORT_SYMBOL(drm_client_framebuffer_flush);
+EXPORT_SYMBOL(drm_client_buffer_flush);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 690ef04fccce..5ecde0f6f591 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -196,7 +196,7 @@ struct drm_client_buffer {
 struct drm_client_buffer *
 drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 height, u32 format);
 void drm_client_buffer_delete(struct drm_client_buffer *buffer);
-int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
+int drm_client_buffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
 int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
 				 struct iosys_map *map_copy);
 void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer);
-- 
2.51.1

