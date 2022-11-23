Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CCD6363C8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7F710E5AC;
	Wed, 23 Nov 2022 15:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602BD10E590
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:30:30 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id CB1442B06A7A;
 Wed, 23 Nov 2022 10:30:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 23 Nov 2022 10:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217426; x=
 1669224626; bh=gQXMtuZKWqvjfPGX8kAzdMoM4s7ssIbAlVmvcUDW9xA=; b=o
 MQHWX4R1nylYVec+os9e3Qh6aTPRg7G7ULnuOD15HLK3zjuv2m9qLYugWYO5bmKE
 bEpQD55aHEBhYs5cMXj3YDDmSVIDw605q4azaXRnVUMFViiYnCR+qowNuBcCaocy
 4uDimeUPrqoSJ/ycz41sompzg+xcRcp4IAsKT/hAd9yqh3EvgqT5m3RIYENmX/5H
 juW5WGOiu2lQbaJEO60DuC/3j40hizOPhG5bXsTCN2JpJLHtjg65cyhcATF6zAEj
 +Or8iWuHdmQfEmkHgkVjToIHEaotucdMAniwRt3wdj5kesXNw3mcyT9OkHlhLRN5
 6z40gYTehD8MYQRE7fI0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217426; x=
 1669224626; bh=gQXMtuZKWqvjfPGX8kAzdMoM4s7ssIbAlVmvcUDW9xA=; b=g
 7PyHrnbjW6AMFuHCK+iBOmaOEBLWEkmMPR3CzZOY00s+X/jTEalXymAwKboQiRbv
 nY1uDok7IEcnhIgu74WCqOPrCNleCftsaX82OBrhQrDkuQbx/kCYxy9HViD2jk/Q
 8kw6uxEkHUybPEy3khKAnDJIkGkUIkkZxnbHJCTpNaJPPlENB6cC5bGuMy439AJI
 uVaO9/VZii5cGjgRpeHOMe+fCnQyYyCr49foonDKJsmAlhi9DPpeonXecbcDo7yU
 rOY09pOlEoNb+sFGequag2CED+YHd4ampXoq+eG8j/iaDw86TqlXApIM16Rjaicf
 nmKYao+txJPdktBYyzcLQ==
X-ME-Sender: <xms:kjx-Y9Op_RBANhu8Ov8Gx6M2xhlCdGjuw95hQosovpTTq28i0gh4XA>
 <xme:kjx-Y__8DvPP-q1MjdGrCXOlzdskcFp89DVKSgMJtr3v6IcpQG75-kjfHz7k4Ondu
 gon396l55FRpPrnS3A>
X-ME-Received: <xmr:kjx-Y8QqI0nUf-JXIWBOKaR6BNWHDPYiplMK3ScvMj9wy3apon4HJbA3-KhhELi7SxPcbPvFpKDf6tMbC08p8FwPzXh5zHyqzhy2pw9ixGYqEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kjx-Y5u5-GVoaXsCGfy5ubSreL1SRRgfNEbLyIraNGPkDkmbdYxf5Q>
 <xmx:kjx-Y1cN0KKICdcd2mM6QhLLNj4CWfzvFEcnK1NzankJBFGGQ7kvsw>
 <xmx:kjx-Y110rH21y-q80VP1hZAmO0GZCc_z2xok_9ag6hxF_FwtOSHNQg>
 <xmx:kjx-Yz9hLowVwKqopxlBHqSBIPJnw_4iCHLHfR2zVthIcEpRBkFWL-hJfWs>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:30:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:26:04 +0100
Subject: [PATCH 22/24] drm/vc4: tests: Introduce a mocking infrastructure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-22-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=22339; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=uQe5Yuh014h8+lCURYAfsr9suFMSCpFA20UO6H2nmRU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11jXpF1v51a/cS9roc1zg7uHXfxhWrtm2sFky/LBvvb18
 8ePFHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhIECPDb5Y1U878O3Nh160dvK3HUh
 9xGhm/ms1/7e7pUAWm8+eV9u1i+F98jOmUy5nstaWXTF496O2/orrIavXC6OQA/y+mD09eTeQEAA==
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
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Maíra Canal <mairacanal@riseup.net>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to test the current atomic_check hooks we need to have a DRM
device that has roughly the same capabilities and layout that the actual
hardware. We'll also need a bunch of functions to create arbitrary
atomic states.

