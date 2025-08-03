Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3903B193E6
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 13:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAF110E1DA;
	Sun,  3 Aug 2025 11:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfVw/9to";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680B010E1D6
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 11:54:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5734d3JS021611
 for <dri-devel@lists.freedesktop.org>; Sun, 3 Aug 2025 11:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=; b=BfVw/9to//LrIK8s
 VXJEXmVCiEgN+jwiLXUa3IP/qCazSwoZtY70Xrf3yuj98LPBQk74JI/K4rccamH8
 fjRfoSpT0qochLZPvtOcknVP7vFVn1OZ2BcSJM1IPDvs5bPb/2BmOIHlYR1PtHmH
 H5LZPked8kVU9kUEEpf05MiOctYkAT9dCd3K58ueTYKKlSdEifLYfQ9qGowHJ+bg
 TryaGyR58PBWa1/7YLv1bnd9OInRSvBH1azQZ+eWjIbqWfNBPaPhfMritNCtgFIS
 RkAEJ33RKnb+WlV0Y37gz7uoWi+7nlWtece6CWzaxxTHlPhmXiwA5/hrP5rNSWS7
 yrOBpA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek261a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 11:54:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e7fc5f1e45so41548685a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 04:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754222044; x=1754826844;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=;
 b=p1QmhM3rSfiqTDML75SDWhniNANlCuRl0hYX5C1db/0SeT6XloNYAW+xj88s6o0Kl5
 QxzSHU27VSnZ53sVE/B4eQcGOvvcNZqDkH4vJsMalybGeK5Y35plpG3E3VZblrv4suDz
 A6QX641+t7QRyoGpVLnANuVJ3rmT2TaacvubamIWaMR5AV05tchFloyMZjZTGzIezBqo
 GAPgIq9yS0r70hGd6uRryrKk6buFbGvrBR3B7he1UoK3W+Xd+05dStEQ0NHgxTvQ0sNz
 F7uJcDEt7+rhfqr49cOjZWRnCgQCFlygq6qZVbQEyuMhajM0JNx5pHgspARe1y/+642S
 ajgQ==
X-Gm-Message-State: AOJu0YyAxAHAYaFNCQtqqVeoNaKC3ghBmiWZ6pcFPbGlKFbnuKU/Adg7
 TM55+LE87W2ZDWC7kN+H6NVjyf+NbtZIy6dZsRKlNeXiCNwflk4T3tQtuNuqVvkBaGV8o+WwLlo
 6UGk39NRXDuARWlj0A4q9fZdKh4tpTHRdv9XtmhPpxzLs1lBou8xAIn6brRNVEKN/dzgLQRQ=
X-Gm-Gg: ASbGncvOr9rGCvx0qQVBZ4CLLRcp5UIUDcBdiGV8RTuR2qsIht8mQGAvGBXGarBk2IV
 CZaT9fgwPqJwJSwKG87rZsdqXr919L7Mvvzw2BdfGXAqg8grba8cNqL0CYW8snw+rYaCZlXqRdp
 4E13uKhpG7e1gx+1ycfloOGIsDtkZ/302bTZZcj76fydL04bv46x3ns626EXSnaL9nlHtwJ4jgd
 oA7Ag3jFVBLVB1OuevbnUObDTI1cU+KHm/vTVHWSeXSkbtglWcWxnr9M3YI2A9MSESXnvpc9tkX
 rJM2cfp+VvvchdWTm35X4rzh7Txfy+8XZQm7Hmco+s0jHPuHwYRynDHaqyUJ29ddYHYZNB946aA
 +bDVq1ECgfqaXHp7ATTXHU4+Nlt9of59FcQWgTx/a6KUaYJvOmS+G
X-Received: by 2002:a05:620a:a512:b0:7e3:4413:e492 with SMTP id
 af79cd13be357-7e6963b6948mr669905885a.62.1754222044410; 
 Sun, 03 Aug 2025 04:54:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi7Z0g+HyOmwylpAHIiombJAZTJQt2apb7Na+ugRVHriOOOlyXxwTa0sV5vkEVVpsO/Em1Bg==
X-Received: by 2002:a05:620a:a512:b0:7e3:4413:e492 with SMTP id
 af79cd13be357-7e6963b6948mr669902785a.62.1754222043929; 
 Sun, 03 Aug 2025 04:54:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332382a6f74sm13281731fa.20.2025.08.03.04.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 04:53:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 03 Aug 2025 14:53:51 +0300
