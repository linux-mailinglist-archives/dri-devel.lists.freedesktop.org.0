Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729DBAE8D97
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B5710E7FA;
	Wed, 25 Jun 2025 18:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzKlFUqK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC40810E7EC
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PE8AYK015264
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=St2ndJNB5T5
 qxjvTBi+Qboj7ahOA3a+vNQ3fmIRIIqc=; b=ZzKlFUqKEOVyFXcMOdJUfarENsq
 O2Eb5I7wLaeCVGo4vVuFEMsHLMiOzr7K1po5u//ATfuu1UzO7AQrZqYX0JFY3u+1
 4pONbArdLl0JLXNQw5fuSzeI3/4vNR8wUsI7ZC8iU3HtpjCGX+aPRkBQEae1yB8g
 Whjw4ki6Shcf3Z/B4kLj8W4Vvawr0+tQkwpnLQ07qj/UWBrs7byXdnzbnqzNqQZn
 q7TP4eABYaUMzzZJcKUx9fGdpcyezNd2j+qNEEcdrl8Ah4xyA7paoj6QVIFLvoBt
 ItFgY7A33husmTVHRyCBwiWpADIB++/OUE9NXA8XHXcM2j8yLrDtvlOchYg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqqdk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2355651d204so1581545ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877958; x=1751482758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=St2ndJNB5T5qxjvTBi+Qboj7ahOA3a+vNQ3fmIRIIqc=;
 b=wh83DQyTWhduuVRGj2eXZ0Hiw+GjzQPEor9iX/DTVX8mPfcUA/BDG65vJS5ArgT3kL
 9KYMGFAnWktQCcl1izYr0u//CzoNofJmeadlPgqdiKN5vtDRWFynqMZfL2pwoFIiDDkx
 znMgi3HVLVesaPbFdhLo1qFKtz24MiLE09JE2Kk2UeELOffMBdlRR+itexwEbkaEyci5
 i6674Kd3CPpEpVcWRiQC0IXSCTPyftEAYOKquEsffjPZnleZzF3vi9TCnjeRJj7P+1LM
 5FDaakNSwFW2fJ7yjxqmNEu6Vrze7PCmdmo3IJ/MKxhp3FaBwgkn+btpzWqu5Q/1klGg
 Wm5g==
X-Gm-Message-State: AOJu0YwMbg0VfFGEB8CxgQvORxmmLJDCh3hQdx4lUlo7uwsDIXxKU3jf
 8FNHVrv6LdWMmlYtg7ONlSnG+Ti2pjaUz9w06ozUGX4GaJnNtd65GCvfJAK860+LNKhqECaGyRI
 3ZZYrHXEjTzL6R9Q+P3LG3l3BKhM2JACz+ZON9HYPZTBwQUQ3ER7TmjuYTy9Ivr/qr8y+9RfyEe
 TBxJU=
X-Gm-Gg: ASbGncuwbtigsEgXFNgbYEwPHT6wtK8HlfFhxkxav4ufCG2Ra1yuElt4hnvwuME0MiF
 31jpUziMhPx3QTPVDNR5k4biYNyIDxck/1E21MtdX5STK8s29N0IluGagMtiCXAaMQPKLlnpK8I
 59jF5O5wpB4icQj+zu+5/8QGu76vddR1kAnBCO+ZZ0YilHjCtdf5UrrP+NLXtWNEuXW2WC6LV0I
 ru9nlphYQGfSSo65ruAgieh9LgBKD3NkF8EKVRgqmK3Baj2hh0HtghsGhelkgYnrz9G0InUwMsX
 8iLfY1YAoCxP2hlodMVx5fUpvou8wLkS
X-Received: by 2002:a17:902:e890:b0:235:6e1:3edf with SMTP id
 d9443c01a7336-23824039f7amr77982835ad.34.1750877958523; 
 Wed, 25 Jun 2025 11:59:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/Y9lB16IKtQS7RqL3y30IZ+jiD7LUeSPJzyPzPcOjdlpXE/X4dI8MmjryvmUd3anc1LWsJw==
