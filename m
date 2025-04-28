Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9069A9FB2E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B3510EA5F;
	Mon, 28 Apr 2025 20:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QU7M4L+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C5410EA61;
 Mon, 28 Apr 2025 20:57:58 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-223f4c06e9fso46206675ad.1; 
 Mon, 28 Apr 2025 13:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873877; x=1746478677; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tQFk0+P26UJGoHhif9JrfChUJ94/1exWaUT0hEv6Cu8=;
 b=QU7M4L+446OMdZU37c+SQjS856qPjIEF69eYk8rOnHHGXX+ph1jsX44NJSoe2flh0w
 wL8gIR1n4wtbYiyOhHZjpXnQc4xAj78zgG6sNa4ZbTzz/smq2xqbR1F3AKedkTPWNsLz
 D4a/z7yECuG/fJWIEFvvdlumzVxj+iglYcZBfFWfpSSZOgvsRzHjCYrtaFuEGwy7JjeZ
 jgk0Jq8v3C1jFbZeJF1ZqszQ0E+3xuQRptaBktL5AAKffBufDPDyOj3aq9vm35+3+yGR
 BYLy5L9hFlsMT/TS4n6fBCYrFVHRtkWVmfujD2y9KZiO2Og4QzhB4m7LRapPSsKQOn6/
 ax/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873877; x=1746478677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tQFk0+P26UJGoHhif9JrfChUJ94/1exWaUT0hEv6Cu8=;
 b=H/HgC1dlcmBlk5IDD/PD4bScm3jMvlagPncbTL6W2djUWasUO2eowxzYfa/4FNvmXN
 y0kXUB2dcmKafp2vOmyaUxyOnvo6W+g4I6ebfjDkrwOa6XK0x5eRuP0AOwPCGamxVkqn
 his8IeOhzF/9zhB7o9BM9ZE3C5fTCccpgUs3GXu3OKljKUDfERkioo+YCuKB8fWJFSeu
 V+TN4kUFKdkvG2ZZVVLMW5AoktNDMZMrHyYiZ8nSTsbP8bwny30tFZKXNHoFRQ3u0NZf
 ef/LnATYXZ0JTPqCC5/4J0ctnDH7wzpuBZYcZHnocLebTGdT2eUI+FB4uLV4dhuJvIzH
 ez1A==
X-Gm-Message-State: AOJu0YxocZ5eDbnMED7zxxwbkEtU7M25ftUTSc4ISe7os4yZPT/C+lj3
 xdGG6xr4pEqZDTGsb52SU9i+1HgCOHKK8f8KKgKBlMiIaI4BbxF1kALq+Q==
X-Gm-Gg: ASbGnctB8RmJlJ1/7oltofNeArmbcTJkw/VwerMygCEDclR6eQIut9nxBEFeB/4Ytja
 yfNCcBpu1CXQph0w6oKINulJr7oDBDBnVchtaHxDVyYwDPvdW7yhpsyu/cwsFKdo3XJG073r8kV
 DPIfSzcdF1WNc1qYEri7PKmOQsrsTL3TIXjoMxaPQ4iBW2r2Xa3VCWNN9o6hDjlSaD3zmJE8Fsw
 D3MCk+v68PEEbyx1cPttyQniVJFrYuNWJEgRnWE7y2RXOk2MCZ6YSHaMpZmPeGEkZPwHFZgcrVw
 bvN4nCu0pnpGDRGTwiEkJMEs9DpK/hZ0oMFxyKWHfWNijwr4A9IfzLz5Ib+sCzrO8p4udgSiB5O
 TH6qJ6RLVA9QsoEk=
X-Google-Smtp-Source: AGHT+IE/5MBghR8lCcwkhn9gu+bFb0HxyDfSrDxq+iZbaqNrfylG0qsuY2de54f6ebqIP7/HFBTPEw==
X-Received: by 2002:a17:902:e80e:b0:223:5187:a886 with SMTP id
 d9443c01a7336-22de6c64cbdmr8614175ad.22.1745873877504; 
 Mon, 28 Apr 2025 13:57:57 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db50e7676sm88327525ad.137.2025.04.28.13.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:56 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 31/33] drm/msm: Split out map/unmap ops
Date: Mon, 28 Apr 2025 13:54:38 -0700
Message-ID: <20250428205619.227835-32-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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
index 5b8769e152c9..f3903825e0b6 100644
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
@@ -21,28 +49,45 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
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
 
+static int
+vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
+				   op->range, op->prot);
+}
+
 /* Map and pin vma: */
 int
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

