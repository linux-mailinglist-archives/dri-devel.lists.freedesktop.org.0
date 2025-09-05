Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8BDB44AD8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 02:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C2C10EAFE;
	Fri,  5 Sep 2025 00:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnQUPug9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEFF10EB0C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 00:39:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584JAUnL012111
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 00:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V8EjH8EYOYf6Ibi/w1G8pp80W80O6z33eMTmlaCldHU=; b=KnQUPug9g4rGxsL/
 OKld6uxirY72DHA3ut6TvCfSrh2uVUgP/DF3430+Kaeq/f8XbLevRhSEch15xJav
 wVO90HBXi4MOmrE/Yr7O6dKfPG+yZmeYD6ttTqWHmDI0a8WoyvsdyJbcZsbIMn7j
 DdrVoHdPrV9AYXaE29l+hT+GEJHMm46PgG2RVEkLZ8VgafLmaV5YDohD1P1MDijK
 3AJXE+F5M6HeNeV556iQS/3ZoBOACuc0CB8czsIB+95cScRwgwEAl4xZvgWmPsvK
 zl22BQxAgkZ5PNSw5Aj6iw+P23spV+GBEWLAKZMrLIh28j0/ChxUSkgyVXyMNZJN
 a+GdMA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj5q08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:39:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-72048b6e864so15893636d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 17:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032746; x=1757637546;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V8EjH8EYOYf6Ibi/w1G8pp80W80O6z33eMTmlaCldHU=;
 b=gLFpf6q1+C3iEQ1TTEqbxJ874H7VyVi2vTRLBRyJJ4vHIx4K6N38ttU9M1amuGZFQ/
 lu/0+Y20OKY/7Y2gdhVCsv1t/9uaY9NUzCphrZBIyQcBoV8hbat84f9N/HKwhOTLDB4J
 FgTx4BoQ2yArB0iJZwGHsLLmaAtHCisWP6bF50YKz5T8fw2ApK+cs6qoWmSymgHSCulg
 D/xMIS2UCeHXFLLUUZiXdb7vC12gtwWQBAQmloDFbp+eU7xYzgWHBkiMyg7ZZ6tnlHtw
 LMkwQMg26NDe1qU91rebyaUtmIbRmDJTJV5GZ8f8WiwBIyCUr9MPQRCFVQfzS4EZhy8T
 N0bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV45llmeMki1W8AK9aBurHzi66an5+IQRqe3lv3V8BKXEGmuSCnFVFMPs5BIFTXhIDKk51f48VV0co=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLN+U7lT+6/6Z2wfOVzOi6Mb3xT0u4p08X+PYqhTyUijl6hhfO
 kli7pp+vyj/Je8bFis+LoWXG4jsJr9/+6OKVVWyeDmbuq+1ZhGO2+5ObXxcIipSz72li9q4NoqO
 niebN0gNK2Ordcjtb8w2wi/R1Git1g/KDwOpYra8Trlg+K6ZBeMHXyyIA/D+OnKWTU+vAnb4=
X-Gm-Gg: ASbGncte9CDx0MRVRyi4pE4kKJ6qo8U/dkK6Iv7bVkn1qYcpnZFRQqJwz0HKw6InhE6
 IwBuQREFb4SXcN/nB7AmOhJEVAFJqP1SyVU5irq3WgEhdutjOcUdVxCyTQ08DZvq/tIZ7yHLvD8
 yJ9peWi9bgfJ6I5kA2yHYS7AirekhURIMHK+E0FDMWY7YhPb80HlBLIummkGjWxfExIrYipW9fb
 Ahxht8bL11E52/6vRSM9O534mWbwH0eEmcKZSgqC3ay3tivmFndU9yOEDoXWQWe5FWxGG1JpCm2
 hmvVBQB5XlVG4vCusODkDZBnueBPtYCX+eIw0GrZA8Nme4/AeLR+viumKafUsgiW0+rJGC+mDAg
 N2LCDY/WIs/Zq4tfwsnmySuw8/obHLQEXJsLhaAN6Og6pjl/Oxk4Y
X-Received: by 2002:a05:6214:e67:b0:720:b2a:adf0 with SMTP id
 6a1803df08f44-7200b2aaef8mr153541836d6.30.1757032745688; 
 Thu, 04 Sep 2025 17:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGoowjAXuDT2UR0GO7JfTqRgPHDKO8FPpYvARPsmaNuPqmFwTraj6C8Ro2V7Wsk95bjRBebg==
X-Received: by 2002:a05:6214:e67:b0:720:b2a:adf0 with SMTP id
 6a1803df08f44-7200b2aaef8mr153541576d6.30.1757032745183; 
 Thu, 04 Sep 2025 17:39:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:39:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:39 +0300
Subject: [PATCH v2 10/12] drm/msm/dpu: drop redundant num_planes assignment
 in _dpu_format_populate_plane_sizes*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-10-7a674028c048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JJPS5pGG6bUUAwzvEHOTMwsPtX9lNOMwzWPn5B80/n0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEKQbRCY0g4KHf8n57GpKw1Y+ttJmoYzTX04
 YBzh1yOwoOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCgAKCRCLPIo+Aiko
 1QOgB/0Uu54pfB5QH+FHqAmhB9/t2x9w4aM6hKLwp8xBksHaiLzdkMLUxqbLmWuGq8Y5wAJ6FuK
 HQeTY82/twMeyWig5sNtz8pFwD0qRw9KAvoejcrCY6ZRSx9+vNhY/jPgncA3kAdp7Txi/H/GYaR
 r3MmM2z2Ws+I41CFom8UDJjGXS27O9BarmsTQJvLl7fbo1kYSQideKI7szGSqM2iUtI2OWpjwfe
 a2k2rGcvixt0CESANK5Tg2UiQBdua0jRWSD/MOTZIdJz4rkav3chetWRI43YtK4DszRU1cGdrdd
 mXcvkajnfIe0JIuQicrml0k2o+orUwUP5zvVKJgPwL9KI5p6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX3gpoolUt4HBQ
 jFuRqjL4ofIzwtthsZYZy3JykaFRZ/jfIrTjjeUOgBzZoIa3/H+n7RnniUDERaewzPyhZ+jYxRg
 yaw54qA0d8z7+bJDrDcR422og734jTuy3aarCKMoxTVi/VjQl3KjIT4vABW3f9ygn7RdmJ8G0b9
 kXRfEBXlPxODk6KUIEGZ6v0hyB7sSUgp8zphw14C5uM+j8JlFUKsaWElSileh4/m+rL00KFn2Ta
 J1aBD7cSX22rEvIDsHyhqrhST7bRaH8876TJHzWbQe31CSL18ae7KH/pZEj1d2dDEhjZylUrb5K
 d9/W53PQARTEPFdwGDKrVKRmY/JHrt7tbG1s+XHYGW/1T5V/ekGwSKMlHL377OCPJ9o+I2ieyoZ
 eqzJmbmJ
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68ba312b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VIt9t0sQHfAwVTtMwRsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: X61cWCWsMJzR4fkCcoqqHASDSZwvZ_iW
X-Proofpoint-ORIG-GUID: X61cWCWsMJzR4fkCcoqqHASDSZwvZ_iW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117
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
2.47.2

