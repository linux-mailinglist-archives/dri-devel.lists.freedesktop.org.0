Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7382FAECD17
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A6410E29B;
	Sun, 29 Jun 2025 14:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYJ5D3su";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18C710E093
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBpWgj029038
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=sVxQxqcInWG
 kGdZkfQeRJ3wtUjNtIfv/ihKTiUvsmA8=; b=IYJ5D3suc16HbIFda1q/42LjJ9/
 nRxIYwMK489S0+PWp2k66r1P7SCrITojE6k4gPRhDmHLr7IzTrtPI6TxbtIPaRpa
 eO5iH6jwNuhSgIHNChOOcpRIhOlHlKwP+mAuwycPfyHNQM1AaeJNAA/cv5xNyNYQ
 YV/LioaElYtpIy31HOp6WYumtRapq4GfMMW5bWa0h22J5iVN6iJD47zL+82Wflpm
 McgsH+tkuwbXS8F3kR/Iim+NnNEfirg74F+XjekluNGuiDCMv2Pw0zNlFAVKSK4Q
 cfmkhkczRIHIxbodyXiZBDVeKzOVMw13BcbHFae8awk9ZYZj6OWIlrwNTnQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8m627br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2356ce66d7cso16735265ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206043; x=1751810843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVxQxqcInWGkGdZkfQeRJ3wtUjNtIfv/ihKTiUvsmA8=;
 b=v1sHUhLOKwEFy43CEO3yOQ79mxc0/2XS0gk6FoBDCPUd8Op8hIQc9L83JMB2aWRY4I
 +V+Y2zg5nXTjw21suMk8Qka/gbeeWmxE+gF3FCOwztokU1wFWDD/j+LI6kIf78+oyiyA
 KUXSRwkD/UetF7u1vXam6QF7yv/AzAdc4gaYB7TRl2eSSyTxey6QdJtF/DbCH57BlBQT
 04MA4LE8HtKwGAfCrWEVr0AVGgJa5tIUkE+7wxiuTwuHsTecWjcyjYbqvXGiXDkwrCNn
 CLQq3OkNhRibsh/SS9T20p0JUrsewIFJPi1Svzd0t2nf2lStdnkkNxVWN7hw9mQdAQPY
 QBBw==
X-Gm-Message-State: AOJu0Yw5FQeBBxrRgIbYQ3VLBmGiAgOPR2LABg48wcbEa+wkaNwNsJ09
 ywn7KDCE1tyxDn4ze4axHIFFkEhigzXMP7DlL/wF2L3lUV592Pf+ZY82GxCPiUdREoPmKHgdaAK
 UV7sSpV931lOQSXXd+Ud04s1paHTdTcg+oKJjzLhunGQKIrP+Fi8AMqE3Q70etVMqlyB6Yu7C4F
 ApDKA=
X-Gm-Gg: ASbGnctC6L0x610xGsVhL8aN0wS41tfFuKmocxuLXMbiruZR94hK0r+d7Hi5YfHL0uY
 kzYbZdBjYZkFIDbX+TuitDx7NXNe+WG6VwvpW17r3jD6KTP/JnGmoefCqBhYSoTRMbfmP26uWwo
 +hahRiP5LPVvhs9i2GVVH1vx35aJcNTW1HXbC3UAG8FM2BJOslw7KpP7O+MYXzl7AvikI6stTkt
 pE4Qqwxu8xafAtUTegEjfbzoMcaSquUJIzGe6St+WyXEb/wrSmfu3G/gFmYmPo7EKxPsLtXQzWK
 sARSpkhLM8FeEn5qjXjzZmPjNDPmpNiL
X-Received: by 2002:a17:902:ec89:b0:234:be9b:539a with SMTP id
 d9443c01a7336-23ac4669445mr164026035ad.40.1751206043213; 
 Sun, 29 Jun 2025 07:07:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjlNaS4GuuR0AQMQjI+3+VSvt4lcAZtZqKTQqSco/bWPE6Q8TkSQrt0HwBQMPhpYXjAE5Ueg==
X-Received: by 2002:a17:902:ec89:b0:234:be9b:539a with SMTP id
 d9443c01a7336-23ac4669445mr164025665ad.40.1751206042803; 
 Sun, 29 Jun 2025 07:07:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315edcfd75dsm3079464a91.1.2025.06.29.07.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:22 -0700 (PDT)
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
Subject: [PATCH v8 08/42] drm/msm: Collapse vma allocation and initialization
Date: Sun, 29 Jun 2025 07:03:11 -0700
Message-ID: <20250629140537.30850-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX3jZviHhSYfj9
 TIL8+UjWOdAeiKl8uTq7D/ynQslzZTlikpbRxNaXl47yQnOpKeHZDSMOrqBiy+WeGAMyv5Bfqw+
 HKSKFGO8N7qFxxOKeBRFlqj2TLvFw5HW0VG9HbriFkeKFk8kSF9Tt2Ediasds3SbJfjTs+zQQd2
 C97nh1iD4oc7sQp9PWdIrHUtlXMXnyeXo/27yoTW7TOp7XZOFHBqfkZwTx2ehMBu6N02FXUoOVD
 ye7W7Y/7p10HGmnn8AuKvgBOV+BvI3ueBZBsb0IXV5Bu4wMiW6it2Pdc/nVRzcrk5KY+o9W9hQB
 K45TCIegPUKtY5FEUpQ1UF0TgALkJZPtjzvmgwyhJhnMk3y6jFd9xwQPJuyVuTmXN0mRfcvXDCf
 /BZe/r+QE5LgXinIuBCBDPjJdlfp0MWebSmojxDy5Kzg6okj3ecZF4n6XCM0MxXzqiFiC60y
X-Authority-Analysis: v=2.4 cv=Fq0F/3rq c=1 sm=1 tr=0 ts=6861489c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=amM6-9Z1s-9IjK5NNPIA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 23sNLRanal2L694TYBdsmWnQR_-UhGqd
X-Proofpoint-ORIG-GUID: 23sNLRanal2L694TYBdsmWnQR_-UhGqd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
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

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b83790cc08df..9fa830209b1e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -333,23 +333,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
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
@@ -416,6 +399,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -423,18 +407,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
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
index e47e187ecd00..cf1e86252219 100644
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
2.50.0

