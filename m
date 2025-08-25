Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C04EB34331
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635EE10E4D3;
	Mon, 25 Aug 2025 14:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPLsRsHO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBA510E4B0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:47 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8NHkF016949
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qqs4drWBCBDE/z99SLo96bvGZA4vxD+HYpYQntA66ng=; b=pPLsRsHOQBBorqrf
 yLZgUCnp08l4FUDPIYKO4KfqnDaKQXZdIgdgiz/Bg1wmweAGxszhe0bEAZ4Z8kwp
 zq02JPA5SBfkMjpKk4mzNlNyX9LvWtWCxn+a2KMCPvlm+4+A1vnSNXMGiYOnUzw0
 P26OkfdYmZtJ5cDpzGRNpSwTrNB1k3e0qtcnyQpAS15i+k/HwlLtObv2rM0N0Zd+
 46fc0AIJLvh4AdufEz380Xx7ab97iIOezNdj4f500ciMB0TcgT/ZRxp3mtmQ5i/w
 GFvvaw1z40CnJGmuPf9JND5SOnR8hBJHDCFE1subpnesQ0QYwtkLBDGKT/RHjOBP
 yo1whQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpnesp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e55665b05so3881990b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131526; x=1756736326;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qqs4drWBCBDE/z99SLo96bvGZA4vxD+HYpYQntA66ng=;
 b=saLr0Ksw+aFlyh23EQphOxMyqdwEyYu61r9jjTKzs2Vmgmexro1iw8iB4r03CQrcoS
 4hYaReHWV220QrXX3y8bC0QzmSqvAtp4Vjyii8vDB4SgRYPePXezY4+9SytD1QB6EQhm
 Ji9TE0Q1xZYJ5m18cKEaRPA0PB2soGmWG/XErs2HUDQS/7yTCAs7OBnppuS5y61JTUY6
 UKk9AKYOq/a5hTZT2KKBJ0tIxCDWHPtRjWI+PkdLRnOxGopmrBCsYgpB+M7wlAqHoCEH
 rLPv1vpZe8sXFoTId8Qr/rMH7kjEZWVzJq4TDGTnVuGYBBaYZYPr3mt53nClMyKGGwP6
 Mqlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm+UcpzhxcP1syfggWuJoKZCnUj6kVS3Dqj+ZJ+lT7EjMG9u5JDT+umnJCdMs+GBwAp4ycJMmvbcI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGixZ0QlDNziBb5FppQJHkFuZp7kjv1vcb3Sj0qGSQUieGh8rc
 ZqOahTQbGu4BBYFLuHroNcX3DyYdzgvnk5wAuNARiIAOpk9oJUvfVZXkjSzwcUdfQrF7Ri+mjev
 NrP4j6LpBaLpd600EY3uy4rZL9pELT7+skNi6+aoPFi4xObFgJmkKCDMeE4piylmMf+pwCO4=
X-Gm-Gg: ASbGncuYa/YndbiMblhsXHVg7ALOAWqeUEmICTbaFJ+5LGDDwDpyke4KwcGUwabYtEc
 mCzH9wo4HQaXpMQti3MlnEDTZpgH4A3HOm04TceckwwBRZWkAgWkDM+nUOcq1qHycaK7VL0kASQ
 SBDbw76tuNynH+/VpEeHjk8wywMjSQOsuWCD3l9ZmuRYcJ/eW9yRSVxgNqnQCewfkSLT90h1Qc/
 3vVjtw43G6Twsq5k3uqsrPJWU7hFEYz9QOBofHRK3sbxMd4O6q9YW2aZmSC3tpq5G3viGsWIUTg
 Kk9RBa4Ob0foRAVwGck29rh3+fxpFyH+eCk1oXaegA2ixpRRtCbRC8vwf4uXDDafPvlG6lI=
X-Received: by 2002:a05:6a00:3a21:b0:76b:f73a:4457 with SMTP id
 d2e1a72fcca58-7702fa091b6mr19270903b3a.6.1756131525869; 
 Mon, 25 Aug 2025 07:18:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnx6G6tAHpjDS4MqzBazF5doCSc2hewG21dNNgf2eTmCEsSlaRSXM1VDpwNzfGlbfdFEMRXA==
