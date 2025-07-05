Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB36FAF9DCC
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 04:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFDC10E366;
	Sat,  5 Jul 2025 02:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bE30fd7f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AE710E36C
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:45 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5650wwnP007944
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HKzndPu78T9KD6qlOnp0vaK4lOncIgXRX0HdtczdfIs=; b=bE30fd7fNT1EQ728
 mx1VRIfChUrqBb9fDLkhcfaFEMq5OsGiWcweJYEVc9BynSVTExFOdNQpxvl0nhEx
 huhS+7Y1215Qnh61TcYytp1PEYFg3Le12WowqqKAy8c2gXOiu80Jx0weg7dcI5hJ
 oQV8js6mk4x84gNc0bvRLZT2N/yYmB6LtM29GoZjxoVaUmFglmT7wcIkY3DG1qtk
 DxGuTsqXcte8+NFYwho22nIJJKhDroiiH3USR3I5hW4sL1dKqLcawl7RglK/S4x9
 WrhOdvqeuH2DN1wKN+59jV8OJgnj8xbKfBBMmg69xQsZtVjYbMIG6PYsin/CTKwO
 3LtyUw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxw9y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fb5f71b363so20579596d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683663; x=1752288463;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HKzndPu78T9KD6qlOnp0vaK4lOncIgXRX0HdtczdfIs=;
 b=JrwF6nZClQc4A8TeqopCvhWc+3EwCYHIs6p8uMrU+3hydUVin6GvkM4csACvuvUlkc
 +itKynHRxYZoCCt5uE9vdocUwTXFmk8gYPz8T5awWCqoDGMwHIaEcP6ZCouX5tmgr7s5
 CKWfYBvBwfbS3hi3PDS8bjTdwsYw3SMgZ3V2PJX/5WBQpzABhR3I3a7kyHGFepsfi5iF
 8BridTW8SAu6Gguk6xWaRhx9PReRM7drj1BH1oU98zUHbCWsYG9RpC8CyJifwiw74g7C
 tWZto+jmfP0ncw1J4ExEbm9keKNtarJAqDi4oZb8yG/NWmb4DRqm09F2IXcEEdQgPE+9
 1ENw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbsi/NZsJsAStcZGlcI2yrdt9e1ePQkVWU/U3APJ/gZoDkJfL098CIM9DZSRrw0eOI4BtiNgeAYTw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHQOJ9Xy6Z1Yx1PXNvaBu1ZoSv3LtTvtu7S3Kta8bnwndzwFdz
 kMLAonfFYm3GCisKXwHU+6+xbmiYWxO6jZMC7fqjYKnH2D6GMqKhql6IHfRhb24LQI42CcnQtv+
 j05bapoxWb5Lrb2SOlEcJhG/KgI3SbN7el9wXybUa0+b6wmbOzLn3xjr+X7IwvYO0MjFOG7IQjv
 uiHrRphg==
X-Gm-Gg: ASbGnctI7n3ioIIqGG8XyOx8FkzTc0I9CQImga8zpxd5a0x+mTfcDDbJ0f+Jhui6108
 XBwzEkZ57EblYMiXt6KgyLAb6sJHjZ9eK35Rbd34snk8GvmKG+FqDKbiIlnKbPOKhU3BB74pwcN
 mghBlrhco4UnRHSFRWydb1ggFl9zb01YLi04dT5NtPHErUxSEBLdi9PAeMI9KdCEOO/RKsAe6MQ
 ZDQsFA9fN7oZZFaeft+jyMxyb14bvWgoN/6DAMq7Ui9OcQX9T8g1afGmvsVEw8uYVg+DudqZH1O
 8OVC9kwkNQRbJXdmwPRoSxmwdb8G7s3LMyi2AFDUTV4MLPLdOh83n9/7BDKdi/X0l9jyB4vsiIM
 2qMPonQ/cfv04FrBjaMi0pDhO2nN2ypDDiZI=
X-Received: by 2002:a05:6214:590a:b0:6fa:cc39:ab with SMTP id
 6a1803df08f44-702c8bc0d61mr59982466d6.24.1751683663516; 
 Fri, 04 Jul 2025 19:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhsBwDPbjwXmMNVNZnztP2icDidDytd6L4/eciNVoQ94oT2wPJEDuuw5S3YagbqjaeFDqrEA==
