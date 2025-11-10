Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA2C48082
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C7A10E497;
	Mon, 10 Nov 2025 16:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdqjNAvF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z28BFTg5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA5710E48C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:04 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAGYLV24070667
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MjiTt5ghvaBZ1ee5wBxftA1oQFTxDbd5jXrSSKPsmU8=; b=IdqjNAvFs95sCmbs
 MnnHhgwGJ8ALXcgJRJ7/Q+JVDTED6H6J9Ru/z/l40B3DoT/BduEjeDGX5YoFJj3l
 aZVc/E78gWHQiIy6y+P4kTYB6yF+Xfj1G39nzhtA8ydMKSsOwSR5/2FNFn+N2ME+
 WFKMzg434+TGrN7F5L4YPEPxp3A9gksw+S/FQFzyuECpxtisL86Zkoy/HLm1CHgt
 XWGwiRpx/G2KxiJ+ea0uofH/0ngW4Z9OpibZkHUtKD5Zld/VR7dFDapLbHpcYf2e
 80pdjbvn6Qd9/K8lgM70WdavcE1FNPriBppJgLXnX8ImY8NmP1XvHZ6D/WMEqSyi
 YZez7w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkpj80s3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-33da21394adso3436734a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792802; x=1763397602;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MjiTt5ghvaBZ1ee5wBxftA1oQFTxDbd5jXrSSKPsmU8=;
 b=Z28BFTg5YCccC4I6iBXmzkjhZECZGtMKymqnOtVqR4qxDoQj+ImXX26sfL6p49kQwp
 zLG47Yh3Kz7f+sA/ByzF0edCGnirf4vGZN5bJBprU8NrNcs9TMYRuoS0jfu0XB8+8K1Z
 tb0NW/8tXi7QscyJPbq+PopQZOncAPrxxIesu9mugVhPKpErN+qPUtaGJOKUaOz+wzHU
 8CkzyuWj2okQyaaHCfOUSS9LMZG7W47c1HCQT+qmzMIKy0GvPUkfqAQEEOz063tVtleJ
 D+XN49Hfddsf/SklkQ1asVgFT33bYh8/JhqyVhUZqRXZTyvJ66QwUP1oCWTdtRu/owjJ
 P6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792802; x=1763397602;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MjiTt5ghvaBZ1ee5wBxftA1oQFTxDbd5jXrSSKPsmU8=;
 b=j13aFGNmjck9eTx/hgUMKp22InvK/yRzzeN0QL5ouvIhFlQdtB7IfUVW6GF0UJ4eZs
 EJmPc97ebvo1bqZIDFmOJWjxWKroS/+fHAqRlByDKA24FphmQ65in1G9qSAVmD3L896w
 AA+lS/kMJcDT6IPUe8l3Va8lKJ/zCcgbM/L8+fnS6e0RUmp7BtyeXRU8pIkrlKXoKggi
 9lAM53dyceD0Qx/UmkukZ4tVHoIeeyYuFgOmj9VnBwF8Jte6LC5DBK1i6WblW7+PqUZq
 alZc7xPvpxswvRXp4Uv4CuYFp/aqxsGWKEHRdKx10JFgAaVv9fPNQk1G3MVRwSpxW0Hg
 wA8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBenkCj9n58Fl7lGd5RNtKfscEJLv3RC4HsGSvyCdaGFL8OHfAsacv7dAJHmNGNwRpQ9481ZwF2qk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyj7P+/8w66PaZbo4aLdZWVCklIdN9vIULUs/DHZqJkwAsxH4GM
 4ygzx1BD2MgQSC1w37n5MWV8mqakGnRn6kept8eXa1uPNSGUCKYxWKpNLHH2Le+Wbc/HWK/BnJh
 5bHmpzrdpEKa+OaHZBGdSqV8OoaseI9Af6G0KxNz67aEo5JXL04nuwxpZRiZo3Sm8NkcrmlPazo
 O95qg=
X-Gm-Gg: ASbGncv6mlcFg1E/XUesNrhFc1TRksnYta5krvLFGPczJej93ciD+YV5J9PxLGxIwpN
 nV2e+VznU0Exfm5mXMLRdnNtxI80imEEoEiBpBplYyG3tzhJuM0e+TzVWgSKMt5oWgvEUkiUtn8
 tBsmKpez28rvZ0qXdl5klRv8+2hkGxC77x0bbPIG9CafxeByUlk19fyQBvEtfUJ9uqJcq6QGiHk
 pUxxMV5Rm4tYqaXsYxJhUWi7dzWFxNzfKIRL6hZ0QNE/4a8cz2bd+i8z+Bl8xz+gPRMrrawApKU
 hGRdp6g9zPoIbaVaRsZIbdIr7EPx3i3rYil6WaDya5uuPcViJOljg5X2C7KhXgA4TIrAZbEJKKX
 yL3rkeaOxgQY0sGM548FG7+0=
