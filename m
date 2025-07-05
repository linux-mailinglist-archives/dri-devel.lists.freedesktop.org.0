Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2EBAF9DD7
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 04:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A81F10E368;
	Sat,  5 Jul 2025 02:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+N3218N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4958A10E36F
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:57 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5650X1QP007414
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zTjSmwSAa6yTDqMZc38W+dUQ/0/X4lOOL/yJxyMBtv0=; b=d+N3218NNejs10ER
 xkaXR+AMbEGoc8x3xWcwANSFngm7DXtl6DwrCqZTCSrof7+J/26cB9iAxeu7W7bZ
 wdH405mBgioJ/bGKBkU/JBWqeh1AU+m++kZe/9/W/3f8OO5nKgv0nrSKVL4XGETd
 8YavyJStBM1mgOs24uZzbYYwU0BamBN9ByZaXcP/1fkwqBwgduTwdHRr15VCeuKx
 ooqXHUIv8RZ0e59YfjHELuCeJ7+v3+klsGq2g+T7rYRzUtryC8gxiLlT+P6ovfsw
 QY5Y4KldLdlzSKh7nF6QWeUjujse5esW/viyEZyDmgULjRIK5I/Y3wfOK0F78JIw
 +diPPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdq84ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d15c975968so234885485a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683675; x=1752288475;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zTjSmwSAa6yTDqMZc38W+dUQ/0/X4lOOL/yJxyMBtv0=;
 b=xMl4+pRWgmqviO0wByHSfnFESOLbQaxwHjEfRaxLynSx00jtZAnqTdem9YEtYx+CpC
 A01W5hbbtIw+EHQdQ5wQGg51Y60ttWFw+LvuJbd6l8reJOpe2Or9rbzMqgVVM93mDbMq
 dxbCd6A07B3nkqdGAdzvk+rwKYZ+q/PKOJYbqsrIyYmJFEpL8e7Hqs6XH4h8Kf79nJXm
 0GISaND7KKaNv+XwpOmEqGmIz33nBeiB0YRkxJH08kM2jnxhp1yFRtJHLPQdBDg/Q1t4
 c6Fq/uYdyWNy8gQ6HOxZlRTEntXTIs2hT4mER1wvWC3pjsBjhKonF2iN0c5OAcO4imrx
 A8TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA006at4LHuYZgxIz2gn09NQQCWw5pDldfbqFFlXsgbUOiEfPYTZa2AKjE26PG0oJbckIgY7ABcRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh6xKHycjgdwj/o+rpligJ+4oY+2BuWYkP9pBlAFZGsna+0TST
 ymMSFoeUVsJ+3OltrvgQ3GxkZF7lPk57FeQ4lA5QfCc/sx/9lxCjFlfLvSbJop4TlttjG4W+MeZ
 N5i7LywN4rQt3KCxz5lXm2c31Rhl62W4LZZmJ741w7y/9jCKFLc34PGXv3hSm2xfFIcJLJ0AV07
 3oXluSsw==
X-Gm-Gg: ASbGncvrzcpjtU65BbeA6dXqkYkTSHgXkeGkzM+PlL4Poy7iUW3EQfzeU2ls/cfYA6V
 0ELrBaGhb4zy39G+E/uX1+CEQeH+w4K10+HR4h6LvIjoCoOrGT06OX370DWOm1L/zlz38MeHEAZ
 3noYCWGrVIFaRJ0PBNaKURkCSmOLpkIBf9FeAnayNP2H90fp/XjanwNo8IDlajNMfM4xaGuebne
 2qM3QOHdpa4v7rzrct0nmEUM2Sa2biMY02HK3NnjYsn0Z9Nh/SmhF3+ntau3K9JG4k693JHOfDQ
 8aGjbMLItEWtEw/p8Z+zUmwlXcoGWXo+EYVMw07CKoWrvaQ5kUoggFri6SYbciTY7fOB6r83fkO
 DoOJjf/ah+kArOqV5IovSDTugNklqD7PejG8=
X-Received: by 2002:a05:620a:700c:b0:7d4:4073:426 with SMTP id
 af79cd13be357-7d5df102dc3mr488419885a.10.1751683674765; 
 Fri, 04 Jul 2025 19:47:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZWoviTs93gGJ+j/GTAGiXhkZfv9KNLnpOmGgLc0uLOjEpatwqwW7S5NrlY4NsvIhmzhe8aA==
