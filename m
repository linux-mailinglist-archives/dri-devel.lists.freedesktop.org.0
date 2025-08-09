Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6881EB1F191
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A563710E992;
	Sat,  9 Aug 2025 00:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GARjsjIx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E68810E992
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578FOWH1008373
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hc2PomjCEUqKfvXR+bI4mzShsBkkrWDeiNQWOs+oPq4=; b=GARjsjIxBjPqaEs+
 dRrhK3m/x63COM+8JPBDXUZwuIpO43+hrbxxKGKURxs0zEVf8PoWQHyYC1Csr+U2
 DUFhNE1gbWLvar9Lbws6KTtA7KMMsbLFWnEo+Ax27lyzpD9dPVmoB01SrWgGP/S2
 q6qEk0ESqPVWhe/YpZDGKnpZ67Deu6GNANKam2EWkPdy2DGIBeyeJawcmQi6usSw
 I6RDzd6jh7IV7POxRqLqJdtRwmJXQmcHTk/izilHm6u63EnBZoFOyakgvV+L2Gio
 jIvEN9QBUAVK0SI0KaNPSm3ihPPEhsGOERvT1Llnk5Vdih0uBI/owJiOO4/LAZun
 MnArbA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u28k4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b42bcfe9c89so2099046a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699751; x=1755304551;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hc2PomjCEUqKfvXR+bI4mzShsBkkrWDeiNQWOs+oPq4=;
 b=pNQleEdYS5gCfDKF3+TMGqTT3AF8jHt8E8MczfRRIn/st+HT526GvUrwcVsNv7wHn9
 odTT8j7fw3n6i729CT0efSPxVRs/qBj1TsJq+kL9fnd3qnIaTbeGV62Ux1XXtYfvRRgk
 aS/cFWMuAO8BVInzP7bt83Sjul9fXOqhkh21X8/1cYhrxNHYb023pSadI0DxprczRTiY
 yu9c/hPO81lt+7n3UKnGi4XTQ8sZn+uw9rMP12RFv7FdATULrVGfGPLnz5J4YJQoEs/g
 vEYdjerBsdWctNPm6a6K1at7hnGffJEOSp7IrVByy3KL6loEuUBdopIzKVuBNl21udkx
 Bc3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjQVe7upinIGYX5rYsaoAN592xHSjrM6EtYtOQ1qXRIHG+yWTeOKnmc4FCSL2OGOWbR1XUYyi+2Uk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6W6e74II3aJpzbfFuvO9a3j/YQhnDGrN1CagCdLKojtyxDJsq
 c7alBl8a/G4oIOfYcxj+lYfVnZH2bShcFBIgXbapCpULWsTpntpbQfx2KwugQelQFYO9fmuYXht
 cMiVCGjGVigQmfbK5xOK9Yo/KwxYRN1MZrEj6F0+Ok2OnVVXb1lKITHcs0sqp+2CnZP2uZGg=
X-Gm-Gg: ASbGncvQgjl/OkBJ1CVHHMwt5jSyeA+QuYb5e2vypZa2F/b5i63IoJ4e/SV5SA8ekHx
 NiwsvRHmdLd3/vQDemvIBExSli/UyVIrikxflibeXrgb99kknFHaVGXYP6ea1nAjGd0+ItAxLYS
 Mlxku6AK4m7aNrE+iTKMrL6wKR8SkT9gZ6uDajQZh/e/VQ8DK7z6rXOFQzfCoVepeGrv1s9wKet
 qG03M4BBj0yDYTFJnvYS7pfs3oGX7ahazkxsZwf5tiaKnxIuRIliSgzzVFnzPOqU5kIbcknFrNF
 oEPq04esyB0WVKXpRGiRvq96wtz3hTikmBQjzDdmJFJJp2sSXqSz/Ff82/bmWTR32DEi6owCnwf
 1ihEXnBl2t1qNOyQoXILcUCIB
