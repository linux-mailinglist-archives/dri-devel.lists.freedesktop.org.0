Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29572A9A7E7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6145A10E7A1;
	Thu, 24 Apr 2025 09:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mkwe1y5Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C96310E790
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:04 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6Ya013152
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R2Plo6/QBFF1HAXNaurzwl09t9WnclC1kSkO0ycKczA=; b=Mkwe1y5ZnkG72rgn
 vZrFr5z2BbnLubYG2vjQEXph6IeivFM6tghKq+wMVNvpWWREHErpKQclfMjYSaQd
 XGwZUGN3ip0ji5h92n8JTxxDTGwMwC+jPsS39xkW3vS9NhXAZNGjESj+7e9WV3sG
 ENq8QxfWedg/V1MV9799z1M5cFh5JNZuWxPXuJs+HgnPKcjqusH+z942ZNlgFip6
 vHtz+9614aD7cv79Lx3STWs47Q+5XBCGCiwMxI8jxFm0HoXmca3G2ECGeFFy7Crk
 Hxky5dnohQ8CCJBwWyyYmzloCcAeGHkEsr+m4VNDy3CWlZymfMy9MBvbRMFUj2On
 U+Hu3A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2d06j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6eb2480028cso13598916d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487062; x=1746091862;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2Plo6/QBFF1HAXNaurzwl09t9WnclC1kSkO0ycKczA=;
 b=VA9Jz4OXWkkoUFgLHS7Dk1T4MtSc/0PP0JnvjPaos5I7PGMCfAoldOR2g0OomUxMYO
 xgPslkLOYJo0zuK2VD8gci8JR5CLArB5vNPIq7GC9+tj5dEeF9MZ6SV9vTbvjgXMkRoU
 xrR1FykcVSw5NPi45IzWhVAJuJ7h0x9Nv7ZMR8Z3fkT760ZWFSWE1yggaqnUfF+4YmfZ
 admkVpa8mk8/gH9SZAv/f/shzS6tz/gEioqQHnC+gRpipBkoSgfKNZ1ESI/T4Z+oYEVc
 gQvatKB0vc5LxoO90nPvd2JGUSUcfXRNzjRTHnFyJXmkCCZkPPgO/c/MqcqSBl0Yt088
 ibLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVAGYe9w1fm1XKb9zki8HH700kvwxOt3kMBxt2cLKeX5Ais3Og/rRf0jzErpUY+g+6Ya0HM/eWnbc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/vGe8OtYx4C39IqSZi5qCAiFJcfUUGiqCF/FqJ/HdQj7YN9aA
 yaXs2v9u0Z/PGZ1TWMl61Dzyx0agM8yQqwemtFEZ1YLu+WNvExVDOFaCv4UrD1uYs+zkQ8Tq9V3
 Q+lqfZYmDj+6UMC351K3F1yiNRWRzH6LzYsXU2V8U/y6c8Y2QhrtQ2FIjhnhhc2MIxwU=
X-Gm-Gg: ASbGncuKmrPQK3oO2Rj9P9KuC2K4gYxNR806hhUM1z8OuKYUFujNvaDiAMWQgTtZ8KT
 kgPlDcFSaQPtRE2nQuUlxQB/anQCIpUfRNMQCMxlrBSeM0qKqRqRy4Pv+UORGah4s/kmByI23TG
 Af6XJHuVdali8lH/D6hjFC6arBA+zKs0+O8o72IEHQeEAxjVl7uy1X9RWQURIsWEXQ6fQudgqp3
 hSolmGCPVj7qQ2H3ykVl712ZLZs40CpCsfseeYPi0Xa7TJH1Ziqr4zscj+Frp7N4R7PRUTmrHS3
 aBi7BT0HEkr3DqJEuHQUHGguJLgFG6+63S52WwWLDnBphfuEzOsugT46FNJQcnZWpvlMCO4J2QV
 N7tR1iSKgJ1beFFmvXuHQlcDr
X-Received: by 2002:ad4:576d:0:b0:6e8:f4e2:26ef with SMTP id
 6a1803df08f44-6f4bfc6d804mr33930596d6.31.1745487062458; 
 Thu, 24 Apr 2025 02:31:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt8rlPlDH/a8MvnQzJpkVdpgygatDbG6zTeLQgE1Sk5DPz/AogmqatCixLLoM+SsnZM5MFUQ==
