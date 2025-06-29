Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8BFAECD36
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C29F10E2D3;
	Sun, 29 Jun 2025 14:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOttiT1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D817010E2A3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAh20T010025
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=e9N226TKmG8
 dr6P8X0n3BrfaNxHloLnA/9DS1innPPM=; b=UOttiT1IV26c+M5j/dG0JJZShQF
 rAYlm2iEm3XMazv6q5Jl+oNkQAllbqaf5Vokg9CijbvkS92uMEKCM3a34OCH9mCc
 MMIxBUr0w/Zmu4F+FNtL5jdb0IbKyomTPyIcGDd5nzqkHmqupG2F/jgx6Xnl7crW
 fAhcUjpBHakYgT3MZZrCRS57NpLjrSUpZ0rtKEVc6m60m4i98QVxye4whmJQ1lQA
 D7lv06HoT8+fTXXOIS94O8Jpd7M67W3lETtvhXE+x25lPfI2EcuTTCupv2XbHVzc
 vj8YeTzxGATXw08psmkp4/opwj+U/UYLP3XY2Tslu0LrkTX7pLlSeG1wgtg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801t7r3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-313d6d671ffso3060940a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206065; x=1751810865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e9N226TKmG8dr6P8X0n3BrfaNxHloLnA/9DS1innPPM=;
 b=QQLaVS+rkpnIK/inb9rdTifXPPtlWjJhaiH1CLP8vqOvVkgVIMmIHfXaCy1AWgtQV0
 iWFp+BIBb3g3qzrzKlsKdharLXuMavIVrwnABhs7gxik26aEj3klSym7YgGuJ70UcF8d
 tacHOVm91RKztRMUZHNvy1MstgxR7+0WMtwYe2yF5ApaNR889/ogs45auCq4H3q22NmH
 aw8A8RGSU83QEvF3Swd0vHAMu7oVgoUqpDYVAuYL5I5kvVROpLWZSjtTUMeywoiju02W
 +JJpur8A4640gUcRmCd/o0Fkhkc+EJH8UmFQ3urRo/lwURvoxk9wVy3iO4doPNINBN+l
 wG7w==
X-Gm-Message-State: AOJu0Yz0tZIjXhnDaCEi+BgA6i/VRYQo98cv3K1PYp3Du9phjaVom1gD
 eHWV3ujBH1FKFQ/y4C46giZGaQoKyqwyl3tIuOXN+ZGbcVyxCMoPesK7AyOejHmnDjm8Y7mWK4s
 wEZcoEGuelpjNnq4qIQT4WcdoQ70ghgjRMEwGS2dCQYGatmz/p2wnmN+ZYwJG+ZYxUFui6WnNgw
 8ztDw=
X-Gm-Gg: ASbGncvmDdcQOkrVVwefz3vPtFDsSptgr3V9UXye9khcnxFYyi/HuvwNVis1o3NiDAo
 Y88IJ9ZywqnLIWlAEwcZrV4+DilMXTliUALWq0M8up6UWBD1cDDxvNHI0NQ8JEDVsMJ4+aPVezR
 YbkucCeDl1b2PcsESInJR6GQ/aVKqbVZDfV2jQiJpd7yFbaulswDYz0waBMhg8006fJFSh1rbEd
 WTkc5nnzjV2tZBq04xbljG9Rx6QLWaMq5Vm80zdZzKNWT8fgOvsvV9Yi1oHLL0Bff9PnnOdpGN7
 jcQxlcAiKv8Y+fh9x6Ifvs1hvkFdL2HM
X-Received: by 2002:a17:90b:2247:b0:311:c93b:3ca2 with SMTP id
 98e67ed59e1d1-318c8eb9988mr13958477a91.6.1751206064377; 
 Sun, 29 Jun 2025 07:07:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTzJyNnEA8T/IBTB/O2ITD5oDC5e4Pi5U4u9lzsd3gThJjH7kGJbjmMKwuE8ZaYXjo1X7CCg==
X-Received: by 2002:a17:90b:2247:b0:311:c93b:3ca2 with SMTP id
 98e67ed59e1d1-318c8eb9988mr13958388a91.6.1751206063358; 
 Sun, 29 Jun 2025 07:07:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f53879bbsm11733015a91.9.2025.06.29.07.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:42 -0700 (PDT)
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
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Eugene Lepshy <fekz115@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 15/42] drm/msm: Use drm_gpuvm types more
Date: Sun, 29 Jun 2025 07:03:18 -0700
Message-ID: <20250629140537.30850-16-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _pFdaIFqmKJPjG6oih7_yLkGU1MHBSEs
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686148b2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WETlIjWukoXTtCS2clAA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: _pFdaIFqmKJPjG6oih7_yLkGU1MHBSEs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX5JPnMhHrlsTW
 kjeEqYBhAfPtO+Z08eb80WVwT7oHaLfP7jzMzxIIwnlW/ZKQk3pFMnDUHti2C0TKmqprmNYhno/
 1x53OEuy+t9KWhw46W8pPAbrRAiJAbuyxU2yWs0IPDLSdipQrDI9tU38IpSL5YvAYuMwbTYsgj/
 n8tZ0NMJABrOMaCu/XuwC7mKElSt4i7lBCsRCRUYBEJOEub7uQFW52nSdVCxmMj+uZUsgniy6zU
 XA+4hPh3aV4qVDtZk/w8N5QDDafLTglLcYLnLg/QqJmm5499x2M2WKNXBaInXh5qsMhLYDoBqFi
 pDqex54okVyAKldcccCQTzQtot9fv9VCe0VJ1PiZalQZcGuI5yi7PX7Erw+c2NhcB4JkHc8e00c
 NppJmfJUJeiM0T2XLHF3HmshQbhG60dM2VVZu2oUmTY8OYUDhHgMecAOETCQw/5bV1mYjr7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
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

