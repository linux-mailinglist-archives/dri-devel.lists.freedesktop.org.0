Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB1C874076
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 20:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A3410EAE7;
	Wed,  6 Mar 2024 19:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NRvZ56an";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482CC10EAE7;
 Wed,  6 Mar 2024 19:35:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 426CdcqU018349; Wed, 6 Mar 2024 19:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=m5DODR7
 oHkQLg2OnCJGzvuV/0d9WXyqGzthBu8BtHWY=; b=NRvZ56anpTY+pyOe7opCllT
 4Ar4fi6/mxLQenW2nOmb+KgbbgIoFt4LQ+jzu9I2FPqm9MlhKX+cfihDhHBllSjb
 fihbCvJVhwR79mugUF2R0qXXoz3eT06hB1MiVQ1Y3Gu0dRxAiynB/u5bCim81UTO
 yw34BDJyLhlthDO8zss3pD8CZM2gJqUgGcmRkmeroKCIZMgUdcJGVXW13Lu1j8SQ
 v4aDCWyjUT5TZApSiumWlF/yE5zp1PFI4YEpQ33CMlsVoSbC3tLJKbNpqgorN9ez
 zEw4tKtM6nlUQ5YGEN818qnqdzAkeoxyrESwHD65MKyXSTOmonXzns/k+Dp1BgA=
 =
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpkkaspkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Mar 2024 19:35:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 426JZVgq001956
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Mar 2024 19:35:31 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 6 Mar 2024 11:35:31 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>
CC: <dri-devel@lists.freedesktop.org>, <swboyd@chromium.org>,
 <quic_jesszhan@quicinc.com>, <quic_parellan@quicinc.com>, Rob Clark
 <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm/dp: fix typo in
 dp_display_handle_port_status_changed()
Date: Wed, 6 Mar 2024 11:35:15 -0800
Message-ID: <20240306193515.455388-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kZhXh8mpvTGWDe2ETEjy6fxrIZ7Rm6tm
X-Proofpoint-GUID: kZhXh8mpvTGWDe2ETEjy6fxrIZ7Rm6tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_12,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060159
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

Fix the typo in the name of dp_display_handle_port_status_changed().

Fixes: c58eb1b54fee ("drm/msm/dp: fix connect/disconnect handled at irq_hpd")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c8e1bbebdffe..068d44eeaa07 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -479,7 +479,7 @@ static void dp_display_handle_video_request(struct dp_display_private *dp)
 	}
 }
 
-static int dp_display_handle_port_ststus_changed(struct dp_display_private *dp)
+static int dp_display_handle_port_status_changed(struct dp_display_private *dp)
 {
 	int rc = 0;
 
@@ -536,7 +536,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		drm_dbg_dp(dp->drm_dev, "hpd_state=%d sink_request=%d\n",
 					dp->hpd_state, sink_request);
 		if (sink_request & DS_PORT_STATUS_CHANGED)
-			rc = dp_display_handle_port_ststus_changed(dp);
+			rc = dp_display_handle_port_status_changed(dp);
 		else
 			rc = dp_display_handle_irq_hpd(dp);
 	}
-- 
2.34.1

