Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF85062E24B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 17:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD0810E198;
	Thu, 17 Nov 2022 16:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F4C10E0E5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 16:53:19 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 989633201B69;
 Thu, 17 Nov 2022 11:53:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 17 Nov 2022 11:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1668703995; x=1668790395; bh=FbzlDkkhhsRtKSZiUm2xWhCcXLtVXKnc1W3
 izJLploc=; b=Q/266Oy+xDLeuIV4Kf5CL1NHL7bAxNsInYyW4KsyQ3HCpNw9cHE
 dGhwAppw14wJKRPMUhL3OCzPc4MHEajCb5+7UHkc4XUvHtLWHFYmyMVc8nKnF2jH
 TA/jE/wJirFQ4yctUTYNyW9c7JbP4rx/rpWmzpiUubEG/o8xtXt037To+G/QqBra
 009fhxDNboiMNF0A3vvEfzZ95B3jk2ZqSnOxdXNY1XJSOF8cF/g/7n3o64qprOGJ
 YEELav7az3jiUO2w5VLF6RcNkjMvpewKeB7Ix1ySwFDvdxKHhbe+68fhfIxn8NNj
 hHQYCqAE89CoZjk7qf1vuoZYMlwIr0OlZtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668703995; x=
 1668790395; bh=FbzlDkkhhsRtKSZiUm2xWhCcXLtVXKnc1W3izJLploc=; b=w
 kH5BeJJ0sxtl3xiySYdhYXXot1xbFrHsakf599nx+1VS0Wp9N8XtcwZSZDeHebpv
 5iO113iphsejg6/oZRiQnUjznHRBwLZv17HRs35gFEg9WkGZDBqO8FvE43lyNeoY
 +U+VxaO+8J07/4hvimbbyHK7r6cmOxdVsXHIr1OpwUSRgr9oX9xPM5L9l/SNMDkC
 bNok6KkBXuu8bwNxhGDU7qkdI3EKOinFSSNSmEIKq71hisZ6i6drfzUG5D8Imt96
 oD0zj022aw0D2/CWrI0eMT5SFohIcDSmaU84y312vSytcyWSOMAPkzuRgQKne23h
 9WW1y5ufVgJHT5G8l8GWw==
X-ME-Sender: <xms:-mZ2Y7x75JmWi-PU-Tt81VKAsryb21C2a_9B0yzSh_rG1xxOrT24lw>
 <xme:-mZ2YzSzuS7MqFWmQcdDqyLqW-7l3G_LQFi0MQBGBuZzhnacMighm0ZRDzAhBOFHm
 yHJmxiARpM8eDlxTWU>
X-ME-Received: <xmr:-mZ2Y1VdYv9Yikln76gc7Y6iGlLrM0G5JJ37hk0YA3mpEqq7J9bpa6XVkVm9Ku4hstHFQSkjAh0F6N5xIscBG6BDWeKv1WPsdy8Ua7yh5LrFNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgdelvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeifeeigeetgfffgedufeefheekgfevuefgtdehffefheelleejveeviefhgfek
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-mZ2Y1iH-yFsgQdRLryHHochoP3jGepgvXLGMUhHdo2JarzBJppwbQ>
 <xmx:-mZ2Y9B0FcVk1lUd8yVc2AXI-uLyPAdP7Iyn1tni29TkL2FIAc7wrg>
 <xmx:-mZ2Y-I4vMEsHoqYzkUkAIp6bhLLpXte3kTFeSx0Fq4lPInIVpm3iQ>
 <xmx:-2Z2Y_xVlOHHHpggpykdE8Js_MZ1K28WKoRubwYn69x08c8ivqKrWQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 11:53:14 -0500 (EST)
Date: Thu, 17 Nov 2022 17:53:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: DRM-managed resources / devm_drm_dev_alloc leaking resources
Message-ID: <20221117165311.vovrc7usy4efiytl@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xbb4rrcandpnbw3a"
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xbb4rrcandpnbw3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

