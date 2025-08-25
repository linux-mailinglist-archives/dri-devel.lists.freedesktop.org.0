Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC4BB34334
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0913410E4C6;
	Mon, 25 Aug 2025 14:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEUoI8gg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F3210E4C8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8gVw4013270
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qSyq8KcWWc9SY8S9T7BYsynBMQBCpqZsSmzW34yxxkU=; b=GEUoI8ggB360UQD4
 /qhtxeoSHfBYO8ZUmY3haNumkCE9dgCIYWmkjZZziftcH2DZ/5zyKYYCrT29/Wkt
 gqQA/pAwwioZEp2P31p3gG7zoaHV3cpgWUkJBahGoKj2jtHThZ5gxNR6ZiXx1CHR
 TvIybqoX64oh8D6nk2wdddW+E256CTC2yKIGBGXoUBGZDTOiK2fk1vWnt/uLtV/t
 GAQkdeVOAqhjB5dm2TlYwOE71yyB6P0iX/Njqcs2ZDS6DjN3ZxoKxXYW/ykoQmQh
 syUFXesNH9vrZspxtEXws04FrcLZ+qBA7xYXrqIY+SGGs3Cz6tKBHP+Edrr0P8Dr
 rc+YYA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpnet5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e2e5c4734so4476977b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131530; x=1756736330;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qSyq8KcWWc9SY8S9T7BYsynBMQBCpqZsSmzW34yxxkU=;
 b=ZzGt4Go/9Z3gWToJy+LIECC8AIPGSsyn+9x7KDUqoST38BYNUPk30zh40hM5wcDXKQ
 qB3e54m926XEdJU80N9GhEnyumeLQpgPgGq6jqb3ed6Pw+sZGPk69M4wPkdzg/oDj2Ot
 mmxrSCCisorXX34D2NGRyRm13ztO6BoFKukeBuQvTtahRZTrnIe6KQJs3G8kG2IxxxhW
 9OFyOSOhToamOxGgfHSdd3cBuWEIWj5P8x6E7AgfXEnqmlLmA6eKjWI9ORGNahIVAHYQ
 8X/KVUvLW+uN+KcraFl0THdye59aQ6gIDpL1M0oxbTNAXzA8q13EITcz9verhk2T1krj
 f1nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMGVetBRZyRRLKZ6Vf4ttKC67Cz71gyw+qxXXNEyra2Bjf/NNST00e86jUkVGq4zd8PJKve5f30yU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZfOzhubG6T0P82WX2lIReyZbHs7vGCPxjj5Nzxfzgxu7SimdL
 vdwkriXpSUBbBPOOOrb9TZWR0X7MC5uWOsYukrTZi/84QcKD+q+1k4MDPeAO2LB/ozQMydOUnWw
 3pBz58zXPPX3Coe6RKvdSeH36kBFQPj+EmjSutHCwmSLEPt+Y7qTj7KhMy8dlHe1p+hD+vss=
X-Gm-Gg: ASbGnctSqKMrvcx/jS3viXsiYmXjuCC6Wdudlb5nleT9CvzfebCtLeTqVLY1tZ7KLkq
 FDPHaiLR4k0l5FfuFTKwtxO/aEhdP04MKoMsSRDQ1vN5/9NZPjjBy9Y38SiPYcig6k4oK79tx4E
 L2FzCWdwYd5l+R4A8NUOrJnggWLgE+q9Hw4P7iJJcwoHPUbCAihCRcPdm4sKGA9R+m583Xm2sdH
 xRmas2OqbA0LKojelJvfZF53q8glWGYmfCSauNHkwmOBpSTg2OfRRcCsNLIuIc1YKsjJ7tzFH5n
 +KPH1hzKbarGblZxFCbpMhvYu6zNjUqgY49asTzlmSRW7pCUorsG2bRS2CegG8Tc3kfyu9A=
X-Received: by 2002:a05:6a00:391f:b0:76e:99fc:db8d with SMTP id
 d2e1a72fcca58-7702fa08e63mr14047925b3a.3.1756131529849; 
 Mon, 25 Aug 2025 07:18:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdWfy/69r29Z8S5fLfch/hFfgjrzV796tf8bajnXTxbMLA8UFoOV3MUvUSypvtfuCMn8n0aA==
X-Received: by 2002:a05:6a00:391f:b0:76e:99fc:db8d with SMTP id
 d2e1a72fcca58-7702fa08e63mr14047878b3a.3.1756131529311; 
 Mon, 25 Aug 2025 07:18:49 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:48 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:10 +0800
