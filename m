Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD875A4D49
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBCA10F242;
	Mon, 29 Aug 2022 13:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3F210F22E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:14:11 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id B86CE2B06066;
 Mon, 29 Aug 2022 09:14:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 29 Aug 2022 09:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778848; x=
 1661786048; bh=vGDBfdmuxgUQ4QJ2EO3YyCslKAl67xEK9kOPBn5ikEM=; b=d
 MNgifcNhTnevrazfsuCpNwA8ccw5/PQcnG0PkoOaHYtU/iBvNmK6rRiq7vyBZ1DN
 Gr9C9YOwQB2j1cjoxfcGpgf/o+y7TZ7zeF9IZuIJZbS2tgwIwhXBKuiztI4tyj1L
 K3HHg1vRauMP093WqfVfO6JpPD/qG3ZxAwMKEo7AHx6OpYx1A1ousM+/FfgRU85P
 5m9/3nPOIOHH1yOIWkBrpjJ+hZk5XaMesRgC8EAIs1uMHB1UNyWtYCl+qQztZJuE
 nIP6DwTVOph7Joma3I2MlYwhvx1x+QJiedc01HelyygN9t6ycLhvO7XrQ6Xl/fOf
 /5a9Z2SlFcURoacptcOhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778848; x=
 1661786048; bh=vGDBfdmuxgUQ4QJ2EO3YyCslKAl67xEK9kOPBn5ikEM=; b=F
 Nrc+3KWlslifeaTXCexiwt1w5Hgv45De91Vj1l/08DBog8Lw29VuZAOrqCC41AWy
 lymme6zCmcFK2H8Upy+r3xKFGjL4U9u+DjqT15dPJLd3mg5rBQmyBXerSc5YZgyH
 XuovPVtwKpMnQsYZFQTwBKNWiyDH94tFvS7gJ2lrhT2DNCTlfAmp7TaOJxGTpb9H
 acUtPlUq/VAXSs7wx+q1qWbvtx4sQfPfT0BokLbuOaHLuj8VnRMe5Q4JPuD8rVos
 vNu1et+dYSFKgyBp9fpOLZOLXwGiedFEpeB9tsGmvZ38/XxZUlLA3c4D3yxBbSgZ
 DGQKIpEFNen/7+CZpoAlg==
X-ME-Sender: <xms:oLsMY51pZa9rGPZiAnUjIBi6SwpLdBoOT1Ggv36-y_7Fs9saejgRLg>
 <xme:oLsMYwEiw5Xs3yZfwHYStWwbhEC0abTRuXG6aqz2gxT_8egxyJh6T5v3urJvd63Yc
 fn0mg0IuwdJgZkkR9M>
X-ME-Received: <xmr:oLsMY5647kJesrS0XyE2OXkafm6MJozfu2eFCAxeL9gSid2mWyr9tJKU0nhY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oLsMY237DXSVacpe3xUM3x8njScGC9lzRoe2XGkct_kFwNZVaVNbZw>
 <xmx:oLsMY8G_l4TOrpMbbRPwOwiPapprHz0xb49xxz1IHRblH2OGw2AYVg>
 <xmx:oLsMY3-ntm9nCV-2DIRiM8f4tQmz6TpzBfzEn36NW39ptlau917LFA>
 <xmx:oLsMY6M9DgxpknTqhLdK7BumIHZ0UT48JvJgPBl5UlEOPbLGuj6VojFEvBo>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:14:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 19/41] drm/modes: Introduce the tv_mode property as a
 command-line option
Date: Mon, 29 Aug 2022 15:11:33 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-19-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=11213; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=NDabIx53tuQKr6EzimhAU/xCP6zMPL7S96XwMvmuHj0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxTSj/WbrfjxYmlFql+68tJ0WYdzvZxzDht91dy97dFk
 xYjQjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzE7iLD/+KXXAX5J/x/XjpsxNuzN7
 jE69YR2wi2f1fPZ5i+lDOWj2f472iv++mu0//fHE86r7H2hZhv2ri6fNtkjWS/oobnDkyfGQA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: quoted-printable
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our new tv mode option allows to specify the TV mode from a property.=0D
However, it can still be useful, for example to avoid any boot time=0D
artifact, to set that property directly from the kernel command line.=0D
=0D
Let's add some code to allow it, and some unit tests to exercise that code.=
=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c=0D
index 73d01e755496..a759a4ba0036 100644=0D
--- a/drivers/gpu/drm/drm_modes.c=0D
+++ b/drivers/gpu/drm/drm_modes.c=0D
@@ -2115,6 +2115,30 @@ static int drm_mode_parse_panel_orientation(const ch=
ar *delim,=0D
 	return 0;=0D
 }=0D
 =0D
