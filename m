Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2162BB342FF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCC410E4AF;
	Mon, 25 Aug 2025 14:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nPYWMbJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3B510E4AF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P91Vxq027134
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dhu2pyL0X/ioZ8T2TjoRhnhCcvCEY46TDbOm5EiNtvY=; b=nPYWMbJ997wyma8i
 R/b2CwTMPStWo9zsBpAwPU2z2BnpqbqKvsPk3rvULtT37RCicGvVWg012I/Jnw0r
 M5YcPWMYwT29GIf4Fr9GdTYsZBAeVRSSJwcppyQ9bdvjMsBwEpE5cB+XsNM+IP5G
 6GO2qsB0o6xJDvsqUQdkeBfFSK/LPR2LC47ww3O779qYJMYQJKCMaCWqKFyguG61
 lAqGnUHRNRGFvEfs3KFxam2/0mpsreiaXq8jZnGsQKlYifHX5ee7oFw5Vgp3ntmL
 iIAsLCI7RNhLSG4ShEiYtCbAwbnTCaVxCALB6K1wwwv7GsChB0M5ylGMg5AU+jUU
 1HT18A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdw83f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-771f28ed113so171905b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131446; x=1756736246;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dhu2pyL0X/ioZ8T2TjoRhnhCcvCEY46TDbOm5EiNtvY=;
 b=uzxfGN0U6xBQcweSuOAgHHpoCkxHHnQZsz521Y7eo8kNpUHLYcVlaZxVi+ujGLJ+/J
 vsn9kBfgwrr0mEvaSI7O2zEuKSgjP7lKe170LD93dRFAIoqpeP9Dr7dCJuF0hs7cDM8/
 1/HHeb0Cmp9L/MJYqZRHv2/UKfyj52BL1vcvNd9wcnwgUb9UOSCAH1WNKweth0bXKhXd
 0Xc1NLT8y1Hfc8iDi323W8UTyC5Yr8pF+ZSL8P59aPT6Od/sWjgq5+zZf4PeWQgWK2ui
 FY4LZq66qNc91PN0gntcchFkVeTca+5WRwR4MsgZv2RewTUQ+NvMl7dntuDedH074hWt
 iP0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXifxdQJ+/KAruWQlNbdwS9TFQwe2TLmR240gURabb23z7oXiAbUbSmXDdoaGZE7Ox5DUyYB2Hy8bg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj7g4ljMMHQ21JQ2s56iQJaZxbZl9SyaqrI18ICrLbbViSzPcH
 hNV2X8MtHDmACIRRanYSWZ2M7vD3NlbbakvbQfC4HM7SGIu2cTkeKm/72KyEcw5pLhVbQRqis79
 UToBSN3jqHJzg7YE23LCcq+mDA4bKWtN+0O+5qhwiCZ0k5AtFeiQyo0ZoewQ/GQmzauLAbLI=
X-Gm-Gg: ASbGnctqtgZ9K0j/1msKYfsJO6IKe89iq4/yIx7HehMXYSIELboG9iS8S39TRiXnXRM
 WD9t/7bOnYUnZ49stOGz0qmAtttvo9X7YgUssRKB0EYDlVl2kb3lzfOTmLqjmkHq7yIfMBQS4NW
 zNqaMBeHb75VKnBlHVPjUaNEB2l1pVGealU8HkBabjw47j/g4QZuYX6TBzKzP2ehxL4g2ma+o+R
 FbOsAY2Ryb5NnpTTqkHpetZ0tbRwd1Adk1Y8/uxEcPrYsCra27FgTJ8+BCyWNDuiCRZg7KbC1K0
 hC1AzeSZkWRnjyUvX1LrqUUAPrvASO9PV0UHT+sikVf8iSaR2TqRhmKyd/XHuD4vJ2JwWHA=
