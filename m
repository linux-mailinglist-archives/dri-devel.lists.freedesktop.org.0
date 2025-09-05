Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B2B44ADE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 02:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC42A10E290;
	Fri,  5 Sep 2025 00:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmoBVaOW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A41510E290
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 00:39:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IK1SV023218
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 00:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ra9GluSXfhMlHZ2ACIpc5GR7mvUKtMwIaWiKkZbOwVY=; b=CmoBVaOWsvaUWwyX
 Ur0wrPYC4AipxzjvoRExW9VbSJbovPTvzHSiLANjH9GfjItEI7AMThPxYCQXYAVy
 fO4OeGNM256nexMaYz5FwBgkT9eMGfY43rBLXI8Bky4gE7SqTlstmsDfR0Czj4EO
 Yr9Ea/RoEnFZQwFf4emVkwioo7G28a7E9UuoPE32+gaHD/Rka4Gx5S/8wTQEm07Y
 W09GeMAteG5p1ekvPmh47z5xiA5m2Jr3kKeJP6tWqpWVXed8F657ZPOpvsoAKNL7
 tfrSul9fTu3NIsI58o9N3gI5D5usDNuYjduGLOjQMsjrkTOkE/+2l9uEUX75HgHX
 lhchtA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0esedk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:39:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5d58d226cso32841671cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 17:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032751; x=1757637551;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ra9GluSXfhMlHZ2ACIpc5GR7mvUKtMwIaWiKkZbOwVY=;
 b=vlrETMoTqzPIQBWcpv7eI3Dolt4vd4C0ED/h0fk0X4LJuWKH7+ukEw9XqwZlucuzoA
 7FSMsKou2Yqt422+RhJMKsFBE6pu6MI6SlxlQoPacNXcXlzJvrHKAaI+hA2EtV5hXcra
 JYu6Hk0oPNVBWwnQVmJbhG5J7gOHx008Q214qnTxXP9YGJkvD3ocfpU5iwtrA5FY2zCe
 xox7OqkTCiovWmEedrHFzqj/9A7Ap3pvholb2Vt462ndvSF36ctNKS3lCWrhSpM0FX2X
 dto62YE54gmePQrEA09J8UzETsXLg6Uvx6OQqDod+LSnt+PXqIlptJKWGJJM5Cyo+dKI
 d3eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD45d10MYfhIQStCaHIp9g2sKAXbqadqgM+tc5aPDp8Ev3LAqoQPhTuKHAX6AflZnAN43vNDrPLhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+dZCskQJ2vDuBMwMF7OL11UbjGVRYD7DD+o3nIFljjXS+Ux11
 YFkQHx3exRhrgkUM89U7cO341ykrZt4O+ZgR+36CB/zdMfJN/n48CV+dugQoIYv56WlspM3/g4T
 +nJugalitKm8YYUC3jrttX5+oVPvlDY2LIvT6Uj/cFu8GD8vLDl/HhbXFPNhc0BW3pgslS2cgt4
 jkzCw=
X-Gm-Gg: ASbGnctE2o43UlxLJc+YKDKOVHpTSJ6BsQC68OR+BOSnykyHxfUxfNJJlFMlrjghMwQ
 S/xlSmeCN7FJ0XQCNYayzwq2eCkWiNjtgutel4CCSyg24MxCHnLL+ja99XSbPvwQI9493DTJW8V
 bboWkjmDT6XN1LZutJXWqvko9RkPt/gptvg3d7Baa7Q895CLD4N+KDSINoGmd0LmB+uTgN1/uXK
 23E6CdsDkeYtOXI9Miq2hEo6wElD1VWL+f61xyxMmq7SdWdq/7SmmC+Paeb1X+lzViUP8z1k0yX
 kJ89XknZZIMRhqKS6Tno/85fjf2UHrnm0KCQEKSeqwVSavTyrLm8M28habNLoBimdOFFBOWqG8C
 6DH8aZHehvwp5+HNWpjdzGwajbFDWNqgrIeBkVKwg0ebdjAPm01nN
X-Received: by 2002:a05:622a:4207:b0:4af:1535:6b53 with SMTP id
 d75a77b69052e-4b31da3b2a0mr222825981cf.54.1757032751051; 
 Thu, 04 Sep 2025 17:39:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS3wnGT8ACgxrTqpQD8+qzTZ6t5n5H43QqgEg9VQB/rUpomSgmUzUzHoGTcB143SkCSuf93g==
