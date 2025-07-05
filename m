Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C13AF9DC5
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 04:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AF210E157;
	Sat,  5 Jul 2025 02:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CS0qE4OK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC2110E363
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:41 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652BwiD028340
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4s+MSjvTA+3MePRTfCYZPmppEZfrFaoQh7M2mpF98gM=; b=CS0qE4OKxJR+8H9L
 BmnOlW0WjVZgEQLEcQ/c53pZ60fc7h7CQpcDfYEeVOmHgFEgXfm22pdCrRYeuxIU
 FxQ/b0BrwNp3v8qf7ZZouihEwkBSDLORnJ6rGLiwFtoMcRCF79e4Q/ZLU0+oEdZK
 uDxjnPDNOKcQXpASAl4cZiDMbkPVlxwNroac8luBdnUxHRL7K7SILt4+njLU6zE1
 g7WUkDoNDwQcTvUBAbuK3nA3uLkL4saKHfwkwcXUNPvvn7Hvkt7wftAWiyZbsIcn
 PFCBQwzDCGj25dNqCD51+rq+qtq80KwY0fI02SV6lNE6/yNX49sTJFMrNx9Q+4vO
 dzIBYg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2ag134-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d15c975968so234851685a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683659; x=1752288459;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4s+MSjvTA+3MePRTfCYZPmppEZfrFaoQh7M2mpF98gM=;
 b=Yjjcousmy+AZmJ9hxnco67JhoAWy5QfEo22ngOXzBT1NkZBD4Saus/kRFXnRD5/sOd
 woFxPINIm4UnWdmfkAReVuzCB43tgDiGz5n+cysa7qBT26VbbBmo8SS/TXfnn8R9RMEw
 zwiGSeLzdoJpmY79GXBFvrLwI15DmhC+nm8D6tTd3VVy0L0tHc71n9SNPq9qrp5sq2Sv
 2p6G3zzVk32Oe6oU2LSDSPMzAmTjm7Op5Ur9sW+j2rMjEgWs9E7Y1amxGpPPayoNpvp3
 hNbL9KLKQspwQQM+kIUS5caDuuGr4h803QJDkC0Uuq1fuA1YY7sOffXsPCcU38tIyXJx
 dWaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUxWnDW5mRoQQAgFLX8eI/nScIphBgR3b9wxCaVfvccpTZ5lN4nRz7eCXoKuZMseJMf9J57iHDszI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1nRhZe/JBvO4qBg7fdIUaK2uD00Ywb06qrmn3dHHS+ZdBuQea
 QQE2XPpIF3GdVjQhgnJxNUF7URVeVYCNzsc7uTQVrO6/MFvJW+hBcdyOptt9YGekwGwJqIbbSzY
 apuGZM3QHWNXJvkexll85bIdf1UQohlqInejiY9uv2w3N+6TEphTKMJnxJ6ZjndCpHW5Z4+hf+3
 7bX9ToWQ==
X-Gm-Gg: ASbGncuYbbJvup82YkLqqHlBxnui9v9eM5GN+U59KYHDxA+95DAbACttbvVmKO760L/
 Gmsot6Rq4PUjCOLsbsPW1Kqwt5JRbOAFQcW1PySNV4BCcf3YgIW31ydFs9ifG+ZiybnXf7hAo1f
 Qwgx2IFHAHZVQiE+upXVasXXsirQR0fUGrx5SDdNBT8tCT82eaAv78VBTYsIW+23Wx4tB+r3hfU
 Go+BiO7tx08TedZjeg7kAjd4E+WWakthTWmNxhfJrBIG04f2rPQK/mIuAFB1q5PNrQGlGHm+qAo
 ID6K+Gv04nACeCgXMciBqNC8mTcO6ka9G8WrQ5q4BNkwZlmPm1t/Oh/7fovWcz75TBWQ62vNm8w
 qlfGN7S6s0OThvMxlP3UFCr/6jK3ExO53L2Y=
X-Received: by 2002:a05:620a:2913:b0:7d3:d156:37d6 with SMTP id
 af79cd13be357-7d5df102b4amr604838585a.6.1751683658725; 
 Fri, 04 Jul 2025 19:47:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz3mVn+ryYa5afaVTp7LcwhBfN+F01PPD3EQ58QXtfy9B/SKKE3QNU6Pu4gCJujhTtpPREOA==
