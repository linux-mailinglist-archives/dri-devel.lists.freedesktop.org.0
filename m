Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BDD61F57B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2BE10E349;
	Mon,  7 Nov 2022 14:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A699010E33C;
 Mon,  7 Nov 2022 14:17:38 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id E9C6B2B05E60;
 Mon,  7 Nov 2022 09:17:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 07 Nov 2022 09:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830655; x=
 1667837855; bh=P1KWsASnYvTi2I1+CBGAVsqir1G/tMqeUHWEZ+PSqHs=; b=h
 S2xCfU/fygdElNNHroTorMWajd0Le0Umyz3+94zhUQuipmxHUsQt3zShZ2hXLbaQ
 pcISmCuzlWNNvtrPGlVJUPa6ePs5sZjq2sPOoaaAJdSjysYoeA8exVMidX5pVSEZ
 GD/42ev4Qj2UYYq2dzZdrK5eb74+CpT5hmqNZEB194aZexeJ8+9DeV3kI03E/xx9
 E9oXx1i/e0GjQrhjxu5ZtakNAMvqoGFzwG5QxRZaiSAjwfhmtD1dzgzNO7EY9kFU
 2IL1lGYrZuQnv+wi/XRJA8itjku5m0etEGWpG4W78WJeLSIMOfGzzQNCcrJjhhGm
 hXK1Qz3fy4ITROH9Mbh3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830655; x=
 1667837855; bh=P1KWsASnYvTi2I1+CBGAVsqir1G/tMqeUHWEZ+PSqHs=; b=p
 VkqTLgAIlTvk8WPNyUDZRKe/9M1XgCxsboBvelMsktSDWRe5u2r33eP7Nyc2EJNW
 slmPpPS1BjP4ecXDTpoqV3NPf97LoB+05Rg7QHjvXYsXTkGM8FTipJPAgKFtz8UL
 GTCl6IUWyWGQGyqNjadFgGGLCiE8HSr73rdmAEKXmsaoHAl8jGAa8Dsqhw0e6vx6
 gLukdyr1jB9M6yH1jmIJLsRV5gojDpkEH4VL/nCrUUzeKKHLaoVGaHOrdgjm01wI
 gDgQ6ghsvCj2+5I254snhcwQWOREtK1Rc7aUPmiIotg9eDgxZC1k1V/NO0bpB1U2
 msDpqMAykaEQUCSUuDcsQ==
X-ME-Sender: <xms:fxNpY0iX-AAM0e0mzRmiejkozFX7PwcvlulZG_-l85Pc8GXkPMMu_w>
 <xme:fxNpY9A1GfDdEqE2t6Nun-_3Tu8D5wJiQJ-Q6Ev8PS4wYUhXBsgVExg9En2-RyTp-
 DnOwGYgyjFhhPoyNS0>
X-ME-Received: <xmr:fxNpY8EhNdTGxkijNkpHZTljbDckuaUutRVMglDVbaj3aQmY1CDzanEtxIl8F-2GHsevv0rv6ESJVY7sJxltcRv1sEJXWuGUGVYONrZXOZfhXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fxNpY1QxwtdnkllYowbf4hLTFU_W412cKeeGSE7AjshEtFQhn-2lMA>
 <xmx:fxNpYxw9tOMPnjevXQh3W4Q8p_7FZYUaH4ucvNNvY-kE-0IiGFlViw>
 <xmx:fxNpYz7JWwHeIBHlwLherVkP9-3SCD6_E2m6IckovzoSDMA2tvWtVg>
 <xmx:fxNpYxdETs3afHJVhT5ACC5lc1_hEOZFKZp4KA8dJX56Sed4k1o0Hxz3R6g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:17:34 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:38 +0100
Subject: [PATCH v7 12/23] drm/connector: Add a function to lookup a TV mode by
 its name
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v7-12-7072a478c6b3@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=5877; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=OibD9L+0N3v79XwK5wYQ+LNcQ4mtLEndDfkBHXvN8N8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwg6iPVHPz4rP7rxQt/eu7/OI3zfyjuSUmVRfeHGFUTuJ
 cfPcjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkQSQjw0dR/Y4VfBMFFNMmiv26du
 LppCyrnfq/JDe8bw9jbZ7wLpaRYUeJEu//X7OW5kn4pZy9mVLq5bdIJ6H40YKdBwr1nQ/GsQEA
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

As part of the command line parsing rework coming in the next patches,
we'll need to lookup drm_connector_tv_mode values by their name, already
defined in drm_tv_mode_enum_list.

In order to avoid any code duplication, let's do a function that will
perform a lookup of a TV mode name and return its value.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v7:
- Add kunit tests
---
 drivers/gpu/drm/drm_connector.c            | 24 ++++++++
 drivers/gpu/drm/tests/Makefile             |  1 +
 drivers/gpu/drm/tests/drm_connector_test.c | 90 ++++++++++++++++++++++++++++++
 include/drm/drm_connector.h                |  2 +
 4 files changed, 117 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f9a6cb792bda..9aec878c8509 100644
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
index 000000000000..f2272b9df211
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -0,0 +1,90 @@
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
+KUNIT_ARRAY_PARAM(drm_get_tv_mode_from_name_valid,
+		  drm_get_tv_mode_from_name_valid_tests,
+		  drm_get_tv_mode_from_name_valid_desc);
+
+static void drm_test_get_tv_mode_from_name_invalid(struct kunit *test)
+{
+	const char *name = *(const char **)test->param_value;
+
+	KUNIT_EXPECT_LT(test,
+			drm_get_tv_mode_from_name(name, strlen(name)),
+			0);
+}
+
+static const
+char *drm_get_tv_mode_from_name_invalid_tests[] = {
+	/* Truncated */
+	"NTS",
+};
+
+static void
+drm_get_tv_mode_from_name_invalid_desc(const char **name, char *desc)
+{
+	sprintf(desc, "%s", *name);
+}
+KUNIT_ARRAY_PARAM(drm_get_tv_mode_from_name_invalid,
+		  drm_get_tv_mode_from_name_invalid_tests,
+		  drm_get_tv_mode_from_name_invalid_desc);
+
+static struct kunit_case drm_get_tv_mode_from_name_tests[] = {
+	KUNIT_CASE_PARAM(drm_test_get_tv_mode_from_name_valid,
+			 drm_get_tv_mode_from_name_valid_gen_params),
+	KUNIT_CASE_PARAM(drm_test_get_tv_mode_from_name_invalid,
+			 drm_get_tv_mode_from_name_invalid_gen_params),
+	{ }
+};
+
+static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
+	.name = "drm_get_tv_mode_from_name",
+	.test_cases = drm_get_tv_mode_from_name_tests,
+};
+
+kunit_test_suites(
+	&drm_get_tv_mode_from_name_test_suite
+);
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
