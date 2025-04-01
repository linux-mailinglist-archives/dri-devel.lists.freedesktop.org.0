Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF38DA773BB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F7410E4D9;
	Tue,  1 Apr 2025 05:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3tZmKqC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8538E10E4E0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 05:12:15 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCrHC023701
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Apr 2025 05:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SufW+r80Y9ER9ibdcVkSFCKfUrwEDR608dkdfliv+88=; b=p3tZmKqCivwj6XHX
 U5SiYPiT/xpskR9YVFyYuE9Kqe0dp9Jd1L2QedWVS8gxrwiy/oQXMTQ9WndI/wsR
 u5E9mc8+vL8OR7oP6G52XVWKzj+gfhuxHk8AbIcoNEhm57F6bKP0oXw7Ndz86JFf
 m1joS18m3iUDxXQYVD7hm0T/QxsoOjFTZhWdv9ia1iekGF432TVC4Ws3ZKMm64mC
 OnpnI9iVamHMxeKLHl50rLy/K/oO7eODMhi7T27tzsWsQIAt6B2briKShDXV96yI
 IEQD+6eiRB1pIQzzL6vKRXXQSXeTLDp2U3e/KFFB/lU6Pc5qRx0HhQTPGiKas7/f
 TVPsWA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8xvej9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 05:12:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6ed16cc6e39so107910226d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743484333; x=1744089133;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SufW+r80Y9ER9ibdcVkSFCKfUrwEDR608dkdfliv+88=;
 b=Y/MzQcMWvQoIrDJiGuZ5ytHHW6tXmHzJb30M0/nK9PfWkyi0o/XERarc/wNfeEp3H/
 uDHyqD+vlTagfnsgiqr6o/mzeSGCCnrVYiKM8CRMH7fgiwd2rEr3V1H+lQtKV9S0rJNs
 xoQWVTSk3xVPTK+w9FoVEOlrXPoGGZj9fp+n5nRdg7a3d4Sff9qSU6z9+FcoRph/F1WZ
 s87OFSgdbNmpg1KPt91whmJsRA7GFl1mNi1Em133JaaFE0fnTn/8733+lv67kx2m2bmA
 Q/RefeiADbbsFUmttT8xJERrhhP1m+G4atcibICMX80g32l2e+TMc85/d90LB2cJwFHF
 It7w==
X-Gm-Message-State: AOJu0YzlFBJHQ30pg6R+txthZl3GNPE590JDkZfTo+LQRhAyXvxntpu0
 IcrEW/6Iaiqaiu+fk1h7v4wqETB+1ttoyyAIoNpCo0GhgPamYz7lJVX0Jwm4aN6KdmirZu5kfo1
 SMhmNWRNuGbB07GTOqu0FprLNEgxO2j2PkO0NgDEzjAJ1+FMwxyYpDKLyUxMQy4cD8R8=
X-Gm-Gg: ASbGncswoPqwn2nFIYcmCxrQTgKsylEO7ExQYQMSnM6k2Aqps2R6G5cOTnKzVnOFkw2
 5ASAo2DQYh/2M6ga/UbdMO+ZW5KjqZsWzrv3KuQZRNjyj0K/tWHWbRNTB9gnbHjkFdes8LChJns
 ye/4LoqojuuPz1TajCm1Qd2jy46gEdPmtYVyiT/aEyQ0d0eBcD9JN3pwlMU4rmRNuwTVgvO0QSW
 i46yj4bqHQJXM3pXs5cRgZhpx+QffDKCACV2lLuZTU1iYxn+8kP0K91JaSzvgOgW4fQLO1voIyX
 HDqymCwQJcpJI60vwBrWcHxtllDmJu+P2ozuQREif6WgjxScYvDhgI4Jl8B3ssXLGHgcprF5hkt
 bh5+rSNKs3CBNJiBJPkbPcTwgm3I3
X-Received: by 2002:a05:620a:2908:b0:7c5:5768:40b9 with SMTP id
 af79cd13be357-7c690875522mr1892800085a.43.1743484333140; 
 Mon, 31 Mar 2025 22:12:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsior20lc9lixXbnK9mQBmXS1qNDNvJUiHmjCz+r6N/SDHxsQVRBDDeDs6C8IGTz71trkGnw==
