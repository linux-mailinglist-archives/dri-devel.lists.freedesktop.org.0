Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D7CAED066
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E9C10E0DB;
	Sun, 29 Jun 2025 20:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uf5fFYwP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9A810E363
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:33 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TElW5q027858
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=HXWQlBzwRs/
 YFZcQ0J8q0tRYFCQz7L7Uc+xvyU8KUAI=; b=Uf5fFYwP5Dmmw3iddxncVjSSC1Z
 Nr7wE2zdf9aY5/rRkdQQB3NPDUUFxJfGky00pQPGKpFKl4vu89amaeIVACOIy0jr
 1meBlwrJiB67UqJRZKfQfxZ+BFIjLMhdwUT9GW0fimdMzmF1vxPSjoUu2mb4Grbf
 vhEBI0L8fcUURFGLi36WFWaUmh5t4meedHFe9zjIoRPmLHyRvYiS1ovhoH4MPrkN
 79C3aPuWUxbTvBGzs66fojan9N8jOAFzPaVVe4yv4WOQ5gPC134oV6MZ3eqD+hN5
 hZA2FXH7IER309J8oRuq3gmeFeJj32UqFpLHvY6LdhvsrblKAF1CZ0oohJw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95htk5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2354ba59eb6so23081625ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228192; x=1751832992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HXWQlBzwRs/YFZcQ0J8q0tRYFCQz7L7Uc+xvyU8KUAI=;
 b=C0C/IV07F9wMp8+V+PmE4HLdfxS52fzLZUgG1y892U3TubXg27m64xp4EUpbLDn8RE
 zxTX+5gEzbB/lOK4tOaA63uPFyLXCRO2sOokuh4NTtxlgolmcPv1xwHNeslvX0vvGu7f
 PJnhzrkp+Hb70FsilsqZeqWCIBQ/qwcXu1IAsptkg+hKqLA4ltToaKDtnKxc4wGgGtn9
 4neoNHjCL8G7rmcr9Oyx6SJW+deOybneXXmfuicFkTOYUBpRMouk2kqlVzjQAoMkmCgw
 Amw0opN/zupSHQXCNF6jfkx7qJJNVhWSXxedhK3b4h/2mNYi0ZLK74Zto/m95p1KhGK2
 kyqA==
X-Gm-Message-State: AOJu0YwtJjGR2dYBeiKt7iJ/QkDrYTYMWIdfRH/Sua8wwk6jh0olf32J
 6zYh99J/e8XrZYk4wnNq9yW/WNVcYtFtaCYBKyx5BBVmES7l9sjsrzEo8MfvowMOWOYt/QfN0rw
 U5CNY5faSSSipF2vQkmpGD6MNJesndw6VIHooexTGgDNH4P/M26Lz7Q/6eu3XCruJI/8CXbrl+f
 pBiHI=
X-Gm-Gg: ASbGncvX/8PH6dbX9L+atNDm1OUchfbx/GUTQ+vn+SPRfSNjOCUSvJopIX3gPa6w4MM
 dhJPlLm2CcbuCDp9UFZ3qKNcKDPRABfO1MjMCscHUfl9SyNZg7GRHXdVZcMpCklkHLQRlpfq+3E
 gLOJ+/cv6G4zzGjqcYd4eY0SV4bqnEMgn6NVEftzvUVAQ2eVytC07P0ILIG0cHV0jmL+aWWgAz+
 UDCC7tO+Vdqu4HaPS6/nJaBkUCf/uIzPaXBjcAibcecb213FCywtX75tMhuKaluJk67j0ABBDH3
 YcpLxt8h1TYwSmbImnt4Jft0ndLk0+3m+w==
X-Received: by 2002:a17:903:19ce:b0:236:6f5f:caa9 with SMTP id
 d9443c01a7336-23ac4605d7cmr169452765ad.32.1751228191585; 
 Sun, 29 Jun 2025 13:16:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsROYSe4iTpySAFDhw6m9Aja1N6L0BaBc7TfMBG5/pXaEY/kDJWB5Ms2WOp+IKMU2FMUpnuw==
X-Received: by 2002:a17:903:19ce:b0:236:6f5f:caa9 with SMTP id
 d9443c01a7336-23ac4605d7cmr169452335ad.32.1751228190875; 
 Sun, 29 Jun 2025 13:16:30 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3bc73csm63838875ad.193.2025.06.29.13.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:30 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 13/42] drm/msm: drm_gpuvm conversion
