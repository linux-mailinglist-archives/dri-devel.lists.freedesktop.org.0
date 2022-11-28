Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E5A63ABC3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD2510E2CA;
	Mon, 28 Nov 2022 14:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFEE10E215
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 14:57:31 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 82A9D2B04FDA;
 Mon, 28 Nov 2022 09:57:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 28 Nov 2022 09:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669647447; x=
 1669654647; bh=QBnc7iATKpRbf1s6d/2CjFwnlJplmzY2io83QtpLqSY=; b=n
 E8QaOLdbHLXmpolOr3hzlKVLzO66aBjCaOs7gVQYrgk27kct5KIXGKQGL7QJpcho
 edhcZEpzBIIGVHl3rlT5O7QE2PeFBA4MNPL4OXdu0bUhvl21zHLglYTMm2PCQoHf
 IlaJRp+2ps7DHxVjAVGvis6EcgiuXfvsLAe7N5kiOWXb2LjKAdXlN03vqJjU9q8U
 /eMQCMzg7VyDEXzUDCWr0j+XAwxT3z9ucfugz2Wm4k2zY0tqDuG2CS9pzmYriMND
 du0FgqQM98tw3Ggw6A/g4G8MO5CK7yxl9uchKn+eCmyW3jS5dF+4RbdoKszlYK5D
 Oj2Km+AWTb5NC/S4xWZgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669647447; x=
 1669654647; bh=QBnc7iATKpRbf1s6d/2CjFwnlJplmzY2io83QtpLqSY=; b=C
 8Uc4QKscyH9YlQi8xgZjrtd6E3TGSJntdU5s2lzLkAB07aaj0IbUJKz5m2/5Gkyh
 +zgJ1ASZGKoGtFUN7N9WyuYLkH/aKxpX3uZDhkP3Hb2EdzHcGDyY7ps0KOFxo8fh
 yk+PhPpPbGj8qCoMpfHPMEVo27suFmFxsu7NHHLfDv5+7gfwFlfQu6YKd1k1oInF
 JbQIDN2+iw1Co9M4JZhJU1PsuiflIGHTn8Cvno1WGHXqyxdyek4/2v0gKN4uoaOF
 SftLmMAI1UhQv5DkbTEocz1BguCBYP+QkmxRI8cAjrA1T0JGR4xVF9wuVSpZQWK7
 V5lrjzvgluBev1zVvIAfA==
X-ME-Sender: <xms:VsyEY_zo6GB0D3JzjrBJURxr1mSEwS7ELOv-xwIktlHIRS4_20md7A>
 <xme:VsyEY3S3wxzhYCiDFQpUXPooyXl3coSlhr25dasyMpgp62r4aUid5IaYBWSc4lpA4
 ExHnOyjGZmqeUypGOE>
X-ME-Received: <xmr:VsyEY5Wsd8QK4gjHFyePviJ3LoZFYAMauAD6jYrJ0HerAtcc8T-x1BBIsenx-cRe-2IcLrg8eX5yrUoFU5U1z-anH0V9vK1NcZCOo_p20wiWkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VsyEY5jFQcAfCdxqk1qFen2eMiKsUTFGinXMYSDQlFppssI2SVhlCA>
 <xmx:VsyEYxB26ydWuxIyKxmvE5nr7BOIKuMflTzZj4mU2JuvtFjBp9T3Jw>
 <xmx:VsyEYyJB-sKhQJXmBhVnnLDlfcSXDSSuG2SCO971Wjp0Hazcb7uM1A>
 <xmx:V8yEY5gooKX2AOCsb3izIQu0ymp4jgDcvNKfJD9qAKcSW5ZnLTDWMG6Nkuc>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 09:57:24 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 28 Nov 2022 15:53:38 +0100
Subject: [PATCH v2 09/17] drm/tests: helpers: Allow to pass a custom drm_driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v2-9-efe5ed518b63@cerno.tech>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4354; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=JulLjwidc7D9FmH64KkeXKEGrBePLjAMRD8HKPWdoAM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMktp8sSw7Sv2sxWOvl+UpyvolVDysOzW+z7XYoTuxzTX32b
 y7apo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMxzWT4w2UfP+/ZE4VSWTmdmTtZTK
 Ie1ctPl87rmBdXPfv1ss0+4Qz/83fM4d/4aI2K5sJFdpeLuJ1ZzfNmXJZJ8GR9urWT37uZFwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: David Gow <davidgow@google.com>, Maíra Canal <mairacanal@riseup.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some tests will need to provide their own drm_driver instead of relying
