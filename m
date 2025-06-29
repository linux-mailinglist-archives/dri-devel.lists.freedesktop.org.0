Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E31AED09E
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7485E10E37F;
	Sun, 29 Jun 2025 20:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NyNcTa4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A895110E379
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFL1ZA013295
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=b2JMHHLa1rE
 J4Hs2IxSKvgFj2W/GQDFpMVFHK3adsj0=; b=NyNcTa4+8m73k1HbMn2XjVtqYtl
 aI1vv58Rv0m8AUzm0WOp34p2RtyeYNbxWf/+xKirgziQ9+EIw0f0qLN/+zuhVcVz
 FlU2ueWEXdIVukr+a0qnZDUXtyvA6S6ar/x7UQM9Bpm15rQx+/PWk+3xLI8vWD8c
 6OQDE326sIiTDDad8VrQ4KQkXnAu7TrOiyCZKqV8ZHz7psB2kzDOYwpOF/UIFfOR
 gtmfAQTvdmKWyzeRy2t8N/lZPHYfJYQ+56EQ7W7spQxVMRb4W7NaFdN8D2yXLJ2t
 ywzxm4Xj/LmENEel0IL5+P1A3ZkyKtocCdKUmFtdz2lrzrymbaMe8yWh55Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxanad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74943a7cd9aso2570674b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228238; x=1751833038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2JMHHLa1rEJ4Hs2IxSKvgFj2W/GQDFpMVFHK3adsj0=;
 b=BOnR/GgkQC+LRuIdAZCAwCN1Z1uCr81qt6cicVl7R3C/KGUAtxi6fstYCKzrZQn02Y
 cplcSaodcMxRLPQFuyo7V4I/1LpIqmPsB3+0/YKxswhGm59pWOSJN8Q6HNopIdtzV9WE
 0EHSmnAsp5gpDsonATrQq1hL/Co9inA1vHthbGL9sm4gfK9nO4emaAw/UvuowWrf43cu
 CZxGhE4dfIm8nXdmf6BQbzanvj3f59FF/ykhNOeQNg9dtBmnjlzq0dJo9/FLDbfujG9e
 vd3bsRTdHQRvbPElsOvIIpuHiUyjE6CS3bruKTEozL1GfCDXLGd0Ti0tc4EovzVQhfqi
 aYAQ==
X-Gm-Message-State: AOJu0YyA3O2KNEFKgK9N4WY46lV+bHX8PjwAqM+WclOp2efst94Q3CmM
 4Yf5ljFK6TCnnwENtg9TNt5kTHotdaLtffka5W/tazh5ElCttHx5MBU17usXoc3HpaS0zMXC3i8
 VFiVG3GQjvESIQHdrObXAC+3I78TAexnYS1XZY4Ld098MatPYsJwcgJe3VE1VZDUcakxSmOWGcj
 mw3QU=
X-Gm-Gg: ASbGncuNo2Yx4ly3VlAwpD1QpEQKImTnF7R65BHvqRkpUlnNJ9ppbLXcKs2z84jjGFA
 FzcSqEPQImjBdHe1cR43PVfuwLmfTwpy0SjAB3y2bs4eTEVP9UKejG1JnPHwpyLBtjf6f2x6QfT
 tsSO7fj/0AEznDrqfgCdVvcnm2I6WswfRldlwUl63lOc/k4WiKy6q+21rz9Au8c04yDs2BYqaA6
 vRONkGow1uZB9Mt0qnbb4NFG0ahB+b+gcl1cpRUCVCk6Uxuf1A/DX7cdVsH79LFltjkbSSbX12e
 kNkLWfAC5/nvjCHeL9bypOw6OxcvxTqB+Q==
X-Received: by 2002:a05:6a00:21c9:b0:740:9d7c:8f5c with SMTP id
 d2e1a72fcca58-74af6f4cfa2mr16519972b3a.18.1751228238183; 
 Sun, 29 Jun 2025 13:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW3k2zWAY5y4ye1pG0x55foXVAYN4hmqQ2sf2QqrktZmybf7EtvoFCA4/tn6MAABQx2lQx3g==
X-Received: by 2002:a05:6a00:21c9:b0:740:9d7c:8f5c with SMTP id
 d2e1a72fcca58-74af6f4cfa2mr16519927b3a.18.1751228237682; 
 Sun, 29 Jun 2025 13:17:17 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af540b3d9sm7086468b3a.2.2025.06.29.13.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v9 41/42] drm/msm: Defer VMA unmap for fb unpins
