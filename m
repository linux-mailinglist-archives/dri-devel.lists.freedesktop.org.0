Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 186C660E48C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E32010E397;
	Wed, 26 Oct 2022 15:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E1910E394;
 Wed, 26 Oct 2022 15:33:34 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 056CC58034E;
 Wed, 26 Oct 2022 11:33:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 26 Oct 2022 11:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798414; x=
 1666805614; bh=9fMmJts50TrKmeSyL6MmOr+641XQIFNbDPbsLEF5P98=; b=v
 vEY5c04lZa3zcHZ8cQHjO77f/Eo93EreQzEx53lfy11k/wM64RASEto88KZAXNH6
 yItGK/Q/617/r/grEeVA3Sqq1OtpaWFqlE/tiFPoeGlM24kC45S+9soMzuYq/CyE
 qKIJVI5PPl5rGHrZFlUsPx/+TiUuQ2w0nisHXIlCvJal7BIaRZRXXX2d2vomjcTX
 RCeQRgHFelp2UTqRC2M5pH0MZtAmoc0s5KTrVhJpISlj14Axl1bP4sZkqGJosJse
 LhmJlqv+woRK6/eb4aFVOcuegNKq2MkovF+q9C2DxZlkjwSRKhv0WmQSevJjTGXy
 IASBGBjsKHbeP3Sg7Bc8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798414; x=
 1666805614; bh=9fMmJts50TrKmeSyL6MmOr+641XQIFNbDPbsLEF5P98=; b=U
 0Bt7Zp3awS6UBLSVZZjTDFtEjLi22J/78YeQtoMRdM9PXwa1RhpXYyWXLhTsWM/c
 qvpbXYP3AgPKo20REHJYT+RC4uaMffsRBpCHW8wm0Wj0yiNs1bfYrdWQmoNTJuUe
 qGxPXueBOLQZudUKUmZxX7NEBztzU72ZxrJE8z6xNTH6dzREQOz9HVtLfpcNB20Q
 b3N1bWBq5zv/JdDgNos0169yv+6GlCxDTgjLWQ0zhl1SdgNy7eaepuCfQw0V5S5P
 4ou/YUnW6xo1MwvhJOQuCqgRCPClA94Y5pcIIi3eVO6PFnqBLefUUAxIzq1UiH4w
 cdYp+YPNWPIEBqewLYDDA==
X-ME-Sender: <xms:TVNZY3_nq9-_DfKobU6kGCowylQTX0Jvu3whKZfBvM3i8YD7gltVGA>
 <xme:TVNZYzvHN4FM6vM0PeS34hmyfvVuInXDWe_iiz6-wlVu-ffGUYdB1z5jGFSM2E0II
 UPCCV_YmVw6IwkXQNk>
X-ME-Received: <xmr:TVNZY1Aug-01GRRVCd_XoMS2TM1IUpKVyIOXsFB1ssVHeWgdfICHvXA5cWh-1G5vcLJ5_BerrS67SRqZrzniT3r68rHX0N8Vhyd8qmu2ByeDZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeeltdekveelgfelveelfe
 duheelvdegudffgefhudehgeevjefhhefhhefgvdeuvdenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:TVNZYzcEGlNw-u0k1ev7XdIGPpVtodEu43nhjepjdkUUQk1z21ca7g>
 <xmx:TVNZY8P51JJ9hB1zc81n74cmCznuaG-sfg4kGVOVebczftWHfLyR2A>
 <xmx:TVNZY1kmvrd1a0TIDE9I2YRgj9S85LpKPsoBfa_viX70XsZWMsLqeQ>
 <xmx:TlNZYxZWQlHllFA47MqA_fxeYnr7Oq_wnN2gS2FtKo-NnB5ggvCBxw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:33:32 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:20 +0200
Subject: [PATCH v6 01/23] drm/tests: Add Kunit Helpers
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v6-1-e7792734108f@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
 Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=3135; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=A61ucaADofpp/OwOHHVyZjjVUv6WHP8eBe7GXebATyo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwW47Nt+0NF0nbnCCwX3rniVbdS4rHfz/YsLTYAbD+O/C
 XyPudpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAil7wYGWbOimPOPbsy7SSnpgdbcZ
 V8rnnHzuJW+w2yHocjzj/8yc7wv1zk08ei92HuD6o/CxQGqYWpX41yDIt5EcFxmfVw/rUmXgA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the number of kunit tests in KMS grows further, we start to have
multiple test suites that, for example, need to register a mock DRM
driver to interact with the KMS function they are supposed to test.

Let's add a file meant to provide those kind of helpers to avoid
duplication.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v4:
- Simplified the DRM device cleanup patch using devm_drm_dev_alloc()
---
 drivers/gpu/drm/tests/Makefile            |  1 +
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 61 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tests/drm_kunit_helpers.h |  9 +++++
 3 files changed, 71 insertions(+)

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
index 000000000000..3524d6a1fa9a
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -0,0 +1,61 @@
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
+static const struct drm_driver drm_mode_driver = {
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
+struct drm_device *drm_kunit_device_init(struct kunit *test, char *name)
+{
+	struct kunit_dev *kdev;
+	struct drm_device *drm;
+	struct device *dev;
+	int ret;
+
+	dev = kunit_alloc_resource(test, dev_init, dev_free, GFP_KERNEL, name);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	kdev = devm_drm_dev_alloc(dev, &drm_mode_driver, struct kunit_dev, base);
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
index 000000000000..a9354f9bda4e
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.h
@@ -0,0 +1,9 @@
+#ifndef DRM_KUNIT_HELPERS_H_
+#define DRM_KUNIT_HELPERS_H_
+
+struct drm_device;
+struct kunit;
+
+struct drm_device *drm_kunit_device_init(struct kunit *test, char *name);
+
+#endif // DRM_KUNIT_HELPERS_H_

-- 
b4 0.11.0-dev-99e3a