on the dumb one in the helpers, so let's create a helper that allows to
do so.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 15 +++------
 include/drm/drm_kunit_helpers.h           | 51 +++++++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 47a4a7752bb7..565623c6d7fe 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -82,20 +82,15 @@ void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 EXPORT_SYMBOL(drm_kunit_helper_free_device);
 
 struct drm_device *
-__drm_kunit_helper_alloc_drm_device(struct kunit *test, struct device *dev,
-				    size_t size, size_t offset,
-				    u32 features)
+__drm_kunit_helper_alloc_drm_device_with_driver(struct kunit *test,
+						struct device *dev,
+						size_t size, size_t offset,
+						const struct drm_driver *driver)
 {
 	struct drm_device *drm;
-	struct drm_driver *driver;
 	void *container;
 	int ret;
 
-	driver = kunit_kzalloc(test, sizeof(*driver), GFP_KERNEL);
-	if (!driver)
-		return ERR_PTR(-ENOMEM);
-
-	driver->driver_features = features;
 	container = __devm_drm_dev_alloc(dev, driver, size, offset);
 	if (IS_ERR(container))
 		return ERR_CAST(container);
@@ -109,7 +104,7 @@ __drm_kunit_helper_alloc_drm_device(struct kunit *test, struct device *dev,
 
 	return drm;
 }
-EXPORT_SYMBOL(__drm_kunit_helper_alloc_drm_device);
+EXPORT_SYMBOL(__drm_kunit_helper_alloc_drm_device_with_driver);
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index 7908c516f2ab..5ad2c1b8480e 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -3,6 +3,8 @@
 #ifndef DRM_KUNIT_HELPERS_H_
 #define DRM_KUNIT_HELPERS_H_
 
+#include <kunit/test.h>
+
 struct drm_device;
 struct kunit;
 
@@ -10,9 +12,54 @@ struct device *drm_kunit_helper_alloc_device(struct kunit *test);
 void drm_kunit_helper_free_device(struct kunit *test, struct device *dev);
 
 struct drm_device *
-__drm_kunit_helper_alloc_drm_device(struct kunit *test, struct device *dev,
+__drm_kunit_helper_alloc_drm_device_with_driver(struct kunit *test,
+						struct device *dev,
+						size_t size, size_t offset,
+						const struct drm_driver *driver);
+
+/**
+ * drm_kunit_helper_alloc_drm_device_with_driver - Allocates a mock DRM device for Kunit tests
+ * @_test: The test context object
+ * @_dev: The parent device object
+ * @_type: the type of the struct which contains struct &drm_device
+ * @_member: the name of the &drm_device within @_type.
+ * @_drv: Mocked DRM device driver features
+ *
+ * This function creates a struct &drm_device from @_dev and @_drv.
+ *
+ * @_dev should be allocated using drm_kunit_helper_alloc_device().
+ *
+ * The driver is tied to the @_test context and will get cleaned at the
+ * end of the test. The drm_device is allocated through
+ * devm_drm_dev_alloc() and will thus be freed through a device-managed
+ * resource.
+ *
+ * Returns:
+ * A pointer to the new drm_device, or an ERR_PTR() otherwise.
+ */
+#define drm_kunit_helper_alloc_drm_device_with_driver(_test, _dev, _type, _member, _drv)	\
+	((_type *)__drm_kunit_helper_alloc_drm_device_with_driver(_test, _dev,			\
+						       sizeof(_type),				\
+						       offsetof(_type, _member),		\
+						       _drv))
+
+static inline struct drm_device *
+__drm_kunit_helper_alloc_drm_device(struct kunit *test,
+				    struct device *dev,
 				    size_t size, size_t offset,
-				    u32 features);
+				    u32 features)
+{
+	struct drm_driver *driver;
+
+	driver = kunit_kzalloc(test, sizeof(*driver), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, driver);
+
+	driver->driver_features = features;
+
+	return __drm_kunit_helper_alloc_drm_device_with_driver(test, dev,
+							       size, offset,
+							       driver);
+}
 
 /**
  * drm_kunit_helper_alloc_drm_device - Allocates a mock DRM device for Kunit tests

-- 
2.38.1-b4-0.11.0-dev-d416f
