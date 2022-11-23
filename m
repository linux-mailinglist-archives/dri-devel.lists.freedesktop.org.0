Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4894563639E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA39310E57E;
	Wed, 23 Nov 2022 15:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E6910E57C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:29:08 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 512682B069B3;
 Wed, 23 Nov 2022 10:29:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 23 Nov 2022 10:29:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217344; x=
 1669224544; bh=Qk+MsihmKg8cQnaf0hXQC5ht02u0J7qy3Ru7G8eMbVU=; b=K
 uonLfi8QFM7DF5hn4xt52Roh78iI4e6wNQVK3VDnGc4HCnko8B66qPvBIiUctUBW
 en2YPICXq0a5FrBsFBTuGpyDEGynEgNj+fK9qXgwI4vTnenvFIg7Rh+qQz6x6GYZ
 yMuaMJuKYSh78SVJVZEVNmrZfF0I2NQJUFFsibVlvqhd7oog/neiO+Ds7avi+8aw
 HY0tewFpZekB1Ri5FteuZdyMWaYqJHqmQMQaJLlnEzHTWdVDmLh2lE/vB74Z+AEc
 Yw14AOvPAdMOLMSe2F8tkw6I5lX8S2R4uUyIkJrcVM+JquiHyOKmtUqVnzF1af40
 OxguWX8F/DDkWyJC3+O3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217344; x=
 1669224544; bh=Qk+MsihmKg8cQnaf0hXQC5ht02u0J7qy3Ru7G8eMbVU=; b=w
 PSSr+/jrKIdGUVQmZlnw0k/urrJiH1DNSYF3XA6GmnrFQd/4yK2xd/1T8xdPZVwl
 0fH8NPU9Jz4cP+BKN5bavLIcFcZIXrijVtvlSc+nwU9TU9gr6BfVQRO8TB1zRK41
 g8YUJzYOEs3rRVhupC6gciAUg8w7W8WSxAeLjP4XF+v1nAu2ghuJudwurCXG35+V
 jHMBQv7SrR+Nri7MZXa5gcBjcqrbnVVQo/kiOe2JWOksPM/RYLXZDUVVqrAOVChB
 XO3ninbz7na7Zl3Qk7fiIRU1anUPboqROo+ZY9hazKZRPBJc5s2MC7xEHp2quad9
 YE1I8QnBQDhvXPscJJ1uw==
X-ME-Sender: <xms:QDx-Y2yEqPpH2SpadJ-D1ntGpi34Bf81XpO9j_54T8YgPDso7-F8Qw>
 <xme:QDx-YySGPyQQ0N58rpm3bz_fmZ34F_JL0DQQjQFhwyX_FU8PHwKr4nlNKnrX1DPpa
 ApcVo8aap6qUpp14DM>
X-ME-Received: <xmr:QDx-Y4XNIFqWD_qeb-nUDRGNzivIUSyJGP_MH5yi_1nA7Cj1_cUhXDynBKWvndvjXZMgS6rhCA4H3e-poak9LBzQQcR_BTq1FYZCvIhcjDegAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QDx-Y8hrHOpa6g_uxieW7tD8iZTZVqMDxd6lOdUWEw9NPENBzJRl6A>
 <xmx:QDx-Y4BYkz9R5mxTsRg9Jk4aimZK4L7Kyq6e2KuhRV5blZZDINRHsA>
 <xmx:QDx-Y9JKJoqIFteHOmopTlbW_T56g8jFkpprVMX-M525wZa13_qyEg>
 <xmx:QDx-YwjhsGDsTbZux8MsrNE5bg4ifYS8XHfHwcFTetYwvGCt_MwSToIwXb0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:29:03 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:48 +0100
