Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593A6AF9DC0
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 04:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C7610E364;
	Sat,  5 Jul 2025 02:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3UaSsOL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48EC10E366
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:35 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652U2xx027916
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iJ4vVx6OGFN/aARr2osrAhMqjdA1UbDiBblNVXe4yIo=; b=h3UaSsOL4BbJLs6x
 cXHD9Q9iMMBe4hBIpZfSgWH6/87tiu0/2TPggx4bhR9ZqWtCo0ReM8DwGEXA/Xxs
 /LFcbFVDFQLZg8SZRAF9mw+sAW4uYKu7EHO8jGQfxURRZhiBnBnYIIV2/nfW3YaK
 oKPMg15FlPjGgXgEgvrpKJkusNCEZ5uCrbSl9pyQugCFviZP+M+UflpfCwNjo73n
 lyWprW4fyNYE4IT5a45zuMopo19rJ6YC1sRf64rTjrH5xgGt63G1VBBn7vcSbzlo
 JmG9pnMBk2ot6hcVC91X+clfrrfMe7QjYmkwej5mhxwt9Es7L7ohYLxHHZBpNg+B
 9VetZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2ag12g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d44d773e23so370977285a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683653; x=1752288453;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iJ4vVx6OGFN/aARr2osrAhMqjdA1UbDiBblNVXe4yIo=;
 b=RlnRl4f4nayY/pP7h8gIbs6a4g7Dq8bk1mqV3FIN9rKxaUHstPmW8EOGFE+rg72KBE
 NHIY3X50nw0Vu3c/toRSDeiH8BnuGns6a+rBw1tL5GKDU2WELGlSWGJ8+6SaruqxUTks
 XhvyRPMSHa8+xS6ItQxxLL9zE055ZeuQ6FVSUveCUnByue20UF1hBZ4P2/iqNfLcVYTP
 q02dhoSJBFWEZ1NLzgUVIjViKmQJTzLgTc6PAstGyY6cyGVSApqmKSnh33P8o3ygLsi0
 MjP69yMGJ6Wl/p99MWIwmdits0EELNnQLBeeYIrZin0ZqeIHAKMFkmNCJEM/nR/YqywO
 JtFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhUskTZokjnOBI72kPKtjsol03/MPbP4PtluLnotZydpZGKQ5tw4/aCJtpb/w392VL1oxxsgXdkV0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBhGM1pPddpkBVMqmfZJhuS26jy2UOrs5YXhhCBFZOwmnJJuh4
 DRhKN+JXZ/xBDBTPa3GTdJHXb17yaxYxK28PF8eEZK3JYmFk0b7BdOXa7xFqET4LcypjL7Vedvt
 ey6yktrWTO9CXEWOshUHl2KprvuHcPPT8WuejDU2CMNEJospzcn1Lt68E8WXWnqwcC9THdyeF3a
 IY4YEN8Q==
X-Gm-Gg: ASbGncsLAwL9pk5Xi0weZv6xHFTiud/8ChSI3bGaAgTM3TwLmt46F+50oVnd+ej6vN+
 +lDBWtujwqWnQ6FvxkaEZ/t8jcRgnoIIf9JYNimsfhWzWoyngwv6e+TxWlqb47cjsmguCYMfl+F
 u/xd6ehNqa6ay7+vm6mjyND5IlgeZyIVpki21jwZRzMcTAjFTrtpjDb7Z1V/L0A9wLoYRl+pNSN
 5dkGAxzAmrjKmbTnXlDPHm4FKGOquaxgWBRgYRXwlZCVT4Hm0sXj+QsG89w3xA5BTVgcEMbIxqq
 T2+NB4+W27ljzRhNXbztjqQ5kPXAiqbsOBc057def+J8qKDapqjyrQ9f0Pysja/lox3DcSw0mdw
 x6EXf9JxXtvM2CiFsJKjd9r88g+A9rKBpgVQ=
X-Received: by 2002:a05:620a:3185:b0:7d5:db58:cc3d with SMTP id
 af79cd13be357-7d5dcd07298mr522807885a.43.1751683653564; 
 Fri, 04 Jul 2025 19:47:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb2rVMFMnKID7Poz8TOhF6bpD9xZ/N3zDdd5+/lpzeD9i73vNEC6mlmImN9LTAqERZXQbRMg==
