Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4600BC5A96A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2237310E975;
	Thu, 13 Nov 2025 23:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ileriQaO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9W7VHwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D02310E976
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMb20p1630107
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XBcENilsRVMutmYRYQ35/SgNG7xgcUc69CiYCZqwhag=; b=ileriQaOyHStpkAO
 bAFeP+YqFY27quXEDgzxnNogpaAt3kbopmGKKM7Lpa6W30oQaOcFHs8QOHeZRlAB
 NL5AEdf7/+4N4O1Wb7DttmsrJ/d9MICmfN++VQYgfrBDa+/OagbHBa0T2S3oZbuZ
 +JsasFszP5fatDR+aY1fZ0gbqvrFXInVjjGsCTY9neMbopVobDVxokW6m/4PGBah
 yZmDNjNx8FdrD+MccEgFEpLb3Baz/N78R9c5pFKHzUaKOvk3cKZX1cYsqo3flhep
 B2cbUfkVjLOFTMb0txWHxjRReMm6Xy2tpKdKf8ls6Wre6HNztnY0DcM8+S5u0mIh
 dZubvA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d842m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-bc240cdb249so1173716a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076685; x=1763681485;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XBcENilsRVMutmYRYQ35/SgNG7xgcUc69CiYCZqwhag=;
 b=j9W7VHwjaXXhAjxES57uW2EYcUoFXWsZSuDu03Y8pPM/NTjmX/zdxJdUqmcWun6nfC
 83H9o7bld1jd2Cn39YXKLBPWimfLXTe0sdTqxw/hcHtAjnY390BVSNbQ0BGhsm+vT2+1
 Nfzd7esdSSjteCkkvt5jjAkvtbVgUFN3pI3IDPofAYBWQmJbQ0AZAjFRfhfuNMawcvLn
 yM7h2kHW7df8oVkieOhIoc/G/YQWGv/EmnOLar1716CK7a1SpibE1CRhRJgvCmyA78H1
 Ehy6ivdCOHPAQqMhsUq8fWR1f/StAgqLA7HzoLJiLU/FRGLpjPYimdcjmvBOtJwto261
 M2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076685; x=1763681485;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XBcENilsRVMutmYRYQ35/SgNG7xgcUc69CiYCZqwhag=;
 b=PtQRAtf3hH9Lf1ipNPivpYI372eNjQOsai2v7mr5fZJytm8MoCV9gqKSY/qbJNdbCz
 1+69gxNbZ1ySJ5JIdUwcH0IAmu0b51pt+Tq1qOYU5F2FNXmXp0R3nqpENeyYUV3IfoER
 U/POkwV+TJ/zjdtd2y19d4xwmYWL1r0Ys3h7C8GjGaOfRvxmlZPgpv4dE1e0ROOuI6GZ
 DOxC1ELFlOht7sBBvIplZyJ2/J2fnNUZbB1wRK796+RCL4yF+26K4WRBkxU5+pPddRlQ
 OBWw/sPw1jjuoV6EV4cbuh58tZSL3MDSRCyBtd+zVtHKH5VdD+o6ZwjPixYpO3IW4sB/
 TX4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKqShkzDnrEMYoJtRF0g/ei/0OaSBZi2OdafuCmPk5owGexoPOO9vq/b7oRumKd38OSMBJ+kCWT6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlVOENcXqQu3M/lXJJQ+nu+CtwXZ/bvGnhLum7d2WLaEtFbBE6
 VxUITX8i/Sw570E+Zm3Dd7OXrVLTkVn7IdfhYIumOTOEoKojKOEQnyFXxsjAEeSf5GXMYRj9Es6
 mCZWKIreLToeYl2XvFeebs9Y0hhC2hIhGHsk9XAgsj0MNya60SdQ+yldG3hfsqVOrru7FSDw=
