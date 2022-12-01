Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8502963F36E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF1D10E600;
	Thu,  1 Dec 2022 15:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9D310E14C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:14:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id DA95C5803A4;
 Thu,  1 Dec 2022 10:14:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 01 Dec 2022 10:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907692; x=
 1669914892; bh=Vsy2pR2La7oPdHIjqFNEhNC4zRSpukOFWVxHMug8m4w=; b=C
 dtRx9iN9Ra4TsQuj1LoDgxAqJKqygQObpqFWuJLjq9oX1duI9SBUIMOssh3nQM/T
 qELUhn5BPb86noKqGJigLGcy7EUj3so361BX3G+LYHBZexR3iqe9BcHhcf1NUlro
 cHR7NvbuRGHs9Zw5rEn5nU6lq6KFGwOCoNsQiFo1Wv+CoktJeOUaJtlW5UfWQCon
 dOtaD8IRPhsLYMHsbwX8zYMvXo2Egw4H/K5iMtQAdZZngbcH87VOPhTRrHt/32wG
 W/pSH1K1GfU6QNdHB+9TuuiQxX9rTw0y8eff/wIw1kFu9mT/AHhg9kqqO+X9nZQg
 q0ictMhQ65jMcMHb7m+Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907692; x=
 1669914892; bh=Vsy2pR2La7oPdHIjqFNEhNC4zRSpukOFWVxHMug8m4w=; b=o
 SE6D+0c6EDvrhHKLwAVmdNpVy8ODT6KKX/qllB75PLpq2mD/UpSSkmn0IflR0ptN
 LdYKcniO6EURddqsmH9AGkArr7TseZ1gidy9j1rnU1H+CbzE76nGRvGGZ20rYnpG
 jOVJtKewC/UnAFErHD++oPZ7UyyDY++2jG19pY9fkE4H82iDNLWzluJBwuu1FIFt
 cWIRdqRjHLswQ2ZnAsZElKq/9wmtkvuB0G6uoDyyjyOpojkYjQZgVhv/SvuW7smA
 dunJhoNQ3VdOKaVXlwu0Ivb6+Su4QlJSRMpS4AXjQ35aVHw44cd38RsoJThwdlqn
 81OEngta8bBhdPAliiGTg==
X-ME-Sender: <xms:7MSIY62aSl17DA8JmirQpMIs9fr6gFTv70hjsxxNdAcGiMWVWzh8lA>
 <xme:7MSIY9FlLaWajDdcKK6pD2G-UdHaILMBH1Ye32WsNX9OCyC6FkK8K2d55tfmNENWB
 DMhyo_qklOEWoOAbg8>
X-ME-Received: <xmr:7MSIYy542i-68lklE7IJIe0TlNFabEsuyXh0hCVWa4lLbLTFJ66XmG6Bwwn1rvqB8XWfGOUG4X1zga7-Ps6UiC5708-kuq91DfakoMAOepRMJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7MSIY73rSZtMGhqsFjCPhPjUIXFRa7LHspOZ2UBpJKMLvmFKsYLJkg>
 <xmx:7MSIY9HxxPy7OLUnLHUiAuKMoV_J6BUQlZXQn7PRVjeuF4FJvepxuA>
 <xmx:7MSIY09Yrzy63f_NDeJIIjnv_P_sVS2rSnrTE5ge1SLDyvcfz-Xf-A>
 <xmx:7MSIY8G3G3UGf5EBCdYpKrD9Echf2IgA081Ugmtwzr66FD_ZGQ1C4A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:14:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:36 +0100
Subject: [PATCH v3 05/20] drm/tests: helpers: Rename the device init helper
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221123-rpi-kunit-tests-v3-5-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4528; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=3MKZ16mfGI8pO4BPhdKS3FZs+sSNuL/c/wTiXJ9dtMc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdRzSK+XIXKajPb9P+Gy3s3Htx7ZyLc3ZNcHWfO5NPs71U
 V6G6o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNZfoeRYV7dvbtr8xVv7HXMzb3bNc
 91WlQTr4zNzv2enxZ+jD01hZHhf+X0gD0ZxpXNRemHmHbZ5q7inLaN15ZtR2u+0fsvC/xncQAA
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

The name doesn't really fit the conventions for the other helpers in
DRM/KMS, so let's rename it to make it obvious that we allocate a new
DRM device.

Reviewed-by: Maíra Canal <mcanal@igalia.com>
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
index 4fe131141718..e718073ba6e9 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -36,7 +36,7 @@ static void dev_free(struct kunit_resource *res)
 }
 
 /**
- * drm_kunit_device_init - Allocates a mock DRM device for KUnit tests
+ * drm_kunit_helper_alloc_drm_device - Allocates a mock DRM device for KUnit tests
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
-EXPORT_SYMBOL_GPL(drm_kunit_device_init);
+EXPORT_SYMBOL_GPL(drm_kunit_helper_alloc_drm_device);
 
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
b4 0.10.1
