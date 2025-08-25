Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8D7B34322
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48A510E4B8;
	Mon, 25 Aug 2025 14:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn/7odVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B0210E4BE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P84vmI030210
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S97xfzDnKS3Uzcg2dQp2II/9dki/AJ5FrXKBWp/4mJg=; b=bn/7odVpaPvaDPLp
 FPhbjewHdElyUb8dZSXKXoI3tk5gRhWF9d8p9JI+4K+d+vEhJiqWbC0gqxQEidXF
 X6WjqE6XjusFsBHcQBTZtbWm+fxWcat+aFaAn7pljsaaMqTUsO/g+yd3pNrZUg+a
 ziTqKtv7qVyWhpakTxaSRhY8gxXaVIv/sjKDuNdTI7chruckQCjnX8MFrOSapfLr
 4Rr7+JeOPRPuXJ2V/97eWNTBWfXBmF4CaAuO04B0pjnuM2V0RtrobbLL1QaN4Aib
 53ywALYL8k9B7pX4dcm6ZqkK0egVeoo6i30axacAVY64nskYYz0oywZcVHj7o5xG
 VmLCLw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de5dgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4c1aefa8b7so822201a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131501; x=1756736301;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S97xfzDnKS3Uzcg2dQp2II/9dki/AJ5FrXKBWp/4mJg=;
 b=QnFlWBL1o0CqYJkgozkMcYPG0i/eVyoKYRrNb7epjwApUs3BeY8cjWKHWVRgHEb5ef
 9fSHcmPYKyYNltJVJg/u9QrqlqSEnMw0Vk8CBxFpUcqj3UNMKq9sRBzelfhp1w1quOH2
 Ypb9ISbSzEIZaCF59dIfDs1iFBnBrQiHppyoN28eJMyc7FklH0RbUzjTcu9mTGrA8S4T
 R7s2fRooc3W9P2ttu+Fw4TsOYmr3uCS0Pj+bNlFyh8YhPNjj+pBkaUeBIPsRrFejExaX
 KLQXnjCRcOv4da1imqJxQh8wIRXAGBudtENWTROH5xi0khy+h5Tj+6CQhU6zGcfeDe3/
 54KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG3MyYYtl4xHbnISA6BlduP0ccWXr0rPpJVnCfIqKs8Re4ixi2KmhR0/85lESKpxFmuwrdKowRV7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIV/PU33yr8kyevwRYk9DjE7VIhOBFH9JudgFCxlE94VKvEABM
 x7zvuaCLD5ppCnyMDL5Fb1JWN6LsGZx9c0yQcaUPtt5fXDDka8qEQ7+JFh7xjE5CyCuFukaV5T9
 3h8TkT0b0ctcbWJfitVcdkeWMvBkYxYuN+MNZjA1PEqvVpy2Txm2kfQXErVlf83xTbb8WGyg=
X-Gm-Gg: ASbGncs6Hx+hiU5e2Xp6IkFuCPwDr2UFWbRnGo4Sl1xIGXxj/UMufgCpV0t1Rgy1lF0
 Y686lq04ykUTMlqLhfkFQZVElm3qbecAdjnBc/GI79zShHwx/nDf6kKzKXO17y2fGIKS75MMJC6
 CtqQUg9V/ATqurdtadGzq9KBe0DF2A7pwI1a+dl0cflxcFO1TuZOgeeLQaV9GBkZDIH5BaiGvJJ
 X19+NOc0Mg4gTic+fPJE1EfeKMFFpEIDyNKiPHJP48refwVqckkLHqP/LSSMww4+maw8zJk1BHO
 o9h+MgHDS/Zp7Q/u09uFTiQc3ugpJhJ5Y/s7slXT7HCkC567kA3Tkqxd2E6NNhV3IbGegq0=
X-Received: by 2002:a05:6a20:6a10:b0:23d:cf88:e31e with SMTP id
 adf61e73a8af0-24340bce29emr17260199637.8.1756131500586; 
 Mon, 25 Aug 2025 07:18:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5arkjUzVNJ5jCXhjWga4elq02RJLl5W6tBVkQ9iOtGcyqonaD7uN0htNTu0O1qjKh8C2UGQ==
X-Received: by 2002:a05:6a20:6a10:b0:23d:cf88:e31e with SMTP id
 adf61e73a8af0-24340bce29emr17260152637.8.1756131500122; 
 Mon, 25 Aug 2025 07:18:20 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:19 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:03 +0800
