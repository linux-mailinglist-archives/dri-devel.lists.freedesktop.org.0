Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D840EABAF7C
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 12:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C0810E2BF;
	Sun, 18 May 2025 10:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RABYTc8V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3976710E2B6
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:35 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7LlM1018103
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fE9TciIlbrG+TUwU2UmYZFgXyzSTuad5frGi4HFWObs=; b=RABYTc8VuSVRFmyG
 hPilD20K/z6/IfQB/LHBEsypfVsqrthiz9zIJ3TLjvnOGB4fYt/Ob5b9sDHOwFP3
 VXD7D7RmrmxkSaYESdjKwFwQ622gzO0FbqYkQcU77ZdPKbG3x4h6o3Jzxk4BKpFN
 CPqW+sQ4E2OjEPoENvitKz+nI6+aOutOhetvtsTlUDZN1Dx7594rQoAdmSAgbAcm
 tbg4gnb6EK6opjXpno9/xwaXtELwXeMaA6P81pTmWSAazCTWF0CWMtUDzfwu9Xnb
 qSwNck5m/DBVZrxp97PxCV9SR1Mj42LyuFwuhWDqIRojWSSOYy+TsHhqdYW/PWy2
 MM0gwQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4sve9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:55:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f6ee43c4a6so100521986d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 03:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565732; x=1748170532;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fE9TciIlbrG+TUwU2UmYZFgXyzSTuad5frGi4HFWObs=;
 b=BthkEPSs7eaTy45fk3NRO3n153zVhZrr1fLi1qR7aEpuyzs1v3VZxfUcoZv7naCMrN
 Lf7XyBHE1j0GzSJeof31wJtXAQxd79R78ZcjuPUzqOrSV6gpL8uPmvhxcS6vEiWrG3oF
 wjEteg98oiGXXpS68/PyQ0VKt3n8MHEAwUvr2yp+d8UVWJFV7frwyOfa9uJZPwk7DLIV
 qG8toU21I+6PpuRt8woNhOsnJ4XGIQn1SdvaSS1o1TxgEv12G9P4yq+edG93r0vn06aQ
 C1GAqQwifGwaRFuKidy9D2nYaNQZOZgiSfWRppbr+finV8upYodgwYK0liuNFcRjzI6c
 tk3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBgiHXPqMOFo12haPoOGD4mHQC9aDxG1n2ywvvV0LU7+2DCtHm9t1zJGsoy1BoDcWTEAqoo2vze9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4CrV+xLG7crZET2lwlAYBooygIxL3v+gGKiCJu9hel/RiQRkH
 6cksULheFUnFDL124eTaH+7+FC6ezRmhkw/NZAGPsvgUoTeaofU/9EG6kcwLZPiTUZpPNyEJXJy
 ythC6rsv+eTXdrbCYaxVQN5quOOApuLbO2uAl7vBavVFRKuC9aYGea2opwsITpmmOghFHxvU=
X-Gm-Gg: ASbGncuyoBoQgt2rAwwBYPubNkGt26/by2sQz8nzwocL08gPkWpNisdu+l+pYvPJKNh
 gdLI8iqpmneRr4raoHikIqd1xNumqPcxwmDNxl6fzhHGLH0/NHC/LqsyiL0TGVKA5wbbimoodMc
 VNXbGq/jmB18SduKBo2iJpQ3uKd0YshgXCsk+rlvH+4BP9pHhwgr7RXusxeaiX2lMx+Kw0/elHN
 E63M5fiBgiRblbZkKxz3kLii2z/Y6ny/wDCFZqaxNnVg9jiiblkDkPfD7T2Rp94ZDxODcpJQSIB
 qfcsPxE8MV7OxyVW6DruWEd3Ov0wP/P1BhemmiWHwUPkdLWqecc4wGW/mELssb3AhLWD78P1U7H
 vyYfaATrLOO2i8zlf8K5WxKMn
X-Received: by 2002:a05:6214:2403:b0:6f6:33aa:258b with SMTP id
 6a1803df08f44-6f8b2d44cb2mr140231846d6.45.1747565732310; 
 Sun, 18 May 2025 03:55:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJgLRVfbUWPLSxAHbSuVGPlRHdL/xg3nZ98NL4KxaHnLoiC2jQYj+C83Rp8Yzl1Hp/RjiH2A==
