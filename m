Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959185853D0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE9510F32C;
	Fri, 29 Jul 2022 16:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1341C10E64C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 65A1A580937;
 Fri, 29 Jul 2022 12:35:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 29 Jul 2022 12:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112557; x=
 1659119757; bh=rionF70mGt2ReIu0+bybNfVGogwhxNfWtTjJc6I+c/U=; b=E
 C0Jsk6QNxiRXyGDpwM1XIRCrDQ6YCr5BX3Z4GDmWNY5jN0GN8sZT+OMHlM3kBOd1
 lFxtLRax6yoIIB/I/Z/oDfOT06zkc4IcS/0uUfwSQv/aJSECvWj/Yfglh5u2KHP/
 eQXwezEHwq5oB5Ghwv1118/OZI4/xHzSZNOijQOXeTLRsQ/PKruo0dWZtKficp8B
 x/xrMJnJcPnTO5NtO5h2OrqDRIntrGBM9Q+gEH18VeBIePPy9Hy8cjkM4gaCbI5p
 qbqw13Zr9PWXRPtPu4cQyo2JUG1BxNihjmsnwvB2leGM2idfSILzYnb/H9bYc/G3
 Ub+AJoI/c81/hUe6dcPSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112557; x=
 1659119757; bh=rionF70mGt2ReIu0+bybNfVGogwhxNfWtTjJc6I+c/U=; b=l
 9oqZjQ5poGXwVuOA0Mmp6Nm0azNePHQHe20vqO2d1RagSz/EvXTMQFxzhxdrd0o3
 Ibcwsk/Hdg1jLQlGBvAcGx9EYl4NeGO3gyMJhuwccFgumKPVwFmonvKpboU5IJhZ
 MPCSycH4tolRHj27AAK5kF04f9qGnYAp1bWbUxgUO90hYjP03VtUL0DNOD2KCz1Y
 lf4zNqVNToHTAFcQPnVbsGOxjuXfmacRCwdjs1Yhw6wnFpV4A+6KK2jZxrX8N+4H
 MHQ3fs2mJCFnWy+r0/JHn4aRth2uNRn34KmCEnhmiy5nulQprwGcvLFXcAM3Qu5R
 +bBfoHcd90pbcXqiz+0Ng==
X-ME-Sender: <xms:bQzkYrebNjpdvA27fsiTcJSjJcB8RvdiCzyGA_A0XtQvsqlcRH3VXA>
 <xme:bQzkYhPT0F-kBMZLz9RE-Kf6sMga4Lxu-Dau4gwjNVPsxtLPfudk9P2fBeuPoFKNi
 GYD7cAfWaU24HCfg_4>
X-ME-Received: <xmr:bQzkYkhJcXC15GsfpKaAgSJgxd02NlFcUtP85AeCNfuLXT-CH1XW52JLmQLaU9F2LP0OMj0fTna6MwXj8TY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bQzkYs9PVustc08N0WhWG__oVFPVL5XIART-USVlHgrvd2X0MuLbPA>
 <xmx:bQzkYnu5ixApwSWsjF3x5VV2E2L5gUgTfbnIFpaE67bD0nmX4_6ptg>
 <xmx:bQzkYrEXbbwNtYy5nJlt4ZxCjb5o0bdRy_Rcs8i6mLSUjf0nOHmNOQ>
 <xmx:bQzkYm9vXnJtmYYW_jAa6B8T1ofFx7TsPK7dadM0XuhtBrhJOPfFfg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:35:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v1 08/35] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
Date: Fri, 29 Jul 2022 18:34:51 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-8-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=4539; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=c3kjQmHh3y8Jr/+VF2HLpBy12BonihyM9gV7vCEOTV4=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VHymlT7KT+mWLC/hc24PK+0oWUuP3OxGktWTOa9yNvd
 16I7SlkYhDkYZMUUWa4LvrXjC4tyi+D5sBlmDisTyBAGLk4BmMiCyQz/zC8yd2ezNG/fXbIyQTvpuu
 CDbTOO3a/e8mKhgtaMlnkGbAz/Sw10PmYaaykYMD+0ej/ft1pgW4Viy/WHfrkci/ivxHA7AgA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_connector_pick_cmdline_mode() is in charge of finding a proper
drm_display_mode from the definition we got in the video= command line
argument.

Let's add some unit tests to make sure we're not getting any regressions
there.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index bbc535cc50dd..ee6b8f193c24 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -1237,3 +1237,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
 	return ret;
 }
 EXPORT_SYMBOL(drm_client_modeset_dpms);
+
+#ifdef CONFIG_DRM_KUNIT_TEST
+#include "tests/drm_mode_test.c"
+#endif
diff --git a/drivers/gpu/drm/tests/drm_mode_test.c b/drivers/gpu/drm/tests/drm_mode_test.c
new file mode 100644
index 000000000000..0f71519788a7
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_mode_test.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Maxime Ripard <mripard@kernel.org>
+ */
+
+#include <drm/drm_mode.h>
+#include <kunit/test.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_probe_helper.h>
+
+struct drm_mode_test_priv {
+	struct device *dev;
+	struct drm_device *drm;
+	struct drm_connector connector;
+};
+
+static const struct drm_mode_config_funcs drm_mode_config_funcs = {
+};
+
+static const struct drm_driver drm_mode_driver = {
+};
+
+static int drm_mode_connector_get_modes(struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+	int ret;
+
+	ret = drm_add_modes_noedid(connector, 1920, 1200);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct drm_connector_helper_funcs drm_mode_connector_helper_funcs = {
+	.get_modes = drm_mode_connector_get_modes,
+};
+
+static const struct drm_connector_funcs drm_mode_connector_funcs = {
+};
+
+static int drm_mode_test_init(struct kunit *test)
+{
+	struct drm_mode_test_priv *priv;
+	int ret;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	test->priv = priv;
+
+	priv->dev = root_device_register("drm-mode-test");
+	if (IS_ERR(priv->dev))
+		return PTR_ERR(priv->dev);
+
+	priv->drm = drm_dev_alloc(&drm_mode_driver, priv->dev);
+	if (IS_ERR(priv->drm))
+		return PTR_ERR(priv->drm);
+	priv->drm->mode_config.funcs = &drm_mode_config_funcs;
+
+	ret = drmm_mode_config_init(priv->drm);
+	if (ret)
+		return ret;
+
+	ret = drmm_connector_init(priv->drm, &priv->connector,
+				  &drm_mode_connector_funcs,
+				  DRM_MODE_CONNECTOR_Unknown,
+				  NULL);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(&priv->connector, &drm_mode_connector_helper_funcs);
+
+	return 0;
+}
+
+static void drm_mode_test_exit(struct kunit *test)
+{
+	struct drm_mode_test_priv *priv = test->priv;
+
+	drm_dev_put(priv->drm);
+	root_device_unregister(priv->dev);
+}
+
+static void drm_mode_res_1920_1080_60(struct kunit *test)
+{
+	struct drm_mode_test_priv *priv = test->priv;
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
+static struct kunit_case drm_mode_tests[] = {
+	KUNIT_CASE(drm_mode_res_1920_1080_60),
+	{}
+};
+
+static struct kunit_suite drm_mode_test_suite = {
+	.name = "drm_mode",
+	.init = drm_mode_test_init,
+	.exit = drm_mode_test_exit,
+	.test_cases = drm_mode_tests
+};
+
+kunit_test_suite(drm_mode_test_suite);
+MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
+MODULE_LICENSE("GPL");

-- 
b4 0.10.0-dev-49460