X-Received: by 2002:a05:620a:700c:b0:7d4:4073:426 with SMTP id
 af79cd13be357-7d5df102dc3mr488416485a.10.1751683674335; 
 Fri, 04 Jul 2025 19:47:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:33 +0300
Subject: [PATCH 12/12] drm/msm/dpu: use standard functions in
 _dpu_format_populate_plane_sizes_ubwc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-12-40f0bb31b8c8@oss.qualcomm.com>
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5448;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fDL72GPzQmQB76txcVyhanNjbzZhYEM9L1c+/7lm29Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI+JuKKpLrS7xPn6yJjR0fiUzSkxZGXAE5hY
 2m00hGjZ/6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPgAKCRCLPIo+Aiko
 1dwhB/4sk6Yq70mL9wXivdqGs5Qn4wnldjh+wbzSZ6uuue18KtdcnB3r8u3Bv4r112p2874eJWG
 n/CYHtGwynhj1QEm0BkY36zZt/76unRomMLpNBRrhiDpK4TI2966d9If24rOK5CkpuWyh1io3rR
 pnTOTQ/tuVwk3291FcTKgqsydYA7E+c3hst5AgsB0pWOaoO5YxKxKpZDIFpA6ePVoyQDfl7fQVQ
 Cglxpo948iTaQciBbTvnM+zMdfxgJYE0N/G2xb25CwC6prGS+s35pNxJG1NNHsEpWOg6pcnMGkO
 vd0zXX923CQCPw/lrqSX3evS1Tej+R7UOBkt+Wxg0jERyFMb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=6868925c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=TEkP_0IIR_zyBM1EGkkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Pp6YNS_g1-D3K7CZmz21pEKJpn6K1KXK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX/TLYFdf0mtyU
 YGU4qUXjwh0c1NSnT64Zjza8zaRs0dHCKcdI0jZerzApuRtDJP2e+wJOTungQjPGh8walAGGMvl
 LT6rRB0X5p0h2DinYqaNt1Fxsgc8PdBjlsa5HRFSIenHIWl2erEBMASnLwCpXzj4KipYFiy0zyp
 BPWEXTliBHLeOgKe/Njcs2RDcrRo57Z3AG73bhZB0RVZcVHgt3+psbx+iCPS2sn4lbJq/Ogkg6G
 6fP5nYfTHeEWeWXu7TzWu4zVY1T0f7sWx/f3wpIdAr3Y9qnQgESdVw/cgyUf05prRVSvagnHi91
 MJX7a7vWqcwyuQx02nldZlVhJkXiHrHk0X70ovlS0JZB4UsoTlGl2ymh0UN0v0MSJthod6JKR3B
 uybDRxamfuRtH3IJfLcmX3691JEIu3RoXjXeV7SAyHy9AqGx3EywiTOi5Clq/Ovrg/FTJzLe
X-Proofpoint-GUID: Pp6YNS_g1-D3K7CZmz21pEKJpn6K1KXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=913 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050017
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

The _dpu_format_populate_plane_sizes_ubwc() used MSM_MEDIA_ALIGN() and
MSM_MEDIA_ROUNDUP(), macros inherited from the previous implementation,
msm_media_info.h. Replace them with the standard Linux macros,
round_up() and DIV_ROUND_UP() respectively.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 62 ++++++++++++-----------------
 1 file changed, 26 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 67bc5a6eeb43dcf113dea9eccdb778cd52b1ad40..6a0426ed1460c5af4822844d7a7b0c51739df875 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -10,16 +10,6 @@
 #include "dpu_kms.h"
 #include "dpu_formats.h"
 
