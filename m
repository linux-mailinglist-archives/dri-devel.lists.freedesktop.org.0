Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5D8ABC679
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3484010E4B4;
	Mon, 19 May 2025 17:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ED2goF6G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44B710E4B6;
 Mon, 19 May 2025 17:58:44 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-742af84818cso2602006b3a.1; 
 Mon, 19 May 2025 10:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677524; x=1748282324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hDifTqtGVvkdBFnZ2aqlffmPu8mY951wNojwhaWPbg0=;
 b=ED2goF6Gg57z4FZxejhaYfcAn01IDHl3x5mzhLgarvmrX/RX6qxRwofnjE55J4Ws9Z
 h1oXyw+euwQc1FiQE309RVt6aBPxO6qBeP9lkC7NFFhn2cAIIJjUr3zH7NYKwyaH8ukD
 SyVnlT4yP7Mci1UVg4Rdx5oDN9r1h72bxPSQ7jOnnjczq+TwaTz+NXiTgyUvGCdEPlyp
 KGgaCfWHZcmboXM2LkUHIckQhGoq4qPZeCLfoMs5aKD2kWgDBf2uRDEJJeop8zedlv88
 tP+s0NQnWHtOO3t+/r/THWDBQjlRkEIQwrU0s3OrcSl7aAyAtIeCgVhGEC/1ERsvUexn
 wYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677524; x=1748282324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hDifTqtGVvkdBFnZ2aqlffmPu8mY951wNojwhaWPbg0=;
 b=nqYT8rzi2htfvyn0DA+PwM+KTIUJL024R3cjlD3FYt7GuQ3XMme6mxO9eauYMeb6wc
 /CHc+qzEMOR0PF1WNNOYVkZZDYg+9dIrhmldGJBLVjC+igiZEPBjMKwaABKZ0iR9ONC5
 /xD7JN/OuDJiANhKRuC68rwLmxrddEC6u056HGBoYxjJl/L+SVD4ois+mDHdJPosTUPf
 IOG7+suj8PPVb98WHkrU6lJBvSimUiaXU/TAh2Wln6CAGWCTv4i/K21wbAsVQjmHLD1S
 a4uacn++8hGMeP2JiWqqSRW9/SFU5aYRrZTNRbixSirgJcw+c9Jcw0F+C9iUzd/CvtFl
 AceQ==
X-Gm-Message-State: AOJu0Yztqlpoa7GHuhS5Z1Y1j8BC4Une+NWh1U3IKV953b6V7Ybqk/Ub
 J6fZTickIrGUHhMI4tkbKJSFvgO3d43xKNLfWJ44JBVs53dBFSrsX94bCSEU6A==
X-Gm-Gg: ASbGnctxiWpulwxH2q92i15HL2F0dsAMnhr4Cbe/cklEo7fn9sgt43/M8xOG1C5fKgP
 RlC202JgLUWMkfk6duJpei3ycAgQIfxtFoa09McwSJjpNGSapVz96MCP0EVteMTpT+y/gr/EMA+
 N4zpazV/wHO0l+ynqYXM52AEY9ApEfDBA95keT9Sik9yIX83XUSwVE+pycQV6Ogr1FTDe63PpqR
 s80Ut8S2Y57dX0L4WRNmSWJEDYDDK7HM1hnGHpjHrwX3hisQGClIXrLjcL4gU7yM3qKwxmwxkhW
 disn3DfARx0PnJjNrdaVh6hbdtAvcRIacJEug9I+39UJzlCVPwpaP9rHtldZGlxEPjFG7vyFx7x
 WttT4nn3aXe/3Hxt949CPFYToHg==
X-Google-Smtp-Source: AGHT+IGmYHPRNVkZlfycSsEN2aiJ8PCBCc4hbt1q3NPUc/bEuyH3gRv8qHnGFRo+5j3JGV1XMEkfZw==
X-Received: by 2002:a05:6a20:d705:b0:215:de5f:febc with SMTP id
 adf61e73a8af0-216219bd5fcmr19558870637.27.1747677523827; 
 Mon, 19 May 2025 10:58:43 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9876788sm6488742b3a.126.2025.05.19.10.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:42 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 34/40] drm/msm: Split out map/unmap ops
Date: Mon, 19 May 2025 10:57:31 -0700
Message-ID: <20250519175755.13037-22-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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