X-Received: by 2002:a05:6a00:3a21:b0:76b:f73a:4457 with SMTP id
 d2e1a72fcca58-7702fa091b6mr19270831b3a.6.1756131525178; 
 Mon, 25 Aug 2025 07:18:45 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:44 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:09 +0800
Subject: [PATCH v3 23/38] drm/msm/dp: abstract out the dp_display stream
 helpers to accept a panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-23-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131422; l=10076;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=4zTlJidWLy0E1z5hm9dMFBWxogdjL3DqQF+QPgx0sPY=;
 b=XR8ZVcA1AMtLseYTQpeNsBV/hrKD78YfXLQW2+f9M6Id7jht1CFhGO1eR0yX4Q00OSKRywfRT
 /u4k8E9i8yTBVWmn72x5kweW4Ljkze6gt73nwCC35BqjGEIZvWO5IjH
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac70c7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=8K8LDW8wUMBAfiAu:21 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=6JW8Usl2KB0McxKAiHkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ia2_aVePHN2vT0fzlbhYDpW-OYUwj0Rf
X-Proofpoint-ORIG-GUID: ia2_aVePHN2vT0fzlbhYDpW-OYUwj0Rf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/X/ZKctk17Rh
 Y9JwdJ4TgBrlb8s5xInczEBmrr0PrkukhGiZrGL3nRJArn2PW52I4YsL92A+iz8qZjG0rca87G6
 d8C/PqzitGUviFMf7so/U/2+R/UEb+oH4PlwAufM8MBWoUS+tuEdTdYNjHpXw76Vo7vXVMLW3r0
 Pi6oThLSJowVFmJcWAStdgsekmdjJZ7nLIE1XBnF1q8Bkjo2m08bxjy5w2KP48xEZJUdn8SQ9KU
 XmQN49JTolVbK9QTphWXf/5yClyCFDhMXZiw12paT8lUHyHcN8nOeYKhEm3H9hCRbSoRKu5B32L
 y6xFmUPMzarqGgGH/u41jzM+PG1OiiXFy8aBQKY2DCblNFtoGYvqGmL8RqgWjvhyCEf2J2+XEto
 UCZRQo41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Currently the dp_display bridge helpers, in particular the
dp_display_enable()/dp_display_disable() use the cached panel.
To be able to re-use these helpers for MST use-case abstract the
helpers to use the panel which is passed in to them.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 138 +++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |  12 ++++
 2 files changed, 102 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e02ada7a3dc3b89618aeadd998e9a41236ee6bbf..0815973e6597492e09f33359d9777c0e8ce31e0d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -695,6 +695,11 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
 
+	if (msm_dp_display->prepared) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return 0;
+	}
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -722,7 +727,8 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 	return rc;
 }
 
-static int msm_dp_display_enable(struct msm_dp_display_private *dp)
+static int msm_dp_display_enable(struct msm_dp_display_private *dp,
+				 struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -733,7 +739,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel, dp->max_stream);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, dp->max_stream);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -779,37 +785,17 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
 	msm_dp_display->audio_enabled = false;
 }
 
-static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+static int msm_dp_display_disable(struct msm_dp_display_private *dp,
+				  struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	if (!msm_dp_display->power_on)
 		return 0;
 
-	msm_dp_panel_disable_vsc_sdp(dp->panel);
+	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0) {
-		/*
-		 * irq_hpd with sink_count = 0
-		 * hdmi unplugged out of dongle
-		 */
-
-		/* set dongle to D3 (power off) mode */
-		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
-		msm_dp_ctrl_off_link(dp->ctrl);
-		/* re-init the PHY so that we can listen to Dongle disconnect */
-		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	} else {
-		/*
-		 * unplugged interrupt
-		 * dongle unplugged out of DUT
-		 */
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
-		msm_dp_ctrl_off_link(dp->ctrl);
-		msm_dp_display_host_phy_exit(dp);
-	}
+	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
 
 	msm_dp_display->power_on = false;
 
