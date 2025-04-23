Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE78A99A33
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B0410E6F2;
	Wed, 23 Apr 2025 21:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lC/mJWWx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC1110E374
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:56 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAThdN022375
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 n2IXSiURqw3e1oYBn2/kGmJQ54L3uxtS1C+O6BpOvnc=; b=lC/mJWWxPv02QaQS
 krp/JJlsW9no2xuHTufXlDkD5rXY+ddLFZz/9tT2MmUdYD8Ly9kPMiO9iDxjF8tQ
 YlJClzInh1gYNigInlUgJhYiu04inPZmOrMZNulqzITLhRVbBgJNt0pRom4cRLXQ
 Yr2mbL2WRSnkbGLXmNE/VmWJwFnOHaKLxd6sVebJ11L/IfXrZ8jDdLxovBbycmq1
 gzRsj9RWR4ZpEl8GZn+d2FS9fOiOxvzZ5QOligYLo1fQr/ZJkjYJ1pN29cQ/A7+q
 aHATuvzV7ViE1opF/mfptqksA2mCU7WEvvzNhg4uxSF1pGQzQfuzIGNaaSbnEBb3
 /g30Nw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh13chk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c579d37eeeso44921385a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442655; x=1746047455;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n2IXSiURqw3e1oYBn2/kGmJQ54L3uxtS1C+O6BpOvnc=;
 b=HnwDcljVAKHnzA0Ahm6iY6m1SQAvNg/uvztr5jrYY9Mm0Ua40e/WtDHA1iBLMtYpPa
 3wpV5Bd5NB8LbYgRBSDDDi90Bx1ZofxRH6bC++eyeRYevAFds87sfcooqpTpzBPl8mzi
 E1q8P+BDVDYx4+wdDqc3i6vcXka/oxmT60egow8WPsHY088sIflnM1iYMOKoYdZe+ZHf
 gtmu1GNMaK18QMyqRoIFFVscPay0JRnponCvIVmt+FZcFePSkLX157R3I/T3uxyZgTxQ
 RvKgGlLBr+ee/RwS1eXSG6yAtzaP5uhAXOODVrIfJnBGFk5NYq6SaNECxOqjoM3kgP8c
 y2Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0TRqbqxp8/JulVpbHknZCxPXDkGV4UCmWhL9GRce6/o/iEDsMuTJF8Rh5ccUASJiMeouCIqWqArA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCjEarfgFA7RC5JO2K+WrTzDGprhCId01yXKhjghK+bvXgoyne
 q4SC4iDp/DCoO8tpH9qlPzkPR7hMFTTW6gacVJGIh0M15hMX0Gl3DnkQlfxIz5QyAvIdSnRkHbU
 2qPsNKckXiv7AxBdMh0tYW41QqEi5EBso8dJYzf45T6ZeVeUshfi6vowIzCeJqNHog0g=
X-Gm-Gg: ASbGncub4zyEQJ6AFo63dwY7uush13uraHEJ9AWV9DBbqKRe6Qt61LW6iJ4RGBvVX+b
 MEBsl3ScSm3Bh0fFJ6H5Pn9xUZjYVT0G0bzWLIOobHgsw1hFlq3uAIhncApMf8fbMar4lNUEHxn
 g9TqR6gNDeEX8dydu8mvkRMIiuMUOY1SH5Kpf5FsxN3l7p41rdTifRboblIKDG40HGBl9XurOUk
 U2XVmqPupzmgXtPA9s8tPixki38s50i1hKRtgTmUPUld3E6eMEPr4wsXGyqT/s1oRYCTeDMfRr5
 OFd8CG2P4nu1W7bTsVHlxx+oUYuZ7dKhKUfs9Q0Y9l1XshgbpQQOg3tQCJshxzGIXl7dBx4caYd
 hXc0BHYmzN1RHpSi5HQPgACt1
X-Received: by 2002:a05:620a:31a0:b0:7c5:65ab:4ff2 with SMTP id
 af79cd13be357-7c956f24f59mr47455885a.46.1745442654713; 
 Wed, 23 Apr 2025 14:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcwL831er6/8dQsXlCtaS1RwEw33Xu9Y/oLW/HlBld2FlSzofDW5HPe9vMBf6B0Ua7V1+tSQ==
X-Received: by 2002:a05:620a:31a0:b0:7c5:65ab:4ff2 with SMTP id
 af79cd13be357-7c956f24f59mr47452485a.46.1745442654342; 
 Wed, 23 Apr 2025 14:10:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:14 +0300
