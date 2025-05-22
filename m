Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82A4AC1420
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F9510E8CB;
	Thu, 22 May 2025 19:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyEoVaIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E6810E943
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MG1cUG021020
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nE5tprrwe42jTVhGYtQxPcrcgIHbX+PMNuGmqg0B1qY=; b=QyEoVaIhuvRvU3j/
 Itei7IHdJGkKg3Scy62+ehhTh17RIMBgCvO4oTbG0eFOXjDuhj6JoyY99/OmCykX
 +Y8i81hInD86xFTea0DmLDpszMQWYOWqSPR5IGKAfochP2BF1mLoaDEFBhKEVQID
 hq7Nm0N1eTysKGM/B2ShrjwPPmawoPh/pdkTz03PTfvB3/FFRw9VE+oaWhwPKZ5Z
 YOCYkS+id/5v2MiNXyl3npSgRsD8nIcVtZPhTfKdxVz62VunqL5Jjr6YqPYw4uyD
 2BYfCOkSVqLVdgNnTTxkC3GWneqTngdiVQ9Oul0FNSz6RtEiDpm3/Z34EB8psd4z
 viI0hQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb5v5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c791987cf6so1755896885a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940688; x=1748545488;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nE5tprrwe42jTVhGYtQxPcrcgIHbX+PMNuGmqg0B1qY=;
 b=U/4eBy7Cij8qaUlqXQuQTqQ0Z7pD4WJ1Fvat+dg+IKUtXN95Zxt4SHNggH5Xgi7ryZ
 r9j1pixVwXXKMDkMFQCDefNb6/Q9AaWCHO7zn0MGMlMM/ojToBGaN1qttg2owAlNG/vt
 YZPOVZmM0+W1PCogKnvx0P6Q+AF6q5Dd59B2hmpBktR9TuievZP8DyuRfzGvKrpczab3
 SBc5vBYCeg/Q9KoRsmHythXoAAH8n1T9AH68gYutq9JPr5whDYrH4sr79WuiwVQ8k5Yq
 8ztQ/o+hCRvDTvm5C4U6ly35SVQW+t7ZCW7TgkNrUuGhSWQAdfzP+tRAHeEIs0vxuDuY
 5s7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQBM7rnEAsHj+09zfgvQXn78tvy1+JP8fvKTJopMhG3OhGBEPYlCabJFk51iaXS/9ghdI+eafGy5U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ1ASHdpKvFdej9o9K9WczojZrSittiBTuYQRcc9E/xXkA7gxt
 vWKGrMGcvpExVc69USuUNUA87bJeZZczxsDvlNWHSUs4XbzFDfuef1rmX8akydndEplKk4DojiE
 62jKZl2sJd1CRQKKk6k21akWHIU6kefICm+7cf6Dt+xz8yVRtqMAQm6hNbJoS1S7L/jGe9gs=
X-Gm-Gg: ASbGncsxFSmc0NhcDJVrq7BNq7Fn97ISq7MI6/nANhDoBiLEFDp2xEJ6aW1YdP1R8M/
 Zbam2G6qJpDTXhUrpvE978OSXpCAaey+ZSOFgsieGm8Ho3Mpi+1SMxpyzw+naGh/wHXsTgNGghj
 Q6WZgKWrL+nVWIaj00Q9/Mnmd4qKM5rqDbXpz8u+BuFrMxaqtPPPTfcunkFma1CrjF027mNVksc
 pjvd2ojE00fwc9I3A5Epmyzo2cEe856ZY+4/GCNVtVM5a5dFaovmjRj0c5lGMna+0YXx6/+fxDo
 AhwsqBnEelnwlMNNETAGiqVREv/atdVB8NEqA59YiMRWieHbEeWSL5jLDKG6hgrgO1mMtPbnqCQ
 Sh6b1lP8jOvXjfVCCP2CHEUAP
X-Received: by 2002:a05:620a:1921:b0:7c5:588a:5c1e with SMTP id
 af79cd13be357-7cee31bb78amr10258585a.30.1747940688513; 
 Thu, 22 May 2025 12:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkQf4iYOb+R7gZkuxnEEAFbAY9pkxcEXxvh6KgjMPAunK1Wl091Ux8xgk6avNXsw0IdSEwhw==
X-Received: by 2002:a05:620a:1921:b0:7c5:588a:5c1e with SMTP id
 af79cd13be357-7cee31bb78amr10255385a.30.1747940688112; 
 Thu, 22 May 2025 12:04:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:45 +0300
