Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DC363F375
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A1010E60F;
	Thu,  1 Dec 2022 15:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139EF10E604
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:15:10 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6EAC558039C;
 Thu,  1 Dec 2022 10:15:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 01 Dec 2022 10:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907709; x=
 1669914909; bh=4qyLjNj9I2PgaCEUKxaTESctL+iP/Fgu4safJAulzr8=; b=h
 RdhfTMROoBbPs8839WQ0SWSjNFTS9vGwidZWm4ZEtSdUxyYC88tdJC/8ytD2kc7x
 m5aHgpO+5QjWtwc95aUf3wsVPjCmXTJgHrug9tigVH27VkGbXl+c6z3/oDbtZj/a
 4QcMXlyPxaBSzHWkqfdD/uE09pmzS5E3UCJ/TyyOm0yFQVx2DaCFk0kLA4XMOLfg
 UJxRYQ6xygwujLbguaHCRdlcCVbNaZ/67Q4+mr76NyVRjCVWog8B3nQmvfAu8lwG
 ork8dePz1MHU8yUDytRY+RumLfvB7NPKUZ3LiYJPpfTYNW1OkUykPTnWVtKmGWMY
 dlMqBN7sfdgm5OXuV/+cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907709; x=
 1669914909; bh=4qyLjNj9I2PgaCEUKxaTESctL+iP/Fgu4safJAulzr8=; b=m
 5vVkZv+YF2cF5cvuSZF2XewNsLmU4p/2V26fdCC7/HPA3g78kynlcyL5oeLCVurj
 iVSgt/0QQ6ekSyk6SAI35XPpmXZkLKsXzSPjb/6AZUSf0Je7XRJ0ZWG77lDAFuhb
 JEGPiUYXxGQXTLv6ElVYuu+T5rOXQ9vgEz5KxxZGdU4w/n8nTEffttUJrUAngdzp
 nvSiZyuQbR8XjXMxQwlRg4ughUxleS8FXuN58XUOViCmLm9W38ALPfEPAzZu4im8
 LR3prZOs6mWvrQIAezG6JiUPrG+E2+2yF1ydcI1u589JvRBPjVfO8YQLz0CvbPsy
 DUHxht2Rjm+QpmvRa2/Ig==
X-ME-Sender: <xms:-8SIY6KY7xaaDsbxd7uUJ6dvRGcvv7Z5OvkuV6rkYv7PaxBTlbjo1g>
 <xme:-8SIYyKlc4Dr5PbzDF4fYsLjLEPO87AZLuUEyRV_yakwACfHQD9OJxB63Iw-MkEnF
 7XIDDwVVD5IGygYEmc>
X-ME-Received: <xmr:-8SIY6szUkYIzlWEHCDJtrTsW1JMKJt7dcG9fATX3VhiMsm3ceZRB5bV3viCizMN3uHUK9dL4RjshK4R5u7nohtbYfbI3Un6rkKfh5Tix9ssyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-8SIY_YN8_v2rxUEZTfO40En_UWPeCc0-aPCJs6e83fEI1ROstRKXg>
 <xmx:-8SIYxa6ExQtbKu_UOgm92JeDe06rWfzeUQTqoZDoIaFT9_i6NhDjQ>
 <xmx:-8SIY7CbxGY_R5FocKFMIBeFR8V4TS96zHVlXe-y_3pAGkSMRtix2Q>
 <xmx:_cSIYy4lUQIavrd6aQ451EZWo1ubCrsothpFmt2OCLAQSwBR-O7rFw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:15:06 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:43 +0100
Subject: [PATCH v3 12/20] drm/tests: Add a test for DRM managed actions
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221123-rpi-kunit-tests-v3-12-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3018; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Av6gZFakHRoxX8sJF2gVpTz9tFILeIP7wlDUh3ydDfM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdRzSYklY0LNCfMfewxvSCMq/6LkmNA0ZG9pLeNxcZ74kO
 lHvWUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIlYeTMydBSruR94OKPgvlIbz+tbXb
 Vrr7u6v71tmDaf6ymP+84UM0aG7iwrprVTu4W7duvsePtixuJ1/j+422Qj3kreLrxW8a2MFQA=
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
Cc: David Gow <davidgow@google.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maíra Canal <mcanal@igalia.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, Maíra Canal <mairacanal@riseup.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM-managed actions are supposed to be ran whenever the device is
released. Let's introduce a basic unit test to make sure it happens.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/Makefile           |  1 +
 drivers/gpu/drm/tests/drm_managed_test.c | 71 ++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index ef14bd481139..aaf357e29c65 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_format_helper_test.o \
 	drm_format_test.o \
 	drm_framebuffer_test.o \
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
b4 0.10.1
