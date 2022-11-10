Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6596240BF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285D610E6CD;
	Thu, 10 Nov 2022 11:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE89310E138;
 Thu, 10 Nov 2022 11:07:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1906658026A;
 Thu, 10 Nov 2022 06:07:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Nov 2022 06:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078442; x=
 1668085642; bh=AHTOXHkx0kRKXWWOsfXBu5Gg9FX4EGj4nIy8jaMRRKw=; b=X
 HtiDOoUDUmKijRgHafRXXRNKfRLcp7FF3XngKkYkAO+H4yx9u8Duvf+8HMYFxT/P
 VUsJ5Kw0FB2601wbTG/b0dEvsGVflSquhRH8N2l74wvLaaSwjWjpk2fCtGOyNsq0
 3IyR793l3T7a/bcoAdMlMoRqj7N1rt8TqB2ljA3uqQZWIunQUF4rqDYEvUuR9chv
 Vmy+bO9iTthRJaYLZBOrBw8dv3AxmBpQec2X5bn4UrQbVsvXR/g6vfkzv9MqRcTM
 M2/PWJyz6mgSCkTGr9J4gmvF1oY09lHMdg/5c67Ya+L2pFzIZFp8+qWdSnNt8Ruh
 P01lrPZFd1VqdCWSNejWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078442; x=
 1668085642; bh=AHTOXHkx0kRKXWWOsfXBu5Gg9FX4EGj4nIy8jaMRRKw=; b=A
 VnJsir2CJlHluUFAX2IXnqtHhrU1aarPN9kXNvDhH6scLiTGaMT2A/4Da1nUy2do
 uStXTNgdXMjGh2ED8a/+qwrGIc2mug2NmE8ikQ/SU0+fjhDmzQbkrXuSJLXsYGTO
 fDLrfDMzsOOGFR7DOODLVnEGRekC8Yw+vcEekFatnD0sklbMVmrtUEo4Zn/iGTJJ
 rDMi64nHydI1FqvqigfyeFYFueOzFTL43d2EwBz3h0nWfmkMUk0PLgJ0trpP/dTj
 BW/Gba+8B/wn6T4EFq+ynhyFIBKs5R3tXGwf74ycZxr0mlujmtow8l9KM4dDCN/W
 /T8J36/hJTqkgZAikW8Wg==
X-ME-Sender: <xms:adtsYz1euob5_5iPxTgym77dXAboUNvEp2evXYe066RL2xuQmAvi-w>
 <xme:adtsYyEKN9xK-cjCQa5MnBiIQJYxah7W7GFoY5u8uu_PHFzR9oeaNjURbRaaSOoCQ
 ps3E51DwbKi9r40l8Y>
X-ME-Received: <xmr:adtsYz5OVSJOJtl7VusHp94ukbuvvCiV3_GX7xFsym_hJ8Kr6dKVVcxMmU1Zwp8wLQl9mflyByb3OijXZmc3gx8ibKQgl6AFTC6F1QaKLtrDww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:adtsY41wqWzxnXQxpQ_Wfkceiy8WOwF0ZSkqUeunyzXRYtRpAXPVAw>
 <xmx:adtsY2Feg8O8sP8LcR1E6JSosPw7v_Is6l8TWFuPR5SFT9YKoYy2Xw>
 <xmx:adtsY5_xDOYFAnBNf2hQriHwWz6b7oiQpb-SmpewkXP6gFrLSuT5Bw>
 <xmx:attsY-RFNm6Mz3POoC7X0KGkaDalXNH3EZURTc4JzlmTMyIDuUUeMQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:21 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:13 +0100
Subject: [PATCH v8 01/24] drm/tests: Add Kunit Helpers
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-1-09ce1466967c@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=3409; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8Ci/7PaTzMs8s+hjpIC/3665ddy1Hcazm7HWxVFfewQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1P23q474Vvcme/iJ6+5akfZrQPBlue0PO9nOaS/mT4h
 3yimo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNpd2BkuDtz3uPnD7lr+V+sMxG4zM
 Bw9dV/u97+mzyfLLpmFfIZejP8j26U/Xayh/NlUiXrVeeiqkfBLms+f5zMo7wm/v2+IJ1FPAA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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
