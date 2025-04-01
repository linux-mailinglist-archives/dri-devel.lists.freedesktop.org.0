Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87526A773B4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8AD10E4DC;
	Tue,  1 Apr 2025 05:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZnrR2RB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864B210E4D9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 05:11:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFDKs9015653
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Apr 2025 05:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VBSCjPGCW0P1y4nfgwnHBrOMK8O23HlmU6c+y6UxQ9k=; b=AZnrR2RBLclL33yf
 lE4aAoslAssXRenWwOIZsj19y+kHwGjLhIUzu2c7sKEchcUse+cHfhcKLra1MW7B
 5LS51S76TyEqRko9OFw1VV2+gS1/spQ2ErcwzYRsD7SHatKrVLFh+YPle7nTp5yX
 rcWwgKHhpRclTHtDpgb2r2c1TVNW+nP2LC8MoGP8CYEVLeq8qbl4CsPZIU3crrt/
 bErIQt3vUtrXvDekm06xZAIsNnSuNGCcY6YFafMFnjlw9pjgYNEvtJpN5S16UDMp
 A8peMojvb5Q0cvhMLFqg7X2M27tP07ewc89BgUIRl8ByePDUSmM7LC1UI2w1S67J
 Y22WXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvejsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 05:11:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5bb68b386so535088285a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743484315; x=1744089115;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VBSCjPGCW0P1y4nfgwnHBrOMK8O23HlmU6c+y6UxQ9k=;
 b=S9fPHnMSzknx7ic0ruzGB70ZphLlj0M8Bw9OlveDh2w8T+JxgQpn7hUB7nU7ioBumc
 5Vm70vUn9llHUZNMl71HsVuDw5LVeSWzibssYwBYNR4EGDZyIUN2WbDlSwpz95Ws6aOX
 CuktcqVffaN76LqzJ7hWG4nkj02M99zACykx2F2htmVj/As6kKAGLBKHj2pMgOyeWrJD
 INVgmgUD80wPEhHVPpvyXrhCe626yH9uonQSXJ1XbD7vfh9yX5AgFkaLJovDfJC2xEYD
 e15aIFGBmf2ZVDAvCd3NY+a1T1GnZkGoRGxCO5Fy/jAoSR9HMxcxgaAcNzfwgZ/IkCnR
 a8WQ==
X-Gm-Message-State: AOJu0YxFZLXB8sx5eyI+poa2r4G2JaZMGCw6z4mnZ5EiqXiqAuGHfknK
 gN+7y4PpMWP3lCvZ+SKR+Hd4XC7mkE+wblmVTyu5oezewvlY+R67iK6/YCqrI83AueMCfcTXFzP
 fu7EnxFU0QEJb2cwq4k58VKR/vmp6ZTRQBFo+fWo8kJkxNt/XSBL3iE/6lxGdLn1peV8=
X-Gm-Gg: ASbGncsfAe/Fwnjx9gFV39IO0hYS3+wzpZZIl2A6Twk92lSSQbn61az5Q0Kub8KglDB
 Wz6eg1qZahV0ZtgFtNZuP50/YeXTwOiyUwpEZzhQrMO7QW0w2jSF9maYjRK0OXunKZ5vMlXlEFU
 kkL+gTF/lGlhtdmFxaAyub2DicAw4SkH9ho5CaypvcMcekQS3jtR0UOS6mwRqmGh9xosu039TCL
 RC89BvY6Y79bxMzy8hDaP2ARScELIK31ghLi0SwSFbnIizpHJ7Ukj3IWK0MFP8Y+EhaCaxeCSCk
 gh/JveP/Uuuz4VMJeMknCODu+HVykYRYmzormXuMu6dSqkiBhZ/IVtQkT2aBZoBNeG4zdF+xi96
 F/DQu1+yPs3jYIjcTr0SJBf41hPpa
X-Received: by 2002:a05:620a:2904:b0:7c5:6b15:1488 with SMTP id
 af79cd13be357-7c6862ec10dmr1530046085a.10.1743484314721; 
 Mon, 31 Mar 2025 22:11:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmq8v31bGp9RgA36fTNf4A/LLjyL/mIvfn2jtE9aoUU3ok0DTMu2FADrICd9v9edcSjrDYyw==
