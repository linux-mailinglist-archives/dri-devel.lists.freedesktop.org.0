Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7234A99A31
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5226910E328;
	Wed, 23 Apr 2025 21:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMbtGsqs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6449A10E304
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:06 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NBAPoC022454
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VG2GZHYD41UKjtYkxPhEwyWQWm9SxTIm0JxfKqMheSk=; b=KMbtGsqsbzFxomgm
 Y00QBaTWJ5iY5lTBGSNfnZ9xZlFJVjWjbt380suZ36nTbNNr85lCprz+ThEmDhQR
 o6pRbEO35wGvdafY9vQ8wRtVAVZ9z9at6FUO94cEVfA89GxnWD2fFVHXKQKKu+Pv
 zUkQrnRV4yFze5RQhyBnCxepaUwa9eccN5c5d5Y2gUO849Xhk8rjl9bLYxY27xAl
 wYOn9IebwASvB3Mno+7h0fX9ujbV/Hzhvpc4/Ptatz5pbnQD7oFbB3UfxEIQx6/U
 XFZ2gaNRofB73K1278Aq9KWavz8hJmgcA3XHBy7CUMIdqf5nKUl6Z6rqSI/+bCTo
 Y7lSKw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2be5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8f4367446so3729276d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442664; x=1746047464;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VG2GZHYD41UKjtYkxPhEwyWQWm9SxTIm0JxfKqMheSk=;
 b=r06m2goSefECooHBwbCEoJxVQgTRoxZ5dSFeWylCqNJKcQbmuRPSzyBSE1wjeDzjf/
 Y3Q5WXRPVPkh75n2HN74Z7vZYsE5LhSteBhZqBuoexSu5tIaXf/ib1jJQbRMAGg/epKk
 AZ829Aa1nQIkcZG+5JSlIvw6AqLlqtdzkZPxRen3tMm+7kP0xhOCeQL9VtBdL0UPg3ai
 wPqAXTCrcH+yknSkUt4NoXQBG87/oPAeOOmpQ4ue0LI1Ygwg9yuDpzgLO1e/2Jorn34C
 abZDoKGmP8mUA0wkWG0zY6/59PW4+sTaMbGthfweavJ7QmbmsxzQxghUGeLKQSa5XgD8
 fcgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt41QgOstkCrlC46PKowqiMchl7bz5955OGO+QKNMoHTKL4gN4s0Sxtf7FwQkZ1uo7wYAQGK//FDY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRdt3Rd6KgDJj2X98cVEY0kY5CE8YYQd64u9E2R88dtM0nOsI2
 oemM9rliuykzUXDCmX4C+8tdg0iBGt6nKLyENAvJRTo1F1ecDQrP8dHl3aQu29477PdttyDq+R/
 +kgdc7waTmDR2Wt36OSs8ioy+Qux1osJR8Mq2SIAMKH5VEBFvxIjeubxu2ReKpZyKwvk=
X-Gm-Gg: ASbGnctPb2opBn/6gTUTFId55xbvVHLwRd5AxnM8TdNYqQklbkyL8xT07ldofYEvKap
 nddjqyZ6rArU8Vj+20dmEiHyjZ9bcLzB/K5vToLa3ysz+q02tZAO0dbsN0/dZBoyWtBPrs7GRuj
 Gj1hySiyeJMANw6DSqc4lDaTIuwcxZhiAUO0oXyu9XwjQeYu22E7XvZKMeiglWKNjTSUa9CN16Q
 6PfSVMwOUeVF6TX3QVsy4lGjpqD1cxiQKQAG+nGhyuvo0o/tsrqPS3BIi9arfyzTDO178Km9UPB
 Cv4eZjINH191YCiiVpBBnd6Z0HdfNVz2GZE580flljkCw0+51iZnqk3TqV1aryneuMim3rP/xUL
 NXW8rQkmc4ttJjUx57xBlOzvr
X-Received: by 2002:ad4:5aac:0:b0:6e8:fee2:aade with SMTP id
 6a1803df08f44-6f4bfc6d88dmr4549366d6.25.1745442664548; 
 Wed, 23 Apr 2025 14:11:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCTTixtPonUt6+ssXScCydDDieUYqDqbDzIjgMfyzOJdfw/QkgLAnM/CKqLzK7KcC7d9PW2w==
X-Received: by 2002:ad4:5aac:0:b0:6e8:fee2:aade with SMTP id
 6a1803df08f44-6f4bfc6d88dmr4548876d6.25.1745442664111; 
 Wed, 23 Apr 2025 14:11:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:11:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:18 +0300
