Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9FB8771D0
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 16:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1A411213E;
	Sat,  9 Mar 2024 15:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J9w4UHFG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8D411213B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 15:09:12 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d269b2ff48so45572871fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 07:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709996950; x=1710601750; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xNGj9hvd5eMMotayR67It4TFcWGQFtfA/p9pyF/5mE0=;
 b=J9w4UHFG4Pusl4tfeZiQjO4qeQOLr5Bi9rOR5CKrOn7gVlcBBiyz3T8Mr8s2RwOGzN
 r0TX5gtRwxLrTavPDueoQ6SeLdbo8Yuy1FIRSLvFNE7+MgGVmDeL6q6+/e+Ps49cd3Aq
 CYzvg06LqGjkDzcf3N99QSWT5raH3leOtQU/k3rg0YbEZp7h/+tlUdbT9txBxbBgq/MR
 XHD1cH1P18REKR5g9Bfrvsv8LfudBAunQyNwK1Z96tgXifxAarpOrjjxNAh9nO3ejA0g
 npt5/3Cu+EjRYByi2Cd/6Afl8mhb1dSZUDfVzh7Wrhh13kYfp7WkCPEnPgbwRhx/+ESe
 S29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709996950; x=1710601750;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xNGj9hvd5eMMotayR67It4TFcWGQFtfA/p9pyF/5mE0=;
 b=kuMwqAHMSA8vk8jCDIX0hYYSzczB7BCeliBMODRn2975lrGxf6kP8XZWdCny7eMbE/
 ORqF0wqsB7DoLRFR7Aj88UH6U4TWxyt5l7sw98/AAgW5F0fPC0pT0oWGIbqS83aYvX0Q
 wtmzTh8AuF9a/HQ8Qg3EZS0QhYhMRyhADeYNhrLxcUKuETFtT45nP7E+Qs5NtPGRooHt
 Fv4Mnweg7nh+GGg3cjl1wyTQZckpDdIk7kzIsqrfoUvAZnxeiJsruhWj4P8YeNcusgl1
 jeIlizdulOpcOlc+1jNUoEA19DYoIZiqlQ0kciaq3od4jQ1FXYm3fBeB5Sbj+tWmkjof
 EC5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/PMy436EPIX6rkZRXkWAx3TLdY/9fFltXynKYtntQjUOqTJU89ivq0A9EJANziIvIng4SDc62E4irpSele16Tu8uBfWHRZbinrn8MMYyr
X-Gm-Message-State: AOJu0YzKTbA5bpM+B9uth3rAxMXv+608Ks4ULjjnHPyJEPo0KpHzPS3m
 P1y66Jm0hHQvzyhIy2qVlK96PctZ0B11UdfKr5ET4SDnRC7gVtJUbUzYUJNRQS0=
X-Google-Smtp-Source: AGHT+IEHNSWqX0gXHFX29xuxi93+Jfhzbx2TyMa/UqdM693sNC4YDSZ/Of892Jm2Pp9Awa4lM82QPQ==
X-Received: by 2002:a2e:8007:0:b0:2d3:dcb0:56d9 with SMTP id
 j7-20020a2e8007000000b002d3dcb056d9mr1461938ljg.29.1709996950750; 
 Sat, 09 Mar 2024 07:09:10 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 m1-20020a2eb6c1000000b002d4062c833dsm328511ljo.98.2024.03.09.07.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 07:09:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 17:09:07 +0200
Subject: [PATCH 3/3] drm/msm/dsi: simplify connector creation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-fd-dsi-cleanup-bridges-v1-3-962ebdba82ed@linaro.org>
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
In-Reply-To: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4757;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sQ9dGrX0/pUk+Y+5/wO+qeOzx57mrk8gd0lJNrR0tkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7HuTSHu38iYiw5kUL9hewWylm4rO5ExjUE6u6
 7tGAahVjqiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZex7kwAKCRCLPIo+Aiko
 1Ys2CACm3di5oU6X/lXIp+QIh9BnCKdasPf41Phfo4D3UzixHBdHYXeI7lluOz9oMgmjSHRdpvp
 FVkQ9j6PxkGDSJqzkAGrGgsSnZNuAPAD3zEGaB1hVPgoY2I2lns2L/4uPm8YN0VPPqSfNWm9k52
 L0xRdKYFer8SMAasJZtU+XlLQFBotC2ddTel8mWz3gQLQPMUuDTKZbp72ZKu3ZE2cHIkH+UDXz2
 g2MXSbL0VrR3WPilOUl3p/8U4s5h+LBRor8p9bncTwA4fld+P2R5Qygq6w49bXuPDhSp5s8Urli
 SFUxGJM76aFA8Fud8Z3Bx08MbDAPgA0/0lzbhcw/aXZVVu6a
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

