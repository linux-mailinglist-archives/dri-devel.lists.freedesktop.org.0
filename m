Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AA4ABC394
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059E410E288;
	Mon, 19 May 2025 16:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZojKrje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105E910E328
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9amiR019805
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gi+iisDpzgKdEiK0rcVeayKCWIAFmEEhg75ZFqke7ck=; b=OZojKrjeCW6QdIBP
 t5TUT3fb0ATF+YrvpL6nZYqzhKc4daO/HWvLMTHgeCVxz3xDEXqQQYwha/JTdrRV
 Y+uJcWMLngNk3ExavYhlRh5mQl4e9MIzYLHC4ETlHMBkh401fHbc8mT+HzD0nNPH
 p19UovV87jcHWl3ASKCmVae71NGF2I0QAJaQJowueUnJP8U4aOuT7xzSWVmOt0OL
 XB89CmqjOSjDs7tM3YQB/F9/RfK3YSFfmR8nPC8hhvqOM3M1Ld8GSQtnUR5XV2Fl
 gcaUvotS+WPwTZ+dIiATfmTFwRTD2yiIhcvqJANGTwujynW9355AIQjmu8f7JYGE
 xCQ0nA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyn15k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-742951722b3so3777935b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670684; x=1748275484;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gi+iisDpzgKdEiK0rcVeayKCWIAFmEEhg75ZFqke7ck=;
 b=kuOyH3CrACWypCYEkyM8RQCuHte9aCZ1U4teJplGBp9kg7F/dJuEpgAStT+40v6LzB
 qnP7stGx+iCeNqkgze3TS/dJ2kdhkx6Z3myQJBLpyyKUSB+9zxCb/vKfaYAfzIuZqTKC
 Xam1hr3fu7fxq41xzBOcQjnTuGax56+EMAxPQKPok/RtAb0U3g6W2MypT6NuEyKK5Lq7
 GmV+G6/rTgPsJBzfafHxexR0UYdYKTVer3eAL0brsB4knHWr+DRQMiw3QF/IVFawbDJo
 CK9IJbula2yvQCQRjUV1MboCmFpb6y5JHcd0g1fPU1pnVcbzHer6c1btIfCDUT46ROQj
 JgpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWIxXCjjc4rKnQ1KjAD8rjlY5q37xZJQ1SwZRG/6ccZhY4QBVYVDp0SjvE4tIlFGeaYpgci6pUDLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf8Js0dHYBsHvTrj5/k1uFQvMt6xf6uTcGwMPF0omhz5rVb85o
 jMoEzUrn/gJ9jKU9PcUZb7MA6Paqaz3Jz83H4BVc2cgG05vqPjAr6MFJk8+UFSmZ2NWScs2vUYm
 VBMfWxTBYGG035JCkqxIVvI+qbCLWwi5hKSHV6CFIgBhd5Dmu6VsG2Ciw8T1fLWzTKdSww00=
X-Gm-Gg: ASbGnctJT6Cou5J50WCsmK59N+Voq286XnMHjW1R3VymtSOgz7ZCArF06f8M0IeZnv0
 8taH3b9TtaIAbYMiBRrnwGd2T3HEDjE0JMcJxzt3bbsU/yhzqZxENQ/7kMidKI9FfxpA318rslB
 eP6a5d97EBPEZ5Bd4uirUbhQ2dUHc/KmULC4zoSuGgFxV1aTzzEy+4vQdyd5lOulZFskbl6Ox+8
 sCTVyvlZHBR2DFm3USVabELc+N9jOPlSgP08rHsZHqLep5gIil4UalhcD+OB8x7hKAIYBpei0Xt
 io/4dfGBoPAIqllRow2hCbnk+cFLLDxbnN14lm9JxaCi2lTAMf4t8OPgkcpyIrA0Z2yW4YQEQvV
 YCAbhO4wVTfq2TEqArRRkei9F
