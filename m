Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284F35A4D3C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD69510F21F;
	Mon, 29 Aug 2022 13:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12D410F229
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:13:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 8A0532B0605A;
 Mon, 29 Aug 2022 09:13:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 29 Aug 2022 09:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778809; x=
 1661786009; bh=brLbE95VBy9k5VrYGsPmloGy1lQZHCg9ZtxvtLcN1Qo=; b=j
 VkdkcClmfca8ElGpw0RAUt6m0Gv54+jM4X6lntwUEfv7lCmbcJuIth2VWei8y+cd
 66vxd9smnQcFRnfejC9XHL3S/pFGm3WLbPCILUneIvSGk3FbOZvvx8rQZ54aD4H/
 QESHl1LRxXzJ4lQsnoTMXHZwcX8kaQ8XHL7iFQcNHlrjJfsvqd1DW5rok2+9xKdo
 2/ezTLRD3N85GwYKFj/d+b6Bfjv2THt9bzbFmMtpIarDyuTdJmhk/KDYz4AQRZBj
 ydDkQIwX1JY93ko3aHmBviKn27JS+SPSX2YpgqD9dsTXD8otEF8OKpEj/d2RbE63
 FNX6zFHaMH5eWLAarNhjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778809; x=
 1661786009; bh=brLbE95VBy9k5VrYGsPmloGy1lQZHCg9ZtxvtLcN1Qo=; b=k
 ZHECdYLCXDeqxnapuI20tTO8mFMpxYBQYiVrjy+m6DUhl5NvVrBks99gMNPLfLAY
 3D8/PGAc1flNRTn+dXSvw9R8UO5AGc6GPOKYt8NqCIXuCHOhRUu16hHRvtmoLRZH
 DotvcSUISFUVXeue3GIVZLJZoY84yQEE8IA1dsXYe+cv5h3k67XugSpptyOx2Qrp
 rWO0M5YRCDKFrYm5OKKzUNKit1Wq3hbZX6P/n9jObYnNyYevwieztoe2ZmWdgdjA
 Dfu6iHgyigQ7fYceitKtlN7DyGUZrxlcQUmBsshaUl6QedFeUKFNI4y6A0RIZRNZ
 WV7FFCRLoBXBkZDiNZcPg==
X-ME-Sender: <xms:eLsMYx-k30xNKcfIfBUAGm8QzciM8dzD8ju-pAF1Mhl3Zs0nVpiC7A>
 <xme:eLsMY1vXNh8vfJhO2E69RjDFdh3cs1r2fcg3-caHwVzV-Uvv_1X2GQ8nNVz5VNgdH
 NRYteJ95su7LqneZbY>
X-ME-Received: <xmr:eLsMY_DLGfk3bEXA8hZy78q0izch0pvofAoeDoSKttZtQHygEAV1lua_CaVa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eLsMY1fhWKOYSlHLK_LzIPSxvB7_5upFBxB0Qg7fGRju77aaIy6CAQ>
 <xmx:eLsMY2Pgw9G2XZ2WGwMhDpyr6gaF0Pcm_SUCdxbmLq9jg0Db5xsGAQ>
 <xmx:eLsMY3kYKoIEewvgagvRiAvWHm1LFnTqzygukxn5rpW3AfaH0WOZ0Q>
 <xmx:ebsMYy1l87pGpn4yhP19T-A11S3jwvzMkVV63U1V_wp5kGuEoEQECXWDVg4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:13:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 13/41] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
Date: Mon, 29 Aug 2022 15:11:27 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-13-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=4333; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=/dKwZjZwU+Jvp9SGqNZ5BX5aWEOsSsT2gHorhJZbBUM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+SZN0uElihtmCoZ1NGtY/5u1Y6L0ut/76w9svehzJqG
 5a/XdJSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiaw8xMkxar1m//ENZ/Xb9ul+GZb
 8u6+nv9nNcbW2SapnN9TWGfTfDH37F6e/nPQjbtKnCjeH689/T3/ldbpyjo6/PfJUvxDOwnx0A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: quoted-printable
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_connector_pick_cmdline_mode() is in charge of finding a proper=0D
drm_display_mode from the definition we got in the video=3D command line=0D
argument.=0D
=0D
Let's add some unit tests to make sure we're not getting any regressions=0D
there.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_cli=
ent_modeset.c=0D
index bbc535cc50dd..d553e793e673 100644=0D
--- a/drivers/gpu/drm/drm_client_modeset.c=0D
+++ b/drivers/gpu/drm/drm_client_modeset.c=0D
@@ -1237,3 +1237,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *cl=
ient, int mode)=0D
 	return ret;=0D
 }=0D
 EXPORT_SYMBOL(drm_client_modeset_dpms);=0D
