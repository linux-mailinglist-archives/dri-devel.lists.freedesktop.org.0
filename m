Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB4A6240F1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A70D10E70D;
	Thu, 10 Nov 2022 11:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF2110E6EB;
 Thu, 10 Nov 2022 11:07:43 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B8542580281;
 Thu, 10 Nov 2022 06:07:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Nov 2022 06:07:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078462; x=
 1668085662; bh=UsH6OTkniSTmTwQseoK8cIvFIseBe4lY6iN1HW3Z9Cc=; b=O
 lEUN3W20cPGic3EzNkhzS4QJ95BHMqWuVUVZ7UC4h5Au9rPzMrKLmVlzrBJQyk9Q
 v1PhVppYn/8E0bR/e637Edb4pnNo1sYqREBKF95v2jhD05dD42DiHEno4N7/oz3h
 4too2lNl5bbLR+3Szu6MpG5U3IEeu2ISoxnEmUTUsiS3MRM5B1EH4dEUxuYg/uha
 8hJpKLIsZuFkc6ZDsyBEHGCBt2tgdjYhBM9QKhlG2ucZk1Y1tFZWvBD8J9JJj2kR
 YH+dNm++NY6OJllEjvw9/v7haCuKYidcf3wJWDRDEU7ec2+DPy3xhdoFI1saBN1G
 AO6vEbx0n/EWTDwW70ekw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078462; x=
 1668085662; bh=UsH6OTkniSTmTwQseoK8cIvFIseBe4lY6iN1HW3Z9Cc=; b=C
 /RF9kZ3YM+tnHOloKIbv89Gnixm6dPc7mM2gNh2Wh8aA4Nk0Emtm+wp/lmWglRsm
 AD1iB8MLHWFaA35nmqgICzYGSGv7HaiXSaa6Wj+fSHurPzCDmrUNGr3z3tngaKYz
 /qBthhjGgac0xtZQu9oL8ycIMm0XVUGXHGKXo+beEFXULqd7JnpRWtZTBrBF9U13
 Zl674EICi/8HUiPUTp/4dXmWyOz8q0Z+W9BRtKl3WTF/xaKKd+r6Oks6FjRFsaIw
 uWYR2T/xbrns5XB16zEXRU8Og3SCu+s1bnQOcQsuTZ8JyKWYmWw+3YN2XGKhO4Hs
 ucx6B4vm0JE8tl6a/jjZw==
X-ME-Sender: <xms:fttsY16zvIQ3BxUJEUVj6vcjsQbk7S3qslApoprXBLywlGl2Ue5tZA>
 <xme:fttsYy7vHDRU8tZ_aGBqPLET3aHe4cky0t_ZKreHSQ2n9G4aWGW9NRSHUQ5lUlGYX
 IXqaHdNvzpYhYZ9_uM>
X-ME-Received: <xmr:fttsY8eC_YjDc3q68eg7Wwz_fY_fkIHgpDjLRuCMzBq5Rsw0Je7POKebcUGHIUjMYE29MbrpuGu9sepfidv1XpePoRYNLmM3TmDstBWTyL_gjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fttsY-Lkxn1H0pBI9dc4mFA9tr6nUoB0n7r53avvvxwEqtWSCJhJ-Q>
 <xmx:fttsY5JE7ne6opouAIhHNoEBdRze8rFZ7Ve3LWU2EkXc0o60C4n48w>
 <xmx:fttsY3z6jHX6tCW_DK8pftSMMeAn8qxif3PuRC9pDzzxuwIXiKFq1A>
 <xmx:fttsY32aTdAff2U3r2Ykza3UfSH50H0bn4vRC16WoG0kikI4Wxceng>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:24 +0100
Subject: [PATCH v8 12/24] drm/connector: Add a function to lookup a TV mode by
 its name
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-12-09ce1466967c@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5939; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Fy1GGeL+6bb4wLA/kuvQqm0X9BQNMJDeAf5jVKPkKMA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1OvLLtgZvy5P4UxY+rJRS6/zhyJl/uaIpzNErpWUG5W
 z57UjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzE4yAjw1OFLLZ7XZ9z7iYeKP9+Q7
 c4c8r77T2b8hUcVvNvOmPIN4fhf3ECW5jvrc7PMvHWpjLHp7C33frOMXX3DDZ7PsOSJZOOsgIA
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
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
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
