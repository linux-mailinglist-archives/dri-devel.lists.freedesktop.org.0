Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7452F627FE2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BAF10E2B9;
	Mon, 14 Nov 2022 13:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3521410E2A3;
 Mon, 14 Nov 2022 13:01:04 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 94F3358024E;
 Mon, 14 Nov 2022 08:01:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 14 Nov 2022 08:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430863; x=
 1668438063; bh=3rNkdGBjwhIX6TsorhaAHuDhiR/SILd6uEeSjZotEUs=; b=a
 OjbEQj8TP9h+HwYzf7Oklr2uBsYyZid9BFchtajEKk97JXhLy5zo6HpwiXgohVuV
 OUZJqmNgEs+GsuHY+E7RA/zSdmPsnZ9+nYJOmJkEC3HX9tSYjPU1JX8ZIlJj8CsA
 UGKzXQ3QwXVGN/peeAXP1aysPsE/eokneJd9msrovEsAQUdIGn0x8eo4NXlIobPh
 PFA6+IRfcr91leDC+sZdijMrdJdvMqUf/xIOrxUo3CS0/pz6zK7rd1WkYZ7OKtWk
 Se2nU28KjX6E+30G3ElYdHkMt4YuKFcjfIiLr2Gnxm7c+5kh1TCDPqPdMS3d7pRS
 EZUbmiy9Obecy0d3UZdZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430863; x=
 1668438063; bh=3rNkdGBjwhIX6TsorhaAHuDhiR/SILd6uEeSjZotEUs=; b=a
 Uh0+rAfiaP5W1+z7zkUzQcXBn1nUVgekrcH46Yhie//z4ox1sNFnoXcgei0q3LkY
 /ACXt3o3bM06Rkqs0hyVgHhxaTjLRVHjm1H/LxROPMKMKRlZxOvaqiKMOd0GSOyK
 K/4FYiEQyIjwd0vRZiiak1tp+vMdLpiJ5zfTpebIfQusgsa0k7coqg4HBo45n/0i
 WSM426aF8MzTits5sdUNRVKoJrNpb7GrRQKfmyGI7u3CBJtTV/DaO++LWMZurDIw
 6/CHPhn1hbtgyE5zEVWGcJ6klYb6k9oksC/C/+tF+iwe608tnD203uL/NXvfu0YQ
 5XozAMl0QhNxmSST4URiA==
X-ME-Sender: <xms:DzxyY9UJMBtoYWE0ndGDZdsupjN-wLZeQFKLQ_L0cpd0M_rPE-zovQ>
 <xme:DzxyY9mpm8qM4hC2N75sCp50MQrj386pfEuCSx2kFvEWYO_M82mfxv4ZwpGYzVCFQ
 Polk3ZSMZlLaG77WRQ>
X-ME-Received: <xmr:DzxyY5afTNhSR4UPuB7nYUNybZ_0ojrIf2x8w0Th_fV-zG9e7kqUcMetpYMt2YhMNNtol3A35TWUqDom3K8MtsYUdR2PeLh40vPAwPu_bKVMZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DzxyYwUjLGdolMbxDNXarvhqdivrp7q0bS8JhIDdKWLm6MwiZuzHEg>
 <xmx:DzxyY3krIXBgnZYx1lReN81VIG39D9LhUsv8ZTTjZloTsM1f7x0c0A>
 <xmx:DzxyY9fUoA3bHgzGzCbwnmFtT9QHOJjdcO-_QbYnppBZCfIsG1fJfQ>
 <xmx:DzxyY7ygGutSoaLYiTvKFpFt-CPNpey7SnhmCLH-cDP9azs0JXfkRg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:01:02 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:32 +0100
Subject: [PATCH v9 13/25] drm/connector: Add a function to lookup a TV mode by
 its name
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-13-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=5601; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=rLy4l8j7Pgeh4oxsYV5MrppXIdi1PHPk+bk1wp2zJtI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1q+brjU6qy2O+sz7qHuBwyWDBQXcntvuuG9XYP7fK7Kw
 z8m+o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMx2sHIsOuiYlNiubvvpRf6gcpXTV
 vl2npXWRwsPyHJWne3LXzyRUaGruVSDx/9LL/tskxLbW6XzpKXOlc5F3D/lIpYt/ze5eDFDAA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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
Changes in v9:
- Switch the single invalid parameterized test to a regular test
- Switch to kunit_test_suite

Changes in v7:
- Add kunit tests
---
 drivers/gpu/drm/drm_connector.c            | 24 ++++++++++
 drivers/gpu/drm/tests/Makefile             |  1 +
 drivers/gpu/drm/tests/drm_connector_test.c | 73 ++++++++++++++++++++++++++++++
 include/drm/drm_connector.h                |  2 +
 4 files changed, 100 insertions(+)

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
index 000000000000..4ba9a23599ad
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -0,0 +1,73 @@
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
