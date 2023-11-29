Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1FC7FE2B2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 23:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D7510E692;
	Wed, 29 Nov 2023 22:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1290D10E68C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 22:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701295726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vGiagwJ2QXQmUNFvzSgzzUq8CCfFk3E2XxM+sjcf29A=;
 b=Xngk/ky+8mv4SCtozcPiJgFm84AD/7h9yajPX8YGgG9X31CfLWEV5H/xQpElKCgQP3PFBu
 TKHBaD7L+7cN9WfLuhM7B9gFbT9Lgl6cHlUVvF4GM/rnqGcNh2u6+3SS+z4mX7Q1CFVfW3
 gXmxwXPeONPvLZKLRPZtpOQNatK2Xj4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-GgHBhd_DMxGqIc4Q3l9Tmw-1; Wed, 29 Nov 2023 17:08:44 -0500
X-MC-Unique: GgHBhd_DMxGqIc4Q3l9Tmw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-50bca4c8dd7so393309e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701295723; x=1701900523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vGiagwJ2QXQmUNFvzSgzzUq8CCfFk3E2XxM+sjcf29A=;
 b=lzZI4/v4JEgnryQqAHlhrUBE34LCEaxcBYpITfxxhLQZCYqOGsafiNR4ofdR1D5jqP
 2ziW9+4ytHsGS00uUGmobtdxTaLczrPRMQPqoBnkVfaRoy0VOxKJC5ycbPUHZTsfVSmg
 l5SuPzJgVPjU4wCODxL4taWngTcHBaAoPtVLiTHaHz1RTeVNMz5v4vBK3o0CCSj372tE
 Gch1d3p0nuy/vAH8NRH44+SGkEOWbvWnsFAq8PIpdVN6ApHiTCQxdYPuRWOVIgiMHpHU
 Hn2aZ5/TwfNMahck40sIOBR0K/2XL+enrPBBgWwI9YiG+1hfZr4qDHPqxciLXA5XalTf
 gMXw==
X-Gm-Message-State: AOJu0YyS6kiXMb9UkR2/SAwYPaalk+6JAF1hafRqYWZSdkZaYJtUzqCe
 Qdlv+R0WgiOhTG63/uVBNSd7pUyjDxb0iy4vCIBaURWXOxBPK236XVntL/P2VkO237PtwaND1uT
 DV8n5jveIghV2A6+6unROvQmBjC/k
X-Received: by 2002:a05:6512:114f:b0:50b:acab:d3c0 with SMTP id
 m15-20020a056512114f00b0050bacabd3c0mr10137101lfg.18.1701295723241; 
 Wed, 29 Nov 2023 14:08:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeyC9IMElL+vOPB8g3/9qh7d1L6d1hkRdPe6bAmXpNcCKYE3IQGxTbErhhuCVZykJz7VgHqw==
X-Received: by 2002:a05:6512:114f:b0:50b:acab:d3c0 with SMTP id
 m15-20020a056512114f00b0050bacabd3c0mr10137088lfg.18.1701295722882; 
 Wed, 29 Nov 2023 14:08:42 -0800 (PST)
Received: from pollux.. ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 bm2-20020a0564020b0200b005487d3fb436sm7823433edb.90.2023.11.29.14.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 14:08:42 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 frank.binns@imgtec.com, donald.robson@imgtec.com, matt.coster@imgtec.com,
 sarah.walker@imgtec.com
Subject: [PATCH drm-misc-next v2 1/2] drm/gpuvm: fall back to
 drm_exec_lock_obj()
Date: Wed, 29 Nov 2023 23:08:00 +0100
Message-ID: <20231129220835.297885-2-dakr@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129220835.297885-1-dakr@redhat.com>
References: <20231129220835.297885-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fall back to drm_exec_lock_obj() if num_fences is zero for the
drm_gpuvm_prepare_* function family.

Otherwise dma_resv_reserve_fences() would actually allocate slots even
though num_fences is zero.

Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 43 ++++++++++++++++++++++++++++++++-----
 include/drm/drm_gpuvm.h     | 23 +++-----------------
 2 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 54f5e8851de5..07a6676bc4f9 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1085,6 +1085,37 @@ drm_gpuvm_put(struct drm_gpuvm *gpuvm)
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_put);
 
