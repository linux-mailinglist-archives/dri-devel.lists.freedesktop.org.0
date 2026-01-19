Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC4AD3A11E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3B610E396;
	Mon, 19 Jan 2026 08:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHnZHS7y";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J0YOCcRm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2677B10E394
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J7hcoj040048
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yEA5A7r2kJllLC6PuaIA9vsYW7wCDvkUCbOlZOzUws4=; b=QHnZHS7ylljx+36j
 RJu3Ldx9sPlBb00YKfVCuwk0OLv7nFQSx+8oAz0LZZNjIUM2pALQzUwpaJkhyZx4
 IIiTMA2Ly1FA7Lmy+ktuGahnFRJhNYfGctlZ+1hCLDj7mrowv6e3ZUNWRuGmgfn3
 ETN8P00zeej8sXnabb3Q2N69w+11YhQJX2b8Zg+eFPClfI6ioLfwKb6Kyj3s64Yh
 +bC6vcGqhB67b2ZDBujLw0s7C3qxlL9bk/JM/ahahYsFiD/WrqcTZOhlaLNWohkM
 tQJx6QuE3e5tTRgXf0Dxk/e9Em757gUpqc8dGs6HM5rPERa2nGexvS6VjIvj5y0b
 lUMgCQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr846e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a360b8086so101614066d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810487; x=1769415287;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yEA5A7r2kJllLC6PuaIA9vsYW7wCDvkUCbOlZOzUws4=;
 b=J0YOCcRm17hinkzbDnant+zC7ayhFTpinBi5HYXxJpnnMtf+MvTn4syDS0bnXVLWtO
 hSPSGIRUkHXC+RPaXxT5Tv8kYixNtNRwT4AntwY4KfCs6XU9LOioaQ+Jv1leRepOpQDH
 8O5adxuMeztyF80tu42uwvUF1RCm0AX4kjCOLsZb8v3jgyLiNlhd8RNmi0sAzj31kGRw
 yCjvzHPG9BVZJv6jx0p3Mloj5kAM1CBYVnBKEhWGSGmKNoojub3tLiDi5sxXq+bdwIYr
 IAlMZ68UIeVblQzuAuxuF7sUyGLNP+5buj0uzjQI1DErtYw+ZZ2uNoTeP859Ae59zNES
 znYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810487; x=1769415287;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yEA5A7r2kJllLC6PuaIA9vsYW7wCDvkUCbOlZOzUws4=;
 b=n8YHApEO2CjdAkGf4Wr/+/3Xy61S6yjO2mNTjZ60BVI5aSAneuTWEw6eE9wZ0E0bUS
 ZcbZorphw9FSs5QSBdCKFMNyhrC1yOYjZ7t9DfSbbg9itCmyj8YCWJVZX9QOABgQff8B
 z4gmMP9tb7aBwTmWyxn+zB8BKUU7cTkwCuioxjmfyGazEquEhQf4s8vrqfOaDzdvULDQ
 JLNoVhXSGRobOGE2/xq/XPJXgVWhVvJbVMy4FzM2QF7qEsQVZMgRzDtqulC7OL9CqXkw
 NjtBDJKvzGejMrTq0e3OosVObl7AixG7PLtVy4MKYO9B2NgEbb5hUj489ijm6xexHw0i
 f9nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrCbpri7jwjfEZhIyzsuQ4U/JCIbYcJ0zpx5sA3CXy9JCoI4izAkEQFWQlT5PQx9nntvDUnYg1Bok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIUhjplpReTIczRu4af4IQMKifNAA4N0BcQr4VrcyO+a7sytIs
 jf0bj0yxFIMZXqcDvT1tITHBb4MJO9oE8+A1p7Wg9KSM0+2FNV9p+Ufx1ajSE5LJpj1aNIt4MBY
 iHVHklGO1k4OCiGHILUJqVKcMsFnGjU9Ngq9G6FMR0PI+OfiA8zSS4TfhIA6WgvBbz3QrCOY=
X-Gm-Gg: AY/fxX7y/lQWLiLDA/nDv7++EsEvq11ZHEr6v418wrze9TX+mnJLaHfa4p/85u1iBe/
 SYVyHEFiKgduNvKuMxfEVwGmeBzEXMUUXshE6In6siOi0JOhIS7wI/YGBj6Gb8pgztMDhPaNDdZ
 iEOMkyip4KabMwYBWQjC6HLcztyh1fKjAIX2MxbJI/wwaiT/+riIMzkT5OizEegpwxDLs8O0sQL
 Ks/wzsomSzUYPkue724lNirrU+YgHP7g0KKLEz17Z7cCgixW/AmfaMPxtWf6TIiEXoljEoY2rAa
 DivJNNVq/sf4fFQzb7SEPCeOz2iLPKExlXZwwMvYMcbqqLb/0AYehomAaFbEsLRlHfCzvcCEZ6j
 gCJrsTPeAJYWHo2vClS6WJ3FoOWcjB4NmgqqcEosbtbimmxgoteOvZQY6kqzbj1lSxcaCgynwK0
 AlMt32ddHbj5Dr5v+fOoTCtIs=
