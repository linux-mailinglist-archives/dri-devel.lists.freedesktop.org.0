Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E4D3A12E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E24310E3A2;
	Mon, 19 Jan 2026 08:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A42zWdUY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R23YK5sL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FE610E39C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:22 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J7qjiX4004371
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xMzeLdH4gkDYQXE3MEX/WwUYO0IiYwGQ9/Yw/tKZcNI=; b=A42zWdUYIYOrD0G+
 /o+bZvDph2WavJ8bAhIZL6ZX1FVFRPS0a3jaHqzOQfe4pUsOoawGVTqkQsk9w/60
 ExxdQNpkttSKJnFn/3vRFnCy12LbkPEvR3+GNITGU72xPwBi6UGtCG8/3bllcCgw
 mVcpF4pzQFGSpmSs8oroY/HmM2eoSzQG5w3GRNBvGT9Y08YKI527qj/8QLI2qK0I
 A+2316rAmX2mCAENp4x+TWitxl0y7j8p/f7xagPzhTVrsv2xuxrHZZTBMm18pAEv
 3YzeRG14qpS9E24mxZ90tea4/ahE+1VTpaLfL6Hvb7eRUqAMBAXcVQYWL6aSrVXY
 JqO/FA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ehacr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a3a4af701so100273576d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810641; x=1769415441;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xMzeLdH4gkDYQXE3MEX/WwUYO0IiYwGQ9/Yw/tKZcNI=;
 b=R23YK5sLh8iCjETUqOg9gOLf8l1V8Tg2QZK08cUphtoX/wlC9Psy1otUCYMPIiE3qd
 RfvzTFrvDTrL2herQ0QXMTedCF2BPykYRT/luefQmCMgSQeEMvYa4cF4neHz9Of8pCal
 Nng6rLUnBGtpnkMx7eYXuSD8kZa+AvLn7xgkhe6H/J4HV656LiI9w5aReA+TfZlHIlqL
 kwtdC6xUemCKZFJ5y7c4tBt9gDH45+xzX18sdhxoAPJt/RdJkOH7Q/v2jb5VZ2oG0LgL
 Jlnpe57Tbi16R4S8ca1kxtSQBDZHQxSUs+Q80AaVOrlzvWnMMntQ+XUq3UKYuSXGRocm
 wcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810641; x=1769415441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xMzeLdH4gkDYQXE3MEX/WwUYO0IiYwGQ9/Yw/tKZcNI=;
 b=rvJPvTs4QeLxPNMmdk2evtltQWty051IX63Wfd049gfrvB5e14iSbh4T0n8bMbyGYE
 BR2UN1gDrKYwZnW4l40GO2eaFFMf3bbzPNbTqxtXPt1VywuZKX3GjtyxHMUq5T4+BvJZ
 bT7An2/o9sMBwwk9gx1LmSjL1lC1iOQZGbitcrQ9M6PLl8GNIjMaz/gR8Zz8rxXT10wI
 f6w/WwHcDq7NmtkVj7RFp1N6r7K1f5PBaCoSolGgzc898M+MB0K2o2ryWA1+gVHyyC6k
 3NnjifR/gTnEg20mUM1EG/y1ZhtgfcPDmSZIhXN6vp7nql3jQ2Y5loOojo4/5rc7WNfK
 +kUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlKy14wiHEF6dXc7wrbPiJsBu2EOYEQ3iUS3JZIW8sqhUiq/Sx2tFz+mw/UgK0eX1NpqLeDWWJWYc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz83a9ysrm13F053HBS9Eg5e/lx4ocFPCRoo1zdk+RH1N+PU0Z0
 j7saaUmGVHJlxP4O/+NEAbf4VJhIXWXAYz5ztrWDvxr/tbYF8O99jApZHNV9kMquEGbD8bUKCpz
 ObBbw5NNei2vvhkRKz8HnX/TJAiKTpaIQoBZ4aviCfk4uyeBhbbX2t/Ub0ll6RjIrgyWwwn8=