X-Received: by 2002:a05:620a:3185:b0:7d5:db58:cc3d with SMTP id
 af79cd13be357-7d5dcd07298mr522805685a.43.1751683653002; 
 Fri, 04 Jul 2025 19:47:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:23 +0300
Subject: [PATCH 02/12] drm/msm/disp: set num_planes and fetch_mode in
 INTERLEAVED_RGB_FMT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-2-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8396;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8hnAM0lAQzZe6nBJfHjACLVW7VM+NAqqrBj4BkEu3m8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI8Gew5NVV97vMySFxySmJhHhabCMS6Y+Nbg
 2pmezhrrVyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPAAKCRCLPIo+Aiko
 1TT4B/9wNslGM0i5bR6B9pm5dwtRONclTodij5Lbx8cDKwhwOzkwTBxprVxZ9g7c0cVOO8NWYRb
 6Nm2PacperxXpkslGLowvxnRzuqUcpgM++orPu32yC2q6vzIqwymJfIw0lXWWjJlU0K0ANR2v99
 XUuofE+68vu9TgwYvHsB1LjqgJVmWpd88T2FTVxvqpYfr8DpilJ+yyD8pDRz2PzIZfy7vyletEU
 j+YBejfIUW4qhNyTYgHChH5UkRBuREsLVmCboth1mHifw3uJJPvU6RA/YOw0qaoMD8G06plLZFl
 UUywUi0i0TtEkuGyS6/wRwCo8PAl/zhTItV8lwnlWw3bpaZk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfXwzx691la3ZqG
 0dwiPiOHkURj47eIlvLzivWc+AgDECaH3HhOzQPMqM69X2ouLW3kQnWtijEAemJ+g+ZS74YheJR
 VsflhTdDDXa+j8GuWtOb6KwU40NHk8xoYuBcNCswOazJfYn9/5tcSZyvtJiGDBhD8YhZRxOAkEn
 8uSFZBq3sptSA5reSJAGQU+Tn5FGA6aSs2eEvNHXGHnrcKcOCtcTfz87UVkAZL/BUmfUe3YJuT/
 INosc+zt3HPDOZKXgW1fCJddJub80wcd2TWCj0+JAauq4OdbWrwtHXFJuykpkSMZeuKX8ZKX8Be
 YgMFTEVENaOrAAUFu+eWZRNkdfYFclwhVj6t2X3H0LrPqSy+uZzK8AeB6OcpYd08sH85uhmLjQb
 RIiP2ONpYNMIvd9zq85IqAUljmldN0fuZHx+2UKWrYM1JthebpqOUnddTlHM61+2hEfoqA3G
X-Proofpoint-ORIG-GUID: YhjuXwc5RvaM2J4UnITR4xrwmuj5p2qP
X-Proofpoint-GUID: YhjuXwc5RvaM2J4UnITR4xrwmuj5p2qP
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=68689246 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=egvvE6OTd9odGDPIBgMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017
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

All interleaved RGB formats use only 1 plane and MDP_FETCH_LINEAR.
Specify num_planes and fetch_mode directly in the macro and remove
unused parameters.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 114 ++++++++++++----------------------
 1 file changed, 39 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index eebedb1a2636e76996cf82847b7d391cb67b0941..26be35572fd2ee7456401aa525cc36025bc52ee4 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -67,7 +67,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 #define MDP_TILE_HEIGHT_NV12	8
 
 #define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
-bp, flg, fm, np)                                                          \
+bp, flg)                                                                  \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
@@ -80,9 +80,9 @@ bp, flg, fm, np)                                                          \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
 	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.num_planes = 1,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -228,218 +228,182 @@ static const struct msm_format mdp_formats[] = {
 	INTERLEAVED_RGB_FMT(ARGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGB888,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 3, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 3, 0),
 
 	INTERLEAVED_RGB_FMT(BGR888,
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 3, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 3, 0),
 
 	INTERLEAVED_RGB_FMT(RGB565,
 		0, BPC5, BPC6, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGR565,
 		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ARGB1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ARGB4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(RGBA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(ABGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(ARGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(XRGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(BGRX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(XBGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(RGBX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	/* --- RGB formats above / YUV formats below this line --- */
 

-- 
2.39.5

