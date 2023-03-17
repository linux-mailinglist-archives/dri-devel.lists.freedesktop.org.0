Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 479736BEB8D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 15:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6997610E38B;
	Fri, 17 Mar 2023 14:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095AC10E38B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 14:41:45 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id x17so6767926lfu.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 07:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679064103;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=voAKQ3WGCeTkXYK2HgOGiBs7zBasJeDeL3Ew5RR80Fo=;
 b=dmHVDP7L4ERSg8EX1AnfG1RtU7LykXB8+MYj1A6GJvnhbd6nlvGI12KndfuPvM96Vm
 6IndSgb/TPB+NWJYVOsQygy7QOrEpOPCKXY4CXzRuRqbbP5/1vm9u51hop11TG6LwKjY
 W+KGpRLXdB7aCIgBJ8NAonMgCsYU2sEHiPrR8OZwPVeK2okMl9PE8oMfZaX88ajUUDIJ
 jMXyGWqP0qB/af+LIWtwcu2evJLu2cs9K8tyHyTuwy5KN1VvyfMZAAltPF2zvC2PJE7v
 GicRTK1Wjs31qQ0XiEhjtd9KLM0aPdh48Yn4a/kHnvLN3l9k/C04Ysg0okJzCRg2Z+ml
 UMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679064103;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=voAKQ3WGCeTkXYK2HgOGiBs7zBasJeDeL3Ew5RR80Fo=;
 b=l9Le3ykU/SVZa8isfE9b7dZOMD2Ve3bRrVhWNqESvNdELlyTfB8FMQcgVa1uySDw4X
 EO3u1pKJixmD2tGzxvBRVkMsFdWLr90SySFqUKqy/LPCnU4SzY0GAVCmeNCOWD+Kp69d
 bduFyqrkYarID4gUY97b10eX84uxwDwHddWEtl1iFP6TAO0xKecnJeOfwQjIYit8Xzxm
 slPHTgUJ8yV3iOJKANNXnxP8RxpFq2pTHy8a4Qci6cLCeEc6A93feebv1hE17bhPBNNd
 1rxcbeYCKRj+dQLDKRDHtHEzt/PyoLUTT74e6yihtjEGsliiiiTP+mfqgcCBGT3+b0Q9
 NyhA==
X-Gm-Message-State: AO0yUKUcILMjINx4Zca2rBcjPM9s8Vj+1aWoO3eo8JdB9jP8wvjWqEL+
 TwCasC55N2Fgk72mZpa7vDI=
X-Google-Smtp-Source: AK7set/5DKeTmhFYs98YUxLBeNsjnzd1MIj3hXD8RQV2Z+qSvpfMCNIfzT1xMkNzROt3mV0YQISvXg==
X-Received: by 2002:ac2:446f:0:b0:4b0:1305:6e02 with SMTP id
 y15-20020ac2446f000000b004b013056e02mr4026129lfl.8.1679064103061; 
 Fri, 17 Mar 2023 07:41:43 -0700 (PDT)
Received: from fedora ([213.255.186.46]) by smtp.gmail.com with ESMTPSA id
 b6-20020a056512218600b004e8452972a2sm391958lft.247.2023.03.17.07.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 07:41:42 -0700 (PDT)
Date: Fri, 17 Mar 2023 16:41:26 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Subject: [PATCH v4 1/8] drm/tests: helpers: rename generic helpers
Message-ID: <15d07e799f7c7fddc91030b16266d4a8bbaf1cc1.1679062529.git.mazziesaccount@gmail.com>
References: <cover.1679062529.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r3ZKwFh0G8eUqzZ1"
Content-Disposition: inline
In-Reply-To: <cover.1679062529.git.mazziesaccount@gmail.com>
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
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--r3ZKwFh0G8eUqzZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The creation of a dummy device in order to test managed interfaces is a
generally useful test feature. The drm test helpers
drm_kunit_helper_alloc_device() and drm_kunit_helper_free_device()
are doing exactly this. It makes no sense that each and every component
which intends to be testing managed interfaces will create similar
helpers so rename these to more generic format.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c |  4 ++--
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 16 ++++++++--------
 drivers/gpu/drm/tests/drm_managed_test.c        |  4 ++--
 drivers/gpu/drm/tests/drm_modes_test.c          |  4 ++--
 drivers/gpu/drm/tests/drm_probe_helper_test.c   |  4 ++--
 drivers/gpu/drm/vc4/tests/vc4_mock.c            |  2 +-
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c  |  8 ++++----
 include/drm/drm_kunit_helpers.h                 |  8 ++++----
 8 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/=
