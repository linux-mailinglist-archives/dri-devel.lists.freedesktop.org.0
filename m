Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E5BAB8BD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A76910E4F3;
	Tue, 30 Sep 2025 05:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zq+mJ7fU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4359010E4FA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:23 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HRIO024086
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H8lp2OHddhtl0zE/19uIgRSyTDP3QDdvZAocP+hfE2U=; b=Zq+mJ7fUE/6XvIvM
 BGDtTPavCz6JLTygqGyA1W+vNfhszrAYH3avAgwK/vUGDna8aPKsXNXoVrRkkDdp
 HRVYdDkNsEMwBS63Xedh6OUSm2fBcSvX18meF4T3kFjDM/PSowAECheU/qPZeOji
 W4hNnyDGm7oEOIFqjQzcB+fhTuSvg6umakZqub8259sjQUMFZeVsf654Zdu73APl
 ZYhhqVOr5UiNlGIr3pwPlExZM+R6+woB2ZHI/pO0JyfWH70AgVJndpDOa0HUA7Sv
 2GVlzaIacD3nysGBtbF09dUguFidf5FNy10LH99U39PVv8J7lL+WDSMlNXrzkyg0
 VEXtEw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n052q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32ea7fcddd8so11101398a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 22:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211480; x=1759816280;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H8lp2OHddhtl0zE/19uIgRSyTDP3QDdvZAocP+hfE2U=;
 b=HprZYl3KKwZp1EFOqNLerRt/alYHhPfxgcgQj2NElBeUXoWu5+slHfgH6/Q1e94nKy
 pxd60PaA5GeKkDYS0oryRYeBl5FQ68wcKmyPL+zrPLZlcWcj+hzEzPXLfcerTZV3h7XH
 gjxZmLt53KAtX8ecqOtQf6DUeeohl6izaeRHS5iX9D8+IgEmefncREUmiEpiFZv23xnr
 kZ39Z8xJu05Vd6wAmFxHXjNloTfoXDYEbNNL5+OxhbWrN1HqmicbF8UiuRAmileXH6Wa
 neQheELK+R1SCybhLWak6sKyPIlAvI2bVQ263N9qaZbmssqGNOQoN6w0n3AJqUfkJyTP
 rolA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaxTq5SJk0ElsZAXbh8udmskPr85n0VQ1SuO7mNiE0vSR2mLh+v+pXlJf9E4UUf4d0B2oJJgJzkOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoQTomwu1OV82rrtMroyWOphBHAR7cHYXGk1ojjFP/3q9Pn1L8
 L9t3j1hPAtmv2IYS5T135TA6BIPifGyVXcQtw7AwQfMAHzapcQ2MEj+138yeO1r8pJomMmLCIUS
 g6AWkoPU5kLFjTqx6eMlRgrGeFF6yImF9/rnx57L+laNXiVqe1igiqTV3odAleD+YMwRPL50=
X-Gm-Gg: ASbGncvs96kqrMMxFq/9L8Hxl4MJOUG/0FRWgkBsATrSqJAUBYZH+ystD7o91MdsOcY
 c3UcQPFT5bJiVNQeyl+lZPkkZLMn9tSbjdJ1bqX9ASabmGGs7fCTuawyT6f9rzeTGIjKVUU/MDz
 8Ass7mm6xg8P8wbvcuW+PjiQiYpnUoOroo637IAz3W2bf1FcItUMHLpubhGOA7wN9QGE8Yw25X4
 tMYI/VbOE/cH6fF+vqbTLNkVN876WyOyr7Ok1BhSrUDXlIGw2vUzj8RxH5NvDvz7h8fmnjMGxCa
 bxYQeUptrpdE1gCini/+P8BxzHTra8koELUpnENyeXO30biGOzuGk3jcmDrrTMQQHbQMTg==
X-Received: by 2002:a17:90b:1e10:b0:32e:3f93:69da with SMTP id
 98e67ed59e1d1-3342df5139emr20945131a91.6.1759211479650; 
 Mon, 29 Sep 2025 22:51:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP3MNLRtucLM/To8OGiQpGOokdZ8KbxYSk56FPl8RvLPYpS27i3WLRY67I04I1dUfRb4brBw==
X-Received: by 2002:a17:90b:1e10:b0:32e:3f93:69da with SMTP id
 98e67ed59e1d1-3342df5139emr20945079a91.6.1759211478771; 
 Mon, 29 Sep 2025 22:51:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:51:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:17 +0530
Subject: [PATCH 12/17] drm/msm/adreno: Introduce A8x GPU Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=55203;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ocpDezfYMIJdUpEGsKt5TGOd2RY0JLg/HkFTWAEY7VI=;
 b=mG1Ninbp5UBZZDs3H0eT+Sx/3dKI1R75UBTVxaYJDPG+zf/XcEr62JjrrqbPVUN25B9KfoV4h
 eQqWKjTfL55BpOVNOj3JI5rz38JfXl/3jDgr3A+hkgK6hnMiqrkB4oL
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: HSZfScACQPyleHpCX91Eh8p9HqMiRS-G
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68db6fda cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=Z7Na34o_7zx_Ti1R3c8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: HSZfScACQPyleHpCX91Eh8p9HqMiRS-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX479R0SMlT7OF
 dZIm8bUGFlxAHAtjMLLYAxt2zrDs7Ck1qU/O3za/sQ98vvbc2km7uIIvJj2kr1j0Jimq2n5YDrk
 po3XaLiZGrjKCafkfMEYllzIoMFHocqRdFe71JRm6M7NhXCmsMOdViG4XwcZVvao6NY8EAp62UA
 e9QmbTGLNqCVGIJnLSuKOULtX8rGwKeJjZY3UkmgdVtMKsOVigwM46Lb7ndIyCZGkZ5/7Et4o8g
 8yaDtqpEL04X3bnrd+QGFLKMUs3yPZ7Bou+7YC6J0vqzp2RrjdPJJ2z9jo+ecklmG4kovmjgToZ
 CEML68po3CLUzc2LDE4ETR9dxvG9bzHwFbggAm8rJT0nb/KRHWkg37vjK3QZg4/J70YR0svMj0K
 IJh4DnrApw/gosF1SxSCOtrg5ZpR+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001
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

A8x is the next generation of Adreno GPUs, featuring a significant
hardware design change. A major update to the design is the introduction
of Slice architecture. Slices are sort of mini-GPUs within the GPU which
are more independent in processing Graphics and compute workloads. Also,
in addition to the BV and BR pipe we saw in A7x, CP has more concurrency
with additional pipes.

From a software interface perspective, these changes have a significant
impact on the KMD side. First, the GPU register space has been extensively
reorganized. Second, to avoid  a register space explosion caused by the
new slice architecture and additional pipes, many registers are now
virtualized, instead of duplicated as in A7x. KMD must configure an
aperture register with the appropriate slice and pipe ID before accessing
these virtualized registers.

This patch adds only a skeleton support for the A8x family. An A8x GPU
support will be added in an upcoming patch.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile                      |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             |  103 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |   21 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c             | 1238 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h           |    7 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml     |    1 -
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |    1 +
 7 files changed, 1344 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7acf2cc13cd047eb7f5b3f14e1a42a1cc145e087..8aa7d07303fb0cd66869767cb6298b38a621b366 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -24,6 +24,7 @@ adreno-y := \
 	adreno/a6xx_gmu.o \
 	adreno/a6xx_hfi.o \
 	adreno/a6xx_preempt.o \
+	adreno/a8xx_gpu.o \
 
 adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bd4f98b5457356c5454d0316e59d7e8253401712..4aeeaceb1fb30a9d68ac636c14249e3853ef73ac 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -239,14 +239,21 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	}
 
 	if (!sysprof) {
-		if (!adreno_is_a7xx(adreno_gpu)) {
+		if (!(adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu))) {
 			/* Turn off protected mode to write to special registers */
 			OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
 			OUT_RING(ring, 0);
 		}
 
-		OUT_PKT4(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD, 1);
-		OUT_RING(ring, 1);
+		if (adreno_is_a8xx(adreno_gpu)) {
+			OUT_PKT4(ring, REG_A8XX_RBBM_PERFCTR_SRAM_INIT_CMD, 1);
+			OUT_RING(ring, 1);
+			OUT_PKT4(ring, REG_A8XX_RBBM_SLICE_PERFCTR_SRAM_INIT_CMD, 1);
+			OUT_RING(ring, 1);
+		} else {
+			OUT_PKT4(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD, 1);
+			OUT_RING(ring, 1);
+		}
 	}
 
 	/* Execute the table update */