Date: Sun, 29 Jun 2025 13:13:24 -0700
Message-ID: <20250629201530.25775-42-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXzIQRU852aJUj
 nK4it2BRm9EvpoOZV/6MDIsUfh91/Gr78WwP7HpfzUNZzMTD+aL9G07xMB3Ao3jhLqEcNeEx10V
 4OSi4QrpEpk81eB8B7oKWv5L3tItjoHc5jWRwEAkG8Ed+P9ygHF1USUHBm51rk6s4dETCd72SHr
 A7r5tB9aVtSzcX5kNXrAH31wtY2QW7XSip0EeaJp4uJrwDVhs1pokordDhNy6642n52AgGmB9/M
 zC0DV6dISFXVhidomB9bBxAjLiuCunRNU+E54JWu1VEM2TQRjB4+TyhBz/Br/cfLVPlqgKu7BgD
 9MWYtNe7NijfnuzLGjZK0QsylUS1LV9aR2bEfOCFCGZ90nmb6oBUf2AetqEKA/uuq6AVRI8rAvB
 A1DsuIyqhlmgmDAJlYrlDm3thyzAsJS03l/aQQt9rg5asDrJDjRkB4b168CeCKDUQ3L+EYNs
X-Proofpoint-GUID: 1B5h1YsGP4lWK-Z3EtAOOdDA3EbkusGP
X-Proofpoint-ORIG-GUID: 1B5h1YsGP4lWK-Z3EtAOOdDA3EbkusGP
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68619f4f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=HvHaJK4xSQnTU1JWlMsA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=884 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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

With the conversion to drm_gpuvm, we lost the lazy VMA cleanup, which
means that fb cleanup/unpin when pageflipping to new scanout buffers
immediately unmaps the scanout buffer.  This is costly (with tlbinv,
it can be 4-6ms for a 1080p scanout buffer, and more for higher
resolutions)!

To avoid this, introduce a vma_ref, which is incremented whenever
userspace has a GEM handle or dma-buf fd.  When unpinning if the
vm is the kms->vm we defer tearing down the VMA until the vma_ref
drops to zero.  If the buffer is still part of a flip-chain then
userspace will be holding some sort of reference to the BO, either
via a GEM handle and/or dma-buf fd.  So this avoids unmapping the VMA
when there is a strong possibility that it will be needed again.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c       |  1 +
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_fb.c        |  5 ++-
 drivers/gpu/drm/msm/msm_gem.c       | 60 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h       | 28 ++++++++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c | 54 +++++++++++++++++++++++++-
 6 files changed, 123 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b1f1c1a41d4..0597ff6da317 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -830,6 +830,7 @@ static const struct drm_driver msm_driver = {
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
 	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.gem_prime_import   = msm_gem_prime_import,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 200c3135bbf9..2b49c4b800ee 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -269,6 +269,7 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev);
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
 int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
+struct drm_gem_object *msm_gem_prime_import(struct drm_device *dev, struct dma_buf *buf);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
 struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8ae2f326ec54..bc7c2bb8f01e 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -89,6 +89,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 		return 0;
 
 	for (i = 0; i < n; i++) {
+		msm_gem_vma_get(fb->obj[i]);
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
@@ -114,8 +115,10 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 
 	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 
-	for (i = 0; i < n; i++)
+	for (i = 0; i < n; i++) {
 		msm_gem_unpin_iova(fb->obj[i], vm);
+		msm_gem_vma_put(fb->obj[i]);
+	}
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3e87d27dfcb6..33d3354c6102 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -19,6 +19,7 @@
 #include "msm_drv.h"
 #include "msm_gem.h"
 #include "msm_gpu.h"
+#include "msm_kms.h"
 
 static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 {
@@ -39,6 +40,7 @@ static void update_ctx_mem(struct drm_file *file, ssize_t size)
 
 static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 {
+	msm_gem_vma_get(obj);
 	update_ctx_mem(file, obj->size);
 	return 0;
 }
@@ -46,33 +48,13 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
 			    bool close, const char *reason);
 
-static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
-{
-	msm_gem_assert_locked(obj);
-	drm_gpuvm_resv_assert_held(vm);
-
-	struct drm_gpuvm_bo *vm_bo = drm_gpuvm_bo_find(vm, obj);
-	if (vm_bo) {
-		struct drm_gpuva *vma;
-
-		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
-			if (vma->vm != vm)
-				continue;
-			msm_gem_vma_unmap(vma, "detach");
-			msm_gem_vma_close(vma);
-			break;
-		}
-
-		drm_gpuvm_bo_put(vm_bo);
-	}
-}
-
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
 	struct msm_context *ctx = file->driver_priv;
 	struct drm_exec exec;
 
 	update_ctx_mem(file, -obj->size);
+	msm_gem_vma_put(obj);
 
 	/*
 	 * If VM isn't created yet, nothing to cleanup.  And in fact calling
@@ -99,7 +81,31 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true, "close");
-	detach_vm(obj, ctx->vm);
+	drm_exec_fini(&exec);     /* drop locks */
+}
+
+/*
+ * Get/put for kms->vm VMA
+ */
+
+void msm_gem_vma_get(struct drm_gem_object *obj)
+{
+	atomic_inc(&to_msm_bo(obj)->vma_ref);
+}
+
+void msm_gem_vma_put(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct drm_exec exec;
+
+	if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
+		return;
+
+	if (!priv->kms)
+		return;
+
+	msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
+	put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
 	drm_exec_fini(&exec);     /* drop locks */
 }
 