Date: Sun, 29 Jun 2025 13:12:56 -0700
Message-ID: <20250629201530.25775-14-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX2+K/jZoY2o3B
 hG0VobtmzyAMlJVKjRsKyPlQ3A+AF4oAqWd/hbo/nPKVtEbSsZYRGlCvHM0B6FH6aYi76nqBm+A
 HzGhgULk9a/OrzsFkBehWimCvX+h0mri42o0T7o+sMTGZ+nm4nx+GBnATiWymX9pklwf1Jtmfuo
 O2CVdJ4n7na7A1g0pbwi31TbYw2Y4DP2m6B3Jzwdknk54O9dn5UQpxM6WSf+PnJ5qaFIj2kNss3
 60MsRmsDsDxW32+Lkm+xRDRccYYEh2JjO7dQF3SU3o8bx6C1RPCVy629Jn4BAki6QTIq8dsnqUb
 fbzxKNtBHpAnzSTPpBqmN4g/T2ksvN9H6a8HMJg44AMWN6BaRHIR2kCNWNE4nbejt9YnsKIeJpI
 OPKoORHi3Q4oTU110ebX7JBxf8X+m7SiR5xHsp+9v29CW2mSqRwa0pFjdeqpdqwxZp0ue67A
X-Proofpoint-ORIG-GUID: cy-3X_27EDfwxT0zR3JJcI_w5uYulj_j
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68619f21 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=DWwiU9S3deBeNsXQ0cYA:9
 a=hD0YvAvVATwCeCSz:21 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: cy-3X_27EDfwxT0zR3JJcI_w5uYulj_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290171
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

Now that we've realigned deletion and allocation, switch over to using
drm_gpuvm/drm_gpuva.  This allows us to support multiple VMAs per BO per
VM, to allow mapping different parts of a single BO at different virtual
addresses, which is a key requirement for sparse/VM_BIND.

This prepares us for using drm_gpuvm to translate a batch of MAP/
MAP_NULL/UNMAP operations from userspace into a sequence of map/remap/
unmap steps for updating the page tables.

Since, unlike our prior vm/vma setup, with drm_gpuvm the vm_bo holds a
reference to the GEM object.  To prevent reference loops causing us to
leak all GEM objects, we implicitly tear down the mapping when the GEM
handle is close or when the obj is unpinned.  Which means the submit
needs to also hold a reference to the vm_bo, to prevent the VMA from
being torn down while the submit is in-flight.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/Kconfig              |   1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c    |   3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  |   7 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |   5 +-
 drivers/gpu/drm/msm/msm_drv.c            |   1 +
 drivers/gpu/drm/msm/msm_gem.c            | 166 +++++++++++++++--------
 drivers/gpu/drm/msm/msm_gem.h            |  90 +++++++++---
 drivers/gpu/drm/msm/msm_gem_submit.c     |   7 +-
 drivers/gpu/drm/msm/msm_gem_vma.c        | 140 +++++++++++++------
 drivers/gpu/drm/msm/msm_kms.c            |   4 +-
 12 files changed, 300 insertions(+), 135 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 7f127e2ae442..1523bc3e9540 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -21,6 +21,7 @@ config DRM_MSM
 	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
+	select DRM_GPUVM
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_BRIDGE
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 095bae92e3e8..889480aa13ba 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -472,8 +472,7 @@ a2xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 	struct msm_mmu *mmu = a2xx_gpummu_new(&pdev->dev, gpu);
 	struct msm_gem_vm *vm;
 
-	vm = msm_gem_vm_create(mmu, "gpu", SZ_16M,
-		0xfff * SZ_64K);
+	vm = msm_gem_vm_create(gpu->dev, mmu, "gpu", SZ_16M, 0xfff * SZ_64K, true);
 
 	if (IS_ERR(vm) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 848acc382b7d..77d9ff9632d1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1311,7 +1311,7 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
 	return 0;
 }
 