X-Received: by 2002:ad4:574e:0:b0:892:7075:5743 with SMTP id
 6a1803df08f44-8942ddbbaa2mr140094976d6.45.1768810486578; 
 Mon, 19 Jan 2026 00:14:46 -0800 (PST)
X-Received: by 2002:ad4:574e:0:b0:892:7075:5743 with SMTP id
 6a1803df08f44-8942ddbbaa2mr140094746d6.45.1768810486138; 
 Mon, 19 Jan 2026 00:14:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf34d572sm3063845e87.24.2026.01.19.00.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:14:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:14:40 +0200
Subject: [PATCH v2 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming
 on UBWC 5.x+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v2-4-e0c8c630fdd3@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2821;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Irf6GJDAnKdRVE5ZDTRsZj60m1BLdF1o4/Z3RDY3HSM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bu8/ca+i8f2sd4NaovzTpgGcpeVn9k/lIfT1v9BG3N4
 C+31Z06GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRJWLsfwU7eqScwlR21Xbr
 vmDR+l0tuTa063IDw+2v2U26IRMnCe7cNm1646kbt+JOLdTdHDv/5pvdt6o9puw9vi64jP/2r5d
 lZttfTWaWlPiy5qCkzxVH2Z2MTTEOE58WCLrWXk8Oi2kOOSllo7Pj9+RbHImGC/Ijmm24WTSdtl
 zwCd+4nk1IKnO689On/FnG3VtY5tckHpTp1eFeUrY6U+5yjbPuXsO8A+/zXD/dm7RKsPaij9eCp
 zKtEodVU2p2LpwTefa5H+e2wzZrb+0u41nZePj15Abdv967PliqG6kdC0pzU3vFU/JwsZWT04/D
 z+dOVvhwPilRQNisy7ROIZDHJlDD65doXaawRfKtTcfLAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ytv1aPXVFcJgPuUd8cZD_ubmdL4rls2d
X-Proofpoint-GUID: ytv1aPXVFcJgPuUd8cZD_ubmdL4rls2d
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696de7f7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7FpWx5GjbivZIX0HvvoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NiBTYWx0ZWRfX3CV/1VkzOB0g
 PiGyaov22249S4WcEUYXfS5H1QAnJ2FAqhLvOG1QaECGosS6M8+MbZiGt9CZtuXkqzXZdPIMEqF
 Wpj7JPE1SkcB20nQwAkH/+OqnBA99/k/dlvlgiZHS3AX+3QypNk5irKL/QIJiPkQMItvpnp2/n6
 UQOZqAEFyXuWVu7r5fmjVxdvtE3yStpHcvhrQzaI6A6NF0fsU4+a7n4BCCwP+YVFVBSrb+cxaZk
 tqE7qOCJKH4Oi8x2Xlesyd9BzkpPw8z4aJSCRa3vDf26/rxdY5M1tzCHtVLekt2AlLfVAoMZdtW
 XuqCd/KwAjfH3FAX9Vxum1PxiQJIUoR4WRlCzWIL945iYcsK0I/1t16srZXPaLtmbpa6e7oM+a9
 mz90//rw4NuuTCttgq0RD+i5bhIjKUuK6wiqTnxgq9CvZ+7kS3timKt418FqoUPyvYaccxsHSTU
 L366+5YPG95H8Lt1nTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190066
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

Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
than 4.0. Replace switch-case with if-else checks, making sure that the
register is initialized on UBWC 5.x (and later) hosts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 44 +++++++++++++++--------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index a99e33230514..80a9fb76b139 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -279,6 +279,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
 		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+		u32 ctrl_val;
 
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
@@ -286,30 +287,31 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
 			hbb << 18);
-		switch (ctx->ubwc->ubwc_enc_version) {
-		case UBWC_1_0:
+
+		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
-					BIT(8) |
-					(hbb << 4));
-			break;
-		case UBWC_2_0:
+			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+				BIT(8) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_3_0:
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_4_0:
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
-			break;
+			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
+			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
+			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
+		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
+			if (MSM_FORMAT_IS_YUV(fmt))
+				ctrl_val = 0;
+			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
+				ctrl_val = BIT(30);
+			else
+				ctrl_val = BIT(30) | BIT(31);
+		} else {
+			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
+			ctrl_val = 0;
 		}
+
+		DPU_REG_WRITE(c, ubwc_static_ctrl_off, ctrl_val);
 	}
 
 	opmode |= MDSS_MDP_OP_PE_OVERRIDE;

-- 
2.47.3

