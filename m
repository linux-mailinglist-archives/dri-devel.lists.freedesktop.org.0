Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE30C5B32D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A526D10E9A4;
	Fri, 14 Nov 2025 03:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxuxtLGs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Il7pvW/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D92010E9AA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:44:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMbDUG1495186
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oegeyUk2VB2WSErWFmG7bcNFN7Y+V1Lbw5x1rVxCZHk=; b=UxuxtLGs26D0loYP
 xFC51oq4YvZKUe3E0FG9gEhczDfmadfPIIIMEHnolwcZTEIgkyYEoCFVEGZzTl8W
 TnahatBjLMVoUjjacJ7Ne1Q16riTlfuoJS0W7yD2MAi+I7k6/mQMkRM1fCQmxXTG
 tR888lqR4fp8rw5ByuITFTm78ujlZG87b7G7QJBnAp92FFqN5UsqzO+eZPVJNc7e
 Y/HWVSW1FjNWIjbG8q7NltKOJwbnLKLngsBTxQumXmkAa1bVeVg0el/7+TM4AoG2
 f1sq6PrUi0QOjrPqnVHkvKBxbzvGj8wcCdlb+Z2ppWgBl9ED78kfitNLdVZcXOhg
 yAW7iw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hrpgg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:44:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4edaf78da2bso33844021cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091843; x=1763696643;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oegeyUk2VB2WSErWFmG7bcNFN7Y+V1Lbw5x1rVxCZHk=;
 b=Il7pvW/r8c1LsEDuXHnUagA+73rcfXq2wHn48F24GQWdiA20CQgZzBYWACgi6LT4aG
 4UYDO9okbKDml7b1/PdL3Gkqsy7mh7oaz70Ihg/Vg5QbsKd4bdCVopRAnabpURd6gdye
 k4wOYeXcu3u+I5rYqor23scBcMU/7hW3gDV5zrxLc7kGbB4H6U0ragHJE8s6pIM9gSvP
 ONCkhmr7iUTEqsruFj7Hw+t84AcQG/ACRQS6sw0UfkE2nfwu+bg84gNLbKse7c3MPoyr
 vJbc5giYTt8T7+4S3/Qy+f/g59zM1Zvv6Cz6hjONGWwJmQmsNxC92Kj7PIF12sVQdhvi
 LGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091843; x=1763696643;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oegeyUk2VB2WSErWFmG7bcNFN7Y+V1Lbw5x1rVxCZHk=;
 b=mQ0PVpLxKD1Ug3buOyIHS9qpagm0oYZqTPR9TnxMOx0w/wvjqR5h+c4a/d/5o4Gh3f
 a+P78bRSpvBQ3EVYK6M2XqSWnHMrSk1F4Zy8FP+/OlJLsqxGA071Khrzx/tQoauK78iG
 +rYptwSsOlBmUjHfJ6DvnCHz4bJ+l+qxFxhf23C9yVUGOXW8UIt/9bnSPWYDWjPMSNLh
 0X5hE9Zu/q3re1OrJu5tZ2b9x21A2gzxHCafASJRE/X9qOB+ZgSRtnswFWvFZ30hBIWv
 d6n9gNcWilDYWrup3jzMFsifO6sP2wdAKYnTXyDbj7BP8pkZq5pJYHvfuJ2XSMWnsNZj
 IvVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY19zw67xSafcomoeYAQsM/vKSP4j2hE6WlofvjGuwWnTUBhztMdRo0dB8olLUiVq8TDHsozXDFBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxavN0x1s0bBY5IM7wXAXYe1jopxRN12OEw6V1kRlnWm1qcdKfw
 rVf1w0iJF8wBrgb6krAVuj7dSmXteW9/30j26unfiqI8ficbKSuLg0qwtrlocDX8zl4ZU9ElT5p
 RhU1a5jmIPk0yaofRH6EVg7Gh/ryt/pjSs0oaHsVunu1rr7uQS5Q3MC3q7yXExf8hNoNOAzE=
X-Gm-Gg: ASbGncv20dYmN2HV8zV2eGoEyldEXF1kOhfGux+XdDYtrZN4q+mzhQ+YnCJDBbblc4j
 JSA8/1ogfUAnfyLfLBh5J5IUuf9LH4rJsDs3YF+T+6tUhqbs9SiNxOXUnrNpoXw+U8gq1JXX3Vs
 HweZtj5gc1TPik4nj68ZoP5tfR/jld3lTgsjTIO1QsJvgLaPSsGx88FhwEJfGZw8ueSR9UE7qet
 JTCirZnVH3s1U9WQTIvcA/t1Mu56G5Hvol3A4LUBh8wQB5y3+/VreyC/586hb5qU6JOFY4iGXP/
 Y2Cb5KHrXbLKE1tvLgJs1ffgU0qcwWQ/eGjDaD8jlOWGXR9CnBuX2SIA1nwfx+fum0xf4KUlIss
 58y19nZ+3tSgLboYzBwVDRWdO5qmPygVQ4xP4to7Si9AZ8uBq7kRKkGxArfe6QidfZnweeG487P
 3qKwC85yuWjgKV
