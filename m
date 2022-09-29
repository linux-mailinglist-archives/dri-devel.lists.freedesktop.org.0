Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF775EFADD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F81010EAE6;
	Thu, 29 Sep 2022 16:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5733C10EAF4;
 Thu, 29 Sep 2022 16:32:04 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id B9ACD580804;
 Thu, 29 Sep 2022 12:32:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 29 Sep 2022 12:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469123; x=
 1664476323; bh=w5FKZOoG3DGcf83BTmJWmfctQAdvHX9rGkuqVNVd/Dw=; b=2
 cbuEkL9OWCNvmSmaPKNNZIcq3c9SzFl+QWfyAAl3EJ9DEZKHCXWFdHk4z8Qb8JnV
 nakkXr3gRZ9FPrrj3u6c4HxaugZ1lboLulXb+mxzdG16r8MizQWTWbC11lx7Y/uZ
 G9XkY3ltpsqQThFmrAe/Wz8zgY5ygAdu1zUjdRvznZk7fON31hsvdq5/Q6N39Pbc
 thsxf45I7tS0+KmoFom8rCBj7PsuHsEzHB9GCgIcLvh+8HWVMikn/M3+jfRoaETo
 YxzbPMacFr5Ur74ftDmkf1nJ19WgWvMUayUgtTHqoYzNx8gxEwKhGifb9BIxAkvi
 1ucOj+lHSzXy58nTRAWsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469123; x=
 1664476323; bh=w5FKZOoG3DGcf83BTmJWmfctQAdvHX9rGkuqVNVd/Dw=; b=H
 G80+aepRJDFXjgSr+SKNBlJJBsQCA2AvtEW6Hem8JUAqrPprgnbBhLAjlg+HmlMp
 NHeLfje1XT8XVT/V2Ku0kYYFL2aiaSJZ1SOsOzGGvMNurWfSUlXRVu6gN0NS7QqS
 Zpi9tHIv3zU6vX61a2b84xwHiJMPwd94Bt785L7u886TXO6Us5t6kyQOR1OFbibM
 lFVxr7vbjZerYlKnxiKsSh1lwI/mzTlHR1hR0LPbIE5/41M6+3dDcqY3H41JXZ0g
 pmZO5N5C9L0NrRBqDsuQoea6ipqeg0XpxK3YwrXivyk2So/1zP9YYC1OpeF0H/E/
 G/Ao/zL4qQqqEWBiuJ/nQ==
X-ME-Sender: <xms:g8g1YyYe8wl4zqoZJOGP0Qku4VKZPv4lqRM1drzgSH9PBMnRa_mODw>
 <xme:g8g1Y1YWmLBorulR_IVYYBiZqtV7Z4ujJMGd_kpbOVNS2ID-qb00bZQKFl9LpsQGs
 vNB5XeJtCqTFmY8ets>
X-ME-Received: <xmr:g8g1Y88ee_cirxtDGfNhadoVcBNeBzC7r2STrwsc-LR8_J9kXE_ETylJLAFG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveet
 hfejledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:g8g1Y0qE0SqP62oOaBW_fl7sdQ7HOeCKA1_5zEHUhIRZzQ2BlUg5Sg>
 <xmx:g8g1Y9qTi9TPnmEx-eIXP1UOA71cwhgdeyacpcs06I0pZgCBiA5xhw>
 <xmx:g8g1YyRsIsCOY8js7FlsIRLHxVmF_bcGox8oAyAdwnsFb93kn0DIiA>
 <xmx:g8g1YwXTmIzJXcCIPZPmj2WyVAfXYEN8_Voanz62Fi8H2D7xLilRYQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:32:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:16 +0200
Subject: [PATCH v4 22/30] drm/modes: Introduce more named modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v4-22-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=3975; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=9UFuWqlOrzSUauF2x1tlPSk9VRO6HycHyTL4z+00yzA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9x5GtSqP1gUNXmnX9cK9vM9Me3Wh5yzahdvRL3aW8e1
 IuZDRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTAG6yPMM/xdCsWyHlrik8KsL6h/aZXR
 d+0bQxo9U7O++dje4e1tccDP8ULjDoOyv8+N9YwLlvp02rCnNeTcs03gPuRYcv3tfve80FAA==
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

Now that we can easily extend the named modes list, let's add a few more
analog TV modes that were used in the wild, and some unit tests to make
sure it works as intended.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_modes.c                     |  2 +
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 54 +++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index fe818252cd8f..e3307662d6da 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2271,7 +2271,9 @@ struct drm_named_mode {
 
 static const struct drm_named_mode drm_named_modes[] = {
 	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC),
+	NAMED_MODE("NTSC-J", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC_J),
 	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL),
+	NAMED_MODE("PAL-M", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL_M),
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index b59029b49201..b72433a0216a 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -134,6 +134,32 @@ static void drm_pick_cmdline_named_ntsc(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mode));
 }
 
+static void drm_pick_cmdline_named_ntsc_j(struct kunit *test)
+{
+	struct drm_client_modeset_test_priv *priv = test->priv;
+	struct drm_device *drm = priv->drm;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
+	struct drm_display_mode *mode;
+	const char *cmdline = "NTSC-J";
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
 static void drm_pick_cmdline_named_pal(struct kunit *test)
 {
 	struct drm_client_modeset_test_priv *priv = test->priv;
@@ -160,10 +186,38 @@ static void drm_pick_cmdline_named_pal(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_pal_576i(drm), mode));
 }
 
+static void drm_pick_cmdline_named_pal_m(struct kunit *test)
+{
+	struct drm_client_modeset_test_priv *priv = test->priv;
+	struct drm_device *drm = priv->drm;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
+	struct drm_display_mode *mode;
+	const char *cmdline = "PAL-M";
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
 static struct kunit_case drm_pick_cmdline_tests[] = {
 	KUNIT_CASE(drm_pick_cmdline_res_1920_1080_60),
 	KUNIT_CASE(drm_pick_cmdline_named_ntsc),
+	KUNIT_CASE(drm_pick_cmdline_named_ntsc_j),
 	KUNIT_CASE(drm_pick_cmdline_named_pal),
+	KUNIT_CASE(drm_pick_cmdline_named_pal_m),
 	{}
 };
 

-- 
b4 0.11.0-dev-7da52