X-Received: by 2002:a05:6214:2403:b0:6f6:33aa:258b with SMTP id
 6a1803df08f44-6f8b2d44cb2mr140231646d6.45.1747565731890; 
 Sun, 18 May 2025 03:55:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:23 +0300
Subject: [PATCH v3 05/11] drm/msm: move KMS driver data to msm_kms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-5-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15386;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TxKOzjHBoD8sw3I6PbHEwgWyuMYz2AaynsL3j48fDYA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyZDYE8LAxHPsrxvP+CDss+1cIXfFUK5RF2s
 fFtRHUTxHSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mQAKCRCLPIo+Aiko
 1RV4B/9yz2OdXYIb5ZVBHitunnOslnwLHw6jUE0gQ78Ayi+b5CXGuK+kO5wUvf5S4YeWyS9PJ7y
 8J8Jz6B/KxnvK12XTIUukYheOXgxy9uqatg8F7NNyi7pI16L/hRX5P1orls17x0HzESn5M/RXGo
 pPcePR0iQ9TwRDgrBO3e5HflbQACYEhxcN6TeC8BM1cQjfUZrzTDs3pFIU55giUtyXPbrHXl6Ea
 212bNfzf0EZZrnrSGxDULm1rkP3vLga83cpC4ymzLWamg6JawDvzk3lj9Gm1FkWlM/xl+G0tLuP
 vXJNRPgRWGXHSRJiajdyEPsfi61n34sWKCnZjz9gYjRkAdZq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=6829bca6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=472Qx-lKBLW_CYKAQVMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XHh1-2cA9cEu1cdp5E05BFGly6lqcuki
X-Proofpoint-GUID: XHh1-2cA9cEu1cdp5E05BFGly6lqcuki
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX+a4rUuERK0Pv
 sSS38PFQAe16oaVkFnkLi7PbgdM0ZamSwuxVZfQgO0V6l+sO7ciJKP7Ph4QvFDfZ3hsN69dMHgL
 OWHwOeM0K5oMWTtz/UY5f8EIlZO2l1d7xbgLxL3FyvXmmZ2dIwZPdlgy2fWVMGeE86H4fA5oGTe
 z/xAHmtLd693GpYVyuBGl3rGEWU0/W5c1Iijtx0q23k4mvxfNVnr84xJKryRuBG9pOKKpsh2Ufp
 2ceIZeBQmpZFDfPq6lMFnrvQKDEN2wSTESUmv9kX1DbyLtohi70/6u511yBmrgeRgNc92JNutos
 SGpiQ6qcdxbCupKSjl4j9Y8lQEeKbv5+siXQ+8XXh5pCBSG1UH2xsLho7wpej1wJi2za7GGkfyt
 jt/cV6kU5V8BZF8lHABPoa9q3JEduIAGqmVT8EQqjreKJjP3B1UkHuuqhTUnrHAQYRmxcBhX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104
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

Data for HDMI, DSI and DP blocks only makes sense for the KMS parts of
the driver. Move corresponding data pointers from struct msm_drm_private
to struct msm_kms.

Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       | 11 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 32 +++++++++++------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          |  8 +++---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c          | 13 ++++-----
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 12 ++++-----
 drivers/gpu/drm/msm/dp/dp_display.c               |  6 ++---
 drivers/gpu/drm/msm/dsi/dsi.c                     |  4 +--
 drivers/gpu/drm/msm/hdmi/hdmi.c                   | 13 ++++-----
 drivers/gpu/drm/msm/msm_drv.h                     | 11 +-------
 drivers/gpu/drm/msm/msm_kms.h                     |  6 +++++
 10 files changed, 57 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1aaed1cd9ec58fed3230acda4c283f0eedf3a9f0..f661eec7b4d559dcaae8bef10da006510412d88d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -264,7 +264,7 @@ bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
 	mode = &phys_enc->cached_mode;
 
 	return phys_enc->hw_intf->cap->type == INTF_DP &&
