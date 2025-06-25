Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDE4AE8D99
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E1E10E7F5;
	Wed, 25 Jun 2025 18:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtZf3CkK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6347610E7EA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:16 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDEJtq024367
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=49iUFarYqun
 NoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=; b=WtZf3CkKNuQU97IvGeNFmcWXCY6
 y2l4y8KMgmNeiWDi0g8rGOrSkCzKn2ph/JxmTm7tL0MJ/qr4a+CkeUaZ4x+thjl3
 DLLAuPmFc9T+hc0c2jEUVcJeX3Nbd5qGNf/ioRPy0deT+qW2mOwvaNneFIRsvZqv
 V/hQv31Z0d/sAXbcJ+ZeEOfUQOBb/rylxj3dJY8xK14i/xGjgM23/tqYgWDNaJtl
 /PQR3mmLuMGbURcDyQzCDG0WKTXhKVoLurdai2h/Ip6rHKRHTC1b8ptbkpsh6IED
 Qmm6juVfCxYYyRiJPiYxmbFyPgrXA3THe7LRso6NbvuOi7q1mSCm+H9ikQg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bggy32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-23692793178so1566115ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877954; x=1751482754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=49iUFarYqunNoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=;
 b=ovR8FxdnhCa/CihrR2bQkEIxiMfuy+5O5AQkmr+lMZQqzzWatNieMOSu1M0l5oKPB3
 HjJgDVSHeRm1/sEZ/hKlYS33FaRz8JHL5R92dWj5SVyeNHV3z/nXEYuq8+gRuiMDYdX7
 8xGd7/BdzvN0lc9QV/wfzfSMvc9p37/zXfHL9zKPZI99VEqkUUsUYFgmoa/wejin4aVW
 1bQtpi9Yj8kUOPxpF3O/LYynaxn6GwW3riPTY/b6u9lxFtfsYvBGIr5qRczR48Q4UJBc
 hUI1sFxkLLV1rBbzekO8R3riSLxcMg1WRkw+rSt/6RwKgYDXU7prZ9it/eVVYpILmArN
 LsXA==
X-Gm-Message-State: AOJu0YwdQxmXDoHKAmzzTro9lOxJZBsJQCkBddPRa8n0VnQgD5aF83fh
 q9Qd6O3hi9SoBRV05JXwUHIbluc9FvllQswm+b7cPnequABfWgh+lJ0wetfwqmXnnZYvXu06TwR
 Qzn7X1GbCrr3sOScLkb5uKpCi6VBmvd3mADIKplaeRdJBdwpxHtry9ba8hjm+67WdXnsdO1jOb+
 UIg7g=
X-Gm-Gg: ASbGncuMswloeMlz863pEIZ7dQ7lzZltIz1g+tzQfCo4ufrrVlgYHffL0UJMDqv3/G1
 TMKDR0KumJv0H6Ent9WEO/2WcfswD0oQj8zgqyA+AUAzX5T6iCocPrYfh/cKThwCJRlJZMd0iXM
 SoRmwV/UGXq0uL6athL3XqrNT+Z3YUHGe01lP15NQJNqkxEC8GF+6Ltai6aA2Mo4+hCDEsgblyj
 mM71G6kEqJ25CeLdW2Id0QDE/3xlXr5pwi3naq+9610zyTuoBfuohGGu93HlJJ0HRuydV4z85vN
 cPlGe3PbDMDUW/ncVQ5IbNLCiKItVzoJ
X-Received: by 2002:a17:903:1cb:b0:235:91a:4d with SMTP id
 d9443c01a7336-23824108cbdmr77910035ad.23.1750877953562; 
 Wed, 25 Jun 2025 11:59:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf3AcJpzfzjZQsgRmjwLAbbXRsrGhtl7AY0PDU2VAAi3sP12gUBwP1a3MTqSTUA/gKCDHVqw==
X-Received: by 2002:a17:903:1cb:b0:235:91a:4d with SMTP id
 d9443c01a7336-23824108cbdmr77909665ad.23.1750877953165; 
 Wed, 25 Jun 2025 11:59:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d83989besm144278745ad.38.2025.06.25.11.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:12 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 34/42] drm/msm: Split out map/unmap ops
Date: Wed, 25 Jun 2025 11:47:27 -0700
Message-ID: <20250625184918.124608-35-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vDqAbTm3I4MblPUFjshzO-RK_Rm1SUtJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX/+F4C7rgSFAo
 SVre6Lu1l/5p9cP7ebUc/MylFCU44ENZ8Y/FNAxuzuUFBBQcZV+qWsD7nzjyBfBSOGvndsCDm/l
 oFi9XzwTQ0g6PzpFpgP5UVETZogG6ZhTEOnvqOpp7o+lXhFEMun1J1etEryiqjDBx9hD345e5LT
 0F99JoAatG2LL8AelrtGaHJ+7tuYpKkzBRxbTzboK6hvIVY8cxOT+WEUr+Yw9/bWLQOTDUSGPDc
 /meXrcJEoOOapjMPZL5xYY/YqBIDfqomTR9V7ZUCEjO/WX/mh9pckT7DaAlCUcAb0o1onrjRwBR
 unEfsO7F+qhb1QIm/5Q+pHOZVGarvzuCuNp3erfEU75DUtV0vpDVwqQ5fGygZzOXskDdMeaeWOq
 HLyBcnHrCcHAXusGGrWDx5V55hJLu7Ayaw+NocuUIWACBhbkXWackwchXbuCx3XaUOqlfdX9
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685c4703 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: vDqAbTm3I4MblPUFjshzO-RK_Rm1SUtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143
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
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 63 +++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index cf37abb98235..76b79c122182 100644
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

