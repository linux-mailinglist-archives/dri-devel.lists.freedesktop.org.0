Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE11C868F2C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA2510F317;
	Tue, 27 Feb 2024 11:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uJF0nWv6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TT5i7Sa9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uJF0nWv6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TT5i7Sa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D9F10F30D;
 Tue, 27 Feb 2024 11:39:04 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7066E1FB98;
 Tue, 27 Feb 2024 11:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vt16+WT+lMmudW65Xudx900jqUZWvyjcqm+jT2WOSfc=;
 b=uJF0nWv6GN1wVpK41eVFn5HKqPd5WeU0DrINrI99TYP8nr7sQTX3URNtFOT2KxJpTnc6ko
 rDp7CnIVp3C+Ctw86V/GjCFEqsljBafACVfDF7wrJ2U0DbTUHLge91TkX5Cb6Z8TWFD3Bq
 VmLTNA/w+Uc15tkNIUW5R0bjQ5NdNWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033943;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vt16+WT+lMmudW65Xudx900jqUZWvyjcqm+jT2WOSfc=;
 b=TT5i7Sa9zC8YHHGJv9GBnk8uOI8rq62zSRIiQU6NvK9B1OVQBCxxWgNE6Tod2lHuv553wD
 nwJpt45hTOJ/CTCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vt16+WT+lMmudW65Xudx900jqUZWvyjcqm+jT2WOSfc=;
 b=uJF0nWv6GN1wVpK41eVFn5HKqPd5WeU0DrINrI99TYP8nr7sQTX3URNtFOT2KxJpTnc6ko
 rDp7CnIVp3C+Ctw86V/GjCFEqsljBafACVfDF7wrJ2U0DbTUHLge91TkX5Cb6Z8TWFD3Bq
 VmLTNA/w+Uc15tkNIUW5R0bjQ5NdNWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033943;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vt16+WT+lMmudW65Xudx900jqUZWvyjcqm+jT2WOSfc=;
 b=TT5i7Sa9zC8YHHGJv9GBnk8uOI8rq62zSRIiQU6NvK9B1OVQBCxxWgNE6Tod2lHuv553wD
 nwJpt45hTOJ/CTCQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id AB2A913216;
 Tue, 27 Feb 2024 11:39:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id GK9+KNbJ3WVMUQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:39:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com,
 sumit.semwal@linaro.org, dmitry.osipenko@collabora.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/13] drm/gem: Acquire reservation lock in
 drm_gem_{pin/unpin}()
Date: Tue, 27 Feb 2024 11:14:56 +0100
Message-ID: <20240227113853.8464-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
References: <20240227113853.8464-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uJF0nWv6;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TT5i7Sa9
X-Spamd-Result: default: False [-0.31 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLo3wgn6xaqcdyw4c639zmwwtu)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[30]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.31
X-Rspamd-Queue-Id: 7066E1FB98
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /
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

Acquire the buffer object's reservation lock in drm_gem_pin() and
remove locking the drivers' GEM callbacks where necessary. Same for
unpin().

DRM drivers and memory managers modified by this patch will now have
correct dma-buf locking semantics: the caller is responsible for
holding the reservation lock when calling the pin or unpin callback.

DRM drivers and memory managers that are not modified will now be
protected against concurent invocation of their pin and unpin callbacks.

PRIME does not implement struct dma_buf_ops.pin, which requires
the caller to hold the reservation lock. It does implement struct
dma_buf_ops.attach, which requires to callee to acquire the
reservation lock. The PRIME code uses drm_gem_pin(), so locks
are now taken as specified. Same for unpin and detach.

The patch harmonizes GEM pin and unpin to have non-interruptible
reservation locking across all drivers, as is already the case for
vmap and vunmap. This affects gem-shmem, gem-vram, loongson, qxl and
radeon.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem.c               | 22 ++++++++++++++++++++--
 drivers/gpu/drm/drm_gem_vram_helper.c   | 15 +--------------
 drivers/gpu/drm/drm_internal.h          |  2 ++
 drivers/gpu/drm/loongson/lsdc_gem.c     | 13 ++-----------
 drivers/gpu/drm/msm/msm_gem_prime.c     |  4 ----
 drivers/gpu/drm/nouveau/nouveau_prime.c | 11 -----------
 drivers/gpu/drm/qxl/qxl_prime.c         | 14 +-------------
 drivers/gpu/drm/radeon/radeon_prime.c   | 11 -----------
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     | 25 ++++++-------------------
 include/drm/drm_gem_shmem_helper.h      | 11 +----------
 10 files changed, 33 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 44a948b80ee14..e0f80c6a7096f 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1161,7 +1161,7 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 		obj->funcs->print_info(p, indent, obj);
 }
 
-int drm_gem_pin(struct drm_gem_object *obj)
+int drm_gem_pin_locked(struct drm_gem_object *obj)
 {
 	if (obj->funcs->pin)
 		return obj->funcs->pin(obj);
@@ -1169,12 +1169,30 @@ int drm_gem_pin(struct drm_gem_object *obj)
 	return 0;
 }
 
