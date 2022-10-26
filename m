Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E2260E4BB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D182810E538;
	Wed, 26 Oct 2022 15:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA12710E50B;
 Wed, 26 Oct 2022 15:34:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4713658041C;
 Wed, 26 Oct 2022 11:34:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 26 Oct 2022 11:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798443; x=
 1666805643; bh=OqNU3bhhhOFvh7e37SVrHqlI4ZWrKV5djb7SoyQugOs=; b=R
 oXQ4O96Npn+nFgFcqwyDqKfvCUq8/ctn06uFYrWphyzj7w/+PRQaQ37/6R1hSHqz
 h2h1mJB+60g2UT74MI2hXmjoQZg1TXuqDgofGViMWgSdoC0SnAif4sWxeY05IGIC
 TLgk4mY3d54u+TN138WkI3VZ6DvMdHEOIWZlEhvolK2Lcb4GZSrJSJssYA2JyxQS
 eOKyNjU3All/xfRhAqjdP/Zc6z2r9lzsAXYsEvqqBwoMtEBNG8Qn6xbsc+HAgQ4d
 ePY4ToUsZMt6Q+VjeDQpXv2gYoEyJ1D2qT3cuum5lyMQHyt/D0WmdgPJtOBE46uE
 uOh7bHyFwzyDQTykPunlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798443; x=
 1666805643; bh=OqNU3bhhhOFvh7e37SVrHqlI4ZWrKV5djb7SoyQugOs=; b=e
 uIpNhBQ4wpinRS7NORSrLBWg+2I/Q6bDbScJnJdkk09gLFheDVpX2JsODqXqyA+b
 azl8GIoiIo5bUuoyTMXAqPdctS3paS7JkqL/kX/G2JWBy0HlvTU+kef+ObuPznYX
 IkhT/CXfK+Ggb5n2JgPN4jeRBGrkMP5CKiyc6yqbSmYEpAtTZX33DypRHh8COz5e
 M/XIPOavXX5noA/2n+0/NH3vYV8JxJcwqqQVKoLRK8b+UUbj2vCyV02spUgxso4Z
 l8rjBZeQmcWL2hYR2c/EXnB4eyheXykyR0linu5lQkb3V171p/mjkx+/LjpruaJg
 7eFMFnan9YNQFlmaDzQFw==
X-ME-Sender: <xms:a1NZY3EWr97R9D9dGvIKqZe33tRwVqtWj5P-CIdXHDHmthXUwNA0WA>
 <xme:a1NZY0Uw2BRttQYZ_3mNysv7XXKutmQlR4kqKEHa5_x5m9hy90wRFowJQ-uc40kXG
 S_XxbrWJbnGwdd-Vf4>
X-ME-Received: <xmr:a1NZY5LjZmguoP1NiBA4bz10b6vwToW9q-2SR7lVBpTozG1hZhjY65u4hUdNgLJSaoBSQCVlirX4B0Eauvj8JRKwAf-sYWv8DeEJN6faKDqRUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeefudfhgeevhefhfedtue
 evueeluddutdetuddtvddvgeekheelvefhteekteeihfenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:a1NZY1F9v4_ZERP5KRoG_g92wYWd6TZC7mHImq6VmJk1DxN1s86UVQ>
 <xmx:a1NZY9XlDkBJ8rzN34bV7cHhgyMeXrDAOWMHK1_Z0o3zSU3gWVE5sA>
 <xmx:a1NZYwPWF8DUITZIrPt66SE4e_-W5hziSWRWCQeKIgD8muiTrKqA3g>
 <xmx:a1NZY3g2jmlBNeANUH4Slc5qbE53X0jrgXOZml9t0HP8r6Rhwh3Cgg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:34:02 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:34 +0200
Subject: [PATCH v6 15/23] drm/modes: Introduce more named modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v6-15-e7792734108f@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
 Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=4158; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=RmLcAO13VzLiwWzsxFsEOu0GAvNh3Ne+UcNWCu58sLk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwW53zA95hnYuW/OE90z+hdLNLDK17y5F2uVYbF/wRvV5
 Fkd9RykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYy9TEjQ9t8qecrZ3sXRC+qXf5s26
 FvH3R+aPMYl+1S3X5p78bIAzMY/udw8Djv95q2R03+7qO77h+2vlRZ4nDz+pFDv+/KpOzkesUNAA==
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

Now that we can easily extend the named modes list, let's add a few more
analog TV modes that were used in the wild, and some unit tests to make
sure it works as intended.

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
index 85aa9898c229..530516a166bc 100644
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
index fdfe9e20702e..b3820d25beca 100644
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
