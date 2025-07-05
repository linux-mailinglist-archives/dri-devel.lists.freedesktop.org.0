Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F799AF9DCE
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 04:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9358810E158;
	Sat,  5 Jul 2025 02:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQHeq+9u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326C510E368
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564LnK6j032238
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ySsi3WA2KAoPFxgbMTzbgUKuNpVxIGybMd5gyhdvsL4=; b=EQHeq+9uUm4I+8kk
 MRNOz7ewTCu4jmPtca70FrKykBzCfHT5mjeHnXt/UynFLXCNGezgON4tXtkGnn7h
 7wgUwXOJHNVo1p4Rn/f26RFxtGmiDeGo1ToA7uzLMgkaCS6/Vr/zhau71UaZqrQw
 9C2OuCW8PJcvfxClT5xEgEjgSdqOh+/772BvuF2hAsqhhwsbxNoY0OKlv7Skn3/6
 I8bHkr63lbin0bIEQo2bo5IQOtLeCrtTljIO5J38mUeBRZz2jAP3IqG5B1CjxVNK
 AsWXCpq1SL9DOF49A/SuuVcs03Kk2OfBKGPmGIf7ErdXZ61XOLdSDPtOPJk0CXNf
 pGLdBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxw9yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7cf6c53390eso88203985a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683666; x=1752288466;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ySsi3WA2KAoPFxgbMTzbgUKuNpVxIGybMd5gyhdvsL4=;
 b=pK3ecEOkT/BxcA/TooEgdAE9CElgxcGXo6DciOOS1Lyj29EIVmcwlwCRJPRZ1ZU5I9
 jAS8VSZEY4LvbCqIkksP3l/VzNtKutkvAOx3bac6ZPmobgskKihtQgYiHEOO8wfCwWTa
 6QsCg3XUWP1oMKDofkFZ4dCCxIbfQs3nOFRnkL/Bb2kySJ/pK9aZfz7q9HN8b3tO9s8X
 lBXVuZ9QnsOW1lbPLT4jZuUuWF0+7QIT03YxcreONgu2Z86MQKu9lpfYNJjc0fle2XXX
 eAF+TJUI5M6luHv7whovxn9EMZURB9lV+Pd9bsc2iIZ5PMCJhgzADfGyrngdq4sZ48I0
 qT8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBVjV0yZc2tcXMWGN0v1eKVqH8F7Quu2DyU8Pi11KK21yVoMXtSn+QDhhwNkeDUBeWILxUIviGN84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBf/HHR9ZqMdg9Gao9b36pPInZicc4Ukhe5z65fH+wNbmiM+cx
 A/9VuZOSnqW2W0NeeChaA4TwCijeWPyYbNmYji8RFQCrER5J/D7M5LDITNnlQxX7v+Dxc4dujxc
 YqHIj+tc995LVTwcDDWW2fZrxCk82n6xjz9hvfcfAgmWPAbnWEuywkptTtH/iGUMMfixpdHulCS
 WPJrU9Pg==
X-Gm-Gg: ASbGncu/jbUES1MyE8X+uWvPKkpZg7m0q7bJ0XMzD32X8I0vY+48e4gJv0xJZ6II2I+
 u7Jmag+wQ5LyStu4U1BvTY4oLVlgVDsjxKqtBSIhLoVbICGwZ4Gi2wt9BdA0lpZT9mAqZiPcoMZ
 CCHqDH4sSJvChRkVI74ZPomr7hkpUwJN7yulREQJzdPjjkjfZX2iM5SYqsfOgh2qshxRwBmC7Mm
 oVnzxtEQjVEdvtk6mLtFO2rySxBDYHCGTIXkpLCk2fiU2YdA61XBQ1Szb8tkdCSHgwZxrOzG7fS
 QsHAQC6/jlibBej9mh/EbxbOj6TJ/aIJ2y1BGwgDzi/JN5P+bDkjRi1jFMK+6C3xDNAV7VkRBh3
 piqQLx+2cTlgdGCmOYMGcyeIfroo8/Vl3fdY=
X-Received: by 2002:a05:620a:270b:b0:7d4:6473:5649 with SMTP id
 af79cd13be357-7d5df11decbmr535125585a.23.1751683666028; 
 Fri, 04 Jul 2025 19:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtwtMlsGQ5e0xwgineScuK7LVo81xSUUNyI9wwOwhzVC0LLgubWDgPwYkzeO6ONeH2kkgrTw==
X-Received: by 2002:a05:620a:270b:b0:7d4:6473:5649 with SMTP id
 af79cd13be357-7d5df11decbmr535123585a.23.1751683665639; 
 Fri, 04 Jul 2025 19:47:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:29 +0300
Subject: [PATCH 08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-8-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zQGn21STxoD+LHqL3zqFBJZONXcRVa5w5iB6awPjCFc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI9LZKmNcw7tV7+z+ODXvY0qjWWZ8WxZuq4U
 lsCFURThMCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1W0MB/90ovalKVq+VIoaoxKU3yeK1DswGCM7wY5lnI2NRur9dWGNgY0nHwTqDBm7S8m9OP2iGfX
 LUaxcE43Btwkuu1QZ/Ql9T/kA2y9cwfK1mdQRkn29D6VLuHEyyFd997n1SloMJKaObGiNvEjmvU
 ODlS74FSwptlfcY4nHWVkX7pBMkCjOKl33Eot6m+qVWMgzwji/QrYdsrw3CfGP2EK/Chkk79NDx
 NhTrO0gaSwvDeSC/CESh8k+43yhRb8DalR3oAvzJvJ45qea6SJIBjmxEoh/RqPB8l2a6hiyYMvh
 7kWrLUljb0S50hVIc7pM+OM78+tPblfNSkIwVhsmrVpMx9Fh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNiBTYWx0ZWRfX07Vatv958pi/
 PE29ZpxJ9UzqiaJsDiBN6d97wslno6sOvmf1UGUpPsbIVnRM/Zq363fzIu94QCYxghYRThGtfVT
 OhxIB75J6qwxeh5v2r03q2kCRUA8p0lIe4RVyzt1RtZ5LaPv0TeC14rMeqtHNFARuJd5VdlDCwl
 etVsOWuzLi5nW9Q+Qh/zw7E4QTltSOwyf7OwP7EGIRySF3TsM5lJobhuJCt6KAtCRRlnneGE3wb
 Sm8NHt4YeFvXiJ/DaOzs5S7dugQbzU3k3cuw50G5i0Wlj7kOTJxbh8e1fZU4V8pWuuxlHKwqSe4
 0o2Zg+iaIrRQ9F8C7O2f9tbSLEVKoZAjLnpovCu1eUHDeTy5qluDhj2ldp5/ln1ByCOfPlNro+w
 oZcMVnhJ30cDwd430Oju8b5L6w5w5kHGEPk1s5RfSD/M1ZoL8kVKTQc9UlyIliba2zMdRs48
X-Proofpoint-GUID: wkXq-YiVn-hI-LQk12b-yZ35tMYqsNYa
X-Proofpoint-ORIG-GUID: wkXq-YiVn-hI-LQk12b-yZ35tMYqsNYa
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68689253 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dG_4ntQBwjiDuco-PWEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
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

Drop PSEUDO_YUV_FMT_LOOSE_TILED(), the macro is unused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 6f5af26d4e2d43414281197bf541e1ea3fe211f5..f949810567d83c5924f9dd127261e7d523921724 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -326,26 +326,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
-flg, fm, np, th)                                                          \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
-	.element = { (e0), (e1), 0, 0 },                                  \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = 2,                                                \
-	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
-}
-
 #define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \

-- 
2.39.5