After trying to get more kunit tests for KMS, I found out that the
recent kunit helpers we merged to create a DRM device [1] are broken and
won't free their device-managed and DRM-managed resources.

With some help from Thomas, we've dug into this and it turns out that if
we allocate a device with root_device_register, initialise our drm
device with devm_drm_dev_alloc(), register it using drm_dev_register(),
unregister it using drm_dev_unregister/drm_dev_unplug and then remove
the parent device, neither the device managed nor the DRM managed
actions are run.

root_device_register initializes the device by eventually calling
device_initialize() which sets the initial reference count of the root
device to 1 [2]. devm_drm_dev_alloc() then comes in, drm_dev_init() will
increase the root device refcount [3] and initialize our DRM device to 1
[4]. drm_dev_register(), through drm_minor_register() and device_add(),
will increase the root device refcount [5].

When unrolling things, drm_dev_unregister(), through
drm_minor_unregister() and device_del(), will give up its reference [6].
root_device_unregister(), through device_unregister(), will also give up
its own [7].

So we end up with this for the reference counts:

+------------------------+-------------+------------+
|         funcs          | root device | DRM device |
+------------------------+-------------+------------+
| root_device_register   |           1 | N/A        |
| devm_drm_dev_alloc     |           2 | 1          |
| drm_dev_register       |           3 | 1          |
| drm_dev_unregister     |           2 | 1          |
| root_device_unregister |           1 | 1          |
+------------------------+-------------+------------+

If we go back to the list of reference taken, the root device reference
and the initial drm_device reference, both taken by devm_drm_dev_alloc()
through drm_dev_init(), haven't been put back.

If we look at the drm_dev_init code(), we can see that it sets up a
DRM-managed action [8] that will put back the device reference [9]. The
DRM-managed code is executed by the drm_managed_cleanup() function, that
is executed as part of a release hook [10] executed once we give up the
final reference to the DRM device [11].

If we go back a little, the final reference to the DRM device is
actually the initial one setup by devm_drm_dev_alloc(). This function
has superseded drm_dev_alloc(), with the documentation that we do need a
final drm_dev_put() to put back our final reference [12].

devm_drm_dev_alloc() is a more convenient variant that has been
introduced explicitly to not require that drm_dev_put(), and states it
as such in the documentation [13]. It does so by adding a device-managed
action that will call drm_dev_put() [14].

Device-managed actions are ran as part devres_release_all() that is
called by device_release() [15], itself being run when the last
reference on the device is put back [16][17][18].

So if we sum things up, the DRM device will only give its last root
device reference when the last DRM device reference will be put back,
and the last DRM device reference will be put back when the last device
reference will be put back, which sounds very circular to me, with both
ending up in a deadlock scenario.

I've added two kunit tests that demonstrate the issue: we register a
device, allocate and register a DRM device, register a DRM-managed
action, remove the DRM device and the parent device, and wait for the
action to execute. drm_register_unregister_with_devm_test() uses the
broken(?) devm_drm_dev_alloc and is failing.
drm_register_unregister_test uses the deprecated drm_dev_alloc() that
requires an explicit call to drm_dev_put() which works fine.

It's also worth noting that Thomas tested with simpledrm and it seems to
work fine. Using a platform_device instead of the root_device doesn't
change anything to the outcome in my tests, so there might be a more
subtle behaviour involved.

Thanks,
Maxime

