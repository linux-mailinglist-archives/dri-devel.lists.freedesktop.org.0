Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE1D6240ED
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5E010E706;
	Thu, 10 Nov 2022 11:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D312D10E6F0;
 Thu, 10 Nov 2022 11:07:50 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 40695580281;
 Thu, 10 Nov 2022 06:07:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Nov 2022 06:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078470; x=
 1668085670; bh=xM3k1aAOwAz7W8X71G2+Lsy9mM7hwTzehMg7Xgtbo0s=; b=X
 rCdBaJzI/7n/F0xpLfGAZfW/VJkmGnI1k9L/YtMiGjrFbcmsv3XZGo9SB14PkZg0
 +exOUfM03TJRxjjXeXlAsmxeEerczTWei7giE1SlMxJ8lVeXFQ0pfkwKgt69VTVY
 YI566xQ5OJ+c7yvSotf0EhuQfROhGQpKrJ29WRZzk5TD/Bv4BlxHkjgNdZmbvw+E
 y2ZAhkUPtU6JdeCurSN9rD/WMS1z5wAmc2Wu6OmBi1qNT3D7BMx6A90ZEXjon2aG
 1zY6QEein5hYKrVeHwp/UyqrhOk7zUhYIx7ppzf64dh31znSAcuZ8av9lCfkymx7
 qCqfLffkRm5n/9+RKWsvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078470; x=
 1668085670; bh=xM3k1aAOwAz7W8X71G2+Lsy9mM7hwTzehMg7Xgtbo0s=; b=U
 R2zVHmhpprQLJhlkE0an56Z6nC4Fv33BoonY+pbfPttfQlu1CAMUJY9J1APZ7gOH
 M0znbKpkNg+mYDLnxIUz+vwNAJnOTM1f7rsAzVW12kkfyOS+rwnlyw+I/hI0nc1m
 5Ck+5CB5rLF093wx/ut+uwLjQ9WW1EQr+8UVSsrICczmIi0CKmf2JSsGc1IlP2Jp
 zcCkf+wCdReThZq5/ToPgQN/Fn64MOb5XwGvrdXZ9SOdzjU8No64wF9+d6eyc9jz
 dZev4E/4vLbVrNa0nLWjt29zP5V6enECw8IDa2WyyzhcSqRut4Yj66Ps+soDluvx
 RINIZq5GmBlUJSb07XWCw==
X-ME-Sender: <xms:httsY21gAcPISrmjnHTCrxS7mBd0vBC0Sc81uwNq1BYlxyzsI0T7jg>
 <xme:httsY5EYqvbyJAuY2BdTywZjOxnfvwpb4-TqBfBClQupWfC4geaQ10KwIpJuOpIuO
 NIsB8-Xi7wjd2L7wBc>
X-ME-Received: <xmr:httsY-4TizN6_5Vr_SbRqPAWGeE0vGt6ietsfqOGEDl3yFo0_aySE5lvv_jpbut7-73CLu10nW6DXbHHhfzP-wVmvaJSXQ9kzQSe9sfGAsG_Lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:httsY328au4kK1c8_ln1bTIkoip_yVCbGn34OHlKyFCKbDqu3mfvhQ>
 <xmx:httsY5FTSs6sTHwUp-Ai9X1Wz1XpCewjG2oFGacdkirkLIpgKXKwKg>
 <xmx:httsYw93TOWuOrxCCaHHOk0VQoS1aMvUBn1HCgyhYy46pTXAI6Ch2A>
 <xmx:httsY5TOWrwryG3M9mE7vcdtMc2XSfdKjXxRmrO21hMyNZAoLKMKWA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:28 +0100
Subject: [PATCH v8 16/24] drm/modes: Introduce more named modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v8-16-09ce1466967c@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=4220; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=NXNOi6GYPeZsFumdVkcsH6WtQtULuurj3RE4ELYlhQ4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1NXvLlfvS1BKipNh/uuqsOKnjUXfrYflUpZvWPB8kmO
 kzdrdJSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiOgYM/4s2cpjZ3vHZx+SwpMpF7Z
 6g1boow049FVlrRt7yoPfObxj+h+88s36mtrp06xbBNwr77x7ofvdT/NDB4JRLC9x9Hr7rZwcA
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we can easily extend the named modes list, let's add a few more
analog TV modes that were used in the wild, and some unit tests to make
sure it works as intended.

Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v6:
- Renamed the tests to follow DRM test naming convention

Changes in v5:
- Switched to KUNIT_ASSERT_NOT_NULL
---
 drivers/gpu/drm/drm_modes.c                     |  2 +
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 54 +++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index d3f0a3559812..855569a269b8 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2272,7 +2272,9 @@ struct drm_named_mode {
 
 static const struct drm_named_mode drm_named_modes[] = {
 	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC),
+	NAMED_MODE("NTSC-J", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC_J),
 	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL),
+	NAMED_MODE("PAL-M", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL_M),
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 768e8efb2f52..cf38e7cf0f08 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -133,6 +133,32 @@ static void drm_test_pick_cmdline_named_ntsc(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mode));
 }
 
+static void drm_test_pick_cmdline_named_ntsc_j(struct kunit *test)
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
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mode));
+}
+
 static void drm_test_pick_cmdline_named_pal(struct kunit *test)
 {
 	struct drm_client_modeset_test_priv *priv = test->priv;
@@ -159,10 +185,38 @@ static void drm_test_pick_cmdline_named_pal(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_pal_576i(drm), mode));
 }
 
+static void drm_test_pick_cmdline_named_pal_m(struct kunit *test)
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
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mode));
+}
+
 static struct kunit_case drm_test_pick_cmdline_tests[] = {
 	KUNIT_CASE(drm_test_pick_cmdline_res_1920_1080_60),
 	KUNIT_CASE(drm_test_pick_cmdline_named_ntsc),
+	KUNIT_CASE(drm_test_pick_cmdline_named_ntsc_j),
 	KUNIT_CASE(drm_test_pick_cmdline_named_pal),
+	KUNIT_CASE(drm_test_pick_cmdline_named_pal_m),
 	{}
 };
 

-- 
b4 0.11.0-dev-99e3a