X-Received: by 2002:a05:620a:2904:b0:7c5:6b15:1488 with SMTP id
 af79cd13be357-7c6862ec10dmr1530043285a.10.1743484314331; 
 Mon, 31 Mar 2025 22:11:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b095a21b0sm1251697e87.243.2025.03.31.22.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 22:11:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 08:11:34 +0300
Subject: [PATCH 2/7] drm/bridge: analogix_dp: drop unused argument to
 analogix_dp_prepare_panel()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-panel-return-void-v1-2-93e1be33dc8d@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
In-Reply-To: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3082;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RS0KjeYPoBvamlmnFd2NBoW0tS+Zy7JyWmtQ+gO1iuA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn63WQXl77jaWxK+F7Bmpq6cdN14tgPEK3j0x42
 2HTw0DvA1KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+t1kAAKCRCLPIo+Aiko
 1eH8CACjt+43AIX/4PZirqgVYx0D+5t+Yv8ZImawHw8xlKGyQzLeC0N282H+QQrhODQpXHhYdkJ
 cZf4VprPLKH3cmRRw8qEZmWBl6fPVgvHlPoF5nZfJkaN42VSsgIOstrZyc0DmiBdzkR2CpxaJ/0
 jT0fvN3VXrWNwnpWcTkDZin1SjHSb3BARlrzg5WvNT72FoVPpWftW1KjuQrMfzorqbdV+r1KGQx
 wefK+VLpLlHi96q5Sm0TRB4bh4IbQf9C2ObaztZYmfU5wbvOAiqr8lZiQRXhBAPpMmeL0xCmL8j
 +WHoN8Yb1kn5p2U+fMxyr9c437rdOGdbFs0QRL/l8OVryT1E
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67eb759c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Vyz2l5lDUG1q_RmMdnAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: TSxVG32gxX4ZmqDneEcnbtKcROmGbAR3
X-Proofpoint-GUID: TSxVG32gxX4ZmqDneEcnbtKcROmGbAR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010033
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

After previous cleanup all calling sites pass true as is_modeset_prepare
argument to analogix_dp_prepare_panel(). Drop dead code depending on
that argument being false.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index ab1cfc340aa95bbf13fe021bd33227b565a5458d..82dc4b01806f9728dc882b0128171838e81f21b0 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -963,13 +963,13 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
  * If @prepare is true, this function will prepare the panel. Conversely, if it
  * is false, the panel will be unprepared.
  *
- * If @is_modeset_prepare is true, the function will disregard the current state
+ * The function will disregard the current state
  * of the panel and either prepare/unprepare the panel based on @prepare. Once
  * it finishes, it will update dp->panel_is_modeset to reflect the current state
  * of the panel.
  */
 static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
-				     bool prepare, bool is_modeset_prepare)
+				     bool prepare)
 {
 	int ret = 0;
 
@@ -978,13 +978,6 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
 
 	mutex_lock(&dp->panel_lock);
 
-	/*
-	 * Exit early if this is a temporary prepare/unprepare and we're already
-	 * modeset (since we neither want to prepare twice or unprepare early).
-	 */
-	if (dp->panel_is_modeset && !is_modeset_prepare)
-		goto out;
-
 	if (prepare)
 		ret = drm_panel_prepare(dp->plat_data->panel);
 	else
@@ -993,8 +986,7 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
 	if (ret)
 		goto out;
 
-	if (is_modeset_prepare)
-		dp->panel_is_modeset = prepare;
+	dp->panel_is_modeset = prepare;
 
 out:
 	mutex_unlock(&dp->panel_lock);
@@ -1072,7 +1064,6 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
 	enum drm_connector_status status = connector_status_disconnected;
-	int ret;
 
 	if (dp->plat_data->panel)
 		return connector_status_connected;
@@ -1194,7 +1185,7 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
 
-	ret = analogix_dp_prepare_panel(dp, true, true);
+	ret = analogix_dp_prepare_panel(dp, true);
 	if (ret)
 		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
 }
@@ -1294,7 +1285,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 
 	pm_runtime_put_sync(dp->dev);
 
-	ret = analogix_dp_prepare_panel(dp, false, true);
+	ret = analogix_dp_prepare_panel(dp, false);
 	if (ret)
 		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
 

-- 
2.39.5

