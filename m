Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6B8A773B7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272C110E4E1;
	Tue,  1 Apr 2025 05:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwJh+sYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AC910E4DF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 05:12:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFD0g5007671
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Apr 2025 05:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0UCfqpWUdUcNvimGZ1R1IpBbubClaHeqHcxpWdaScnE=; b=jwJh+sYMtDYECFOC
 GDaeEH5NXWRKXhM6QRPdmkX2HTCptptJwQQZHu/EL/MDFiWhXCNno9yhamXzGlrp
 YfS4eMJIQT44YJ1rqPKVRjBONr0LDXZ97LB6bb9Zf1ldaOefLijq3IBjT/v7FnXy
 TKi9lQqoobD+7eXvheydE5MYxQFbhKGfqYw9m7F7aIeX4b1AKjYBxQ4bDL3bq1qm
 hGujtoilQUyKBb9oiUJIfAcMTsQHMC29sQ+uG6zaIWALU9Lf/piSiEdqj/EJ9aRp
 e8MXXozoAXHD4JZ7R7+EgRxa2VnFWmWy8c2Z4XfyUMBd3uaqeImnA75lulQ5KLng
 iUHvkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1nxdw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 05:12:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5c82c6d72so950761885a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743484326; x=1744089126;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0UCfqpWUdUcNvimGZ1R1IpBbubClaHeqHcxpWdaScnE=;
 b=pbiJP72JYhi8ZZAmPkLhdErUJIbTz9447yTV/0u84b0FGdbU8TGa3xhyhTNyGz5TSr
 l7ycTz2Gia6CszOmAQ0IgmdHLEK7pHe0prvDTkdypFmzomSBb5uGSwRqOT9oueEB3LOy
 BTmCE7syqZ1EP5IxPdq49/X5d7ThhVl1EEC2drz6si/Z/XiGDAcw4/5UtyyG1bOPzbHg
 zIzrFjF3ZKvhFzKm1QjjzSW1SoryAqfO7czuI1xWYJqUV0sPeUU7D6RGfCGxSxpXixce
 BVnajLd62rkHqRFJBiwunieSg9JtDAmESnonsAoexXJuL4nsBpfFx1nZTAr372J/xkzn
 3hLA==
X-Gm-Message-State: AOJu0Yx2wrdlnZ+kMFXDpJwvZQojZqfRdZb3/vqfnSWz23OXs4ueVe+c
 t8uTSstK3vSUItJGaqdRqGwYnWrTNd9SjQvqEEAOt8pZFAXIDbf6xDI5L64enSaVpHXTu4lTOIw
 6+kNaEk0rC6MpQXiwLOrOeqFrjX2ONGtODCek+DjEAmIeMzg4F2I31IW9aok59wOO3lM=
X-Gm-Gg: ASbGncvWDCwJrjo/myZ4VGyKIRkUwBCxK+k/FETMvcWH3ba6wv1KPUB2qTizLTs7WYp
 /SL6e5K6+PORhcOKQzizB0JwIS+MYZ840jlmuMCPyoAVGTV621+wZMtEJJUxKzho/Ft1vym4Tvd
 VxmsiopWaCQ76gPIwTU0l4SDS8+w+gnNV4T0BR71CnIW0GG3sxYiADCIZ/HzBrJq6sKPkIhwNBi
 BSi0qx/cIAc+eW2I+DahAS8KFasLCKiy2yMnCQNpx1cHHBFlXkplFHO0IjKpa6zKs5y/OISwyew
 R2H/LP6fv6tmbgTMvdP+1RlWee4vula203vPzt1ZGPOpnrH2b/HyXwvR7P2eM49aTk/AwB1Bn4t
 z1V8ewUg4gta5SgqLbfZYbEI36Lit
X-Received: by 2002:a05:620a:294b:b0:7c5:f6d9:86ec with SMTP id
 af79cd13be357-7c6908757d6mr1708208785a.35.1743484325694; 
 Mon, 31 Mar 2025 22:12:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1zNjxGnB5My+rC0jxfqxqMFbTxnTup9jnK/AiA2lDXPM6z0hy3tkrX7AvXWBzpu54TzEAfQ==
