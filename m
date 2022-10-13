Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6812C5FDA94
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61FF10E8C4;
	Thu, 13 Oct 2022 13:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2DD10E8D2;
 Thu, 13 Oct 2022 13:19:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9D921580361;
 Thu, 13 Oct 2022 09:19:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 13 Oct 2022 09:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667175; x=
 1665674375; bh=lBChX1sglbfCBZS9fiy6K0hS0cKhgN/D1uia1eSOAcU=; b=W
 asDbpgTr+Y7F4rrVYWoo/6b5M0IH4TsJY9a4BH9QfkfXZf/j/OKT86mGaEfHC7lS
 XPmFvU9rmMBRaX3Bw+ETkqHaustFS2OWc3G3J9y9xgxuGjdPImrmwKimrqfhS5zt
 1XZDTnpLoMtnFnpVP4xxqBDfqrHl2WtY8AzQjsP+dXl0eCXfKSPjWUNplwUzzYOL
 oRi/SngQ+91AOan0zKAaVhgc0E4rfUJJf4dxlwz66vSPIMi63OLtsudSk8QAwlNU
 26Ehzgz9flW3DV6qr75cdRB3s8DStqNaADB4LLgqTKYkdNLAFMvPz4/1jXYvaNuv
 wL1YufRU1Gd7RPYMfgOGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667175; x=
 1665674375; bh=lBChX1sglbfCBZS9fiy6K0hS0cKhgN/D1uia1eSOAcU=; b=A
 qYitip9evZvikd0FpZElbd14zAfYppiw7eAdvDlpAix09278bAnEaMO6ShN48MiE
 lu9nyNZ4Dvq2uD8tG4QW20D9NcihlM8zG5YBOw8qofu1V8lFatW6QEYz83zp/iNc
 dIbh8bbY0/k697ZcYgQ8nIxcsnjDYRORxFegaCa1+yB9iOZX8a/AqhWJ8oLb0XpO
 GTJ0TWBPKVddzvQ6+anbuKaA4X3d63+FeUy9HFSk04ucv1ll9KKz5+Rgxt9ACkQg
 hF+UOLC1PtChQdJpnS+0lsR64AHDDN7qROWim4aBkHYqhwBMRXcQ2b2zwoAma4Wk
 eXWvmMvrSCPmWWbHXd6rQ==
X-ME-Sender: <xms:ZxBIYyZAJ0FjhkG4ekxwBXfU-cg4SKy6gwtyBs8jOiGBkXFeGw-vuQ>
 <xme:ZxBIY1aQVmBDEr7PDXbiNYzgvi0Euh1sEj5JkOpceXhRvOs8NivyzyNfwTQnUbxd_
 KOItRp-Enoz9S01VGM>
X-ME-Received: <xmr:ZxBIY88QMWXO3HzGZQmryNpJdIHko3Ee7gf3Tn9FCH_z5NRbes-Cz9YFW8VVtAaflSSP2Jo2KKLnrTSHL6sLblNoQeiV-YwUuWR5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZxBIY0qOtXAuDmDHgTmA0e_FAAP5mFLhDnSvORiK5LqOk3ibL_RwPg>
 <xmx:ZxBIY9rVn6_IyJIYEU4ZDcErR1ipXnc8osmU_puIC68cBXsSYlhgHw>
 <xmx:ZxBIYySGDhMuTvUv7lhXVt3LVo896vJgzc7oKV4TvWZRIufIPzFD7w>
 <xmx:ZxBIYwXlbEv1jv6WKqRd5R7R_5Ny47e-fPToHoA73m70kSEu9KqPIg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:18:59 +0200
Subject: [PATCH v5 15/22] drm/modes: Introduce more named modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v5-15-d841cc64fe4b@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4027; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=V0w7GIVCFp0z4MXVYZQnLk2/hiW8TVtjMHAhNcQlNdQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAm7LOObN8l81z9+wkO3kxvVzeY8aRLgURFz4o5fB0Cda
 Gve/o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPJYWL476d4LmvJ9Ak+6nkhKVu33I
 nhXCZr6LghY1JBqkeoqolIESPDnJ3W+ZfPB3U0JWhdjvAompPRe33D/Snl+ifuuhttmXSHAQA=
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
Changes in v5:
- Switched to KUNIT_ASSERT_NOT_NULL
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
index d5370d5ac1ec..fdb0eeb8a669 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -133,6 +133,32 @@ static void drm_pick_cmdline_named_ntsc(struct kunit *test)
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
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mode));
+}
+
 static void drm_pick_cmdline_named_pal(struct kunit *test)
 {
 	struct drm_client_modeset_test_priv *priv = test->priv;
@@ -159,10 +185,38 @@ static void drm_pick_cmdline_named_pal(struct kunit *test)
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
+	KUNIT_ASSERT_NOT_NULL(test, mode);
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
