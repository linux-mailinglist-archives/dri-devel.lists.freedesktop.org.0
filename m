Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA06C5B318
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A6710E99B;
	Fri, 14 Nov 2025 03:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dd5mfHhy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9rGgN00";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD5D10E99C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:47 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMakAD1745319
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /bmhjb/GhYsi42ZR7QhHyhURJHQgsv7dPKrN0P2OVwQ=; b=Dd5mfHhy0ZM1qTmf
 1AtsB4rXBPQPTJyv4DNsfScYXfhgdFM/0cXB/drGyKslQ2etSYHw3kSAvsDapsBZ
 Mh+eg4A1AQTcqOUy2eCwKIf6EW4X2wuHX+6FLgTsLBpjq/mg/Pb7MeXD9h4nEK10
 pjYJq9jnFZV4zP8DocR/Y4cdkNeBrCEsdzpOWgq0rgk2TVedAFOb7rL2nL6uespD
 Z39bmU6r4oGMQLMc/JCAAnXZmC03G5ckoc0Nk6MtcD+oM+5wyQccvYNqtu95WxIC
 3CDrAtrwSHcTdmtUCrqgy+ppwz4uK69pYeeP3osMMKingwKjQsrWfkcg7dn1AG7s
 MHbm3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9egqdg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b259f0da04so423831385a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091825; x=1763696625;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/bmhjb/GhYsi42ZR7QhHyhURJHQgsv7dPKrN0P2OVwQ=;
 b=i9rGgN00NKxW7n3dPR3cHZq8aN+KuI7+FGgj80UEd5Vft+dXA8fzRsVR5QM6fxTeMP
 CT3UsuRYI1LLqQvTMG3882rjHORSSQNFt/6Acop94Jx+PTAqUkxGVjxI8YSqO1o+sdjm
 41w5QTUIr1/J+3reIPJRymc7axTilzGvOAVI2uqJP2j1EjKgwTADCR7p6kC+HQIgYp1X
 425RSlTRrXnj8itfvyTq1w/XVK5ANKclZLkAWzNqdafAABih1xNAEMzvWk+TlF2cwGfd
 ZbvzO9yPvymwaxv8GeRbAm7xWsF/iQOn9CpICue4Ie4DEfEuMVrmsMPa50RqkTCTPlio
 0G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091826; x=1763696626;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/bmhjb/GhYsi42ZR7QhHyhURJHQgsv7dPKrN0P2OVwQ=;
 b=o8XqomgiWb/swRXZDVLFQuBn8f9G819f/S1IZCEihMf+cTQTc8b9271T2YI5ij9VHR
 ghoR3OuE9JM4/1nm8nWl/l3WU0HHghViTbcw2tgTYXtMHBFbqLFGxKbFC9OUnG4l4Bp2
 XL6+UGo5JwdY3KrkHFkR6Ky5AYFpFRa13LpF4Xkp+DzfmmocaPZycXARtXHA/jj3r49g
 smzEVAxn9OQwvHLF86DPZxliID6uKlkK5fPF9udXPWLJlYuVvZjMZaAkuB0v5/vUlBtu
 XYSKjv67Ow3+StJxlrf70+gpv7ygwnnLWzzBl15YRApdpLEPuPaM5xDQcaH0TDDoYAoL
 3FvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX86dGwyIZPGogfzJ1idB2AsNXHSqP7yRDbpmGzrGluEyfMfNO6qp+OHVHFBPjiP4iuc1Y45S0DXwI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH604eAgZys2jaJ+5BQccRgrEZsgUryXIwzlkKHbybZenSBiJT
 XMCUuu2YFLyi8TYZJOF/NxTtyfUkfQe/BEJ3j3xDushlRxhq6zpJWzA2xHsk50iyPUNR0GXyoYI
 Ov4tGpbfpQwIcgbw6iFB2RyQMae27MAzTDPjqvp6r1OcYfShD0wu4Ag2/GPo3gO0mcGX59ps=
X-Gm-Gg: ASbGncuLQj3G5mE/r71Y67L+QlNQ1CpVQuYYONqHulcRbA6mVhdiEZJa44Yx+CT7zdy
 qPFfcK+NSoA2bHALkrwmno16lWdBMaoRzO4tKXc6LVaK4UZhdJBNflYeOGqNDQR7iGclkK3nMH6
 ZPdxWcG9YWARjtBw4tr9EOn1gk6CmRMo5gD8Gcqtr9hT+T+mbbDsB5l8ZoVrY1ioaYpMq4jBH7c
 DBZz//6tZFE8a7NmhY9u8dw9Hu6QoIPpETO/Bydrpm7dqFhOMlWBweqh6DAd/J3hTLnlfdBBN+K
 OpI/3X9YO5es9kLa147lTQ8NjO9QNdnFJQm3d9RFf0sw4XtDXFKLkGB+aaIWE/ki88yjB73VWnz
 49CVSLExOLTh3p56fPdJJZqOdYnWxOvoD6UfngN1qMBWQufF7eXk+xb3TUuwwHxG145ZQrO+kFV
 QVl0k92IBGs8PD
