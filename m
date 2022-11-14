Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DA3627FA0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DEE10E0EE;
	Mon, 14 Nov 2022 13:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC2B10E0AE;
 Mon, 14 Nov 2022 13:00:39 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 89C43580403;
 Mon, 14 Nov 2022 08:00:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 14 Nov 2022 08:00:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430838; x=
 1668438038; bh=AHTOXHkx0kRKXWWOsfXBu5Gg9FX4EGj4nIy8jaMRRKw=; b=c
 clrzSHkh45vreezRyAeQT0BguYWaV/JdiA7HgEGjqvikh8NuToz6GYS1nlT5SL6r
 N4HFM11uH8blYtvsr6867gCpJQRacCo8iY8jcLGSsUpWFlY34L9BlK+Qw7ZctXC4
 bVFMR4wvmxCBqVInmBKNRv4O2HLgp1y3CSQLdTt5+ZcSymJE6elxREOeDuSmvIqO
 G32fRPWU6WJlKp3tISLTkrcxUjDEAJC3+WOeZeFqAccE+GPGGeGNFTOKArCtqNIV
 pVcuffWFPYaQEshrag9WIIhrW+E+V1yFsNPBN5bC8aA43zFeNNHwkpsELJiQLB5o
 +YBhTmR/wjHGekCdkjdMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430838; x=
 1668438038; bh=AHTOXHkx0kRKXWWOsfXBu5Gg9FX4EGj4nIy8jaMRRKw=; b=K
 ZZe8/ZRExz25mn6TvmAoxwIkrXjC3r1z8SVpli/4MiWOX9lVEjADeST8/Mk19Xes
 XoaVSE4PUU23hAbxc56tbBLgFXqI7VohsiT2JV3qNd3kSFp/L4keenCMrdlhxT6g
 DM1VsqWWnaX7hnZJwE5yW1FqQhWiDGUIPRgWtbYy5FSIcih6WlGae/GDFjf7KSPL
 ZqqCp66LglE4ePtr0Zw8aJid4kbP+XyOynyuwgc7UaqwJk+DdixSG0SaKpao41TD
 w21rtPxEs4I0yCMJ/W0DKJYwqCEhcUFikbhc9WrAdSDs6+pXLgzGQQdN6sI4C6wG
 /MFuODJrXUzaUYYHSgmNQ==
X-ME-Sender: <xms:9TtyY-5gYR_q9DzHIc6Z3ppmzHIq4wxezsjaVFhucy0cfyZEfoVsAw>
 <xme:9TtyY3416uAZAzpeu2J4Z1__cQdygsrFBcHAJ_5tQ6mOaMFO4sQQWYUG3OqNGz__z
 sWfSQ-_JWhHVnB_h-M>
X-ME-Received: <xmr:9TtyY9dSULudvK3KXXa5b4AZ6sTmjmKJrqBCW3L6tt7a87fM-bMVpSPawwrQBCdwLnWgTtI6Rc5ctU7VPKyGzj09DHCZCqdreAjqjnSQKDqoGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9jtyY7LbtwBqjvlKYtraeDfGyCpHNUzV3ZRPw5nYbl1imMnbYXktLg>
 <xmx:9jtyYyI7Bp4DqOclevypnHLLZSeF-G4Khqz5yrJ9E43Q2mjVB_FLDQ>
 <xmx:9jtyY8xVBmLCDiLIZZstGwRgT4vsV3H_fn6cu_aSH3alaIob1lqgaw>
 <xmx:9jtyY40jiV86CQspB5TkE1x4GY4dyuO4xXr1DaTEi5EJgu5S2_2ibA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:00:37 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:21 +0100
Subject: [PATCH v9 02/25] drm/tests: Add Kunit Helpers
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-2-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=3409; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8Ci/7PaTzMs8s+hjpIC/3665ddy1Hcazm7HWxVFfewQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1q+3G89/0P/mvtyVt7sT/vzPrN7wt+WH79y46XrLZEPO
 BMl0dZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiGQ4M/5ROMS+tCL08L4L31I8JV8
 TXRid6ZM3KZpi+1km+rX559gqG/6568VODYk/qtwldfXe76MM+7817S75L2LmIbYkyT2hPZQYA
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the number of kunit tests in KMS grows further, we start to have
multiple test suites that, for example, need to register a mock DRM
driver to interact with the KMS function they are supposed to test.

Let's add a file meant to provide those kind of helpers to avoid
duplication.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v8:
- Changed the API a bit to pass the features as argument

Changes in v4:
- Simplified the DRM device cleanup patch using devm_drm_dev_alloc()
---
 drivers/gpu/drm/tests/Makefile            |  1 +
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 64 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tests/drm_kunit_helpers.h |  9 +++++
 3 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 2d9f49b62ecb..b29ef1085cad 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_format_helper_test.o \
 	drm_format_test.o \
 	drm_framebuffer_test.o \
+	drm_kunit_helpers.o \
 	drm_mm_test.o \
 	drm_plane_helper_test.o \
 	drm_rect_test.o
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
new file mode 100644
index 000000000000..d3f0d681b685
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -0,0 +1,64 @@
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+
+#include <kunit/resource.h>
+
+#include <linux/device.h>
+
+struct kunit_dev {
+	struct drm_device base;
+};
+
+static const struct drm_mode_config_funcs drm_mode_config_funcs = {
+};
+
+static int dev_init(struct kunit_resource *res, void *ptr)
+{
+	char *name = ptr;
+	struct device *dev;
+
+	dev = root_device_register(name);
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	res->data = dev;
+	return 0;
+}
+
+static void dev_free(struct kunit_resource *res)
+{
+	struct device *dev = res->data;
+
+	root_device_unregister(dev);
+}
+
+struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char *name)
+{
+	struct kunit_dev *kdev;
+	struct drm_device *drm;
+	struct drm_driver *driver;
+	struct device *dev;
+	int ret;
+
+	dev = kunit_alloc_resource(test, dev_init, dev_free, GFP_KERNEL, name);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	driver = kunit_kzalloc(test, sizeof(*driver), GFP_KERNEL);
+	if (!driver)
+		return ERR_PTR(-ENOMEM);
+
+	driver->driver_features = features;
+	kdev = devm_drm_dev_alloc(dev, driver, struct kunit_dev, base);
+	if (IS_ERR(kdev))
+		return ERR_CAST(kdev);
+
+	drm = &kdev->base;
+	drm->mode_config.funcs = &drm_mode_config_funcs;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return drm;
+}
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.h b/drivers/gpu/drm/tests/drm_kunit_helpers.h
new file mode 100644
index 000000000000..f13a18dd1c6d
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.h
@@ -0,0 +1,9 @@
+#ifndef DRM_KUNIT_HELPERS_H_
+#define DRM_KUNIT_HELPERS_H_
+
+struct drm_device;
+struct kunit;
+
+struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char *name);
+
+#endif // DRM_KUNIT_HELPERS_H_

-- 
b4 0.11.0-dev-99e3a