-void drm_gem_unpin(struct drm_gem_object *obj)
+void drm_gem_unpin_locked(struct drm_gem_object *obj)
 {
 	if (obj->funcs->unpin)
 		obj->funcs->unpin(obj);
 }
 
+int drm_gem_pin(struct drm_gem_object *obj)
+{
+	int ret;
+
+	dma_resv_lock(obj->resv, NULL);
+	ret = drm_gem_pin_locked(obj);
+	dma_resv_unlock(obj->resv);
+
+	return ret;
+}
+
+void drm_gem_unpin(struct drm_gem_object *obj)
+{
+	dma_resv_lock(obj->resv, NULL);
+	drm_gem_unpin_locked(obj);
+	dma_resv_unlock(obj->resv);
+}
+
 int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	int ret;
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 15029d89badf8..5a16b3e0a4134 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -774,11 +774,6 @@ EXPORT_SYMBOL(drm_gem_vram_simple_display_pipe_cleanup_fb);
 static int drm_gem_vram_object_pin(struct drm_gem_object *gem)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
-	int ret;
-
-	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
-	if (ret)
-		return ret;
 
 	/*
 	 * Fbdev console emulation is the use case of these PRIME
@@ -789,10 +784,7 @@ static int drm_gem_vram_object_pin(struct drm_gem_object *gem)
 	 * the buffer to be pinned to VRAM, implement a callback that
 	 * sets the flags accordingly.
 	 */
-	ret = drm_gem_vram_pin_locked(gbo, 0);
-	ttm_bo_unreserve(&gbo->bo);
-
-	return ret;
+	return drm_gem_vram_pin_locked(gbo, 0);
 }
 
 /**
@@ -803,13 +795,8 @@ static int drm_gem_vram_object_pin(struct drm_gem_object *gem)
 static void drm_gem_vram_object_unpin(struct drm_gem_object *gem)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
-	int ret;
 
-	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
-	if (ret)
-		return;
 	drm_gem_vram_unpin_locked(gbo);
-	ttm_bo_unreserve(&gbo->bo);
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 8e4faf0a28e6c..40b2d3a274d6c 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -170,6 +170,8 @@ void drm_gem_release(struct drm_device *dev, struct drm_file *file_private);
 void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 			const struct drm_gem_object *obj);
 
+int drm_gem_pin_locked(struct drm_gem_object *obj);
+void drm_gem_unpin_locked(struct drm_gem_object *obj);
 int drm_gem_pin(struct drm_gem_object *obj);
 void drm_gem_unpin(struct drm_gem_object *obj);
 int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
index 04293df2f0de0..a720d8f532093 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.c
+++ b/drivers/gpu/drm/loongson/lsdc_gem.c
@@ -19,33 +19,24 @@ static int lsdc_gem_prime_pin(struct drm_gem_object *obj)
 	struct lsdc_bo *lbo = gem_to_lsdc_bo(obj);
 	int ret;
 
-	ret = lsdc_bo_reserve(lbo);
-	if (unlikely(ret))
-		return ret;
+	dma_resv_assert_held(obj->resv);
 
 	ret = lsdc_bo_pin(lbo, LSDC_GEM_DOMAIN_GTT, NULL);
 	if (likely(ret == 0))
 		lbo->sharing_count++;
 
-	lsdc_bo_unreserve(lbo);
-
 	return ret;
 }
 
 static void lsdc_gem_prime_unpin(struct drm_gem_object *obj)
 {
 	struct lsdc_bo *lbo = gem_to_lsdc_bo(obj);
-	int ret;
 
-	ret = lsdc_bo_reserve(lbo);
-	if (unlikely(ret))
-		return;
+	dma_resv_assert_held(obj->resv);
 
 	lsdc_bo_unpin(lbo);
 	if (lbo->sharing_count)
 		lbo->sharing_count--;
-
-	lsdc_bo_unreserve(lbo);
 }
 
 static struct sg_table *lsdc_gem_prime_get_sg_table(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 0d22df53ab98a..ee267490c9359 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -53,11 +53,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
 	if (obj->import_attach)
 		return 0;
 
-	msm_gem_lock(obj);
 	pages = msm_gem_pin_pages_locked(obj);
 	if (IS_ERR(pages))
 		ret = PTR_ERR(pages);
-	msm_gem_unlock(obj);
 
 	return ret;
 }
@@ -67,7 +65,5 @@ void msm_gem_prime_unpin(struct drm_gem_object *obj)
 	if (obj->import_attach)
 		return;
 
-	msm_gem_lock(obj);
 	msm_gem_unpin_pages_locked(obj);
-	msm_gem_unlock(obj);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 774f9bd031102..b58ab595faf82 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -86,17 +86,12 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 int nouveau_gem_prime_pin(struct drm_gem_object *obj)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
-	struct ttm_buffer_object *bo = &nvbo->bo;
 	int ret;
 
-	ret = ttm_bo_reserve(bo, false, false, NULL);
-	if (ret)
-		return -EINVAL;
 	/* pin buffer into GTT */
 	ret = nouveau_bo_pin_locked(nvbo, NOUVEAU_GEM_DOMAIN_GART, false);
 	if (ret)
 		ret = -EINVAL;
