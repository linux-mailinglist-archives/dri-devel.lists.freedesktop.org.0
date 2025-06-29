Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0C5AED087
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D2610E36F;
	Sun, 29 Jun 2025 20:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLAWhJFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D621C10E37E
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJoPBJ020133
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=wKngwCavAFH
 eJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=; b=NLAWhJFPbq39BjypQRne8ydDAaM
 OolAh9mjryiU5IR4UO0JxAmwV0D6/5e0bkjZyAn4KbFUEBpTylJaCPQfzuVtn5pi
 oG82sdajtE6GsEAoWing/jw5mB0wt7984SDNjudPS1d0IlV2wMF6wq4xKQyt58DN
 6h71dEw34Er6vX41qI+u9uno4j9MvDUmTM+xI6ckWCO8MKbzlvEY48S4rR1l2PbP
 MVzhAhWYp/oGyXsWq1aVItSEctqXm/z5Xr5fThOb80h6CzH7ONP2hZe74tuue6xA
 TJjzAOHlDH1/UZn+ltJdl0GEedUwV749oaKtTamMawopr84fqDV/xlvYDLQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2mu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b2c36951518so4382309a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228216; x=1751833016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wKngwCavAFHeJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=;
 b=QCehJdgcGIoYDLxPTo/fVeiK4IyRZkw26KpzY378R6RnJJlfSISmn37SWtO+rmC67w
 KWxuSaykhFC4896sz6dkLagxxcqlBWnYI41I1wZKPnclv4ua3kWpHdf2ERB3UyS9f6UH
 RHgk+s4yFDS2Edlz9JkEMPVBLdz4YRadDAxn14aTVI7/sV7VAHsnmCGaWXv/8dtVc0Vn
 hwJ7mGsuwzpCCvTGs4//MQA76DNv2X1wf0yg7u7drGeZRiIbEnQ0iuYMzFmiZAG+9MPE
 Gpbr3qVIcWpvAGBDAFrlNKEIoJh08soHDfukw57CG9hXoTqfQkc494oaGz53YqxvVeVE
 FbmQ==
X-Gm-Message-State: AOJu0Ywyo6MM9yRFSzCBcaVA3A71zuBhrQ/JLXkT9ktcF2+h11w4RCED
 itkOsC2c/Eqh15pQgmwNk2ux0AmIIQIcdJFvNo28vjV+AV0KNjnG7nwbZqmyc7icQLcGJz0fGfs
 1e7LIszkYfpjDsIL3MULdNaYwKl04Rv67Y+MWtpbvHBRncPT66Ogqkkg0BQk6dpjwF7YLCisa7A
 pIn64=
X-Gm-Gg: ASbGncsedTc2SVENcnmgPoQ1xXqNZ2lRdZDFk97FpEonaK2TfhftUyiW4xR2eSIWbiN
 0LECqSSOL0YNX8vVEtacj5ZFXgVi5w7hwgG6Y4Qg79g5zkqD7eubVNdZuVC9s449WRA2l9DxDlc
 Vo9zqdqp+s6mfv9Zz9/ZIFwztb6SRXKE6HYK5AcnTneazBNe+pkTIIGhEuSTI5FzWMBJfgigaaG
 YE4O4RRISm+oBjBv0X/jaqnhiZRs2Hq73TXQUVRO4ykdr72RX9lUHui8i4BCqTh5QntWp7XvVdA
 hSK6pP6aImJssHUfEBuvGt6AlfD3Zs+zBg==
X-Received: by 2002:a17:902:e88e:b0:234:8a16:d62b with SMTP id
 d9443c01a7336-23ac40da316mr169235235ad.12.1751228216399; 
 Sun, 29 Jun 2025 13:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaWGPydQV216i89tCogIBG6+vmTYkFs0wd5R8OzSvv9tHVI2ml64sOXsCCbBPTAcj30aV1kw==
X-Received: by 2002:a17:902:e88e:b0:234:8a16:d62b with SMTP id
 d9443c01a7336-23ac40da316mr169234945ad.12.1751228215987; 
 Sun, 29 Jun 2025 13:16:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3b833bsm67473705ad.180.2025.06.29.13.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 27/42] drm/msm: Crashdump support for sparse
Date: Sun, 29 Jun 2025 13:13:10 -0700
Message-ID: <20250629201530.25775-28-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f39 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: GVl9vikWXcnWY99tcaUBkLLDU7CCb_eb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX+RlqRt1BZu1j
 Ny53JgkbcCx9SuYFJADgN2Da6TE7V2yJucIMt+yaPQScEhw4IFk9DUuDGdiFJAZPhzSqEasCMKM
 D5CB3jZZAFyRNaJQAJ/G8rRy+izhPJXZ6ue7eptX2V4hKOih4h+hMimEcHmYZsSBdzC5KIFkVb8
 +4smod8QV/+fh/eWtMdrORCAEKr/OXOZY3geu4FIf00EOhbulQL6nX2JrE7/i0H9fvryasw8ixe
 4kHqUH0S35lcAPSvIrE/a6BBaajvbpuyIPFfCj4eYWe+/JGvAgCDCbauahOxJGLQpgR+bySLUBW
 irByAZJC+ldL/jIg2nFUHEVoKAvOoSdXXq11055mr+adnN0u3NheaufYf+PM40VvvnrNzUPjGzQ
 o+lOjfe+JjBpR09cMnAKypfyFkOVEJ1w9UIeBVwDQD7UcvHv6shheZ9q3RN18a46QYKTaWbq
X-Proofpoint-GUID: GVl9vikWXcnWY99tcaUBkLLDU7CCb_eb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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

