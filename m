Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829545A4D26
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D8410F1FB;
	Mon, 29 Aug 2022 13:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0C310F1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:12:18 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 72EC62B05F9B;
 Mon, 29 Aug 2022 09:12:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 29 Aug 2022 09:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778734; x=
 1661785934; bh=ELfkVxUr/la37A7msWR/2jnnu/mFwFNLuNnzkr6V0mg=; b=O
 5gzqV7pYTkeD9LdWrNNZzPJ5npg15h0PMl0JEq/NEZwH5E5AFm5az6ZFcPLpToIb
 5TjeWBhkrRrJNk2p0G6XUUV/0SOMr00N9NoQlffJrJRFh+MS1uSASARym+GT47OW
 esM33Tj8ZK6LII08ud8MjButKRh3DlQx98EnUzq0aeUEVeL1kmPAllng07KEKmWq
 Lmwy2eqsd/LAY2M20DeQxcMVaNgFF2escO1umOLxsxIOLlix9iDINm/m3WdpAOFd
 UPve3yeXAnbP3w90QobblR9uj3vLw4hZe/gGqn2/L0QRguVUSW9+6oM1szRTGl4e
 5CDr2kqGGN0a4UWiR5EnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778734; x=
 1661785934; bh=ELfkVxUr/la37A7msWR/2jnnu/mFwFNLuNnzkr6V0mg=; b=G
 K0c86PPa4XUcKDqrVNDLDw+NEzkns7uXqzmwzJePQK2l17VlFmjoGwhzDFmeaSZK
 4dKRPAHwsRIK6vAg3rnnrcFyZc3lPOQBRW8fc85VhLQfnibdRe4yVDL+weUyiSo8
 vqeJtSIE6Z4JHifBsLQQagdUHyMMQLK/Q0XjP9jE2EwDTwMGy0KGE0UOj7TGKQpg
 3Uvp5ZpaREBUFZOPgkKNbZ6guHd5k/Emn6ct3wgNpV2+lyHsrxpofY2SlqYhM09v
 PmpUxsze7vDLo0sd0K5/3dZ1TpLJW30JUiS4BbvetzA2SOks8Lc0b+Xi3BJBdP4O
 xahFOaMIq4nkEPF2xtowg==
X-ME-Sender: <xms:LrsMY_NZGFw8UutOzSWrTPo3_PhH8UzlRpg_I0A-j-4Zp9DskFYzHg>
 <xme:LrsMY5-6KAV5pU6SgAzDNM9HVIofymLN43Oo-YIjkc_Tb8SMKLHtpZhTkjcnnZHaM
 Ag93asnHKQ8eY9jFI8>
X-ME-Received: <xmr:LrsMY-Sn9q3IQ4-Yx1cI3SzuPcXsWJsIwLhHyEXlmFpbfnv9zH6U4Xqdm4N5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LrsMYzvA72-1JyzNf3ovpcQMfOfxlnwNGZMzTUj_Eai5vamfhziVrg>
 <xmx:LrsMY3efcay5g7OCtXGUrcpe27etgunwjX31lq9W1R-djb_Oj9OQUg>
 <xmx:LrsMY_1rQDb9RpwEH1BbjPphPfNsm86dYxAzZ9o7_sQ9khW57_56TQ>
 <xmx:LrsMY1EwHrEaDwgzl4KBspVs9LGf9yTUnBEQexFQ4cniqj7vqwsDZY2HM1A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:12:13 -0400 (EDT)
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
Subject: [PATCH v2 02/41] drm/tests: Add Kunit Helpers
Date: Mon, 29 Aug 2022 15:11:16 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-2-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=2642; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=epeQixwNzn3d4RRhZr1OO6FT9bd6N3aHX8QjcYiaO/E=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+QXbWpvWW/meZV/YSi7V3O/Ofv3//lZt0IEMz9bz9t9
 Lo+5o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNZd5Dhf1r92Zv9Cuav0/P7mybwHA
 ldVZWw9bdPmkjD3d164mz5nxj+Rz1ZMF0lJ1S06Mg+q2PssQsu699Zt+hR3COJV3VTz/QbMQEA
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

