Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344CC9137D6
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 07:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACE710E13D;
	Sun, 23 Jun 2024 05:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ggHM4XLu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF07310E11B
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 05:27:40 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52cd87277d8so1757790e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719120459; x=1719725259; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aNgtctpFaOvFe0yQEbHzPg2VSnmgptJ1G0644gEqPQQ=;
 b=ggHM4XLuQ2v/ZNWlLTCph3Qre6Lz/6HUdvQBFk19otzx6GzyEcaF9qNd2xT82GuXMo
 qYrsyGL02U9wX2zcM+IomVxxomZMuQY5stX1VUxjlTax3BwmMCmgm4+G/mSSUEXSM0Cz
 Ep9mb51lvmMCMoOMMpBTmMK4CjoTfGPI3EUa/0UVnQOqjtIEBxsTAsfP7Rf30RdYSDYc
 6Or3X1NFY3s7NSmSvCRpfuOSG1zWo7xoGp9ih0sK09Iqxgwpjkasz2HpJT8JQ0f/DMHl
 zQu9TjE2hLPm+IA08L/zS13snEHHJZi4e4JCBbrBZVVTIAWglHQI8036UaIog+q+cp29
 j+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719120459; x=1719725259;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aNgtctpFaOvFe0yQEbHzPg2VSnmgptJ1G0644gEqPQQ=;
 b=Q8xo8U2rD5j7LJW2kf0CWkD4mpUD0howDeh7+s5HXw3Zj1NU9QYET279eP3b+hRPnn
 zLrdoaSBd99ynNluf4RL0REMkF7AZPLy8WuXfW6Z5VwUcRfWKfgHBTrwtDE558DJ0HVp
 ssiAXUT+xPO60DYoBfxso41AwcId2WUgejo4Q/sdPbg9MCDCsCqotHAfNKJ8u/u69VUl
 dJXw+8Bq1L+G5kxKeExmGitXJsx9stngd4E4BqnkBCDSD2WQAIAN/qLElbvgS7xVFok1
 ZOpDzbEp4MTlxBJtvrgpGMwjoOec+f7hEfDE1Hr5ahATGPTweoJCNC2fHdPOFoVTWyp/
 CwsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4USBDEPKO4JHBHRoXMlWib7vooCzqSF6jCjCgyE/JZosKYaQhbxcWqWm1x9mFmQmt1WCuMMVkH5mxoj4CugDaLgT+WeidKxa40afSERaf
X-Gm-Message-State: AOJu0YzvASP9P1aQnyPlzEWFGWgDX5pABrXbNvsZaMNuoDz55lLWXHmr
 J9GYjnonc6Tiz/f442GVEWzWVIwN3xgBLrWNNt76rQv+YQdsipjJBSE4cX9pkao=
X-Google-Smtp-Source: AGHT+IEh3cEKgwmWN7Xjb33SsB2Mw1G3UHsxvvT4AgsvTgo5EF38OoJysYd94FJUutnhVeKw50wUGA==
X-Received: by 2002:a05:6512:2f7:b0:52b:bd97:ffdc with SMTP id
 2adb3069b0e04-52ce1860d7amr679447e87.59.1719120458797; 
 Sat, 22 Jun 2024 22:27:38 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd6432006sm657651e87.194.2024.06.22.22.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 22:27:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 08:27:35 +0300
Subject: [PATCH 1/2] drm/bridge-connector: reset the HDMI connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-drm-bridge-connector-fix-hdmi-reset-v1-1-41e9894dcdec@linaro.org>
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v1-0-41e9894dcdec@linaro.org>
In-Reply-To: <20240623-drm-bridge-connector-fix-hdmi-reset-v1-0-41e9894dcdec@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6433;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3yTmp3Sv/j769E4v8X1gSQqZKrDdcZgB/xdp5LC/6x4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd7JJMusAAdEN+AnZxFOh3PswmMdpQtfwDoBEi
 0OMtMZlYnSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZneySQAKCRCLPIo+Aiko
 1SBIB/9kkrr9cGKI5GGyC0AFUWz8jtlel5Ot/rOLHZyDcjlO3lNTOBi7jvjUYIkvWHiGsnGmImu
 PsXaqdIHMgyLNyXZh9GWdkyz06esMHIGHbyje9hn9Pu+35BAD2iAQcBrECfznmZcCAYNF8KybeL
 D5OCrR8Pn3bMwbJPYz/jEVhvU8I3KQCfNJa3T7EOZ5Q+Iu9Bx0TArMfsDjSa2EkykNQaI77Uh0r
 r9GzDd9Ldzbe917ZrzZYKOaB40xw7wge9ewvv2afjSI8PjCSO0LjAxJQ7vwkKmaVDQx+lhY31fl
 iwIlaJN9cRrF0IxxYKeGaceKslzS6GaKAlArLdAJQlWGWIln
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
IGT chokes on the max_bpc property in several kms_properties tests due
to the the drm_bridge_connector failing to reset HDMI-related
properties.

