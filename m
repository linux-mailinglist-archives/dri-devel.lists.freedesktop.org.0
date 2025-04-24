Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C67A9A802
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC87110E7B4;
	Thu, 24 Apr 2025 09:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZqz9OHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8147A10E7B2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:20 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FA3m008921
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TL9IohemaggxE/oPMb+lGwcuNbosvCvTrU7VBUuq6Y4=; b=hZqz9OHSEoSEbQIP
 ifBwB5Jw3jDZSSd/oWBRIankQxMLuxny2lmsGB6BD0lPYLXixdEOtE0z3PjqYo2/
 v2+84TebJLHg+oWpuqz2elK5C3WEkLdltEb3USMG7PdqzvArCmNl51GKmkI2vR40
 MW4sF6zY6U3sUUvL2L1da7ruYuJJ1aE9uIcryEvsYQnNX5LjG/iQ0WTzAjlyIo9B
 I9ZfsaynQgXUrcZIWR+h6u3Gk4l2jZgGCqvlaydel+A3KxRAAqYViPdImvJN9wca
 aOdivtmcS5Z+qTr4XWHgiAVQg2WdT0V3gv3jt91Qr0lSsz8dgqDd1BvSj1Ppr52Q
 /X7c+Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3cy0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f0c089909aso14796226d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487078; x=1746091878;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TL9IohemaggxE/oPMb+lGwcuNbosvCvTrU7VBUuq6Y4=;
 b=lvG3lOhX17CM78573BPwQOFV1NZ6NIN5yocE/cYJH578Fl+8Ck20Cc2JY0TAp66Cnp
 lWhBkhEGxgqTmB4G17DcRLSFQ74vLAYq5cSf5vVbGJWdpwVpj4f8kL0bMgGCzqjLf5hQ
 AEHB9vUDay6knQAUquIj+ueG4Iy4zC/d8rDciRu53+CJ/XdtY+aR2ouUzkbc9juMpFb1
 PSwWj6ws8A9+Xe3iTAQfOesYEFyjianLgPFlcq0AbYelUBBm8ReQdCHFtmL7Hzmop9yy
 Wvq99PzWFk3WQoiUlR/MCUhKk+4dYTiyyzbsUyajt/G1TMm2jgW0s2iGptCrSdonRqZ1
 g54w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+/R++vOupMduakBpz7RLYu2Uehe4e/qHVu+yCZ/5mfF6kG5m6yGvNsjjldfOOGTwPALwT3UAMwco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyExD31976fgLLAtGyStGLBztVSDi346F0qiCqwGCjT09O1HdGs
 mnT0cKsDTl0vUmPGxTNQMBFxAaCXL5+pbe6z95fIIJM7TQpO+JccxMfxVrAQJp/y3ts04qqrgG2
 cup0dCEA2UzjgQWMhRRGGmaiBrjjJzsUDkH0lKjdAzHZlqWmfOApMBXfeNHTYNDPVn04=
X-Gm-Gg: ASbGncs8Rjpg9rx6CyAecP/sdqQKe8OeadqYlAxxo2O/Q7fJyncg7RFAIQJJgXFtnex
 u5ZQzIEDI/MMe9lEJRwzrUHgRw3dFSzQdONnhaNg1fZ27cf0eEU73L+19lZL2KGKy22ej+Lk68M
 v/8jsCOY3IOZwtAP2Rr3xe+mH9zfYJfqG0/iJyD/PiPIMSdNsqQ0PciX+66b1SpzrMZTirTAfjS
 CjWpGW7+MtBxh456jwXrLRQ21Gb0RmgkUPUNxQFGKppLsfc8indcxKRkuZstKcFhbx9MMaFE7N3
 /w+F0Z+IREbh8WXmj1fVx4mC5eGREApxXMa+PFPdmMG7MBUjY886sCQJuqJFSbp92JALdQ3LY9h
 UN8F83b2XyVS9eFRjGbXbKFt7
X-Received: by 2002:a05:6214:518c:b0:6e6:65a6:79a4 with SMTP id
 6a1803df08f44-6f4bfc85415mr28111166d6.44.1745487078422; 
 Thu, 24 Apr 2025 02:31:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc7eD4luaXza3qktsi5L36/1bV1AhI7q+ALQ71WdGsi+GS/QTNj6mqkRAi4hBHWhJeZ8os0Q==
