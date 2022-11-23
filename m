Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B419D6363BB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A396B10E599;
	Wed, 23 Nov 2022 15:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD7F10E590
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:30:40 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id CCC072B06A7A;
 Wed, 23 Nov 2022 10:30:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 23 Nov 2022 10:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217437; x=
 1669224637; bh=Kn0jEDr6ilQeumCW1sMn23t7MV4zXW26u3x4urGyZ1E=; b=h
 ftzPcBfiD66bDvkdUe2EJoZIrjIH6CnxwwdpSTCZOxPGvCLRicWo49kDr1bLuqdn
 JrI5GRItmqDlTxm4QAIVy1yIOFKWFeecBaTWJjbQ1UJqY7uEkmWZfOU2E5MfkN3K
 7MGtd+AGS3ZJuydDWAdOVj+QbMf/gb0mrgIY2JYYC5kkVWaBh4+ZwAOpa7Z7fkci
 e/63aXshI/lLwjBbHB/Uu2TQFeHNqzoxU/8hJ4rYbGwVDP5PHrszknq2YqvXODA5
 DoFQn7JLy3rftEAAa9Ooubnuvrd+Q7zlrs8LVQ85c+J7+nwCwitjx4YtgE/m/fND
 uETTA/tgKzpozTd2HgO9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217437; x=
 1669224637; bh=Kn0jEDr6ilQeumCW1sMn23t7MV4zXW26u3x4urGyZ1E=; b=O
 DD/8OkHGwVmNrXEHw6VQKH+n9ov1d/Dz90k0P4YrQ1+CAz/s1CY7lZ7XYTqWAHyj
 Iql3/LgVilJ0pgf/GHlqQjBAxqJTfMLZn4UJAOW6yjoWqjLAiN7T/Is8BYl8yvri
 GLPP8gnLoHsAa4O8EVe9bkJiftcUB8toGn19qTRy5futkUlgz2sq8AxnleOux/Nb
 j5zByU0ejTcp0cJAoMaXhMWZny8C1F7yfdx6MX9YH1yWEZi4qxe2YqmyaR7kp6Ur
 ch/zMWqp6ZmY4VtLh+lEX8D5uFn8h8FnPEt1Mnayi8X62QwvS4TUfvPo5T85uHl0
 0eGa0FgC0xEZ0zp8SgWeQ==
X-ME-Sender: <xms:nTx-Y88LNEO5hQaSV1JyiXdOhQ0DunuMWQQW-9W-Q2gCWj4cN1f7-A>
 <xme:nTx-Y0sdjww5YGyUnAUlFw18ebNmxFHzYPsKx4rOVbvRAUfbVUDCT-YzunRe6Lzxu
 HPlAkm1MYNuXwtvwBc>
X-ME-Received: <xmr:nTx-YyAzxe_gQT-mNyXStoQcBQmgqtlfSin6nWXVo5VZjX8tC3oSQAnxL943QmuNDUKnqrwrrhpjBH2cPXeArpN7EdB-2QPrj2l3NUlBM1OGkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nTx-Y8fwSGl6hcIlZ8rZ-zhehwlRSa9ExoEn7e-wpkC1Kk-1ZIvgYA>
 <xmx:nTx-YxMTGSJMoiEPbnVKu9twHNcPbOeG79AFecJ7gCGyJbdzFEwYXw>
 <xmx:nTx-Y2nNOpyG7AbgCYX8Pszu7aLh_BoMSM2tM1WJq4tc8RCWnVP3vA>
 <xmx:nTx-Y3swuWQNYEO-GkyfLXNf-SSeuDenwQp09wut-23w7cShEAOsYw2Hcwc>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:30:36 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:26:06 +0100
