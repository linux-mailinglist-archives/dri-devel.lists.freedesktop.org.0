Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79171C0D6AD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADE310E45B;
	Mon, 27 Oct 2025 12:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="c/Otg/Yp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q/d2+98R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c/Otg/Yp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q/d2+98R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC59D10E474
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:10:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90CF31F452;
 Mon, 27 Oct 2025 12:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761567051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=unC5deLDcQkyZ72QUpOUYEpxLJPEdF8dFFv1SDrcre0=;
 b=c/Otg/Yp2d4/EE1o29hhVeDhaCRNaeEiSiv2JQHGCFPpsBBdYRnExsT+cAhjggeu+allo4
 nalYscALHmcghqp8UsRCKkmvE7yO7QI+MMuU563YZ6hyHmMkgbQP3ZrSjRl+PmzOisFeby
 h/QxJuEKo/DQRjFWetyz3rehEvk9Sy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761567051;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=unC5deLDcQkyZ72QUpOUYEpxLJPEdF8dFFv1SDrcre0=;
 b=Q/d2+98R2jW691puA7HvF1VLCpgNbX4K4mrszsVSrn+jhLQStKfcikZg98eR84GQ0Jw8P6
 SUuRuL0dM0KBd3Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761567051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=unC5deLDcQkyZ72QUpOUYEpxLJPEdF8dFFv1SDrcre0=;
 b=c/Otg/Yp2d4/EE1o29hhVeDhaCRNaeEiSiv2JQHGCFPpsBBdYRnExsT+cAhjggeu+allo4
 nalYscALHmcghqp8UsRCKkmvE7yO7QI+MMuU563YZ6hyHmMkgbQP3ZrSjRl+PmzOisFeby
 h/QxJuEKo/DQRjFWetyz3rehEvk9Sy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761567051;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=unC5deLDcQkyZ72QUpOUYEpxLJPEdF8dFFv1SDrcre0=;
 b=Q/d2+98R2jW691puA7HvF1VLCpgNbX4K4mrszsVSrn+jhLQStKfcikZg98eR84GQ0Jw8P6
 SUuRuL0dM0KBd3Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CAC913AAB;
 Mon, 27 Oct 2025 12:10:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kEKFEUth/2gDAwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 12:10:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, francesco@valla.it,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/7] drm/client: Move dumb-buffer handling to
 drm_client_framebuffer_create()
Date: Mon, 27 Oct 2025 13:09:13 +0100
Message-ID: <20251027121042.143588-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027121042.143588-1-tzimmermann@suse.de>
References: <20251027121042.143588-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,valla.it,gmail.com];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Dumb-buffer creation within the client code is asymetrically balanced
across drm_client_buffer_create() and drm_client_framebuffer_create().
Put all dumb-buffer code into drm_client_framebuffer_create() and leave
client-buffer initialization to drm_client_buffer_create(). Clarifies
responsibility between these functions.

Apart form the architectural improvements, drm_client_buffer_create()
can now be exported if needed by clients. The client will be able to
initialize buffers that have been created from other interfaces than
dumb buffers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_client.c | 56 +++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 82b871d62313..5ad82ab8b15f 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -188,11 +188,8 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 
 static struct drm_client_buffer *
 drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
-			 u32 format, u32 *handle, u32 *pitch)
+			 u32 format, u32 handle, u32 pitch)
 {
-	const struct drm_format_info *info = drm_format_info(format);
-	struct drm_mode_create_dumb dumb_args = { };
-	struct drm_device *dev = client->dev;
 	struct drm_client_buffer *buffer;
 	struct drm_gem_object *obj;
 	int ret;
@@ -203,28 +200,18 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
 
 	buffer->client = client;
 
-	dumb_args.width = width;
-	dumb_args.height = height;
-	dumb_args.bpp = drm_format_info_bpp(info, 0);
-	ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
-	if (ret)
-		goto err_delete;
-
-	obj = drm_gem_object_lookup(client->file, dumb_args.handle);
+	obj = drm_gem_object_lookup(client->file, handle);
 	if (!obj)  {
 		ret = -ENOENT;
 		goto err_delete;
 	}
 
 	buffer->gem = obj;
-	*handle = dumb_args.handle;
-	*pitch = dumb_args.pitch;
 
 	return buffer;
 
 err_delete:
-	drm_client_buffer_delete(buffer);
-
+	kfree(buffer);
 	return ERR_PTR(ret);
 }
 
@@ -398,16 +385,30 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
 struct drm_client_buffer *
 drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
 {
+	const struct drm_format_info *info = drm_format_info(format);
+	struct drm_device *dev = client->dev;
+	struct drm_mode_create_dumb dumb_args = { };
 	struct drm_client_buffer *buffer;
-	u32 handle, pitch;
 	int ret;
 
+	dumb_args.width = width;
+	dumb_args.height = height;
+	dumb_args.bpp = drm_format_info_bpp(info, 0);
+	ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
+	if (ret)
+		return ERR_PTR(ret);
+
 	buffer = drm_client_buffer_create(client, width, height, format,
-					  &handle, &pitch);
-	if (IS_ERR(buffer))
-		return buffer;
+					  dumb_args.handle, dumb_args.pitch);
+	if (IS_ERR(buffer)) {
+		ret = PTR_ERR(buffer);
+		goto err_drm_mode_destroy_dumb;
+	}
 
-	ret = drm_client_buffer_addfb(buffer, width, height, format, handle, pitch);
+	ret = drm_client_buffer_addfb(buffer, width, height, format,
+				      dumb_args.handle, dumb_args.pitch);
+	if (ret)
+		goto err_drm_client_buffer_delete;
 
 	/*
 	 * The handle is only needed for creating the framebuffer, destroy it
@@ -415,14 +416,15 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
 	 * object as DMA-buf. The framebuffer and our buffer structure are still
 	 * holding references to the GEM object to prevent its destruction.
 	 */
-	drm_mode_destroy_dumb(client->dev, handle, client->file);
-
-	if (ret) {
-		drm_client_buffer_delete(buffer);
-		return ERR_PTR(ret);
-	}
+	drm_mode_destroy_dumb(client->dev, dumb_args.handle, client->file);
 
 	return buffer;
+
+err_drm_client_buffer_delete:
+	drm_client_buffer_delete(buffer);
+err_drm_mode_destroy_dumb:
+	drm_mode_destroy_dumb(client->dev, dumb_args.handle, client->file);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL(drm_client_framebuffer_create);
 
-- 
2.51.1

