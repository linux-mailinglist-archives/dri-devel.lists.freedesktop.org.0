Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950805E6571
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F8010EBA5;
	Thu, 22 Sep 2022 14:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757E510EB9D;
 Thu, 22 Sep 2022 14:28:29 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 377482B05B3B;
 Thu, 22 Sep 2022 10:28:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 22 Sep 2022 10:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856905; x=
 1663864105; bh=nFUBBQXflU8J6ixItCmaiRTWQEmTpTCoJHkDAXVsBYk=; b=P
 8s0g/yl4Ftd/fdWYnFJu5vcjkwDba2tGeDdWpqt389adiz9Pd3IAi3z6JKCViBT5
 jStPZSv98OydxV5g4I7rxzUqXhFQ1ZETJ9u0vD566cYO8qKXcP/pAMdFB+hZf4uU
 ZwF0FosqxnChKNwhn5J0DJAKHE/jy1vISDCIuTeTlQjGG/UUZ4uz0OUCw9CfAn37
 OkyxlDIZcnqcRQB54g4iccysIiyYQxik8keKUJJJlmcmb4AGXkyv8Fh3YvaObmqR
 P0abgj5pCSiyXDfe26S0/cUyQN30xVRfsPz7J7WKhX/1LOeMUjBB9vUQ2q7Wr0cb
 sL9ZPwz0GrBTfIW8uniDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856905; x=
 1663864105; bh=nFUBBQXflU8J6ixItCmaiRTWQEmTpTCoJHkDAXVsBYk=; b=L
 3XWW4gVj9HUJuZurwoaHXERsAuSfyJjMdTlmXafk81kjB0fZDnrbyFU5wY7JTcZg
 BtIpYAsbdI8g8cWqrP3IC+PNnI+nAR7uLZvJ1cehRSCEitSRoeE6TSQ1GTswV3AM
 yffZe+hyPJKizKx5LZ8cEMES1hQyirD3L7Q32OacFmzR6Dz6Nbl7iDzeZEjFP/YL
 NnJmCYKTkPthpQ/iNqY8M5Rrom+RZZ88tl6MVDfI4XGIAQrH/eomXQUIL54qLVHO
 3kPPEstNfwnb1GAtz78hFh7WpcLFQf121ytdNu0IR+6FrD/26EnL40/OxO1tCWWn
 q5DO9ALmQISSW7eUz17/g==
X-ME-Sender: <xms:CXEsY132cujLO1bGy3H1GQFVvWS3LfyqS7rmTjTYm4Aqp1lCKD6gIw>
 <xme:CXEsY8GP_E38w_p95s7_pZD25HYJaJASsZ0co4AmcAgaJZegnzuk1Y4DbwTEpEiVv
 mL7_NEZstyyAoWTvW8>
X-ME-Received: <xmr:CXEsY17z_Pif5a8JWBv5uRvzXK53laawzmndKPBqsNiqtsO3eKn1sQ3kRXc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CXEsYy1_5WlQsCQ6D0_Ul_pcZ0Wrfg8P1B5x5NX0ylpkBmjiH5g_zQ>
 <xmx:CXEsY4FYucYpkCKS3JnH7jYKnvMT__VQw9doH2-xZCs6Qj_iOEbCrA>
 <xmx:CXEsYz8xQRgzfLuYSlZH037OBjuoqdGH12742nAR3yWAcW_HRwAjhw>
 <xmx:CXEsYwQt-TSnNC0Ri-RxNHJLCE8Zvc98q88bv69d_N-YPGdX9gQEvtc3sSg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:28:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:41 +0200
Subject: [PATCH v2 24/33] drm/modes: Properly generate a drm_display_mode from
 a named mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-24-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5398; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=yrTJCblgIpfboz4+orB0xCTcSSAc3mD9ot6I29tGSEQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BYGfJrtnJ4jfktHqixVzZ1a4U5Yq3XgvTYFT5iGnV8ky
 xTsdpSwMYlwMsmKKLDHC5kviTs163cnGNw9mDisTyBAGLk4BmMjUpwz/9EyFD3kLFaVfPBlZ+FXjYc
 1Z58mSSV/ahFmjAj0uzpA8yfCb5fVryf8/HD7faZeQXnQkcMXrh4duWWYqa2m7622rMbvOCgA=
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

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 23e665fd808e..1ca1f82dfd12 100644
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
index 46335de7bc6b..4380cf670fb4 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -26,6 +26,20 @@ static int drm_client_modeset_connector_get_modes(struct drm_connector *connecto
 
 	count = drm_add_modes_noedid(connector, 1920, 1200);
 
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
 	return count;
 }
 
@@ -58,6 +72,9 @@ static int drm_client_modeset_test_init(struct kunit *test)
 		return ret;
 	drm_connector_helper_add(&priv->connector, &drm_client_modeset_connector_helper_funcs);
 
+	priv->connector.interlace_allowed = true;
+	priv->connector.doublescan_allowed = true;
+
 	return 0;
 }
 
@@ -97,8 +114,62 @@ static void drm_pick_cmdline_res_1920_1080_60(struct kunit *test)
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
+	KUNIT_ASSERT_PTR_NE(test, mode, NULL);
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
+	KUNIT_ASSERT_PTR_NE(test, mode, NULL);
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
b4 0.10.0
