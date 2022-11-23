Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4942F636397
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF0510E578;
	Wed, 23 Nov 2022 15:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B342110E578
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:28:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 931592B069AE;
 Wed, 23 Nov 2022 10:28:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 23 Nov 2022 10:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217329; x=
 1669224529; bh=7JDQwbQ4e5e4kxrps/6I/UtgQ5oCSdXQgO2nu4ENguA=; b=D
 G9d+VqcAtmqLWgWkoNX9A4ZOdaJSiBXTATnchS5w+7l1ubvMRaVjVla8gcjaK3iy
 CiaDPPPKjIAEJxGYMGPYZS+wGl0KYr4OhIRjhuSAR9d3qVpaXwyjFLdpGms66UUM
 4YwkJsf2MK6HgCcwECD89ZWN9C6E+f3c/u8qOXH/32H1SCxIVqpvtSWhByIQLQT6
 zKr329q9V2jqTAYPG41gfUYOovgF9miuLpanexnM/VjANjbW8tFXaaJ8lq8dVDSC
 Tcqo/p38byR8fSsrF6eJ6NVJEYvsAwPdReQw3d5x9tU6C2sjMMVQ9CBErkpSFkZF
 TztaTV3zYD0SW2PNm7ajw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217329; x=
 1669224529; bh=7JDQwbQ4e5e4kxrps/6I/UtgQ5oCSdXQgO2nu4ENguA=; b=w
 QcmYSzl4NmlEPIKvho8Ytc4wGAv8JmDflJlLo0C+/i6nZT/pqpjuAnJ3wq8Y7u30
 89jJsB+SORHXE1QAoQu6PR1pYzS5y8OCfOd7QIYo2Sf5Ex3+KdAchS6y+sxsMtiR
 362zox/BaBprGBIoaakyOIxJkEjwsC5yXrO6mqAFbp0Xj9ZCvy75o0K8rvIeLkgn
 vKNQbwod/0q3qKVstOG3NNlSpjc8cuCJuVAJZEjegkaeTqyJNkIAu6yvkL5kjn/m
 3cttgWMtcDty+fcXlAWEmlsDCXgdKA9F0v9kl22qirg/ukQm7Mk9DgiZbAiwBZ1k
 rhYma+1unMpLvZquHE24Q==
X-ME-Sender: <xms:MDx-Y8-OuAUlfzEOcQti5_aA2Th1ey9IrKyNInqmGUErjlhTIpKnbA>
 <xme:MDx-Y0vkrLAT_m-6GTVJbcxuQVxxRgVXKbSaowAnq6DsDwVlLEHkHBohHl_Rwp0D7
 FsfC-Z8KgqoPLMK-WY>
X-ME-Received: <xmr:MDx-YyDuPAW1SNGibp4O214ZDgUzidnNVTjHju3LTDI1fW5A5bJUX51CCmz41a7g1KhNHndrQQjG9T2kJDd5bhOK1-wisxaBcxWnV5zPsvlG2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MDx-Y8ePRYNQVXj0qhkytsrjpRfwim_DTZNjPPIT8-LFH0DEOzJufg>
 <xmx:MDx-YxPGgr1Hjd-pF_6ydKQCDaQemI8T1MhgBoR4pgfihyf5VG4G-Q>
 <xmx:MDx-Y2kEDsOl0n0xDrcuLuJxYCH5wKLi4cDfucH5htERCTP0jThAtg>
 <xmx:MTx-Y3vDi3Vkpac5zLUyyaX6CmoKgCz31YamBeHE-O_QO5uHg24Y7uJhWVY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:28:47 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:45 +0100
Subject: [PATCH 03/24] drm/tests: helpers: Create the device in another
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-3-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4269; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Oe4YemANeM13u35azFRZAL2Ko/LAeQk6CaEWXQ6B8jI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11tWzFNg0jFL5JK80JSfV/RErXag72eI9k/q5ZVaxNU/O
 N7h1lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCJzWhn+R941aXcVj2yxd5N7VMejvE
 ts95X96SeWJ19gyMwJ4v6xkZFh8W2j1M+6wT9vSSxhe+gRsuFZNsvZt/UuB4xW9v83+HCPCQA=
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