@@ -656,6 +662,13 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 	return ret;
 }
 
+static bool is_kms_vm(struct drm_gpuvm *vm)
+{
+	struct msm_drm_private *priv = vm->drm->dev_private;
+
+	return priv->kms && (priv->kms->vm == vm);
+}
+
 /*
  * Unpin a iova by updating the reference counts. The memory isn't actually
  * purged until something else (shrinker, mm_notifier, destroy, etc) decides
@@ -671,7 +684,8 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 	if (vma) {
 		msm_gem_unpin_locked(obj);
 	}
-	detach_vm(obj, vm);
+	if (!is_kms_vm(vm))
+		put_iova_spaces(obj, vm, true, "close");
 	drm_exec_fini(&exec);     /* drop locks */
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 1ce97f8a30bb..5c0c59e4835c 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -211,9 +211,37 @@ struct msm_gem_object {
 	 * Protected by LRU lock.
 	 */
 	int pin_count;
+
+	/**
+	 * @vma_ref: Reference count of VMA users.
+	 *
+	 * With the vm_bo/vma holding a reference to the GEM object, we'd
+	 * otherwise have to actively tear down a VMA when, for example,
+	 * a buffer is unpinned for scanout, vs. the pre-drm_gpuvm approach
+	 * where a VMA did not hold a reference to the BO, but instead was
+	 * implicitly torn down when the BO was freed.
+	 *
+	 * To regain the lazy VMA teardown, we use the @vma_ref.  It is
+	 * incremented for any of the following:
+	 *
+	 * 1) the BO is exported as a dma_buf
+	 * 2) the BO has open userspace handle
+	 *
+	 * All of those conditions will hold an reference to the BO,
+	 * preventing it from being freed.  So lazily keeping around the
+	 * VMA will not prevent the BO from being freed.  (Or rather, the
+	 * reference loop is harmless in this case.)
+	 *
+	 * When the @vma_ref drops to zero, then kms->vm VMA will be
+	 * torn down.
+	 */
+	atomic_t vma_ref;
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
+void msm_gem_vma_get(struct drm_gem_object *obj);
+void msm_gem_vma_put(struct drm_gem_object *obj);
+
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
 int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 4d93f2daeeaa..c0a33ac839cb 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -6,6 +6,7 @@
 
 #include <linux/dma-buf.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_prime.h>
 
 #include "msm_drv.h"
@@ -42,19 +43,68 @@ void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 	msm_gem_put_vaddr_locked(obj);
 }
 
+static void msm_gem_dmabuf_release(struct dma_buf *dma_buf)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+
+	msm_gem_vma_put(obj);
+	drm_gem_dmabuf_release(dma_buf);
+}
+
+static const struct dma_buf_ops msm_gem_prime_dmabuf_ops =  {
+	.attach = drm_gem_map_attach,
+	.detach = drm_gem_map_detach,
+	.map_dma_buf = drm_gem_map_dma_buf,
+	.unmap_dma_buf = drm_gem_unmap_dma_buf,
+	.release = msm_gem_dmabuf_release,
+	.mmap = drm_gem_dmabuf_mmap,
+	.vmap = drm_gem_dmabuf_vmap,
+	.vunmap = drm_gem_dmabuf_vunmap,
+};
+
+struct drm_gem_object *msm_gem_prime_import(struct drm_device *dev,
+					    struct dma_buf *buf)
+{
+	if (buf->ops == &msm_gem_prime_dmabuf_ops) {
+		struct drm_gem_object *obj = buf->priv;
+		if (obj->dev == dev) {
+			/*
+			 * Importing dmabuf exported from our own gem increases
+			 * refcount on gem itself instead of f_count of dmabuf.
+			 */
+			drm_gem_object_get(obj);
+			return obj;
+		}
+	}
+
+	return drm_gem_prime_import(dev, buf);
+}
+
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg)
 {
 	return msm_gem_import(dev, attach->dmabuf, sg);
 }
 
-
 struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
 {
 	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
 		return ERR_PTR(-EPERM);
 
-	return drm_gem_prime_export(obj, flags);
+	msm_gem_vma_get(obj);
+
+	struct drm_device *dev = obj->dev;
+	struct dma_buf_export_info exp_info = {
+		.exp_name = KBUILD_MODNAME, /* white lie for debug */
+		.owner = dev->driver->fops->owner,
+		.ops = &msm_gem_prime_dmabuf_ops,
+		.size = obj->size,
+		.flags = flags,
+		.priv = obj,
+		.resv = obj->resv,
+	};
+
+	return drm_gem_dmabuf_export(dev, &exp_info);
 }
 
 int msm_gem_prime_pin(struct drm_gem_object *obj)
-- 
2.50.0

