Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555C0AB79EE
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 01:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA4610E756;
	Wed, 14 May 2025 23:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxQjIzSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E324A10E06A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKpMdF002539
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QfSpLV4uLPn2Uvfn/ksjNsnHeDxyMMKqQXaN8IP8v/0=; b=fxQjIzSR2q8+y5by
 ym1LLMCx3s2zXLUMYyas/A9hlixKXpqX5vndBBixNxzKQJtLchPJ8y1cgzuTKctI
 xsmgGO+PgapWFTNX67Tv8+04j5vAXE/BfVVF+6iw/1RN5XMPXv9HTWJjhAnzDnax
 Q1P4nHOVF68zgotKHgW3dmIAiiNJkyY79irk6cGxP6R/uXIuQvp/oL0vYnW5JUvF
 3rGkHrmxumABd0wO4ussJiVvqLTX7lIWic9xe8pvFG8DXeYv+ILW1TQlom1LoC0G
 5h5RnHHM4285oU9ueeRTgM0+YzLFm/PF94XpLRg0q5pbsQ4DAxyC0//v0r8TLcTo
 LglN7g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex4c5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-22e5cd14e48so2670975ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 16:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747266765; x=1747871565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QfSpLV4uLPn2Uvfn/ksjNsnHeDxyMMKqQXaN8IP8v/0=;
 b=ASCXVlNHbuxHg95EZJv+LoB47S6f/EaWTYlfzjdS8YUDFj8h6gq9L/pvy6vZ/mkrya
 zZML2N5Yy1i6/H6mGTVHzUUxEm2wTxsbPRXbOqS9bhh5PL0WE+hg0+W306/17ezhnmWH
 dLnRcqPGDm72hlZcSJYZhBVu/LMRrRSSrd9mXhi8P6Ye0TIta2QNrz72BMkgCfwg5p1w
 YFGhwn9XjoIcmzzs9XT9EN9vSJrFjwSFOtG7HXRu8g9wc6iOvy8WTyfR4HkfaqvydofN
 0Hoo+QqcbwTc8M2kkyFC3jlmNs2x2P5bnk6OakDTnt669eQ/dRyvTKm7Jm0xiw/Lv6gR
 nBOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL3T9Gtsv/uGh1suHsEq6NNK3ScHkQPxOAXKj84JmcKvpv9l3bM57f1aqmuZqqoAUQ0hdxHLZ3lZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2zTDA4fiIJQ2nxpskon0NBoR0sfWUCcn+VvmNDRNWBVDAX2dS
 7HbUkB0MjlBu867tCesHpzyKgoFggVFlNO2ISvnE07SH5bwqkAOMkMMw/u5hmcge80pxftsihYV
 kr6IktsUC//v9wVFETEmG3UVx2RH1o+mVQPElscMAw2gUrGhPO2ARLXuJH8ockR7N/nQ=
X-Gm-Gg: ASbGncvzxxF4LB+FNDdXkHmnhJRdHPQqhdQFdS+M3iRpD71F8xBpeZrXNQUR+JCi6Jb
 axuAOieGB0pwC9o1Fm6FWCiHp7h9XZgVnUecNMOWPe6LzXbZXLuTtBrA33C7Gs9K9v36mKqd+r2
 YSa9XR137vapgCbD09DCuUkAkRVXWZVHtoxJJGg1BN4YZwv8R6AmxZI4BVDH+smlzz2ZK5kjyoa
 U3g5Q5kVQ223vj6+YEgGhnTL+BJcrbxVdprbJ4bnkm/m8JInHqwqsZCE7B2Tz/z8zkRfeLdfChy
 AI9VGRNndI6/hKnwRZ0g+3GRBc4D11+keisymKC1Hz68yik3oofhf90dubvV8u5pJqb2oDQE
X-Received: by 2002:a17:903:22d0:b0:22e:5389:67fb with SMTP id
 d9443c01a7336-231980c7727mr70530265ad.7.1747266764470; 
 Wed, 14 May 2025 16:52:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbQOZDXREyZcVfY88PTcvMDxeRBQjaHGKMXiK6MsEQwJYd4dIQTiqlP8q/7IDTjIDWf5kFrg==
