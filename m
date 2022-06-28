Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BE055F0A5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58872112A1D;
	Tue, 28 Jun 2022 21:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722AC1120F5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453281;
 bh=cTXTzsCe2FkTyUhfEq4PFZukFI41R7l0mhJjwNXqjZQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=c6A4F1r/wFISNqYo0PLx+xfijUjcugusFdV0MOdMCcGNxwY+u/9AqKBOvMe4ZBqYi
 grNME9t7O7JnKb5qWkY/HYD/7At1bbCQ9W88vYOij1GbK/M4hKSR5kRc6IAi44cAfC
 aVGdLgemx7O46LAAbtS5pjPheI2bANkUwzF+9dxQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.5]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1My32L-1niR1646n9-00zWL1; Tue, 28
 Jun 2022 23:54:41 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 19/32] drm/via: Add via_object.c
Date: Tue, 28 Jun 2022 16:52:33 -0500
Message-Id: <20220628215246.19706-20-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215246.19706-1-kevinbrace@gmx.com>
References: <20220628215246.19706-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PYOJkH+A9zBQfAbIaWMMUwAt+SC8TARSYHAAvwKPjvCBS1nvYJ+
 QQC9P639bjaOu1GdjOY/a4y7TNntOTgY81cK/o2IzREFk6JSuIlhXE7yAUqG/NwDKZNSpnb
 NlZ+BM5hc7/l3xl/KK6YLfiNK4gFFjL5cNaMQEus9tMR25TTCrU6hvYr909CgSOAIv+dhpJ
 D6helYfT5zJYyiXngd/7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wpXu94YOloY=:9ldH46z5wjt4w/IYmQPqcK
 7QvczXmrzpr8IiA0xdVofrBE/D/mJ644eIx3U2UZRUFLAtl+sJCP/7RNcHAQ6/FzAMfba1Qmq
 84mRw7T2TCaMXNegLqgM+lC5+FvGgRccs4/VaiAViUh8rtcW+rTumMMKcGDTzQxbz4SDiHgd4
 AdzNtwwNEWlX4W3SveCYoOP663kOrkIv5F0kkdAk1LnrsUnJWuJETICImN6DLi/D6nokfRnsa
 Z/Mozrv+Lz1BHPKVeS4lWgmUDNQK/eC091rrZKhoHpJJh4Nuh6xU0d9Ra/bgnhPglKXY0GWBV
 tQImfxnI4bsXaLSBI998Qxbp1ivbXNdKZHumhgeeQIrpLf0Yik/MRT6vBJU/AX1Iozlsqm+aI
 iuKbxr3oB9opIEHFSxQBvVhPLhFQDHsE3iryYGcMKAX4YaHzBoEMBL8YYKEp8qF7sDPtnQeD5
 OV+RzTfkZdgqycGZ8PiR1FrH8UJ8N6kVwDncQulOdnytwPJCaqjT4JzIfqErE9sO8EM6teU79
 1uKZ84e89vHC9KVHfVyqeBVEzoXMByWrBV3Ny2ggxCi++NSd0QdZ0b+UXSuuhZLaoIGSGe3aK
 NMQ1i6gJ6EZ/y/2SH6fjxplrhRQ9ckyAxp6L6R9inPppEhlB3IkSclSRgNvcBpaqRZPz2S6oy
 vr9Y26q7a/t/fOozdwmZNysYyh6oraQPZzTZDJcNhfmn0KF+fufWlowiIbvE/Ez1ongdr3q/K
 26XnGRCujTKOpqulbmjQVbdt5JXxOVtUwAMOiRmgjR2Vc1asl+IGFnyGRHTYVkitWMByTEu3M
 LjyeoZ/oZS6nb7MD7o1D+pVE++qHH3/tIs+K8RNNSVTJXBNVknQUgG+EYF+WAQEZtDPkg9uW+
 SkKc69vSpgezl/VG0A7K95prhqt+F4c6Gpdb3yTaJ+2ElL/eC3/5K44unTVOK3TZc3H55Kidc
 cjkmoV47sJC+xoDKci/0y+WPSRY1WOvZtwUldevh5R0klOuAQEQggLT0xhY0/mnA7MkM4cqSD
 0lKV6vpZOzPKDrvXVONj47PRWZiisdM6Bfoi4A2KrWGupTb+E9/HtvY2nAgi9j/L1ECg40KV7
 Ae8MXi9jvj5Upev32D/s1CfzQZt7fCRwg5xgY9U47SWGvvbyf62eJiKVA==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_object.c | 324 +++++++++++++++++++++++++++++++
 1 file changed, 324 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_object.c