+=0D
+#ifdef CONFIG_DRM_KUNIT_TEST=0D
+#include "tests/drm_client_modeset_test.c"=0D
+#endif=0D
diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/=
drm/tests/drm_client_modeset_test.c=0D
new file mode 100644=0D
index 000000000000..46335de7bc6b=0D
--- /dev/null=0D
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c=0D
@@ -0,0 +1,114 @@=0D
+// SPDX-License-Identifier: GPL-2.0=0D
+/*=0D
+ * Copyright (c) 2022 Maxime Ripard <mripard@kernel.org>=0D
+ */=0D
+=0D
+#include <kunit/test.h>=0D
+=0D
+#include <drm/drm_connector.h>=0D
+#include <drm/drm_edid.h>=0D
+#include <drm/drm_drv.h>=0D
+#include <drm/drm_modes.h>=0D
+#include <drm/drm_modeset_helper_vtables.h>=0D
+#include <drm/drm_probe_helper.h>=0D
+=0D
+#include "drm_kunit_helpers.h"=0D
+=0D
+struct drm_client_modeset_test_priv {=0D
+	struct drm_device *drm;=0D
+	struct drm_connector connector;=0D
+};=0D
+=0D
+static int drm_client_modeset_connector_get_modes(struct drm_connector *co=
nnector)=0D
+{=0D
+	struct drm_display_mode *mode;=0D
+	int count;=0D
+=0D
+	count =3D drm_add_modes_noedid(connector, 1920, 1200);=0D
+=0D
+	return count;=0D
+}=0D
+=0D
+static const struct drm_connector_helper_funcs drm_client_modeset_connecto=
r_helper_funcs =3D {=0D
+	.get_modes =3D drm_client_modeset_connector_get_modes,=0D
+};=0D
+=0D
+static const struct drm_connector_funcs drm_client_modeset_connector_funcs=
 =3D {=0D
+};=0D
+=0D
+static int drm_client_modeset_test_init(struct kunit *test)=0D
+{=0D
+	struct drm_client_modeset_test_priv *priv;=0D
+	int ret;=0D
+=0D
+	priv =3D kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);=0D
+	if (!priv)=0D
+		return -ENOMEM;=0D
+	test->priv =3D priv;=0D
+=0D
+	priv->drm =3D drm_kunit_device_init("drm-client-modeset-test");=0D
+	if (IS_ERR(priv->drm))=0D
+		return PTR_ERR(priv->drm);=0D
+=0D
+	ret =3D drmm_connector_init(priv->drm, &priv->connector,=0D
+				  &drm_client_modeset_connector_funcs,=0D
+				  DRM_MODE_CONNECTOR_Unknown,=0D
+				  NULL);=0D
+	if (ret)=0D
+		return ret;=0D
+	drm_connector_helper_add(&priv->connector, &drm_client_modeset_connector_=
helper_funcs);=0D
+=0D
+	return 0;=0D
+}=0D
+=0D
+static void drm_client_modeset_test_exit(struct kunit *test)=0D
+{=0D
+	struct drm_client_modeset_test_priv *priv =3D test->priv;=0D
+=0D
+	drm_kunit_device_exit(priv->drm);=0D
+}=0D
+=0D
+static void drm_pick_cmdline_res_1920_1080_60(struct kunit *test)=0D
+{=0D
+	struct drm_client_modeset_test_priv *priv =3D test->priv;=0D
+	struct drm_device *drm =3D priv->drm;=0D
+	struct drm_connector *connector =3D &priv->connector;=0D
+	struct drm_cmdline_mode *cmdline_mode =3D &connector->cmdline_mode;=0D
+	struct drm_display_mode *expected_mode, *mode;=0D
+	const char *cmdline =3D "1920x1080@60";=0D
+	int ret;=0D
+=0D
+	expected_mode =3D drm_mode_find_dmt(priv->drm, 1920, 1080, 60, false);=0D
+	KUNIT_ASSERT_PTR_NE(test, expected_mode, NULL);=0D
+=0D
+	KUNIT_ASSERT_TRUE(test,=0D
+			  drm_mode_parse_command_line_for_connector(cmdline,=0D
+								    connector,=0D
+								    cmdline_mode));=0D
+=0D
+	mutex_lock(&drm->mode_config.mutex);=0D
+	ret =3D drm_helper_probe_single_connector_modes(connector, 1920, 1080);=0D
+	mutex_unlock(&drm->mode_config.mutex);=0D
+	KUNIT_ASSERT_GT(test, ret, 0);=0D
+=0D
+	mode =3D drm_connector_pick_cmdline_mode(connector);=0D
+	KUNIT_ASSERT_PTR_NE(test, mode, NULL);=0D
+=0D
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));=0D
+}=0D
+=0D
+static struct kunit_case drm_pick_cmdline_tests[] =3D {=0D
+	KUNIT_CASE(drm_pick_cmdline_res_1920_1080_60),=0D
+	{}=0D
+};=0D
+=0D
+static struct kunit_suite drm_pick_cmdline_test_suite =3D {=0D
+	.name =3D "drm_pick_cmdline",=0D
+	.init =3D drm_client_modeset_test_init,=0D
+	.exit =3D drm_client_modeset_test_exit,=0D
+	.test_cases =3D drm_pick_cmdline_tests=0D
+};=0D
+=0D
+kunit_test_suite(drm_pick_cmdline_test_suite);=0D
+MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");=0D
+MODULE_LICENSE("GPL");=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
