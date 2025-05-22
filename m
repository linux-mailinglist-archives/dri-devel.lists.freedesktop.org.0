Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83701AC1416
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F68410E816;
	Thu, 22 May 2025 19:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MiKKTW3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE7710E81D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MF2S1J000805
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WnBdNcTCPdx4Bk94ssRTBZtOGliA7Otr1yP2AfXhQ3M=; b=MiKKTW3IFTqRIL6u
 hxIkzNporil8J179hq9Ci/2agjEk/nAtvE4a7qjk70V6/tl5EOsakeEVaAlan/39
 4SGZ2A/SE/JTPmGdnl36JsRPJAwqj+IWv8NnrLuwhuB7Yl3NcCwiBd7PcK941I0H
 1zjdIaCP8b1Y8VryPCP/pkbaSUkkukCfr2CH4lxGZklGzhX7+ygT7mIr5TLG835l
 8F52H6qPcuqozw2yWKJOam+r7iS4/5lJfND1y8pGOmNsD55e6tG8vJ2bfPiyhAv/
 2YrpdWvnvcNy8u/Ic5kjewQZ3UpYoGvb8XgtYH1opQH07wPdyyaPG/N+0jYmodiL
 elRsHQ==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tntkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:46 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3db86cfe6d2so94763835ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940684; x=1748545484;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WnBdNcTCPdx4Bk94ssRTBZtOGliA7Otr1yP2AfXhQ3M=;
 b=GhLq7f5j+CbnBCEbuBnPOtL05omiqNaHbkaUx0llfjyblIJEGlxN8u6zDmGY9sU+G7
 x5kivDr5MJrHyoi2C47xg5LKP4C/Hi17QZ7bvDLiQ/StK4TBH3ldBdUmrzg42mREGdQH
 QOQmBX/kcwbf5kx8xFzigKiB5nee8IZXHdaZDnNnvBQpqdhhBed2KYUThAT+9mYMAXsJ
 SLsz0Ly9Vbsa/sHSseJZs2qnt3DoqofGkxeDjgHAFEoU5aWEaLrS4vR2YDaefNlVdGH+
 5dDJryujSM0uuA4cZ81pbEs/fRZCQEMwWZLL2YH2g6sHITIuzjqT0YWk5b6kYBq6hLB+
 g1xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdC3XW73UVoxjEuT3KLnNuQIugzKfV63f2Dn0g9T6175kB3k/9xe+tYqsmVrCOwuN6wQn+dB/xRO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvKV7BTVLkTxLA7iNrMnCNuEOEIfkx3sC8P0Jsp6TYnaXiupZg
 +1Sx5BGGV6iehZ82ysdC+hi/ZlWix4vfahbn3vIGHIxJ0MwCXSdF2VKH7yB1Qc7H/knf7d0Qxzb
 w97c5SjHARsBUcWkpbo9bu3vJQMbHKVTx8ZqttqGugUuOHRTkZLKDPqI+tDq2/UL/w36oGQ0=
X-Gm-Gg: ASbGncvB8SFvFudOxIeL971HuOS1gG6XsnLKZaVNiqBv7O4qD/ZoAzrlsOLQJAeo/Ie
 /ptrr7R3B4Jp2DxcHaLMRH0JrJVFkG/m5cckxFt4fN2u2F3h8aQDGWjKezlmdek7UIzMRUNUWIR
 8B7+OgP4wgj7qMg9xVLMmJt7z20lTwAXVBcpbKruDiw+velV2rQDj5P39y+KQsDvKT2drQCyQ5g
 RKdzhtvQ0bYEbaM5gGyDIWo0N/UuGu+Bt/EzRTL1/mvSWrLa5td+7BuTcnMyhL7oWTZKlWLkvF4
 uC373hqq8xKAKIkmPXhx2E1YY+s7sI/N68ngcqb9ZYrnuVI4QV7nOZx11XVQLRPM31qXR3u+2/U
 lcv4mQ0gmI+l5FNBy+VwY1N4o
X-Received: by 2002:a05:6e02:3784:b0:3d9:6485:39f0 with SMTP id
 e9e14a558f8ab-3db842bd205mr268753865ab.9.1747940683627; 
 Thu, 22 May 2025 12:04:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkNOBCsTM2V3lYc6A6i/1k4yUpA0T1WeMwzSyHqDgUuYOJz2Wup2wkpYx2f48lx4VW2T8jJw==
X-Received: by 2002:a05:6e02:3784:b0:3d9:6485:39f0 with SMTP id
 e9e14a558f8ab-3db842bd205mr268753075ab.9.1747940682882; 
 Thu, 22 May 2025 12:04:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:42 +0300
Subject: [PATCH v5 23/30] drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-23-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14207;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2pUPR12iDS3m0TMaHz0bJCFdiC/MPlCtiYT3r9GpT0U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T/ByDcPnvvkbWYuVeCr4Q+6KVkRxsuw9dlf
 zVjdKvxzoCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/wAKCRCLPIo+Aiko
 1YESCACz4/17gptjaKpu036M7oW2RAmH+Wk3mLkJLjXRjMrmzSGqavyVje0l607Nr78nTdCpbLn
 UF95zwpueD5oH9x14YqGxnxrwlwmEPb3AGzBsHrSdatGjvevzyfQIHKfnUuKfDegAzbgU5MPhtt
 v8nj8uCYOzgA/Ly4SmUuRyeHvNZO1yG23878bIyw7xbZjRE6gJDlyxg4HWW5sOhLfXFUg8Buer7
 v7Y3zv8/1JYbkGGTpsyHKaUqZx9QXstxvADApA63apAZPskKjnrLNmkvlcnSbv9ryQP2qJb+CSk
 RmdE8POB7A3ivl5kzD5xCaLzo5HiK9/BtXXnqYpidDfi/IXZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f754e cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=NuLJBD-5AyVUfQYi_k8A:9
 a=QEXdDO2ut3YA:10 a=HaQ4K6lYObfyUnnIi04v:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oKvt7M3QDRSwpppFPI9gINFGVzTV6wz_
