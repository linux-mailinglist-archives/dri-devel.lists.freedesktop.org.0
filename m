Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351AEC5B32B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7B610E99E;
	Fri, 14 Nov 2025 03:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHVAMQjP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpaQQ6qk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78ED010E9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:52 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMb0u51689971
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qD3y0SSt7nzx/s6G8IYeUSznWx6wT7uGhkHCZulV5zM=; b=bHVAMQjPFU819qLV
 deUXC+gQ8ywoDtrRF8F19GW15Kt+fr5RqThQU7qzTrePlITxwpSGY63OPtKJYejR
 TXA1M+a6LVF+gnyARkh6kn6Aqa9zPz9RSUkz9Qr9rzHEOCMg5+aEvOlTWXegmuf6
 AMOoPu+gNgMTyU85ppm6Hj1pNtBcN8V2pgfrlb/GbYgiATlSZzx864OpgWQzxPjq
 KUl2LHr02hbQrWVqzFls2ynUzyfpMJrMb/KRfjKli6S+tHrr7dASxDw/wkf3knwd
 xwEQWGPUGU0mez7Ol8C67UezkgONY9Mzbs74hZ80t/Jd0eYP3KwKmLdCQ4W78CXf
 VvWtCg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0pj1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed6466f2baso44820011cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091831; x=1763696631;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qD3y0SSt7nzx/s6G8IYeUSznWx6wT7uGhkHCZulV5zM=;
 b=jpaQQ6qkfK/kFCxqQqHBtgvTJ+1O0NAnmmKEri+zX9pE5hkn5rfqIFxU4grEx8l2ue
 AaKc3xRGuNk5VKiQrbD5X5/Fza58IMni/YxXJLfw4CSSLS+f5oVm+0y/fR39/ONY7D9/
 ujFHj6xGwci3oYw3NS95BV+ttUAZRkzUjEr+LTmlYcjmtMNqWWQHqUq4JIloQ4674nYA
 mrHgLa+1+XrqJDUnAQ70ag2HwAIGQ7kVcbew9XBaXch33JpeqXnooUM56OPNq7KjChXn
 hlUjVvJOrzJcGLQVMVcdrACmZ2Xs9HrbL9nOkuHwPidCQaoYpUcQMUfAwZCNLqeR+WHT
 ZD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091831; x=1763696631;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qD3y0SSt7nzx/s6G8IYeUSznWx6wT7uGhkHCZulV5zM=;
 b=bC0L8R3Z8YY4JQy0JRdU8VWWa2e9uZYdPkZ4Zqx3sgKEbGZ2HN3BtrbR7/PIBP57Pt
 hB264WQuLCmGJkcFNSS53lOXFFXNWc0X2vomGH6pMy6iumdwqcNAsMhML9XSMrVJtxMG
 7gtd69Vf6K5D3iY2iHcz0lH1a2uKsyBPA+CqLd9Kw60eDz6xhqxbnz6ZTe5OkrAczzNN
 eWj32WBFUrizAmC1CgqhLgbA9Dvm4smsMOOyGo+Josb32Oy/dTRp3TnOOtN7F9lPPHe1
 VBM7kHGAoPylvoyuzroCOj8R/h6MihkB3oRfTVgejhtg0JP+UnsAf8661OPJ0oD8H+Gx
 fuKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLNzb9it0+PzrOxlTuxCvBFa0kaRxcWVdH/s2E7Ect/vIl6H/yh7fuzzuBDFcZvAJbaReiQfgTEcg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNucbQl5Oq5ghsQJg24FrbxIeMVvb9PSvE1WxY4onD0HJMHrNr
 bc/iNFXl48ULJ3GomH7sYGLQ8wobO1CDfKk/Kh2kNtXNgVGIWDQvTYkLxa8s8BQYz0jXOkQgNCI
 /+qC9hRt0Z6Dew0j3yQJmDiEmEYpyJZcX+uYAlKTDs54AHOqmCfUq6jIbABW/NtWqfHkEsrg=