X-Received: by 2002:a17:903:22d0:b0:22e:5389:67fb with SMTP id
 d9443c01a7336-231980c7727mr70529795ad.7.1747266763839; 
 Wed, 14 May 2025 16:52:43 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 16:52:43 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Wed, 14 May 2025 16:52:30 -0700
Subject: [PATCH 2/5] drm/msm/dpu: Add max pingpong and dsc width to HW catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-max-mixer-width-v1-2-c8ba0d9bb858@oss.qualcomm.com>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=49595;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=nCSq6OlfZwTps329MQg7IWBHTHk/iD+YRAV1hNfF7T0=;
 b=r67/tiNCtWdcSsgEoIpDTfV8oLr8hNLocI6SMTLtSVwiLHOGmxrt4/8cb9YuiLfmI05ewMdMF
 3ZuQ9wWGuSyAaqfjH/6A7/YrJRAE6AwOZ/tMvMogGhmrLx2aFHVNBTl
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfX4SWE4Qno78Ue
 7uQnFuHvkwAdJk+QaahCDUD8BYaGCZyF/wQq4l1ck6uOIO9MAKaUBIITjd8u+pKWrFTWQDBLJX2
 cFvGBl/PfeqSwacPiK0KlR8pXk0XqigiaE3BVCS1/bV7HeJnjCVPPipekRcH1WuyPJy08XDgy1Y
 UnLGttr11vcPbvmVDAGCFYa0XL1YQG8XdlsJRtYshGOPdiQdDroxkfUmJxxCyA7wsQk4+n1yLJz
 ddah6JEQQq87uZ168xvHHFT03rCYe8KxwKEeMSWK8CrDyADYL4R1sZLYvhIZzXLvDSQlgsoDH5S
 vHocpE/cuO50P0tNlNPLvHhS7qawWlEsN/HBcjfIfdo1Az4lNPfyCeuuFPVIxBJ51ow9INGGEIW
 aVo75kbGfpPeAzOfGwDUwBfjqXvvvRbx4pKsWFyGtLWv+TrnvAl783DAvUsx/HOudP53C4SI
X-Proofpoint-ORIG-GUID: 0O0GjbI1LiNWlNXq9gVQNLH65El3PT83
X-Proofpoint-GUID: 0O0GjbI1LiNWlNXq9gVQNLH65El3PT83
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68252cce cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=iw1z9ScEdSCrm4yMxkEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140222
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

Add max_dsc_encoder_width to dpu_caps struct and max_linewidth to
dpu_pingpong_cfg for all chipsets within the HW catalog.

