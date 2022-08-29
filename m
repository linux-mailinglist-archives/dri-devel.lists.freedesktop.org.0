Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9445A4D5B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D368310F24E;
	Mon, 29 Aug 2022 13:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E9710F22E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:14:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 2237C2B06067;
 Mon, 29 Aug 2022 09:14:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 29 Aug 2022 09:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778854; x=
 1661786054; bh=G5gY1qx7f9Z8E9SSYubfd/6H1rSy67rmKoWXrDijZ/E=; b=Q
 AHIIMLmj0zMi9tyBNRCq7DLnTnBBsEYntJOCnTkGngz0/5t6ZAPAFa8DCLqjYcH/
 wbDy/qJo0c7zz4Xof888GkCEDO5ZFTbUiVWHLo3O+6y4YwHo7yxCjahARmfChLxE
 1KbI52PI9dAT161+O+Yt0iHUJ/BfAE73VUaoDpL2fx0v70eFb6J9rKuZGThPXcpM
 FG2N4Dm2/CKDBxWYGz8whbIyDe21tWfYbhwg+B4LUYiXahNge36oKYXIPhUXxbjY
 rx0xqo38bihmtidy0mxgJJrqI2aAIxvxKZ3y/id0ZMqonZXa/gT7Cde+dvt1rKNA
 Hw96afqiRxbtt59d6RYlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778854; x=
 1661786054; bh=G5gY1qx7f9Z8E9SSYubfd/6H1rSy67rmKoWXrDijZ/E=; b=N
 sb0JxXEYr9wa2njuxwTWDjlLO8vIjITCi7CjlM5WxzU1uvCOr+PCIbgJaPGStYwB
 6QZwMLfzGrwS3rKG3WZZijH0Fp8lsVDe05v6rZvbN/UVZ2/tcEAsfCx7O4eLnCq3
 xM1dXdXje8Dy71MDQ4JPeB5x8H+0YGOZeu5CbuZX9t/Yrv6tWPEmlTt5Pu8cCjOj
 csohY+tWhr+kzeg/MgM3ofJw/2ESM93DX1wGpACbz0sqOI2HJee2uzjBqMWNJ5k4
 7r8Y1qdgX599qYz0Gx2lu0NH14Q/kHoDvpPnQTqbnQrTWn2whIi9u+/XjwwKoLBV
 hMiCDzQw63/Jud6PP8cfg==
X-ME-Sender: <xms:prsMYzWWLBpJuCARXFV8AQw-kkS_yTpPFuby4-Etvg_RTSR5UUUEfA>
 <xme:prsMY7muweoBur3sILDRxFKMPY_SERRVW0qCkUB5r2Rflhc_R1zglghvNHoJ13Yes
 a1kaCnunK_T94NyEYI>
X-ME-Received: <xmr:prsMY_byXW891jpP4u99698BwIJ9gX1QnlDOLMuxQ-FZLm4Abfe9WsFlyxt6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:prsMY-Xi9GamHnSIRPh1CtaHzYd9ZuKNi5Ii-5z6aUqj67RHXLDH-Q>
 <xmx:prsMY9kdfteVhrx30CNB93h8gqOogOJLu48eC4sJg1hCsBqEItY9CQ>
 <xmx:prsMY7dHdkIFgbbWV5ebGC7_edVeMDktu-cpuC1X7uzJNN4vAEt2Dw>
 <xmx:prsMY5sAAPmPTbgXLeCaqBLlvagiLutvW_mMaQSTUK2KwaEnqhngWfelPBY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:14:13 -0400 (EDT)
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
Subject: [PATCH v2 20/41] drm/modes: Properly generate a drm_display_mode from
 a named mode
Date: Mon, 29 Aug 2022 15:11:34 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-20-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=5408; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=f4QSeZ0rWQINmdtWk7imZFwLfgnxhFabi7NHwBgL+qA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxQOeO6Mr5xVf3/T1Q8LhD/yLk1ewOZgfDXKYoJcyyfD
 V56bO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRjdcYGR6sN753q/VR9oQjazv49u
 b3fD9UZ3jgqHt/7qpdwnG9ETqMDJ3L4+91JauGT783s1VT697F+gTFj4khvbX5oSzFuQrObAA=
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

