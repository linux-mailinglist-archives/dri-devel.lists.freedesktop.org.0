Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E718738AC0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E7710E240;
	Wed, 21 Jun 2023 16:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5643110E23D;
 Wed, 21 Jun 2023 16:18:49 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35LG5U4T024001; Wed, 21 Jun 2023 16:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=N+ogiUao7Bp/W8lNJcM4un6D3KVQmus59zlHkCPdW6Y=;
 b=ASs9LFHq3w3pR4QEMe82rqKUkvXA7FG8GrASj7OtekPcQpVFvEJp2UHqk5ps4YLrDqjQ
 eS3zeqof6yLAdnG5xS+tgYnpbIsw3pFBWE7yPEjgChD3kthQG0z+n7TC6Q1P/adFrciC
 fRbDMh7HQ6F4sd3K/WnwmsPYw4fOthebXdT5Hv3/FfRCe/JHSP7zWWum6kxv+1Y2rMBw
 ydNfmbfSng1N/JGT7kS6GpOFexSRtBTEtJJL8quTVPS525Yz9g94jYNAjGJzPY8dyV4k
 cYvbUaJNSVMRg1pubkjXwzSk9tBlz0Yr0hyQEdB9u0C+NPfcxde8IuHVsmj0Ts0l6ISx ug== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rc2rcgbbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jun 2023 16:18:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35LGIaKB020268
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jun 2023 16:18:36 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 21 Jun 2023 09:18:36 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v4 2/2] drm/msm/dpu: remove struct drm_dsc_config from struct
 msm_display_info
Date: Wed, 21 Jun 2023 09:18:18 -0700
Message-ID: <1687364298-29430-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1687364298-29430-1-git-send-email-quic_khsieh@quicinc.com>
References: <1687364298-29430-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: P3opeti0G4I8030bFPK9uxA15vRyjozw
X-Proofpoint-GUID: P3opeti0G4I8030bFPK9uxA15vRyjozw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_09,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210137
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since struct drm_dsc_config is stored at atomic_mode_set() instead
of display setup time during bootup, saving struct drm_dsc_config at
struct msm_display_info is not necessary. Lets drop the dsc member
from struct msm_display_info.

Changes in v4:
-- fix "Since" at commit text

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 2 --
 3 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 367d374..b68610e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2313,8 +2313,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		dpu_enc->idle_pc_supported =
 				dpu_kms->catalog->caps->has_idle_pc;
 
-	dpu_enc->dsc = disp_info->dsc;
-
 	mutex_lock(&dpu_enc->enc_lock);
 	for (i = 0; i < disp_info->num_of_h_tiles && !ret; i++) {
 		/*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 90e1925..4c05fd5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -28,7 +28,6 @@
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
  * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
  *				 used instead of panel TE in cmd mode panels
- * @dsc:		DSC configuration data for DSC-enabled displays
  */
 struct msm_display_info {
 	enum dpu_intf_type intf_type;
@@ -36,7 +35,6 @@ struct msm_display_info {
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
 	bool is_te_using_watchdog_timer;
-	struct drm_dsc_config *dsc;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 613384b..5e77e09 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -544,8 +544,6 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 
 		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
 
-		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
-
 		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
 		if (IS_ERR(encoder)) {
 			DPU_ERROR("encoder init failed for dsi display\n");
-- 
2.7.4