Instead of having two functions, msm_dsi_manager_bridge_init()
and msm_dsi_manager_ext_bridge_init(), merge them into
msm_dsi_manager_connector_init(), moving drm_bridge_attach() to be
called from the bridge's attach callback (as most other bridges do).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 10 +--------
 drivers/gpu/drm/msm/dsi/dsi.h         |  5 ++---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 41 +++++++++++++++--------------------
 3 files changed, 21 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 38f10f7a10d3..efd7c23b662f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -232,7 +232,6 @@ void __exit msm_dsi_unregister(void)
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder)
 {
-	struct drm_bridge *bridge;
 	int ret;
 
 	msm_dsi->dev = dev;
@@ -252,14 +251,7 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		return 0;
 	}
 
-	bridge = msm_dsi_manager_bridge_init(msm_dsi, encoder);
-	if (IS_ERR(bridge)) {
-		ret = PTR_ERR(bridge);
-		DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: %d\n", ret);
-		return ret;
-	}
-
-	ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id, bridge);
+	ret = msm_dsi_manager_connector_init(msm_dsi, encoder);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dsi connector: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 0adef65be1de..afc290408ba4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -47,9 +47,8 @@ struct msm_dsi {
 };
 
 /* dsi manager */
-struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi,
-					       struct drm_encoder *encoder);
-int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge);
+int msm_dsi_manager_connector_init(struct msm_dsi *msm_dsi,
+				   struct drm_encoder *encoder);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index b7c52b14c790..5b3f3068fd92 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -423,7 +423,18 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 	return msm_dsi_host_check_dsc(host, mode);
 }
 
+static int dsi_mgr_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
+{
+	int id = dsi_mgr_bridge_get_id(bridge);
+	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
+
+	return drm_bridge_attach(bridge->encoder, msm_dsi->next_bridge,
+				 bridge, flags);
+}
+
 static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
+	.attach = dsi_mgr_bridge_attach,
 	.pre_enable = dsi_mgr_bridge_pre_enable,
 	.post_disable = dsi_mgr_bridge_post_disable,
 	.mode_set = dsi_mgr_bridge_mode_set,
@@ -431,17 +442,19 @@ static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
 };
 
 /* initialize bridge */
-struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi,
-					       struct drm_encoder *encoder)
+int msm_dsi_manager_connector_init(struct msm_dsi *msm_dsi,
+				   struct drm_encoder *encoder)
 {
+	struct drm_device *dev = msm_dsi->dev;
 	struct drm_bridge *bridge;
 	struct dsi_bridge *dsi_bridge;
+	struct drm_connector *connector;
 	int ret;
 
 	dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
 				sizeof(*dsi_bridge), GFP_KERNEL);
 	if (!dsi_bridge)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	dsi_bridge->id = msm_dsi->id;
 
@@ -450,27 +463,9 @@ struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi,
 
 	ret = devm_drm_bridge_add(msm_dsi->dev->dev, bridge);
 	if (ret)
-		return ERR_PTR(ret);
-
-	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return bridge;
-}
-
-int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
-{
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct drm_device *dev = msm_dsi->dev;
-	struct drm_encoder *encoder;
-	struct drm_connector *connector;
-	int ret;
-
-	encoder = int_bridge->encoder;
+		return ret;
 
-	ret = drm_bridge_attach(encoder, msm_dsi->next_bridge, int_bridge,
-			DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;
 

-- 
2.39.2