+static int drm_mode_parse_tv_mode(const char *delim,=0D
+				  struct drm_cmdline_mode *mode)=0D
+{=0D
+	const char *value;=0D
+	unsigned int len;=0D
+	int ret;=0D
+=0D
+	if (*delim !=3D '=3D')=0D
+		return -EINVAL;=0D
+=0D
+	value =3D delim + 1;=0D
+	delim =3D strchr(value, ',');=0D
+	if (!delim)=0D
+		delim =3D value + strlen(value);=0D
+=0D
+	ret =3D drm_get_tv_mode_from_name(value, delim - value);=0D
+	if (ret < 0)=0D
+		return ret;=0D
+=0D
+	mode->tv_mode =3D ret;=0D
+=0D
+	return 0;=0D
+}=0D
+=0D
 static int drm_mode_parse_cmdline_options(const char *str,=0D
 					  bool freestanding,=0D
 					  const struct drm_connector *connector,=0D
@@ -2184,6 +2208,9 @@ static int drm_mode_parse_cmdline_options(const char =
*str,=0D
 		} else if (!strncmp(option, "panel_orientation", delim - option)) {=0D
 			if (drm_mode_parse_panel_orientation(delim, mode))=0D
 				return -EINVAL;=0D
+		} else if (!strncmp(option, "tv_mode", delim - option)) {=0D
+			if (drm_mode_parse_tv_mode(delim, mode))=0D
+				return -EINVAL;=0D
 		} else {=0D
 			return -EINVAL;=0D
 		}=0D
@@ -2212,20 +2239,22 @@ struct drm_named_mode {=0D
 	unsigned int xres;=0D
 	unsigned int yres;=0D
 	unsigned int flags;=0D
+	unsigned int tv_mode;=0D
 };=0D
 =0D
-#define NAMED_MODE(_name, _pclk, _x, _y, _flags)	\=0D
+#define NAMED_MODE(_name, _pclk, _x, _y, _flags, _mode)	\=0D
 	{						\=0D
 		.name =3D _name,				\=0D
 		.pixel_clock_khz =3D _pclk,		\=0D
 		.xres =3D _x,				\=0D
 		.yres =3D _y,				\=0D
 		.flags =3D _flags,			\=0D
+		.tv_mode =3D _mode,			\=0D
 	}=0D
 =0D
 static const struct drm_named_mode drm_named_modes[] =3D {=0D
-	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE),=0D
-	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE),=0D
+	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_=
MODE_NTSC_M),=0D
+	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_M=
ODE_PAL_B),=0D
 };=0D
 =0D
 static int drm_mode_parse_cmdline_named_mode(const char *name,=0D
@@ -2271,6 +2300,7 @@ static int drm_mode_parse_cmdline_named_mode(const ch=
ar *name,=0D
 		cmdline_mode->xres =3D mode->xres;=0D
 		cmdline_mode->yres =3D mode->yres;=0D
 		cmdline_mode->interlace =3D !!(mode->flags & DRM_MODE_FLAG_INTERLACE);=0D
+		cmdline_mode->tv_mode =3D mode->tv_mode;=0D
 		cmdline_mode->specified =3D true;=0D
 =0D
 		return 1;=0D
diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/=
drm/tests/drm_cmdline_parser_test.c=0D
index 59b29cdfdd35..f1e73ed65be0 100644=0D
--- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c=0D
+++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c=0D
@@ -885,6 +885,201 @@ static void drm_cmdline_test_multiple_options(struct =
kunit *test)=0D
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);=0D
 }=0D
 =0D