diff --git a/drivers/gpu/drm/via/via_object.c b/drivers/gpu/drm/via/via_ob=
ject.c
new file mode 100644
index 000000000000..96fb2934d0de
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_object.c
@@ -0,0 +1,324 @@
+/*
+ * Copyright =C2=A9 2018-2019 Kevin Brace.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sub licen=
se,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portion=
s
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHOR(S) OR COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES =
OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR =
OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Author(s):
+ * Kevin Brace <kevinbrace@bracecomputerlab.com>
+ */
+/*
+ * via_object.c
+ *
+ * Manages Buffer Objects (BO) via TTM.
+ * Part of the TTM memory allocator.
+ *
+ */
+
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_ttm_helper.h>
+
+#include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_range_manager.h>
+
+#include "via_drv.h"
+
+
+static void via_gem_free(struct drm_gem_object *obj)
+{
+	struct ttm_buffer_object *ttm_bo;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ttm_bo =3D container_of(obj, struct ttm_buffer_object, base);
+
+	ttm_bo_put(ttm_bo);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static const struct vm_operations_struct via_ttm_bo_vm_ops =3D {
+	.fault =3D ttm_bo_vm_fault,
+	.open =3D ttm_bo_vm_open,
+	.close =3D ttm_bo_vm_close,
+	.access =3D ttm_bo_vm_access
+};
+
+static const struct drm_gem_object_funcs via_gem_object_funcs =3D {
+	.free =3D via_gem_free,
+	.vmap =3D drm_gem_ttm_vmap,
+	.vunmap =3D drm_gem_ttm_vunmap,
+	.mmap =3D drm_gem_ttm_mmap,
+	.vm_ops =3D &via_ttm_bo_vm_ops,
+};
+
+void via_ttm_domain_to_placement(struct via_bo *bo,
+					uint32_t ttm_domain)
+{
+	unsigned i =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	bo->placement.placement =3D bo->placements;
+	bo->placement.busy_placement =3D bo->placements;
+
+	if (ttm_domain =3D=3D TTM_PL_SYSTEM) {
+		bo->placements[i].fpfn =3D 0;
+		bo->placements[i].lpfn =3D 0;
+		bo->placements[i].mem_type =3D TTM_PL_SYSTEM;
+		bo->placements[i].flags =3D 0;
+		i++;
+	}
+
+	if (ttm_domain =3D=3D TTM_PL_TT) {
+		bo->placements[i].fpfn =3D 0;
+		bo->placements[i].lpfn =3D 0;
+		bo->placements[i].mem_type =3D TTM_PL_TT;
+		bo->placements[i].flags =3D 0;
+		i++;
+	}
+
+	if (ttm_domain =3D=3D TTM_PL_VRAM) {
+		bo->placements[i].fpfn =3D 0;
+		bo->placements[i].lpfn =3D 0;
+		bo->placements[i].mem_type =3D TTM_PL_VRAM;
+		bo->placements[i].flags =3D 0;
+		i++;
+	}
+
+	bo->placement.num_placement =3D i;
+	bo->placement.num_busy_placement =3D i;
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_ttm_bo_destroy(struct ttm_buffer_object *tbo)
+{
+	struct via_bo *bo;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	bo =3D to_ttm_bo(tbo);
+
+	drm_gem_object_release(&tbo->base);
+	kfree(bo);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+int via_bo_pin(struct via_bo *bo, uint32_t ttm_domain)
+{
+	struct ttm_buffer_object *ttm_bo;
+	struct ttm_operation_ctx ctx =3D {false, false};
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ttm_bo =3D &bo->ttm_bo;
+
+	if (ttm_bo->pin_count) {
+		goto pin;
+	}
+
+	via_ttm_domain_to_placement(bo, ttm_domain);
+	ret =3D ttm_bo_validate(ttm_bo, &bo->placement, &ctx);
+	if (ret) {
+		goto exit;
+	}
+
+pin:
+	ttm_bo_pin(ttm_bo);
+exit:
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+void via_bo_unpin(struct via_bo *bo)
+{
+	struct ttm_buffer_object *ttm_bo;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ttm_bo =3D &bo->ttm_bo;
+
+	ttm_bo_unpin(ttm_bo);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+int via_bo_create(struct drm_device *dev,
+			struct ttm_device *bdev,
+			uint64_t size,
+			enum ttm_bo_type type,
+			uint32_t ttm_domain,
+			bool kmap,
+			struct via_bo **bo_ptr)
+{
+	struct ttm_buffer_object *ttm_bo;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct via_bo *bo;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	bo =3D kzalloc(sizeof(*bo), GFP_KERNEL);
+	if (!bo) {
+		DRM_ERROR("Cannot allocate a TTM buffer object.\n");
+		ret =3D -ENOMEM;
+		goto exit;
+	}
+
+	ttm_bo =3D &bo->ttm_bo;
+
+	/*
+	 * It is an imperative to page align the requested buffer size
+	 * prior to a memory allocation request, or various memory
+	 * allocation related system instabilities may occur.
+	 */
+	size =3D ALIGN(size, PAGE_SIZE);
+
+	ret =3D drm_gem_object_init(dev, &ttm_bo->base, size);
+	if (ret) {
+		DRM_ERROR("Cannot initialize a GEM object.\n");
+		goto error;
+	}
+
+	ttm_bo->base.funcs =3D &via_gem_object_funcs;
+
+	via_ttm_domain_to_placement(bo, ttm_domain);
+	ret =3D ttm_bo_init(&dev_priv->bdev, ttm_bo,
+				size, type, &bo->placement,
+				PAGE_SIZE >> PAGE_SHIFT, false,
+				NULL, NULL, via_ttm_bo_destroy);
+	if (ret) {
+		DRM_ERROR("Cannot initialize a TTM object.\n");
+		goto exit;
+	}
+
+	if (kmap) {
+		ret =3D ttm_bo_reserve(ttm_bo, true, false, NULL);
+		if (ret) {
+			ttm_bo_put(ttm_bo);
+			goto exit;
+		}
+
+		ret =3D via_bo_pin(bo, ttm_domain);
+		ttm_bo_unreserve(ttm_bo);
+		if (ret) {
+			ttm_bo_put(ttm_bo);
+			goto exit;
+		}
+
+		ret =3D ttm_bo_kmap(ttm_bo, 0, ttm_bo->resource->num_pages,
+					&bo->kmap);
+		if (ret) {
+			ttm_bo_put(ttm_bo);
+			goto exit;
+		}
+	}
+
+	*bo_ptr =3D bo;
+	goto exit;
+error:
+	kfree(bo);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+void via_bo_destroy(struct via_bo *bo, bool kmap)
+{
+	struct ttm_buffer_object *ttm_bo;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ttm_bo =3D &bo->ttm_bo;
+
+	if (kmap) {
+		ttm_bo_kunmap(&bo->kmap);
+
+		ret =3D ttm_bo_reserve(ttm_bo, true, false, NULL);
+		if (ret) {
+			goto exit;
+		}
+
+		via_bo_unpin(bo);
+		ttm_bo_unreserve(ttm_bo);
+		if (ret) {
+			goto exit;
+		}
+	}
+
+	ttm_bo_put(ttm_bo);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+int via_mm_init(struct via_drm_priv *dev_priv)
+{
+	struct drm_device *dev =3D &dev_priv->dev;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/*
+	 * Initialize bdev ttm_bo_device struct.
+	 */
+	ret =3D ttm_device_init(&dev_priv->bdev,
+				&via_bo_driver,
+				dev->dev,
+				dev->anon_inode->i_mapping,
+				dev->vma_offset_manager,
+				false,
+				dev_priv->need_dma32);
+	if (ret) {
+		DRM_ERROR("Failed initializing buffer object driver.\n");
+		goto exit;
+	}
+
+	/*
+	 * Initialize TTM range manager for VRAM management.
+	 */
+	ret =3D ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM,
+				false,
+				dev_priv->vram_size >> PAGE_SHIFT);
+	if (ret) {
+		DRM_ERROR("Failed initializing TTM VRAM memory manager.\n");
+		goto exit;
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+void via_mm_fini(struct via_drm_priv *dev_priv)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ttm_range_man_fini(&dev_priv->bdev, TTM_PL_VRAM);
+
+	ttm_device_fini(&dev_priv->bdev);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
=2D-
2.35.1

