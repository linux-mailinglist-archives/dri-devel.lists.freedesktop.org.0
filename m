Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEC65E6522
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB1810EB6E;
	Thu, 22 Sep 2022 14:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCF810EB5B;
 Thu, 22 Sep 2022 14:25:48 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id D1EA42B05B1B;
 Thu, 22 Sep 2022 10:25:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 22 Sep 2022 10:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856744; x=
 1663863944; bh=FyLoEv/XRYcWy/imcns01ka5K5oR639zUreSPFU77k0=; b=s
 ytIySoCg+vUAW43gND0wm72QLZJzNT9SXfmDVGWkvEc6G6GKpbv/griOgcZ8iK4+
 uftxGMieFFyASvv3gVQb6UWynNxTmvEYC9RRDq7KxNKjMHlmHwrFkj06Y63yJGfc
 5oV0Y4+m9/4Rh/X/yX3tXeb0kWfqS5RqqWLWawf+pLRcY5PnSP4/5hYPF3DHvRH7
 3cPJA/aHRlw+eJLhmdgbdj+0SisgHPxjlXfNdytmkYVXGXGOwxxFhpgABvnGmqn3
 vXDza5StLgMnAoowvm+0ZJftVLXNE1guePY7tGK6y8xwyi3fOy6IIcFkSfHSnSRz
 Ab5wda2roO+vCgF1MZ5cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856744; x=
 1663863944; bh=FyLoEv/XRYcWy/imcns01ka5K5oR639zUreSPFU77k0=; b=o
 KE628BQV1TnTJZ6SqF8fVd3UbMLyPpuY34UqlA6kPMZQPFDCmYOm3GCEpTjqQRpL
 Gk+2NYXYX7dHV71odxVjrGhEgyxfUOQquSs/0tWDNWTovrD5Kp1znbloA7C99yGS
 sA12DhuBYwQD60N/JjXHarPVgwoq7358RLa4+rnY1hfGSMryd0ZOzB5GGrBgTaWs
 7QST2O/Sh9EbTzhSy22KMFjaLZ8tI3W8cTcqEWBLzZTsDsd+rn3JaCvxmUPVsi6n
 tcUy7XL7y63xEMHnXGr7NgkFR8UMz4lZDCf+zCK12firV7Btznzpu2blz5NPh0BV
 +qiY47TPKu8sLD/m3doBA==
X-ME-Sender: <xms:aHAsY_LLOD2Pz4DkmFsa8DnDYxqU381BO2A2WL5Qeb0HSCX7Tt3etQ>
 <xme:aHAsYzJeeD-X_st9CTPrk0jkg6KTMTl1Kt8RsEcjpyi-77PbTUBmSncnUpcyMBTds
 3lQ4_kt1HG32pjYjnQ>
X-ME-Received: <xmr:aHAsY3tfWVRLqsEeZKxEzkEMcAOrhiz4ELa5dtubZYItymOS13jarjZ4Q_M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aHAsY4aVHSocfWInn9EjWojIOusd3IMzXmztoxJDcrhsSh8GXxRIjg>
 <xmx:aHAsY2bSusrY-HWc6YVl8BXSGaeCYc-iSNT7zc5OsY5v95sLQdR9pA>
 <xmx:aHAsY8DVgRXawGJYA9yfk162FccZyfl8gIsNUmSyvTBrqyesUyKmXw>
 <xmx:aHAsY3EYayWIzdAOwuIhalOnGU1q_sduP-8V_-jUmhdA8IJAif0GFrORDU8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:25:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:19 +0200
Subject: [PATCH v2 02/33] drm/tests: Add Kunit Helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-2-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2632; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Jkj0bmR2zQZJoCYiHexMb/PSdpWvmRh+mC/KTK8yntA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQExhlI5ecZ9h9K69RyPF0U9PfgsMePk741NSsuY1md7
 bljUUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIlIT2dk2Dzpi/Q79gNbTDxaK6KSzR
 0rL6YcrogVqfgznWXjbdG8Lob/qVOqOKdGb+E5ucEh4knovXnxle96ju0PMJZ+uTHkgGkHHwA=
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

As the number of kunit tests in KMS grows further, we start to have
multiple test suites that, for example, need to register a mock DRM
driver to interact with the KMS function they are supposed to test.

Let's add a file meant to provide those kind of helpers to avoid
duplication.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 2d9f49b62ecb..b29ef1085cad 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_format_helper_test.o \
 	drm_format_test.o \
 	drm_framebuffer_test.o \
+	drm_kunit_helpers.o \
 	drm_mm_test.o \
 	drm_plane_helper_test.o \
 	drm_rect_test.o
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
new file mode 100644
index 000000000000..7ebd620481c1
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -0,0 +1,54 @@
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+
+#include <linux/device.h>
+
+static const struct drm_mode_config_funcs drm_mode_config_funcs = {
+};
+
+static const struct drm_driver drm_mode_driver = {
+};
+
+static void drm_kunit_free_device(struct drm_device *drm, void *ptr)
+{
+	struct device *dev = ptr;
+
+	root_device_unregister(dev);
+}
+
+struct drm_device *drm_kunit_device_init(const char *name)
+{
+	struct drm_device *drm;
+	struct device *dev;
+	int ret;
+
+	dev = root_device_register(name);
+	if (IS_ERR(dev))
+		return ERR_CAST(dev);
+
+	drm = drm_dev_alloc(&drm_mode_driver, dev);
+	if (IS_ERR(drm)) {
+		root_device_unregister(dev);
+		return ERR_CAST(drm);
+	}
+	drm->mode_config.funcs = &drm_mode_config_funcs;
+
+	ret = drmm_add_action_or_reset(drm, drm_kunit_free_device, dev);
+	if (ret)
+		goto err_put_device;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return drm;
+
+err_put_device:
+	drm_dev_put(drm);
+	return ERR_PTR(ret);
+}
+
+void drm_kunit_device_exit(struct drm_device *drm)
+{
+	drm_dev_put(drm);
+}
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.h b/drivers/gpu/drm/tests/drm_kunit_helpers.h
new file mode 100644
index 000000000000..5015a327a8c1
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.h
@@ -0,0 +1,9 @@
+#ifndef DRM_KUNIT_HELPERS_H_
+#define DRM_KUNIT_HELPERS_H_
+
+struct drm_device;
+
+struct drm_device *drm_kunit_device_init(const char *name);
+void drm_kunit_device_exit(struct drm_device *drm);
+
+#endif // DRM_KUNIT_HELPERS_H_

-- 
b4 0.10.0
