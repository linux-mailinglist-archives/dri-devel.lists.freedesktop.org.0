Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB9AAB73A0
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177F910E70A;
	Wed, 14 May 2025 17:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c0j3mGUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F73A10E6F4;
 Wed, 14 May 2025 17:57:23 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-22fcf9cf3c2so1197645ad.0; 
 Wed, 14 May 2025 10:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245442; x=1747850242; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hDifTqtGVvkdBFnZ2aqlffmPu8mY951wNojwhaWPbg0=;
 b=c0j3mGUI+jH7MhXEGvH3Gt/+yXe6KhxS8seSrdr9+WnrL9pZ8kk2MOEWz0qrrUjnw+
 RxqRvX9DiietZbiKLRPMAuM6FbOLKXrbBrb4IAtXL5AsyN9zEkovtlEzNwiTgT/1kmnw
 KQjeGoKFWZ1jIlWNLRnBoHu8SB+6j7fGM84mcKnuY8fKcezycFTXoYb0fdEjB3VU1rIw
 MJC1VGdF1U5qO6Hdu265SPPvIM1MBk8Y/wnzm18SGSzP8SnefnYP2ks6sUxWoUzTioUh
 yeDYzvDQZFdrfrLArtdxQcqQhLspqhe2a8RdnVySZxbgsODaWfZ/96tKlCbdwPs64JlC
 coXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245442; x=1747850242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hDifTqtGVvkdBFnZ2aqlffmPu8mY951wNojwhaWPbg0=;
 b=CmLUVtGrWUVI90ZT2O7JbbcLBNFisSCJcpL4PLHqFOwW1nm/Dv7GODILNEI7sPwpEN
 6FWmUTBvNfKki/U+Tt0RTTyzTfOY8pxUWlHppki1e2HX+7Vf6i776t3cgjG+c4OZscVP
 vm1gc6eVsKhzvUBhvJIaNyOu6dqOUPUGxKhjJcUXQlh77lMp0e6kHp+sSR3aHgd/VhGR
 BiIrSfEvifk9xObVr2/jqI8Ejr/sl2fxef4yd3eP6Nk4uN+GhZjIlrQStHf77URPOzzZ
 QGI8cDclFgv2mfVOx+sqfV5OF8yTReyrlXOLe8wWJTJr0Hh1INdUNBd0hu3/OHIf2YIr
 ot2w==
X-Gm-Message-State: AOJu0Yx1y2RmhPYovy9cj3XKNVK1gfys7wqlCyLHHS6a+aNm0ibOua9H
 xfdCly3b6P8NL60StRVrQi3qvK6QMbP0c+cwWqDXdVg8wyLCnvukr5ukBQ==
X-Gm-Gg: ASbGncs2n8c8mnarYL2PTMP1AXuh1Mcb3x0zvHu0Hn4XL7Q6K0ItnrXh1gJPzDxKCef
 cnu/Q+05O0wXL41FsKTXSBpFV47jAr72F8FTXvwfaqIakgCdGbDqRmHLM9QGNuIo3P62a7mcdtf
 Jp5yl3cfCLtwO42tNkKzTicUSTat/ZlpHKYs4Gq8GO2HR5NaS4GdjHV7NBgg4in4d9ZkC3lilAB
 lWzw5ZPZydadh0CY92xujkzzHsmzywLxflKfF+ceElYLN0gopbEH5nRppt4aCPZcC5PKMMxA90+
 51Y0+cwGZ7BzdF8LTuwCmNVyUSwnbKqxqs+Z1aQWg8MolkhOiSKA2AENygNn0O1NeJuR7LkpTUy
 FZ8s4aD9Vg/xNvGJmJh0E+FwyJQ==
X-Google-Smtp-Source: AGHT+IFnI4cNQJPT/KKT9TNgAjcTqSZ6JmSfX8QI6yRIz+tmXH9K+A+O7t019u80yYB/SGJ891d6AQ==
X-Received: by 2002:a17:903:2287:b0:22e:4cab:f786 with SMTP id
 d9443c01a7336-23198138157mr51787425ad.18.1747245442310; 
 Wed, 14 May 2025 10:57:22 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc828b3a0sm102931915ad.179.2025.05.14.10.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:57:21 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 34/40] drm/msm: Split out map/unmap ops
Date: Wed, 14 May 2025 10:53:48 -0700
Message-ID: <20250514175527.42488-35-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

With async VM_BIND, the actual pgtable updates are deferred.
Synchronously, a list of map/unmap ops will be generated, but the
actual pgtable changes are deferred.  To support that, split out
op handlers and change the existing non-VM_BIND paths to use them.

Note in particular, the vma itself may already be destroyed/freed
by the time an UNMAP op runs (or even a MAP op if there is a later
queued UNMAP).  For this reason, the op handlers cannot reference
the vma pointer.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 63 +++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 73baa9451ada..a105aed82cae 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -8,6 +8,34 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
+
+/**
+ * struct msm_vm_map_op - create new pgtable mapping
+ */
+struct msm_vm_map_op {
+	/** @iova: start address for mapping */
+	uint64_t iova;
+	/** @range: size of the region to map */
+	uint64_t range;
+	/** @offset: offset into @sgt to map */
+	uint64_t offset;
+	/** @sgt: pages to map, or NULL for a PRR mapping */
+	struct sg_table *sgt;
+	/** @prot: the mapping protection flags */
+	int prot;
+};
+
+/**
+ * struct msm_vm_unmap_op - unmap a range of pages from pgtable
+ */
+struct msm_vm_unmap_op {
+	/** @iova: start address for unmap */
+	uint64_t iova;
+	/** @range: size of region to unmap */
+	uint64_t range;
+};
+
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -21,18 +49,36 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
+static void
+vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
+}
+
+static int
+vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
+				   op->range, op->prot);
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-	unsigned size = vma->va.range;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!msm_vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->va.addr, size);
+	vm_unmap_op(to_msm_vm(vma->vm), &(struct msm_vm_unmap_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+	});
 
 	msm_vma->mapped = false;
 }
@@ -42,7 +88,6 @@ int
 msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	int ret;
 
 	if (GEM_WARN_ON(!vma->va.addr))
@@ -62,9 +107,13 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt,
-				  vma->gem.offset, vma->va.range,
-				  prot);
+	ret = vm_map_op(to_msm_vm(vma->vm), &(struct msm_vm_map_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+		.offset = vma->gem.offset,
+		.sgt = sgt,
+		.prot = prot,
+	});
 	if (ret) {
 		msm_vma->mapped = false;
 	}
-- 
2.49.0

