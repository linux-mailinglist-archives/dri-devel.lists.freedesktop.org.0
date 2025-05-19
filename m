Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281B1ABC397
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AC310E3C3;
	Mon, 19 May 2025 16:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPD9Icu9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DA410E37D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9XoRe023467
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nZxTF8x+3KE8EFnyZXSEOGRbpAvMMNHtRHdI6vjxCcM=; b=HPD9Icu9d+0jnZi4
 2pm/BkYyOyOs+zZI/DEhIrzyjdjpQo0KHSs3QDKqFgCjzyle0xyYgcL7c9b3SFYl
 qAXYsaSiyugdF2D31DTWx89ElqgCQ/iF02yjOQBSyMepAnUkBiwrvT3LxIItgbrW
 z+uAeqdii66kVGnl1sioxMANeM6omIYhuJ+e/tMY2beksRMeKx7dC4/llEtD6upO
 3H04qOuoC7yK3CwevKFGYVbQhbCB6zXAvpe+z9VCGiNpdIW9X2LYAKrVlO2KM4Ux
 UGTt5LlRoOi5zg8nr2v4aHEGgmx7KZ25Fs2L1/eoWnq27Qqi9t/Bv+44t8Bti3uG
 kun0hQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7cvua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:50 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3fe28659299so4680682b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670688; x=1748275488;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nZxTF8x+3KE8EFnyZXSEOGRbpAvMMNHtRHdI6vjxCcM=;
 b=nGlu1toUoS9zXl24zOM5cXeNKzQZsC7kcYQRlKRJuDLxJ+j/mv8hQecIuc+wjzPj6S
 aCR42EGDtdSIKP+UTKhJAmGXnRXbACWyEyW7YG/+o3+LbFOzTPcZi5C7quNBEGO7D6tJ
 axOwch6Io3VckIbqFKhw3Ib/hPzO3VOAH1VvitC0qMYs1wbvRl2q8kKZNBrU2/l7AHcs
 K1ZOhS1VoGhOYS648JDSnGK9XCah19IsbAbgCfo5GFBoMWGWDSXf31tQ0Y/Y/VfewWsS
 gK4m1Oup6AObLI53MQbPfNTqt0M58t27HM/43VK8sq4VNWfxCpwaQKzFKIiaLE+rzt/e
 1YCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVouZLanp5J//Sq2cTNeKAnDS62X8g+g23l7I4v8N7QPPQxIiNbN599lnCWcWkV+2h6Q4awmOTGUPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPLvqpRSHU9l/WIiseAWA6h7cZMeVQONIpIWB9j6kUXqcVj+sc
 hrLrWKgd1iCp2zB3mlmElTBA9U2Om2SLimAsjCRlCnyUdv0GsaiKstT7YXn0NDCepB52oxvXYE0
 AHt68VP1RPVcijSWL4s9CL09s06z1B5TsXnDLt7naaemB1k+jn+lN7DHsclU4yKvvUCeKk3Vub2
 7N39c=
X-Gm-Gg: ASbGncusVW2KvixdrMwicaRhl7Pfb7QH+H0MJ8IHg1un8rUWoKpgMl3HupLjFBF8BVT
 x2JzsSubgW8M72i19/1ObmJ6k6AUwgh61NFni+75MjM/JRRb8C+irn2XRrr8aZj6AwR8Y2la/GM
 0KfrXo/Z2u7DZe9aGB1+H3clJrF3IHSJ5+EGjBpOCjTDK7YYk+FuTX9KkoNYoQ/f96PMXCmcCYL
 YTZ5IcpGRbr2W8wrBNOZUyy4x2RRI3Vo6yzGgyU2+KCKS7n/BNmB8SHG8HVHY7mm7teZ0SqcrWE
 7qymSc49bi1bxLJBUZyIZwoKKWSAxtyZ+yjiZApQ5RtJKiJ2Wv4LpnxPN3PUQwnZCtGkUK5uYol
 pV1hiydQP8KwEIlEFkOqm0kBh
X-Received: by 2002:a05:6808:3387:b0:403:37dd:e109 with SMTP id
 5614622812f47-404d88788c2mr7319356b6e.27.1747670687098; 
 Mon, 19 May 2025 09:04:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiOSK2IjJcxUCUzAuqHixsgMkHmIg33enVBCAuohdlOh11NyryBEP7WJAE/aYPWn2wtYQfLg==
X-Received: by 2002:a05:6808:3387:b0:403:37dd:e109 with SMTP id
 5614622812f47-404d88788c2mr7319305b6e.27.1747670686488; 
 Mon, 19 May 2025 09:04:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:17 +0300