Subject: [PATCH 24/24] drm/vc4: tests: Add unit test suite for the PV muxing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-24-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=22306; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=0jcuyvJbNGCQTz4IGo7ipsp/+oVzgZ8Uvu2piEAFcmk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11jUCmmzX/53hK9Frv8TSWXTAufL8kvTcuVNtenN5y8Xe
 /VboKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwEQ6/jH8M2Vqfrdk79UYrx/1pWlOGa
 0CbxdpNEvf3bs8RvSXQWFIL8M/Y/H7t20eKuyWMOn6PP3RNwfW6lb2+A/7+sPDf4lY7y1gAgA=
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

The HVS to PixelValve muxing code is fairly error prone and has a bunch
of arbitrary constraints due to the hardware setup.

Let's create a test suite that makes sure that the possible combinations
work and the invalid ones don't.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/tests/Makefile             |   3 +-
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 624 +++++++++++++++++++++++++
 2 files changed, 626 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/tests/Makefile b/drivers/gpu/drm/vc4/tests/Makefile
index 3e8a7b4f9017..1ae143c415a4 100644
--- a/drivers/gpu/drm/vc4/tests/Makefile
+++ b/drivers/gpu/drm/vc4/tests/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_DRM_VC4_KUNIT_TEST) += \
 	vc4_mock.o \
 	vc4_mock_crtc.o \
 	vc4_mock_output.o \
