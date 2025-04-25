Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F838A9D23F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96AE10E9B6;
	Fri, 25 Apr 2025 19:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/IzE1Vg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EB110E9BB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqhw031964
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Op5Ucj3NsPaSHpQN3+W+ByQRkYYVKvbIsr+8S3UcS4U=; b=X/IzE1VgEx1CPVgX
 KlsmlWkRPhKb+bF4Mqo2rzaHWy+4ZTzJzSpGGj9sm2F4ESNqNTXBwBOavOJd6m8I
 qYlTdQIyvmBoYAyO9LM09CWzRN8k2MmhIXoyA5ukPSOdpRI90m0TaLDHk7RC/YVn
 BKWJ/4Ndg+ufu2lXe5LgAOhxWlo79ZEUB5GfszECAlmAUl/r8yRaGJidfxFElXyv
 Xs1tL+qGlnWd5lh+eGzMbFbZRKpMpHiSOOdo2l+mTIMvUjmjRLXowlVo95lNyVtL
 ZDyJOC8M7D3VqmxceSAEq4nLguqP3OC7/KyJvm7KNKRCMEa/56ps5/ql/WmN5jVM
 eKDRSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya4gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-47ae7dd6217so55846511cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745610556; x=1746215356;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Op5Ucj3NsPaSHpQN3+W+ByQRkYYVKvbIsr+8S3UcS4U=;
 b=oPYc810JltCpj0nPFGtue17ICHQS0cWdcbgFTjF6LrHaPYg5DPwhIztAeUh8EejRe+
 X8EKztIj0mxsWKPep7c6093876S03ls8681CRV0dv+Kl2CvrOk28hBtXWEg6O7ASshJv
 y/TeQfN5mewCtyOV60APVMdrCO7lwmSA+mkuS6u/jccQOOLTRPbRZ4/IKKiOqflHx1Pk
 lpsp8N4t9TBIj5xDsyv24aMClN1ygr8LqVIAAZw/t6rQyAbT705qvDYmidMxFPVDwJ/R
 5hLFXaY5p6oeW0Idx/DsN9JcGSgkHWBbK8USmKESC5DlS7sSziWDuHTIeuM7tug0oIO+
 n4CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyauto5knR9Js9/cD9WH0i2zZghUePXT+bELWfZ2tgGGXS49IPJZWQWZGh35203n95VOJVVsRHs5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK6fuNOcEMwQO+PtVoHmGiiVGLBGVFd/Wcdt5/A6HLz+2aEXO9
 PtX7lKaEegXf+MVnwgwVlJ/HTP/qpX7zqlwbm6yD8BOkuLue2tKAu9vO0YiRPzozDUNAyPcKQK0
 4YWO/kZ+tpR/nxZPxBm3wK8kZoZaa5uIFhlDHvUK8NutLvZdleIXyU+0we51+YT4LmNA=
X-Gm-Gg: ASbGncuc/bAB0KsWCrZHv+lCnovxoKswYp8FYFlJYUtG/nzzXnPtaDzGhdrtTrsFQ4a
 WMYZpw7FDXZM6drDpALQCKJaqd/ozF9Osirg5ykW2SY0rme0b5A1XGMMgPoy2LSqTAGnVE90aPL
 Qx/OMjL7eB3hc/z+zjv5LATJyuiaiNWy7ARQrxWliHSvAe6YBXJtkItH99mln6faBZYGucccI7z
 Fu/zWp8lgCpyQuBmsLcfkIowKjJaxb0Jm31Y6OyTYyc7q0vdb+bX9axVC7l443SDa7YJ1obWBFg
 SrR2QH9R024USfdzYcAoZaFRhW31fWiK7KtHFF86UDCbwwBi6T9r5VlKSxCAdipyGks3hPrG1S8
 QBGNBxAk07OPpPR+W7jSHvHna
X-Received: by 2002:ac8:5f8c:0:b0:476:9483:feaf with SMTP id
 d75a77b69052e-4801ca7cd8bmr58651861cf.19.1745610556101; 
 Fri, 25 Apr 2025 12:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvsYm+y4nGXf58l7owYH/EptT90yacYmOjG5Q/lvtKP+/y6qqRd2lf6/BRdOEXF6bTAvHKow==
X-Received: by 2002:ac8:5f8c:0:b0:476:9483:feaf with SMTP id
 d75a77b69052e-4801ca7cd8bmr58651561cf.19.1745610555757; 
 Fri, 25 Apr 2025 12:49:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:49:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:09 +0300
Subject: [PATCH v2 2/5] drm/msm/dpu: enable SmartDMA on SC8180X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-2-c71900687d08@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3199;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fFGUiM7rgjkUGAW2oQNNZ8SSmLtzgOiuFiVQLK6bnQQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c2OF+dpZ5x23AvPYZzM2MBCF3aqqk+qzvls
 wBX0P8XsxGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNgAKCRCLPIo+Aiko
 1YxaB/wM8mKWJRIVva/SbIne6SnB6a09rDJUu2XRLkcr6IYyW0u5+lvBVXrZxK2q9+UhWyT+r/M
 LfutguivISiLA9iHcQUS1g84PJVmPhYHUty+PaTu/c1P/glxccHD1jebQF02tRNUxSe/S/tiuvN
 TKtVBCxBW6jyifRgIZ0XuIBbiUYyUV/QFYMOBK6LiJmbgTxnyMmvpjWN+OmyIyda+PPlvI5mVrh
 SrVyMm7oM1aP7tbcYoda1Vkb+BcATg9UVthsb2atzf5/rQTQCQNUU1ktYFArBe/Gti4+9Xi/ZW/
 d/YLQ29ohqgzdByB3l9CN6mYuvbgImjF6iDjfb3A2YpJl8/G
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX/w8rZvCp/Gxw
 uD51+XokiwP3xDXeAnAcMXRwhNYQd4sJ06fAChqOXEYJtoR8fsI1g1BHvRJQh9Td6VrUJ2QxC0h
 ur7DecXQ2Gk4Tvei/zwnjtew+WRoklO6iM+8TjjgXFiKF84dpD62f6rOwJZSd8rkne3/L8O6CvX
 NPhVMlvFNn4hwr7EpuwOwpmPTMsez9y3mbzofeNKew0lriiYt8prVJjKUVM4QhozUJHNHWvkDgE
 3Gk+Vmcv3vdUq7OVVZ9kHbAc1c0z+fzrUF7wz0RYZ8CvXkCRgWRfnFzCIbL2/zGHpKw/YfkiRzK
 Dp5oILeKQk/F5EfUfj5jjhHzaWLFCChBslWU92/XdzoY6pTq5ZNe0u7o0VEwV/rrKUsAgkG7eLU
 g2R5J51ZoO1u9AsWEnRq0FEDkjNCt+jUqcxAmLeCjFCrS+RRaUcbmWM6zbcan1r8kUJFXZQl
X-Proofpoint-GUID: vL73lsE2ayVXPO3XtzLcJ3ntT0dkAEtw
X-Proofpoint-ORIG-GUID: vL73lsE2ayVXPO3XtzLcJ3ntT0dkAEtw
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680be73c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=0qT3Y18QIILfcGn7-LoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=967 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Reworking of the catalog dropped the SmartDMA feature bit on the SC8180X
platform. Renable SmartDMA support on this SoC.

Fixes: 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index d76b8992a6c18c21a54eb2a373c789720b876c8b..e736eb73a7e61544e0940f1ac683ac0e4c5c79d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
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

