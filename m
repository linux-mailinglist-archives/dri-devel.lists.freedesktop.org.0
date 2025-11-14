Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC03C5B329
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004A610E99D;
	Fri, 14 Nov 2025 03:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIizMgKG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bw6Gml9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DB110E99E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMaxH21427916
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fkNDDeEkFU3dBwRVznIRKCYbh9s0YY6BLe7zy3wV/dE=; b=JIizMgKGHKU4uDWD
 PFA1hV5KOQDEvhIpG0tmOwq8DSpVuXLV5IBDp7OVJrRhfLZvrEN0YYeILJyAxENQ
 926ZZsV7rzFFcrsBnp2lgsv8xEGBV5nFcnzUwrKGy/Jxcbo4BQjAxwX7MEONpVv7
 29nFZxUdvcOYtLpYpmuT3/IK10ZXUR8u3ejVOJXgLz8QmLPgGNIsCpORo1lgqCPZ
 vD5HjtpmI0kwXc/RmEryzw9DkxX9mfJIh0BJCfR9L06Vo2vP7E21gUiNF3hKRRB4
 rWjrvHMC3J4F/bDHyxlq+uzDxUK1ZpkqhK53u08CmeSc28EiTaGsjy2JY/PhTA9B
 kZpP3g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0p57-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88249865db8so50423096d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091829; x=1763696629;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fkNDDeEkFU3dBwRVznIRKCYbh9s0YY6BLe7zy3wV/dE=;
 b=Bw6Gml9Y6HpVvdb/mQO+1yzQsrs/aQfgExExl4N4b3mPgaGjWfUb8zSdA4C3DjUFsx
 /FZjmavi6UFqRwIhKej4yG1J23jD/RRTQzD+bBxYLAA77qEcPAhNRRYzM2hSImRs1VV8
 W0bbjroSjUzSjjnuFWoRshgL46K6lXIV+ECvK6KocLTiOybLlazOfm63SXEqPyAgnskr
 WKXN/Cv7GKix3oQ3RdUXheXdEEXIjGpSYZ6yqRpYJNOfaWFZvdo3Wg0pf4mrRwGlaQe3
 fChEKU69hWsAzs3EXv3ID9rFKlg9QsLcGrImS+VJ8Zd/cjzr3svLsKHBThT/6oGOiiPu
 5hhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091829; x=1763696629;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fkNDDeEkFU3dBwRVznIRKCYbh9s0YY6BLe7zy3wV/dE=;
 b=faqoisuq3PeIcdbFkv/EoFd6qBDvtfG60FboVmc9ewhqvV0EiYCY9BPyHOYfyOKkWt
 ohnwEjVYCsxMQBhCjaQiRs6XHpR3rbK/F04ueYKUbrd3t63NvUTn+9RTV2sUYYQD9fF/
 hkUhhOf6+ElgHAN6lAWCi6us7NYst7MQ7dIz6/pLSwyed+djXQR+0tIojDWa3qv0sREa
 CWSfMEIbb1a/2MXjU2n0+af+3j32iDjwbCb4PITCbsrBvJoPlskvLG3buuEpMBcU70/r
 AEOGzMOwl4WVTIKRt91s1YsY3XeT3Nka927v1/oZQAhCr3xlM/4RS69gQikeUl2tZauw
 uoYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3AUfnX1gf6QlkhyRMdyDFqNJt3G/Ux667977aL1yiH+ZWdGcsxRaeg6JtXQ30Qkjgs75Ru8SQgKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwonpDMxt+WuUYDMnY33gcSo75KtCymNw5eLn05IiYoq0ef2/9t
 RL9It0gM0PCMVXlzbBNnMpnKTUzMie8O3Hf61RtrZew0uNYe2LYw6u7r3whuNbjAv2d4D1Gd6Yy
 ajuPtmw+MUVDPqCVkU7NGxz+bc1uB3XcGOAYHtXqM3Eu4uT9IPJJHaG++tdC4xufFreAN720Lcc
 bSnT0=
X-Gm-Gg: ASbGncuCOPSo8eKuUdG/b084l/vXoFNQlar7jyKorujOFya7vZ9JWPU95GBd++CBorX
 3v16du1hP6BnFln2bD6nNpBC098gQ/8wXLDRUPUVUjC8BK1komjn7O9yYsk5H+VLH7YaNBlSzSv
 z190VU5mLZ1pZWz59bDlNZXmCuxIC0gW4YUxmLshlIKb4fmYjaa+OC4Sv6DWZdiPM3YCwp086Hw
 8UIrIj2zI2RZI5WZJyScXqRNh7KFl+RBZLE1KmqWnQn8bmKN7YrUfkGUZXopGeXQZwGcGtMub7i
 jHlu0BuJLZeV66FZTvtL9+fzVfD5fE8lfrnE5oqwilY6j8v0gJOsANGPWUXssZ/RJPdNLnX8buz
 M+VBYQZ2lI4qiw3r7WeqTFsEPYYM+fFFe3Jj9O+1VWcyv8LIZCuPb6+hEsa8qhLPRMp1/rEFa4O
 CjC/S9AgAoOdoZ
