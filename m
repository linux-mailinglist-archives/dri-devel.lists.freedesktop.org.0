Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C7CAC1407
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A445810E85B;
	Thu, 22 May 2025 19:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DyQ52Vz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A8010E807
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFM1Nt021305
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z2mG8cxIS8Q8W9z59itb+4PstMNGCr+eIADuRS6MBbI=; b=DyQ52Vz3op5hpbex
 yy8o0Rm+KSiGSZu3MpG7bgDXpdFmBKlORX6yMnaFtItgAPE3DBKC2dQgEEvjDxhh
 1/ImlMofE6ctESSLgWGgvdN2xHnkX398Danx9LJ6BkwtZb/McM1UdS5+RTcfGDV4
 /gLsHFs7bMP5ZfLuC3Y6M5B5cdNdqT6EUnuVcUOowfzt6nQWxpwYE6LfGGxw8NQy
 kVIr1j4tTC2yO2dRRQD7nX1OZJL0XidXHr6vRFAkyuzbEzfGuHqSrhsx60WPU33W
 QdfRs3bD3mQ4itiU5OA4/x3XxWT9h6UqdgD49df6VupywVFOGBI+xYejImY8zerl
 mM29/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb5v3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7cabd21579eso1446955385a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940662; x=1748545462;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z2mG8cxIS8Q8W9z59itb+4PstMNGCr+eIADuRS6MBbI=;
 b=V+Vn0Vsj9NyQ9Zh9gL/gt89ZYoWNxVYO+eV/X7SsdOwePYKcUa2flc8tGqBlxujJef
 /kg3vn63bLrVAUYeBv5CHGGfUMAKgkGuRL6e2u++LNZdXoRcJn6G40ORzedFfdJRRLUt
 Xz0dSwhAxa7qN3KhEN1NCiyxUFOJ8k265DIFSo+bIxf3HmLleG3SQEHTI9xtmjSs5OG3
 f7UjkN+nk4M9NJkEy1NkYSXnwZH7GyID00dTsw/2TcL2vHXndiMbEi47gL9bjOFiIf3Z
 LxJuxRQpDgYGcxpeHt+ODkpmjq4tOjohyWyoWLJ8vOdOdQqSdEPg4GZJA5oU9ArXFAOq
 yrmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMCjz76SMWewLRvqvWjvvOzd6EaWTMlCfxuMo/KZ2nnDxp7qvo+uCwcJ4PemzzmfQE8W4qSCQcpts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/H3t5GywSpPuID+odu9SUYPVnByqrnRyM0aJLSQX7G/yoPFNk
 1Wm8baFXCkf7U0kOXiXhPnLjeVdmMWrRAoZIV9mYphzOukFLQsLnIxMwKfQLWsxq2yJo2dfZpsN
 n/f/O5URFVrKkx5gxbUgQe8kzJzqTBPiHDwsk2Dw1WBYCgCNxAOh0j8rhYNIo4wSCFFPyq5c=
X-Gm-Gg: ASbGncsM5vl0gUSGMEmiBgUnYH9iJDDD83R5fdpVJBLqbNO4Ex3UX4nyQbPoGClKpbJ
 tEjId1hSCP+sHvZLS1IEC1sQ315avytGB5Yq+kSz+Hy1lwl8jlXgyYPja2ScEt4T3EaIdB6vpBw
 ByfVnmPsRauv/5grw2tX/oF8eLcDX6ncIKysT9bKSmjuN+l/2DfVZmZ7DyowT7sL9G77lyW69YL
 nOliR6NlEH+AzoABpDfaTaA2HOGEpKlnee82c927YgExH0fVLYw/rbh5ZGugnRSyFI5XNbIGoQ4
 8+54pzyGsiCw6DjBd4mehjd/VZFCwRWhs8eKb80YDiuIWZO1tu+PVTNDTT7kxQ7gte1pIXa7G5f
 xE+F7icLh77w+IzaPfTfXS0yQ
X-Received: by 2002:a05:620a:31a3:b0:7c5:4001:3e9f with SMTP id
 af79cd13be357-7cd467334c2mr3649008785a.29.1747940661783; 
 Thu, 22 May 2025 12:04:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUtTiP4/ujnM4/f1UIjeVCJ0tIpWKtmtJlDx8u6T2C+sSF4p2i3t8uQNPgbghUmIQrDlFXCQ==