X-Gm-Gg: AY/fxX6iIzrP6MfX0S1JaAT2no14XY8it8lcE0R+2mKgiFTYsgYLN0DYD75MwFljspj
 Vt5oNL7xVAtvLZ4m3ZWIul3IJcWYILqAIsNzPo7W/lB3uwXiKz0GNVbQEmXqdzjd3Hyvyv6vQHX
 xc4GZigyZ9aMRjqYOSmz2qYP1gn0onfRyU+vcLc8QX22rcF5XXAUw3qZHiMfER3EsulM9flHw2T
 sF4kVfhS6huP48xK5OahpRlmuJrMFaUVSjv0wRymWR77qHdt6+4ZndKghKO5Ui1p3SM6kgJ5UNK
 60653537Abl+KzTpBE7hFmtcOKd9v/ctCMvvpSurmD1Oe90BM742beuej1xMeUMAgdpsPKDizWX
 tthJsQSsa5kuk/B1UwYcNEEbA7KN8aD/KpgCFXowtvHDpj4AMDiGZunIq98bPZrOKR7oKG5TSG+
 l6c+FbdOS41/mqEfcnA4WQ3Uk=
X-Received: by 2002:a05:620a:4043:b0:8c6:b14e:655d with SMTP id
 af79cd13be357-8c6b14e660fmr970512085a.74.1768810640991; 
 Mon, 19 Jan 2026 00:17:20 -0800 (PST)
X-Received: by 2002:a05:620a:4043:b0:8c6:b14e:655d with SMTP id
 af79cd13be357-8c6b14e660fmr970508285a.74.1768810640371; 
 Mon, 19 Jan 2026 00:17:20 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384dbec4dsm29636391fa.20.2026.01.19.00.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:17:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:17:15 +0200
Subject: [PATCH v3 2/4] drm/msm/dpu: offset HBB values written to DPU by
 -13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v3-2-34aaa672c829@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2055;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HWBT7H+ACSNaTYDAPUtOQBPmeUobbB01ZGnKJJ3+Wc8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbeiL3Nd+yf7puUGMY7KuxkWqmbU6DWV2RZ773
 F67oFji852JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3oiwAKCRCLPIo+Aiko
 1SRyB/wKRd14DtwJro7LaLDkuj2jMns/ytO0vlhsDsFlv+Q/Fqae9x88klP0cZGKJ8lo8VuVhBx
 1aZbO/P1jnM15YO1zOpdxhPSIFdSvm2jNocHZw/cD9jQNX7j8TboVeyikDRGRlHz6kyrVLAG94j
 JT97VDxWjGhJXEsMb9VX71mmJ/wKPSwEhLcwvt0UYOXxk5b+OdzCN1Wzgt3xtjc01CDv4uH2spX
 ZnDAX2JIrywtMjgNJBgDKIMWEp5asWACxVF2TAClZJ+jM6z55sC+as3fARVyYl7H7UnGuV0BE4J
 jsEAzASMscpw0+tuedB8HbdmUQYyhY/6oJfB2BqY3YTTPrTW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NyBTYWx0ZWRfXzlkIG1C3OgaQ
 GiJt56j1rsjhzqIBBMozhtOaqNah0q6Jb94K+2Dnp+7zdKs1aH5yXbBZw/w3rGU0mvJu/i51VsS
 DFC6uFZgljEJMWkNkniKBftMl2uohTUFBhmKwsStY+1eQhCl1GT99IRHU8Vwl0wncrXWboy942m
 Hk0dQ04qTmHYCechlqWtfn371vGDX1KGBFfR3BN2pzuHuw2dhlC85fJ8A0ef+sS4DzVh70T6T26
 ZevZYYxGwWv6ZRGHLmO5rxznLmrGKL4pSP3uqPh6rpPN54RVk/SuEkPZyGvUYKeK82YT00KxfX5
 orIaQl4d3Ap8evDZTmjGdb2r/mo+Xl+TfrbNNv9yQL2iobKZn+6Xd1cOxm+mD/R/ZNlfvxVSl1n
 UQt46kpxPuwxwqy8HdcGWUhbZHaSyE1fknI5ddTdkfuXre5mUT7afwrz9RsER5uTCi7BZUuV1ex
 t/z8bYaHBEmOVJMHdZg==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696de892 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VBuLEOLxEfejlaYavu0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: n98DGWGaDtqQOrZA59zQmY7KrW9341dQ
X-Proofpoint-GUID: n98DGWGaDtqQOrZA59zQmY7KrW9341dQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190067
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