+static int
+exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+		 unsigned int num_fences)
+{
+	return num_fences ? drm_exec_prepare_obj(exec, obj, num_fences) :
+			    drm_exec_lock_obj(exec, obj);
+}
+
+/**
+ * drm_gpuvm_prepare_vm() - prepare the GPUVMs common dma-resv
+ * @gpuvm: the &drm_gpuvm
+ * @exec: the &drm_exec context
+ * @num_fences: the amount of &dma_fences to reserve
+ *
+ * Calls drm_exec_prepare_obj() for the GPUVMs dummy &drm_gem_object; if
+ * @num_fences is zero drm_exec_lock_obj() is called instead.
+ *
+ * Using this function directly, it is the drivers responsibility to call
+ * drm_exec_init() and drm_exec_fini() accordingly.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
+		     struct drm_exec *exec,
+		     unsigned int num_fences)
+{
+	return exec_prepare_obj(exec, gpuvm->r_obj, num_fences);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_vm);
+
 static int
 __drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
 			    struct drm_exec *exec,
@@ -1095,7 +1126,7 @@ __drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
 	int ret = 0;
 
 	for_each_vm_bo_in_list(gpuvm, extobj, &extobjs, vm_bo) {
-		ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
+		ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
 		if (ret)
 			break;
 	}
@@ -1116,7 +1147,7 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
 
 	drm_gpuvm_resv_assert_held(gpuvm);
 	list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
-		ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
+		ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
 		if (ret)
 			break;
 
@@ -1134,7 +1165,8 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
  * @num_fences: the amount of &dma_fences to reserve
  *
  * Calls drm_exec_prepare_obj() for all &drm_gem_objects the given
- * &drm_gpuvm contains mappings of.
+ * &drm_gpuvm contains mappings of; if @num_fences is zero drm_exec_lock_obj()
+ * is called instead.
  *
  * Using this function directly, it is the drivers responsibility to call
  * drm_exec_init() and drm_exec_fini() accordingly.
@@ -1171,7 +1203,8 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_objects);
  * @num_fences: the amount of &dma_fences to reserve
  *
  * Calls drm_exec_prepare_obj() for all &drm_gem_objects mapped between @addr
- * and @addr + @range.
+ * and @addr + @range; if @num_fences is zero drm_exec_lock_obj() is called
+ * instead.
  *
  * Returns: 0 on success, negative error code on failure.
  */
@@ -1186,7 +1219,7 @@ drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
 	drm_gpuvm_for_each_va_range(va, gpuvm, addr, end) {
 		struct drm_gem_object *obj = va->gem.obj;
 
-		ret = drm_exec_prepare_obj(exec, obj, num_fences);
+		ret = exec_prepare_obj(exec, obj, num_fences);
 		if (ret)
 			return ret;
 	}
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index f94fec9a8517..b3f82ec7fb17 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -544,26 +544,9 @@ struct drm_gpuvm_exec {
 	} extra;
 };
 
-/**
- * drm_gpuvm_prepare_vm() - prepare the GPUVMs common dma-resv
- * @gpuvm: the &drm_gpuvm
- * @exec: the &drm_exec context
- * @num_fences: the amount of &dma_fences to reserve
- *
- * Calls drm_exec_prepare_obj() for the GPUVMs dummy &drm_gem_object.
- *
- * Using this function directly, it is the drivers responsibility to call
- * drm_exec_init() and drm_exec_fini() accordingly.
- *
- * Returns: 0 on success, negative error code on failure.
- */
-static inline int
-drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
-		     struct drm_exec *exec,
-		     unsigned int num_fences)
-{
-	return drm_exec_prepare_obj(exec, gpuvm->r_obj, num_fences);
-}
+int drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
+			 struct drm_exec *exec,
+			 unsigned int num_fences);
 
 int drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
 			      struct drm_exec *exec,
-- 
2.43.0

