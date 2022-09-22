Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A275E656C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2691089153;
	Thu, 22 Sep 2022 14:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194F210EB96;
 Thu, 22 Sep 2022 14:28:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id CB80C2B05B37;
 Thu, 22 Sep 2022 10:28:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 22 Sep 2022 10:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856898; x=
 1663864098; bh=18gGBbn5BOA5LtOZVTB7pksmz1dlucmzGzMKFLykfNY=; b=m
 dDwxrUVmy1qPPR8/Ec5o8wopfS0vNZuiXp5HxIzj981pK1TueM9evez3QJhN5eNG
 QltS9YiMBJwbWJIoBZMbU1HDYdsIF6zqVWPtidV/e+jpFDqWnAZVzPXzuTO98wmo
 BbcOJJi4Ux42c5Ro2DZc3QU51KIlAj0atPUcXAkInXD8rlgQ6/Sw9dvDn7PWTW+Q
 EgI/VIyHm3fM0dnHpxFll9T4P+kOODL1vlkBCQBbaVZQYk4lV3EfIEVvuTVsP5lg
 ssj47XhtayuLs1v4gAltjWVuCwHLWkeCqynAK/VFcmBT+B9bffOXYEFY5D9VyU7e
 bz65ClbwVQMcFNaPWMR8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856898; x=
 1663864098; bh=18gGBbn5BOA5LtOZVTB7pksmz1dlucmzGzMKFLykfNY=; b=x
 Worno52buMMgTJwhK8M+2xtavVQnGm/L1/zFnlb3nqJKttuUJVC0l4ml2NLX92DJ
 Bi+xIctCLB20J9z2Asz1lNM7BsVxt9aqPwHssnwAWE89Eeio960IR1bMh33cOsYf
 5TtHCHXNVDj7MenIn4JZXqKhJZghkq6tIIv6jAbEqFCctPmHxFCn2Oca90dzDUfi
 s04zHoe+60wEww3Ug/xCqo+DxGFQDXCvDd8183EtoY7wnIs5MQXWQEl7Jhd+GXRk
 TXIwWzV+BZoOK1HPdZcWGjwzqXGpnqQtZnv1m3ZrhZEsQ5oq6pmw/04zo/3FwRzz
 iMJ5L4xXciIcNkmhsjT5g==
X-ME-Sender: <xms:AXEsY7MykrU4YzMh5HXXdlI5GIBCcwbkwlnCz6x8pOiQTJ2Ub8wRDA>
 <xme:AXEsY1-Exuc-qVp_bbdJq-jpoGmWJWHYJa-0KUYYaIPr609CSEQWEYoEmIhyQzsEb
 4bsEnbvhgB4RZ_pE7M>
X-ME-Received: <xmr:AXEsY6QOaGtroxROLGYBeNaPY9EpGKwx5No5MMpLWpG7oxCRpZanLxmO3wA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AXEsY_v_iDRYu18FgQqSvLTnU2YcGe_pVCUPck4XzlkRJSwzUyH74A>
 <xmx:AXEsYzdE-FVBWtVSfIghj7hhs-xfMEHqxMrTihf_2xqOCqh1-y0VfA>
 <xmx:AXEsY70Rmb28Dr--JJnofwkOGocExugQx6ariuQeMVY3EVcvbaMDJg>
 <xmx:AnEsY6rBkN8mf6h1YThwPYQT-KJWQiFyIe4n5kNta78PjGlh9mK8JYnA3jE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:28:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:40 +0200
Subject: [PATCH v2 23/33] drm/modes: Introduce the tv_mode property as a
 command-line option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-23-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6975; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=lBqGDXH5voEp6jsLlR06bJCOipI8OO2ew6AJhUSWlXg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BYEHZrDaLA/RjAj8++5/bfzXn/PsbA67hq/b7rMkZ8+7
 GQZTOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRmfkMf4WmSJ3a0feNIbTi+MoWi7
 ur24+z6jdw+d1e+Oa6p4JAEScjw8S9MuIPZQ49cjn1yq9UZPWJT3uEZDtFpzGenHe4OL94KQcA
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

