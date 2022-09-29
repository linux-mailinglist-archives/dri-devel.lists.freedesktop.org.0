Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD07E5EFA95
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD81310EAD3;
	Thu, 29 Sep 2022 16:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FF210EAC5;
 Thu, 29 Sep 2022 16:31:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id E5E40580804;
 Thu, 29 Sep 2022 12:31:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 29 Sep 2022 12:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469075; x=
 1664476275; bh=7YfbxgnAwaQ9hTo1nAXyrUJeBTNGxO2cVu+QTSJge7M=; b=L
 UkLDkkF4tNYRMBp3O3FSCrhh9Dt1dMoujnYgcBNPhvjlM4Rdo5lOyzGfTw1/5WW5
 P4E3H+ZrQBpsqpyvfQ6sfwtS0Q52beIeJD0QDc2Vi05UscFAQJ+UFqcwvlkIU8Ay
 DdapZduT1nnRj4982vDLw3jAouUbCuULHNa80APHcjtqj+7O3NUBtiQh4qgF6uS6
 ZPDQmGoNQcILtUazxdlh8iJ+X/iEoYGmJdv5NwP+AO+6VQreWF2OE2zbUWIXEVsY
 +t3NFmMWXwrbdhorbuPO06ha9RN3Huai5ng62jSJ+ihuFjxYWRGy81u7+ipw/9QU
 NcAxqtA+1klM+2MLU0Mkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469075; x=
 1664476275; bh=7YfbxgnAwaQ9hTo1nAXyrUJeBTNGxO2cVu+QTSJge7M=; b=1
 TrEJRgQq0lOUAsYmW4szpNwDudPHoOzKLOJIhWVKFI1rJTpcBtJs9gs1DafgtJO5
 pSAIEILYG0LYhmDcBvjRWuEDho6ahpAWyYn0C+yd3UqFVrEc3I+LAMeK/nbYEeKf
 T9bE5f74NEn6WWk7XTz4+W/YbmqD6Mgv3SLAJQERj0VTdW4syDzRWLZ8A8OCyu/z
 ryTSskL5qgqg9I23kP834ZAUo9ef1MxzePoPFXAL+DnWnug+BZi2YAyelXSLNHnz
 d9SnkVJNRHT4lIRWkc1CS/tqvxN+dwkeS4kbAfHpDri0IhALZYrSoH8/G0WHUqRS
 HTMT5p012PKI/0uQoZLWQ==
X-ME-Sender: <xms:U8g1YxY98cbgDeKW_iNvG624tns6VeAKVuII6CSzl6khBJvJj-eM5A>
 <xme:U8g1Y4bi1h2IxROP2-5Ctky-qGM2rnIHMk1fbkqjaXMY39PdXYOWK0yFUXwdHzx1X
 C60RQklOZWqVjTqG_o>
X-ME-Received: <xmr:U8g1Yz8v68LDj0CdGHylhLP3QyGm8nAMHymv_O1r1IR_sYpzuhQN2s156mmo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveet
 hfejledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:U8g1Y_ojjb8QrT3n2SnbhKMR4wC1y176rfG66Gk2aqmBCseL3PsTCA>
 <xmx:U8g1Y8qxJpDbm3yWaXb3LfZ285Kkn24lw7Tb2hAaqt-aDueLM1L76A>
 <xmx:U8g1Y1TLU7dB1KCqoNQqQbe5i4zOeupDeaABgVQOIP26kQ96yYm2Qg>
 <xmx:U8g1Y3Xye6Vls-lerBC8Do4d2-M0-wXXFmmMbdnOiSLxicC6JXtyRQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:30:57 +0200
Subject: [PATCH v4 03/30] drm/tests: Add Kunit Helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v4-3-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=slGkTsK1joJYB2lMjXoAXSmWRQW1i6Ovmu+6b4fj+tY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9yULzufaqtaYMHVUSaSc+XGDus1sVY3EtZvefJCQOj+
 W56vHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZgIrx8jw7HjXu+qNriwCHOvfh9vwa
 vuWuVx1EiqYb2Jrdnbg+3x/Qz/6+XsAjd57S8M5dB63cdzV3qHK9vrWMa2SwtLud+86TvBDQA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the number of kunit tests in KMS grows further, we start to have
multiple test suites that, for example, need to register a mock DRM
driver to interact with the KMS function they are supposed to test.

Let's add a file meant to provide those kind of helpers to avoid
duplication.

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
b4 0.11.0-dev-7da52