X-Received: by 2002:a05:620a:2908:b0:7c5:5768:40b9 with SMTP id
 af79cd13be357-7c690875522mr1892797985a.43.1743484332707; 
 Mon, 31 Mar 2025 22:12:12 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b095a21b0sm1251697e87.243.2025.03.31.22.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 22:12:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 08:11:39 +0300
Subject: [PATCH 7/7] drm/panel: make prepare/enable and disable/unprepare
 calls return void
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-panel-return-void-v1-7-93e1be33dc8d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7332;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fQDSEEOLghqW0gqjtjiP2QZkz7fbMPIZN5amp5V1z7k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn63WRJEYlwE9X9glklAyZRqGVoodvfMuP5sFdR
 tn4AgM0ExuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+t1kQAKCRCLPIo+Aiko
 1Y3tB/9MOw1hOc0MzrJv7Ez3RcHJYHujcXQo2I5d1f1gaHB12EZL8MgwagBso+OSR28vrQu58br
 /ww6UqV0ft6YROBZ+MHu7IWY68AGd3+l2ToCPm7iu9DNAKhInXQlXYwlgXcLiqMwH9LOxKS7FC6
 qSUXWxgQIKqe08dlO9jq8w7JkvXVQxtzBQ+2NPNc73q5HZSGT4lbh/V4oxG1arkUcnDFwrJ+fr8
 xG+x/98cP0SQB8/9OcgBs6gE7tyqWKkT4xuQPHc6vxLgQKjs6qz4p3uIMziCtA2Q5OtZsF8Rif9
 dFkE/xiO2FES1ksV4FIY6TI9H1eNb5xQXj3PT9b25oBzrtj1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: OFo3BuZoWiagmBZaKEk82P5oLOqssi7U
X-Authority-Analysis: v=2.4 cv=PquTbxM3 c=1 sm=1 tr=0 ts=67eb75ad cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=rpcUNz5-J_niPHj66PUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: OFo3BuZoWiagmBZaKEk82P5oLOqssi7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
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

Now there are no users of the return value of the drm_panel_prepare(),
drm_panel_unprepare(), drm_panel_enable() and drm_panel_disable() calls.
Usually these calls are performed from the atomic callbacks, where it is
impossible to return an error. Stop returning error codes and return
void instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c                     | 54 +++++++++----------------
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c |  9 +----
 include/drm/drm_panel.h                         |  8 ++--
 3 files changed, 26 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c627e42a7ce70459f50eb5095fffc806ca45dabf..faa7a76b63b53b3a45b3400d8bf3b58a027a340e 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -105,21 +105,21 @@ EXPORT_SYMBOL(drm_panel_remove);
  *
  * Calling this function will enable power and deassert any reset signals to
  * the panel. After this has completed it is possible to communicate with any
- * integrated circuitry via a command bus.
- *
- * Return: 0 on success or a negative error code on failure.
+ * integrated circuitry via a command bus. This function cannot fail (as it is
+ * called from the pre_enable call chain). There will always be a call to
+ * drm_panel_disable() afterwards.
  */
-int drm_panel_prepare(struct drm_panel *panel)
+void drm_panel_prepare(struct drm_panel *panel)
 {
 	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
-		return -EINVAL;
+		return;
 
 	if (panel->prepared) {
 		dev_warn(panel->dev, "Skipping prepare of already prepared panel\n");
-		return 0;
+		return;
 	}
 
 	mutex_lock(&panel->follower_lock);
@@ -138,11 +138,8 @@ int drm_panel_prepare(struct drm_panel *panel)
 				 follower->funcs->panel_prepared, ret);
 	}
 
-	ret = 0;
 exit:
 	mutex_unlock(&panel->follower_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL(drm_panel_prepare);
 
@@ -154,16 +151,14 @@ EXPORT_SYMBOL(drm_panel_prepare);
  * reset, turn off power supplies, ...). After this function has completed, it
  * is usually no longer possible to communicate with the panel until another
  * call to drm_panel_prepare().
- *
- * Return: 0 on success or a negative error code on failure.
  */
-int drm_panel_unprepare(struct drm_panel *panel)
+void drm_panel_unprepare(struct drm_panel *panel)
 {
 	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
-		return -EINVAL;
+		return;
 
 	/*
 	 * If you are seeing the warning below it likely means one of two things:
@@ -176,7 +171,7 @@ int drm_panel_unprepare(struct drm_panel *panel)
 	 */
 	if (!panel->prepared) {
 		dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");
-		return 0;
+		return;
 	}
 
 	mutex_lock(&panel->follower_lock);
@@ -195,11 +190,8 @@ int drm_panel_unprepare(struct drm_panel *panel)
 	}
 	panel->prepared = false;
 