Call __drm_atomic_helper_connector_hdmi_reset() if there is a
the drm_bridge_connector has bridge_hdmi.

Note, the __drm_atomic_helper_connector_hdmi_reset() is moved to
drm_atomic_state_helper.c because drm_bridge_connector.c can not depend
on DRM_DISPLAY_HDMI_STATE_HELPER. At the same time it is impossible to
call this function from HDMI bridges, there is is no function that
corresponds to the drm_connector_funcs::reset().

Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI connector")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 21 ---------------------
 drivers/gpu/drm/drm_atomic_state_helper.c       | 21 +++++++++++++++++++++
 drivers/gpu/drm/drm_bridge_connector.c          | 13 ++++++++++++-
 include/drm/display/drm_hdmi_state_helper.h     |  3 ---
 include/drm/drm_atomic_state_helper.h           |  2 ++
 5 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 2dab3ad8ce64..67f39857b0b4 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -8,27 +8,6 @@
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
-/**
- * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
- * @connector: DRM connector
- * @new_conn_state: connector state to reset
- *
- * Initializes all HDMI resources from a @drm_connector_state without
- * actually allocating it. This is useful for HDMI drivers, in
- * combination with __drm_atomic_helper_connector_reset() or
- * drm_atomic_helper_connector_reset().
- */
-void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
-					      struct drm_connector_state *new_conn_state)
-{
-	unsigned int max_bpc = connector->max_bpc;
-
-	new_conn_state->max_bpc = max_bpc;
-	new_conn_state->max_requested_bpc = max_bpc;
-	new_conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
-}
-EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
-
 static const struct drm_display_mode *
 connector_state_get_mode(const struct drm_connector_state *conn_state)
 {
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 519228eb1095..1518ada81b45 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -478,6 +478,27 @@ void drm_atomic_helper_connector_reset(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_reset);
 
+/**
+ * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
+ * @connector: DRM connector
+ * @new_conn_state: connector state to reset
+ *
+ * Initializes all HDMI resources from a @drm_connector_state without
+ * actually allocating it. This is useful for HDMI drivers, in
+ * combination with __drm_atomic_helper_connector_reset() or
+ * drm_atomic_helper_connector_reset().
+ */
+void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
+					      struct drm_connector_state *new_conn_state)
+{
+	unsigned int max_bpc = connector->max_bpc;
+
+	new_conn_state->max_bpc = max_bpc;
+	new_conn_state->max_requested_bpc = max_bpc;
+	new_conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
+}
+EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
+
 /**
  * drm_atomic_helper_connector_tv_margins_reset - Resets TV connector properties
  * @connector: DRM connector
diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 0869b663f17e..7ebb35438459 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -216,8 +216,19 @@ static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 	}
 }
 
+static void drm_bridge_connector_reset(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	drm_atomic_helper_connector_reset(connector);
+	if (bridge_connector->bridge_hdmi)
+		__drm_atomic_helper_connector_hdmi_reset(connector,
+							 connector->state);
+}
+
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 285f366cf716..454319b40f17 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -8,9 +8,6 @@ struct drm_connector;
 struct drm_connector_state;
 struct hdmi_audio_infoframe;
 
-void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
-					      struct drm_connector_state *new_conn_state);
-
 int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 					   struct drm_atomic_state *state);
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index b9740edb2658..adf300e6b4eb 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -71,6 +71,8 @@ void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
+void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
+					      struct drm_connector_state *new_conn_state);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
 int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 					 struct drm_atomic_state *state);

-- 
2.39.2

