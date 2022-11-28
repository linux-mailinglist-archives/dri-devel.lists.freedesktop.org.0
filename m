Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA22C63ABB9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FF210E215;
	Mon, 28 Nov 2022 14:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D382A10E20C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 14:57:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 362952B04FDA;
 Mon, 28 Nov 2022 09:57:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 28 Nov 2022 09:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669647433; x=
 1669654633; bh=siVeotfG+LQNjzeplZ5R3tKdknx8WLO2wt22hYyiJ08=; b=U
 sz6eRz64lP2VCo3q5ZGnIkMdF0kJco9/pNQ5u5ATgCkgUoODHNdwm9U/Ypt+cV4T
 1wBMzELV3Ha3sedOioWwjhrvKDpm//K1Ra0DgSDqzw1ZJsJV10Pm0MSQPIpA9gqw
 ghBq12Bi5hv3W6k1OQ2Tt3SPJmSzIq79PWG8X/dI3oS73TedVZkPBJ37LHOwAsOe
 SbIQi/FWL1AboEDrnjgwOB7sNcS79lWO1QOczouXrxvbvDwmOTtIWYcdEjwXtJld
 v8xruZeTMVdpxk5k5fPb3TNS1BXdnpMPfPYtQTSJHxuqRN/jmm4RE7aNx78xKIOt
 g+UNO0toYy8sDHIfRv1oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669647433; x=
 1669654633; bh=siVeotfG+LQNjzeplZ5R3tKdknx8WLO2wt22hYyiJ08=; b=M
 PxqKFHiUAT92AauTeW+FBWt4ZIcP82k6L0hqhGQRtSDjkO5y2QGoHCWLGhlsFJUf
 7Yh6Jx5eTJuIhJ5KhkfLqBN2AIvFfcoW5lmEIni4rcooue1kLZgQ1UuytG4+wczH
 1x4aphc6h6VOe7Udch5RPooAe31JVn+bg8iEoV91V+NpwqiPHJpCgxy7FBB63h0Q
 fEpWpTwmcuZrp27b+4uEsbP89oLEkDkviT+V5C7ZKvJay5CRBYXEUjPeCUSCSe6Y
 SXFb4Mb08OfaeiwazNQ6xAT7E7rCfzGiAX5vANA69Dus+mOuZBGIPCUAqzuELz+8
 9yoEH8lCZgYfNPei9DH0A==
X-ME-Sender: <xms:SMyEYyt4Vel27P4KX_uzUkdK7U9Tc7ndi4FN13yKfoM0GX-wx3n-MQ>
 <xme:SMyEY3fo9Hz_ophDUXhvBEpiqwinIeDYFem8uHw_NRRQFXHXxcIzahzmgvo5Rcfaf
 9qwDwPWKo6K3VfohOs>
X-ME-Received: <xmr:SMyEY9w8NrSrKdj5zgzILeSZXHJsS_CrXYmIsctWUIZHjm63xbQ70BJLGFDGPC8Eug8_ox-IVfhyW6O41GJr3B_m-VGeiIqVYmoeDXRaMV8v4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ScyEY9P9eJ2qttyoT88wevpAI92zjnM2Z-xSzkzyKGfDz0ZvOBzrYQ>
 <xmx:ScyEYy9pV_UkrO7wKAYNVvrJ6QlgtMW-W9mviBz-sbbzCfV9tyqPnQ>
 <xmx:ScyEY1Wf8jg_kqujfoJf0EqPVv3jUjrIaZVJGotur9QYkdoaUerL0Q>
 <xmx:ScyEYxesxCAx35Ol4R7TOBzG9tzjIu9SLBWoxM9s-ro-q4-CgVWc0O2ZSdU>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 09:57:12 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 28 Nov 2022 15:53:36 +0100
Subject: [PATCH v2 07/17] drm/tests: helpers: Make sure the device is bound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v2-7-efe5ed518b63@cerno.tech>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2290; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=h1QtN+oobfonRRiSQhr47sI75YJ745oyqnRKAWfezaE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMktp8skohyYvkmIM6hJ/2Tc/y6kcqPhcobLRT6KpzduenYx
 cl17RykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACay6jgjw0rpKEd/ww87f2ufb03rtG
 k7f7WR1dsl70CHZ5qUd3XjG0aGQ66+jAesMtay3ZFNUHqcvle3WNNr5vyWXWmsK7jSzrNwAwA=
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

The device managed resources are freed when the device is detached, so
it has to be bound in the first place.

Let's create a fake driver that we will bind to our fake device to
benefit from the device managed cleanups in our tests.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 15678ab823b0..5d3e29353d1a 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -18,12 +18,32 @@ struct kunit_dev {
 static const struct drm_mode_config_funcs drm_mode_config_funcs = {
 };
 
+static int fake_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static int fake_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver fake_platform_driver = {
+	.probe	= fake_probe,
+	.remove	= fake_remove,
+	.driver = {
+		.name	= KUNIT_DEVICE_NAME,
+	},
+};
+
 /**
  * drm_kunit_helper_alloc_device - Allocate a mock device for a KUnit test
  * @test: The test context object
  *
  * This allocates a fake struct &device to create a mock for a Kunit
- * test.
+ * test. The device will also be bound to a fake driver. It will thus be
+ * able to leverage the usual infrastructure and most notably the
+ * device-managed resources just like a "real" device.
  *
  * Callers need to make sure drm_kunit_helper_free_device() on the
  * device when done.
@@ -36,6 +56,9 @@ struct device *drm_kunit_helper_alloc_device(struct kunit *test)
 	struct platform_device *pdev;
 	int ret;
 
+	ret = platform_driver_register(&fake_platform_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	pdev = platform_device_alloc(KUNIT_DEVICE_NAME, PLATFORM_DEVID_NONE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
 
@@ -58,6 +81,7 @@ void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 
 	platform_device_unregister(pdev);
+	platform_driver_unregister(&fake_platform_driver);
 }
 EXPORT_SYMBOL(drm_kunit_helper_free_device);
 

-- 
2.38.1-b4-0.11.0-dev-d416f