X-Received: by 2002:a05:6214:518c:b0:6e6:65a6:79a4 with SMTP id
 6a1803df08f44-6f4bfc85415mr28110676d6.44.1745487077932; 
 Thu, 24 Apr 2025 02:31:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:31:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:32 +0300
Subject: [PATCH v3 28/33] drm/msm/dpu: drop ununused PINGPONG features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-28-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6066;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0Xucrl9p3RVanutrsrXG/AILscg4MPlsZPdz9DRUTfA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSwyTrNj4d1e9F6CpB67cXEzRYs7VEhZfl8W
 eTHFyvd8g6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsAAKCRCLPIo+Aiko
 1ZNfB/9iaYueFfz8QCVW8D2xKb5xWnzoYesnXm70L0TxaLdwRtSFbd/ajtTZ0mqLk9TJmq3sGgU
 Jzl4XahlCnZWpgF+iC1JmDaaOwaNKdBQWfVEizyeON2D47VvWCKRCkJ4CXC+7AZuMVJT1ZigeGR
 lWhMkYZu0a+w9z1Jpm02Zf4DpjGIq6Uj10LFS/I/yACBWyhUWXh5dD5DPuSGWPxObNA37BH8pVq
 aN5YKcI1l0yh9D2R4OxOty9C/RkPl0AgYMnxo7u2oMxeyFzpVm2PcTxbv4RTBwXS0JXy/T91lmJ
 vBTtjAWDlZWUro3J26bDeNWtS3TbfuCZ3R6LdBi2iwOAP3Si
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: RG9zZZMUt_6xNtc2X-oj1IZCOhAKgh4S
X-Proofpoint-GUID: RG9zZZMUt_6xNtc2X-oj1IZCOhAKgh4S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX/PfWbS/0h0qM
 KpXjtMNjS2lpgkV0bJ853j1xr0Yh7eEQvP/BGM0ua7JqFb9YVoApKB1DL41/RPRcHnpeLBraPAY
 uo9Okw826fJ+gbwSCEVin1sawEt1uxe4G29OWJRMYkNIVcgAJuYE/3lHllQHkJKIbO6UdT0M6Qb
 qET1sM11O01ecUQlHtqLlYhJlFgpEN/aDb7elk0u0X+4gpQ1DDoPZDHlQWhWkBh/O7hQ45lzYMT
 NI5Nr6V2kZ29n7G9/54bpuSNQE+ZFcGcHLJ5oSl1KgwBffDy2MMj7Yj7cQhK4Tre3i1E64HsB5u
 gMjLyeP5PRKR8uhpLHUwbqeaBi18FMIa/MQAb0CzhB0jQD4Kg6g9aHX5OTDU96LtPbh9i/VlEoE
 nTDL9lt6VHAFk0eordJDGytTws1LmjPzy6S0bfd6aQDg1aOK/Y3VlJXyhm4O76v8TXQBGJGc
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680a04e7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=BKnecdA5F2l9gEOK9gkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=845 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
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

The DPU_PINGPONG_TE2 is unused by the current code (and can further be
replaced by the checking for the te2 sblk presense). Other feature bits
are completely unused. Drop them from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 14 --------------
 6 files changed, 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 436fa56e2ba2d867b58b59ec6b02d1d0f396c23b..7f606be1f79fe83568b467c47e7280537f1ce091 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -180,14 +180,12 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 38cdea019bf2b1391c242953e4c67d9dc4c2274c..a10ca16d2d63d8b6e2e2165dcd4bf0cf915f8e3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -169,14 +169,12 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 176640bff1214e89606286ce572f74300f6f343f..c1fc91b3f6f85af18cf6a6c1690ec69074fc3545 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -140,14 +140,12 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index e6eb95173cfef2a52f5dc606ca41a2f1f5650c2c..65975e7ebd9ba1970b48d8753a87835677d58df7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -114,7 +114,6 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 21264184566493ab4e356a4e0c032ee7780cabff..8d5b7033f12f740fe7b9226e93fcece8ed54b890 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -189,14 +189,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4b6af58429361c49b71f6067dce8ca1daa6493fa..5eeb693f0e282da2aa0e5a729aed1bc8573639dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -87,20 +87,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
- * @DPU_PINGPONG_SPLIT      PP block supports split fifo
- * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
- * @DPU_PINGPONG_MAX
- */
-enum {
-	DPU_PINGPONG_TE2 = 0x1,
-	DPU_PINGPONG_SPLIT,
-	DPU_PINGPONG_SLAVE,
-	DPU_PINGPONG_MAX
-};
-
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display

-- 
2.39.5