Subject: [PATCH v4 15/30] drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-15-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=33892;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=w162QubJ3pc8RO3B2LFfQHUW3UcZ9o3mlunbe6CwCZc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z7e1S7TC6O65xEEBgJzw3TXYAQEIoxy5jir
 KjAnSfcXI6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWewAKCRCLPIo+Aiko
 1X79CACn2meVi9P+QdHMATKIT1KYE1kqwsgmzRzRoIduerEJSBniIFYulHW1L+mbgMNcGoaAB1h
 HBIb6elpxXtTms+stGFONbgX67jdndvPLC5VlCgmm6MvnhTnTMlzE71BnrHTNepwJ65EWeBqyIi
 UQdXmB1RUbcNLOD0G6F3Gnx1uGF+0WpuPSp3dWWkZFboNFty3GKgBRod0J30m/NP/0i1sqhA9gy
 HjYf+LgfgvUdjHtNag974rkT5baHffjd2FJnVjvSOTfBXb2oOOnbkzGsC5yi2mf/PA1lS9Wr+IM
 ndeukUju6GU01nhCy1kB0t3Y9i0Fkd48Ehs0ZQZqAIf1NxDV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b56a2 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1O7iqZxHH2NOC_bIgO8A:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3iLMNpvKLq5hE0LUuJRAXqw9vD7m1A-I
