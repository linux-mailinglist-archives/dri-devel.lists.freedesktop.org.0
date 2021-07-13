Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD0F3C6CCF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 11:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8448389DEC;
	Tue, 13 Jul 2021 09:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9991E89DEC;
 Tue, 13 Jul 2021 09:02:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BC29D221D2;
 Tue, 13 Jul 2021 09:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626166957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7FFP9WhCY9C7CZTQ6EWmeyFN/DqwjqBMDGbQZsz/Nhc=;
 b=VQPf8Vtkvqk6MoWXC+Bta7FMP3X9Am7qoQzzBcjJ7nIFQsQlqJieHDW9ysvzfRn7NU8O60
 2gwa/Waxdw4p8qbRYUWCXftKTGRywrDcm96wDwr7KOjvKG14aryDF3qLShj7pFmuKHQm6q
 S3/7oVldewL8Lk0qT3w8LUrzms3rFpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626166957;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7FFP9WhCY9C7CZTQ6EWmeyFN/DqwjqBMDGbQZsz/Nhc=;
 b=ZcY9QWiOvEhTo6mzdQLJYb7UE+2ukj2NLPNs2/cNRtEhvMzcHgtfdDwzKND47Hb6UASgvO
 Ulg0lV+8JHfhbJBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 795B713B3B;
 Tue, 13 Jul 2021 09:02:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8QWxHK1W7WDDTgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jul 2021 09:02:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 ville.syrjala@linux.intel.com, melissa.srw@gmail.com, jgg@ziepe.ca,
 lee.jones@linaro.org, chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Subject: [PATCH] Revert "drm/vgem: Implement mmap as GEM object function"
Date: Tue, 13 Jul 2021 11:02:35 +0200
Message-Id: <20210713090235.26372-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 375cca1cfeb5 ("drm/vgem: Implement mmap as GEM object function")
broke severla IGT tests in vgem_basic. [1] Attempts to fix the issue
have not worked out so far. [2][3] Revert the original patch for now.

Note that there is a patch that converts vgem to shmem helpers. [4]
Merging this change would be preferable to modifying vgem's mmap code.

[1] https://intel-gfx-ci.01.org/tree/drm-tip/igt@vgem_basic@unload.html
[2] https://lore.kernel.org/intel-gfx/20210709154256.12005-1-tzimmermann@suse.de/
[3] https://lore.kernel.org/intel-gfx/20210712123321.3658-1-tzimmermann@suse.de/
[4] https://patchwork.freedesktop.org/series/90671/

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 375cca1cfeb5 ("drm/vgem: Implement mmap as GEM object function")
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Qinglang Miao <miaoqinglang@huawei.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 46 +++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index df634aa52638..bf38a7e319d1 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -239,7 +239,32 @@ static struct drm_ioctl_desc vgem_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(VGEM_FENCE_SIGNAL, vgem_fence_signal_ioctl, DRM_RENDER_ALLOW),
 };

-DEFINE_DRM_GEM_FOPS(vgem_driver_fops);
+static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	unsigned long flags = vma->vm_flags;
+	int ret;
+
+	ret = drm_gem_mmap(filp, vma);
+	if (ret)
+		return ret;
+
+	/* Keep the WC mmaping set by drm_gem_mmap() but our pages
+	 * are ordinary and not special.
+	 */
+	vma->vm_flags = flags | VM_DONTEXPAND | VM_DONTDUMP;
+	return 0;
+}
+
+static const struct file_operations vgem_driver_fops = {
+	.owner		= THIS_MODULE,
+	.open		= drm_open,
+	.mmap		= vgem_mmap,
+	.poll		= drm_poll,
+	.read		= drm_read,
+	.unlocked_ioctl = drm_ioctl,
+	.compat_ioctl	= drm_compat_ioctl,
+	.release	= drm_release,
+};

 static struct page **vgem_pin_pages(struct drm_vgem_gem_object *bo)
 {
@@ -362,12 +387,24 @@ static void vgem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *ma
 	vgem_unpin_pages(bo);
 }

-static int vgem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+static int vgem_prime_mmap(struct drm_gem_object *obj,
+			   struct vm_area_struct *vma)
 {
+	int ret;
+
+	if (obj->size < vma->vm_end - vma->vm_start)
+		return -EINVAL;
+
+	if (!obj->filp)
+		return -ENODEV;
+
+	ret = call_mmap(obj->filp, vma);
+	if (ret)
+		return ret;
+
 	vma_set_file(vma, obj->filp);
 	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
 	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
-	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);

 	return 0;
 }
@@ -379,7 +416,6 @@ static const struct drm_gem_object_funcs vgem_gem_object_funcs = {
 	.get_sg_table = vgem_prime_get_sg_table,
 	.vmap = vgem_prime_vmap,
 	.vunmap = vgem_prime_vunmap,
-	.mmap = vgem_prime_mmap,
 	.vm_ops = &vgem_gem_vm_ops,
 };

@@ -397,7 +433,7 @@ static const struct drm_driver vgem_driver = {
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = vgem_prime_import,
 	.gem_prime_import_sg_table = vgem_prime_import_sg_table,
-	.gem_prime_mmap = drm_gem_prime_mmap,
+	.gem_prime_mmap = vgem_prime_mmap,

 	.name	= DRIVER_NAME,
 	.desc	= DRIVER_DESC,
--
2.32.0