X-Gm-Gg: ASbGncsZMiRsgWG6BFXUlncRuQzg3X3njMQD37vw0rpcxkczHqaDRNSeSRx5BImJM7f
 lC0RvoYDYB/TJNQe+yaccMUwmm+0dacg0wAKYeavFzBB/SOcUhli2Yqt5vArqc2HBlUUxkm4b0k
 Q29GFU1BRRvSs2rb4Afh4ON1holxDhFTni55McRqFo8VpLTNpfLxQVCeOnRwRADLWKulZKX8OoJ
 XwLneIhVbr6LHx7LTDQ4LWMH+kfi7Vlw7lCl1hCD7Klahb7UF12NKDU3LPZ2IVQXD8Na5OM+it/
 lkAMuvGtH8M73XqSOSI7Nwqlat61rQkvtU3AeSdPadOAq48u/Is93Mmti/jLZn6WTpvSIgqgbou
 3VBj/2Y6gZSsnu/gYIqgFiTDTcjB7OJOdG6OXFdwtJhVD44iVicNBOHW6+ZLefJQw9fr2y7Jd7B
 yJDBiIunp6/+x1
X-Received: by 2002:a05:622a:19a9:b0:4eb:a6c5:f6c7 with SMTP id
 d75a77b69052e-4edf2060140mr29111681cf.2.1763091830868; 
 Thu, 13 Nov 2025 19:43:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDUrZrpOfkxuu2QnCmXbhASIGTxd5Yc/oCnlPkzgq2c9dyUHIG6LLVEyybQSqLeChliuOewQ==
X-Received: by 2002:a05:622a:19a9:b0:4eb:a6c5:f6c7 with SMTP id
 d75a77b69052e-4edf2060140mr29111551cf.2.1763091830423; 
 Thu, 13 Nov 2025 19:43:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:43:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:33 +0200
Subject: [PATCH v3 06/12] drm/msm/disp: pull in common YUV format
 parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-6-cae312379d49@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10606;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wQ4EPeLyGHhSl6u2Yto18CwT2uBhHyqQhzQUmV+w91A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVl/nZv2NQywFC1k5OvxkHDZxZW4yS8sY9Y3
 R4JhyH9m32JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZQAKCRCLPIo+Aiko
 1a/KCACP4oGXDCBhHf94lE6C6JJUX7Zb33oaTJqEUDAvc3QXiUbhOTVvGgTIpExeANy3iWRM4yx
 wElr3yg6MWQYQiDhHZrsXt81Vj2CpdLIyuIrAKaTQlhXJpwUNTvkpTk17xtooisDYj56s+3cVa6
 Q3fQyoOlUenWgA9+n8KOizJvcG8icflOOeIQhLsUAEJsMOGx0RSdRVU6EcmGS7ZVqTcCihM0buX
 UXlDVraeoY1GS33tmOX77nRPfXxBmSAUnPvByNLtvSnhAy8FtJTm7gmiDJnjbukkcrcwIxTnIrg
 NQ3ieJnQ/wZGrhLXdZWQLmg4lyx4FwnM+g7RauDvL7VxxLMc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: X3m9KNAATfPUExzxOECxYWv2xlgIYsxJ
X-Proofpoint-ORIG-GUID: X3m9KNAATfPUExzxOECxYWv2xlgIYsxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX9aokCFG1q/Ft
 tQ+BBxJGAQ5ers8jeOTaevYedQBWO/x3o9cH3KbCloD7MOsWobSP2htJQaO2FLRzFIQzhueDGJy
 AmQdd6vEs4mzFnSiv4jQbAL1C7shyiOAIojTpxy0jmwC9IS/MJCCGX3SOKT8ZZdTqh+xF7wbAsI
 i/uWVH8QXjI0/0wMEkUizvLE5/3FCWSO9oW413i7rUUqnwZug56ZbuSX59XGCtrNfoNCdupZPLp
 yED2nJBYC5e18s6SNFSfEtzVte+SOr68NOoic/u6rwDK8X0HpC0CZKozOEpbxStw+6+tGdY+1v1
 C66g78Iz/1cenM1I6e270Bj1oGhDedsm/D3+pnwapAQHr/ga84BC60yp02xkJl8fBCPoJ2WGxT5
 z1NlTmdAvpdU2WN5sdIJ9//1o3MSEA==
