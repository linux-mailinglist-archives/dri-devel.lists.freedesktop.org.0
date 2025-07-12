Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2DEB02894
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27CE10E3DD;
	Sat, 12 Jul 2025 00:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElWNkyCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9CA10EB04
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:38 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0hDUv002460
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9sfyzKfbfll0Y6pC9wYmMCCUExx6sAsV9HVVdHNnnk8=; b=ElWNkyCkiT3wToln
 LVY4Npk6MdtzRAiDDoCttMqcCnZYHShCoNI0ukYB8dujUV66yRaFPc/iansUYcE4
 fUCAm0nGO5L2tDCiA1fXzatyYbeSt7lhLoIChlRl98nCJEmLdZ5goy1+yJeQYLEV
 Dajdi8VIY/fa1S4ppLcEAYPvkxrAT0pqhzGdOJivjEL6eDPSpfByJiRXzJR6kDqw
 u4riPtQJCRHVQZk+aPoBMOLLlP8sBzBNTMww+qU0fb5dwIa0ZZ1Y1RP7zZZ1z1Ui
 SNEIl0T+hejtu3YdapNcO8vYp6+TGLTRCqzgwSbX+6prXkrhjYZxFvTHrhoyiQlS
 246vbw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uddjr0n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-313c3915345so3819246a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281917; x=1752886717;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9sfyzKfbfll0Y6pC9wYmMCCUExx6sAsV9HVVdHNnnk8=;
 b=XShdvQpNeI7+I/ijHnHb19ZYLcvMxaxdnTEYr+X3zlfomiql0TC5paiwwAbZZEb5Rt
 3jRnBnXzDQxkEGbWN4oQNkIWowDmekQCIB+2yPn2LXpsMSFFk4yav97ick37pPtDQTdx
 Xfmrdm6VqNR18WbAvWiMdgaRHWUpnQTvHgCQ1lAPyp8mu8bUx4DCv9PbrYqOjw6dLdyw
 Lo1wI/M8LcGPINiP/04NSF+c+/Zw5vb+AaheOTUKyLuhLK40H6ITmzdK1hQZloJ/MaaM
 us9XGQqeuf8L9m+qr19296qEEuT7UdHIru2ZFqwm75UbCWW0VxInbVbFeJ0tv6gVB73Z
 zS+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhOBPR8iXIbMHK8J0DH1Caxsdb4/bICLWdDzFTpyqHjIuJwhCNKJgzcBL3KsZHgyY7Z9KLz9Pz66Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBT4U6up0GA2QysgsFVYTO8m3DrlHbjapI5XqhvoSWsGy8JgZh
 4x6lLvNNA4+MGBnd4+zYsHesckH4pUe8x5Lpu0VWxV52bMAxMmIbi23LeRR+A7hP6fWk7Dr22SQ
 3W3Pae7XvvyhMM1SeYlX3BrVvJIselFDzBhAMKAtcYJxgJG1RK5LBETLUrlL/CyxY8V3xKko=
X-Gm-Gg: ASbGncv4R0FJBUerBOoGK3/3x8kLMGvQ8WL5YG0ulLMYStkrh6nCiU72treBzEcVpvK
 GQQDb6dwbtOZyuhCCgTRjsVNys8a7OfdOYgG4P481vFbdb6BITJeNlWGLH4jHX3wGI240IvmuEj
 wTNYKq22q4ixYAUtrC4uZ3Hiwa88IaXeK4urjEZzWa59IuzFE7fmfQMV1cNe3WKeiuslyNw1KCE
 4W5gEf06nSUw26UINm5YBVIUP8H21rNyOtBIUhv80Q+/cpex9UvS5x/tu00l8g3+5aP4XeWzu3F
 lOTNiAXBEwLj4HnIo1FaMFGbGMrvX0SpwZA3EQjVwy6fODxgbqtlCKKnoDmCizDe3BzR3Ns6ELY
 pqKfcFtwqs/XiSE6vR4Llhh4b
X-Received: by 2002:a17:90b:5445:b0:308:7270:d6ea with SMTP id
 98e67ed59e1d1-31c4cd542d1mr7102532a91.30.1752281917561; 
 Fri, 11 Jul 2025 17:58:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG88ipsfGCVjYqYZ9GRyykBzdr8Y1eqpIyUUX2i5znBDnxgzgMI8LINqhKf5XOyh1wG4OdyZQ==
