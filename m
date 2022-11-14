Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A51A62801F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F0310E2DB;
	Mon, 14 Nov 2022 13:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982C710E2AB;
 Mon, 14 Nov 2022 13:01:08 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 07879580257;
 Mon, 14 Nov 2022 08:01:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 14 Nov 2022 08:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430868; x=
 1668438068; bh=gsSaYGeDyaqpGNPIueJ1qQW/z3ExIQQpNdrkxwgNIC4=; b=E
 kiqqlf6MJjSq6gZFMI4jllNshOpTmkKo1flNN339/mQVPa2Vn9ST/JYnXjME0Xsc
 28uOkxizLRzTHPkIHePIg1chVwLsAPaI+9QD3tExHEOd6BobRBVsIM3/yFj4vyIm
 BHk3pbil2wHodeqnlDqc2ssVtBST1SZSrivqjDbi4MACJHxYx/zgSpyRV65QkL5W
 6MRJP774SAawtQoaD8Wsgm8TsEtxuU+UO9I8qXcaxx5BUEKKCsV8M9bvlaIp8L73
 SkYGBJVqPNhOTV6v7M6T7SCp7wfPDwnhxKJYKTzN4iif53IZ/c6oaFuOkfUWqROj
 7O/pOj+qsmk9P2rYJnWkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430868; x=
 1668438068; bh=gsSaYGeDyaqpGNPIueJ1qQW/z3ExIQQpNdrkxwgNIC4=; b=m
 xMSfegWHm1j3stcC4RlOUust4aFvt6Vv3Qd9nxWOCIVlxKvopfJYRnp374olbS3M
 /AVrkLu37WFeqbPqgKcrcJ9Zds4H1+S4sM8GCLb6GWI+IUbAPcXqYOcZjwvrLJx+
 yD2A0y4FJJum1Obx3KDrsyJPILk2xcNi8t0cDqoMGBP1MtY+4WW49oV6GgyR4QTu
 P9rKWGVANsf4j4pQFhTmkNHrWwj63LLZFp/2HeSE09uVi9ue05zExf0uoLLShLrJ
 VXNE060Vun3eUQUDMRin6A6DycAk8k8+CLyuHUUJ9h+4dx7KvQY8wQ+sCJeXTnd9
 0ki812bNwGZ3so6sq8ZmQ==
X-ME-Sender: <xms:EzxyY7nY062cK_Bt6icJ9t6cje2W6JFRJrKiAy7F3CJz-5fGmViu4Q>
 <xme:EzxyY-2Ya9jC7AMluOH1cJtP0UyTqn4PKAZfPsvCZdJ5Bwl2rLVN8IkAa1B4l59iD
 wrzmMcA8ORxGSjzxl4>
X-ME-Received: <xmr:EzxyYxpjEUljfpQ0djgikCf0WIR61I12CRO0sWDQVLOU9YiCoV8iTlih2sBMIbNm82KhgEBiM7ceSYs1kkEtETnnq0FGS1-izTkU6OVyKv6hYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EzxyYzn6S-izlAdygwzEE5rzv2ve-iGpCZ5NfA92YQQjy3tz3Wjflw>
 <xmx:EzxyY52E-IEAoG-lIE5J3sytgWZXFleHBjCSEON1M8k1MCB_lwkRZQ>
 <xmx:EzxyYyshmIXHf0N6nX-SiGw6EX1shgYemr33UaeL8TX1g8xLB1ikbQ>
 <xmx:FDxyY4DKtL75mWp1BJHLIaxb49y9N3VZF6ksHZu_0W9AIoB6pPf5Rw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:01:07 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:34 +0100
Subject: [PATCH v9 15/25] drm/modes: Properly generate a drm_display_mode from
 a named mode
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-15-24b168e5bcd5@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6392; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=BLMNpvf2Ioa1WisiW09m8t1/2WC4DDVEszURe0QchjA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1m+Olplz/litzte85kL2sUPPAle2f9FK/hx47U5O7Cm1
 ivnLOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRT5cZGW4dWFFyp/ux7k81USn+88
 eK256Va5nMennLbbFyLse5BQ8Y/gesXC1Y+M9eePdFNS31K0vENH2ff5s0f0KOxp/YRqs/jJwA
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

The framework will get the drm_display_mode from the drm_cmdline_mode it
got by parsing the video command line argument by calling
drm_connector_pick_cmdline_mode().

The heavy lifting will then be done by the drm_mode_create_from_cmdline_mode()
function.

In the case of the named modes though, there's no real code to make that
translation and we rely on the drivers to guess which actual display mode
we meant.

Let's modify drm_mode_create_from_cmdline_mode() to properly generate the
drm_display_mode we mean when passing a named mode.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
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
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 83 ++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index dc037f7ceb37..d3f0a3559812 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2497,6 +2497,31 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
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
@@ -2514,7 +2539,9 @@ drm_mode_create_from_cmdline_mode(struct drm_device *dev,
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
index 558c098b0384..497434cc56cd 100644
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
@@ -85,9 +107,68 @@ static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
 }
 
+struct drm_connector_pick_cmdline_mode_test {
+	const char *cmdline;
+	struct drm_display_mode *(*func)(struct drm_device *);
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
 
 static struct kunit_case drm_test_pick_cmdline_tests[] = {
 	KUNIT_CASE(drm_test_pick_cmdline_res_1920_1080_60),
+	KUNIT_CASE_PARAM(drm_test_pick_cmdline_named,
+			 drm_connector_pick_cmdline_mode_gen_params),
 	{}
 };
 

-- 
b4 0.11.0-dev-99e3a
