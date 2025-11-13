Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E606C5A974
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEFB10E979;
	Thu, 13 Nov 2025 23:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mw1OiDK8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f3EgLFB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DF810E977
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:33 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMax9i1614442
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QDjAMzX1/GGw5QnIGM//3FYMijCaV+ej1ziddao90JE=; b=Mw1OiDK8Pb6bZsSH
 U48pTdy7ZWEep5GJH9OoWz9Hpxw2o+SrVtEoP8ZRtlXT29kz96EScAXt9JJiJI5F
 JVdLi5ep4JNn95nwAchEfJV7F0+Ep2XmrKSqdNNpWdj8vys2fqAQe9EelG+YuFeI
 VYY6U02sQkmLbQzM4165psOQDZFwotTZhm2wiWEddV6XbWAy1kqVoWlbPdtJm6n5
 CZrgEbCC3QlKd8+T3YrCr5npm9pXgCuKZ73KsYoegpRq4LD/+JYzVIUGVKaF1p7c
 twUP2t5ls0dTnHTJFpCh6SQeal6vQOOdWGdeiuO5+LPqqKooGN6dFiVGXhOzU9Dk
 G+JSRg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h044e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:31:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-295fbc7d4abso12944665ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076691; x=1763681491;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QDjAMzX1/GGw5QnIGM//3FYMijCaV+ej1ziddao90JE=;
 b=f3EgLFB4LcVkzoK4Q0jnOb0N+eLKg3awTYu1CWdN1IFQV+97QQdWgjFGcr3zucn5xn
 OtZwA27PC0eOF5d/0BAcnri+ADW+6OI27NjP8e5lYxP/PsVeEaxkvAJFUFHSFvqpAyqd
 fbXKrWLUdohamVZTABH+6JYHa3YjD2JyK1yrGbuHPfQkZbyutnJdHV4mK9oK74VE417K
 f+xW5TVyOFK/nG7PJ+Q3o9HQloWgPEwLeGjOW55rnniKD7x27zkgrAuTRI7rCztOh86i
 CJqc2S4wCLtGyvS5u3WObeGOanR7YVS00EFfNOaXIJM7sBigNZ5w1sbb5YinhiUyXUbE
 XthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076691; x=1763681491;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QDjAMzX1/GGw5QnIGM//3FYMijCaV+ej1ziddao90JE=;
 b=cHP66vh0lwMiWOdkkkE5FvjyYitvMae5kcZDzwc0efJvjwLTYpVEMst114Ge5bJbLG
 GEv04HpZDx6BGd40xnkETRmBC9we2L/nxyVRQC3yoFz36PMq+bOSVPT1VNvxsrKBUxaU
 ssC3fjK/fwvGI+DgY1GL5RFoP7Z7m8O7X4/0XHh7OI67fhgWAP9qHiSAzgyPj4KLcuYp
 ZbwqUAunXlGJ6HB93+Nzvk7gYzHUBr8an9CrH/jlPgmu44Vwt/t9vfxGNLrT6xKs/H+y
 0OORykJc6FRhc+ujaRv2Vx7RVhZoS2ynWHL1jlzgVfB4+HDE2N+0zlLEq9uEPWmrVAQm
 4uNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu2IKmmcx9+k8Nsno6XoHzoxZCBvEkPFonoHoZly8jJr0fXXg0uv3MBOs7wEbwgt0UmmqRzMqgrmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIDbW70p3lGgPPMQB/0+SRwbkq00r/ZGaSuKNwE63ASY+Er+ey
 9HWtXtXMclQRk8smbJ2bKmOUT/pkSeFc4dTKNX4tMvpVBJ+EhrObf7p2AyLvHDo8geSeC6g+Ezq
 IPWDK0cLD/KbFmTbuL/G9x4u1Yv1eEI5tJVJX9SGDekvE3ukkQdXAfQxkOBgOCQZOSqRkaxk=
