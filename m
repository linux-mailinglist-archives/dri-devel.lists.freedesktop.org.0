Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E1B62D6EA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8F610E5B6;
	Thu, 17 Nov 2022 09:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4105B10E5AB;
 Thu, 17 Nov 2022 09:29:32 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 842052B069CC;
 Thu, 17 Nov 2022 04:29:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 17 Nov 2022 04:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677369; x=
 1668684569; bh=WSVVp9bob0oe9L15YojZgH0b6nfaFst7/KJ8rEj508c=; b=f
 B+XPThEIbaZfa80u/aF605xC9TScVI+7rnkuJ+GAftnKW6YJZ8iAggzbBDulRVum
 vLQ29jVAbFHDM/0sIGlcar5C2jRuBpdbQvyPbWG1eBOVZ+B/+MysVjzCJWEMBiEM
 /AOUlmZ4XtHWZ1rp+bykHei1xg2/BgtNaY6zA34CBYV+x0NA3cSDFTvtA1rwtyKn
 psSqhae19k3uO9UumRV550dAoG79Dau8rl86+FMgwofeddmxlMUB7cwgJqZVO4jy
 OXvG8LOMBaA9xW5OxCCe2ALnAcaX0Htk2B+8jPmNftSixoF/X0wEhCORySQxhQE6
 56pNELmIsoq84RPHTSDcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677369; x=
 1668684569; bh=WSVVp9bob0oe9L15YojZgH0b6nfaFst7/KJ8rEj508c=; b=v
 l83gBHY+tuxk2Dj54OlmxNORYAe6kd7PmSxW09wjs53dOXTIANAWhSLNFwWbwheb
 ZvHnr0nA67sumy6dUe8Ya7J6tfic+KnAeN6ExkQcaTWEvEjLfDLlyyLDnFq9AXEj
 JHR/A5i25oOcefbRzCMERENURgjoZ2aHQ7Ee5je/lQKzvU8xjx2IIZfJcsQLgHG7
 L4OvcNGI/rEy0eMa9KqRV2uO3Y33ZGEVHgE3uvZ7o9jg/DwRk7Vn9AW0iNXzVg+7
 IZ9Tfzz1E2Rc6+0lxQolG8UvFgh3H2/dFwdFE3WCZEkUhwvrqAPG1PIbTl5h3ysd
 HaMzZgGXnYmL7ne4aucuQ==
X-ME-Sender: <xms:-P51Y_ExZ2cc_XCSq8tG6-gn5fvlW8W2O2drkAn2LaueheIFyuJ6pQ>
 <xme:-P51Y8Xl8A2N9rZHLw6tTig4CR7z4LgxKlW-L-9ksuBsHd0y0PO8JEPLUwu8WgtkT
 CINlCqe1qQD1XbCaLE>
X-ME-Received: <xmr:-P51YxIr_fyi0kAyBHGRv19Gd9VCHXE0ijlSUodVhpzCpEyT1bxOkbWH2ucVwNcGQR--Se9Qz3ZSElsoKj7n8-F8x1dSu9pIzq3INc_Sl6-d8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-f51Y9Hu-MHloWhHszg4ZJg-rVF8sJvnKjyHjpDn8ptHqdq-BdLjYw>
 <xmx:-f51Y1U5feA5Civu28Kx0eMwYu3vNurqCXl8JyWCKxlrl8SUYdnEug>
 <xmx:-f51Y4NjFii7krZzmXOYSJcz2uDHky1uoWA5NKZieYXD31_f6r_6Qg>
 <xmx:-f51Y_g1JyLzTilKG_7c3Nxd_--uZrupIM-6AxNxexzzeX84OROrWqdTLZA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:29:28 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:28:51 +0100
Subject: [PATCH v10 08/19] drm/modes: Introduce the tv_mode property as a
 command-line option
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v10-8-256dad125326@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8579; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=XTak/BhhFVwDoyB+RGSU8AOydVTHUNdn3AeM3Hxw7hI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y7sLF/zIDLvibPf5F1mUe6OopEMsw9GJeY9shFmnvJ9
 ZdH+jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEykPoiR4Z4tb9izpnPXPC5ana6KE3
 BZtl72Qer8FToMur4sD7cw5DP8T1t0sKF1kfuOPIeaa7uq6t5Kb+QS9G0O/DDP8N/mNVOKeAE=
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

Our new tv mode option allows to specify the TV mode from a property.
However, it can still be useful, for example to avoid any boot time
artifact, to set that property directly from the kernel command line.

Let's add some code to allow it, and some unit tests to exercise that code.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v10:
- Fix checkpatch warning

Changes in v7:
- Add Noralf Reviewed-by

Changes in v6:
- Add a tv_mode_specified field

