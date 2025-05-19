Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E3AABC3B2
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E7710E34F;
	Mon, 19 May 2025 16:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ht3E7QG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D06710E34F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:16 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9eI6W021066
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2neXdOhnJTjuU17ok+uwBfbRcitQtwF8akxouMK3jPU=; b=Ht3E7QG/4eKq+y9j
 Af5/ivP8j1nUOnjR+B86fPt3/0FmPnY8NpAQhH8QrdXo/M8ReOhDwEeAVDZq55SS
 zGw8wMJV8KSY8xe4S35vkeyzNAPnPmLrKUnTe8sPXVIH7g065Ucc94wDTp81RSEj
 69bUkUQNYuC7KrDKPsFhLMqC6VLUHY5c7ThnbLkyDrnbXb0jh3s7s0SwaVbkAceJ
 Aw7jINweLkhNwLum4bCa2ZtOLOeYkj6L2j4cxxSMkeIIl18ZwRbicZ6MHxHh1R6M
 0x09L6xU4AjP1JYekEMFy9QuIsVodHmtM1RYqYhSVoDYMoT/vAbSQW5wAmZj1Qb9
 L8sLjQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4muam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:15 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3feb1dce9ceso1985691b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670714; x=1748275514;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2neXdOhnJTjuU17ok+uwBfbRcitQtwF8akxouMK3jPU=;
 b=XTA5A5X3SU2skpxYdG4A/TgpQ9g+TeOWq45kkNbhY2lRlfj12HCjg080ML6OjagneN
 pHRu1JVnh4sXhZH76Gn80/krUAPwQijfu9alXsReEGAnOzvn5UEhmshYL932dSQJ1M7T
 YFat9LeReropARbTF+g56Yr4lOq7Q5yytA6W/JS7+mL3uebbQ/u2ojZdX3CasJ+lrZi/
 DnXLHsNbNA+LxgoGwJCEP9R2xgnznbhAepLbUnBTCA9/TDbkfoy9C8AOwGCh1iT2vuBs
 xfjGUUgjfMar4tKskLZTjxKz6o2LUJBy6dcJpdSSx6TR7JDc0LVaDFLIlVKPkqLI6OGJ
 QLSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnirkaYuoSk2pXkzJo9SwX/4ySXq3DgpkDFH4QAY/dCSfiCDA5V9wxEagFv8PB/2FG+NvtbYEE/5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/QQeTiExrxFwxhnttja3J1U4F9u21gfj/mLNuBmOubvRg0zv/
 TeexbhnIoPFpMLKKs/rp1fFqFySsYOoXNEiK4z8iqq7e/XVNFz+j/W9L2Wkovvndan+LmRzUmO2
 5apnOqswdnHxj2N/QRssICwNA13TMW3G2T1hMO7p186uNN2/t2XSv8mTrHOrMKxWW6JU6pVA=
X-Gm-Gg: ASbGncuX69ZOjOCplfF7bdanBrSw9YqzpX3epHEE7oZyPoccK5xqi67NgoGG0GPnNLZ
 XpQIwXPMrW9NMmWXt642mz/v0cuamRtdScFOlCy0RarvSMHS2pWU5jBrTNM+axfHgB2W8RtshGs
 hOFKa/ijQCeey1tgzsvifrw4GLPwRdWYswUeVikzH5gIaW01tTAgq0sOb4LvH45H4eAV8Pbo3M9
 f9oVaYOlb2EulhXxh2xAkCvoXZsuADiWw1YKMnHO4Xs7ZU3NwWY3sC0SDo8YpT4vQQcakAR+xab
 mW2wnJlHJM3V+7cvBle9/lz/zOKwRWkZzPy4DJfCL5KU5WMU1904oqEKP8pLkFgpQYjqx54+225
 8P4DA7hGHKH3BiOTbGnUvFoNz
X-Received: by 2002:a05:6808:3a0f:b0:402:b0f:4ccc with SMTP id
 5614622812f47-404da767684mr6654819b6e.16.1747670714437; 
 Mon, 19 May 2025 09:05:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUbV3ew6oubfUnWxt1aUvELzaHK0OJtSZQcmN+b2tu6H7JVXztI0DPcE351TF1eCUf+mbv1A==
X-Received: by 2002:a05:6808:3a0f:b0:402:b0f:4ccc with SMTP id
 5614622812f47-404da767684mr6654761b6e.16.1747670713990; 
 Mon, 19 May 2025 09:05:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:05:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:28 +0300
Subject: [PATCH v4 26/30] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-26-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4035;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L7mJTI5rsgbVWMUZu2GxZgWbaMQSjJd7VgKp6IzcT1Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z9Th6fbTLW609TJZpxgvCPsfDseBOvrb6DS
 VP0FRT1Xo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfQAKCRCLPIo+Aiko
 1du7B/0ecWkTu3CSsdMWL26axm8CMUPNeM/eFtG0F7Dvu4Uri3nA7ZdQwSAhw+p8ECqDwz+v/dn
 iPd00IBfeLw/0WKbjPhgkCFIpj0wECf0+o8IbrHck9PTgrmiJ4uMnvCoP5ttZpk/y+Q0R3XD6ij
 r7VB2orTwhcWzP50dKSizx3Qi+U16WB4izsrCnvWO2Q2QWtf4bHX0ja6180jtrKfV4PIczMVkAI
 catNlf2O01tr9eGP3348o6ICm93XFKbYI/CeerjKPNNUQfM4oFajbBfRNa60kVkcnlbR2PraulS
 oxloSi9sqg96NEuv9AgUuedAk9CGDlWn+ZaiQgyT/jS3HUAh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: cBrWQeKSwhEuax6GbimFMMBe_hBTPNv9
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b56bb cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8GrYFQBjgVhM5uvzyoMA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cBrWQeKSwhEuax6GbimFMMBe_hBTPNv9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX/joDR4MoBvTm
 Zhz3b3sUQKz9QJSn7fiCbu8Vsak1//g8fFMd3ZUqx9xs14ozwDQPKVgbzGXsLkt8E0ogK6IHxZb
 0CjDVN3t2Flim3+9W+YfFD4Idzmrma6aXxN23wRSK2gv5nPynbdwGOxLcyOxIFoCyIp+eWYTszK
 v30yAsXWXEhcKaeCyf7MUfQSvZJy9/jFR8szIMUKfWKQkXA+EmVD2fvtVEF9nn9SYDMjJqa9bxn
 ohiFTM0yYGhrWD/EaZSgGcA+YSKa7biMD2rKbzIg93HPTkx3GImmxiiZeoVxVhSdZRrv7X4SkJe
 Blj4C6v3M4hN08e7Z1c0XwwER+4I7UjKaVWYcznZxdnvKrfnOq9PomoR+xCqnc0WAcZEtujw0OL
 9AgCwsxIpg5cafMzTu4l2bdR+ps+fHQxAFXzxHAqDOSFhu8XlaCBa9vIXuMLNubO/KFt+Cc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150
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