@@ -1538,52 +1524,90 @@ void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display)
 	return;
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *dp;
 	int rc = 0;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0, 0);
-
 	if (msm_dp_display->prepared) {
-		rc = msm_dp_display_enable(dp);
+		rc = msm_dp_display_enable(dp, msm_dp_panel);
 		if (rc)
 			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
 		rc = msm_dp_display_post_enable(msm_dp_display);
 		if (rc) {
 			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-			msm_dp_display_disable(dp);
+			msm_dp_display_disable(dp, msm_dp_panel);
 		}
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 {
 	struct msm_dp_display_private *dp;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_idle(dp->ctrl, dp->panel);
+	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0, 0);
+
+	msm_dp_display_enable_helper(msm_dp_display, dp->panel);
+}
+
+void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
+				   struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_ctrl_push_idle(dp->ctrl, msm_dp_panel);
 	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl,
 		dp->max_stream);
 	msm_dp_ctrl_mst_send_act(dp->ctrl);
 }
 
-static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
+void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_disable_helper(msm_dp_display, dp->panel);
+}
+
+void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	if (!msm_dp_display->prepared) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return;
+	}
+
+	/* dongle is still connected but sinks are disconnected */
+	if (dp->link->sink_count == 0)
+		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+
+	msm_dp_ctrl_off_link(dp->ctrl);
+
+	/* re-init the PHY so that we can listen to Dongle disconnect */
+	if (dp->link->sink_count == 0)
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
+	else
+		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
 	msm_dp_display->prepared = false;
 }
 
-void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *msm_dp_display;
 
@@ -1597,28 +1621,46 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display);
+	msm_dp_display_disable(msm_dp_display, msm_dp_panel);
+
+	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+}
+
+void msm_dp_display_atomic_post_disable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_atomic_post_disable_helper(msm_dp_display, dp->panel);
 
 	msm_dp_display_unprepare(msm_dp_display);
+}
 
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp,
+				    const struct drm_display_mode *mode,
+				    const struct drm_display_mode *adjusted_mode,
+				    struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_set_mode(msm_dp, adjusted_mode, msm_dp_panel);
+	/* populate wide_bus_support to different layers */
+	dp->ctrl->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
+		false : dp->wide_bus_supported;
 }
 
-void msm_dp_display_mode_set(struct msm_dp *dp,
+void msm_dp_display_mode_set(struct msm_dp *msm_dp,
 			     const struct drm_display_mode *mode,
 			     const struct drm_display_mode *adjusted_mode)
 {
-	struct msm_dp_display_private *msm_dp_display;
-	struct msm_dp_panel *msm_dp_panel;
-
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	msm_dp_panel = msm_dp_display->panel;
+	struct msm_dp_display_private *dp;
 
-	msm_dp_display_set_mode(dp, adjusted_mode, msm_dp_panel);
+	dp = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
 
-	/* populate wide_bus_support to different layers */
-	msm_dp_display->ctrl->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
-		false : msm_dp_display->wide_bus_supported;
+	msm_dp_display_mode_set_helper(msm_dp, mode, adjusted_mode, dp->panel);
 }
 
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index fa92f763d2304f15af7c4e1e7e8aab5a6ffd3459..20b7ed735b3f428e894b82ae2756d0efcfa47624 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -51,5 +51,17 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 int msm_dp_display_set_stream_info(struct msm_dp *dp_display, struct msm_dp_panel *panel,
 				   enum msm_dp_stream_id stream_id,
 				   u32 start_slot, u32 num_slots, u32 pbn, int vcpi);
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
+				  struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
+				   struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp_display,
+				    const struct drm_display_mode *mode,
+				    const struct drm_display_mode *adjusted_mode,
+				    struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
+					       struct msm_dp_panel *msm_dp_panel);
+
+void msm_dp_display_unprepare(struct msm_dp *dp);
 
 #endif /* _DP_DISPLAY_H_ */

-- 
2.34.1

