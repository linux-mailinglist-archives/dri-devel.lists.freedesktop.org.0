Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07076AC4073
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633CE10E353;
	Mon, 26 May 2025 13:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ggf6C4xE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sk3EAsyN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ggf6C4xE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sk3EAsyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C480910E320
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:30:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A61801FE01;
 Mon, 26 May 2025 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748266204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkmrDEJrJZdNxysFAHEP1q77ZVOd4z6Pm7up/XfjQn8=;
 b=ggf6C4xEewDDNoyLGj4EE60d5c6gaCn3VCTFpMo+a4enVo6ZSSWFnRjNZAQxc2iSSVcmUj
 gwjLATNNN3HqG8au6e3YF7NMOwZE+9rHcu15UORVn+nXN82M4bjh8MND72ZMqNuT3kroeJ
 ptEADIGou2JIRgfh31FrOeW5Y458Cmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748266204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkmrDEJrJZdNxysFAHEP1q77ZVOd4z6Pm7up/XfjQn8=;
 b=sk3EAsyNbAT69J3yZquRczS8u0gAot6369ZbxfJOKgXUtWN/oPF2XNAar1/jN7SeJv9WM6
 jrNHKg+tDjhTaBCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748266204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkmrDEJrJZdNxysFAHEP1q77ZVOd4z6Pm7up/XfjQn8=;
 b=ggf6C4xEewDDNoyLGj4EE60d5c6gaCn3VCTFpMo+a4enVo6ZSSWFnRjNZAQxc2iSSVcmUj
 gwjLATNNN3HqG8au6e3YF7NMOwZE+9rHcu15UORVn+nXN82M4bjh8MND72ZMqNuT3kroeJ
 ptEADIGou2JIRgfh31FrOeW5Y458Cmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748266204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkmrDEJrJZdNxysFAHEP1q77ZVOd4z6Pm7up/XfjQn8=;
 b=sk3EAsyNbAT69J3yZquRczS8u0gAot6369ZbxfJOKgXUtWN/oPF2XNAar1/jN7SeJv9WM6
 jrNHKg+tDjhTaBCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C3C81397F;
 Mon, 26 May 2025 13:30:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iHspGdxsNGgTOQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 26 May 2025 13:30:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, dmitry.osipenko@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/4] drm/gem-vram: Do not set pin and unpin callbacks
Date: Mon, 26 May 2025 15:25:18 +0200
Message-ID: <20250526132634.531789-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526132634.531789-1-tzimmermann@suse.de>
References: <20250526132634.531789-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.997];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[collabora.com,gmail.com,ffwll.ch,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
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

Gem-vram helpers do not support PRIME dma-buf sharing. So nothing
will ever call pin/unpin on its buffer objects. Do not set these
callbacks in struct drm_gem_object_funcs.

v2:
- fix typo in commit description

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 37 ---------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 22b1fe9c03b8..c73480d31836 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -689,41 +689,6 @@ EXPORT_SYMBOL(drm_gem_vram_plane_helper_cleanup_fb);
  * PRIME helpers
  */
 
-/**
- * drm_gem_vram_object_pin() - Implements &struct drm_gem_object_funcs.pin
- * @gem:	The GEM object to pin
- *
- * Returns:
- * 0 on success, or
- * a negative errno code otherwise.
- */
-static int drm_gem_vram_object_pin(struct drm_gem_object *gem)
-{
-	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
-
-	/*
-	 * Fbdev console emulation is the use case of these PRIME
-	 * helpers. This may involve updating a hardware buffer from
-	 * a shadow FB. We pin the buffer to it's current location
-	 * (either video RAM or system memory) to prevent it from
-	 * being relocated during the update operation. If you require
-	 * the buffer to be pinned to VRAM, implement a callback that
-	 * sets the flags accordingly.
-	 */
-	return drm_gem_vram_pin_locked(gbo, 0);
-}
-
-/**
- * drm_gem_vram_object_unpin() - Implements &struct drm_gem_object_funcs.unpin
- * @gem:	The GEM object to unpin
- */
-static void drm_gem_vram_object_unpin(struct drm_gem_object *gem)
-{
-	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
-
-	drm_gem_vram_unpin_locked(gbo);
-}
-
 /**
  * drm_gem_vram_object_vmap() -
  *	Implements &struct drm_gem_object_funcs.vmap
@@ -762,8 +727,6 @@ static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem,
 
 static const struct drm_gem_object_funcs drm_gem_vram_object_funcs = {
 	.free	= drm_gem_vram_object_free,
-	.pin	= drm_gem_vram_object_pin,
-	.unpin	= drm_gem_vram_object_unpin,
 	.vmap	= drm_gem_vram_object_vmap,
 	.vunmap	= drm_gem_vram_object_vunmap,
 	.mmap   = drm_gem_ttm_mmap,
-- 
2.49.0