X-Received: by 2002:a05:620a:29c4:b0:8b2:989b:efe6 with SMTP id
 af79cd13be357-8b2c314cdd9mr214770485a.26.1763091825283; 
 Thu, 13 Nov 2025 19:43:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0/htnlz/KvNkhh7Iysx8djak+gNIkid7WKCGuXBIKm6w4oGSsAtdmvE3I7QCZqpdvhdNRiw==
X-Received: by 2002:a05:620a:29c4:b0:8b2:989b:efe6 with SMTP id
 af79cd13be357-8b2c314cdd9mr214767385a.26.1763091824582; 
 Thu, 13 Nov 2025 19:43:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:43:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:30 +0200
Subject: [PATCH v3 03/12] drm/msm/disp: set num_planes, fetch_mode and
 tile_height in INTERLEAVED_RGB_FMT_TILED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-3-cae312379d49@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5031;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HynRqSf875K7IJaHCWEeqW7sxbTtE2rMwkup4t2jGsQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVl1SXhlWy/g5d4hKALxO9kRBY3D6TrQAf6Q
 Ax3YV85+B2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZQAKCRCLPIo+Aiko
 1QSqCACdhWaCv8eF2ZQ+rnGxtFbD4MnZiVrHEV/JqZbO26aNojPN1sjFuzYV2lu2nSbN3iWAqvM
 1r/fdO3QUvX6oKXzZ+mnvg2uoRY78iwMQv3b9JEXCdKYj5s4lnLEEzn1UQnT9doDfOI+IQItuyC
 DH2lw1zgNmL1rruAXvQEGnl2NvycLaprv1PUmkhqbfrZAz82IiJTiZeN7kmBT/3zZ1WNXFysCTm
 IbizXin8a7xJFex/e6RWuegeNdR1TpH70pLMv8OvuGjtPxmamBS6FObqV4OccPTc6UmqS6B06c7
 qCdB11B+FB+7rBwbyxbFdixQ4t3z4H2SEfNXKoETRgN47f4a
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX9vRxU14RZ9Ag
 BY0kSLCmIfo8YX4WcEtk9PlhMHDF8DdnRnv6ZTet4mrKZq7VD7TvCCFH9Ko8I2eDRapKIskENTx
 jbGfCauB9tWMlwQPYfnt5zt+q1arVaYRBteaJXobC31BCNUAGdnSI9mzAuj3Jb4LakUzCzvuweO
 zbQGWT6O1boN1T3OpwUlNhfD+Atmq2z1MnbUqYGkciquoRpbZmhRPmNM2ikk9ts/mwMQiHOpbK8
 YV0cNw/QWHTVylbcFvU6ExYN+dQblIozxNJRojFHa7FJc8UtJCXsQrbfJsC5iKoQl62PoiRarU+
 sntszs7k6yY9qq7DXgyTHCM01LAyFGJX/U5nMQE6uIFZqDsDIa0wpdA0ugqMDaKYX3iOPmif7qP
 uXFtPtmeko91rmU4rh1tc+vSAngDTA==
X-Proofpoint-ORIG-GUID: wwUljZdohxqKI9a3A4fFKfVY-4P4mnDP
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=6916a572 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dmvhxJvSUNPaeTh-JWgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: wwUljZdohxqKI9a3A4fFKfVY-4P4mnDP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140027
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

All interleaved compressed RGB formats use only 2 planes,
MDP_FETCH_LINEAR and MDP_TILE_HEIGHT_UBWC. Specify num_planes,
fetch_mode and tile_height directly in the macro and remove unused
parameters.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 26be35572fd2ee7456401aa525cc36025bc52ee4..09a5bffd838b8a4fd3c22622e82dcf9fb99b5117 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -87,7 +87,7 @@ bp, flg)                                                                  \
 }
 
 #define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
-alpha, bp, flg, fm, np, th)                                               \
+alpha, bp, flg)                                               \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
@@ -100,10 +100,10 @@ alpha, bp, flg, fm, np, th)                                               \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
 	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
 }
 
 #define INTERLEAVED_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, e3,              \
@@ -487,14 +487,12 @@ static const struct msm_format mdp_formats_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(BGR565,
 		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		false, 2, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	/* ARGB8888 and ABGR8888 purposely have the same color
 	 * ordering.  The hardware only supports ABGR8888 UBWC
@@ -503,38 +501,32 @@ static const struct msm_format mdp_formats_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	/* XRGB2101010 and ARGB2101010 purposely have the same color
 	* ordering.  The hardware only supports ARGB2101010 UBWC
@@ -543,8 +535,7 @@ static const struct msm_format mdp_formats_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
 		0, BPC8, BPC8, BPC8,

-- 
2.47.3