Changes in v4:
- Add Documentation of the command-line option to modedb.rst
---
 Documentation/fb/modedb.rst                     |  2 +
 drivers/gpu/drm/drm_modes.c                     | 37 ++++++++++++--
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c | 68 +++++++++++++++++++++++++
 include/drm/drm_connector.h                     | 12 +++++
 4 files changed, 116 insertions(+), 3 deletions(-)

diff --git a/Documentation/fb/modedb.rst b/Documentation/fb/modedb.rst
index e53375033146..bebfe61caa77 100644
--- a/Documentation/fb/modedb.rst
+++ b/Documentation/fb/modedb.rst
@@ -70,6 +70,8 @@ Valid options are::
   - reflect_y (boolean): Perform an axial symmetry on the Y axis
   - rotate (integer): Rotate the initial framebuffer by x
     degrees. Valid values are 0, 90, 180 and 270.
+  - tv_mode: Analog TV mode. One of "NTSC", "NTSC-443", "NTSC-J", "PAL",
+    "PAL-M", "PAL-N", or "SECAM".
   - panel_orientation, one of "normal", "upside_down", "left_side_up", or
     "right_side_up". For KMS drivers only, this sets the "panel orientation"
     property on the kms connector as hint for kms users.
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 9426c87df623..f9fe065f189b 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2135,6 +2135,30 @@ static int drm_mode_parse_panel_orientation(const char *delim,
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
+	mode->tv_mode_specified = true;
+	mode->tv_mode = ret;
+
+	return 0;
+}
+
 static int drm_mode_parse_cmdline_options(const char *str,
 					  bool freestanding,
 					  const struct drm_connector *connector,
@@ -2204,6 +2228,9 @@ static int drm_mode_parse_cmdline_options(const char *str,
 		} else if (!strncmp(option, "panel_orientation", delim - option)) {
 			if (drm_mode_parse_panel_orientation(delim, mode))
 				return -EINVAL;
+		} else if (!strncmp(option, "tv_mode", delim - option)) {
+			if (drm_mode_parse_tv_mode(delim, mode))
+				return -EINVAL;
 		} else {
 			return -EINVAL;
 		}
@@ -2232,20 +2259,22 @@ struct drm_named_mode {
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
@@ -2290,6 +2319,8 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 		cmdline_mode->xres = mode->xres;
 		cmdline_mode->yres = mode->yres;
 		cmdline_mode->interlace = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
+		cmdline_mode->tv_mode = mode->tv_mode;
+		cmdline_mode->tv_mode_specified = true;
 		cmdline_mode->specified = true;
 
 		return 1;
diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
index 34790e7a3760..88f7f518ffb3 100644
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
@@ -937,6 +945,65 @@ static void drm_cmdline_invalid_desc(const struct drm_cmdline_invalid_test *t,
 
 KUNIT_ARRAY_PARAM(drm_cmdline_invalid, drm_cmdline_invalid_tests, drm_cmdline_invalid_desc);
 
+struct drm_cmdline_tv_option_test {
+	const char *name;
+	const char *cmdline;
+	struct drm_display_mode *(*mode_fn)(struct drm_device *dev);
+	enum drm_connector_tv_mode tv_mode;
+};
+
+static void drm_test_cmdline_tv_options(struct kunit *test)
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
+
+KUNIT_ARRAY_PARAM(drm_cmdline_tv_option,
+		  drm_cmdline_tv_option_tests,
+		  drm_cmdline_tv_option_desc);
+
 static struct kunit_case drm_cmdline_parser_tests[] = {
 	KUNIT_CASE(drm_test_cmdline_force_d_only),
 	KUNIT_CASE(drm_test_cmdline_force_D_only_dvi),
@@ -977,6 +1044,7 @@ static struct kunit_case drm_cmdline_parser_tests[] = {
 	KUNIT_CASE(drm_test_cmdline_freestanding_force_e_and_options),
 	KUNIT_CASE(drm_test_cmdline_panel_orientation),
 	KUNIT_CASE_PARAM(drm_test_cmdline_invalid, drm_cmdline_invalid_gen_params),
+	KUNIT_CASE_PARAM(drm_test_cmdline_tv_options, drm_cmdline_tv_option_gen_params),
 	{}
 };
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c856f4871697..ffca0a857d53 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1368,6 +1368,18 @@ struct drm_cmdline_mode {
 	 * @tv_margins: TV margins to apply to the mode.
 	 */
 	struct drm_connector_tv_margins tv_margins;
+
+	/**
+	 * @tv_mode: TV mode standard. See DRM_MODE_TV_MODE_*.
+	 */
+	enum drm_connector_tv_mode tv_mode;
+
+	/**
+	 * @tv_mode_specified:
+	 *
+	 * Did the mode have a preferred TV mode?
+	 */
+	bool tv_mode_specified;
 };
 
 /**

-- 
b4 0.11.0-dev-99e3a