Our new tv mode option allows to specify the TV mode from a property.
However, it can still be useful, for example to avoid any boot time
artifact, to set that property directly from the kernel command line.

Let's add some code to allow it, and some unit tests to exercise that code.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index eb3c4e596c67..23e665fd808e 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2133,6 +2133,29 @@ static int drm_mode_parse_panel_orientation(const char *delim,
 	return 0;
 }
 
+static int drm_mode_parse_tv_mode(const char *delim,
+				  struct drm_cmdline_mode *mode)
+{
+	const char *value;
+	int ret;
+
+	if (*delim != '=')
+		return -EINVAL;
+
+	value = delim + 1;
+	delim = strchr(value, ',');
+	if (!delim)
+		delim = value + strlen(value);
+
+	ret = drm_get_tv_mode_from_name(value, delim - value);
+	if (ret < 0)
+		return ret;
+
+	mode->tv_mode = ret;
+
+	return 0;
+}
+
 static int drm_mode_parse_cmdline_options(const char *str,
 					  bool freestanding,
 					  const struct drm_connector *connector,
@@ -2202,6 +2225,9 @@ static int drm_mode_parse_cmdline_options(const char *str,
 		} else if (!strncmp(option, "panel_orientation", delim - option)) {
 			if (drm_mode_parse_panel_orientation(delim, mode))
 				return -EINVAL;
+		} else if (!strncmp(option, "tv_mode", delim - option)) {
+			if (drm_mode_parse_tv_mode(delim, mode))
+				return -EINVAL;
 		} else {
 			return -EINVAL;
 		}
@@ -2230,20 +2256,22 @@ struct drm_named_mode {
 	unsigned int xres;
 	unsigned int yres;
 	unsigned int flags;
+	unsigned int tv_mode;
 };
 
-#define NAMED_MODE(_name, _pclk, _x, _y, _flags)	\
+#define NAMED_MODE(_name, _pclk, _x, _y, _flags, _mode)	\
 	{						\
 		.name = _name,				\
 		.pixel_clock_khz = _pclk,		\
 		.xres = _x,				\
 		.yres = _y,				\
 		.flags = _flags,			\
+		.tv_mode = _mode,			\
 	}
 
 static const struct drm_named_mode drm_named_modes[] = {
-	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE),
-	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE),
+	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC),
+	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL),
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
@@ -2292,6 +2320,7 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 		cmdline_mode->xres = mode->xres;
 		cmdline_mode->yres = mode->yres;
 		cmdline_mode->interlace = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
+		cmdline_mode->tv_mode = mode->tv_mode;
 		cmdline_mode->specified = true;
 
 		return 1;
diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
index 09b806e27506..019ff5aa4f8d 100644
--- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
+++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
@@ -927,6 +927,14 @@ static const struct drm_cmdline_invalid_test drm_cmdline_invalid_tests[] = {
 		.name = "invalid_option",
 		.cmdline = "720x480,test=42",
 	},
