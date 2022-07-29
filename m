Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D5D5853D2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEB210EE19;
	Fri, 29 Jul 2022 16:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6B010F32C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0FCFD580996;
 Fri, 29 Jul 2022 12:37:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 29 Jul 2022 12:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112655; x=
 1659119855; bh=eqeWKtaytWU3vuLOS35U4YQlT0bSiQbpoL8TLT3n+Hw=; b=v
 flc6tVLBVX3TfVuIHWQ6Aac/TKmSEbx7uvInTFZQp7n/0E04ZYzg2plw4AZRaXhz
 TD0E7MGsCPZjDaDU27xGvJwJ5/uaghmYoFt3IyexiefeIFj0rfLsxyxIrPpvzAIP
 sbX4DjW68e3Tl82FZnMMTYXUH1J8qJL1ReELzUcDrr/WuPSuyYe/kRvdJq0QDa+6
 fFtAXACwNvmcDvx1SfOjVhaaXvbL3Y0SlsNsjBH2SX7MS/BSw3vSfS3BvIzxryxy
 7QJuolqciXP5C0ehaWIPrA203QVQNkiOf4yGM2V0Xf17IiWidhkMU/T+9BtgdJEX
 gLRyAeuw8V5WVhr07cs8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112655; x=
 1659119855; bh=eqeWKtaytWU3vuLOS35U4YQlT0bSiQbpoL8TLT3n+Hw=; b=B
 YAR0tjAbkRMgeur+dkqKWhnLrx9GXfFveyLLgzaT1GQB3+kjOD0EdcgdYMq20j/y
 42a9Zp/n/uHdFg/clADKpuZNgC+jC+FdFcJNRBc0PlYBSx8gEL8ai1Jjo123y8sC
 s3vocJ7/IrO9ybVoD27rZq1xCl+GR9v6NzfbdtHkzM1cUUhdsSc+4vulOigeWzP/
 ZhsrmjJnvGDFov5b8vzANQw1sB1wrc7XsBXlr+NNOVEFT5KM9XDFVej6tctnrf37
 Smij6BHUsoSY7S643wO48P1e7JQWaWsgvaLKAs7Gt/Vz6kFiEGWzRWFC2LI4rNTa
 VcDHZtAsxrFBF5zw6hEWw==
X-ME-Sender: <xms:zgzkYsRCS68b4I4oVuWYzzxDeg07pTZVmkuxppI35RNxJrBtu4pstw>
 <xme:zgzkYpyhrQ1Tnop72KOdmT8xzx5l3e1kvd7wBEGIPzKIg5zFfv0Nn23bWIOKYVy2f
 vG7YF9uEkDPx99TGkE>
X-ME-Received: <xmr:zgzkYp1PUA0Pph13lK9HsE25ZXfaDDIL5ULFOvaeN9M6pIa4YR7rxyCEpKDlN79f59mmWNbmm4qzVjQOBJE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zgzkYgBgWKLS2vakTapRePLw8LueBmqC8HY7o3Jl8CiFX-ttKJuG6Q>
 <xmx:zgzkYlikJELo97IUPP4DuclkIddeiSqehYompKzpSWdbMXR-rFoArQ>
 <xmx:zgzkYsqlR2deRTer-oMIt926dxcR8MxQILaOr1zHhi1UGydGaG2ybw>
 <xmx:zwzkYkRE8NnQKjCAA3_KOP_H9kesaCxnZ-4HOVsE460eJM5i2B2Yvw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:37:33 -0400 (EDT)
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
Subject: [PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
 command-line option
Date: Fri, 29 Jul 2022 18:35:17 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-34-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=16486; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=VnlmjpAiULXiNgZArLPHkfKMX4qaho6F72/h61prYIk=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VH69NbGNHvuKcvl8be0VHrfLtBcLlGkLO9z4rhe3o4n
 185LdpSyMAhzMMiKKbJcF3xrxxcW5RbB82EzzBxWJpAhDFycAjCR7usMv1l0pa2fC1gzqYYlXW7db/
 DxWHTsDU++SafMg57w5i8/eZaR4c3aNzPZb6c+bnYR4LU/n/GQcUZF2IsnCZ8CCoN2rH133AAA
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

Our new tv mode option allows to specify the TV mode from a property.
However, it can still be useful, for example to avoid any boot time
artifact, to set that property directly from the kernel command line.

Let's add some code to allow it, and some unit tests to exercise that code.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index fce5569bd66a..49da8d8236f5 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -490,6 +490,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_margins_reset);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
+	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
 	struct drm_connector_state *state = connector->state;
 	struct drm_property *prop;
 	uint64_t val;
@@ -500,6 +501,9 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
 							   prop, &val))
 			state->tv.norm = val;
 