Most of the driver code doesn't need to reach in to msm specific fields,
so just use the drm_gpuvm/drm_gpuva types directly.  This should
hopefully improve commonality with other drivers and make the code
easier to understand.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c     |  6 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 11 +--
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 19 +++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 11 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 11 +--
 drivers/gpu/drm/msm/dsi/dsi_host.c        |  6 +-
 drivers/gpu/drm/msm/msm_drv.h             |  4 +-
 drivers/gpu/drm/msm/msm_fb.c              |  4 +-
 drivers/gpu/drm/msm/msm_gem.c             | 94 +++++++++++------------
 drivers/gpu/drm/msm/msm_gem.h             | 59 +++++++-------
 drivers/gpu/drm/msm/msm_gem_submit.c      |  8 +-
 drivers/gpu/drm/msm/msm_gem_vma.c         | 70 +++++++----------
 drivers/gpu/drm/msm/msm_gpu.c             | 18 +++--
 drivers/gpu/drm/msm/msm_gpu.h             | 10 +--
 drivers/gpu/drm/msm/msm_kms.c             |  6 +-
 drivers/gpu/drm/msm/msm_kms.h             |  2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c     |  2 +-
 23 files changed, 175 insertions(+), 189 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 889480aa13ba..ec38db45d8a3 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -113,7 +113,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	uint32_t *ptr, len;
 	int i, ret;
 
-	a2xx_gpummu_params(gpu->vm->mmu, &pt_base, &tran_error);
+	a2xx_gpummu_params(to_msm_vm(gpu->vm)->mmu, &pt_base, &tran_error);
 
 	DBG("%s", gpu->name);
 
@@ -466,11 +466,11 @@ static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
 	return state;
 }
 
-static struct msm_gem_vm *
+static struct drm_gpuvm *
 a2xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 {
 	struct msm_mmu *mmu = a2xx_gpummu_new(&pdev->dev, gpu);
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	vm = msm_gem_vm_create(gpu->dev, mmu, "gpu", SZ_16M, 0xfff * SZ_64K, true);
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 04138a06724b..ee927d8cc0dc 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1786,7 +1786,8 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	msm_mmu_set_fault_handler(gpu->vm->mmu, gpu, a5xx_fault_handler);
+	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
+				  a5xx_fault_handler);
 
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
 	a5xx_preempt_init(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 77d9ff9632d1..28e6705c6da6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1259,6 +1259,8 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 
 static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 {
+	struct msm_mmu *mmu = to_msm_vm(gmu->vm)->mmu;
+
 	msm_gem_kernel_put(gmu->hfi.obj, gmu->vm);
 	msm_gem_kernel_put(gmu->debug.obj, gmu->vm);
 	msm_gem_kernel_put(gmu->icache.obj, gmu->vm);
@@ -1266,8 +1268,8 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 	msm_gem_kernel_put(gmu->dummy.obj, gmu->vm);
 	msm_gem_kernel_put(gmu->log.obj, gmu->vm);
 
-	gmu->vm->mmu->funcs->detach(gmu->vm->mmu);
-	msm_gem_vm_put(gmu->vm);
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(gmu->vm);
 }
 
 static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index fc288dfe889f..d1ce11131ba6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -62,7 +62,7 @@ struct a6xx_gmu {
 	/* For serializing communication with the GMU: */
 	struct mutex lock;
 
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	void __iomem *mmio;
 	void __iomem *rscc;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 262129cb4415..0b78888c58af 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -120,7 +120,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (ctx->seqno == ring->cur_ctx_seqno)
 		return;
 
-	if (msm_iommu_pagetable_params(ctx->vm->mmu, &ttbr, &asid))
+	if (msm_iommu_pagetable_params(to_msm_vm(ctx->vm)->mmu, &ttbr, &asid))
 		return;
 
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
@@ -2256,7 +2256,7 @@ static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 	mutex_unlock(&a6xx_gpu->gmu.lock);
 }
 
-static struct msm_gem_vm *
+static struct drm_gpuvm *
 a6xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -2274,12 +2274,12 @@ a6xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 	return adreno_iommu_create_vm(gpu, pdev, quirks);
 }
 
