Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D6CC5B328
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CA710E9A6;
	Fri, 14 Nov 2025 03:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvqLUUJ6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8Yxo/Ks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FF410E9A6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:56 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMatXQ1686513
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VssKN6Sifi0waF9P44yLAfWMYEsEhVY78u7bczlXMVk=; b=nvqLUUJ6kfKXdIMF
 6b3xDMClSG5WRE4jbio45LQeQQAKk5TWGzeWqwX3JSiVcVMHuJSiHjsKc3L3NB+/
 WYU+QEOW220dI6UHBqTRIakYQRmFeJ4Nd0hVAhOz58BsOekDweq2JAhm7eFgRpI+
 kULvYU37XJkfxSagplxlTvVuMIz5qh1qRN5qyjPdENzh5+vXJTUp2h8pSWuIF2Aa
 7qBIGyj4JLK4uxpWfMfpQcJfRMErwAPiKyHZaIcsmVzP/OCskVuPpKuNuxtIXhY/
 TiY91S+GY+EvCkLIFYD0/EbuUE2Fpvp1Qw/ez+u29oQr45vaUiVaZlKHE0MLBg5f
 fOQZ0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0pja-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4edb3eeae67so53592581cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091835; x=1763696635;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VssKN6Sifi0waF9P44yLAfWMYEsEhVY78u7bczlXMVk=;
 b=H8Yxo/KsWuCgJps5h32fHMFnwYqXbPj2De9mWiSsRozpoOB3w389jjlS9VRW2V8y5o
 i8bsU6XA32N5yale9ZzqcRdmjL3boWnHXBkNXJQ7Wgzn6ZVRPjab9jE91T4evDmuZxWl
 awMr5Pr9qcjbK0pCvuE71bqLBxktc88jmV28Ft/CYjq4GZojAdEfbMitZrXptG7CHWV9
 WmjwTZqe/yyrA4Qt0tOZolrRDPtHYGP9o6WHdNS9gabvi34JkIGdjBn3CPkug4d1cShy
 mzPlbUFH4K4my7dtenMg6dOZR977ZfVqk1BKtaB4wzehwoV/HZ6kfNTTZbFJseM+0r2k
 QFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091835; x=1763696635;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VssKN6Sifi0waF9P44yLAfWMYEsEhVY78u7bczlXMVk=;
 b=ESNYWmth0WioBj1OOrnW/aZYJg0EzgDHn6pxyJTtj7dNxUZGe5b6Ot+I90Eo4IUAxT
 pZcS9Al6sahBWe2CQPddJ4K3bpap5gXa86e48BkMKaofAeKsydHbiYa0WFDt9wnAo+xF
 HcNFKtIL0tVYOUgPlI+/3OTiiOlE+bu+kFWIcytZKMaQz9NRMjB9RqInAU2MYQkN5XDM
 t6xvOy5sp4+5cZOECz5iwRNsYKtlGqRJZ0KsDg0UTkxMcF4R4PU2cl20Ryd3R4SZVUSX
 CAd8dlBkVoL10SQ8anjH8wnflTZO+0NNRw1p7W8IY+tSlXAzo67OboW1Ww+Gp9gFpvcS
 7WKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXREWl5nCS1DRcz0Rjgn8HBWc/guXJ29dqHXYEv3xTv3fuccTBP0YOH5O6GDqjL+jbWZVYYzLlwFKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3RQDzSGXwfkm7tt8ou+0a9eAE3rmUO8KZLE55WRmiK9vmo0C4
 rqznaPs729sC6U2sDBxJJ6nSm5Uos7hgfmeey+qCrETv5ZAS/Tenu8H1E25bc4NgyXvzKdUYIUv
 aqM//KngUgiZbueyPUp+erRUT/HaZ6xybTjpWEORj4CVYKn76JVnpHx4uwJAuwZbpr4/cUoU=