-static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
+static int a6xx_gmu_memory_probe(struct drm_device *drm, struct a6xx_gmu *gmu)
 {
 	struct msm_mmu *mmu;
 
@@ -1321,7 +1321,7 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 	if (IS_ERR(mmu))
 		return PTR_ERR(mmu);
 
-	gmu->vm = msm_gem_vm_create(mmu, "gmu", 0x0, 0x80000000);
+	gmu->vm = msm_gem_vm_create(drm, mmu, "gmu", 0x0, 0x80000000, true);
 	if (IS_ERR(gmu->vm))
 		return PTR_ERR(gmu->vm);
 
@@ -1940,7 +1940,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_put_device;
 
-	ret = a6xx_gmu_memory_probe(gmu);
+	ret = a6xx_gmu_memory_probe(adreno_gpu->base.dev, gmu);
 	if (ret)
 		goto err_put_device;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7b3be2b46cc4..262129cb4415 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2284,9 +2284,8 @@ a6xx_create_private_vm(struct msm_gpu *gpu)
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
-	return msm_gem_vm_create(mmu,
-		"gpu", ADRENO_VM_START,
-		adreno_private_vm_size(gpu));
+	return msm_gem_vm_create(gpu->dev, mmu, "gpu", ADRENO_VM_START,
+				 adreno_private_vm_size(gpu), true);
 }
 
 static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0f71c39696a5..46199a6d0e41 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -226,7 +226,8 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	start = max_t(u64, SZ_16M, geometry->aperture_start);
 	size = geometry->aperture_end - start + 1;
 
-	vm = msm_gem_vm_create(mmu, "gpu", start & GENMASK_ULL(48, 0), size);
+	vm = msm_gem_vm_create(gpu->dev, mmu, "gpu", start & GENMASK_ULL(48, 0),
+			       size, true);
 
 	if (IS_ERR(vm) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
@@ -414,12 +415,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_VA_START:
 		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->va_start;
+		*value = ctx->vm->base.mm_start;
 		return 0;
 	case MSM_PARAM_VA_SIZE:
 		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->va_size;
+		*value = ctx->vm->base.mm_range;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
 		*value = adreno_gpu->ubwc_config.highest_bank_bit;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 5cb4a4bae2a6..a867c684c6d6 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -469,8 +469,9 @@ static int mdp4_kms_init(struct drm_device *dev)
 				"contig buffers for scanout\n");
 		vm = NULL;
 	} else {
-		vm  = msm_gem_vm_create(mmu,
-			"mdp4", 0x1000, 0x100000000 - 0x1000);
+		vm  = msm_gem_vm_create(dev, mmu, "mdp4",
+					0x1000, 0x100000000 - 0x1000,
+					true);
 
 		if (IS_ERR(vm)) {
 			if (!IS_ERR(mmu))
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c314fd470d69..488fdf02aee9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -780,6 +780,7 @@ static const struct file_operations fops = {
 
 static const struct drm_driver msm_driver = {
 	.driver_features    = DRIVER_GEM |
+				DRIVER_GEM_GPUVA |
 				DRIVER_RENDER |
 				DRIVER_ATOMIC |
 				DRIVER_MODESET |
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index a20ae783f244..664fb801c221 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -43,9 +43,53 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 	return 0;
 }
 
+static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close);
+
+static void detach_vm(struct drm_gem_object *obj, struct msm_gem_vm *vm)
+{
+	msm_gem_assert_locked(obj);
+
+	struct drm_gpuvm_bo *vm_bo = drm_gpuvm_bo_find(&vm->base, obj);
+	if (vm_bo) {
+		struct drm_gpuva *vma;
+
+		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
+			if (vma->vm != &vm->base)
+				continue;
+			msm_gem_vma_purge(to_msm_vma(vma));
+			msm_gem_vma_close(to_msm_vma(vma));
+			break;
+		}
+
+		drm_gpuvm_bo_put(vm_bo);
+	}
+}
+
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
+	struct msm_context *ctx = file->driver_priv;
+
 	update_ctx_mem(file, -obj->size);
+
+	/*
+	 * If VM isn't created yet, nothing to cleanup.  And in fact calling
+	 * put_iova_spaces() with vm=NULL would be bad, in that it will tear-
+	 * down the mappings of shared buffers in other contexts.
+	 */
+	if (!ctx->vm)
+		return;
+
+	/*
+	 * TODO we might need to kick this to a queue to avoid blocking
+	 * in CLOSE ioctl
+	 */
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
+			      msecs_to_jiffies(1000));
+
+	msm_gem_lock(obj);
+	put_iova_spaces(obj, &ctx->vm->base, true);
+	detach_vm(obj, ctx->vm);
+	msm_gem_unlock(obj);
 }
 
 /*
@@ -167,6 +211,13 @@ static void put_pages(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
+	/*
+	 * Skip gpuvm in the object free path to avoid a WARN_ON() splat.
+	 * See explaination in msm_gem_assert_locked()
+	 */
+	if (kref_read(&obj->refcount))
+		drm_gpuvm_bo_gem_evict(obj, true);
+
 	if (msm_obj->pages) {
 		if (msm_obj->sgt) {
 			/* For non-cached buffers, ensure the new
@@ -334,16 +385,25 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 }
 
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
+				      struct msm_gem_vm *vm)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
+	struct drm_gpuvm_bo *vm_bo;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry(vma, &msm_obj->vmas, list) {
-		if (vma->vm == vm)
-			return vma;
+	drm_gem_for_each_gpuvm_bo (vm_bo, obj) {
+		struct drm_gpuva *vma;
+
+		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
+			if (vma->vm == &vm->base) {
+				/* lookup_vma() should only be used in paths
+				 * with at most one vma per vm
+				 */
+				GEM_WARN_ON(!list_is_singular(&vm_bo->list.gpuva));
+
+				return to_msm_vma(vma);
+			}
+		}
 	}
 
 	return NULL;