-static struct msm_gem_vm *
+static struct drm_gpuvm *
 a6xx_create_private_vm(struct msm_gpu *gpu)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(gpu->vm->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
@@ -2559,7 +2559,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
-	msm_mmu_set_fault_handler(gpu->vm->mmu, gpu, a6xx_fault_handler);
+	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
+				  a6xx_fault_handler);
 
 	a6xx_calc_ubwc_config(adreno_gpu);
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index f6194a57f794..9e7f2e5fb2b9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -377,7 +377,7 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
 
 	struct a7xx_cp_smmu_info *smmu_info_ptr = ptr;
 
-	msm_iommu_pagetable_params(gpu->vm->mmu, &ttbr, &asid);
+	msm_iommu_pagetable_params(to_msm_vm(gpu->vm)->mmu, &ttbr, &asid);
 
 	smmu_info_ptr->magic = GEN7_CP_SMMU_INFO_MAGIC;
 	smmu_info_ptr->ttbr0 = ttbr;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 46199a6d0e41..676fc078d545 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -191,21 +191,21 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }
 
-struct msm_gem_vm *
+struct drm_gpuvm *
 adreno_create_vm(struct msm_gpu *gpu,
 		 struct platform_device *pdev)
 {
 	return adreno_iommu_create_vm(gpu, pdev, 0);
 }
 
-struct msm_gem_vm *
+struct drm_gpuvm *
 adreno_iommu_create_vm(struct msm_gpu *gpu,
 		       struct platform_device *pdev,
 		       unsigned long quirks)
 {
 	struct iommu_domain_geometry *geometry;
 	struct msm_mmu *mmu;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	u64 start, size;
 
 	mmu = msm_iommu_gpu_new(&pdev->dev, gpu, quirks);
@@ -275,9 +275,11 @@ void adreno_check_and_reenable_stall(struct adreno_gpu *adreno_gpu)
 	if (!priv->stall_enabled &&
 			ktime_after(ktime_get(), priv->stall_reenable_time) &&
 			!READ_ONCE(gpu->crashstate)) {
+		struct msm_mmu *mmu = to_msm_vm(gpu->vm)->mmu;
+
 		priv->stall_enabled = true;
 
-		gpu->vm->mmu->funcs->set_stall(gpu->vm->mmu, true);
+		mmu->funcs->set_stall(mmu, true);
 	}
 	spin_unlock_irqrestore(&priv->fault_stall_lock, flags);
 }