X-Received: by 2002:a17:903:2ace:b0:234:b123:b4ff with SMTP id
 d9443c01a7336-242c2011167mr76235315ad.21.1754699750690; 
 Fri, 08 Aug 2025 17:35:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEVZKvg/CHR+DlFz8GZZA1oxge4Mj/q2fUpvjTmYPJPdIKAl3vEyocljUvcweSNDD/Po99vQ==
X-Received: by 2002:a17:903:2ace:b0:234:b123:b4ff with SMTP id
 d9443c01a7336-242c2011167mr76234835ad.21.1754699750208; 
 Fri, 08 Aug 2025 17:35:50 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:49 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:23 -0700
Subject: [PATCH v2 11/12] drm/msm/dp: drop the entire HPD state machine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-11-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=12541;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=w6BSJBqJqbIRJ05+nno85RYDhBvoyNtIQfjze0MwCY4=;
 b=ue+ZOIXB8H7Ln9T8HYJ680b1Q6pLSgOQ13/vHpi2GRDQuKoxwiT/FHvI25mesYj/sAf4FAAS6
 jGpB6F9C4XWCIdY9mstgxG0hrmbyYDm/+4qjnt0/JDkphkp389mItmV
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: Hn1ZHHqjE6b9npyfmzY-ZLXCDVrIjWhg
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=689697e7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=T1xWuFrC4okc8hw_pIcA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Hn1ZHHqjE6b9npyfmzY-ZLXCDVrIjWhg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX3D2ofdWyar1p
 JwExxWUtgSWO00950TvZO3LBZgas2XUkLO/qXbpYrYj51EplMGOmtXr9xzHIxLQn4/5M0uTKEJz
 v33A7hRo5LqqQSpUxlsbxBfLDDhMxzC+ntZWFCIsM9z+UN30vd4lyQEwpol0iKuKgToz/a7o3V4
 Is/RKBK1u75LPmmkKdv8kYjYG364AxCQ9v13wnRHGPQr93/3/389WBlDWtb/jRR1BIJE3euznCe
 uJ0adBkSfsChoNJHIQgkIRYSC4hRchO6pt0bI2v1OvPOKzl2fLAa6gFHqPn71vF69H69fn5gO5o
 MP9vt+9YDD9iptw7GRk+0TlnaaNYCu8ZJQisIHszhIQrjwcFsfa0ALANEzIIksoRx0caJ+nj3pg
 1iEvNCYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090
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

Since internal HPD IRQ event handling has been moved to being handled by
the DRM framework detect() and hpd_notify() callbacks, there is no need
for the MSM driver to track the HPD state separately.

Drop all references to the HPD state machine and replace existing checks
with checks for link_ready or sink_count.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 ------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 148 +++++++++---------------------------
 3 files changed, 34 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c42fd2c17a32..4cf269b98029 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2567,28 +2567,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 			phy, phy->init_count, phy->power_count);
 }
 
-void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
-{
-	struct msm_dp_ctrl_private *ctrl;
-	struct phy *phy;
-
-	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	phy = ctrl->phy;
-
-	msm_dp_ctrl_mainlink_disable(ctrl);
-
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
-
-	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",
-		phy, phy->init_count, phy->power_count);
-
-	phy_power_off(phy);
-
-	DRM_DEBUG_DP("After, phy=%p init_count=%d power_on=%d\n",
-		phy, phy->init_count, phy->power_count);
-}
-
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 124b9b21bb7f..f68bee62713f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,6 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
-void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 82f0b6bdbf39..dd529942f7db 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -43,15 +43,6 @@ enum {
 	ISR_HPD_REPLUG_COUNT,
 };
 