X-Received: by 2002:a05:6214:519e:b0:880:50dd:16fc with SMTP id
 6a1803df08f44-88290dccb7emr26463856d6.7.1763091828656; 
 Thu, 13 Nov 2025 19:43:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH28088MQo54QH0F65cn+100QuWktEp23e4SSzPV9enf/SnCeM1n3q97xpogjYU/zsBIc5+hQ==
X-Received: by 2002:a05:6214:519e:b0:880:50dd:16fc with SMTP id
 6a1803df08f44-88290dccb7emr26463746d6.7.1763091828223; 
 Thu, 13 Nov 2025 19:43:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:43:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:32 +0200
Subject: [PATCH v3 05/12] drm/msm/disp: simplify tiled RGB{,A,X} formats
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-5-cae312379d49@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9223;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qHCTHjIA5laS2HK+x6axVpCJPJY96pJ2AxcbIbNCeaI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6bY0lSxl665kRYnJnUJBDR25pY1h7p1dO5f7s/G0HQ8M
 4On4VknozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACbCUcXBsI7Zg2N6+pxHXqvL
 ewVc+LTzm6MafK0jmTf05uw4FsOrs4P7FUOIj72xSGnpRA7m0i6nvjelbDEFAecWcbztvXf4zzQ
 X4fNNhvO/Rj7reW1uHB28ZU27+NudlxgX2hsXyRRW7WQPDOC0WHTAZ9vRGA6n776xOQHmJrdidy
 2qTv3UzXVm54Rc0WlV0pHcblODveN+32EzqTGU2/epfLqsRJaN2X+hP8tCbjmqLOj/IL+X1515o
 aNkVoX0NJ3OvNXPZmyd7rmbvbctVPesws2ymqoHkyPWV1vV3DY5nh4dKyJ7hkuGXX27+F6befdv
 W8YuSN992v9ydtD81dXLp0vkTGoy3XfVWzSyxeJ3KwA=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=6916a575 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dZuHSUUM1Vk3wmwcgTEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX5Hj2BIYZRumZ
 NlY3etiE8wcFJgyHQkxVAhRYLnDpiKWI/ulquR3ngI+zeLhzxcQaC6HReE7kmAn4RpFEZ8v412n
 M6Zikr68iEKfXmENHULu7EyD7K/jLcNub4YijGrqc7IY8kRXxOh0kcRyX4nqdAGf9tKBSCxle1h
 YivNJVfuWXknCdr42sspYQg4+P0NQkWzEE+Xs44ozslntrbhHxvr41BMEmsv3aC+lA1gXDb/yvS
 +xDe04p29Dd5JmE5kv3pBktUptRgwOye6DqPvqtnFqhe9cujTwT7hyusSE5/g8BGVitsmkeC5ie
 Q0QpV0XZ8AjQuFmaxbtKfQqUFddcYHBrSLvKjZL0M1r4Ec3GuY/5P+v/qmzmwZKhvO7xkgDRE0Z
 BVtHUH8haKu6Ge2FotNJJZ/t5+N6vg==
X-Proofpoint-ORIG-GUID: B_3C7VpMXHdM3ay7GqJMq2waItoxBJI0
X-Proofpoint-GUID: B_3C7VpMXHdM3ay7GqJMq2waItoxBJI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
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

Define several additional macros, capturing tiled RGB format classes, in
order to simplify defining particular RGB* format.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 118 ++++++++++++++++++++++++----------
 1 file changed, 85 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 28cef986f2d662484afd47440a79393c48256ff5..d577b3d53fbebced63792b5c65f50dd45211c8ea 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -163,22 +163,83 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
-alpha, bp, flg)                                               \
+#define INTERLEAVED_RGB_FMT_TILED(fmt, bp, r, g, b, e0, e1, e2)           \
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
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBA_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
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
 	.fetch_mode = MDP_FETCH_UBWC,                                     \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
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
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBA_DX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3) \
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
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_DX |                                     \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
 	.num_planes = 2,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
 }
@@ -525,58 +586,49 @@ static const struct msm_format mdp_formats[] = {
  * the data will be passed by user-space.
  */
 static const struct msm_format mdp_formats_ubwc[] = {
-	INTERLEAVED_RGB_FMT_TILED(BGR565,
-		0, BPC5, BPC6, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, MSM_FORMAT_FLAG_COMPRESSED),
+	INTERLEAVED_RGB_FMT_TILED(BGR565, 2,
+		BPC5, BPC6, BPC5,
+		C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
+	INTERLEAVED_RGBA_FMT_TILED(ABGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	/* ARGB8888 and ABGR8888 purposely have the same color
 	 * ordering.  The hardware only supports ABGR8888 UBWC
 	 * natively.
 	 */
-	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
+	INTERLEAVED_RGBA_FMT_TILED(ARGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
+	INTERLEAVED_RGBX_FMT_TILED(XBGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
+	INTERLEAVED_RGBX_FMT_TILED(XRGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(ABGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(XBGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(XRGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	/* XRGB2101010 and ARGB2101010 purposely have the same color
 	* ordering.  The hardware only supports ARGB2101010 UBWC
 	* natively.
 	*/
-	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(ARGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
 		0, BPC8, BPC8, BPC8,

-- 
2.47.3