@@ -275,7 +282,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	 * to make sure BV doesn't race ahead while BR is still switching
 	 * pagetables.
 	 */
-	if (adreno_is_a7xx(&a6xx_gpu->base)) {
+	if (adreno_is_a7xx(&a6xx_gpu->base) && adreno_is_a8xx(&a6xx_gpu->base)) {
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
 		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
 	}
@@ -289,20 +296,22 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	OUT_RING(ring, CACHE_INVALIDATE);
 
 	if (!sysprof) {
+		u32 reg_status = adreno_is_a8xx(adreno_gpu) ?
+			REG_A8XX_RBBM_PERFCTR_SRAM_INIT_STATUS :
+			REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS;
 		/*
 		 * Wait for SRAM clear after the pgtable update, so the
 		 * two can happen in parallel:
 		 */
 		OUT_PKT7(ring, CP_WAIT_REG_MEM, 6);
 		OUT_RING(ring, CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ));
-		OUT_RING(ring, CP_WAIT_REG_MEM_POLL_ADDR_LO(
-				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS));
+		OUT_RING(ring, CP_WAIT_REG_MEM_POLL_ADDR_LO(reg_status));
 		OUT_RING(ring, CP_WAIT_REG_MEM_POLL_ADDR_HI(0));
 		OUT_RING(ring, CP_WAIT_REG_MEM_3_REF(0x1));
 		OUT_RING(ring, CP_WAIT_REG_MEM_4_MASK(0x1));
 		OUT_RING(ring, CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0));
 
-		if (!adreno_is_a7xx(adreno_gpu)) {
+		if (!(adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu))) {
 			/* Re-enable protected mode: */
 			OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
 			OUT_RING(ring, 1);
@@ -441,6 +450,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
+	u32 rbbm_perfctr_cp0, cp_always_on_counter;
 
 	adreno_check_and_reenable_stall(adreno_gpu);
 
@@ -460,10 +470,16 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	if (gpu->nr_rings > 1)
 		a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, submit->queue);
 
-	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
-		rbmemptr_stats(ring, index, cpcycles_start));
-	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
-		rbmemptr_stats(ring, index, alwayson_start));
+	if (adreno_is_a8xx(adreno_gpu)) {
+		rbbm_perfctr_cp0 = REG_A8XX_RBBM_PERFCTR_CP(0);
+		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_COUNTER;
+	} else {
+		rbbm_perfctr_cp0 = REG_A7XX_RBBM_PERFCTR_CP(0);
+		cp_always_on_counter = REG_A6XX_CP_ALWAYS_ON_COUNTER;
+	}
+
+	get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_start));
+	get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ring, index, alwayson_start));
 
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
 	OUT_RING(ring, CP_SET_THREAD_BOTH);
@@ -510,10 +526,8 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		OUT_RING(ring, 0x00e); /* IB1LIST end */
 	}
 
-	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
-		rbmemptr_stats(ring, index, cpcycles_end));
-	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
-		rbmemptr_stats(ring, index, alwayson_end));
+	get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_end));
+	get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ring, index, alwayson_end));
 
 	/* Write the fence to the scratch register */
 	OUT_PKT4(ring, REG_A6XX_CP_SCRATCH(2), 1);
@@ -706,8 +720,11 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
 	*cfg = *common_cfg;
 
-	cfg->ubwc_swizzle = 0x6;
-	cfg->highest_bank_bit = 15;
+	/* Use common config as is for A8x */
+	if (!adreno_is_a8xx(gpu)) {
+		cfg->ubwc_swizzle = 0x6;
+		cfg->highest_bank_bit = 15;
+	}
 
 	if (adreno_is_a610(gpu)) {
 		cfg->highest_bank_bit = 13;
@@ -818,7 +835,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  cfg->macrotile_mode);
 }
 
-static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
+void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -868,7 +885,7 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	lock->dynamic_list_len = 0;
 }
 
-static int a7xx_preempt_start(struct msm_gpu *gpu)
+int a7xx_preempt_start(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -925,7 +942,7 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
 	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
 
-static int a7xx_cp_init(struct msm_gpu *gpu)
+int a7xx_cp_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -993,7 +1010,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		return false;
 
 	/* A7xx is safe! */
-	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
+	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu) || adreno_is_a8xx(adreno_gpu))
 		return true;
 
 	/*
@@ -2161,7 +2178,7 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
 {
 	/* 11nm chips (e.g. ones with A610) have hw issues with the reset line! */
-	if (adreno_is_a610(to_adreno_gpu(gpu)))
+	if (adreno_is_a610(to_adreno_gpu(gpu)) || adreno_is_a8xx(to_adreno_gpu(gpu)))
 		return;
 
 	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
@@ -2192,7 +2209,12 @@ static int a6xx_gmu_pm_resume(struct msm_gpu *gpu)
 
 	msm_devfreq_resume(gpu);
 
-	adreno_is_a7xx(adreno_gpu) ? a7xx_llc_activate(a6xx_gpu) : a6xx_llc_activate(a6xx_gpu);
+	if (adreno_is_a8xx(adreno_gpu))
+		a8xx_llc_activate(a6xx_gpu);
+	else if (adreno_is_a7xx(adreno_gpu))
+		a7xx_llc_activate(a6xx_gpu);
+	else
+		a6xx_llc_activate(a6xx_gpu);
 
 	return ret;
 }
@@ -2561,10 +2583,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->base.hw_apriv =
 		!!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
 
-	/* gpu->info only gets assigned in adreno_gpu_init() */
-	is_a7xx = config->info->family == ADRENO_7XX_GEN1 ||
-		  config->info->family == ADRENO_7XX_GEN2 ||
-		  config->info->family == ADRENO_7XX_GEN3;
+	/* gpu->info only gets assigned in adreno_gpu_init(). A8x is included intentionally */
+	is_a7xx = config->info->family >= ADRENO_7XX_GEN1;
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
 
@@ -2730,3 +2750,32 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.bus_halt = a6xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a6xx_fault_handler,
 };
+
+const struct adreno_gpu_funcs a8xx_gpu_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a8xx_hw_init,
+		.ucode_load = a6xx_ucode_load,
+		.pm_suspend = a6xx_gmu_pm_suspend,
+		.pm_resume = a6xx_gmu_pm_resume,
+		.recover = a8xx_recover,
+		.submit = a7xx_submit,
+		.active_ring = a6xx_active_ring,
+		.irq = a8xx_irq,
+		.destroy = a6xx_destroy,
+		.gpu_busy = a8xx_gpu_busy,
+		.gpu_get_freq = a6xx_gmu_get_freq,
+		.gpu_set_freq = a6xx_gpu_set_freq,
+		.create_vm = a6xx_create_vm,
+		.create_private_vm = a6xx_create_private_vm,
+		.get_rptr = a6xx_get_rptr,
+		.progress = a8xx_progress,
+	},
+	.init = a6xx_gpu_init,
+	.get_timestamp = a8xx_gmu_get_timestamp,
+	.submit_flush = a8xx_flush,
+	.feature_probe = a8xx_gpu_feature_probe,
+	.bus_halt = a8xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a8xx_fault_handler,
+};
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 0b17d36c36a9567e6afa4269ae7783ed3578e40e..18300b12bf2a8bcd5601797df0fcc7afa8943863 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -46,6 +46,7 @@ struct a6xx_info {
 	const struct adreno_protect *protect;
 	const struct adreno_reglist_list *pwrup_reglist;
 	const struct adreno_reglist_list *ifpc_reglist;
+	const struct adreno_reglist_pipe *nonctxt_reglist;
 	u32 gmu_chipid;
 	u32 gmu_cgc_mode;
 	u32 prim_fifo_threshold;
@@ -101,6 +102,11 @@ struct a6xx_gpu {
 	void *htw_llc_slice;
 	bool have_mmu500;
 	bool hung;
+
+	u32 cached_aperture;
+	spinlock_t aperture_lock;
+
+	u32 slice_mask;
 };
 
 #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
@@ -299,4 +305,19 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
 int a6xx_fenced_write(struct a6xx_gpu *gpu, u32 offset, u64 value, u32 mask, bool is_64b);
 
+void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu);
+int a7xx_preempt_start(struct msm_gpu *gpu);
+int a7xx_cp_init(struct msm_gpu *gpu);
+
+void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
+int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
+void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+int a8xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value);
+u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
+int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
+int a8xx_hw_init(struct msm_gpu *gpu);
+irqreturn_t a8xx_irq(struct msm_gpu *gpu);
+void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
+bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+void a8xx_recover(struct msm_gpu *gpu);
 #endif /* __A6XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