X-Received: by 2002:a05:620a:2913:b0:7d3:d156:37d6 with SMTP id
 af79cd13be357-7d5df102b4amr604836085a.6.1751683658176; 
 Fri, 04 Jul 2025 19:47:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:25 +0300
Subject: [PATCH 04/12] drm/msm/disp: simplify RGB{,A,X} formats definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-4-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15137;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ys7Z7Kn7IpicXADUQHFTXSQLzecLxokw83FrLPh30bk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI8GKkSFhy7Xtn6tJpCt9lMtAxCXy2+FsC72
 rWL+gwkk1WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPAAKCRCLPIo+Aiko
 1eEWB/9WnofY8sZlQhAZ6/h5NWowFZILMfYcaCVNttD84mGELL7OiG/Z8uFqhhd5QqY0DFCE1CX
 4n7/b44dDVexKSeBBXz4QYmPsAwFc/cntmAX/Ey+jG0RWVohV2eONc8X72JtTMMMlabv0bOVwTB
 GU/95f+wnYNamDe8XVRFpt15CJ0iqZgW4BAHd4EtbZVMX0U2yMIzKy8W13kAIZNdLkAcIEuoB3k
 R7oGaUAKvGbX0bQ9ojM0qDQqHQrGWg7wvplJSejFF2sT+pAtgoETv/ieuv4QQ19N8ikRZFoKjll
 YOEGj6E5stkKw4MxZJJA/sq7vfYgZTSS7bAG2hrfDduW1pXq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX1KWOJv3gJTzV
 9hNdF5hIbYlO7T7PbVlIgIDRATv1qzRC2KYf7l9+zA88FivCfzHPoJyN7PnUZXLpF7XGC9TOZa4
 lr9W3SIDbA3Un0KcgchKFoinrFCV4natOrToFDotQFMhCmMkWCRvoY8srEyo0WjaoZqPm7hgx+U
 NsWnMrGdEiB+lLSAmdEJJegKySvBwzYwuxwzuev8THtA1cEgNp0nOZIoNv/W5dnlwXmogrEWC6p
 R/5h7ra/DGJSlXGDFrSSihoh/rPW8LUA4EgtBo9Ezss41UryhIC8VhxJVwonKW4+7q0800R1knE
 tQdNRMV7U9TzETWxbAFYfmL+IR2lnV9B5Z/g/vy4m1xyfM2lvR1E20Foas67KhbZ4oAXoZvOGOa
 9ezTfwAHwEJTtBwjtPUX3PH71puLrF2MMnJLaCOAZgTXrnh5mBZjSb+2x5p0Qaqp6veL/7v6
X-Proofpoint-ORIG-GUID: UXBjS8-mYSECZUw4DcW4Li1nC1mX-Hu6
X-Proofpoint-GUID: UXBjS8-mYSECZUw4DcW4Li1nC1mX-Hu6
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=6868924c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=SE7Ho6_bQ6tgKpEGU9wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
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

Define several additional macros, capturing RGB format classes, in order
to simplify defining particular RGB* format.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 275 +++++++++++++++++++---------------
 1 file changed, 158 insertions(+), 117 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 09a5bffd838b8a4fd3c22622e82dcf9fb99b5117..28cef986f2d662484afd47440a79393c48256ff5 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -66,22 +66,99 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 #define MDP_TILE_HEIGHT_UBWC	4
 #define MDP_TILE_HEIGHT_NV12	8
 
-#define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
-bp, flg)                                                                  \
+#define INTERLEAVED_RGB_FMT(fmt, bp, r, g, b, e0, e1, e2)                 \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), 0 },                               \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = 0,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 3,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
+	.num_planes = 1,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define INTERLEAVED_RGBA_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)         \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = true,                                             \
 	.element = { (e0), (e1), (e2), (e3) },                            \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_count = uc,                                               \
+	.unpack_count = 4,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = MDP_FETCH_LINEAR,                                   \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
+	.num_planes = 1,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define INTERLEAVED_RGBX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)         \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
+	.num_planes = 1,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define INTERLEAVED_RGBA_DX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)      \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = true,                                             \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_DX,                                      \
+	.num_planes = 1,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define INTERLEAVED_RGBX_DX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)      \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_DX,                                      \
 	.num_planes = 1,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