@@ -292,6 +294,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 u32 scratch[4])
 {
 	struct msm_drm_private *priv = gpu->dev->dev_private;
+	struct msm_mmu *mmu = to_msm_vm(gpu->vm)->mmu;
 	const char *type = "UNKNOWN";
 	bool do_devcoredump = info && (info->fsr & ARM_SMMU_FSR_SS) &&
 		!READ_ONCE(gpu->crashstate);
@@ -305,7 +308,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	if (priv->stall_enabled) {
 		priv->stall_enabled = false;
 
-		gpu->vm->mmu->funcs->set_stall(gpu->vm->mmu, false);
+		mmu->funcs->set_stall(mmu, false);
 	}
 
 	priv->stall_reenable_time = ktime_add_ms(ktime_get(), 500);
@@ -405,7 +408,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		return 0;
 	case MSM_PARAM_FAULTS:
 		if (ctx->vm)
-			*value = gpu->global_faults + ctx->vm->faults;
+			*value = gpu->global_faults + to_msm_vm(ctx->vm)->faults;
 		else
 			*value = gpu->global_faults;
 		return 0;
@@ -415,12 +418,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_VA_START:
 		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->base.mm_start;
+		*value = ctx->vm->mm_start;
 		return 0;
 	case MSM_PARAM_VA_SIZE:
 		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->base.mm_range;
+		*value = ctx->vm->mm_range;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
 		*value = adreno_gpu->ubwc_config.highest_bank_bit;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index b1761f990aa1..8650bbd8698e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -622,11 +622,11 @@ void adreno_show_object(struct drm_printer *p, void **ptr, int len,
  * Common helper function to initialize the default address space for arm-smmu
  * attached targets
  */
-struct msm_gem_vm *
+struct drm_gpuvm *
 adreno_create_vm(struct msm_gpu *gpu,
 		 struct platform_device *pdev);
 
-struct msm_gem_vm *
+struct drm_gpuvm *
 adreno_iommu_create_vm(struct msm_gpu *gpu,
 		       struct platform_device *pdev,
 		       unsigned long quirks);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 2c5687a188b6..f7d0f39bcc5b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1098,17 +1098,17 @@ static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
 	if (!dpu_kms->base.vm)
 		return;
 
-	mmu = dpu_kms->base.vm->mmu;
+	mmu = to_msm_vm(dpu_kms->base.vm)->mmu;
 
 	mmu->funcs->detach(mmu);
-	msm_gem_vm_put(dpu_kms->base.vm);
+	drm_gpuvm_put(dpu_kms->base.vm);
 
 	dpu_kms->base.vm = NULL;
 }
 
 static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 {
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	vm = msm_kms_init_vm(dpu_kms->dev);
 	if (IS_ERR(vm))
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index a867c684c6d6..9acde91ad6c3 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -122,15 +122,16 @@ static void mdp4_destroy(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct device *dev = mdp4_kms->dev->dev;
-	struct msm_gem_vm *vm = kms->vm;
 
 	if (mdp4_kms->blank_cursor_iova)
 		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
 	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
-	if (vm) {
-		vm->mmu->funcs->detach(vm->mmu);
-		msm_gem_vm_put(vm);
+	if (kms->vm) {
+		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+
+		mmu->funcs->detach(mmu);
+		drm_gpuvm_put(kms->vm);
 	}
 
 	if (mdp4_kms->rpm_enabled)
@@ -398,7 +399,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
 	struct msm_kms *kms = NULL;
 	struct msm_mmu *mmu;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	int ret;
 	u32 major, minor;
 	unsigned long max_clk;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 9dca0385a42d..b6e6bd1f95ee 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -198,11 +198,12 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
-	struct msm_gem_vm *vm = kms->vm;
 
-	if (vm) {
-		vm->mmu->funcs->detach(vm->mmu);
-		msm_gem_vm_put(vm);
+	if (kms->vm) {
+		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+
+		mmu->funcs->detach(mmu);
+		drm_gpuvm_put(kms->vm);
 	}
 
 	mdp_kms_destroy(&mdp5_kms->base);
@@ -500,7 +501,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct mdp5_kms *mdp5_kms;
 	struct mdp5_cfg *config;
 	struct msm_kms *kms = priv->kms;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	int i, ret;
 
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 16335ebd21e4..2d1699b7dc93 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -143,7 +143,7 @@ struct msm_dsi_host {
 
 	/* DSI 6G TX buffer*/
 	struct drm_gem_object *tx_gem_obj;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	/* DSI v2 TX buffer */
 	void *tx_buf;
@@ -1146,7 +1146,7 @@ int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size)
 	uint64_t iova;
 	u8 *data;
 
-	msm_host->vm = msm_gem_vm_get(priv->kms->vm);
+	msm_host->vm = drm_gpuvm_get(priv->kms->vm);
 
 	data = msm_gem_kernel_new(dev, size, MSM_BO_WC,
 					msm_host->vm,
@@ -1194,7 +1194,7 @@ void msm_dsi_tx_buf_free(struct mipi_dsi_host *host)
 
 	if (msm_host->tx_gem_obj) {
 		msm_gem_kernel_put(msm_host->tx_gem_obj, msm_host->vm);
-		msm_gem_vm_put(msm_host->vm);
+		drm_gpuvm_put(msm_host->vm);
 		msm_host->tx_gem_obj = NULL;
 		msm_host->vm = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index eb009bd193e3..0fe3c9a24baa 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -48,8 +48,6 @@ struct msm_rd_state;
 struct msm_perf_state;
 struct msm_gem_submit;
 struct msm_fence_context;
-struct msm_gem_vm;
-struct msm_gem_vma;
 struct msm_disp_state;
 
 #define MAX_CRTCS      8
@@ -253,7 +251,7 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc);
 int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
-struct msm_gem_vm *msm_kms_init_vm(struct drm_device *dev);
+struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev);
 bool msm_use_mmu(struct drm_device *dev);
 
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 3b17d83f6673..8ae2f326ec54 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -78,7 +78,7 @@ void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 {
 	struct msm_drm_private *priv = fb->dev->dev_private;
-	struct msm_gem_vm *vm = priv->kms->vm;
+	struct drm_gpuvm *vm = priv->kms->vm;
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	int ret, i, n = fb->format->num_planes;
 
@@ -102,7 +102,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 {
 	struct msm_drm_private *priv = fb->dev->dev_private;
-	struct msm_gem_vm *vm = priv->kms->vm;
+	struct drm_gpuvm *vm = priv->kms->vm;
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	int i, n = fb->format->num_planes;
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 82293806219a..763bafcff4cc 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -45,20 +45,20 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 
 static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close);
 
-static void detach_vm(struct drm_gem_object *obj, struct msm_gem_vm *vm)
+static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 {
 	msm_gem_assert_locked(obj);
-	drm_gpuvm_resv_assert_held(&vm->base);
+	drm_gpuvm_resv_assert_held(vm);
 
-	struct drm_gpuvm_bo *vm_bo = drm_gpuvm_bo_find(&vm->base, obj);
+	struct drm_gpuvm_bo *vm_bo = drm_gpuvm_bo_find(vm, obj);
 	if (vm_bo) {
 		struct drm_gpuva *vma;
 
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
-			if (vma->vm != &vm->base)
+			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_purge(to_msm_vma(vma));
-			msm_gem_vma_close(to_msm_vma(vma));
+			msm_gem_vma_purge(vma);
+			msm_gem_vma_close(vma);
 			break;
 		}
 
@@ -89,7 +89,7 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 			      msecs_to_jiffies(1000));
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
-	put_iova_spaces(obj, &ctx->vm->base, true);
+	put_iova_spaces(obj, ctx->vm, true);
 	detach_vm(obj, ctx->vm);
 	drm_exec_fini(&exec);     /* drop locks */
 }
@@ -386,8 +386,8 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
-				      struct msm_gem_vm *vm)
+static struct drm_gpuva *lookup_vma(struct drm_gem_object *obj,
+				    struct drm_gpuvm *vm)
 {
 	struct drm_gpuvm_bo *vm_bo;
 
@@ -397,13 +397,13 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct drm_gpuva *vma;
 
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
-			if (vma->vm == &vm->base) {
+			if (vma->vm == vm) {
 				/* lookup_vma() should only be used in paths
 				 * with at most one vma per vm
 				 */
 				GEM_WARN_ON(!list_is_singular(&vm_bo->list.gpuva));
 
-				return to_msm_vma(vma);
+				return vma;
 			}
 		}
 	}
@@ -433,22 +433,20 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-
-			msm_gem_vma_purge(msm_vma);
+			msm_gem_vma_purge(vma);
 			if (close)
-				msm_gem_vma_close(msm_vma);
+				msm_gem_vma_close(vma);
 		}
 
 		drm_gpuvm_bo_put(vm_bo);
 	}
 }
 
-static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm,
-		u64 range_start, u64 range_end)
+static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
+					struct drm_gpuvm *vm, u64 range_start,
+					u64 range_end)
 {
-	struct msm_gem_vma *vma;
+	struct drm_gpuva *vma;
 
 	msm_gem_assert_locked(obj);
 
@@ -457,14 +455,14 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	if (!vma) {
 		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 	} else {
-		GEM_WARN_ON(vma->base.va.addr < range_start);
-		GEM_WARN_ON((vma->base.va.addr + obj->size) > range_end);
+		GEM_WARN_ON(vma->va.addr < range_start);
+		GEM_WARN_ON((vma->va.addr + obj->size) > range_end);
 	}
 
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct page **pages;
@@ -517,17 +515,17 @@ void msm_gem_unpin_active(struct drm_gem_object *obj)
 	update_lru_active(obj);
 }
 
-struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
-					   struct msm_gem_vm *vm)
+struct drm_gpuva *msm_gem_get_vma_locked(struct drm_gem_object *obj,
+					 struct drm_gpuvm *vm)
 {
 	return get_vma_locked(obj, vm, 0, U64_MAX);
 }
 
 static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova,
-		u64 range_start, u64 range_end)
+					 struct drm_gpuvm *vm, uint64_t *iova,
+					 u64 range_start, u64 range_end)
 {
-	struct msm_gem_vma *vma;
+	struct drm_gpuva *vma;
 	int ret;
 
 	msm_gem_assert_locked(obj);
@@ -538,7 +536,7 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	ret = msm_gem_pin_vma_locked(obj, vma);
 	if (!ret) {
-		*iova = vma->base.va.addr;
+		*iova = vma->va.addr;
 		pin_obj_locked(obj);
 	}
 
@@ -550,8 +548,8 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
  * limits iova to specified range (in pages)
  */
 int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova,
-		u64 range_start, u64 range_end)
+				   struct drm_gpuvm *vm, uint64_t *iova,
+				   u64 range_start, u64 range_end)
 {
 	struct drm_exec exec;
 	int ret;
@@ -564,8 +562,8 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 }
 
 /* get iova and pin it. Should have a matching put */
-int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova)
+int msm_gem_get_and_pin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+			     uint64_t *iova)
 {
 	return msm_gem_get_and_pin_iova_range(obj, vm, iova, 0, U64_MAX);
 }
@@ -574,10 +572,10 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
  * Get an iova but don't pin it. Doesn't need a put because iovas are currently
  * valid for the life of the object
  */
-int msm_gem_get_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova)
+int msm_gem_get_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		     uint64_t *iova)
 {
-	struct msm_gem_vma *vma;
+	struct drm_gpuva *vma;
 	struct drm_exec exec;
 	int ret = 0;
 
@@ -586,7 +584,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 	} else {
-		*iova = vma->base.va.addr;
+		*iova = vma->va.addr;
 	}
 	drm_exec_fini(&exec);     /* drop locks */
 