X-Gm-Gg: ASbGnctDBAAU31UpiqInW3cDDxt2Bhyo6w3xlUvuubz5s8W9c8qRxLGDmVpStd0Kz+H
 9k9ofECbAYTYhwXsv0gHt/ENKp6piHIjfuVhtKpYudafM3k17Yqq521D0Cpqf9X8vmbR7kK97yv
 8UMOxcbnNcuRkJr1VXOsnFHfp0UNUXpobpHXhLbdwsFt50ai3I2TzRLsqWAWTp9qF0ltkUg4uOu
 HXkhkn74iAKtwKe5GFw2X9ajb3S7ebSABbWt4vnHJkkPIgGWJahMDMWYk0yiOl34zi6hxmeIkVE
 ZPBppoKFup09oVeye8z83kO8BmakGDdVtOdzXHs0hf1b+jRVHhiSeG0WxKuJDM1/w1w0ZuFD6kM
 VQaEQCqlxHvxFzcODvpPC/Vs=
X-Received: by 2002:a05:6a20:244e:b0:358:dc7d:a2b3 with SMTP id
 adf61e73a8af0-35ba278d151mr1463191637.44.1763076684134; 
 Thu, 13 Nov 2025 15:31:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvpeMd4fBARu4B6bjw8Nimq1J9hIkUOnYPuTqDF/ysgKCpqnIu2FChomasuL0W7iMXUhfgTQ==
X-Received: by 2002:a05:6a20:244e:b0:358:dc7d:a2b3 with SMTP id
 adf61e73a8af0-35ba278d151mr1463141637.44.1763076683314; 
 Thu, 13 Nov 2025 15:31:23 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:31:22 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:10 +0530
Subject: [PATCH v3 13/20] drm/msm/adreno: Introduce A8x GPU Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-13-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=54722;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=mQG7tqea4pw4Otm75R6wuDB8h0fvMK7Gtqip62RX2a0=;
 b=vlninAC2e3FaaeDsIBSbEleqGkFs52xQnYYHGjgnzOig9fvGgEq5/NyMaRZXJqgzBTvQIKOkZ
 z3hYf2fkgGAB7SoaE9NWBcyO3k49Q+0L1d1x9ftIZuqLVgvqDsweH5n
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: bdyD0dUML3yKJAH5Edu4juF-5z9Peyku
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=69166a4d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=Z7Na34o_7zx_Ti1R3c8A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: bdyD0dUML3yKJAH5Edu4juF-5z9Peyku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX9tjebhlSmZj3
 c4DZHWHg1D6nOBbQraco78AIQxd6dM4tpUKxnE5VBLM1RBln3oLMgaPj3yVyLAkzdV2UQ6lvr91
 r+5iV8Fnj2pbJJEBP8KB3jo3wJPsmi0IQ5YzVF9Dd4Liy8Zj1eSfIHdDxEoXVThyX3UIxj9J2vW
 DXy15LECS7pFEx4CPAubtK074/MuIL20OsO5LtpFfOqXU3TLQRuGOIVDGfbKqDSB6IwKdBGchN1
 mDrjhIeBk+AaQ04+GMXjybO7y5/M8Xgym3GA80SmxYEZEPzgxXJ/QC0vMFi3Mce3QdkpA8iTA5N
 5o+cIyzHYu//U7bliENl0jcSz6LauL46tXmPAbkGlOlkNjpCsB1IbQiqVKwYI9RwCzhibP2Rp8Z
 4ZRnzFVsztiySvhEcIzxrBahmrmQzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
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

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile                      |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |    3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             |  118 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |   23 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c             | 1206 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h           |    7 +
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |    1 +
 7 files changed, 1325 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7acf2cc13cd0..8aa7d07303fb 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -24,6 +24,7 @@ adreno-y := \
 	adreno/a6xx_gmu.o \
 	adreno/a6xx_hfi.o \
 	adreno/a6xx_preempt.o \
+	adreno/a8xx_gpu.o \
 
 adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 158c0cd2d92b..3b4f05430ebe 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1148,6 +1148,9 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 		return ret;
 	}
 
+	/* Read the slice info on A8x GPUs */
+	a8xx_gpu_get_slice_info(gpu);
+
 	/* Set the bus quota to a reasonable value for boot */
 	a6xx_gmu_set_initial_bw(gpu, gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5ede975da95d..20dbdad6e2e8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -157,7 +157,7 @@ static void update_shadow_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	}
 }
 
-static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -245,14 +245,21 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
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
@@ -281,7 +288,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	 * to make sure BV doesn't race ahead while BR is still switching
 	 * pagetables.
 	 */