Let's create some helpers to create a device that behaves like the real
one, and some helpers to maintain the atomic state we want to check.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/Kconfig                 |  15 +++
 drivers/gpu/drm/vc4/Makefile                |   1 +
 drivers/gpu/drm/vc4/tests/.kunitconfig      |  14 +++
 drivers/gpu/drm/vc4/tests/Makefile          |   7 ++
 drivers/gpu/drm/vc4/tests/vc4_mock.c        | 174 ++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/tests/vc4_mock.h        |  58 ++++++++++
 drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c   |  39 +++++++
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c |  97 ++++++++++++++++
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c  |  45 +++++++
 drivers/gpu/drm/vc4/vc4_crtc.c              |  20 ++--
 drivers/gpu/drm/vc4/vc4_drv.c               |   4 +-
 drivers/gpu/drm/vc4/vc4_drv.h               |  13 +++
 drivers/gpu/drm/vc4/vc4_txp.c               |   2 +-
 13 files changed, 476 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index 246305d17a52..eb5e8367da67 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -34,3 +34,18 @@ config DRM_VC4_HDMI_CEC
 	help
 	  Choose this option if you have a Broadcom VC4 GPU
 	  and want to use CEC.
+
+config DRM_VC4_KUNIT_TEST
+	tristate "KUnit tests for VC4" if !KUNIT_ALL_TESTS
+	depends on DRM_VC4 && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds unit tests for the VC4 DRM/KMS driver. This option is
+	  not useful for distributions or general kernels, but only for kernel
+	  developers working on the VC4 driver.
+
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in
+	  Documentation/dev-tools/kunit/.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/vc4/Makefile b/drivers/gpu/drm/vc4/Makefile
index d0163e18e9ca..8984b2b5da77 100644
--- a/drivers/gpu/drm/vc4/Makefile
+++ b/drivers/gpu/drm/vc4/Makefile
@@ -28,3 +28,4 @@ vc4-y := \
 vc4-$(CONFIG_DEBUG_FS) += vc4_debugfs.o
 
 obj-$(CONFIG_DRM_VC4)  += vc4.o