@@ -356,33 +416,29 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
  * mapping.
  */
 static void
-put_iova_spaces(struct drm_gem_object *obj, bool close)
+put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma, *tmp;
+	struct drm_gpuvm_bo *vm_bo, *tmp;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		if (vma->vm) {
-			msm_gem_vma_purge(vma);
-			if (close)
-				msm_gem_vma_close(vma);
-		}
-	}
-}
+	drm_gem_for_each_gpuvm_bo_safe (vm_bo, tmp, obj) {
+		struct drm_gpuva *vma, *vmatmp;
 
-/* Called with msm_obj locked */
-static void
-put_iova_vmas(struct drm_gem_object *obj)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma, *tmp;
+		if (vm && vm_bo->vm != vm)
+			continue;
 
-	msm_gem_assert_locked(obj);
+		drm_gpuvm_bo_get(vm_bo);
+
+		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
+			struct msm_gem_vma *msm_vma = to_msm_vma(vma);
+
+			msm_gem_vma_purge(msm_vma);
+			if (close)
+				msm_gem_vma_close(msm_vma);
+		}
 
-	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		msm_gem_vma_close(vma);
+		drm_gpuvm_bo_put(vm_bo);
 	}
 }
 
@@ -390,7 +446,6 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -399,12 +454,9 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 
 	if (!vma) {
 		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
-		if (IS_ERR(vma))
-			return vma;
-		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
-		GEM_WARN_ON(vma->iova < range_start);
-		GEM_WARN_ON((vma->iova + obj->size) > range_end);
+		GEM_WARN_ON(vma->base.va.addr < range_start);
+		GEM_WARN_ON((vma->base.va.addr + obj->size) > range_end);
 	}
 
 	return vma;
@@ -484,7 +536,7 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	ret = msm_gem_pin_vma_locked(obj, vma);
 	if (!ret) {
-		*iova = vma->iova;
+		*iova = vma->base.va.addr;
 		pin_obj_locked(obj);
 	}
 
@@ -530,7 +582,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 	} else {
-		*iova = vma->iova;
+		*iova = vma->base.va.addr;
 	}
 	msm_gem_unlock(obj);
 
@@ -571,7 +623,7 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 		vma = get_vma_locked(obj, vm, iova, iova + obj->size);
 		if (IS_ERR(vma)) {
 			ret = PTR_ERR(vma);
-		} else if (GEM_WARN_ON(vma->iova != iova)) {
+		} else if (GEM_WARN_ON(vma->base.va.addr != iova)) {
 			clear_iova(obj, vm);
 			ret = -EBUSY;
 		}
@@ -593,9 +645,10 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj,
 
 	msm_gem_lock(obj);
 	vma = lookup_vma(obj, vm);
-	if (!GEM_WARN_ON(!vma)) {
+	if (vma) {
 		msm_gem_unpin_locked(obj);
 	}
+	detach_vm(obj, vm);
 	msm_gem_unlock(obj);
 }
 
@@ -755,7 +808,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, false);
+	put_iova_spaces(obj, NULL, false);
 
 	msm_gem_vunmap(obj);
 
@@ -763,8 +816,6 @@ void msm_gem_purge(struct drm_gem_object *obj)
 
 	put_pages(obj);
 
-	put_iova_vmas(obj);
-
 	mutex_lock(&priv->lru.lock);
 	/* A one-way transition: */
 	msm_obj->madv = __MSM_MADV_PURGED;
@@ -795,7 +846,7 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	GEM_WARN_ON(is_unevictable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, false);
+	put_iova_spaces(obj, NULL, false);
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
@@ -861,7 +912,6 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
@@ -904,14 +954,17 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 
 	seq_printf(m, " %08zu %9s %-32s\n", obj->size, madv, msm_obj->name);
 
