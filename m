Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F4F5FDA8F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12A210E8E9;
	Thu, 13 Oct 2022 13:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F7C10E8BF;
 Thu, 13 Oct 2022 13:19:33 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 03214580364;
 Thu, 13 Oct 2022 09:19:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 13 Oct 2022 09:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667171; x=
 1665674371; bh=KbyDa4XSKwXHnM7mBLOeZBJTIz/aOgpTOnOhJxYoW9c=; b=K
 xVPzZpYV/X/vZy5mqIjTaHOBhlC2IwBbPwR7mQgWHoINgDWv/TA3pPAe6EvW0b5b
 Be1bULPJHlvSfungFNxeuPgxIlkAV9utOCz9VZ0M6ls8cR3v4vFfhvaxvzCzya0C
 rzjGXEYjnvSa+VV13OJxs1epJE8pf5Ezu4e9hj0SAF+NDt/G0SXcRhnSmNQDm5wi
 VuzXayB/OoghnvsdPpdHCjugV2Z8XI8KuK9KLBieuE1y08tbFg5tgUHMcLxy8nHD
 bUZvwaeBTqWNDuEifDtG9ui9xLlgXDyfIkfVHv/w6edRl0qnk+4RYHXFEcb7Hzod
 EjbkpAEoo3ea/PliaAEeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667171; x=
 1665674371; bh=KbyDa4XSKwXHnM7mBLOeZBJTIz/aOgpTOnOhJxYoW9c=; b=D
 E/U2a4Y7wXpRM1q3X7zG217maQ3NhwDELQpaVfhZ+RN3KC8uGI6VkqVNK4XmL6fB
 AX4gZgbdjXBlPmTArUzgjWPhROb3Zau54oaGOXCcL6AhKyyPTZLXgjzm3bjC1kfG
 UVtLrJKNW768hIf64TnaIA7dgUBf3QDKbVq8fHRGNtNZTvoTFxh5ESkyxpqfeaw0
 53RTILAvnhnzeJgMDC5gSCISfOrmDuNq9ghNeMoiB7Jm4f7hJV+VT/tgbSRPHi88
 9GShbrya6qL+eICx+hCQpJxB0Y0BeN08Yy7HhxRt2Pg0cY2gn7cBeRk2KLbddcVV
 DgQrYBjPgdTIRVPZ8Xg4A==
X-ME-Sender: <xms:YxBIY7h3C1zVPFTJ1fnECXcb1pvmfS77MWozBLgo2oNmt1y0lgRZlA>
 <xme:YxBIY4BlB7QDPtkkvrcc4veqAUSr22-BDiL1y7YfMbDxidiPgzCci4Yp0mgMfM0iB
 lxY2liVlLyB_P4dP3E>
X-ME-Received: <xmr:YxBIY7GPt9UerksUJ14OD1wmouYt6A4Mgbzdcr1fTTts8vdVTzLkZ1hW40sq3m4mKHAyZwiz-ekQLlZ6mRPggcMd9Vp-T1k4NNGO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YxBIY4SgUCS5qOUxJvOfw_2MHCzO32T0qlQxFd0yunI-xhw2gi2ejg>
 <xmx:YxBIY4y0fpTu3tUdsOUQXqGW1Tq4JUyWBOOKXupScfcgGqE_JVE5mQ>
 <xmx:YxBIY-5DH2rOEkWh8orTmin45CBDBsCdPokSah0XzVMAVU6Vvh4u0g>
 <xmx:YxBIYwfZJDPOyOz4daz4m1_ivU_AeUlUJ36cIo3299qLwC26UbArHQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:18:57 +0200
Subject: [PATCH v5 13/22] drm/modes: Introduce the tv_mode property as a
 command-line option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v5-13-d841cc64fe4b@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8119; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=o0HYKxrc1d0sfrp2aQO83/TXH+hG7s1cgZxhISSBCa0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAm774wou3/20W/qnWDC78zoXJ/60/QYr5rZEzpTePfds
 rq9fRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYy+SQjw06HyTWmv496BO+dof/r2q
 9dfBd/HPm5aYcjz62la7LFe5sZGTbtlRJTlX0Q13nyTvq1eQVx1dtStHau1Ut9+V/sdXmALDMA
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v4:
- Add Documentation of the command-line option to modedb.rst
---
 Documentation/fb/modedb.rst                     |  2 +
 drivers/gpu/drm/drm_modes.c                     | 35 +++++++++++--
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c | 67 +++++++++++++++++++++++++
 include/drm/drm_connector.h                     |  5 ++
 4 files changed, 106 insertions(+), 3 deletions(-)

diff --git a/Documentation/fb/modedb.rst b/Documentation/fb/modedb.rst
index 4d2411e32ebb..5d6361a77f3c 100644
--- a/Documentation/fb/modedb.rst
+++ b/Documentation/fb/modedb.rst
@@ -65,6 +65,8 @@ Valid options are::
   - reflect_y (boolean): Perform an axial symmetry on the Y axis
   - rotate (integer): Rotate the initial framebuffer by x
     degrees. Valid values are 0, 90, 180 and 270.
+  - tv_mode: Analog TV mode. One of "NTSC", "NTSC-443", "NTSC-J", "PAL",
+    "PAL-M", "PAL-N", or "SECAM".
   - panel_orientation, one of "normal", "upside_down", "left_side_up", or
     "right_side_up". For KMS drivers only, this sets the "panel orientation"
     property on the kms connector as hint for kms users.
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 068c78d54db2..c9b62e30e303 100644
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
index 34790e7a3760..3e711b83b823 100644
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
+KUNIT_ARRAY_PARAM(drm_cmdline_tv_option,
+		  drm_cmdline_tv_option_tests,
+		  drm_cmdline_tv_option_desc);
+
 static struct kunit_case drm_cmdline_parser_tests[] = {
 	KUNIT_CASE(drm_test_cmdline_force_d_only),
 	KUNIT_CASE(drm_test_cmdline_force_D_only_dvi),
@@ -977,6 +1043,7 @@ static struct kunit_case drm_cmdline_parser_tests[] = {
 	KUNIT_CASE(drm_test_cmdline_freestanding_force_e_and_options),
 	KUNIT_CASE(drm_test_cmdline_panel_orientation),
 	KUNIT_CASE_PARAM(drm_test_cmdline_invalid, drm_cmdline_invalid_gen_params),
+	KUNIT_CASE_PARAM(drm_test_cmdline_tv_options, drm_cmdline_tv_option_gen_params),
 	{}
 };
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index a33f24a76738..51d79c2a8e92 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1368,6 +1368,11 @@ struct drm_cmdline_mode {
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
b4 0.11.0-dev-7da52