-	if (adreno_is_a7xx(&a6xx_gpu->base)) {
+	if (adreno_is_a7xx(&a6xx_gpu->base) || adreno_is_a8xx(&a6xx_gpu->base)) {
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
 		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
 	}
@@ -295,20 +302,22 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
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
@@ -446,6 +455,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = submit->ring;
+	u32 rbbm_perfctr_cp0, cp_always_on_counter;
 	unsigned int i, ibs = 0;
 
 	adreno_check_and_reenable_stall(adreno_gpu);
@@ -466,10 +476,16 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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
@@ -516,14 +532,17 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		OUT_RING(ring, 0x00e); /* IB1LIST end */
 	}
 
-	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
-		rbmemptr_stats(ring, index, cpcycles_end));
-	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
-		rbmemptr_stats(ring, index, alwayson_end));
+	get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_end));
+	get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ring, index, alwayson_end));
 
 	/* Write the fence to the scratch register */
-	OUT_PKT4(ring, REG_A6XX_CP_SCRATCH(2), 1);
-	OUT_RING(ring, submit->seqno);
+	if (adreno_is_a8xx(adreno_gpu)) {
+		OUT_PKT4(ring, REG_A8XX_CP_SCRATCH_GLOBAL(2), 1);
+		OUT_RING(ring, submit->seqno);
+	} else {
+		OUT_PKT4(ring, REG_A6XX_CP_SCRATCH(2), 1);
+		OUT_RING(ring, submit->seqno);
+	}
 
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
 	OUT_RING(ring, CP_SET_THREAD_BR);
@@ -712,8 +731,11 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
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
@@ -999,7 +1021,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		return false;
 
 	/* A7xx is safe! */