-	       msm_dp_needs_periph_flush(priv->dp[disp_info->h_tile_instance[0]], mode);
+	       msm_dp_needs_periph_flush(priv->kms->dp[disp_info->h_tile_instance[0]], mode);
 }
 
 /**
@@ -283,9 +283,9 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 	index = disp_info->h_tile_instance[0];
 
 	if (disp_info->intf_type == INTF_DP)
-		return msm_dp_wide_bus_available(priv->dp[index]);
+		return msm_dp_wide_bus_available(priv->kms->dp[index]);
 	else if (disp_info->intf_type == INTF_DSI)
-		return msm_dsi_wide_bus_enabled(priv->dsi[index]);
+		return msm_dsi_wide_bus_enabled(priv->kms->dsi[index]);
 
 	return false;
 }
@@ -647,7 +647,7 @@ struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
 	int index = dpu_enc->disp_info.h_tile_instance[0];
 
 	if (dpu_enc->disp_info.intf_type == INTF_DSI)
-		return msm_dsi_get_dsc_config(priv->dsi[index]);
+		return msm_dsi_get_dsc_config(priv->kms->dsi[index]);
 
 	return NULL;
 }
@@ -709,7 +709,8 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
 			topology->num_cdm++;
 	} else if (disp_info->intf_type == INTF_DP) {
-		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
+		if (msm_dp_is_yuv_420_enabled(priv->kms->dp[disp_info->h_tile_instance[0]],
+					      adj_mode))
 			topology->num_cdm++;
 	}
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 4b95fbbda8e120c1eb86a23e5397db30145d505a..4b85598104afbbfa52c7ee7529f9da403dabc10d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -582,7 +582,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 	struct msm_display_info info;
 	int i, rc = 0;
 
-	if (!(priv->dsi[0] || priv->dsi[1]))
+	if (!(priv->kms->dsi[0] || priv->kms->dsi[1]))
 		return rc;
 
 	/*
@@ -593,26 +593,26 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 	 *
 	 * TODO: Support swapping DSI0 and DSI1 in the bonded setup.
 	 */
-	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
+	for (i = 0; i < ARRAY_SIZE(priv->kms->dsi); i++) {
 		int other = (i + 1) % 2;
 
-		if (!priv->dsi[i])
+		if (!priv->kms->dsi[i])
 			continue;
 
-		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) &&
-		    !msm_dsi_is_master_dsi(priv->dsi[i]))
+		if (msm_dsi_is_bonded_dsi(priv->kms->dsi[i]) &&
+		    !msm_dsi_is_master_dsi(priv->kms->dsi[i]))
 			continue;
 
 		memset(&info, 0, sizeof(info));
 		info.intf_type = INTF_DSI;
 
 		info.h_tile_instance[info.num_of_h_tiles++] = i;
-		if (msm_dsi_is_bonded_dsi(priv->dsi[i]))
+		if (msm_dsi_is_bonded_dsi(priv->kms->dsi[i]))
 			info.h_tile_instance[info.num_of_h_tiles++] = other;
 
-		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
+		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->kms->dsi[i]);
 
-		rc = dpu_kms_dsi_set_te_source(&info, priv->dsi[i]);
+		rc = dpu_kms_dsi_set_te_source(&info, priv->kms->dsi[i]);
 		if (rc) {
 			DPU_ERROR("failed to identify TE source for dsi display\n");
 			return rc;
@@ -624,15 +624,15 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 			return PTR_ERR(encoder);
 		}
 
-		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
+		rc = msm_dsi_modeset_init(priv->kms->dsi[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
 				i, rc);
 			break;
 		}
 
-		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
-			rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
+		if (msm_dsi_is_bonded_dsi(priv->kms->dsi[i]) && priv->kms->dsi[other]) {
+			rc = msm_dsi_modeset_init(priv->kms->dsi[other], dev, encoder);
 			if (rc) {
 				DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
 					other, rc);
@@ -654,8 +654,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	int rc;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
-		if (!priv->dp[i])
+	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++) {
+		if (!priv->kms->dp[i])
 			continue;
 
 		memset(&info, 0, sizeof(info));
@@ -670,7 +670,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		}
 
 		yuv_supported = !!dpu_kms->catalog->cdm;
-		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder, yuv_supported);
+		rc = msm_dp_modeset_init(priv->kms->dp[i], dev, encoder, yuv_supported);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			return rc;
@@ -688,7 +688,7 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 	struct msm_display_info info;
 	int rc;
 
-	if (!priv->hdmi)
+	if (!priv->kms->hdmi)
 		return 0;
 
 	memset(&info, 0, sizeof(info));
@@ -702,7 +702,7 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 		return PTR_ERR(encoder);
 	}
 
