Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED585FDA92
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3700710E8F0;
	Thu, 13 Oct 2022 13:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764E010E8C3;
 Thu, 13 Oct 2022 13:19:34 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id CD5E9580367;
 Thu, 13 Oct 2022 09:19:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 13 Oct 2022 09:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667173; x=
 1665674373; bh=hjsl7IU7kIbnsuTkXDpHdK7h+WIvmdjus3/KejD3iGg=; b=c
 1t6pXohcNZDubCJvXEsTzm/1ibQycMo2A6Vjdj53rDZNVYnrjwSe04vZYueKxvqL
 FG4ypNAu/7L9AXpGHaodUay/4JzAa/UtRWQd2O6ajrzHlw6Z5WfAHMk3UEcPFXHg
 M5KWkk8iTVqRuUNH7DgbVyGGiBlTqfAkuataxWeJwCSAfqxxHzFe5DfQBMC9SJhy
 +olaptMyEfFvyrsS4YKFU4jv1f/i39gsQx9S0R12zjM368V6/M1UJY8VERtJFAY8
 jc++J+kSVMKT/XfMlXzmXaFB9sAbBVT7hvgangNroen5/7OFGOy//4pdCVsWr2uF
 46UALtzEPcSJDwMlH7+7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667173; x=
 1665674373; bh=hjsl7IU7kIbnsuTkXDpHdK7h+WIvmdjus3/KejD3iGg=; b=B
 iB+qBOENYol+gLkJGZkzNLTy6qIb2F90xLmRXWKKZIHlEURxWOVQUX9toLAiFQkp
 M0ddxB3grn+gVaL9cQD/G8WFIDC8HLyr5+9RV7LTT2BGzNnIiYpVXJQAja2CkHeM
 McyORIKQQKd2jWqE4qstjwWD9XWtSuRSEtKKgySBbkJYO6P/yg6kXqKmjBkqJJMN
 LB9uQ5BcOZf+REAtJHQXIomom0B8TYvBvNqDMMXG+OhsEs2+ipHTgpD1oS7B7sT4
 VMhh3VquZDgSc5UcS1LtYQWUvl5xtl8LYD7RDmqPxUl122S00QLWqY7pg/3TwUgP
 FDjX+QA8oGK/QyTS1fLhg==
X-ME-Sender: <xms:ZRBIY4kjg3AqLwSEFoY9AVwTPes63qcF5TBt6lXDod6GAYvdXEFkBQ>
 <xme:ZRBIY31TBZJoBUwahiY8GG6IZsKzmAYkjrhK0VmOo4I2jcWbVxnSb8MOUqSm__wOF
 t647sX2HmoWTjLUMp8>
X-ME-Received: <xmr:ZRBIY2oy40nMgqw_a7lhjf308HVYmdLwmugBq-M6eMqMqAPFDGbduOyrc0WOAqrIHgrQcIb8BqLrZcnT7mFNPK5FMBQtm2hVkSZ_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZRBIY0kfoz9P9lkfWKkFUgfeK7PZmK3ju5og3ChrFbRATkdRtfcRIg>
 <xmx:ZRBIY22sHwhwdn309mVASWjN3BdrlOzfVTJu5XN1IeSj2-39Ci56Bg>
 <xmx:ZRBIY7v0yOXMHbwK91SAIOerQW_9XewyxfTzRWFTpWNyuU5mEY8jcQ>
 <xmx:ZRBIY9CmMmRajbbrDT-eE8dJI027tERgYQ3PmFzxVdjmsdEBrM5EnA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:18:58 +0200
Subject: [PATCH v5 14/22] drm/modes: Properly generate a drm_display_mode from
 a named mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v5-14-d841cc64fe4b@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5900; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Nu0opm7ixCASLZ5jxJKbMZed3b/nQUrEdzZVx2L4Pkk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAm7HnpQ2b3pgvKv9hcadWctEGlv8ZbK3Oi8M0Nv5iVPt
 +YWojlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExE9Q7D/4Tr7Z1hRiILG++cmyq8pe
 fu1ISkSRK3Qt4kLclQzz8az8bwh4fz1fFDTVx//+RYNTlxu25XvT57Mavz26gNjtN6Dh3YzQ8A
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

The heavy lifting will then be done by the drm_mode_create_from_cmdline_mode()
function.

In the case of the named modes though, there's no real code to make that
translation and we rely on the drivers to guess which actual display mode
we meant.

Let's modify drm_mode_create_from_cmdline_mode() to properly generate the
drm_display_mode we mean when passing a named mode.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v5:
- Switched to KUNIT_ASSERT_NOT_NULL
---
 drivers/gpu/drm/drm_modes.c                     | 34 ++++++++++-
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 78 ++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index c9b62e30e303..fe818252cd8f 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2500,6 +2500,36 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
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
+		if (!named_mode->tv_mode)
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
@@ -2517,7 +2547,9 @@ drm_mode_create_from_cmdline_mode(struct drm_device *dev,
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
index af7e7fcda11e..d5370d5ac1ec 100644
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
+		return -ENOMEM;
+
+	drm_mode_probed_add(connector, mode);
+	count += 1;
+
+	mode = drm_mode_analog_pal_576i(connector->dev);
+	if (!mode)
+		return -ENOMEM;
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
@@ -85,8 +107,62 @@ static void drm_pick_cmdline_res_1920_1080_60(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
 }
 
+static void drm_pick_cmdline_named_ntsc(struct kunit *test)
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
+static void drm_pick_cmdline_named_pal(struct kunit *test)
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
+
 static struct kunit_case drm_pick_cmdline_tests[] = {
 	KUNIT_CASE(drm_pick_cmdline_res_1920_1080_60),
+	KUNIT_CASE(drm_pick_cmdline_named_ntsc),
+	KUNIT_CASE(drm_pick_cmdline_named_pal),
 	{}
 };
 

-- 
b4 0.11.0-dev-7da52
