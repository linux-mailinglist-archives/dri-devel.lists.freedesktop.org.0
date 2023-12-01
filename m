Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E69D801783
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6931210E97F;
	Fri,  1 Dec 2023 23:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D87B10E976;
 Fri,  1 Dec 2023 23:20:17 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B17c2Ld019492; Fri, 1 Dec 2023 23:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Wql9WTsNbtsOPZBnVj7JlrnD+fnpp9JNuh1IzpzpV/c=;
 b=bt880Y6kXJZLbqEvx8n4s3WELNQtFuc489e/ng0qWlxtpX4/vN4HePe6Y1RNwYHPlufm
 jRl8ZXFR2C8yA4W4S6XydiisI90pQii5oR1LBYdmBzHgpNNhHMbYs7AtBi0kgDLugfKP
 vFFdNsf74qHSr3YFNyxQlxwDV6sk55P2FxF9cxMwbTM8yTianfs6Ryd6EfR1Vrjrj0Bm
 Qam+PokXPWLRxTc/T6l4nIHmIuvxjyJdkJ4wFiDj/dNUW6YDyy7BlGLW2cP8sYLOl5Xr
 n7Bnf7aVnVF+TWZFIUK4kTqKiAfmvNNZhsGgUuabXGrdwc11LjPRtSx5N8hIIri7XOqW Cw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq2kpb7rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 23:20:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1NKAFK005301
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 23:20:10 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Dec 2023 15:20:10 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v9 6/7] drm/msm/dp: delete EV_HPD_INIT_SETUP
Date: Fri, 1 Dec 2023 15:19:48 -0800
Message-ID: <1701472789-25951-7-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1701472789-25951-1-git-send-email-quic_khsieh@quicinc.com>
References: <1701472789-25951-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: AWxOO77yL2f2WEaKiE5c2eYES3dirZWy
X-Proofpoint-GUID: AWxOO77yL2f2WEaKiE5c2eYES3dirZWy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_22,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312010144
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

EV_HPD_INIT_SETUP flag is used to trigger the initialization of external
DP host controller. Since external DP host controller initialization had
been incorporated into pm_runtime_resume(), this flag became obsolete.
msm_dp_irq_postinstall() which triggers EV_HPD_INIT_SETUP event is
obsoleted accordingly.

Changes in v4:
-- reworded commit text
-- drop EV_HPD_INIT_SETUP
-- drop msm_dp_irq_postinstall()

Changes in v3:
-- drop EV_HPD_INIT_SETUP and msm_dp_irq_postinstall()

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  4 ----
 drivers/gpu/drm/msm/dp/dp_display.c     | 16 ----------------
 drivers/gpu/drm/msm/msm_drv.h           |  5 -----
 3 files changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index fe7267b..5d5a045 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -856,7 +856,6 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
 {
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
-	int i;
 
 	if (!dpu_kms || !dpu_kms->dev)
 		return -EINVAL;
@@ -865,9 +864,6 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
 	if (!priv)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(priv->dp); i++)
-		msm_dp_irq_postinstall(priv->dp[i]);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9520d83..6693582 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -54,7 +54,6 @@ enum {
 enum {
 	EV_NO_EVENT,
 	/* hpd events */
-	EV_HPD_INIT_SETUP,
 	EV_HPD_PLUG_INT,
 	EV_IRQ_HPD_INT,
 	EV_HPD_UNPLUG_INT,
@@ -1079,8 +1078,6 @@ static int hpd_event_thread(void *data)
 		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
 
 		switch (todo->event_id) {
-		case EV_HPD_INIT_SETUP:
-			break;
 		case EV_HPD_PLUG_INT:
 			dp_hpd_plug_handle(dp_priv, todo->data);
 			break;
@@ -1360,19 +1357,6 @@ void __exit msm_dp_unregister(void)
 	platform_driver_unregister(&dp_display_driver);
 }
 
-void msm_dp_irq_postinstall(struct msm_dp *dp_display)
-{
-	struct dp_display_private *dp;
-
-	if (!dp_display)
-		return;
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
-
-	if (!dp_display->is_edp)
-		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
-}
-
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 {
 	struct dp_display_private *dp;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index cd5bf65..e79b93b 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -386,7 +386,6 @@ int __init msm_dp_register(void);
 void __exit msm_dp_unregister(void);
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			 struct drm_encoder *encoder);
-void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
@@ -407,10 +406,6 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
 	return -EINVAL;
 }
 
-static inline void msm_dp_irq_postinstall(struct msm_dp *dp_display)
-{
-}
-
 static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
 {
 }
-- 
2.7.4