-	if (!list_empty(&msm_obj->vmas)) {
+	if (!list_empty(&obj->gpuva.list)) {
+		struct drm_gpuvm_bo *vm_bo;
 
 		seq_puts(m, "      vmas:");
 
-		list_for_each_entry(vma, &msm_obj->vmas, list) {
-			const char *name, *comm;
-			if (vma->vm) {
-				struct msm_gem_vm *vm = vma->vm;
+		drm_gem_for_each_gpuvm_bo (vm_bo, obj) {
+			struct drm_gpuva *vma;
+
+			drm_gpuvm_bo_for_each_va (vma, vm_bo) {
+				const char *name, *comm;
+				struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 				struct task_struct *task =
 					get_pid_task(vm->pid, PIDTYPE_PID);
 				if (task) {
@@ -920,15 +973,14 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 				} else {
 					comm = NULL;
 				}
-				name = vm->name;
-			} else {
-				name = comm = NULL;
+				name = vm->base.name;
+
+				seq_printf(m, " [%s%s%s: vm=%p, %08llx, %smapped]",
+					   name, comm ? ":" : "", comm ? comm : "",
+					   vma->vm, vma->va.addr,
+					   to_msm_vma(vma)->mapped ? "" : "un");
+				kfree(comm);
 			}
-			seq_printf(m, " [%s%s%s: vm=%p, %08llx,%s]",
-				name, comm ? ":" : "", comm ? comm : "",
-				vma->vm, vma->iova,
-				vma->mapped ? "mapped" : "unmapped");
-			kfree(comm);
 		}
 
 		seq_puts(m, "\n");
@@ -974,7 +1026,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 	list_del(&msm_obj->node);
 	mutex_unlock(&priv->obj_lock);
 
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, NULL, true);
 
 	if (drm_gem_is_imported(obj)) {
 		GEM_WARN_ON(msm_obj->vaddr);
@@ -984,13 +1036,10 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		 */
 		kvfree(msm_obj->pages);
 
-		put_iova_vmas(obj);
-
 		drm_prime_gem_destroy(obj, msm_obj->sgt);
 	} else {
 		msm_gem_vunmap(obj);
 		put_pages(obj);
-		put_iova_vmas(obj);
 	}
 
 	drm_gem_object_release(obj);
@@ -1096,7 +1145,6 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	msm_obj->madv = MSM_MADV_WILLNEED;
 
 	INIT_LIST_HEAD(&msm_obj->node);
-	INIT_LIST_HEAD(&msm_obj->vmas);
 
 	*obj = &msm_obj->base;
 	(*obj)->funcs = &msm_gem_object_funcs;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index cf1e86252219..4112370baf34 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -10,6 +10,7 @@
 #include <linux/kref.h>
 #include <linux/dma-resv.h>
 #include "drm/drm_exec.h"
+#include "drm/drm_gpuvm.h"
 #include "drm/gpu_scheduler.h"
 #include "msm_drv.h"
 
@@ -22,30 +23,67 @@
 #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
 #define MSM_BO_MAP_PRIV      0x20000000    /* use IOMMU_PRIV when mapping */
 
+/**
+ * struct msm_gem_vm - VM object
+ *
+ * A VM object representing a GPU (or display or GMU or ...) virtual address
+ * space.
+ *
+ * In the case of GPU, if per-process address spaces are supported, the address
+ * space is split into two VMs, which map to TTBR0 and TTBR1 in the SMMU.  TTBR0
+ * is used for userspace objects, and is unique per msm_context/drm_file, while
+ * TTBR1 is the same for all processes.  (The kernel controlled ringbuffer and
+ * a few other kernel controlled buffers live in TTBR1.)
+ *
+ * The GPU TTBR0 vm can be managed by userspace or by the kernel, depending on
+ * whether userspace supports VM_BIND.  All other vm's are managed by the kernel.
+ * (Managed by kernel means the kernel is responsible for VA allocation.)
+ *
+ * Note that because VM_BIND allows a given BO to be mapped multiple times in
+ * a VM, and therefore have multiple VMA's in a VM, there is an extra object
+ * provided by drm_gpuvm infrastructure.. the drm_gpuvm_bo, which is not
+ * embedded in any larger driver structure.  The GEM object holds a list of
+ * drm_gpuvm_bo, which in turn holds a list of msm_gem_vma.  A linked vma
+ * holds a reference to the vm_bo, and drops it when the vma is unlinked.
+ * So we just need to call drm_gpuvm_bo_obtain() to return a ref to an
+ * existing vm_bo, or create a new one.  Once the vma is linked, the ref
+ * to the vm_bo can be dropped (since the vma is holding one).
+ */
 struct msm_gem_vm {
-	const char *name;
-	/* NOTE: mm managed at the page level, size is in # of pages
-	 * and position mm_node->start is in # of pages:
+	/** @base: Inherit from drm_gpuvm. */
+	struct drm_gpuvm base;
+
+	/**
+	 * @mm: Memory management for kernel managed VA allocations
+	 *
+	 * Only used for kernel managed VMs, unused for user managed VMs.
+	 *
+	 * Protected by @mm_lock.
 	 */
 	struct drm_mm mm;
-	spinlock_t lock; /* Protects drm_mm node allocation/removal */
+
+	/** @mm_lock: protects @mm node allocation/removal */
+	struct spinlock mm_lock;
+
+	/** @vm_lock: protects gpuvm insert/remove/traverse */
+	struct mutex vm_lock;
+
+	/** @mmu: The mmu object which manages the pgtables */
 	struct msm_mmu *mmu;
-	struct kref kref;
 
-	/* For address spaces associated with a specific process, this
+	/**
+	 * @pid: For address spaces associated with a specific process, this
 	 * will be non-NULL:
 	 */
 	struct pid *pid;
 
-	/* @faults: the number of GPU hangs associated with this address space */
+	/** @faults: the number of GPU hangs associated with this address space */
 	int faults;
 
-	/** @va_start: lowest possible address to allocate */
-	uint64_t va_start;
-
-	/** @va_size: the size of the address space (in bytes) */
-	uint64_t va_size;
+	/** @managed: is this a kernel managed VM? */
+	bool managed;
 };
+#define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
 struct msm_gem_vm *
 msm_gem_vm_get(struct msm_gem_vm *vm);
@@ -53,18 +91,33 @@ msm_gem_vm_get(struct msm_gem_vm *vm);
 void msm_gem_vm_put(struct msm_gem_vm *vm);
 
 struct msm_gem_vm *
-msm_gem_vm_create(struct msm_mmu *mmu, const char *name,
-		u64 va_start, u64 size);
+msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
+		  u64 va_start, u64 va_size, bool managed);
 
 struct msm_fence_context;
 
+#define MSM_VMA_DUMP (DRM_GPUVA_USERBITS << 0)
+
+/**
+ * struct msm_gem_vma - a VMA mapping
+ *
+ * Represents a combination of a GEM object plus a VM.
+ */
 struct msm_gem_vma {
+	/** @base: inherit from drm_gpuva */
+	struct drm_gpuva base;
+
+	/**
+	 * @node: mm node for VA allocation
+	 *
+	 * Only used by kernel managed VMs
+	 */
 	struct drm_mm_node node;
-	uint64_t iova;
-	struct msm_gem_vm *vm;
-	struct list_head list;    /* node in msm_gem_object::vmas */
+
+	/** @mapped: Is this VMA mapped? */
 	bool mapped;
 };
+#define to_msm_vma(x) container_of(x, struct msm_gem_vma, base)
 
 struct msm_gem_vma *
 msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
@@ -100,8 +153,6 @@ struct msm_gem_object {
 	struct sg_table *sgt;
 	void *vaddr;
 
-	struct list_head vmas;    /* list of msm_gem_vma */
-
 	char name[32]; /* Identifier to print for the debugfs files */
 
 	/* userspace metadata backchannel */
@@ -292,6 +343,7 @@ struct msm_gem_submit {
 			struct drm_gem_object *obj;
 			uint32_t handle;
 		};
+		struct drm_gpuvm_bo *vm_bo;
 		uint64_t iova;
 	} bos[];
 };
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index c184b1a1f522..2de5a07392eb 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -321,7 +321,8 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		submit->bos[i].iova = vma->iova;
+		submit->bos[i].vm_bo = drm_gpuvm_bo_get(vma->base.vm_bo);
+		submit->bos[i].iova = vma->base.va.addr;
 	}
 
 	/*
@@ -474,7 +475,11 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
+		struct drm_gpuvm_bo *vm_bo = submit->bos[i].vm_bo;
 
+		msm_gem_lock(obj);
+		drm_gpuvm_bo_put(vm_bo);
+		msm_gem_unlock(obj);
 		drm_gem_object_put(obj);
 	}
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index ca29e81d79d2..1f4c9b5c2e8f 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -5,14 +5,13 @@
  */
 
 #include "msm_drv.h"
