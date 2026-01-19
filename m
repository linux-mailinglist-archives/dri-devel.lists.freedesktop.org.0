Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CC5D3A866
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6312D10E42D;
	Mon, 19 Jan 2026 12:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fe/Zr1x3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i//RNljh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E91810E428
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J9mgRZ2963080
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6qC/9vKSzQzUUoZh2ZSv3mwkxmrw/IyTUO/hV1ChtFs=; b=fe/Zr1x3pNkHSHYw
 CLzWIFNmqZkyHn3sHTZV7hpcppDAM0emR/uMPBk256pr2HOWjLLn98BqQPwUaWb9
 AdctIhHq1JAhtsecMqtxt1SpLUHBnJt7qF7nCPoWfrGQAZtH5wMaQbIxn/z/vjqv
 XLRKg3xkQaSBMwQQOrOBsUQIoqk6HhmPt2epxquU+N7xAxiJBfrG07ZkFVmdWXQR
 cWyhp/kqMrYFyyX00aXtq1J1/FtSI76vhOHRiYICwFOMC11lDopEBehcf6mvzdSW
 6bZFaXxCbiIHTdn0bmDvMm6dEalE6DsvhrLcnXfvO27/pNMlsfxlXjIDdz6ZwqId
 y4q00g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa8e7k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5019f8a18cdso124675821cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 04:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768825040; x=1769429840;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6qC/9vKSzQzUUoZh2ZSv3mwkxmrw/IyTUO/hV1ChtFs=;
 b=i//RNljhieCSYBgCWafHTAEbXU0h+lPjCnUr3rxq5NEJ3fQNplC2sXKUh1MYbfyStx
 7CQfosHJBfhWfgbV7lDFRN0xBiF47EvejTOC4JBeD7FIVqTXMNRV5Ac00QG5ZXJisjB4
 sKpJs4hoIJA752rF+FAp+MAI87pY+IYYSf3goGSib+gP4FRTWpYuV9XPb85SI+7boR3t
 09pNlb1Xiu3zc0NW22sROpo/ZTr2tpQkQ/c0lvSRI8stFw2/CCxnB8eQgP2THDPnaIyQ
 oRyfYseS5ZRpGu6lPW/4Bti6bGsVmeQDqfw8XLdhtQpHixsqxLmdscZo92kh3Vh3si9U
 2Sxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768825040; x=1769429840;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6qC/9vKSzQzUUoZh2ZSv3mwkxmrw/IyTUO/hV1ChtFs=;
 b=Aw98YmrFLeBr2brbkDqGoOeDzXQB83jjmls5AR6Nlixe+QR+Lmf074So3ofISEfQmQ
 COh5KQF1g71UPoc4gStuUBjIdUYQtJjtWcaRifkTlv9N4Pf7PRyMXL6PRiErz0Fx09u9
 Wes7PNRCsx6tJLVCouAW3JxAGYe2HtywQ9oOyYkElozgUxSWdQ4+znMY5pLfk+9pj1fi
 WSllLmmcz+e4FDfPD86VFr2twdpJir3PJnq698LOl/bddaflv1ZeMT4GEcKfemGcz+SC
 i9M+EiO0l70rL7eVvNc82R+fOa4VFzd7ZX/BoEG3aFCkPKDS5H9tyeNxqMZEnSAVS2pW
 EhnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfBypGStFKYYlLmhHnlX9SlB/FJiNzoW4qWyxsbB/YHMd5+fblWAZTT9uVX7XUtDfgmYpLMtfOWvc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBgbGZlKNxMu7gHFvnfqLqcKu6ZtTGszmKqMyoLH09sGh53yFJ
 Zgr8pEyZnI2bAOAw1LD6tsesSoR+Bv5aAU2UDxCPwnHHhKF1ePBqyTISKVHYokq/wus3yV0lxw0
 33/dhwIntiD82vKPnpght9nNGCwY80btn2GvMtRH/D6Rp6eO3olMC8HBLikt9Usx/dkxQuK4=
