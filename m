Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B25B44ADC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 02:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EFB10EB0A;
	Fri,  5 Sep 2025 00:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGSRn2ZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C279510E290
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 00:39:11 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584Hqteo032336
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 00:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PPC2tbexYvliH9B5TPZ8JBtafbJtogzjaF5b+VPCt/Y=; b=fGSRn2ZKdEtIlN+e
 PtitoVOXQLsHu5gmA9QXR7gIoeLcRaz1PEhBk+QjR6/RK/Rh3hGYYqK5wm012112
 xZ9+gGjOOyVWRWwwIMMyRuFy/KEkKfZiHndMxUyYCNS3Bfkvmd6zWBXuCW4REKS+
 pwgNaXNdc8iJzOHZzMJc3JO4BrKY09Z25325OYab9HMHyWcvVuQNJ9BZVqBay5zq
 pnQUL9UU1K93xmHogJYmALM1QvcD8WTnHQnsTD/vqQxpk36V4a14JgLAsyslsNOF
 1GYqDjPRPRjSJS/KksBVvyvQvgeVNDP8ToK6RuxS7+1qAWvszN4jNicSdvlfD/kn
 mmPFeA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnphf4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:39:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-71ffd145fa9so36229726d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 17:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032750; x=1757637550;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PPC2tbexYvliH9B5TPZ8JBtafbJtogzjaF5b+VPCt/Y=;
 b=o+ABySAp8KQtfmyQ/vaCsB00dSFWcIPk32fbVS5KLLmeaA9IbdJUWLLLJ7M+rr0cJn
 B6E3todtwnjSE8qNPl/oWYAwqUTJ3vNpw9s9k3V/OdxyfSgLvwk3pVc/qnEYGr822/8s
 ofMN0TSes2M/DPxfQXkTLi5ymsJp4fNg1m8lSVTmWE7z2EPZrfDIK9+eTbgJYAFnYEne
 srmn+D7nmfJfQrhuIz1mJpMwmyAGkbouCms1PNfUAVM1UvJKBnek/oSfN6++qoBbj5LX
 5YQnzjNf+u5vvR+wLjSYTpZbA3OlmAvyPzi6yOHcKDeGaOv272ArzUlW8DAL+K5Vwalb
 T5vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGWGefiEdvx1aj4NyURVRBbsW9KhTkV0Zgf/lMxrNxEbgPr0njvhwnQkv0QL1dckOvgC8sdgqcnnw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvVYDr6LZLwAvtwLSAsh6JkXa58EGtaWKS43xfQfw4FEUgGyqZ
 KJ5BiMM9BI+eDzAdCL5FGFpTphP88E9b+wzZASxqEO8iL+/bzOk8ohU/0jsZu2ljP/jBeMc3gV/
 fdRbzpwCn9HCTM1GhT238Qb/bdjo77MU4iugo/8KYwgWuqhvA+CgvcE0/bsz4qyzR/PVrzrI=
X-Gm-Gg: ASbGncu3zyeRtSvgsFapwMjH99J0ftEfl+lXC5WShGQ8UCzwFXh4fLBfriT7jnJiSDG
 Sy5jU/TepDqZ9PZF6snt8ojVlmV8QcKHNunW7zfWPBf1D3XewVrJP34eUzhMzja8dMxBEzqSDWC
 PfksB2PC1mEgZvKzeU51TgkLcMZG7nHoqvWGp4wRYoo4jm7zpaIRljf85pmNToNGylfZmFyXHFX
 qGs1jeBRU/HcDX3Xl8zy1XxLbGmJKhfHEO1X2HlGyzRyJB9OLnF+dmvjhcCv6i8EqpeMB8rT9Ee
 5g9nIINk3l56A0yvU4W0hwkYor3o7lLTn4RjSxD+X8NuyeHYYcFHWWnPgBVOOPkIV4uZ49k0ohc
 8gITF3kClX6jpfQu0lLBshVLo3DJetbxaxU5we6hRW4Ad6XeYdCfx
X-Received: by 2002:a05:6214:400b:b0:719:44be:3fc1 with SMTP id
 6a1803df08f44-71944be407fmr194794866d6.1.1757032749203; 
 Thu, 04 Sep 2025 17:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp2ZBNPqaQYX5riFpghrDjaPZcF525ndLImAq+dbqLsQf+ivkyDvWafGEE49uKNJRINm3ojg==
X-Received: by 2002:a05:6214:400b:b0:719:44be:3fc1 with SMTP id
 6a1803df08f44-71944be407fmr194794136d6.1.1757032747903; 
 Thu, 04 Sep 2025 17:39:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:39:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:40 +0300
Subject: [PATCH v2 11/12] drm/msm/dpu: rewrite
 _dpu_format_populate_plane_sizes_ubwc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-11-7a674028c048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=52387;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ukwAtc1v9RxhzlsYCTAnLOyxbmU9nfNAVwUDPYyJkGs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEKCIEY+1xyc1RE1kQ3+9/nbVwY17lTTl4k8
 ns4U+TxnOuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCgAKCRCLPIo+Aiko
 1Z5/CACjaVFOZW6L4jByuzZl2I9Z3Vy28401zmHBEtxJ9v/Qnwl8J0axdrf4Vkt18vz3A1HWFBB
 fg9cNLquVpWEZeOkqgY7vJ+MHlvElmTjFFSDI1Y5RQMGsgg09LehqSwF/xaljQ7HR1o+2YPMB9+
 p9XI/DSa0vnqT1Oy3yrRB2Ru/n93+zFZX6Y7Gwe883uqy28sUNQFd9Q1mZDq7vo7heAjaZIDFH/
 nfbckz1wiYU8TmzdQNvJGuD2bM05WWbbF8nqXuf4Ni3K0e4jb/qZAHBlOOtvuw1Sj/GlTgFC7+W
 Smcl9SJxnJW1ij8QvsAtkvju0dNLl4B0czUXoX85sd1aoGld
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Oyy3DIzfPBybh46A6f4sFg1EEWY2chGt
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68ba312e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6iusXPdm3c8emWAo3PYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Oyy3DIzfPBybh46A6f4sFg1EEWY2chGt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXx9ZQgGs1tsAC
 N9QEjJaaz0DlkFSodb3FphliW7hrIOxHVr3mBDnRpTdqVWacB7FkWSUHtTq1WIfI060jypy71dE
 HN1ZGp/+Ws09WN6c9ENJ+FJB3MF9DeuQiOff5tOZnSdO31teUnX0JZLTYz3pMqWvVhLjr0x6TV3
 zkLxvmsN493KWmDxknL8louQjRXjgo/1ll7cb7Tg36Tdw3Za7PAGEYiiPCo2PyDcuUCl1MTO4Jc
 uRAFOXX0Y2sLA5Eh1viygwKcFFnbIuO/XqEqUiVQlONeCijv8JrY7CpLNpxIQCWVoFikHn6xzAw
 KNKbbI+JNwyfyCr3YmMf7+FEe2N0kfsuSYQymD8LOsdu6uqsKZj33EURUNlg41FgPV8yFUCUWOz
 eD5jef4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

Drop extra wrapping layer (msm_media_info.h) and inline all VENUS_*()
functions, simplifying the code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    |  121 ++-
 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h | 1155 ------------------------
 2 files changed, 57 insertions(+), 1219 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 191d1f2a0cef7ed69342eceb35df0c3e99a0c373..da1870ce7680899759d09caa01050eeb9844a484 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -7,10 +7,19 @@
 #include <uapi/drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 