X-Proofpoint-GUID: 3iLMNpvKLq5hE0LUuJRAXqw9vD7m1A-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX3aZs1HVZm8vx
 Ee2ckZvpUIp1OhzDGDGayhOuFjEhXf3mFViP9sRznQdTj1SO1sl/2GblWmuzetuApLZefLWoPqs
 dc99OPA+LMd1dLOUMCSuu5PFpg2+Jf/3JiIKDKinA3fNV5LjniDM+gvF/G7qpOM7Zw28WR9F79Z
 iuM2PgCphjUPmwhClgyMZqN8bUiInLY6osambxw475loC5rILjqiOaUQ9qQ8bf+u6gn9eBoZ8cQ
 M7s4aSUr+rYWYyWd38j7DoOrl/sHyfu7BdHhbQxsc5iTI/XtQbrWv+LJMXCeTt4myJrgGYmWvfd
 u0ZANEY8PR+c+ZcLbb/H/lC1q0c8GO6Ip4J4SufOy7rdNKSBVDGhzScypJFt3mYmKkKF8MAHaob
 DuwUXeWDCjLkHLLeYCpAALv9/SWf1X+W46NSs9QqZuQ0rxdhfvHFXV0tPlmkKqchUEe9B+Ay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150
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
DPU_INTF_INPUT_CTRL feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  9 ---------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  8 --------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  9 ---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 11 -----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c              |  2 +-
 23 files changed, 1 insertion(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index bbdb7e1668fee33cb7d99a7cb8ab001e58f079be..88582fc257dea342f05b93dae6afe986eb7f32d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -364,7 +364,6 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -373,7 +372,6 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -383,7 +381,6 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -393,7 +390,6 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6c8ef23099a8212f33780d27a76991e9955a9bc3..bcab869aafbe1e23e0267bbad377fc10d8c6256d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -301,7 +301,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -310,7 +309,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2bc,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -320,7 +318,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x2bc,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -330,7 +327,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 37d18803af4b850c40ab855b1f13db96f3ee96ea..4b61bc7eb79f00a184c95b2319b737fcee6c4cbb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -309,7 +309,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -318,7 +317,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2bc,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -328,7 +326,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x2bc,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -340,7 +337,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	{
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = 999,
 		.prog_fetch_lines_worst_case = 24,
@@ -349,7 +345,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x6c000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -358,7 +353,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x6c800, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 41b43fb258508f1a5f285c88a3c1dc2f5f271cd0..2e7ae68f7e922e9b71d79627806042f645cb4ad2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -210,7 +210,6 @@ static const struct dpu_intf_cfg sm7150_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -219,7 +218,6 @@ static const struct dpu_intf_cfg sm7150_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2bc,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -229,7 +227,6 @@ static const struct dpu_intf_cfg sm7150_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x2bc,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -239,7 +236,6 @@ static const struct dpu_intf_cfg sm7150_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index d44db988a6e2f443803a422846f817779d382b2a..a99c99ca37703cc3a7d4403d3f026f234b693319 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -175,7 +175,6 @@ static const struct dpu_intf_cfg sm6150_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -184,7 +183,6 @@ static const struct dpu_intf_cfg sm6150_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -194,7 +192,6 @@ static const struct dpu_intf_cfg sm6150_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 6e571480c4a44b4f4663574c31270657b9a06a7a..72f1328deda87ccc0b97f3f03d5840a77426b2b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -152,7 +152,6 @@ static const struct dpu_intf_cfg sm6125_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -161,7 +160,6 @@ static const struct dpu_intf_cfg sm6125_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = 0,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 6f9dc261e667fca3e94ec24e00d45f9af46e401e..aee4adb3b73d2efb074abc58dff7d213a73207d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -284,7 +284,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -293,7 +292,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -303,7 +301,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -313,7 +310,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 373c7d605a04a1fc72f45e993ec176e8f5e015fe..05c0f81b263c4a9aab8adbfa487f6cd20ce94079 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -129,7 +129,6 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -138,7 +137,6 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 1cf9f99d0542cf7037d2a9672d51ca7c437c364e..b729a01e8ff8443721bf993726ae9ebe21e89440 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -87,7 +87,6 @@ static const struct dpu_intf_cfg sm6115_intf[] = {
 	{
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index a3db71676f468526ea129c4b8465fb2c47885162..25f56c55f373ef5e57082448bc1a1d1d17968b06 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -160,7 +160,6 @@ static const struct dpu_intf_cfg sm6350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 35,
@@ -169,7 +168,6 @@ static const struct dpu_intf_cfg sm6350_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 35,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 719cfaa98ab9e735d9255d9a5f1a4275739b4b1d..20b12a68fb9dfe0291486ca827c6ca25a1711014 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -87,7 +87,6 @@ static const struct dpu_intf_cfg qcm2290_intf[] = {
 	{
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 04cdda85e6828a83e99d146ee9d9f809f1acc007..6935ff7da3162dd7b86f3786b0f604d113e51649 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -97,7 +97,6 @@ static const struct dpu_intf_cfg sm6375_intf[] = {
 	{
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 3c6da0acdc3b81db65e2544f16d90322fe7e92a6..b6b1a4383efa72fc0bc8a6feac1c3adb7773ba42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -308,7 +308,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -317,7 +316,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -327,7 +325,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x2c4,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -337,7 +334,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 2ee29c56224596b3786104090290b88cecf7b223..d1dd895acbf666ceab39f9c38ae11bda100b5953 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -178,7 +178,6 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -187,7 +186,6 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -197,7 +195,6 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 2f20d0014a94e707a5f0548fc1c6bf0983b0cad0..481d36b80c4eddda53d2f9963392d9499f966792 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -304,7 +304,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -313,7 +312,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -323,7 +321,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -333,7 +330,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -342,7 +338,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -351,7 +346,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_3,
 		.prog_fetch_lines_worst_case = 24,
@@ -360,7 +354,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -369,7 +362,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -378,7 +370,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 314875e2dca96b3b5c40aae0d15fb80da8ebd42c..32649f25fdcbc1fe45d7028352dfd4c0daa11d84 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -324,7 +324,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -333,7 +332,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -343,7 +341,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -353,7 +350,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 36775f444af4b2654231cd9456ac4eea1f0f18e6..4679b7e47d50e21d5b6df69fd0479b804ac69979 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -334,7 +334,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -343,7 +342,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -353,7 +351,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -363,7 +360,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -372,7 +368,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -381,7 +376,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -390,7 +384,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -399,7 +392,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 624f24c8a33a182634d49058014fc3175f5ac9d3..def7c161d787d9cecd219b4db0482158d3e5bc12 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -319,7 +319,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -328,7 +327,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -338,7 +336,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -348,7 +345,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 857dc8465bf5571cd08cf3115fb96002873c004b..979a674517d8b270309a4ce92534face0f2ba855 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -319,7 +319,6 @@ static const struct dpu_intf_cfg sar2130p_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -328,7 +327,6 @@ static const struct dpu_intf_cfg sar2130p_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -338,7 +336,6 @@ static const struct dpu_intf_cfg sar2130p_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -348,7 +345,6 @@ static const struct dpu_intf_cfg sar2130p_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 05b0962c2d937f077d0b42fa8af6e2da40c7dcae..ffee0740ddb5c13dbbd2ca0d70855cba27f73ca6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -320,7 +320,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -329,7 +328,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -339,7 +337,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -349,7 +346,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -358,7 +354,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -367,7 +362,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_3,
 		.prog_fetch_lines_worst_case = 24,
@@ -376,7 +370,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -385,7 +378,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -394,7 +386,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4482f2fe6f04e58408b55994d885ea1c717c6a07..df1eeb9082f74ab734c235f0cd0baf8c0eda14b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -104,9 +104,6 @@
 #define PINGPONG_SM8150_MASK \
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
-#define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL))
-
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index e1c6df3a3b72ffb5a816bd18266a35abe723fbd9..bc71ec9a5bc8b6e15d7af13c42ba5d4197729822 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -139,17 +139,6 @@ enum {
 	DPU_CTL_MAX
 };
 
-/**
- * INTF sub-blocks
- * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
- *                                  pixel data arrives to this INTF
- * @DPU_INTF_MAX
- */
-enum {
-	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_MAX
-};
-
 /**
   * WB sub-blocks and features
   * @DPU_WB_LINE_MODE        Writeback module supports line/linear mode
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 54c2e984ef0ce604e3eda49595d2816ea41bd7fd..a80ac82a96255da1d52e1f2fa7fc39388fc3782b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -588,7 +588,7 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 	c->ops.setup_misr = dpu_hw_intf_setup_misr;
 	c->ops.collect_misr = dpu_hw_intf_collect_misr;
 
-	if (cfg->features & BIT(DPU_INTF_INPUT_CTRL))
+	if (mdss_rev->core_major_ver >= 5)
 		c->ops.bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
 
 	/* INTF TE is only for DSI interfaces */

-- 
2.39.5

