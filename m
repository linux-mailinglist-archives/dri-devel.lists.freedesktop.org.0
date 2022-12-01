Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FC063F36F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6176810E607;
	Thu,  1 Dec 2022 15:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DDC10E600
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:14:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3C6B6580381;
 Thu,  1 Dec 2022 10:14:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 01 Dec 2022 10:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907697; x=
 1669914897; bh=kwkfz5PW+M+CxtrhikgqotT1zIv4xEiTulE/3PlEXME=; b=U
 qM/fuMgiH+FCir6PZIBUHYzdNkLIzB68/se/UhI9ors/v+nNZkurxxXbYGdhnwPF
 vWDAhbYP8ahM6RymGEGEUtUQ34dVfMbztQc4yZoHEVsoT4Qlr1O+JioTbo6Bjutm
 Bugs+Qhd6sVsrqeh/o1dSfgqmqRl7zZOBU9UkKKqLl07ns2G9oY4M1q1jBP61ssm
 Ng1T41v8TfiJzdxx6VpkxhTa1dC2/diUoPSwMkB7+d823hAYp03AExDMBi3Ncx8K
 c1Mga5lDXQwTTD0gMe1q+MVKRfM92T1qfaiVKXnKcc6B1daxtjiZxLE7/7zxDPWM
 GfFtiNkyYC1vB5X8lSVhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907697; x=
 1669914897; bh=kwkfz5PW+M+CxtrhikgqotT1zIv4xEiTulE/3PlEXME=; b=W
 45aherA/iOhenqy+4mkTBiJ2BSrqsex+JYLjj2Gss4lMdH3xlLuXM5HokphHp73e
 I6sejwXX3E93V63bLgmRj599wnEZHeFzEG3+7nGWzk1AbUwC7xfnz3vA4YpnPOG7
 GGw0cK4h0gyi1ybKD/6LRhAfdHwubt9C92sPZfTunPcKfijjeRj5ORUJHHE505Rg
 i+ANuZT0KRtMYWeDeN74uYYYGplMFcKa7jZrFcZJK9rwPxEePB8mBYYweYPMqRWk
 7b5pNBHKwhqNbaj/3/LiiaxpLJtO4nGZ7t9aiTf3mZmvScdqoIaFM9kKJZQKFXTu
 ESnFDUuRB5szYlLqdrHIA==
X-ME-Sender: <xms:8cSIY813f92oDL2uAAG-tRRz78qnf0_z37dNHNS0QJHMDwkNj1unZg>
 <xme:8cSIY3FM2lO6Oj3kzglzfKZ1MKJy5wdKVpD-Rx3lFMhnBQyhBItsuhVEf3OwDqhIQ
 szt04riV24cJbZaG4E>
X-ME-Received: <xmr:8cSIY05qLEIxI5hULDXpgZPtrNGAlgtlMh-zr-UKHrZt7N4wAZUToalBqJw0l4VVvSv0tnmpuHSC-f7e3DPYTTZXcG-SYlqqmGxkceFL_wtBYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8cSIY13DNv136dub3rmQjsJdHC-MEppAle_mu45H9qL3bz2ncJG8fQ>
 <xmx:8cSIY_GA1v8Vin8rFK0zhz18uQBY6QNGHQoauDMTmaMyPbU0uPQOGA>
 <xmx:8cSIY-8IQANZw-3jlKhKd7b44MwCsU5rMS_M4JCysXdlbCi66PjzLg>
 <xmx:8cSIY-Gfs0cAYqRSn5Nvo-MvgmCwwuVNxJofZyK5EVgWvKO43znfdw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:14:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:38 +0100