X-Received: by 2002:ad4:576d:0:b0:6e8:f4e2:26ef with SMTP id
 6a1803df08f44-6f4bfc6d804mr33930256d6.31.1745487062122; 
 Thu, 24 Apr 2025 02:31:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:24 +0300
Subject: [PATCH v3 20/33] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-20-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5292;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0gPy4u9+yg/VW6I+AUS7zPeR83r1ug1HSB+hIPYj1+Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSu5bNMbuDpHhEpy7HNgZaFCwQ5ZDMxP6sT7
 JZrYDTsT3WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErgAKCRCLPIo+Aiko
 1UfIB/9WDqSHx1nPN5xr+kKBFRcZRtKeYEFF85X/Fdg3fWJhEJiTk3D/zEEyTn0Q8lq5bCIkIDw
 W0qWuOb+GsoG0sipVZnjLVKXZbrWvDxaMcaA5lJMc4tPpMdKr6LM6DmUdMytpU+mWNNo4wxvR1N
 bU9kQVPaOPZCmGPsrY+G5mTFwnRQ/spL1z6a5VsrX2L93MqsaITAXoajkktSeQJHe9/smXXsPm7
 cSF3/SCpoHDHbcNIbXmIPqfTlf0wkULocARbfKGuyF2Vr2CIrPaBq25x/pfMcMuYs5UDhKtKs3n
 OXVX3b7vY+ndpGdQrYN1WeaMj1uh6Dvafk3wGu+3loRgN66n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: rtEmfJyhv4Jj10xbnr_hNYrX_He2kkZq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX4ch2LOpHWauU
 tXLnGLW1EtMdHH69zym5pvHAG4trTzMg/T1F4gRgOTJYtTJV9UvVyLtjnGdy9laNustPo9nDKL8
 2lZP0Ss0A2Md8L+u/aHRVxEFrPfeQoLax4o/HKKef1AG0CXZc/RZgs/ktInlxFkmTfE02C5PZ2m
 KJmvDbxP7nztQ5hFoyUapbdMrZxDzY3xYHj3+q64hWHX97h3HTn2u7joAXeiXjaL6hClsTGJG4f
 tAqKe78t48+ak5h+E+rs/QOcy8Ly2Gz5meRwiMOPJjk+xPv62gmv9gPuJBz1G7E6WtkrkmQ0u0J
 UUkOibDh4CvhASHdoVxqOm7Sr3/coB/U+oNf8uB3+WzT9RBPrZqa1qLW/JG1WEtms9EAm3iBQCe
 fGJVGKlwvbEiq56HJCnlvXP01JEu9WtW1yKVHPIZ/YsOQ0qVlsHcLsR7/sF4qf37D1Z3OZEn
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680a04d8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=H1s5W502GRu5WLOynKcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rtEmfJyhv4Jj10xbnr_hNYrX_He2kkZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
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
DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
core_major_ver == 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c              | 3 ++-
 7 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 9f04c7cd5539c012a9490556a5736d09aa0a10c1..21264184566493ab4e356a4e0c032ee7780cabff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 static const struct dpu_mdp_cfg sdm845_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index 3a60432a758a942eb1541f143018bd466b2bdf20..ce169a610e195cbb6f0fee1362bcaaf05df777cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -11,7 +11,6 @@
 static const struct dpu_mdp_cfg sdm670_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index c93213682a5781bbd8ad137152c9be8bb1e6efbe..634b7dc452839f994c948601fe9a09581cb42a42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 static const struct dpu_mdp_cfg sm8150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 5da17c288f66f4b7b5fef1550fcc9793f524115e..59e280edcd508c14ee297857a19e9974970566de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 static const struct dpu_mdp_cfg sc8180x_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index e388900623f0de4a1af10d22a6b9bdf4842e1f40..af0d789c47917e9b712282a542c3d0886313c049 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm7150_dpu_caps = {
 static const struct dpu_mdp_cfg sm7150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 0f8c24ad346568464206eaaeeb199955788ed505..a493dfffa9e4981f4c3f6e05dbbf14e1416f07e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -38,7 +38,6 @@
 enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index c49a67da86b0d46d12c32466981be7f00519974c..5c811f0142d5e2a012d7e9b3a918818f22ec11cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -280,7 +280,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	if (mdss_rev->core_major_ver >= 5)
 		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
 
-	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
+	if (mdss_rev->core_major_ver == 4 ||
+	    mdss_rev->core_major_ver == 5)
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 

-- 
2.39.5

