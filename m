Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE1163ABCD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8463810E22C;
	Mon, 28 Nov 2022 14:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0F910E20A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 14:57:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 139A92B04FDA;
 Mon, 28 Nov 2022 09:57:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 28 Nov 2022 09:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669647453; x=
 1669654653; bh=py8PDDnsAG9U+kZEZs3AKxYkLP4sXwMkKPr4FNwCvVk=; b=n
 W5Tvqpky7wwCauViDmuRBlaW+daMx5dS7zJg4UYMxvzXCoRQTc/fZE4zVyPnwlKd
 I2c4/ktf2RkKXv4bxQGDVHpTNq3Q1TA5G763F76g0G4QnxDR8Fs3rlM/7IRGD1ln
 5X/rUGOXI9z2UqV2iI4VzqSv0kcGV+JnouQw300rAwYK98Dotcl2rXRfhqFH4bOC
 W+sLNiZvdI6iTujLzYGHi0ZmNM/0GfshZ+JA5dpmhQoVGot5B833nBjkRMz+KzYe
 BMwyeSSaJokzhrU0E1Y48Bk3s6PyNPxpvI9NINONbpObFwrVgPzXSkM3tNb4Rzk8
 K1pDPPT5D2I3fCwxfk0vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669647453; x=
 1669654653; bh=py8PDDnsAG9U+kZEZs3AKxYkLP4sXwMkKPr4FNwCvVk=; b=t
 1DGTbyK53IuSN+uuyvYcLzLwqB+Es2xO00xH1bN0O8yT0DVT33VEgQubZv7gXKL0
 c1IObh/uhw0LfJivsSywPbTE9sdsSZi3a+T4znbdDpoymx2IgdjaR3F/P3/fi5/6
 +qQ1L++QlYHbHh0MJKZWfFIF8aXC/2JmfpU2pz/kASvZSdg2047JfE+lFa20vc2u
 KMlv4pHOFSiqG67SN1yFNm7jf5kn53c2x802NiL/VgZxPpuRUrw3p33c4GyGxpHX
 bawKtq8NinU4kjffNFPccP1reFLFjkJTEMP0C5PiJvZJ9M8rZxhK20a4rMpzeSg6
 2DZzkNd1DGg5DzlsUB8UA==
X-ME-Sender: <xms:XMyEY2LPjVEc7BKW1e7DUis2flZt9H3kh837GiJk4NfLFLfXsz_5LA>
 <xme:XMyEY-J0AZQov5lmxUyLlVoBVnLKpvYpY9VCSx1HVKJRSZ1yB-XH04WjJv3KF9NDq
 Y-oogeX-AOKUEzS3xQ>
X-ME-Received: <xmr:XMyEY2soWgdNlqyh20y2OhkABuREILpgRxtUTbI0W68fMfimN25WWZPnLDXHpkylvZbc2jBPlm_Jxw4VSSZyneKUZjFeWSSpijV9ENcj9ezAAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XcyEY7bDOnM_-dS-1RknwyzitMQJgWQHZoKoZCnQmXCFWsh1c4gqPA>
 <xmx:XcyEY9ac5lcBftgsgey_JCDph6CGTwq8R8GMaQJukwsYd1z6bPT8Pg>
 <xmx:XcyEY3CnR0gMMlfX1L_l68HDkS9pqgpxzr2LScw6L3n-1qOIQlvobw>
 <xmx:XcyEYx5dvCjU5CMGZHHaXuOcjbozZyFthCnPrfYWMUWprEDyoCyA3LvrNkQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 09:57:31 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 28 Nov 2022 15:53:39 +0100
Subject: [PATCH v2 10/17] drm/tests: Add a test for DRM managed actions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v2-10-efe5ed518b63@cerno.tech>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2983; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=If82id84BIcGRk+t7uJZMD4S1Jl5+r8AAdKjIzdNSN8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMktp8vYTFND91ZIXP4ww9q2PIEzlPXystjJMxMSi/VKVvV+
 MfncUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIm8fsLIcLN7wYaZjm49OzjCnDwtfv
 xNubtSUdZBW8nFWP6Ez9MlXowMM9cV8FZpiRTtnzHv8bytBpdr0jO2y3UEKXPWmV2TYfjEAAA=
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
Cc: David Gow <davidgow@google.com>, Maíra Canal <mairacanal@riseup.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM-managed actions are supposed to be ran whenever the device is
released. Let's introduce a basic unit test to make sure it happens.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/Makefile           |  1 +
 drivers/gpu/drm/tests/drm_managed_test.c | 71 ++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 94fe546d937d..486053052ba9 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_format_test.o \
 	drm_framebuffer_test.o \
 	drm_kunit_helpers.o \
+	drm_managed_test.o \
 	drm_mm_test.o \
 	drm_modes_test.o \
 	drm_plane_helper_test.o \
diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
new file mode 100644
index 000000000000..1652dca11d30
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
+#include <drm/drm_managed.h>
+
+#include <kunit/resource.h>
+
+#include <linux/device.h>
+
+/* Ought to be enough for anybody */
+#define TEST_TIMEOUT_MS	100
+
+struct managed_test_priv {
+	bool action_done;
+	wait_queue_head_t action_wq;
+};
+
+static void drm_action(struct drm_device *drm, void *ptr)
+{
+	struct managed_test_priv *priv = ptr;
+
+	priv->action_done = true;
+	wake_up_interruptible(&priv->action_wq);
+}
+
+static void drm_test_managed_run_action(struct kunit *test)
+{
+	struct managed_test_priv *priv;
+	struct drm_device *drm;
+	struct device *dev;
+	int ret;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+	init_waitqueue_head(&priv->action_wq);
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+
+	ret = drmm_add_action_or_reset(drm, drm_action, priv);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	ret = drm_dev_register(drm, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_dev_unregister(drm);
+	drm_kunit_helper_free_device(test, dev);
+
+	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
+					       msecs_to_jiffies(TEST_TIMEOUT_MS));
+	KUNIT_EXPECT_GT(test, ret, 0);
+}
+
+static struct kunit_case drm_managed_tests[] = {
+	KUNIT_CASE(drm_test_managed_run_action),
+	{}
+};
+
+static struct kunit_suite drm_managed_test_suite = {
+	.name = "drm-test-managed",
+	.test_cases = drm_managed_tests
+};
+
+kunit_test_suite(drm_managed_test_suite);
+
+MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
+MODULE_LICENSE("GPL");

-- 
2.38.1-b4-0.11.0-dev-d416f
