Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5E4AE8D49
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3014010E7D9;
	Wed, 25 Jun 2025 18:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WovWfke8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E67A10E7CD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAnqPH023168
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=BHyE+ROYmr1
 BYZwR3C+QXhzqfJ1dS+58uUEwZ+AZnWU=; b=WovWfke8x2POZSi4XbGmSzoYY7r
 OJuPg4AxkbaNSEDy4W9A/qIvRpSjsPBtHFLNfg2eAF7LchS0j2rSUJZNSxecTKhR
 ZSd88/qdk1s4I+A+WGSbtG91p+FaLHyyCB7THVOZyDPRfH7EpACjmmePFE8utNH5
 31zjC90lH2xfh/5MvanjaDhKs2YgMalBEDZZfXUtj1gAB+Za/nwOp3miOitMZUFb
 qFjPLR3wD/j+IlOVshFrvlhITG4lP1LYb1b7L7szhnPuDzcPsTxCn0zCCRo5ANL2
 MO91QPqTho0c7/OFx7yG4eJmt5++tQrfLcIuoHCovxInXdp2sZFW6EXzsiA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fapk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23632fd6248so1456235ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877907; x=1751482707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHyE+ROYmr1BYZwR3C+QXhzqfJ1dS+58uUEwZ+AZnWU=;
 b=WVeHrGFh6OLR5g1QJ3hPxQns1xvIprMbt1fYUNad/rleghMIHqlZpuWHBUnRH9ovoe
 GQN7RC+4t3BVpA3MlQ+dcy97rhW5x9REdS1kgjtx2pX4EDGcOlvbjvpc3u/+1lTGZEJH
 A+mK4TCI7Ul4lZyO/t/ycYtnkqyZ8J8LYtQDE74qisCV8U03gfS2ZYim9uULqtvXYLAZ
 DgMpJLOGz3ViXSFOh9YAAluKox9SK1Mk33NQZK40s+SE9QGG8JjvCDbh3fgYB8SZEo+x
 FiAyFrUJi6feLhG+cYs8KFujmOdsQvSWmdVpgaTSgPZsP4lA5xZJFFExgWDGEKK/uU6/
 nJgw==
X-Gm-Message-State: AOJu0YwnvLXudrvcKPYZUfxrYI3odDbnaY9nJfd8O98eAbzvnApj0vtj
 JKd+lWH0zieoWDCOorVjJVnaZtpjH4BkuK6rNaxbVuzan3kFvssYL/PBxmgIkhdy4zaHb6RBtOH
 ykMARcq9SJKnHucVhM8ohZLMB7UMb/+vnhjTwKdPrbCNys0tB6vGj7tBrzLBsY3ZNLERJJNs7yu
 Hkal4=
X-Gm-Gg: ASbGncuV9cxuFvCezFgu0zGUsVT/asJ6zrH3Nu0PfQ2na+oBU9KwaZyJbMJikmVvPYy
 jjV4gR+6vzKnirwY4aSXlk8FwMzv3nWFFpnuJU0ofhIJ7DHfRS2T1FXGJFJkOngdRS8PO0BlC3E
 VeKaI4RZJpwyEMw54qUc17Q19WD9naYI+X8SfS5XUfSKb8JWVt58bNQepSIvjllpJx0Lukje9K7
 nTFJRAXa7k21Wr6Z96pgyk6umlxvqy2rikUQd+WFIhgCVmAjl1x59IpgORxjpEeRNxh3rVbSGwE
 /G74IELhYvevJYU/jdBFa98gRcAktxLC
X-Received: by 2002:a17:902:ce06:b0:235:eca0:12d4 with SMTP id
 d9443c01a7336-23824095671mr80469775ad.53.1750877906907; 
 Wed, 25 Jun 2025 11:58:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfOU8b5xN3DBcrI0SlkS8W7vOGGlK3RW15375C9lfmS207Fy10Dze1XSZd5UHnBi7y5LdHyA==
