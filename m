Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C073BCB027E
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D722E10E5F0;
	Tue,  9 Dec 2025 14:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="juz1izym";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1j1ZJNPH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="juz1izym";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1j1ZJNPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA9310E5F9
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:02:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7AB4E33818;
 Tue,  9 Dec 2025 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765288923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+roIPoSEFwrhu3eugBn54tWeebYmAzlueWnYzrESdk=;
 b=juz1izymCd+Bfu7UCxF1ZIqa4nDeyLuZjP4uo1vVe+99mwfsW1LZz4IrGwY1w2z0NP3BRA
 8WnlVP8osHGqstL5WUFGpFz2FbIt9Kg6RD+/I2zyizcR/fqKLT/pI12EKj2I9wBqtm5Th4
 U/c0EYWJ6TireqFbCjWwtMEUHmD0FDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765288923;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+roIPoSEFwrhu3eugBn54tWeebYmAzlueWnYzrESdk=;
 b=1j1ZJNPHi/xvrdh+WpyuChH4WiptOEhvC9w53KEHNdUr84V7OAxj1iWUIVJBZxdKZ5qXMq
 z0ZvAtHP/NfNOeBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765288923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+roIPoSEFwrhu3eugBn54tWeebYmAzlueWnYzrESdk=;
 b=juz1izymCd+Bfu7UCxF1ZIqa4nDeyLuZjP4uo1vVe+99mwfsW1LZz4IrGwY1w2z0NP3BRA
 8WnlVP8osHGqstL5WUFGpFz2FbIt9Kg6RD+/I2zyizcR/fqKLT/pI12EKj2I9wBqtm5Th4
 U/c0EYWJ6TireqFbCjWwtMEUHmD0FDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765288923;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+roIPoSEFwrhu3eugBn54tWeebYmAzlueWnYzrESdk=;
 b=1j1ZJNPHi/xvrdh+WpyuChH4WiptOEhvC9w53KEHNdUr84V7OAxj1iWUIVJBZxdKZ5qXMq
 z0ZvAtHP/NfNOeBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 613E73EA63;
 Tue,  9 Dec 2025 14:02:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OBzXFdorOGm1OgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:02:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, ogabbay@kernel.org,
 mamin506@gmail.com, lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/13] accel/ivpu: Use GEM-UMA helpers for memory management
Date: Tue,  9 Dec 2025 14:42:09 +0100
Message-ID: <20251209140141.94407-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209140141.94407-1-tzimmermann@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCPT_COUNT_TWELVE(0.00)[29]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[collabora.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,tomeuvizoso.net,imgtec.com,arm.com,igalia.com,redhat.com,chromium.org,lwn.net];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLzxzh56npx61idbi11ft8b9pb)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

Convert ivpu from GEM-SHMEM to GEM-UMA. The latter is just a copy,
so this change it merely renaming symbols. No functional changes.

GEM-SHMEM will become more self-contained for drivers without specific
memory management. GEM-UMA's interfaces will remain flexible for drivers
with UMA hardware, such as ivpu.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/accel/ivpu/Kconfig    |  2 +-
 drivers/accel/ivpu/ivpu_gem.c | 36 +++++++++++++++++------------------
 drivers/accel/ivpu/ivpu_gem.h |  4 ++--
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/accel/ivpu/Kconfig b/drivers/accel/ivpu/Kconfig
index 9e055b5ce03d..49ca139a9d31 100644
--- a/drivers/accel/ivpu/Kconfig
+++ b/drivers/accel/ivpu/Kconfig
@@ -5,8 +5,8 @@ config DRM_ACCEL_IVPU
 	depends on DRM_ACCEL
 	depends on X86_64 && !UML
 	depends on PCI && PCI_MSI
+	select DRM_GEM_UMA_HELPER
 	select FW_LOADER
-	select DRM_GEM_SHMEM_HELPER
 	select GENERIC_ALLOCATOR
 	select WANT_DEV_COREDUMP
 	help
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index ece68f570b7e..7f4aeb482efb 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -84,7 +84,7 @@ int __must_check ivpu_bo_bind(struct ivpu_bo *bo)
 	if (bo->base.base.import_attach)
 		sgt = ivpu_bo_map_attachment(vdev, bo);
 	else
