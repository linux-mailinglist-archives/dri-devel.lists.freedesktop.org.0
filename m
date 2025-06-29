Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C28AECD4D
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45C510E2A3;
	Sun, 29 Jun 2025 14:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGaXb+qk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8783B10E345
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAoIL0013790
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=A54UdMciCNB
 ls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=; b=aGaXb+qkNkHnKCMQbHKywKgHKpR
 BL2wXJ3XgRy9grgSj28Hcaii/GvaLwx1rkb7D25TLzS4Kkbd+NWfXNZ8JmqRmTln
 1MNpAqz9rSWsx+DZwMyjtiugpHICVfVDqAnJHbDw5hVEBRIGuuvYev6R5tjN0Fsx
 SJgauruyd6TvQyv7o1E449TL5Brm8keuQj1CnFAb3b4+yGAec2CJ95auxetRV5e3
 RgY2fmH1m4SgpCpTRkdBGnqsevJ1MjbzGI2Lh+KS4VLJjmUkApCBp/EcXCMTbExF
 1T0Lzb4SNzSGxw1/9t6qsUQtHlPpL1is+Na/THTPn4TCBFGoiXZgPDLA/og==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2eyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b31f112c90aso2804545a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206090; x=1751810890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A54UdMciCNBls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=;
 b=GHkoqvzJwl+Oj2EhMsBTlsKQ70zjh6wMQSOYFUFNODFXyCts2t+CBiXHmMpyW3YDWj
 dsZpFjzFzKT9yoZTO8ual0+ocY9QmJfGb47nsy+eiAXdI1T63fKoWRrwdkSo3FyVlaHQ
 yk8oK13qION0BZN1mo/q3154nAJ/djo+uLeSFXPyU5GXXUpWKtksdlq+f2cfXWLSO0/2
 TyBZdHnOUtX9RxJCBNV7fDZp0yoNH9j0MROVBdNpIsFAQKKrSgPfYRfaLlQ/pmVDCwdc
 HD0dfqMtrWTKJ+Z6yoptE9lCGDVBXiV2GM0scwGDHVgh+9giuwYaj3CJTTJvYuky54Bt
 n2Dg==
X-Gm-Message-State: AOJu0YzT0w1a3sKFFWXn6VXj4Ul8V+sPE6z7h8mMt+RJrDJUXN9oqX5H
 l6kQjsuuYrn83575eLDYla9sHxUu5vh897DHvz40X8ImbBqDFzXjpM/FJ8G8yygPW5vwmMly8tu
 xD1A4McwGlWVw4Jff5et/a22E3S5rnbBCc2kowmyayy5xBSxKs2n6wi3zrV6keJPKtISW0Z+u44
 APOCE=
X-Gm-Gg: ASbGncsCVSupQOM6K7a/b5hy5yoh3XVS5AuwjpROGjlToB3uV3/Rh7fYtxEwpi6kPDo
 q7d+6MqyIUHEfJWSO8kh5lr8tp5uKf/7rhTZXAHJ8QmCE6kMgML+xV2LXu7Wm0aTdBlmMufTrrh
 5tm6Fz01CkyXhWulKFvfK184NJUq0UdO7sAOoM9GyxwIC0m/WPwDXPRiDImQ3wEq/dAJijMnLAa
 x3BsObwe7dk0PozbssDJc4nMqeQuFStfFaKuax0cViqckXPvVWxi4EqNl1SVnC9Dy6eE3VD5VAP
 n5QDAdgXtgHy7CuO1QEqfl48BQ+AdhNa
X-Received: by 2002:a05:6a20:2453:b0:21f:53e4:1919 with SMTP id
 adf61e73a8af0-220a0893979mr18746144637.3.1751206090163; 
 Sun, 29 Jun 2025 07:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8rwemeeKoXa3dY68CP5crYj0elFksFOZ4WGRjdgo7BPXpcPNprB8m352xNp9ATYbOhE0nUw==
X-Received: by 2002:a05:6a20:2453:b0:21f:53e4:1919 with SMTP id
 adf61e73a8af0-220a0893979mr18746079637.3.1751206089570; 
 Sun, 29 Jun 2025 07:08:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af557b3adsm6718564b3a.106.2025.06.29.07.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 34/42] drm/msm: Split out map/unmap ops
Date: Sun, 29 Jun 2025 07:03:37 -0700
Message-ID: <20250629140537.30850-35-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BCfYrjegfuVBGcDM2rEu4wTk-80FsN5a
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=686148cb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: BCfYrjegfuVBGcDM2rEu4wTk-80FsN5a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXxPc3Uq9cxj0R
 ivnhXkxm3YIkRcNpDj4czn2K/dqUXrEKDjOCLeHoYwj21FQY/GCCy7RvvqgMbU1oAJc+liutALo
 c001gnGdwoJq9xQ2OEnk+8E4E2LFrkZUxaavriRnfu0OPgbNme/7AJDATS8p1w//HNpNM/Ux6kG
 BmWnCPJNi/Js0khEsj8PEi7WWbpMKV/R0/iCYv9OYOm+ezgp+fykTKIaszIeblAVqTtwGqzMWE9
 ApHqjoNSrqMB5o/6FplMbuA94ecKK8WYy+CiLrSYKwAgt8v2puIAQ8NyVt7SogJ0R9lGqi758f5
 3wYI6aa64GMylwdlqpQSizc4EF2izrGNGeYpuvCU7i7LNzFj0fXpFAIsfOIeLaq0Fgylope3Vk7
 itstpxO6TPy+uZESoV7Cfi7LamxVBt/1LnghsZEMLiAtXeZHRPUVa3U/JibanTHi30g7gBl5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
2.50.0