X-Gm-Gg: AY/fxX6VXN5QOwWjLEVBdQHQVJ3SjchUKIqebvB8xPbr0H1nRhpzMZ5meVoCd1SWWTt
 y/6w1lz8RsZ/Iu+c/8EmvizqyCW+IwuD+Fnv9crqItbmU4m/92+wamqepc7bTkKrOdR/Co/9n3x
 RLXlQLlLb+oEpNFe8IPcWxeo+No0fiDws5ol7FvS6gMHE+MHJQvt82QPyxb7xm2cWaWSzbOtroQ
 pCw090XjoC2qKZD+Z8hgGEcAuFpzcA+ZyvFyYMd1RMMeF4rCi16IRJnbrGfn/xdVRf04aD6UHFl
 Ovtu9c/CrGmpUTsEGbu5rBuJ3tmfR0RtQzbsfgwHSjThR0RhNqPAszO6NnnbV+hvUSGd7R04jrv
 7fJsQ+kZOvn6Bo6qkk815ClpcQ7TMHxGdKy7qo63GYf85/4RdUhG0woJFO75cSnAsS1kHCx9683
 i+h76xs0Whgcl9iC/5MwhdDsQ=
X-Received: by 2002:a05:620a:258c:b0:8a0:fb41:7f3c with SMTP id
 af79cd13be357-8c6a66f8dd9mr1536271785a.27.1768825039601; 
 Mon, 19 Jan 2026 04:17:19 -0800 (PST)
X-Received: by 2002:a05:620a:258c:b0:8a0:fb41:7f3c with SMTP id
 af79cd13be357-8c6a66f8dd9mr1536268385a.27.1768825039101; 
 Mon, 19 Jan 2026 04:17:19 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3a17b9sm3274641e87.92.2026.01.19.04.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:17:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:16:38 +0200
Subject: [PATCH v4 2/4] drm/msm/dpu: offset HBB values written to DPU by
 -13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v4-2-0987acc0427f@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2116;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PZQ/HyJUBzLI4q25Cr4PA1zrRatPlEyyxDNqfDEZSTM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbiDLFZ6M1k9Dzt0HQxU81lGHZ4S1WCvcUQ6j1
 i3M8BIIrfWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW4gywAKCRCLPIo+Aiko
 1cxpB/91qJ3F2Z6sVCwbnkATmecyx5/y180v0zAcduBX+E2Kd2Iox9l0bwlm7oingvUb/gMg6Vu
 i2Ft6jpcsEfxJP8LNm+ejWozDd2PUvErw06rAdh+MGdtindnXY8Bfhw9aI/ewgkNKFbK7daxaGu
 njAUPDg1TVFw4FTnWsZwd+DduBpK0ESNBKp/ER05/Lif+vyelQb/cS4XirEm2/zmnQslYYz9S0W
 M0kIi9vykXTmOvvFOY2t9NAbIpgBhKMXyyKWfkSLahLQqQkdH1b6DLZ/9luezikfV+Lbey88ugi
 zf3MqRbicIbWStMiKxerkCna3iTtmZforsH3q8yW9V/A+sPZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX0fQsxNbr3xmX
 kNRHQnRR2btY8dWDKEbL8JXro83ygaUeLqUijVUjf02vnMyA0v+HcJIBxVHrqmWs4F3cX3Hu1Mr
 YVnZFbDpIydSbNma24RZYPvixC7p/EEvcERIVmLPkBjQEC1FiTaGzZkXUrbJ1n5+h5X85MkeJBE
 dITs6R+nhyBog1WtNcBYCZxKc/pcwk2i+fiQ8BcAEQrK2Irhfmfg8hdhIjTcmvwzdLQLfv/+BgS
 KDmZWVtbKk/2xxhplkUE1YczvYYvyQwrR9i8FbgXIysNdYDyMiGzltyX9Xs2g9RYaZTrIjbJzj4
 c6yLy4ht7cQssoefxU9YvuQy+exWTVGvXiiJapm8uoLsuQnuHITiHEeFDBFsWGqKaYhUQHY/g6V
 rMmx1jCOGzrvj9Ol6tw6D1ZYJmQt7nrFVpcgICT/DnTFLNDmh69+xLmIuZImkLYsEtq4oDelGtS
 3lVk1n+fIDrp40dj3hg==
X-Proofpoint-ORIG-GUID: aRXgpH5faX_EqMugCNTZ_EAu1R9EXu-M
X-Proofpoint-GUID: aRXgpH5faX_EqMugCNTZ_EAu1R9EXu-M
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e20d0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1unLKcHO38ebvhyrShMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190102
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
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