-#include "msm_media_info.h"
 #include "dpu_kms.h"
 #include "dpu_formats.h"
 
+#ifndef MSM_MEDIA_ALIGN
+#define MSM_MEDIA_ALIGN(__sz, __align) (((__align) & ((__align) - 1)) ?\
+	((((__sz) + (__align) - 1) / (__align)) * (__align)) :\
+	(((__sz) + (__align) - 1) & (~((__align) - 1))))
+#endif
+
+#ifndef MSM_MEDIA_ROUNDUP
+#define MSM_MEDIA_ROUNDUP(__sz, __r) (((__sz) + ((__r) - 1)) / (__r))
+#endif
+
 #define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
 
 /*
@@ -54,90 +63,70 @@ static void _dpu_get_v_h_subsample_rate(
 	}
 }
 
-static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
-{
-	static const struct dpu_media_color_map dpu_media_ubwc_map[] = {
-		{DRM_FORMAT_ABGR8888, COLOR_FMT_RGBA8888_UBWC},
-		{DRM_FORMAT_ARGB8888, COLOR_FMT_RGBA8888_UBWC},
-		{DRM_FORMAT_XBGR8888, COLOR_FMT_RGBA8888_UBWC},
-		{DRM_FORMAT_XRGB8888, COLOR_FMT_RGBA8888_UBWC},
-		{DRM_FORMAT_ABGR2101010, COLOR_FMT_RGBA1010102_UBWC},
-		{DRM_FORMAT_ARGB2101010, COLOR_FMT_RGBA1010102_UBWC},
-		{DRM_FORMAT_XRGB2101010, COLOR_FMT_RGBA1010102_UBWC},
-		{DRM_FORMAT_XBGR2101010, COLOR_FMT_RGBA1010102_UBWC},
-		{DRM_FORMAT_BGR565, COLOR_FMT_RGB565_UBWC},
-	};
-	int color_fmt = -1;
-	int i;
-
-	if (fmt->pixel_format == DRM_FORMAT_NV12 ||
-	    fmt->pixel_format == DRM_FORMAT_P010) {
-		if (MSM_FORMAT_IS_DX(fmt)) {
-			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT)
-				color_fmt = COLOR_FMT_NV12_BPP10_UBWC;
-			else
-				color_fmt = COLOR_FMT_P010_UBWC;
-		} else
-			color_fmt = COLOR_FMT_NV12_UBWC;
-		return color_fmt;
-	}
-
-	for (i = 0; i < ARRAY_SIZE(dpu_media_ubwc_map); ++i)
-		if (fmt->pixel_format == dpu_media_ubwc_map[i].format) {
-			color_fmt = dpu_media_ubwc_map[i].color;
-			break;
-		}
-	return color_fmt;
-}
-
 static int _dpu_format_populate_plane_sizes_ubwc(
 		const struct msm_format *fmt,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	int color;
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
-	color = _dpu_format_get_media_color_ubwc(fmt);
-	if (color < 0) {
-		DRM_ERROR("UBWC format not supported for fmt: %p4cc\n",
-			  &fmt->pixel_format);
-		return -EINVAL;
-	}
-
 	if (MSM_FORMAT_IS_YUV(fmt)) {
-		uint32_t y_sclines, uv_sclines;
-		uint32_t y_meta_scanlines = 0;
-		uint32_t uv_meta_scanlines = 0;
+		unsigned int stride, sclines;
+		unsigned int y_tile_width, y_tile_height;
+		unsigned int y_meta_stride, y_meta_scanlines;
+		unsigned int uv_meta_stride, uv_meta_scanlines;
+
+		if (MSM_FORMAT_IS_DX(fmt)) {
+			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
+				stride = MSM_MEDIA_ALIGN(fb->width, 192);
+				stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
+				y_tile_width = 48;
+			} else {
+				stride = MSM_MEDIA_ALIGN(fb->width * 2, 256);
+				y_tile_width = 32;
+			}
+
+			sclines = MSM_MEDIA_ALIGN(fb->height, 16);
+			y_tile_height = 4;
+		} else {
+			stride = MSM_MEDIA_ALIGN(fb->width, 128);
+			y_tile_width = 32;
+
+			sclines = MSM_MEDIA_ALIGN(fb->height, 32);
+			y_tile_height = 8;
+		}
 
-		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, fb->width);
-		y_sclines = VENUS_Y_SCANLINES(color, fb->height);
+		layout->plane_pitch[0] = stride;
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
-			y_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
+			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
-		layout->plane_pitch[1] = VENUS_UV_STRIDE(color, fb->width);
-		uv_sclines = VENUS_UV_SCANLINES(color, fb->height);
+		layout->plane_pitch[1] = stride;
 		layout->plane_size[1] = MSM_MEDIA_ALIGN(layout->plane_pitch[1] *
-			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
+			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
 			return 0;
 
-		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
-		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, fb->height);
+		y_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, y_tile_width);
+		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(y_meta_stride, 64);
+
+		y_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, y_tile_height);
+		y_meta_scanlines = MSM_MEDIA_ALIGN(y_meta_scanlines, 16);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
 			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
-		layout->plane_pitch[3] = VENUS_UV_META_STRIDE(color, fb->width);
-		uv_meta_scanlines = VENUS_UV_META_SCANLINES(color, fb->height);
+		uv_meta_stride = MSM_MEDIA_ROUNDUP((fb->width+1)>>1, y_tile_width / 2);
+		layout->plane_pitch[3] = MSM_MEDIA_ALIGN(uv_meta_stride, 64);
+
+		uv_meta_scanlines = MSM_MEDIA_ROUNDUP((fb->height+1)>>1, y_tile_height);
+		uv_meta_scanlines = MSM_MEDIA_ALIGN(uv_meta_scanlines, 16);
 		layout->plane_size[3] = MSM_MEDIA_ALIGN(layout->plane_pitch[3] *
 			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-
 	} else {
-		uint32_t rgb_scanlines, rgb_meta_scanlines;
+		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
 
-		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, fb->width);
-		rgb_scanlines = VENUS_RGB_SCANLINES(color, fb->height);
+		layout->plane_pitch[0] = MSM_MEDIA_ALIGN(fb->width * fmt->bpp, 256);
+		rgb_scanlines = MSM_MEDIA_ALIGN(fb->height, 16);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
 			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
@@ -147,8 +136,12 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		/* uAPI leaves plane[1] empty and plane[2] as meta */
 		layout->num_planes += 1;
 
-		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
-		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
+		rgb_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, 16);
+		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(rgb_meta_stride, 64);
+
+		rgb_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, 4);
+		rgb_meta_scanlines = MSM_MEDIA_ALIGN(rgb_meta_scanlines, 16);
+
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
 			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h b/drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h