X-Received: by 2002:a05:6214:590a:b0:6fa:cc39:ab with SMTP id
 6a1803df08f44-702c8bc0d61mr59982236d6.24.1751683663082; 
 Fri, 04 Jul 2025 19:47:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:28 +0300
Subject: [PATCH 07/12] drm/msm/disp: pull in common tiled YUV format parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-7-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3285;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tBTRVQReAX9n9KrkvZb4yrkMs88kXRzSL6ZE6wG1jPw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0bGJNv7nYwCLTtEXDvuV3MHGbXqX/+37yGTBafoY4WMT
 cGlRTadjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhIfAX7/7jnPW9kAh70PpKP
 nZOoLn+ritHDPvy9r11DBQPDbgP5U3nzK4/dT2VNUfRYv+3s0vgVPaf+TLoatcy54JJbuuLaXMO
 3vybJeXv77YkXaH/L8+JdxUPf63anXBMTki07xXff534bs2BySm/CA+9187hvej54Fz3vaN/hF+
 +56i3Xt7DuzwqyYs9b8pPjP089y4nYQOdo6b0aLa1t/Q9P57stZf7167rnXA//X4v688NaIxun3
 Oxl4+H+WiJcFHU6cqnJ4d6Gc3WMPF9+FP83Nl7wpPhsJWP6yqMKXKs/1jEceaVjesk3d6L987c7
 t9+1mpNVedbDsaX3Xoy8hbarFf8y2cOHBc2LVvx22pYLAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNiBTYWx0ZWRfXzA5JknTrsooE
 1uH45gR+evVjwdCLfVRXRnZlg28kNbgp56BOKSICTUJN5GTliotvRAVH+1sN0Fy0eBPfPwF4hr0
 Zvwqr1OxBo6IHbXuHro5xDCRb3jr1sAILpoflFFSfdjRjOAn9HwWHeKBFZB+VV5EqYDq7Hjr/mq
 4j4Zr59EcvtMBy4MD15R2ib7LIMSrrHWwwiuKhh6ZukBBoFWdtpmHUR046Gg4WCDorQhDXGSt8A
 9rE4TYtMuBvY1J95nODccTpYT/UnangsnDQ2z+cexp5OTKztYLNAGUw0uDg6rJc5vOBdZGMX/bG
 kiBfkNnn1NVnT9/6m8Qw6+ctcA28kxRySjvcWXYHFbyDDZN6cVjwSccpyM/Y91EhM28coUJ0kLR
 qF4MYgTv56BRsBJgoVQ3+/NkeuENdgz6JlelTKJJw04yrqNIlKDnNmmxizGTvkcaXpwtjaCY
X-Proofpoint-GUID: lu7iaPPG9cpGsw6agasaPC1NPBBg-tTh
X-Proofpoint-ORIG-GUID: lu7iaPPG9cpGsw6agasaPC1NPBBg-tTh
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68689250 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=FCw1dLDEiFPyt24oSuoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050016
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

Pull common params of tiled YUV formats into corresponding macro
definitions, simplifying format table.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 900b2de252a6eb2eac3d0670f1aaa77f7520fd77..6f5af26d4e2d43414281197bf541e1ea3fe211f5 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -284,8 +284,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_TILED(fmt, a, r, g, b, e0, e1, chroma,             \
-flg, fm, np, th)                                                          \
+#define PSEUDO_YUV_FMT_TILED(fmt, r, g, b, e0, e1, chroma, flg, th)       \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -294,13 +293,15 @@ flg, fm, np, th)                                                          \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_DX |                                     \
+		 MSM_FORMAT_FLAG_COMPRESSED | flg,                        \
+	.num_planes = 4,                                                  \
 	.tile_height = th                                                 \
 }
 
@@ -623,19 +624,16 @@ static const struct msm_format mdp_formats_ubwc[] = {
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_NV12),
+		CHROMA_420, 0,
+		MDP_TILE_HEIGHT_NV12),
 
 	PSEUDO_YUV_FMT_TILED(P010,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_DX |
-				MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_UBWC),
+		CHROMA_420, MSM_FORMAT_FLAG_DX,
+		MDP_TILE_HEIGHT_UBWC),
 };
 
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,

-- 
2.39.5

