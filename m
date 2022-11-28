Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEBB63ABB1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8D310E205;
	Mon, 28 Nov 2022 14:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022E510E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 14:56:59 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 578192B04FDA;
 Mon, 28 Nov 2022 09:56:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 28 Nov 2022 09:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669647415; x=
 1669654615; bh=gWHLSDxt01TUwbzZLXxed8nnKcAUJxdRDB8YnlauGUg=; b=K
 PEYbLaeM9klv2x+mzgGS++EiF96cOJ+HrkJ19s22zhm9DO+NXhfofb2UO5Hm47Ym
 rhBVbR+tgEfUjO1VuW/CPq51zO1PDPCSBhqgSuwqXvLrMug8ASqG2IVUtQzdEQx7
 lKczXq5YEbCRXspbNFpbHBZEEWxUZx9wAr0reNGexqEnxA2CgHXwd6KMSXY6eaZO
 DRTddcJOwnTbG8/NQ5xHt1h9gJqpEZ7tzr0W0y0Wo4TuME8ufGDVDWGiw4QJEKlp
 EqW6CpQkxf+aMwFLUqMPOodREuuDpSkBJqxm8Stil9vNEp28c+S5R1lnfruVbjOR
 kQ8TfMXlhXzpR1DkS716w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669647415; x=
 1669654615; bh=gWHLSDxt01TUwbzZLXxed8nnKcAUJxdRDB8YnlauGUg=; b=m
 liqduvOqGEGyHKRxzP5p9JOtnmr0e60/Kw381V1vJhxnrY89d8vv1SgMSfkTH4nk
 FaI7a+VRIigk+63+rdKctehQjVKytj1A5RKd7Jx1pae6gEN2XgdcB5GmqlYJJE5F
 qnSUtY0c/T/WM4xo2LcWBy+zqs3EdGA4e7rJFG73V9dLtTdivipkMKwL8rsCvxsK
 Ul851kEfEd/hzF1J9iytygLMbrEEArVEF56xAWLQ2aneM0euNx8Vn9cJv6htP+2i
 HmEOHZ+9N3KRuBTh8GPlymqUZs0WIViWiEOF7agqHu0UXasep8jGZr3L+OK6Rdt3
 LBsekWQnx8MjIDHe9kaZQ==
X-ME-Sender: <xms:N8yEY_QDaZe0ovjowy_javJ55vEowo94vvG_SRwdOtfn5emZC80WKA>
 <xme:N8yEYwwDKladqjDa_HftFQaX4IcRd-sfDsRYwlxGZ3O_5nkp4b7mVbBVMdL6LzWp-
 Anfk0uxtU8J_IqJumE>
X-ME-Received: <xmr:N8yEY01sEJ1WknRv-z7r_poIQQNDHa8sQCAvKBzi7IZ2XPJAlfqUsTrUqOltLvJYLuNjljBRGds3O5uYtaEbqWJ6H7hg6T82Nkk-V425gcAyDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:N8yEY_C2KoNT7X5I93vUwrPaSoPdyPnn5Dc4nQ-1D9tSpxFbS9kiHQ>
 <xmx:N8yEY4hIDzs-s7gB-quA2KkrjNOokzO4KkQz6MxnmmPGfzcodcZ_rg>
 <xmx:N8yEYzqu8i4fzUz5z4JnwzgQCiijtoLHzNQAOJ9EYslrwzc7y7xW8w>
 <xmx:N8yEYxDu-ODuXESeaedDWvb23VxV6jZYYd-8JeT1eniOgXqvI07z2O0xoZc>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 09:56:54 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 28 Nov 2022 15:53:33 +0100
Subject: [PATCH v2 04/17] drm/tests: helpers: Remove the name parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v2-4-efe5ed518b63@cerno.tech>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4305; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=0x+5hpj+aLeskI5zrcODSuexdvDVTacpP7dQDdI1X+o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMktp8t2ng1YnW5ffTdvqZCIcN50C92PzdWK91iYtn6fobro
 3I6+jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzE8TIjw1IlzadyTW92Zp1ijtc7NL
 tP02rJVq1tFV57znkov5jwy5OR4dVrg2pGFiU/q5M6wf/2Hw5Ulf/cuebV7j7bYEMpZfXfPAA=
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

The device name isn't really useful, we can just define it instead of
exposing it in the API.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 3 +--
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 7 ++++---
 drivers/gpu/drm/tests/drm_modes_test.c          | 3 +--
 drivers/gpu/drm/tests/drm_probe_helper_test.c   | 3 +--
 include/drm/drm_kunit_helpers.h                 | 3 +--
 5 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 6cdf08f582ce..4d475ae6dbb6 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -59,8 +59,7 @@ static int drm_client_modeset_test_init(struct kunit *test)
 
 	test->priv = priv;
 
-	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET,
-						      "drm-client-modeset-test");
+	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	ret = drmm_connector_init(priv->drm, &priv->connector,
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 2f67f6cf78d0..16c7926d83c2 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -8,6 +8,8 @@
 
 #include <linux/device.h>
 
+#define KUNIT_DEVICE_NAME	"drm-kunit-mock-device"
+
 struct kunit_dev {
 	struct drm_device base;
 };
@@ -39,7 +41,6 @@ static void dev_free(struct kunit_resource *res)
  * drm_kunit_helper_alloc_drm_device - Allocates a mock DRM device for Kunit tests
  * @test: The test context object
  * @features: Mocked DRM device driver features
- * @name: Name of the struct &device to allocate
  *
  * This function allocates a new struct &device, creates a struct
  * &drm_driver and will create a struct &drm_device using both.
@@ -54,7 +55,7 @@ static void dev_free(struct kunit_resource *res)
  */
 struct drm_device *
 drm_kunit_helper_alloc_drm_device(struct kunit *test,
-				  u32 features, char *name)
+				  u32 features)
 {
 	struct kunit_dev *kdev;
 	struct drm_device *drm;
@@ -62,7 +63,7 @@ drm_kunit_helper_alloc_drm_device(struct kunit *test,
 	struct device *dev;
 	int ret;
 
-	dev = kunit_alloc_resource(test, dev_init, dev_free, GFP_KERNEL, name);
+	dev = kunit_alloc_resource(test, dev_init, dev_free, GFP_KERNEL, KUNIT_DEVICE_NAME);
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
index 6723089dff9f..35965ad86188 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -22,8 +22,7 @@ static int drm_test_modes_init(struct kunit *test)
 	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
-	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET,
-						      "drm-modes-test");
+	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	test->priv = priv;
diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/drm/tests/drm_probe_helper_test.c
index 85236ff4744f..be61a92b79d2 100644
--- a/drivers/gpu/drm/tests/drm_probe_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
@@ -40,8 +40,7 @@ static int drm_probe_helper_test_init(struct kunit *test)
 	test->priv = priv;
 
 	priv->drm = drm_kunit_helper_alloc_drm_device(test,
-						      DRIVER_MODESET | DRIVER_ATOMIC,
-						      "drm-probe-helper-test");
+						      DRIVER_MODESET | DRIVER_ATOMIC);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	connector = &priv->connector;
diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index e9870c7911fe..6c12b1426ba0 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -8,7 +8,6 @@ struct kunit;
 
 struct drm_device *
 drm_kunit_helper_alloc_drm_device(struct kunit *test,
-				  u32 features,
-				  char *name);
+				  u32 features);
 
 #endif // DRM_KUNIT_HELPERS_H_

-- 
2.38.1-b4-0.11.0-dev-d416f
