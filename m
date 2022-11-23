Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614A1636394
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D8D10E57D;
	Wed, 23 Nov 2022 15:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF14F10E572
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:28:46 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id C9BD52B069AE;
 Wed, 23 Nov 2022 10:28:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 23 Nov 2022 10:28:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217323; x=
 1669224523; bh=OBcpBw8LagA0lEroouhGBTfo5DZbk5Wsx+56bgI++H8=; b=R
 F1Y1TgmFDfktemnzyLgsxx86dHSsrDMuGfMlkPxZwGXErV9YaG4D+sy4HzgymJD6
 I6E1gpc4BxZrUer34ufo6gwght4Yf7nIqPlfQDKy/yM5j+2PJcGYfpf22FNgEIhs
 HXBoBh8Ij7V83iz/GjmQa3Ugr7rrXrnwnc6ijGWmRYzEPUE7j33M0kGbUFS7845g
 huvhX1KHZQSgi9SzYCBRbwxEFj8aPOc/fpCE8QMiVd5W6mlh/sQDwzlOrZXFHff3
 S+3Unr69ONrf1njQlG77rjCs3ZR8jNyj2nqyTwh1TLW9baKJgD1dzPohjx7J+eeX
 zRJNCLnN+ZqCOOdttNPYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217323; x=
 1669224523; bh=OBcpBw8LagA0lEroouhGBTfo5DZbk5Wsx+56bgI++H8=; b=M
 9MhU8M9rWdZPW5ou84CQtlVwPZLAxF6+DVXhZP78ZFMB7y/KkXVVsrgfHDjoTfPg
 UCpcatNWRbhBQUZYx86ZbbZIvr1TbLkmfRnWL2H0hyCJ7av+geef6C0bUdEsocIB
 ylwjCJe2VtdKyNywutRMJ+TW59q8aXF7ArHIxeH+vrLF7U4axvjGSEdvBGw2FZtM
 fUoVRhdEZqVIzrozrVOoGJoeC4PL4ZFCfkZsj5uqPnW9QrKE4NzeWbhxjgyYMQeg
 Ag5G1elVhY8TX1p5BylR3RvigNO0rx8K9oBmkx5PiOC2IVdoiZNnjsFEUxCZrpzE
 gIIAmgts7m/7LDvm23WfA==
X-ME-Sender: <xms:Kzx-YwEuG3k7_DsrUmgGtFx4xWDtmjH1kOzXp2ZcczNdN55Azm3Nrw>
 <xme:Kzx-Y5WYyYqbfti6cJF2wGiD1csft10_tsbYtBxE6Xck0SxvzYBFQGTDhKv7ud2_z
 l5rHBi49w9JjAW1UAc>
X-ME-Received: <xmr:Kzx-Y6ItqA2V4HzNPKk3joUFnO-050NdYVUxBrMsFdyNlWaZ_DHyjn9K5L422h2on_v8kPAYzNeS3GFPBuwK2LGqcyQJVGzT5mE9vPWKkxvcEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Kzx-YyFm1rsC57pExgMWyEU9oGg4tI1M1b1HOiod7kUNVQl1HhK3kQ>
 <xmx:Kzx-Y2XmupqaQvH6NEWgGGN7QUSpS64pdQCsObn9DF2RF_LpI-UVRQ>
 <xmx:Kzx-Y1NzlUjcRYa8CF6k6s2_GLjoEqT71sFLEuHsiO3NJXMcBH-Z_w>
 <xmx:Kzx-Yw2NVq306Iil61GJeAxf0SWYDaOIqjMZKW-6w5XEZBuaczGqtRjxE5s>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:28:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:44 +0100
Subject: [PATCH 02/24] drm/tests: helpers: Remove the name parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-2-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2505; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=x3+Hw+kB4/7IPH6Crel2AUGyLqQxK5teJE7PqANO7DQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11lX+/6I8WYVPXv1l7thSO+fuuwRrE+7cUsXU8BSOyUdu
 /3jfUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgImUiTAynDjwQz1oiqKt7QsGbiU3rt
 x/Cxpn3/mxqFwuKuPp9j8z7zMyvD1eK+h1eN+NX1W3J8iaicfufj53+d5stnMpleyPLXfP4gMA
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

The device name isn't really useful, we can just define it instead of
exposing it in the API.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 2 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 6 ++++--
 drivers/gpu/drm/tests/drm_kunit_helpers.h       | 3 +--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index e469d1634e2d..6920c3ffdfdf 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -41,7 +41,7 @@ static int drm_client_modeset_test_init(struct kunit *test)
 
 	test->priv = priv;
 
-	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET, "drm-client-modeset-test");
+	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	ret = drmm_connector_init(priv->drm, &priv->connector,
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index a4ad030ed101..7f69f56f5892 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -9,6 +9,8 @@
 
 #include "drm_kunit_helpers.h"
 
+#define FAKE_DEVICE_NAME	"drm-kunit-fake-device"
+
 struct kunit_dev {
 	struct drm_device base;
 };
@@ -38,7 +40,7 @@ static void dev_free(struct kunit_resource *res)
 
 struct drm_device *
 drm_kunit_helper_alloc_drm_device(struct kunit *test,
-				  u32 features, char *name)
+				  u32 features)
 {
 	struct kunit_dev *kdev;
 	struct drm_device *drm;
@@ -46,7 +48,7 @@ drm_kunit_helper_alloc_drm_device(struct kunit *test,
 	struct device *dev;
 	int ret;
 
-	dev = kunit_alloc_resource(test, dev_init, dev_free, GFP_KERNEL, name);
+	dev = kunit_alloc_resource(test, dev_init, dev_free, GFP_KERNEL, FAKE_DEVICE_NAME);
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.h b/drivers/gpu/drm/tests/drm_kunit_helpers.h
index e9870c7911fe..6c12b1426ba0 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.h
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.h
@@ -8,7 +8,6 @@ struct kunit;
 
 struct drm_device *
 drm_kunit_helper_alloc_drm_device(struct kunit *test,
-				  u32 features,
-				  char *name);
+				  u32 features);
 
 #endif // DRM_KUNIT_HELPERS_H_

-- 
2.38.1-b4-0.11.0-dev-d416f