As the number of kunit tests in KMS grows further, we start to have=0D
multiple test suites that, for example, need to register a mock DRM=0D
driver to interact with the KMS function they are supposed to test.=0D
=0D
Let's add a file meant to provide those kind of helpers to avoid=0D
duplication.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefil=
e=0D
index 2d9f49b62ecb..b29ef1085cad 100644=0D
--- a/drivers/gpu/drm/tests/Makefile=0D
+++ b/drivers/gpu/drm/tests/Makefile=0D
@@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) +=3D \=0D
 	drm_format_helper_test.o \=0D
 	drm_format_test.o \=0D
 	drm_framebuffer_test.o \=0D
+	drm_kunit_helpers.o \=0D
 	drm_mm_test.o \=0D
 	drm_plane_helper_test.o \=0D
 	drm_rect_test.o=0D
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/te=
sts/drm_kunit_helpers.c=0D
new file mode 100644=0D
index 000000000000..7ebd620481c1=0D
--- /dev/null=0D
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c=0D
@@ -0,0 +1,54 @@=0D
+#include <drm/drm_drv.h>=0D
+#include <drm/drm_managed.h>=0D
+=0D
+#include <linux/device.h>=0D
+=0D
+static const struct drm_mode_config_funcs drm_mode_config_funcs =3D {=0D
+};=0D
+=0D
+static const struct drm_driver drm_mode_driver =3D {=0D
+};=0D
+=0D
+static void drm_kunit_free_device(struct drm_device *drm, void *ptr)=0D
+{=0D
+	struct device *dev =3D ptr;=0D
+=0D
+	root_device_unregister(dev);=0D
+}=0D
+=0D
+struct drm_device *drm_kunit_device_init(const char *name)=0D
+{=0D
+	struct drm_device *drm;=0D
+	struct device *dev;=0D
+	int ret;=0D
+=0D
+	dev =3D root_device_register(name);=0D
+	if (IS_ERR(dev))=0D
+		return ERR_CAST(dev);=0D
+=0D
+	drm =3D drm_dev_alloc(&drm_mode_driver, dev);=0D
+	if (IS_ERR(drm)) {=0D
+		root_device_unregister(dev);=0D
+		return ERR_CAST(drm);=0D
+	}=0D
+	drm->mode_config.funcs =3D &drm_mode_config_funcs;=0D
+=0D
+	ret =3D drmm_add_action_or_reset(drm, drm_kunit_free_device, dev);=0D
+	if (ret)=0D
+		goto err_put_device;=0D
+=0D
+	ret =3D drmm_mode_config_init(drm);=0D
+	if (ret)=0D
+		return ERR_PTR(ret);=0D
+=0D
+	return drm;=0D
+=0D
+err_put_device:=0D
+	drm_dev_put(drm);=0D
+	return ERR_PTR(ret);=0D
+}=0D
+=0D
+void drm_kunit_device_exit(struct drm_device *drm)=0D
+{=0D
+	drm_dev_put(drm);=0D
+}=0D
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.h b/drivers/gpu/drm/te=
sts/drm_kunit_helpers.h=0D
new file mode 100644=0D
index 000000000000..5015a327a8c1=0D
--- /dev/null=0D
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.h=0D
@@ -0,0 +1,9 @@=0D
+#ifndef DRM_KUNIT_HELPERS_H_=0D
+#define DRM_KUNIT_HELPERS_H_=0D
+=0D
+struct drm_device;=0D
+=0D
+struct drm_device *drm_kunit_device_init(const char *name);=0D
+void drm_kunit_device_exit(struct drm_device *drm);=0D
+=0D
+#endif // DRM_KUNIT_HELPERS_H_=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
