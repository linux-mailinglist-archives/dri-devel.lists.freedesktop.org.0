Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71044BD8DA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA8110EC58;
	Mon, 21 Feb 2022 10:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB8410E30E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:59:36 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 28E1C58025C;
 Mon, 21 Feb 2022 04:59:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 04:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=1IhX7F+6dp1s/Juv78VKLCBXxzRnPI
 tkvmI9TrmlEhw=; b=XwT0IIeCRofN8OdH2K8tLv4/Sb1FxprINcgaRJskUK7EkX
 gKRxoctTbH7/QAQB6Mdb2gaHhwVvmm13P/Qovdamivr2JDmtV1zW5IRmjhqynYAf
 tdQMy9XqdQLU5Z9Wg6DRD3crdCS/hMVVLNFAHTA1GEUBhiZdnIOMafz4nbJVNF2P
 gkV85y36CWLO4DC8Cet5vZIkaZ9AyxfPI0amcyBXOic5j+JpUWzV99jOH1nJ256l
 rVXV2KYDEhVK+lVo84YruOhI1KLzsKeaa4I/ND48R1Vk/qjKRO8pHVH4jGDHMeJ/
 /teJ1LGh9KhRAgW7hvw0OkfBnEQfButcl5vULskg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1IhX7F
 +6dp1s/Juv78VKLCBXxzRnPItkvmI9TrmlEhw=; b=e+VAm1wBDy8R3NSy0G80V7
 qXsKHP0T6fzF1eAl5maeuXa2iMuY2aAC0zsKG1U5ztIkjkhCo+UbO/r4KhpcPhwm
 J5+ZyHAYOc8nvCjp4e5dhGvctN5owyPEKNOhAdKMNiMM/bYODIYDtE9B7CQrQWFx
 z8cksScwJuu6x9WK7aZfmZvOBHBvM0uJgGEUrasxnl6Np97NtwnaZHrV+E3t7b0g
 nA6uHMPDehQwpt9/7V+COpLTuZ5mXMKbVkG1tWMVqp6Al7boJjTptmNMAeC8g3da
 eqSFL9zQMeqfGd2kyt3sbuVlRjACdXaXtHhCZe6urKAajTRAebI9nuM1o6C9Mdyg
 ==
X-ME-Sender: <xms:h2ITYvnwWu9EuYIiu7bcTsvZ_VarJEfiyZ9QCFTup3dESfazfP94Jg>
 <xme:h2ITYi1suvmrRfB6x3M_hyZib-HKnbrn2QuIjA5RPreJLQ4VVc-dEY8KIA8M9yHn7
 N322jrobd78Nm3BJsw>
X-ME-Received: <xmr:h2ITYlrVbIj0skjzFqC4N6tVOLsJolgV73cuZrvW-m9xUQQCwWtAp9K2AQjqPG-iNrG2yjWaKl7KEhXdKKlAWsShAbiMUUF4FMmIpqU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iGITYnkf4d3FULHHz-XuZF9YIjdqWObZDwcyHhQMQORaXX2Y6Nfk2w>
 <xmx:iGITYt3g8OjWGioiIKGk67mCIjOCW3Q52NkC7qI_0cTgKMxsoQfZ_Q>
 <xmx:iGITYmvoOAv3IEmsx5xBEmk9zDzy3oKEWnvfF0oqQ60YsH_lnRqpng>
 <xmx:iGITYnwQUdg3IdTpsc_KHhINXITkf839bw3s_0fphSyE6Be-PEVXQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:35 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 06/22] drm/object: Add
 drm_object_property_get_default_value() function
Date: Mon, 21 Feb 2022 10:59:02 +0100
Message-Id: <20220221095918.18763-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Some functions to create properties (drm_plane_create_zpos_property or
drm_plane_create_color_properties for example) will ask for a range of
acceptable value and an initial one.

This initial value is then stored in the values array for that property.

Let's provide an helper to access this property.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
2.35.1

