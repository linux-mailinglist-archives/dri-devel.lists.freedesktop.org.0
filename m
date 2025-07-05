Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6793AAF9DD5
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 04:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B926710E377;
	Sat,  5 Jul 2025 02:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GOjKpc9X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5907410E373
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:55 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5650X1QN007414
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mPdweLA7FPyIkpCFNmnXxeGAqvTbA1f8vu74lAadJhc=; b=GOjKpc9XbAoA05dc
 iGAtmtglDHZws2xHp8nnS5OgkZON7+LmXXX5Taat56JW++dIF/WP9zTbw4LHd/Y8
 bpF2o0JYw1xUuaZai9t5fDQP2xBHgEWFWSvumb48hghTEIHbiSHaGU4o2sVvNBPZ
 /GqpKneIcHrybSPSf1GfMSXuu5oc86pyJSS+eYzAyTG0n0fu7h6nvumzLFOshYcg
 FwRcUjTJLcKLjwn3ABNdefiwddQepipCOffndeS/BuGsdN7J5VJdTekMtKialmAB
 HDNXWlKCplU51wf9Qpl36VnRYqNGYta9GLlgJmkJQBrPF278UrPtGengD73I0oaI
 jXy93A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdq84k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d413a10b4cso213395085a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683673; x=1752288473;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mPdweLA7FPyIkpCFNmnXxeGAqvTbA1f8vu74lAadJhc=;
 b=GJYnbX52hVHAE03Sl8sh9bpHJr8LSSnSgWPlRMDSLthzT5fHnzENpSbYntbXw/HFOH
 wJod4CR1Smmkujurkk+mUn9rHWUMcNFVcg+ER00SWPKf0ZVbcomcNB1P5bg9ce1j1Qw+
 emfdpeL7X2rWl4Pnehh6r3GwyC18CEAQwNS9hH1ucy9x0zpRlyrip6O5KXuPruuSJzBM
 bpVnExzcWOh0rqKCJsRJRQTy5VkH28oOIXVV1S+tWwkpkmEH/8vV9Znb+DXhKNnCj486
 1N+t2A+t1PDZSexYmwLwOePOtlXpGzVmWAK+fv+QXgpwQ5pAK/1Nyb/FVORk81jcLtcX
 +9/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIROfl2uv7igVZwRZn+DETksHn76wKC38jXEYLyLEIhE/jxlFximFxV0/z+hjiwkUHPKJ8BZ3ieh4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKAGcKU+dabW4Jp4mbS5uju+8ucVGmPIJiv+BktstfKfvil+Zt
 eVgfvEx+vhnx9/XQOaDBlnDTlnkbckMOam2UrvmBoFQ9iyOAeTn1D7bcsvaLGu8Cu3068/CczW/
 EdQ4ywV1i/h/ELLhXR7tuWgQlAdy9TkH2USLsi+UJLb/0mflUX5TqXFUScwskP+krsoJcZgC0PX
 kAb3SaUQ==
X-Gm-Gg: ASbGncsf5R/lA6h8ZmGNwinFLUW0SiDnSMaNDS0IbaXoGD3O+/2M4Luj7lW/c6X+MYe
 tOrcegqHVxhK3coFejMkwrPufjNKFgbzAuygBf8kEXi9PfnsgUsEMYn7t8Mv0dyCGV/Pg/v1oIZ
 WKPrMBuVje+RLqfrNOmesBqUcrPy7CUscbvsMzwQ8P6kDxIDruDG3ZYvqoLaM6EUPc0pIvvPY4s
 +YorpGZzQiG9mtCzwf4tu01MB0JDdzhInwcFWkNZF8/cHnVzCRlx8rT2n56GOtputuwkKsUJhQa
 BGGMlD866yUB2tTKtqYU5AtqGBTSjXT+ePFNPz5sQtKg2felHeoG2BcnN6e3X/6M4KUW7pqvgNG
 Oh2qgoBRPXFb/NCavdtvd3RQFPt6OuICmYOQ=
X-Received: by 2002:a05:620a:6011:b0:7d3:8a6b:d24d with SMTP id
 af79cd13be357-7d5f14eddd3mr140644485a.24.1751683672493; 
 Fri, 04 Jul 2025 19:47:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAuHixLkZ/p64/O+elwmVTQv75n56fJXaXRZNt4RzYjco6O+60LkaZ11hq06oOa0xGb248RQ==