We'll need in some tests to control when the device needs to be added
and removed, so let's split the device creation from the DRM device
creation function.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 14 +++++++++++++-
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 23 ++++-------------------
 drivers/gpu/drm/tests/drm_kunit_helpers.h       |  5 ++++-
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 6920c3ffdfdf..fe95fda350ae 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -16,6 +16,7 @@
 
 struct drm_client_modeset_test_priv {
 	struct drm_device *drm;
+	struct device *dev;
 	struct drm_connector connector;
 };
 
@@ -41,7 +42,10 @@ static int drm_client_modeset_test_init(struct kunit *test)
 
 	test->priv = priv;
 
-	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET);
+	priv->dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
+
+	priv->drm = drm_kunit_helper_alloc_drm_device(test, priv->dev, DRIVER_MODESET);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	ret = drmm_connector_init(priv->drm, &priv->connector,
@@ -55,6 +59,13 @@ static int drm_client_modeset_test_init(struct kunit *test)
 	return 0;
 }
 
+static void drm_client_modeset_test_exit(struct kunit *test)
+{
+	struct drm_client_modeset_test_priv *priv = test->priv;
+
+	drm_kunit_helper_free_device(test, priv->dev);
+}
+
 static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
 {
 	struct drm_client_modeset_test_priv *priv = test->priv;
@@ -92,6 +103,7 @@ static struct kunit_case drm_test_pick_cmdline_tests[] = {
 static struct kunit_suite drm_test_pick_cmdline_test_suite = {
 	.name = "drm_test_pick_cmdline",
 	.init = drm_client_modeset_test_init,
+	.exit = drm_client_modeset_test_exit,
 	.test_cases = drm_test_pick_cmdline_tests
 };
 
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 7f69f56f5892..2f974f45c5b4 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -18,40 +18,25 @@ struct kunit_dev {
 static const struct drm_mode_config_funcs drm_mode_config_funcs = {
 };
 
-static int dev_init(struct kunit_resource *res, void *ptr)
+struct device *drm_kunit_helper_alloc_device(struct kunit *test)
 {
-	char *name = ptr;
-	struct device *dev;
-
-	dev = root_device_register(name);
-	if (IS_ERR(dev))
-		return PTR_ERR(dev);
-
-	res->data = dev;
-	return 0;
+	return root_device_register(FAKE_DEVICE_NAME);
 }
 
-static void dev_free(struct kunit_resource *res)
+void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 {
-	struct device *dev = res->data;
-
 	root_device_unregister(dev);
 }
 
 struct drm_device *
-drm_kunit_helper_alloc_drm_device(struct kunit *test,
+drm_kunit_helper_alloc_drm_device(struct kunit *test, struct device *dev,
 				  u32 features)
 {
 	struct kunit_dev *kdev;
 	struct drm_device *drm;
 	struct drm_driver *driver;
-	struct device *dev;
 	int ret;
 
-	dev = kunit_alloc_resource(test, dev_init, dev_free, GFP_KERNEL, FAKE_DEVICE_NAME);
-	if (!dev)
-		return ERR_PTR(-ENOMEM);
-
 	driver = kunit_kzalloc(test, sizeof(*driver), GFP_KERNEL);
 	if (!driver)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.h b/drivers/gpu/drm/tests/drm_kunit_helpers.h
index 6c12b1426ba0..b4277fe92c38 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.h
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.h
@@ -6,8 +6,11 @@
 struct drm_device;
 struct kunit;
 
+struct device *drm_kunit_helper_alloc_device(struct kunit *test);
+void drm_kunit_helper_free_device(struct kunit *test, struct device *dev);
+
 struct drm_device *
-drm_kunit_helper_alloc_drm_device(struct kunit *test,
+drm_kunit_helper_alloc_drm_device(struct kunit *test, struct device *dev,
 				  u32 features);
 
 #endif // DRM_KUNIT_HELPERS_H_

-- 
2.38.1-b4-0.11.0-dev-d416f