Subject: [PATCH v3 17/38] drm/msm/dp: add support to send ACT packets for MST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-17-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131421; l=7389;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=iRovUq7/YF+lGbK1zxrqjEtTAew3+WgTHmJO5xYvjx8=;
 b=lmw7H+vN3zd5qVpSfFIVCnf8kQnTPXdjUzsGImdvNsBFqa+0VP2DBmWRp637jKata/BH4J5lC
 hkLaLkQkGHaBEUXf84Geuq6Y46eIEmFd7HmWktWglfVhpRnedSSNLB7
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfXw9ryNnmtrf1Q
 Ndfhq1NjTczwni/JkrPpyAm5LUmsyRZGwwNCGBpnH7KZdDIgvI154IStxx9kjeve/967C5zvnno
 u3F690Hf99S0SkdtourtyO6May1I6F5IOX0zRW6kjnsMaVWUzMfRdZvo1VuTxzcDpSI4itkv0kn
 S2xaWVwblXa5ZfJq0PhDW0uNCw1uFC1Yf9FGTQGfREjOzXVsh+i7RagZKINORg1gW0G9QQamGkX
 eE0+nfvUpvAXo1HytjQt+JRex8m1k9ksL7mSAO0nwdp8B2z0qp1xKIA5AdG/5tLITebxsbKZeIJ
 TPe8Rs/LQy9J5z9VwiMJS88M+CFIaJCzWeiCK4S1TE/Zoivj8wtaA2pVpuDlSWT2+TO0QB28nQD
 IDmg5og4
X-Proofpoint-ORIG-GUID: ne62B4TmcVy_psmbsKt5muOegMt5KUef
X-Proofpoint-GUID: ne62B4TmcVy_psmbsKt5muOegMt5KUef
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68ac70ad cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ohnT9xpZyUatSXMy1HkA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037
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

Whenever virtual channel slot allocation changes, the DP
source must send the action control trigger sequence to notify
the sink about the same. This would be applicable during the
start and stop of the pixel stream. Add the infrastructure
to be able to send ACT packets for the DP controller when
operating in MST mode.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 39 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++--
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
 5 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 608a1a077301b2ef3c77c271d873bb4364abe779..16e5ed58e791971d5dca3077cbb77bfcc186505a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on[DP_STREAM_MAX];
+	bool mst_active;
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -227,6 +228,32 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 	return 0;
 }
 
+void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	bool act_complete;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_active)
+		return;
+
+	msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
+	/* make sure ACT signal is performed */
+	wmb();
+
+	msleep(20); /* needs 1 frame time */
+
+	act_complete = msm_dp_read_link(ctrl, REG_DP_MST_ACT);
+
+	if (!act_complete)
+		drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete SUCCESS\n");
+	else
+		drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete failed\n");
+
+	return;
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2079,6 +2106,8 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
+	msm_dp_ctrl_mst_send_act(&ctrl->msm_dp_ctrl);
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 end:
 	return ret;
@@ -2275,7 +2304,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, ctrl->panel->stream_id);
 	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
 
-	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
+	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, false);
 	if (ret) {
 		DRM_ERROR("failed to enable DP link controller\n");
 		return ret;
@@ -2355,7 +2384,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
 	return drm_dp_channel_eq_ok(link_status, num_lanes);
 }
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active)
 {
 	int rc = 0;
 	struct msm_dp_ctrl_private *ctrl;
@@ -2373,6 +2402,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	rate = ctrl->panel->link_info.rate;
 	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	ctrl->mst_active = mst_active;
 
 	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
 
@@ -2643,6 +2673,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
+	msm_dp_ctrl_mst_send_act(msm_dp_ctrl);
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
 		return ret;
@@ -2682,6 +2714,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
+	ctrl->mst_active = false;
+
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
@@ -2849,6 +2883,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->link_base = link_base;
 	ctrl->mst2link_base = mst2link_base;
 	ctrl->mst3link_base = mst3link_base;
+	ctrl->mst_active = false;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 2baf7a1ff44dd7139d2da86390121d5e7a063e9a..abf84ddf463638900684f2511549a593783d2247 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -16,7 +16,7 @@ struct msm_dp_ctrl {
 
 struct phy;
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -50,5 +50,5 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
-
+void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 562a5eccf3f08c5669cc7c2ad1268897e975d0c4..eeba73f81c5ce7929dac88f4b47ac3741659864b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -709,7 +709,7 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 		force_link_train = true;
 	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
+	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
 	if (rc) {
 		DRM_ERROR("Failed link training (rc=%d)\n", rc);
 		msm_dp_display->connector->state->link_status = DRM_LINK_STATUS_BAD;
@@ -1557,6 +1557,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
 }
 
 static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index a839d0a3941eac3e277185e42fddea15ca05a17f..9442157bca9d63467b4c43fa644651ad2cbcbef5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -21,6 +21,7 @@ struct msm_dp {
 	bool audio_enabled;
 	bool power_on;
 	bool prepared;
+	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;
 	bool internal_hpd;
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index a806d397ff9d9ad3830b1f539614bffcc955a786..de3d0b8b52c269fd7575edf3f4096a4284ad0b8d 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -158,6 +158,8 @@
 #define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
 #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
 
+#define REG_DP_MST_ACT				(0x00000500)
+
 #define REG_DP_SOFTWARE_MVID			(0x00000010)
 #define REG_DP_SOFTWARE_NVID			(0x00000018)
 #define REG_DP_TOTAL_HOR_VER			(0x0000001C)

-- 
2.34.1