+obj-$(CONFIG_DRM_VC4_KUNIT_TEST) += tests/
diff --git a/drivers/gpu/drm/vc4/tests/.kunitconfig b/drivers/gpu/drm/vc4/tests/.kunitconfig
new file mode 100644
index 000000000000..bfd9899ed6e0
--- /dev/null
+++ b/drivers/gpu/drm/vc4/tests/.kunitconfig
@@ -0,0 +1,14 @@
+CONFIG_ARCH_BCM=y
+CONFIG_ARCH_BCM2835=y
+CONFIG_BCM2835_MBOX=y
+CONFIG_KUNIT=y
+CONFIG_DRM=y
+CONFIG_DRM_KUNIT_TEST=y
+CONFIG_DRM_VC4=y
+CONFIG_DRM_VC4_KUNIT_TEST=y
+CONFIG_MAILBOX=y
+CONFIG_RASPBERRYPI_FIRMWARE=y
+CONFIG_SND=y
+CONFIG_SND_SOC=y
+CONFIG_SOUND=y
+CONFIG_COMMON_CLK=y
diff --git a/drivers/gpu/drm/vc4/tests/Makefile b/drivers/gpu/drm/vc4/tests/Makefile
new file mode 100644
index 000000000000..3e8a7b4f9017
--- /dev/null
+++ b/drivers/gpu/drm/vc4/tests/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_DRM_VC4_KUNIT_TEST) += \
+	vc4_mock.o \
+	vc4_mock_crtc.o \
+	vc4_mock_output.o \
+	vc4_mock_plane.o
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
new file mode 100644
index 000000000000..f4c2213ea0e2
--- /dev/null
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -0,0 +1,174 @@
+#include <drm/drm_drv.h>
+
+#include <kunit/test.h>
+
+#include "../../tests/drm_kunit_helpers.h"
+
+#include "vc4_mock.h"
+
+struct vc4_mock_output_desc {
+	enum vc4_encoder_type	vc4_encoder_type;
+	unsigned int		encoder_type;
+	unsigned int		connector_type;
+};
+
+#define VC4_MOCK_OUTPUT_DESC(_vc4_type, _etype, _ctype)					\
+	{										\
+		.vc4_encoder_type = _vc4_type,						\
+		.encoder_type = _etype,							\
+		.connector_type = _ctype,						\
+	}
+
+struct vc4_mock_pipe_desc {
+	const struct vc4_crtc_data *data;
+	const struct vc4_mock_output_desc *outputs;
+	unsigned int noutputs;
+};
+
+#define VC4_MOCK_CRTC_DESC(_data, ...)							\
+	{										\
+		.data = _data,								\
+		.outputs = (struct vc4_mock_output_desc[]) { __VA_ARGS__ },		\
+		.noutputs = sizeof((struct vc4_mock_output_desc[]) { __VA_ARGS__ }) /	\
+			     sizeof(struct vc4_mock_output_desc),			\
+	}
+
+#define VC4_MOCK_PIXELVALVE_DESC(_data, ...)						\
+	VC4_MOCK_CRTC_DESC(&(_data)->base, __VA_ARGS__)
+
+struct vc4_mock_desc {
+	const struct vc4_mock_pipe_desc *pipes;
+	unsigned int npipes;
+};
+
+#define VC4_MOCK_DESC(...)								\
+	{										\
+		.pipes = (struct vc4_mock_pipe_desc[]) { __VA_ARGS__ },			\
+		.npipes = sizeof((struct vc4_mock_pipe_desc[]) { __VA_ARGS__ }) /	\
+			     sizeof(struct vc4_mock_pipe_desc),				\
+	}
+
+static const struct vc4_mock_desc vc5_mock =
+	VC4_MOCK_DESC(
+		VC4_MOCK_CRTC_DESC(&vc4_txp_crtc_data,
+				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
+							DRM_MODE_ENCODER_VIRTUAL,
+							DRM_MODE_CONNECTOR_WRITEBACK)),
+		VC4_MOCK_PIXELVALVE_DESC(&bcm2711_pv0_data,
+					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_DSI0,
+							      DRM_MODE_ENCODER_DSI,
+							      DRM_MODE_CONNECTOR_DSI),
+					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_DPI,
+							      DRM_MODE_ENCODER_DPI,
+							      DRM_MODE_CONNECTOR_DPI)),
+		VC4_MOCK_PIXELVALVE_DESC(&bcm2711_pv1_data,
+					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_DSI1,
+							      DRM_MODE_ENCODER_DSI,
+							      DRM_MODE_CONNECTOR_DSI)),
+		VC4_MOCK_PIXELVALVE_DESC(&bcm2711_pv2_data,
+					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_HDMI0,
+							      DRM_MODE_ENCODER_TMDS,
+							      DRM_MODE_CONNECTOR_HDMIA)),
+		VC4_MOCK_PIXELVALVE_DESC(&bcm2711_pv3_data,
+					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_VEC,
+							      DRM_MODE_ENCODER_TVDAC,
+							      DRM_MODE_CONNECTOR_Composite)),
+		VC4_MOCK_PIXELVALVE_DESC(&bcm2711_pv4_data,
+					 VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_HDMI1,
+							      DRM_MODE_ENCODER_TMDS,
+							      DRM_MODE_CONNECTOR_HDMIA)),
+);
+
+static int __build_one_pipe(struct kunit *test, struct drm_device *drm,
+			    const struct vc4_mock_pipe_desc *pipe)
+{
+	struct vc4_dummy_plane *dummy_plane;
+	struct drm_plane *plane;
+	struct vc4_dummy_crtc *dummy_crtc;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	dummy_plane = vc4_dummy_plane(test, drm, DRM_PLANE_TYPE_PRIMARY);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_plane);
+
+	plane = &dummy_plane->plane.base;
+	dummy_crtc = vc4_mock_pv(test, drm, plane, pipe->data);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_crtc);
+
+	crtc = &dummy_crtc->crtc.base;
+	for (i = 0; i < pipe->noutputs; i++) {
+		const struct vc4_mock_output_desc *mock_output = &pipe->outputs[i];
+		struct vc4_dummy_output *dummy_output;
+
+		dummy_output = vc4_dummy_output(test, drm, crtc,
+						mock_output->vc4_encoder_type,
+						mock_output->encoder_type,
+						mock_output->connector_type);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_output);
+	}
+
+	return 0;
+}
+
+static int __build_mock(struct kunit *test, struct drm_device *drm,
+			const struct vc4_mock_desc *mock)
+{
+
+	unsigned int i;
+
+	for (i = 0; i < mock->npipes; i++) {
+		const struct vc4_mock_pipe_desc *pipe = &mock->pipes[i];
+		int ret;
+
+		ret = __build_one_pipe(test, drm, pipe);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+	}
+
+	return 0;
+}
+
+static struct vc4_dev *__mock_device(struct kunit *test, bool is_vc5)
+{
+	struct drm_device *drm;
+	const struct drm_driver *drv = is_vc5 ? &vc5_drm_driver : &vc4_drm_driver;
+	const struct vc4_mock_desc *desc = is_vc5 ? &vc5_mock : NULL;
+	struct vc4_dev *vc4;
+	struct device *dev;
+	int ret;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	vc4 = drm_kunit_helper_alloc_drm_device_with_driver(test, dev,
+							    struct vc4_dev, base,
+							    drv);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
+
+	vc4->dev = dev;
+	vc4->is_vc5 = is_vc5;
+
+	vc4->hvs = __vc4_hvs_alloc(vc4, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4->hvs);
+
+	drm = &vc4->base;
+	ret = __build_mock(test, drm, desc);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = vc4_kms_load(drm);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_dev_register(drm, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	return vc4;
+}
+
+struct vc4_dev *vc4_mock_device(struct kunit *test)
+{
+	return __mock_device(test, false);
+}
+
+struct vc4_dev *vc5_mock_device(struct kunit *test)
+{
+	return __mock_device(test, true);
+}
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.h b/drivers/gpu/drm/vc4/tests/vc4_mock.h
new file mode 100644
index 000000000000..144af2ed6c40
--- /dev/null
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.h
@@ -0,0 +1,58 @@
+#ifndef VC4_MOCK_H_
+#define VC4_MOCK_H_
+
+#include "../vc4_drv.h"
+
+static inline
+struct drm_crtc *vc4_find_crtc_for_encoder(struct kunit *test,
+					   struct drm_device *drm,
+					   struct drm_encoder *encoder)
+{
+	struct drm_crtc *crtc;
+
+	KUNIT_ASSERT_EQ(test, hweight32(encoder->possible_crtcs), 1);
+
+	drm_for_each_crtc(crtc, drm)
+		if (encoder->possible_crtcs & drm_crtc_mask(crtc))
+			return crtc;
+
+	return NULL;
+}
+
+struct vc4_dummy_plane {
+	struct vc4_plane plane;
+};
+
+struct vc4_dummy_plane *vc4_dummy_plane(struct kunit *test,
+					struct drm_device *drm,
+					enum drm_plane_type type);
+
+struct vc4_dummy_crtc {
+	struct vc4_crtc crtc;
+};
+
+struct vc4_dummy_crtc *vc4_mock_pv(struct kunit *test,
+				   struct drm_device *drm,
+				   struct drm_plane *plane,
+				   const struct vc4_crtc_data *data);
+
+struct vc4_dummy_output {
+	struct vc4_encoder encoder;
+	struct drm_connector connector;
+};
+
+struct vc4_dummy_output *vc4_dummy_output(struct kunit *test,
+					  struct drm_device *drm,
+					  struct drm_crtc *crtc,
+					  enum vc4_encoder_type vc4_encoder_type,
+					  unsigned int kms_encoder_type,
+					  unsigned int connector_type);
+
+struct vc4_dev *vc4_mock_device(struct kunit *test);
+struct vc4_dev *vc5_mock_device(struct kunit *test);
+
+int vc4_mock_atomic_add_output(struct kunit *test, struct drm_device *drm,
+			       enum vc4_encoder_type type,
+			       struct drm_atomic_state *state);
+
+#endif // VC4_MOCK_H_
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c b/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
new file mode 100644
index 000000000000..213622f9fba2
--- /dev/null
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
@@ -0,0 +1,39 @@
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
+
+#include <kunit/test.h>
+
+#include "vc4_mock.h"
+
+static const struct drm_crtc_helper_funcs vc4_dummy_crtc_helper_funcs = {
+	.atomic_check	= vc4_crtc_atomic_check,
+};
+
+static const struct drm_crtc_funcs vc4_dummy_crtc_funcs = {
+	.atomic_destroy_state	= vc4_crtc_destroy_state,
+	.atomic_duplicate_state	= vc4_crtc_duplicate_state,
+	.reset			= vc4_crtc_reset,
+};
+
+struct vc4_dummy_crtc *vc4_mock_pv(struct kunit *test,
+				   struct drm_device *drm,
+				   struct drm_plane *plane,
+				   const struct vc4_crtc_data *data)
+{
+	struct vc4_dummy_crtc *dummy_crtc;
+	struct vc4_crtc *vc4_crtc;
+	int ret;
+
+	dummy_crtc = kunit_kzalloc(test, sizeof(*dummy_crtc), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, dummy_crtc);
+
+	vc4_crtc = &dummy_crtc->crtc;
+	ret = __vc4_crtc_init(drm, NULL,
+			      vc4_crtc, data, plane,
+			      &vc4_dummy_crtc_funcs,
+			      &vc4_dummy_crtc_helper_funcs,
+			      false);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	return dummy_crtc;
+}
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
new file mode 100644
index 000000000000..18bd088530fe
--- /dev/null
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
@@ -0,0 +1,97 @@
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_atomic_uapi.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_modeset_helper_vtables.h>
+
+#include <kunit/test.h>
+
+#include "vc4_mock.h"
+
+static const struct drm_connector_helper_funcs vc4_dummy_connector_helper_funcs = {
+};
+
+static const struct drm_connector_funcs vc4_dummy_connector_funcs = {
+	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
+	.reset			= drm_atomic_helper_connector_reset,
+};
+
+struct vc4_dummy_output *vc4_dummy_output(struct kunit *test,
+					  struct drm_device *drm,
+					  struct drm_crtc *crtc,
+					  enum vc4_encoder_type vc4_encoder_type,
+					  unsigned int kms_encoder_type,
+					  unsigned int connector_type)
+{
+	struct vc4_dummy_output *dummy_output;
+	struct drm_connector *conn;
+	struct drm_encoder *enc;
+	int ret;
+
+	dummy_output = kunit_kzalloc(test, sizeof(*dummy_output), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_output);
+	dummy_output->encoder.type = vc4_encoder_type;
+
+	enc = &dummy_output->encoder.base;
+	ret = drmm_encoder_init(drm, enc,
+				NULL,
+				kms_encoder_type,
+				NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	enc->possible_crtcs = drm_crtc_mask(crtc);
+
+	conn = &dummy_output->connector;
+	ret = drmm_connector_init(drm, conn,
+				  &vc4_dummy_connector_funcs,
+				  connector_type,
+				  NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_connector_helper_add(conn, &vc4_dummy_connector_helper_funcs);
+	drm_connector_attach_encoder(conn, enc);
+
+	return dummy_output;
+}
+
+static const struct drm_display_mode default_mode = {
+	DRM_SIMPLE_MODE(640, 480, 64, 48)
+};
+
+int vc4_mock_atomic_add_output(struct kunit *test, struct drm_device *drm,
+			       enum vc4_encoder_type type,
+			       struct drm_atomic_state *state)
+{
+	struct vc4_dummy_output *output;
+	struct drm_connector *conn;
+	struct drm_connector_state *conn_state;
+	struct drm_encoder *encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	encoder = vc4_find_encoder_by_type(drm, type);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder);
+
+	crtc = vc4_find_crtc_for_encoder(test, drm, encoder);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+
+	output = container_of(encoder, struct vc4_dummy_output, encoder.base);
+	conn = &output->connector;
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, &default_mode);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	crtc_state->active = true;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
new file mode 100644
index 000000000000..106d3bd53aa5
--- /dev/null
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
@@ -0,0 +1,45 @@
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_plane.h>
+
+#include <kunit/test.h>
+
+#include "vc4_mock.h"
+
+static const struct drm_plane_helper_funcs vc4_dummy_plane_helper_funcs = {
+};
+
+static const struct drm_plane_funcs vc4_dummy_plane_funcs = {
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.reset			= drm_atomic_helper_plane_reset,
+};
+
+static const uint32_t vc4_dummy_plane_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+struct vc4_dummy_plane *vc4_dummy_plane(struct kunit *test,
+					struct drm_device *drm,
+					enum drm_plane_type type)
+{
+	struct vc4_dummy_plane *dummy_plane;
+	struct drm_plane *plane;
+
+	dummy_plane = drmm_universal_plane_alloc(drm,
+						 struct vc4_dummy_plane, plane.base,
+						 0,
+						 &vc4_dummy_plane_funcs,
+						 vc4_dummy_plane_formats,
+						 ARRAY_SIZE(vc4_dummy_plane_formats),
+						 NULL,
+						 DRM_PLANE_TYPE_PRIMARY,
+						 NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_plane);
+
+	plane = &dummy_plane->plane.base;
+	drm_plane_helper_add(plane, &vc4_dummy_plane_helper_funcs);
+
+	return dummy_plane;
+}
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 59e473059fa2..21b40d644ace 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -675,8 +675,8 @@ void vc4_crtc_get_margins(struct drm_crtc_state *state,
 	}
 }
 
-static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
-				 struct drm_atomic_state *state)
+int vc4_crtc_atomic_check(struct drm_crtc *crtc,
+			  struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
@@ -1116,7 +1116,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 	.get_scanout_position = vc4_crtc_get_scanout_position,
 };
 
