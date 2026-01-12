Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22665D10777
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 04:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DABF10E299;
	Mon, 12 Jan 2026 03:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhxD+gz6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2Rhi7vo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A1010E299
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:44 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BKs4hp3734270
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AWPQkW6ManqnzeTA+2it+mfHza22MJO4SHb9zehP0EM=; b=HhxD+gz690Gkw35C
 C+5QUVhCp6p55guklKkhEou5UfEYL/HBwzApm6n5kYQG+1sp+XMXwsKRk775YSXe
 K6TIlsP62u5nWPVKAlUmaoFg0wbYYdD1SSpq6K0m3HOd4fgKgp2uIyNQ+HqRBfWv
 poxCKSyAfh44wM2+KW3D5VTyrzSNL/3eqmrlK1y46wNoABFSVY75xXQdSPTukLyP
 yTppD+pefGMq2s0jxz3IMU0tLVCbWpUYfVnwc/D8khRJEt2+rs+8JT9GYS1ul1sN
 k4Pk0XkLG1JkvkJMd3PgBxrciwPS3oz4VqbUwHrrgL4O4S3EFo5qLLLysM+V10sJ
 //gS+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkeuskbf2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8bb3388703dso2452791785a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 19:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768188223; x=1768793023;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AWPQkW6ManqnzeTA+2it+mfHza22MJO4SHb9zehP0EM=;
 b=S2Rhi7voTkFmKyzBojPv/DUhQ12m+0Sv/tXtTwgjYebJiuKbQgf8a3vtS4abKYozu9
 3pqR2uQQ60k1A6N7eepJvjTfpxRlaQixjy3BXgtMSnxAjXeiw1FpVQfZrPquWF8RTXON
 rg8outXPqPBEswYSoGVYYAVUqtizxEkOjfPI9ksl5J5jEfwTE9i5AoYqa9b14Sa5IkEw
 Z9639uNCtTp9xBqiGH+Ma0MxodvsZvnmjFsCAS/rCn2MZkzjFMNSd12SfVi0URrlPgtc
 mXcgYeNXXUqdWUvgmna2GJj8zRXQHhPllPqKR5j0SzyWE/lxcjAX/LGu7dil++OyGWjn
 74Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768188223; x=1768793023;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AWPQkW6ManqnzeTA+2it+mfHza22MJO4SHb9zehP0EM=;
 b=oxrSH4F+WKkOztH2r4+ZtXzvI1KEyjW8L9BsaWSyzcusniN0tf2EVUCDKt+qxlDww0
 DjoDdADbqDF5LGMP4w0R0een5r9APKLrohfxlSFArOJf9vqtXN52TyPACodKFjkKGcUC
 M3q96RCc44dMYK1/IM1tvVatEspH/Aa37GneRT6SaBPwLRa1N6iyeY717Ei1DUSr6fee
 Upie3wEjMObqGAjJljV+E/KOTRVdIGN9SrV5qAFz69spDYSPmOGXdzCK8bs/k/iZw4vW
 6hf8IePuxIyjZl4HEFULLQeXbMV+opvyrR16mKRWbCCiWtbqHMMmDlYyKbydwRbmUMAN
 VGUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWx12jPQ8AzL5S+7uBdbaU/bdpyU/MHyC40OHBjeeMdZoSVr/ipBL/pDJYJhekt1rrwAPknBA5kT4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9kl7lZVR75Rf0AzEwuAPSygzZgVZUqec60/+AUZjbCTduVWGK
 ZiWc3S5Hbcz1IJcPMSgVcFoYfgC+L/AJ3eJkig/D4v7q8GYrpoWSKQrqNMYZRaf9zqNxgnOFdpV
 QSOBGJgGLdi6J8AgtbSXrXzYyxu1jx+weuUD0VbrGZlxfx/0LVD6Bo9+bs5WV1Rg/49saBtA=
X-Gm-Gg: AY/fxX5QyKBvdzbS6hkganJPBApKHkjndzAMj+COH0dCJWmOtpexo18fU2yvfuAGKZI
 6bxpdWrzkhJnYfGB4QfR8Soox3U44nVw/HNrp1TtDMH9MGS95u2mmXFCZySxl+odBxKWr7PY7ld
 aLBk8omiDCAHgZ68rrKMH/Pl6qd0ydMyRRB2q7ZEkSBYfUiSg4DGtZpu2yyBliqgekGUfwp5UWA
 cGLDGW/+JNF7Nv8HhKO2W4l8UeRPTEar8uRp9LBwHwmJB89KCe+iAKtdR64+YxbBPts/D8/vwm/
 sR/SuBVgl99shqNj1LOQTciAcnyo2snVXgF4dyw/4/ePD6BIpn/28ScidTCz6JHBtyyzev5Pd+z
 aItbM/2AiUwk2hEQdV5OAK7yKdb6gpTACUOxMxDtu9291lvtgcskBJbirMlF6M854hIG26KvuSJ
 1lUaU17r7n0Y8gqJHywaVXVvc=
X-Received: by 2002:a05:620a:4541:b0:8bb:a06c:2610 with SMTP id
 af79cd13be357-8c3893f504dmr2386522285a.57.1768188223122; 
 Sun, 11 Jan 2026 19:23:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkwq+L94YOuPHViATz0Y3xI2gsPvs0GF5XC7iZYoiEC+/UGQquo2RxeOAPhT+SPy0pgNabZA==