Subject: [PATCH v2 18/33] drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-18-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8032;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aitBeEK1lAlbuZORfcr1XUSiZGXBb4ytUSBho231JhA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcsrxoAthuShM8NE8HARFr0pMmaa+QFSo8Iq
 /P35ifg7DiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLAAKCRCLPIo+Aiko
 1b3PB/0S6ovu7fDyFkI0O1lHhaqdLMgrng8GmDHpFN7x+EElzoZ8tJKVh8GIDC0o1ed6G0DCWPO
 4P/eyDHjusNK93ymoGKPjXDlT/KfrzzwECCrtFyP0s+vQngBVSMbw4h7SvlusAIglv1otcPK5cw
 uOsk0GhFpvyxjR4yM4qcG6nQhUgkQr8eWIy/vlEoa92lt5XbJYlz14H6gZhS4atNpfoQHXvxXex
 OwHvgNmfat6UB8rGp45wn867Fu85+sifBfy0fbi31IIMYPKtK90IgOzX25ZIs6wqNRztEbHUTUf
 HcjNQwV67TnltxZgfT+I4YwOS+vqkpnUY8mxDoLSwFwVk3f3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: SDfZcKiWBEVUotrzqWl-N4HjxyHbsNPo
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6809575f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=ul0-cYutqJjMKJRySm4A:9
 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SDfZcKiWBEVUotrzqWl-N4HjxyHbsNPo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX6KmI+QvhAYAf
 HRwf/NFSsnCB+NjSatwaOfdQf5MDdJawUvE8Tayqd8V1Hb1Gh0O25GoVelRLsJFIn9WYT9djcUZ
 0GkgepLSBPYPuh8b0QHphsLJI/vBDqgWMA/lOvgmhH0EFzDbOuKFerYRyxCo5AMnxbRt8j86Gdp
 atBkgEAfvYB7c6Rnq78fuVLoeipKz8YrKW5nvUZ1Hpkffj7fR9oGVIPhTmiABkr9mWk7+d2N6Hr
 PF5W0mLnRKgDz9VMpEZvNcYaRGtIbp2ENQPf4qGsZwwMjc7VzL+iiEGLGv5YNVHSQpsTWjFuflL
 sSsRwAcEuQ+wZaMj1AMZEc5VRnzw6W8eBS4EboZdWFoz817bz++le08rtCpIMyi86xRtBc8KjSF
 W9iuux43ra8pNDalur+mf/dvL3DimYFUSM5ip0bU8L/kbvjvCNlfKaIYuBWsHB8Z9oufDSef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=877 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
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
DPU_MDP_VSYNC_SEL feature bit with the core_major_ver < 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 2 +-
 10 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index c0b4db94777c42efd941fdd52993b854ab54c694..29e0eba91930f96fb94c97c33b4490771c3a7c17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -19,7 +19,6 @@ static const struct dpu_mdp_cfg msm8937_mdp[] = {
 	{
 		.name = "top_0",
 		.base = 0x0, .len = 0x454,
-		.features = BIT(DPU_MDP_VSYNC_SEL),
 		.clk_ctrls = {
 			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index d3e4c48be306a04b457cc002910eb018a3f13154..cb1ee4b63f9fe8f0b069ad4a75b121d40e988d2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -19,7 +19,6 @@ static const struct dpu_mdp_cfg msm8917_mdp[] = {
 	{
 		.name = "top_0",
 		.base = 0x0, .len = 0x454,
-		.features = BIT(DPU_MDP_VSYNC_SEL),
 		.clk_ctrls = {
 			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index c488b88332d0e69cfb23bcf4e41a2e4f4be6844d..b44d02b48418f7bca50b04119540122fb861b971 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -19,7 +19,6 @@ static const struct dpu_mdp_cfg msm8953_mdp[] = {
 	{
 		.name = "top_0",
 		.base = 0x0, .len = 0x454,
-		.features = BIT(DPU_MDP_VSYNC_SEL),
 		.clk_ctrls = {
 			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index ac0d872ac06be7376b7b4111e1ac5f4057b5fb76..436fa56e2ba2d867b58b59ec6b02d1d0f396c23b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -22,7 +22,6 @@ static const struct dpu_mdp_cfg msm8996_mdp[] = {
 	{
 		.name = "top_0",
 		.base = 0x0, .len = 0x454,
-		.features = BIT(DPU_MDP_VSYNC_SEL),
 		.clk_ctrls = {
 			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 			[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index b171e26165f11185645ac5e6d22c499a949d8271..38cdea019bf2b1391c242953e4c67d9dc4c2274c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -23,7 +23,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 static const struct dpu_mdp_cfg msm8998_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x458,
-	.features = BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 6308dece88db70932d55d1e2d4e8af713996d9e0..176640bff1214e89606286ce572f74300f6f343f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -22,7 +22,6 @@ static const struct dpu_caps sdm660_dpu_caps = {
 static const struct dpu_mdp_cfg sdm660_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x458,
-	.features = BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 25954ae17cec5b141637e7c2eba29a1bc826b1fe..e6eb95173cfef2a52f5dc606ca41a2f1f5650c2c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -22,7 +22,6 @@ static const struct dpu_caps sdm630_dpu_caps = {
 static const struct dpu_mdp_cfg sdm630_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x458,
-	.features = BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 283e709065be31131f6bc51580296e836b8487ae..9f04c7cd5539c012a9490556a5736d09aa0a10c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -23,7 +23,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
 static const struct dpu_mdp_cfg sdm845_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 530eb74b0548b0a257abc89c3e12ab990addd550..3a0de200cc5c9751adebe681f80679e0d527ab1c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -34,8 +34,6 @@
  * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
  * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
  *			   in a failure
- * @DPU_MDP_VSYNC_SEL      Enables vsync source selection via MDP_VSYNC_SEL register
- *                         (moved into INTF block since DPU 5.0.0)
  * @DPU_MDP_MAX            Maximum value
 
  */
@@ -44,7 +42,6 @@ enum {
 	DPU_MDP_10BIT_SUPPORT,
 	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_PERIPH_0_REMOVED,
-	DPU_MDP_VSYNC_SEL,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 562a3f4c5238a3ad6c8c1fa4d285b9165ada3cfd..cebe7ce7b258fc178a687770906f7c4c20aa0d4c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -270,7 +270,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
 	ops->get_danger_status = dpu_hw_get_danger_status;
 
-	if (cap & BIT(DPU_MDP_VSYNC_SEL))
+	if (mdss_rev->core_major_ver < 5)
 		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
 	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
 		ops->setup_vsync_source = dpu_hw_setup_wd_timer;

-- 
2.39.5