X-Received: by 2002:a17:902:e890:b0:235:6e1:3edf with SMTP id
 d9443c01a7336-23824039f7amr77982545ad.34.1750877958122; 
 Wed, 25 Jun 2025 11:59:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2380d1a9d79sm42665515ad.93.2025.06.25.11.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:17 -0700 (PDT)
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
Subject: [PATCH v7 37/42] drm/msm: Add VMA unmap reason
Date: Wed, 25 Jun 2025 11:47:30 -0700
Message-ID: <20250625184918.124608-38-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sc0wQfJHfVU7XJhRzs04887u6czzTEh0
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c4707 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=S93TA_zjY9FrSvCmoiAA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: sc0wQfJHfVU7XJhRzs04887u6czzTEh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX9L2MoOVM76a3
 cS28nxi+70fH0C61JRR2CZsrF+qR9ctjXn2AkXwDR97I0ujc/BuSyVfMot852J7OGqkxRD/Bs0V
 XM9UU61x1qa06IhVlGQmripbaHnApURt1LBWbId4sPP2CndZwJb5ej+zGq1Ut0oih9Euu4qz6rD
 Rv27GoVp8CeCVRTPI6MYKpDdJnux5RUsNDj+FxmL4brjMJyoxPLa3rydnObtQl9pOVJ39PvTGkj
 gd+BshI2Hb7ivuj7BdpjballWP2KLzmDhI51IRiYxAymHwpl6qDKVPLWpHkh7EDwDHrmb8EciNZ
 wlGkwRXW/KG92puYmw+Ci4lSvDXTAOHrgOVyabPbNbVU7h9Tc3z6OilN4qlyLnb9OX48a2nbccE
 PZSb2zGpfn2mOO2AXFKG9U/njRah+vglebRaIlofOLPBp6VPYvHQbcTT96J9EuV+4rDXCRGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143
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

Make the VM log a bit more useful by providing a reason for the unmap
(ie. closing VM vs evict/purge, etc)

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 20 +++++++++++---------
 drivers/gpu/drm/msm/msm_gem.h     |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 15 ++++++++++++---
 3 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index fea13a993629..e415e6e32a59 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -47,7 +47,8 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 	return 0;
 }
 
-static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close);
+static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+			    bool close, const char *reason);
 
 static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 {
@@ -61,7 +62,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, "detach");
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -101,7 +102,7 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
-	put_iova_spaces(obj, ctx->vm, true);
+	put_iova_spaces(obj, ctx->vm, true, "close");
 	detach_vm(obj, ctx->vm);
 	drm_exec_fini(&exec);     /* drop locks */
 }
@@ -429,7 +430,8 @@ static struct drm_gpuva *lookup_vma(struct drm_gem_object *obj,
  * mapping.
  */
 static void
-put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
+put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		bool close, const char *reason)
 {
 	struct drm_gpuvm_bo *vm_bo, *tmp;
 
@@ -444,7 +446,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, reason);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -625,7 +627,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_unmap(vma);
+	msm_gem_vma_unmap(vma, NULL);
 	msm_gem_vma_close(vma);
 
 	return 0;
@@ -837,7 +839,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "purge");
 
 	msm_gem_vunmap(obj);
 
@@ -875,7 +877,7 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	GEM_WARN_ON(is_unevictable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "evict");
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
@@ -1087,7 +1089,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 				drm_exec_retry_on_contention(&exec);
 			}
 		}
-		put_iova_spaces(obj, NULL, true);
+		put_iova_spaces(obj, NULL, true, "free");
 		drm_exec_fini(&exec);     /* drop locks */
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index efbf58594c08..57252b5e08d0 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -168,7 +168,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_unmap(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma, const char *reason);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 729027245986..907ebf5073e6 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -53,6 +53,9 @@ struct msm_vm_unmap_op {
 	/** @range: size of region to unmap */
 	uint64_t range;
 
+	/** @reason: The reason for the unmap */
+	const char *reason;
+
 	/**
 	 * @queue_id: The id of the submitqueue the operation is performed
 	 * on, or zero for (in particular) UNMAP ops triggered outside of
@@ -242,7 +245,12 @@ vm_log(struct msm_gem_vm *vm, const char *op, uint64_t iova, uint64_t range, int
 static void
 vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
 {
-	vm_log(vm, "unmap", op->iova, op->range, op->queue_id);
+	const char *reason = op->reason;
+
+	if (!reason)
+		reason = "unmap";
+
+	vm_log(vm, reason, op->iova, op->range, op->queue_id);
 
 	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
 }
@@ -257,7 +265,7 @@ vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
 }
 
 /* Actually unmap memory for the vma */
-void msm_gem_vma_unmap(struct drm_gpuva *vma)
+void msm_gem_vma_unmap(struct drm_gpuva *vma, const char *reason)
 {
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
@@ -277,6 +285,7 @@ void msm_gem_vma_unmap(struct drm_gpuva *vma)
 	vm_unmap_op(vm, &(struct msm_vm_unmap_op){
 		.iova = vma->va.addr,
 		.range = vma->va.range,
+		.reason = reason,
 	});
 
 	if (!vm->managed)
@@ -863,7 +872,7 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 				drm_exec_retry_on_contention(&exec);
 			}
 
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, "close");
 			msm_gem_vma_close(vma);
 
 			if (obj) {
-- 
2.49.0

