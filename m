Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A21B44AD7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 02:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027CF10EB05;
	Fri,  5 Sep 2025 00:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sq1aP1gp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A31C10EB09
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 00:39:05 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584INShG007609
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 00:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 780LqBw/igl19KvLZzHBkwTrlSQvqB3i+oVJRdDf2bQ=; b=Sq1aP1gp1fwQUALp
 vEMzGBsqZsKBHFJB96qeN8rHajs90m+qGEAvoZnZLiViI6tGXx8TEKqGPC1OkMFv
 avKXwa0xLyHK2EVuadMlcioTZX+HIa7Bk7Q+9VbX5brbPJiVC9Ii2l69L/s0Ilm6
 JNRPxkNifMNoziuwDtyjT8dSaK0cmXajoZLMAxnCPB4dNVzZ0kcQwrSYq0SEGFhm
 hHoeyaAqW8Fry5B9eBtI7UA2SGqt2ZzJH1Y77EBMChAdkpzcunrVYKnspXxPJrl5
 SuyAMwVVwIk5d09Wn30vScaY6PeoSSyD1K7ZTo9AjdQUfvLYfK4ON05u8Apw5lCY
 GQ2BCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura916up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:39:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-807056330b6so191344585a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 17:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032743; x=1757637543;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=780LqBw/igl19KvLZzHBkwTrlSQvqB3i+oVJRdDf2bQ=;
 b=WxFDR+wYZwKvP46OSYSqG1hLr2uJtKu0GtoBvzNQiHy4jSyJLKVbX2I1hvNzvQYQW7
 3wrGfMbvByJATmHvQSrjxfvTVCPuNCHdWL5PCk+dYF8al/UnxsHKvoBD/ZUzCfLUoqjZ
 77XtQbhlGKMvkIz6YzjJbatqfuD09Gwco8OW4Tv8SMDUdJFces16V2xD57hRiCU2xO4d
 DTofarI97QdZ7BamCbJWuz4ro9RDLz0B/qOZjEPF9RW/qsCAjHJTxNRrTF8yDowNOkTm
 aNBhC0lK8YIUJ7mPSYjsMwWH9gGsgHvLGe89Nmww7IRgLpXpDVbYcEQhTz90j8O9IzfN
 GaKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN7/Z18sBNLeYUr/XhAukiszRiTvbG+TRZ47oeYTeJXx5xENmq6e1hHgouQE9752O4H9Vesp0WuJc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWWzUdQM5cycpIBBPXw8QDA1Af3oAX8SgEqcT4/0+GbXo/zfDg
 /zdxAPEU0q9C0ra5kU64w5DsNtsdBkgF+RTh0GEf7qP5PqKJyKs6MQcZ2qs8K1bwhz1A9dp91Y7
 KTNt8Rywe6NvAaZ474Rva5p23ilVieG6EK6vbiU49avHwXa04nHOifvK4JAVcuGq4aKlD8UM=
X-Gm-Gg: ASbGncvMJttK0L4iT4dVw23aNmFJ9w3ckxe1JPvDeIMY02nd6evUmp+wnUp/HjHU1e+
 hgpfiZHghNNyFrCUKDNepQMclOwr36IUjEOwsl72GaaZLuCYpazJW2GthmDjkeG/RidSfQpWq8e
 qED0CBILUBfKfd+SZgY4PX9hQ3bSm1pN9w15PY8VJRIFr1brV113I0jOBiOVrvt5bWvACQ8nqfX
 RLkkAw/bO4l/Kzep+w9CVo1wreK4s/2EKAK6aTu3G8Nlx0SiZSpMG3W2mZ+lhMXZpuLUrYdBOGL
 PUtDpnh4nPQGaUtw2383urH3UXLPkWavy9ZGvsiU9Ez0b/PtfRS1xVqul2r6vZ2igA7YK/AjObz
 4R5wjVJjR82Yw99/5QhYW9Hh9sgtYsa4uHjFCKGJCuEDCx0SbAw8I
X-Received: by 2002:a05:6214:1246:b0:70f:a5ac:2523 with SMTP id
 6a1803df08f44-70fac6f87eamr212894676d6.8.1757032743191; 
 Thu, 04 Sep 2025 17:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwBf+0LtBtbgRu0E1FTAsC6WkuuZJqpTq32T+jdGFl1Fr1Nb29VTezSLusCo4cOwNvpilzEQ==
X-Received: by 2002:a05:6214:1246:b0:70f:a5ac:2523 with SMTP id
 6a1803df08f44-70fac6f87eamr212894416d6.8.1757032742725; 
 Thu, 04 Sep 2025 17:39:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:39:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:38 +0300
Subject: [PATCH v2 09/12] drm/msm/dpu: simplify
 _dpu_format_populate_plane_sizes_*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-9-7a674028c048@oss.qualcomm.com>