-	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
+	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu) || adreno_is_a8xx(adreno_gpu))
 		return true;
 
 	/*
@@ -1113,7 +1135,7 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 	return 0;
 }
 
-static int a6xx_zap_shader_init(struct msm_gpu *gpu)
+int a6xx_zap_shader_init(struct msm_gpu *gpu)
 {
 	static bool loaded;
 	int ret;
@@ -2074,7 +2096,7 @@ static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
 	u32 fuse_val;
 	int ret;
 
-	if (adreno_is_a750(adreno_gpu)) {
+	if (adreno_is_a750(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
 		/*
 		 * Assume that if qcom scm isn't available, that whatever
 		 * replacement allows writing the fuse register ourselves.
@@ -2100,9 +2122,9 @@ static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
 			return ret;
 
 		/*
-		 * On a750 raytracing may be disabled by the firmware, find out
-		 * whether that's the case. The scm call above sets the fuse
-		 * register.
+		 * On A7XX_GEN3 and newer, raytracing may be disabled by the
+		 * firmware, find out whether that's the case. The scm call
+		 * above sets the fuse register.
 		 */
 		fuse_val = a6xx_llc_read(a6xx_gpu,
 					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
@@ -2163,7 +2185,7 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
 {
 	/* 11nm chips (e.g. ones with A610) have hw issues with the reset line! */
-	if (adreno_is_a610(to_adreno_gpu(gpu)))
+	if (adreno_is_a610(to_adreno_gpu(gpu)) || adreno_is_a8xx(to_adreno_gpu(gpu)))
 		return;
 
 	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
@@ -2194,7 +2216,12 @@ static int a6xx_gmu_pm_resume(struct msm_gpu *gpu)
 
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
@@ -2563,10 +2590,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->base.hw_apriv =
 		!!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
 
-	/* gpu->info only gets assigned in adreno_gpu_init() */
-	is_a7xx = config->info->family == ADRENO_7XX_GEN1 ||
-		  config->info->family == ADRENO_7XX_GEN2 ||
-		  config->info->family == ADRENO_7XX_GEN3;
+	/* gpu->info only gets assigned in adreno_gpu_init(). A8x is included intentionally */
+	is_a7xx = config->info->family >= ADRENO_7XX_GEN1;
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
 
@@ -2604,7 +2629,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (adreno_is_a7xx(adreno_gpu)) {
+	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
 		ret = a7xx_cx_mem_init(a6xx_gpu);
 		if (ret) {
 			a6xx_destroy(&(a6xx_gpu->base.base));
@@ -2728,3 +2753,30 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
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
+	.bus_halt = a8xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a8xx_fault_handler,
+};
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index ef66e1eb9152..e6218b0b9732 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -46,6 +46,8 @@ struct a6xx_info {
 	const struct adreno_protect *protect;
 	const struct adreno_reglist_list *pwrup_reglist;
 	const struct adreno_reglist_list *ifpc_reglist;
+	const struct adreno_reglist_pipe *nonctxt_reglist;
+	u32 max_slices;
 	u32 gmu_chipid;
 	u32 gmu_cgc_mode;
 	u32 prim_fifo_threshold;
@@ -101,6 +103,11 @@ struct a6xx_gpu {
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
@@ -302,5 +309,19 @@ int a6xx_gpu_state_put(struct msm_gpu_state *state);
 void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
 int a6xx_fenced_write(struct a6xx_gpu *gpu, u32 offset, u64 value, u32 mask, bool is_64b);
-
+void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+int a6xx_zap_shader_init(struct msm_gpu *gpu);
+
+void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
+int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
+void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+int a8xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value);
+u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
+int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
+void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
+int a8xx_hw_init(struct msm_gpu *gpu);
+irqreturn_t a8xx_irq(struct msm_gpu *gpu);
+void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
+bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+void a8xx_recover(struct msm_gpu *gpu);
 #endif /* __A6XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
new file mode 100644
index 000000000000..cf11135f46d3
--- /dev/null
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -0,0 +1,1206 @@
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
+static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
+
+	a8xx_aperture_slice_set(gpu, pipe, 0);
+}
+
+static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
+}
+
+static void a8xx_aperture_clear(struct msm_gpu *gpu)
+{
+	unsigned long flags;
+
+	a8xx_aperture_acquire(gpu, PIPE_NONE, &flags);
+	a8xx_aperture_release(gpu, flags);
+}
+
+static void a8xx_write_pipe(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 offset, u32 data)
+{
+	unsigned long flags;
+
+	a8xx_aperture_acquire(gpu, pipe, &flags);
+	gpu_write(gpu, offset, data);
+	a8xx_aperture_release(gpu, flags);
+}
+
+static u32 a8xx_read_pipe_slice(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice, u32 offset)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&a6xx_gpu->aperture_lock, flags);
+	a8xx_aperture_slice_set(gpu, pipe, slice);
+	val = gpu_read(gpu, offset);
+	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
+
+	return val;
+}
+
+void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
+	u32 slice_mask;
+
+	if (adreno_gpu->info->family < ADRENO_8XX_GEN1)
+		return;
+
+	if (a6xx_gpu->slice_mask)
+		return;
+
+	slice_mask = GENMASK(info->max_slices - 1, 0);
+
+	/* GEN1 doesn't support partial slice configurations */
+	if (adreno_gpu->info->family == ADRENO_8XX_GEN1) {
+		a6xx_gpu->slice_mask = slice_mask;
+		return;
+	}
+
+	slice_mask &= a6xx_llc_read(a6xx_gpu,
+			REG_A8XX_CX_MISC_SLICE_ENABLE_FINAL);
+
+	a6xx_gpu->slice_mask = slice_mask;
+
+	/* Chip ID depends on the number of slices available. So update it */
+	adreno_gpu->chip_id |= FIELD_PREP(GENMASK(7, 4), hweight32(slice_mask));
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
+		 A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT);
+}
+
+static bool a8xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	/* wait for CP to drain ringbuffer: */
+	if (!adreno_idle(gpu, ring))
+		return false;
+
+	if (spin_until(_a8xx_check_idle(gpu))) {
+		DRM_ERROR(
+			"%s: %ps: timeout waiting for GPU to idle: status %8.8X irq %8.8X rptr/wptr %d/%d\n",
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
+	gpu_write(gpu, REG_A8XX_RBBM_CGC_GLOBAL_LOAD_CMD, !!state);
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
+		 * GMU enables clk gating in GBIF during boot up. So,
+		 * override that here when hwcg feature is disabled
+		 */
+		gpu_rmw(gpu, REG_A8XX_GBIF_CX_CONFIG, BIT(0), 0);
+	}
+}
+
+static void a8xx_set_cp_protect(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct adreno_protect *protect = adreno_gpu->info->a6xx->protect;
+	u32 cntl, final_cfg;
+	unsigned int i;
+
+	cntl = A8XX_CP_PROTECT_CNTL_PIPE_ACCESS_PROT_EN |
+		A8XX_CP_PROTECT_CNTL_PIPE_ACCESS_FAULT_ON_VIOL_EN |
+		A8XX_CP_PROTECT_CNTL_PIPE_LAST_SPAN_INF_RANGE |
+		A8XX_CP_PROTECT_CNTL_PIPE_HALT_SQE_RANGE__MASK;
+	/*
+	 * Enable access protection to privileged registers, fault on an access
+	 * protect violation and select the last span to protect from the start
+	 * address all the way to the end of the register address space
+	 */
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_CNTL_PIPE, cntl);
+	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_CNTL_PIPE, cntl);
+
+	a8xx_aperture_clear(gpu);
+
+	for (i = 0; i < protect->count; i++) {
+		/* Intentionally skip writing to some registers */
+		if (protect->regs[i]) {
+			gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
+			final_cfg = protect->regs[i];
+		}
+	}
+
+	/*
+	 * Last span feature is only supported on PIPE specific register.
+	 * So update those here
+	 */
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
+	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
+
+	a8xx_aperture_clear(gpu);
+}
+
+static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->ubwc_config;
+	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
+	u32 level3_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
+	bool rgba8888_lossless = false, fp16compoptdis = false;
+	bool yuvnotcomptofc = false, min_acc_len_64b = false;
+	bool rgb565_predicator = false, amsbc = false;
+	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
+	u32 ubwc_version = cfg->ubwc_enc_version;
+	u32 hbb, hbb_hi, hbb_lo, mode = 1;
+	u8 uavflagprd_inv = 2;
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
+	/*
+	 * We subtract 13 from the highest bank bit (13 is the minimum value
+	 * allowed by hw) and write the lowest two bits of the remaining value
+	 * as hbb_lo and the one above it as hbb_hi to the hardware.
+	 */
+	WARN_ON(cfg->highest_bank_bit < 13);
+	hbb = cfg->highest_bank_bit - 13;
+	hbb_hi = hbb >> 2;
+	hbb_lo = hbb & 3;
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
+	a8xx_aperture_clear(gpu);
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
+static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
+	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
+	unsigned int pipe_id, i;
+	unsigned long flags;
+
+	for (pipe_id = PIPE_NONE; pipe_id <= PIPE_DDE_BV; pipe_id++) {
+		/* We don't have support for LPAC yet */
+		if (pipe_id == PIPE_LPAC)
+			continue;
+
+		a8xx_aperture_acquire(gpu, pipe_id, &flags);
+
+		for (i = 0; regs[i].offset; i++) {
+			if (!(BIT(pipe_id) & regs[i].pipe))
+				continue;
+
+			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
+				*gmem_protect = regs[i].value;
+
+			gpu_write(gpu, regs[i].offset, regs[i].value);
+		}
+
+		a8xx_aperture_release(gpu, flags);
+	}
+
+	a8xx_aperture_clear(gpu);
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
+	a6xx_flush(gpu, ring);
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
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_VBIFRESPCLIENT| \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_VBIFRESPTYPE | \
+	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_VBIFRESPREAD | \
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
+	ret = a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+	if (ret)
+		return ret;
+
+	/* Clear the cached value to force aperture configuration next time */
+	a6xx_gpu->cached_aperture = UINT_MAX;
+	a8xx_aperture_clear(gpu);
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
+	gpu_write(gpu, REG_A8XX_CP_PERFCTR_CP_SEL(0), 1);
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
+	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
+
+	a8xx_nonctxt_config(gpu, &gmem_protect);
+
+	/* Enable fault detection */
+	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
+	gpu_write(gpu, REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL, BIT(30));
+
+	/* Set up the CX GMU counter 0 to count busy ticks */
+	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_MASK, 0xff000000);
+
+	/* Enable the power counter */
+	gmu_rmw(gmu, REG_A8XX_GMU_CX_GMU_POWER_COUNTER_SELECT_XOCLK_0, 0xff, BIT(5));
+	gmu_write(gmu, REG_A8XX_GMU_CX_GMU_POWER_COUNTER_ENABLE, 1);
+
+	/* Protect registers from the CP */
+	a8xx_set_cp_protect(gpu);
+
+	/* Enable the GMEM save/restore feature for preemption */
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 1);
+
+	for (pipe_id = PIPE_BR; pipe_id <= PIPE_DDE_BV; pipe_id++) {
+		u32 apriv_mask = A8XX_APRIV_MASK;
+		unsigned long flags;
+
+		if (pipe_id == PIPE_LPAC)
+			continue;
+
+		if (pipe_id == PIPE_BR)
+			apriv_mask = A8XX_BR_APRIV_MASK;
+
+		a8xx_aperture_acquire(gpu, pipe_id, &flags);
+		gpu_write(gpu, REG_A8XX_CP_APRIV_CNTL_PIPE, apriv_mask);
+		gpu_write(gpu, REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE,
+				A8XX_CP_INTERRUPT_STATUS_MASK_PIPE);
+		gpu_write(gpu, REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE,
+				A8XX_CP_HW_FAULT_STATUS_MASK_PIPE);
+		a8xx_aperture_release(gpu, flags);
+	}
+
+	a8xx_aperture_clear(gpu);
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
+	ret = a6xx_zap_shader_init(gpu);
+	if (!ret) {
+		OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
+		OUT_RING(gpu->rb[0], 0x00000000);
+
+		a6xx_flush(gpu, gpu->rb[0]);
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
+	a8xx_aperture_clear(gpu);
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
+	DRM_DEV_INFO(&gpu->pdev->dev, "status:   %08x\n", gpu_read(gpu, REG_A8XX_RBBM_STATUS));
+	adreno_dump(gpu);
+}
+
+void a8xx_recover(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	int active_submits;
+
+	adreno_dump_info(gpu);
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
+	u32 status = gpu_read(gpu, REG_A8XX_CP_INTERRUPT_STATUS_GLOBAL);
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	u32 slice = a8xx_get_first_slice(a6xx_gpu);
+	u32 hw_fault_mask = GENMASK(6, 0);
+	u32 sw_fault_mask = GENMASK(22, 16);
+	u32 pipe = 0;
+
+	dev_err_ratelimited(&gpu->pdev->dev, "CP Fault Global INT status: 0x%x\n", status);
+
+	if (status & (A8XX_CP_GLOBAL_INT_MASK_HWFAULTBR |
+		      A8XX_CP_GLOBAL_INT_MASK_SWFAULTBR))
+		pipe |= BIT(PIPE_BR);
+
+	if (status & (A8XX_CP_GLOBAL_INT_MASK_HWFAULTBV |
+		      A8XX_CP_GLOBAL_INT_MASK_SWFAULTBV))
+		pipe |= BIT(PIPE_BV);
+
+	if (!pipe) {
+		dev_err_ratelimited(&gpu->pdev->dev, "CP Fault Unknown pipe\n");
+		goto out;
+	}
+
+	for (unsigned int pipe_id = PIPE_NONE; pipe_id <= PIPE_DDE_BV; pipe_id++) {
+		if (!(BIT(pipe_id) & pipe))
+			continue;
+
+		if (hw_fault_mask & status) {
+			status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
+					REG_A8XX_CP_HW_FAULT_STATUS_PIPE);
+			dev_err_ratelimited(&gpu->pdev->dev,
+					"CP HW FAULT pipe: %u status: 0x%x\n", pipe_id, status);
+		}
+
+		if (sw_fault_mask & status) {
+			status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
+					REG_A8XX_CP_INTERRUPT_STATUS_PIPE);
+			dev_err_ratelimited(&gpu->pdev->dev,
+					"CP SW FAULT pipe: %u status: 0x%x\n", pipe_id, status);
+
+			if (status & BIT(8)) {
+				a8xx_write_pipe(gpu, pipe_id, REG_A8XX_CP_SQE_STAT_ADDR_PIPE, 1);
+				status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
+						REG_A8XX_CP_SQE_STAT_DATA_PIPE);
+				dev_err_ratelimited(&gpu->pdev->dev,
+						"CP Opcode error, opcode=0x%x\n", status);
+			}
+
+			if (status & BIT(10)) {
+				status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
+						REG_A8XX_CP_PROTECT_STATUS_PIPE);
+				dev_err_ratelimited(&gpu->pdev->dev,
+						"CP REG PROTECT error, status=0x%x\n", status);
+			}
+		}
+	}
+
+out:
+	/* Turn off interrupts to avoid triggering recovery again */
+	a8xx_aperture_clear(gpu);
+	gpu_write(gpu, REG_A8XX_CP_INTERRUPT_STATUS_MASK_GLOBAL, 0);
+	gpu_write(gpu, REG_A8XX_RBBM_INT_0_MASK, 0);
+
+	kthread_queue_work(gpu->worker, &gpu->recover_work);
+}
+
+static u32 gpu_periph_read(struct msm_gpu *gpu, u32 dbg_offset)
+{
+	gpu_write(gpu, REG_A8XX_CP_SQE_UCODE_DBG_ADDR_PIPE, dbg_offset);
+
+	return gpu_read(gpu, REG_A8XX_CP_SQE_UCODE_DBG_DATA_PIPE);
+}
+
+static u64 gpu_periph_read64(struct msm_gpu *gpu, u32 dbg_offset)
+{
+	u64 lo, hi;
+
+	lo = gpu_periph_read(gpu, dbg_offset);
+	hi = gpu_periph_read(gpu, dbg_offset + 1);
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
+	unsigned long flags;
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
+	DRM_DEV_ERROR(&gpu->pdev->dev,
+		"gpu fault ring %d fence %x status %8.8X gfx_status %8.8X\n",
+		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
+		gpu_read(gpu, REG_A8XX_RBBM_STATUS), gpu_read(gpu, REG_A8XX_RBBM_GFX_STATUS));
+
+	a8xx_aperture_acquire(gpu, PIPE_BR, &flags);
+
+	DRM_DEV_ERROR(&gpu->pdev->dev,
+		"BR: status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x ib3 %16.16llX/%4.4x\n",
+		gpu_read(gpu, REG_A8XX_RBBM_GFX_BR_STATUS),
+		gpu_read(gpu, REG_A6XX_CP_RB_RPTR),
+		gpu_read(gpu, REG_A6XX_CP_RB_WPTR),
+		gpu_periph_read64(gpu, CP_PERIPH_IB1_BASE_LO),
+		gpu_periph_read(gpu, CP_PERIPH_IB1_OFFSET),
+		gpu_periph_read64(gpu, CP_PERIPH_IB2_BASE_LO),
+		gpu_periph_read(gpu, CP_PERIPH_IB2_OFFSET),
+		gpu_periph_read64(gpu, CP_PERIPH_IB3_BASE_LO),
+		gpu_periph_read(gpu, CP_PERIPH_IB3_OFFSET));
+
+	a8xx_aperture_release(gpu, flags);
+	a8xx_aperture_acquire(gpu, PIPE_BV, &flags);
+
+	DRM_DEV_ERROR(&gpu->pdev->dev,
+		"BV: status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x ib3 %16.16llX/%4.4x\n",
+		gpu_read(gpu, REG_A8XX_RBBM_GFX_BV_STATUS),
+		gpu_read(gpu, REG_A8XX_CP_RB_RPTR_BV),
+		gpu_read(gpu, REG_A6XX_CP_RB_WPTR),
+		gpu_periph_read64(gpu, CP_PERIPH_IB1_BASE_LO),
+		gpu_periph_read(gpu, CP_PERIPH_IB1_OFFSET),
+		gpu_periph_read64(gpu, CP_PERIPH_IB2_BASE_LO),
+		gpu_periph_read(gpu, CP_PERIPH_IB2_OFFSET),
+		gpu_periph_read64(gpu, CP_PERIPH_IB3_BASE_LO),
+		gpu_periph_read(gpu, CP_PERIPH_IB3_OFFSET));
+
+	a8xx_aperture_release(gpu, flags);
+	a8xx_aperture_clear(gpu);
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
+				"CP | AHB bus error RL_ERROR_0: %x, RL_ERROR_1: %x\n", rl0, rl1);
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
index 99334deda522..155d58751ba3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -88,6 +88,13 @@ struct adreno_reglist {
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
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index 5dce7934056d..c4e00b1263cd 100644
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

