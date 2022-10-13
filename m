Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BFC5FDA84
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFCC10E8E2;
	Thu, 13 Oct 2022 13:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BBB10E8B0;
 Thu, 13 Oct 2022 13:19:21 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5DBC5580361;
 Thu, 13 Oct 2022 09:19:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 13 Oct 2022 09:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667161; x=
 1665674361; bh=VZwoWqQBtIc8245S3/XDqFdpjovDq1hKv7XXjRmi7+Y=; b=e
 cW51nmm/CXDazKkZn5m/anGbDh2C9YRlwAuf28OhS0x8HAuCtLNV86nFpCtWXaw9
 tnS6p9xJym9X25RjcAQC6yzkN904RDkE89u2bxv34KRULBDrVBAll9lflva0XNZO
 r9iVoNRPiE+V9r6MP5rAjgQIvmPPTLQGTJRMt1pFp48bkY4r9K31cFe8loODiGEc
 c2VqZpRoK2PRyLPcr9hEVxrr6hVf6+58ssq6Cq6jz4+S90eoTmgAbY3+5OjlzgTa
 CIMEeIMAjdbsW5/IudVtZefB+RmtBm4t+Ci3dYUQwN9K3rSX4M/IYE/jo4gfZVR6
 tcX1LGdO7TSAY1Cx13cwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667161; x=
 1665674361; bh=VZwoWqQBtIc8245S3/XDqFdpjovDq1hKv7XXjRmi7+Y=; b=b
 JjmJH2ZNodpLGQFNQN9yZpT51FYX53T6ZJR1+2cweNgnEdmkP0kjsfo/DQxr5iN2
 b17rofdOUHljoiQzTdTeMO1sebu7FQicufT31+Kyf8+OxBrhenb2LPy3nlfRRLVY
 jfVpf+wWzciDYC7Y5mLkZGDtHbZvDfmKJqNEdo2VZA5EIiIk9IDRJfxGc7leVu4W
 wAroOzQ+rGfng22b9R/dxpKxbquOve+BLR9AB3bC3x4k0dlThFmBWwWxCINqiPi8
 +ETu8kU5cBSEcQ8ZwLEkisRQb7Ol6tY4jCGyhy9F8VgmrE8CcZ6N5BHx8n6jO8yM
 yxcMfWDKUird2HI8dN39w==
X-ME-Sender: <xms:WRBIY3oXxCASCK0TNSR78t_3b99_Vm2vQ8V387UneyzqjMVat3PXaw>
 <xme:WRBIYxq3A9najTgvYXQM6Xcpm6NmhvOx2G5tnIOk1RUF-9lFntAT1jcqXZ0juTyGT
 -Q2hI8I9c0Xzj7AbG0>
X-ME-Received: <xmr:WRBIY0OqbgxgxzNKAbYBbnEsfxBNRuH52zRT4i9r4di61nb8pd8cmYH74Nq0Tb9PUp4d7c30KZP1jADjLhommgH01Lt0Fb_iHvyc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WRBIY64cvgw20Da9ACzOAIS-s7QV5HGGdXKTeOZ67pSshmg5zNZs_A>
 <xmx:WRBIY25OYssvfpCuwycuRgQnABptEIpUozfLOmeeZWT-KzX1XN6Skw>
 <xmx:WRBIYyjVoB2Fgt467ehBdt5YKRa7GejKkatbeH10wYnoYLcvhUlTiQ>
 <xmx:WRBIY7mLZr4omkUS4RvkBmrTanslLWq4PHbqefKrEYpXS8LIRGCOvg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:18:51 +0200
Subject: [PATCH v5 07/22] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v5-7-d841cc64fe4b@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, 
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=4426; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=pxNcs3E41AFkDKtgV8g7K8QZrGOQYdi/UDjQnH5rGdA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAm6Tfm8SPsdsK8ke9mhdauTM2L5nyl+jbB7JymSWdtZP
 fOPbUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIkYeDP8szb92H5ky0qnoCt3DMpVFB
 WNg1lVXntyhTGwqWYe5JT7yvA/+c72Mpd3/+wOr9w8cYpAoZrFhGsVm38c+rFn771lu/8bcgIA
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
Changes in v5:
- Removed useless (for now) count and modes intermediate variables in
  get_modes
- Switched to kunit assertions in test init, and to KUNIT_ASSERT_NOT_NULL
  instead of KUNIT_ASSERT_PTR_NE(..., NULL)

Changes in v4:
- Removed MODULE macros
---
 drivers/gpu/drm/drm_client_modeset.c            |  4 +
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 99 +++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

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
index 000000000000..af7e7fcda11e
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -0,0 +1,99 @@
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