X-Received: by 2002:a05:6a20:6a28:b0:201:4061:bd94 with SMTP id
 adf61e73a8af0-2170ccaf4e4mr17466883637.19.1747670684389; 
 Mon, 19 May 2025 09:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgNDYZ32Sjzzk2gJJMfu5Ie78pJwNA3N3D0CKRForF+eN6xgFTl7z1ALHWpDNFHkhlcSwM3A==
X-Received: by 2002:a05:6a20:6a28:b0:201:4061:bd94 with SMTP id
 adf61e73a8af0-2170ccaf4e4mr17466829637.19.1747670683896; 
 Mon, 19 May 2025 09:04:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:16 +0300
Subject: [PATCH v4 14/30] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-14-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/oHhBsr0/SzduUBt+SEifBVkpkZbpX33SiSBjgxdPbQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z2WPX8vjhP754nU05dyRDPmccUXLRp5UrjKNM7k3QeR
 ZZLFKt2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiT3Q4GHo9H95gDl+vpvfQ
 rv37M2e53mcn9Vi/5c8/8VK31vpsiqVjlrFYc+Pk5c3b7/auajaeKj/T+PKcpI97v87nWnrTTm+
 qPIvzuWajtmbRdIZbSayLr/aKvVbW/h+mP0XBS/deWOsNH+E5dZd1/0/69ftl0Mc5aYIBwoscjE
 9V7+Q5F5Oa8EjFob+3vKtkw90DpdasM51V4qYqPg12k3qWNv3k/uRSVsZp3idrplw59sYyNDXnT
 t3OpZ2bY695au1OKo/n476aXcM5Zf8JzUl856zjnYIUHjj5VNcefhUSzf5szjvVKqfDv7ccbvga
 87L55t2gmTfc5VKjFZKKLvHWZTjptYpLSXvke9/3iIwGAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ceMti9CqU7zeLmuG5FEczrndaRuYDIa5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX3cHFIxdKLkX2
 RwHFczV38VNuW8r5kjQdukF5gOuUIbpyCNuFCcW9yqCO4RgV4bxIN5kK2RiWDcbjZcMsMAkT4Rr
 n9gnscmMFOHEVz9uGNbrcsTWKIrwZwZ16Od4v6sNJdMKRpm1/H8BcGyYFrwfy9pAue6Ih8euNLA
 22k0yECWQS90nUixY3WqdZGPqfIYMz1h2KO/M4oY3IzSFwcbc65ZcV9Ez4cGG2P/KPA604GCDx8
 9kkZoCTlPy0hyCbzjxx5jd+ujEj4/Txhi7qUad0cOEtEW8KEHz2WykiR7tfp1kUfbwHI6HPDoml
 ZsbxUmaXAqLR4HfHQI+bEsCkdJkExWUftgvPCC2z58LEl5uATKjHUaw0LPvcWLNf6DLMQIT1BrR
 a+JLH+L2IznRjcKgeoQ6Z+s2Gvt0iwel7bcvHHAKksTgXkH+/kHu2qR+XcgYVJ6YXcaXZRJH
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b569d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=z6iiZyybfqEMMI01lysA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ceMti9CqU7zeLmuG5FEczrndaRuYDIa5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150
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

Continue migration to the MDSS-revision based checks and replace
DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 +--
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1244dd59648d11123c507a1369f28f952d047fd5..4482f2fe6f04e58408b55994d885ea1c717c6a07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED))
+	(BIT(DPU_INTF_INPUT_CTRL))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index bf6b2392efb47fa8c3e3c5d17f1a72341872e18b..e1c6df3a3b72ffb5a816bd18266a35abe723fbd9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -143,12 +143,10 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8f9733aad2dec3a9b5464d55b00f350348842911..54c2e984ef0ce604e3eda49595d2816ea41bd7fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -308,9 +308,8 @@ static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
-	unsigned long cap = intf->cap->features;
 
-	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
+	if (intf->mdss_ver->core_major_ver >= 5)
 		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
 	else
 		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);

-- 
2.39.5