-	ret = 0;
 exit:
 	mutex_unlock(&panel->follower_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL(drm_panel_unprepare);
 
@@ -209,26 +201,26 @@ EXPORT_SYMBOL(drm_panel_unprepare);
  *
  * Calling this function will cause the panel display drivers to be turned on
  * and the backlight to be enabled. Content will be visible on screen after
- * this call completes.
- *
- * Return: 0 on success or a negative error code on failure.
+ * this call completes. This function cannot fail (as it is called from the
+ * enable call chain). There will always be a call to drm_panel_disable()
+ * afterwards.
  */
-int drm_panel_enable(struct drm_panel *panel)
+void drm_panel_enable(struct drm_panel *panel)
 {
 	int ret;
 
 	if (!panel)
-		return -EINVAL;
+		return;
 
 	if (panel->enabled) {
 		dev_warn(panel->dev, "Skipping enable of already enabled panel\n");
-		return 0;
+		return;
 	}
 
 	if (panel->funcs && panel->funcs->enable) {
 		ret = panel->funcs->enable(panel);
 		if (ret < 0)
-			return ret;
+			return;
 	}
 	panel->enabled = true;
 
@@ -236,8 +228,6 @@ int drm_panel_enable(struct drm_panel *panel)
 	if (ret < 0)
 		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n",
 			     ret);
-
-	return 0;
 }
 EXPORT_SYMBOL(drm_panel_enable);
 
@@ -248,15 +238,13 @@ EXPORT_SYMBOL(drm_panel_enable);
  * This will typically turn off the panel's backlight or disable the display
  * drivers. For smart panels it should still be possible to communicate with
  * the integrated circuitry via any command bus after this call.
- *
- * Return: 0 on success or a negative error code on failure.
  */
-int drm_panel_disable(struct drm_panel *panel)
+void drm_panel_disable(struct drm_panel *panel)
 {
 	int ret;
 
 	if (!panel)
-		return -EINVAL;
+		return;
 
 	/*
 	 * If you are seeing the warning below it likely means one of two things:
@@ -269,7 +257,7 @@ int drm_panel_disable(struct drm_panel *panel)
 	 */
 	if (!panel->enabled) {
 		dev_warn(panel->dev, "Skipping disable of already disabled panel\n");
-		return 0;
+		return;
 	}
 
 	ret = backlight_disable(panel->backlight);
@@ -280,11 +268,9 @@ int drm_panel_disable(struct drm_panel *panel)
 	if (panel->funcs && panel->funcs->disable) {
 		ret = panel->funcs->disable(panel);
 		if (ret < 0)
-			return ret;
+			return;
 	}
 	panel->enabled = false;
-
-	return 0;
 }
 EXPORT_SYMBOL(drm_panel_disable);
 
diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index 5d115ecd5dd44c8e5e7d1fb8afe573324e987f59..b6429795e8f518646443dd8179f3ec28cef4dc0f 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -413,15 +413,10 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
 static void panel_nv3051d_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct panel_nv3051d *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
 
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
+	drm_panel_unprepare(&ctx->panel);
 
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
+	drm_panel_disable(&ctx->panel);
 }
 
 static void panel_nv3051d_remove(struct mipi_dsi_device *dsi)
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index a9c042c8dea1a82ef979c7a68204e0b55483fc28..18bf338c8b96254dc3f2880106b944e71ea4c9a7 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -275,11 +275,11 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
 void drm_panel_add(struct drm_panel *panel);
 void drm_panel_remove(struct drm_panel *panel);
 
-int drm_panel_prepare(struct drm_panel *panel);
-int drm_panel_unprepare(struct drm_panel *panel);
+void drm_panel_prepare(struct drm_panel *panel);
+void drm_panel_unprepare(struct drm_panel *panel);
 
-int drm_panel_enable(struct drm_panel *panel);
-int drm_panel_disable(struct drm_panel *panel);
+void drm_panel_enable(struct drm_panel *panel);
+void drm_panel_disable(struct drm_panel *panel);
 
 int drm_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector);
 

-- 
2.39.5