Subject: [PATCH v3 24/38] drm/msm/dp: replace power_on with
 active_stream_cnt for dp_display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-24-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131422; l=6349;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=Wmlm2KyLe1jBJ73nlakE9DMYOCD/MAofE3UhilE1SZs=;
 b=S7RZjos+LEElqVTvRT9EXfqvPpuPCqk3yJcpgRrk9APeu7hnseMXL4DOodYBGeI148NuqozfJ
 QNdhnoNk/AsDvTadx2oGD5MhSSIQsQLsYSRBg+jJNjlas6LnBaP8OCj
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac70ca cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qjupdTMWzssTVndNP84A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qdZ6MVm6aP-32ppp8vtTj85tEsdGNh7m
X-Proofpoint-ORIG-GUID: qdZ6MVm6aP-32ppp8vtTj85tEsdGNh7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX48vRp4xg+Z9A
 tRAzgrkHUDMh7X4VVHHw1b3nawyNXEp4BXUrGtPpDPyz4s+USte671u7v+BFtWuY1uGET2viItT
 xIUsPWWuQE9Iue+wxZg7xUE3fXLNwcHB0Tzxgq+kYffDJ+n4VyD7J54bWgffkM5tK0VLu5E8Xcn
 Z8ERXxpZKuUrkrPXcffjvJei/ZnumvblZVf4IoTYEFXTBWh4luuZq+4MOozyf4z41nbw7GpDhoF
 NxbicoUHkLm4skKsFdmvfw0ayHBp7xoHa15AZJ9ERGikItkxSyWqdDKl8b2/h5XJx13FsFXjp5J
 7A50OfVM1YQ4dhn0c4LoFTjO4cEUVWrPCd4X99BN8NydVzJ/S/LpA7m0tpXIYU+J3gL/XsrxLDa
 QGUGZCoD
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

For DP MST, the link clock and power domain resources stay on until
both streams have been disabled OR we receive hotplug. Introduce an
active_stream_cnt to track the number of active streams and necessary
state handling. Replace the power_on variable with active_stream_cnt
as power_on boolean works only for a single stream.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 50 ++++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |  3 ++-
 3 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 41018e82efa10ec863eb4b60d8df66c23c432fa5..e84c8b8e83d9ec689c0d29e8ac69860a745a4877 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -284,7 +284,7 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
 	 * such cases check for connection status and bail out if not
 	 * connected.
 	 */
-	if (!msm_dp_display->power_on) {
+	if (!msm_dp_display_get_active_stream_cnt(msm_dp_display)) {
 		rc = -EINVAL;
 		goto end;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0815973e6597492e09f33359d9777c0e8ce31e0d..e2e6b0ea2f9dbfe49a599ca19b1d205669365c4c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -73,6 +73,8 @@ struct msm_dp_display_private {
 
 	bool wide_bus_supported;
 
+	u32 active_stream_cnt;
+
 	struct msm_dp_audio *audio;
 
 	void __iomem *ahb_base;
@@ -175,6 +177,15 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{}
 };
 
+int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return dp->active_stream_cnt;
+}
+
 static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
 {
 	struct msm_dp *dp = dev_get_drvdata(dev);
@@ -709,15 +720,17 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 	if (dp->link->sink_count == 0)
 		return rc;
 
-	if (msm_dp_display->link_ready && !msm_dp_display->power_on) {
+	if (msm_dp_display->link_ready && !dp->active_stream_cnt) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
 	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
-	if (rc) {
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-		msm_dp_display->connector->state->link_status = DRM_LINK_STATUS_BAD;
+	if (!dp->active_stream_cnt) {
+		rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
+		if (rc) {
+			DRM_ERROR("Failed link training (rc=%d)\n", rc);
+			msm_dp_display->connector->state->link_status = DRM_LINK_STATUS_BAD;
+		}
 	}
 
 	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
@@ -731,17 +744,10 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 				 struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
-	if (msm_dp_display->power_on) {
-		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
-		return 0;
-	}
 
 	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, dp->max_stream);
-	if (!rc)
-		msm_dp_display->power_on = true;
 
 	return rc;
 }
@@ -788,16 +794,14 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
 static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 				  struct msm_dp_panel *msm_dp_panel)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
-
-	if (!msm_dp_display->power_on)
+	if (!dp->active_stream_cnt)
 		return 0;
 
 	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
 
-	msm_dp_display->power_on = false;
+	dp->active_stream_cnt--;
 
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
 	return 0;
@@ -934,7 +938,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	 * power_on status before dumping DP registers to avoid crash due
 	 * to unclocked access
 	 */
-	if (!dp->power_on)
+	if (!msm_dp_display->active_stream_cnt)
 		return;
 
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
@@ -1543,6 +1547,8 @@ void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_p
 		}
 	}
 
+	dp->active_stream_cnt++;
+
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
@@ -1564,6 +1570,11 @@ void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!dp->active_stream_cnt) {
+		drm_dbg_dp(dp->drm_dev, "no active streams\n");
+		return;
+	}
+
 	msm_dp_ctrl_push_idle(dp->ctrl, msm_dp_panel);
 	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl,
 		dp->max_stream);
@@ -1590,6 +1601,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 		return;
 	}
 
+	if (dp->active_stream_cnt) {
+		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
+		return;
+	}
+
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 20b7ed735b3f428e894b82ae2756d0efcfa47624..b1ea027438d952c94f3ae80725c92e46c631bdb2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -19,7 +19,6 @@ struct msm_dp {
 	struct drm_bridge *bridge;
 	bool link_ready;
 	bool audio_enabled;
-	bool power_on;
 	bool prepared;
 	bool mst_active;
 	unsigned int connector_type;
@@ -64,4 +63,6 @@ void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
 
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display);
+
 #endif /* _DP_DISPLAY_H_ */

-- 
2.34.1