-#include "msm_fence.h"
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
 static void
-msm_gem_vm_destroy(struct kref *kref)
+msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
-	struct msm_gem_vm *vm = container_of(kref, struct msm_gem_vm, kref);
+	struct msm_gem_vm *vm = container_of(gpuvm, struct msm_gem_vm, base);
 
 	drm_mm_takedown(&vm->mm);
 	if (vm->mmu)
@@ -25,14 +24,14 @@ msm_gem_vm_destroy(struct kref *kref)
 void msm_gem_vm_put(struct msm_gem_vm *vm)
 {
 	if (vm)
-		kref_put(&vm->kref, msm_gem_vm_destroy);
+		drm_gpuvm_put(&vm->base);
 }
 
 struct msm_gem_vm *
 msm_gem_vm_get(struct msm_gem_vm *vm)
 {
 	if (!IS_ERR_OR_NULL(vm))
-		kref_get(&vm->kref);
+		drm_gpuvm_get(&vm->base);
 
 	return vm;
 }
@@ -40,14 +39,14 @@ msm_gem_vm_get(struct msm_gem_vm *vm)
 /* Actually unmap memory for the vma */
 void msm_gem_vma_purge(struct msm_gem_vma *vma)
 {
-	struct msm_gem_vm *vm = vma->vm;
-	unsigned size = vma->node.size;
+	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
+	unsigned size = vma->base.va.range;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->iova, size);
+	vm->mmu->funcs->unmap(vm->mmu, vma->base.va.addr, size);
 
 	vma->mapped = false;
 }
