Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B599B028A4
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F313D10E16D;
	Sat, 12 Jul 2025 00:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AsFoYw/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823FB10EB14
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0hWm0003248
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0C88ySzlRVkPe1hio0ux/weKP4+LF6gD4q5Pn05V+2c=; b=AsFoYw/H0Y/6cHx/
 +C2RsolKjMFnDo7LMpuiorvS7yob2yWs4rOeezMSrgJbNsQVs66Zti4s7vw5DzgD
 Xtsuwy/k7cl6Cgu3uruw5rrBuvKCOrNP4CuuWKOppxHLO9CsVqUHgIK6S1fNm2Tm
 jQUSwUQQ8+nJhqZeBJUYc5mAQ1Ko55SShmcrNTScTwk/jFfKxFpPL1poYMlRrG8k
 k86wB22n3TJmPwXv0JwrLMR4gcibNgarCah7FsNfXv4JttMWRTqdhg29mhrpDF7t
 qJIGY5X8vtTqsRJOxK9DuKrdkpLNpHfa1hpVdsalWubr4Ytb9jurUq1/PWug611z
 EFSCBA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uddjr0q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-313f702d37fso2783412a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281935; x=1752886735;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0C88ySzlRVkPe1hio0ux/weKP4+LF6gD4q5Pn05V+2c=;
 b=wPpwFNcpvLdZARTUXE+qj7L0zffoo0L7X8uYMtRXS3H4qimeJ3YEYH+G2JdPO1i02F
 t+siVJ0szqQrHIOuScthnKoKaoew/oThYtiBga0Ul6z0EUdceoTcLd11pSACaMDGa1nK
 NMiuAGI+Yn6TRV28OfVmXUaMm0A0e+D5xV/soL31RRAmUJPViyqiX19j5EeL1f3Khe0s
 N0TuKjUvvVazMtCR0tfAiwQf2ZW3EjW7S7cUthtj3swW8t/lpZixwPdtAQBRv3KFy5mU
 m82Gytd9BZk+UMH7K3UrJIMIA3JKruVGFXdC22+Nc/5dxIP8tYfYn1AIKGLRBDKk1Z8l
 kyRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwpyBDcxZR9i3bc+/TSySiVKM7BT1ZsOjNIXLF9w7TpKkF8hs0NK9vzD/e3K6a+9qkmN3+tYZCjCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywc/mvf0xTVrsX8mO0fDPBzfucf17OepisqZrHlgA/iTAVrt+XB
 IwBQxb/WRvwwxivee5YSz8eIn40FoDG/ZtXdQD16zLhTWw9ey9f8ADA1AfqtFzLUtWHWwGh6h7g
 YpSlyYhNy5L6961oGWfbK0EIeKSE6Ain9rPAqiD7/YIyP11BTOpMNq8NhvJ7NGn9ObdaZPNE=
X-Gm-Gg: ASbGncv8zrSLTFmKsD4TuCs4CYiEvnxt8XKk8p4VhNFANP+1hBoO+PxncX56LQto2DB
 d08L2L4S6udIAhTzstxMgrVq5Uwv4QR+H/j/DlQyQlBv2f5C98WCsf5vqN3lL/wAtA4jPHNJVdU
 gnkS4xTHiJCb4T7C9DciShJpwlV5CpT70uJwwggtDeBRJot0jnHb9MSveNDUuAzrJyC3NpCkqpB
 Zrsr3dZmvhpQutHfKvrXn7I2e99XBHen15geva6AEpw60S/KrQ7/BH2dDZM0jEbOKHV0SAWX6VX
 ueUpMhXorErJUGGb1h07cltYK4HLwfHU9LmoKHjVTpntmrxwo1Yxj7//hWeU9BHvK9qCTwnof5q
 NkVueOH7RkuL1PmQoSBh8rnay
X-Received: by 2002:a17:90b:3806:b0:313:352f:6620 with SMTP id
 98e67ed59e1d1-31c4f48b065mr6358985a91.4.1752281934871; 
 Fri, 11 Jul 2025 17:58:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSMo65Z+KjgTkv6KVMymiCmYn2CuabOGuLC9Bx4y8ORCEvQnAn1GjeeBbaCqqC88pcfO/NfA==