X-Received: by 2002:a05:620a:4541:b0:8bb:a06c:2610 with SMTP id
 af79cd13be357-8c3893f504dmr2386520885a.57.1768188222730; 
 Sun, 11 Jan 2026 19:23:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b7c2dd9e2sm2373045e87.5.2026.01.11.19.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 19:23:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 05:23:31 +0200
Subject: [PATCH v2 2/2] drm/msm/dpu: use full scale alpha in
 _dpu_crtc_setup_blend_cfg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-rework-alpha-v2-2-d168785911d5@oss.qualcomm.com>
References: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
In-Reply-To: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5356;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wVzgQvj4XKBtkSLhvRIrDRSYnT6jGkVdSMihboRjAGk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZGk0nqmrZXcI8g9JEWG9kqjQWiUqm4blxk4KX
 D8YedEddQ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRpNAAKCRCLPIo+Aiko
 1VUbB/928UmgbNSFQOdbBS355affEJPu8oHSvNiHbmf3wVEWKPNncCUQ6vGP8vznO5DZOX16i82
 UW+EpOeGha1lj9kFV6V3en2jejc/THJaBL6DCrclQaPkxKtvKlO4VvU2J/MX8IETP1f4+Ntx9pS
 RoTQQjKi3iPEiffc4GcteQOqfvzxKf2xYBblBsBZkYa5SUuzYcb0+F+Xjf5N2W9mcFz96990QVC
 YmO3giRvHYknronhY/8UZ3VzDPsnFoUvKq7UpCs1DTYJYCl4UPKmuzJyu0qOSzNLXmEvLvGmEow
 Rab71nSjAVGDKRowKla1ykWb2Y/aK4vT9B5ORM7CWYYXgC+G
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: vlnsuGpQTrjkEB0uQXEhilY3NmMuV8cH
X-Authority-Analysis: v=2.4 cv=GNMF0+NK c=1 sm=1 tr=0 ts=6964693f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9g_qaOd13HrosajSYkoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: vlnsuGpQTrjkEB0uQXEhilY3NmMuV8cH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNiBTYWx0ZWRfX1+ciprnPMLdO
 scNkVZ9J25WD4bEfOFiu0/ZxqNV8yeMh/Nzl9znp+gCehbzUEGMJQBcN09aRIEELNLwjXgzB/IT
 law6fhV9Frdzb9I9UxL+CHMwJzEH+6yKXVe4D1x7lvDlfwLoTfA+erLlDebo9g9SBv3umm2F2rV
 /ZtIUb9uqzmLux/c+Lq42bb4YOUrLfO2zPwl+PkNcO1Aop+67rTZaZT6++u5z9+bt1siBxNH3wp
 zUxUtuCJtlstI7gFqYwMgn2/NerzH0sOOjx56h5D9mAQtjfIlwoZyy+SgHJaCLriz2EteFdDjPC
 fix/ohqFWqAmR1ptM5oBOrPSDtieZOCpHbcf+aQwPfWsTSvnyBdy0R0470BfNw9B6vZBM59iTRE
 PmJdwC2b39l7rp2EYIXlEsVRUDqY0iQj3ZKYsTh5JaxSzUQ52wpNnE/81n8JP9uS/RBq8MqHvtU
 yoPJ+idjyyu/hOurYaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120026
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 21 +++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h |  2 +-
 3 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f6827ed71f4e..61af96fdd7e0 100644
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
index e8a76d5192c2..b7779726bf10 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -126,7 +126,9 @@ static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
 }
 
 static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx,
-	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
+							u32 stage,
+							u16 fg_alpha, u16 bg_alpha,
+							u32 blend_op)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	int stage_off;
@@ -139,15 +141,16 @@ static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	const_alpha = (bg_alpha & 0xFF) | ((fg_alpha & 0xFF) << 16);
+	const_alpha = (bg_alpha >> 8) | ((fg_alpha >> 8) << 16);
 	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA + stage_off, const_alpha);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
 static void
 dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
-						u32 stage, u32 fg_alpha,
-						u32 bg_alpha, u32 blend_op)
+						u32 stage,
+						u16 fg_alpha, u16 bg_alpha,
+						u32 blend_op)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	int stage_off;
@@ -160,13 +163,15 @@ dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
+	const_alpha = (bg_alpha >> 6) |	((fg_alpha >> 6) << 16);
 	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
 static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
-	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
+					 u32 stage,
+					 u16 fg_alpha, u16 bg_alpha,
+					 u32 blend_op)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	int stage_off;
@@ -178,8 +183,8 @@ static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha);
-	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha);
+	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha >> 8);
+	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha >> 8);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index ecbb77711d83..380ca673f6de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -41,7 +41,7 @@ struct dpu_hw_lm_ops {
 	 * for the specified stage
 	 */
 	void (*setup_blend_config)(struct dpu_hw_mixer *ctx, uint32_t stage,
-		uint32_t fg_alpha, uint32_t bg_alpha, uint32_t blend_op);
+		u16 fg_alpha, u16 bg_alpha, uint32_t blend_op);
 
 	/**
 	 * @setup_alpha_out: Alpha color component selection from either fg or bg

-- 
2.47.3