X-Gm-Gg: ASbGncsYCsbR4UmoM+dvXeu6ioyjxPSLbkQeUNM34rJ0YcqD4cxoY5r+duN+KR+snuZ
 QhkOZY1PDzdxe2P4/1QoodB+cVZOIgJHa/MULACaXQgPRTNOzZvyVS+aCDq7K8IGim+1GK7Coaa
 9DYMQw6dHnLQ4pPnQAx89yyvIJpYi0RZd7rSOaTUdrqRZP3dzNMa38XhBoe7z+z7nUXECADshVU
 G/XBADqnFhNVOBU2/KYn4Ipyp8ZqCEiHsfTv6l9l9hqm8YwGUIpMYTSEUUfAdG7AJb3cz83HncA
 eidQs8OJQiknmYb5OQiRNLOrKQLO/gnzl7VG1TyddPUNj1IuggTyClEyogGOrBlMB7CKNITXeVS
 pWbtJCFxGMVXjefK1GFlaBmv2nNuStmYUWHjDSZyscevBgQgeBbOlbkZpwNAs1FQfuTRDn9qkeO
 n9CAtTboB+WbrR
X-Received: by 2002:ac8:59cf:0:b0:4e8:b446:c01b with SMTP id
 d75a77b69052e-4edf212eb18mr28250541cf.61.1763091834655; 
 Thu, 13 Nov 2025 19:43:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6pNRPl/T3C9NOLtp2Y6CMfEZudfE/w/zfWdDtkzq8zYUchFZXPbhnuWwt+klHR/h2SWE8bg==
X-Received: by 2002:ac8:59cf:0:b0:4e8:b446:c01b with SMTP id
 d75a77b69052e-4edf212eb18mr28250301cf.61.1763091834093; 
 Thu, 13 Nov 2025 19:43:54 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:43:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:34 +0200
Subject: [PATCH v3 07/12] drm/msm/disp: pull in common tiled YUV format
 parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-7-cae312379d49@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3285;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L3cuMpvZrODm9ou9XwGWI5E1+eCfCXPevZkiItqJ8xY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVl75APmQT6bdKu3LUHVA6hbd0R/XuXy63Jy
 bscVZzzXs2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZQAKCRCLPIo+Aiko
 1cJYB/9lV1mW14pxF9PQ0KzXjklHZYmd3qbDxVDzttICvyd9Gj70kU3WK1lZTd6Cn/AbVHWdO9K
 65ZwBhSYnio9gIv2rCj177tC7obYiDpX1XE3PmlICo0Pyap2pKiq8/RWxDRx7TfVEttBIq3cpT1
 ZDKJDBPQd9vDcAkHBkpplAQobz15rhGscDHe+9gzR6osDk55tVogMAzEqKXhaWvb1YsTkNbjhls
 HvNFXdSFzJ6Jx31rL5727eOpf2L8gI5Cb9ylgLkkG3u/BkgF1GEctjGqXcbWErWjfMU2VWHrkys
 u+ktZKtolAPEtBs8JgxqlNrdyKyeLA8Bo3J36vgCeovSXH7e
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: jYqdAnxuHwnyFRc426MYzyQ1JgxZbF3a
X-Proofpoint-ORIG-GUID: jYqdAnxuHwnyFRc426MYzyQ1JgxZbF3a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX/Nlb7jqBytGb
 KD3hbJTe8EODhtE72qkPTl4QEv5we66Ogxf250MkbPgHggrSSOIBt/zN9Ww9eh2Ez52mIbsd64K
 h/h+09T0c+KwOUR7VlKjO0kFEY3VegewCeqEJJcKnHYArxy8WT2evU/4//DYhu/yTbDTkFfJ0bO
 FUnPTRLIaMPBYTojlXLB/lfgSLc7dVsLci1st4eP7Jclp9SjHN/T6+rByR2WtaQnY11RSAZG9mm
 OVXET4+cUTOXSgog+bERHB3xdVYdLG1zLbBYFU/G9mpr9cbs6zOxdDhiT1dhWZ2NKbd/nqDfHlQ
 dUFMkwm6L5yslNpn9dCr+RhpwS4/SpOZC58Q0CPztvEuG3MPOLJ2lkWSyfXb7C9WSfOkQUEgzW4
 yuW1PyadfkZwZfdiradexHMj6PG3kg==
X-Authority-Analysis: v=2.4 cv=IM8PywvG c=1 sm=1 tr=0 ts=6916a57b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FCw1dLDEiFPyt24oSuoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
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

Pull common params of tiled YUV formats into corresponding macro
definitions, simplifying format table.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 900b2de252a6eb2eac3d0670f1aaa77f7520fd77..5a1efbd99beeaf454f726e2824cb26d2bf31cf22 100644
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
+		 MSM_FORMAT_FLAG_YUV |                                    \
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
2.47.3

