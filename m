Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8564FC6A1C5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE9510E4EF;
	Tue, 18 Nov 2025 14:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWYrNlKi";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LIXeXcC9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA03010E4E0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:51:49 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AIED3eL2272113
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YBdOKUQHmFcMB4rOVEiiR5nT0YtFNhOv3ctcY9wpcVw=; b=kWYrNlKii+84B+vK
 uv/xa3goNNFAHRFPPIptLst+/1fH0wl1XOy2wv9ddMSCVP9j5xH0cAcfWTZb8UCM
 iwAGl5Jdd+VTUXluiMyoiAi7LGl/Q3+xm9bbSlZALlhQ/VGmZnFveIXyC0x87LHC
 n2g2MCyOeuiU9s/rfEzZvH4yrZIe08BARhnujjkvUx4HZjSxox/j8mRsYxVYv76j
 nPvVul/GZnYCDZh1cC80YXoNctWkUxzNySEhqRa0XjHETCJDWQ3kch8gxva14kRN
 yGCSosJndeWsRy7bsHNVuD2S8LV7/2qRFiJtAHyX4DIPtx3WwQjb3K7N6QQuWgVC
 BJc1wA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmhc02-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:51:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee1b7293e7so118523981cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 06:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763477508; x=1764082308;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YBdOKUQHmFcMB4rOVEiiR5nT0YtFNhOv3ctcY9wpcVw=;
 b=LIXeXcC94nWpoVSuouviSde7jhbta4TFJ9Y0qNWdYvmBNvpx38V75XSeC4ZLvfc90u
 bjg6VTO8hMrfTrgMVOl8NaNZxtBoM9hDGg8OdwgaOnQjQBrDdtU6qWmh3G0V9Effa/uw
 6QToxYfNSDxR3CMVTFefh2kEIMoxvWZCjOaa2hFhG3H4B7aXe+gkdo5ijlYfVTRgEBsp
 +njnmfnOLb0DgEQIVrFcTG3e9vOFWk3gGj05CpyLs0+SuQMFQ6jSXnwumHcLIJJthLxh
 DiBJOUQ1m3Cwjd7CdHR38YsYGq46CROlq/VxXGy1xwRH/yjqy4tc0wTI7Vg36nZnsypN
 bPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763477508; x=1764082308;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YBdOKUQHmFcMB4rOVEiiR5nT0YtFNhOv3ctcY9wpcVw=;
 b=PECXlkOlV3ZwJ7Yi/KPUfAV4l3IINVUZKcZBSenqoLp1yAaH0Znaq9R6lDSbiTBfSo
 /c02GzZwwkmo546frz7Gm1a57yzKASB7FXUNRmHcKBuzx1EochRH7dS09D8rMoAJPuhX
 Pdzk9vyQIq/0wzCrFIyzQoiH+k//GBOd+cbfeD5i9p6ZiTRjBHVQUJKwo+u9BZa9yNBp
 mQ8Pu7jVqKD9J8VjqFqQd4KfJYPnRXEpCHvjuDQZ4jAPLmNUidzn0e/+MSwipXKwZt9Q
 gHMl0DjRyubAUU35WLuUMrLOYS7Stif4zSnh4tsqZmxM+7Si9nDw3UtPHDQDwyI13ZH0
 6Z0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcVkQPfmD2xYP4uLYTqw+rKWvb2EYO2YpwkdZ00Va7mhGq+tq2WYgmU3uXefbwiiYz4dJmTi+c15g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPpNDCaHcZAZsg9vRgXJAk60/lvOwYXJs7mZGAN3CcpeoDRY/T
 NX0YlXrTN3oyzXAXx6Jq4NkjfG/RAFVj5tB1DNu6c63DOai1JPQobXMf5lQukazmcHyvD+jMw+p
 lRQEQOUIXghAqYj7MiEjb26/tVtBiVLW08V2hHgG2x/jfv0URDK8gH/VlTmfbmQ1e1zpaoLiO7d
 l9rG4=
X-Gm-Gg: ASbGnctNYqbpN63EePH+ZQ0v/N04En9UuX+78YHa190NT+ekggy7fD7un64AAxcf9UX
 pt54+HQvEZER0xob/LvxLz3augT0dW17eR/URUE+laNbbhLYQjgOSeDTuICcNU99T8KBrDWD8jr
 yDTPQHJt6WMhC3jQtvYCzc68JLr0uhxy9G3PQAfdRkOLD42hz/JKqRDqaoA9+mrDYLGh0nI2G20
 cypnIBpPP9LNrx+IoR2jVcfRiDf1fRrrUj0dJ4YdHoPmLFMx0dY2Cys+u6/3H++1JXAKOkBJXHF
 3r4kJxQzPpBaLTnfBtpkRPSZjGnor5PEQMBlEnHbStp2OwQ6gn0S3gzvnh1yHnTJcM7/LYVmqXn
 wk6+P97DZHBHXeId3x7CAXF3I+78MyGrruFkSwCcSZB2ftbnZPmQfwvpDrvK8/hJa7q+8fR5nGd
 0TXJqtx+b1ITqS
X-Received: by 2002:a05:622a:554:b0:4ed:542:bb38 with SMTP id
 d75a77b69052e-4edf2136349mr211080671cf.74.1763477508006; 
 Tue, 18 Nov 2025 06:51:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGmZ2THZm1IcciqPzEhvC/9B6pEuamD5f3D2VLUr+syZIbxXWrwA0NNhuotIIfSVJJ0UVqDg==
