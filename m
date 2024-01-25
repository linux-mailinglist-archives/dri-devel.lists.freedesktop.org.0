Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5289083CC84
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 20:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3A210F1DA;
	Thu, 25 Jan 2024 19:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6910610ECBB;
 Thu, 25 Jan 2024 19:39:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40PGNMDj014556; Thu, 25 Jan 2024 19:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=ofA3RZonkwoQNfJBlobDwvymK0Gcdlyik/pKyNLXWi0=; b=OA
 V0hlVhFXzP1dsHBbMHv4iXSJrv00AU86OpJtPn8oSh4bWC4f0UPE7WJN3h6KyLlW
 xyfmBmCWTHX2YBtmV9aJo8GpK63YtpPnG6+OKxnc+3DeU4MiLdxqDnUeYP6PqL5b
 m37tDi1xrhvYUUrRNZBU1bQmBZ+AYER3eBI2ScepETA9ULlmlcFkGRR7BcGHZb1d
 FB9kZgM1N9nHb7gLjYpd9khrqCuNrQtMk9FOkrw5jT4nI34KYrrRk1rK2gD95q9W
 Oc/3ZSckR/eJSezkCZo3gH+qPg77JB/HoAkTQUj3zlvKdWtJssheD6awVkQpi0td
 Wy/fd0HDUDDZQbOC82TA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vumynhk89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 19:38:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PJcxi9023533
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 19:38:59 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 11:38:58 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 03/17] drm/msm/dp: rename wide_bus_en to wide_bus_supported
Date: Thu, 25 Jan 2024 11:38:12 -0800
Message-ID: <20240125193834.7065-4-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125193834.7065-1-quic_parellan@quicinc.com>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: a7QpFrvXnGQHq4PuhHConh1WP0bhSz1Q
X-Proofpoint-ORIG-GUID: a7QpFrvXnGQHq4PuhHConh1WP0bhSz1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_12,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=897 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250142
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
 Paloma Arellano <quic_parellan@quicinc.com>, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename wide_bus_en to wide_bus_supported in dp_display_private to
correctly establish that the parameter is referencing if wide bus is
supported instead of enabled.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++---------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d37d599aec273..9df2a8b21021e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -113,7 +113,7 @@ struct dp_display_private {
 	struct dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
-	bool wide_bus_en;
+	bool wide_bus_supported;
 
 	struct dp_audio *audio;
 };
@@ -122,7 +122,7 @@ struct msm_dp_desc {
 	phys_addr_t io_start;
 	unsigned int id;
 	unsigned int connector_type;
-	bool wide_bus_en;
+	bool wide_bus_supported;
 };
 
 static const struct msm_dp_desc sc7180_dp_descs[] = {
@@ -131,8 +131,8 @@ static const struct msm_dp_desc sc7180_dp_descs[] = {
 };
 
 static const struct msm_dp_desc sc7280_dp_descs[] = {
-	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
 	{}
 };
 
@@ -144,22 +144,22 @@ static const struct msm_dp_desc sc8180x_dp_descs[] = {
 };
 
 static const struct msm_dp_desc sc8280xp_dp_descs[] = {
-	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
+	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
 	{}
 };
 
 static const struct msm_dp_desc sc8280xp_edp_descs[] = {
-	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
-	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
-	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
-	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
+	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
+	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
+	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
+	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
 	{}
 };
 
@@ -784,9 +784,9 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_ctrl;
 	}
 
-	/* populate wide_bus_en to differernt layers */
-	dp->ctrl->wide_bus_en = dp->wide_bus_en;
-	dp->catalog->wide_bus_en = dp->wide_bus_en;
+	/* populate wide_bus_supported to different layers */
+	dp->ctrl->wide_bus_en = dp->wide_bus_supported;
+	dp->catalog->wide_bus_en = dp->wide_bus_supported;
 
 	return rc;
 
@@ -1256,7 +1256,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	dp->name = "drm_dp";
 	dp->id = desc->id;
 	dp->dp_display.connector_type = desc->connector_type;
-	dp->wide_bus_en = desc->wide_bus_en;
+	dp->wide_bus_supported = desc->wide_bus_supported;
 	dp->dp_display.is_edp =
 		(dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 
@@ -1402,7 +1402,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	return dp->wide_bus_en;
+	return dp->wide_bus_supported;
 }
 
 void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *root, bool is_edp)
-- 
2.39.2