X-Received: by 2002:a17:902:ce06:b0:235:eca0:12d4 with SMTP id
 d9443c01a7336-23824095671mr80469315ad.53.1750877906514; 
 Wed, 25 Jun 2025 11:58:26 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d868f878sm144055785ad.184.2025.06.25.11.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:26 -0700 (PDT)
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
Subject: [PATCH v7 08/42] drm/msm: Collapse vma allocation and initialization
Date: Wed, 25 Jun 2025 11:47:01 -0700
Message-ID: <20250625184918.124608-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfXxu71wpBitdz1
 LmPMI9v+mj4IzL/+MRb0lAtxymLaBAIEZ6wsUlML4AjWyNSqpelwv1PEs4cYXkwLQHHv9gyt1DQ
 L64jyqW+XMGpjNop4UCgVsk+Fk9L4likCteV/9JsARCX8FXb6XL+rYDTZEnC6IiLFBueH2uaOlv
 CyASlW2maizMs9k+UX+8+4gWprPQHjNt/NX0t5KCfBz1wNXWUzcqJZMaOQyxFYsfGs3ncsSfOKi
 ZGrUeqsGLVd+V03oxJLeslrhXrMapKDhuk5kepmKCJEWGgYvZ8PRTkgtbTwOKAuz+9gr7sNIWfD
 2dQgvhox32/Qh+lawxgGtQnqSp35HtYCE8o+VsBSlkIqsfcvO3ejnlbVeHlcQGFa72VpBRVQmnA
 JBnd36aG2QYKoIXcjG/Kox2QAjGXB/3UsbyMhLzXxG/PHSfX/qs2Q/FhMM4qTxw2PcNLIvx+
X-Proofpoint-ORIG-GUID: 1AJBnq2HatJWAAarNllMeoLt2New-eK6
X-Proofpoint-GUID: 1AJBnq2HatJWAAarNllMeoLt2New-eK6
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685c46d4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Fs5xBETKxiRrdmql5B8A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250142
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

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 621fb4e17a2e..29247911f048 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -337,23 +337,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
-
-	msm_gem_assert_locked(obj);
-
-	vma = msm_gem_vma_new(vm);
-	if (!vma)
-		return ERR_PTR(-ENOMEM);
-
-	list_add_tail(&vma->list, &msm_obj->vmas);
-
-	return vma;
-}
-
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm)
 {
@@ -420,6 +403,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -427,18 +411,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		int ret;
-
-		vma = add_vma(obj, vm);
+		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 		if (IS_ERR(vma))
 			return vma;
-
-		ret = msm_gem_vma_init(vma, obj->size,
-			range_start, range_end);
-		if (ret) {
-			del_vma(vma);
-			return ERR_PTR(ret);
-		}
+		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
 		GEM_WARN_ON(vma->iova < range_start);
 		GEM_WARN_ON((vma->iova + obj->size) > range_end);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c16b11182831..9bd78642671c 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -66,8 +66,8 @@ struct msm_gem_vma {
 	bool mapped;
 };
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm);
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
 int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 9419692f0cc8..6d18364f321c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -106,47 +106,41 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	msm_gem_vm_put(vm);
 }
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm)
+/* Create a new vma and allocate an iova for it */
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
+	int ret;
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vma->vm = vm;
 
-	return vma;
-}
-
-/* Initialize a new vma and allocate an iova for it */
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
-		u64 range_start, u64 range_end)
-{
-	struct msm_gem_vm *vm = vma->vm;
-	int ret;
-
-	if (GEM_WARN_ON(!vm))
-		return -EINVAL;
-
-	if (GEM_WARN_ON(vma->iova))
-		return -EBUSY;
-
 	spin_lock(&vm->lock);
 	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  size, PAGE_SIZE, 0,
+					  obj->size, PAGE_SIZE, 0,
 					  range_start, range_end, 0);
 	spin_unlock(&vm->lock);
 
 	if (ret)
-		return ret;
+		goto err_free_vma;
 
 	vma->iova = vma->node.start;
 	vma->mapped = false;
 
+	INIT_LIST_HEAD(&vma->list);
+
 	kref_get(&vm->kref);
 
-	return 0;
+	return vma;
+
+err_free_vma:
+	kfree(vma);
+	return ERR_PTR(ret);
 }
 
 struct msm_gem_vm *
-- 
2.49.0