-#ifndef MSM_MEDIA_ALIGN
-#define MSM_MEDIA_ALIGN(__sz, __align) (((__align) & ((__align) - 1)) ?\
-	((((__sz) + (__align) - 1) / (__align)) * (__align)) :\
-	(((__sz) + (__align) - 1) & (~((__align) - 1))))
-#endif
-
-#ifndef MSM_MEDIA_ROUNDUP
-#define MSM_MEDIA_ROUNDUP(__sz, __r) (((__sz) + ((__r) - 1)) / (__r))
-#endif
-
 #define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
 
 /*
@@ -80,57 +70,57 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		    fmt->pixel_format == DRM_FORMAT_P010) {
 			if (MSM_FORMAT_IS_DX(fmt)) {
 				if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
-					stride = MSM_MEDIA_ALIGN(fb->width, 192);
-					stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
+					stride = round_up(fb->width, 192);
+					stride = round_up(stride * 4 / 3, 256);
 					y_tile_width = 48;
 				} else {
-					stride = MSM_MEDIA_ALIGN(fb->width * 2, 256);
+					stride = round_up(fb->width * 2, 256);
 					y_tile_width = 32;
 				}
 
-				sclines = MSM_MEDIA_ALIGN(fb->height, 16);
+				sclines = round_up(fb->height, 16);
 				y_tile_height = 4;
 			} else {
-				stride = MSM_MEDIA_ALIGN(fb->width, 128);
+				stride = round_up(fb->width, 128);
 				y_tile_width = 32;
 
-				sclines = MSM_MEDIA_ALIGN(fb->height, 32);
+				sclines = round_up(fb->height, 32);
 				y_tile_height = 8;
 			}
 		}
 
 		layout->plane_pitch[0] = stride;
-		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
+		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
 			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		layout->plane_pitch[1] = stride;
-		layout->plane_size[1] = MSM_MEDIA_ALIGN(layout->plane_pitch[1] *
+		layout->plane_size[1] = round_up(layout->plane_pitch[1] *
 			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
 			return 0;
 
-		y_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, y_tile_width);
-		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(y_meta_stride, 64);
+		y_meta_stride = DIV_ROUND_UP(fb->width, y_tile_width);
+		layout->plane_pitch[2] = round_up(y_meta_stride, 64);
 
-		y_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, y_tile_height);
-		y_meta_scanlines = MSM_MEDIA_ALIGN(y_meta_scanlines, 16);
-		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
+		y_meta_scanlines = DIV_ROUND_UP(fb->height, y_tile_height);
+		y_meta_scanlines = round_up(y_meta_scanlines, 16);
+		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
 			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
-		uv_meta_stride = MSM_MEDIA_ROUNDUP((fb->width+1)>>1, y_tile_width / 2);
-		layout->plane_pitch[3] = MSM_MEDIA_ALIGN(uv_meta_stride, 64);
+		uv_meta_stride = DIV_ROUND_UP((fb->width+1)>>1, y_tile_width / 2);
+		layout->plane_pitch[3] = round_up(uv_meta_stride, 64);
 
-		uv_meta_scanlines = MSM_MEDIA_ROUNDUP((fb->height+1)>>1, y_tile_height);
-		uv_meta_scanlines = MSM_MEDIA_ALIGN(uv_meta_scanlines, 16);
-		layout->plane_size[3] = MSM_MEDIA_ALIGN(layout->plane_pitch[3] *
+		uv_meta_scanlines = DIV_ROUND_UP((fb->height+1)>>1, y_tile_height);
+		uv_meta_scanlines = round_up(uv_meta_scanlines, 16);
+		layout->plane_size[3] = round_up(layout->plane_pitch[3] *
 			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	} else {
 		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
 
-		layout->plane_pitch[0] = MSM_MEDIA_ALIGN(fb->width * fmt->bpp, 256);
-		rgb_scanlines = MSM_MEDIA_ALIGN(fb->height, 16);
-		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
+		layout->plane_pitch[0] = round_up(fb->width * fmt->bpp, 256);
+		rgb_scanlines = round_up(fb->height, 16);
+		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
 			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
@@ -139,13 +129,13 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		/* uAPI leaves plane[1] empty and plane[2] as meta */
 		layout->num_planes += 1;
 
-		rgb_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, 16);
-		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(rgb_meta_stride, 64);
+		rgb_meta_stride = DIV_ROUND_UP(fb->width, 16);
+		layout->plane_pitch[2] = round_up(rgb_meta_stride, 64);
 
-		rgb_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, 4);
-		rgb_meta_scanlines = MSM_MEDIA_ALIGN(rgb_meta_scanlines, 16);
+		rgb_meta_scanlines = DIV_ROUND_UP(fb->height, 4);
+		rgb_meta_scanlines = round_up(rgb_meta_scanlines, 16);
 
-		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
+		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
 			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	}
 

-- 
2.39.5