Subject: [PATCH v2 22/33] drm/msm/dpu: get rid of DPU_DIM_LAYER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-22-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5770;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zPzoSre6QlYhSZgH7eVz8ApdAwO0iDMR9kpYQh6k0wA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVct1wtalIZzYjYz2oYBvOdLQv7DXp1k0KMhH
 yYLpC0qF6iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLQAKCRCLPIo+Aiko
 1fCVCACcPhwaMtXnzP4AfF5jNqpgs8DSLEK6wQzNGko0C7IkVqJB4zP8Qa53bWPj3k9b6mOfrBe
 85LKdg4cxcmIcILSP9UwOI+UBP9ZEYEOZK67iPwNvjxLCocm/eI/60WPSw7Xen6fOt36i299NkS
 mgsb9qqgmByq3EZUwfL1xReLKbw6uAgkB/wixiC1X3MT5Vmc2WsHVMPUBBiu8B4jKXYlz7vQ4ti
 RPQlvkO3Jb+kI9tFEgW4q5+CVwVG0K5+nZTYQj638MEFQX+Xs9fxo7k4lAd4CS5wbkzNq0YsHaU
 1YOK6xEMTVZpRdlDOs+RuZzAmGD18Sdjb6+StKnQiphfJr/H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Mvar-sNuVuwgaMxHz2__zn1uB1FwH_zv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfXzuzhDwgkcx0t
 KLPm9RMTW/+o3Xwkj+Fwz0JH2O8qylJTtIh69HxO76FEhn+TOAXP6sdWASbOExDCYT/Rb3D615B
 qsVP7jX9zbJGgNDonAaXpsMqmXZYi15ACR2nx0uXbjhlfCzE9GFmHk44QjafmwvaRugybbIOhhy
 3mdMWnJK3+A465Yv+uwdTZ9FSSaMsIl3rApaR+C6U6zNWWDBeUY035sYpRgNWr9h7iGEq41sgfE
 nf95Wd4CBUjl9Buad3PPzjmo/zgWs0fimjU4xT/V3KZr/aCI612o/mEMhn3QiovKNAI81T+rUwn
 s2eKQpYUz3A3Oyb7AhnChFy1pUOlkEKT5i48Q2mGbamex1UoQJsHJmYcf9vh1Wl+RbcNWic6KRL
 l+N+LNR5oIk029A5KmDR1iXWqSDGGBe7U9V1lHZq7YP3/hHtZ/i6JhB2lg+p4B9w4lmIWaH+
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=68095769 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=whSD1cen4EvMnTwSsNsA:9
 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Mvar-sNuVuwgaMxHz2__zn1uB1FwH_zv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144
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

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and drop the
DPU_DIM_LAYER feature bit. It is currently unused, but can be replaed
with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 --
 7 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index e2306d314ef8f8b59078a8ca8c529f2e56385c98..8fb926bff36d32fb4ce1036cb69513599dc7b6b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -107,20 +107,17 @@ static const struct dpu_lm_cfg sm6150_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_2,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index c75d0d42b6d856f98580068a5ac7f82f90380ac9..af7433fc6c128c2e29381ba6bf56388bccdd93f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -91,7 +91,6 @@ static const struct dpu_lm_cfg sm6125_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
@@ -99,7 +98,6 @@ static const struct dpu_lm_cfg sm6125_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_1,
 		.dspp = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 842505ab5c4a6555e0a3223804065e68a5a4e680..155db203282f687e5632dcb042393951bb03876f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -57,7 +57,6 @@ static const struct dpu_lm_cfg sm6115_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 7087c3c2e728c51f070b67ab0f8039f74eb7da6c..708cf1544bd1d5c72a125b572e51d628c53f5033 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -57,7 +57,6 @@ static const struct dpu_lm_cfg qcm2290_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a2fdbe39e4415c1da1da0517db2284f368bfa07b..b5a3574e2ce43f7f5d47c42fe1bdd0f084396a9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -58,7 +58,6 @@ static const struct dpu_lm_cfg sm6375_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.lm_pair = 0,
 		.pingpong = PINGPONG_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e22ad69e451bb5ed38f056e95b0944fb5c21ec7b..5ca696b8cd92cefe295cc7e45974e1da0d420cad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -90,10 +90,7 @@
 	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define MIXER_SDM845_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
-
-#define MIXER_QCM2290_MASK \
-	(BIT(DPU_DIM_LAYER))
+	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index e1fc6fdd8864b017bec35e448ef15420530e018b..8e6fcb51aad8278eb80570a44a423c2443744c61 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -84,14 +84,12 @@ enum {
  * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
  * @DPU_MIXER_GC              Gamma correction block
- * @DPU_DIM_LAYER             Layer mixer supports dim layer
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
 	DPU_MIXER_LAYER = 0x1,
 	DPU_MIXER_SOURCESPLIT,
 	DPU_MIXER_GC,
-	DPU_DIM_LAYER,
 	DPU_MIXER_MAX
 };
 

-- 
2.39.5

