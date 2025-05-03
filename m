Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D865AA7F17
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 09:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290E210E37B;
	Sat,  3 May 2025 07:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0NPd5PH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E14F10E37B
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 07:17:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436cA4E030868
 for <dri-devel@lists.freedesktop.org>; Sat, 3 May 2025 07:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fE9TciIlbrG+TUwU2UmYZFgXyzSTuad5frGi4HFWObs=; b=K0NPd5PH/X2RbfJl
 Ez8YlnqQMDuve1m19MVbFJKkGJ1/Hg44xWcJkTN0kgXuw906nOq5GuNL5EOa9UM5
 0i4QqQF0QJMjjKY+SZPLsmtMpL8sBoKakmlDahS6ha4FOfL+Xn8FDTWGxqc6APDt
 WGNXtIVlFbjNZIcwc1AYr1i1J+4MejJI/x0AoTgtqsLA+tFSxq1pCmEVxEDmhRPK
 lxa97AYuyBUNz6vViEbDN5i8CgDF5L8IErwX757hadmmETynuCPJF/xb5ADEnjZi
 CiFqMSU43Rzi3Lt/wKgj3e/DNdts9RgjlGo+ULslp/6LQMOhmqkXLMEbkXSa7AlR
 UYJwmg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh787eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 07:17:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e8f9057432so56704686d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 00:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746256636; x=1746861436;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fE9TciIlbrG+TUwU2UmYZFgXyzSTuad5frGi4HFWObs=;
 b=O11+s3t4jXYdEXoNggiIY6hCugWjGuQ9oO9j0fTA2nYdOrRWSWUt/3dhrMCHOYqvdH
 6l2pIRaOUw620pc9qIy2WxriqA0hAFi0xL8nsji/Xs7mBO7XrgckSGIdwIxCAT2jgQJV
 Lf+XGH4odsbo68CS1KSAaHOjx8WWS9xM8Hxcv/Pi9f8a2hIR8rw/5F1QpQCXfSWWuigX
 CN/f4Z9GyNmP3YfslfqyKtLbGpAe5QPpqfntO84+46EeBpLda6UovRp2JAvE9a1Aglbz
 svHCnL7ysHDxo7bXNYiKc4OKTNLMrKfhaus1N2VYL5UkbmMWFVq03ySeCh3Ys4eiPKzT
 DnKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnntUGVaRVvWK8EwKvFV/AmaX7F3xIz3WXjYhk0gbq8gaHkJUVCNj47G+/5FjnHWCXLjU2Y7YkVu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzueUFd7TGLJyyxIh+xSEhG+w3i31e7813HJEPM+eHprxM27lg9
 8ClxvQ7Oa/s0Zx+5mA6WLohHtdZ+71a1peI2vAofugEFS6wZ7N8P4Zf4MBY/oXUKe+WO3GEw9ti
 yafyF8DIiqppIiNeVbPyP+eTHeW3sHODuLnLDPpdLC6O69/NZELBvWEzcRZ549AYjYx8=
X-Gm-Gg: ASbGnctvrlkyysRMxakOvy+wSVVL5h16vFIe19wq1Or/9OG7Ia7ekAhZSYxKqlHYm/G
 kkhjxuboaf9J9mEkqD8QsGkEGBwk7bgeEvKkKefdZ+FT3iRb1bHrkDk2HaMu2am6e4ppeHXReU2
 py5NbqG072iv7YhgDun0oI3hzvAM3IvyoDm/q6VjLfzMRsRIeKeQHnpDABg234RU3ZfSK3QDVbi
 jSjrUOHopyOAm1SCuGrIHW+QHcSxRjf9cmD3RUywbh1N/Eq+sG+681bAN4irVjesMt9pYN1BZtr
 iA7PH06aDZd7qr+9xD89dd5NwYEIFRM3ae7oJQ7UPIuu2DDa0U1aVR0pup44EUi2JOKcfJnoqoN
 JTufnqqMZETpsRAFgnxWmGykU
X-Received: by 2002:a05:6214:c47:b0:6e8:fcc9:a291 with SMTP id
 6a1803df08f44-6f528c7fe1amr2596786d6.23.1746256635635; 
 Sat, 03 May 2025 00:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR4wNpzUG/bptrQ+52tXxdptHZK/RHcViayj6lPPjmiH8K44idol5XM8NwA4hoLSwACiTn0w==
X-Received: by 2002:a05:6214:c47:b0:6e8:fcc9:a291 with SMTP id
 6a1803df08f44-6f528c7fe1amr2596446d6.23.1746256635253; 
 Sat, 03 May 2025 00:17:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 00:17:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:04 +0300
Subject: [PATCH v2 05/11] drm/msm: move KMS driver data to msm_kms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-5-1292cba0f5ad@oss.qualcomm.com>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLty3aN/tYhn1Uyw9Gebo/6WejEomyj9nJk2
 5OfA8ppBqaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7QAKCRCLPIo+Aiko
 1bcxCACO/ohykEUA3ivHIwwV+fGtrOIwsd44sdrW2MTGTAHxx/PbtN5Fz3fDDFdqVpLeQeMdJoy
 CucVUn8/RlnYmBX3BhTB3n/yp+FRNqJA5U1VuSZQeVk9GFARKQ6sgLdMmzM0gy2Qw0D48JVIdR0
 otckTlB/4klJCXzbi/Jtcd0vZjT7PR4FyaiDJT9bEnS3o7QsN3S8EA+gP6kZvXkcjigX9zUWx73
 +zi/FwHDT46DM4zlOeL2n21we0cwE5hHksUiExjQlCrDr1q0GEmwdTz/KqohS7txgCVAskmb/C4
 o+cUvab3aIAO5EgEbWYsoxHCYP1KpjAdvBL1XwaSgW5ZRfku
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=6815c2ff cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=472Qx-lKBLW_CYKAQVMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jd71lorAfom_1LOEqUICCI_v2GBj-464
X-Proofpoint-ORIG-GUID: jd71lorAfom_1LOEqUICCI_v2GBj-464
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfX5+mQMuK4+lS6
 nNCdsm7Z8z+tblfVQacAIr27mEk7uIKPZ8GtfjH09sRp7R3psaNEbxlC2b4UjVB7o0gBc7bo5zd
 o8hwMxXzz6iNUCZjKs5fGw/jHsPc0yjrjK7zU5EJYZPVNRUPamV5uTXkbE7bypIl2iUBy7jjoWb
 jn1W0llvsDtWHTARxGtj+TJLd+Iuj6pij887ip8LHIfAvOmEf1y+iql/r0esTPN8Xr6pVpTJGJu
 VzMZZKlu21u/6ThalxYJchKBVFQXfUCC/SDy6yMwHiOWu5d3CIsoCI0IHP+11TI5P02+hPxZ93B
 /r8xG1YkYnUHTOatnpBaO2TsQ4pyjAIahskiYoTEiLJnHxeLhYovXr34x6DhBTRpvmW/gaN093d
 7EYbE+wSsISQ1yV+iMthbVh7IP/ZdkA2CvuqTvIv5xmIIs7tfk/L2c0IhuYGDDx3ZMi7Iima
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030061
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