-/* event thread connection state */
-enum {
-	ST_DISCONNECTED,
-	ST_MAINLINK_READY,
-	ST_CONNECTED,
-	ST_DISCONNECT_PENDING,
-	ST_DISPLAY_OFF,
-};
-
 struct msm_dp_display_private {
 	int irq;
 
@@ -79,7 +70,6 @@ struct msm_dp_display_private {
 	spinlock_t irq_thread_lock;
 	u32 hpd_isr_status;
 
-	u32 hpd_state;
 	bool wide_bus_supported;
 
 	struct msm_dp_audio *audio;
@@ -392,24 +382,6 @@ static int msm_dp_display_usbpd_configure_cb(struct device *dev)
 	return msm_dp_display_process_hpd_high(dp);
 }
 
-static int msm_dp_display_notify_disconnect(struct device *dev)
-{
-	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
-
-	if (!dp->msm_dp_display.is_edp)
-		drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
-						 connector_status_disconnected,
-						 dp->panel->dpcd,
-						 dp->panel->downstream_ports);
-
-	dp->msm_dp_display.link_ready = false;
-
-	if (!dp->msm_dp_display.internal_hpd)
-		msm_dp_display_send_hpd_notification(dp, false);
-
-	return 0;
-}
-
 static void msm_dp_display_handle_video_request(struct msm_dp_display_private *dp)
 {
 	if (dp->link->sink_request & DP_TEST_LINK_VIDEO_PATTERN) {
@@ -424,17 +396,11 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 
 	if (drm_dp_is_branch(dp->panel->dpcd) && dp->link->sink_count == 0) {
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
-		if (dp->hpd_state != ST_DISCONNECTED) {
-			dp->hpd_state = ST_DISCONNECT_PENDING;
+		if (dp->msm_dp_display.link_ready)
 			msm_dp_display_send_hpd_notification(dp, false);
-		}
 	} else {
-		if (dp->hpd_state == ST_DISCONNECTED) {
-			dp->hpd_state = ST_MAINLINK_READY;
+		if (!dp->msm_dp_display.link_ready)
 			rc = msm_dp_display_process_hpd_high(dp);
-			if (rc)
-				dp->hpd_state = ST_DISCONNECTED;
-		}
 	}
 
 	return rc;
@@ -445,7 +411,7 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 	u32 sink_request = dp->link->sink_request;
 
 	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
-	if (dp->hpd_state == ST_DISCONNECTED) {
+	if (!dp->msm_dp_display.link_ready) {
 		if (sink_request & DP_LINK_STATUS_UPDATED) {
 			drm_dbg_dp(dp->drm_dev, "Disconnected sink_request: %d\n",
 							sink_request);
@@ -472,8 +438,7 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 	rc = msm_dp_link_process_request(dp->link);
 	if (!rc) {
 		sink_request = dp->link->sink_request;
-		drm_dbg_dp(dp->drm_dev, "hpd_state=%d sink_request=%d\n",
-					dp->hpd_state, sink_request);
+		drm_dbg_dp(dp->drm_dev, "sink_request=%d\n", sink_request);
 		if (sink_request & DS_PORT_STATUS_CHANGED)
 			rc = msm_dp_display_handle_port_status_changed(dp);
 		else
@@ -485,20 +450,15 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 
 static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 {
-	u32 state;
 	int ret;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
 	msm_dp_aux_enable_xfers(dp->aux, true);
 
-	state =  dp->hpd_state;
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
-
-	if (state == ST_MAINLINK_READY || state == ST_CONNECTED)
-		return 0;
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
-	if (state == ST_DISCONNECT_PENDING)
+	if (dp->msm_dp_display.link_ready)
 		return 0;
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
@@ -509,14 +469,12 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	ret = msm_dp_display_usbpd_configure_cb(&pdev->dev);
 	if (ret) {	/* link train failed */
-		dp->hpd_state = ST_DISCONNECTED;
+		dp->msm_dp_display.link_ready = false;
 		pm_runtime_put_sync(&pdev->dev);
-	} else {
-		dp->hpd_state = ST_MAINLINK_READY;
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	/* uevent will complete connection part */
 	return 0;
@@ -538,51 +496,40 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 
 static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 {
-	u32 state;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
 	msm_dp_aux_enable_xfers(dp->aux, false);
 
-	state = dp->hpd_state;
-
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
-	if (state == ST_DISCONNECTED) {
-		/* triggered by irq_hdp with sink_count = 0 */
-		if (dp->link->sink_count == 0) {
-			msm_dp_display_host_phy_exit(dp);
-		}
-		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
+	if (!dp->msm_dp_display.link_ready)
 		return 0;
-	} else if (state == ST_DISCONNECT_PENDING) {
-		return 0;
-	} else if (state == ST_MAINLINK_READY) {
-		msm_dp_ctrl_off_link(dp->ctrl);
+
+	/* triggered by irq_hdp with sink_count = 0 */
+	if (dp->link->sink_count == 0)
 		msm_dp_display_host_phy_exit(dp);
-		dp->hpd_state = ST_DISCONNECTED;
-		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
-		pm_runtime_put_sync(&pdev->dev);
-		return 0;
-	}
 
 	/*
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
 	 */
-	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
+	if (!dp->msm_dp_display.is_edp)
+		drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
+						 connector_status_disconnected,
+						 dp->panel->dpcd,
+						 dp->panel->downstream_ports);
 
-	if (state == ST_DISPLAY_OFF) {
-		dp->hpd_state = ST_DISCONNECTED;
-	} else {
-		dp->hpd_state = ST_DISCONNECT_PENDING;
-	}
+	dp->msm_dp_display.link_ready = false;
+
+	if (!dp->msm_dp_display.internal_hpd)
+		msm_dp_display_send_hpd_notification(dp, false);
 
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
@@ -591,23 +538,14 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 
 static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 {
-	u32 state;
-
 	/* irq_hpd can happen at either connected or disconnected state */
-	state =  dp->hpd_state;
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
-
-	if (state == ST_DISPLAY_OFF)
-		return 0;
-
-	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING)
-		return 0;
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	msm_dp_display_usbpd_attention_cb(&dp->msm_dp_display.pdev->dev);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
-			dp->msm_dp_display.connector_type, state);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
+			dp->msm_dp_display.connector_type);
 
 	return 0;
 }
@@ -1426,7 +1364,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
 	struct msm_dp_display_private *msm_dp_display;
-	u32 hpd_state;
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1443,7 +1380,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	hpd_state = msm_dp_display->hpd_state;
 	if (msm_dp_display->link->sink_count == 0)
 		return;
 
@@ -1453,9 +1389,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	hpd_state =  msm_dp_display->hpd_state;
-
-	if (hpd_state == ST_DISPLAY_OFF) {
+	if (dp->link_ready && !dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}
@@ -1474,9 +1408,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		msm_dp_display_disable(msm_dp_display);
 	}
 
-	/* completed connection */
-	msm_dp_display->hpd_state = ST_CONNECTED;
-
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 }
 
@@ -1497,7 +1428,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
-	u32 hpd_state;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1505,21 +1435,11 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (dp->is_edp)
 		msm_dp_hpd_unplug_handle(msm_dp_display, 0);
 
-	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISCONNECT_PENDING && hpd_state != ST_CONNECTED)
-		drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
-			   dp->connector_type, hpd_state);
+	if (!dp->link_ready)
+		drm_dbg_dp(dp->drm_dev, "type=%d is disconnected\n", dp->connector_type);
 
 	msm_dp_display_disable(msm_dp_display);
 
-	hpd_state =  msm_dp_display->hpd_state;
-	if (hpd_state == ST_DISCONNECT_PENDING) {
-		/* completed disconnection */
-		msm_dp_display->hpd_state = ST_DISCONNECTED;
-	} else {
-		msm_dp_display->hpd_state = ST_DISPLAY_OFF;
-	}
-
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 
 	pm_runtime_put_sync(&dp->pdev->dev);

-- 
2.50.1

