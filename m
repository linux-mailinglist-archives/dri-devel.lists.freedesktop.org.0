Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BFDA14C77
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B8F10E3A7;
	Fri, 17 Jan 2025 09:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k3aUENt2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C2610E5A3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 09:51:57 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30229d5b229so19382711fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 01:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737107456; x=1737712256; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l6F/Qq3d3Zbuu/ir75ukBi8dSYuZyZSR4oRI6lz02Ow=;
 b=k3aUENt2e7Ur/q0uU62nj5OCr+TPRiSU8lX2io8VRQZDNsvygOG/wPRe7pHsxHTfxV
 s8GSOHch1fdiX7rJD2f6rwWgOiQKkoLergez6lEw7to1M5BTJ6mtxsEu7ZvKAtfcdkzH
 91OhkWYZlMz1sNtaTCr8pKS5/s39WS+GLvuMGEqJkcJ86HL1kYJcXVlN92bmrbYWdkPa
 WxGRGXcBovYibGdSlUuEOrOm7vTof3icQrKQd787c3vjEeN9w8B3MhPLRux7SAGMIFS0
 /jJso6nCW3g5YaSGr3m+ni7+IQmL9gBuuhB1L0gCYKI76Ry775K4rWFe/OzLtu7FuwtS
 JScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737107456; x=1737712256;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l6F/Qq3d3Zbuu/ir75ukBi8dSYuZyZSR4oRI6lz02Ow=;
 b=v1vHC5Iaz9Td7zlFjWInVTlK4BrZAENzx3mJGtnxO8awOqHQscwm016lMQ6gQeIzo0
 XsoT84pGOVahUgPAePC4i44VeFcPYguUl1vzPbwU3DxVu5HcdQbql9raDRIJQu9Uk5K5
 /tXl+7m1cAK6h1iESGoeqiyOP1vFUstOWEEkmwb4Xv76G3u8JgcrFO8Wcy2IAfTbrA9l
 9+N9GpkKjuiwJzR/csRrf8Qrr3f4AeQaDKiM2659oIYXMLvh8H3mu9fKr2sIVsKDAVdK
 t3qG9JP1JIMVbyGotg5UfS660cku1r4OVMOZ2ojyXcLL4oh2dT55phdqaAPyy/A3nLOj
 hMYw==
X-Gm-Message-State: AOJu0Yyea9cwWHGgmJXEH2Pj0g2VCw8Q6OylY//nGSxqEYISn6TehX8X
 XGbrdRhItqoJEePwL5ffzZ9f2FNoVkcu3ZLJHFVlXg0fN98u2MSIgaCsoyv+haI=
X-Gm-Gg: ASbGncspbyo2HD00Jz1r3+FtJ8rxxWpIco5bObgBVmbFmnRdN1vkxy8NEYwHUDihTKu
 iz/eUjlmZfc2Us2PKZ6QLENUqS3TkO63361GcCV6ISK19X0qGG8g/p/NHAYLP5R1AIi1W5sqa6X
 BTBV8hRmMbFhJePRa/WCqIG5hs5Ug/J/XGQP7JM2UF/NIQT3cDin0+Rk+lZuiZEBgQN7s295U9d
 9Js8M3PfxIjgAP8JoCpL61aMNgPVupLVT83fkO1voWFFMiOSoTvxd/0QGizE84U
X-Google-Smtp-Source: AGHT+IHJcEHFfl8KbJTI7826EF6H1lRVnlWh7o1f+pZojli98vvrH7/CjvwMD7ZRCtQd4oUKf3C+IA==
X-Received: by 2002:a2e:be91:0:b0:300:2ddb:aaa5 with SMTP id
 38308e7fff4ca-3072cb0df40mr5881951fa.30.1737107456043; 
 Fri, 17 Jan 2025 01:50:56 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a34489fsm3450971fa.29.2025.01.17.01.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:50:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 11:50:50 +0200
Subject: [PATCH v3] drm/bridge-connector: handle subconnector types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-subconnector-v3-1-1e241c13e576@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPknimcC/53OTQ6CMBCG4auQri3pHz915T0MiwIDbZTWTJFIC
 He3kHgBl+9inm82EgEdRHLNNoKwuOiCTyEvGems8SNQ16cmgomCcV7R+G674D10c0AqVNmWAyi
 t6pqkkxfC4D4nd29SDxgmOlsE80Mk00wKrrRUuairShSactpPbsY1bw2u0T7Ccns6bzDkAceDt
 S6mtfV8chEH/h/V7Pv+BfOxB3byAAAA
