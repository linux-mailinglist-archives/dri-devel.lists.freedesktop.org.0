Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2BF6C45A0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F9110E8C2;
	Wed, 22 Mar 2023 09:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA4B10E8BF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:06:27 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id br6so22404514lfb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 02:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679475986;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lDnVDQThySlQJmrh4YBbm9gR8eaISzWAXhARyHghRBY=;
 b=JQpKGAroUh5/T/ATI/SS5P+NZzRoLFzw87qx+8mxQeka06xFXgWuf0ls+3e7myPWIx
 CK1Fj9/7hijhSgmnbkalncCG6y8WJI5hN3M83KrUHThnK8HBEe00T5mc7mRNdfvt//IR
 yrEoQDnHqvKaDZeqtMaWf8fFDCnCZS9UnfEFBsW04OGY12UPJ3eexs86DeGnUa2CSjzY
 l8dTpPHZt2FtharF/gOazzgIB7+dCinkeURsg+kh3lTGgl1ltQp1I80ZycACkmskYyo6
 fSjAn6OAmCalnPny4Whcw8nxlHfWb4mWhvkKV/2q4bpPFZ2EULbCyzWMkDdHS8Tsri0V
 TwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679475986;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lDnVDQThySlQJmrh4YBbm9gR8eaISzWAXhARyHghRBY=;
 b=BXRDnVw2vjoDQ7saRjZrlrBj4K9yD5cbF2IcPZfIZbo6AktoVBfu/tEmQbN+w26WVF
 pN/woWpBjbw8EqN59BbQqOAQsFSsmy8xrT38JV2hVbZq5v4Lj6Rdn2guz4JzJA6VLamH
 l8RdB6GAf5NCtDiW7Cs3tGVIHs9LfVHOaamz5VTQYCC8+BNlgCaf/zXslWd13Mbfg9Ww
 MUwknburqsc4ES7CddvAt7YaibklEh5R5dPe81KiGtIxZ9bikivFXaPKDftwA2pyRaGO
 fV3xbJa2bpeeec44Rss6ARB2E/dy7jS3/mqzlxtoLizK6nOh7mN4bhHeIeBdDpIDBhvg
 hbPg==
X-Gm-Message-State: AO0yUKWn1jcrTtFdRxHhG915J0mmYogR/hk86OFPFrs7QTzRDl34/PkU
 ZtYq2ZZYFS+V5Q7vK6oQNik=