--------- 8< -----------
diff --git a/drivers/gpu/drm/tests/drm_register_test.c b/drivers/gpu/drm/tests/drm_register_test.c
new file mode 100644
index 000000000000..3256b53d08f2
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_register_test.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+
+#include <kunit/resource.h>
+
+#include <linux/device.h>
+#include <linux/platform_device.h>
+
+#include "drm_kunit_helpers.h"
+
+struct test_priv {
+	bool release_done;
+	wait_queue_head_t release_wq;
+};
+
+static const struct drm_mode_config_funcs drm_mode_config_funcs = {
+};
+
+static const struct drm_driver drm_driver = {
+	.driver_features = DRIVER_MODESET,
+};
+
+static void drm_release(struct drm_device *drm, void *ptr)
+{
+	struct test_priv *priv = ptr;
+
+	priv->release_done = true;
+	wake_up_interruptible(&priv->release_wq);
+}
+
+#define RELEASE_TIMEOUT_MS	500
+
+static void drm_register_unregister_test(struct kunit *test)
+{
+	struct test_priv *priv;
+	struct drm_device *drm;
+	struct device *dev;
+	int ret;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+	init_waitqueue_head(&priv->release_wq);
+
+	dev = root_device_register("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	drm = drm_dev_alloc(&drm_driver, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+
+	drm->mode_config.funcs = &drm_mode_config_funcs;
+	ret = drmm_mode_config_init(drm);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drmm_add_action_or_reset(drm, drm_release, priv);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_dev_register(drm, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_dev_unregister(drm);
+	drm_dev_put(drm);
+	root_device_unregister(dev);
+
+	ret = wait_event_interruptible_timeout(priv->release_wq, priv->release_done,
+					       msecs_to_jiffies(RELEASE_TIMEOUT_MS));
+	KUNIT_EXPECT_GT(test, ret, 0);
+}
+
+static void drm_register_unregister_with_devm_test(struct kunit *test)
+{
+	struct test_priv *priv;
+	struct drm_device *drm;
+	struct device *dev;
+	int ret;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+	init_waitqueue_head(&priv->release_wq);
+
+	dev = root_device_register("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	drm = __devm_drm_dev_alloc(dev, &drm_driver, sizeof(*drm), 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+
+	drm->mode_config.funcs = &drm_mode_config_funcs;
+	ret = drmm_mode_config_init(drm);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drmm_add_action_or_reset(drm, drm_release, priv);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_dev_register(drm, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_dev_unregister(drm);
+	root_device_unregister(dev);
+
+	ret = wait_event_interruptible_timeout(priv->release_wq, priv->release_done,
+					       msecs_to_jiffies(RELEASE_TIMEOUT_MS));
+	KUNIT_EXPECT_GT(test, ret, 0);
+}
+
+static struct kunit_case drm_register_tests[] = {
+	KUNIT_CASE(drm_register_unregister_test),
+	KUNIT_CASE(drm_register_unregister_with_devm_test),
+	{}
+};
+
+static struct kunit_suite drm_register_test_suite = {
+	.name = "drm-test-register",
+	.test_cases = drm_register_tests
+};
+
+kunit_test_suite(drm_register_test_suite);
--------- 8< -----------

1: https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/tests/drm_kunit_helpers.c
2: https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L2979
3: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_drv.c#L597
4: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_drv.c#L596
5: https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L3437
6: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_drv.c#L201
7: https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L3737
8: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_drv.c#L618
9: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_drv.c#L570
10: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_drv.c#L751
11: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_drv.c#L785
12: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_drv.c#L259
13: https://elixir.bootlin.com/linux/latest/source/include/drm/drm_drv.h#L505
14: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_drv.c#L682
15: https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L2321
16: https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L2357
17: https://elixir.bootlin.com/linux/latest/source/lib/kobject.c#L721
18: https://elixir.bootlin.com/linux/latest/source/lib/kobject.c#L647

--xbb4rrcandpnbw3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY3Zm9wAKCRDj7w1vZxhR
xRDZAQCq3cO0Zmh91tOdX7YViOkpir2812yiXd53XNvG1W2sjgD+Klv+TpHUfmx6
lhJE2B1mOqhyh4biafZ6e/YsWNcMSgc=
=roui
-----END PGP SIGNATURE-----

--xbb4rrcandpnbw3a--