X-Change-ID: 20250117-subconnector-246b6fe49488
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4842;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BVyrY3hYhzJCVJmvW+IxebCDsuJx/AtqO3kdpzmwFEQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBniif9fNPU4d0sQFESZpjYoMfPrnwTQTvCFTXdd
 yw6j+JsBeaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4on/QAKCRCLPIo+Aiko
 1YnVB/4v0rW4vHVX8JkTtKt78TaM7Ja07Y8IbKIl7tvEBEmUpChompmd9DpOd0Yg/TKbodNV5ho
 +hKdV2oqkZU59nB14qslKmAaeDw+mHR1V/kX0dygoBkn7JI/R09lpDprBjJT7PWQ/kHuWVpQjo1
 mbes34w1gaaJCYkn9unRex0CaV6Wp9x2TB00ZklYfn3YL9JRp1mF5XhsPlwcB5vCO0K0cugrBiE
 Un5zjwrMnyvdJxWKFRI5uYPQTt6NK/yQE4gpK0iQKgR53YdrnRIhoAVZ/1r1GUjEhvpIMezr11N
 7KwlCPIg8kdInzI3mmLOJ3BuXXBQl9K7WfHHCm8srjBkvJZp
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

If the created connector type supports subconnector type property,
create and attach corresponding it. The default subtype value is 0,
which maps to the DRM_MODE_SUBCONNECTOR_Unknown type. Also remove
subconnector creation from the msm_dp driver to prevent having duplicate
properties on the DP connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
This is a leftover of my previous attempt to implement USB-C DisplayPort
uABI. The idea was dropped, but I consider this part still to be useful,
as it allows one to register corresponding subconnector properties and
also to export the subconnector type.
---
Changes in v3:
- Rebased on top of linux-next
- Drop subconnector property from msm_dp driver
- Link to v2: https://lore.kernel.org/r/20230903214934.2877259-1-dmitry.baryshkov@linaro.org

Changes in v2:
- Dropped all DP and USB-related patches
- Dropped the patch adding default subtype to
  drm_connector_attach_dp_subconnector_property()
- Replaced creation of TV subconnector property with the check that it
  was created beforehand (Neil, Laurent)
- Link to v1: https://lore.kernel.org/r/20230729004913.215872-1-dmitry.baryshkov@linaro.org/
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 28 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.c                |  3 ---
 include/drm/drm_bridge.h                       |  4 ++++
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 0397e62f9cbc93321caeae99982f5e3c66d308c5..4b616dba4dd8c2dc1725a8d7562d0a37e1557dc8 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -523,6 +523,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_bridge *bridge, *panel_bridge = NULL;
 	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
 	unsigned int max_bpc = 8;
+	enum drm_mode_subconnector subconnector;
 	int connector_type;
 	int ret;
 
@@ -576,8 +577,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				max_bpc = bridge->max_bpc;
 		}
 
-		if (!drm_bridge_get_next_bridge(bridge))
+		if (!drm_bridge_get_next_bridge(bridge)) {
 			connector_type = bridge->type;
+			subconnector = bridge->subtype;
+		}
 
 #ifdef CONFIG_OF
 		if (!drm_bridge_get_next_bridge(bridge) &&
@@ -643,6 +646,29 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+		drm_connector_attach_dp_subconnector_property(connector);
+	} else if (connector_type == DRM_MODE_CONNECTOR_DVII) {
+		ret = drm_mode_create_dvi_i_properties(drm);
+		if (ret)
+			return ERR_PTR(ret);
+
+		drm_object_attach_property(&connector->base,
+					   drm->mode_config.dvi_i_subconnector_property,
+					   subconnector);
+	} else if (connector_type == DRM_MODE_CONNECTOR_TV) {
+		/*
+		 * We do not know which modes are supported by the HW, so the
+		 * property should be created in advance.
+		 */
+		if (!drm->mode_config.tv_subconnector_property)
+			return ERR_PTR(-EINVAL);
+
+		drm_object_attach_property(&connector->base,
+					   drm->mode_config.tv_subconnector_property,
+					   subconnector);
+	}
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d3e241ea6941615b8e274dd17426c2f8557f09b5..d8e3ec9fd4825916e03ced9011f460c2f32f3912 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -361,9 +361,6 @@ struct drm_connector *msm_dp_drm_connector_init(struct msm_dp *msm_dp_display,
 	if (IS_ERR(connector))
 		return connector;
 
-	if (!msm_dp_display->is_edp)
-		drm_connector_attach_dp_subconnector_property(connector);
-
 	drm_connector_attach_encoder(connector, encoder);
 
 	return connector;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4b84faf14e368310dd20aa964e8178ec80aa6fa7..27a4c9aa3475cefe0137f0a7d01b808651125ac5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -850,6 +850,10 @@ struct drm_bridge {
 	 * identifies the type of connected display.
 	 */
 	int type;
+	/**
+	 * @subtype: the subtype of the connector for the DP/TV/DVI-I cases.
+	 */
+	enum drm_mode_subconnector subtype;
 	/**
 	 * @interlace_allowed: Indicate that the bridge can handle interlaced
 	 * modes.

---
base-commit: 8defad9f57376a89914d16757717a27b567de04e
change-id: 20250117-subconnector-246b6fe49488

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

