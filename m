Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C09B63F371
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD16910E608;
	Thu,  1 Dec 2022 15:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EDC10E17C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:14:55 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 16F6158026A;
 Thu,  1 Dec 2022 10:14:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 01 Dec 2022 10:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907695; x=
 1669914895; bh=9XAti2+tIbxl2NUHcNRem9TQQMIYele9SUbSUH7Ls+A=; b=Z
 xB2AT5GyUVR8kgnhXq3C5Leyv/W8kmCIWrMLvIonP3j7UYA3rghC1Ge+9kieZzqL
 bqXLieHJZZNzCdhuT16O3baF/fD43tladLs4l9WfnETlgTcAO9hnbpF9T/D4NbYu
 tRYBo03sy3WOQBSsNgV661PjRwHtbHOsfXEMsPus7OZfFyCrE32OW/uDKHU4OLSt
 IzlYiGTjlkptUnqodSE34SrSxD3zgpFGPe7mC8MSMqHjq9ADxHiIEv5AyNS4CYJt
 WOTmjY3kBavcYfeLiSeHh9LIjZ23UZhKz6y2dCMT0AXWZdDw1j2iYkTBvQ0Vysue
 tBjtm5sbvk7w0HQS6Mt0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907695; x=
 1669914895; bh=9XAti2+tIbxl2NUHcNRem9TQQMIYele9SUbSUH7Ls+A=; b=r
 GL41U2QBEFeFnx7Brkrg+1SdZ/ox7zxz6c0e41jdEw9JmCWpf30uKjYWF1GintG+
 L4dM750ilYf7ZnoyIYMjCYMWMM9eo7TV2u/khmPV8PtIINMJEY9oezFPogee0nL4
 k1G5xOzBusrWiPqWGJq7gZOshtMpuB93Gr+mI1x8Uijswogz/o98DkSIiUUOhBHt
 TcRuBljJpf/Nf7uAW4+EOr4Nd90pMg4TW9Bxmmy6MDfqaRjJxqZ1gwAyWOUq0sEN
 7FpKO9uwJicy0nYxid8Dv/uykN2WrCs1rdam5o1rgafvjxzlbmEDqy/2eCVYIFy+
 txuzre8mEnLxSHsdOKnkg==
X-ME-Sender: <xms:7sSIY6IoOn1cJZU0kim07RkBBGyzY7zJXm6cfcjTuahx5-omtST7ow>
 <xme:7sSIYyL1ksskE90HoVX33o4fYVZhMc5HqxIXZRuCQdfyIYTFqpJ3CKDznhIHRQd-C
 oNcOOGcKFU8s7-HBco>
X-ME-Received: <xmr:7sSIY6tDhyTwKAyF2L1Up8n0GXWFvhqB3glaVzp63OOCSF0vl39Y0JoVpLKsNMyeGiYAGZoaV9_9Q9p3ZRyJ2hPxMJKdtlT0mW2QOqbHvbwiRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7sSIY_bd6gT-6OhMX3jo2eVm8tZs0AG9Jl1ztetINM8qKdk1PeH1Fw>
 <xmx:7sSIYxZKd0oowiGsKV3fb7IhfbmL0HjXhuBQXWXofl7sjzG7TXxMtw>
 <xmx:7sSIY7DriMLpFJbSo9C-GXbKGc9I2H9iFhBu5r-7mHd6pobc0GK_rA>
 <xmx:78SIYy41wazYr0ljXhu4nQ5i7YNYRt0s5480Y1M27YrKtWbcg8TIEQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:14:54 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:37 +0100
Subject: [PATCH v3 06/20] drm/tests: helpers: Remove the name parameter
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221123-rpi-kunit-tests-v3-6-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4335; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=C45pokugMijRI1xJrjlrUtt9ncB9ONss2reLWsGhOPk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdRzT83sYyzjl1WvTIA7abnr+iCqdXnj3/J+WKoeLrXf9Z
 LtildpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi8wIYGVYnOc7rF/xgUaoUaXPNXW
 eHImdnqOZH5qLY87OmlXauWcjIsElrQQr35mmzMwv+5dq9yv6z77NH5P/+AOs1d+ceV7HYzw0A
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

The device name isn't really useful, we can just define it instead of
exposing it in the API.

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 3 +--
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 7 ++++---
 drivers/gpu/drm/tests/drm_modes_test.c          | 3 +--
 drivers/gpu/drm/tests/drm_probe_helper_test.c   | 3 +--
 include/drm/drm_kunit_helpers.h                 | 3 +--
 5 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 6cdf08f582ce..4d475ae6dbb6 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -59,8 +59,7 @@ static int drm_client_modeset_test_init(struct kunit *test)
 
 	test->priv = priv;
 
-	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET,
-						      "drm-client-modeset-test");
+	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	ret = drmm_connector_init(priv->drm, &priv->connector,
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index e718073ba6e9..ec33fcbd092d 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -8,6 +8,8 @@
 
 #include <linux/device.h>
 
+#define KUNIT_DEVICE_NAME	"drm-kunit-mock-device"
+
 struct kunit_dev {
 	struct drm_device base;
 };
@@ -39,7 +41,6 @@ static void dev_free(struct kunit_resource *res)
  * drm_kunit_helper_alloc_drm_device - Allocates a mock DRM device for KUnit tests
  * @test: The test context object
  * @features: Mocked DRM device driver features
- * @name: Name of the struct &device to allocate
  *
  * This function allocates a new struct &device, creates a struct
  * &drm_driver and will create a struct &drm_device using both.
@@ -54,7 +55,7 @@ static void dev_free(struct kunit_resource *res)
  */
 struct drm_device *
 drm_kunit_helper_alloc_drm_device(struct kunit *test,
-				  u32 features, char *name)
+				  u32 features)
 {
 	struct kunit_dev *kdev;
 	struct drm_device *drm;
@@ -62,7 +63,7 @@ drm_kunit_helper_alloc_drm_device(struct kunit *test,
 	struct device *dev;
 	int ret;
 
-	dev = kunit_alloc_resource(test, dev_init, dev_free, GFP_KERNEL, name);
+	dev = kunit_alloc_resource(test, dev_init, dev_free, GFP_KERNEL, KUNIT_DEVICE_NAME);
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
index 6723089dff9f..35965ad86188 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -22,8 +22,7 @@ static int drm_test_modes_init(struct kunit *test)
 	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
-	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET,
-						      "drm-modes-test");
+	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	test->priv = priv;
diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/drm/tests/drm_probe_helper_test.c
index 85236ff4744f..be61a92b79d2 100644
--- a/drivers/gpu/drm/tests/drm_probe_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
@@ -40,8 +40,7 @@ static int drm_probe_helper_test_init(struct kunit *test)
 	test->priv = priv;
 
 	priv->drm = drm_kunit_helper_alloc_drm_device(test,
-						      DRIVER_MODESET | DRIVER_ATOMIC,
-						      "drm-probe-helper-test");
+						      DRIVER_MODESET | DRIVER_ATOMIC);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	connector = &priv->connector;
diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index e9870c7911fe..6c12b1426ba0 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -8,7 +8,6 @@ struct kunit;
 
 struct drm_device *
 drm_kunit_helper_alloc_drm_device(struct kunit *test,
-				  u32 features,
-				  char *name);
+				  u32 features);
 
 #endif // DRM_KUNIT_HELPERS_H_

-- 
b4 0.10.1