X-Google-Smtp-Source: AK7set/ROr5W4syOge48u6w5kKyf7EodwUOjYCTWB/a39sdoWzwg871miQ9GE8lC3+Ac2QgtzxRS8g==
X-Received: by 2002:ac2:522c:0:b0:4ca:98ec:7d9a with SMTP id
 i12-20020ac2522c000000b004ca98ec7d9amr1728626lfl.15.1679475985996; 
 Wed, 22 Mar 2023 02:06:25 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi
 (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
 by smtp.gmail.com with ESMTPSA id
 e16-20020ac25470000000b004db297957e8sm2501462lfn.305.2023.03.22.02.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 02:06:25 -0700 (PDT)
Date: Wed, 22 Mar 2023 11:06:15 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Subject: [PATCH v5 2/8] drm/tests: helpers: Use generic helpers
Message-ID: <7c6760af7fb4788e0f526ff992534b8c2496c6b2.1679474247.git.mazziesaccount@gmail.com>
References: <cover.1679474247.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YLx7fBsPfKWq2vZo"
Content-Disposition: inline
In-Reply-To: <cover.1679474247.git.mazziesaccount@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Jonathan Cameron <jic23@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--YLx7fBsPfKWq2vZo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Replace DRM specific managed device creation test-helpers with generic
ones.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
v4 =3D> v5:
- do not rename + move helpers from DRM but add temporary dublicates to
  simplify merging. This patch depends on interface added at patch 1/8.
---
 drivers/gpu/drm/Kconfig                       |  2 +
 .../gpu/drm/tests/drm_client_modeset_test.c   |  5 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c     | 69 -------------------
 drivers/gpu/drm/tests/drm_managed_test.c      |  5 +-
 drivers/gpu/drm/tests/drm_modes_test.c        |  5 +-
 drivers/gpu/drm/tests/drm_probe_helper_test.c |  5 +-
 drivers/gpu/drm/vc4/Kconfig                   |  1 +
 drivers/gpu/drm/vc4/tests/vc4_mock.c          |  3 +-
 .../gpu/drm/vc4/tests/vc4_test_pv_muxing.c    |  9 +--
 include/drm/drm_kunit_helpers.h               |  7 +-
 10 files changed, 24 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index dc0f94f02a82..0ee8ebe64f57 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -66,6 +66,7 @@ config DRM_USE_DYNAMIC_DEBUG
 config DRM_KUNIT_TEST_HELPERS
 	tristate
 	depends on DRM && KUNIT
+	select TEST_KUNIT_DEVICE_HELPERS
 	help
 	  KUnit Helpers for KMS drivers.
=20
@@ -80,6 +81,7 @@ config DRM_KUNIT_TEST
 	select DRM_BUDDY
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_KUNIT_TEST_HELPERS
+	select TEST_KUNIT_DEVICE_HELPERS
 	default KUNIT_ALL_TESTS
 	help
 	  This builds unit tests for DRM. This option is not useful for
diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/=
drm/tests/drm_client_modeset_test.c
index 416a279b6dae..d7eaa0938eb4 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022 Maxime Ripard <mripard@kernel.org>
  */
=20
+#include <kunit/platform_device.h>
 #include <kunit/test.h>
=20
 #include <drm/drm_connector.h>
@@ -60,7 +61,7 @@ static int drm_client_modeset_test_init(struct kunit *tes=
t)
=20
 	test->priv =3D priv;
=20
-	priv->dev =3D drm_kunit_helper_alloc_device(test);
+	priv->dev =3D test_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
=20
 	priv->drm =3D __drm_kunit_helper_alloc_drm_device(test, priv->dev,
@@ -86,7 +87,7 @@ static void drm_client_modeset_test_exit(struct kunit *te=
st)
 {
 	struct drm_client_modeset_test_priv *priv =3D test->priv;
=20
-	drm_kunit_helper_free_device(test, priv->dev);
+	test_kunit_helper_free_device(test, priv->dev);
 }
=20
 static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/te=
sts/drm_kunit_helpers.c
index e98b4150f556..ae84d0ed8744 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -9,78 +9,9 @@
 #include <linux/device.h>
 #include <linux/platform_device.h>
=20
-#define KUNIT_DEVICE_NAME	"drm-kunit-mock-device"
-
 static const struct drm_mode_config_funcs drm_mode_config_funcs =3D {
 };
=20
-static int fake_probe(struct platform_device *pdev)
-{
-	return 0;
-}
-
-static int fake_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
-static struct platform_driver fake_platform_driver =3D {
-	.probe	=3D fake_probe,
-	.remove	=3D fake_remove,
-	.driver =3D {
-		.name	=3D KUNIT_DEVICE_NAME,
-	},
-};
-
-/**
- * drm_kunit_helper_alloc_device - Allocate a mock device for a KUnit test
- * @test: The test context object
- *
- * This allocates a fake struct &device to create a mock for a KUnit
- * test. The device will also be bound to a fake driver. It will thus be
- * able to leverage the usual infrastructure and most notably the
- * device-managed resources just like a "real" device.
- *
- * Callers need to make sure drm_kunit_helper_free_device() on the
- * device when done.
- *
- * Returns:
- * A pointer to the new device, or an ERR_PTR() otherwise.
- */
-struct device *drm_kunit_helper_alloc_device(struct kunit *test)
-{
-	struct platform_device *pdev;
-	int ret;
-
-	ret =3D platform_driver_register(&fake_platform_driver);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	pdev =3D platform_device_alloc(KUNIT_DEVICE_NAME, PLATFORM_DEVID_NONE);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
-
-	ret =3D platform_device_add(pdev);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	return &pdev->dev;
-}
-EXPORT_SYMBOL_GPL(drm_kunit_helper_alloc_device);
-
-/**
- * drm_kunit_helper_free_device - Frees a mock device
- * @test: The test context object
- * @dev: The device to free
- *
- * Frees a device allocated with drm_kunit_helper_alloc_device().
- */
-void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
-{
-	struct platform_device *pdev =3D to_platform_device(dev);
-
-	platform_device_unregister(pdev);
-	platform_driver_unregister(&fake_platform_driver);
-}
-EXPORT_SYMBOL_GPL(drm_kunit_helper_free_device);
-
 struct drm_device *
 __drm_kunit_helper_alloc_drm_device_with_driver(struct kunit *test,
 						struct device *dev,
diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tes=
ts/drm_managed_test.c
index 1652dca11d30..6b39d2cde164 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -4,6 +4,7 @@
 #include <drm/drm_kunit_helpers.h>
 #include <drm/drm_managed.h>
=20
+#include <kunit/platform_device.h>
 #include <kunit/resource.h>
=20
 #include <linux/device.h>
@@ -35,7 +36,7 @@ static void drm_test_managed_run_action(struct kunit *tes=
t)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
 	init_waitqueue_head(&priv->action_wq);
=20
-	dev =3D drm_kunit_helper_alloc_device(test);
+	dev =3D test_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
=20
 	drm =3D __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, D=
RIVER_MODESET);
@@ -48,7 +49,7 @@ static void drm_test_managed_run_action(struct kunit *tes=
t)
 	KUNIT_ASSERT_EQ(test, ret, 0);
=20
 	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, dev);
+	test_kunit_helper_free_device(test, dev);
=20
 	ret =3D wait_event_interruptible_timeout(priv->action_wq, priv->action_do=
ne,
 					       msecs_to_jiffies(TEST_TIMEOUT_MS));
diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests=
/drm_modes_test.c
index bc4aa2ce78be..addc4d923a26 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -7,6 +7,7 @@
 #include <drm/drm_kunit_helpers.h>
 #include <drm/drm_modes.h>
=20
+#include <kunit/platform_device.h>
 #include <kunit/test.h>
=20
 #include <linux/units.h>
@@ -23,7 +24,7 @@ static int drm_test_modes_init(struct kunit *test)
 	priv =3D kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
=20
-	priv->dev =3D drm_kunit_helper_alloc_device(test);
+	priv->dev =3D test_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
=20
 	priv->drm =3D __drm_kunit_helper_alloc_drm_device(test, priv->dev,
@@ -40,7 +41,7 @@ static void drm_test_modes_exit(struct kunit *test)
 {
 	struct drm_test_modes_priv *priv =3D test->priv;
=20
-	drm_kunit_helper_free_device(test, priv->dev);
+	test_kunit_helper_free_device(test, priv->dev);
 }
=20
 static void drm_test_modes_analog_tv_ntsc_480i(struct kunit *test)
diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/dr=
m/tests/drm_probe_helper_test.c
index 0ee65828623e..f23213464d34 100644
--- a/drivers/gpu/drm/tests/drm_probe_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
@@ -13,6 +13,7 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
=20
+#include <kunit/platform_device.h>
 #include <kunit/test.h>
=20
 struct drm_probe_helper_test_priv {
@@ -40,7 +41,7 @@ static int drm_probe_helper_test_init(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 	test->priv =3D priv;
=20
-	priv->dev =3D drm_kunit_helper_alloc_device(test);
+	priv->dev =3D test_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
=20
 	priv->drm =3D __drm_kunit_helper_alloc_drm_device(test, priv->dev,
@@ -64,7 +65,7 @@ static void drm_probe_helper_test_exit(struct kunit *test)
 {
 	struct drm_probe_helper_test_priv *priv =3D test->priv;
=20
-	drm_kunit_helper_free_device(test, priv->dev);
+	test_kunit_helper_free_device(test, priv->dev);
 }
=20
 typedef struct drm_display_mode *(*expected_mode_func_t)(struct drm_device=
 *);
diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index 91dcf8d174d6..a4bd96445315 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -39,6 +39,7 @@ config DRM_VC4_KUNIT_TEST
 	tristate "KUnit tests for VC4" if !KUNIT_ALL_TESTS
 	depends on DRM_VC4 && KUNIT
 	select DRM_KUNIT_TEST_HELPERS
+	select TEST_KUNIT_DEVICE_HELPERS
 	default KUNIT_ALL_TESTS
 	help
 	  This builds unit tests for the VC4 DRM/KMS driver. This option is
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tes=
ts/vc4_mock.c
index a4bed26af32f..29eb045b0db1 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -3,6 +3,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_kunit_helpers.h>
=20
+#include <kunit/platform_device.h>
 #include <kunit/test.h>
=20
 #include "vc4_mock.h"
@@ -162,7 +163,7 @@ static struct vc4_dev *__mock_device(struct kunit *test=
, bool is_vc5)
 	struct device *dev;
 	int ret;
=20
-	dev =3D drm_kunit_helper_alloc_device(test);
+	dev =3D test_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
=20
 	vc4 =3D drm_kunit_helper_alloc_drm_device_with_driver(test, dev,
diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/d=
rm/vc4/tests/vc4_test_pv_muxing.c
index ae0bd0f81698..64b90e2e3706 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -12,6 +12,7 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_plane.h>
=20
+#include <kunit/platform_device.h>
 #include <kunit/test.h>
=20
 #include "../vc4_drv.h"
@@ -762,7 +763,7 @@ static void vc4_pv_muxing_test_exit(struct kunit *test)
 	drm_modeset_drop_locks(&priv->ctx);
 	drm_modeset_acquire_fini(&priv->ctx);
 	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, vc4->dev);
+	test_kunit_helper_free_device(test, vc4->dev);
 }
=20
 static struct kunit_case vc4_pv_muxing_tests[] =3D {
@@ -873,7 +874,7 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc=
_enable(struct kunit *tes
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, vc4->dev);
+	test_kunit_helper_free_device(test, vc4->dev);
 }
=20
 static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
@@ -963,7 +964,7 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(str=
uct kunit *test)
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, vc4->dev);
+	test_kunit_helper_free_device(test, vc4->dev);
 }
=20
 static void
@@ -1017,7 +1018,7 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_to=
o_many_crtc_state(struct ku
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, vc4->dev);
+	test_kunit_helper_free_device(test, vc4->dev);
 }
=20
 static struct kunit_case vc5_pv_muxing_bugs_tests[] =3D {
diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helper=
s.h
index ed013fdcc1ff..ab438d97aed3 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -8,9 +8,6 @@
 struct drm_device;
 struct kunit;
=20
-struct device *drm_kunit_helper_alloc_device(struct kunit *test);
-void drm_kunit_helper_free_device(struct kunit *test, struct device *dev);
-
 struct drm_device *
 __drm_kunit_helper_alloc_drm_device_with_driver(struct kunit *test,
 						struct device *dev,
@@ -27,7 +24,7 @@ __drm_kunit_helper_alloc_drm_device_with_driver(struct ku=
nit *test,
  *
  * This function creates a struct &drm_device from @_dev and @_drv.
  *
- * @_dev should be allocated using drm_kunit_helper_alloc_device().
+ * @_dev should be allocated using test_kunit_helper_alloc_device().
  *
  * The driver is tied to the @_test context and will get cleaned at the
  * end of the test. The drm_device is allocated through
@@ -72,7 +69,7 @@ __drm_kunit_helper_alloc_drm_device(struct kunit *test,
  * This function creates a struct &drm_driver and will create a struct
  * &drm_device from @_dev and that driver.
  *
- * @_dev should be allocated using drm_kunit_helper_alloc_device().
+ * @_dev should be allocated using test_kunit_helper_alloc_device().
  *
  * The driver is tied to the @_test context and will get cleaned at the
  * end of the test. The drm_device is allocated through
--=20
2.39.2


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--YLx7fBsPfKWq2vZo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmQaxQcACgkQeFA3/03a
ocVFgAgArmVQiNZrc7neakAHnGsodMNrEJeBnnJYzAekR6ztBvkIGf74olKFMulC
2ggqek0Jz/wuYTO1GCGq9Tw77xAqEHjFN8H7+ZbDmtXt5EgwLJ+95rKDCtIqr10z
mmKsK/eVpLHJ9l2mHQJqvMGFWrRt6b2N6C89R104PNy1TsGK6CVih8cb1tMgNcsM
sKOZgEMdZnMLb3BE6ShYvngZWjDvcu1BNVhveUPEuBrpVbydrgVGWeQorgrMhFIf
gOfOCFhc2fpA0yQ5yEKsJKUazPo6n7eO5PeQLQzcC0vfAEFiMqigf/za447iczTb
90VfjsxP7G2t2rOa5HXtshr6ID4tYg==
=lcsz
-----END PGP SIGNATURE-----

--YLx7fBsPfKWq2vZo--
