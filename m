Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB40498E9A7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 08:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2813F10E08B;
	Thu,  3 Oct 2024 06:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lYguMvV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6620110E08B;
 Thu,  3 Oct 2024 06:06:58 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7ae3d7222d4so445222a12.3; 
 Wed, 02 Oct 2024 23:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727935618; x=1728540418; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gizy/hHvKle/wUxwaQYiB0W0k117aCDj8y0fuH7eCC0=;
 b=lYguMvV0KkjJyayEWuJ+g7U9iyn6uxm5F09tL09Q0e7D3EP2p2f7mLzDmQ5nya2vip
 ChbTwZcovpObVhtolm9J+gIRLaeQhOoPKQEjR4EOfuOORQ6cG1buYqpX4wOIr+llMvMo
 Szx6yjZJx7rwuyXN70RKffmMyOQWHV80efjEc2MFG1tLuWSYSLdAWUQ7PUS/KYiFK4mp
 XPaOAj27QzcKZyJkZY2XC0t8xyrwApe6V2+qdypgMIIHxbMeC6+WSwUbl1zF8bCHmJAz
 LD2rY2KDByzV0wVoES2wAAfJz4rPBeGL1PUfOQohPy1uC+XoLHsvFbHZMbymrBPLe7Gg
 F51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727935618; x=1728540418;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gizy/hHvKle/wUxwaQYiB0W0k117aCDj8y0fuH7eCC0=;
 b=aZiKQ+zVH9Nw7mSitPxUUOSQ+mATlsn/P4o/UHwf7mxpk0h/znmvr6UQOz7DlO4ioZ
 LqT85pCskcqzZfaVrX2mw7NS7ikoIZp2VbK5YsVhjx9u8BzsAgEbq+Sk/CDzwiVWeFnC
 M2NyanRs0NInVrYnkq+rxRPsSsfOYP9pXuxnJbKVuVotA3/0Q3T3aqj7ZeG4Y/sIrK9Q
 A57usa5VL3bQgxbrbi94THialWeLs4WZkqskdselegU4spfTOZnvQ67DQXAhBJ9A2UtR
 wGiDLhm36nwKXal2Y+0E3rhevJlI4R88XCq8mfK1LWcYVj4tSurc95PdE82YJ1i62HK1
 Dx2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs0OXWPjU7982XKfhYAhH6tEbzwNgpkZPTOvhYVBx7D6bVwYXGUjPDwxOblq2z4JEwEVsW3LALDTKy@lists.freedesktop.org,
 AJvYcCXE/HALfX4jTimir0sOxMAvNMSpdp8NBFy6CXz2vqq3nml5NRfw36oyqpuQA4PLpL8Ht7yvVWJQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDM8KinXWO5ZIp9qHIGysQxBOJj5GtdhzMEJcY1XPD4Co/D4wz
 yZKO8RLNvCoJxsoQYGdAcNSKqdnJg1onqxE1bnF4OQHjYd5ZUF+K
X-Google-Smtp-Source: AGHT+IH28i2qJ6+/r9g3BIoTWHR1EDtmgHyOuIUkZIQ+s87HIus1gxI6hsudyMxwnt0IsASivdgL4w==
X-Received: by 2002:a17:90b:3b52:b0:2e0:8784:d420 with SMTP id
 98e67ed59e1d1-2e1848013e7mr6502496a91.21.1727935617738; 
 Wed, 02 Oct 2024 23:06:57 -0700 (PDT)
Received: from jayDESKTOP.. (210006200231.ctinets.com. [210.6.200.231])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e1bfad5e01sm620663a91.3.2024.10.02.23.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 23:06:57 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Hoi Pok Wu <wuhoipok@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/radeon: add late_register for connector
Date: Thu,  3 Oct 2024 14:06:46 +0800
Message-ID: <20241003060650.18454-1-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is a fix patch not tested yet,
for a bug I introduce in previous rework of radeon driver.
The bug is a null dereference in 'aux.dev', which is the
'device' not registered, resulting in kernel panic. By having
'late_register', the connector should be registered after
'drm_dev_register' automatically.

Please help testing thank you.

Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/atombios_dp.c       |  9 ++-------
 drivers/gpu/drm/radeon/radeon_connectors.c | 17 +++++++++++++++++
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index fca8b08535a5..6328627b7c34 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -228,10 +228,8 @@ void radeon_dp_aux_init(struct radeon_connector *radeon_connector)
 {
 	struct drm_device *dev = radeon_connector->base.dev;
 	struct radeon_device *rdev = dev->dev_private;
-	int ret;
 
 	radeon_connector->ddc_bus->rec.hpd = radeon_connector->hpd.hpd;
-	radeon_connector->ddc_bus->aux.dev = radeon_connector->base.kdev;
 	radeon_connector->ddc_bus->aux.drm_dev = radeon_connector->base.dev;
 	if (ASIC_IS_DCE5(rdev)) {
 		if (radeon_auxch)
@@ -242,11 +240,8 @@ void radeon_dp_aux_init(struct radeon_connector *radeon_connector)
 		radeon_connector->ddc_bus->aux.transfer = radeon_dp_aux_transfer_atom;
 	}
 
-	ret = drm_dp_aux_register(&radeon_connector->ddc_bus->aux);
-	if (!ret)
-		radeon_connector->ddc_bus->has_aux = true;
-
-	WARN(ret, "drm_dp_aux_register() failed with error %d\n", ret);
+	drm_dp_aux_init(&radeon_connector->ddc_bus->aux);
+	radeon_connector->ddc_bus->has_aux = true;
 }
 
 /***** general DP utility functions *****/
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 528a8f3677c2..f9c73c55f04f 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -1786,6 +1786,20 @@ static enum drm_mode_status radeon_dp_mode_valid(struct drm_connector *connector
 	return MODE_OK;
 }
 
+static int
+radeon_connector_late_register(struct drm_connector *connector)
+{
+	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
+	int r = 0;
+
+	if (radeon_connector->ddc_bus->has_aux) {
+		radeon_connector->ddc_bus->aux.dev = radeon_connector->base.kdev;
+		r = drm_dp_aux_register(&radeon_connector->ddc_bus->aux);
+	}
+
+	return r;
+}
+
 static const struct drm_connector_helper_funcs radeon_dp_connector_helper_funcs = {
 	.get_modes = radeon_dp_get_modes,
 	.mode_valid = radeon_dp_mode_valid,
@@ -1800,6 +1814,7 @@ static const struct drm_connector_funcs radeon_dp_connector_funcs = {
 	.early_unregister = radeon_connector_unregister,
 	.destroy = radeon_connector_destroy,
 	.force = radeon_dvi_force,
+	.late_register = radeon_connector_late_register,
 };
 
 static const struct drm_connector_funcs radeon_edp_connector_funcs = {
@@ -1810,6 +1825,7 @@ static const struct drm_connector_funcs radeon_edp_connector_funcs = {
 	.early_unregister = radeon_connector_unregister,
 	.destroy = radeon_connector_destroy,
 	.force = radeon_dvi_force,
+	.late_register = radeon_connector_late_register,
 };
 
 static const struct drm_connector_funcs radeon_lvds_bridge_connector_funcs = {
@@ -1820,6 +1836,7 @@ static const struct drm_connector_funcs radeon_lvds_bridge_connector_funcs = {
 	.early_unregister = radeon_connector_unregister,
 	.destroy = radeon_connector_destroy,
 	.force = radeon_dvi_force,
+	.late_register = radeon_connector_late_register,
 };
 
 void
-- 
2.46.2

