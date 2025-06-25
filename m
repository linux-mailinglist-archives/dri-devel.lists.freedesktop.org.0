Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7B5AE8D7E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20DA10E7EB;
	Wed, 25 Jun 2025 18:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GysHBRol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4FD10E7D4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBnFZt013198
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=F6qh8d6fUyE
 8PFPWr8kAxkQ8qVtIka0LBkE1NoV8MqA=; b=GysHBRolCVL8iJJjgnL3i4JJ2C4
 r/PjE9IgO0DcDYOlwm5VGFd5z83ttKrBGTWcy76wrpYMlUyqjRmEuAWkub+MoL6H
 kP+M5glqyt2YoO6mRzHgxYikmRZ73856aNpOB+d9wLTY+BcvmazdZh3CJsLp9zOQ
 wPOOf/q28tsuNfiMNvgUylh4geO1zsITey1HNKkX+CkQsnBN0gVbn4IYxmeVun9s
 HIrY1zv8oRmKPTPZ8Rod/YqPF7bMQboKf1Wzau/cB84eQPKv+068bRptlD3P9Djk
 QSWDBL9F1ghhYoBawNLlVA3SPHXz4VjGqxKiypgkz5JakIzrJHv12oq6rtA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1yh0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-748e1e474f8so341775b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877943; x=1751482743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F6qh8d6fUyE8PFPWr8kAxkQ8qVtIka0LBkE1NoV8MqA=;
 b=IPRHIZ7NKEEJJ+rz7456FQgx2STVlLmTaTHGUVoJuMQ1/7fy4vw6Zk9aQGTVToIHqy
 2Q3cw1KKkK1fDdezWamZW1Ktr3E1oSW2Zs3XiYKN/rpZ+MuV4W9lWJ7XlpwBTykHcnX1
 k3cF2xCDmPnCZMx7AwJhMWZ3heT0chqyt++iVPFf2HV1BPAjxVhPa591wacGBuE8BWUk
 NhzflGw+koC7Tiy2RFB/ihsIym30OA8FBYTOBY7NCpR9EQ+xHNEW8XVSRmuDsy3+qpWE
 VeQr3cxHbqv2sP0t9ahjpmcriSvh+kGefxDnHXkeDD0f1qPhwuhkcCwcsV3Q1TipBrKb
 HtLQ==
X-Gm-Message-State: AOJu0YxstxS/1zR8HGDpDPtINbgSxU2ypLTlqDiMUpRYNi5AeObXGZWj
 8Z9hiUu7SkLuwyraDCEulSDTvcrT+SPwFe3k13S4as8ObYNkiJt9aJ5ttIDffKgqWl6WUfJ9n9B
 OCPwL4WK/UQTfEObECOSrh5wDyb/oAvfF/X28tAjPO8C0WjeC2jfmOTYc1zCg30AAq4NpOFC/Rq
 PGP7Q=
X-Gm-Gg: ASbGncu4qJ3dl0K/rfqgYqS7AhOCTxmeXo65YPgDBQJVghut+JWy/d2yY7UcCxAybKp
 GhUUV1SCg3nD1KNi2slJn6MbCKD/1rZl3VG8f8Ss7CXN4yFHFAf1tIaOWhy3X4c177/6wNZx1Jt
 ckUv99kjIqduzJ4aybTUifqawiwwR9HYW78ywCIwPK8u0JmchLcRjye9npKffC/DiJ4d1usBfnG
 WMXjj2856jegY9eWanF4kHR6V8d5mN8z2pZ6SJncDcRAWSuRaiuTDkVUAezBEUVMqzfglC8xOv/
 HT8ZbWB/4CHLVgAOcTZ9zXAFeYL1GioN
X-Received: by 2002:a05:6a00:2e03:b0:736:31cf:2590 with SMTP id
 d2e1a72fcca58-74ad45bb45bmr5615194b3a.16.1750877942982; 
 Wed, 25 Jun 2025 11:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg8vNYWkF6glZsGu/qF4tKCYvJINSQzai59ELYbebz2aZfun5XKFQM14/85G3r1zrV/TUgLA==
X-Received: by 2002:a05:6a00:2e03:b0:736:31cf:2590 with SMTP id
 d2e1a72fcca58-74ad45bb45bmr5615157b3a.16.1750877942543; 
 Wed, 25 Jun 2025 11:59:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749b5e08cfbsm5259906b3a.18.2025.06.25.11.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:02 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 27/42] drm/msm: Crashdump support for sparse
Date: Wed, 25 Jun 2025 11:47:20 -0700
Message-ID: <20250625184918.124608-28-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685c46f8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: KW9uwRfH7YiMy183hRDj7hu7Harl1uHZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfX/XSVgGGUxN6r
 Y2jTO6BvCl5r8fh83myW/3mMHiSQ+wd6W/V1F7ZaRW2Z/32UzybJqwVrlUjisRG8W3oZeLyA125
 OAJbc1b/PaxRcv15jbykhAudk3Ths+20vd22fSqhqiGwkW85mx6FuZTHrxaWelbUrUBtQw7oIUs
 pPqDCgctdg3vUJhk8H6tcTHF/jhXar6+w0dqcXfQac28JOrU9HgYfteOGKfSEbNgdjr6Ehe8JFy
 7nsGSnGny9hi08/DRuuTvp/vhhPIuXtoonclc82g8AiY33275/dPT0UgLQeGARn556MPEYn2FS1
 V58dIh5cJcBHP1JyjzcHgbPVRFEHPVvANlQPfPgsgbRJ5NPomFdhdpLraVqaY7N264ZcRS03jTJ
 oRAxSRagse221YYg1YaT7yU+3rJsIfZ0mt8zKf60nhI01b9h/f/rgr5RJS6Tuc38oCgIcuFS
X-Proofpoint-ORIG-GUID: KW9uwRfH7YiMy183hRDj7hu7Harl1uHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
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

In this case, we need to iterate the VMAs looking for ones with
MSM_VMA_DUMP flag.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 96 ++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 2eaca2a22de9..8178b6499478 100644
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
 		struct msm_gem_submit *submit, char *comm, char *cmd)
 {
@@ -279,30 +340,17 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
 	state->fault_info = gpu->fault_info;
 
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
2.49.0

