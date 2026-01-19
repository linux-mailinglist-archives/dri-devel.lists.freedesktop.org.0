Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C212D3A131
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA9210E39C;
	Mon, 19 Jan 2026 08:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wi7Wu3Ls";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5oz0qTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4F510E39C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:23 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J7sMc71742447
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ySBe32B9dFLBxykveI4xu5ZLa7Kh8Fdd134UNyMzTpw=; b=Wi7Wu3LswO6H6Rk5
 nxBvkHFRXwtsp7kyLPXPOWzAHWb+zqVDX7ATsczThru5sIFe/QTRPlUhujMS9lYq
 BbXDSmOP/zHQbPyDXBunAUecMYqGoc5Q12Zjw9t5SqqljDjxXJK1Kxj0FstDGKwj
 EH2u1h174oQmcYsXBN6haacMucXF7stD4SYKfON+wdrALlLbcUeHy/1Q+9DOMOaw
 WVbhzCuOn+U4Lddq+HXPZAZ5lR3cWlep1MnVcISBILaOB/w7DJosl+6nwAf/zhz4
 bSiOB3yA4qzPfxD/KTjNE1w5u8BVPnkgp4+2NFm6KxfwDD8I0cRO8XoXhFhivQ0P
 zaaqdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmu83xg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8bc4493d315so1167915485a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810642; x=1769415442;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ySBe32B9dFLBxykveI4xu5ZLa7Kh8Fdd134UNyMzTpw=;
 b=a5oz0qTe2/CimQWKp8j0+B3Y+rI5D+xSBOtK5RdnisFK3z4goH8BMtQhRI0kx/iVsV
 hFaUB+SP8RXganHBSn4zB27IF/gNnVPyH+pCIGRme76zXbwqNXRsrKnUOIm5BB+S43KB
 sAaRHENW80m6U3WhJX/JC6W8Grnh8kzJfdP+/yMfT7Q325ExZecxixC6x8pNUBxmh2bj
 KqNaocd1Qp2N7ewDfIUpQ5E759IPaVjWuEFJay6J/REcM+B6wJ9eSZrxYPLF2EqQnmPG
 qLRrH2EaOxu1zwFTH4nKcnTHJFQqBJGDMSDNodC1oILukcLiaCsLyeLMDj56tBFbwL7E
 QC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810642; x=1769415442;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ySBe32B9dFLBxykveI4xu5ZLa7Kh8Fdd134UNyMzTpw=;
 b=JDPnAnEeiFhZIloKWsdwzrsy+pumAnYRSfBOaf4+YJ51U4IqDir0kbYdsllq7kO7PT
 w4q3KRKsrIlmLvHI5ARqQXJdwSTHoywp+NOniLs+2pPdapkfg7wJQ0LysFlAPlxZSaYK
 dHEbsnJ8vJ5CUr/7JETD2Dl7E0lkGypWB2x9RYW+bmlJ07Rnj74yedn3Xc3q/i5E3z1s
 aZc8P9n/rMteA6leiZaoWjZfR2KMIbqLKx8hGystnm/JqsorwYuihtFHjlTRhxjvA0J3
 l/4A1Euivm75V9T6fycOaoMlfQKcyEzTqSOB1Od86fH+qMlDEhgXTyTGLZpJRBcbcQNn
 gwiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/26VeFMrVo0XcGe3TLQERP0b9OiutZ/wZrpdiXlF2nbw8Zg2rek6zs7ZR2tJ8rNfQQijAmOO9N80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywtg/b2PjGtm1kdHLpgmmSpdGZIqAkYybEUrc5ctIQV8haEjh3a
 zsBwIxyIINcFMUaLlAN34tgS6OfXK2vQlptOobiyoOZUmGlye8NFlvuPmXRsPNlS+hrbPKJaCpb
 B0A5zUgMo39j1rKVfC9gjk7jTHcAWyw9zCXz6aU5Vcm1hxpIC9cPx3i6p2rBpaRPkN8LY13o=
X-Gm-Gg: AY/fxX7fwAjWp1e/uBxvcxTvDA5cuecTeFjwDhdES+/vO9R6NaQ8SJtcQjvEE7USMbL
 SNYcdZF1dycpCheMu0U1UwZf1NUbRzOsiqMZZWpFu+N8uWTgCvAKwsVPIFqG+YyyYoY/9ttEDWJ
 DsZTfzWH4stwo+WrT4rnlBijzy4jrZvsPSlyGweiM4S6CD5E2jT/qmyDei374Oyibh6s13WV0p4
 HVswhlTPagvWiK6n0824QFi5cH38tZ3MeVx1ts7PkwjqqRDuDdqEUOlSE8QCKndVdn4THgOxZLA
 lRVnDS4Hq64Ol/F489u62kR7rR/g+ZIWWbICpPNOxWwDBbSOUs2OjDTzJHJrMI++3vCZsNDjyo1
 uZdxSxE/d4mgin5ImgZ1/m1E1Cq08tCFe/ANdSKSblkwo6Jttoq2JiLSWqIrhiaG5Oz9yQm3CHp
 j0NruzElRXhZ2WPDR1FZuntec=