+	{
+		.name = "invalid_tv_option",
+		.cmdline = "720x480i,tv_mode=invalid",
+	},
+	{
+		.name = "truncated_tv_option",
+		.cmdline = "720x480i,tv_mode=NTS",
+	},
 };
 
 static void drm_cmdline_invalid_desc(const struct drm_cmdline_invalid_test *t,
@@ -937,6 +945,64 @@ static void drm_cmdline_invalid_desc(const struct drm_cmdline_invalid_test *t,
 
 KUNIT_ARRAY_PARAM(drm_cmdline_invalid, drm_cmdline_invalid_tests, drm_cmdline_invalid_desc);
 
+struct drm_cmdline_tv_option_test {
+	const char *name;
+	const char *cmdline;
+	struct drm_display_mode *(*mode_fn)(struct drm_device *dev);
+	enum drm_connector_tv_mode tv_mode;
+};
+
+static void drm_cmdline_test_tv_options(struct kunit *test)
+{
+	const struct drm_cmdline_tv_option_test *params = test->param_value;
+	const struct drm_display_mode *expected_mode = params->mode_fn(NULL);
+	struct drm_cmdline_mode mode = { };
+
+	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(params->cmdline,
+									  &no_connector, &mode));
+	KUNIT_EXPECT_TRUE(test, mode.specified);
+	KUNIT_EXPECT_EQ(test, mode.xres, expected_mode->hdisplay);
+	KUNIT_EXPECT_EQ(test, mode.yres, expected_mode->vdisplay);
+	KUNIT_EXPECT_EQ(test, mode.tv_mode, params->tv_mode);
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
+#define TV_OPT_TEST(_opt, _cmdline, _mode_fn)		\
+	{						\
+		.name = #_opt,				\
+		.cmdline = _cmdline,			\
+		.mode_fn = _mode_fn,			\
+		.tv_mode = DRM_MODE_TV_MODE_ ## _opt,	\
+	}
+
+static const struct drm_cmdline_tv_option_test drm_cmdline_tv_option_tests[] = {
+	TV_OPT_TEST(NTSC, "720x480i,tv_mode=NTSC", drm_mode_analog_ntsc_480i),
+	TV_OPT_TEST(NTSC_443, "720x480i,tv_mode=NTSC-443", drm_mode_analog_ntsc_480i),
+	TV_OPT_TEST(NTSC_J, "720x480i,tv_mode=NTSC-J", drm_mode_analog_ntsc_480i),
+	TV_OPT_TEST(PAL, "720x576i,tv_mode=PAL", drm_mode_analog_pal_576i),
+	TV_OPT_TEST(PAL_M, "720x480i,tv_mode=PAL-M", drm_mode_analog_ntsc_480i),
+	TV_OPT_TEST(PAL_N, "720x576i,tv_mode=PAL-N", drm_mode_analog_pal_576i),
+	TV_OPT_TEST(SECAM, "720x576i,tv_mode=SECAM", drm_mode_analog_pal_576i),
+};
+
+static void drm_cmdline_tv_option_desc(const struct drm_cmdline_tv_option_test *t,
+				       char *desc)
+{
+	sprintf(desc, "%s", t->name);
+}
+KUNIT_ARRAY_PARAM(drm_cmdline_tv_option,
+		  drm_cmdline_tv_option_tests,
+		  drm_cmdline_tv_option_desc);
+
 static struct kunit_case drm_cmdline_parser_tests[] = {
 	KUNIT_CASE(drm_cmdline_test_force_d_only),
 	KUNIT_CASE(drm_cmdline_test_force_D_only_dvi),
@@ -977,6 +1043,7 @@ static struct kunit_case drm_cmdline_parser_tests[] = {
 	KUNIT_CASE(drm_cmdline_test_freestanding_force_e_and_options),
 	KUNIT_CASE(drm_cmdline_test_panel_orientation),
 	KUNIT_CASE_PARAM(drm_cmdline_test_invalid, drm_cmdline_invalid_gen_params),
+	KUNIT_CASE_PARAM(drm_cmdline_test_tv_options, drm_cmdline_tv_option_gen_params),
 	{}
 };
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 0dcd08e036b6..a8f7b2fdde87 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1374,6 +1374,11 @@ struct drm_cmdline_mode {
 	 * @tv_margins: TV margins to apply to the mode.
 	 */
 	struct drm_connector_tv_margins tv_margins;
+
+	/**
+	 * @tv_mode: TV mode standard. See DRM_MODE_TV_MODE_*.
+	 */
+	enum drm_connector_tv_mode tv_mode;
 };
 
 /**

-- 
b4 0.10.0