-	rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
+	rc = msm_hdmi_modeset_init(priv->kms->hdmi, dev, encoder);
 	if (rc) {
 		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 		return rc;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 99ca1d6c54b2c24cde39de44bb55151576dbe188..2bb93754925c31f515a56b842da122a9e0376638 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -249,9 +249,9 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		/* DTV can be hooked to DMA_E: */
 		encoder->possible_crtcs = 1 << 1;
 
-		if (priv->hdmi) {
+		if (priv->kms->hdmi) {
 			/* Construct bridge/connector for HDMI: */
-			ret = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
+			ret = msm_hdmi_modeset_init(priv->kms->hdmi, dev, encoder);
 			if (ret) {
 				DRM_DEV_ERROR(dev->dev, "failed to initialize HDMI: %d\n", ret);
 				return ret;
@@ -263,7 +263,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		/* only DSI1 supported for now */
 		dsi_id = 0;
 
-		if (!priv->dsi[dsi_id])
+		if (!priv->kms->dsi[dsi_id])
 			break;
 
 		encoder = mdp4_dsi_encoder_init(dev);
@@ -277,7 +277,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		/* TODO: Add DMA_S later? */
 		encoder->possible_crtcs = 1 << DMA_P;
 
-		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
+		ret = msm_dsi_modeset_init(priv->kms->dsi[dsi_id], dev, encoder);
 		if (ret) {
 			DRM_DEV_ERROR(dev->dev, "failed to initialize DSI: %d\n",
 				ret);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 5a706be17e2e5af2148366eacdddb378b2f69dbd..87c2f7daa229dd936e0a43fd04e362b41a68478a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -311,7 +311,7 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 		DRM_DEV_INFO(dev->dev, "Skipping eDP interface %d\n", intf->num);
 		break;
 	case INTF_HDMI:
-		if (!priv->hdmi)
+		if (!priv->kms->hdmi)
 			break;
 
 		ctl = mdp5_ctlm_request(ctlm, intf->num);
@@ -326,7 +326,7 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 			break;
 		}
 
-		ret = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
+		ret = msm_hdmi_modeset_init(priv->kms->hdmi, dev, encoder);
 		break;
 	case INTF_DSI:
 	{
@@ -334,14 +334,14 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 					mdp5_cfg_get_hw_config(mdp5_kms->cfg);
 		int dsi_id = get_dsi_id_from_intf(hw_cfg, intf->num);
 
-		if ((dsi_id >= ARRAY_SIZE(priv->dsi)) || (dsi_id < 0)) {
+		if ((dsi_id >= ARRAY_SIZE(priv->kms->dsi)) || (dsi_id < 0)) {
 			DRM_DEV_ERROR(dev->dev, "failed to find dsi from intf %d\n",
 				intf->num);
 			ret = -EINVAL;
 			break;
 		}
 
-		if (!priv->dsi[dsi_id])
+		if (!priv->kms->dsi[dsi_id])
 			break;
 
 		ctl = mdp5_ctlm_request(ctlm, intf->num);
@@ -356,9 +356,10 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 			break;
 		}
 
-		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
+		ret = msm_dsi_modeset_init(priv->kms->dsi[dsi_id], dev, encoder);
 		if (!ret)
-			mdp5_encoder_set_intf_mode(encoder, msm_dsi_is_cmd_mode(priv->dsi[dsi_id]));
+			mdp5_encoder_set_intf_mode(encoder,
+						   msm_dsi_is_cmd_mode(priv->kms->dsi[dsi_id]));
 
 		break;
 	}
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 07a2c1e872193bc96172c84142bd4ecc93a95a1c..071bcdea80f7114308e5a1e1a989ad0f064a09d2 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -127,18 +127,18 @@ void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
 	priv = drm_dev->dev_private;
 	kms = priv->kms;
 
-	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
-		if (!priv->dp[i])
+	for (i = 0; i < ARRAY_SIZE(kms->dp); i++) {
+		if (!kms->dp[i])
 			continue;
 
-		msm_dp_snapshot(disp_state, priv->dp[i]);
+		msm_dp_snapshot(disp_state, kms->dp[i]);
 	}
 
-	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
-		if (!priv->dsi[i])
+	for (i = 0; i < ARRAY_SIZE(kms->dsi); i++) {
+		if (!kms->dsi[i])
 			continue;
 
-		msm_dsi_snapshot(disp_state, priv->dsi[i]);
+		msm_dsi_snapshot(disp_state, kms->dsi[i]);
 	}
 
 	if (kms->funcs->snapshot)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ece184d20c0f8bffa3c2a48216015185d6cbc99e..acf126025f47589410a69e0b21c392854873d544 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -277,9 +277,7 @@ static int msm_dp_display_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = priv->dev;
 
 	dp->msm_dp_display.drm_dev = drm;
-	priv->dp[dp->id] = &dp->msm_dp_display;
-
-
+	priv->kms->dp[dp->id] = &dp->msm_dp_display;
 
 	dp->drm_dev = drm;
 	dp->aux->drm_dev = drm;
@@ -313,7 +311,7 @@ static void msm_dp_display_unbind(struct device *dev, struct device *master,
 	msm_dp_aux_unregister(dp->aux);
 	dp->drm_dev = NULL;
 	dp->aux->drm_dev = NULL;
-	priv->dp[dp->id] = NULL;
+	priv->kms->dp[dp->id] = NULL;
 }
 
 static const struct component_ops msm_dp_display_comp_ops = {
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 2962158776135d6e3c5b119bf4341c135c8f5248..d8bb40ef820e2b8c8ac933ca01e1dc46f087a218 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -136,7 +136,7 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
 		msm_dsi->next_bridge = ext_bridge;
 	}
 
-	priv->dsi[msm_dsi->id] = msm_dsi;
+	priv->kms->dsi[msm_dsi->id] = msm_dsi;
 
 	return 0;
 }
@@ -148,7 +148,7 @@ static void dsi_unbind(struct device *dev, struct device *master,
 	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 
 	msm_dsi_tx_buf_free(msm_dsi->host);
-	priv->dsi[msm_dsi->id] = NULL;
+	priv->kms->dsi[msm_dsi->id] = NULL;
 }
 
 static const struct component_ops dsi_ops = {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 248541ff449204c72cd444458dadb9ae4a0a53d1..9970176d74302964dc80e4eb5b9149161667cfc3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -14,6 +14,7 @@
 #include <drm/drm_of.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
+#include "msm_kms.h"
 #include "hdmi.h"
 
 void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
@@ -253,7 +254,7 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 	err = msm_hdmi_init(hdmi);
 	if (err)
 		return err;
-	priv->hdmi = hdmi;
+	priv->kms->hdmi = hdmi;
 
 	return 0;
 }
@@ -263,12 +264,12 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 {
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
-	if (priv->hdmi) {
-		if (priv->hdmi->bridge)
-			msm_hdmi_hpd_disable(priv->hdmi);
+	if (priv->kms->hdmi) {
+		if (priv->kms->hdmi->bridge)
+			msm_hdmi_hpd_disable(priv->kms->hdmi);
 
-		msm_hdmi_destroy(priv->hdmi);
-		priv->hdmi = NULL;
+		msm_hdmi_destroy(priv->kms->hdmi);
+		priv->kms->hdmi = NULL;
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 09d5f57e9343cce404d4f8a3a6d8a285f662f60f..5ec129bf6a9c83ec8e3d5b667411dd0917a76582 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -88,16 +88,6 @@ struct msm_drm_private {
 	/* subordinate devices, if present: */
 	struct platform_device *gpu_pdev;
 
-	/* possibly this should be in the kms component, but it is
-	 * shared by both mdp4 and mdp5..
-	 */
-	struct hdmi *hdmi;
-
-	/* DSI is shared by mdp4 and mdp5 */
-	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
-
-	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
-
 	/* when we have more than one 'msm_gpu' these need to be an array: */
 	struct msm_gpu *gpu;
 
@@ -356,6 +346,7 @@ static inline const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
 }
 #endif
 
+struct msm_dp;
 #ifdef CONFIG_DRM_MSM_DP
 int __init msm_dp_register(void);
 void __exit msm_dp_unregister(void);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 26cbb662e7533fdfd55fb7f200b99c79c3fd3211..14762b39edca381c817fa509d0d1da6f535e5da7 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -131,6 +131,12 @@ struct msm_kms {
 	const struct msm_kms_funcs *funcs;
 	struct drm_device *dev;
 
+	struct hdmi *hdmi;
+
+	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
+
+	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
+
 	/* irq number to be passed on to msm_irq_install */
 	int irq;
 	bool irq_requested;

-- 
2.39.5

