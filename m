Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBCFAF9DC3
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 04:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72ED210E367;
	Sat,  5 Jul 2025 02:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hdOqqPah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF8410E367
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5650Ltfg020002
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YjJnZnfSPLG4pvx+jZTbK1RNBsIlVDEM9jAJuI18oAQ=; b=hdOqqPahytmRPfkd
 Hk8x0GJi7DePyJGdAaFoYn03bxn8ZzIATRYUXWg1zt83nuFWRZlKFLKmryvbRh4G
 5h/YmYjju5KLTuMeUlXKQDCba/d8x2leE9LP2hIFRwq+5aowdneOXNy4s4QWC8Jp
 SuZMI3YkRIbk5tX6opzwuW+WfJCKkHtcPt+lAG1M2hbScpzwSLVjDSXkz5QJVHs0
 Ty+4uVP0bAAht1XcN/0elm52MJfxrXu7jjgZejHNQ/F2SveTTY17fKj0OyUhK5XI
 O2rNU6u92Tf8o4q1e5g9U4DBtjLuKS5silUd/eyqu6z0aziAM5XWbQWRDaJAT4ja
 O/0dtw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdq84hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fb50d92061so22854656d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683656; x=1752288456;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YjJnZnfSPLG4pvx+jZTbK1RNBsIlVDEM9jAJuI18oAQ=;
 b=EXNcdv/IGUXepZrKJPkgCJh9hcktoHX9G+sUM/ohCUpgV3Zjhc29627nZZTgGUfo2K
 sfTssaTLzG8k6+Wk4eYtT3Cv1ds+wPuxNxLFY0O3IKUxDA/oT+s7eC2U07+RFQkJsLCm
 j87hq3m+z0txnR8q6a6GpRAMHMvnIRtXiCfi44fpkilAiW+GRxZbHPKospJsUCdPBd7P
 uI2xM/Niy+Z6wUvwZiXEmF6GOMJvrCPNYFR8nPB4DqjWsSQ6D3aY1m8HMSzg/kTqdEsw
 4Rq9SgDXQxgqpF3SFKRDLNHWDuyIgPQYxFNdJL/hagdE2e4dtyrvHhUEQu9UcQNaX1Z9
 +0DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAyvReA+voXI+QmhTPz8CHaQpcFzFhL9Ipdxtg24pky3RlAyDebZGbB35heX1heOBCJP4CZSWyWRA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCXcKYLH5CtDBPS3M4z/bvICRgIDKl3JEdrF5cCdWl1V/97cd3
 HleUxLOijqavks9tGnnAaxMQrYWXwfczBuLClinGaAja1CsUvvNdCqJcZzdfh9MhnpB+WHznqyj
 pC6ukRcvdjWQdPnMnkCRKDT4pmQTqRWjk5L7frL3/ISlRn2EK9K7M4TRTncjDF4jg1ZHIVfDUut
 EXcHgfUA==
X-Gm-Gg: ASbGncsSIHbsPfRZu8iY16/qrPpoSAc6JqdwSrBCQlZogbwPrbmks+BlWBG6rLUAczF
 2pXBpTKf5YbTDHcbeWjBhK1VvcbHEsdaXWDDjdg4Ypa3H4b85HJS0tO3nLuL35l1HO4sYjYsMq0
 9G2nb3gGDZl6pB3+OIa0erNxyIssXN6vB7dH/4ecRUhFqOT3Yud/X49j94LzotoXU0GGd1DT9Hk
 tJPhS8oHhS79BAS9nDTspS8mvnVMAdbvpuvS805n2LUlogKxNJX5zZRQfzddSRxhDJzyLdqXOIh
 qmrtMkfcykWYgPw0O2PM7ihmfK12JJmYJESBVB7gDwh1gbqGOiC8Hn7RevAfxiZPkPh1vbOb9B0
 SJ59hQEbEze+JMu6yOpmrqyQ9hfAqd/D2xdU=
X-Received: by 2002:a05:6214:1cc7:b0:6fa:c512:c401 with SMTP id
 6a1803df08f44-702c6d96b97mr71200226d6.37.1751683656081; 
 Fri, 04 Jul 2025 19:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr+zf2cVpxfMVy9rlPRwx88L3ABFyueYOPFJi0i6uvZr/YMhV3c4ZR2j1bn+zUaUufleGxCw==
X-Received: by 2002:a05:6214:1cc7:b0:6fa:c512:c401 with SMTP id
 6a1803df08f44-702c6d96b97mr71199896d6.37.1751683655542; 
 Fri, 04 Jul 2025 19:47:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:24 +0300
Subject: [PATCH 03/12] drm/msm/disp: set num_planes, fetch_mode and
 tile_height in INTERLEAVED_RGB_FMT_TILED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-3-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5031;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JAGOFM8la5DTIWskbTlo0vYXln0WqvrLnvfuKadWghI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI83KT5w00Xayj3fi0EP9gVV0Ausowy6PFP/
 4W2D9zi5YuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPAAKCRCLPIo+Aiko
 1aALB/0ZCZWX7K2Nz3Qr0BsZs4CKjwKdKp2XY72ADxM43zzerZC+PTF3Es8SKKI5yflSD5FJSMq
 q2nchnMYD9hyP/3iBbPLEsNS7QZgHDlyxJMkHO5vdhAftifyoW/7EajdiqGM+2CufcM7JiA8I9P
 mM9he5y1n5+Vo5MSQ+rWiOsgjPPRXyfFKL3d1kLgrZ3baKv0Gk+EKxngrVKc8nSN1+/Nqpeqz6a
 yCccHJ8gFVwq9iVmPnz5Q0OzifAMqzT932QnBl5TY8GyPK+5ztjwrX2hFN8iDPs8zLtjClzOqQd
 0QVNZncfdiqSKndWO4UFOf3YZhatf8gc0eVibLsqBVE1Udog
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=68689249 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dmvhxJvSUNPaeTh-JWgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: zJtYlXWVrYI-2y_taKZobWcbQQGSc0zZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX/PZIvaub9vJb
 rqCL9jQzEjkHE11cE5vRxR//iSl1JEyoGT67RMfvyUq62ctxlc1hjwBokT4HWuK6k8splZ14vA5
 LSB7WOrvWzRXjZCuLQPRNitff6nfSBlAM6lAnA555dohAvJlRtG5Nb2GW8ppqKQEYMUsPwrj6l5
 NG/078EnO1XrJpQQB13jOn35yI5pdTfypPLp/LFWzmivIsmGC59WDlCTxuheV9ioPfQQcBdvcKq
 VmQ9+tT9wabnozgOPI3OoolpERWzI62tuGuyVOvcVj/6fZ17MwqwvK5Gi1gVHW85m/dpzq685rT
 ownPwONrUROs+P6iOuItsSHsv3KCLOrQdzsHGY3675wJtd0xam8BmvUF7F4os3gkcrHoyp07NQ8
 8egRa7HakpqDYzVp5hOddpB7aQUvsoOlqpAxRgpXDG8uARfbcUJVjrrt8NSbRWCQ20IP+wqS
X-Proofpoint-GUID: zJtYlXWVrYI-2y_taKZobWcbQQGSc0zZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
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
2.39.5