X-Received: by 2002:a05:620a:2982:b0:8c5:2ef1:7d4e with SMTP id
 af79cd13be357-8c6a6948240mr1557610285a.73.1768810642022; 
 Mon, 19 Jan 2026 00:17:22 -0800 (PST)
X-Received: by 2002:a05:620a:2982:b0:8c5:2ef1:7d4e with SMTP id
 af79cd13be357-8c6a6948240mr1557608685a.73.1768810641589; 
 Mon, 19 Jan 2026 00:17:21 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384dbec4dsm29636391fa.20.2026.01.19.00.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:17:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:17:16 +0200
Subject: [PATCH v3 3/4] drm/msm/dpu: program correct register for UBWC
 config on DPU 8.x+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v3-3-34aaa672c829@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3052;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lo3imQhUcYZeiROXs6LS6r/XOzlEgkEUmatFOrZKrog=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbeiL/WY6dQq1hsAiruVmlJNpw57IWcvKI0mt4
 N7D1QNofs2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3oiwAKCRCLPIo+Aiko
 1UOrB/9IB96KEZsLVA0GwmxwgpsTgczf0JVTDWkX8qtyDLCq0z/ZfbuEcCSmPHBhsKwFIVJ5yuA
 kN7oHWAkFgGWtbC2eu4yoTaTyAHwKgjYE65CzizRgOGqUxF8EO+Ap/2WUsuBWvM7+F49uDQkelh
 6Ei4TGLrMuMnkQwBWpn6TrsLHI7LC81RbZTnqRDpg7ARWgP40sF1JjnKrnokaOYXLXOeachxtKA
 V73mG2sOraF9fHqtEMvyJTkwQJLT0Jaj9/iF/C7fVlcUjcSIB2oRleJZaurod5mC7vKxwvm0zr9
 3GqjoaiCca4Idd2hujFK0ERRWqepS1ZchB9uT5loLrVXi/NT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NyBTYWx0ZWRfX4lBL4hKn724X
 Km7wQC5hD5zAB6ObI8mB4SLwNyAh544tbaC0btpzVg3sRy55vPSBdh/uQ694+L9PnIYr7w4XU5x
 k+/R8CY3fQh2KrQ7XgDpucmZoa0kZdwtZhfVVnCBfvoelAUv94STq0Ka2G3+XMyJBsfJZWQM+Ml
 CiLBIxIW2JnJ7ddsarKbGk0cXXLO0ukinKy1jnOV08c2dudcFbiPvMuZ/P/UsCB58D8fbJpadIs
 U6IDGo3IkWxZZUIughXK/l9zFvINkI9CCnaltZW4xNClFCTWqzkKbQUuxlREsAYZc543TM2HoaB
 X+JcuwX6JdoewsQuQt/8/DnAWCrZiHSX3DEW9X1tLXU/N8QrBW90tvHeVu0eyUbGzspqFiKyNsu
 lSW60DkUgWePKuxANTsxi67yclXP3NaZf7EyEPnehbzwmceztfc2iZuqZ42VAhgEWWlm43tJA11
 R3tjnIAwafp61pohRiA==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696de892 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7tap2HhiP8zdS8EL3YEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: QgpoAUe0bZpMRojafl8OcPT7QY3HvEU6
X-Proofpoint-GUID: QgpoAUe0bZpMRojafl8OcPT7QY3HvEU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190067
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

Since DPU 8.0 there is a separate register for the second rectangle,
which needs to be programmed with the UBWC config if multirect is being
used. Write pipe's UBWC configuration to the correct register.

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index b66c4cb5760c..a99e33230514 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -72,6 +72,7 @@
 #define SSPP_EXCL_REC_XY_REC1              0x188
 #define SSPP_EXCL_REC_SIZE                 0x1B4
 #define SSPP_EXCL_REC_XY                   0x1B8
+#define SSPP_UBWC_STATIC_CTRL_REC1         0x1c0
 #define SSPP_CLK_CTRL                      0x330
 
 /* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
@@ -215,7 +216,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	u32 chroma_samp, unpack, src_format;
 	u32 opmode = 0;
 	u32 fast_clear = 0;
-	u32 op_mode_off, unpack_pat_off, format_off;
+	u32 op_mode_off, unpack_pat_off, format_off, ubwc_static_ctrl_off;
 
 	if (!ctx || !fmt)
 		return;
@@ -225,10 +226,17 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		op_mode_off = SSPP_SRC_OP_MODE;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN;
 		format_off = SSPP_SRC_FORMAT;
+		ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL;
 	} else {
 		op_mode_off = SSPP_SRC_OP_MODE_REC1;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN_REC1;
 		format_off = SSPP_SRC_FORMAT_REC1;
+
+		/* reg wasn't present before DPU 8.0 */
+		if (ctx->mdss_ver->core_major_ver >= 8)
+			ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL_REC1;
+		else
+			ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL;
 	}
 
 	c = &ctx->hw;
@@ -281,24 +289,24 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
 					(hbb << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_3_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_4_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
 			break;
 		}

-- 
2.47.3

