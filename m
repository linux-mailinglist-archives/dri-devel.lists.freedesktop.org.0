Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A3A751B73
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC709882AF;
	Thu, 13 Jul 2023 08:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D6689F41
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:25:04 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrch-0005zo-NQ; Thu, 13 Jul 2023 10:24:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcg-00E4kF-RS; Thu, 13 Jul 2023 10:24:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcg-004Vhi-5N; Thu, 13 Jul 2023 10:24:26 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Julia Lawall <julia.lawall@inria.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Luben Tuikov <luben.tuikov@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sean Paul <seanpaul@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 16/17] drm/property: Rename struct drm_property::dev to drm
Date: Thu, 13 Jul 2023 10:24:07 +0200
Message-Id: <20230713082408.2266984-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6549;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ooW+Ud+VOqToHKNWoOg8p0KQxIh7xZn5APD7T7mJAtc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7Sf5x/bqo4O7ni+o2C48C9n7a1gjPUTUI7mN
 rpPTdEqgUOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0nwAKCRCPgPtYfRL+
 TrpfB/4v2loa+3oniVWHdOZuWPZ5ZQZOObpL2hEuk9xJNGSUxqIdSv3UkNVTGuDkiU4n3qVaNnn
 kbAh6YKQMNRiCr9wDe7C8MTAAerflYS+iNW+Y9iyiAuQISExalTHnlYGLps4iJE+57BjcPCkM47
 8LkgsB04umRdXbIESOIxBG1bK9VoTkkGvd8m1wJjtQOiMR2O0BqEqB8EoYq3TifzQw+21o47LY+
 4NnBwdn1tbT8BtTAVSmtxXMCvtt8XpqFE12SfZqLeznsiV3gY9XQB2rgJMwcvQmtHkJo/IuoDQx
 DkpEWKYQkHFddRl1A7z7o3dF58UVf8iwhAWY7mrOVwW+zWS4
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"dev" is usually used for struct device pointers. Using it for struct
drm_device pointers is irritating (for me at least). Replace it
by "drm" and adapt all users.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/drm_atomic_uapi.c              |  5 +++--
 drivers/gpu/drm/drm_mode_object.c              | 16 ++++++++--------
 drivers/gpu/drm/drm_property.c                 |  6 +++---
 drivers/gpu/drm/tests/drm_damage_helper_test.c |  2 +-
 include/drm/drm_property.h                     |  4 ++--
 5 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d9d41d1b4f5d..58300caeea38 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -898,7 +898,7 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 int drm_atomic_get_property(struct drm_mode_object *obj,
 		struct drm_property *property, uint64_t *val)
 {
-	struct drm_device *dev = property->dev;
+	struct drm_device *dev = property->drm;
 	int ret;
 
 	switch (obj->type) {
@@ -1064,7 +1064,8 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		break;
 	}
 	default:
-		drm_dbg_atomic(prop->dev, "[OBJECT:%d] has no properties\n", obj->id);
+		drm_dbg_atomic(prop->drm, "[OBJECT:%d] has no properties\n",
+			       obj->id);
 		ret = -EINVAL;
 		break;
 	}
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index 63f071e77d77..6f33dd62b329 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -235,7 +235,7 @@ void drm_object_attach_property(struct drm_mode_object *obj,
 				uint64_t init_val)
 {
 	int count = obj->properties->count;
-	struct drm_device *dev = property->dev;
+	struct drm_device *dev = property->drm;
 
 
 	if (obj->type == DRM_MODE_OBJECT_CONNECTOR) {
@@ -285,7 +285,7 @@ int drm_object_property_set_value(struct drm_mode_object *obj,
 {
 	int i;
 
-	WARN_ON(drm_drv_uses_atomic_modeset(property->dev) &&
+	WARN_ON(drm_drv_uses_atomic_modeset(property->drm) &&
 		!(property->flags & DRM_MODE_PROP_IMMUTABLE));
 
 	for (i = 0; i < obj->properties->count; i++) {
@@ -324,7 +324,7 @@ static int __drm_object_property_get_value(struct drm_mode_object *obj,
 	 * their value in obj->properties->values[].. mostly to avoid
 	 * having to deal w/ EDID and similar props in atomic paths:
 	 */
-	if (drm_drv_uses_atomic_modeset(property->dev) &&
+	if (drm_drv_uses_atomic_modeset(property->drm) &&
 			!(property->flags & DRM_MODE_PROP_IMMUTABLE))
 		return drm_atomic_get_property(obj, property, val);
 
@@ -351,7 +351,7 @@ static int __drm_object_property_get_value(struct drm_mode_object *obj,
 int drm_object_property_get_value(struct drm_mode_object *obj,
 				  struct drm_property *property, uint64_t *val)
 {
-	WARN_ON(drm_drv_uses_atomic_modeset(property->dev));
+	WARN_ON(drm_drv_uses_atomic_modeset(property->drm));
 
 	return __drm_object_property_get_value(obj, property, val);
 }
@@ -377,7 +377,7 @@ int drm_object_property_get_default_value(struct drm_mode_object *obj,
 					  struct drm_property *property,
 					  uint64_t *val)
 {
-	WARN_ON(!drm_drv_uses_atomic_modeset(property->dev));
+	WARN_ON(!drm_drv_uses_atomic_modeset(property->drm));
 
 	return __drm_object_property_get_prop_value(obj, property, val);
 }
@@ -483,7 +483,7 @@ static int set_property_legacy(struct drm_mode_object *obj,
 			       struct drm_property *prop,
 			       uint64_t prop_value)
 {
-	struct drm_device *dev = prop->dev;
+	struct drm_device *dev = prop->drm;
 	struct drm_mode_object *ref;
 	struct drm_modeset_acquire_ctx ctx;
 	int ret = -EINVAL;
@@ -515,7 +515,7 @@ static int set_property_atomic(struct drm_mode_object *obj,
 			       struct drm_property *prop,
 			       uint64_t prop_value)
 {
-	struct drm_device *dev = prop->dev;
+	struct drm_device *dev = prop->drm;
 	struct drm_atomic_state *state;
 	struct drm_modeset_acquire_ctx ctx;
 	int ret;
@@ -580,7 +580,7 @@ int drm_mode_obj_set_property_ioctl(struct drm_device *dev, void *data,
 	if (!property)
 		goto out_unref;
 
-	if (drm_drv_uses_atomic_modeset(property->dev))
+	if (drm_drv_uses_atomic_modeset(property->drm))
 		ret = set_property_atomic(arg_obj, file_priv, property, arg->value);
 	else
 		ret = set_property_legacy(arg_obj, property, arg->value);
diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index ab533c5b8cd4..045232c91420 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -110,7 +110,7 @@ struct drm_property *drm_property_create(struct drm_device *dev,
 	if (!property)
 		return NULL;
 
-	property->dev = dev;
+	property->drm = dev;
 
 	if (num_values) {
 		property->values = kcalloc(num_values, sizeof(uint64_t),
@@ -904,7 +904,7 @@ bool drm_property_change_valid_get(struct drm_property *property,
 		if (value == 0)
 			return true;
 
-		blob = drm_property_lookup_blob(property->dev, value);
+		blob = drm_property_lookup_blob(property->drm, value);
 		if (blob) {
 			*ref = &blob->base;
 			return true;
@@ -916,7 +916,7 @@ bool drm_property_change_valid_get(struct drm_property *property,
 		if (value == 0)
 			return true;
 
-		*ref = __drm_mode_object_find(property->dev, NULL, value,
+		*ref = __drm_mode_object_find(property->drm, NULL, value,
 					      property->values[0]);
 		return *ref != NULL;
 	}
diff --git a/drivers/gpu/drm/tests/drm_damage_helper_test.c b/drivers/gpu/drm/tests/drm_damage_helper_test.c
index 0403e0e4450a..ed70d8ff1469 100644
--- a/drivers/gpu/drm/tests/drm_damage_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_damage_helper_test.c
@@ -47,7 +47,7 @@ static int drm_damage_helper_init(struct kunit *test)
 	mock->obj_props.count = 0;
 	mock->plane.base.properties = &mock->obj_props;
 	mock->prop.base.id = 1; /* 0 is an invalid id */
-	mock->prop.dev = &mock->device;
+	mock->prop.drm = &mock->device;
 
 	drm_plane_enable_fb_damage_clips(&mock->plane);
 
diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index c6b570a8459e..9022f350eee7 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -184,9 +184,9 @@ struct drm_property {
 	uint64_t *values;
 
 	/**
-	 * @dev: DRM device
+	 * @drm: DRM device
 	 */
-	struct drm_device *dev;
+	struct drm_device *drm;
 
 	/**
 	 * @enum_list:
-- 
2.39.2