Subject: [PATCH v3 07/20] drm/tests: helpers: Create the device in another
 function
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221123-rpi-kunit-tests-v3-7-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9380; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=3Exym6xxqWVt6fOmdHC7PPteC1L5T2y3IaPsIclT7Mg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdRzS2KqzPM7E99tFe/TdLbXjquuy3hQ8Z75UbbjnNyJZZ
 Ijizo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOZcYCRYd75VTPSheYFR2Rv83o8N3
 vZwWtJ/NIcIdybDd1fp834s4iR4VFImfrcts390+exN3h8//xUOz3w7IbptS8lLrPJsBUV8AAA
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

We'll need in some tests to control when the device needs to be added
and removed, so let's split the device creation from the DRM device
creation function.

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 14 ++++++-
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 56 +++++++++++++++----------
 drivers/gpu/drm/tests/drm_modes_test.c          | 15 ++++++-
 drivers/gpu/drm/tests/drm_probe_helper_test.c   | 14 ++++++-
 include/drm/drm_kunit_helpers.h                 |  5 ++-
 5 files changed, 77 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 4d475ae6dbb6..053dbc0106d9 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -15,6 +15,7 @@
 
 struct drm_client_modeset_test_priv {
 	struct drm_device *drm;
+	struct device *dev;
 	struct drm_connector connector;
 };
 
@@ -59,7 +60,10 @@ static int drm_client_modeset_test_init(struct kunit *test)
 
 	test->priv = priv;
 
-	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET);
+	priv->dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
+
+	priv->drm = drm_kunit_helper_alloc_drm_device(test, priv->dev, DRIVER_MODESET);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	ret = drmm_connector_init(priv->drm, &priv->connector,
@@ -76,6 +80,13 @@ static int drm_client_modeset_test_init(struct kunit *test)
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
@@ -175,6 +186,7 @@ static struct kunit_case drm_test_pick_cmdline_tests[] = {
 static struct kunit_suite drm_test_pick_cmdline_test_suite = {
 	.name = "drm_test_pick_cmdline",
 	.init = drm_client_modeset_test_init,
+	.exit = drm_client_modeset_test_exit,
 	.test_cases = drm_test_pick_cmdline_tests
 };
 
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index ec33fcbd092d..4bf98bd0a8c6 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -17,36 +17,51 @@ struct kunit_dev {
 static const struct drm_mode_config_funcs drm_mode_config_funcs = {
 };
 
-static int dev_init(struct kunit_resource *res, void *ptr)
+/**
+ * drm_kunit_helper_alloc_device - Allocate a mock device for a KUnit test
+ * @test: The test context object
+ *
+ * This allocates a fake struct &device to create a mock for a KUnit
+ * test.
+ *
+ * Callers need to make sure drm_kunit_helper_free_device() on the
+ * device when done.
+ *
+ * Returns:
+ * A pointer to the new device, or an ERR_PTR() otherwise.
+ */
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
+	return root_device_register(KUNIT_DEVICE_NAME);
 }
+EXPORT_SYMBOL_GPL(drm_kunit_helper_alloc_device);
 
-static void dev_free(struct kunit_resource *res)
+/**
+ * drm_kunit_helper_free_device - Frees a mock device
+ * @test: The test context object
+ * @dev: The device to free
+ *
+ * Frees a device allocated with drm_kunit_helper_alloc_device().
+ */
+void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 {
-	struct device *dev = res->data;
-
 	root_device_unregister(dev);
 }
+EXPORT_SYMBOL_GPL(drm_kunit_helper_free_device);
 
 /**
  * drm_kunit_helper_alloc_drm_device - Allocates a mock DRM device for KUnit tests
  * @test: The test context object
+ * @dev: The parent device object
  * @features: Mocked DRM device driver features
  *
- * This function allocates a new struct &device, creates a struct
- * &drm_driver and will create a struct &drm_device using both.
+ * This function creates a struct &drm_driver and will create a struct
+ * &drm_device from @dev and that driver.
  *
- * The device and driver are tied to the @test context and will get
- * cleaned at the end of the test. The drm_device is allocated through
+ * @dev should be allocated using drm_kunit_helper_alloc_device().
+ *
+ * The driver is tied to the @test context and will get cleaned at the
+ * end of the test. The drm_device is allocated through
  * devm_drm_dev_alloc() and will thus be freed through a device-managed
  * resource.
  *
@@ -54,19 +69,14 @@ static void dev_free(struct kunit_resource *res)
  * A pointer to the new drm_device, or an ERR_PTR() otherwise.
  */
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
 
-	dev = kunit_alloc_resource(test, dev_init, dev_free, GFP_KERNEL, KUNIT_DEVICE_NAME);
-	if (!dev)
-		return ERR_PTR(-ENOMEM);
-
 	driver = kunit_kzalloc(test, sizeof(*driver), GFP_KERNEL);
 	if (!driver)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
index 35965ad86188..d1e9f3c0433a 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -13,6 +13,7 @@
 
 struct drm_test_modes_priv {
 	struct drm_device *drm;
+	struct device *dev;
 };
 
 static int drm_test_modes_init(struct kunit *test)
@@ -22,7 +23,11 @@ static int drm_test_modes_init(struct kunit *test)
 	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
-	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET);
+	priv->dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
+
+	priv->drm = drm_kunit_helper_alloc_drm_device(test, priv->dev,
+						      DRIVER_MODESET);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	test->priv = priv;
@@ -30,6 +35,13 @@ static int drm_test_modes_init(struct kunit *test)
 	return 0;
 }
 
