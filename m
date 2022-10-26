Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B712F60E4B7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC21C10E53F;
	Wed, 26 Oct 2022 15:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBFF10E33F;
 Wed, 26 Oct 2022 15:33:47 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id DEB4B5803B3;
 Wed, 26 Oct 2022 11:33:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 26 Oct 2022 11:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798426; x=
 1666805626; bh=1h4TCrj1z3lWEm8iQnLyRcL0Z+cpT6qrzQI0Jw1SDUw=; b=x
 QEf7sEWpcwm8wO5U3LTYFSyCChO+4/9ZgjsUzfCzh3TH67N+tjVOAa49oANEhjDA
 fsTvcy9k0K0nB6H9hXMNxZLEXdyUiPr9TxXvTH8KXfhGrnTCLqsk4Gr0i4tjZI9/
 Kf5CbJv7K8QEvXGBJwKlOv6PIO7znIMpljOE6azPi6qaLLPpdQr+KpiA8NIC9s44
 e7+17FsoY3fMALJAZ8c6aSvPgEuJRr9sGN/IX30d7AyUOsd6l73NG+EoTWDm8Aqn
 B3/xGxQd6Fjhk3shptMcgpV6ok1BnjgUWPCli4byX8aV7Nxv1JmAYzYtT74lJFqX
 umVyoPK9o1hl3GVUcdApg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798426; x=
 1666805626; bh=1h4TCrj1z3lWEm8iQnLyRcL0Z+cpT6qrzQI0Jw1SDUw=; b=b
 LIuEdeUCBk7ETPb1bx2sBgOzStXIBOGe64wqCZelQckeJ1sqes4SoIahFUe3a9PE
 AQlj8CwvA7Q2CKa7q+R7mTlYr2P3VhiyYU5JwUxAITef4fBRwNptFBb1fAbNkQL0
 8Wzg44dxBIlw5u62bMitphpuRn3HwIKKycw6KzdT2EvhiQrAgU8d6czMHk+BM2AU
 ccjCfo237SX0aDQncE/fwH9DQylE+aJHCt3wzsL2W2UEZ/KjiXeTIhzGnlOG4nzj
 tQeYIvB2uP0wqdsJiIBk/bUtScSSxdYjRXhSsjCD7HhXyP0MjigZRgg3qp3xPyEU
 AFyjS7ZWUFGhE5pa7p5QQ==
X-ME-Sender: <xms:WlNZYy_uPkECaX8hFiQGSWgrqj9USeGQzkEaVYVgh62NvHmhDUNe3Q>
 <xme:WlNZYyvAE-8MYkyQYrtwsLxI1iyLftNXEEhNdDZLwQNozD5B6QcU6AjMxpQlffLMX
 gGRmr8QAkw2ISlYwus>
X-ME-Received: <xmr:WlNZY4DME_P0mxOGBmDenBEPUdfAshY1xqy4RPDhggUBzYocpZXzXcr9mdHGou5LElLv8-Bb2Q-lsjYGSBKS0_RobWbLOHsQkQ6dwPY7iLQSqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeeltdekveelgfelveelfe
 duheelvdegudffgefhudehgeevjefhhefhhefgvdeuvdenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:WlNZY6d-DBS4ki1GsfpBxSQAASBBuVPdhwd79WF65QoFQCGspDHOxw>
 <xmx:WlNZY3O7U5OQ7s0bjO_yNedcRcZUR0giA_QxfiEcDlCAkQpuJxlYYQ>
 <xmx:WlNZY0m--v3fbfF4iozIK5kX7G-yXjZktfEvdq3eNTOSVOx22Yn5xg>
 <xmx:WlNZY0b_wMkdNX6oi3YKRkdBERE0BvMnxM_QqiqNbobeiJFdKjoX8A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:33:46 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:26 +0200
Subject: [PATCH v6 07/23] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v6-7-e7792734108f@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4598; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=JSdl03pNPXRu6KeMwvw89CgZpMyZ0zShUDVNllkztEg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwW5/5l+e87ZHwtJTw/O6yOpJqh2njp83UO1a7MRafSE2
 0vVCRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYioMnwP/6jXsijnaIszw4xpPfPq7
 A+465aasOXU2xRtXGa8MVNyowMayQFSr5OaZqc1nBXce+0e/EzjOMnpERlFqSdu1vhfH4POwA=
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