Note: The max supported PINGPONG width was 4096 but increased to 5120
after DPU 6.x. In addition, DPU 8.x+ increases the max supported width
of PINGPONG_0 specifically to 8960.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 11 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  5 +++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 10 ++++++++++
 28 files changed, 133 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 6ac97c378056..9db31591e27e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -9,6 +9,7 @@
 
 static const struct dpu_caps sm8650_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -214,6 +215,7 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_8_x_MAX_PINGPONG_0_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -221,6 +223,7 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -228,6 +231,7 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -235,6 +239,7 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -242,6 +247,7 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -249,6 +255,7 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -256,24 +263,28 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	}, {
 		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_2", .id = PINGPONG_CWB_2,
 		.base = 0x7e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_4,
 	}, {
 		.name = "pingpong_cwb_3", .id = PINGPONG_CWB_3,
 		.base = 0x7e400, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index 1f32807bb5e5..4ac89cadf328 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -101,6 +101,7 @@ static const struct dpu_pingpong_cfg msm8937_pp[] = {
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
 		.features = PINGPONG_MSM8996_MASK,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
@@ -108,6 +109,7 @@ static const struct dpu_pingpong_cfg msm8937_pp[] = {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
 		.features = PINGPONG_MSM8996_MASK,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 42131959ff22..dbd4129439a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -94,6 +94,7 @@ static const struct dpu_pingpong_cfg msm8917_pp[] = {
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
 		.features = PINGPONG_MSM8996_MASK,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 2b4723a5c676..a93976f6167c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -101,6 +101,7 @@ static const struct dpu_pingpong_cfg msm8953_pp[] = {
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
 		.features = PINGPONG_MSM8996_MASK,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
@@ -108,6 +109,7 @@ static const struct dpu_pingpong_cfg msm8953_pp[] = {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
 		.features = PINGPONG_MSM8996_MASK,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 5cf19de71f06..e2e99504c715 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -181,6 +181,7 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_MSM8996_TE2_MASK,
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -188,6 +189,7 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_MSM8996_TE2_MASK,
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
@@ -195,6 +197,7 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
@@ -202,6 +205,7 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 746474679ef5..1bdffe168fb1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -170,6 +170,7 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -177,6 +178,7 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
@@ -184,6 +186,7 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
@@ -191,6 +194,7 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 4f2f68b07f20..03f46a652449 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -141,6 +141,7 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -148,6 +149,7 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
@@ -155,6 +157,7 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
@@ -162,6 +165,7 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index c70bef025ac4..011e98e6e7db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -115,6 +115,7 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -122,6 +123,7 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index ab7b4822ca63..152fa5ea12dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -194,6 +194,7 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -201,6 +202,7 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
@@ -208,6 +210,7 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
@@ -215,6 +218,7 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 979527d98fbc..7f0754e47c2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -218,6 +218,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -225,6 +226,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -232,6 +234,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -239,6 +242,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -246,6 +250,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -253,6 +258,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index d76b8992a6c1..1a904b68950a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -217,6 +217,7 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -224,6 +225,7 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -231,6 +233,7 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -238,6 +241,7 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -245,6 +249,7 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -252,6 +257,7 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 83db11339b29..7c65f77a2c43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -164,6 +164,7 @@ static const struct dpu_pingpong_cfg sm7150_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -171,6 +172,7 @@ static const struct dpu_pingpong_cfg sm7150_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -178,6 +180,7 @@ static const struct dpu_pingpong_cfg sm7150_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -185,6 +188,7 @@ static const struct dpu_pingpong_cfg sm7150_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index da11830d4407..f0539dd11dc8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -145,18 +145,21 @@ static const struct dpu_pingpong_cfg sm6150_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index d3d3a34d0b45..a357567ad597 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -126,6 +126,7 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.merge_3d = 0,
 		.sblk = &sdm845_pp_sblk,
@@ -133,6 +134,7 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.merge_3d = 0,
 		.sblk = &sdm845_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 47e01c3c242f..c0bf1eba1eab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -216,6 +216,7 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -223,6 +224,7 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -230,6 +232,7 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -237,6 +240,7 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -244,6 +248,7 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -251,6 +256,7 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 040c94c0bb66..d004e7ee71fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -115,6 +115,7 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
@@ -122,6 +123,7 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 43f64a005f5a..b0659b55542f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -78,6 +78,7 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 397278ba999b..ae0196372f35 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -124,6 +124,7 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
@@ -131,6 +132,7 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 3cbb2fe8aba2..d9bb18f11a49 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -78,6 +78,7 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a06c8634d2d7..8893b39e2ca3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -80,6 +80,7 @@ static const struct dpu_pingpong_cfg sm6375_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 0c860e804cab..6ded8b0309d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -9,6 +9,7 @@
 
 static const struct dpu_caps sm8350_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -216,6 +217,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -223,6 +225,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -230,6 +233,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -237,6 +241,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -244,6 +249,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -251,6 +257,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index e9625c48c567..e1512ff5945c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -9,6 +9,7 @@
 
 static const struct dpu_caps sc7280_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -126,6 +127,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
@@ -133,6 +135,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
@@ -140,6 +143,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
@@ -147,6 +151,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index fcee1c3665f8..2a084ee071b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -9,6 +9,7 @@
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 11,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -216,6 +217,7 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_8_x_MAX_PINGPONG_0_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -223,6 +225,7 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -230,6 +233,7 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -237,6 +241,7 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -244,6 +249,7 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -251,6 +257,7 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 19b2ee8bbd5f..2cb3966ee51f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -9,6 +9,7 @@
 
 static const struct dpu_caps sm8450_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -217,6 +218,7 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_8_x_MAX_PINGPONG_0_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -224,6 +226,7 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -231,6 +234,7 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -238,6 +242,7 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -245,6 +250,7 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -252,6 +258,7 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -259,12 +266,14 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	}, {
 		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x65800, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x65c00, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 4d96ce71746f..1135918e0a86 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -8,6 +8,7 @@
 
 static const struct dpu_caps sa8775p_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -216,6 +217,7 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_8_x_MAX_PINGPONG_0_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -223,6 +225,7 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -230,6 +233,7 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -237,6 +241,7 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -244,6 +249,7 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -251,6 +257,7 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -258,12 +265,14 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	}, {
 		.name = "pingpong_6", .id = PINGPONG_CWB_0,
 		.base = 0x65800, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_7", .id = PINGPONG_CWB_1,
 		.base = 0x65c00, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 24f988465bf6..0516e75a3a16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -9,6 +9,7 @@
 
 static const struct dpu_caps sm8550_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -213,6 +214,7 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_8_x_MAX_PINGPONG_0_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -220,6 +222,7 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -227,6 +230,7 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -234,6 +238,7 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -241,6 +246,7 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -248,6 +254,7 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -255,12 +262,14 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	}, {
 		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 6417baa84f82..23d044e10c75 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -8,6 +8,7 @@
 
 static const struct dpu_caps x1e80100_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -213,6 +214,7 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_8_x_MAX_PINGPONG_0_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -220,6 +222,7 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -227,6 +230,7 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -234,6 +238,7 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -241,6 +246,7 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -248,6 +254,7 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -255,12 +262,14 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	}, {
 		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5f1f3eae0f6f..194780905d29 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,6 +24,12 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
+#define DPU_1_x_MAX_PINGPONG_WIDTH	4096
+#define DPU_6_x_MAX_PINGPONG_WIDTH	5120
+#define DPU_8_x_MAX_PINGPONG_0_WIDTH	8960
+
+#define DEFAULT_DSC_ENCODER_MAX_WIDTH	2560
+
 #define CRTC_DUAL_MIXERS	2
 
 #define MAX_XIN_COUNT 16
@@ -336,6 +342,7 @@ struct dpu_rotation_cfg {
 /**
  * struct dpu_caps - define DPU capabilities
  * @max_mixer_width    max layer mixer line width support.
+ * @max_dsc_encoder_width    max dsc encoder line width support
  * @max_mixer_blendstages max layer mixer blend stages or
  *                       supported z order
  * @has_src_split      source split feature status
@@ -349,6 +356,7 @@ struct dpu_rotation_cfg {
  */
 struct dpu_caps {
 	u32 max_mixer_width;
+	u32 max_dsc_encoder_width;
 	u32 max_mixer_blendstages;
 	bool has_src_split;
 	bool has_dim_layer;
@@ -530,6 +538,7 @@ struct dpu_dspp_cfg  {
  * @id                 enum identifying this block
  * @base               register offset of this block
  * @features           bit mask identifying sub-blocks/features
+ * @max_linewidth      max linewidth for PINGPONG
  * @intr_done:         index for PINGPONG done interrupt
  * @intr_rdptr:        index for PINGPONG readpointer done interrupt
  * @sblk               sub-blocks information
@@ -537,6 +546,7 @@ struct dpu_dspp_cfg  {
 struct dpu_pingpong_cfg  {
 	DPU_HW_BLK_INFO;
 	u32 merge_3d;
+	u32 max_linewidth;
 	unsigned int intr_done;
 	unsigned int intr_rdptr;
 	const struct dpu_pingpong_sub_blks *sblk;

-- 
2.49.0