X-Proofpoint-GUID: oKvt7M3QDRSwpppFPI9gINFGVzTV6wz_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX4a+zAQffHJfZ
 ZbchwoH0tnMzRVHaAKcYnwlovKqOH0BFFsSGIbViNOnjqptECv+N+IlJ9iH1LYkDSstupoZnG8r
 vqevUUCJ4xiLLN6of0vJNVbrOP1lJmCXp3edQsAXoX4e9h6XIdxIjXL0ArjRjOeFANj6OfLfTIK
 fbg9P3XUGiAm+E0w8eqkGSxBiaagIOfXyNRAEgnROTViSRsgmYjIsH/AcINwLvDVLc/JUOhQFHO
 Qni9c63mCll7saCSaxJ5EB9wklA+FdHDUn+iCU/iKFszK9Z9llrZH6Ave87Ards9vay+cd//KOB
 XBnmwzDN3qSrEulLDoTL3poxFPRfb9UAkT8Q8fOmmBo/fp1C5z5ZcK3PIJ1byt4/1JvVYJPjnzB
 rxALZ3KreuLeV/lEW0glt5T3u8VvfsVVCGquJKKan4suZ3NZox6NKSeHrLzbjGGFKpzZM70r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220191
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DSC_HW_REV_1_2 feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 10 ++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  2 +-
 12 files changed, 21 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 9a8f6043370997cb12414c4132eb68cc73f7030a..013314b2e716a6d939393b77b0edc87170dba27b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -286,32 +286,30 @@ static const struct dpu_dsc_cfg sm8650_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
 		.base = 0x82000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_2_1", .id = DSC_5,
 		.base = 0x82000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index e81a2a02e0a6379382058fd89500cf2064a2193f..b4d41e2644349bdbdbdacbe1e9b3748f90df4f3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -263,22 +263,20 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index b0e94ccf7f83e9c3c41f1df363cb6a8c24f1503d..5d88f0261d8320a78f8d64c9bb68b938f83160a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -150,7 +150,7 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 2cf30234e45da8a7776d61c49c26abd75d070941..303d33dc7783ac91a496fa0a19860564ad0b6d5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -262,32 +262,28 @@ static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
 		.base = 0x82000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_2_1", .id = DSC_5,
 		.base = 0x82000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index dcef56683224b5715c2608b5472d2d5a0da62010..3c0728a4b37ea6af25ab64315cfe63ba6f8d2774 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -276,22 +276,20 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 5f5987d5fc602df29c5eb289823de5dd359df014..b8a1646395916fde04b9750cf548edca5729d9c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -275,32 +275,28 @@ static const struct dpu_dsc_cfg sa8775p_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
 		.base = 0x82000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_2_1", .id = DSC_5,
 		.base = 0x82000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 6f310216fbccb985308f617db20c1878e622340a..ef22a9adf43ddc9d15be5f1359ea5f6690e9f27c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -272,22 +272,20 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index ba8a2c5dc5e2b3474b295c86afbbbe8f8d416ccd..2e7d4403835353927bc85a5acd3e6c5967cac455 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -272,22 +272,20 @@ static const struct dpu_dsc_cfg sar2130p_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 77986a7bd62c1b6323482426e596e5974ba40865..ac95d46b3ecf2d95ec0d516a79567fe9c204b5f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -272,22 +272,20 @@ static const struct dpu_dsc_cfg x1e80100_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index cc17b20a7d4c15b0cd9c5dc8b9a4b78d4cb78315..01430ff90ab0988bdaa91b85458dd649aab543b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -176,13 +176,11 @@ enum {
  * DSC sub-blocks/features
  * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
  *                            the pixel output from this DSC.
- * @DPU_DSC_HW_REV_1_2        DSC block supports DSC 1.1 and 1.2
  * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
  * @DPU_DSC_MAX
  */
 enum {
 	DPU_DSC_OUTPUT_CTRL = 0x1,
-	DPU_DSC_HW_REV_1_2,
 	DPU_DSC_NATIVE_42x_EN,
 	DPU_DSC_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 80ffd46cbfe69fc90afcdc1a144fc5de7bb6af42..d478a7bce7568ab000d73467bcad91e29f049abc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1043,7 +1043,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, base,
 					    "%s", cat->dsc[i].name);
 
-		if (cat->dsc[i].features & BIT(DPU_DSC_HW_REV_1_2)) {
+		if (cat->mdss_ver->core_major_ver >= 7) {
 			struct dpu_dsc_blk enc = cat->dsc[i].sblk->enc;
 			struct dpu_dsc_blk ctl = cat->dsc[i].sblk->ctl;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7bcb1e057b143a5512aafbd640199c8f3b436527..c2a659512cb747e1dd5ed9e28534286ff8d67f4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -168,7 +168,7 @@ int dpu_rm_init(struct drm_device *dev,
 		struct dpu_hw_dsc *hw;
 		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
 
-		if (test_bit(DPU_DSC_HW_REV_1_2, &dsc->features))
+		if (cat->mdss_ver->core_major_ver >= 7)
 			hw = dpu_hw_dsc_init_1_2(dev, dsc, mmio);
 		else
 			hw = dpu_hw_dsc_init(dev, dsc, mmio);

-- 
2.39.5

