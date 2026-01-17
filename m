Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2472D38CE9
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 07:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7AF10E290;
	Sat, 17 Jan 2026 06:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLcE31w2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dXuSM49T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0597F10E287
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:06 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60H3k2XP2740408
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=; b=jLcE31w2IBpt0At+
 bSqTZkfYMVmDjqiDGwxdmFUD3RXLSvubWclXzxJI/RuGrSFeYYMVpUS0xFTA/S2n
 vDz6zji4Qfk/t8FKzkLPr+U5PqeZ22kRKHR2W4eMDhsfmfqbTw7v4Jmq2lvqUKsm
 J/LopY85UWUt71jhKzdFyRgZBKMVRlUFmT6QLRYoQKBtT9LANSSBAzfN3hY1svEr
 H2LjS7meoDvxjKHT4j3E2RqkYZ95MadpYCzAwvfhxMOsSKXKL5rJu3f/KuFEuiwH
 54885+EzmjuN6ONWGEwhGHNriU4uJFPmUME5Q45Gg7xlIDqjU2zVrY01QLL6ceAE
 1Abo1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t709xa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c5e166fb75so726533985a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 22:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768631765; x=1769236565;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=;
 b=dXuSM49TGBz5pxSFmsYw16W4XQocN6Ae8ohGitbgN9MAw3Eb0mpBhydEBX2CwP/1AS
 m0HXYjPSlqCjaND0bPm0GThoajPIUI3+LRaYeZq1jZpIcQc7o6LYOGs+4Ej/M3sjSvZY
 Quo2Dez+o7eKP8mHfTG2spFIAf6nwfTvnBWke14TyqBWVBV92p0iz1DLxgpC3NSm5l3N
 k1clVoFV3pYCg7I00jn/nXP7XTEl5KTJYudmagYfV8bWB6FZscSe9mWT/4aYPy6O8a03
 y+4T4a6Xh+3K4r2bkwd0PHqnfDhBfU30aE07aVGRaXfPrefUT8s4dsrI+GokkrlFt5ZZ
 rNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768631765; x=1769236565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=;
 b=sPBOFgEGTce8BcpeG3eRjK3QeaPUHgr9F8q93oEaqrjPWZGJooWZzY7lGKQAs073Ss
 qkCw19Qk2w8o1gSoHLsfZ1P8LIZrRtfwjIKg+riCp+sIy1YZuwDuB0Sfhml3503vy98F
 Qd7/3IbbV59gU4wepRmpXSXqd3ukJM2dewBjaRu1VucSptBakrSN26e2+M0peVN/BIaa
 gYX0FukvftkQqWaBoeJhqvXnf8oBtJhG0MguGCCxnofHUVxJjnzlcKJ+BrlIq2xuK7Rg
 ejYmSjbidYUprb8FB5e/mRD7W3x7ILAolPcc/tx9hta3UekLQz57NHUJhwpBPfRb2oYF
 C+3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGJAPBkhEXasCyE4eM1MBAolwMMn3dCKDpDAFnYHHixMEiBypWEDcTz7+cNrMc1tEQhmHMjl+vbRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkTimaZ3OR3LnubD7Ke2vLSJRMa52uRRdEH3MzO+RjBmOmAwWU
 5D2RXvrHvTbfGj1Vm61f3yymP7QvjtYAb5ckx7W4rKCXNhfksj72py+eAMVfYTlrEoxG6ldyAlS
 gCO120MZ2r/FQB/edC0TnitNa7/85Plsv0CJjozHPQEZ1EAMHxVkzsjeWUC4u2QhgNO6qFYo=
X-Gm-Gg: AY/fxX43aFNDL6bA99vbvQ4qXa5xYPsXwWjPRNhEmw6G2rbhobMJWi6Fgh1QZscawTI
 FJZ8FlsPdG42thvcSnMZxBvOriCH1iVTAhNf4dFwX2cFmwjzcmGJEQERU1zcrcItNBeoAwjZ9Z3
 3bQd51UxtqZO6W/bA8sSsDUKyBhPhvkp13U+D9lBLF/5ekExWqzmLYLmG7SCrn8NAjp0rs9ZQ4o
 56XXzZH+1o1ExpVp4msNJOTcotQ5kj60QctQLk8dYP8A4xApHrnZgM8K4Gjo4PpOmGsjupSxhBf
 Oew+Mecu0J8AfF1it47AHkLpgBVxZf4eaVFvXokwr0YLLxd5WiOOgySsp1aNfS2Zr+7sWNJFAiK
 /1TYzFWHvUqdDyxXA6PCwma4X00wBBUelXSboU3siND8DHq0hwzwsdRfGyNR/H/nk3HRG5KUl6M
 EK45Qo71DYr6Rl729RXVVIIbg=
