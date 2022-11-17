Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D44C62D6E2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E80010E5A1;
	Thu, 17 Nov 2022 09:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D386110E5A1;
 Thu, 17 Nov 2022 09:29:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 2392F2B069CA;
 Thu, 17 Nov 2022 04:29:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 17 Nov 2022 04:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677364; x=
 1668684564; bh=5/QdbzW/ZKnq8rI1MY86OB/8/YPMdggn1Thjj2hUWTs=; b=h
 2AFLkT5WZ/tVhvfmMe7nrRK4cL0XQbV4ELSPEg7Miw/WE6AgAUWSMqVS+2PPOVWE
 zbfAo3EROJucyfRYqUt8XYyW+cHMRdf0vRAieH7PPKUEIXIgpblmwrKgMTDB2x1w
 M5n3bribwm6Hwd4vryyxGzOmAaUrQstmlrd4upm15LgB4uQCcttLhpeB+JGgW+5m
 K7gKF0ilI4MApe1jpdDClkQy94KYYj0tJUCfWlwXCmIPJsVmWJpwkvEVXwptTiJv
 33cH5W4BmKsK8WoVSN88Tr45QFrpwlj3wZmoT9t9nzGM1xhYk5P+/E3lPqg9H1pN
 PCm0DViE0VtTC2ZEd4sWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677364; x=
 1668684564; bh=5/QdbzW/ZKnq8rI1MY86OB/8/YPMdggn1Thjj2hUWTs=; b=o
 YStR/WTm/Wn2FyS2eHZu35uorYS09Dg/sbuUfHm/Ij9kWsaOWKKKKy3Ad6y8lTV9
 +5RqBwHmmwO1nL72MPXE454klG3pqK8sYKJCSFOk/jmvWInyClOYp2kFLOPq/BWw
 WacZ/R4ah8j/7kKhYfqHXigEiO0YPcPL5xJEvLy4qiONjDaSO6NwGyqCpGPclN0z
 E8T7IRRQRo86Kl4oR7xtJA2t00TkL5k0ExvB0nfyL+QhpJkKwEANz8Yo69hpCqKf
 2Cjd4PCCn4TqaxAFRCMjIi7q+hQELgEmKZWCYFiOLiRQFxWKiqVBP/IbZoKAgxEu
 7NvvJXSPsp1toNZb1QZFA==
X-ME-Sender: <xms:9P51Y_2pSdtYqqjTkwA0cwNFgHp5JLqAv7Zv_5a9T9hnDRb-QQA6jA>
 <xme:9P51Y-HKSPCrbYrw60bVw7UqhwhzHLbI1c7vHSMfpAzIXwT0H3KRLDofVTMSIQNX2
 KNRFHF0rWp9Rov_-ac>
X-ME-Received: <xmr:9P51Y_7fENIib_Mh8DeML_7g9zBYScCUi5wqjchQ3K4jqIvkg6NX2mlHPVGmzke1GRRkvGLr6HHG4yO6xDsyOrR3_Z8CUCrW6C3vFpxn1_hhyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9P51Y03_eKGGcDh2dJL18Sb14QLuzGblyq7IDoHqH0COy4B1Oj6tpQ>
 <xmx:9P51YyGmI9P_eawi-DZsZWnfWImJbH-iGAMLy_G-8BJOlbi3byVuig>
 <xmx:9P51Y1_-wTL2-Yv3UpwXASajY1uPyHtGqt3aHITSQTk2KtsOdlmzgQ>
 <xmx:9P51Y6QTizx3XuGw8NjElAAn96Qg76kmTZYKbJiP_O__wVlX2GeGba9Qt64>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:29:24 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:28:50 +0100
Subject: [PATCH v10 07/19] drm/connector: Add a function to lookup a TV mode
 by its name
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v10-7-256dad125326@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Emma Anholt <emma@anholt.net>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=5733; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=4rLttqCsteuzsMohABnUv0c59yu64+Zs+fb17ZuZqHQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y4sOSEu6bzlt+BHZ8YF200Dnbj2Hkyxdal4n3JwxqG9
 UvYOHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIw35GhifmCoWn31icVpf7d9r6Dz
 PDqqyadyGxq4qmuP/P9BXYasfI8D1psfSex8dLwnTPtT67vTl8lo7d/a5JPr7VZo1nXjI95gAA
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

As part of the command line parsing rework coming in the next patches,
we'll need to lookup drm_connector_tv_mode values by their name, already
defined in drm_tv_mode_enum_list.

In order to avoid any code duplication, let's do a function that will
perform a lookup of a TV mode name and return its value.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v10:
- Add missing MODULE_* macros

Changes in v9:
- Switch the single invalid parameterized test to a regular test
- Switch to kunit_test_suite

Changes in v7:
- Add kunit tests
---
 drivers/gpu/drm/drm_connector.c            | 24 ++++++++++
 drivers/gpu/drm/tests/Makefile             |  1 +
 drivers/gpu/drm/tests/drm_connector_test.c | 76 ++++++++++++++++++++++++++++++
 include/drm/drm_connector.h                |  2 +
 4 files changed, 103 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 07d449736956..8d92777e57dd 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -995,6 +995,30 @@ static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
 };
 DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)
 
