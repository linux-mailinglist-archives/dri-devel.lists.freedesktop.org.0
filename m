Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5543A5FDA6D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CF910E8BA;
	Thu, 13 Oct 2022 13:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F17710E23C;
 Thu, 13 Oct 2022 13:19:10 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 89A96580361;
 Thu, 13 Oct 2022 09:19:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 13 Oct 2022 09:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667149; x=
 1665674349; bh=7YfbxgnAwaQ9hTo1nAXyrUJeBTNGxO2cVu+QTSJge7M=; b=F
 1gTA3LLdKJMmBcVoZ6ZepngBg2WcnP6zYG7pGbSIEGdx5wX6GweJKZ8bo3ri7eMD
 d245bf1v99ich3+rCzMGEsGEZqtpSADkHS36pjN/rxeunBj7xHsZLyU6YKeckoI/
 GUj4qS2HdoM/xnj1zW1DMXywjZ+th60MY8KNG1499zeVItY/A1fFqGgredLlcUga
 nFOTSsfP9Qh9gzg51uFWJFT5eMQtai6OsrGwMl1nsbwRTnVmRBVEk+dLwurBRD0T
 3Nonwkgtljb7QyuCWZmHMATsesfYckOLGxKfdSF3+W/jJSJMV6gYEBEeI/EkL03b
 jA99O3SbW4UlRHei6SwFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667149; x=
 1665674349; bh=7YfbxgnAwaQ9hTo1nAXyrUJeBTNGxO2cVu+QTSJge7M=; b=W
 bWb4BLcsMwweiNnZvGTdB4ByRjp+el1yjFWG8w+inPw/iFFTza3mBghHW09Ykb4C
 ueEIyFyrn1RClelT6mt/rYi9PjHnk3uQ1RdAYj+YiFASrQ4pQXkRw/2XJ3VMc2GU
 xkUyiheKuDJtW58ze4vGIvmZ2gyO1paqMYbEjSfAd4I4UQn3UOu+r6fW1S4qWNbR
 37pYsnyJBXSzyQIolhJ5egaOTdQGb4YCoztivrUKXPE72nLe0xTMFJ8rf35Ohd+n
 xUkuvyvFlN/v3Mt5VSaeAZl+2xFfnnj0kZWGbwwBGyK6xehxTYZTzUQJmPPlat2L
 onwXPcrhFjH5w6L0CpYdQ==
X-ME-Sender: <xms:TRBIY2W0U2gprdfWLYn9KN2d0Dx5Q5jkgOGqNhcvckPNUpmV4Ps9Og>
 <xme:TRBIYympyMqeRzbpNviwuSmgAMTotG9PHttHMtDWDWs6O6jPvOT9rryRj8Dv82NaB
 KMpS6tHVPzIJQpWFmc>
X-ME-Received: <xmr:TRBIY6Y0lxaeEo5U6rwmhxaO7qsbV2u1y3Uiu-uimyjGIvDxTLtwqeY2j3y5NJoVPiyrJcoJkPlt2C221K9AZsaz6ozwaynpv96Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TRBIY9X6mTlkIviSN2He5hX2DE_v47IqnFJz_rFeAX0nzMyOVIyb-g>
 <xmx:TRBIYwnvigyYULi1ifoWaaf8-QM2c8RFWDDT5NiD4xg7ydk-B2ijVQ>
 <xmx:TRBIYyd5HNWD-xWQ_vxXyAxmDfm14oCqnU4zgvalpmGBsAsKOD5xFA>
 <xmx:TRBIY8y-E3rMs1-dLeTCGi1gsY7cm83bmlsiFaqeT_MktB27_iwYOA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:18:45 +0200
Subject: [PATCH v5 01/22] drm/tests: Add Kunit Helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v5-1-d841cc64fe4b@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=slGkTsK1joJYB2lMjXoAXSmWRQW1i6Ovmu+6b4fj+tY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAm6qu+udM8waxbytjFZ92LFcQtdyueA8Tkujf7PcpTSP
 atl2lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCIbeBgZ3k7ZJfr7RVqCFstmr1bfM0
 Uq959rL9nWWVbdwHHEa92X14wMDSXW3X/vfft+NEczPVn6/Ar1Cxxce7VTnqRpSG380/SAEQA=
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

As the number of kunit tests in KMS grows further, we start to have
multiple test suites that, for example, need to register a mock DRM
driver to interact with the KMS function they are supposed to test.

Let's add a file meant to provide those kind of helpers to avoid
duplication.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v4:
- Simplified the DRM device cleanup patch using devm_drm_dev_alloc()
---
 drivers/gpu/drm/tests/Makefile            |  1 +
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 61 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tests/drm_kunit_helpers.h |  9 +++++
 3 files changed, 71 insertions(+)

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
index 000000000000..3524d6a1fa9a
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -0,0 +1,61 @@
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+
+#include <kunit/resource.h>
+
+#include <linux/device.h>
+
+struct kunit_dev {
+	struct drm_device base;
+};
+
+static const struct drm_mode_config_funcs drm_mode_config_funcs = {
+};
+
+static const struct drm_driver drm_mode_driver = {
+};
+
+static int dev_init(struct kunit_resource *res, void *ptr)
+{
+	char *name = ptr;
+	struct device *dev;
+
+	dev = root_device_register(name);
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	res->data = dev;
+	return 0;
+}
+
+static void dev_free(struct kunit_resource *res)
+{
+	struct device *dev = res->data;
+
+	root_device_unregister(dev);
+}
+
+struct drm_device *drm_kunit_device_init(struct kunit *test, char *name)
+{
+	struct kunit_dev *kdev;
+	struct drm_device *drm;
+	struct device *dev;
+	int ret;
+
+	dev = kunit_alloc_resource(test, dev_init, dev_free, GFP_KERNEL, name);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	kdev = devm_drm_dev_alloc(dev, &drm_mode_driver, struct kunit_dev, base);
+	if (IS_ERR(kdev))
+		return ERR_CAST(kdev);
+
+	drm = &kdev->base;
+	drm->mode_config.funcs = &drm_mode_config_funcs;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return drm;
+}
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.h b/drivers/gpu/drm/tests/drm_kunit_helpers.h
new file mode 100644
index 000000000000..a9354f9bda4e
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.h
@@ -0,0 +1,9 @@
+#ifndef DRM_KUNIT_HELPERS_H_
+#define DRM_KUNIT_HELPERS_H_
+
+struct drm_device;
+struct kunit;
+
+struct drm_device *drm_kunit_device_init(struct kunit *test, char *name);
+
+#endif // DRM_KUNIT_HELPERS_H_

-- 
b4 0.11.0-dev-7da52
