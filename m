Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1708C63F379
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36BA10E610;
	Thu,  1 Dec 2022 15:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBBF10E5FF
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:15:06 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 928A1580381;
 Thu,  1 Dec 2022 10:15:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 01 Dec 2022 10:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907705; x=
 1669914905; bh=8I+/ZXcrOwtZ6aT56122EZfyx0RdtQIuyJk2JiaCaEE=; b=g
 O6+d6caRB2RTL0nlimsGsAb+FZt938xD1rFe7O5UgVRHAry00zQQagQdBv6wm3o5
 F1axcrjFsbWHIXVEAbQ4WNo8kErJBYCV5ZQTbSyG2N6Ldp785Vt2yo42e455ZM3/
 SKxhrkuDeL3wm5mwmapE2FWXu4EWPXtrQtaS1MUZcRzCoWVaG3wfhoisVLMaEbEM
 VApp+RmVWJ4Hy+CcRDU0sfyknZ2MYAqnH67PqMAoKp37e6lrSC/rV+f38FEYonJO
 t00YLgtm8sMzuPuU2PGy1mpCr+W1INLBQPCuhhdACUkuX8q49t2m7hYmKrGnUdRo
 vBdQfWXsb7AO9euLPuWSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907705; x=
 1669914905; bh=8I+/ZXcrOwtZ6aT56122EZfyx0RdtQIuyJk2JiaCaEE=; b=M
 jp6s3DEcehr8GBNB+UtIfdn97lqL3GZep3t+9c1as1o8eTcZWR5A7idomh5BYU0U
 0kqxr8BhYubO7JL+jGrPkU4up+tnQnI2BW48HWF2qXwjbOSDof1J3kSlGtseGVQ7
 fFLYA0FIwcIQZkwkdpsNTzsDjbviVLCE8WzEwqAz8ag+52ywhH5alTfmPpRUiw+1
 oF4MO//LlWaRutF0c+hmD3qesEXolanBQHepzAu2v5Uzk0naCFz/2mzd3o0Po/Fx
 tN6KIG/b+fIrlfq+s0XiU0SGjjdWO1fezy0QWyWW6Hz5sYQz2BpBCKptkM8PlEE2
 YcfkYn1LvzhezNEPKk6pw==
X-ME-Sender: <xms:-cSIY3qv4k28xApNdSEadX9-ZCFgXVjtKmUnAUhXicIf1nXikV7paw>
 <xme:-cSIYxpvmquZEoeWJ535S5hQVNozqm1Ao-oYyBtkTAWpwo63ZCXXP9xGF6Ih5PqgN
 A9Y8gRSk6rqZiKJ8GY>
X-ME-Received: <xmr:-cSIY0MC67-4KY25WoTajEGDMuXfL9MAQJXTgKw34qmu_rC4E6uVEPfr6bjIcWp-vPHM6vu_lbIGQAY5TzGGXMiTSNDW-xB-a2c7TNf49ZWApQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-cSIY66Uv0_zgD62Vq3hghnKeiyc4vXidffDNZo0tNttswz4B-XkWg>
 <xmx:-cSIY25m0kQQvx2v3KnA0EbvSTV3c57Q9iBOfUYphPhnrxfG3acfqQ>
 <xmx:-cSIYygN66c-zUQppG1BOviViR3SNXNeJveeEy8FE2RuaJJwc0q2PA>
 <xmx:-cSIY0acR-FCYOhqcb798wlcqc1VvMX7chLJeVnFWfOiZwWle7ZeZw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:15:04 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:42 +0100
Subject: [PATCH v3 11/20] drm/tests: helpers: Allow to pass a custom drm_driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v3-11-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4409; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=lKGppXJtIgfAIQmRxfttebo2P8+x0JIWOh78Al1HX2c=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdRzRquwMsTgnFvVwivrwxo2BhoPdVjdv7NOPyqh8vqrle
 yfm3o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPp92RkONdSW7Hce6vbkZizxQv+7Z
 qZffPIwuNeDeuW/Lr4+cxGs4mMDEt/rdTc+Z3D2vTOvoJPa5YVdlZzpq61l05bvajn+o2op3wA
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
Cc: David Gow <davidgow@google.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maíra Canal <mcanal@igalia.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, Maíra Canal <mairacanal@riseup.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some tests will need to provide their own drm_driver instead of relying
on the dumb one in the helpers, so let's create a helper that allows to
do so.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 15 +++------
 include/drm/drm_kunit_helpers.h           | 51 +++++++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index b5485ab8fbf9..e98b4150f556 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -82,20 +82,15 @@ void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 EXPORT_SYMBOL_GPL(drm_kunit_helper_free_device);
 
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
-EXPORT_SYMBOL_GPL(__drm_kunit_helper_alloc_drm_device);
+EXPORT_SYMBOL_GPL(__drm_kunit_helper_alloc_drm_device_with_driver);
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index df99fda95e89..ed013fdcc1ff 100644
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
+ * drm_kunit_helper_alloc_drm_device_with_driver - Allocates a mock DRM device for KUnit tests
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
  * drm_kunit_helper_alloc_drm_device - Allocates a mock DRM device for KUnit tests

-- 
b4 0.10.1
