Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8936563ABB0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB0810E1FE;
	Mon, 28 Nov 2022 14:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0E010E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 14:56:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 78E8E2B05E69;
 Mon, 28 Nov 2022 09:56:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 28 Nov 2022 09:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669647409; x=
 1669654609; bh=r4wyq7sl8aa6ItiwQGpdBwUH7JyunxFI+HYhTKhPSZg=; b=T
 8cfvyz2yszH5gWAp4dxgINOEhmIsggAMo534a5tBcGxhSnlxsslQPpkFPYqx0509
 YxzGF26XAiUPW4FzlkJpb3ORFTHetPKgljSdK9MLHdub+ZMhd9119zdk+h7Ax20u
 o1U1sNScOni0y8jWSuvN6zFz6Sx3J8d8tWwzyy1lNRxDC/MP/w/JIgSNlWt6Qewc
 /fdOaQqn2jZpnWlOLttL0pdwhQn98U/3I1wKMu7fCoG0ZgbBDJErcn3rkMCMMc2b
 I+KYzjXKNg004hLs3OTeRt1G1c+DtsNaibBHXhwvNLNY79KCDc35zMKCU4Pw1Hfy
 yJd/JN4GnIWeIAGEtznhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669647409; x=
 1669654609; bh=r4wyq7sl8aa6ItiwQGpdBwUH7JyunxFI+HYhTKhPSZg=; b=o
 WV4BSDT2eqIM/vI60kW4jfU9eQy49V/7WsuV7OJywS0gciY3ntrDOUYhxVtSoAJj
 wcBxKHx7mNAzlYWkQF6aHi1pXXpDPHB1helhRguKxVXnqOnkI/pwXoO53ViuR/OT
 XDlgtLLW7uw8rH7DLVmBUsmRsZAv6ZHTz8zt7aLYZRGmPUXy0585NUqY4v4v+ILF
 ZIluCgDH+WApOQEyup/NA581vogQC7yWOV0Lk1B37A/0i3ONVJrPDJtrnxjoBqu7
 VM5aHDs1Cvajqjfu+nQyJMv85FcwkASQn1CDRA7vQfqdTB76WfoaGE3+BC3B/DMx
 HHd/3M6SD/NXOXPN5gmsA==
X-ME-Sender: <xms:McyEY7zHcqAfWHH-dOfCj0G50I6V4wHNOgO6AeUevzXV0bPf65-L9g>
 <xme:McyEYzQPmOEOTZwZjsanRwg88r6Awj1jYNPsnrcdTKum3IOszpvLWWdP3v9XrPVsA
 -oClq14WBNENNIy8rE>
X-ME-Received: <xmr:McyEY1WJt77jClAmtxhHQepc4BikiWOeBG3lXUL41o_hA2HtyZBtK_9JRAJ7WDZgU8foSneBcgs355_VE0Prkqacv-TKyKXKRXLIYykrOcHyTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:McyEY1hDx64a-ik3wmbDyaRW83N2mNvACCs4TQ_04fpUQ5JHw3Enaw>
 <xmx:McyEY9CAvBK93PaowwskdR_DfVEyxutSdfsx-sT_-qUOpcsqyi3X6w>
 <xmx:McyEY-JUpPZOytMRGFWAYUdfqi9y2JSKHcqzH8LxyKesa5aMtDMz1w>
 <xmx:McyEY1grSGLi7L7lIOMaS3gt4DCm-WAnbQubxqR9RHWVSRcLKO0g_fPJCWU>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 09:56:48 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 28 Nov 2022 15:53:32 +0100
Subject: [PATCH v2 03/17] drm/tests: helpers: Rename the device init helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v2-3-efe5ed518b63@cerno.tech>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4490; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=vD5DXkQ3GnI3dQltbk4BAkZD+MnCCMo6MRogkmsmCWk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMktp8v4NT4XW8xzXNQ39WJ07OunfyW2/u6aJKxSwPNjnaFc
 8oy5HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiI+V9GhvsTXFq7Leb3TrKYFbFi+s
 6KF49rtd+vtP/zwfZb6KtT2zcz/BXUsbrPIKjTNYF1HdvanPOBirZd77e0Ju9de+rtK462D1wA
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

The name doesn't really fit the conventions for the other helpers in
DRM/KMS, so let's rename it to make it obvious that we allocate a new
DRM device.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 3 ++-
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 8 +++++---
 drivers/gpu/drm/tests/drm_modes_test.c          | 3 ++-
 drivers/gpu/drm/tests/drm_probe_helper_test.c   | 5 +++--
 include/drm/drm_kunit_helpers.h                 | 5 ++++-
 5 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index ed2f62e92fea..6cdf08f582ce 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -59,7 +59,8 @@ static int drm_client_modeset_test_init(struct kunit *test)
 
 	test->priv = priv;
 
-	priv->drm = drm_kunit_device_init(test, DRIVER_MODESET, "drm-client-modeset-test");
+	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET,
+						      "drm-client-modeset-test");
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	ret = drmm_connector_init(priv->drm, &priv->connector,
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 46a68c2fd80c..2f67f6cf78d0 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -36,7 +36,7 @@ static void dev_free(struct kunit_resource *res)
 }
 
 /**
- * drm_kunit_device_init - Allocates a mock DRM device for Kunit tests
+ * drm_kunit_helper_alloc_drm_device - Allocates a mock DRM device for Kunit tests
  * @test: The test context object
  * @features: Mocked DRM device driver features
  * @name: Name of the struct &device to allocate
@@ -52,7 +52,9 @@ static void dev_free(struct kunit_resource *res)
  * Returns:
  * A pointer to the new drm_device, or an ERR_PTR() otherwise.
  */
-struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char *name)
+struct drm_device *
+drm_kunit_helper_alloc_drm_device(struct kunit *test,
+				  u32 features, char *name)
 {
 	struct kunit_dev *kdev;
 	struct drm_device *drm;
@@ -82,7 +84,7 @@ struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char
 
 	return drm;
 }
-EXPORT_SYMBOL(drm_kunit_device_init);
+EXPORT_SYMBOL(drm_kunit_helper_alloc_drm_device);
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
index 3953e478c4d0..6723089dff9f 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -22,7 +22,8 @@ static int drm_test_modes_init(struct kunit *test)
 	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
-	priv->drm = drm_kunit_device_init(test, DRIVER_MODESET, "drm-modes-test");
+	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET,
+						      "drm-modes-test");
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	test->priv = priv;
diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/drm/tests/drm_probe_helper_test.c
index 1f3941c150ae..85236ff4744f 100644
--- a/drivers/gpu/drm/tests/drm_probe_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
@@ -39,8 +39,9 @@ static int drm_probe_helper_test_init(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 	test->priv = priv;
 
-	priv->drm = drm_kunit_device_init(test, DRIVER_MODESET | DRIVER_ATOMIC,
-					  "drm-probe-helper-test");
+	priv->drm = drm_kunit_helper_alloc_drm_device(test,
+						      DRIVER_MODESET | DRIVER_ATOMIC,
+						      "drm-probe-helper-test");
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	connector = &priv->connector;
diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index 20ab6eec4c89..e9870c7911fe 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -6,6 +6,9 @@
 struct drm_device;
 struct kunit;
 
-struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char *name);
+struct drm_device *
+drm_kunit_helper_alloc_drm_device(struct kunit *test,
+				  u32 features,
+				  char *name);
 
 #endif // DRM_KUNIT_HELPERS_H_

-- 
2.38.1-b4-0.11.0-dev-d416f