@@ -594,9 +592,9 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 }
 
 static int clear_iova(struct drm_gem_object *obj,
-		      struct msm_gem_vm *vm)
+		      struct drm_gpuvm *vm)
 {
-	struct msm_gem_vma *vma = lookup_vma(obj, vm);
+	struct drm_gpuva *vma = lookup_vma(obj, vm);
 
 	if (!vma)
 		return 0;
@@ -615,7 +613,7 @@ static int clear_iova(struct drm_gem_object *obj,
  * Setting an iova of zero will clear the vma.
  */
 int msm_gem_set_iova(struct drm_gem_object *obj,
-		     struct msm_gem_vm *vm, uint64_t iova)
+		     struct drm_gpuvm *vm, uint64_t iova)
 {
 	struct drm_exec exec;
 	int ret = 0;
@@ -624,11 +622,11 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 	if (!iova) {
 		ret = clear_iova(obj, vm);
 	} else {
-		struct msm_gem_vma *vma;
+		struct drm_gpuva *vma;
 		vma = get_vma_locked(obj, vm, iova, iova + obj->size);
 		if (IS_ERR(vma)) {
 			ret = PTR_ERR(vma);
-		} else if (GEM_WARN_ON(vma->base.va.addr != iova)) {
+		} else if (GEM_WARN_ON(vma->va.addr != iova)) {
 			clear_iova(obj, vm);
 			ret = -EBUSY;
 		}
@@ -643,10 +641,9 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
  * purged until something else (shrinker, mm_notifier, destroy, etc) decides
  * to get rid of it
  */
-void msm_gem_unpin_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
+void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 {
-	struct msm_gem_vma *vma;
+	struct drm_gpuva *vma;
 	struct drm_exec exec;
 
 	msm_gem_lock_vm_and_obj(&exec, obj, vm);
@@ -1276,9 +1273,9 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
-		uint32_t flags, struct msm_gem_vm *vm,
-		struct drm_gem_object **bo, uint64_t *iova)
+void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t flags,
+			 struct drm_gpuvm *vm, struct drm_gem_object **bo,
+			 uint64_t *iova)
 {
 	void *vaddr;
 	struct drm_gem_object *obj = msm_gem_new(dev, size, flags);
@@ -1311,8 +1308,7 @@ void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
 
 }
 
-void msm_gem_kernel_put(struct drm_gem_object *bo,
-		struct msm_gem_vm *vm)
+void msm_gem_kernel_put(struct drm_gem_object *bo, struct drm_gpuvm *vm)
 {
 	if (IS_ERR_OR_NULL(bo))
 		return;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 33885a08cdd7..892e4132fa72 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -79,12 +79,7 @@ struct msm_gem_vm {
 };
 #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
-struct msm_gem_vm *
-msm_gem_vm_get(struct msm_gem_vm *vm);
-
-void msm_gem_vm_put(struct msm_gem_vm *vm);
-
-struct msm_gem_vm *
+struct drm_gpuvm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed);
 
@@ -113,12 +108,12 @@ struct msm_gem_vma {
 };
 #define to_msm_vma(x) container_of(x, struct msm_gem_vma, base)
 
-struct msm_gem_vma *
-msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+struct drm_gpuva *
+msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
-void msm_gem_vma_purge(struct msm_gem_vma *vma);
-int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
-void msm_gem_vma_close(struct msm_gem_vma *vma);
+void msm_gem_vma_purge(struct drm_gpuva *vma);
+int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt, int size);
+void msm_gem_vma_close(struct drm_gpuva *vma);
 
 struct msm_gem_object {
 	struct drm_gem_object base;
@@ -163,22 +158,21 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma);
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
-					   struct msm_gem_vm *vm);
-int msm_gem_get_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova);
-int msm_gem_set_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t iova);
+struct drm_gpuva *msm_gem_get_vma_locked(struct drm_gem_object *obj,
+					 struct drm_gpuvm *vm);
+int msm_gem_get_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		     uint64_t *iova);
+int msm_gem_set_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		     uint64_t iova);
 int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova,
-		u64 range_start, u64 range_end);
-int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm, uint64_t *iova);
-void msm_gem_unpin_iova(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm);
+				   struct drm_gpuvm *vm, uint64_t *iova,
+				   u64 range_start, u64 range_end);
+int msm_gem_get_and_pin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+			     uint64_t *iova);
+void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm);
 void msm_gem_pin_obj_locked(struct drm_gem_object *obj);
 struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj);
@@ -199,11 +193,10 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
 struct drm_gem_object *msm_gem_new(struct drm_device *dev,
 		uint32_t size, uint32_t flags);
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
-		uint32_t flags, struct msm_gem_vm *vm,
-		struct drm_gem_object **bo, uint64_t *iova);
-void msm_gem_kernel_put(struct drm_gem_object *bo,
-		struct msm_gem_vm *vm);
+void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t flags,
+			 struct drm_gpuvm *vm, struct drm_gem_object **bo,
+			 uint64_t *iova);
+void msm_gem_kernel_put(struct drm_gem_object *bo, struct drm_gpuvm *vm);
 struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 		struct dma_buf *dmabuf, struct sg_table *sgt);
 __printf(2, 3)
