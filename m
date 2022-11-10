Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1D36240CD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2D310E6E5;
	Thu, 10 Nov 2022 11:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA5910E6D5;
 Thu, 10 Nov 2022 11:07:34 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6F6FF580304;
 Thu, 10 Nov 2022 06:07:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Nov 2022 06:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078453; x=
 1668085653; bh=JFH60TjLhF4X2cG8BsEbpMtUQgyvSuOsjoB880SrFRc=; b=V
 Bf1fhEeXj7Ne9d7eugUCqsa+xVCB2taWzEo+9I9PuCWAYMIhXzWULg43XPgCtEi7
 ZNX2BC36IkrlLryqBYzl66joDuXwtyMcMsI/sYw7am1VOh4tZUHa4SGsqSSEAxt5
 CfCVBAepIpXSFE1rQWyEuIblrPZSIMBnujckJi5OoUfeCSi2Ipb+rqf9yHYaiAoU
 D1PQ1f7xQsTtlm4JIT27btufwgV3IPECftcLm4D3Uf1ntYoJLylseSrl5wopi4wy
 f88J37+EZGEFeWMYZ2DYh2YFmoNegogwDteEOefkBHlLHSdibpAtmO4R67f0daa6
 870mLf7nhgUxOYqsMt9+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078453; x=
 1668085653; bh=JFH60TjLhF4X2cG8BsEbpMtUQgyvSuOsjoB880SrFRc=; b=E
 heqtUJybT8TCMa1+6gx+ca1LjdFlO5Je1rNxok5Eue6PuAHHCtVI4gpm4gvZzBVg
 /R8FxYj5LzZ03871fXy2A8dZvQGcECLlIjDSsfGym3ivJHDsShxKhdr6JBxucmgS
 R6omtFj2+GNZIBb5zqeOGWsKF/ZrkESKP9KKMVSu518eifh4gdM9kLwtQynj2azL
 cAfmoTN5MiYLY+WasVBMVrxMF7ny6oKcgTIu+KycqKAiavVPddPjcrXq3u0S8t67
 qxN4JRRQB3766/aVyx1nejCGTe858WhKS1QCtgfdwirzbkMzWLdiWTinxVQB9Bkp
 mdL4qhezRajvqv85GFAqA==
X-ME-Sender: <xms:ddtsY9UbWRael7ma7r37HHtIp-o1Zb84jJPN5PVcL0Yg2ROBa5jDUA>
 <xme:ddtsY9lTRDlexq7VOiB9hzTxDjhSNOYaP-K0tla--JpFdJurCNaWmsXtfP9_YykEn
 sj0gTUWXvrzEqFq4PQ>
X-ME-Received: <xmr:ddtsY5YB2TZfZZiglUzjrz-1b2sJ4NhmEABXe-5M1w0VhVRLvV4adpGyK62kyLzyAT8Oo5kIf8ekB015KqYgrA6GZx0btky34sG1H4KR6gz0hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ddtsYwXd_SAAeOLOB7TSClZavRFiigTojor583khaUgAYlz8fbzQHg>
 <xmx:ddtsY3ldiXNrHd8ro0_B57MMaOsKSJCHJZFFbfDEP_d2ItZXur0NFA>
 <xmx:ddtsY9ce6jW2gp3uPPsmk7z76iBlDoL--EJV76vDke3rdlwrVRAwAA>
 <xmx:ddtsY7wiNB-WdzN9gCTHVGk1EAGSO14CujdRnGqIRUCq0vyWS_2iKg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:32 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:19 +0100
Subject: [PATCH v8 07/24] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-7-09ce1466967c@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4676; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=yVx2uVA5vIWOQWcegjDOinr/nkkAcg+x4eleT1mV5LI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1M0zsQXHfgR8+aS2nvvtVntvoectvtNueKytqIv9NXp
 A4EiHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIs10M/52D9llny30p7Ky+tO3gUf
 l91lM4G9atZX/J+c/n0haOwmSG/66f2KQTV+1m7Am1Uk59tmxpe8gMy98Lu/9XyM443s5ZzggA
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

drm_connector_pick_cmdline_mode() is in charge of finding a proper
drm_display_mode from the definition we got in the video= command line
argument.

Let's add some unit tests to make sure we're not getting any regressions
there.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v6:
- Rename tests to be consistent with DRM tests naming convention

Changes in v5:
- Removed useless (for now) count and modes intermediate variables in
  get_modes
- Switched to kunit assertions in test init, and to KUNIT_ASSERT_NOT_NULL
  instead of KUNIT_ASSERT_PTR_NE(..., NULL)

Changes in v4:
- Removed MODULE macros
---
 drivers/gpu/drm/drm_client_modeset.c            |   4 +
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 100 ++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

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
index 000000000000..558c098b0384
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -0,0 +1,100 @@
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
+	return drm_add_modes_noedid(connector, 1920, 1200);
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
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	test->priv = priv;
+
+	priv->drm = drm_kunit_device_init(test, DRIVER_MODESET, "drm-client-modeset-test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
+
+	ret = drmm_connector_init(priv->drm, &priv->connector,
+				  &drm_client_modeset_connector_funcs,
+				  DRM_MODE_CONNECTOR_Unknown,
+				  NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_connector_helper_add(&priv->connector, &drm_client_modeset_connector_helper_funcs);
+
+	return 0;
+
+}
+
+static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
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
+	KUNIT_ASSERT_NOT_NULL(test, expected_mode);
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
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
+}
+
+
+static struct kunit_case drm_test_pick_cmdline_tests[] = {
+	KUNIT_CASE(drm_test_pick_cmdline_res_1920_1080_60),
+	{}
+};
+
+static struct kunit_suite drm_test_pick_cmdline_test_suite = {
+	.name = "drm_test_pick_cmdline",
+	.init = drm_client_modeset_test_init,
+	.test_cases = drm_test_pick_cmdline_tests
+};
+
+kunit_test_suite(drm_test_pick_cmdline_test_suite);

-- 
b4 0.11.0-dev-99e3a
