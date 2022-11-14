Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2321627FEF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724B910E2B7;
	Mon, 14 Nov 2022 13:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3295D10E2BA;
 Mon, 14 Nov 2022 13:01:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8F7BC580257;
 Mon, 14 Nov 2022 08:01:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 14 Nov 2022 08:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430874; x=
 1668438074; bh=HSsLw1xyOJQczdua7qvS/z2Fis6foaGGQ/TuvobGK4s=; b=d
 Efg6DU4x3R5ymA5HxhQZUWvEBSdiRFMUH65qWnbH7NWyOKtU9dtlM0hyCX89dnxq
 Iaohv/KkY6+0qA6fBqjB9uCFiLKTZHPAuM+VgcpDwuCx/PogYwoK+OrKhv6xHaNP
 Jqi2hMvv0OodckGXY3T+2v9ZTkszeoghbFRu3Tilco1K7meiwKhLHSTeR4+WZXi7
 t/jv+LgK+2knHrE65EmbCH2ouD01yl2V+Sk/ShPDJRvY4M3pmo5hNxVMw/G2lTiZ
 SdpxrX541LpNcSfnRxJLga8q9FfoFcmPICQluzJRRjqc7PCM7lzOJ553jG+WnoHk
 gg4WC8apKhk6016SaEvvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430874; x=
 1668438074; bh=HSsLw1xyOJQczdua7qvS/z2Fis6foaGGQ/TuvobGK4s=; b=l
 IdK8fObAUQTUJZXAd+7yb12ACJXiIPmHyMqDZ31IQwxkaL5gPg92uRABIGBpoMra
 R+otF1A2s2Sco1WaZQndP1Xid7gi4v/gOqMgS2gHaa7aev2xxL6/ojL2T2Viq4r2
 1hwcXzyeb71f3qEFxQq6UBrl9fAn1N5JPIgf3FfhgsefI9Eyyr3WDE6Pc9T9d+ye
 ejw5MwI/OF4TwGZoJ4JR+d7oizHsguilHOHAhkt9ILi8xJGsGmH08bmu3iMmt82q
 X3zfxJzTUF0tigPUj/4tpaL8hq6CtpcANdPktBxyhji5t8eBWTccSGYURGuKDmKK
 qg4Cw8AndYBhYpfDbg6yw==
X-ME-Sender: <xms:GjxyY1lqSJmu-TcA1PwSn-KyxhV6XaWwkadGMrgt7oZF00js2Bbyfg>
 <xme:GjxyYw1aY9O6wYeRSfyKUops6HYDMi9HJSAFKAsajSfrC_mDV9pMqpjLQ9N0UKrtw
 g6MtATydrn97MmvvDw>
X-ME-Received: <xmr:GjxyY7pdkYUL8Ih8K4ACjiYyqCFsh1nApQlOWX2FeuHZcuQYMXIO3KBrg_ahHejoll_dUMUKskUmWL_xqSrkLo0qRGyU-kmW0D0XsQx6LpsNSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GjxyY1lwdXH21GMi66SLa6pJw0RWlWE2nWdWngbHV-jvoJK2Ld5ozg>
 <xmx:GjxyYz2QQM6pBMaNwb8qJ1dbnEeod-tziFSfL8y49hw3UWMqnaEWEA>
 <xmx:GjxyY0vUNjLmuxRKiaFYYRrYVDXJFiWvqE63MNdF3x6_m89JosIfag>
 <xmx:GjxyYyCftFHqaKks735DNTpjykIYpyj5-An5JpGW7zrkrSzA-gW5wg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:01:13 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:37 +0100
Subject: [PATCH v9 18/25] drm/probe-helper: Provide a TV get_modes helper
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-18-24b168e5bcd5@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12345; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=wvWfzHH+1F5/8JueohQvHCLdBTQtVXwE4HvJEvp0KF4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1m9WLHV5NO9jzr7bGpt+ZUis6+zeZnqanUOyYafF7red
 Bp9CO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRSwcZ/vty7vruxThry2I2pw3dYl
 ODTh+1T9cQOn7o74Xnsf5r/p9m+J8myad99NpZj1O76gKFV5aU2u/hOBq84M6thZW/ny7+I8QCAA==
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

From: Noralf Trønnes <noralf@tronnes.org>

Most of the TV connectors will need a similar get_modes implementation
that will, depending on the drivers' capabilities, register the 480i and
576i modes.

That implementation will also need to set the preferred flag and order
the modes based on the driver and users preferrence.

