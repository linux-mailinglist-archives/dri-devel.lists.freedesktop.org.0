Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC9CA773B9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1D010E4DF;
	Tue,  1 Apr 2025 05:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQo7V+Pt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE9510E4DF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 05:12:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFDSjI027732
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Apr 2025 05:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RzXLwKeO3UWlZHuYhJkCQ7vw+BiQ3N3j/vqzkaMxh64=; b=OQo7V+PtnCVB22oV
 UQzcSe8WKRANQ55hbH1CiU2dY/Hv32wN5yNqAXnCj0DCK7yry+ewzhC1StsxAlka
 g+8U1zLqeoPGjYN6P+xYoJN+SKpN7yzn9iHOtRGhXpzModLSFTxmL4pnixZl0Qdi
 rqFbaDeqOV/Rv9Z+pJEmTbO/RhWsrHH26gTzF5t0cHZATiXGSyNUbDMPAXMCRnUZ
 QyfrUpTkbsp2K0MOrwmRguyHe+0k3r8AyMGllT/wqFp/QjMeINw3dFaH2xtknY/E
 f+HbJgNv3tv5kTDUcFGJRb839QYeizneGpSErfPLxDBHANf9EuwsTsmRjKBgg0yV
 FFLFcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhpr1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 05:12:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5c77aff55so1277833785a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743484329; x=1744089129;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RzXLwKeO3UWlZHuYhJkCQ7vw+BiQ3N3j/vqzkaMxh64=;
 b=Jd2EL9CW3hwUucAIcYJFApyv1burO1z3caDpD9pVwnGicsn2099iKC8iQnvPKaK8LH
 STPG2/0dD4ENznm2DmD8kuSxtrijlwYnQ+SksS6QrDFMuW/AVJqIlY67s6Jb8IyaArkc
 qND260qzwVYX90BctoRKF+A6gIlPf4s7GbeyjJOhLHSox++B3f+W6aQX5rUI4jHW77qd
 qEBQCkUt0w5KnL6J5Ygop9UApJFX6Oso+8PwkUBU/nWPbWNqRq2vqyoY7dgJa4Juc73k
 79QdHql2CPx7uNI+YlH4J7hCncGRb1lgOyLiMGZqjtcMsQtkIB95JHvwY+oXqZf96hjH
 wcJg==
X-Gm-Message-State: AOJu0YwTgRhBNvgKWjQU3xb9p/uHlP3xcLFGKnlnln2VWfsgXxffWKSs
 bGypKakqyRTjccodhTm8uW5+aoWFE8FEI4pVdUtxi4cOhhiVfBYxA4VyBnYAG4ZAqm2IjSh2WHZ
 Y8cCu695i4kEIfl/PbNelfwiPImN2oPB5nV1UyKSjb6QbA6jjUmrfwSVC16WV0/XcJjo=
X-Gm-Gg: ASbGncuza8L8iUXvsjlNGsuTwWABHx4bFpWDR4j5ylirWugLKcNTFlFhANUKRtVGOmq
 Y5fBgc2CHzbsWp0mMrNwWd9iCSxSiMOunQ7I81khS+mtk2dN3G205s7hZk0n3GUG4lxVZMQTDWg
 ksqmDNiF1e8UuAG2mLYEZrYfHKBDLOr2emYOJyUw6502aDEzmkHvDjLQiAhYWE6f3wvIu5R1q8W
 H0TavaTlQjeYJV4mbZ/5oW0OeFWFNUN8x0qI2F/KRXdvJHz72izry049Yn9DgCfvtFg3mpjEf8g
 qvkHHdK6Fknc6Lep1yXl+AtMAPNTLnO2CBrpcIVIZT5g7C4RWb66mGJEH6RyPoR+hoLTkC6iGYq
 VZ7Rfb95sS8zb6ftq9CwhOt4WLx7S
X-Received: by 2002:a05:620a:3950:b0:7c5:4949:23f2 with SMTP id
 af79cd13be357-7c6908756d3mr1644561785a.44.1743484329393; 
 Mon, 31 Mar 2025 22:12:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ/M7+Jnk+uK2Lr8W86kFPh1dzbXpco8cTxC1B6tbBsO/4N53MtP19Yw6evFH+z30KAW771A==
X-Received: by 2002:a05:620a:3950:b0:7c5:4949:23f2 with SMTP id
 af79cd13be357-7c6908756d3mr1644559285a.44.1743484329010; 
 Mon, 31 Mar 2025 22:12:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b095a21b0sm1251697e87.243.2025.03.31.22.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 22:12:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 08:11:38 +0300
