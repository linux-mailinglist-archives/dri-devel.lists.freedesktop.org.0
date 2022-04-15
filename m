Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D4A502F20
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 21:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50C310E299;
	Fri, 15 Apr 2022 19:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F130010E299;
 Fri, 15 Apr 2022 19:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650049801; x=1681585801;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=e6oJOgZxvs4lri2LhF3z94B4F9gDqWRWVg2aLLJraMg=;
 b=RewGJsotmDJlQ3LcY0kAN0uqXQKAr+P4Fa4K8aUW+rX3NDUd+F3E0WRU
 +zYPX3sMwjK8YkGAWJOoGI0gJ4xyAmrOPux6Pv2LGdpiDBOPOf5pIe7e8
 TUG8KBc9bM2NmqOUFF3fAx8YB0asLwGR4egRpxOdpoD6241BI1arHkZm0 s=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Apr 2022 12:10:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 12:09:59 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Apr 2022 12:09:59 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Apr 2022 12:09:58 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH] drm/msm: remove unused hotplug and edid macros from msm_drv.h
Date: Fri, 15 Apr 2022 12:09:42 -0700
Message-ID: <1650049782-8421-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unused MSM_DISPLAY_CAP_HOT_PLUG and MSM_DISPLAY_CAP_EDID
macros from msm_drv.h.

Even if we need these, there are drm equivalent ones present.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/msm_drv.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9f68aa6..17de795 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -74,14 +74,10 @@ enum msm_dp_controller {
  * enum msm_display_caps - features/capabilities supported by displays
  * @MSM_DISPLAY_CAP_VID_MODE:           Video or "active" mode supported
  * @MSM_DISPLAY_CAP_CMD_MODE:           Command mode supported
- * @MSM_DISPLAY_CAP_HOT_PLUG:           Hot plug detection supported
- * @MSM_DISPLAY_CAP_EDID:               EDID supported
  */
 enum msm_display_caps {
 	MSM_DISPLAY_CAP_VID_MODE	= BIT(0),
 	MSM_DISPLAY_CAP_CMD_MODE	= BIT(1),
-	MSM_DISPLAY_CAP_HOT_PLUG	= BIT(2),
-	MSM_DISPLAY_CAP_EDID		= BIT(3),
 };
 
 /**
-- 
2.7.4