+	if (cmdline->tv_mode)
+		state->tv.norm = cmdline->tv_mode;
+
 	prop = dev->mode_config.tv_select_subconnector_property;
 	if (prop)
 		if (!drm_object_property_get_default_value(&connector->base,
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ecb2e83cf860..3634ac9f787d 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1677,6 +1677,80 @@ static int drm_mode_parse_panel_orientation(const char *delim,
 	return 0;
 }
 
+#define TV_OPTION_EQUAL(value, len, option) \
+	((strlen(option) == len) && !strncmp(value, option, len))
+
+static int drm_mode_parse_tv_mode(const char *delim,
+				  struct drm_cmdline_mode *mode)
+{
+	const char *value;
+	unsigned int len;
+
+	if (*delim != '=')
+		return -EINVAL;
+
+	value = delim + 1;
+	delim = strchr(value, ',');
+	if (!delim)
+		delim = value + strlen(value);
+
+	len = delim - value;
+	if (TV_OPTION_EQUAL(value, len, "NTSC-443"))
+		mode->tv_mode = DRM_MODE_TV_NORM_NTSC_443;
+	else if (TV_OPTION_EQUAL(value, len, "NTSC-J"))
+		mode->tv_mode = DRM_MODE_TV_NORM_NTSC_J;
+	else if (TV_OPTION_EQUAL(value, len, "NTSC-M"))
+		mode->tv_mode = DRM_MODE_TV_NORM_NTSC_M;
+	else if (TV_OPTION_EQUAL(value, len, "PAL-60"))
+		mode->tv_mode = DRM_MODE_TV_NORM_PAL_60;
+	else if (TV_OPTION_EQUAL(value, len, "PAL-B"))
+		mode->tv_mode = DRM_MODE_TV_NORM_PAL_B;
+	else if (TV_OPTION_EQUAL(value, len, "PAL-D"))
+		mode->tv_mode = DRM_MODE_TV_NORM_PAL_D;
+	else if (TV_OPTION_EQUAL(value, len, "PAL-G"))
+		mode->tv_mode = DRM_MODE_TV_NORM_PAL_G;
+	else if (TV_OPTION_EQUAL(value, len, "PAL-H"))
+		mode->tv_mode = DRM_MODE_TV_NORM_PAL_H;
+	else if (TV_OPTION_EQUAL(value, len, "PAL-I"))
+		mode->tv_mode = DRM_MODE_TV_NORM_PAL_I;
+	else if (TV_OPTION_EQUAL(value, len, "PAL-M"))
+		mode->tv_mode = DRM_MODE_TV_NORM_PAL_M;
+	else if (TV_OPTION_EQUAL(value, len, "PAL-N"))
+		mode->tv_mode = DRM_MODE_TV_NORM_PAL_N;
+	else if (TV_OPTION_EQUAL(value, len, "PAL-NC"))
+		mode->tv_mode = DRM_MODE_TV_NORM_PAL_NC;
+	else if (TV_OPTION_EQUAL(value, len, "SECAM-60"))
+		mode->tv_mode = DRM_MODE_TV_NORM_SECAM_60;
+	else if (TV_OPTION_EQUAL(value, len, "SECAM-B"))
+		mode->tv_mode = DRM_MODE_TV_NORM_SECAM_B;
+	else if (TV_OPTION_EQUAL(value, len, "SECAM-D"))
+		mode->tv_mode = DRM_MODE_TV_NORM_SECAM_D;
+	else if (TV_OPTION_EQUAL(value, len, "SECAM-G"))
+		mode->tv_mode = DRM_MODE_TV_NORM_SECAM_G;
+	else if (TV_OPTION_EQUAL(value, len, "SECAM-K"))
+		mode->tv_mode = DRM_MODE_TV_NORM_SECAM_K;
+	else if (TV_OPTION_EQUAL(value, len, "SECAM-K1"))
+		mode->tv_mode = DRM_MODE_TV_NORM_SECAM_K1;
+	else if (TV_OPTION_EQUAL(value, len, "SECAM-L"))
+		mode->tv_mode = DRM_MODE_TV_NORM_SECAM_L;
+	else if (TV_OPTION_EQUAL(value, len, "HD480I"))
+		mode->tv_mode = DRM_MODE_TV_NORM_HD480I;
+	else if (TV_OPTION_EQUAL(value, len, "HD480P"))
+		mode->tv_mode = DRM_MODE_TV_NORM_HD480P;
+	else if (TV_OPTION_EQUAL(value, len, "HD576I"))
+		mode->tv_mode = DRM_MODE_TV_NORM_HD576I;
+	else if (TV_OPTION_EQUAL(value, len, "HD576P"))
+		mode->tv_mode = DRM_MODE_TV_NORM_HD576P;
+	else if (TV_OPTION_EQUAL(value, len, "HD720P"))
+		mode->tv_mode = DRM_MODE_TV_NORM_HD720P;
+	else if (TV_OPTION_EQUAL(value, len, "HD1080I"))
+		mode->tv_mode = DRM_MODE_TV_NORM_HD1080I;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
 static int drm_mode_parse_cmdline_options(const char *str,
 					  bool freestanding,
 					  const struct drm_connector *connector,
@@ -1746,6 +1820,9 @@ static int drm_mode_parse_cmdline_options(const char *str,
 		} else if (!strncmp(option, "panel_orientation", delim - option)) {
 			if (drm_mode_parse_panel_orientation(delim, mode))
 				return -EINVAL;
+		} else if (!strncmp(option, "tv_mode", delim - option)) {
+			if (drm_mode_parse_tv_mode(delim, mode))
+				return -EINVAL;
 		} else {
 			return -EINVAL;
 		}
@@ -1771,11 +1848,12 @@ static int drm_mode_parse_cmdline_options(const char *str,
 struct drm_named_mode {
 	const char *name;
 	const struct drm_display_mode *mode;
+	unsigned int tv_mode;
 };
 
 static const struct drm_named_mode drm_named_modes[] = {
-	{ "NTSC", &drm_mode_480i, },
-	{ "PAL", &drm_mode_576i, },
+	{ "NTSC", &drm_mode_480i, DRM_MODE_TV_NORM_NTSC_M, },
+	{ "PAL", &drm_mode_576i, DRM_MODE_TV_NORM_PAL_B, },
 };
 
 static bool drm_mode_parse_cmdline_named_mode(const char *name,
@@ -1796,6 +1874,7 @@ static bool drm_mode_parse_cmdline_named_mode(const char *name,
 		cmdline_mode->xres = mode->mode->hdisplay;
 		cmdline_mode->yres = mode->mode->vdisplay;
 		cmdline_mode->interlace = !!(mode->mode->flags & DRM_MODE_FLAG_INTERLACE);
+		cmdline_mode->tv_mode = mode->tv_mode;
 		cmdline_mode->specified = true;
 
 		return true;
diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
index 59b29cdfdd35..d198717c8375 100644
--- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
+++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
@@ -885,6 +885,274 @@ static void drm_cmdline_test_multiple_options(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
+static void drm_cmdline_test_tv_options(struct kunit *test,
+					const char *cmdline,
+					const struct drm_display_mode *expected_mode,
+					unsigned int expected_tv_mode)
+{
+	struct drm_cmdline_mode mode = { };
+
+	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+									  &no_connector, &mode));
+	KUNIT_EXPECT_TRUE(test, mode.specified);
+	KUNIT_EXPECT_EQ(test, mode.xres, expected_mode->hdisplay);
+	KUNIT_EXPECT_EQ(test, mode.yres, expected_mode->vdisplay);
+	KUNIT_EXPECT_EQ(test, mode.tv_mode, expected_tv_mode);
+
+	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
+
+	KUNIT_EXPECT_FALSE(test, mode.bpp_specified);
+
+	KUNIT_EXPECT_FALSE(test, mode.rb);
+	KUNIT_EXPECT_FALSE(test, mode.cvt);
+	KUNIT_EXPECT_EQ(test, mode.interlace, !!(expected_mode->flags & DRM_MODE_FLAG_INTERLACE));
+	KUNIT_EXPECT_FALSE(test, mode.margins);
+	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
+}
+
+static void drm_cmdline_test_tv_option_hd480i(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x480i,tv_mode=HD480I",
+				    &drm_mode_480i,
+				    DRM_MODE_TV_NORM_HD480I);
+}
+
+static const struct drm_display_mode drm_mode_480p = {
+	DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 27000,
+		 720, 735, 743, 858, 0, 480, 490, 494, 525, 0,
+		 DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC)
+};
+
+static void drm_cmdline_test_tv_option_hd480p(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x480,tv_mode=HD480P",
+				    &drm_mode_480p,
+				    DRM_MODE_TV_NORM_HD480P);
+}
+
+static void drm_cmdline_test_tv_option_hd576i(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=HD576I",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_HD576I);
+}
+
+static const struct drm_display_mode drm_mode_576p = {
+	DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 27000,
+		 720, 730, 738, 864, 0, 576, 581, 585, 625, 0,
+		 DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC)
+};
+
+static void drm_cmdline_test_tv_option_hd576p(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576,tv_mode=HD576P",
+				    &drm_mode_576p,
+				    DRM_MODE_TV_NORM_HD576P);
+}
+
+static const struct drm_display_mode drm_mode_720p = {
+	DRM_MODE("1280x720", DRM_MODE_TYPE_DRIVER, 74250,
+		 1280, 1349, 1357, 1650, 0, 720, 725, 730, 750, 0,
+		 DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC)
+};
+
+static void drm_cmdline_test_tv_option_hd720p(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "1280x720,tv_mode=HD720P",
+				    &drm_mode_720p,
+				    DRM_MODE_TV_NORM_HD720P);
+}
+
+static const struct drm_display_mode drm_mode_1080i = {
+	DRM_MODE("1920x1080", DRM_MODE_TYPE_DRIVER, 74250,
+		 1920, 1961, 2049, 2200, 0, 1080, 1084, 1088, 1125, 0,
+		 DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC
+		 | DRM_MODE_FLAG_INTERLACE)
+};
+
+static void drm_cmdline_test_tv_option_hd1080i(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "1920x1080i,tv_mode=HD1080I",
+				    &drm_mode_1080i,
+				    DRM_MODE_TV_NORM_HD1080I);
+}
+
+static void drm_cmdline_test_tv_option_ntsc_443(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x480i,tv_mode=NTSC-443",
+				    &drm_mode_480i,
+				    DRM_MODE_TV_NORM_NTSC_443);
+}
+
+static void drm_cmdline_test_tv_option_ntsc_j(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x480i,tv_mode=NTSC-J",
+				    &drm_mode_480i,
+				    DRM_MODE_TV_NORM_NTSC_J);
+}
+
+static void drm_cmdline_test_tv_option_ntsc_m(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x480i,tv_mode=NTSC-M",
+				    &drm_mode_480i,
+				    DRM_MODE_TV_NORM_NTSC_M);
+}
+
+static void drm_cmdline_test_tv_option_pal_60(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=PAL-60",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_PAL_60);
+}
+
+static void drm_cmdline_test_tv_option_pal_b(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=PAL-B",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_PAL_B);
+}
+
+static void drm_cmdline_test_tv_option_pal_d(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=PAL-D",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_PAL_D);
+}
+
+static void drm_cmdline_test_tv_option_pal_g(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=PAL-G",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_PAL_G);
+}
+
+static void drm_cmdline_test_tv_option_pal_h(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=PAL-H",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_PAL_H);
+}
+
+static void drm_cmdline_test_tv_option_pal_i(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=PAL-I",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_PAL_I);
+}
+
+static void drm_cmdline_test_tv_option_pal_m(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x480i,tv_mode=PAL-M",
+				    &drm_mode_480i,
+				    DRM_MODE_TV_NORM_PAL_M);
+}
+
+static void drm_cmdline_test_tv_option_pal_n(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=PAL-N",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_PAL_N);
+}
+
+static void drm_cmdline_test_tv_option_pal_nc(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=PAL-NC",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_PAL_NC);
+}
+
+static void drm_cmdline_test_tv_option_secam_60(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=SECAM-60",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_SECAM_60);
+}
+
+static void drm_cmdline_test_tv_option_secam_b(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=SECAM-B",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_SECAM_B);
+}
+
+static void drm_cmdline_test_tv_option_secam_d(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=SECAM-D",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_SECAM_D);
+}
+
+static void drm_cmdline_test_tv_option_secam_g(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=SECAM-G",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_SECAM_G);
+}
+
+static void drm_cmdline_test_tv_option_secam_k(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=SECAM-K",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_SECAM_K);
+}
+
+static void drm_cmdline_test_tv_option_secam_k1(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=SECAM-K1",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_SECAM_K1);
+}
+
+static void drm_cmdline_test_tv_option_secam_l(struct kunit *test)
+{
+	drm_cmdline_test_tv_options(test,
+				    "720x576i,tv_mode=SECAM-L",
+				    &drm_mode_576i,
+				    DRM_MODE_TV_NORM_SECAM_L);
+}
+
+static void drm_cmdline_test_tv_option_invalid(struct kunit *test)
+{
+	struct drm_cmdline_mode mode = { };
+	const char *cmdline = "720x480i,tv_mode=invalid";
+
+	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
+									   &no_connector, &mode));
+}
+
+static void drm_cmdline_test_tv_option_truncated(struct kunit *test)
+{
+	struct drm_cmdline_mode mode = { };
+	const char *cmdline = "720x480i,tv_mode=NTSC";
+
+	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
+									   &no_connector, &mode));
+}
+
 static void drm_cmdline_test_invalid_option(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -1047,6 +1315,33 @@ static struct kunit_case drm_cmdline_parser_tests[] = {
 	KUNIT_CASE(drm_cmdline_test_name_refresh_invalid_mode),
 	KUNIT_CASE(drm_cmdline_test_name_option),
 	KUNIT_CASE(drm_cmdline_test_name_bpp_option),
+	KUNIT_CASE(drm_cmdline_test_tv_option_hd480i),
+	KUNIT_CASE(drm_cmdline_test_tv_option_hd480p),
+	KUNIT_CASE(drm_cmdline_test_tv_option_hd576i),
+	KUNIT_CASE(drm_cmdline_test_tv_option_hd576p),
+	KUNIT_CASE(drm_cmdline_test_tv_option_hd720p),
+	KUNIT_CASE(drm_cmdline_test_tv_option_hd1080i),
+	KUNIT_CASE(drm_cmdline_test_tv_option_ntsc_443),
+	KUNIT_CASE(drm_cmdline_test_tv_option_ntsc_j),
+	KUNIT_CASE(drm_cmdline_test_tv_option_ntsc_m),
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_60),
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_b),
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_d),
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_g),
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_h),
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_i),
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_m),
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_n),
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_nc),
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_60),
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_b),
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_d),
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_g),
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_k),
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_k1),
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_l),
+	KUNIT_CASE(drm_cmdline_test_tv_option_invalid),
+	KUNIT_CASE(drm_cmdline_test_tv_option_truncated),
 	KUNIT_CASE(drm_cmdline_test_rotate_0),
 	KUNIT_CASE(drm_cmdline_test_rotate_90),
 	KUNIT_CASE(drm_cmdline_test_rotate_180),
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e535dca6376e..26a779e85785 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1305,6 +1305,11 @@ struct drm_cmdline_mode {
 	 * @tv_margins: TV margins to apply to the mode.
 	 */
 	struct drm_connector_tv_margins tv_margins;
+
+	/**
+	 * @tv_mode: TV mode standard. See DRM_MODE_TV_NORM_*.
+	 */
+	unsigned int tv_mode;
 };
 
 /**

-- 
b4 0.10.0-dev-49460