X-Received: by 2002:a05:6a00:10ce:b0:736:3979:369e with SMTP id
 d2e1a72fcca58-7702f9eb582mr15836879b3a.9.1756131446038; 
 Mon, 25 Aug 2025 07:17:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSA32/pz4JTFpftaw70l3JtTNu6V/0FjNUIWgG3oAVz7MrPT54k1XuSVABqVGbBbpJMYM7RQ==
X-Received: by 2002:a05:6a00:10ce:b0:736:3979:369e with SMTP id
 d2e1a72fcca58-7702f9eb582mr15836850b3a.9.1756131445564; 
 Mon, 25 Aug 2025 07:17:25 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:25 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:50 +0800
Subject: [PATCH v3 04/38] drm/msm/dp: re-arrange dp_display_disable() into
 functional parts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-4-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131419; l=3995;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=pcLIA/1j0xUF/hVxpkEvzGCgW0UBBqYXiTe4Lh/Hipo=;
 b=RuBdo6IucYKeLkvTVUy4/Z7tKcVlYbRA14ZBgdHUD8reN+XgzMpe10OYsuQuUGhf5UIA1PhV1
 l3LcV5otO3yDHgzX1Ov3aEX1mbeLLcesc/WV0e98Pky5MD4gVrrI9e/
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: tstdv-vRvFG4xpHtg0MbJQ06Zs0CZCMu
X-Proofpoint-ORIG-GUID: tstdv-vRvFG4xpHtg0MbJQ06Zs0CZCMu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXw48JVDL1bpoB
 B7DhKmzxFHIRZtO+uMcSWnZDQhcqsRd7ATiJ1jOoJhHBszmA0tbZNxupY0obAUQvSuskILPYwjc
 K8AW41mN8RI8QY/NuTx+QuUWvYMzXWGgyycAyWQL60tdJSXkEXrNLB6e1Ew0fu7dZ8arOvfuJIv
 tVxuys/vaKsUIBREj9TvIwqCejjoPJE2T558MiWfa3CW8lcYgy0Gs5VOnY8iTHC0chMPwyu9Yrq
 llqOrtBgRRuflZo8P1unZ8Ab6WQiai1DEzLNIbsiSry4CIdtpJwhNJhyf/pu1UkLEHF+oA1/yfA
 IznRw8mT72y0SaVaj+Dy+wQqqp60ZZaEvhzShgspuPrL0q0WeKpn4kZ5fUiYCSAqqkSASd79OG4
 3g2eL7kW
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ac7077 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zjUDaY1vqB1ZZ-tktEwA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
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

dp_display_disable() handles special case of when monitor is
disconnected from the dongle while the dongle stays connected
thereby needing a separate function dp_ctrl_off_link_stream()
for this. However with a slight rework this can still be handled
by keeping common paths same for regular and special case.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 +------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6bfd8faa1e212c3a25964677a4462e7a3a162fa4..e1ff4c6bb4f0eed2e1ff931f12ba891cf81feffb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2549,7 +2549,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	return ret;
 }
 
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2557,23 +2557,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
-
-	/* set dongle to D3 (power off) mode */
-	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
-
-	msm_dp_ctrl_mainlink_disable(ctrl);
-
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
-	}
-
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
-
-	phy_power_off(phy);
-
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
 	phy_init(phy);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 1497f1a8fc2f00991356663c19c87eb9fad48a73..93747c0a9b3f049bc877f347f05d42b66ad0dddf 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,6 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -46,4 +45,6 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
+
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 36a12150925246b168acbabf77d1206a1ef8eff5..4c74eb2915fd620868f658ccafc32030b1c208c6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -773,12 +773,20 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	if (!msm_dp_display->power_on)
 		return 0;
 
+	msm_dp_panel_disable_vsc_sdp(dp->panel);
+
+	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0) {
 		/*
 		 * irq_hpd with sink_count = 0
 		 * hdmi unplugged out of dongle
 		 */
-		msm_dp_ctrl_off_link_stream(dp->ctrl);
+
+		/* set dongle to D3 (power off) mode */
+		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_ctrl_off(dp->ctrl);
+		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt

-- 
2.34.1