new file mode 100644
index 0000000000000000000000000000000000000000..6a64b1f96d730a46301545c52a83d62dddc6c2ff
--- /dev/null
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -0,0 +1,1238 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
+
+
+#include "msm_gem.h"
+#include "msm_mmu.h"
+#include "msm_gpu_trace.h"
+#include "a6xx_gpu.h"
+#include "a6xx_gmu.xml.h"
+
+#include <linux/bitfield.h>
+#include <linux/devfreq.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/pm_domain.h>
+#include <linux/soc/qcom/llcc-qcom.h>
+
+#define GPU_PAS_ID 13
+
+static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	u32 val;
+
+	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
+
+	if (a6xx_gpu->cached_aperture == val)
+		return;
+
+	gpu_write(gpu, REG_A8XX_CP_APERTURE_CNTL_HOST, val);
+
+	a6xx_gpu->cached_aperture = val;
+}
+
+static void a8xx_aperture_set(struct msm_gpu *gpu, enum adreno_pipe pipe)
+{
+	a8xx_aperture_slice_set(gpu, pipe, 0);
+}
+
+static void a8xx_write_pipe(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 offset, u32 data)
+{
+	a8xx_aperture_set(gpu, pipe);
+
+	gpu_write(gpu, offset, data);
+}
+
+static u32 a8xx_read_pipe(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 offset)
+{
+	a8xx_aperture_set(gpu, pipe);
+
+	return gpu_read(gpu, offset);
+}
+
+static u32 a8xx_read_pipe_slice(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice, u32 offset)
+{
+	a8xx_aperture_slice_set(gpu, pipe, slice);
+
+	return gpu_read(gpu, offset);
+}
+
+static void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	if (adreno_gpu->info->family < ADRENO_8XX_GEN1)
+		return;
+
+	if (a6xx_gpu->slice_mask)
+		return;
+
+	a6xx_gpu->slice_mask = a6xx_llc_read(a6xx_gpu,
+			REG_A8XX_CX_MISC_SLICE_ENABLE_FINAL) & GENMASK(3, 0);
+}
+
+static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
+{
+	return ffs(a6xx_gpu->slice_mask) - 1;
+}
+
+static inline bool _a8xx_check_idle(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	/* Check that the GMU is idle */
+	if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
+		return false;
+
+	/* Check that the CX master is idle */
+	if (gpu_read(gpu, REG_A8XX_RBBM_STATUS) &
+			~A8XX_RBBM_STATUS_CP_AHB_BUSY_CX_MASTER)
+		return false;
+
+	return !(gpu_read(gpu, REG_A8XX_RBBM_INT_0_STATUS) &
+		A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT);
+}
+
+static bool a8xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	/* wait for CP to drain ringbuffer: */
+	if (!adreno_idle(gpu, ring))
+		return false;
+
+	if (spin_until(_a8xx_check_idle(gpu))) {
+		DRM_ERROR("%s: %ps: timeout waiting for GPU to idle: status %8.8X irq %8.8X rptr/wptr %d/%d\n",
+			gpu->name, __builtin_return_address(0),
+			gpu_read(gpu, REG_A8XX_RBBM_STATUS),
+			gpu_read(gpu, REG_A8XX_RBBM_INT_0_STATUS),
+			gpu_read(gpu, REG_A6XX_CP_RB_RPTR),
+			gpu_read(gpu, REG_A6XX_CP_RB_WPTR));
+		return false;
+	}
+
+	return true;
+}
+
+void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	uint32_t wptr;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ring->preempt_lock, flags);
+
+	/* Copy the shadow to the actual register */
+	ring->cur = ring->next;
+
+	/* Make sure to wrap wptr if we need to */
+	wptr = get_wptr(ring);
+
+	/* Update HW if this is the current ring and we are not in preempt*/
+	if (!a6xx_in_preempt(a6xx_gpu)) {
+		if (a6xx_gpu->cur_ring == ring)
+			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
+		else
+			ring->restore_wptr = true;
+	} else {
+		ring->restore_wptr = true;
+	}
+
+	spin_unlock_irqrestore(&ring->preempt_lock, flags);
+}
+
+static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u32 val;
+
+	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
+			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
+	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
+			state ? 0x110111 : 0);
+	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
+			state ? 0x55555 : 0);
+
+	gpu_write(gpu, REG_A8XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
+	gpu_write(gpu, REG_A8XX_RBBM_CGC_GLOBAL_LOAD_CMD, state ? 1 : 0);
+
+	if (state) {
+		gpu_write(gpu, REG_A8XX_RBBM_CGC_P2S_TRIG_CMD, 1);
+
+		if (gpu_poll_timeout(gpu, REG_A8XX_RBBM_CGC_P2S_STATUS, val,
+				     val & A8XX_RBBM_CGC_P2S_STATUS_TXDONE, 1, 10)) {
+			dev_err(&gpu->pdev->dev, "RBBM_CGC_P2S_STATUS TXDONE Poll failed\n");
+			return;
+		}
+
+		gpu_write(gpu, REG_A8XX_RBBM_CLOCK_CNTL_GLOBAL, 0);
+	} else {
+		/*
+		 * GMU enables clk gating in GBIF during boot up. So, override that here when
+		 * hwcg feature is disabled
+		 */
+		gpu_rmw(gpu, REG_A8XX_GBIF_CX_CONFIG, BIT(0), 0);
+	}
+}
+
+static void a8xx_set_cp_protect(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct adreno_protect *protect = adreno_gpu->info->a6xx->protect;
+	unsigned int i;
+	u32 cntl;
+
+
+	cntl = A8XX_CP_PROTECT_CNTL_PIPE_ACCESS_PROT_EN |
+		A8XX_CP_PROTECT_CNTL_PIPE_ACCESS_FAULT_ON_VIOL_EN |
+		A8XX_CP_PROTECT_CNTL_PIPE_LAST_SPAN_INF_RANGE;
+	/*
+	 * Enable access protection to privileged registers, fault on an access
+	 * protect violation and select the last span to protect from the start
+	 * address all the way to the end of the register address space
+	 */
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_CNTL_PIPE, cntl);
+	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_CNTL_PIPE, cntl);
+
+	/* Clear aperture */
+	a8xx_aperture_set(gpu, 0);
+
+	for (i = 0; i < protect->count - 1; i++) {
+		/* Intentionally skip writing to some registers */
+		if (protect->regs[i])
+			gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
+	}
+	/* last CP_PROTECT to have "infinite" length on the last entry */
+	gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(protect->count_max - 1), protect->regs[i]);
+
+	/* Last span feature is only supported on PIPE specific register. So update those here */
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(15), protect->regs[i]);
+	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(15), protect->regs[i]);
+
+	/* Clear aperture */
+	a8xx_aperture_set(gpu, 0);
+}
+
+static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->ubwc_config;
+	/*
+	 * We subtract 13 from the highest bank bit (13 is the minimum value
+	 * allowed by hw) and write the lowest two bits of the remaining value
+	 * as hbb_lo and the one above it as hbb_hi to the hardware.
+	 */
+	WARN_ON(cfg->highest_bank_bit < 13);
+	u32 hbb = cfg->highest_bank_bit - 13;
+	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
+	u32 level3_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
+	u32 ubwc_version = cfg->ubwc_enc_version;
+	bool yuvnotcomptofc = false, min_acc_len_64b = false;
+	bool rgb565_predicator = false, amsbc = false;
+	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
+	bool rgba8888_lossless = false, fp16compoptdis = false;
+	u8 uavflagprd_inv = 2;
+	u32 hbb_hi = hbb >> 2;
+	u32 hbb_lo = hbb & 3;
+	u32 mode = 1;
+
+	switch (ubwc_version) {
+	case UBWC_6_0:
+		yuvnotcomptofc = true;
+		mode = 5;
+		break;
+	case UBWC_5_0:
+		amsbc = true;
+		rgb565_predicator = true;
+		mode = 4;
+		break;
+	case UBWC_4_0:
+		amsbc = true;
+		rgb565_predicator = true;
+		fp16compoptdis = true;
+		rgba8888_lossless = true;
+		mode = 2;
+		break;
+	case UBWC_3_0:
+		amsbc = true;
+		mode = 1;
+		break;
+	default:
+		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
+		break;
+	}
+
+	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_GRAS_NC_MODE_CNTL, hbb << 5);
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_GRAS_NC_MODE_CNTL, hbb << 5);
+
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_CCU_NC_MODE_CNTL,
+			yuvnotcomptofc << 6 |
+			hbb_hi << 3 |
+			hbb_lo << 1);
+
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_CMP_NC_MODE_CNTL,
+			mode << 15 |
+			yuvnotcomptofc << 6 |
+			rgba8888_lossless << 4 |
+			fp16compoptdis << 3 |
+			rgb565_predicator << 2 |
+			amsbc << 1 |
+			min_acc_len_64b);
+
+	/* Clear aperture */
+	a8xx_aperture_set(gpu, 0);
+
+	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
+		  level3_swizzling_dis << 13 |
+		  level2_swizzling_dis << 12 |
+		  hbb_hi << 10 |
+		  uavflagprd_inv << 4 |
+		  min_acc_len_64b << 3 |
+		  hbb_lo << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL,
+		  level3_swizzling_dis << 7 |
+		  level2_swizzling_dis << 6 |
+		  hbb_hi << 4 |
+		  min_acc_len_64b << 3 |
+		  hbb_lo << 1 | ubwc_mode);
+}
+
+static int a8xx_zap_shader_init(struct msm_gpu *gpu)
+{
+	static bool loaded;
+	int ret;
+
+	if (loaded)
+		return 0;
+
+	ret = adreno_zap_shader_load(gpu, GPU_PAS_ID);
+
+	loaded = !ret;
+	return ret;
+}
+
+static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
+	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
+	int pipe_id, i;
+
+	for (pipe_id = PIPE_NONE; pipe_id <= PIPE_DDE_BV; pipe_id++) {
+		/* We don't have support for LPAC yet */
+		if (pipe_id == PIPE_LPAC)
+			continue;
+
+		for (i = 0; regs[i].offset; i++) {
+			if (!(BIT(pipe_id) & regs[i].pipe))
+				continue;
+
+			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
+				*gmem_protect = regs[i].value;
+
+			a8xx_write_pipe(gpu, pipe_id, regs[i].offset, regs[i].value);
+		}
+	}
+
+	a8xx_aperture_set(gpu, 0);
+}
+
+static int a8xx_cp_init(struct msm_gpu *gpu)
+{
+	struct msm_ringbuffer *ring = gpu->rb[0];
+	u32 mask;
+
+	/* Disable concurrent binning before sending CP init */
+	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+	OUT_RING(ring, BIT(27));
+
+	OUT_PKT7(ring, CP_ME_INIT, 4);
+
+	/* Use multiple HW contexts */
+	mask = BIT(0);
+
+	/* Enable error detection */
+	mask |= BIT(1);
+
+	/* Set default reset state */
+	mask |= BIT(3);
+
+	/* Disable save/restore of performance counters across preemption */
+	mask |= BIT(6);
+
+	OUT_RING(ring, mask);
+
+	/* Enable multiple hardware contexts */
+	OUT_RING(ring, 0x00000003);
+
+	/* Enable error detection */
+	OUT_RING(ring, 0x20000000);
+
+	/* Operation mode mask */
+	OUT_RING(ring, 0x00000002);
+
+	a8xx_flush(gpu, ring);
+	return a8xx_idle(gpu, ring) ? 0 : -EINVAL;
+}
+
+#define A8XX_INT_MASK \
+	(A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR | \
+	 A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLOW | \
+	 A6XX_RBBM_INT_0_MASK_RBBM_GPC_ERROR | \
+	 A6XX_RBBM_INT_0_MASK_CP_SW | \
+	 A6XX_RBBM_INT_0_MASK_CP_HW_ERROR | \
+	 A6XX_RBBM_INT_0_MASK_PM4CPINTERRUPT | \
+	 A6XX_RBBM_INT_0_MASK_CP_RB_DONE_TS | \
+	 A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS | \
+	 A6XX_RBBM_INT_0_MASK_RBBM_ATB_BUS_OVERFLOW | \
+	 A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
+	 A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
+	 A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
+	 A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
+	 A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
+
+#define A8XX_APRIV_MASK \
+	(A8XX_CP_APRIV_CNTL_PIPE_ICACHE | \
+	 A8XX_CP_APRIV_CNTL_PIPE_RBFETCH | \
+	 A8XX_CP_APRIV_CNTL_PIPE_RBPRIVLEVEL | \
+	 A8XX_CP_APRIV_CNTL_PIPE_RBRPWB)
+
+#define A8XX_BR_APRIV_MASK \
+	(A8XX_APRIV_MASK | \
+	 A8XX_CP_APRIV_CNTL_PIPE_CDREAD | \
+	 A8XX_CP_APRIV_CNTL_PIPE_CDWRITE)
+
+#define A8XX_CP_GLOBAL_INT_MASK \
+	(A8XX_CP_GLOBAL_INT_MASK_HWFAULTBR | \
+	 A8XX_CP_GLOBAL_INT_MASK_HWFAULTBV | \
+	 A8XX_CP_GLOBAL_INT_MASK_HWFAULTLPAC | \
+	 A8XX_CP_GLOBAL_INT_MASK_HWFAULTAQE0 | \
+	 A8XX_CP_GLOBAL_INT_MASK_HWFAULTAQE1 | \
+	 A8XX_CP_GLOBAL_INT_MASK_HWFAULTDDEBR | \
+	 A8XX_CP_GLOBAL_INT_MASK_HWFAULTDDEBV | \
+	 A8XX_CP_GLOBAL_INT_MASK_SWFAULTBR | \
+	 A8XX_CP_GLOBAL_INT_MASK_SWFAULTBV | \
+	 A8XX_CP_GLOBAL_INT_MASK_SWFAULTLPAC | \
+	 A8XX_CP_GLOBAL_INT_MASK_SWFAULTAQE0 | \
+	 A8XX_CP_GLOBAL_INT_MASK_SWFAULTAQE1 | \
+	 A8XX_CP_GLOBAL_INT_MASK_SWFAULTDDEBR | \
+	 A8XX_CP_GLOBAL_INT_MASK_SWFAULTDDEBV)
+
+#define A8XX_CP_INTERRUPT_STATUS_MASK_PIPE \
+	(A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFRBWRAP | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB1WRAP | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB2WRAP | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB3WRAP | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFSDSWRAP | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFMRBWRAP | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFVSDWRAP | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_OPCODEERROR | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_VSDPARITYERROR | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_REGISTERPROTECTIONERROR | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_ILLEGALINSTRUCTION | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_SMMUFAULT | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_VBIFRESP | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_RTWROVF | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_LRZRTWROVF | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_LRZRTREFCNTOVF | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_LRZRTCLRRESMISS)
+
+#define A8XX_CP_HW_FAULT_STATUS_MASK_PIPE \
+	(A8XX_CP_HW_FAULT_STATUS_MASK_PIPE_CSFRBFAULT | \
+	 A8XX_CP_HW_FAULT_STATUS_MASK_PIPE_CSFIB1FAULT | \
+	 A8XX_CP_HW_FAULT_STATUS_MASK_PIPE_CSFIB2FAULT | \
+	 A8XX_CP_HW_FAULT_STATUS_MASK_PIPE_CSFIB3FAULT | \
+	 A8XX_CP_HW_FAULT_STATUS_MASK_PIPE_CSFSDSFAULT | \
+	 A8XX_CP_HW_FAULT_STATUS_MASK_PIPE_CSFMRBFAULT | \
+	 A8XX_CP_HW_FAULT_STATUS_MASK_PIPE_CSFVSDFAULT | \
+	 A8XX_CP_HW_FAULT_STATUS_MASK_PIPE_SQEREADBURSTOVF | \
+	 A8XX_CP_HW_FAULT_STATUS_MASK_PIPE_EVENTENGINEOVF | \
+	 A8XX_CP_HW_FAULT_STATUS_MASK_PIPE_UCODEERROR)
+
+static int hw_init(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	unsigned int pipe_id, i;
+	u32 gmem_protect = 0;
+	u64 gmem_range_min;
+	int ret;
+
+	/* Read the slice info on A8x GPUs */
+	a8xx_gpu_get_slice_info(gpu);
+
+	ret = a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+	if (ret)
+		return ret;
+
+	/* Clear the cached value to force aperture configuration next time */
+	a6xx_gpu->cached_aperture = UINT_MAX;
+	a8xx_aperture_set(gpu, 0);
+
+	/* Clear GBIF halt in case GX domain was not collapsed */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
+	gpu_read(gpu, REG_A6XX_GBIF_HALT);
+
+	gpu_write(gpu, REG_A8XX_RBBM_GBIF_HALT, 0);
+	gpu_read(gpu, REG_A8XX_RBBM_GBIF_HALT);
+
+	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
+
+	/*
+	 * Disable the trusted memory range - we don't actually supported secure
+	 * memory rendering at this point in time and we don't want to block off
+	 * part of the virtual memory space.
+	 */
+	gpu_write64(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE, 0x00000000);
+	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
+
+	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
+	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
+	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
+	gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
+	gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
+	gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
+
+	/* Make all blocks contribute to the GPU BUSY perf counter */
+	gpu_write(gpu, REG_A8XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xffffffff);
+
+	/* Setup GMEM Range in UCHE */
+	gmem_range_min = SZ_64M;
+	/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
+	gpu_write64(gpu, REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN, gmem_range_min);
+	gpu_write64(gpu, REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN, gmem_range_min);
+
+	/* Setup UCHE Trap region */
+	gpu_write64(gpu, REG_A8XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
+	gpu_write64(gpu, REG_A8XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
+	gpu_write64(gpu, REG_A8XX_UCHE_CCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
+	gpu_write64(gpu, REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
+
+	/* Turn on performance counters */
+	gpu_write(gpu, REG_A8XX_RBBM_PERFCTR_CNTL, 0x1);
+	gpu_write(gpu, REG_A8XX_RBBM_SLICE_PERFCTR_CNTL, 0x1);
+
+	/* Turn on the IFPC counter (countable 4 on XOCLK1) */
+	gmu_write(&a6xx_gpu->gmu, REG_A8XX_GMU_CX_GMU_POWER_COUNTER_SELECT_XOCLK_1,
+		  FIELD_PREP(GENMASK(7, 0), 0x4));
+
+	/* Select CP0 to always count cycles */
+	gpu_write(gpu, REG_A8XX_CP_PERFCTR_CP_SEL(0), PERF_CP_ALWAYS_COUNT);
+
+	a8xx_set_ubwc_config(gpu);
+
+	/* Set weights for bicubic filtering */
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(0), 0);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1), 0x3fe05ff4);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2), 0x3fa0ebee);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3), 0x3f5193ed);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4), 0x3f0243f0);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5), 0x00000000);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6), 0x3fd093e8);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7), 0x3f4133dc);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8), 0x3ea1dfdb);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9), 0x3e0283e0);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10), 0x0000ac2b);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11), 0x0000f01d);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12), 0x00114412);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13), 0x0021980a);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14), 0x0051ec05);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15), 0x0000380e);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16), 0x3ff09001);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17), 0x3fc10bfa);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18), 0x3f9193f7);
+	gpu_write(gpu, REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19), 0x3f7227f7);
+
+	/* Enable fault detection */
+	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
+	gpu_write(gpu, REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL, BIT(30));
+
+	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
+
+	a8xx_nonctxt_config(gpu, &gmem_protect);
+
+	/* Enable the GMEM save/restore feature for preemption */
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 1);
+	a8xx_aperture_set(gpu, 0);
+
+	/* Set up the CX GMU counter 0 to count busy ticks */
+	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_MASK, 0xff000000);
+
+	/* Enable the power counter */
+	gmu_rmw(gmu, REG_A8XX_GMU_CX_GMU_POWER_COUNTER_SELECT_XOCLK_0, 0xff, BIT(5));
+	gmu_write(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_ENABLE, 1);
+
+	/* Protect registers from the CP */
+	a8xx_set_cp_protect(gpu);
+
+	for (pipe_id = PIPE_BR; pipe_id <= PIPE_DDE_BV; pipe_id++) {
+		u32 apriv_mask = A8XX_APRIV_MASK;
+
+		if (pipe_id == PIPE_LPAC)
+			continue;
+
+		if (pipe_id == PIPE_BR)
+			apriv_mask = A8XX_BR_APRIV_MASK;
+
+		a8xx_write_pipe(gpu, pipe_id, REG_A8XX_CP_APRIV_CNTL_PIPE, apriv_mask);
+		a8xx_write_pipe(gpu, pipe_id, REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE,
+				A8XX_CP_INTERRUPT_STATUS_MASK_PIPE);
+		a8xx_write_pipe(gpu, pipe_id, REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE,
+				A8XX_CP_HW_FAULT_STATUS_MASK_PIPE);
+	}
+
+	/* Clear aperture */
+	a8xx_aperture_set(gpu, 0);
+
+	/* Enable interrupts */
+	gpu_write(gpu, REG_A8XX_CP_INTERRUPT_STATUS_MASK_GLOBAL, A8XX_CP_GLOBAL_INT_MASK);
+	gpu_write(gpu, REG_A8XX_RBBM_INT_0_MASK, A8XX_INT_MASK);
+
+	ret = adreno_hw_init(gpu);
+	if (ret)
+		goto out;
+
+	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
+	/* Set the ringbuffer address */
+	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
+	gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
+
+	/* Configure the RPTR shadow if needed: */
+	gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR, shadowptr(a6xx_gpu, gpu->rb[0]));
+	gpu_write64(gpu, REG_A8XX_CP_RB_RPTR_ADDR_BV, rbmemptr(gpu->rb[0], bv_rptr));
+
+	for (i = 0; i < gpu->nr_rings; i++)
+		a6xx_gpu->shadow[i] = 0;
+
+	/* Always come up on rb 0 */
+	a6xx_gpu->cur_ring = gpu->rb[0];
+
+	for (i = 0; i < gpu->nr_rings; i++)
+		gpu->rb[i]->cur_ctx_seqno = 0;
+
+	/* Enable the SQE_to start the CP engine */
+	gpu_write(gpu, REG_A8XX_CP_SQE_CNTL, 1);
+
+	ret = a8xx_cp_init(gpu);
+	if (ret)
+		goto out;
+
+	/*
+	 * Try to load a zap shader into the secure world. If successful
+	 * we can use the CP to switch out of secure mode. If not then we
+	 * have no resource but to try to switch ourselves out manually. If we
+	 * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
+	 * be blocked and a permissions violation will soon follow.
+	 */
+	ret = a8xx_zap_shader_init(gpu);
+	if (!ret) {
+		OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
+		OUT_RING(gpu->rb[0], 0x00000000);
+
+		a8xx_flush(gpu, gpu->rb[0]);
+		if (!a8xx_idle(gpu, gpu->rb[0]))
+			return -EINVAL;
+	} else if (ret == -ENODEV) {
+		/*
+		 * This device does not use zap shader (but print a warning
+		 * just in case someone got their dt wrong.. hopefully they
+		 * have a debug UART to realize the error of their ways...
+		 * if you mess this up you are about to crash horribly)
+		 */
+		dev_warn_once(gpu->dev->dev,
+			"Zap shader not enabled - using SECVID_TRUST_CNTL instead\n");
+		gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
+		ret = 0;
+	} else {
+		return ret;
+	}
+
+	/*
+	 * GMEM_PROTECT register should be programmed after GPU is transitioned to
+	 * non-secure mode
+	 */
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT, gmem_protect);
+	WARN_ON(!gmem_protect);
+
+	/* Clear aperture */
+	a8xx_aperture_set(gpu, 0);
+
+	/* Enable hardware clockgating */
+	a8xx_set_hwcg(gpu, true);
+out:
+	/*
+	 * Tell the GMU that we are done touching the GPU and it can start power
+	 * management
+	 */
+	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+
+	return ret;
+}
+
+int a8xx_hw_init(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	int ret;
+
+	mutex_lock(&a6xx_gpu->gmu.lock);
+	ret = hw_init(gpu);
+	mutex_unlock(&a6xx_gpu->gmu.lock);
+
+	return ret;
+}
+
+static void a8xx_dump(struct msm_gpu *gpu)
+{
+	DRM_DEV_INFO(&gpu->pdev->dev, "status:   %08x\n",
+			gpu_read(gpu, REG_A8XX_RBBM_STATUS));
+	adreno_dump(gpu);
+}
+
+void a8xx_recover(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	int i, active_submits;
+
+	adreno_dump_info(gpu);
+
+	for (i = 0; i < 4; i++)
+		DRM_DEV_INFO(&gpu->pdev->dev, "CP_SCRATCH_REG%d: %u\n", i,
+			gpu_read(gpu, REG_A8XX_CP_SCRATCH_GLOBAL(i)));
+
+	if (hang_debug)
+		a8xx_dump(gpu);
+
+	/*
+	 * To handle recovery specific sequences during the rpm suspend we are
+	 * about to trigger
+	 */
+	a6xx_gpu->hung = true;
+
+	/* Halt SQE first */
+	gpu_write(gpu, REG_A8XX_CP_SQE_CNTL, 3);
+
+	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
+
+	/* active_submit won't change until we make a submission */
+	mutex_lock(&gpu->active_lock);
+	active_submits = gpu->active_submits;
+
+	/*
+	 * Temporarily clear active_submits count to silence a WARN() in the
+	 * runtime suspend cb
+	 */
+	gpu->active_submits = 0;
+
+	reinit_completion(&gmu->pd_gate);
+	dev_pm_genpd_add_notifier(gmu->cxpd, &gmu->pd_nb);
+	dev_pm_genpd_synced_poweroff(gmu->cxpd);
+
+	/* Drop the rpm refcount from active submits */
+	if (active_submits)
+		pm_runtime_put(&gpu->pdev->dev);
+
+	/* And the final one from recover worker */
+	pm_runtime_put_sync(&gpu->pdev->dev);
+
+	if (!wait_for_completion_timeout(&gmu->pd_gate, msecs_to_jiffies(1000)))
+		DRM_DEV_ERROR(&gpu->pdev->dev, "cx gdsc didn't collapse\n");
+
+	dev_pm_genpd_remove_notifier(gmu->cxpd);
+
+	pm_runtime_use_autosuspend(&gpu->pdev->dev);
+
+	if (active_submits)
+		pm_runtime_get(&gpu->pdev->dev);
+
+	pm_runtime_get_sync(&gpu->pdev->dev);
+
+	gpu->active_submits = active_submits;
+	mutex_unlock(&gpu->active_lock);
+
+	msm_gpu_hw_init(gpu);
+	a6xx_gpu->hung = false;
+}
+
+static const char *a8xx_uche_fault_block(struct msm_gpu *gpu, u32 mid)
+{
+	static const char * const uche_clients[] = {
+		"BR_VFD", "BR_SP", "BR_VSC", "BR_VPC", "BR_HLSQ", "BR_PC", "BR_LRZ", "BR_TP",
+		"BV_VFD", "BV_SP", "BV_VSC", "BV_VPC", "BV_HLSQ", "BV_PC", "BV_LRZ", "BV_TP",
+		"STCHE",
+	};
+	static const char * const uche_clients_lpac[] = {
+		"-", "SP_LPAC", "-", "-", "HLSQ_LPAC", "-", "-", "TP_LPAC",
+	};
+	u32 val;
+
+	/*
+	 * The source of the data depends on the mid ID read from FSYNR1.
+	 * and the client ID read from the UCHE block
+	 */
+	val = gpu_read(gpu, REG_A8XX_UCHE_CLIENT_PF);
+
+	val &= GENMASK(6, 0);
+
+	/* mid=3 refers to BR or BV */
+	if (mid == 3) {
+		if (val < ARRAY_SIZE(uche_clients))
+			return uche_clients[val];
+		else
+			return "UCHE";
+	}
+
+	/* mid=8 refers to LPAC */
+	if (mid == 8) {
+		if (val < ARRAY_SIZE(uche_clients_lpac))
+			return uche_clients_lpac[val];
+		else
+			return "UCHE_LPAC";
+	}
+
+	return "Unknown";
+}
+
+static const char *a8xx_fault_block(struct msm_gpu *gpu, u32 id)
+{
+	switch (id) {
+	case 0x0:
+		return "CP";
+	case 0x1:
+		return "UCHE: Unknown";
+	case 0x2:
+		return "UCHE_LPAC: Unknown";
+	case 0x3:
+	case 0x8:
+		return a8xx_uche_fault_block(gpu, id);
+	case 0x4:
+		return "CCU";
+	case 0x5:
+		return "Flag cache";
+	case 0x6:
+		return "PREFETCH";
+	case 0x7:
+		return "GMU";
+	case 0x9:
+		return "UCHE_HPAC";
+	}
+
+	return "Unknown";
+}
+
+int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
+{
+	struct msm_gpu *gpu = arg;
+	struct adreno_smmu_fault_info *info = data;
+	const char *block = "unknown";
+
+	u32 scratch[] = {
+			gpu_read(gpu, REG_A8XX_CP_SCRATCH_GLOBAL(0)),
+			gpu_read(gpu, REG_A8XX_CP_SCRATCH_GLOBAL(1)),
+			gpu_read(gpu, REG_A8XX_CP_SCRATCH_GLOBAL(2)),
+			gpu_read(gpu, REG_A8XX_CP_SCRATCH_GLOBAL(3)),
+	};
+
+	if (info)
+		block = a8xx_fault_block(gpu, info->fsynr1 & 0xff);
+
+	return adreno_fault_handler(gpu, iova, flags, info, block, scratch);
+}
+
+static void a8xx_cp_hw_err_irq(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	u32 slice = a8xx_get_first_slice(a6xx_gpu);
+	u32 status = gpu_read(gpu, REG_A8XX_CP_INTERRUPT_STATUS_GLOBAL);
+	u32 hw_fault_mask = GENMASK(6, 0);
+	u32 sw_fault_mask = GENMASK(22, 16);
+	enum adreno_pipe pipe;
+	int i;
+
+	dev_err_ratelimited(&gpu->pdev->dev, "CP Fault Global INT status: 0x%x\n", status);
+
+	switch (status) {
+	case A8XX_CP_GLOBAL_INT_MASK_HWFAULTBR:
+	case A8XX_CP_GLOBAL_INT_MASK_SWFAULTBR:
+		pipe = PIPE_BR;
+		break;
+	case A8XX_CP_GLOBAL_INT_MASK_HWFAULTBV:
+	case A8XX_CP_GLOBAL_INT_MASK_SWFAULTBV:
+		pipe = PIPE_BV;
+		break;
+	case A8XX_CP_GLOBAL_INT_MASK_HWFAULTLPAC:
+	case A8XX_CP_GLOBAL_INT_MASK_SWFAULTLPAC:
+		pipe = PIPE_LPAC;
+		break;
+	case A8XX_CP_GLOBAL_INT_MASK_HWFAULTAQE0:
+	case A8XX_CP_GLOBAL_INT_MASK_SWFAULTAQE0:
+		pipe = PIPE_AQE0;
+		break;
+	case A8XX_CP_GLOBAL_INT_MASK_HWFAULTAQE1:
+	case A8XX_CP_GLOBAL_INT_MASK_SWFAULTAQE1:
+		pipe = PIPE_AQE1;
+		break;
+	case A8XX_CP_GLOBAL_INT_MASK_HWFAULTDDEBR:
+	case A8XX_CP_GLOBAL_INT_MASK_SWFAULTDDEBR:
+		pipe = PIPE_DDE_BR;
+		break;
+	case A8XX_CP_GLOBAL_INT_MASK_HWFAULTDDEBV:
+	case A8XX_CP_GLOBAL_INT_MASK_SWFAULTDDEBV:
+		pipe = PIPE_DDE_BV;
+		break;
+	default:
+		dev_err_ratelimited(&gpu->pdev->dev, "CP Fault Unknown pipe\n");
+		return;
+	}
+
+	if (hw_fault_mask & status) {
+		status = a8xx_read_pipe_slice(gpu, pipe, slice, REG_A8XX_CP_HW_FAULT_STATUS_PIPE);
+		dev_err_ratelimited(&gpu->pdev->dev,
+				"CP HW FAULT pipe: %u status: 0x%x\n", pipe, status);
+		/* Clear aperture */
+		a8xx_aperture_set(gpu, 0);
+		return;
+	}
+
+	if (sw_fault_mask & status) {
+		status = a8xx_read_pipe_slice(gpu, pipe, slice, REG_A8XX_CP_INTERRUPT_STATUS_PIPE);
+		dev_err_ratelimited(&gpu->pdev->dev,
+				"CP SW FAULT pipe: %u status: 0x%x\n", pipe, status);
+
+		if (status & BIT(8)) {
+			a8xx_write_pipe(gpu, pipe, REG_A8XX_CP_SQE_STAT_ADDR_PIPE, 1);
+			status = a8xx_read_pipe_slice(gpu, pipe, slice,
+					REG_A8XX_CP_SQE_STAT_DATA_PIPE);
+			dev_err_ratelimited(&gpu->pdev->dev,
+					"CP Opcode error, opcode=0x%x\n", status);
+		}
+
+		for (i = 0; i < 4; i++)
+			DRM_DEV_INFO(&gpu->pdev->dev, "CP_SCRATCH_REG%d: %u\n", i,
+				gpu_read(gpu, REG_A8XX_CP_SCRATCH_GLOBAL(i)));
+
+		for (pipe = PIPE_BR; pipe <= PIPE_DDE_BV; pipe++) {
+			for (i = 0; i < 5; i++)
+				DRM_DEV_INFO(&gpu->pdev->dev, "CP_SCRATCH_PIPE_REG%d: %u\n", i,
+					a8xx_read_pipe(gpu, pipe, REG_A8XX_CP_SCRATCH_PIPE(i)));
+		}
+
+		/* Clear aperture */
+		a8xx_aperture_set(gpu, 0);
+		return;
+	}
+}
+
+static u32 gpu_periph_read(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 dbg_offset)
+{
+	a8xx_write_pipe(gpu, pipe, REG_A8XX_CP_SQE_UCODE_DBG_ADDR_PIPE, dbg_offset);
+
+	return a8xx_read_pipe(gpu, pipe, REG_A8XX_CP_SQE_UCODE_DBG_DATA_PIPE);
+}
+
+static u64 gpu_periph_read64(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 dbg_offset)
+{
+	u64 lo, hi;
+
+	lo = gpu_periph_read(gpu, pipe, dbg_offset);
+	hi = gpu_periph_read(gpu, pipe, dbg_offset + 1);
+
+	return (hi << 32) | lo;
+}
+
+#define CP_PERIPH_IB1_BASE_LO   0x7005
+#define CP_PERIPH_IB1_BASE_HI   0x7006
+#define CP_PERIPH_IB1_SIZE      0x7007
+#define CP_PERIPH_IB1_OFFSET    0x7008
+#define CP_PERIPH_IB2_BASE_LO   0x7009
+#define CP_PERIPH_IB2_BASE_HI   0x700a
+#define CP_PERIPH_IB2_SIZE      0x700b
+#define CP_PERIPH_IB2_OFFSET    0x700c
+#define CP_PERIPH_IB3_BASE_LO   0x700d
+#define CP_PERIPH_IB3_BASE_HI   0x700e
+#define CP_PERIPH_IB3_SIZE      0x700f
+#define CP_PERIPH_IB3_OFFSET    0x7010
+
+static void a8xx_fault_detect_irq(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
+
+	/*
+	 * If stalled on SMMU fault, we could trip the GPU's hang detection,
+	 * but the fault handler will trigger the devcore dump, and we want
+	 * to otherwise resume normally rather than killing the submit, so
+	 * just bail.
+	 */
+	if (gpu_read(gpu, REG_A8XX_RBBM_MISC_STATUS) & A8XX_RBBM_MISC_STATUS_SMMU_STALLED_ON_FAULT)
+		return;
+
+	/*
+	 * Force the GPU to stay on until after we finish
+	 * collecting information
+	 */
+	if (!adreno_has_gmu_wrapper(adreno_gpu))
+		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
+
+	a8xx_aperture_set(gpu, PIPE_BR);
+
+	DRM_DEV_ERROR(&gpu->pdev->dev,
+		"gpu fault ring %d fence %x status %8.8X gfx_status %8.8X\n",
+		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
+		gpu_read(gpu, REG_A8XX_RBBM_STATUS), gpu_read(gpu, REG_A8XX_RBBM_GFX_STATUS));
+
+	DRM_DEV_ERROR(&gpu->pdev->dev,
+		"BR: status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x ib3 %16.16llX/%4.4x\n",
+		gpu_read(gpu, REG_A8XX_RBBM_GFX_BR_STATUS),
+		gpu_read(gpu, REG_A6XX_CP_RB_RPTR),
+		gpu_read(gpu, REG_A6XX_CP_RB_WPTR),
+		gpu_periph_read64(gpu, PIPE_BR, CP_PERIPH_IB1_BASE_LO),
+		gpu_periph_read(gpu, PIPE_BR, CP_PERIPH_IB1_OFFSET),
+		gpu_periph_read64(gpu, PIPE_BR, CP_PERIPH_IB2_BASE_LO),
+		gpu_periph_read(gpu, PIPE_BR, CP_PERIPH_IB2_OFFSET),
+		gpu_periph_read64(gpu, PIPE_BR, CP_PERIPH_IB3_BASE_LO),
+		gpu_periph_read(gpu, PIPE_BR, CP_PERIPH_IB3_OFFSET));
+
+	DRM_DEV_ERROR(&gpu->pdev->dev,
+		"BV: status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x ib3 %16.16llX/%4.4x\n",
+		gpu_read(gpu, REG_A8XX_RBBM_GFX_BV_STATUS),
+		gpu_read(gpu, REG_A8XX_CP_RB_RPTR_BV),
+		gpu_read(gpu, REG_A6XX_CP_RB_WPTR),
+		gpu_periph_read64(gpu, PIPE_BV, CP_PERIPH_IB1_BASE_LO),
+		gpu_periph_read(gpu, PIPE_BV, CP_PERIPH_IB1_OFFSET),
+		gpu_periph_read64(gpu, PIPE_BV, CP_PERIPH_IB2_BASE_LO),
+		gpu_periph_read(gpu, PIPE_BV, CP_PERIPH_IB2_OFFSET),
+		gpu_periph_read64(gpu, PIPE_BV, CP_PERIPH_IB3_BASE_LO),
+		gpu_periph_read(gpu, PIPE_BV, CP_PERIPH_IB3_OFFSET));
+
+	a8xx_aperture_set(gpu, 0);
+
+	/* Turn off the hangcheck timer to keep it from bothering us */
+	timer_delete(&gpu->hangcheck_timer);
+
+	kthread_queue_work(gpu->worker, &gpu->recover_work);
+}
+
+static void a8xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
+{
+	u32 status;
+
+	status = gpu_read(gpu, REG_A8XX_RBBM_SW_FUSE_INT_STATUS);
+	gpu_write(gpu, REG_A8XX_RBBM_SW_FUSE_INT_MASK, 0);
+
+	dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation status=%8.8x\n", status);
+
+	/*
+	 * Ignore FASTBLEND violations, because the HW will silently fall back
+	 * to legacy blending.
+	 */
+	if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
+		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
+		timer_delete(&gpu->hangcheck_timer);
+
+		kthread_queue_work(gpu->worker, &gpu->recover_work);
+	}
+}
+
+irqreturn_t a8xx_irq(struct msm_gpu *gpu)
+{
+	struct msm_drm_private *priv = gpu->dev->dev_private;
+	u32 status = gpu_read(gpu, REG_A8XX_RBBM_INT_0_STATUS);
+
+	gpu_write(gpu, REG_A8XX_RBBM_INT_CLEAR_CMD, status);
+
+	if (priv->disable_err_irq)
+		status &= A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
+
+	if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
+		a8xx_fault_detect_irq(gpu);
+
+	if (status & A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR) {
+		u32 rl0, rl1;
+
+		rl0 = gpu_read(gpu, REG_A8XX_CP_RL_ERROR_DETAILS_0);
+		rl1 = gpu_read(gpu, REG_A8XX_CP_RL_ERROR_DETAILS_1);
+		dev_err_ratelimited(&gpu->pdev->dev,
+				"CP | AHB bus error RL_ERROR_1: %x, RL_ERROR_2: %x\n", rl0, rl1);
+	}
+
+	if (status & A6XX_RBBM_INT_0_MASK_CP_HW_ERROR)
+		a8xx_cp_hw_err_irq(gpu);
+
+	if (status & A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLOW)
+		dev_err_ratelimited(&gpu->pdev->dev, "RBBM | ATB ASYNC overflow\n");
+
+	if (status & A6XX_RBBM_INT_0_MASK_RBBM_ATB_BUS_OVERFLOW)
+		dev_err_ratelimited(&gpu->pdev->dev, "RBBM | ATB bus overflow\n");
+
+	if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
+		dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bounds access\n");
+
+	if (status & A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR)
+		dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Trap interrupt\n");
+
+	if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
+		a8xx_sw_fuse_violation_irq(gpu);
+
+	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
+		msm_gpu_retire(gpu);
+		a6xx_preempt_trigger(gpu);
+	}
+
+	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
+		a6xx_preempt_irq(gpu);
+
+	return IRQ_HANDLED;
+}
+
+void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
+{
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+
+	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
+		u32 gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
+
+		gpu_scid &= GENMASK(5, 0);
+
+		gpu_write(gpu, REG_A6XX_GBIF_SCACHE_CNTL1,
+			  FIELD_PREP(GENMASK(29, 24), gpu_scid) |
+			  FIELD_PREP(GENMASK(23, 18), gpu_scid) |
+			  FIELD_PREP(GENMASK(17, 12), gpu_scid) |
+			  FIELD_PREP(GENMASK(11, 6), gpu_scid)  |
+			  FIELD_PREP(GENMASK(5, 0), gpu_scid));
+
+		gpu_write(gpu, REG_A6XX_GBIF_SCACHE_CNTL0,
+			  FIELD_PREP(GENMASK(27, 22), gpu_scid) |
+			  FIELD_PREP(GENMASK(21, 16), gpu_scid) |
+			  FIELD_PREP(GENMASK(15, 10), gpu_scid) |
+			  BIT(8));
+	}
+
+	llcc_slice_activate(a6xx_gpu->htw_llc_slice);
+}
+
+int a8xx_gpu_feature_probe(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	u32 fuse_val;
+	int ret;
+
+	/*
+	 * Assume that if qcom scm isn't available, that whatever
+	 * replacement allows writing the fuse register ourselves.
+	 * Users of alternative firmware need to make sure this
+	 * register is writeable or indicate that it's not somehow.
+	 * Print a warning because if you mess this up you're about to
+	 * crash horribly.
+	 */
+	if (!qcom_scm_is_available()) {
+		dev_warn_once(gpu->dev->dev,
+			"SCM is not available, poking fuse register\n");
+		a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
+			A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
+			A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
+			A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
+		adreno_gpu->has_ray_tracing = true;
+		return 0;
+	}
+
+	ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
+				     QCOM_SCM_GPU_TSENSE_EN_REQ);
+	if (ret)
+		return ret;
+
+	/*
+	 * On a750 raytracing may be disabled by the firmware, find out
+	 * whether that's the case. The scm call above sets the fuse
+	 * register.
+	 */
+	fuse_val = a6xx_llc_read(a6xx_gpu,
+				 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
+	adreno_gpu->has_ray_tracing =
+		!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
+
+	return 0;
+}
+
+
+#define GBIF_CLIENT_HALT_MASK		BIT(0)
+#define GBIF_ARB_HALT_MASK		BIT(1)
+#define VBIF_XIN_HALT_CTRL0_MASK	GENMASK(3, 0)
+#define VBIF_RESET_ACK_MASK		0xF0
+#define GPR0_GBIF_HALT_REQUEST		0x1E0
+
+void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off)
+{
+	struct msm_gpu *gpu = &adreno_gpu->base;
+
+	if (gx_off) {
+		/* Halt the gx side of GBIF */
+		gpu_write(gpu, REG_A8XX_RBBM_GBIF_HALT, 1);
+		spin_until(gpu_read(gpu, REG_A8XX_RBBM_GBIF_HALT_ACK) & 1);
+	}
+
+	/* Halt new client requests on GBIF */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
+	spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
+			(GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
+
+	/* Halt all AXI requests on GBIF */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
+	spin_until((gpu_read(gpu,  REG_A6XX_GBIF_HALT_ACK) &
+			(GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
+
+	/* The GBIF halt needs to be explicitly cleared */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
+}
+
+int a8xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	mutex_lock(&a6xx_gpu->gmu.lock);
+
+	/* Force the GPU power on so we can read this register */
+	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
+
+	*value = gpu_read64(gpu, REG_A8XX_CP_ALWAYS_ON_COUNTER);
+
+	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
+
+	mutex_unlock(&a6xx_gpu->gmu.lock);
+
+	return 0;
+}
+
+u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	u64 busy_cycles;
+
+	/* 19.2MHz */
+	*out_sample_rate = 19200000;
+
+	busy_cycles = gmu_read64(&a6xx_gpu->gmu,
+			REG_A8XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L,
+			REG_A8XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
+
+	return busy_cycles;
+}
+
+bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	return true;
+}
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9831401c3bc865b803c2f9759d5e2ffcd79d19f8..6a2157f31122ba0c2f2a7005c98e3e4f1ada6acc 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -90,6 +90,13 @@ struct adreno_reglist {
 	u32 value;
 };
 
+/* Reglist with pipe information */
+struct adreno_reglist_pipe {
+	u32 offset;
+	u32 value;
+	u32 pipe;
+};
+
 struct adreno_speedbin {
 	uint16_t fuse;
 	uint16_t speedbin;
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index ddde2e03b748f447b5e57571e2b04c68f8f2efc2..c3a202c8dce65d414c89bf76f1cb458b206b4eca 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -4876,7 +4876,6 @@ by a particular renderpass/blit.
 <domain name="A6XX_CX_MISC" width="32" prefix="variant" varset="chip">
 	<reg32 offset="0x0001" name="SYSTEM_CACHE_CNTL_0"/>
 	<reg32 offset="0x0002" name="SYSTEM_CACHE_CNTL_1"/>
-	<reg32 offset="0x0087" name="SLICE_ENABLE_FINAL" variants="A8XX-"/>
 	<reg32 offset="0x0039" name="CX_MISC_TCM_RET_CNTL" variants="A7XX-"/>
 	<reg32 offset="0x0087" name="CX_MISC_SLICE_ENABLE_FINAL" variants="A8XX"/>
 	<reg32 offset="0x0400" name="CX_MISC_SW_FUSE_VALUE" variants="A7XX-">
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index 5dce7934056dd6472c368309b4894f0ed4a4d960..c4e00b1263cda65dce89c2f16860e5bf6f1c6244 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -60,6 +60,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x1f400" name="GMU_ICACHE_CONFIG"/>
 	<reg32 offset="0x1f401" name="GMU_DCACHE_CONFIG"/>
 	<reg32 offset="0x1f40f" name="GMU_SYS_BUS_CONFIG"/>
+	<reg32 offset="0x1f50b" name="GMU_MRC_GBIF_QOS_CTRL"/>
 	<reg32 offset="0x1f800" name="GMU_CM3_SYSRESET"/>
 	<reg32 offset="0x1f801" name="GMU_CM3_BOOT_CONFIG"/>
 	<reg32 offset="0x1f81a" name="GMU_CM3_FW_BUSY"/>

-- 
2.51.0

