Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F08F563ABB2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310D410E207;
	Mon, 28 Nov 2022 14:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF2A10E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 14:57:11 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id C33172B04FDA;
 Mon, 28 Nov 2022 09:57:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 28 Nov 2022 09:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669647427; x=
 1669654627; bh=3jM1lFpUvid9dL8xbYzBjvihYXMZQEDhHtBPP0SyarI=; b=d
 VnpaZfinNiAH/tdfbeKg1gxVVl6mk3HeKH9W+u5ZMKfM1lNFVuJKEOG79mGzdL2k
 dDxLP27Ua2TBSA5Oz/BnDdbB2FVYEMTR5pYBVkHzMzpuqhmhtcAsVokdQLz8SrsZ
 gAVy2B1kfBbaufD/RqZw+1A+wyiCbgkhoQPG9HRXsEK2a1ZRDoIrASGZ29a13LIj
 p5H//H34wOeSSWUADeF9pd15Bc3nMWs5tG0f2ygMPddDNEVSDJu0CkZIoX46FAU6
 QzUO1Gh1ChW/wsJ00DgNGiVaVUabr3a64bcX5mc7FR43msRqDukHma5Jo0bazFrI
 yPAWydFqrja0c09MwW7oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669647427; x=
 1669654627; bh=3jM1lFpUvid9dL8xbYzBjvihYXMZQEDhHtBPP0SyarI=; b=X
 j88QF+w6o3q7D/akegJ4mlKIG0E6FJhRmmrAC/wktVBnzMLEUYGmCP6DhZqxBKvZ
 1jDzeouSYvgxEXnqNn0Ze4//1J2GkIDIrKQIH8K5Qnc7teEj4Yl7jKr0KSxoQktC
 NY66dUBM6RsLYA8TO2ktXDkGbJcIq3D1V3ekTfVwtcMbeXkMu2i9erK112vBi4lh
 DXHnuKrm3TAzlJ820wWaVvYrqt6FSqc4HPAL8atGKlDHUPCKWpSEyvrovIPhj9e8
 gsm+i6WsDLKL9Lrh4Y+PCF+FbfaaJmzmsq8JMF+VCbb2RPz2k82APN8aGAn6ykyV
 wKkRYCMu2wOQApH9Xqm2w==
X-ME-Sender: <xms:Q8yEY18s-ayChROu0BXe8GL5C4dI5i7p08u3MiYv_XWgDS1ACYaYCg>
 <xme:Q8yEY5tafxUQIz5gNLoxzTGCSAsGJTvzqLnXk-7KtlL0Jkh9Qqbv4Bb29KirkE_Q3
 K3ERDtRp0uHLZUyhBo>
X-ME-Received: <xmr:Q8yEYzAu5Xo2l9yO1Wn8m2afKWNgMJsx_BjuIdsDkDzMK2Hq8T68KqLg3g_qp9YTZ35zcOyc2LXhFrlUHxQFzutDXeNDJOBy5ZoZj2HCSpTHRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Q8yEY5c2N7QTnfEFxIw4aDeQM7dFnjy33GgK7PGScUF22QXIOSlHfA>
 <xmx:Q8yEY6OsBdhE8yqnpdiHpmI9wsSOpl85iUC1q3T5-EMApdggyRtKzg>
 <xmx:Q8yEY7mPrxTTxiMcG62gBqIEtQg1ryJoZbN17H5zsxfKJq-0xzSzrA>
 <xmx:Q8yEYwt0fk7g3twpBRaUzZEWMeSJCJmlbEEpdsxSkho6lIXhtEYK_6IDWX0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 09:57:06 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 28 Nov 2022 15:53:35 +0100
Subject: [PATCH v2 06/17] drm/tests: helpers: Switch to a platform_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v2-6-efe5ed518b63@cerno.tech>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=mqiACPZnDbOIQIFxcYqDVu9/u1XR2zsC5mwvrG+GQrs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMktp8vSqzU0p7InMRZPvsOw3PHS19+lOWkHrBcGhL56sO//
 8WmzO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRaQyMDJs4uVpWvPO+8kmUmTVc8P
 LGxXz750VZ7OXtZt67vVF2/l1GhskW8wWX8t1RS/ww6Zv47YDZWc5snkwt6/Yr1Nfv8Q3qYAIA
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

The device managed resources are ran if the device has bus, which is not
the case of a root_device.

Let's use a platform_device instead.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 9fb045fa685f..15678ab823b0 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -7,6 +7,7 @@
 #include <kunit/resource.h>
 
 #include <linux/device.h>
+#include <linux/platform_device.h>
 
 #define KUNIT_DEVICE_NAME	"drm-kunit-mock-device"
 
@@ -32,7 +33,16 @@ static const struct drm_mode_config_funcs drm_mode_config_funcs = {
  */
 struct device *drm_kunit_helper_alloc_device(struct kunit *test)
 {
-	return root_device_register(KUNIT_DEVICE_NAME);
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_alloc(KUNIT_DEVICE_NAME, PLATFORM_DEVID_NONE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	ret = platform_device_add(pdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	return &pdev->dev;
 }
 EXPORT_SYMBOL(drm_kunit_helper_alloc_device);
 
@@ -45,7 +55,9 @@ EXPORT_SYMBOL(drm_kunit_helper_alloc_device);
  */
 void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 {
-	root_device_unregister(dev);
+	struct platform_device *pdev = to_platform_device(dev);
+
+	platform_device_unregister(pdev);
 }
 EXPORT_SYMBOL(drm_kunit_helper_free_device);
 

-- 
2.38.1-b4-0.11.0-dev-d416f
