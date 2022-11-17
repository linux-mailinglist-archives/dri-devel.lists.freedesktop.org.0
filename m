Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA2462D6EB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B8C10E5B2;
	Thu, 17 Nov 2022 09:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3F910E5A1;
 Thu, 17 Nov 2022 09:29:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id EF7012B069CA;
 Thu, 17 Nov 2022 04:29:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 17 Nov 2022 04:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677373; x=
 1668684573; bh=Yg8wv1wkIMJXh2DYiVwpJy5bOsJpCjLBFDfJACjMKbw=; b=f
 bCG/XX+Wjqd9J4whPLiToWCNbXaQo/5uFJTkntWsttvBHi9lqNC8O2W6YvpLof80
 hbOL4S1A15Jbs/zXOfI7HtPe1PL1OFhPNkep7ebrGTbyRJYkc+l5Hwar/lRr/Evi
 DKIYhbCPQU1G+pXGXE0OLbIpXxcU7uKulbu1dz9yLh8+wFhqoO835lu3FdhDqhzU
 SUBF7EKqi71WitgnjHzlUeQvhY43EgpbCidzKPjbYz/ZnEQYyKsH22pi581ckqfE
 u7g5TDkBQU2yc1kpsiixEciItflr2xOU3WQ8wz/8XfjKYaaofjf3TVZKsN7wIYcO
 CMwB1Q9t/MeRFwstEqVDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677373; x=
 1668684573; bh=Yg8wv1wkIMJXh2DYiVwpJy5bOsJpCjLBFDfJACjMKbw=; b=I
 AaoC6/7DlV+pRsjY9RGRFpyW1oqSxeY/dJmyaPFDMO6kKxz+JnZoT5CKmF2IRMpe
 uSl7LuScmNRFvYT4HCmUhzDuYnnrbLzRa8bN+lPq9LqGP1nKhyuVSW/vfnkQzXLn
 FFKHWORd4tocjmcnX03ljqE4BvNQZ0lEu0BuEZYVe5iu9L3/E5jEYfZm2os7xmKP
 AhkbRxWYArfeO6buVWBQJArniwgoXeqbU5ekCFvCI7BjhMu24guOBuhJ3ZnQ2vwT
 mLXpKVBLZtX1w0KIEDZz1P4mHxhExla7vBmDMMbt1K88fZjxZM2caG6C+RbX+CMc
 2mTaPRccNJZmN0vKGvsKw==
X-ME-Sender: <xms:_f51YwSWGOF-tlG_JzgOu10NrwtJ_QMimsxwp8v-enDwLdVGVv1oZQ>
 <xme:_f51Y9yT5fnim3OxdwgfbCgOWE8JE3ZAaJezPOVyaicGDLQxKNs3f9auwBz3xaGPG
 pycf_zhP3Xbqw3N_fM>
X-ME-Received: <xmr:_f51Y930x7e6jWiQbGmVqDNrLnWB-3f59vSPKIP0hSrgFR9nUNV0aGf01YyAh9RtXdMUWjw0dxYA_sTZhPRxhMnl_V9aeZT1YkbJpSbGEDZ5BQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_f51Y0A8wYw9XkNEzhYqFzYX1LTiZzllHiKz3qxH3ij0sTJ8VGqXRw>
 <xmx:_f51Y5jrq9GWeAFoSikegdMBFCCcBsLHVVsroJfEDWIab2PaQy9w9g>
 <xmx:_f51Ywp85DzT-G8oQOfhn3tPcxmf129NRsiHJ76WcPiN8kGyMYI6FA>
 <xmx:_f51Y_NKx2aqDSj325OSEwZaG2SwrY19TrDslczHLOQCfK2pNspwkqq0Dw0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:29:32 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:28:52 +0100
Subject: [PATCH v10 09/19] drm/modes: Properly generate a drm_display_mode
 from a named mode
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v10-9-256dad125326@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Emma Anholt <emma@anholt.net>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=6440; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=mFEKLKcoG1pk7FV288wfcsQXY7+uvXThIOwlH2XoRkE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y646IZvvJuy8tAWAYvEoDjZu7Hzm2rcpG4ZXLx5R+dT
 rHtDRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYS+YiR4W/u24neZxjXf2PS/dD+Ma
 2QVfnPNaun57W2y+/gXHbs/wuGf2o8c+8sOTe/43ra57ubhGKWdV5ZzXHz/gOx49MPNAX9UmEEAA==
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

The framework will get the drm_display_mode from the drm_cmdline_mode it
got by parsing the video command line argument by calling
drm_connector_pick_cmdline_mode().

The heavy lifting will then be done by the
drm_mode_create_from_cmdline_mode() function.

In the case of the named modes though, there's no real code to make that
translation and we rely on the drivers to guess which actual display mode
we meant.

Let's modify drm_mode_create_from_cmdline_mode() to properly generate the
drm_display_mode we mean when passing a named mode.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v10:
- Fix checkpatch warning

Changes in v9:
- Switch to parameterized tests for named modes

Changes in v8:
- Return the result of drm_analog_tv_mode directly

Changes in v7:
- Use tv_mode_specified in drm_mode_parse_command_line_for_connector

Changes in v6:
- Fix get_modes to return 0 instead of an error code
- Rename the tests to follow the DRM test naming convention

