Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A03BAB8C2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A54B10E4FB;
	Tue, 30 Sep 2025 05:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAV7uH23";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6311710E4FB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:29 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HODB020320
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yHVWQgivHCXrZ9M8uGFVIHrAnFmQ5qwiXm6mKkCDIMY=; b=TAV7uH23a0X9+pMm
 j522lDgUxUq7wJ/C/aCd3OCuChtVXY7ae93MKRrNQjPlCSaagAwM/qZMT7j3wGKt
 sYPNHHgaHXyXdUqlkrXN5u4R2BNYmrbFM2pKNIoLX0dnqJ8CXcRvde5ikG8Qo/OS
 m0MUXLrG7tybTptvGRdflycRESaEEXYlu6IMGLwxREa5929qUJAmccFdHwSDG2aR
 IwJGzZu6b+OWuRi4ZnsXTghLJsFIr1t+vFgQZS9wJDvSGg82uTKTGEGyafjlcGoA
 zy4YExbB2ZvHr/WPI69S/C9uNDi0F9je5U4YdkjKCe5VoNKjz7wi9kqF8XPyCOe1
 599AsA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5qusc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-32eb18b5659so5125644a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 22:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211487; x=1759816287;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yHVWQgivHCXrZ9M8uGFVIHrAnFmQ5qwiXm6mKkCDIMY=;
 b=D+mJLd3nBUx+2FqKYv69XeDRTDbazlpZqLFJkoQ/mPB92AoUTJUTTmcGhWsVLr7pTF
 PeKKx7CAnWR7KyMqpIXcSrMUvSGY8fbPBkwgR1d3jcGxGdW1x3mKXd6bsmKSiYPEWBVJ
 iwPZf+iIfF6i9Z+ciZkrz/9UvYghmrrdv8oBHrNghnIaRjw3C+DrPKaeNU/ShVEPsIZ1
 ait8luKe7yhgD+djuDSZ2EGepZrRH3gvCbReaI0djTfUde+JdijFZ+2V9NAHWHoJT3dj
 Gymd5TttHsmORh1HJZprW2BabCFBhCfu9lTjLmJZcfFVCZrb2tjIzT/xGsyfsQqmT2/Y
 FUZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7tkWV1d16QbsEf5m+rmmrMQcrJna+vTlDqafLDSctQtYvVLqvLBr4GjhpADA653xmdbkBpRFOHPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7QT+MYcM7KTs432Qas30Em4Zrqjiu1sMyGab1j/iShcT8A78v
 +62lES1vSFNUkpQWZ4z3mvC7n+CjklL0H9EDluChH/+4Ijwq60gRAAl53bT94kjcp5HbGXFqbcG
 pOagzOoDHSAwTHkbQH0meTG++nQqMnNLMANzsXqHlNWmEzSF21rPClbFooUwKCyUtAWqgsXk=
X-Gm-Gg: ASbGncvlk9BMLJEMdD6Oi6ifUqr1uAiORYuooHJ81IdvdA4NHT5mMv4x4hxSCkGh4XG
 0L4a6nR0JpErI/4aFSH+sq2auBOcUM/XLI6+hoR1XvC46vbI/er29PhBV/d6rx6VtYBrrzipLAc
 CDmEuKKcprEkjp0RRyS3+hMZ7HhubAXRCJNXfcl4wa5Un61TizWD8+RvjslL3Pi3hGuCNjmCb3Z
 0FliX8y9rBndofg0e/ya7NkOmV86FLlWn/Vc5tgqKcFLSjsgL2X+SCzgxxp8C3Jy+lKDWXJoHgl
 HMuZV7uwN26GTRaYw2m+xxMBho6CupcxrNa0h9a2e+u/bJ5b12JQ0aJwhgmrsS+gKnB7HA==
X-Received: by 2002:a17:90b:4b08:b0:335:2934:e217 with SMTP id
 98e67ed59e1d1-3352934e299mr19079944a91.10.1759211487005; 
 Mon, 29 Sep 2025 22:51:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE/k7f60BL5kPXWu/p+Kyf9X6B9zbpppZnzTZrTcqssp8ghvUmW2fbcKtNdBLk2/1QnDJsTg==
X-Received: by 2002:a17:90b:4b08:b0:335:2934:e217 with SMTP id
 98e67ed59e1d1-3352934e299mr19079886a91.10.1759211486212; 
 Mon, 29 Sep 2025 22:51:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:51:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:18 +0530
Subject: [PATCH 13/17] drm/msm/adreno: Support AQE engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-13-73530b0700ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=3332;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2+6nofdpE/MBQsML3yQ16kJSV6+5q7SScWtaiLoL5CQ=;
 b=yvifhwMKpq3SHxKoy307GwblADCBD4UTNB5ty1WYqwhm78213b4CoLaogpn+DCvjKDpO08v1v
 TgVQ8l2pN9TBTwc2SeVUQ3gCU9s/PByBmFvnhmgErqPxzWUB25NLqPP
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: gIzHRq-c62BnECftIASt_5GEABZ4uc7X
X-Proofpoint-ORIG-GUID: gIzHRq-c62BnECftIASt_5GEABZ4uc7X
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68db6fe0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qCSIj6eo76QuOecuVwMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX34LjJuQLiJlq
 uuSPIt6gArsOUw6gwpHMErEujWtMolK7UQZ27zB6LNjTh/7cv0efDwzRbCyxWZpAVfDbkv4xLTn
 ERllb1gJkTGiWdaoiAX5azhbU3YJMj406ERXUrKV0Tx+8Agdu2ddQ++4jSRgh5JhVUes/2d7ZXW
 JyrVXFeNVwjWsYl4zRbwdPIQMHi11Bhd4J/1H7XQIMcSi30BiGqniObcIDb6ZklssYlxepOGVhZ
 c7Fd9+MsX2E8lP558PL6jGGueozX13gvxZ5YZWcyBzvODLUxqmyX0L6Zhc0TA6QjikDDTmxk7vT
 y0OhGs/DxmroHzSWk5Apj5Nx/MEQ/RH/3GSuAlLAeOJJSQydFUwwvlyQ4vn/nTtDQRrUjJyGbNe
 kRf2BN4rg9JJk/T7rBXZ2nl6L6IeiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
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

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 4 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4aeeaceb1fb30a9d68ac636c14249e3853ef73ac..07ac5be9d0bccf4d2345eb76b08851a94187e861 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1093,6 +1093,30 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
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
+		if (!a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->aqe_bo)) {
+			msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
+			drm_gem_object_put(a6xx_gpu->aqe_bo);
+
+			a6xx_gpu->aqe_bo = NULL;
+			return -EPERM;
+		}
+	}
+
 	/*
 	 * Expanded APRIV and targets that support WHERE_AM_I both need a
 	 * privileged buffer to store the RPTR shadow
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 18300b12bf2a8bcd5601797df0fcc7afa8943863..a6ef8381abe5dd3eb202a645bb87a3bc352df047 100644
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
index 6a64b1f96d730a46301545c52a83d62dddc6c2ff..9a09ce37687aba2f720637ec3845a25d72d2fff7 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -599,6 +599,9 @@ static int hw_init(struct msm_gpu *gpu)
 		goto out;
 
 	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
+	if (a6xx_gpu->aqe_iova)
+		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
+
 	/* Set the ringbuffer address */
 	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
 	gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6a2157f31122ba0c2f2a7005c98e3e4f1ada6acc..3de3a2cda7a1b9e6d4c32075afaadc6604e74b15 100644
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