deleted file mode 100644
index 9fc9dbde8a27c1d7078c3d6b260c8635f27a514f..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h
+++ /dev/null
@@ -1,1155 +0,0 @@
-#ifndef __MEDIA_INFO_H__
-#define __MEDIA_INFO_H__
-
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
-#ifndef MSM_MEDIA_MAX
-#define MSM_MEDIA_MAX(__a, __b) ((__a) > (__b)?(__a):(__b))
-#endif
-
-enum color_fmts {
-	/* Venus NV12:
-	 * YUV 4:2:0 image with a plane of 8 bit Y samples followed
-	 * by an interleaved U/V plane containing 8 bit 2x2 subsampled
-	 * colour difference samples.
-	 *
-	 * <-------- Y/UV_Stride -------->
-	 * <------- Width ------->
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          Y_Scanlines
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              V
-	 * U V U V U V U V U V U V . . . .  ^
-	 * U V U V U V U V U V U V . . . .  |
-	 * U V U V U V U V U V U V . . . .  |
-	 * U V U V U V U V U V U V . . . .  UV_Scanlines
-	 * . . . . . . . . . . . . . . . .  |
-	 * . . . . . . . . . . . . . . . .  V
-	 * . . . . . . . . . . . . . . . .  --> Buffer size alignment
-	 *
-	 * Y_Stride : Width aligned to 128
-	 * UV_Stride : Width aligned to 128
-	 * Y_Scanlines: Height aligned to 32
-	 * UV_Scanlines: Height/2 aligned to 16
-	 * Extradata: Arbitrary (software-imposed) padding
-	 * Total size = align((Y_Stride * Y_Scanlines
-	 *          + UV_Stride * UV_Scanlines
-	 *          + max(Extradata, Y_Stride * 8), 4096)
-	 */
-	COLOR_FMT_NV12,
-
-	/* Venus NV21:
-	 * YUV 4:2:0 image with a plane of 8 bit Y samples followed
-	 * by an interleaved V/U plane containing 8 bit 2x2 subsampled
-	 * colour difference samples.
-	 *
-	 * <-------- Y/UV_Stride -------->
-	 * <------- Width ------->
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          Y_Scanlines
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              V
-	 * V U V U V U V U V U V U . . . .  ^
-	 * V U V U V U V U V U V U . . . .  |
-	 * V U V U V U V U V U V U . . . .  |
-	 * V U V U V U V U V U V U . . . .  UV_Scanlines
-	 * . . . . . . . . . . . . . . . .  |
-	 * . . . . . . . . . . . . . . . .  V
-	 * . . . . . . . . . . . . . . . .  --> Padding & Buffer size alignment
-	 *
-	 * Y_Stride : Width aligned to 128
-	 * UV_Stride : Width aligned to 128
-	 * Y_Scanlines: Height aligned to 32
-	 * UV_Scanlines: Height/2 aligned to 16
-	 * Extradata: Arbitrary (software-imposed) padding
-	 * Total size = align((Y_Stride * Y_Scanlines
-	 *          + UV_Stride * UV_Scanlines
-	 *          + max(Extradata, Y_Stride * 8), 4096)
-	 */
-	COLOR_FMT_NV21,
-	/* Venus NV12_MVTB:
-	 * Two YUV 4:2:0 images/views one after the other
-	 * in a top-bottom layout, same as NV12
-	 * with a plane of 8 bit Y samples followed
-	 * by an interleaved U/V plane containing 8 bit 2x2 subsampled
-	 * colour difference samples.
-	 *
-	 *
-	 * <-------- Y/UV_Stride -------->
-	 * <------- Width ------->
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^               ^
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |               |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          Y_Scanlines      |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |               |
-	 * . . . . . . . . . . . . . . . .              |             View_1
-	 * . . . . . . . . . . . . . . . .              |               |
-	 * . . . . . . . . . . . . . . . .              |               |
-	 * . . . . . . . . . . . . . . . .              V               |
-	 * U V U V U V U V U V U V . . . .  ^                           |
-	 * U V U V U V U V U V U V . . . .  |                           |
-	 * U V U V U V U V U V U V . . . .  |                           |
-	 * U V U V U V U V U V U V . . . .  UV_Scanlines                |
-	 * . . . . . . . . . . . . . . . .  |                           |
-	 * . . . . . . . . . . . . . . . .  V                           V
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^               ^
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |               |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          Y_Scanlines      |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |               |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |               |
-	 * . . . . . . . . . . . . . . . .              |             View_2
-	 * . . . . . . . . . . . . . . . .              |               |
-	 * . . . . . . . . . . . . . . . .              |               |
-	 * . . . . . . . . . . . . . . . .              V               |
-	 * U V U V U V U V U V U V . . . .  ^                           |
-	 * U V U V U V U V U V U V . . . .  |                           |
-	 * U V U V U V U V U V U V . . . .  |                           |
-	 * U V U V U V U V U V U V . . . .  UV_Scanlines                |
-	 * . . . . . . . . . . . . . . . .  |                           |
-	 * . . . . . . . . . . . . . . . .  V                           V
-	 * . . . . . . . . . . . . . . . .  --> Buffer size alignment
-	 *
-	 * Y_Stride : Width aligned to 128
-	 * UV_Stride : Width aligned to 128
-	 * Y_Scanlines: Height aligned to 32
-	 * UV_Scanlines: Height/2 aligned to 16
-	 * View_1 begin at: 0 (zero)
-	 * View_2 begin at: Y_Stride * Y_Scanlines + UV_Stride * UV_Scanlines
-	 * Extradata: Arbitrary (software-imposed) padding
-	 * Total size = align((2*(Y_Stride * Y_Scanlines)
-	 *          + 2*(UV_Stride * UV_Scanlines) + Extradata), 4096)
-	 */
-	COLOR_FMT_NV12_MVTB,
-	/*
-	 * The buffer can be of 2 types:
-	 * (1) Venus NV12 UBWC Progressive
-	 * (2) Venus NV12 UBWC Interlaced
-	 *
-	 * (1) Venus NV12 UBWC Progressive Buffer Format:
-	 * Compressed Macro-tile format for NV12.
-	 * Contains 4 planes in the following order -
-	 * (A) Y_Meta_Plane
-	 * (B) Y_UBWC_Plane
-	 * (C) UV_Meta_Plane
-	 * (D) UV_UBWC_Plane
-	 *
-	 * Y_Meta_Plane consists of meta information to decode compressed
-	 * tile data in Y_UBWC_Plane.
-	 * Y_UBWC_Plane consists of Y data in compressed macro-tile format.
-	 * UBWC decoder block will use the Y_Meta_Plane data together with
-	 * Y_UBWC_Plane data to produce loss-less uncompressed 8 bit Y samples.
-	 *
-	 * UV_Meta_Plane consists of meta information to decode compressed
-	 * tile data in UV_UBWC_Plane.
-	 * UV_UBWC_Plane consists of UV data in compressed macro-tile format.
-	 * UBWC decoder block will use UV_Meta_Plane data together with
-	 * UV_UBWC_Plane data to produce loss-less uncompressed 8 bit 2x2
-	 * subsampled color difference samples.
-	 *
-	 * Each tile in Y_UBWC_Plane/UV_UBWC_Plane is independently decodable
-	 * and randomly accessible. There is no dependency between tiles.
-	 *
-	 * <----- Y_Meta_Stride ---->
-	 * <-------- Width ------>
-	 * M M M M M M M M M M M M . .      ^           ^
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      Height      |
-	 * M M M M M M M M M M M M . .      |         Meta_Y_Scanlines
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      V           |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . .                  V
-	 * <--Compressed tile Y Stride--->
-	 * <------- Width ------->
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  Height      |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_Scanlines
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . . . .              V
-	 * <----- UV_Meta_Stride ---->
-	 * M M M M M M M M M M M M . .      ^
-	 * M M M M M M M M M M M M . .      |
-	 * M M M M M M M M M M M M . .      |
-	 * M M M M M M M M M M M M . .      M_UV_Scanlines
-	 * . . . . . . . . . . . . . .      |
-	 * . . . . . . . . . . . . . .      V
-	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
-	 * <--Compressed tile UV Stride--->
-	 * U* V* U* V* U* V* U* V* . . . .  ^
-	 * U* V* U* V* U* V* U* V* . . . .  |
-	 * U* V* U* V* U* V* U* V* . . . .  |
-	 * U* V* U* V* U* V* U* V* . . . .  UV_Scanlines
-	 * . . . . . . . . . . . . . . . .  |
-	 * . . . . . . . . . . . . . . . .  V
-	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
-	 *
-	 * Y_Stride = align(Width, 128)
-	 * UV_Stride = align(Width, 128)
-	 * Y_Scanlines = align(Height, 32)
-	 * UV_Scanlines = align(Height/2, 16)
-	 * Y_UBWC_Plane_size = align(Y_Stride * Y_Scanlines, 4096)
-	 * UV_UBWC_Plane_size = align(UV_Stride * UV_Scanlines, 4096)
-	 * Y_Meta_Stride = align(roundup(Width, Y_TileWidth), 64)
-	 * Y_Meta_Scanlines = align(roundup(Height, Y_TileHeight), 16)
-	 * Y_Meta_Plane_size = align(Y_Meta_Stride * Y_Meta_Scanlines, 4096)
-	 * UV_Meta_Stride = align(roundup(Width, UV_TileWidth), 64)
-	 * UV_Meta_Scanlines = align(roundup(Height, UV_TileHeight), 16)
-	 * UV_Meta_Plane_size = align(UV_Meta_Stride * UV_Meta_Scanlines, 4096)
-	 * Extradata = 8k
-	 *
-	 * Total size = align( Y_UBWC_Plane_size + UV_UBWC_Plane_size +
-	 *           Y_Meta_Plane_size + UV_Meta_Plane_size
-	 *           + max(Extradata, Y_Stride * 48), 4096)
-	 *
-	 *
-	 * (2) Venus NV12 UBWC Interlaced Buffer Format:
-	 * Compressed Macro-tile format for NV12 interlaced.
-	 * Contains 8 planes in the following order -
-	 * (A) Y_Meta_Top_Field_Plane
-	 * (B) Y_UBWC_Top_Field_Plane
-	 * (C) UV_Meta_Top_Field_Plane
-	 * (D) UV_UBWC_Top_Field_Plane
-	 * (E) Y_Meta_Bottom_Field_Plane
-	 * (F) Y_UBWC_Bottom_Field_Plane
-	 * (G) UV_Meta_Bottom_Field_Plane
-	 * (H) UV_UBWC_Bottom_Field_Plane
-	 * Y_Meta_Top_Field_Plane consists of meta information to decode
-	 * compressed tile data for Y_UBWC_Top_Field_Plane.
-	 * Y_UBWC_Top_Field_Plane consists of Y data in compressed macro-tile
-	 * format for top field of an interlaced frame.
-	 * UBWC decoder block will use the Y_Meta_Top_Field_Plane data together
-	 * with Y_UBWC_Top_Field_Plane data to produce loss-less uncompressed
-	 * 8 bit Y samples for top field of an interlaced frame.
-	 *
-	 * UV_Meta_Top_Field_Plane consists of meta information to decode
-	 * compressed tile data in UV_UBWC_Top_Field_Plane.
-	 * UV_UBWC_Top_Field_Plane consists of UV data in compressed macro-tile
-	 * format for top field of an interlaced frame.
-	 * UBWC decoder block will use UV_Meta_Top_Field_Plane data together
-	 * with UV_UBWC_Top_Field_Plane data to produce loss-less uncompressed
-	 * 8 bit subsampled color difference samples for top field of an
-	 * interlaced frame.
-	 *
-	 * Each tile in Y_UBWC_Top_Field_Plane/UV_UBWC_Top_Field_Plane is
-	 * independently decodable and randomly accessible. There is no
-	 * dependency between tiles.
-	 *
-	 * Y_Meta_Bottom_Field_Plane consists of meta information to decode
-	 * compressed tile data for Y_UBWC_Bottom_Field_Plane.
-	 * Y_UBWC_Bottom_Field_Plane consists of Y data in compressed macro-tile
-	 * format for bottom field of an interlaced frame.
-	 * UBWC decoder block will use the Y_Meta_Bottom_Field_Plane data
-	 * together with Y_UBWC_Bottom_Field_Plane data to produce loss-less
-	 * uncompressed 8 bit Y samples for bottom field of an interlaced frame.
-	 *
-	 * UV_Meta_Bottom_Field_Plane consists of meta information to decode
-	 * compressed tile data in UV_UBWC_Bottom_Field_Plane.
-	 * UV_UBWC_Bottom_Field_Plane consists of UV data in compressed
-	 * macro-tile format for bottom field of an interlaced frame.
-	 * UBWC decoder block will use UV_Meta_Bottom_Field_Plane data together
-	 * with UV_UBWC_Bottom_Field_Plane data to produce loss-less
-	 * uncompressed 8 bit subsampled color difference samples for bottom
-	 * field of an interlaced frame.
-	 *
-	 * Each tile in Y_UBWC_Bottom_Field_Plane/UV_UBWC_Bottom_Field_Plane is
-	 * independently decodable and randomly accessible. There is no
-	 * dependency between tiles.
-	 *
-	 * <-----Y_TF_Meta_Stride---->
-	 * <-------- Width ------>
-	 * M M M M M M M M M M M M . .      ^           ^
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . . Half_height      |
-	 * M M M M M M M M M M M M . .      |         Meta_Y_TF_Scanlines
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      V           |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . .                  V
-	 * <-Compressed tile Y_TF Stride->
-	 * <------- Width ------->
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . . Half_height  |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_TF_Scanlines
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . . . .              V
-	 * <----UV_TF_Meta_Stride---->
-	 * M M M M M M M M M M M M . .      ^
-	 * M M M M M M M M M M M M . .      |
-	 * M M M M M M M M M M M M . .      |
-	 * M M M M M M M M M M M M . .      M_UV_TF_Scanlines
-	 * . . . . . . . . . . . . . .      |
-	 * . . . . . . . . . . . . . .      V
-	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
-	 * <-Compressed tile UV_TF Stride->
-	 * U* V* U* V* U* V* U* V* . . . .  ^
-	 * U* V* U* V* U* V* U* V* . . . .  |
-	 * U* V* U* V* U* V* U* V* . . . .  |
-	 * U* V* U* V* U* V* U* V* . . . .  UV_TF_Scanlines
-	 * . . . . . . . . . . . . . . . .  |
-	 * . . . . . . . . . . . . . . . .  V
-	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
-	 * <-----Y_BF_Meta_Stride---->
-	 * <-------- Width ------>
-	 * M M M M M M M M M M M M . .      ^           ^
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . . Half_height      |
-	 * M M M M M M M M M M M M . .      |         Meta_Y_BF_Scanlines
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      V           |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . .                  V
-	 * <-Compressed tile Y_BF Stride->
-	 * <------- Width ------->
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . . Half_height  |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_BF_Scanlines
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . . . .              V
-	 * <----UV_BF_Meta_Stride---->
-	 * M M M M M M M M M M M M . .      ^
-	 * M M M M M M M M M M M M . .      |
-	 * M M M M M M M M M M M M . .      |
-	 * M M M M M M M M M M M M . .      M_UV_BF_Scanlines
-	 * . . . . . . . . . . . . . .      |
-	 * . . . . . . . . . . . . . .      V
-	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
-	 * <-Compressed tile UV_BF Stride->
-	 * U* V* U* V* U* V* U* V* . . . .  ^
-	 * U* V* U* V* U* V* U* V* . . . .  |
-	 * U* V* U* V* U* V* U* V* . . . .  |
-	 * U* V* U* V* U* V* U* V* . . . .  UV_BF_Scanlines
-	 * . . . . . . . . . . . . . . . .  |
-	 * . . . . . . . . . . . . . . . .  V
-	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
-	 *
-	 * Half_height = (Height+1)>>1
-	 * Y_TF_Stride = align(Width, 128)
-	 * UV_TF_Stride = align(Width, 128)
-	 * Y_TF_Scanlines = align(Half_height, 32)
-	 * UV_TF_Scanlines = align((Half_height+1)/2, 32)
-	 * Y_UBWC_TF_Plane_size = align(Y_TF_Stride * Y_TF_Scanlines, 4096)
-	 * UV_UBWC_TF_Plane_size = align(UV_TF_Stride * UV_TF_Scanlines, 4096)
-	 * Y_TF_Meta_Stride = align(roundup(Width, Y_TileWidth), 64)
-	 * Y_TF_Meta_Scanlines = align(roundup(Half_height, Y_TileHeight), 16)
-	 * Y_TF_Meta_Plane_size =
-	 *     align(Y_TF_Meta_Stride * Y_TF_Meta_Scanlines, 4096)
-	 * UV_TF_Meta_Stride = align(roundup(Width, UV_TileWidth), 64)
-	 * UV_TF_Meta_Scanlines = align(roundup(Half_height, UV_TileHeight), 16)
-	 * UV_TF_Meta_Plane_size =
-	 *     align(UV_TF_Meta_Stride * UV_TF_Meta_Scanlines, 4096)
-	 * Y_BF_Stride = align(Width, 128)
-	 * UV_BF_Stride = align(Width, 128)
-	 * Y_BF_Scanlines = align(Half_height, 32)
-	 * UV_BF_Scanlines = align((Half_height+1)/2, 32)
-	 * Y_UBWC_BF_Plane_size = align(Y_BF_Stride * Y_BF_Scanlines, 4096)
-	 * UV_UBWC_BF_Plane_size = align(UV_BF_Stride * UV_BF_Scanlines, 4096)
-	 * Y_BF_Meta_Stride = align(roundup(Width, Y_TileWidth), 64)
-	 * Y_BF_Meta_Scanlines = align(roundup(Half_height, Y_TileHeight), 16)
-	 * Y_BF_Meta_Plane_size =
-	 *     align(Y_BF_Meta_Stride * Y_BF_Meta_Scanlines, 4096)
-	 * UV_BF_Meta_Stride = align(roundup(Width, UV_TileWidth), 64)
-	 * UV_BF_Meta_Scanlines = align(roundup(Half_height, UV_TileHeight), 16)
-	 * UV_BF_Meta_Plane_size =
-	 *     align(UV_BF_Meta_Stride * UV_BF_Meta_Scanlines, 4096)
-	 * Extradata = 8k
-	 *
-	 * Total size = align( Y_UBWC_TF_Plane_size + UV_UBWC_TF_Plane_size +
-	 *           Y_TF_Meta_Plane_size + UV_TF_Meta_Plane_size +
-	 *			 Y_UBWC_BF_Plane_size + UV_UBWC_BF_Plane_size +
-	 *           Y_BF_Meta_Plane_size + UV_BF_Meta_Plane_size +
-	 *           + max(Extradata, Y_TF_Stride * 48), 4096)
-	 */
-	COLOR_FMT_NV12_UBWC,
-	/* Venus NV12 10-bit UBWC:
-	 * Compressed Macro-tile format for NV12.
-	 * Contains 4 planes in the following order -
-	 * (A) Y_Meta_Plane
-	 * (B) Y_UBWC_Plane
-	 * (C) UV_Meta_Plane
-	 * (D) UV_UBWC_Plane
-	 *
-	 * Y_Meta_Plane consists of meta information to decode compressed
-	 * tile data in Y_UBWC_Plane.
-	 * Y_UBWC_Plane consists of Y data in compressed macro-tile format.
-	 * UBWC decoder block will use the Y_Meta_Plane data together with
-	 * Y_UBWC_Plane data to produce loss-less uncompressed 10 bit Y samples.
-	 *
-	 * UV_Meta_Plane consists of meta information to decode compressed
-	 * tile data in UV_UBWC_Plane.
-	 * UV_UBWC_Plane consists of UV data in compressed macro-tile format.
-	 * UBWC decoder block will use UV_Meta_Plane data together with
-	 * UV_UBWC_Plane data to produce loss-less uncompressed 10 bit 2x2
-	 * subsampled color difference samples.
-	 *
-	 * Each tile in Y_UBWC_Plane/UV_UBWC_Plane is independently decodable
-	 * and randomly accessible. There is no dependency between tiles.
-	 *
-	 * <----- Y_Meta_Stride ----->
-	 * <-------- Width ------>
-	 * M M M M M M M M M M M M . .      ^           ^
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      Height      |
-	 * M M M M M M M M M M M M . .      |         Meta_Y_Scanlines
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      V           |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . .                  V
-	 * <--Compressed tile Y Stride--->
-	 * <------- Width ------->
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  Height      |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_Scanlines
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . . . .              V
-	 * <----- UV_Meta_Stride ---->
-	 * M M M M M M M M M M M M . .      ^
-	 * M M M M M M M M M M M M . .      |
-	 * M M M M M M M M M M M M . .      |
-	 * M M M M M M M M M M M M . .      M_UV_Scanlines
-	 * . . . . . . . . . . . . . .      |
-	 * . . . . . . . . . . . . . .      V
-	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
-	 * <--Compressed tile UV Stride--->
-	 * U* V* U* V* U* V* U* V* . . . .  ^
-	 * U* V* U* V* U* V* U* V* . . . .  |
-	 * U* V* U* V* U* V* U* V* . . . .  |
-	 * U* V* U* V* U* V* U* V* . . . .  UV_Scanlines
-	 * . . . . . . . . . . . . . . . .  |
-	 * . . . . . . . . . . . . . . . .  V
-	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
-	 *
-	 *
-	 * Y_Stride = align(Width * 4/3, 128)
-	 * UV_Stride = align(Width * 4/3, 128)
-	 * Y_Scanlines = align(Height, 32)
-	 * UV_Scanlines = align(Height/2, 16)
-	 * Y_UBWC_Plane_Size = align(Y_Stride * Y_Scanlines, 4096)
-	 * UV_UBWC_Plane_Size = align(UV_Stride * UV_Scanlines, 4096)
-	 * Y_Meta_Stride = align(roundup(Width, Y_TileWidth), 64)
-	 * Y_Meta_Scanlines = align(roundup(Height, Y_TileHeight), 16)
-	 * Y_Meta_Plane_size = align(Y_Meta_Stride * Y_Meta_Scanlines, 4096)
-	 * UV_Meta_Stride = align(roundup(Width, UV_TileWidth), 64)
-	 * UV_Meta_Scanlines = align(roundup(Height, UV_TileHeight), 16)
-	 * UV_Meta_Plane_size = align(UV_Meta_Stride * UV_Meta_Scanlines, 4096)
-	 * Extradata = 8k
-	 *
-	 * Total size = align(Y_UBWC_Plane_size + UV_UBWC_Plane_size +
-	 *           Y_Meta_Plane_size + UV_Meta_Plane_size
-	 *           + max(Extradata, Y_Stride * 48), 4096)
-	 */
-	COLOR_FMT_NV12_BPP10_UBWC,
-	/* Venus RGBA8888 format:
-	 * Contains 1 plane in the following order -
-	 * (A) RGBA plane
-	 *
-	 * <-------- RGB_Stride -------->
-	 * <------- Width ------->
-	 * R R R R R R R R R R R R . . . .  ^           ^
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  Height      |
-	 * R R R R R R R R R R R R . . . .  |       RGB_Scanlines
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  V           |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              V
-	 *
-	 * RGB_Stride = align(Width * 4, 128)
-	 * RGB_Scanlines = align(Height, 32)
-	 * RGB_Plane_size = align(RGB_Stride * RGB_Scanlines, 4096)
-	 * Extradata = 8k
-	 *
-	 * Total size = align(RGB_Plane_size + Extradata, 4096)
-	 */
-	COLOR_FMT_RGBA8888,
-	/* Venus RGBA8888 UBWC format:
-	 * Contains 2 planes in the following order -
-	 * (A) Meta plane
-	 * (B) RGBA plane
-	 *
-	 * <--- RGB_Meta_Stride ---->
-	 * <-------- Width ------>
-	 * M M M M M M M M M M M M . .      ^           ^
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      Height      |
-	 * M M M M M M M M M M M M . .      |       Meta_RGB_Scanlines
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      V           |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . .                  V
-	 * <-------- RGB_Stride -------->
-	 * <------- Width ------->
-	 * R R R R R R R R R R R R . . . .  ^           ^
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  Height      |
-	 * R R R R R R R R R R R R . . . .  |       RGB_Scanlines
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  V           |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .    -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . . . .              V
-	 *
-	 * RGB_Stride = align(Width * 4, 128)
-	 * RGB_Scanlines = align(Height, 32)
-	 * RGB_Plane_size = align(RGB_Stride * RGB_Scanlines, 4096)
-	 * RGB_Meta_Stride = align(roundup(Width, RGB_TileWidth), 64)
-	 * RGB_Meta_Scanline = align(roundup(Height, RGB_TileHeight), 16)
-	 * RGB_Meta_Plane_size = align(RGB_Meta_Stride *
-	 *		RGB_Meta_Scanlines, 4096)
-	 * Extradata = 8k
-	 *
-	 * Total size = align(RGB_Meta_Plane_size + RGB_Plane_size +
-	 *		Extradata, 4096)
-	 */
-	COLOR_FMT_RGBA8888_UBWC,
-	/* Venus RGBA1010102 UBWC format:
-	 * Contains 2 planes in the following order -
-	 * (A) Meta plane
-	 * (B) RGBA plane
-	 *
-	 * <--- RGB_Meta_Stride ---->
-	 * <-------- Width ------>
-	 * M M M M M M M M M M M M . .      ^           ^
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      Height      |
-	 * M M M M M M M M M M M M . .      |       Meta_RGB_Scanlines
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      V           |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . .                  V
-	 * <-------- RGB_Stride -------->
-	 * <------- Width ------->
-	 * R R R R R R R R R R R R . . . .  ^           ^
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  Height      |
-	 * R R R R R R R R R R R R . . . .  |       RGB_Scanlines
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  V           |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .    -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . . . .              V
-	 *
-	 * RGB_Stride = align(Width * 4, 256)
-	 * RGB_Scanlines = align(Height, 16)
-	 * RGB_Plane_size = align(RGB_Stride * RGB_Scanlines, 4096)
-	 * RGB_Meta_Stride = align(roundup(Width, RGB_TileWidth), 64)
-	 * RGB_Meta_Scanline = align(roundup(Height, RGB_TileHeight), 16)
-	 * RGB_Meta_Plane_size = align(RGB_Meta_Stride *
-	 *		RGB_Meta_Scanlines, 4096)
-	 * Extradata = 8k
-	 *
-	 * Total size = align(RGB_Meta_Plane_size + RGB_Plane_size +
-	 *		Extradata, 4096)
-	 */
-	COLOR_FMT_RGBA1010102_UBWC,
-	/* Venus RGB565 UBWC format:
-	 * Contains 2 planes in the following order -
-	 * (A) Meta plane
-	 * (B) RGB plane
-	 *
-	 * <--- RGB_Meta_Stride ---->
-	 * <-------- Width ------>
-	 * M M M M M M M M M M M M . .      ^           ^
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      Height      |
-	 * M M M M M M M M M M M M . .      |       Meta_RGB_Scanlines
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      V           |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . .                  V
-	 * <-------- RGB_Stride -------->
-	 * <------- Width ------->
-	 * R R R R R R R R R R R R . . . .  ^           ^
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  Height      |
-	 * R R R R R R R R R R R R . . . .  |       RGB_Scanlines
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  |           |
-	 * R R R R R R R R R R R R . . . .  V           |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .    -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . . . .              V
-	 *
-	 * RGB_Stride = align(Width * 2, 128)
-	 * RGB_Scanlines = align(Height, 16)
-	 * RGB_Plane_size = align(RGB_Stride * RGB_Scanlines, 4096)
-	 * RGB_Meta_Stride = align(roundup(Width, RGB_TileWidth), 64)
-	 * RGB_Meta_Scanline = align(roundup(Height, RGB_TileHeight), 16)
-	 * RGB_Meta_Plane_size = align(RGB_Meta_Stride *
-	 *		RGB_Meta_Scanlines, 4096)
-	 * Extradata = 8k
-	 *
-	 * Total size = align(RGB_Meta_Plane_size + RGB_Plane_size +
-	 *		Extradata, 4096)
-	 */
-	COLOR_FMT_RGB565_UBWC,
-	/* P010 UBWC:
-	 * Compressed Macro-tile format for NV12.
-	 * Contains 4 planes in the following order -
-	 * (A) Y_Meta_Plane
-	 * (B) Y_UBWC_Plane
-	 * (C) UV_Meta_Plane
-	 * (D) UV_UBWC_Plane
-	 *
-	 * Y_Meta_Plane consists of meta information to decode compressed
-	 * tile data in Y_UBWC_Plane.
-	 * Y_UBWC_Plane consists of Y data in compressed macro-tile format.
-	 * UBWC decoder block will use the Y_Meta_Plane data together with
-	 * Y_UBWC_Plane data to produce loss-less uncompressed 10 bit Y samples.
-	 *
-	 * UV_Meta_Plane consists of meta information to decode compressed
-	 * tile data in UV_UBWC_Plane.
-	 * UV_UBWC_Plane consists of UV data in compressed macro-tile format.
-	 * UBWC decoder block will use UV_Meta_Plane data together with
-	 * UV_UBWC_Plane data to produce loss-less uncompressed 10 bit 2x2
-	 * subsampled color difference samples.
-	 *
-	 * Each tile in Y_UBWC_Plane/UV_UBWC_Plane is independently decodable
-	 * and randomly accessible. There is no dependency between tiles.
-	 *
-	 * <----- Y_Meta_Stride ----->
-	 * <-------- Width ------>
-	 * M M M M M M M M M M M M . .      ^           ^
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      Height      |
-	 * M M M M M M M M M M M M . .      |         Meta_Y_Scanlines
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      |           |
-	 * M M M M M M M M M M M M . .      V           |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .                  |
-	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . .                  V
-	 * <--Compressed tile Y Stride--->
-	 * <------- Width ------->
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  Height      |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_Scanlines
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
-	 * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
-	 * . . . . . . . . . . . . . . . .              V
-	 * <----- UV_Meta_Stride ---->
-	 * M M M M M M M M M M M M . .      ^
-	 * M M M M M M M M M M M M . .      |
-	 * M M M M M M M M M M M M . .      |
-	 * M M M M M M M M M M M M . .      M_UV_Scanlines
-	 * . . . . . . . . . . . . . .      |
-	 * . . . . . . . . . . . . . .      V
-	 * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
-	 * <--Compressed tile UV Stride--->
-	 * U* V* U* V* U* V* U* V* . . . .  ^
-	 * U* V* U* V* U* V* U* V* . . . .  |
-	 * U* V* U* V* U* V* U* V* . . . .  |
-	 * U* V* U* V* U* V* U* V* . . . .  UV_Scanlines
-	 * . . . . . . . . . . . . . . . .  |
-	 * . . . . . . . . . . . . . . . .  V
-	 * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
-	 *
-	 *
-	 * Y_Stride = align(Width * 2, 256)
-	 * UV_Stride = align(Width * 2, 256)
-	 * Y_Scanlines = align(Height, 16)
-	 * UV_Scanlines = align(Height/2, 16)
-	 * Y_UBWC_Plane_Size = align(Y_Stride * Y_Scanlines, 4096)
-	 * UV_UBWC_Plane_Size = align(UV_Stride * UV_Scanlines, 4096)
-	 * Y_Meta_Stride = align(roundup(Width, Y_TileWidth), 64)
-	 * Y_Meta_Scanlines = align(roundup(Height, Y_TileHeight), 16)
-	 * Y_Meta_Plane_size = align(Y_Meta_Stride * Y_Meta_Scanlines, 4096)
-	 * UV_Meta_Stride = align(roundup(Width, UV_TileWidth), 64)
-	 * UV_Meta_Scanlines = align(roundup(Height, UV_TileHeight), 16)
-	 * UV_Meta_Plane_size = align(UV_Meta_Stride * UV_Meta_Scanlines, 4096)
-	 * Extradata = 8k
-	 *
-	 * Total size = align(Y_UBWC_Plane_size + UV_UBWC_Plane_size +
-	 *           Y_Meta_Plane_size + UV_Meta_Plane_size
-	 *           + max(Extradata, Y_Stride * 48), 4096)
-	 */
-	COLOR_FMT_P010_UBWC,
-	/* Venus P010:
-	 * YUV 4:2:0 image with a plane of 10 bit Y samples followed
-	 * by an interleaved U/V plane containing 10 bit 2x2 subsampled
-	 * colour difference samples.
-	 *
-	 * <-------- Y/UV_Stride -------->
-	 * <------- Width ------->
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          Y_Scanlines
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
-	 * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              |
-	 * . . . . . . . . . . . . . . . .              V
-	 * U V U V U V U V U V U V . . . .  ^
-	 * U V U V U V U V U V U V . . . .  |
-	 * U V U V U V U V U V U V . . . .  |
-	 * U V U V U V U V U V U V . . . .  UV_Scanlines
-	 * . . . . . . . . . . . . . . . .  |
-	 * . . . . . . . . . . . . . . . .  V
-	 * . . . . . . . . . . . . . . . .  --> Buffer size alignment
-	 *
-	 * Y_Stride : Width * 2 aligned to 128
-	 * UV_Stride : Width * 2 aligned to 128
-	 * Y_Scanlines: Height aligned to 32
-	 * UV_Scanlines: Height/2 aligned to 16
-	 * Extradata: Arbitrary (software-imposed) padding
-	 * Total size = align((Y_Stride * Y_Scanlines
-	 *          + UV_Stride * UV_Scanlines
-	 *          + max(Extradata, Y_Stride * 8), 4096)
-	 */
-	COLOR_FMT_P010,
-};
-
-#define COLOR_FMT_RGBA1010102_UBWC	COLOR_FMT_RGBA1010102_UBWC
-#define COLOR_FMT_RGB565_UBWC		COLOR_FMT_RGB565_UBWC
-#define COLOR_FMT_P010_UBWC		COLOR_FMT_P010_UBWC
-#define COLOR_FMT_P010		COLOR_FMT_P010
-
-/*
- * Function arguments:
- * @color_fmt
- * @width
- * Progressive: width
- * Interlaced: width
- */
-static unsigned int VENUS_Y_STRIDE(int color_fmt, int width)
-{
-	unsigned int stride = 0;
-
-	if (!width)
-		return 0;
-
-	switch (color_fmt) {
-	case COLOR_FMT_NV21:
-	case COLOR_FMT_NV12:
-	case COLOR_FMT_NV12_MVTB:
-	case COLOR_FMT_NV12_UBWC:
-		stride = MSM_MEDIA_ALIGN(width, 128);
-		break;
-	case COLOR_FMT_NV12_BPP10_UBWC:
-		stride = MSM_MEDIA_ALIGN(width, 192);
-		stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
-		break;
-	case COLOR_FMT_P010_UBWC:
-		stride = MSM_MEDIA_ALIGN(width * 2, 256);
-		break;
-	case COLOR_FMT_P010:
-		stride = MSM_MEDIA_ALIGN(width * 2, 128);
-		break;
-	}
-
-	return stride;
-}
-
-/*
- * Function arguments:
- * @color_fmt
- * @width
- * Progressive: width
- * Interlaced: width
- */
-static unsigned int VENUS_UV_STRIDE(int color_fmt, int width)
-{
-	unsigned int stride = 0;
-
-	if (!width)
-		return 0;
-
-	switch (color_fmt) {
-	case COLOR_FMT_NV21:
-	case COLOR_FMT_NV12:
-	case COLOR_FMT_NV12_MVTB:
-	case COLOR_FMT_NV12_UBWC:
-		stride = MSM_MEDIA_ALIGN(width, 128);
-		break;
-	case COLOR_FMT_NV12_BPP10_UBWC:
-		stride = MSM_MEDIA_ALIGN(width, 192);
-		stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
-		break;
-	case COLOR_FMT_P010_UBWC:
-		stride = MSM_MEDIA_ALIGN(width * 2, 256);
-		break;
-	case COLOR_FMT_P010:
-		stride = MSM_MEDIA_ALIGN(width * 2, 128);
-		break;
-	}
-
-	return stride;
-}
-
-/*
- * Function arguments:
- * @color_fmt
- * @height
- * Progressive: height
- * Interlaced: (height+1)>>1
- */
-static unsigned int VENUS_Y_SCANLINES(int color_fmt, int height)
-{
-	unsigned int sclines = 0;
-
-	if (!height)
-		return 0;
-
-	switch (color_fmt) {
-	case COLOR_FMT_NV21:
-	case COLOR_FMT_NV12:
-	case COLOR_FMT_NV12_MVTB:
-	case COLOR_FMT_NV12_UBWC:
-	case COLOR_FMT_P010:
-		sclines = MSM_MEDIA_ALIGN(height, 32);
-		break;
-	case COLOR_FMT_NV12_BPP10_UBWC:
-	case COLOR_FMT_P010_UBWC:
-		sclines = MSM_MEDIA_ALIGN(height, 16);
-		break;
-	}
-
-	return sclines;
-}
-
-/*
- * Function arguments:
- * @color_fmt
- * @height
- * Progressive: height
- * Interlaced: (height+1)>>1
- */
-static unsigned int VENUS_UV_SCANLINES(int color_fmt, int height)
-{
-	unsigned int sclines = 0;
-
-	if (!height)
-		return 0;
-
-	switch (color_fmt) {
-	case COLOR_FMT_NV21:
-	case COLOR_FMT_NV12:
-	case COLOR_FMT_NV12_MVTB:
-	case COLOR_FMT_NV12_BPP10_UBWC:
-	case COLOR_FMT_P010_UBWC:
-	case COLOR_FMT_P010:
-		sclines = MSM_MEDIA_ALIGN((height + 1) >> 1, 16);
-		break;
-	case COLOR_FMT_NV12_UBWC:
-		sclines = MSM_MEDIA_ALIGN((height + 1) >> 1, 32);
-		break;
-	}
-
-	return sclines;
-}
-
-/*
- * Function arguments:
- * @color_fmt
- * @width
- * Progressive: width
- * Interlaced: width
- */
-static unsigned int VENUS_Y_META_STRIDE(int color_fmt, int width)
-{
-	int y_tile_width = 0, y_meta_stride;
-
-	if (!width)
-		return 0;
-
-	switch (color_fmt) {
-	case COLOR_FMT_NV12_UBWC:
-	case COLOR_FMT_P010_UBWC:
-		y_tile_width = 32;
-		break;
-	case COLOR_FMT_NV12_BPP10_UBWC:
-		y_tile_width = 48;
-		break;
-	default:
-		return 0;
-	}
-
-	y_meta_stride = MSM_MEDIA_ROUNDUP(width, y_tile_width);
-	return MSM_MEDIA_ALIGN(y_meta_stride, 64);
-}
-
-/*
- * Function arguments:
- * @color_fmt
- * @height
- * Progressive: height
- * Interlaced: (height+1)>>1
- */
-static unsigned int VENUS_Y_META_SCANLINES(int color_fmt, int height)
-{
-	int y_tile_height = 0, y_meta_scanlines;
-
-	if (!height)
-		return 0;
-
-	switch (color_fmt) {
-	case COLOR_FMT_NV12_UBWC:
-		y_tile_height = 8;
-		break;
-	case COLOR_FMT_NV12_BPP10_UBWC:
-	case COLOR_FMT_P010_UBWC:
-		y_tile_height = 4;
-		break;
-	default:
-		return 0;
-	}
-
-	y_meta_scanlines = MSM_MEDIA_ROUNDUP(height, y_tile_height);
-	return MSM_MEDIA_ALIGN(y_meta_scanlines, 16);
-}
-
-/*
- * Function arguments:
- * @color_fmt
- * @width
- * Progressive: width
- * Interlaced: width
- */
-static unsigned int VENUS_UV_META_STRIDE(int color_fmt, int width)
-{
-	int uv_tile_width = 0, uv_meta_stride;
-
-	if (!width)
-		return 0;
-
-	switch (color_fmt) {
-	case COLOR_FMT_NV12_UBWC:
-	case COLOR_FMT_P010_UBWC:
-		uv_tile_width = 16;
-		break;
-	case COLOR_FMT_NV12_BPP10_UBWC:
-		uv_tile_width = 24;
-		break;
-	default:
-		return 0;
-	}
-
-	uv_meta_stride = MSM_MEDIA_ROUNDUP((width+1)>>1, uv_tile_width);
-	return MSM_MEDIA_ALIGN(uv_meta_stride, 64);
-}
-
-/*
- * Function arguments:
- * @color_fmt
- * @height
- * Progressive: height
- * Interlaced: (height+1)>>1
- */
-static unsigned int VENUS_UV_META_SCANLINES(int color_fmt, int height)
-{
-	int uv_tile_height = 0, uv_meta_scanlines;
-
-	if (!height)
-		return 0;
-
-	switch (color_fmt) {
-	case COLOR_FMT_NV12_UBWC:
-		uv_tile_height = 8;
-		break;
-	case COLOR_FMT_NV12_BPP10_UBWC:
-	case COLOR_FMT_P010_UBWC:
-		uv_tile_height = 4;
-		break;
-	default:
-		return 0;
-	}
-
-	uv_meta_scanlines = MSM_MEDIA_ROUNDUP((height+1)>>1, uv_tile_height);
-	return MSM_MEDIA_ALIGN(uv_meta_scanlines, 16);
-}
-
-static unsigned int VENUS_RGB_STRIDE(int color_fmt, int width)
-{
-	unsigned int alignment = 0, bpp = 4;
-
-	if (!width)
-		return 0;
-
-	switch (color_fmt) {
-	case COLOR_FMT_RGBA8888:
-		alignment = 128;
-		break;
-	case COLOR_FMT_RGB565_UBWC:
-		alignment = 256;
-		bpp = 2;
-		break;
-	case COLOR_FMT_RGBA8888_UBWC:
-	case COLOR_FMT_RGBA1010102_UBWC:
-		alignment = 256;
-		break;
-	default:
-		return 0;
-	}
-
-	return MSM_MEDIA_ALIGN(width * bpp, alignment);
-}
-
-static unsigned int VENUS_RGB_SCANLINES(int color_fmt, int height)
-{
-	unsigned int alignment = 0;
-
-	if (!height)
-		return 0;
-
-	switch (color_fmt) {
-	case COLOR_FMT_RGBA8888:
-		alignment = 32;
-		break;
-	case COLOR_FMT_RGBA8888_UBWC:
-	case COLOR_FMT_RGBA1010102_UBWC:
-	case COLOR_FMT_RGB565_UBWC:
-		alignment = 16;
-		break;
-	default:
-		return 0;
-	}
-
-	return MSM_MEDIA_ALIGN(height, alignment);
-}
-
-static unsigned int VENUS_RGB_META_STRIDE(int color_fmt, int width)
-{
-	int rgb_meta_stride;
-
-	if (!width)
-		return 0;
-
-	switch (color_fmt) {
-	case COLOR_FMT_RGBA8888_UBWC:
-	case COLOR_FMT_RGBA1010102_UBWC:
-	case COLOR_FMT_RGB565_UBWC:
-		rgb_meta_stride = MSM_MEDIA_ROUNDUP(width, 16);
-		return MSM_MEDIA_ALIGN(rgb_meta_stride, 64);
-	}
-
-	return 0;
-}
-
-static unsigned int VENUS_RGB_META_SCANLINES(int color_fmt, int height)
-{
-	int rgb_meta_scanlines;
-
-	if (!height)
-		return 0;
-
-	switch (color_fmt) {
-	case COLOR_FMT_RGBA8888_UBWC:
-	case COLOR_FMT_RGBA1010102_UBWC:
-	case COLOR_FMT_RGB565_UBWC:
-		rgb_meta_scanlines = MSM_MEDIA_ROUNDUP(height, 4);
-		return MSM_MEDIA_ALIGN(rgb_meta_scanlines, 16);
-	}
-
-	return 0;
-}
-
-#endif

-- 
2.47.2

