Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAE7A9D237
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3E210E9B8;
	Fri, 25 Apr 2025 19:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/xbVFMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9847510E9B8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:15 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJu3s024751
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s27H/MGZip346GLJXyEl0+hPEUbbSGTNw9RexNbP/zQ=; b=Y/xbVFMrbGwRmCF7
 wsmRYa+s8c1mZEndO+IXcEW51fj4TW23Nh77+FlDnY0WnRAnaDKqSqoDT1QLOnWx
 njc6Ve/1kObt1zogdkRLg1JUHrX5iOpiIdSfpcqzxfe3AC5gtw+qyOKl/KS/fB3E
 /wVMeAijvzxVND5UUPO3p2QHE4VDnWDdiWmT6Ia+/XbH+9izxxdy+0RSL/oPRR6D
 sANFfxbljs5konwVHd5kOSPX6T4U8+oUxm99t0MGfZOrOeAnxVcHGE0eDQpwN/tj
 TPCiu5wpItqNY5wpLK9TIjudY+nu9WtvhEN01Kvp0Fy8QHfFJ8RLMojURHBk6BF8
 x8ciEQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0t0wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e905e89798so50498656d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745610554; x=1746215354;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s27H/MGZip346GLJXyEl0+hPEUbbSGTNw9RexNbP/zQ=;
 b=oi3uMEku/VEv8s1WG71I6uAlr/zB5rbAMDnQX7pT/ocFh4kk/jrHiHXjVdlDIMD5QR
 DAFR5qcHUV47FyFNGMkWsMAGnH/AhTGYenmeV8Kyj5O1KltHgp2P4cJ/fxCM2nnchi8Y
 /XwwfG6apr1zvKY6lkZ1kqx760ci96gcwO3qYkq8Ae5SVVkhtBKMfeZA8MMT8H2w+105
 OVsjHzOH9r0ykBjiqVp9b1zf1upmenmCUcJtZNzHhVi0jTgYCyEKffwNWfH2s2Ef+DWy
 bKCF7LahusXjxRt5M7Dpps1MNXEz6fYnmUk3EXh0sJk6wy/vMMdkrC5rR2p2Kuzsg36I
 P01g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLTSd1b12EBVl4Fw2doDFjUuT9kq0IYwGJF3tSOnkVGQZCYhJF/4OvGFRgopIdsGMqE0UztGPGHb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx61KA/tk5pp/5QQ8pkdu4jCFybolRyBGnrV789gPNBvCKYG/Xg
 /VvmS1p7P4l0uJxqxAB3I8LsUA0d0EkMijbKUHbyo0nvHExV7baQR+8jQit9wZ/KIrDeq/UacgY
 yEMYonxyGbY9K/v1CFEGXSc/5QN2cfOkx5ZGzGqaASJgBVRH+/nWjy1HZ7P0pSg/tmMI=
X-Gm-Gg: ASbGncuXmANaVaXpDBMPMbeq31AhAnLfsaVT/3fbqFWrMPd/k2ToEvJa+vnTIUjWSAL
 roKb2LhZnIH3C0SrgfhwRZWkxkTmDoks3NwTrTCzjcEjIqaoU8m8Qa3bZPkpF3ZHLOmoxMxlUEM
 TCkCmoqWK2fTcjQ9rZmxQcAxSC9+JoAoD2WTj/OWdbmdD7ae7Sn/whYJBbx/EtlO8sqFf91pibI
 gpcYdmgSrs9BcRwk3MZhVxNrP1sPFcoEfhw2v7BAdJtA+/6IJw390uTXsILswefJRjSc9EJT+dt
 oFRZXPli4AQp8LOARCtDasPOEo33eBQYljbyLhuwsn13PPiJId21IbLAXkYoBppomfhiWtL6p6X
 eikPftstFK4SD2Kp0YWTXYdfP
X-Received: by 2002:a05:6214:1941:b0:6e8:f166:b19e with SMTP id
 6a1803df08f44-6f4cb9d675bmr56063616d6.17.1745610553723; 
 Fri, 25 Apr 2025 12:49:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIlmd7nFIFgnLBspjDQVkgY90tTtUd8k3ohF7W9+HxepEi1M8QeYnlT7judZ4HqN7C5lnMEA==
X-Received: by 2002:a05:6214:1941:b0:6e8:f166:b19e with SMTP id
 6a1803df08f44-6f4cb9d675bmr56063336d6.17.1745610553327; 
 Fri, 25 Apr 2025 12:49:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:49:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:08 +0300
Subject: [PATCH v2 1/5] drm/msm/dpu: enable SmartDMA on SM8150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-1-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3187;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=C2f4NUqFP0JePGsYgv6HQ3zhP0uNZ8tppCfOQ3zdVxY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwb3c9NvmqV2SRvN49/qMkazLRa+zVF7ntcxJDJ/5WKzP
 xWO5053MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAitxM5GJpSzmcHRb/7GFMZ
 qjXzgy57tthxk5yaun0bOf7n+CqYTHrK1c1kfWLRkcbFyiv1tt9gW/2HYXmokWiEbOOSS/xdx+6
 xBJ7mkHyWya+3a4rxytZyyUybc7OTL+7+L7OfzUjPYs3+3+9s7ET2vvqbaMeUVz7P+uQ177m2sp
 X8mW2hJh0fvHh/iIUV+VpeSFyjO13G7+CD18USfPpLnjP93mvHULZVNHLyXUmR/qJJ/hayJ93Wb
 N8U/OqEHf+uzZu8ddP1V8p3CxqfNWVSrtnLeLVySu4k/9r6Qw1yE9Tkru3t4pVNvuR4qd+u7Hr7
 d/Os/99/xn6qEZeJmSuXbVNi1+r1RP5+2RGPImOb3K8A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 42mClnVm7GriGk_Cz7oF_iadgQvSdO-L
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680be73a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=1PPYqbpFttJoYAmrjxEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 42mClnVm7GriGk_Cz7oF_iadgQvSdO-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfXxTOE2KOoBeRS
 1AoFCZf0pngMqb+gkyail6r6J52nLdisUq+Fz9eSdka4ljCnhrNBnnD93mgmTXugvNnc/aJlj3o
 qDx/S04QvO9LO9taTH7OI0VwUScFury6mfK/wuSQ4VIgqyhylJPCXCjoZaF1oK3Tgwk4NRZG6Ed
 VLoemzgF9ScUXX6Am3o1tubBK78LDomLPGvomYVq4mBEvDlFmq+C++QoW648m13ENa3UpWnOXWc
 Prai3waXoOdrlhvBvuBOaYUy+HvK0bW4usJtza/RdH6TBbNLlrQDrqxEkLqGzAytzxn+V8UmKvx
 9Y4PTB8NmzROAqMR1Y755vxPWzCQlnlEsLv5jlM4Exv8k6vNTgsN243oB8sW/dKKUr6rLosneDl
 ER6BfSlnXZbVMho7zRuTmSAd77EQwh4TGoArDDP8IEfVEdmPWrD9U206MvLAvpsKEWCCcGHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=971 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141
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

Reworking of the catalog dropped the SmartDMA feature bit on the SM8150
platform. Renable SmartDMA support on this SoC.

Fixes: 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 979527d98fbcb19c33ccb45b5ba4716031949985..8e23dbfeef35432348c86544e825aefa54d476aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5

