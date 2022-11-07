Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32061F561
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82C810E33F;
	Mon,  7 Nov 2022 14:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8915610E32C;
 Mon,  7 Nov 2022 14:17:15 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id CFBBC2B05E60;
 Mon,  7 Nov 2022 09:17:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Nov 2022 09:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830632; x=
 1667837832; bh=1h4TCrj1z3lWEm8iQnLyRcL0Z+cpT6qrzQI0Jw1SDUw=; b=G
 pfwZ26QPNBYWrAtr3NnyUvLtZdQPgZvk5pruT7CTGBlgZAu//OmTA7repEn6c+xT
 UxGQXwNXph/pDX3Yo+faVEoA2TdaJ3+ObFzAsdcdQbJkUUn4YdSJx7YXKLyAtpTL
 oi62bUJzezJrZPb8oz2lm4TxIXdvlhIkQFv/OQqrnZ5bKk9mSQZN9nXwf5SRWPD1
 0GM1bQejRjPkqov3L6fPrP1Qkn86S9hrLFKd6X2WVkjRj4QWH7Xeqr2OZ401mgUJ
 enTKHZkVF4GZ3CmHUe40zbgqlTlAfEJCjHKvgA4x7CDqknEFMjvk0r2sP40AKBKZ
 LFG+OvDGYcuLdWMC+ci0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830632; x=
 1667837832; bh=1h4TCrj1z3lWEm8iQnLyRcL0Z+cpT6qrzQI0Jw1SDUw=; b=r
 iI5nPajPHK0XEysFCj9SX3fi4ZDLdp+VZQLl7vjfFJmXlXaPci6TlLj4PxytjI7C
 aVVcGvrF34LZtIwNBkqrsYjvZtoU3qhsLBGRZTBv3rav60/3In1T/gXSnDpLhTrF
 Ct4G5U7SIL4vqM4/evrxjRPWzzqcYjN5TzhK+yVxpgW7rDvHgxLesetAWNzGAbVN
 ZFetxhnVhVOgaanwdpqQOJfqDoCEP+IBrpPeEdQULBJX91KyZmiU+XE63BXkRULJ
 vSiK8zysIrIGqe0N4oI84hQlecTTlB7OWBo0dZBKIezpxdon5mDuKe0uxNUGtct6
 nNt9hwIJCz9FxeIpjFo3w==
X-ME-Sender: <xms:aBNpY-5zcif22tw9UOEomJwWAVFzI66ie8Iirm97GxcSqWpokh6ysw>
 <xme:aBNpY35MQSsoy9cGlVj4Uv5vxTl-fQ91lpIsR9RREUejk3bKoUX6_WqND1xj7-SP1
 xSz8LbyeZleHhGTVrs>
X-ME-Received: <xmr:aBNpY9cdD9Uuss2LnXqpLLZJd3UHMH2pqIGOHiS_fgUytWVyzHmz7tF-Zzl_wBqnKrYTa_MwaarfOwvtdDeUwyp4OI4_3vUCSG0FtpyrE5pwlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aBNpY7JKVoXTKaJOTr8PQOQpd8WoEfCyrmmxygCZDQa1uyP6MmqGAg>
 <xmx:aBNpYyJ-NcGe4OkaR-c5iDjOLrvda9jC04bq02Av9SbihGL7icqgtw>
 <xmx:aBNpY8zcV5ccBD_Tfvepfq87o28WHMXcPSnCPWgI_LAFORdiko9fIg>
 <xmx:aBNpY40eYy_d3yhC9BErJV95tPk6IVfcORFuYraD0Y9aPbpKlxN7L3NexSY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:17:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:33 +0100
Subject: [PATCH v7 07/23] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v7-7-7072a478c6b3@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=4598; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=JSdl03pNPXRu6KeMwvw89CgZpMyZ0zShUDVNllkztEg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwvYSDv4qJ9rlJlhMvTz7ovtLu7mZZ1VCW+a0Wr6vfK2v
 y2HVUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIl0WjL84a/6Y+Ww3eCPunHq8akqjA
 ubXnUndERfV5/klXFRjnXfXkaG7W5Tni+72uxno1zp8X2d+CoRw0JGcZ34cqXmcyf7bJfzAgA=
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

drm_connector_pick_cmdline_mode() is in charge of finding a proper
drm_display_mode from the definition we got in the video= command line
argument.

Let's add some unit tests to make sure we're not getting any regressions
there.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
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
index 000000000000..3aa1acfe75df
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
+	priv->drm = drm_kunit_device_init(test, "drm-client-modeset-test");
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
