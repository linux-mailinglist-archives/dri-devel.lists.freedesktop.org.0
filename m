Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED02627FF9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F4D10E2B6;
	Mon, 14 Nov 2022 13:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4199D10E298;
 Mon, 14 Nov 2022 13:00:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id A4BC9580405;
 Mon, 14 Nov 2022 08:00:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 14 Nov 2022 08:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430850; x=
 1668438050; bh=JFH60TjLhF4X2cG8BsEbpMtUQgyvSuOsjoB880SrFRc=; b=C
 vslx1+xdGuYXdNIXe1/7EdHZw5FXkJkIPb3xLdldgD3W4XeIsxMV936+kTZ67L7d
 tgIYmQmfugh5PQz7R8v8CNx9+XcfdEHyptX7Su0DQtOBzOTpFvRhwkISHeBZXJYL
 jTvrcjEDQiLDqHaG1tzaLGnzr0jVYw5MUDSqU4NL/dHyxsj7fb0zEjwTAh2qzQhj
 OdOAWcGJ9rkwGkckE1sbkgKPYIjhGzck3dFoVtIlPf+e2IhzHwLkUxgPzHLiA8jj
 jmGRUb+xVnpOSsG/F8Azr//dQCQlqOJKDII+akRXiNsvQYkZQDFd+0IMWLdBbmJ9
 +MRCWf69wK8KjPEF7e0Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430850; x=
 1668438050; bh=JFH60TjLhF4X2cG8BsEbpMtUQgyvSuOsjoB880SrFRc=; b=L
 eJNCB/9+1UcxYAKCnUGQcIurjbX58X9k4OO4BxfC5yysl+VJHRL/SLh2jXWBlJB4
 UzItxEgxwsNkBgzDu+nG4Bdm3j7f64gH5QpdICn4SVEvQ0Y15lGH76tylhZyI1s9
 GP/bZUWwPD9ABBK5roU3tNtjxZYAWOoke/XQdIvgSdyiW3ERi1G6komfjxw9H3ma
 VrTSKFsQrt6EfBH6CWr7MCcTOpXw1yFYW2AAlp7m2eTqcVWI+IMWWQ0g6tdzOLrU
 mQs6J58m35jYOuoTjCggNlyqXmwHhAL5GVfhrP4lE8Ch5WrK94W/dKVJouXFe7yw
 MHYHiMoFB87PX8eS4/U2g==
X-ME-Sender: <xms:AjxyYz792K_7U-eXckau04G5saU1wVK2II2u9Nyhlo11EwJ_rKCATg>
 <xme:AjxyY46jB1QT0a2T_w5oeEATVfKQ_WlXq693wauaOz_8CvUr5zDdC8b13ajIQyMAY
 aqkiY2qRHb8Cb52GMw>
X-ME-Received: <xmr:AjxyY6ePeoZc-S3_ahnUP-V5xdToYooi0LC-fQjBYAzuBtmhNStKlV1iyP-d_smkrtCFaEUG0cz1N4g4JmNNJ04c_3tdFsiTpXzUfcJQT8dL3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AjxyY0KgFuRLAUk_hWn1NeilXESdiwBs_wUHA4u7E_RzpVFksS70Wg>
 <xmx:AjxyY3JMuaYRCkVc4vMiZG5Ctsu9JZ8ENCA_IGsx9U7f83qVQl7BBw>
 <xmx:AjxyY9yUkk29CBgud1ZHIkqWk1kFd2h0heg4sCTg6CImxxo2EMCPxg>
 <xmx:AjxyY12FWdMguYUCMCAgZRu8AbnlA-Ls515f5kMqGXcL9SW-ZV2Rag>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:00:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:27 +0100
Subject: [PATCH v9 08/25] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-8-24b168e5bcd5@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4676; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=yVx2uVA5vIWOQWcegjDOinr/nkkAcg+x4eleT1mV5LI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1q8Df6dO3a/hlzv1zrMQm8yf1z1WzA9k4nzzmEs652bV
 2ZubO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjAR32yGP5zBdo8Xz9lskf7/14fgZS
 mrVvKHctTyZfb7TCsVXyHzejXDX+mrSTLH+rTz6me/Vz3n1PtiWyYz1wyl+6LFW12Srh4S4wEA
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

