Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 112A25EFAAA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2669610EAB9;
	Thu, 29 Sep 2022 16:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBDA10EAE6;
 Thu, 29 Sep 2022 16:31:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id F18CB580804;
 Thu, 29 Sep 2022 12:31:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 29 Sep 2022 12:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469101; x=
 1664476301; bh=fXgOJN1LW1amnuPPnCvibAr43dTYe2jjNHrV/PnQNmU=; b=X
 NtuRRSz3cJ+jd/pOsX3B7ZLpBKkexM2x5PSgVl/VBWgGM7vL0gMrvnc8bypoXSqN
 f7L4XtRqva0r9QK1q53DfXnIqhaEYmxbqJ69xOv40o+luqedSsQTDdUyct9b2Ae9
 cnLFWZTDt3VkUGIMfpcZx2V2Mts/spvvfmioxO7H40f9uK1BxK/okKHxs5cWUDbs
 s82S4NXYh4k1T7HyuDSU7TgoNR7OrLhZT0xO8mZo9FqjqTaGEdcR28cctEMPLKsi
 Ts7XmsZBpSF3JLxtOAHNgMjyZPd6aVl7rWy5O7QKzA8OFjLSRdNyATB0r6QORbvK
 Fr6AwpQcyQN2yrCfE8ftA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469101; x=
 1664476301; bh=fXgOJN1LW1amnuPPnCvibAr43dTYe2jjNHrV/PnQNmU=; b=G
 8xXSVqEzTZSbi5pCKxd7jf+9jn53ZQ99FFQplRxgYmhbI7zPlVHq9LVcC5oDKNb/
 HxYt7S6t+mCs/InpzpwCq1DWpPA5vyKnfFF533bAdVaA6K5NeAkDc70AMpmnZv/3
 DL9c0djzxTmNrn5gttoqJT2ccThmOorUHSVxBzXoJDoobrtF2cwXI1qe9J/x8CgV
 NUtDmWF3jcyNl1i2yvIMM6SY/pMTypQv7FE8D1cwCc3NSefJIvdwVOeDj/HLZCZ9
 OUZ43jgQZ+joZ5pMi19gqRsAgzViekQFp5DyW4WbENHmVn3DrqY84ZbgI1DXZWRn
 fk54hwhInlHprzUUoqMMg==
X-ME-Sender: <xms:bcg1Y6wVccgc9cEcD5rX9-KJ5Qci9Vd6xFeI_xRenWQtnqCoUBRVFQ>
 <xme:bcg1Y2TeJFwCn6rJY8vz6gP5FfdpiBgSVI3NMAu1n09388vRPqMQ-tetNcErxymja
 atOr2aCvgAZh20vSR8>
X-ME-Received: <xmr:bcg1Y8XgEA_FZ9ekcW6hNTZ2QvVZpEZxs1IEs_eM7tcds51cn44Ah251B-o_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveet
 hfejledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bcg1YwgeoOSZNB_nE1UxjyzdMn6HcMKxYEvwvz6WC61kRdkKcgBySA>
 <xmx:bcg1Y8C9yw5IpAZX4qtHztbgOcVscNZqlyAf4x3HEqIYGEYR9UMFbA>
 <xmx:bcg1YxLnIEfuatM3rjiLJVdnYNklxTHkfYSnORIwurneHuWfOgKDMA>
 <xmx:bcg1Y1th44jvfnnNmcjxozmnidEooKivWo0UYLh0_Aal_IK6t31lkg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:08 +0200
Subject: [PATCH v4 14/30] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v4-14-60d38873f782@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4277; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=7VyM4Pt4bZb5rC3DABT+LAl6SB4YL57S4Ca68AjYCgE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9z/Jh3Y+27xr/P7NqaUOzcelpkyId/R4K0N+6bfjMZG
 pyfadpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi9p8Y/gps+atZL5bQc+uxi5mI6E
 SdP17mqf8cJjXevvRq8wGu2GxGhrdmC569Wrul94TWktC3z99qXFtyzveyvFn2uQQB+Vd5lQwA
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

drm_connector_pick_cmdline_mode() is in charge of finding a proper
drm_display_mode from the definition we got in the video= command line
argument.

Let's add some unit tests to make sure we're not getting any regressions
there.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v4:
- Removed MODULE macros
---
 drivers/gpu/drm/drm_client_modeset.c            |   4 +
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 105 ++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

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
index 000000000000..09dc5acbbc42
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -0,0 +1,105 @@
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
+	struct drm_display_mode *mode;
+	int count;
+
+	count = drm_add_modes_noedid(connector, 1920, 1200);
+
+	return count;
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
+	if (!priv)
+		return -ENOMEM;
+	test->priv = priv;
+
+	priv->drm = drm_kunit_device_init(test, "drm-client-modeset-test");
+	if (IS_ERR(priv->drm))
+		return PTR_ERR(priv->drm);
+
+	ret = drmm_connector_init(priv->drm, &priv->connector,
+				  &drm_client_modeset_connector_funcs,
+				  DRM_MODE_CONNECTOR_Unknown,
+				  NULL);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(&priv->connector, &drm_client_modeset_connector_helper_funcs);
+
+	return 0;
+
+}
+
+static void drm_pick_cmdline_res_1920_1080_60(struct kunit *test)
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
+	KUNIT_ASSERT_PTR_NE(test, expected_mode, NULL);
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
+	KUNIT_ASSERT_PTR_NE(test, mode, NULL);
+
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
+}
+
+static struct kunit_case drm_pick_cmdline_tests[] = {
+	KUNIT_CASE(drm_pick_cmdline_res_1920_1080_60),
+	{}
+};
+
+static struct kunit_suite drm_pick_cmdline_test_suite = {
+	.name = "drm_pick_cmdline",
+	.init = drm_client_modeset_test_init,
+	.test_cases = drm_pick_cmdline_tests
+};
+
+kunit_test_suite(drm_pick_cmdline_test_suite);

-- 
b4 0.11.0-dev-7da52
