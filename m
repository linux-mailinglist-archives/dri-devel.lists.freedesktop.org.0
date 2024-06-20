Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC388910902
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0B310EA5D;
	Thu, 20 Jun 2024 14:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QtxF2Zb4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wuSi7y7F";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QtxF2Zb4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wuSi7y7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D9B10EA5D;
 Thu, 20 Jun 2024 14:52:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1811021AE8;
 Thu, 20 Jun 2024 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718895164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOLTsgS3rodnP1JJ6EhracYKW9pB+FzDfOT1O5t/xGU=;
 b=QtxF2Zb4ZbYQXQnJvXLQQ3HPnH/OILoA7+rocntc6sFsLyHtycJKeqwsw1xMPYSSBcxnh8
 MMfUlVCUrxAAIedQY91N1Y6iwUIdif9HF9kgzpvCtBhcTTB6qmHjhUY5iw5aGfcqbOhPhB
 DOF2/pFEoiS6v0FVt6SKl532eLscMTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718895164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOLTsgS3rodnP1JJ6EhracYKW9pB+FzDfOT1O5t/xGU=;
 b=wuSi7y7FNVPWLyKPpZI2q5c19HgcHjXGNfvNfK6LMkYqWXZX2GSsOm8m/W2XVBU7ewEEzs
 JqBnmAOQj9qg97BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718895164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOLTsgS3rodnP1JJ6EhracYKW9pB+FzDfOT1O5t/xGU=;
 b=QtxF2Zb4ZbYQXQnJvXLQQ3HPnH/OILoA7+rocntc6sFsLyHtycJKeqwsw1xMPYSSBcxnh8
 MMfUlVCUrxAAIedQY91N1Y6iwUIdif9HF9kgzpvCtBhcTTB6qmHjhUY5iw5aGfcqbOhPhB
 DOF2/pFEoiS6v0FVt6SKl532eLscMTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718895164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOLTsgS3rodnP1JJ6EhracYKW9pB+FzDfOT1O5t/xGU=;
 b=wuSi7y7FNVPWLyKPpZI2q5c19HgcHjXGNfvNfK6LMkYqWXZX2GSsOm8m/W2XVBU7ewEEzs
 JqBnmAOQj9qg97BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB6121369F;
 Thu, 20 Jun 2024 14:52:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sEdpMDtCdGZ+aQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Jun 2024 14:52:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, felix.kuehling@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm/amdgpu: Convert to ttm_bo_vmap() et al
Date: Thu, 20 Jun 2024 16:44:41 +0200
Message-ID: <20240620145238.25295-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620145238.25295-1-tzimmermann@suse.de>
References: <20240620145238.25295-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Replace each call to ttm_bo_kmap() with a call to ttm_bo_vmap().
Same for ttm_bo_kunmap() and ttm_bo_vunmap(). There's now one less
driver depending on the deprecated ttm_bo_kmap().

Also allows for dropping struct ttm_bo_kmap_obj in favor of struct
iosys_map, which is the preferred representation of BO memory mappings.
Manual type conversion in amdgpu_bo_kptr() is required to make the
returned pointer usable within amdgpu. In a follow-up patch, amdgpu
should be convert to use struct iosys_map directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 16 ++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  4 +++-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index d58b11ea0ead5..baa60e25c13e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -62,7 +62,7 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
 	 * BO memory pages should be unmapped at this point. Call
 	 * amdgpu_bo_kunmap() before releasing the BO.
 	 */
-	if (drm_WARN_ON_ONCE(bo->tbo.base.dev, bo->kmap.bo))
+	if (drm_WARN_ON_ONCE(bo->tbo.base.dev, !iosys_map_is_null(&bo->map)))
 		amdgpu_bo_kunmap(bo);
 
 	if (bo->tbo.base.import_attach)
@@ -802,7 +802,7 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
 		return 0;
 	}
 
-	r = ttm_bo_kmap(&bo->tbo, 0, PFN_UP(bo->tbo.base.size), &bo->kmap);
+	r = ttm_bo_vmap(&bo->tbo, &bo->map);
 	if (r)
 		return r;
 
@@ -823,9 +823,12 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
  */
 void *amdgpu_bo_kptr(struct amdgpu_bo *bo)
 {
-	bool is_iomem;
+	if (iosys_map_is_null(&bo->map))
+		return NULL;
+	if (bo->map.is_iomem)
+		return (void __force *)bo->map.vaddr_iomem;
 
-	return ttm_kmap_obj_virtual(&bo->kmap, &is_iomem);
+	return bo->map.vaddr;
 }
 
 /**
@@ -836,8 +839,9 @@ void *amdgpu_bo_kptr(struct amdgpu_bo *bo)
  */
 void amdgpu_bo_kunmap(struct amdgpu_bo *bo)
 {
-	if (bo->kmap.bo)
-		ttm_bo_kunmap(&bo->kmap);
+	if (iosys_map_is_null(&bo->map))
+		return;
+	ttm_bo_vunmap(&bo->tbo, &bo->map);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index bc42ccbde659a..553a92303339f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -28,6 +28,8 @@
 #ifndef __AMDGPU_OBJECT_H__
 #define __AMDGPU_OBJECT_H__
 
+#include <linux/iosys-map.h>
+
 #include <drm/amdgpu_drm.h>
 #include "amdgpu.h"
 #include "amdgpu_res_cursor.h"
@@ -99,7 +101,7 @@ struct amdgpu_bo {
 	struct ttm_place		placements[AMDGPU_BO_MAX_PLACEMENTS];
 	struct ttm_placement		placement;
 	struct ttm_buffer_object	tbo;
-	struct ttm_bo_kmap_obj		kmap;
+	struct iosys_map		map;
 	u64				flags;
 	/* per VM structure for page tables and with virtual addresses */
 	struct amdgpu_vm_bo_base	*vm_bo;
-- 
2.45.2

