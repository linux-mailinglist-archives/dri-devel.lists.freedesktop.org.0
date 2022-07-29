Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B08B5853E8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A059112EDE;
	Fri, 29 Jul 2022 16:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EC9113DDA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8CC175809A9;
 Fri, 29 Jul 2022 12:37:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 29 Jul 2022 12:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112658; x=
 1659119858; bh=dahFAJv+Ivg5IyxmwfwuTFDPDTvRXBMRnObgzXXvrWg=; b=Z
 fg6NkNZsRQfeTQsJoAUfNAxD626xC2iEE17MY1TN2qIH6z6NJdgDmA6JF8O9aq2R
 Pa308SPiaNSJSxV4WuSCn7fLiS5mIoxDS2XC4WyYaX4u9kr3KuveMt+4xVygWnIK
 SszvCcEFJvoFKJeCjP0M+YN9m2Ohv8F6fyifI7XX37mnv+jJTIZ58MA7NqYiJoIr
 qr6jdzSmQqsJPbr3d7e/nCbH6Gw0A2ekmEPFUOtJVmgB1bwl+xZxF38Ren/tz+Lw
 xBdekT8CWudOwD+6o6Fvi4Ccb0LwhFY23eLBNocnFupIb7PjgBkDp6CeTySDKhfJ
 aUMIiOV8dWDhs2BPd1EHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112658; x=
 1659119858; bh=dahFAJv+Ivg5IyxmwfwuTFDPDTvRXBMRnObgzXXvrWg=; b=C
 KR3lrZVUvLDUhnwla/a+u7i0FFfrC0hLANPndAs8KMzhoyZUUgpIvaxlatkny92b
 fhrUndSOe6oVVdSsYptFm5+RVL0RDS0BHKJtWSp7nRz2+6tvidfq8xh0XJUWKcnv
 e51WukHM87qOro2Z3vGHInhXSGi9e/K+ZurZqO7QUzuV4lWlagVPvV8Xqz78VS0p
 9twQhjMYhgjQpwKCkUvcLZuozzdrmeK5JsQG8uN/PMp3IYNZ9n+ZFR6T7fbWRnh/
 6KqSdQbGq88+br2+liOmZEFLSG7vJccUU32jQjGU5ekhJEKVmUp1yRaHVTMn023H
 ADI2IQhxyqXOUGkyDKwew==
X-ME-Sender: <xms:0gzkYg9QWhB_CvWKWxrdS4sGfwbUflpl-nWbNFouWXYpOgxO09PsbA>
 <xme:0gzkYousKzLQKK9HfiRtxrQ4H4rVsWwxCwMJpcJy-PfOx88lgjLVmfocqCR3GIhh7
 ecIX7aEpVfxMf39dLc>
X-ME-Received: <xmr:0gzkYmCxISte-1YAmdr-MXVahpjudGfbEwd0qG2cAkl-fG_GbWvs0IkFhg6ShG0pM-RVaGRfLR435chy5Cc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0gzkYgcyGKyfOCtrVXTAty-vna233LONYzyjJMTFrQ3NfYnU1TZaPg>
 <xmx:0gzkYlNb92-e-Nrrwic3QPVLprESp-D1L7NtT4-VJn9pDyD1OIiSnA>
 <xmx:0gzkYqkQyZOeBZyoJeeL4KegyXRD0T0TQjTv_xffQp4i18uLqAfhVg>
 <xmx:0gzkYofDnJu9PTfTrAfTWgpllv3Jb96MJRkyJ8Q4UdRi2_RhiMDGaQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:37:37 -0400 (EDT)
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
Subject: [PATCH v1 35/35] drm/modes: Introduce more named modes
Date: Fri, 29 Jul 2022 18:35:18 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-35-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=3448; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=J/NOksgTIJ1PfGm5WwgVwisLKziRPmxe67l1cyqSQKs=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VG6+vveZQ+efJ8meaPbNiu4rKzUz2zzdtnz3b8illuu
 3Uu8o5SFQZiDQVZMkeW64Fs7vrAotwieD5th5rAygQxh4OIUgIlEljEyTNwfKXVnx5qFO45MDLw44+
 Sx7Mebrt2dqTexxbf8YsXpySwMfwW/XBNl1u2+HCfPUSjkf6Y+Y0+KFcO63enVpkJdgSd3vgMA
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

Now that we can easily extend the named modes list, let's add a few more
analog TV modes that were used in the wild, and some unit tests to make
sure it works as intended.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 3634ac9f787d..09ed5ce7746d 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1853,7 +1853,9 @@ struct drm_named_mode {
 
 static const struct drm_named_mode drm_named_modes[] = {
 	{ "NTSC", &drm_mode_480i, DRM_MODE_TV_NORM_NTSC_M, },
+	{ "NTSC_J", &drm_mode_480i, DRM_MODE_TV_NORM_NTSC_J, },
 	{ "PAL", &drm_mode_576i, DRM_MODE_TV_NORM_PAL_B, },
+	{ "PAL_M", &drm_mode_480i, DRM_MODE_TV_NORM_PAL_M, },
 };
 
 static bool drm_mode_parse_cmdline_named_mode(const char *name,
diff --git a/drivers/gpu/drm/tests/drm_mode_test.c b/drivers/gpu/drm/tests/drm_mode_test.c
index 006b73a61fd4..991eb8ed687c 100644
--- a/drivers/gpu/drm/tests/drm_mode_test.c
+++ b/drivers/gpu/drm/tests/drm_mode_test.c
@@ -156,6 +156,32 @@ static void drm_mode_named_ntsc(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(&drm_mode_480i, mode));
 }
 
+static void drm_mode_named_ntsc_j(struct kunit *test)
+{
+	struct drm_mode_test_priv *priv = test->priv;
+	struct drm_device *drm = priv->drm;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
+	struct drm_display_mode *mode;
+	const char *cmdline = "NTSC_J";
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
 static void drm_mode_named_pal(struct kunit *test)
 {
 	struct drm_mode_test_priv *priv = test->priv;
@@ -182,10 +208,38 @@ static void drm_mode_named_pal(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(&drm_mode_576i, mode));
 }
 
+static void drm_mode_named_pal_m(struct kunit *test)
+{
+	struct drm_mode_test_priv *priv = test->priv;
+	struct drm_device *drm = priv->drm;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
+	struct drm_display_mode *mode;
+	const char *cmdline = "PAL_M";
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
 static struct kunit_case drm_mode_tests[] = {
 	KUNIT_CASE(drm_mode_res_1920_1080_60),
 	KUNIT_CASE(drm_mode_named_ntsc),
+	KUNIT_CASE(drm_mode_named_ntsc_j),
 	KUNIT_CASE(drm_mode_named_pal),
+	KUNIT_CASE(drm_mode_named_pal_m),
 	{}
 };
 

-- 
b4 0.10.0-dev-49460