@@ -57,10 +56,10 @@ int
 msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 		struct sg_table *sgt, int size)
 {
-	struct msm_gem_vm *vm = vma->vm;
+	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
 	int ret;
 
-	if (GEM_WARN_ON(!vma->iova))
+	if (GEM_WARN_ON(!vma->base.va.addr))
 		return -EINVAL;
 
 	if (vma->mapped)
@@ -68,9 +67,6 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 
 	vma->mapped = true;
 
-	if (!vm)
-		return 0;
-
 	/*
 	 * NOTE: iommu/io-pgtable can allocate pages, so we cannot hold
 	 * a lock across map/unmap which is also used in the job_run()
@@ -80,7 +76,7 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->iova, sgt, size, prot);
+	ret = vm->mmu->funcs->map(vm->mmu, vma->base.va.addr, sgt, size, prot);
 
 	if (ret) {
 		vma->mapped = false;
@@ -92,19 +88,20 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 /* Close an iova.  Warn if it is still in use */
 void msm_gem_vma_close(struct msm_gem_vma *vma)
 {
-	struct msm_gem_vm *vm = vma->vm;
+	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
 
 	GEM_WARN_ON(vma->mapped);
 
-	spin_lock(&vm->lock);
-	if (vma->iova)
+	spin_lock(&vm->mm_lock);
+	if (vma->base.va.addr)
 		drm_mm_remove_node(&vma->node);
-	spin_unlock(&vm->lock);
+	spin_unlock(&vm->mm_lock);
 
-	vma->iova = 0;
-	list_del(&vma->list);
+	mutex_lock(&vm->vm_lock);
+	drm_gpuva_remove(&vma->base);
+	drm_gpuva_unlink(&vma->base);
+	mutex_unlock(&vm->vm_lock);
 
-	msm_gem_vm_put(vm);
 	kfree(vma);
 }
 
@@ -113,6 +110,7 @@ struct msm_gem_vma *
 msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end)
 {
+	struct drm_gpuvm_bo *vm_bo;
 	struct msm_gem_vma *vma;
 	int ret;
 
@@ -120,36 +118,83 @@ msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 	if (!vma)
 		return ERR_PTR(-ENOMEM);
 
-	vma->vm = vm;
+	if (vm->managed) {
+		spin_lock(&vm->mm_lock);
+		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
+						obj->size, PAGE_SIZE, 0,
+						range_start, range_end, 0);
+		spin_unlock(&vm->mm_lock);
 
-	spin_lock(&vm->lock);
-	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  obj->size, PAGE_SIZE, 0,
-					  range_start, range_end, 0);
-	spin_unlock(&vm->lock);
+		if (ret)
+			goto err_free_vma;
 
-	if (ret)
-		goto err_free_vma;
+		range_start = vma->node.start;
+		range_end   = range_start + obj->size;
+	}
 
