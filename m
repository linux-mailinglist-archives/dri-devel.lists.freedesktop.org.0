Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC924A99A2E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A881C10E3C4;
	Wed, 23 Apr 2025 21:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnQfSZxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317D510E374
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:01 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAp60J022006
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hv9zz9wb6xipfS434Z7bT9JzA0CQ+j/JLYzVfFk2DN4=; b=lnQfSZxgM/HXigxB
 xK9OuqSy4rU8tOJacd4Y7x8se/CPTsIkQoJ26PEaIr+UYvy9fgB4/hdkWclnNL/U
 ghsKS6KRascJcojTvJ+lOqZDfwacWVPfZz07yo0j8N+Cb8XxtRcx6sOb5e/OSQyh
 CKKp+2FZ6UsZsyHbN4Vf+BZL5+NqoOW1ndSflB0tz6InZZWNUReiTrLDnkc8UMcs
 GlBgGYdANvzBNqQiefnI+pnMkVURvrvdzqLLizvAgT16/2pGShwz+FiJThw9yULq
 +5pYYcMAedPR9nwlvaUKCxhUsrSXy5VChWztdQsO/RilBrHeRQQ9yX/D/OGuqpa+
 VXHM/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh13chv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c09f73873fso36870585a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442659; x=1746047459;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hv9zz9wb6xipfS434Z7bT9JzA0CQ+j/JLYzVfFk2DN4=;
 b=hH5Vi3o8GYrk6vYl0r3/vJiRP2jRY/oeN/zPSc9I6/lj4tYxfIWYInuauMhuOZwlJF
 GD19NubcDBxBCjnlkn7g+idiFxsq6w2CNldEht8qRtzxzxAee3Bv8th+lnar43R8XaEv
 S5oui3JvuNMQ9BWAfpS/xaNa2c65i/1P5UZHRejX+g/a2jZlClNk1KCHVjkbm+c6b0tz
 2mzt38ZCLKbB3b5+TxPnhWA0e3zD4YfZKQNHCtvAzGXtb49J1ezc9V1IRalb3hzJcicu
 PxwXaSKbWBrOpTsj7JVUaqqxQNana1ErCfoSRiAFaTzme4l0lSihLrutYLWTBaNu7yvs
 +Zwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXexP/D0DHgtg3JyQw3vBn788VXqzNzYAzk2aoocgH+DGAQU6lPR+yiUxwp2udktyTMqWrNA37W9I4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxjfnC70Z1BjWUgDFojcdLh/LJ3Ez2JiOlX2Dx+nn+s4CvFSzr
 QtSiS/GkRtSG7PKCBttvtHDpY8GoULHbqKenr/3qr4gQxGh6GxwaEw48JI7tBChfaifOnQWNBBS
 2FihqQh+R4lmL289Ra0qQYp5jDQUjax5ClmMM0GVKIqr8RJy0dyqRQJ6aRAkaRHQ0Wgw=
X-Gm-Gg: ASbGncunqXqZFBCsNsFHHZEoWj9YYqp5/6eohBdJufgyk2DnVqfo0iiVqwIO6/f0o9i
 mqFk2QtDZphRA3zS2Y2CpPxkf82Arj0c4f/DNa+KSXbzXTv+JcXzemNJFB5EMvWfgdAr8CmqrzR
 6blZRlz7W4Q4MiGwMUN7/y+3rAYSPb5fcgjvSyy+fomcODsnLtln+Xo7AJMOIIvdQeGV/gjqayD
 wvY0lg4wMkS3iXtnYBR93DkIh702PO9qcgGvOENqZHKXtGtCt06Q3jlt61ZCaprj2dSLc0mZcrc
 iKwuP91R+w7yZa9+Hi1pjD4LQVi2HYrX2m57zpZmW3IDmXTHRVeXBxf9JJ9OjPWfEh5uJl0qgmi
 TDs8lpSJwx/Ol8CjfSniahxm2
X-Received: by 2002:a05:620a:bc3:b0:7c7:739d:5cea with SMTP id
 af79cd13be357-7c956f33756mr50591185a.35.1745442659343; 
 Wed, 23 Apr 2025 14:10:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj6ywVyzz7LTrJkvHpxsr9G9arHXs/wv9WiLaahFB+vwKNB4aqPf3qOvnuTxPjxtgHKakUVw==
X-Received: by 2002:a05:620a:bc3:b0:7c7:739d:5cea with SMTP id
 af79cd13be357-7c956f33756mr50588685a.35.1745442658998; 
 Wed, 23 Apr 2025 14:10:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:16 +0300
Subject: [PATCH v2 20/33] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-20-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5292;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0gPy4u9+yg/VW6I+AUS7zPeR83r1ug1HSB+hIPYj1+Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVctv7pebZX8R6HIgsPPMTWV8ZnTuEFol68ym
 Gt9euCIW86JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLQAKCRCLPIo+Aiko
 1QXYB/4g/IoeKLNQZJl+v4Uyd8xxAlDD+c+En9zi8L7yWLn0PTQJJxH9hbTxO5r9p5mn1eeeBHl
 hFPs6rM1ieQUr6qai6xrm/oQwPzIbcmG14ux2tH/E3V1L5R4Gz8GGDXfPQK9GmqlcBjqrLCtbLX
 OaiAHFoW5ZeelSZi80nsPKml+r2rmR0bO/dSm7ImeGNB0pvTbvPzUL39xBYLPl/MDz2zSWsYPCm
 dbBE5PY26a1q87tmtrrVfNk7/cDDwxXK8VaM1kmDlJ3KUqYfILg8HopWs0z66msUrLKCOzHriHa
 b7WbrevaWJ2RPORPz/5nPCheDPEJTDhvk9feainFErzV8xRJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 2Y2vxM2gi-xV--zmCwvGjyKboOmiblOh
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=68095764 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=H1s5W502GRu5WLOynKcA:9
 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2Y2vxM2gi-xV--zmCwvGjyKboOmiblOh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX+RheH+PBBGVm
 QPJGGi/OorlOSkmQiRA6236FisthzVoEOCZ2fawLewz4gwfwP6XXvA6+dRD47N6tsIHxSAV/hr6
 AIoez7eQhsJdqvodB7NohRhC3ilnYEteH9Prq5r1sxIMwhpRlfzb6nfPTuYkB+S+8Qr8Xie5My8
 5da1V5zkXAjPzxLl8SzqLElT/WiasdgEQgXx3bWBqT6sYHuYf2CdZfWUr4wLe09eGiavKm2tK1D
 UP6Oug/joCRe/NVtlj+o6ST1Rz13E8CO0HzSnAwKfRvM6TUlJMGxBJgGn/OLgxNlMIEslFKJVPs
 BmKiXCw+1MifpaBG4lw6KnbHZiofNolXKh8egOlOuFXGHoVkih61PY3qE0A5/SqaS0Age295Wm0
 ivFaBKfTOQ9sS4syJY/WTcfFvCF/exFTxVmyDimkw/PxApfqNw/eE5Zp6sc/p8ToL+Y9T7kq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
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

