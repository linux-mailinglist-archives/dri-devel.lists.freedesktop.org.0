Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEBEA9D23A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3498310E9BE;
	Fri, 25 Apr 2025 19:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNjV2Yg6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C94C10E9BE
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJvKC024828
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yu1pJ4v7QyzpaLYH38MD+E0KLIvxpSKT0ukBB1qszW4=; b=iNjV2Yg65YPih9MY
 NHbRpmoFU78rmRnk+K+o9vaum4aFohzqowSEbaZccjKfyzN+5H9DMFNux1W7W3M9
 j6+/3dtIcSh1Ucm0CvVxIUjcphFnQpkmFiTL+iF4p9VXk8T/eEL5rAHMWdnWEdm9
 CC1M/akHf+P34ayA3xpHoKdXYiHWC1zY8gH7iRSskYo87dXBJATif+I+aWij8uUJ
 mENwPIBmB6jm7HisrVkBgb2Ot76KEoPLpCZ3HIZCO2fgvFyrBVwYk4a/plIVmCdy
 JdmOCRdY8wkDh8vwFUFV5ZswXS5z7IK+uqYi+yuF3NdvmLmLlpF8ECr4Nnww6YSb
 jsAimA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0t0wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e8ffb630ffso41604496d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745610557; x=1746215357;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yu1pJ4v7QyzpaLYH38MD+E0KLIvxpSKT0ukBB1qszW4=;
 b=plbVFunpwjgF4QBERxpmQebCbPrD+rP5KRfSyMAXMaznegsXvKIj45voXeqihSu6S7
 0hqJXUD3E1DgPsJtFjdK65dNVS1JzUewxpRlck83zRJOd5Oh/sSuRJjC8QUxzY6DECD7
 hkIurEUxGsWTgOcKD0Ght4PZg/ogxAXD1UMBoswnMjMrFmDJf/5LQ0WKhS0DJhIKL3fv
 dGuYWqgTpbH7q81aKpPqY9XEwy2756AO91PJ6qgp/zV1qYfT7xYple+x+wTPRMsAm2i6
 +gdLBfDxbu8uOFWBWTRgxt8x4SVJmPl0aEoOEcd0gQ/C4lchnXgtF+wffls86lzB196i
 IsjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEpFi6QZxLnbxB5su25vfxt9mpRzjnNJl+BA/ykIUexjoMT7meTN6du8vomdbaIWX5U9KRr/rdFOA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyioM1/9vX+P+ke7tamhSrP7oeGGYQlqAIMx1lTF23evI8TS8k
 S6OJW4Dth89crF+nina1eLU4wKeKXuRMvrOdmWyxpO9yGwC3Ki1LoXCWuUj/X6qnc+2I+yFK1va
 56mupDTVq5ehomQiztnyAnk183g+YUcxg220g2OsbLTSTYUkql/+hPxTDBjoiiftmMo0=
X-Gm-Gg: ASbGncssdkPp1UpvNz9x4IBJP1y3ALl+rop19YAvTRuNJENAMsTiyA3Zu8HfTFHhlp5
 G3d7q9tyUNDfE2B0LOknpRwRtrpz4+yq9ZCYpKqqAMUZVmO0+5/56uIU9hD2W/5NJbpOjEGQFml
 4Lw8wZI5tAZ3MrwJFiK639qKPc0VUByp6bGg7bPqSx5c4ycLLCYzJ/9EbaEs/QhXWtvtT7yzhw+
 TTWBh8Gx9E2ATph1RVKC7uouJ+rQvDYT2KmLF3ADLKrZS8ahydY139e4yr8uxMOCFN57pIdxb3M
 Pskutlfy0crzDNRV04GpDkYW6NgunSkbV80Zkxo5LB0PKdO7INP7DQ5SFR8dDu6sRjNU7xkffk5
 LWcB2wVkEsFkx0yhi/LZAlleL
X-Received: by 2002:a05:6214:242b:b0:6f2:a886:7c6d with SMTP id
 6a1803df08f44-6f4cb9b917dmr61105546d6.3.1745610557413; 
 Fri, 25 Apr 2025 12:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWxy8OZVy+1G4435jkDv7x9KFSTI/TlWQyS1nZQqm5LJzAOkiG4ti14J6fup+ZqQ6Lmqkrsg==
X-Received: by 2002:a05:6214:242b:b0:6f2:a886:7c6d with SMTP id
 6a1803df08f44-6f4cb9b917dmr61105196d6.3.1745610557116; 
 Fri, 25 Apr 2025 12:49:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:49:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:10 +0300
Subject: [PATCH v2 3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-3-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3144;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUaIe3YjEScKzRmab1Pl5aHETuKQ1a9T+G7YnxZyaYY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c2fBKFWyeuvlxVupBYlHsabn1JoqhaF56EP
 A1a5Yl2OECJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNgAKCRCLPIo+Aiko
 1VujB/0RH8hLC2/n5KPQjXGWQdbQPf/GoiGnrLDEdFtg/55BGzkZSIzNqJJMdmP+7vsHv9MPIcG
 YcyjarvTthBVQ2gwHC8m24VeVjCeGha5APWZv38Zq8g7jZZRW0IxctLvGgswDWh348JqBMuBmUi
 pHi0183XYOLlOK5LMrCk7RjngYk5XLViEtYyM8gy382OtyZ8/gn2L8/ThiJ1yJFI18mvBsqRT5P
 old7nzpGyj4oziK/5oe8fC+TM0PUDgvkrZ2M6wcRHK33oBvuIkwlAPIkvcJIoqL9qbP60RLvoSb
 1yRl43nTtcbz9GZQhJghSKXMIh8csXpawBcumJtujOHTnnf4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5zWlC9gB6e6bb9AGUPd6TqzD9mc103y7
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680be73e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=fm35gGnZT3d3QFCnA_UA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 5zWlC9gB6e6bb9AGUPd6TqzD9mc103y7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX6I4h3nXaawOC
 UdcJ0ddwJnDTDpHEJLHrOk1fmd6mNTAHs3HnWy0HfXw5eYL4OU+oitUGTCLimRkpH4bukpzrL+3
 fhuiVRq4Nv5NlME+slvyGG3r/sSDNJCoRvtrhZ6KEPdoWmZLjZGLL21mQFmO193Nkgf5o9hcyXI
 SA3ydYsrvwOso2YASO6wJNTVLrsrlgfhb0DRFv3CFJqojE7YevC4+jR7SWPz51F1oMo1qCSWzPb
 GKPf2eeMjW564TikcI7Y2VqCPCEBJWo43jgPf/3Ut6DCIaunOr1aK4uSxQlxird/BVv95dAcN6X
 ncE3c5s3goWZqwTQ5zvGd0gKuAXqOfrnKKIwh256Togyw2hGgR0dNAAw4H/nDBhIngRLCIC8rO6
 2okB912bU1N/+BapBy6kTkuEazz/VHyyeeIJEyKNfL+mIQCpoIA20avumbSAL4N6PnFA8V7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=813 lowpriorityscore=0 phishscore=0
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

In order to support more versatile configuration of the display pipes on
SC8280XP, enable SmartDMA for this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index fcee1c3665f88a9defca4fec38dd76d56c97297e..923afc202f5195fa15bcfc1e141fc44134c965e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x2ac,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x2ac,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x2ac,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x2ac,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5