+/**
+ * drm_get_tv_mode_from_name - Translates a TV mode name into its enum value
+ * @name: TV Mode name we want to convert
+ * @len: Length of @name
+ *
+ * Translates @name into an enum drm_connector_tv_mode.
+ *
+ * Returns: the enum value on success, a negative errno otherwise.
+ */
+int drm_get_tv_mode_from_name(const char *name, size_t len)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(drm_tv_mode_enum_list); i++) {
+		const struct drm_prop_enum_list *item = &drm_tv_mode_enum_list[i];
+
+		if (strlen(item->name) == len && !strncmp(item->name, name, len))
+			return item->type;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(drm_get_tv_mode_from_name);
+
 static const struct drm_prop_enum_list drm_tv_select_enum_list[] = {
 	{ DRM_MODE_SUBCONNECTOR_Automatic, "Automatic" }, /* DVI-I and TV-out */
 	{ DRM_MODE_SUBCONNECTOR_Composite, "Composite" }, /* TV-out */
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index b22ac96fdd65..c7903c112c65 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -3,6 +3,7 @@
 obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_buddy_test.o \
 	drm_cmdline_parser_test.o \
+	drm_connector_test.o \
 	drm_damage_helper_test.o \
 	drm_dp_mst_helper_test.o \
 	drm_format_helper_test.o \
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
new file mode 100644
index 000000000000..c66aa2dc8d9d
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kunit test for drm_modes functions
+ */
+
+#include <drm/drm_connector.h>
+
+#include <kunit/test.h>
+
+struct drm_get_tv_mode_from_name_test {
+	const char *name;
+	enum drm_connector_tv_mode expected_mode;
+};
+
+#define TV_MODE_NAME(_name, _mode)		\
+	{					\
+		.name = _name,			\
+		.expected_mode = _mode,		\
+	}
+
+static void drm_test_get_tv_mode_from_name_valid(struct kunit *test)
+{
+	const struct drm_get_tv_mode_from_name_test *params = test->param_value;
+
+	KUNIT_EXPECT_EQ(test,
+			drm_get_tv_mode_from_name(params->name, strlen(params->name)),
+			params->expected_mode);
+}
+
+static const
+struct drm_get_tv_mode_from_name_test drm_get_tv_mode_from_name_valid_tests[] = {
+	TV_MODE_NAME("NTSC", DRM_MODE_TV_MODE_NTSC),
+	TV_MODE_NAME("NTSC-443", DRM_MODE_TV_MODE_NTSC_443),
+	TV_MODE_NAME("NTSC-J", DRM_MODE_TV_MODE_NTSC_J),
+	TV_MODE_NAME("PAL", DRM_MODE_TV_MODE_PAL),
+	TV_MODE_NAME("PAL-M", DRM_MODE_TV_MODE_PAL_M),
+	TV_MODE_NAME("PAL-N", DRM_MODE_TV_MODE_PAL_N),
+	TV_MODE_NAME("SECAM", DRM_MODE_TV_MODE_SECAM),
+};
+
+static void
+drm_get_tv_mode_from_name_valid_desc(const struct drm_get_tv_mode_from_name_test *t,
+				     char *desc)
+{
+	sprintf(desc, "%s", t->name);
+}
+
+KUNIT_ARRAY_PARAM(drm_get_tv_mode_from_name_valid,
+		  drm_get_tv_mode_from_name_valid_tests,
+		  drm_get_tv_mode_from_name_valid_desc);
+
+static void drm_test_get_tv_mode_from_name_truncated(struct kunit *test)
+{
+	const char *name = "NTS";
+	int ret;
+
+	ret = drm_get_tv_mode_from_name(name, strlen(name));
+	KUNIT_EXPECT_LT(test, ret, 0);
+};
+
+static struct kunit_case drm_get_tv_mode_from_name_tests[] = {
+	KUNIT_CASE_PARAM(drm_test_get_tv_mode_from_name_valid,
+			 drm_get_tv_mode_from_name_valid_gen_params),
+	KUNIT_CASE(drm_test_get_tv_mode_from_name_truncated),
+	{ }
+};
+
+static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
+	.name = "drm_get_tv_mode_from_name",
+	.test_cases = drm_get_tv_mode_from_name_tests,
+};
+
+kunit_test_suite(drm_get_tv_mode_from_name_test_suite);
+
+MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
+MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4927dcb2573f..c856f4871697 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1872,6 +1872,8 @@ const char *drm_get_dp_subconnector_name(int val);
 const char *drm_get_content_protection_name(int val);
 const char *drm_get_hdcp_content_type_name(int val);
 
+int drm_get_tv_mode_from_name(const char *name, size_t len);
+
 int drm_mode_create_dvi_i_properties(struct drm_device *dev);
 void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector);
 

-- 
b4 0.11.0-dev-99e3a
