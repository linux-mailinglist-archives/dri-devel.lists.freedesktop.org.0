Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152E5AECD48
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E904210E346;
	Sun, 29 Jun 2025 14:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3WXG8rQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F63F10E345
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:02 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAeHq9006623
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=wKngwCavAFH
 eJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=; b=e3WXG8rQ6vHuJOqD6VGdpzNnBbX
 PUBJy/yVEcAa5UG18CIGIWSs1yGDkldBONwQjE1deVxapBFN1T6q/SlheZqziWPs
 5Tx32azGmi13Qd8CtDjfEujKkelZvouXKJSj7YIDhgohch0uX2KjOWbhD9h6CEX1
 lZB2IwbgkoJ65QtLXd4FwYjt/evKDDpikKmJRxEEq7VGRNJFc+ZJe0oJX0UYaMT+
 76rZiPYJ4dfAwmD9b4yAqyAPMmRVrsRej2AeD28ApyXSedTG2L6CoRmlajDSDeTU
 J+xhkFB1+6JwZe2pSJ8C/a2PniwfETZWjYvM7iivaZevT2AKzs9SdaDOJuw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxa8f8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3141a9a6888so3263010a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206080; x=1751810880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wKngwCavAFHeJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=;
 b=K5g5uIYqp7UaEPTnavzyJuTVkuEE8qc2PtH55f4iSuXLt3YICuWe4WY06XCLvWbStU
 rpNsXaI6cZKNHZ78R6+E1TNM/iTjkntAJmLSyUTwurjT5HgeI/z0Xq30n0M+1ETRj0Q2
 9ZsfPQq+nD37txiCg/+aNsJy1b1TaTc9CMTdss7hqgD64EdQqziWZgB7mIQAtiRguUed
 /d2qORNruTZIhPUROOfrHj1uxAtEcnumV1aq9qKZBZBBFxvcennE1WJ46heKAvaD7ExH
 qlElbIFfVQI4p20MShSBIgKMGZIzLja7I8ylrD2GICV3+iRfAPInqk+nZIaLd3hgYhHe
 kdSw==
X-Gm-Message-State: AOJu0YzO4y5zFepGwesj+zbO6VWlcEN6EpSLhmJKQ5e9fvz4xJ8VFPHP
 S/tkg/I9Tqhxh0Y7MBd9fFuFXN5+jq9kL7ct28vDH8ljp8MrS19yEinRW/jCmc/5X1Hnshl53sK
 FOba+RB9UrCFxQjy6OKh9uoopHPes+/DtjTn0mVG+OfBZt8QXUJJ/sDl5GzSCdeBXfiT2E3ykAC
 bKtQ8=
X-Gm-Gg: ASbGncvVy9RHFOt9fO+6CNHn0yKhNEaAQYWWThD3zjIwYZUA9yukMOLHg4Ts/n7iUvA
 Y7zFEBO68soT6zJGzmlO+cE1wTIHB1n0Ge8A6CfFCy+fIx7p/SuaDQ7LSpRJsCtX2rYyqOmCHdT
 msP6yrzXSjnXk2CyPkQIs54wdGTfHvqxfhVBU9j6j7viWvD3iL8uiuesgIluU+cDCR+7/z2RFpe
 NWGqYirvI5m3Vlb04nU8leDri5Wr+v/tN6DTuXXCOkHGNXO40x6Fge2weDUWs7A+Bdoyc4Y66PV
 bbxLAph8WAbu+FgtiNqUuQLPsVBUBRcp
X-Received: by 2002:a17:90b:1844:b0:311:d258:3473 with SMTP id
 98e67ed59e1d1-318c8ed854fmr13825608a91.13.1751206080056; 
 Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2yCfAWZdhnM43W+FQAK7Ei13wp2HdXGViln7XgoM6zEbL0poVm6fbDuQVtD+plTe3hIuSDw==
X-Received: by 2002:a17:90b:1844:b0:311:d258:3473 with SMTP id
 98e67ed59e1d1-318c8ed854fmr13825561a91.13.1751206079616; 
 Sun, 29 Jun 2025 07:07:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5382f02sm11175097a91.1.2025.06.29.07.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:59 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 27/42] drm/msm: Crashdump support for sparse