-	ttm_bo_unreserve(bo);
 
 	return ret;
 }
@@ -104,14 +99,8 @@ int nouveau_gem_prime_pin(struct drm_gem_object *obj)
 void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
-	struct ttm_buffer_object *bo = &nvbo->bo;
-	int ret;
 
-	ret = ttm_bo_reserve(bo, false, false, NULL);
-	if (ret)
-		return;
 	nouveau_bo_unpin_locked(nvbo);
-	ttm_bo_unreserve(bo);
 }
 
 struct dma_buf *nouveau_gem_prime_export(struct drm_gem_object *gobj,
diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
index f2646603e12eb..19bf551a7b311 100644
--- a/drivers/gpu/drm/qxl/qxl_prime.c
+++ b/drivers/gpu/drm/qxl/qxl_prime.c
@@ -31,27 +31,15 @@
 int qxl_gem_prime_pin(struct drm_gem_object *obj)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
-	int r;
 
-	r = qxl_bo_reserve(bo);
-	if (r)
-		return r;
-	r = qxl_bo_pin_locked(bo);
-	qxl_bo_unreserve(bo);
-
-	return r;
+	return qxl_bo_pin_locked(bo);
 }
 
 void qxl_gem_prime_unpin(struct drm_gem_object *obj)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
-	int r;
 
-	r = qxl_bo_reserve(bo);
-	if (r)
-		return;
 	qxl_bo_unpin_locked(bo);
-	qxl_bo_unreserve(bo);
 }
 
 struct sg_table *qxl_gem_prime_get_sg_table(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
index b3cfc99f4d7ed..a77881f035e7a 100644
--- a/drivers/gpu/drm/radeon/radeon_prime.c
+++ b/drivers/gpu/drm/radeon/radeon_prime.c
@@ -73,32 +73,21 @@ int radeon_gem_prime_pin(struct drm_gem_object *obj)
 	struct radeon_bo *bo = gem_to_radeon_bo(obj);
 	int ret = 0;
 
-	ret = radeon_bo_reserve(bo, false);
-	if (unlikely(ret != 0))
-		return ret;
-
 	/* pin buffer into GTT */
 	ret = radeon_bo_pin(bo, RADEON_GEM_DOMAIN_GTT, NULL);
 	if (likely(ret == 0))
 		bo->prime_shared_count++;
 
-	radeon_bo_unreserve(bo);
 	return ret;
 }
 
 void radeon_gem_prime_unpin(struct drm_gem_object *obj)
 {
 	struct radeon_bo *bo = gem_to_radeon_bo(obj);
-	int ret = 0;
-
-	ret = radeon_bo_reserve(bo, false);
-	if (unlikely(ret != 0))
-		return;
 
 	radeon_bo_unpin(bo);
 	if (bo->prime_shared_count)
 		bo->prime_shared_count--;
-	radeon_bo_unreserve(bo);
 }
 
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index 12787bb9c111d..186150f41fbcc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -48,33 +48,20 @@ static void vmw_gem_object_close(struct drm_gem_object *obj,
 {
 }
 
-static int vmw_gem_pin_private(struct drm_gem_object *obj, bool do_pin)
+static int vmw_gem_object_pin(struct drm_gem_object *obj)
 {
-	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(obj);
 	struct vmw_bo *vbo = to_vmw_bo(obj);
-	int ret;
-
-	ret = ttm_bo_reserve(bo, false, false, NULL);
-	if (unlikely(ret != 0))
-		goto err;
-
-	vmw_bo_pin_reserved(vbo, do_pin);
-
-	ttm_bo_unreserve(bo);
-
-err:
-	return ret;
-}
 
+	vmw_bo_pin_reserved(vbo, true);
 
-static int vmw_gem_object_pin(struct drm_gem_object *obj)
-{
-	return vmw_gem_pin_private(obj, true);
+	return 0;
 }
 
 static void vmw_gem_object_unpin(struct drm_gem_object *obj)
 {
-	vmw_gem_pin_private(obj, false);
+	struct vmw_bo *vbo = to_vmw_bo(obj);
+
+	vmw_bo_pin_reserved(vbo, false);
 }
 
 static struct sg_table *vmw_gem_object_get_sg_table(struct drm_gem_object *obj)
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index eb12aa9a8c556..efbc9f27312b5 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -175,15 +175,8 @@ static inline void drm_gem_shmem_object_print_info(struct drm_printer *p, unsign
 static inline int drm_gem_shmem_object_pin(struct drm_gem_object *obj)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	int ret;
 
-	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
-	if (ret)
-		return ret;
-	ret = drm_gem_shmem_pin_locked(shmem);
-	dma_resv_unlock(shmem->base.resv);
-
-	return ret;
+	return drm_gem_shmem_pin_locked(shmem);
 }
 
 /**
@@ -197,9 +190,7 @@ static inline void drm_gem_shmem_object_unpin(struct drm_gem_object *obj)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
-	dma_resv_lock(shmem->base.resv, NULL);
 	drm_gem_shmem_unpin_locked(shmem);
-	dma_resv_unlock(shmem->base.resv);
 }
 
 /**
-- 
2.43.2

