Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150FAC5B327
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A2410E9A9;
	Fri, 14 Nov 2025 03:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXXbb0a1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ha9zl80k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E21F10E9A9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:44:00 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMamh81580411
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UL6FC9bIfdJnNxJU/an98ngZcCH19v69FY5RCyV+0QY=; b=eXXbb0a1B8BWaG8W
 gHomVmNysDx/s/fqTXMXUE6i80MtIYuX7RHZpXcVLPc2ltv/xxm2MGPyjD2pQG52
 iGvu7/lqwxFSNP5Z1SYzLXCHn9qyMC0wKPu+ljtue8FU1ba7iagPTtBmqFIX3Uk1
 wOz7IdNwDqivh+n7I0pz9EdIJB+weRWgR25YdC8NoTm6RYq1z4UxOpAsR8F6nx9p
 Yckr7JE8u2L56o4rD1tIqTNQ/c9H7Sr15UMxvCwkBP4hwpPGRWhqCZwEYJEStLuu
 vEWx3QobTOIvGDel1qWUJMfJNX8ui5R8NQnWaB+5i0U/jmuQvKhQJ80PQUqYM52c
 iJhqYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9frpxq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e8984d8833so61542201cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091839; x=1763696639;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UL6FC9bIfdJnNxJU/an98ngZcCH19v69FY5RCyV+0QY=;
 b=Ha9zl80kp4mUiQIcFd80LTUVJ/ZPFRYFHDM+BKFxDpK89ofWaNW/9vXIbclALATwIc
 57/0bXLHp/6+O8M8yoqlz/IwG8nfHVO6FsqyMF0pVPXi76WRSzJBrqv8qeg+nIxW7BBh
 16pXN0k6rViOA1TDQr9Mtefml/P4IMBA5ueYQKmzFw/di/TfGJ2/cRXUHBwUOCuTsgbg
 SkOCI794x0OZ88g+4PTZtoWBCRhQR+Mn7vtaLICGLTDr0Zvm2PO4L6MCUhfseZ+G25mT
 pkCeeJVBUTfM855vq+QbotwGS6VrUq9LlnRgTOyw4/q/N4LDXJRxGO7TKgDDK3iVntKJ
 /m1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091839; x=1763696639;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UL6FC9bIfdJnNxJU/an98ngZcCH19v69FY5RCyV+0QY=;
 b=X3yKr16+ei+KbeNCDpDPC4ndlf583JzOf8PB0f3bb/coq6VhGUdAdY9ynm/LHGNlqR
 tr0/ZhuzQxGHQ+krV0v990asbOO/c6ptPLAWpX5NZ2NcbCscw4EWKsVrzOxkYXw3R8wC
 7MGfMJXdBW/5u93ZvoKSu+fvJIYqxasEMBwjVztQ903/0aC0oJ1Fx6IppTjQ7CSAqkEw
 3fbJ6DpegeLwtcp4zqmjy1cQz9TbJK3W8zOStqzcU5kTVPzl14oIFy1bxGMG/1EKRC2g
 r0UZOmGFExqEM0DX8FeD4I84J9ho+KGp8pZpu6XykC5XzvtRxJOdr9JPHX95Bdmi/hu1
 invg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrTlTETx8kPAGfdeyeqHsfAWuNf34t6dSwRY3ybhUnTFBBSyFC+i9o9oVGO2vuXuw3TSEoiRuYV5o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGSgthMR6A3o8JH0CdnUl0gXiZcQnBzLrD0AdYn0IfMxoiW0Kw
 Em1rIMuSXApXJViglcFwI9Z3Vdxze3a+qfDzH6r7UEXt9D61YSMxcDu5dB4qobwU1dzm2ctB2Qj
 NMJQ7f3MR4iZRwnzi9EIcl4JH6/7H7fgp34H/WUyXHlxp3FOlpcGUTZNRNy8r1qCecEEnoD4=
X-Gm-Gg: ASbGncvcQvQhdmKH7o23Uhotx7dEXMW3nvOFOgMkgYsli92sXnRP+hjTYiGHc3rlDE8
 lm7z+xl2h9MYQRnp1Keln+rXMMRIdBjC+J9z80CplY09MFFHMyEr4NmCcWeJzamEsLbgMzfCP+a
 qNeoK8iUiKaagdOASwoBnZshQv8lspB/wfA8kS4lp/LxQLQd5OJY9nixJn/YoBLUxU453gu5ZKM
 vc35cN0rk9CmthERzR2wdH4RkOO+G1ibqPhnkZ3C9TtD7zXGMhuCiNya+FDSqpC4I4MmJsPOMlq
 Xa3uGs/zPXYEaa8958Jg3FZ4maMaWznKzjN+AMW9lfUMntA4vi/shckyOGCPxF/hj83nk9tn7od
 90TW97vREkv996YVza2tZMO13+rvjJ3yf81nmA1S1Wvg+Itct32J1gDdHMSr7mLD+97C8nIv0O/
 2ngyl95hMGTLyP
X-Received: by 2002:a05:622a:1207:b0:4ed:6ab0:bd26 with SMTP id
 d75a77b69052e-4edf20f2099mr28389131cf.46.1763091839101; 
 Thu, 13 Nov 2025 19:43:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFe2f8Lbu/FOfX0YvReppPSRPSbE6n0Feh23vOIUQ3hbCBCeNR7YOxB4VSUBHICdkaTUVgLBg==