X-Authority-Analysis: v=2.4 cv=IM8PywvG c=1 sm=1 tr=0 ts=6916a577 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=J-CC3KfA7NYzMh5jGAsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027
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

Pull common params of YUV formats into corresponding macro definitions,
simplifying format table.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 120 ++++++++++++++++------------------
 1 file changed, 56 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index d577b3d53fbebced63792b5c65f50dd45211c8ea..900b2de252a6eb2eac3d0670f1aaa77f7520fd77 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -244,27 +244,27 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
 }
 
-#define INTERLEAVED_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, e3,              \
-alpha, chroma, count, bp, flg, fm, np)                                    \
+#define INTERLEAVED_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, e3, chroma)     \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
 	.element = { (e0), (e1), (e2), (e3)},                             \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_count = count,                                            \
+	.unpack_count = 4,                                                \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 1,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)      \
+#define PSEUDO_YUV_FMT(fmt, r, g, b, e0, e1, chroma)                      \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -273,13 +273,14 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
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
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 2,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -303,7 +304,7 @@ flg, fm, np, th)                                                          \
 	.tile_height = th                                                 \
 }
 
-#define PSEUDO_YUV_FMT_LOOSE(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)\
+#define PSEUDO_YUV_FMT_LOOSE(fmt, r, g, b, e0, e1, chroma)                \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -312,13 +313,15 @@ flg, fm, np, th)                                                          \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB |                       \
+		 MSM_FORMAT_FLAG_DX |                                     \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 2,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -342,23 +345,23 @@ flg, fm, np, th)                                                          \
 	.tile_height = th                                                 \
 }
 
-#define PLANAR_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, alpha, chroma, bp,    \
-flg, fm, np)                                                      \
+#define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PLANAR,                                   \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
 	.element = { (e0), (e1), (e2), 0 },                               \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 3,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -511,72 +514,61 @@ static const struct msm_format mdp_formats[] = {
 
 	/* 2 plane YUV */
 	PSEUDO_YUV_FMT(NV12,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_420),
 
 	PSEUDO_YUV_FMT(NV21,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_420),
 
 	PSEUDO_YUV_FMT(NV16,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_H2V1),
 
 	PSEUDO_YUV_FMT(NV61,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_H2V1),
 
 	PSEUDO_YUV_FMT_LOOSE(P010,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_420),
 
 	/* 1 plane YUV */
-	INTERLEAVED_YUV_FMT(VYUY,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(VYUY, 2,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
-	INTERLEAVED_YUV_FMT(UYVY,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(UYVY, 2,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
-	INTERLEAVED_YUV_FMT(YUYV,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(YUYV, 2,
+		BPC8, BPC8, BPC8,
 		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
-	INTERLEAVED_YUV_FMT(YVYU,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(YVYU, 2,
+		BPC8, BPC8, BPC8,
 		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
 	/* 3 plane YUV */
-	PLANAR_YUV_FMT(YUV420,
-		0, BPC8, BPC8, BPC8,
+	PLANAR_YUV_FMT(YUV420, 1,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb, C0_G_Y,
-		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 3),
+		CHROMA_420),
 
-	PLANAR_YUV_FMT(YVU420,
-		0, BPC8, BPC8, BPC8,
+	PLANAR_YUV_FMT(YVU420, 1,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr, C0_G_Y,
-		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 3),
+		CHROMA_420),
 };
 
 /*

-- 
2.47.3

