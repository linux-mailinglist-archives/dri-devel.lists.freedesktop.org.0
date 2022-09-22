Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5D35E654C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0653F10EB80;
	Thu, 22 Sep 2022 14:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251E310EB74;
 Thu, 22 Sep 2022 14:27:07 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id DAEC12B05B1B;
 Thu, 22 Sep 2022 10:27:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 22 Sep 2022 10:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856823; x=
 1663864023; bh=IzHO9bnVwVVidyu/w4YB1rUhZuaEvXCFUHl4AC7n+Fo=; b=B
 C3i3Oq5XHh6sGTmFTLZuVJ0InQMtiiEaENaGeI0PKm6HVvpTL2r6Nbh8V8w6JpQB
 LIlRnLiYdAua6q07d5icbIrjeYh34LHe3iQ3L1pKk2fD0OC6Vt1Ehfxe1BZju7lC
 NObBlS3rTY2dO2zmu8v5/6bkK+smw5HAs/FnuSDK5LzcF7q1VHi/O/xJEPiv/AtU
 sJe2mpqzmAAbkGB8d4WYXPltm4Ik9M15vtXL6bUqM9S1Tbllm694/svXy/rXWbVF
 6qDHGCFnEtEEgwhtDluFXsKr+kTg59IkmOXaTevtvoYQbKL0i0m+Os4IodB8jU8F
 P4bMOCRaztcCwJ/ofCstQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856823; x=
 1663864023; bh=IzHO9bnVwVVidyu/w4YB1rUhZuaEvXCFUHl4AC7n+Fo=; b=C
 pZg4fXbDq7iQa8CuZ/MkSzXtrjbLYB2HX6b7hg8NQ1hKCs8IRblF6b5JNB/3mVrG
 ahhLUF4xkhiduhSAwuNP7gQWeE1S5hk3H/siylIIixzQq4GSj+z3x9jCi+NOIW6S
 PBdCSBijuUiSTjHrVbNDBig1roaNqveIOjNeylYtur5/9yIsWtuzWshr+8Z6/hiZ
 syN8VMq8huTjQKfyBkyEiN0PblQDuMIQXkAjitvG161QoKG/UTXJG5W1Gc2FeZks
 6hFehuN/LbyVPi5dM+eg4IlS2S2q2Lq9N6m6Jtu6yNFLTpv+V1BN+Cz2y9W5Fv52
 hjx94BlS77feYi+xIUSdw==
X-ME-Sender: <xms:t3AsYyWLWoQK7y5iBlCgRu0NT31VJZ3lz9fjpE-VropMJfZqWIxQjg>
 <xme:t3AsY-mYoldOhrsTSFA79sF6E1nFzbjeHUUrgzOhY9SckW7g360-kzmCJT74Skc7K
 MXEAlfyDbAybdywAFc>
X-ME-Received: <xmr:t3AsY2bJyGFmZtr1pnf5uub-RAVUAxaLsx-aSlcJ_bv9Xn9QQM9liFkeI60>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:t3AsY5XQWmrWQj-nq-zap7TvwBeqvMDlpmSvwCuF15HtVLF-UOhFpw>
 <xmx:t3AsY8lxsJv1em4DUL1-tkBhg85sovF6WTD5U8MmjYK_FYcsfpaKQg>
 <xmx:t3AsY-ekjYTBBJzQixwT9Q6D71LJA-PPRobGti-eWCUnmsm_TmhuyQ>
 <xmx:t3AsY4w_8RpcZS4de_-3S_KIMpALP9q_gbFjmVzMlNj_VngTIfXRG90kKoQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:27:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:30 +0200
Subject: [PATCH v2 13/33] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4323; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=jnFnz1dwyHOx+hA46erbRs5OOfPWWCBQIxlrOjFTajE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQHd31ebmdUeuvKP/1Ci0sa5la/XlApcs2wzPXXjemDv
 nb9qHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIci0jQ//CpDm86XqH5zjlnTx+1v
 rqmkq//OxA5Q239kdsyd+/bgrD/1IWnk9CnQ3fpjbUF1yqnrdiUfGa7hfq3zjcvlzSeKTrwQ8A
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

drm_connector_pick_cmdline_mode() is in charge of finding a proper
drm_display_mode from the definition we got in the video= command line
argument.

Let's add some unit tests to make sure we're not getting any regressions
there.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index bbc535cc50dd..d553e793e673 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -1237,3 +1237,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
 	return ret;
 }
 EXPORT_SYMBOL(drm_client_modeset_dpms);
+
+#ifdef CONFIG_DRM_KUNIT_TEST
+#include "tests/drm_client_modeset_test.c"
+#endif
diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
new file mode 100644
index 000000000000..46335de7bc6b
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Maxime Ripard <mripard@kernel.org>
+ */
+
+#include <kunit/test.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_probe_helper.h>
+
+#include "drm_kunit_helpers.h"
+
+struct drm_client_modeset_test_priv {
+	struct drm_device *drm;
+	struct drm_connector connector;
+};
+
+static int drm_client_modeset_connector_get_modes(struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+	int count;
+
+	count = drm_add_modes_noedid(connector, 1920, 1200);
+
+	return count;
+}
+
+static const struct drm_connector_helper_funcs drm_client_modeset_connector_helper_funcs = {
+	.get_modes = drm_client_modeset_connector_get_modes,
+};
+
+static const struct drm_connector_funcs drm_client_modeset_connector_funcs = {
+};
+
+static int drm_client_modeset_test_init(struct kunit *test)
+{
+	struct drm_client_modeset_test_priv *priv;
+	int ret;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	test->priv = priv;
+
+	priv->drm = drm_kunit_device_init("drm-client-modeset-test");
+	if (IS_ERR(priv->drm))
+		return PTR_ERR(priv->drm);
+
+	ret = drmm_connector_init(priv->drm, &priv->connector,
+				  &drm_client_modeset_connector_funcs,
+				  DRM_MODE_CONNECTOR_Unknown,
+				  NULL);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(&priv->connector, &drm_client_modeset_connector_helper_funcs);
+
+	return 0;
+}
+
+static void drm_client_modeset_test_exit(struct kunit *test)
+{
+	struct drm_client_modeset_test_priv *priv = test->priv;
+
+	drm_kunit_device_exit(priv->drm);
+}
+
+static void drm_pick_cmdline_res_1920_1080_60(struct kunit *test)
+{
+	struct drm_client_modeset_test_priv *priv = test->priv;
+	struct drm_device *drm = priv->drm;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
+	struct drm_display_mode *expected_mode, *mode;
+	const char *cmdline = "1920x1080@60";
+	int ret;
+
+	expected_mode = drm_mode_find_dmt(priv->drm, 1920, 1080, 60, false);
+	KUNIT_ASSERT_PTR_NE(test, expected_mode, NULL);
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
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
+}
+
+static struct kunit_case drm_pick_cmdline_tests[] = {
+	KUNIT_CASE(drm_pick_cmdline_res_1920_1080_60),
+	{}
+};
+
+static struct kunit_suite drm_pick_cmdline_test_suite = {
+	.name = "drm_pick_cmdline",
+	.init = drm_client_modeset_test_init,
+	.exit = drm_client_modeset_test_exit,
+	.test_cases = drm_pick_cmdline_tests
+};
+
+kunit_test_suite(drm_pick_cmdline_test_suite);
+MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
+MODULE_LICENSE("GPL");

-- 
b4 0.10.0