Date: Sun, 29 Jun 2025 07:03:30 -0700
Message-ID: <20250629140537.30850-28-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXxSfaEKBGKm6i
 kgE/X2Fk0QjQCNqMN+nW8W5eMAhpiTi3trsvcDk/niSHQR7EcIh+c31LPdJ+XOFcHrcP3pVlz7B
 r4dXBN4u94wiGy4OsuS1YGFLaFdYSK44f4IOFDl3o56SzQr4f+nlm/FtycSeUQfKrkdHwsKtCHW
 LtwJOSawyUGZy7PkUhodUBWKmVFgQPQiMfhz6ajEWGOoT2b6G1rKEiLY2umfcZnCqhZVrTXDv26
 a/2LjWuKxERPm8l6wY1BdX7iE/BmUEnePX4f3THGa6UybT6FZCLFp6Y04p9nwidoz57CHSXxxNj
 /ipQrAzIbqQl4/tn9abg8OQkv7tYjgyOHyGWTUz1jQsJuoR+bXhCtgIXVD3z2VvX6ea44t1uqnc
 H9VRwYvj6Yszf/A0f7U1kr7mtj+I1s5sJ0M+Fs6/98Ce6p4SCTHI0mNqtvMJKBegpvUaymaw
X-Proofpoint-GUID: wcN8KNIstiLQnCmn8_M4ekWov5t-3ELA
X-Proofpoint-ORIG-GUID: wcN8KNIstiLQnCmn8_M4ekWov5t-3ELA
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=686148c1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119
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

In this case, we need to iterate the VMAs looking for ones with
MSM_VMA_DUMP flag.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 96 ++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0a9d5ecbef7b..ccd9ebfc5c7c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -241,9 +241,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		if (!state_bo->data)
 			goto out;
 
-		msm_gem_lock(obj);
 		ptr = msm_gem_get_vaddr_active(obj);
-		msm_gem_unlock(obj);
 		if (IS_ERR(ptr)) {
 			kvfree(state_bo->data);
 			state_bo->data = NULL;
@@ -251,12 +249,75 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		}
 
 		memcpy(state_bo->data, ptr + offset, size);
-		msm_gem_put_vaddr(obj);
+		msm_gem_put_vaddr_locked(obj);
 	}
 out:
 	state->nr_bos++;
 }
 
+static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submit *submit)
+{
+	extern bool rd_full;
+
+	if (!submit)
+		return;
+
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_exec exec;
+		struct drm_gpuva *vma;
+		unsigned cnt = 0;
+
+		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
+		drm_exec_until_all_locked(&exec) {
+			cnt = 0;
+
+			drm_exec_lock_obj(&exec, drm_gpuvm_resv_obj(submit->vm));
+			drm_exec_retry_on_contention(&exec);
+
+			drm_gpuvm_for_each_va (vma, submit->vm) {
+				if (!vma->gem.obj)
+					continue;
+
+				cnt++;
+				drm_exec_lock_obj(&exec, vma->gem.obj);
+				drm_exec_retry_on_contention(&exec);
+			}
+
+		}
+
+		drm_gpuvm_for_each_va (vma, submit->vm)
+			cnt++;
+
+		state->bos = kcalloc(cnt, sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			msm_gpu_crashstate_get_bo(state, vma->gem.obj, vma->va.addr,
+						  dump, vma->gem.offset, vma->va.range);
+		}
+
+		drm_exec_fini(&exec);
+	} else {
+		state->bos = kcalloc(submit->nr_bos,
+			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		for (int i = 0; state->bos && i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			msm_gem_lock(obj);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
+			msm_gem_unlock(obj);
+		}
+	}
+}
+
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
 		char *comm, char *cmd)
@@ -281,30 +342,17 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	if (fault_info)
 		state->fault_info = *fault_info;
 
-	if (submit) {
-		extern bool rd_full;
-		int i;
-
-		if (state->fault_info.ttbr0) {
-			struct msm_gpu_fault_info *info = &state->fault_info;
-			struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
+	if (submit && state->fault_info.ttbr0) {
+		struct msm_gpu_fault_info *info = &state->fault_info;
+		struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
 
-			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
-						   &info->asid);
-			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
-		}
-
-		state->bos = kcalloc(submit->nr_bos,
-			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
-
-		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			struct drm_gem_object *obj = submit->bos[i].obj;
-			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
-			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
-						  dump, 0, obj->size);
-		}
+		msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
+					   &info->asid);
+		msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
 	}
 
+	crashstate_get_bos(state, submit);
+
 	/* Set the active crash state to be dumped on failure */
 	gpu->crashstate = state;
 
-- 
2.50.0