Subject: [PATCH 06/24] drm/tests: kunit: Allow for a custom device struct to be
 allocated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-6-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3958; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=WGFd7F9nk5oH33+u+nSEjq1av1wXhR9FMu1Ar+ABElQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11tUGGteDRH95N/7cn75AYtGCjt2bTYI/zLHTeKF07f+J
 Zf8XdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiMzkYGfZ1KJRydUa/fPZSRf9iIt
 +Wsv9ZN1zWtK59aqhYXDKrfxojw7yg3ZonGxXPsE0P/vrLhS0tWTjgHO/dkEcnylV+inle5wEA
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
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Maíra Canal <mairacanal@riseup.net>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current helper to allocate a DRM device doesn't allow for any
subclassing by drivers, which is going to be troublesome as we work on
getting some kunit testing on atomic modesetting code.

Let's use a similar pattern to the other allocation helpers by providing
the structure size and offset as arguments.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c |  4 +++-
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 19 ++++++++-----------
 drivers/gpu/drm/tests/drm_kunit_helpers.h       | 11 +++++++++--
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index fe95fda350ae..086469273580 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -45,7 +45,9 @@ static int drm_client_modeset_test_init(struct kunit *test)
 	priv->dev = drm_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
 
-	priv->drm = drm_kunit_helper_alloc_drm_device(test, priv->dev, DRIVER_MODESET);
+	priv->drm = __drm_kunit_helper_alloc_drm_device(test, priv->dev,
+							sizeof(*priv->drm), 0,
+							DRIVER_MODESET);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	ret = drmm_connector_init(priv->drm, &priv->connector,
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 8bd7c40d0e1a..6d614f9e62d8 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -13,10 +13,6 @@
 #define WQ_TIMEOUT_MS		100
 #define FAKE_DEVICE_NAME	"drm-kunit-fake-device"
 
-struct kunit_dev {
-	struct drm_device base;
-};
-
 static const struct drm_mode_config_funcs drm_mode_config_funcs = {
 };
 
@@ -104,12 +100,13 @@ void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 }
 
 struct drm_device *
-drm_kunit_helper_alloc_drm_device(struct kunit *test, struct device *dev,
-				  u32 features)
+__drm_kunit_helper_alloc_drm_device(struct kunit *test, struct device *dev,
+				    size_t size, size_t offset,
+				    u32 features)
 {
-	struct kunit_dev *kdev;
 	struct drm_device *drm;
 	struct drm_driver *driver;
+	void *container;
 	int ret;
 
 	driver = kunit_kzalloc(test, sizeof(*driver), GFP_KERNEL);
@@ -117,11 +114,11 @@ drm_kunit_helper_alloc_drm_device(struct kunit *test, struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	driver->driver_features = features;
-	kdev = devm_drm_dev_alloc(dev, driver, struct kunit_dev, base);
-	if (IS_ERR(kdev))
-		return ERR_CAST(kdev);
+	container = __devm_drm_dev_alloc(dev, driver, size, offset);
+	if (IS_ERR(container))
+		return ERR_CAST(container);
 
-	drm = &kdev->base;
+	drm = container + offset;
 	drm->mode_config.funcs = &drm_mode_config_funcs;
 
 	ret = drmm_mode_config_init(drm);
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.h b/drivers/gpu/drm/tests/drm_kunit_helpers.h
index b4277fe92c38..70abc8c806c9 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.h
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.h
@@ -10,7 +10,14 @@ struct device *drm_kunit_helper_alloc_device(struct kunit *test);
 void drm_kunit_helper_free_device(struct kunit *test, struct device *dev);
 
 struct drm_device *
-drm_kunit_helper_alloc_drm_device(struct kunit *test, struct device *dev,
-				  u32 features);
+__drm_kunit_helper_alloc_drm_device(struct kunit *test, struct device *dev,
+				    size_t size, size_t offset,
+				    u32 features);
+
+#define drm_kunit_helper_alloc_drm_device(_test, _dev, _type, _member, _feat)	\
+	((_type *) __drm_kunit_helper_alloc_drm_device(_test, _dev,		\
+						       sizeof(type),		\
+						       offsetof(type, member),	\
+						       _feat))
 
 #endif // DRM_KUNIT_HELPERS_H_

-- 
2.38.1-b4-0.11.0-dev-d416f