@@ -225,185 +302,149 @@ flg, fm, np)                                                      \
 }
 
 static const struct msm_format mdp_formats[] = {
-	INTERLEAVED_RGB_FMT(ARGB8888,
+	INTERLEAVED_RGBA_FMT(ARGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(ABGR8888,
+	INTERLEAVED_RGBA_FMT(ABGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(XBGR8888,
+	INTERLEAVED_RGBX_FMT(XBGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBA8888,
+	INTERLEAVED_RGBA_FMT(RGBA8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRA8888,
+	INTERLEAVED_RGBA_FMT(BGRA8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(BGRX8888,
+	INTERLEAVED_RGBX_FMT(BGRX8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(XRGB8888,
+	INTERLEAVED_RGBX_FMT(XRGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBX8888,
+	INTERLEAVED_RGBX_FMT(RGBX8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(RGB888,
-		0, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 3, 0),
+	INTERLEAVED_RGB_FMT(RGB888, 3,
+		BPC8, BPC8, BPC8,
+		C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGR888,
-		0, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 3, 0),
+	INTERLEAVED_RGB_FMT(BGR888, 3,
+		BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(RGB565,
-		0, BPC5, BPC6, BPC5,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 2, 0),
+	INTERLEAVED_RGB_FMT(RGB565, 2,
+		BPC5, BPC6, BPC5,
+		C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGR565,
-		0, BPC5, BPC6, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, 0),
+	INTERLEAVED_RGB_FMT(BGR565, 2,
+		BPC5, BPC6, BPC5,
+		C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(ARGB1555,
+	INTERLEAVED_RGBA_FMT(ARGB1555, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(ABGR1555,
+	INTERLEAVED_RGBA_FMT(ABGR1555, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBA5551,
+	INTERLEAVED_RGBA_FMT(RGBA5551, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRA5551,
+	INTERLEAVED_RGBA_FMT(BGRA5551, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(XRGB1555,
+	INTERLEAVED_RGBX_FMT(XRGB1555, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(XBGR1555,
+	INTERLEAVED_RGBX_FMT(XBGR1555, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBX5551,
+	INTERLEAVED_RGBX_FMT(RGBX5551, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRX5551,
+	INTERLEAVED_RGBX_FMT(BGRX5551, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(ARGB4444,
+	INTERLEAVED_RGBA_FMT(ARGB4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(ABGR4444,
+	INTERLEAVED_RGBA_FMT(ABGR4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBA4444,
+	INTERLEAVED_RGBA_FMT(RGBA4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRA4444,
+	INTERLEAVED_RGBA_FMT(BGRA4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(XRGB4444,
+	INTERLEAVED_RGBX_FMT(XRGB4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(XBGR4444,
+	INTERLEAVED_RGBX_FMT(XBGR4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBX4444,
+	INTERLEAVED_RGBX_FMT(RGBX4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRX4444,
+	INTERLEAVED_RGBX_FMT(BGRX4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(BGRA1010102,
+	INTERLEAVED_RGBA_DX_FMT(BGRA1010102, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, MSM_FORMAT_FLAG_DX),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(RGBA1010102,
+	INTERLEAVED_RGBA_DX_FMT(RGBA1010102, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, MSM_FORMAT_FLAG_DX),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(ABGR2101010,
+	INTERLEAVED_RGBA_DX_FMT(ABGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(ARGB2101010,
+	INTERLEAVED_RGBA_DX_FMT(ARGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(XRGB2101010,
+	INTERLEAVED_RGBX_DX_FMT(XRGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(BGRX1010102,
+	INTERLEAVED_RGBX_DX_FMT(BGRX1010102, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, MSM_FORMAT_FLAG_DX),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(XBGR2101010,
+	INTERLEAVED_RGBX_DX_FMT(XBGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBX1010102,
+	INTERLEAVED_RGBX_DX_FMT(RGBX1010102, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, MSM_FORMAT_FLAG_DX),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
 	/* --- RGB formats above / YUV formats below this line --- */
 

-- 
2.39.5