-	vc4_mock_plane.o
+	vc4_mock_plane.o \
+	vc4_test_pv_muxing.o
diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
new file mode 100644
index 000000000000..3047fc768c09
--- /dev/null
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -0,0 +1,624 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_atomic_uapi.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_mode.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_plane.h>
+
+#include <kunit/test.h>
+
+#include "../../tests/drm_kunit_helpers.h"
+
+#include "../vc4_drv.h"
+
+#include "vc4_mock.h"
+
+struct pv_muxing_priv {
+	struct vc4_dev *vc4;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+};
+
+static bool check_fifo_conflict(struct kunit *test,
+				const struct drm_atomic_state *state)
+{
+	struct vc4_hvs_state *hvs_state;
+	unsigned int used_fifos = 0;
+	unsigned int i;
+
+	hvs_state = vc4_hvs_get_new_global_state(state);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hvs_state);
+
+	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
+		if (!hvs_state->fifo_state[i].in_use)
+			continue;
+
+		KUNIT_EXPECT_FALSE(test, used_fifos & BIT(i));
+		used_fifos |= BIT(i);
+	}
+
+	return true;
+}
+
+struct encoder_constraint {
+	enum vc4_encoder_type type;
+	unsigned int *channels;
+	size_t nchannels;
+};
+
+#define ENCODER_CONSTRAINT(_type, ...)					\
+	{								\
+		.type = _type,						\
+		.channels = (unsigned int[]) { __VA_ARGS__ },		\
+		.nchannels = sizeof((unsigned int[]) { __VA_ARGS__ }) /	\
+			     sizeof(unsigned int),			\
+	}
+
+static bool __check_encoder_constraints(const struct encoder_constraint *constraints,
+					size_t nconstraints,
+					enum vc4_encoder_type type,
+					unsigned int channel)
+{
+	unsigned int i;
+
+	for (i = 0; i < nconstraints; i++) {
+		const struct encoder_constraint *constraint = &constraints[i];
+		unsigned int j;
+
+		if (constraint->type != type)
+			continue;
+
+		for (j = 0; j < constraint->nchannels; j++) {
+			unsigned int _channel = constraint->channels[j];
+
+			if (channel != _channel)
+				continue;
+
+			return true;
+		}
+	}
+
+	return false;
+}
+
+static const struct encoder_constraint vc5_encoder_constraints[] = {
+	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DPI, 0),
+	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI0, 0),
+	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_VEC, 1),
+	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_TXP, 0, 2),
+	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI1, 0, 1, 2),
+	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_HDMI0, 0, 1, 2),
+	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_HDMI1, 0, 1, 2),
+};
+
+static bool check_vc5_encoder_constraints(enum vc4_encoder_type type, unsigned int channel)
+{
+	return __check_encoder_constraints(vc5_encoder_constraints,
+					   ARRAY_SIZE(vc5_encoder_constraints),
+					   type, channel);
+}
+
+static bool check_channel_for_encoder(struct kunit *test,
+				      const struct drm_atomic_state *state,
+				      enum vc4_encoder_type type)
+{
+	struct drm_device *drm = state->dev;
+	struct drm_encoder *encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	struct vc4_crtc_state *new_vc4_crtc_state;
+	struct vc4_hvs_state *new_hvs_state;
+	unsigned int channel;
+
+	new_hvs_state = vc4_hvs_get_new_global_state(state);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
+
+	encoder = vc4_find_encoder_by_type(drm, type);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder);
+
+	crtc = vc4_find_crtc_for_encoder(test, drm, encoder);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	new_vc4_crtc_state = to_vc4_crtc_state(crtc_state);
+	channel = new_vc4_crtc_state->assigned_channel;
+	KUNIT_EXPECT_NE(test, channel, VC4_HVS_CHANNEL_DISABLED);
+
+	KUNIT_EXPECT_TRUE(test, new_hvs_state->fifo_state[channel].in_use);
+
+	KUNIT_EXPECT_TRUE(test,
+			  check_vc5_encoder_constraints(type,
+							channel));
+
+	return true;
+}
+
+struct pv_muxing_param {
+	const char *name;
+	enum vc4_encoder_type *encoders;
+	size_t nencoders;
+};
+
+#define PV_MUXING_TEST(_name, ...)							\
+	{										\
+		.name = _name,								\
+		.encoders = (enum vc4_encoder_type[]) { __VA_ARGS__ },			\
+		.nencoders = sizeof((enum vc4_encoder_type[]) { __VA_ARGS__ }) /	\
+			     sizeof(enum vc4_encoder_type),				\
+	}
+
+static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
+	PV_MUXING_TEST("1 output: DPI",
+		       VC4_ENCODER_TYPE_DPI),
+	PV_MUXING_TEST("1 output: DSI0",
+		       VC4_ENCODER_TYPE_DSI0),
+	PV_MUXING_TEST("1 output: DSI1",
+		       VC4_ENCODER_TYPE_DSI1),
+	PV_MUXING_TEST("1 output: HDMI0",
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("1 output: HDMI1",
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("1 output: VEC",
+		       VC4_ENCODER_TYPE_VEC),
+	PV_MUXING_TEST("2 output: DPI, DSI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_DSI1),
+	PV_MUXING_TEST("2 output: DPI, HDMI0",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("2 output: DPI, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("2 output: DPI, TXP",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_TXP),
+	PV_MUXING_TEST("2 output: DPI, VEC",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC),
+	PV_MUXING_TEST("2 output: DPI, DSI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_DSI1),
+	PV_MUXING_TEST("2 output: DSI0, DSI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_DSI1),
+	PV_MUXING_TEST("2 output: DSI0, HDMI0",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("2 output: DSI0, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("2 output: DSI0, TXP",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_TXP),
+	PV_MUXING_TEST("2 output: DSI0, VEC",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC),
+	PV_MUXING_TEST("2 output: DSI0, DSI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_DSI1),
+	PV_MUXING_TEST("2 output: DSI1, VEC",
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_VEC),
+	PV_MUXING_TEST("2 output: DSI1, TXP",
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_TXP),
+	PV_MUXING_TEST("2 output: DSI1, HDMI0",
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("2 output: DSI1, HDMI1",
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("2 output: HDMI0, VEC",
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_VEC),
+	PV_MUXING_TEST("2 output: HDMI0, TXP",
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_TXP),
+	PV_MUXING_TEST("2 output: HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("2 output: HDMI1, VEC",
+		       VC4_ENCODER_TYPE_HDMI1,
+		       VC4_ENCODER_TYPE_VEC),
+	PV_MUXING_TEST("2 output: HDMI1, TXP",
+		       VC4_ENCODER_TYPE_HDMI1,
+		       VC4_ENCODER_TYPE_TXP),
+	PV_MUXING_TEST("2 output: TXP, VEC",
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_VEC),
+	PV_MUXING_TEST("3 output: DPI, VEC, TXP",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP),
+	PV_MUXING_TEST("3 output: DPI, VEC, DSI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_DSI1),
+	PV_MUXING_TEST("3 output: DPI, VEC, HDMI0",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("3 output: DPI, VEC, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("3 output: DPI, TXP, DSI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1),
+	PV_MUXING_TEST("3 output: DPI, TXP, HDMI0",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("3 output: DPI, TXP, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("3 output: DPI, DSI1, HDMI0",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("3 output: DPI, DSI1, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("3 output: DPI, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("3 output: DSI0, VEC, TXP",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP),
+	PV_MUXING_TEST("3 output: DSI0, VEC, DSI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_DSI1),
+	PV_MUXING_TEST("3 output: DSI0, VEC, HDMI0",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("3 output: DSI0, VEC, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("3 output: DSI0, TXP, DSI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1),
+	PV_MUXING_TEST("3 output: DSI0, TXP, HDMI0",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("3 output: DSI0, TXP, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("3 output: DSI0, DSI1, HDMI0",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("3 output: DSI0, DSI1, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("3 output: DSI0, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+};
+
+static void vc4_test_pv_muxing_desc(const struct pv_muxing_param *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(vc5_test_pv_muxing,
+		  vc5_test_pv_muxing_params,
+		  vc4_test_pv_muxing_desc);
+
+static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
+	PV_MUXING_TEST("DPI/DSI0 Conflict",
+		       VC4_ENCODER_TYPE_DPI, VC4_ENCODER_TYPE_DSI0),
+	PV_MUXING_TEST("More than 3 output: DPI, VEC, TXP, DSI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1),
+	PV_MUXING_TEST("More than 3 output: DPI, VEC, TXP, HDMI0",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("More than 3 output: DPI, VEC, TXP, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DPI, VEC, DSI1, HDMI0",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("More than 3 output: DPI, VEC, DSI1, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DPI, VEC, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DPI, TXP, DSI1, HDMI0",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("More than 3 output: DPI, TXP, DSI1, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DPI, TXP, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DPI, DSI1, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DPI, VEC, TXP, DSI1, HDMI0",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("More than 3 output: DPI, VEC, TXP, DSI1, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DPI, VEC, TXP, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DPI, VEC, DSI1, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DPI, TXP, DSI1, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DSI0, VEC, TXP, DSI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1),
+	PV_MUXING_TEST("More than 3 output: DSI0, VEC, TXP, HDMI0",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("More than 3 output: DSI0, VEC, TXP, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DSI0, VEC, DSI1, HDMI0",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("More than 3 output: DSI0, VEC, DSI1, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DSI0, VEC, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DSI0, TXP, DSI1, HDMI0",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("More than 3 output: DSI0, TXP, DSI1, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DSI0, TXP, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DSI0, DSI1, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DSI0, VEC, TXP, DSI1, HDMI0",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0),
+	PV_MUXING_TEST("More than 3 output: DSI0, VEC, TXP, DSI1, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DSI0, VEC, TXP, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DSI0, VEC, DSI1, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DSI0, TXP, DSI1, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: VEC, TXP, DSI1, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DPI, VEC, TXP, DSI1, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DPI,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+	PV_MUXING_TEST("More than 3 output: DSI0, VEC, TXP, DSI1, HDMI0, HDMI1",
+		       VC4_ENCODER_TYPE_DSI0,
+		       VC4_ENCODER_TYPE_VEC,
+		       VC4_ENCODER_TYPE_TXP,
+		       VC4_ENCODER_TYPE_DSI1,
+		       VC4_ENCODER_TYPE_HDMI0,
+		       VC4_ENCODER_TYPE_HDMI1),
+};
+
+KUNIT_ARRAY_PARAM(vc5_test_pv_muxing_invalid,
+		  vc5_test_pv_muxing_invalid_params,
+		  vc4_test_pv_muxing_desc);
+
+static void drm_vc5_test_pv_muxing(struct kunit *test)
+{
+	const struct pv_muxing_priv *priv = test->priv;
+	const struct pv_muxing_param *params = test->param_value;
+	struct vc4_dev *vc4 = priv->vc4;
+	struct drm_device *drm = &vc4->base;
+	struct drm_atomic_state *state = priv->state;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < params->nencoders; i++) {
+		enum vc4_encoder_type enc_type = params->encoders[i];
+
+		ret = vc4_mock_atomic_add_output(test, drm, enc_type, state);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+	}
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_TRUE(test,
+			  check_fifo_conflict(test, state));
+
+	for (i = 0; i < params->nencoders; i++) {
+		enum vc4_encoder_type enc_type = params->encoders[i];
+
+		KUNIT_EXPECT_TRUE(test, check_channel_for_encoder(test, state, enc_type));
+	}
+}
+
+static void drm_vc4_test_pv_muxing_invalid(struct kunit *test)
+{
+	const struct pv_muxing_priv *priv = test->priv;
+	const struct pv_muxing_param *params = test->param_value;
+	struct vc4_dev *vc4 = priv->vc4;
+	struct drm_device *drm = &vc4->base;
+	struct drm_atomic_state *state = priv->state;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < params->nencoders; i++) {
+		enum vc4_encoder_type enc_type = params->encoders[i];
+
+		ret = vc4_mock_atomic_add_output(test, drm, enc_type, state);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+	}
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+static int vc5_pv_muxing_test_init(struct kunit *test)
+{
+	struct drm_atomic_state *state;
+	struct pv_muxing_priv *priv;
+	struct drm_device *drm;
+	struct vc4_dev *vc4;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+	test->priv = priv;
+
+	vc4 = vc5_mock_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
+	priv->vc4 = vc4;
+
+	drm_modeset_acquire_init(&priv->ctx, 0);
+
+	drm = &vc4->base;
+	state = drm_atomic_state_alloc(drm);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	state->acquire_ctx = &priv->ctx;
+
+	priv->state = state;
+
+	return 0;
+}
+
+static void vc4_pv_muxing_test_exit(struct kunit *test)
+{
+	struct pv_muxing_priv *priv = test->priv;
+	struct vc4_dev *vc4 = priv->vc4;
+	struct drm_device *drm = &vc4->base;
+	struct drm_atomic_state *state = priv->state;
+
+	drm_atomic_state_put(state);
+	drm_modeset_drop_locks(&priv->ctx);
+	drm_modeset_acquire_fini(&priv->ctx);
+	drm_dev_unregister(drm);
+	drm_kunit_helper_free_device(test, vc4->dev);
+}
+
+static struct kunit_case vc5_pv_muxing_tests[] = {
+	KUNIT_CASE_PARAM(drm_vc5_test_pv_muxing,
+			 vc5_test_pv_muxing_gen_params),
+	KUNIT_CASE_PARAM(drm_vc4_test_pv_muxing_invalid,
+			 vc5_test_pv_muxing_invalid_gen_params),
+	{}
+};
+
+static struct kunit_suite vc5_pv_muxing_test_suite = {
+	.name = "vc5-pv-muxing",
+	.init = vc5_pv_muxing_test_init,
+	.exit = vc4_pv_muxing_test_exit,
+	.test_cases = vc5_pv_muxing_tests,
+};
+
+kunit_test_suite(vc5_pv_muxing_test_suite);

-- 
2.38.1-b4-0.11.0-dev-d416f