X-Received: by 2002:a17:90b:3806:b0:313:352f:6620 with SMTP id
 98e67ed59e1d1-31c4f48b065mr6358959a91.4.1752281934320; 
 Fri, 11 Jul 2025 17:58:54 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:53 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:23 -0700
Subject: [PATCH 18/19] drm/msm/dp: Move link training to atomic_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-18-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=3032;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=HYg9XWFkcmpF+zp7toVqFdfKLKICGtSNzR5KskC59d4=;
 b=7+gsmDRAKN2VpsBwMET5tAsE9ulwWLuSi/xwkZxe0AroYvNbWoU1IavIh8Q0oGY/KFhURfV7+
 fSMh0NidnKiAc5SKyTQ023CgPOMIPnYaXRICzE7VRl37GEZkUnNC+lK
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: D7vudGkkQf0_ZHZG3HnNnItDUivCx-Ng
X-Proofpoint-GUID: D7vudGkkQf0_ZHZG3HnNnItDUivCx-Ng
X-Authority-Analysis: v=2.4 cv=ZPrXmW7b c=1 sm=1 tr=0 ts=6871b34f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=lFCKDqVE_jtoW-ZCWqQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNCBTYWx0ZWRfXxijL047sRhLA
 rrsstReWxlyRLsClGRYQk69DbpGt50I6EvmjNvgyYBtpm3CM9UiRfv8kWZpyRtBbP0IIMh5pRyZ
 1lBID8r4/agDyzpXgz95cpzR34F6RgLNctkSSkoyqUIL/AHTZ2in9PTqvnv3QTPDqYmBEFusn8R
 g7EJQg1BPwFFV7c0FbKT3hk5E+oVJ28oAEX56VNgTdqWVG/rSXGBZLD9Jts62NrPOiFMm6lZ9/e
 S2KSBLDulNuu2tjqh4xQuCgHhsMqGkz2j1C+a9E8SPxC1M4ODx378WYLUbvlz/QGRludxq+/kla
 OF039lMYpI4gpUth444KcGFDFc7j+JIC27rzLG97+FeaBMcDVVKhCG1z5nVXA0vaCmGd2v3bbqv
 cBMfU60edL2fAAfn/lhs3pkX/9+gZBy8czKdp+FCS/QMIrH5hd/9UHNlchnCOAvQfqLmZsQA
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

Currently, the DP link training is being done during HPD. Move
link training to atomic_enable() in accordance with the atomic_enable()
documentation.

In addition, don't disable the link until atomic_post_disable() (as part
of the dp_ctrl_off[_link_stream]() helpers).

Since the link training is moved to a later part of the enable sequence,
change the bridge detect() to return true when the display is physically
connected instead of when the link is ready.

Finally, call the plug/unplug handlers directly in hpd_notify() instead
of queueing them in the event thread so that they aren't preempted by
other events.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
 drivers/gpu/drm/msm/dp/dp_drm.c     |  6 +++---
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 87f2750a99ca..32e1ee40c2c3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -410,11 +410,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
-	if (rc) {
-		DRM_ERROR("failed to complete DP link training\n");
-		goto end;
-	}
 
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
@@ -1561,6 +1556,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		force_link_train = true;
 	}
 
+	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	if (rc) {
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
+	}
+
 	msm_dp_display_enable(msm_dp_display, force_link_train);
 
 	rc = msm_dp_display_post_enable(dp);
@@ -1706,7 +1707,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		return;
 
 	if (!msm_dp_display->link_ready && status == connector_status_connected)
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		msm_dp_hpd_plug_handle(dp, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
-		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		msm_dp_hpd_unplug_handle(dp, 0);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index b12a43499c54..3bcdf00b2d95 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -26,10 +26,10 @@ static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
 
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
-	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		str_true_false(dp->link_ready));
+	drm_dbg_dp(dp->drm_dev, "connected = %s\n",
+		str_true_false(dp->connected));
 
-	return (dp->link_ready) ? connector_status_connected :
+	return (dp->connected) ? connector_status_connected :
 					connector_status_disconnected;
 }
 

-- 
2.50.1