X-Gm-Gg: ASbGncu8BIz+sQa72yDrwMvZcKLJjKj+HcTDC8XHjFRKos3upskfwwE9jME0efHMMPv
 k0d1Luxv1pY1YCqEE2kJR778W+T3xixl3xmG+Yx72Kn419o4WOxbkKYM5HDMpb1TwQgFX9LWSBm
 EHEmqROFglmeyh2D1LweT+EDr/zVf7UGGOuFyI4LqM3JD360VoZZAozW8KpR+MHeaVgw4/INrjU
 wY1vOWAhohZNvYS3QNRqiwINkjuNmiegQ9OuuWJdsvBbJC+go1ky0KCJbrhKD0gyu4EBzaoAbOM
 p+eoO0To921gmsd2ml8a/cADtzTX62asSkSEtUT492zn2ySmfZps9DeF1cRggMTrviNjnRF0LBM
 RKufrPLEBCZCKneVBGijB1gs=
X-Received: by 2002:a17:903:196b:b0:267:f7bc:673c with SMTP id
 d9443c01a7336-2986a752a74mr7180425ad.44.1763076691211; 
 Thu, 13 Nov 2025 15:31:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEv4VMp31p4xpUkl+cBSArUnMXmzuRTp0dA9/uwzoA+kOnP7j0EiVv6LoBQ7lgxDaAp9pqADQ==
X-Received: by 2002:a17:903:196b:b0:267:f7bc:673c with SMTP id
 d9443c01a7336-2986a752a74mr7179955ad.44.1763076690622; 
 Thu, 13 Nov 2025 15:31:30 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:31:30 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:11 +0530
Subject: [PATCH v3 14/20] drm/msm/adreno: Support AQE engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-14-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=3021;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vDNLN4cN0PzKe93m1lQLnQLp8oN4RHAbHPt0ChRj+xE=;
 b=oJOTsEuxiDw0mQjFV7awI5cZuJCQsXd3sW7WigV/GBEJYyROma0U3lQegB886iKXDxyIF1K3o
 IWStbmFNJp/AvJ5rOnPtVqvIVQxAAU8dt6hkQjz5F8562Nh4A9cfeCw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: byXlkL3FgAYgjTvnBR1C7O5e83Rvbuo5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX5L2bdJS8g5BQ
 Jj2WpQYivw/AyyTsWFXOBCVVR288cBFNkuryWvEfSElZvNUvXzj22O6k0hTgUy5MNB80IWOjZiH
 Hhd8hBy5a+q58N1t0zxNfz176+TyJtot82hKazGYmDpCq3MpIYkJ8BXRgpVTOjoGLXainOfuO/W
 3Kc54aku2Hty8AREPF8HRydjnrPRxY/fsroDgP68lAusTsQUZdDlvWG5YVEoEJtVn7Bnp2NkbbI
 tAUuNQm3FQLL2m9sMQbNzWUlrpDcM1A4opaNlZ0Ch0AGvuMJXZeKJqchxefW14BqH5ozKKjItBM
 rloBkuVyvg2p9LDdJOql7KeeGC4i43LaMBUGm0PDI3d/QIIe0POsiRvbyq9MDGyQCC+Ya05FEjd
 1hiZ9e26aEkA8n/pTUImQKUzEjR6qA==
X-Proofpoint-GUID: byXlkL3FgAYgjTvnBR1C7O5e83Rvbuo5
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=69166a54 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rHWH_X82z2bqsOHW_PQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
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

AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
in Raytracing related workloads. Add support for loading the AQE firmware
and initialize the necessary registers.

Since AQE engine has dependency on preemption context records, expose
Raytracing support to userspace only when preemption is enabled.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 17 +++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 4 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 20dbdad6e2e8..ef79f4cfb80b 100644
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
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e6218b0b9732..3a054fcdeb4a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -59,6 +59,8 @@ struct a6xx_gpu {
 
 	struct drm_gem_object *sqe_bo;
 	uint64_t sqe_iova;
+	struct drm_gem_object *aqe_bo;
+	uint64_t aqe_iova;
 
 	struct msm_ringbuffer *cur_ring;
 	struct msm_ringbuffer *next_ring;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index cf11135f46d3..78b38b52da91 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -631,6 +631,9 @@ static int hw_init(struct msm_gpu *gpu)
 		goto out;
 
 	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
+	if (a6xx_gpu->aqe_iova)
+		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
+
 	/* Set the ringbuffer address */
 	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
 	gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 155d58751ba3..edf1f6624c31 100644
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