@@ -254,14 +247,14 @@ msm_gem_unlock(struct drm_gem_object *obj)
 static inline int
 msm_gem_lock_vm_and_obj(struct drm_exec *exec,
 			struct drm_gem_object *obj,
-			struct msm_gem_vm *vm)
+			struct drm_gpuvm *vm)
 {
 	int ret = 0;
 
 	drm_exec_init(exec, 0, 2);
 	drm_exec_until_all_locked (exec) {
-		ret = drm_exec_lock_obj(exec, drm_gpuvm_resv_obj(&vm->base));
-		if (!ret && (obj->resv != drm_gpuvm_resv(&vm->base)))
+		ret = drm_exec_lock_obj(exec, drm_gpuvm_resv_obj(vm));
+		if (!ret && (obj->resv != drm_gpuvm_resv(vm)))
 			ret = drm_exec_lock_obj(exec, obj);
 		drm_exec_retry_on_contention(exec);
 		if (GEM_WARN_ON(ret))
@@ -328,7 +321,7 @@ struct msm_gem_submit {
 	struct kref ref;
 	struct drm_device *dev;
 	struct msm_gpu *gpu;
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	struct list_head node;   /* node in ring submit list */
 	struct drm_exec exec;
 	uint32_t seqno;		/* Sequence number of the submit on the ring */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index bd8e465e8049..d8ff6aeb04ab 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -264,7 +264,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 
 	drm_exec_until_all_locked (&submit->exec) {
 		ret = drm_exec_lock_obj(&submit->exec,
-					drm_gpuvm_resv_obj(&submit->vm->base));
+					drm_gpuvm_resv_obj(submit->vm));
 		drm_exec_retry_on_contention(&submit->exec);
 		if (ret)
 			goto error;
@@ -315,7 +315,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
-		struct msm_gem_vma *vma;
+		struct drm_gpuva *vma;
 
 		/* if locking succeeded, pin bo: */
 		vma = msm_gem_get_vma_locked(obj, submit->vm);
@@ -328,8 +328,8 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		submit->bos[i].vm_bo = drm_gpuvm_bo_get(vma->base.vm_bo);
-		submit->bos[i].iova = vma->base.va.addr;
+		submit->bos[i].vm_bo = drm_gpuvm_bo_get(vma->vm_bo);
+		submit->bos[i].iova = vma->va.addr;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index ccb20897a2b0..df8eb910ca31 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -20,52 +20,38 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
-
-void msm_gem_vm_put(struct msm_gem_vm *vm)
-{
-	if (vm)
-		drm_gpuvm_put(&vm->base);
-}
-
-struct msm_gem_vm *
-msm_gem_vm_get(struct msm_gem_vm *vm)
-{
-	if (!IS_ERR_OR_NULL(vm))
-		drm_gpuvm_get(&vm->base);
-
-	return vm;
-}
-
 /* Actually unmap memory for the vma */
-void msm_gem_vma_purge(struct msm_gem_vma *vma)
+void msm_gem_vma_purge(struct drm_gpuva *vma)
 {
-	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
-	unsigned size = vma->base.va.range;
+	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
+	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
+	unsigned size = vma->va.range;
 
 	/* Don't do anything if the memory isn't mapped */
-	if (!vma->mapped)
+	if (!msm_vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->base.va.addr, size);
+	vm->mmu->funcs->unmap(vm->mmu, vma->va.addr, size);
 
-	vma->mapped = false;
+	msm_vma->mapped = false;
 }
 
 /* Map and pin vma: */
 int
-msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
+msm_gem_vma_map(struct drm_gpuva *vma, int prot,
 		struct sg_table *sgt, int size)
 {
-	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
+	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
+	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	int ret;
 
-	if (GEM_WARN_ON(!vma->base.va.addr))
+	if (GEM_WARN_ON(!vma->va.addr))
 		return -EINVAL;
 
-	if (vma->mapped)
+	if (msm_vma->mapped)
 		return 0;
 
-	vma->mapped = true;
+	msm_vma->mapped = true;
 
 	/*
 	 * NOTE: iommu/io-pgtable can allocate pages, so we cannot hold
@@ -76,38 +62,40 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->base.va.addr, sgt, size, prot);
+	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt, size, prot);
 
 	if (ret) {
-		vma->mapped = false;
+		msm_vma->mapped = false;
 	}
 
 	return ret;
 }
 
 /* Close an iova.  Warn if it is still in use */
-void msm_gem_vma_close(struct msm_gem_vma *vma)
+void msm_gem_vma_close(struct drm_gpuva *vma)
 {
-	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
+	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
+	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 
-	GEM_WARN_ON(vma->mapped);
+	GEM_WARN_ON(msm_vma->mapped);
 
 	drm_gpuvm_resv_assert_held(&vm->base);
 
-	if (vma->base.va.addr)
-		drm_mm_remove_node(&vma->node);
+	if (vma->va.addr && vm->managed)
+		drm_mm_remove_node(&msm_vma->node);
 
-	drm_gpuva_remove(&vma->base);
-	drm_gpuva_unlink(&vma->base);
+	drm_gpuva_remove(vma);
+	drm_gpuva_unlink(vma);
 
 	kfree(vma);
 }
 
 /* Create a new vma and allocate an iova for it */
-struct msm_gem_vma *
-msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+struct drm_gpuva *
+msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
 	struct drm_gpuvm_bo *vm_bo;
 	struct msm_gem_vma *vma;
 	int ret;
@@ -149,7 +137,7 @@ msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 	drm_gpuva_link(&vma->base, vm_bo);
 	GEM_WARN_ON(drm_gpuvm_bo_put(vm_bo));
 
-	return vma;
+	return &vma->base;
 
 err_va_remove:
 	drm_gpuva_remove(&vma->base);
@@ -179,7 +167,7 @@ static const struct drm_gpuvm_ops msm_gpuvm_ops = {
  * handles virtual address allocation, and both async and sync operations
  * are supported.
  */
-struct msm_gem_vm *
+struct drm_gpuvm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed)
 {
@@ -215,7 +203,7 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 	drm_mm_init(&vm->mm, va_start, va_size);
 
-	return vm;
+	return &vm->base;
 
 err_free_vm:
 	kfree(vm);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 47268aae7d54..fc4d6c9049b0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -285,7 +285,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 
 		if (state->fault_info.ttbr0) {
 			struct msm_gpu_fault_info *info = &state->fault_info;
-			struct msm_mmu *mmu = submit->vm->mmu;
+			struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
 
 			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
 						   &info->asid);
@@ -390,7 +390,7 @@ static void recover_worker(struct kthread_work *work)
 	/* Increment the fault counts */
 	submit->queue->faults++;
 	if (submit->vm)
-		submit->vm->faults++;
+		to_msm_vm(submit->vm)->faults++;
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
@@ -828,10 +828,11 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 }
 
 /* Return a new address space for a msm_drm_private instance */
-struct msm_gem_vm *
+struct drm_gpuvm *
 msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
 {
-	struct msm_gem_vm *vm = NULL;
+	struct drm_gpuvm *vm = NULL;
+
 	if (!gpu)
 		return NULL;
 
@@ -842,11 +843,11 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
 	if (gpu->funcs->create_private_vm) {
 		vm = gpu->funcs->create_private_vm(gpu);
 		if (!IS_ERR(vm))
-			vm->pid = get_pid(task_pid(task));
+			to_msm_vm(vm)->pid = get_pid(task_pid(task));
 	}
 
 	if (IS_ERR_OR_NULL(vm))
-		vm = msm_gem_vm_get(gpu->vm);
+		vm = drm_gpuvm_get(gpu->vm);
 
 	return vm;
 }
@@ -1014,8 +1015,9 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	if (!IS_ERR_OR_NULL(gpu->vm)) {
-		gpu->vm->mmu->funcs->detach(gpu->vm->mmu);
-		msm_gem_vm_put(gpu->vm);
+		struct msm_mmu *mmu = to_msm_vm(gpu->vm)->mmu;
+		mmu->funcs->detach(mmu);
+		drm_gpuvm_put(gpu->vm);
 	}
 
 	if (gpu->worker) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 9d69dcad6612..231577656fae 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -78,8 +78,8 @@ struct msm_gpu_funcs {
 	/* note: gpu_set_freq() can assume that we have been pm_resumed */
 	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 			     bool suspended);
-	struct msm_gem_vm *(*create_vm)(struct msm_gpu *gpu, struct platform_device *pdev);
-	struct msm_gem_vm *(*create_private_vm)(struct msm_gpu *gpu);
+	struct drm_gpuvm *(*create_vm)(struct msm_gpu *gpu, struct platform_device *pdev);
+	struct drm_gpuvm *(*create_private_vm)(struct msm_gpu *gpu);
 	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 
 	/**
@@ -234,7 +234,7 @@ struct msm_gpu {
 	void __iomem *mmio;
 	int irq;
 
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	/* Power Control: */
 	struct regulator *gpu_reg, *gpu_cx;
@@ -357,7 +357,7 @@ struct msm_context {
 	int queueid;
 
 	/** @vm: the per-process GPU address-space */
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	/** @kref: the reference count */
 	struct kref ref;
@@ -667,7 +667,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
 		const char *name, struct msm_gpu_config *config);
 
-struct msm_gem_vm *
+struct drm_gpuvm *
 msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task);
 
 void msm_gpu_cleanup(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 6458bd82a0cd..e82b8569a468 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -176,9 +176,9 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
 	return -ENOSYS;
 }
 
-struct msm_gem_vm *msm_kms_init_vm(struct drm_device *dev)
+struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 {
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
 	struct device *mdss_dev = mdp_dev->parent;
@@ -212,7 +212,7 @@ struct msm_gem_vm *msm_kms_init_vm(struct drm_device *dev)
 		return vm;
 	}
 
-	msm_mmu_set_fault_handler(vm->mmu, kms, msm_kms_fault_handler);
+	msm_mmu_set_fault_handler(to_msm_vm(vm)->mmu, kms, msm_kms_fault_handler);
 
 	return vm;
 }
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index f45996a03e15..7cdb2eb67700 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -139,7 +139,7 @@ struct msm_kms {
 	atomic_t fault_snapshot_capture;
 
 	/* mapper-id used to request GEM buffer mapped for scanout: */
-	struct msm_gem_vm *vm;
+	struct drm_gpuvm *vm;
 
 	/* disp snapshot support */
 	struct kthread_worker *dump_worker;
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 6298233c3568..8ced49c7557b 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -59,7 +59,7 @@ void __msm_context_destroy(struct kref *kref)
 		kfree(ctx->entities[i]);
 	}
 
-	msm_gem_vm_put(ctx->vm);
+	drm_gpuvm_put(ctx->vm);
 	kfree(ctx->comm);
 	kfree(ctx->cmdline);
 	kfree(ctx);
-- 
2.50.0

