Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2658CA88329
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A73510E5D9;
	Mon, 14 Apr 2025 13:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nTFM2061";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N2DA2MOg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nTFM2061";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N2DA2MOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E49410E5E8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:51:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F819211FF;
 Mon, 14 Apr 2025 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744638689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bRfCySrWusrkYHLB25r2Msg4X9ZWoDjCFT/JyQwBOHg=;
 b=nTFM2061Vj9C1EwxGd9b1ozNsYyGmfyXqlr646wJELoK1/Ur3mCbUFXblOdaX/l+4lqsC8
 +/lbPfr8lFVEhUqQq+yEu0ET6UMlxQzsUgQaSLpS1LD4k5OZv9urT1tM6+Im2yYDl9FSqP
 zWVu1l4KjVU3+dPFtXPAS5CXUcqBYFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744638689;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bRfCySrWusrkYHLB25r2Msg4X9ZWoDjCFT/JyQwBOHg=;
 b=N2DA2MOgU55xngQNNe93xb9erh+lxoIZ0m7Fk3jkndUuwmvBaNf+5lMauhZvACcQIJIZ9R
 PenWTlwPAOjmBXAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744638689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bRfCySrWusrkYHLB25r2Msg4X9ZWoDjCFT/JyQwBOHg=;
 b=nTFM2061Vj9C1EwxGd9b1ozNsYyGmfyXqlr646wJELoK1/Ur3mCbUFXblOdaX/l+4lqsC8
 +/lbPfr8lFVEhUqQq+yEu0ET6UMlxQzsUgQaSLpS1LD4k5OZv9urT1tM6+Im2yYDl9FSqP
 zWVu1l4KjVU3+dPFtXPAS5CXUcqBYFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744638689;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bRfCySrWusrkYHLB25r2Msg4X9ZWoDjCFT/JyQwBOHg=;
 b=N2DA2MOgU55xngQNNe93xb9erh+lxoIZ0m7Fk3jkndUuwmvBaNf+5lMauhZvACcQIJIZ9R
 PenWTlwPAOjmBXAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0C5513A87;
 Mon, 14 Apr 2025 13:51:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WEeFNeAS/We6BQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Apr 2025 13:51:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Subject: [PATCH 10/11] drm/xe: Test for imported buffers with
 drm_gem_is_imported()
Date: Mon, 14 Apr 2025 15:48:17 +0200
Message-ID: <20250414134821.568225-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[10];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,kernel.org,linux.intel.com];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid, intel.com:email,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
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

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The helper tests the dma_buf
itself while import_attach is just an artifact of the import. Prepares
to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c337790c81ae..adb69e0bbcb4 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -749,7 +749,7 @@ static int xe_bo_move_notify(struct xe_bo *bo,
 		return ret;
 
 	/* Don't call move_notify() for imported dma-bufs. */
-	if (ttm_bo->base.dma_buf && !ttm_bo->base.import_attach)
+	if (ttm_bo->base.dma_buf && !drm_gem_is_imported(&ttm_bo->base))
 		dma_buf_move_notify(ttm_bo->base.dma_buf);
 
 	/*
@@ -1514,7 +1514,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	struct xe_tile *tile;
 	u8 id;
 
-	if (bo->ttm.base.import_attach)
+	if (drm_gem_is_imported(&bo->ttm.base))
 		drm_prime_gem_destroy(&bo->ttm.base, NULL);
 	drm_gem_object_release(&bo->ttm.base);
 
@@ -2228,7 +2228,7 @@ int xe_bo_pin(struct xe_bo *bo)
 	 * No reason we can't support pinning imported dma-bufs we just don't
 	 * expect to pin an imported dma-buf.
 	 */
-	xe_assert(xe, !bo->ttm.base.import_attach);
+	xe_assert(xe, !drm_gem_is_imported(&bo->ttm.base));
 
 	/* We only expect at most 1 pin */
 	xe_assert(xe, !xe_bo_is_pinned(bo));
@@ -2298,7 +2298,7 @@ void xe_bo_unpin(struct xe_bo *bo)
 	struct ttm_place *place = &bo->placements[0];
 	struct xe_device *xe = xe_bo_device(bo);
 
-	xe_assert(xe, !bo->ttm.base.import_attach);
+	xe_assert(xe, !drm_gem_is_imported(&bo->ttm.base));
 	xe_assert(xe, xe_bo_is_pinned(bo));
 
 	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
-- 
2.49.0