+static void drm_test_modes_exit(struct kunit *test)
+{
+	struct drm_test_modes_priv *priv = test->priv;
+
+	drm_kunit_helper_free_device(test, priv->dev);
+}
+
 static void drm_test_modes_analog_tv_ntsc_480i(struct kunit *test)
 {
 	struct drm_test_modes_priv *priv = test->priv;
@@ -135,6 +147,7 @@ static struct kunit_case drm_modes_analog_tv_tests[] = {
 static struct kunit_suite drm_modes_analog_tv_test_suite = {
 	.name = "drm_modes_analog_tv",
 	.init = drm_test_modes_init,
+	.exit = drm_test_modes_exit,
 	.test_cases = drm_modes_analog_tv_tests,
 };
 
diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/drm/tests/drm_probe_helper_test.c
index be61a92b79d2..63a3bd1a6e4d 100644
--- a/drivers/gpu/drm/tests/drm_probe_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
@@ -17,6 +17,7 @@
 
 struct drm_probe_helper_test_priv {
 	struct drm_device *drm;
+	struct device *dev;
 	struct drm_connector connector;
 };
 
@@ -39,7 +40,10 @@ static int drm_probe_helper_test_init(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 	test->priv = priv;
 
-	priv->drm = drm_kunit_helper_alloc_drm_device(test,
+	priv->dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
+
+	priv->drm = drm_kunit_helper_alloc_drm_device(test, priv->dev,
 						      DRIVER_MODESET | DRIVER_ATOMIC);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
@@ -55,6 +59,13 @@ static int drm_probe_helper_test_init(struct kunit *test)
 	return 0;
 }
 
+static void drm_probe_helper_test_exit(struct kunit *test)
+{
+	struct drm_probe_helper_test_priv *priv = test->priv;
+
+	drm_kunit_helper_free_device(test, priv->dev);
+}
+
 typedef struct drm_display_mode *(*expected_mode_func_t)(struct drm_device *);
 
 struct drm_connector_helper_tv_get_modes_test {
@@ -195,6 +206,7 @@ static struct kunit_case drm_test_connector_helper_tv_get_modes_tests[] = {
 static struct kunit_suite drm_test_connector_helper_tv_get_modes_suite = {
 	.name = "drm_connector_helper_tv_get_modes",
 	.init = drm_probe_helper_test_init,
+	.exit = drm_probe_helper_test_exit,
 	.test_cases = drm_test_connector_helper_tv_get_modes_tests,
 };
 
diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index 6c12b1426ba0..b4277fe92c38 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
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
b4 0.10.1