X-Received: by 2002:a17:90b:5445:b0:308:7270:d6ea with SMTP id
 98e67ed59e1d1-31c4cd542d1mr7102502a91.30.1752281917135; 
 Fri, 11 Jul 2025 17:58:37 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:36 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:12 -0700
Subject: [PATCH 07/19] drm/msm/dp: Rework unplug handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-7-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=3891;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=A6qHQe23MoIl3Lo+738gYkpwWYMBFzzH7/YAXqyjDXc=;
 b=qFKTKln9ZXCepyzqJoVFRVR9U8ih8agkhM9UBkPU07pTQJRSMBW5iAO6L26B8U13RCmmdqSNl
 0HOeAZDhO53AYTRwHx2HuWbuUBJMnRkPE4pduUu+Ddkws8LUkPuphWa
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: e9SdDzbNc3Ui1SWKbyh3MM2Td7NxnMSx
X-Proofpoint-GUID: e9SdDzbNc3Ui1SWKbyh3MM2Td7NxnMSx
X-Authority-Analysis: v=2.4 cv=ZPrXmW7b c=1 sm=1 tr=0 ts=6871b33e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4KM1mOPumagNCLxjdSoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNCBTYWx0ZWRfX72ce7Gkm7YEd
 bd2Uot9MQasIf37L0xYmSKQxQRkT+2ZaTE9DXC/bobIQGiUltetc4c0/6RgrnrE4xBxaaLz8n0M
 zZ1cVxVpwl2RnQQeiRUw5eBNziQlIRSng7g07ihHAMq6uRCw1IrEqPsteCYsYOVBH4BMAj//+WM
 ZerYHxaHVcCaQILvtJ4HiKaZEc1k/1FRZZSjxwKMMkHt8XV9YdWB7MJHUMlO1/8jLVWOfI3zYEM
 f45Woxr01Oapa8YnwiJlZwT2DUczIb85RZkR4ExWg1DXs9TGKLzCGVqZqdfO3uK0UfRjfTcAR88
 k0V4a3pNs6m4kHba16Z7j8UqzvRzanZp8wy2kcGpHAeaoG/3Uk10qgmq7zrMLdNtvtOy+lFvcnp
 AIExIiiRM8kEsFlYu0nhiBY5Wm343gZrnaCVpBSAwxQnOViNb3iKN9Vc2cEWH5T9glfiPJtl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120004
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

Simplify the unplug event handling by dropping the link teardown (as it
is already handled as part of the atomic post_disable()).

With the link teardown removed, we can also drop hpd_state-specific
handling to minimize redundant code

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 22 ----------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++--------------------
 3 files changed, 7 insertions(+), 43 deletions(-)

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
index 0f1c1fd2b1b7..1ce8051b116a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -661,32 +661,19 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
+	if (!dp->msm_dp_display.link_ready) {
+		mutex_unlock(&dp->event_mutex);
+		return 0;
+	}
+
 	dp->msm_dp_display.connected = false;
 
 	/* unplugged, no more irq_hpd handle */
 	msm_dp_del_event(dp, EV_IRQ_HPD_INT);
 
-	if (!dp->msm_dp_display.connected) {
-		/* triggered by irq_hdp with sink_count = 0 */
-		if (dp->link->sink_count == 0) {
-			msm_dp_display_host_phy_exit(dp);
-		}
-		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	} else if (state == ST_DISCONNECT_PENDING) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	} else if (state != ST_CONNECTED && dp->msm_dp_display.link_ready) {
-		msm_dp_ctrl_off_link(dp->ctrl);
+	/* triggered by irq_hdp with sink_count = 0 */
+	if (dp->link->sink_count == 0)
 		msm_dp_display_host_phy_exit(dp);
-		dp->hpd_state = ST_DISCONNECTED;
-		dp->msm_dp_display.connected = false;
-		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
-		pm_runtime_put_sync(&pdev->dev);
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
 
 	/*
 	 * We don't need separate work for disconnect as

-- 
2.50.1