X-Received: by 2002:a05:620a:294b:b0:7c5:f6d9:86ec with SMTP id
 af79cd13be357-7c6908757d6mr1708206585a.35.1743484325402; 
 Mon, 31 Mar 2025 22:12:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b095a21b0sm1251697e87.243.2025.03.31.22.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 22:12:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 08:11:37 +0300
Subject: [PATCH 5/7] drm/bridge: analogix_dp: inline
 analogix_dp_prepare_panel()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-panel-return-void-v1-5-93e1be33dc8d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2731;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MlFndke6G/BiAttpO7gjjEBObPGtgF0yacJKuJFSOi4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn63WRhHYAe1OS/1/tk3Sz9qb4KIliPm2jbNOgb
 RtAp4hv+7yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+t1kQAKCRCLPIo+Aiko
 1SeJB/99DcUiEZ0lm8NGUnz3EMICHzz708VEx8dlGlQCVd6oQueDlCPIK1fl2K/lFHHmcvMg65q
 0ijG7EnkVwUj8ILoNZO0VtHSfjZTpfVMWecoSy7cNZJ9HZItlcPZ1ZHui3+bPVz47zMj1geQmGP
 Rf2VwMzBc4pkhXs51AstB9xkwZj78rjLlQfLzfXpBpryZh4bp/iqRTdWCVppitXBPP6yrTVgeTB
 fYt0/O7VpAE0+brLpUMLZPY/Bhj/N/6MeJ0BaXi01lXq98yioQWO2xXi/UmdZyVo1jnBcaXIfAF
 Nmck8Q7RhoU7aCLN4HdVAeqdQEfK5BQ+v07+UFMsGOKylkLb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: AOzy0rSbAA9YzGopklI3dd6-fuDbw7ko
X-Proofpoint-GUID: AOzy0rSbAA9YzGopklI3dd6-fuDbw7ko
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67eb75a7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=06SpEF9E26xvXwvOrpsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
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

The analogix_dp_prepare_panel() is now only calling a corresponding
drm_panel function. Inline it to simplify the code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 43 +++++-----------------
 1 file changed, 10 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 1ec4d277fe6bb03ad9eb8451ae2af5ad5ada0978..f60068011008482f7b7b2edfcab5fb1b3e9e130f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -955,33 +955,6 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
 	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
 }
 
-/*
- * This function is a bit of a catch-all for panel preparation, hopefully
- * simplifying the logic of functions that need to prepare/unprepare the panel
- * below.
- *
- * If @prepare is true, this function will prepare the panel. Conversely, if it
- * is false, the panel will be unprepared.
- *
- * The function will disregard the current state
- * of the panel and either prepare/unprepare the panel based on @prepare.
- */
-static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
-				     bool prepare)
-{
-	int ret = 0;
-
-	if (!dp->plat_data->panel)
-		return 0;
-
-	if (prepare)
-		ret = drm_panel_prepare(dp->plat_data->panel);
-	else
-		ret = drm_panel_unprepare(dp->plat_data->panel);
-
-	return ret;
-}
-
 static int analogix_dp_get_modes(struct drm_connector *connector)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
@@ -1174,9 +1147,11 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
 
-	ret = analogix_dp_prepare_panel(dp, true);
-	if (ret)
-		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
+	if (dp->plat_data->panel) {
+		ret = drm_panel_prepare(dp->plat_data->panel);
+		if (ret)
+			DRM_ERROR("failed to prepare the panel ret = %d\n", ret);
+	}
 }
 
 static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
@@ -1274,9 +1249,11 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 
 	pm_runtime_put_sync(dp->dev);
 
-	ret = analogix_dp_prepare_panel(dp, false);
-	if (ret)
-		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
+	if (dp->plat_data->panel) {
+		ret = drm_panel_unprepare(dp->plat_data->panel);
+		if (ret)
+			DRM_ERROR("failed to unprepare the panel ret = %d\n", ret);
+	}
 
 	dp->fast_train_enable = false;
 	dp->psr_supported = false;

-- 
2.39.5