X-Received: by 2002:a05:622a:4207:b0:4af:1535:6b53 with SMTP id
 d75a77b69052e-4b31da3b2a0mr222825811cf.54.1757032750618; 
 Thu, 04 Sep 2025 17:39:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:39:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:41 +0300
Subject: [PATCH v2 12/12] drm/msm/dpu: use standard functions in
 _dpu_format_populate_plane_sizes_ubwc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-12-7a674028c048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5431;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lGlOq21wJXxPf5qd4HfAzqrvugD2QrjsunL1xmnHE9s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEKK92PZaXMEwacZH5/xSig59AgXXb3CmkPc
 fjelgfuBvKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCgAKCRCLPIo+Aiko
 1TJbB/4r1O0t6fCeOk0Vjk5icw3t2tBKMN1g91Yubw5n3bIrgtCaaAj4eaBV0LGNLTrZQusxc2K
 Hw4mgODdktXjaQGdz3iQhL0wJyVXyQ19phnBcb6Y19aHwqZiiwqZ6JjfY6wgtBTZUYTgR9VzrL4
 TOkX8fsQmUcnphqOBgw7Hxn8/Sf7bBt6XRCQom6nKnZL+T9CMPCgl6cw7wVQy24Cbkwl8HArcL9
 vStylSVaxxlS+ykE/3IIxofD1eC262/fLFak/ohr8oKogkQ8P5GQsRetJ1lx9I8PIdFfc9BcQOj
 zhu4MFrmQ7SLnRgwqs10szN6IRd66kqr5s+ES0wJ4yW8eRSE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: aqaPJE5fmLmDP91Db8LRLwBTDCUyUgAB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX1JqgnIGmBj0u
 k8UnjYsn8kkTRPu19o8oMNgVTfVsu+XUmdfwcF583UsOSgeobaCIskyNYYyfe8CQtLah7T271Pi
 SAjjQEpMoNGOEisKHjufWUkc7LbUY3cVr90PS30MVn/TugJ25glOCbUg2LQuZyoHgNkFMYNjH/q
 0kbd5MqWWWS6O3VVm1qkRK1L963Q8MQzTxhiz4FUfGV+Z944zPi5wU0wABSYNaPnanB1hPyl2XM
 n1th+L4tt/7UB1u4tc9s8YqW9+X6DOLj3V1KMpxoHnRQahduS18cfkMfTVWZQ/b5GZ4SIkFkmRr
 mcd79iIoFTbTn4LdAMfYpnJ6mVvZqmGu0YArsU3tqnyJalHjVXiMhNRyEYHepfBG8axwqYBft53
 YF9nkIdn
X-Proofpoint-ORIG-GUID: aqaPJE5fmLmDP91Db8LRLwBTDCUyUgAB
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68ba3130 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7bqH7Blup1pqkekdm3wA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 63 +++++++++++++----------------
 1 file changed, 27 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index da1870ce7680899759d09caa01050eeb9844a484..6e8883dbfad439a3b3f07b6fe9337820048fc2eb 100644
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
@@ -78,56 +68,57 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 
 		if (MSM_FORMAT_IS_DX(fmt)) {
 			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
-				stride = MSM_MEDIA_ALIGN(fb->width, 192);
-				stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
+				/* can't use round_up() here because 192 is NPoT */
+				stride = roundup(fb->width, 192);
+				stride = round_up(stride * 4 / 3, 256);
 				y_tile_width = 48;
 			} else {
-				stride = MSM_MEDIA_ALIGN(fb->width * 2, 256);
+				stride = round_up(fb->width * 2, 256);
 				y_tile_width = 32;
 			}
 
-			sclines = MSM_MEDIA_ALIGN(fb->height, 16);
+			sclines = round_up(fb->height, 16);
 			y_tile_height = 4;
 		} else {
-			stride = MSM_MEDIA_ALIGN(fb->width, 128);
+			stride = round_up(fb->width, 128);
 			y_tile_width = 32;
 
-			sclines = MSM_MEDIA_ALIGN(fb->height, 32);
+			sclines = round_up(fb->height, 32);
 			y_tile_height = 8;
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
@@ -136,13 +127,13 @@ static int _dpu_format_populate_plane_sizes_ubwc(
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
2.47.2