drm_connector_pick_cmdline_mode() is in charge of finding a proper
drm_display_mode from the definition we got in the video= command line
argument.

Let's add some unit tests to make sure we're not getting any regressions
there.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v6:
- Rename tests to be consistent with DRM tests naming convention

Changes in v5:
- Removed useless (for now) count and modes intermediate variables in
  get_modes
- Switched to kunit assertions in test init, and to KUNIT_ASSERT_NOT_NULL
  instead of KUNIT_ASSERT_PTR_NE(..., NULL)

Changes in v4:
- Removed MODULE macros
---
 drivers/gpu/drm/drm_client_modeset.c            |   4 +
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 100 ++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index bbc535cc50dd..d553e793e673 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -1237,3 +1237,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
 	return ret;
 }
 EXPORT_SYMBOL(drm_client_modeset_dpms);
+
+#ifdef CONFIG_DRM_KUNIT_TEST
+#include "tests/drm_client_modeset_test.c"
+#endif
diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
new file mode 100644
index 000000000000..558c098b0384
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Maxime Ripard <mripard@kernel.org>
+ */
+
+#include <kunit/test.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_probe_helper.h>
+
+#include "drm_kunit_helpers.h"
+
+struct drm_client_modeset_test_priv {
+	struct drm_device *drm;
+	struct drm_connector connector;
+};
+
+static int drm_client_modeset_connector_get_modes(struct drm_connector *connector)
+{
+	return drm_add_modes_noedid(connector, 1920, 1200);
+}
+
+static const struct drm_connector_helper_funcs drm_client_modeset_connector_helper_funcs = {
+	.get_modes = drm_client_modeset_connector_get_modes,
+};
+
+static const struct drm_connector_funcs drm_client_modeset_connector_funcs = {
+};
+
+static int drm_client_modeset_test_init(struct kunit *test)
+{
+	struct drm_client_modeset_test_priv *priv;
+	int ret;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	test->priv = priv;
+
+	priv->drm = drm_kunit_device_init(test, DRIVER_MODESET, "drm-client-modeset-test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
+
+	ret = drmm_connector_init(priv->drm, &priv->connector,
+				  &drm_client_modeset_connector_funcs,
+				  DRM_MODE_CONNECTOR_Unknown,
+				  NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_connector_helper_add(&priv->connector, &drm_client_modeset_connector_helper_funcs);
+
+	return 0;
+
+}
+
+static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
+{
+	struct drm_client_modeset_test_priv *priv = test->priv;
+	struct drm_device *drm = priv->drm;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
+	struct drm_display_mode *expected_mode, *mode;
+	const char *cmdline = "1920x1080@60";
+	int ret;
+
+	expected_mode = drm_mode_find_dmt(priv->drm, 1920, 1080, 60, false);
+	KUNIT_ASSERT_NOT_NULL(test, expected_mode);
+
+	KUNIT_ASSERT_TRUE(test,
+			  drm_mode_parse_command_line_for_connector(cmdline,
+								    connector,
+								    cmdline_mode));
+
+	mutex_lock(&drm->mode_config.mutex);
+	ret = drm_helper_probe_single_connector_modes(connector, 1920, 1080);
+	mutex_unlock(&drm->mode_config.mutex);
+	KUNIT_ASSERT_GT(test, ret, 0);
+
+	mode = drm_connector_pick_cmdline_mode(connector);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
+}
+
+
+static struct kunit_case drm_test_pick_cmdline_tests[] = {
+	KUNIT_CASE(drm_test_pick_cmdline_res_1920_1080_60),
+	{}
+};
+
+static struct kunit_suite drm_test_pick_cmdline_test_suite = {
+	.name = "drm_test_pick_cmdline",
+	.init = drm_client_modeset_test_init,
+	.test_cases = drm_test_pick_cmdline_tests
+};
+
+kunit_test_suite(drm_test_pick_cmdline_test_suite);

-- 
b4 0.11.0-dev-99e3a