drm/tests/drm_client_modeset_test.c
index 416a279b6dae..27ab03d1c518 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -60,7 +60,7 @@ static int drm_client_modeset_test_init(struct kunit *tes=
t)
=20
 	test->priv =3D priv;
=20
-	priv->dev =3D drm_kunit_helper_alloc_device(test);
+	priv->dev =3D test_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
=20
 	priv->drm =3D __drm_kunit_helper_alloc_drm_device(test, priv->dev,
@@ -86,7 +86,7 @@ static void drm_client_modeset_test_exit(struct kunit *te=
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
index e98b4150f556..ec93b0300f03 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -33,7 +33,7 @@ static struct platform_driver fake_platform_driver =3D {
 };
=20
 /**
- * drm_kunit_helper_alloc_device - Allocate a mock device for a KUnit test
+ * test_kunit_helper_alloc_device - Allocate a mock device for a KUnit test
  * @test: The test context object
  *
  * This allocates a fake struct &device to create a mock for a KUnit
@@ -41,13 +41,13 @@ static struct platform_driver fake_platform_driver =3D {
  * able to leverage the usual infrastructure and most notably the
  * device-managed resources just like a "real" device.
  *
- * Callers need to make sure drm_kunit_helper_free_device() on the
+ * Callers need to make sure test_kunit_helper_free_device() on the
  * device when done.
  *
  * Returns:
  * A pointer to the new device, or an ERR_PTR() otherwise.
  */
-struct device *drm_kunit_helper_alloc_device(struct kunit *test)
+struct device *test_kunit_helper_alloc_device(struct kunit *test)
 {
 	struct platform_device *pdev;
 	int ret;
@@ -63,23 +63,23 @@ struct device *drm_kunit_helper_alloc_device(struct kun=
it *test)
=20
 	return &pdev->dev;
 }
-EXPORT_SYMBOL_GPL(drm_kunit_helper_alloc_device);
+EXPORT_SYMBOL_GPL(test_kunit_helper_alloc_device);
=20
 /**
- * drm_kunit_helper_free_device - Frees a mock device
+ * test_kunit_helper_free_device - Frees a mock device
  * @test: The test context object
  * @dev: The device to free
  *
- * Frees a device allocated with drm_kunit_helper_alloc_device().
+ * Frees a device allocated with test_kunit_helper_alloc_device().
  */
-void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
+void test_kunit_helper_free_device(struct kunit *test, struct device *dev)
 {
 	struct platform_device *pdev =3D to_platform_device(dev);
=20
 	platform_device_unregister(pdev);
 	platform_driver_unregister(&fake_platform_driver);
 }
-EXPORT_SYMBOL_GPL(drm_kunit_helper_free_device);
+EXPORT_SYMBOL_GPL(test_kunit_helper_free_device);
=20
 struct drm_device *
 __drm_kunit_helper_alloc_drm_device_with_driver(struct kunit *test,
diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tes=
ts/drm_managed_test.c
index 1652dca11d30..53f870493577 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -35,7 +35,7 @@ static void drm_test_managed_run_action(struct kunit *tes=
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
@@ -48,7 +48,7 @@ static void drm_test_managed_run_action(struct kunit *tes=
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
index bc4aa2ce78be..1bd8540086e9 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -23,7 +23,7 @@ static int drm_test_modes_init(struct kunit *test)
 	priv =3D kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
=20
-	priv->dev =3D drm_kunit_helper_alloc_device(test);
+	priv->dev =3D test_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
=20
 	priv->drm =3D __drm_kunit_helper_alloc_drm_device(test, priv->dev,
@@ -40,7 +40,7 @@ static void drm_test_modes_exit(struct kunit *test)
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
index 0ee65828623e..bc4b271bec09 100644
--- a/drivers/gpu/drm/tests/drm_probe_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
@@ -40,7 +40,7 @@ static int drm_probe_helper_test_init(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 	test->priv =3D priv;
=20
-	priv->dev =3D drm_kunit_helper_alloc_device(test);
+	priv->dev =3D test_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
=20
 	priv->drm =3D __drm_kunit_helper_alloc_drm_device(test, priv->dev,
@@ -64,7 +64,7 @@ static void drm_probe_helper_test_exit(struct kunit *test)
 {
 	struct drm_probe_helper_test_priv *priv =3D test->priv;
=20
-	drm_kunit_helper_free_device(test, priv->dev);
+	test_kunit_helper_free_device(test, priv->dev);
 }
=20
 typedef struct drm_display_mode *(*expected_mode_func_t)(struct drm_device=
 *);
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tes=
ts/vc4_mock.c
index a4bed26af32f..5bb1fa828a3f 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -162,7 +162,7 @@ static struct vc4_dev *__mock_device(struct kunit *test=
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
index ae0bd0f81698..8b373fa76d6f 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -762,7 +762,7 @@ static void vc4_pv_muxing_test_exit(struct kunit *test)
 	drm_modeset_drop_locks(&priv->ctx);
 	drm_modeset_acquire_fini(&priv->ctx);
 	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, vc4->dev);
+	test_kunit_helper_free_device(test, vc4->dev);
 }
=20
 static struct kunit_case vc4_pv_muxing_tests[] =3D {
@@ -873,7 +873,7 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc=
_enable(struct kunit *tes
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, vc4->dev);
+	test_kunit_helper_free_device(test, vc4->dev);
 }
=20
 static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
@@ -963,7 +963,7 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(str=
uct kunit *test)
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, vc4->dev);
+	test_kunit_helper_free_device(test, vc4->dev);
 }
=20
 static void
@@ -1017,7 +1017,7 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_to=
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
index ed013fdcc1ff..8e3aae6a5ed5 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -8,8 +8,8 @@
 struct drm_device;
 struct kunit;
=20
-struct device *drm_kunit_helper_alloc_device(struct kunit *test);
-void drm_kunit_helper_free_device(struct kunit *test, struct device *dev);
+struct device *test_kunit_helper_alloc_device(struct kunit *test);
+void test_kunit_helper_free_device(struct kunit *test, struct device *dev);
=20
 struct drm_device *
 __drm_kunit_helper_alloc_drm_device_with_driver(struct kunit *test,
@@ -27,7 +27,7 @@ __drm_kunit_helper_alloc_drm_device_with_driver(struct ku=
nit *test,
  *
  * This function creates a struct &drm_device from @_dev and @_drv.
  *
- * @_dev should be allocated using drm_kunit_helper_alloc_device().
+ * @_dev should be allocated using test_kunit_helper_alloc_device().
  *
  * The driver is tied to the @_test context and will get cleaned at the
  * end of the test. The drm_device is allocated through
@@ -72,7 +72,7 @@ __drm_kunit_helper_alloc_drm_device(struct kunit *test,
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

--r3ZKwFh0G8eUqzZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmQUfBYACgkQeFA3/03a
ocWxJQgAsvyL6/6Jfyx13tfdfaOcwPPwP38sex+/wPdHfsVP6nnjXdDIgRlbAci4
OBlDCnzsc2Dvh17gG7ahrZs+1U6/KPNX2FvXfxdAPshIxIAesKTe2IYKY1zWpICr
nMzsYaVzL0fq+HJRJizlqtphJ0I7qoHm6nPr/Z/x/O+CkQCL0gyWJNChRt5IGJ0N
v1pVhew62D0XGsSasIoMvSEhAIFnXj8xvln4fu8YSvsuwp0y9GyDtpqoR1x0p9FH
K1GyX7CEpF1KPL2F0EaWqw7KWltQcNCtSCxq8FGSkf02w78GOJtaLK9rVc7GuFoL
rvGX5WD7LBz0sCzq3DLy223YTfPqzA==
=EIBx
-----END PGP SIGNATURE-----

--r3ZKwFh0G8eUqzZ1--