X-Received: by 2002:a05:622a:554:b0:4ed:542:bb38 with SMTP id
 d75a77b69052e-4edf2136349mr211080221cf.74.1763477507541; 
 Tue, 18 Nov 2025 06:51:47 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595804056c9sm4078452e87.90.2025.11.18.06.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:51:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:51:41 +0200
Subject: [PATCH RESEND 2/2] drm/msm/dpu: use full scale alpha in
 _dpu_crtc_setup_blend_cfg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dpu-rework-alpha-v1-2-293d39402b59@oss.qualcomm.com>
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
In-Reply-To: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3889;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=S/lbDFYMKbt7kFl+fZ/HQH44YveonZFk8GY1SvQjVQA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpHIf8IzhHGPLjJDCmR05+bDOeqtvwIVJbo3ALS
 0P22UCukleJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRyH/AAKCRCLPIo+Aiko
 1fRoCACxkXSaH5+XAmMiiWTq3dU4KIgsDLBneucVx2XWIFkRGccgto5n1NEa6bpGrG1Gh8hALED
 hiYud6oxNSdvONQm3DrKPIV0chib34A7uE6KmhqLtPiAqejt7mteS4ml8DHBdb9UYSoOlBgqzRJ
 YQtZGyzsjAtXrSldT7H8CQCyGY1TWGB9qwgY7gkJlbxeOhwKlz76T1wD9RzFNmNsmY4JGliNctw
 8iKd9/mKQrBkOw59cSi9Q5P7/LzK36LXu4vm6FhwHPAgDhTdEV8kGfaWnS+3+9GnLTdilG9q4iB
 kfgHsgdwWsH9BHauqrgOQvVWt+3cgvQncB4vKa6hN7s+yjQ6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExOSBTYWx0ZWRfX3rhe0Dvj1L2b
 1g4B+lv59UO4DdLtCJF1n7Mp7eWFKXHjfRggXk4oFMyHkecOv+EfLq6+oXFEKipBKYstEvlzBIl
 QVN/ldeBnQHA0TPWUKrrGnTt1bEFzKRvDwal8sCC3dKXo3W5yLmcTY3vCp//Jk3zdqROYm5dF4P
 iNExbNd8r/Pl2zEXXCmas4a4VMmPiRVKaOc2j9Q+MmBECxakYvW5a8lyIxj+OPv5gy6Um37cEfv
 Jq1FXobHBNGis2RcGDm3c+vGSy+1Z7n1yKOGrKmOzO2jucu55p2MCkQvgA18DwAtExDEIrliNU3
 zZdewKYXd+uqGt6mX6XQWj2wGhpTbCc3SKOEp6t5+8ebSiHl6WHtUKnXUrY7PRGF82qllukt4PA
 nRKxGo/39HWyTfMQolTvm8hQrcIbWA==
X-Proofpoint-ORIG-GUID: 1WVKM9oXn1jvcEKO0ndlTdZhRxLQG2LS
X-Proofpoint-GUID: 1WVKM9oXn1jvcEKO0ndlTdZhRxLQG2LS
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691c8804 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QNru2a5V_XkHKSg3hPgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180119
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

Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
callbacks embed knowledge about platform's alpha range (8-bit or
10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
alpha and reduce alpha only in DPU-specific callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 16 +++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 10 ++++++----
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 651159e8731194d75b52c05158bfd1c9bad8b10c..a280c136104added1dbb2b432f15680bc1d5bd36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -326,26 +326,20 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
 	u32 blend_op;
-	u32 fg_alpha, bg_alpha, max_alpha;
+	u32 fg_alpha, bg_alpha;
 
-	if (mdss_ver->core_major_ver < 12) {
-		max_alpha = 0xff;
-		fg_alpha = pstate->base.alpha >> 8;
-	} else {
-		max_alpha = 0x3ff;
-		fg_alpha = pstate->base.alpha >> 6;
-	}
+	fg_alpha = pstate->base.alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
 	    !format->alpha_enable) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_BG_CONST;
-		bg_alpha = max_alpha - fg_alpha;
+		bg_alpha = DRM_BLEND_ALPHA_OPAQUE - fg_alpha;
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != max_alpha) {
+		if (fg_alpha != DRM_BLEND_ALPHA_OPAQUE) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
@@ -357,7 +351,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		/* coverage blending */
 		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != max_alpha) {
+		if (fg_alpha != DRM_BLEND_ALPHA_OPAQUE) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
 				    DPU_BLEND_FG_INV_MOD_ALPHA |
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index e8a76d5192c230fd64d748634ca8574a59aac02c..fb8c94fdb829be6f89bfcc6c5a83fdbd27778bf2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -139,7 +139,8 @@ static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	const_alpha = (bg_alpha & 0xFF) | ((fg_alpha & 0xFF) << 16);
+	const_alpha = ((bg_alpha >> 8) & 0xff) |
+		(((fg_alpha >> 8) & 0xff) << 16);
 	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA + stage_off, const_alpha);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
@@ -160,7 +161,8 @@ dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
+	const_alpha = ((bg_alpha >> 6) & 0x3ff) |
+		(((fg_alpha >> 6) & 0x3ff) << 16);
 	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
@@ -178,8 +180,8 @@ static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha);
-	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha);
+	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha >> 8);
+	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha >> 8);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 

-- 
2.47.3

