Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E5363F370
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A5010E60A;
	Thu,  1 Dec 2022 15:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F117710E17C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:15:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 57D5C58039C;
 Thu,  1 Dec 2022 10:15:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 01 Dec 2022 10:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907701; x=
 1669914901; bh=qBaPjNlhfE/YsxDnTij+FTizhNUE0G6itXL5vBTjAgk=; b=J
 VR7l8lzIidl9UfjFTfDJb2brNDPhKm0kR2CaE3a7Syj31pHXGL7gvuDluJJBFuTU
 dshXclsY23T9WKOmrdON75rKQvXw36WQ0vKLiP+/HechKj21t4KM1lKjZinyvR8Q
 hTaAhMLvBxQKlt5rYUoMx3if4U9in7Yowc1C+lDHMad6uOVohKujChxmVK7AlQAo
 a8gmGVBoATF+0DBW7ZBzhhrJRI/kkcnAPH5eIedihpZYm1WuBi99LvCcdDKufZjI
 etsk8HneWcnKzvmwmKb10CHeQOL2HeJcdWlQTmL77LtnuhKTRThHSaY9vCvG99hl
 dD+DdlzxyI5l/LaenjwiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907701; x=
 1669914901; bh=qBaPjNlhfE/YsxDnTij+FTizhNUE0G6itXL5vBTjAgk=; b=s
 azvw4LtEiLDfu0bdWTSHGQjCZCW6RLe3daKUDcUvPyZ1Kg0SV8PPwRiwco01o4ln
 dLRKNRcrFrNmQOoE7vnMenmzedCBQ55C0I5lcioONwcMgIxMeWFuIVG81V1DukDQ
 97WbOQd8L5/TNc2EsyyL0YkU5e43hgUcGAWV+oRiTcFN0iQBOfA8vpPIdMBDNFCz
 836YoSwR0y27rRRGLt1sYEdS3rYs2osfqtG3h4JSUUdQXm812HML6aMBVKXqu+ac
 op99jJvU6h6DaS4LXJAOTyUuQgggMfMyWTiO8Sfwms2d4GGU1h7XVH6kLhPQzGKB
 7P9FYrQ5dXozpYoU/MOdg==
X-ME-Sender: <xms:9cSIY2IZbAIyyguxO-6jQITqmrpYphvq09OqzeoOJk8tOYon_d8vfA>
 <xme:9cSIY-L2ItExkoNBlUMiZ-rq-K7_-aADsAjzqK4xQfNIJAwh7U684faToLs9AE3VF
 aY5cY-JybfZ5Kze2iY>
X-ME-Received: <xmr:9cSIY2uCagEpRn8sWtDFTOqVPAOFjyB1GwC5Op15D2XvyWyPpOqM1nImnK8lA_FY2Lhbfhdhwtlkuw_7qW6nMTmEKncXoArWhygzpw1_3FdiOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9cSIY7YVDZUJSnysa9LgSbAJ9VZouSuN_jF5ElfXAMdvgoHukk7f-g>
 <xmx:9cSIY9aGH0w73WzaVkFAcKbLTTRHQsq6vWEZx5lNmc7KgicwOq-0vg>
 <xmx:9cSIY3BJvx4tq_qP2xkxHxqT04IXyV1fHg2BEYR_UwlpgkflHf0o5Q>
 <xmx:9cSIY-6XtDZS_hlm5J6XGTi_7RqY7UtwbVBQKeEBDi5hEZhl10VfOQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:15:00 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:40 +0100
Subject: [PATCH v3 09/20] drm/tests: helpers: Make sure the device is bound
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221123-rpi-kunit-tests-v3-9-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=yYpdpN4Z7ig+2ZlJ/roXFAY7P6KOCPfO+JwX1aWrG0I=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdRzQcXvsLsQce4FRpmRmSbbLohnvmpyKTFYkHtuzlOJXQ
 GK7SUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIm8fcPI8Db13+MnbZ/5bpdtXaGyon
 JD2/UjNnyc/55ekWAUDS3dw8XwV1x3Vf7qnULiidHRC3YpXPQxCvgQfjl0d3YYt/nHXLUH/AA=
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

The device managed resources are freed when the device is detached, so
it has to be bound in the first place.

Let's create a fake driver that we will bind to our fake device to
benefit from the device managed cleanups in our tests.

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index b66ce779511b..9bfd3cb9cde1 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -18,12 +18,32 @@ struct kunit_dev {
 static const struct drm_mode_config_funcs drm_mode_config_funcs = {
 };
 
+static int fake_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static int fake_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver fake_platform_driver = {
+	.probe	= fake_probe,
+	.remove	= fake_remove,
+	.driver = {
+		.name	= KUNIT_DEVICE_NAME,
+	},
+};
+
 /**
  * drm_kunit_helper_alloc_device - Allocate a mock device for a KUnit test
  * @test: The test context object
  *
  * This allocates a fake struct &device to create a mock for a KUnit
- * test.
+ * test. The device will also be bound to a fake driver. It will thus be
+ * able to leverage the usual infrastructure and most notably the
+ * device-managed resources just like a "real" device.
  *
  * Callers need to make sure drm_kunit_helper_free_device() on the
  * device when done.
@@ -36,6 +56,9 @@ struct device *drm_kunit_helper_alloc_device(struct kunit *test)
 	struct platform_device *pdev;
 	int ret;
 
+	ret = platform_driver_register(&fake_platform_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	pdev = platform_device_alloc(KUNIT_DEVICE_NAME, PLATFORM_DEVID_NONE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
 
@@ -58,6 +81,7 @@ void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 
 	platform_device_unregister(pdev);
+	platform_driver_unregister(&fake_platform_driver);
 }
 EXPORT_SYMBOL_GPL(drm_kunit_helper_free_device);
 

-- 
b4 0.10.1