X-Received: by 2002:a05:620a:31a3:b0:7c5:4001:3e9f with SMTP id
 af79cd13be357-7cd467334c2mr3649004185a.29.1747940661342; 
 Thu, 22 May 2025 12:04:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:35 +0300
Subject: [PATCH v5 16/30] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-16-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4399;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8C+zkxaDTJSXItCIlDecEEvq4hEyx2Q9rh41cf2R1uI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T+6Vo7A/TuAXzcpo59a4AgI6+6FZw9GJd8B
 sf0vWei7P6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/gAKCRCLPIo+Aiko
 1Wp+B/wJg1F2PJfrSjFkAINTs5XuNswb7x7B1Ixmq1lGX092C2NUyO7AxiFXQkS5LtIoLqkdmkr
 ZhgmtyKxFbUnkWKPbJ9cuqztCx/NEciZwbwZmVB7X2XU4LXH8VYW/tcQTXRzifiblEW8oNqL825
 fXwkGLlDKjJ1ztC8SP/Le92yu8rTtYvfG6A1d3bs7r/oj5HeGp0CceRJdVKQ8mdSrV9q7Tf9UwV
 glKUqDKuOqI0Zw++hbZSMXRqB+sDKd/4XwbVOBzxaXD/wV5Md33QxfP010YR3ZI++xgjDyZWEfB
 vTXgDfWaNup9OnVgcOwO/Nvc1Eu6HkOox3gvNvRvxYTyP516
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f7539 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=K8QCOMLVtaD6p7eYglIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MwmnXKUQCBb7_p8mpMYqYNs6pWZfCUdj
X-Proofpoint-GUID: MwmnXKUQCBb7_p8mpMYqYNs6pWZfCUdj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX13m1PohcGwPr
 t6TIYPXnsuGz/qkDceBKGqrD5GBBb1V36eVay6Z04gN9InIe7wB/79Isrzzulru+Z+UFD8uivJW
 sT7TPru5dTXNPn2xkbHHRoMjHE4huxu/USsqX/vyma5yJ0uuGqeGgc0WT+/dQ8bkJPDNlyRyIXe
 98KSNtkoh7tGkghAilEUhDqM6wlpao7+nXoafZTR0cvInTMK+ln4tPdmZ9FeJWuszDIM9ug4gBz
 ort+WnI8gfBUhvl1qANaZjyLAAlykBHVBye25n5XK5lh7W2aN1ixOOCkRrcwQr3bxcExvd1fnZ6
 5uQJoxBJ9mZZh3n5ZwE+jQFh6eygZHTQIgpKX4MSYW6PxAjLEq9kqffcPDhHUu3Dn/o298IsRet
 22rUOFDlBjiZOXScJwva+isysNYes/T7LpPcCHpgJmy0cX+xM9PgZPJqc6fm/VtwacerhSc5
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
DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 7 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c         | 2 +-
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 8fe07a5683f734a058e7e7250f0811e3b7b7cf07..0e8e71775f2c1c38af018353c85ffeb6ccddb42f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -181,28 +181,24 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index df1eeb9082f74ab734c235f0cd0baf8c0eda14b5..75b679cd2bd27dd25971489a2d3a6f516b248235 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -95,14 +95,11 @@
 #define MIXER_QCM2290_MASK \
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
-#define PINGPONG_MSM8996_MASK \
-	(BIT(DPU_PINGPONG_DSC))
-
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define PINGPONG_SM8150_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index bc71ec9a5bc8b6e15d7af13c42ba5d4197729822..ac63f753b43615f7c34d2da51fce919fd77142bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -118,14 +118,12 @@ enum {
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
  * @DPU_PINGPONG_DITHER     Dither blocks
- * @DPU_PINGPONG_DSC        PP block supports DSC
  * @DPU_PINGPONG_MAX
  */
 enum {
 	DPU_PINGPONG_SPLIT = 0x1,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
-	DPU_PINGPONG_DSC,
 	DPU_PINGPONG_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -319,7 +319,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
 		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
 	}
 
-	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
+	if (mdss_rev->core_major_ver < 7) {
 		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
 		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
 		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;

-- 
2.39.5