Changes in v5:
- Switched to KUNIT_ASSERT_NOT_NULL
---
 drivers/gpu/drm/drm_modes.c                     | 29 ++++++++-
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 84 ++++++++++++++++++++++++-
 2 files changed, 111 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index f9fe065f189b..3d410be8db69 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2499,6 +2499,31 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 }
 EXPORT_SYMBOL(drm_mode_parse_command_line_for_connector);
 
+static struct drm_display_mode *drm_named_mode(struct drm_device *dev,
+					       struct drm_cmdline_mode *cmd)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(drm_named_modes); i++) {
+		const struct drm_named_mode *named_mode = &drm_named_modes[i];
+
+		if (strcmp(cmd->name, named_mode->name))
+			continue;
+
+		if (!cmd->tv_mode_specified)
+			continue;
+
+		return drm_analog_tv_mode(dev,
+					  named_mode->tv_mode,
+					  named_mode->pixel_clock_khz * 1000,
+					  named_mode->xres,
+					  named_mode->yres,
+					  named_mode->flags & DRM_MODE_FLAG_INTERLACE);
+	}
+
+	return NULL;
+}
+
 /**
  * drm_mode_create_from_cmdline_mode - convert a command line modeline into a DRM display mode
  * @dev: DRM device to create the new mode for
@@ -2516,7 +2541,9 @@ drm_mode_create_from_cmdline_mode(struct drm_device *dev,
 	if (cmd->xres == 0 || cmd->yres == 0)
 		return NULL;
 
-	if (cmd->cvt)
+	if (strlen(cmd->name))
+		mode = drm_named_mode(dev, cmd);
+	else if (cmd->cvt)
 		mode = drm_cvt_mode(dev,
 				    cmd->xres, cmd->yres,
 				    cmd->refresh_specified ? cmd->refresh : 60,
diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index cdae1e4c762a..fe1f6be097a2 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -21,7 +21,26 @@ struct drm_client_modeset_test_priv {
 
 static int drm_client_modeset_connector_get_modes(struct drm_connector *connector)
 {
-	return drm_add_modes_noedid(connector, 1920, 1200);
+	struct drm_display_mode *mode;
+	int count;
+
+	count = drm_add_modes_noedid(connector, 1920, 1200);
+
+	mode = drm_mode_analog_ntsc_480i(connector->dev);
+	if (!mode)
+		return count;
+
+	drm_mode_probed_add(connector, mode);
+	count += 1;
+
+	mode = drm_mode_analog_pal_576i(connector->dev);
+	if (!mode)
+		return count;
+
+	drm_mode_probed_add(connector, mode);
+	count += 1;
+
+	return count;
 }
 
 static const struct drm_connector_helper_funcs drm_client_modeset_connector_helper_funcs = {
@@ -52,6 +71,9 @@ static int drm_client_modeset_test_init(struct kunit *test)
 
 	drm_connector_helper_add(&priv->connector, &drm_client_modeset_connector_helper_funcs);
 
+	priv->connector.interlace_allowed = true;
+	priv->connector.doublescan_allowed = true;
+
 	return 0;
 }
 
@@ -84,8 +106,68 @@ static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
 }
 
+struct drm_connector_pick_cmdline_mode_test {
+	const char *cmdline;
+	struct drm_display_mode *(*func)(struct drm_device *drm);
+};
+
+#define TEST_CMDLINE(_cmdline, _fn)		\
+	{					\
+		.cmdline = _cmdline,		\
+		.func = _fn,			\
+	}
+
+static void drm_test_pick_cmdline_named(struct kunit *test)
+{
+	const struct drm_connector_pick_cmdline_mode_test *params = test->param_value;
+	struct drm_client_modeset_test_priv *priv = test->priv;
+	struct drm_device *drm = priv->drm;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
+	const struct drm_display_mode *expected_mode, *mode;
+	const char *cmdline = params->cmdline;
+	int ret;
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
+	expected_mode = params->func(drm);
+	KUNIT_ASSERT_NOT_NULL(test, expected_mode);
+
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
+}
+
+static const
+struct drm_connector_pick_cmdline_mode_test drm_connector_pick_cmdline_mode_tests[] = {
+	TEST_CMDLINE("NTSC", drm_mode_analog_ntsc_480i),
+	TEST_CMDLINE("PAL", drm_mode_analog_pal_576i),
+};
+
+static void
+drm_connector_pick_cmdline_mode_desc(const struct drm_connector_pick_cmdline_mode_test *t,
+				     char *desc)
+{
+	sprintf(desc, "%s", t->cmdline);
+}
+
+KUNIT_ARRAY_PARAM(drm_connector_pick_cmdline_mode,
+		  drm_connector_pick_cmdline_mode_tests,
+		  drm_connector_pick_cmdline_mode_desc);
+
 static struct kunit_case drm_test_pick_cmdline_tests[] = {
 	KUNIT_CASE(drm_test_pick_cmdline_res_1920_1080_60),
+	KUNIT_CASE_PARAM(drm_test_pick_cmdline_named,
+			 drm_connector_pick_cmdline_mode_gen_params),
 	{}
 };
 

-- 
b4 0.11.0-dev-99e3a
