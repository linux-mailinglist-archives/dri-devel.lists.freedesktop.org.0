Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 183DC5B0B62
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 19:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A750410E7F9;
	Wed,  7 Sep 2022 17:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4862310E7F9;
 Wed,  7 Sep 2022 17:21:59 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 287CxmcB025725;
 Wed, 7 Sep 2022 17:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=9ukwriFT3hEu5Om6UVyZI9cMcULqyyS/q2DbWeK2S0w=;
 b=Sm/kFin6xjmdLajEVlEqopfAl9S4f+H+1v0u71wdSbcUfI+ftxaz7i85GpKY4okr/KSe
 0afDAslWqPRxKuRY64/BMVL8dfyPDj/fgjkXw9H/h3R+LNrGvama9R5LHgwaP63t+Ncy
 b4ZRrMfNnlJdiaFcvunOq9n9AlJ+kRCdOC1puCUwpBXKBGH0VeHP1+8sRM5u0KNNjI8I
 tyU8kuJDYAjWdab2v9uOyMbH7EG/cHZfAClVymdvTHxLIEM3vvLeAIGPM9Pnmq7x/cI6
 eSVSy4qBl8SfBqjHSmZjHP1aD3IKQFXfFK1c9WOiM0LEksmP1d4ccmpkBN6JhSVSrHsi ww== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jer1x2182-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 17:21:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 287HLoJe028339
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 7 Sep 2022 17:21:50 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 7 Sep 2022 10:21:49 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH] drm/msm/dp: cleared DP_DOWNSPREAD_CTRL register before start
 link training
Date: Wed, 7 Sep 2022 10:21:40 -0700
Message-ID: <1662571300-4898-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8PEwNNaT_BV7xmCgo2B1xe0NjZANEolb
X-Proofpoint-GUID: 8PEwNNaT_BV7xmCgo2B1xe0NjZANEolb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_08,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 malwarescore=0 clxscore=1011 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209070066
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DOWNSPREAD_CTRL (0x107) shall be cleared to 0 upon power-on reset or an
upstream device disconnect. This patch will enforce this rule by always
cleared DOWNPREAD_CTRL register to 0 before start link training. At rare
case that DP MSA timing parameters may be mis-interpreted by the sinker
which causes audio sampling rate be calculated wrongly and cause audio
did not work at sinker if DOWNSPREAD_CTRL register is not cleared to 0.
This patch also make sure bring sinker out of D3 power-down mode into D0
(normal operation mode) successfully by retrying 3 times.

Fixes: 154b5a7da0fd ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c |  5 ++---
 drivers/gpu/drm/msm/dp/dp_link.c | 17 +++++++++++------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index ab6aa13..e864a6e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1245,7 +1245,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 {
 	int ret = 0;
 	const u8 *dpcd = ctrl->panel->dpcd;
-	u8 encoding = DP_SET_ANSI_8B10B;
+	u8 encoding[2] = {0, DP_SET_ANSI_8B10B};
 	u8 ssc;
 	u8 assr;
 	struct dp_link_info link_info = {0};
@@ -1263,8 +1263,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 		drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
 	}
 
-	drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
-				&encoding, 1);
+	drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, encoding, 2);
 
 	if (drm_dp_alternate_scrambler_reset_cap(dpcd)) {
 		assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 36f0af0..3ad3826 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -49,7 +49,7 @@ static int dp_aux_link_power_up(struct drm_dp_aux *aux,
 					struct dp_link_info *link)
 {
 	u8 value;
-	int err;
+	int i, err;
 
 	if (link->revision < 0x11)
 		return 0;
@@ -61,11 +61,16 @@ static int dp_aux_link_power_up(struct drm_dp_aux *aux,
 	value &= ~DP_SET_POWER_MASK;
 	value |= DP_SET_POWER_D0;
 
-	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
-	if (err < 0)
-		return err;
-
-	usleep_range(1000, 2000);
+	/*
+	 * When turning on, we need to retry for 1ms to give the sink
+	 * time to wake up.
+	 */
+	for (i = 0; i < 3; i++) {
+	        err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
+		usleep_range(1000, 2000);
+		if (err == 1)
+			break;
+	}
 
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

