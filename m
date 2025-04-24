Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE9CA9A7F5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307C910E7A4;
	Thu, 24 Apr 2025 09:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpRlpmjk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5184110E793
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:17 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9sO031020
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wrHE1bOaB3NiekNvDO5+9u9GO4wap7dKxyNQIc6R/uI=; b=cpRlpmjkKG9kcZ4c
 iEJUgOR8r5BAuIrtJsnFEW3UIzJ6TOUzEOaurxQNi1bfZfWdHiJijXzRsBHRIgOb
 H4pC6cY6wLF94+9aaPXCJs/lo6SNhw2pbii4hI+Yp98nmrJRTl5BSVekEShmr36w
 M6F13hHd2tqv3eCtewzC4nXrXrNNR07/VnZ+mb6f7oU/zuWPyfgSU7pu0DhF6qS4
 /XXOPVjphl0x29onQUsK7SHSqw15VkIvqsJqDVcLPrSiIpugpt92PFd9nEYUytkT
 sJ4Cy2ypGYz7WQUXWP2F+ZxtRHdAtKW1LCrf/oJ6ynoN6f15aHUasHXcHmzZ/jAj
 CgL7EA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5d033-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c760637fe5so142255385a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487075; x=1746091875;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wrHE1bOaB3NiekNvDO5+9u9GO4wap7dKxyNQIc6R/uI=;
 b=VrISXpoEinBhQX7hCQT5bOG2+H/78WurEx8C9151Cuk9CUL4tb1e2O5XevVB+v5b+8
 fD/wYg84nKupqjkpYVvuFi6JwSM8zU4UERRwX86n60ziwXlDtolpEU9RX3+nKcnTzh8W
 eo85uMkymYsYnLu4K4jDtCzyt4MwxzqINzfDYiz+tJNrGBbw1WaFX/5uktWAeHn68tzF
 98uwq4F3nBO6HbNzojGSvy/eLtny+fwZA27LzLBcUbDPE2y9FD/oCADv2We5k/2hKsEJ
 uYzuyMCbLveg2hT835TlE35Ar4mbJ5wia9ASiTVUnO+BvI5v7rs/C/0OdJ+aO5eRwGht
 /oPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1H7Mm+8XYKOrL3p8AoxiAmnlXoz56ONgGXFDeqDJ/K8XF9Sd9OrjgEVgYRv3CjmpZtIUGhRvMlyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUAlVIbCEZAOiHOaGwjyIsylkZQuWToKjndY4wmElSNRGeYbIw
 Fp3tlDsjdDWoQ9E2v0/lGYxv7r0cffzdFmcR5XuuZEJcUIDpWfLbJ2Ro1FE95kcrCZT4uZoNwZu
 qNP8J17Pi7vLro4ukqsPfZcfGSbK6WsAiBnmGxUKluO1cqDO6/l2lhcVlExL1ke9oQqY=
X-Gm-Gg: ASbGncv/0tYmmf2F3D0Ezji8P8wLbb1gBrTg4upSrerdeiGlIOrxcdYLyKFaLL7MVTi
 LgETduGOSJbXZh3ps/gVlFZgIjPY83Fye5bAEzrdwzNyhx3apVOyRlH04f0lxshZjq9fJizt9R2
 q6W7KQCU3CSI+XPh1iGWZ3ezMeDNzzPIY7H87TcOtHhwm/bAQp/KQRmMGpwaULWD+egrQnpuc8c
 7MbNV/BQFUf0kQ2WRXUP+thr0uzUk97zV16dQq+P7EzlgWSyjKs/ZEw0ujSZebky7iJ5AtBGlN0
 LgjcKp9bT4oxoL5NyCePlHo0WgQosoT6ZCBlcTrOEZkoKYsILsv5quCi22Lgrzd+FEAhB3LH75F
 CO2OxEx4MfuZNtSbB2Ei/EUXe
