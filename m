Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5425BACF6E2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA02810E9DF;
	Thu,  5 Jun 2025 18:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Er67g9a7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE9E10EA28
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555Ge1d6006332
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=49iUFarYqun
 NoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=; b=Er67g9a7Gk+LidAHj0cQ3Qpw+LZ
 EOrAqqdSVqkDq59XlMHbDRo+tYSYL7Ja1AovMDGAFfF2RNgqcND39nck3lTCbvCo
 LEucwKE+Arcv/SdbxI7OJ5b9IVxrg9oGSUD7O3hKLfacNNtKdCxXKqZQyN0ZwYTd
 0u3k71SQtAiH1L9vSzgzSCvBcIegzE4XW4sEDc3spBWolYLfRJj4h6SLr826NJza
 w5+7da1NqDou+zrlJT0IwnlnI0os3Orinjhtu0HEh4mFr3Bg90ntPeH+RcxzsTs8
 wMTOX1zRZBOWfhWl2UEv29EAZ59+pjJOMTcILfb0SEXpKpf50Hv8+8CcpRQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2aje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-234fedd3e51so12380485ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148393; x=1749753193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=49iUFarYqunNoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=;
 b=UvW/TaQJXdWvgLdvVNNh+ZiZK1MH2JqEK2bnN6KQQys7Hj5A8C0dv4bswodk0X7pTv
 wYNqs4DQecnvmK7E3jWes0J1kkSUG1fGuhghFfbwmUc3HEskjSufhjymbzyRZEFoKB8P
 dZm730KFTjeRXM5tSHqJ1y0gaaVcmauPb1E4Djql7/zeToWdoadarfYGA0sPidnaI7g0
 BMDqqOSNB8LiZteR7x9xOvAfYiCNrA7Sg1EFExy7475FTGRFD9eA48TK81jy8m1D0JN/
 OQowe3DPXPdZaLk8ENF97+k35BIPCivtYVjRvtyu+6omP9u7FS2wCGgIKaEN6yV5C33b
 nAGA==
X-Gm-Message-State: AOJu0Yw6KECHF9E0s0xvJUJiDBrn1UcTLOn21as319JSL66JfpGprABb
 H1Qky69XZW/O2Q5u0Ekv1jrFCR3/vjHeUuhGPde62XWBkEmaDkJeti3KMkJD16rsByIpuZIw1hD
 WnXTLnZoDI/lEeI/D+5kelDEz0k67aq0Z+wyH2ib4r+/GYyDOc1Rc82YmVXqzvftqeV9PMp9DZK
 U6vYM=
X-Gm-Gg: ASbGncuqo/xZnAFRcMVuifos5ZI9aYgci4ABdI1I/7zBOAFDNRVYe5tnkoDR/cdHWqw
 233CjuA6NQ1SpqvJwbYSH++CN9WgumYzKe4Xqk97lrbcdrqIY8DD6D4x2SSmmaYCy5B6FJz1wWn
 QWxWGdQOtYlvyMCVqeEckGorxAMQQsIjIwjNZKmOR+BI6uMziCp5U5JI5xUkO2LZhsTVxczj5Vt
 ckRwkJ5UEemhW7kDOOxTr78h0M4N4J7sQK6X2j5123d0BhPkX1mUdJmpWD58ep2tTFsUzA4d2rQ
 ceEOJVPP6y9dXwbEr0tjMA==
X-Received: by 2002:a17:903:2349:b0:235:2799:640 with SMTP id
 d9443c01a7336-23601d225damr6094125ad.25.1749148393467; 
 Thu, 05 Jun 2025 11:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl0jqdoODWZ/61ArVqyj/ItoV5kaRHwp4+BPeGGigRtruYOwxTDYKpmN1DgxwTU01eE5wdGg==
X-Received: by 2002:a17:903:2349:b0:235:2799:640 with SMTP id
 d9443c01a7336-23601d225damr6093815ad.25.1749148393096; 
 Thu, 05 Jun 2025 11:33:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf954esm122815285ad.210.2025.06.05.11.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:12 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 32/40] drm/msm: Split out map/unmap ops
Date: Thu,  5 Jun 2025 11:29:17 -0700
Message-ID: <20250605183111.163594-33-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: u6jt4-zSbz_-E2BIDfeetzkv6-K0C8ov
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2ed cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: u6jt4-zSbz_-E2BIDfeetzkv6-K0C8ov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX6J6XrPoNDR71
 3KGbClIS73OvYkbBPYPphO4Atqy/z9lRYh0hhaZT9ZacvzsDPW8r3TeURCZLpQIIVE3msLRGxe9
 XdRpr5zizAlQvYhRICZ4thaqAHwuPyivONFOGGUZmdmaY3hhFpHyu5EBhNvjm1HzdNSzApiOaN8
 0c9jbLeWUgNVYFiS6FlkH1aY0zzTfooWQbxSuR44l7qHMxoYaI/ZpTJW1N50Zy/o6T7Lyc6+4hs
 lPZc+PSKr94uU3FZuoqSWCgnjyiioq09ij2rj6oOv1cXA1N/Vls56PnPIlnXC70JYzIb6FohzdZ
 6IRIaeHJPB/4Xn8ffaYHITsu8ajXJZ2FLzWnBP6ztkxfT/Ma3WFWAzlIW0XwfimAW56Wajw3rqu
 E8e+sD5hmEbwld1epHPSlCzCBSW1zclXbiy/oUbc3++pMwjO/5lFzGk2wg8Rg3vUd3sjB+2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165
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