X-Received: by 2002:a05:620a:6011:b0:7d3:8a6b:d24d with SMTP id
 af79cd13be357-7d5f14eddd3mr140640285a.24.1751683671425; 
 Fri, 04 Jul 2025 19:47:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:32 +0300
Subject: [PATCH 11/12] drm/msm/dpu: rewrite
 _dpu_format_populate_plane_sizes_ubwc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-11-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=52506;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=coMBzmxV3g8KpJCZvcMn12gkE2xPWYbuyDvVXG/7x50=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI+NS6md8HE09RhPruq8LjWc7F0DvcFYhaz+
 4w+MoBjouKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPgAKCRCLPIo+Aiko
 1X4ZB/9QxfVW4mqKLzhg7iWNgtKM4F00lpVk8wKvP0XfeHN02+9NBU6Vvni/GExBvYVwDrmJBCE
 vDdLqg//30kLEe+AYaoqHXvUVTlhk71NrehW/PGKnoIjqj1yHkDjaOB0Jt3oyYyDJBvBYRI3CTp
 jGInIwBcolwZrcn+evMOWIvpAxQeVzlsonCTewow+1N8obA7bcJxZ04Luwd/L6w6V8QPkPQFnyD
 uern5WUR0CXK/6e1MEhLo9Ni4h8gWeqUDpyfNrUDwTZVQnYbgDZ4xhayZ334re8JYDY+2C5gtkK
 tNMojWkFmPYsrI+tQ65pFs/GFrUb9ru7Yn62M3MfrS6czh50
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=6868925a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=6iusXPdm3c8emWAo3PYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: EjyVEmlrEfJGOJijz_aB0adC26eYMYPr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX031Ys25febL0
 eXtrLxUgd6Y/VpqSWb2qzEjeup6uKKcJGxunkFZ/fzCPA5bw9QgVdri+8z6ZUlDYbRXPVkmUthm
 qYDZbQujcCqyAwAEU+MdlUNjRGzcpgy/QkbaHWPjbHaW+1d7mj0LMfb5idvILxObBc91QcXCGJ0
 cloRYj0Y/AB+W8UTkL2Fdnr8p0EpA/DrkrEt66e6UIBvkDMPDw8X4Him/6hUMnBKcCwV27QbJ66
 SFkpeRl+K6JU18aKS/jI44Zq625E5whepKzKkKL2N/VG7W1vtMV+4HnWF8xv4mlGV0pEyWlsfLQ
 utvsfFZiYcTPnCYvx02Don9hpoFaN39Qc/XmcI4B/yOZ+sB0/PPEH29AC6d00BNxbT3ShGlUvJi
 9ZzhS/XohTGmuMLnAbzwDoKnOqA5zyTYSh7s43IUPJEMLB/dGVVv+wQBWzbGTIFSp3bTTweO
X-Proofpoint-GUID: EjyVEmlrEfJGOJijz_aB0adC26eYMYPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=829 mlxscore=0 bulkscore=0 priorityscore=1501
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

Drop extra wrapping layer (msm_media_info.h) and inline all VENUS_*()
functions, simplifying the code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    |  124 ++-
 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h | 1155 ------------------------
 2 files changed, 60 insertions(+), 1219 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index e1fb7fd3b0b97a38880bc80aec26003d65a3a310..67bc5a6eeb43dcf113dea9eccdb778cd52b1ad40 100644
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
@@ -54,90 +63,73 @@ static void _dpu_get_v_h_subsample_rate(
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
+		if (fmt->pixel_format == DRM_FORMAT_NV12 ||
+		    fmt->pixel_format == DRM_FORMAT_P010) {
+			if (MSM_FORMAT_IS_DX(fmt)) {
+				if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
+					stride = MSM_MEDIA_ALIGN(fb->width, 192);
+					stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
+					y_tile_width = 48;
+				} else {
+					stride = MSM_MEDIA_ALIGN(fb->width * 2, 256);
+					y_tile_width = 32;
+				}
+
+				sclines = MSM_MEDIA_ALIGN(fb->height, 16);
+				y_tile_height = 4;
+			} else {
+				stride = MSM_MEDIA_ALIGN(fb->width, 128);
+				y_tile_width = 32;
+
+				sclines = MSM_MEDIA_ALIGN(fb->height, 32);
+				y_tile_height = 8;
+			}
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
 
@@ -147,8 +139,12 @@ static int _dpu_format_populate_plane_sizes_ubwc(
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
2.39.5