-		sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
+		sgt = drm_gem_uma_get_pages_sgt(&bo->base);
 	if (IS_ERR(sgt)) {
 		ret = PTR_ERR(sgt);
 		ivpu_err(vdev, "Failed to map BO in IOMMU: %d\n", ret);
@@ -223,7 +223,7 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
 
 	get_dma_buf(dma_buf);
 
-	obj = drm_gem_shmem_prime_import_sg_table(dev, attach, NULL);
+	obj = drm_gem_uma_prime_import_sg_table(dev, attach, NULL);
 	if (IS_ERR(obj)) {
 		ret = PTR_ERR(obj);
 		goto fail_detach;
@@ -251,7 +251,7 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
 
 static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags)
 {
-	struct drm_gem_shmem_object *shmem;
+	struct drm_gem_uma_object *uma;
 	struct ivpu_bo *bo;
 
 	switch (flags & DRM_IVPU_BO_CACHE_MASK) {
@@ -262,11 +262,11 @@ static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 fla
 		return ERR_PTR(-EINVAL);
 	}
 
-	shmem = drm_gem_shmem_create(&vdev->drm, size);
-	if (IS_ERR(shmem))
-		return ERR_CAST(shmem);
+	uma = drm_gem_uma_create(&vdev->drm, size);
+	if (IS_ERR(uma))
+		return ERR_CAST(uma);
 
-	bo = to_ivpu_bo(&shmem->base);
+	bo = to_ivpu_bo(&uma->base);
 	bo->base.map_wc = flags & DRM_IVPU_BO_WC;
 	bo->flags = flags;
 
@@ -330,7 +330,7 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
 
 	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
 	drm_WARN_ON(obj->dev, bo->base.base.vma_node.vm_files.rb_node);
-	drm_gem_shmem_free(&bo->base);
+	drm_gem_uma_free(&bo->base);
 }
 
 static enum drm_gem_object_status ivpu_gem_status(struct drm_gem_object *obj)
@@ -347,15 +347,15 @@ static enum drm_gem_object_status ivpu_gem_status(struct drm_gem_object *obj)
 static const struct drm_gem_object_funcs ivpu_gem_funcs = {
 	.free = ivpu_gem_bo_free,
 	.open = ivpu_gem_bo_open,
-	.print_info = drm_gem_shmem_object_print_info,
-	.pin = drm_gem_shmem_object_pin,
-	.unpin = drm_gem_shmem_object_unpin,
-	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
+	.print_info = drm_gem_uma_object_print_info,
+	.pin = drm_gem_uma_object_pin,
+	.unpin = drm_gem_uma_object_unpin,
+	.get_sg_table = drm_gem_uma_object_get_sg_table,
+	.vmap = drm_gem_uma_object_vmap,
+	.vunmap = drm_gem_uma_object_vunmap,
+	.mmap = drm_gem_uma_object_mmap,
 	.status = ivpu_gem_status,
-	.vm_ops = &drm_gem_shmem_vm_ops,
+	.vm_ops = &drm_gem_uma_vm_ops,
 };
 
 int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
@@ -435,7 +435,7 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 
 	if (flags & DRM_IVPU_BO_MAPPABLE) {
 		ivpu_bo_lock(bo);
-		ret = drm_gem_shmem_vmap_locked(&bo->base, &map);
+		ret = drm_gem_uma_vmap_locked(&bo->base, &map);
 		ivpu_bo_unlock(bo);
 
 		if (ret)
@@ -475,7 +475,7 @@ void ivpu_bo_free(struct ivpu_bo *bo)
 
 	if (bo->flags & DRM_IVPU_BO_MAPPABLE) {
 		ivpu_bo_lock(bo);
-		drm_gem_shmem_vunmap_locked(&bo->base, &map);
+		drm_gem_uma_vunmap_locked(&bo->base, &map);
 		ivpu_bo_unlock(bo);
 	}
 
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index 0c3350f22b55..3e5d1a64deab 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -6,13 +6,13 @@
 #define __IVPU_GEM_H__
 
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_uma_helper.h>
 #include <drm/drm_mm.h>
 
 struct ivpu_file_priv;
 
 struct ivpu_bo {
-	struct drm_gem_shmem_object base;
+	struct drm_gem_uma_object base;
 	struct ivpu_mmu_context *ctx;
 	struct list_head bo_list_node;
 	struct drm_mm_node mm_node;
-- 
2.52.0