X-Received: by 2002:a05:620a:44c8:b0:7c5:4caa:21af with SMTP id
 af79cd13be357-7c956f88f3cmr289573985a.53.1745487075598; 
 Thu, 24 Apr 2025 02:31:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzIFg1zDeiIX8vbuG/puPSsm0w6YxIMJS6CwQB6kTZP4GzarC7rZpOw7DNXg9ofkifNfCrzA==
X-Received: by 2002:a05:620a:44c8:b0:7c5:4caa:21af with SMTP id
 af79cd13be357-7c956f88f3cmr289570085a.53.1745487075134; 
 Thu, 24 Apr 2025 02:31:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:31:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:30 +0300
Subject: [PATCH v3 26/33] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-26-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3942;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rblN28s9WApGRvSdgwWOoAg2/8R6bFt84IMaWAtpt4E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSv0gl9OlrXtLqzN0AezOXYOY6txxUCsh9LH
 CWulThU4cOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErwAKCRCLPIo+Aiko
 1TJbCACh7guP2wcixkRto0VBCiA2LpayBzP+xMAujF2Y7DwSW0zKJ5lLv5PbFQLXqVz3P7S4Imq
 Bri1XMVdY3LEImpBDWpojCK+MKl4FLBpEpM/mGKpY1JDLRVnZWJyJczAneAXt5LK8Fd+6X1YVlv
 QIhtbBS5Ggs2/isbefFAj1PU1WljaHs/aXhhUkXpoDPErtb5JNbKMsHvRn8sNrDfYy4MnLO6OBX
 6ydBR0+9/qkV9GFejoxwRUvWQogVKQ9jmKujXxW9PCR+n12XjLf4lbjDd4tN3PKgLWz7wn0wz7a
 3FM0DTLPiHv52kc0XYAk5HzSftk1JUAcvXX6O1UHq+YCRq9F
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX0WnlT9vYg8DU
 r+aPxoJ8VO6hYRYFn9xXFKU73Q/NnoCzbWre84od9MyPC+YkYEAo8/EpESQX2B+2fvFN9P48Nk1
 jzDSLjwK5ElRh2iFGtyMs7NERXyVQoTWtoFhMYrhfQrzEOvqkygRGGT+Mscy2E+L5D7DHxJj9sH
 422W4T5BhZ/eCBBpY2Tx4gm9CfjYnRfaHQBczqHtXNRToXaGfMkksRpBzHiCI1zvSe/ZJCSR/ke
 WxPCz4/XdXAnmMjCK2FGKyiDhKWpgoHJNPkHc4ASZG+1dQKxHYHuplDnUHWCfuu5sk/HwEZjhNZ
 GlYAPzTDPaZDtmTZukSdyjus2Bw9kIjl0lu81Wfw2j9wgdOJXBD5wwzp5Q9fDtRdNfECbQLsrT+
 d6M4WnFAraCWMB4znD9YI4YZQwgTiQpDt/m2RZ++vnEp3KBUAr+sTN/QSGsIOWW3tT9JMxpk
X-Proofpoint-GUID: WeY4NCmnC5gqCUds7VjpwlTAwN9k1dv0
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a04e4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=8GrYFQBjgVhM5uvzyoMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WeY4NCmnC5gqCUds7VjpwlTAwN9k1dv0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 2 ++
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6a96fa529508673493712d7cb72846c29d0f5a07..8496a44e2f04edeec884e1bac029c513022bf79a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -35,12 +35,12 @@
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
+	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_SDMA \
 	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
+#define VIG_QCM2290_MASK (VIG_BASE_MASK)
 
 #define DMA_MSM8953_MASK \
 	(BIT(DPU_SSPP_QOS))
@@ -60,7 +60,7 @@
 	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_SDM845_MASK \
-	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
+	(BIT(DPU_SSPP_QOS) | \
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index e0efa65afd0b734234f1080baf2d91e348882dcf..01763e0bf1359527b0c441ca36b27264dad636c0 100644
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