The framework will get the drm_display_mode from the drm_cmdline_mode it=0D
got by parsing the video command line argument by calling=0D
drm_connector_pick_cmdline_mode().=0D
=0D
The heavy lifting will then be done by the drm_mode_create_from_cmdline_mod=
e()=0D
function.=0D
=0D
In the case of the named modes though, there's no real code to make that=0D
translation and we rely on the drivers to guess which actual display mode=0D
we meant.=0D
=0D
Let's modify drm_mode_create_from_cmdline_mode() to properly generate the=0D
drm_display_mode we mean when passing a named mode.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c=0D
index a759a4ba0036..065dbfbd815e 100644=0D
--- a/drivers/gpu/drm/drm_modes.c=0D
+++ b/drivers/gpu/drm/drm_modes.c=0D
@@ -2480,6 +2480,36 @@ bool drm_mode_parse_command_line_for_connector(const=
 char *mode_option,=0D
 }=0D
 EXPORT_SYMBOL(drm_mode_parse_command_line_for_connector);=0D
 =0D
+static struct drm_display_mode *drm_named_mode(struct drm_device *dev,=0D
+					       struct drm_cmdline_mode *cmd)=0D
+{=0D
+	struct drm_display_mode *mode;=0D
+	unsigned int i;=0D
+=0D
+	for (i =3D 0; i < ARRAY_SIZE(drm_named_modes); i++) {=0D
+		const struct drm_named_mode *named_mode =3D &drm_named_modes[i];=0D
+=0D
+		if (strcmp(cmd->name, named_mode->name))=0D
+			continue;=0D
+=0D
+		if (!named_mode->tv_mode)=0D
+			continue;=0D
+=0D
+		mode =3D drm_analog_tv_mode(dev,=0D
+					  named_mode->tv_mode,=0D
+					  named_mode->pixel_clock_khz * 1000,=0D
+					  named_mode->xres,=0D
+					  named_mode->yres,=0D
+					  named_mode->flags & DRM_MODE_FLAG_INTERLACE);=0D
+		if (!mode)=0D
+			return NULL;=0D
+=0D
+		return mode;=0D
+	}=0D
+=0D
+	return NULL;=0D
+}=0D
+=0D
 /**=0D
  * drm_mode_create_from_cmdline_mode - convert a command line modeline int=
o a DRM display mode=0D
  * @dev: DRM device to create the new mode for=0D
@@ -2497,7 +2527,9 @@ drm_mode_create_from_cmdline_mode(struct drm_device *=
dev,=0D
 	if (cmd->xres =3D=3D 0 || cmd->yres =3D=3D 0)=0D
 		return NULL;=0D
 =0D
-	if (cmd->cvt)=0D
+	if (strlen(cmd->name))=0D
+		mode =3D drm_named_mode(dev, cmd);=0D
+	else if (cmd->cvt)=0D
 		mode =3D drm_cvt_mode(dev,=0D
 				    cmd->xres, cmd->yres,=0D
 				    cmd->refresh_specified ? cmd->refresh : 60,=0D
diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/=
drm/tests/drm_client_modeset_test.c=0D
index 46335de7bc6b..4380cf670fb4 100644=0D
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c=0D
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c=0D
@@ -26,6 +26,20 @@ static int drm_client_modeset_connector_get_modes(struct=
 drm_connector *connecto=0D
 =0D
 	count =3D drm_add_modes_noedid(connector, 1920, 1200);=0D
 =0D
+	mode =3D drm_mode_analog_ntsc_480i(connector->dev);=0D
+	if (!mode)=0D
+		return -ENOMEM;=0D
+=0D
+	drm_mode_probed_add(connector, mode);=0D
+	count +=3D 1;=0D
+=0D
+	mode =3D drm_mode_analog_pal_576i(connector->dev);=0D
+	if (!mode)=0D
+		return -ENOMEM;=0D
+=0D
+	drm_mode_probed_add(connector, mode);=0D
+	count +=3D 1;=0D
+=0D
 	return count;=0D
 }=0D
 =0D
@@ -58,6 +72,9 @@ static int drm_client_modeset_test_init(struct kunit *tes=
t)=0D
 		return ret;=0D
 	drm_connector_helper_add(&priv->connector, &drm_client_modeset_connector_=
helper_funcs);=0D
 =0D
+	priv->connector.interlace_allowed =3D true;=0D
+	priv->connector.doublescan_allowed =3D true;=0D
+=0D
 	return 0;=0D
 }=0D
 =0D
@@ -97,8 +114,62 @@ static void drm_pick_cmdline_res_1920_1080_60(struct ku=
nit *test)=0D
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));=0D
 }=0D
 =0D
+static void drm_pick_cmdline_named_ntsc(struct kunit *test)=0D
+{=0D
+	struct drm_client_modeset_test_priv *priv =3D test->priv;=0D
+	struct drm_device *drm =3D priv->drm;=0D
+	struct drm_connector *connector =3D &priv->connector;=0D
+	struct drm_cmdline_mode *cmdline_mode =3D &connector->cmdline_mode;=0D
+	struct drm_display_mode *mode;=0D
+	const char *cmdline =3D "NTSC";=0D
+	int ret;=0D
+=0D
+	KUNIT_ASSERT_TRUE(test,=0D
+			  drm_mode_parse_command_line_for_connector(cmdline,=0D
+								    connector,=0D
+								    cmdline_mode));=0D
+=0D
+	mutex_lock(&drm->mode_config.mutex);=0D
+	ret =3D drm_helper_probe_single_connector_modes(connector, 1920, 1080);=0D
+	mutex_unlock(&drm->mode_config.mutex);=0D
+	KUNIT_ASSERT_GT(test, ret, 0);=0D
+=0D
+	mode =3D drm_connector_pick_cmdline_mode(connector);=0D
+	KUNIT_ASSERT_PTR_NE(test, mode, NULL);=0D
+=0D
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mo=
de));=0D
+}=0D
+=0D
+static void drm_pick_cmdline_named_pal(struct kunit *test)=0D
+{=0D
+	struct drm_client_modeset_test_priv *priv =3D test->priv;=0D
+	struct drm_device *drm =3D priv->drm;=0D
+	struct drm_connector *connector =3D &priv->connector;=0D
+	struct drm_cmdline_mode *cmdline_mode =3D &connector->cmdline_mode;=0D
+	struct drm_display_mode *mode;=0D
+	const char *cmdline =3D "PAL";=0D
+	int ret;=0D
+=0D
+	KUNIT_ASSERT_TRUE(test,=0D
+			  drm_mode_parse_command_line_for_connector(cmdline,=0D
+								    connector,=0D
+								    cmdline_mode));=0D
+=0D
+	mutex_lock(&drm->mode_config.mutex);=0D
+	ret =3D drm_helper_probe_single_connector_modes(connector, 1920, 1080);=0D
+	mutex_unlock(&drm->mode_config.mutex);=0D
+	KUNIT_ASSERT_GT(test, ret, 0);=0D
+=0D
+	mode =3D drm_connector_pick_cmdline_mode(connector);=0D
+	KUNIT_ASSERT_PTR_NE(test, mode, NULL);=0D
+=0D
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_pal_576i(drm), mod=
e));=0D
+}=0D
+=0D
 static struct kunit_case drm_pick_cmdline_tests[] =3D {=0D
 	KUNIT_CASE(drm_pick_cmdline_res_1920_1080_60),=0D
+	KUNIT_CASE(drm_pick_cmdline_named_ntsc),=0D
+	KUNIT_CASE(drm_pick_cmdline_named_pal),=0D
 	{}=0D
 };=0D
 =0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