Subject: [PATCH 6/7] drm/bridge: analogix_dp: ignore return values of
 drm_panel_* calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-panel-return-void-v1-6-93e1be33dc8d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3703;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NJl7bsXfNLqpNqUOkFTfyECJOLD0rCpvvEtqImrQuV8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn63WRGK/Kq2L2EzNQw3/2jLhnkOU7Fr5jcjpTL
 n+0mz6GO/eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+t1kQAKCRCLPIo+Aiko
 1bJwB/9wEq7tEGADlYD+RoVIKmJWwgU1otLJ1mX9j6GkBVMnGx1UwZw1OsNcKmJ36nK7ZKughYz
 3PXLs4vW0AxOpkk8pWSY3vvnSvxExp4DhNfQKuAl36u1+mLfNDw/QpWcL6MhIT/73Dzco2af0A1
 AMf9j+y6n8gwV2uT+8R6Z/inO28KqY0ThHsZaDdmuf8znOdq2SfA0PSOeQrfU+UcUL3FhPV5wSo
 HnBI0L+3NzIagrb9GzySE4suhsbhm7WhBQR6oCyi89z60XGwmP9Kyqd2d2FFcMvSlhmMJJDpfor
 j8/FKOleLOG9z/OBh1vm6Nnhm7ouIhofqHCY30Su46Age0Gc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 0Rp8yrTKBQ4SfkyGHci08lWJPmrEQVnT
X-Proofpoint-ORIG-GUID: 0Rp8yrTKBQ4SfkyGHci08lWJPmrEQVnT
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67eb75ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=fEsDx3e4H4ijciuaGfYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010033
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

Follow the example of other drivers and ignore return values of the
drm_panel_prepare() / unprepare() / enable() / disable() calls. There is
no possible error recovery, so the driver just logs a message.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 39 ++++------------------
 1 file changed, 6 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index f60068011008482f7b7b2edfcab5fb1b3e9e130f..c7dffdae31877ae194fc6b0a5bf21be203f7dcc4 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -838,10 +838,7 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
 	int ret;
 
 	/* Keep the panel disabled while we configure video */
-	if (dp->plat_data->panel) {
-		if (drm_panel_disable(dp->plat_data->panel))
-			DRM_ERROR("failed to disable the panel\n");
-	}
+	drm_panel_disable(dp->plat_data->panel);
 
 	ret = analogix_dp_train_link(dp);
 	if (ret) {
@@ -863,13 +860,7 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
 	}
 
 	/* Safe to enable the panel now */
-	if (dp->plat_data->panel) {
-		ret = drm_panel_enable(dp->plat_data->panel);
-		if (ret) {
-			DRM_ERROR("failed to enable the panel\n");
-			return ret;
-		}
-	}
+	drm_panel_enable(dp->plat_data->panel);
 
 	/* Check whether panel supports fast training */
 	ret = analogix_dp_fast_link_train_detection(dp);
@@ -1136,7 +1127,6 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
-	int ret;
 
 	crtc = analogix_dp_get_new_crtc(dp, old_state);
 	if (!crtc)
@@ -1147,11 +1137,7 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
 
-	if (dp->plat_data->panel) {
-		ret = drm_panel_prepare(dp->plat_data->panel);
-		if (ret)
-			DRM_ERROR("failed to prepare the panel ret = %d\n", ret);
-	}
+	drm_panel_prepare(dp->plat_data->panel);
 }
 
 static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
@@ -1231,17 +1217,11 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 {
 	struct analogix_dp_device *dp = bridge->driver_private;
-	int ret;
 
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
 
-	if (dp->plat_data->panel) {
-		if (drm_panel_disable(dp->plat_data->panel)) {
-			DRM_ERROR("failed to disable the panel\n");
-			return;
-		}
-	}
+	drm_panel_disable(dp->plat_data->panel);
 
 	disable_irq(dp->irq);
 
@@ -1249,11 +1229,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 
 	pm_runtime_put_sync(dp->dev);
 
-	if (dp->plat_data->panel) {
-		ret = drm_panel_unprepare(dp->plat_data->panel);
-		if (ret)
-			DRM_ERROR("failed to unprepare the panel ret = %d\n", ret);
-	}
+	drm_panel_unprepare(dp->plat_data->panel);
 
 	dp->fast_train_enable = false;
 	dp->psr_supported = false;
@@ -1678,10 +1654,7 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
 	analogix_dp_bridge_disable(dp->bridge);
 	dp->connector.funcs->destroy(&dp->connector);
 
-	if (dp->plat_data->panel) {
-		if (drm_panel_unprepare(dp->plat_data->panel))
-			DRM_ERROR("failed to turnoff the panel\n");
-	}
+	drm_panel_unprepare(dp->plat_data->panel);
 
 	drm_dp_aux_unregister(&dp->aux);
 

-- 
2.39.5

