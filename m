Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 422B84AC5CB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C322710F4A3;
	Mon,  7 Feb 2022 16:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E4D10F70E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:35:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id C7DB6320217E;
 Mon,  7 Feb 2022 11:35:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Feb 2022 11:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=JLj+hmr4cIKjTRDSkfZU9h1B3lQK4P
 iy6lhAy5Q3ITU=; b=e0ic/mLu/gf5jDHe/w4NJZpU+LRD3WVAhc15cXzZZTUvaM
 G24plSoWdy0Sc1wEB46ZA2rUqp6yjuvmV4BeCsh6cnof5K56xjbYBZcYeFiEivRX
 Uc1iRxcgBejlOSmyVvMmcWEp6hd1+TjpKCoho6Dh4DLRlrVZTDJ/wtbNCBVDfkSD
 lTLTUGH93i5AoK626PxpyZXE1MV24/h0L+rhgYZ2OoXiKWPknMd78zHztd5poAk+
 C+3Z5bwtZ304kSFuduQstALAsEcPAbYERMe+pEip/XOrPBDNX2OzGiBHlvD2iUmP
 LvscMKYG4LSYjcUAlC5ICVYZjtzQKIe7u6zBPvVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JLj+hm
 r4cIKjTRDSkfZU9h1B3lQK4Piy6lhAy5Q3ITU=; b=GD285zkLM5vy7DUeTQMf23
 ge0+2czRDgXcvTz1j+Hd+dCyOJjPFxcSzvYxPj06Dwg8wHssn8PgwV50ADegmArF
 GpuOJC7A0gryOnlitY9g1lGhBjI1JVp+sRBW/MUZoLe/0SK/gkSc6S84/ARWZaGd
 s1i9FCvANgRmp4TVh3Ep17066i6B1xT4J69eO074Vhz2YY6g4MpxakQLYaot5Pu1
 vC5P+zSjpQp2Vd9cm8vtpWoBuwzQP1yj0QCw9FPqQ1RLY+kAakiSEapx62G6++hx
 lReGt1H7KpLioBtfbxbO2mErfZdI/lvTYsJSYkOCz8eijorLuNnlU5r/IfITrqxw
 ==
X-ME-Sender: <xms:V0oBYpFn-l8jT-PR5YMSqnZMHm-i2B-LMCAwREHs5geGSgSuDKsaxg>
 <xme:V0oBYuV6TFbjN8K7dB9TsylBvsgo1DHtdfQxgonRajL6kaS2r9RYLp1hwA49At84c
 Vg_5csZkYZHBUOBnj8>
X-ME-Received: <xmr:V0oBYrJpdk3oFtgIg5TBMxnvyl8SZO3K8BxYpVvf-eXlpYjVBPvuUQaQR2Fqp0LUdg1jDY0SN8JahrUPQMXUrRx3ZzSwwM-BTUugRZ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:V0oBYvFYXG-CPpFbLELtUeVI70x_C7ExVn7YDwN-aZiYYidL-bK9pw>
 <xmx:V0oBYvUoqprdJrRSDbEOiBA8v5XcA55tbdQtnlmlBU8KW5uqUYQFSA>
 <xmx:V0oBYqMqAnT4HVEofnojP9gommRwYAqsfEBOu-P4dMXGBKyAlizZ9g>
 <xmx:V0oBYroiO3QqHc29p1ihQyIWmaHOSepLjygZuR6YOkksl9Ine-FNcg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:34 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 06/23] drm/object: Add drm_object_property_get_default_value()
 function
Date: Mon,  7 Feb 2022 17:34:58 +0100
Message-Id: <20220207163515.1038648-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Some functions to create properties (drm_plane_create_zpos_property or
drm_plane_create_color_properties for example) will ask for a range of
acceptable value and an initial one.

This initial value is then stored in the values array for that property.

Let's provide an helper to access this property.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_mode_object.c | 53 +++++++++++++++++++++++++------
 include/drm/drm_mode_object.h     |  7 ++++
 2 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index 86d9e907c0b2..ba1608effc0f 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -297,11 +297,26 @@ int drm_object_property_set_value(struct drm_mode_object *obj,
 }
 EXPORT_SYMBOL(drm_object_property_set_value);
 
+static int __drm_object_property_get_prop_value(struct drm_mode_object *obj,
+						struct drm_property *property,
+						uint64_t *val)
+{
+	int i;
+
+	for (i = 0; i < obj->properties->count; i++) {
+		if (obj->properties->properties[i] == property) {
+			*val = obj->properties->values[i];
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static int __drm_object_property_get_value(struct drm_mode_object *obj,
 					   struct drm_property *property,
 					   uint64_t *val)
 {
-	int i;
 
 	/* read-only properties bypass atomic mechanism and still store
 	 * their value in obj->properties->values[].. mostly to avoid
@@ -311,15 +326,7 @@ static int __drm_object_property_get_value(struct drm_mode_object *obj,
 			!(property->flags & DRM_MODE_PROP_IMMUTABLE))
 		return drm_atomic_get_property(obj, property, val);
 
-	for (i = 0; i < obj->properties->count; i++) {
-		if (obj->properties->properties[i] == property) {
-			*val = obj->properties->values[i];
-			return 0;
-		}
-
-	}
-
-	return -EINVAL;
+	return __drm_object_property_get_prop_value(obj, property, val);
 }
 
 /**
@@ -348,6 +355,32 @@ int drm_object_property_get_value(struct drm_mode_object *obj,
 }
 EXPORT_SYMBOL(drm_object_property_get_value);
 
+/**
+ * drm_object_property_get_default_value - retrieve the default value of a
+ * property when in atomic mode.
+ * @obj: drm mode object to get property value from
+ * @property: property to retrieve
+ * @val: storage for the property value
+ *
+ * This function retrieves the default state of the given property as passed in
+ * to drm_object_attach_property
+ *
+ * Only atomic drivers should call this function directly, as for non-atomic
+ * drivers it will return the current value.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_object_property_get_default_value(struct drm_mode_object *obj,
+					  struct drm_property *property,
+					  uint64_t *val)
+{
+	WARN_ON(!drm_drv_uses_atomic_modeset(property->dev));
+
+	return __drm_object_property_get_prop_value(obj, property, val);
+}
+EXPORT_SYMBOL(drm_object_property_get_default_value);
+
 /* helper for getconnector and getproperties ioctls */
 int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
 				   uint32_t __user *prop_ptr,
diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index c34a3e8030e1..912f1e415685 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -98,6 +98,10 @@ struct drm_object_properties {
 	 * Hence atomic drivers should not use drm_object_property_set_value()
 	 * and drm_object_property_get_value() on mutable objects, i.e. those
 	 * without the DRM_MODE_PROP_IMMUTABLE flag set.
+	 *
+	 * For atomic drivers the default value of properties is stored in this
+	 * array, so drm_object_property_get_default_value can be used to
+	 * retrieve it.
 	 */
 	uint64_t values[DRM_OBJECT_MAX_PROPERTY];
 };
@@ -126,6 +130,9 @@ int drm_object_property_set_value(struct drm_mode_object *obj,
 int drm_object_property_get_value(struct drm_mode_object *obj,
 				  struct drm_property *property,
 				  uint64_t *value);
+int drm_object_property_get_default_value(struct drm_mode_object *obj,
+					  struct drm_property *property,
+					  uint64_t *val);
 
 void drm_object_attach_property(struct drm_mode_object *obj,
 				struct drm_property *property,
-- 
2.34.1