X-Received: by 2002:a05:622a:1107:b0:4ec:f7de:f5eb with SMTP id
 d75a77b69052e-4edf20a2ebbmr30359081cf.33.1763091842625; 
 Thu, 13 Nov 2025 19:44:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwydlmQi1HPZeW9fs89fnDZmZJmv/lIH/DUJMDvbdfrN/VzzbRgQ82VgzBNNBnbV3LjthPnA==
X-Received: by 2002:a05:622a:1107:b0:4ec:f7de:f5eb with SMTP id
 d75a77b69052e-4edf20a2ebbmr30358901cf.33.1763091842180; 
 Thu, 13 Nov 2025 19:44:02 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:44:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:37 +0200
Subject: [PATCH v3 10/12] drm/msm/dpu: drop redundant num_planes assignment
 in _dpu_format_populate_plane_sizes*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-10-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUZnMGZ8RYJTt+WDP6vzq+7HIixspEzZIdAITsMQctE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVmLUBiiK4k/HpfCjqq+rN3BmuJFOagv8Vzb
 AnJXQgpTkuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZgAKCRCLPIo+Aiko
 1YGrB/9Q0ll2wZj4R2ZP8LlcQLJoMrBOppkRGZ/8oJu7nB33LXE+Otq08nz/vR6tMvGbFs+reAH
 QYxZs6eTuovNzE4eYvnHZvWfUyfc0u/6FICnaTjizUqV7zQacSnxAGJodqyrj2gcs+3UQw85v0f
 YBGKp1YbQj8q+foGmsrmc0PaEiixLnkt7R/PjTwqpxHyQwWpRrf1ZvNN5FXoXpk6K6DJ5CGV5rL
 Wuji7zWsPlE1QSPPXyBa5Kocp5YgfIz1MZVrzAV8Jus9RgxIy2N5ljXo07BCP7kxntWnI4xD9/R
 M3QXTqd9/8SQlZqi8Yr4FVKVs09/trdRZaXipr9GBs9dC5KD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: CsJU76HUiv-1kzMCMUdBPpnnHf2w1Yyw
X-Proofpoint-ORIG-GUID: CsJU76HUiv-1kzMCMUdBPpnnHf2w1Yyw
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=6916a583 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VIt9t0sQHfAwVTtMwRsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX9aRfMsFtWeC+
 BTLwJ+PxULh0jDLLtYZ9qKLnYJPAbp5070b60t8S8DuvM7ukuHUqnfd+U4R+f23/W9E1OcLpnUK
 cuHHNMxNqZfazb4j8gpxot+LvE1yqs/pGLRGs4iotMi9QooerqCwAS2YfeTwWiYWTTyjm82xyA8
 SOUBi05iGFXE1++FfENX83EOjV2ADN+kw2VWXheJEzwNJ9XoxJB0vYfTuSW8lYtgkJ5nYH3/L2b
 /HhxRMkrpR2LNrAHivDAxyw3dsvavYuhH+OtLBIZ4bTlSlBgyrtKtSwrLDgkPppAJCRTB8E0CZR
 CEkszrKUwkZci1zhXKPyeswgnXQhQLyne64ys13DBVvh9KcKKeJE53AtTOk6W0QJBhacwW4u87N
 e7skbrw7pRQ/gEzRNBoyA5lFKTlUgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027
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

Drop redundant layout->num_planes assignments, using the value assigned
from the formats table. RGB UBWC formats need special handling: they use
two planes (per the format table), but the uAPI defines plane[1] as
empty.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index b950bc827a36c231bcd4a9374e58cde6b41230bf..191d1f2a0cef7ed69342eceb35df0c3e99a0c373 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -110,7 +110,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		uint32_t y_meta_scanlines = 0;
 		uint32_t uv_meta_scanlines = 0;
 
-		layout->num_planes = 2;
 		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, fb->width);
 		y_sclines = VENUS_Y_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
@@ -124,7 +123,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
 		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
@@ -138,8 +136,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 	} else {
 		uint32_t rgb_scanlines, rgb_meta_scanlines;
 
-		layout->num_planes = 1;
-
 		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, fb->width);
 		rgb_scanlines = VENUS_RGB_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
@@ -148,7 +144,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		layout->num_planes += 2;
+		/* uAPI leaves plane[1] empty and plane[2] as meta */
+		layout->num_planes += 1;
+
 		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
 		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
@@ -167,7 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
-		layout->num_planes = 1;
 		layout->plane_size[0] = fb->width * fb->height * fmt->bpp;
 		layout->plane_pitch[0] = fb->width * fmt->bpp;
 	} else {
@@ -194,12 +191,10 @@ static int _dpu_format_populate_plane_sizes_linear(
 				(fb->height / v_subsample);
 
 		if (fmt->fetch_type == MDP_PLANE_PSEUDO_PLANAR) {
-			layout->num_planes = 2;
 			layout->plane_size[1] *= 2;
 			layout->plane_pitch[1] *= 2;
 		} else {
 			/* planar */
-			layout->num_planes = 3;
 			layout->plane_size[2] = layout->plane_size[1];
 			layout->plane_pitch[2] = layout->plane_pitch[1];
 		}

-- 
2.47.3

