Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4446E63F368
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20CD10E150;
	Thu,  1 Dec 2022 15:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD98D10E14C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:14:48 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 42B2D58039C;
 Thu,  1 Dec 2022 10:14:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 01 Dec 2022 10:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907688; x=
 1669914888; bh=oFRyfh1Kb6qHZQvprIAbuyK/sPcUDfbwCdy1F4UYDQc=; b=j
 wykG5qUBixaGipYp4e4m8BSLzey9gcdbGmT+N4/uawWyEIAyqu4UqTdkzUybIwNJ
 CjRiLHWwNjbaIXQVTiDdRUd0BXJxGXyl6lcUlYmOMSgMAymfVABxwxNjPXEDkPjF
 em8KWk6JYWabXY4dPQHU5bhqiiBTuHY0V3SkRu6HWXOlVPwB7CCOr9at/9xE9Z3K
 QEZTskAX+2TarVId9YH3i7Y3nHga4iXtp307lHaalGhzHOJHJqdciEcHTOHOZQ63
 tkEOPCpxGahep7x5D2r0u3Clk/NpVEo0KMPLKlXSUWB64mctzEknl5kt+vdL5JFC
 wwALuYfVqrsr8AASZDV4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907688; x=
 1669914888; bh=oFRyfh1Kb6qHZQvprIAbuyK/sPcUDfbwCdy1F4UYDQc=; b=V
 ZgM+eCsydbpbYPxYm2vkdQoVJgwg8g0T2qlpNvjmRk90MzDYjVsKU90N9RXh+khQ
 pXd5YMkqzBTFL2KDNLEiZnvLCeWFKr1O5AhiQU8DezmdPDr7HzzaDilBmMiMRepH
 98bpdOI6IZ28L9CBc5kKTPT7D2ttCfqNd1srrQrO6iF303RCu/rSmUIeZ25tUzzG
 qAQBl7WGDkILz7P+DLBISCalqGGcQdHCCFAXRjPuBXZGJZGb3lG4udGsPUBMYI8h
 yuJYMaYALh1di82hPmjrTbLTQdO/no2Tmb0qe0ytFJUPJr7apedlM/Us613OrOuo
 Hl19eNoktxTdHrHI2bIyw==
X-ME-Sender: <xms:6MSIY64v_TAdDE4Tx9olwWvECYC3kmLRloevSlZbfJ4AwxjXRXa33w>
 <xme:6MSIYz69AXXbkCabsoGIbBkReHi4etm11eYQ6DOoJMEezYvZQsMGO0wVsm6GXW7WS
 4D0N3RzVEdoV3ZRYZY>
X-ME-Received: <xmr:6MSIY5efS5Kv1HfiAe5R-hhNvLkd2Y8JkYsgGC5ZvH6hRljQurEGmmZGLnjb-AMWeBVAzrfRnAhOxJBlWPbYKCXHdKFWxEwb-rzNOFrvtsT3cA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6MSIY3IJrJHiTAEAcjs34n6nOIFn49qF6eSN9FgOE8SfCrDjuKhAgw>
 <xmx:6MSIY-I1GGQuXXSmTPjz7b0PTlbaalPVh0rH4j4ZkPRYZyZcVxQm3A>
 <xmx:6MSIY4yZ9od7iaT8MEWhCoQjwsE1CWLbY5dUQidkDCjaHDgiRqZH0Q>
 <xmx:6MSIY1oT8qtlDa4V1KMjjYxhQXK2qhKgoAXiGxx8TpG16ArdewASpA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:14:47 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:34 +0100
Subject: [PATCH v3 03/20] drm/tests: helpers: Document drm_kunit_device_init()
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221123-rpi-kunit-tests-v3-3-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=sMZqQY4X/XQsf610ZjIZL0jnwkS6xkiB0Fed3TvkjBI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdRzRKDJe/myw1/WfoLKYzh8LFZj20mtub8Tq/I42z/s7r
 VNUPHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhI3GlGhgOebfsWvKzcv27JPNuJNt
 9+hL311uzL3vVPQifnxHpmzsmMDE9lk4SajzreP/y06NXGK5eq3A6kfsrJm37kS5aHrPT7XTwA
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

Commit 44a3928324e9 ("drm/tests: Add Kunit Helpers") introduced the
drm_kunit_device_init() function but didn't document it properly. Add
that documentation.

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 6600a4db3158..9ed3cfc2ac03 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -35,6 +35,23 @@ static void dev_free(struct kunit_resource *res)
 	root_device_unregister(dev);
 }
 
+/**
+ * drm_kunit_device_init - Allocates a mock DRM device for KUnit tests
+ * @test: The test context object
+ * @features: Mocked DRM device driver features
+ * @name: Name of the struct &device to allocate
+ *
+ * This function allocates a new struct &device, creates a struct
+ * &drm_driver and will create a struct &drm_device using both.
+ *
+ * The device and driver are tied to the @test context and will get
+ * cleaned at the end of the test. The drm_device is allocated through
+ * devm_drm_dev_alloc() and will thus be freed through a device-managed
+ * resource.
+ *
+ * Returns:
+ * A pointer to the new drm_device, or an ERR_PTR() otherwise.
+ */
 struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char *name)
 {
 	struct kunit_dev *kdev;

-- 
b4 0.10.1