X-Received: by 2002:a17:90a:ad97:b0:32e:9da9:3e60 with SMTP id
 98e67ed59e1d1-3436cd0f015mr8782687a91.36.1762792802467; 
 Mon, 10 Nov 2025 08:40:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8dsQiFeXCA3fQRx1qGyG/iQYXdTGCJDeJX9jjxp7LxaCPRH2dmxyXa0Klr5WF7V5Abo/lOw==
X-Received: by 2002:a17:90a:ad97:b0:32e:9da9:3e60 with SMTP id
 98e67ed59e1d1-3436cd0f015mr8782625a91.36.1762792801836; 
 Mon, 10 Nov 2025 08:40:01 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:40:01 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:20 +0530
Subject: [PATCH v2 14/21] drm/msm/adreno: Support AQE engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=3675;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qO7+Zu0jaqw1wGzwD2M4glYIIsdjEUELmwQBxl1LlAQ=;
 b=hZZOFcaPhVuWtqncNPi1IHicthjYztjO/P4SCnU7EW1A8P0x5HCdnawmFDGbHm+nWpUXFDXsl
 jCAWRGM4iwACOOTExMrXI98NF5IldyXXWJfe9aGT5YfMU1e+uh9mzI9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: dgaSLJwlyXW3PYvK1c6iAEP4-Hmu7A9E
X-Authority-Analysis: v=2.4 cv=GZoaXAXL c=1 sm=1 tr=0 ts=69121563 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=o4z2bafxGXL3rZEXBYUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: dgaSLJwlyXW3PYvK1c6iAEP4-Hmu7A9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzOSBTYWx0ZWRfX+5SuF3MqSt5k
 05nzlZ19DBsfVgQpUs4PcbSLg90z5VecCwN1IqJ7ULWPEW+elnLVmc0UMBa4oAbM65KSPAv0Ao2
 WZiizKv/F3PYmZbWevDDCTavDkEF+x40+IFo25UNFeVnag29O0+ZYTzeMFUqrkVahkiOe/yYaqD
 /h05rnQjXCqXnrKRlplphAxMmUpZrtzyrEdmxCeGwQ7YiWIDYv7ZqYcFADaEnRlAg3h278ZpBWs
 fOx++q0NOPOYAItNP0+zT6ZDhbaRrEqRbaEr5/nU2cPQvgSBKeea1GtW+Mw6csYFLTS8Mxtaif1
 pNsitrJrnUPJJGS6g3evZxhncxqIiIcvDI2/P9rE1FhH/PlX2v8uN3lbBXtGuPj17IUlHYE5zJs
 2JssieEqvrwMItlQR5X40KGlxv4Mhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100139
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

AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
in Raytracing related workloads. Add support for loading the AQE firmware
and initialize the necessary registers.

Since AQE engine has dependency on preemption context records, expose
Raytracing support to userspace only when preemption is enabled.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 836100047be3..029f7bd25baf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1104,6 +1104,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 		}
 	}
 
+	if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
+		a6xx_gpu->aqe_bo = adreno_fw_create_bo(gpu,
+			adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iova);
+
+		if (IS_ERR(a6xx_gpu->aqe_bo)) {
+			int ret = PTR_ERR(a6xx_gpu->aqe_bo);
+
+			a6xx_gpu->aqe_bo = NULL;
+			DRM_DEV_ERROR(&gpu->pdev->dev,
+				"Could not allocate AQE ucode: %d\n", ret);
+
+			return ret;
+		}
+
+		msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");
+	}
+
 	/*
 	 * Expanded APRIV and targets that support WHERE_AM_I both need a
 	 * privileged buffer to store the RPTR shadow
@@ -2132,8 +2149,13 @@ static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
 		 */
 		fuse_val = a6xx_llc_read(a6xx_gpu,
 					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
-		adreno_gpu->has_ray_tracing =
-			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
+		/*
+		 * AQE requires preemption records, so disable raytracing
+		 * if preemption is not supported
+		 */
+		if (gpu->nr_rings == 1)
+			adreno_gpu->has_ray_tracing =
+				!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
 	} else if (adreno_is_a740(adreno_gpu)) {
 		/* Raytracing is always enabled on a740 */
 		adreno_gpu->has_ray_tracing = true;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index b507ff4e1756..7921b4a68937 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -58,6 +58,8 @@ struct a6xx_gpu {
 
 	struct drm_gem_object *sqe_bo;
 	uint64_t sqe_iova;
+	struct drm_gem_object *aqe_bo;
+	uint64_t aqe_iova;
 
 	struct msm_ringbuffer *cur_ring;
 	struct msm_ringbuffer *next_ring;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 78dcb9bc3377..2ef69161f1d0 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -616,6 +616,9 @@ static int hw_init(struct msm_gpu *gpu)
 		goto out;
 
 	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
+	if (a6xx_gpu->aqe_iova)
+		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
+
 	/* Set the ringbuffer address */
 	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
 	gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 17863c3287f5..4c0d9024d497 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -27,6 +27,7 @@ enum {
 	ADRENO_FW_PFP = 1,
 	ADRENO_FW_GMU = 1, /* a6xx */
 	ADRENO_FW_GPMU = 2,
+	ADRENO_FW_AQE = 3,
 	ADRENO_FW_MAX,
 };
 

-- 
2.51.0