X-Received: by 2002:a05:622a:1207:b0:4ed:6ab0:bd26 with SMTP id
 d75a77b69052e-4edf20f2099mr28388911cf.46.1763091838685; 
 Thu, 13 Nov 2025 19:43:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:43:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:36 +0200
Subject: [PATCH v3 09/12] drm/msm/dpu: simplify
 _dpu_format_populate_plane_sizes_*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-9-cae312379d49@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3791;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WoQwPaYT17nL1Br+zX86+Qp7PWFhUGo91Cg+FYjNB8k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVm2tsEv2hoR8XMz8JMeahilwCJlIU6yMZ5o
 dvD64b7SnyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZgAKCRCLPIo+Aiko
 1QNtCAChN5raUEgXaH9Dt67R9m/vCMZ/98khRA2EVXfuP1MyoDd/+K4hqhkCU3jjNq4QU2RXoN2
 l280nV60PoHcT6GZ6cdk04F0zo6t8g4/uLQJcr5fZ7cg6aR9HGldq2BTfu62DWrRHf0HZ0PZVni
 6glUfFUbqzREppdeUVE8VaBdIu6eOZKQuf86v0AF3INhhD0eUb7BRScn2ddKSWmdtzrXq1wZK6u
 jl+xJA/+sSJwQKsY1HY6pwCz5ImfJizGMAXpOduJQetFmZwaNFItlWtvX+oFaSsP08LJt6Ea0Yb
 iYHZnyQRgilGaye25pyivkYcmOfpuQ3VEIdpXQJwWMhu8zFr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=6916a57f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=d-fElJfPDvRUhmvKT08A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WPCTJYTJeMvXh6bz0K_2SWN65xZ48cdP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX+VZitZ2u1zgT
 goJQcKjjdlGWzodP0RzGDuDW4g3FRswl/r+2zwsaxIvUy1Krs3U4A/ZB5dhfPm/KtrjIJG3kzpZ
 swQrNSe1bod+E4d4YzaE4vNHmtHDwoL1mZZ8JdAhhZ0gxLsrYTgsLorYBPnm1mXtEFWwJmYtGL0
 8sUFLlMXaZzC8KTdG4RKWXdfmAgSzlze+U1LlsODkFMOqPUv5YqE8/Aq2aDcNwyCDEFBZ/GXkU4
 TtJjmrLJ1kryeDwf3CqPq/nfYLvA3kJQVOeybyLHeQmlcJe1LYLP9d1Eix3vzr9Y7a0Z4Uw0vrA
 vhniPi2XkRbjLFKrJQTDJXojFtLiYHOqQFoVrdkLLBYS5XQhQSHhEWwuCguEMGUNpZfonUKLKkt
 fYenxNg10jy6SE40pjhq/W6LuvkA9A==
X-Proofpoint-ORIG-GUID: WPCTJYTJeMvXh6bz0K_2SWN65xZ48cdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
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

Move common bits of _dpu_format_populate_plane_sizes_ubwc() and
_linear() to dpu_format_populate_plane_sizes(), reducing unnecessary
duplication and simplifying code flow fror the UBWC function.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 41 +++++++++++++----------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index b0d585c5315ca0d459c7ab7f936f1ae350a4a520..b950bc827a36c231bcd4a9374e58cde6b41230bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -95,15 +95,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	int i;
 	int color;
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
-	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = fb->width;
-	layout->height = fb->height;
-	layout->num_planes = fmt->num_planes;
-
 	color = _dpu_format_get_media_color_ubwc(fmt);
 	if (color < 0) {
 		DRM_ERROR("UBWC format not supported for fmt: %p4cc\n",
@@ -128,7 +122,7 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
-			goto done;
+			return 0;
 
 		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
@@ -152,7 +146,8 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
-			goto done;
+			return 0;
+
 		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
 		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
@@ -160,10 +155,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	}
 
-done:
-	for (i = 0; i < DPU_MAX_PLANES; i++)
-		layout->total_size += layout->plane_size[i];
-
 	return 0;
 }
 
@@ -174,11 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 {
 	int i;
 
-	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = fb->width;
-	layout->height = fb->height;
-	layout->num_planes = fmt->num_planes;
-
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
@@ -235,9 +221,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 		}
 	}
 
-	for (i = 0; i < DPU_MAX_PLANES; i++)
-		layout->total_size += layout->plane_size[i];
-
 	return 0;
 }
 
@@ -254,6 +237,7 @@ int dpu_format_populate_plane_sizes(
 		struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
+	int ret, i;
 
 	if (!layout || !fb) {
 		DRM_ERROR("invalid pointer\n");
@@ -268,10 +252,23 @@ int dpu_format_populate_plane_sizes(
 
 	fmt = msm_framebuffer_format(fb);
 
+	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
+	layout->width = fb->width;
+	layout->height = fb->height;
+	layout->num_planes = fmt->num_planes;
+
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
+		ret = _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
+	else
+		ret = _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 
-	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < DPU_MAX_PLANES; i++)
+		layout->total_size += layout->plane_size[i];
+
+	return 0;
 }
 
 static void _dpu_format_populate_addrs_ubwc(struct drm_framebuffer *fb,

-- 
2.47.3