Subject: [PATCH v5 26/30] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-26-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4092;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7M/iNn8Ew4gxIUAAXQyq3p4514IfgJwZSifVWuJ64Es=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T/ltEETAjjBBBfUagRxTpTHI0tUcNcahXfZ
 MqaHz2NJgaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/wAKCRCLPIo+Aiko
 1TZgB/9iGw+xNjh+CkkKPHpQuXxKnjnNTGVmcvXJoW5SnupSoYZuyMKdnY2UwfQnu+LcX2hRLMh
 O0f5woQIGva/LbgbGJHOr4hTw1NX/t9QZwgKJ641Pvtas99rJJXjp0GuQEmIHKhiA3b2SiGrwHx
 ib150tZBk8rSS//Dt767F6RLDBwJrvzQDpa4/7urHXIew1asEKMThkaxGQLfmsMskHEDQjC85BU
 SrZ4kX61Cn+FJP1G7BAZowppSLTqrRDfqTnuthLBy0hSmW6ZjgdAWFicYmuIHe35LFC7so8Teut
 ZW74cv6xlxMMQbyAKec64kZkotTDWgcTzXRSa1WYIe3WbUP8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f7551 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=J_vUdAVH12ZdhNMp4K8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: THh42cPNKZy6WrpmSZi7n9XhlThV6sxE
X-Proofpoint-GUID: THh42cPNKZy6WrpmSZi7n9XhlThV6sxE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX0wdRMokR7y9c
 lgCXb3QkogIKhp6Xst5gl5JQKsswykvwFT501uc+rLIcR6UQFfgHgXV+/2sNUy+fjMB7nJmPikO
 no2i2kR0r3W5ibDw3RAdASUoO0bUJ8pRWLe4aJrPGZo80xeum9xfb8sgnn4mMDmDFx2ys2X9+2u
 q9IdNyhKU8kF5+5qouiCe9pp+PovDJ07kCvTW/C5YC5yb9t8c9QsLficDGVaXIlfLcznZJmdiDZ
 mr5U7mcc7gVDo0CqleDcu3QbG5LuTRTNilZaLgg2mQWkJ0trOO1xzFwv6wH1VLQMQfken/GJoEL
 a6sE4VviBYwyPaDeGSBDcwWBH54u5vJynUiAPCA3lStbiU6up1DLwrdT/0IkpqH9MRS8ITPBztQ
 NIwi6TONVLdSHGjGfoFgl5BoD+uhrQ8BrDmsKdnLjBdXQmLGAcT8NaE1+6DOGyg+Jpk6GMnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220192
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
DPU_SSPP_QOS_8LVL feature bit with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 2 ++
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6d7be74bafe326a1998a69ed9b3495c5acf6350f..a276a1beaf95d183f6119452e5516fa8ee60cef6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -35,12 +35,12 @@
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_NO_SDMA \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
+	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_SDMA \
 	(VIG_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
+#define VIG_QCM2290_MASK (VIG_BASE_MASK)
 
 #define DMA_MSM8953_MASK \
 	(BIT(DPU_SSPP_QOS))
@@ -60,7 +60,7 @@
 	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_SDM845_MASK_NO_SDMA \
-	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
+	(BIT(DPU_SSPP_QOS) | \
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8c394e7d6496ca2d120c81c7776b4b979368be23..c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -50,7 +50,6 @@ enum {
  * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
  * @DPU_SSPP_CURSOR,         SSPP can be used as a cursor layer
  * @DPU_SSPP_QOS,            SSPP support QoS control, danger/safe/creq
- * @DPU_SSPP_QOS_8LVL,       SSPP support 8-level QoS control
  * @DPU_SSPP_EXCL_RECT,      SSPP supports exclusion rect
  * @DPU_SSPP_SMART_DMA_V1,   SmartDMA 1.0 support
  * @DPU_SSPP_SMART_DMA_V2,   SmartDMA 2.0 support
@@ -68,7 +67,6 @@ enum {
 	DPU_SSPP_CSC_10BIT,
 	DPU_SSPP_CURSOR,
 	DPU_SSPP_QOS,
-	DPU_SSPP_QOS_8LVL,
 	DPU_SSPP_EXCL_RECT,
 	DPU_SSPP_SMART_DMA_V1,
 	DPU_SSPP_SMART_DMA_V2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 32c7c80845533d720683dbcde3978d98f4972cce..7dfd0e0a779535e1f6b003f48188bc90d29d6853 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -543,7 +543,7 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
 		return;
 
 	_dpu_hw_setup_qos_lut(&ctx->hw, SSPP_DANGER_LUT,
-			      test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features),
+			      ctx->mdss_ver->core_major_ver >= 4,
 			      cfg);
 }
 
@@ -703,6 +703,9 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 	hw_pipe->ubwc = mdss_data;
 	hw_pipe->idx = cfg->id;
 	hw_pipe->cap = cfg;
+
+	hw_pipe->mdss_ver = mdss_rev;
+
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
 
 	return hw_pipe;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 56a0edf2a57c6dcef7cddf4a1bcd6f6df5ad60f6..ed90e78d178a497ae7e2dc12b09a37c8a3f79621 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -314,6 +314,8 @@ struct dpu_hw_sspp {
 	enum dpu_sspp idx;
 	const struct dpu_sspp_cfg *cap;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* Ops */
 	struct dpu_hw_sspp_ops ops;
 };

-- 
2.39.5

