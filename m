Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77FC98FBCE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 03:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FA910E0C7;
	Fri,  4 Oct 2024 01:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EyCPFBv0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4567B10E0C7;
 Fri,  4 Oct 2024 01:06:29 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2e0b93157caso1932951a91.0; 
 Thu, 03 Oct 2024 18:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728003989; x=1728608789; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0MKM8RY4WB/OtS3QV8HYE66wVq4ICJcjlSk60orFw5E=;
 b=EyCPFBv0c7YRw7/BnSWjzDb9CA6gwYEcUS9WBwLPfU7KdUOUaUzP1Fo54cUyT+dIyl
 b7+UdTBoYa1OdfT0+eP8wzlBP+1aRsQK3vpJfeJwCJ/D53QJRbPEwvJaf8VpjoaAguaS
 FfHN8POCfUvVrmhKWOj05+uGsMHabdxcvkBpeJbYvbQ4tXBDXdV3BREsKg5P488e7qK/
 7LFPqhoWow1rGKtE6Z8/MtFeE8oQ2ZnkMBoWXcdC693kNQAPvMprCwfX1rFUttB/6x/1
 dWSnFv5xLog683ey9WcTsUwIeZ3PRbthcVt/jbMKkqrxXiEsuexbFNd9Ke+sidttG52l
 j/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728003989; x=1728608789;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0MKM8RY4WB/OtS3QV8HYE66wVq4ICJcjlSk60orFw5E=;
 b=bHiuJxHVvYKAdArXDcicSBH0QrjeTAHYHiTRqhDpb7m39QOQJqAVba8DV+kP+E9Tu8
 O/GPiRAQQwB8ZA4ZvEcM7nPdCDbp7MHfh0R4fm5EglhJmyo231NUbjlRE/vKqrfWKatz
 svXbYF9P2UmwF9xkxUDuJfNuQ6CdLx5y6OE0Tw/uimczmkQ35QcI/VtsNVwHpoYvKyd2
 E7ra1OsOr34YV33DKLTUJkq72V93Ln7W169ZfevRuFPXrEDkjPol+t+80eIg4R4IOHpI
 8QcfDXkOXlOx5csOeys0El7bH1suh4q6CeXtVT5QnWw1ZoVKGjbQ5liMWB4NgP0pvLAD
 dxEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6gj+FcboYNqxAnFJ7TY0l5+rwn6mg8YeWOHu83mxq6wlmcfK3Vddh0LVStYdbSorv8VSL9yLZVoGD@lists.freedesktop.org,
 AJvYcCX8uNPS0SP29OHWdeb9E7770fVPQ/wcWrrThyOzGiKMeDRHrQGlCd70MMZHqSH+VKznpq+K9Sfj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDUEJapxCPBi/90+ikzGN881prYkaOdt5av9tre/80Ur3xzhO+
 1oYyTWr1Dg6wCI6WyS0skl5hA7NF5JUfD8bV947wBXjmBfylAnnF
X-Google-Smtp-Source: AGHT+IHwF8QgszAa+3JDFqSJKcd/5/5sO19rtoHRsn+mDj++CQ5sQCWk7+OvQqlR0Eb+5nDmm597Jw==
X-Received: by 2002:a17:90a:8a13:b0:2d8:89ff:db1a with SMTP id
 98e67ed59e1d1-2e1e5b49179mr1423648a91.8.1728003988669; 
 Thu, 03 Oct 2024 18:06:28 -0700 (PDT)
Received: from jayDESKTOP.. (210006200231.ctinets.com. [210.6.200.231])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e1e862328csm187341a91.44.2024.10.03.18.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 18:06:28 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Hoi Pok Wu <wuhoipok@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/radeon: add late_register for connector
Date: Fri,  4 Oct 2024 09:05:59 +0800
Message-ID: <20241004010601.3387-1-wuhoipok@gmail.com>
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

The patch is to solve null dereference in 'aux.dev', which is
introduced in recent radeon rework. By having 'late_register',
the connector should be registered after 'drm_dev_register'
automatically, where in before it is the opposite.

Fixes: 90985660ba48 ("drm/radeon: remove load callback from kms_driver")
Tested-by: Hans de Goede <hdegoede@redhat.com>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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