-	vma->iova = vma->node.start;
+	GEM_WARN_ON((range_end - range_start) > obj->size);
+
+	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, 0);
 	vma->mapped = false;
 
-	INIT_LIST_HEAD(&vma->list);
+	mutex_lock(&vm->vm_lock);
+	ret = drm_gpuva_insert(&vm->base, &vma->base);
+	mutex_unlock(&vm->vm_lock);
+	if (ret)
+		goto err_free_range;
 
-	kref_get(&vm->kref);
+	vm_bo = drm_gpuvm_bo_obtain(&vm->base, obj);
+	if (IS_ERR(vm_bo)) {
+		ret = PTR_ERR(vm_bo);
+		goto err_va_remove;
+	}
+
+	mutex_lock(&vm->vm_lock);
+	drm_gpuvm_bo_extobj_add(vm_bo);
+	drm_gpuva_link(&vma->base, vm_bo);
+	mutex_unlock(&vm->vm_lock);
+	GEM_WARN_ON(drm_gpuvm_bo_put(vm_bo));
 
 	return vma;
 
+err_va_remove:
+	mutex_lock(&vm->vm_lock);
+	drm_gpuva_remove(&vma->base);
+	mutex_unlock(&vm->vm_lock);
+err_free_range:
+	if (vm->managed)
+		drm_mm_remove_node(&vma->node);
 err_free_vma:
 	kfree(vma);
 	return ERR_PTR(ret);
 }
 
+static const struct drm_gpuvm_ops msm_gpuvm_ops = {
+	.vm_free = msm_gem_vm_free,
+};
+
+/**
+ * msm_gem_vm_create() - Create and initialize a &msm_gem_vm
+ * @drm: the drm device
+ * @mmu: the backing MMU objects handling mapping/unmapping
+ * @name: the name of the VM
+ * @va_start: the start offset of the VA space
+ * @va_size: the size of the VA space
+ * @managed: is it a kernel managed VM?
+ *
+ * In a kernel managed VM, the kernel handles address allocation, and only
+ * synchronous operations are supported.  In a user managed VM, userspace
+ * handles virtual address allocation, and both async and sync operations
+ * are supported.
+ */
 struct msm_gem_vm *
-msm_gem_vm_create(struct msm_mmu *mmu, const char *name,
-		u64 va_start, u64 size)
+msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
+		  u64 va_start, u64 va_size, bool managed)
 {
+	enum drm_gpuvm_flags flags = 0;
 	struct msm_gem_vm *vm;
+	struct drm_gem_object *dummy_gem;
+	int ret = 0;
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
@@ -158,15 +203,28 @@ msm_gem_vm_create(struct msm_mmu *mmu, const char *name,
 	if (!vm)
 		return ERR_PTR(-ENOMEM);
 
-	spin_lock_init(&vm->lock);
-	vm->name = name;
-	vm->mmu = mmu;
-	vm->va_start = va_start;
-	vm->va_size  = size;
+	dummy_gem = drm_gpuvm_resv_object_alloc(drm);
+	if (!dummy_gem) {
+		ret = -ENOMEM;
+		goto err_free_vm;
+	}
+
+	drm_gpuvm_init(&vm->base, name, flags, drm, dummy_gem,
+		       va_start, va_size, 0, 0, &msm_gpuvm_ops);
+	drm_gem_object_put(dummy_gem);
+
+	spin_lock_init(&vm->mm_lock);
+	mutex_init(&vm->vm_lock);
 
-	drm_mm_init(&vm->mm, va_start, size);
+	vm->mmu = mmu;
+	vm->managed = managed;
 
-	kref_init(&vm->kref);
+	drm_mm_init(&vm->mm, va_start, va_size);
 
 	return vm;
+
+err_free_vm:
+	kfree(vm);
+	return ERR_PTR(ret);
+
 }
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 88504c4b842f..6458bd82a0cd 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -204,8 +204,8 @@ struct msm_gem_vm *msm_kms_init_vm(struct drm_device *dev)
 		return NULL;
 	}
 
-	vm = msm_gem_vm_create(mmu, "mdp_kms",
-		0x1000, 0x100000000 - 0x1000);
+	vm = msm_gem_vm_create(dev, mmu, "mdp_kms",
+			       0x1000, 0x100000000 - 0x1000, true);
 	if (IS_ERR(vm)) {
 		dev_err(mdp_dev, "vm create, error %pe\n", vm);
 		mmu->funcs->destroy(mmu);
-- 
2.50.0

