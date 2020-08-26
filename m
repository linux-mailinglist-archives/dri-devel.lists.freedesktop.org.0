Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FA92533FA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 17:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E476E115;
	Wed, 26 Aug 2020 15:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039876E115
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 15:52:31 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id y6so1087689plt.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5J4tHsMCAfIrp1wGadn2uKy2Cv9kYNhHiKmKplllS+A=;
 b=oK9O3wn33DfG4C5PnF1IMcCqCbxGIao1L1ZyU6sXFNzIcbMUggT+TmaH02aTGFWZHi
 Z1RqS7DarL9SSnIPu/gIOmRo7RVNEgOqyZRNGREhRlX5O9gDqcjd3ZntBSk3oEmrYvTw
 RB8HibofSgluV0DDab2UJQB/Er8eAy/AIEL3aEGbrV+NJIHlu74Y/SDFRTd93U+SUYoO
 yHfGUIUkmyJCPnJi2ZpbWN/3v2Fhebr9JdDJkI3d8Vydxr1JloBFhsIIDGTf7q5xrmGe
 l+HUsPmC9AW2wgqCiZqctDOo/HSHGhEzeZNSpSVDZVRUjU3ModRjgzOoDvKKZ01BK1uR
 GSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5J4tHsMCAfIrp1wGadn2uKy2Cv9kYNhHiKmKplllS+A=;
 b=Js9FaS8wZi6a4hhvMvZqQRfGGQpcP27H2f12lG+LtIn7b1xlHQZWiEk3+0pc1AJgBf
 PrJlFt3eSKZspja1BZ1Yq1xgZ60CazSA57zbwfGFGnEbeOBaph4EDJGwakQOzsgON4fn
 +SdRSEEGLofd1ykmoLXlXHDrW841t8mZWtrb5y+aU/EZPYWU21pp7F7z1w3oKypSiIP1
 l7bmkV5/8VjhnCPWiVpv8dp2PRQFRPbh/L6pSJtxHPW6SywqpqZZ+crAcUNcMl65mdJj
 iNr5/7lbcIEjojMiY3RQ0hmTOOwFwVtp4ytBQQjKRvm7g4jhzW/NGmqQo+PbNjcaXhDN
 Gg4A==
X-Gm-Message-State: AOAM530HQq7MjVYdjmiGvA/p3gttboGND16r/8r31PZQR45zJ8TE2PP0
 10kh1bc5nNHU5LTGS6mi5AyP+hUqz3bw0A==
X-Google-Smtp-Source: ABdhPJxj5q+Vo5FQU/sigmknfPp+oHTMTbcTfGLqqq9lc/2Ly9uf1Cm93QFC9ZolVrZBUHuQ1oPg4w==
X-Received: by 2002:a17:90a:4608:: with SMTP id w8mr115257pjg.1.1598457150469; 
 Wed, 26 Aug 2020 08:52:30 -0700 (PDT)
Received: from realwakka.navercorp.com ([61.83.141.80])
 by smtp.gmail.com with ESMTPSA id y7sm3414687pfm.68.2020.08.26.08.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 08:52:29 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: [PATCH] drm/vkms: replace deprecated functions in vkms_driver
Date: Wed, 26 Aug 2020 15:52:15 +0000
Message-Id: <20200826155215.7736-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 Sidong Yang <realwakka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gem_vm_ops and gem_free_object_unlocked function pointer is deprecated.
This patch replace these functions with drm_gem_object_funcs. And
functions used in drm_gem_object_funcs, vkms_gem_vm_ops and
vkms_gem_free_object, are not used other file but vkms_gem.c. So these
goes static functions. When creating vkms_gem_object, vkms_gem_funcs
is used for drm_gem_object.funcs.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c |  8 --------
 drivers/gpu/drm/vkms/vkms_drv.h |  4 ----
 drivers/gpu/drm/vkms/vkms_gem.c | 21 +++++++++++++++++++--
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 83dd5567de8b..a3a1ee1f77fb 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -51,12 +51,6 @@ static const struct file_operations vkms_driver_fops = {
 	.release	= drm_release,
 };
 
-static const struct vm_operations_struct vkms_gem_vm_ops = {
-	.fault = vkms_gem_fault,
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
-};
-
 static void vkms_release(struct drm_device *dev)
 {
 	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
@@ -101,8 +95,6 @@ static struct drm_driver vkms_driver = {
 	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
 	.dumb_create		= vkms_dumb_create,
-	.gem_vm_ops		= &vkms_gem_vm_ops,
-	.gem_free_object_unlocked = vkms_gem_free_object,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = vkms_prime_import_sg_table,
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index f4036bb0b9a8..d7870755513c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -117,13 +117,9 @@ struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 				  enum drm_plane_type type, int index);
 
 /* Gem stuff */
-vm_fault_t vkms_gem_fault(struct vm_fault *vmf);
-
 int vkms_dumb_create(struct drm_file *file, struct drm_device *dev,
 		     struct drm_mode_create_dumb *args);
 
-void vkms_gem_free_object(struct drm_gem_object *obj);
-
 int vkms_gem_vmap(struct drm_gem_object *obj);
 
 void vkms_gem_vunmap(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
index a017fc59905e..9d58e29c1b8f 100644
--- a/drivers/gpu/drm/vkms/vkms_gem.c
+++ b/drivers/gpu/drm/vkms/vkms_gem.c
@@ -7,6 +7,20 @@
 
 #include "vkms_drv.h"
 
+static vm_fault_t vkms_gem_fault(struct vm_fault *vmf);
+static void vkms_gem_free_object(struct drm_gem_object *obj);
+
+static const struct vm_operations_struct vkms_gem_vm_ops = {
+	.fault = vkms_gem_fault,
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
+static struct drm_gem_object_funcs vkms_gem_funcs = {
+	.free = vkms_gem_free_object,
+	.vm_ops = &vkms_gem_vm_ops
+};
+
 static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
 						 u64 size)
 {
@@ -19,6 +33,8 @@ static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
 
 	size = roundup(size, PAGE_SIZE);
 	ret = drm_gem_object_init(dev, &obj->gem, size);
+	obj->gem.funcs = &vkms_gem_funcs;
+
 	if (ret) {
 		kfree(obj);
 		return ERR_PTR(ret);
@@ -29,7 +45,7 @@ static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
 	return obj;
 }
 
-void vkms_gem_free_object(struct drm_gem_object *obj)
+static void vkms_gem_free_object(struct drm_gem_object *obj)
 {
 	struct vkms_gem_object *gem = container_of(obj, struct vkms_gem_object,
 						   gem);
@@ -42,7 +58,7 @@ void vkms_gem_free_object(struct drm_gem_object *obj)
 	kfree(gem);
 }
 
-vm_fault_t vkms_gem_fault(struct vm_fault *vmf)
+static vm_fault_t vkms_gem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct vkms_gem_object *obj = vma->vm_private_data;
@@ -97,6 +113,7 @@ vm_fault_t vkms_gem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+
 static struct drm_gem_object *vkms_gem_create(struct drm_device *dev,
 					      struct drm_file *file,
 					      u32 *handle,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