-static const struct vc4_pv_data bcm2835_pv0_data = {
+const struct vc4_pv_data bcm2835_pv0_data = {
 	.base = {
 		.name = "pixelvalve-0",
 		.debugfs_name = "crtc0_regs",
@@ -1131,7 +1131,7 @@ static const struct vc4_pv_data bcm2835_pv0_data = {
 	},
 };
 
-static const struct vc4_pv_data bcm2835_pv1_data = {
+const struct vc4_pv_data bcm2835_pv1_data = {
 	.base = {
 		.name = "pixelvalve-1",
 		.debugfs_name = "crtc1_regs",
@@ -1146,7 +1146,7 @@ static const struct vc4_pv_data bcm2835_pv1_data = {
 	},
 };
 
-static const struct vc4_pv_data bcm2835_pv2_data = {
+const struct vc4_pv_data bcm2835_pv2_data = {
 	.base = {
 		.name = "pixelvalve-2",
 		.debugfs_name = "crtc2_regs",
@@ -1161,7 +1161,7 @@ static const struct vc4_pv_data bcm2835_pv2_data = {
 	},
 };
 
-static const struct vc4_pv_data bcm2711_pv0_data = {
+const struct vc4_pv_data bcm2711_pv0_data = {
 	.base = {
 		.name = "pixelvalve-0",
 		.debugfs_name = "crtc0_regs",
@@ -1176,7 +1176,7 @@ static const struct vc4_pv_data bcm2711_pv0_data = {
 	},
 };
 
-static const struct vc4_pv_data bcm2711_pv1_data = {
+const struct vc4_pv_data bcm2711_pv1_data = {
 	.base = {
 		.name = "pixelvalve-1",
 		.debugfs_name = "crtc1_regs",
@@ -1191,7 +1191,7 @@ static const struct vc4_pv_data bcm2711_pv1_data = {
 	},
 };
 
-static const struct vc4_pv_data bcm2711_pv2_data = {
+const struct vc4_pv_data bcm2711_pv2_data = {
 	.base = {
 		.name = "pixelvalve-2",
 		.debugfs_name = "crtc2_regs",
@@ -1205,7 +1205,7 @@ static const struct vc4_pv_data bcm2711_pv2_data = {
 	},
 };
 
-static const struct vc4_pv_data bcm2711_pv3_data = {
+const struct vc4_pv_data bcm2711_pv3_data = {
 	.base = {
 		.name = "pixelvalve-3",
 		.debugfs_name = "crtc3_regs",
@@ -1219,7 +1219,7 @@ static const struct vc4_pv_data bcm2711_pv3_data = {
 	},
 };
 
-static const struct vc4_pv_data bcm2711_pv4_data = {
+const struct vc4_pv_data bcm2711_pv4_data = {
 	.base = {
 		.name = "pixelvalve-4",
 		.debugfs_name = "crtc4_regs",
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index b66bf7aea632..af6a83ac8526 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -196,7 +196,7 @@ static const struct drm_ioctl_desc vc4_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(VC4_PERFMON_GET_VALUES, vc4_perfmon_get_values_ioctl, DRM_RENDER_ALLOW),
 };
 
-static const struct drm_driver vc4_drm_driver = {
+const struct drm_driver vc4_drm_driver = {
 	.driver_features = (DRIVER_MODESET |
 			    DRIVER_ATOMIC |
 			    DRIVER_GEM |
@@ -225,7 +225,7 @@ static const struct drm_driver vc4_drm_driver = {
 	.patchlevel = DRIVER_PATCHLEVEL,
 };
 
-static const struct drm_driver vc5_drm_driver = {
+const struct drm_driver vc5_drm_driver = {
 	.driver_features = (DRIVER_MODESET |
 			    DRIVER_ATOMIC |
 			    DRIVER_GEM),
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index e0be7a81a24a..e2a56c32a124 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -24,6 +24,9 @@
 struct drm_device;
 struct drm_gem_object;
 
+extern const struct drm_driver vc4_drm_driver;
+extern const struct drm_driver vc5_drm_driver;
+
 /* Don't forget to update vc4_bo.c: bo_type_names[] when adding to
  * this.
  */
@@ -523,6 +526,8 @@ struct vc4_crtc_data {
 	int hvs_output;
 };
 
+extern const struct vc4_crtc_data vc4_txp_crtc_data;
+
 struct vc4_pv_data {
 	struct vc4_crtc_data	base;
 
@@ -535,6 +540,12 @@ struct vc4_pv_data {
 	enum vc4_encoder_type encoder_types[4];
 };
 
+extern const struct vc4_pv_data bcm2711_pv0_data;
+extern const struct vc4_pv_data bcm2711_pv1_data;
+extern const struct vc4_pv_data bcm2711_pv2_data;
+extern const struct vc4_pv_data bcm2711_pv3_data;
+extern const struct vc4_pv_data bcm2711_pv4_data;
+
 struct vc4_crtc {
 	struct drm_crtc base;
 	struct platform_device *pdev;
@@ -920,6 +931,8 @@ int vc4_page_flip(struct drm_crtc *crtc,
 		  struct drm_pending_vblank_event *event,
 		  uint32_t flags,
 		  struct drm_modeset_acquire_ctx *ctx);
+int vc4_crtc_atomic_check(struct drm_crtc *crtc,
+			  struct drm_atomic_state *state);
 struct drm_crtc_state *vc4_crtc_duplicate_state(struct drm_crtc *crtc);
 void vc4_crtc_destroy_state(struct drm_crtc *crtc,
 			    struct drm_crtc_state *state);
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 4f7ce5d3e8ad..2b69454b8534 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -479,7 +479,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static const struct vc4_crtc_data vc4_txp_crtc_data = {
+const struct vc4_crtc_data vc4_txp_crtc_data = {
 	.name = "txp",
 	.debugfs_name = "txp_regs",
 	.hvs_available_channels = BIT(2),

-- 
2.38.1-b4-0.11.0-dev-d416f