X-Received: by 2002:a05:620a:2699:b0:8b2:de6a:ca with SMTP id
 af79cd13be357-8c6a6764a8dmr777936885a.52.1768631765271; 
 Fri, 16 Jan 2026 22:36:05 -0800 (PST)
X-Received: by 2002:a05:620a:2699:b0:8b2:de6a:ca with SMTP id
 af79cd13be357-8c6a6764a8dmr777933485a.52.1768631764752; 
 Fri, 16 Jan 2026 22:36:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e790fdsm14049851fa.23.2026.01.16.22.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 22:36:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 Jan 2026 08:35:55 +0200
Subject: [PATCH 2/4] drm/msm/dpu: offset HBB values written to DPU by -13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-msm-ubwc-fixes-v1-2-d5c65ea552c7@oss.qualcomm.com>
References: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
In-Reply-To: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pAwvHUCEcXNpm+LDy8SETL5I47IZwg6IMDS0FVV1308=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpay3LwLtC+kj2HBoDxcWwc+QhCyCWUb0ECl5wO
 d89f5P+uvaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWstywAKCRCLPIo+Aiko
 1XrhCACVi4wbYAVIcssEV3/mLOyF3vso5kep+hgNtASJMx/eNsD5wt/+iZRV8Q1XNOfcPViiQ8Y
 OPdGumJpMcoPhXkkmxMJ6yWcFSWmZu90i165KrX/iUssDk++S4UwhqBWnp6RGxhTr4hnhS9xNQl
 kHc2bjThbFxBTSWpyperO3O6sZuJih1IEDCeedXq9AJxKwmFzEw/UCQYLQ+MBm/f0/rZR5/27+s
 7rc1GO8L3+KWKXb/1FqL3Ids2kLd957fdGtr2o18GBY1rIkR6p/r9Z0W5ZwFBrfo2lGsxI4Cq/F
 0yEOxI3POI8B4USsdj9seca0a3LcJznUlIG6rp2XliYvnCm7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696b2dd5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iGWu5DhtBPyiFZBs7r8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: vE7SK-dEG4hbELmetAn4-ls3p0-VRRmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA1MiBTYWx0ZWRfX4LyW5xLFtMzc
 gaGzguIjIRHXtq3LT2UWNjwzOgzxEqG/Gy1ggVOjhAujWIApN/uJLmBQPYFLwavY5CaMczzWuN+
 /gv+5hlvS6E2oO30uEg+poN+ya4DPP1D43YclUjxHy06Sv0LM/ct3O8TepzwQq904gClKEZ255o
 YXElqfx2T6DDqrbEAozKKU39KxhROePstOIB4A2GekH4g/jjdE2SVQ4UFdVdphSsoAiRRASVl2l
 J1HQBCH8J6eNjIB6cZMFxybcUQ04AVucihk3isxW+YfHUoC9CTYY6GNYrTyzZAH/m6N6rldAira
 Rwt/AKmPwjI3fuG8AO8EMm9wQVMI2MqO36jR6lDJKyeeQF0ksW6Vg3b30e+Ho+H9+iQTtvuNJcQ
 lFB+DfUAXGU4bA1myCe1vkAQ+RwzEnVH1Vxd1IQnBJsmkjHGSQQJKW276EwUXlfpGM0wYqR68BG
 shGCF622heuUe9eAK9Q==
X-Proofpoint-GUID: vE7SK-dEG4hbELmetAn4-ls3p0-VRRmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601170052
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

As in all other places, the Highest Bank Bit value should be programmed
into the hardware with the offset of -13.  Correct the value written
into the register to prevent unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6f1fc790ad6d..b66c4cb5760c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -270,30 +270,32 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		((fmt->bpp - 1) << 9);
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
+		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
 		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
-			ctx->ubwc->highest_bank_bit << 18);
+			hbb << 18);
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_3_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_4_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,

-- 
2.47.3