+static void drm_cmdline_test_tv_options(struct kunit *test,=0D
+					const char *cmdline,=0D
+					const struct drm_display_mode *expected_mode,=0D
+					unsigned int expected_tv_mode)=0D
+{=0D
+	struct drm_cmdline_mode mode =3D { };=0D
+=0D
+	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline=
,=0D
+									  &no_connector, &mode));=0D
+	KUNIT_EXPECT_TRUE(test, mode.specified);=0D
+	KUNIT_EXPECT_EQ(test, mode.xres, expected_mode->hdisplay);=0D
+	KUNIT_EXPECT_EQ(test, mode.yres, expected_mode->vdisplay);=0D
+	KUNIT_EXPECT_EQ(test, mode.tv_mode, expected_tv_mode);=0D
+=0D
+	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);=0D
+=0D
+	KUNIT_EXPECT_FALSE(test, mode.bpp_specified);=0D
+=0D
+	KUNIT_EXPECT_FALSE(test, mode.rb);=0D
+	KUNIT_EXPECT_FALSE(test, mode.cvt);=0D
+	KUNIT_EXPECT_EQ(test, mode.interlace, !!(expected_mode->flags & DRM_MODE_=
FLAG_INTERLACE));=0D
+	KUNIT_EXPECT_FALSE(test, mode.margins);=0D
+	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_ntsc_443(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x480i,tv_mode=3DNTSC-443",=0D
+				    drm_mode_analog_ntsc_480i(NULL),=0D
+				    DRM_MODE_TV_MODE_NTSC_443);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_ntsc_j(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x480i,tv_mode=3DNTSC-J",=0D
+				    drm_mode_analog_ntsc_480i(NULL),=0D
+				    DRM_MODE_TV_MODE_NTSC_J);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_ntsc_m(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x480i,tv_mode=3DNTSC-M",=0D
+				    drm_mode_analog_ntsc_480i(NULL),=0D
+				    DRM_MODE_TV_MODE_NTSC_M);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_pal_60(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DPAL-60",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_PAL_60);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_pal_b(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DPAL-B",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_PAL_B);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_pal_d(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DPAL-D",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_PAL_D);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_pal_g(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DPAL-G",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_PAL_G);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_pal_h(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DPAL-H",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_PAL_H);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_pal_i(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DPAL-I",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_PAL_I);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_pal_m(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x480i,tv_mode=3DPAL-M",=0D
+				    drm_mode_analog_ntsc_480i(NULL),=0D
+				    DRM_MODE_TV_MODE_PAL_M);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_pal_n(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DPAL-N",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_PAL_N);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_pal_nc(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DPAL-Nc",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_PAL_NC);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_secam_60(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DSECAM-60",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_SECAM_60);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_secam_b(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DSECAM-B",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_SECAM_B);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_secam_d(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DSECAM-D",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_SECAM_D);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_secam_g(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DSECAM-G",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_SECAM_G);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_secam_k(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DSECAM-K",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_SECAM_K);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_secam_k1(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DSECAM-K1",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_SECAM_K1);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_secam_l(struct kunit *test)=0D
+{=0D
+	drm_cmdline_test_tv_options(test,=0D
+				    "720x576i,tv_mode=3DSECAM-L",=0D
+				    drm_mode_analog_pal_576i(NULL),=0D
+				    DRM_MODE_TV_MODE_SECAM_L);=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_invalid(struct kunit *test)=0D
+{=0D
+	struct drm_cmdline_mode mode =3D { };=0D
+	const char *cmdline =3D "720x480i,tv_mode=3Dinvalid";=0D
+=0D
+	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdlin=
e,=0D
+									   &no_connector, &mode));=0D
+}=0D
+=0D
+static void drm_cmdline_test_tv_option_truncated(struct kunit *test)=0D
+{=0D
+	struct drm_cmdline_mode mode =3D { };=0D
+	const char *cmdline =3D "720x480i,tv_mode=3DNTSC";=0D
+=0D
+	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdlin=
e,=0D
+									   &no_connector, &mode));=0D
+}=0D
+=0D
 static void drm_cmdline_test_invalid_option(struct kunit *test)=0D
 {=0D
 	struct drm_cmdline_mode mode =3D { };=0D
@@ -1047,6 +1242,27 @@ static struct kunit_case drm_cmdline_parser_tests[] =
=3D {=0D
 	KUNIT_CASE(drm_cmdline_test_name_refresh_invalid_mode),=0D
 	KUNIT_CASE(drm_cmdline_test_name_option),=0D
 	KUNIT_CASE(drm_cmdline_test_name_bpp_option),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_ntsc_443),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_ntsc_j),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_ntsc_m),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_60),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_b),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_d),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_g),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_h),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_i),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_m),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_n),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_pal_nc),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_60),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_b),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_d),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_g),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_k),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_k1),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_secam_l),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_invalid),=0D
+	KUNIT_CASE(drm_cmdline_test_tv_option_truncated),=0D
 	KUNIT_CASE(drm_cmdline_test_rotate_0),=0D
 	KUNIT_CASE(drm_cmdline_test_rotate_90),=0D
 	KUNIT_CASE(drm_cmdline_test_rotate_180),=0D
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h=0D
index 49d261977d4e..9589108ba202 100644=0D
--- a/include/drm/drm_connector.h=0D
+++ b/include/drm/drm_connector.h=0D
@@ -1447,6 +1447,11 @@ struct drm_cmdline_mode {=0D
 	 * @tv_margins: TV margins to apply to the mode.=0D
 	 */=0D
 	struct drm_connector_tv_margins tv_margins;=0D
+=0D
+	/**=0D
+	 * @tv_mode: TV mode standard. See DRM_MODE_TV_MODE_*.=0D
+	 */=0D
+	enum drm_connector_tv_mode tv_mode;=0D
 };=0D
 =0D
 /**=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