References: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
In-Reply-To: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3791;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OXT8W35fr8NRb5cK8/YcdfZIWnqlYhpXdAdC+aSkVY4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEKa0UEV5N1PJ2FGbOlxgyrHNBe3+EXnLW0k
 Q9SKySPhUeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCgAKCRCLPIo+Aiko
 1Sa7B/46NDpoRmfDw9X+jQuun+Uq4tblfqOV+Cz6n3NLX0f/IMHlvZB5xVjC71QGxPMeSrKnARn
 5d+sBTRUFXBTX4maimT1liIpWvmm3mKpZDBxFYWiX29cCc5PjROFZOaFHa0R6+uJDIjNHcsxmVk
 vkofxm0L6wbR7BdA3GQzfYB3e0F9XWpEUgHcfajiN+0zVsebyGZearoc15GlPoUwChY6jaNdQZp
 As/qJc9mDGNrhhTXL+Gh6QFsgiEE/yEiwlGT68qL26NRz4SlfVStpAqeyycFAv6kkFMOQGRXOK7
 I6sZUAgmupig5tA162CYbW/Y0Au/qEZfvpnc+qons2SxY+QS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Avi1Qfcyd9jfu4OtDuEL1ecnrTuHgvxF
X-Proofpoint-GUID: Avi1Qfcyd9jfu4OtDuEL1ecnrTuHgvxF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX+a3qW04KE9kU
 lL/TgxtnrbgnG2iLguN1rFdGJVjAMxrcIB+2PeBhSzd0RAiWFNju+jz5ZKKYc5N4tAbzaRCGwFx
 BLMi4GhbUXXwHTMEStquEq6Pcu8pF92QHn8AlUJVr/HWpTxoJnc6qFFld9m0B/cOc3JhdWDWon0
 y6Ml3OL2u6rkOwvZMAzp3t1RCk6NzBhkRj4SC7nuJEOkwnhHW8gq7upBPaEOwEgDLR1ZnN3FScW
 g/iuf4xPsfw6+qyazFBKBRdHf85iCCWdkQeRX+ZQdWnq79f49WSzcdhpFMu89GAO3PcWpug0cMq
 ZhXXk0c+oHC7ZYiWIYvl7XlQUx9byOu717ZArJdRsgLFS0DLH2phQr7H4y34x8dgWPkC+vEaBt0
 7EYyd9c3
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68ba3128 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=d-fElJfPDvRUhmvKT08A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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

Move common bits of _dpu_format_populate_plane_sizes_ubwc() and
_linear() to dpu_format_populate_plane_sizes(), reducing unnecessary
duplication and simplifying code flow fror the UBWC function.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 41 +++++++++++++----------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index b0d585c5315ca0d459c7ab7f936f1ae350a4a520..b950bc827a36c231bcd4a9374e58cde6b41230bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -95,15 +95,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	int i;
 	int color;
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
-	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = fb->width;
-	layout->height = fb->height;
-	layout->num_planes = fmt->num_planes;
-
 	color = _dpu_format_get_media_color_ubwc(fmt);
 	if (color < 0) {
 		DRM_ERROR("UBWC format not supported for fmt: %p4cc\n",
@@ -128,7 +122,7 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
-			goto done;
+			return 0;
 
 		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
@@ -152,7 +146,8 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
-			goto done;
+			return 0;
+
 		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
 		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
@@ -160,10 +155,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	}
 
-done:
-	for (i = 0; i < DPU_MAX_PLANES; i++)
-		layout->total_size += layout->plane_size[i];
-
 	return 0;
 }
 
@@ -174,11 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 {
 	int i;
 
-	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = fb->width;
-	layout->height = fb->height;
-	layout->num_planes = fmt->num_planes;
-
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
@@ -235,9 +221,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 		}
 	}
 
-	for (i = 0; i < DPU_MAX_PLANES; i++)
-		layout->total_size += layout->plane_size[i];
-
 	return 0;
 }
 
@@ -254,6 +237,7 @@ int dpu_format_populate_plane_sizes(
 		struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
+	int ret, i;
 
 	if (!layout || !fb) {
 		DRM_ERROR("invalid pointer\n");
@@ -268,10 +252,23 @@ int dpu_format_populate_plane_sizes(
 
 	fmt = msm_framebuffer_format(fb);
 
+	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
+	layout->width = fb->width;
+	layout->height = fb->height;
+	layout->num_planes = fmt->num_planes;
+
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
+		ret = _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
+	else
+		ret = _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 
-	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < DPU_MAX_PLANES; i++)
+		layout->total_size += layout->plane_size[i];
+
+	return 0;
 }
 
 static void _dpu_format_populate_addrs_ubwc(struct drm_framebuffer *fb,

-- 
2.47.2