This is especially important to guarantee that a userspace stack such as
Xorg can start and pick up the preferred mode while maintaining a
working output.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v9:
- Store a function pointer instead of duplicating the expected mode
- Switch to kunit_test_suite

Changes in v8:
- Remove unused tv_mode_support function
- Add unit tests

Changes in v7:
- Used Noralf's implementation

Changes in v6:
- New patch
---
 drivers/gpu/drm/drm_probe_helper.c            |  82 +++++++++++
 drivers/gpu/drm/tests/Makefile                |   1 +
 drivers/gpu/drm/tests/drm_probe_helper_test.c | 202 ++++++++++++++++++++++++++
 include/drm/drm_probe_helper.h                |   1 +
 4 files changed, 286 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index bcd9611dabfd..1ea053cef557 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -1146,3 +1146,85 @@ int drm_connector_helper_get_modes(struct drm_connector *connector)
 	return count;
 }
 EXPORT_SYMBOL(drm_connector_helper_get_modes);
+
+/**
+ * drm_connector_helper_tv_get_modes - Fills the modes availables to a TV connector
+ * @connector: The connector
+ *
+ * Fills the available modes for a TV connector based on the supported
+ * TV modes, and the default mode expressed by the kernel command line.
+ *
+ * This can be used as the default TV connector helper .get_modes() hook
+ * if the driver does not need any special processing.
+ *
+ * Returns:
+ * The number of modes added to the connector.
+ */
+int drm_connector_helper_tv_get_modes(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *tv_mode_property =
+		dev->mode_config.tv_mode_property;
+	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
+	unsigned int ntsc_modes = BIT(DRM_MODE_TV_MODE_NTSC) |
+		BIT(DRM_MODE_TV_MODE_NTSC_443) |
+		BIT(DRM_MODE_TV_MODE_NTSC_J) |
+		BIT(DRM_MODE_TV_MODE_PAL_M);
+	unsigned int pal_modes = BIT(DRM_MODE_TV_MODE_PAL) |
+		BIT(DRM_MODE_TV_MODE_PAL_N) |
+		BIT(DRM_MODE_TV_MODE_SECAM);
+	unsigned int tv_modes[2] = { UINT_MAX, UINT_MAX };
+	unsigned int i, supported_tv_modes = 0;
+
+	if (!tv_mode_property)
+		return 0;
+
+	for (i = 0; i < tv_mode_property->num_values; i++)
+		supported_tv_modes |= BIT(tv_mode_property->values[i]);
+
+	if ((supported_tv_modes & ntsc_modes) &&
+	    (supported_tv_modes & pal_modes)) {
+		uint64_t default_mode;
+
+		if (drm_object_property_get_default_value(&connector->base,
+							  tv_mode_property,
+							  &default_mode))
+			return 0;
+
+		if (cmdline->tv_mode_specified)
+			default_mode = cmdline->tv_mode;
+
+		if (BIT(default_mode) & ntsc_modes) {
+			tv_modes[0] = DRM_MODE_TV_MODE_NTSC;
+			tv_modes[1] = DRM_MODE_TV_MODE_PAL;
+		} else {
+			tv_modes[0] = DRM_MODE_TV_MODE_PAL;
+			tv_modes[1] = DRM_MODE_TV_MODE_NTSC;
+		}
+	} else if (supported_tv_modes & ntsc_modes) {
+		tv_modes[0] = DRM_MODE_TV_MODE_NTSC;
+	} else if (supported_tv_modes & pal_modes) {
+		tv_modes[0] = DRM_MODE_TV_MODE_PAL;
+	} else {
+		return 0;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
+		struct drm_display_mode *mode;
+
+		if (tv_modes[i] == DRM_MODE_TV_MODE_NTSC)
+			mode = drm_mode_analog_ntsc_480i(dev);
+		else if (tv_modes[i] == DRM_MODE_TV_MODE_PAL)
+			mode = drm_mode_analog_pal_576i(dev);
+		else
+			break;
+		if (!mode)
+			return i;
+		if (!i)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+		drm_mode_probed_add(connector, mode);
+	}
+
+	return i;
+}
+EXPORT_SYMBOL(drm_connector_helper_tv_get_modes);
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index c7903c112c65..94fe546d937d 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -13,4 +13,5 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_mm_test.o \
 	drm_modes_test.o \
 	drm_plane_helper_test.o \
+	drm_probe_helper_test.o \
 	drm_rect_test.o
diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/drm/tests/drm_probe_helper_test.c
new file mode 100644
index 000000000000..a875ca0a76da
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kunit test for drm_probe_helper functions
+ */
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_mode.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_probe_helper.h>
+
+#include <kunit/test.h>
+
+#include "drm_kunit_helpers.h"
+
+struct drm_probe_helper_test_priv {
+	struct drm_device *drm;
+	struct drm_connector connector;
+};
+
+static const struct drm_connector_helper_funcs drm_probe_helper_connector_helper_funcs = {
+};
+
+static const struct drm_connector_funcs drm_probe_helper_connector_funcs = {
+	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
+	.reset			= drm_atomic_helper_connector_reset,
+};
+
+static int drm_probe_helper_test_init(struct kunit *test)
+{
+	struct drm_probe_helper_test_priv *priv;
+	struct drm_connector *connector;
+	int ret;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+	test->priv = priv;
+
+	priv->drm = drm_kunit_device_init(test, DRIVER_MODESET | DRIVER_ATOMIC,
+					  "drm-probe-helper-test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
+
+	connector = &priv->connector;
+	ret = drmm_connector_init(priv->drm, connector,
+				  &drm_probe_helper_connector_funcs,
+				  DRM_MODE_CONNECTOR_Unknown,
+				  NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_connector_helper_add(connector, &drm_probe_helper_connector_helper_funcs);
+
+	return 0;
+}
+
+typedef struct drm_display_mode *(*expected_mode_func_t)(struct drm_device *);
+
+struct drm_connector_helper_tv_get_modes_test {
+	const char *name;
+	unsigned int supported_tv_modes;
+	enum drm_connector_tv_mode default_mode;
+	bool cmdline;
+	enum drm_connector_tv_mode cmdline_mode;
+	expected_mode_func_t *expected_modes;
+	unsigned int num_expected_modes;
+};
+
+#define _TV_MODE_TEST(_name, _supported, _default, _cmdline, _cmdline_mode, ...) 		\
+	{											\
+		.name = _name,									\
+		.supported_tv_modes = _supported,						\
+		.default_mode = _default,							\
+		.cmdline = _cmdline,								\
+		.cmdline_mode = _cmdline_mode,							\
+		.expected_modes = (expected_mode_func_t[]) { __VA_ARGS__ }, 			\
+		.num_expected_modes = sizeof((expected_mode_func_t[]) { __VA_ARGS__ }) /	\
+				      (sizeof(expected_mode_func_t)),				\
+	}
+
+#define TV_MODE_TEST(_name, _supported, _default, ...)			\
+	_TV_MODE_TEST(_name, _supported, _default, false, 0, __VA_ARGS__)
+
+#define TV_MODE_TEST_CMDLINE(_name, _supported, _default, _cmdline, ...) \
+	_TV_MODE_TEST(_name, _supported, _default, true, _cmdline, __VA_ARGS__)
+
+static void
+drm_test_connector_helper_tv_get_modes_check(struct kunit *test)
+{
+	const struct drm_connector_helper_tv_get_modes_test *params = test->param_value;
+	struct drm_probe_helper_test_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
+	struct drm_display_mode *mode;
+	const struct drm_display_mode *expected;
+	size_t len;
+	int ret;
+
+	if (params->cmdline) {
+		cmdline->tv_mode_specified = true;
+		cmdline->tv_mode = params->cmdline_mode;
+	}
+
+	ret = drm_mode_create_tv_properties(priv->drm, params->supported_tv_modes);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_object_attach_property(&connector->base,
+				   priv->drm->mode_config.tv_mode_property,
+		 		   params->default_mode);
+
+	mutex_lock(&priv->drm->mode_config.mutex);
+
+	ret = drm_connector_helper_tv_get_modes(connector);
+	KUNIT_EXPECT_EQ(test, ret, params->num_expected_modes);
+
+	list_for_each_entry(mode, &connector->probed_modes, head)
+		len++;
+	KUNIT_EXPECT_EQ(test, len, params->num_expected_modes);
+
+	if (params->num_expected_modes >= 1) {
+		mode = list_first_entry_or_null(&connector->probed_modes,
+						struct drm_display_mode, head);
+		KUNIT_ASSERT_NOT_NULL(test, mode);
+
+		expected = params->expected_modes[0](priv->drm);
+		KUNIT_ASSERT_NOT_NULL(test, expected);
+
+		KUNIT_EXPECT_TRUE(test, drm_mode_equal(mode, expected));
+		KUNIT_EXPECT_TRUE(test, mode->type & DRM_MODE_TYPE_PREFERRED);
+	}
+
+	if (params->num_expected_modes >= 2) {
+		mode = list_next_entry(mode, head);
+		KUNIT_ASSERT_NOT_NULL(test, mode);
+
+		expected = params->expected_modes[1](priv->drm);
+		KUNIT_ASSERT_NOT_NULL(test, expected);
+
+		KUNIT_EXPECT_TRUE(test, drm_mode_equal(mode, expected));
+		KUNIT_EXPECT_FALSE(test, mode->type & DRM_MODE_TYPE_PREFERRED);
+	}
+
+	mutex_unlock(&priv->drm->mode_config.mutex);
+}
+
+static const
+struct drm_connector_helper_tv_get_modes_test drm_connector_helper_tv_get_modes_tests[] = {
+	{ .name = "None" },
+	TV_MODE_TEST("PAL",
+		     BIT(DRM_MODE_TV_MODE_PAL),
+		     DRM_MODE_TV_MODE_PAL,
+		     drm_mode_analog_pal_576i),
+	TV_MODE_TEST("NTSC",
+		     BIT(DRM_MODE_TV_MODE_NTSC),
+		     DRM_MODE_TV_MODE_NTSC,
+		     drm_mode_analog_ntsc_480i),
+	TV_MODE_TEST("Both, NTSC Default",
+		     BIT(DRM_MODE_TV_MODE_NTSC) | BIT(DRM_MODE_TV_MODE_PAL),
+		     DRM_MODE_TV_MODE_NTSC,
+		     drm_mode_analog_ntsc_480i, drm_mode_analog_pal_576i),
+	TV_MODE_TEST("Both, PAL Default",
+		     BIT(DRM_MODE_TV_MODE_NTSC) | BIT(DRM_MODE_TV_MODE_PAL),
+		     DRM_MODE_TV_MODE_PAL,
+		     drm_mode_analog_pal_576i, drm_mode_analog_ntsc_480i),
+	TV_MODE_TEST_CMDLINE("Both, NTSC Default, with PAL on command-line",
+			     BIT(DRM_MODE_TV_MODE_NTSC) | BIT(DRM_MODE_TV_MODE_PAL),
+			     DRM_MODE_TV_MODE_NTSC,
+			     DRM_MODE_TV_MODE_PAL,
+			     drm_mode_analog_pal_576i, drm_mode_analog_ntsc_480i),
+	TV_MODE_TEST_CMDLINE("Both, PAL Default, with NTSC on command-line",
+			     BIT(DRM_MODE_TV_MODE_NTSC) | BIT(DRM_MODE_TV_MODE_PAL),
+			     DRM_MODE_TV_MODE_PAL,
+			     DRM_MODE_TV_MODE_NTSC,
+			     drm_mode_analog_ntsc_480i, drm_mode_analog_pal_576i),
+};
+
+static void
+drm_connector_helper_tv_get_modes_desc(const struct drm_connector_helper_tv_get_modes_test *t,
+				       char *desc)
+{
+	sprintf(desc, "%s", t->name);
+}
+
+KUNIT_ARRAY_PARAM(drm_connector_helper_tv_get_modes,
+		  drm_connector_helper_tv_get_modes_tests,
+		  drm_connector_helper_tv_get_modes_desc);
+
+static struct kunit_case drm_test_connector_helper_tv_get_modes_tests[] = {
+	KUNIT_CASE_PARAM(drm_test_connector_helper_tv_get_modes_check,
+			 drm_connector_helper_tv_get_modes_gen_params),
+	{ }
+};
+
+static struct kunit_suite drm_test_connector_helper_tv_get_modes_suite = {
+	.name = "drm_connector_helper_tv_get_modes",
+	.init = drm_probe_helper_test_init,
+	.test_cases = drm_test_connector_helper_tv_get_modes_tests,
+};
+
+kunit_test_suite(drm_test_connector_helper_tv_get_modes_suite);
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index 5880daa14624..4977e0ab72db 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -35,5 +35,6 @@ int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
 int drm_connector_helper_get_modes_fixed(struct drm_connector *connector,
 					 const struct drm_display_mode *fixed_mode);
 int drm_connector_helper_get_modes(struct drm_connector *connector);
+int drm_connector_helper_tv_get_modes(struct drm_connector *connector);
 
 #endif

-- 
b4 0.11.0-dev-99e3a
