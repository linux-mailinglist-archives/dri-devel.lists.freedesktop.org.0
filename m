Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1F161F57E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FCB10E348;
	Mon,  7 Nov 2022 14:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA07710E34C;
 Mon,  7 Nov 2022 14:17:47 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 1CB1A2B066F9;
 Mon,  7 Nov 2022 09:17:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Nov 2022 09:17:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830664; x=
 1667837864; bh=pBmXznWogGAE2b+7+hNVqd+8l9vlypH5mdfMWLzopdI=; b=W
 26LGBeOWtbsQBLw7vJ3aK6p0quNrULu7Bz/3MheHTj8niCu6QWCytO8mPqoB2meG
 aW8KxUjaBxlSghmSHPm5N7M0MxDLKoKsMPgSvEzKbMrP3PlEq/wa4OAN0Mcq4pFY
 ZOfYJjRbYdxBmBf2SIyJxiipDmUYD3DrQUgBNYEVOdfVzp92136TlDvDj3rPh5Eg
 xrDFGgvwKpuDD/mV1ImbmTkMeF7rhYzvMxPEmUkgDUYF205e2UUIegzBq2WhVQzA
 KnEU0EfIQDZJh86iUkt27RHJV+JpdeM6pwV2Us+HwgiGjc5EtLu3XCrlNLofZICw
 Bm7upiYU3t9gU8xVGtxfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830664; x=
 1667837864; bh=pBmXznWogGAE2b+7+hNVqd+8l9vlypH5mdfMWLzopdI=; b=c
 kJaD3m/4Iqcnl5fVot/YN0G0kAUXvnNl+eipXC4KFhuvrcV7YGcEE30aZyW6cVbW
 zP1z5E57XmegtsEzbFgz1ICM+pJ25gCq8StptSk6BV1gbO5X3/ShN5YYQFCBCAO0
 p5xlg1lyqcg++S4O3+l6JnslMIevLZSxrv1XCm1SGJZMLbi26j03I2YYBpgJ5kdH
 7w6VKDlJiiyVwVMAxJBdpNB1ET0885jOtQpFB0nIxarI6gC9N5Siqeiqaz80LUAq
 LodVWo4bO1cHKfrBYn91MMOqy0mLb0whrRFG8hqxHfzGVxM4Jn3q3dUFFkOjsThW
 HMXIwcmMOuWJwPJEGLX9g==
X-ME-Sender: <xms:iBNpYzrGZKhyjxz3XDeyrXD81ZU8pegTVvrHDP2ZqVYBbX81HoNlNQ>
 <xme:iBNpY9qebo7yxTRKn8XDSNzuh3KXpCH3PMvUtnxBS-1mW0rKpp97q8150pm6aBAyx
 WtEMmSLFvsC_WL1oos>
X-ME-Received: <xmr:iBNpYwPXKXwqJrgsreAqIwMapuczEYR7kkW2Fs09oVhawitQkmvjHM_m8E6GEt8GS-hhfODqAEetcjIwvSurUCARG3BBMnOww0qNhxWVIpMeGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iBNpY26qpIp35piT9sxEwnHVyTn06Rfz2k0Adu13ehBSPTKW5OwUrQ>
 <xmx:iBNpYy4p57aLRQWF_z3c0oykrXOvh3CXZaxxW_xVmMDNnWdB61OpHQ>
 <xmx:iBNpY-h4uupNP9L_w-LU4hN0scBHzjZVQJwWxRxXaO8SORE14FmziA>
 <xmx:iBNpY3kkO1c4a5sa25xBaZFs10oHYgTvCFag5shSlkjubtQwF9n-xwjJ4WE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:17:43 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:40 +0100
Subject: [PATCH v7 14/23] drm/modes: Properly generate a drm_display_mode from
 a named mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v7-14-7072a478c6b3@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6155; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=3/MinMBbWf3bg7fSASZ2D1Hy+PkKbkYHDPK7SoXcKf4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwg4veJfmn9/9cHvCsZfBsS+dHz6sXRVRlOe/d0bEf+lz
 Myekd5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi7AGMDOs05gvNO3Xu5Gm1JcGid+
 YHi9sbRSlvZq1fbXx274utImUM/zS53rXtOrsvT8pQ8ZBEl/jDizvXT7SZUfKwm8/i4LKdqWwA
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v7:
- Use tv_mode_specified in drm_mode_parse_command_line_for_connector

Changes in v6:
- Fix get_modes to return 0 instead of an error code
- Rename the tests to follow the DRM test naming convention

Changes in v5:
- Switched to KUNIT_ASSERT_NOT_NULL
---
 drivers/gpu/drm/drm_modes.c                     | 34 ++++++++++-
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 77 ++++++++++++++++++++++++-
 2 files changed, 109 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index dc037f7ceb37..49441cabdd9d 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2497,6 +2497,36 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 }
 EXPORT_SYMBOL(drm_mode_parse_command_line_for_connector);
 
+static struct drm_display_mode *drm_named_mode(struct drm_device *dev,
+					       struct drm_cmdline_mode *cmd)
+{
+	struct drm_display_mode *mode;
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
+		mode = drm_analog_tv_mode(dev,
+					  named_mode->tv_mode,
+					  named_mode->pixel_clock_khz * 1000,
+					  named_mode->xres,
+					  named_mode->yres,
+					  named_mode->flags & DRM_MODE_FLAG_INTERLACE);
+		if (!mode)
+			return NULL;
+
+		return mode;
+	}
+
+	return NULL;
+}
+
 /**
  * drm_mode_create_from_cmdline_mode - convert a command line modeline into a DRM display mode
  * @dev: DRM device to create the new mode for
@@ -2514,7 +2544,9 @@ drm_mode_create_from_cmdline_mode(struct drm_device *dev,
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
index 3aa1acfe75df..fdfe9e20702e 100644
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
@@ -85,9 +107,62 @@ static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
 }
 
+static void drm_test_pick_cmdline_named_ntsc(struct kunit *test)
+{
+	struct drm_client_modeset_test_priv *priv = test->priv;
+	struct drm_device *drm = priv->drm;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
+	struct drm_display_mode *mode;
+	const char *cmdline = "NTSC";
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
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mode));
+}
+
+static void drm_test_pick_cmdline_named_pal(struct kunit *test)
+{
+	struct drm_client_modeset_test_priv *priv = test->priv;
+	struct drm_device *drm = priv->drm;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
+	struct drm_display_mode *mode;
+	const char *cmdline = "PAL";
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
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_pal_576i(drm), mode));
+}
 
 static struct kunit_case drm_test_pick_cmdline_tests[] = {
 	KUNIT_CASE(drm_test_pick_cmdline_res_1920_1080_60),
+	KUNIT_CASE(drm_test_pick_cmdline_named_ntsc),
+	KUNIT_CASE(drm_test_pick_cmdline_named_pal),
 	{}
 };
 

-- 
b4 0.11.0-dev-99e3a
