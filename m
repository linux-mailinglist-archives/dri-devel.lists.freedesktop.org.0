Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A0D5853EA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731DB11364F;
	Fri, 29 Jul 2022 16:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C8F113FB4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1ECFA580944;
 Fri, 29 Jul 2022 12:36:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 29 Jul 2022 12:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112569; x=
 1659119769; bh=UUUN9eql9kFqqr8H1ut4YzAO+C6vDcdsRPiZuuOdpJk=; b=K
 udFeb3yqnZgg2bdfphfnPBCVNcQpK+kxC6wis8Rmxgd3ulrWJWw4G3zsIa7qxO2l
 0ChmHO/0aQWlEGmYK+cE8VdNd+TW63BbHX1rFuhWbkhDeGTcOxSkjh+LKR0v72a9
 tO3VmzSX8puxxVSY4zCdz1Y0Jg6c9Imd6+kP7j87zcX6jJZ+r9tJj93q0nYuMxRz
 cuCHMbBMkWYXwU+vMIDFxdPapQ0xrsEKXLd+HsgSPOYAQOnvi10VnFlzt+AvKeOg
 fvggwCBmC+yY1avhxElUShY4nR3YQ61x34c98KBXHHFN2qi9r8FQFAdjpnOrjoAl
 GouwZgVOrTpoqO+0u7m0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112569; x=
 1659119769; bh=UUUN9eql9kFqqr8H1ut4YzAO+C6vDcdsRPiZuuOdpJk=; b=u
 j/Velf3MK87F1WRyGenKikacHmFsv6exnWWWr4RXgcNV6vJzdAJZhMltWsaJH9L+
 bMn37TkFynmZ84zNvFQCR4USRj32sdTsuQp/Fe0iwyTW9wiE/yA7o/chO5BbUzau
 gGxu22ktJ+/3Dkq7l72iH92fWmnDZjTwc47S6tE6/nQMh9VremOHTwxNAXNBSlMb
 V6ySbsKZChgfG0hz8vaKRm+Z9XXi0uQK+o0a76NXbDcwH1oEEOlP5LHODUOLf1o+
 jHdgac7mCRPI9jpkLgfkQrAeDOT3AtPmKJtr7OxSErkEOwpdSD46YWbPEmuTPFgi
 Yg/9yT+5kHGjrd5KEkLhw==
X-ME-Sender: <xms:eAzkYqXKoFSxeVjGE-i0mYUbJe4nb3KFKqeY7CCP8FZaqHHh34obqQ>
 <xme:eAzkYmmimKxsNVJ-_LHBAYbZBIiq202XLi69d2_d1RSn1xxwAW_bPVFuJy-xyKCnT
 SP3GKqcFryKdLck_kE>
X-ME-Received: <xmr:eAzkYubUE13A_veTQj73lEyRn3ZYrzGnqtPijc5Z72zDV3Z7eQFNTe_6WtC8RCBVxT6Zzi3XgR9DWZn3UXY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eAzkYhW2o29HYmXjcKzG3rvVscpDTId64Za9zAuARlaOy-Vjmifmvw>
 <xmx:eAzkYkkp6-vbBJy_lYOWsb-xrDyGYdzP4_FHJ2UYHXTEyR-OSuuKQg>
 <xmx:eAzkYmfGapjKNZ1HAmUDtZZnxPGpJrJXHQMM3ecK6bQ35_uHVqndVQ>
 <xmx:eQzkYg0idVD4QAZon5yyanCOvRcYtTaWl7All_oKZK2GqMdqQX_mWA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:08 -0400 (EDT)
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
Subject: [PATCH v1 12/35] drmi/modes: Properly generate a drm_display_mode
 from a named mode
Date: Fri, 29 Jul 2022 18:34:55 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-12-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=4975; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=iTu+aID7Vz/WoMYjnDh3Hpjn7F2+6T7EAGmzjNecim4=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFiPPO1JGSXmvH2vY6CNoFXHXbJ/D/p8f6WN+fKLcKM
 hiJNHaUsDMIcDLJiiizXBd/a8YVFuUXwfNgMM4eVCWQIAxenAEzEkJOR4eqzr889lpw6uuPi23Iz0c
 ttK/aoBR8MsrGNin73Yrbxn3mMDI+bGLO+zxZc1T8j/OCWpRWMn5KTzMuVzm+c7bD33Q+9Y8kA
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
index 78ea520f2822..ecb2e83cf860 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1967,6 +1967,28 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
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
+		mode = drm_mode_duplicate(dev, named_mode->mode);
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
@@ -1984,7 +2006,9 @@ drm_mode_create_from_cmdline_mode(struct drm_device *dev,
 	if (cmd->xres == 0 || cmd->yres == 0)
 		return NULL;
 
-	if (cmd->cvt)
+	if (strlen(cmd->name))
+		mode = drm_named_mode(dev, cmd);
+	else if (cmd->cvt)
 		mode = drm_cvt_mode(dev,
 				    cmd->xres, cmd->yres,
 				    cmd->refresh_specified ? cmd->refresh : 60,
diff --git a/drivers/gpu/drm/tests/drm_mode_test.c b/drivers/gpu/drm/tests/drm_mode_test.c
index 0f71519788a7..006b73a61fd4 100644
--- a/drivers/gpu/drm/tests/drm_mode_test.c
+++ b/drivers/gpu/drm/tests/drm_mode_test.c
@@ -34,6 +34,18 @@ static int drm_mode_connector_get_modes(struct drm_connector *connector)
 	if (ret)
 		return ret;
 
+	mode = drm_mode_duplicate(connector->dev, &drm_mode_480i);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_probed_add(connector, mode);
+
+	mode = drm_mode_duplicate(connector->dev, &drm_mode_576i);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_probed_add(connector, mode);
+
 	return 0;
 }
 
@@ -75,6 +87,9 @@ static int drm_mode_test_init(struct kunit *test)
 		return ret;
 	drm_connector_helper_add(&priv->connector, &drm_mode_connector_helper_funcs);
 
+	priv->connector.interlace_allowed = true;
+	priv->connector.doublescan_allowed = true;
+
 	return 0;
 }
 
@@ -115,8 +130,62 @@ static void drm_mode_res_1920_1080_60(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
 }
 
+static void drm_mode_named_ntsc(struct kunit *test)
+{
+	struct drm_mode_test_priv *priv = test->priv;
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
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(&drm_mode_480i, mode));
+}
+
+static void drm_mode_named_pal(struct kunit *test)
+{
+	struct drm_mode_test_priv *priv = test->priv;
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
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(&drm_mode_576i, mode));
+}
+
 static struct kunit_case drm_mode_tests[] = {
 	KUNIT_CASE(drm_mode_res_1920_1080_60),
+	KUNIT_CASE(drm_mode_named_ntsc),
+	KUNIT_CASE(drm_mode_named_pal),
 	{}
 };
 

-- 
b4 0.10.0-dev-49460
