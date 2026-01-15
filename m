Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3444D2383D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352D210E723;
	Thu, 15 Jan 2026 09:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDTgE2AD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSzSwEwQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA84C10E720
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fjUd2074022
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=AlSWjXvP89D
 8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=; b=UDTgE2ADHhAYkSlFuJ00p+0Eam9
 NdoLZ9G8OwlM8PJ6BGKIqKLCKKIdA9gFPH4Oh0gfQ+9pgBkfRnJc7mVN98BfDd1X
 L3vUDcUpEz4sBgQrh9qNEeUiUEcz0b6H1VJS+C9x2m7xbDN5KERD9fnjLebgwMyC
 Yfulohv5RYLoQNeOXj5iR3+PEqNB0wTDNyZEla9+k6cVd1+i7xiOBmGO3sX9Ezfz
 QZ0owESgCF7x0XbURD9JXOAGOqdJmmk0NyvoDIjtCa+JKLBcNm7VMTfa3D/0kkFq
 cVT7WwZEZFvPvrChROEBSqAts+rxRAl1rG2jBFTsKRWMpwP+Cueo4zQSGkA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj9hy98-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-50145d24ffcso22815771cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469344; x=1769074144;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=FSzSwEwQkWHNKjUk4OPnrI1eifaffpjBUDkE/w9qFSft4GCgByeIR2/czg8Ie6Pfi6
 O7/7og4/1YsdYARn/YLxOpILI6bmYK35LZnNFOlspajR5oyK4Yxb8M+4JSgedwnQhmNP
 WhdWSG5RlP3lMev6SwEIB6Qflz9yCho8601GJz1X2XUlmGUOATljhdgLVXv7vbGiGNif
 gr7y/gT04y1FC+AdDSn+tdMjMoCnM8zxTahIO71PFYPcJm8TJAcnSKYsESZpm0CZjeh4
 V5OTVm6+BL9xWwd+Uj4NqokKc6AkDaRFM75mIJ4Huu6E+4i9fpOwcSySLmFOdYmqgd2e
 7YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469344; x=1769074144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=pgyqmFZuAmYBUkYteM3yL8MmiXu+v8GKeDyivJcbjNYxbfJjvG7vHEztQWXFTCiiiN
 kV0T/xD0qEPNWrpOuHj9FIL0Ps7C23f6WysiA3Xt7LuRgUhjZoEABZy1cc1iWGPH2YOB
 ZjwK+6VJBCo09hKUxsKEwUiljtbGKxfI7jTiszTAglxN8PbJxjYD4RG6JCIpReGDKrsU
 Bw5XoVoguPxWTJF34G5gXeLSicdsANEErtYMb/VCdHEI1BgxTpB2FmKmAp3z+yDJkWex
 TZvGIB7s9WK9oJYsqBjjoauRz8j0lpIsTIEn9mBpyTejT+EUQ0hezS5hc7ELnZyQTBHF
 jvlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDzkKI2DPGVmM2xUO0MJnbk3RLlCHqB6n0kFFH7SJvdLrk5XOTZXOjxZEMWDiJpFeqPKNL19NdMOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9guTPMyoH95CpV73UO8e2l2bKZNDAhcLtrHW8n8wJuZMv/wT0
 SkTOJbWf+rFL84L/SxDDOgahaIyERQfzp4VfiInEp6ZCN3dXH5iulCEnsSZZRp01iZL23OgrK2u
 TqS0Di0PV5sRNNtJ1DA1BFfhTSNtQl9REaqVoS9l/LlMcZzkHdFcFGy3vjaO/S4uBTG3rnpw=
X-Gm-Gg: AY/fxX7xZvWf/BU6QK8727tp3Q7XByz39tr3lzrJ6jD6KEd/cYJQvky/8CsJeAe/k4b
 isqXvn2OdAKHX8A2UeVFdCelauZxGhiwhjyWC1DCVrfFTJy3JKbHbeDr2D/hy+3Pn3cblx4n40H
 fcUYgo9PP24OCix0c3+MAMmwGSspsv+pzlMFLvhuwD+mFcOtPyUY+cmXR6DXG9T70yDiFHoIPg/
 dJvKmdMRLMPM1nvn9OCCkz5iRLI92GWJjmzwMMTJN3A8m77d923Mo4BHvxjUijriyWN95fxmUpC
 D5UML1cBL3jAiLJ+ThWr8EgrJ4mF6GdHb4o4WeG06KQtXDaqxoogWYmFVhPg2HYjwqe07NOTZ49
 CoEAp2x8rqpZ/BK1U2bN+wSg4BVE8gtUjF3GTXsJ7X04fTEkCcuR3nbaiM5TftwansI0=
X-Received: by 2002:a05:622a:1993:b0:4ee:bac:e3aa with SMTP id
 d75a77b69052e-5019f906e27mr36434001cf.35.1768469344093; 
 Thu, 15 Jan 2026 01:29:04 -0800 (PST)
X-Received: by 2002:a05:622a:1993:b0:4ee:bac:e3aa with SMTP id
 d75a77b69052e-5019f906e27mr36433651cf.35.1768469343680; 
 Thu, 15 Jan 2026 01:29:03 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:29:03 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 07/12] drm/msm/dsi: Add support for Kaanapali
Date: Thu, 15 Jan 2026 17:27:44 +0800
Message-Id: <20260115092749.533-8-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CbsUUtwYHJ4lLeq_Qm2jAsTi9pgLygtv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX/L0Jo3BZZfz3
 ewzfCmTvm/I6F8gG3p6MsS0R/Q7pFPeadlOuu/+gXoRqFG2qytI0b9RLgcxkV2M5cHp6DkIY8JQ
 V79N9R4tD+cu5+6hxHIIZi75/SC+z0you1EBdE314Mfmojnz2ivpA7XqURYlQTEpe3oPno36Gxb
 t9b1orxBGkRqiZLpPsd0Sppt3dLvtn0lU99NLnuWemk+9Y/J2q9nnBwQXSKu9HIHjUX3IwYBlNd
 s29x+C73jq7jV8phz/hQYo9rxvgZ+0uySzbpRUaIPwanKOqs29g69MC+DI66n2jcmNsAI4LtLhA
 lU0t46PrfsJWxcYtP+x3iorlik/HV+amwKesgBuPnPdfztJZ2UbMMON1cCNHpe6orbvQoN/SjF0
 fY5BxPhwnzyxJg5DhB2cghiksfjXw5QlTsU+wixly/T9WDJqdEXc/oFLeOMq4K/UA7wrqFMnvBR
 Q2Uz8sO4AangmW0jEOg==
X-Authority-Analysis: v=2.4 cv=dcCNHHXe c=1 sm=1 tr=0 ts=6968b361 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: CbsUUtwYHJ4lLeq_Qm2jAsTi9pgLygtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI Controller version 2.10.0 support for DSI on Qualcomm
Kaanapali SoC.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index fed8e9b67011..bd3c51c350e7 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
 	},
 };
 
+static const struct msm_dsi_config kaanapali_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sm8650_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0x9ac0000, 0x9ac3000 },
+	},
+};
+
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 	{ .supply = "refgen" },
@@ -332,6 +343,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_10_0,
+		&kaanapali_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 38f303f2ed04..5dc812028bd5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -32,6 +32,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
 #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
 #define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
+#define MSM_DSI_6G_VER_MINOR_V2_10_0	0x200a0000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.34.1