Subject: [PATCH RESEND 1/2] drm/bridge: add connector argument to
 .hpd_notify callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250803-lt9611uxc-hdmi-v1-1-cb9ce1793acf@oss.qualcomm.com>
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4403;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DqScOxpZEjas1EiNHxjLEq5FN9iLRQvzJiWpGwrXHf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoj03TORatWDOhTPjdc70eBEsioKoAJxcth/ivq
 6H3TOAa2NaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaI9N0wAKCRCLPIo+Aiko
 1QxoB/4i8bbQq2ZRNNqvbwxjSBbSZKHD3rqd1LvOlKVXxTCw9xRz7M59eO61jbwviaJTjcUWHtr
 nat0Tkw4bP4fyurXtBFoiOk5cjelwMu530WZgg72N7d4pTcMgIaNVqiOVnXdSybVb57migXZRtW
 ahHeSSx7JKf534W/gUtiNJ5HZV1UEIDs8AVUPdLYZ34oZ3rcwTPS0PnFafnn9n0/GDPT5WUE2JR
 1aPLLB5OixRNVZW19DBu7pO7f6V8vgUkBVwmVlApeKGve4pHDLA9H4ASGTTie+Mf/kPC+y3YDFu
 r8DUxHju5Qzz75JBY5gJEUuBL4zPUX+E/EF/F/p89lW3t9qW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=688f4ddd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=H7fCCF_eaumybVcuHoAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA4MCBTYWx0ZWRfX40/CfdVOnTaK
 ab5SrcH+iqr2l6Hg/m4vRdPrtqcqyUwqBqi/yZcOcMfd2mScEptbs8tAuprIOTK61q0eui+GHVZ
 n4/7F+rXV3px9EeeJczGyk9oxNMyXBtxYASMx4IcBdlfxhmj/jJ7llIt3Nvgs4iA0fvnkI4fv9O
 Ad1DlLzytyOOgIwWT/IyVPYY+S/STwupEBlFA3+FPe9Jvg0DN1X9tNG6jSLHAJmR0wNOeKYkts0
 0pp66nkscab6ErRGmb2iAUxCkthm/K5SDAHW0Sqc9bUk2U/W0SBCy8Qb8desJw9ccU3hg/8jCf7
 STpJH7aC5j32A83GteX0qMCHyN09HswGtrJi4SQ4BAI9u4nxOenWfj6j3c6MNCgSMXyJIDi1G3f
 amudFO3G6lsB41RjN+t6ljJVXwLyFwaDSU5YKZzv5I/cXgJ9jBzSQ8/lU/GTNp1j2vDWnA0Z
X-Proofpoint-ORIG-GUID: ifHZ9_KZgllWrHKn4Ix0fMhxW-B3qw34
X-Proofpoint-GUID: ifHZ9_KZgllWrHKn4Ix0fMhxW-B3qw34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508030080
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

Drivers might need to update DRM connector in the
drm_bridge_funcs.hpd_notify callback (e.g. it might be necessary to
update EDID before setting ELD). Add corresponding argument to the
callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 1 +
 include/drm/drm_bridge.h                       | 1 +
 6 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5eb7e9bfe36116c9618cd3773f1c01e7ebb573be..f2fd277d694b8c959f913517ff5861b777d8a9dd 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, status);
+			bridge->funcs->hpd_notify(bridge, connector, status);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 8205ee56a691ee7d166b16cfce6932d0308fe6c4..a665c9036878c1e879b7bd88df1d523658fe8849 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,6 +323,7 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 }
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
+					  struct drm_connector *connector,
 					  enum drm_connector_status status)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..0676b3423abcb31ac3ea6e6269473764786133ed 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1774,7 +1774,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 }
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
-			  enum drm_connector_status status)
+			      struct drm_connector *connector,
+			      enum drm_connector_status status)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index d8c9b905f8bfb5abe47c1cb26d17bc605e3e1ba6..9eb3431dd93adf096f45b6d981967734bc8a2b0c 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -40,6 +40,7 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
-			  enum drm_connector_status status);
+			      struct drm_connector *connector,
+			      enum drm_connector_status status);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 3cd612af24498b057c33eaecb3d43c8df76cd23e..29b2dfb90b5fa3b137d05725d65a1cccb9cd1345 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -428,6 +428,7 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 }
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
+				    struct drm_connector *connector,
 				    enum drm_connector_status status)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8ed80cad77ec4b40d0aa6159e802a2839d5b8792..1e73d72c55426ec21905070a13b44aa36b02e023 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -730,6 +730,7 @@ struct drm_bridge_funcs {
 	 * controllers for HDMI bridges.
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
+			   struct drm_connector *connector,
 			   enum drm_connector_status status);
 
 	/**

-- 
2.39.5

