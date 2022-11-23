Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA076636392
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B715E10E572;
	Wed, 23 Nov 2022 15:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF6310E575
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:28:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 9DBA22B069BF;
 Wed, 23 Nov 2022 10:28:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 23 Nov 2022 10:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217318; x=
 1669224518; bh=HaSsDv5d/FPLIwy4xz9F2XhZn0I1igKf8Qt5jLSTjc4=; b=f
 QZ+c3IojUQz4sEAxDt3ITDsH5qUbzjFnFiVOujWFjlRxPW+fmnkWLX1D7YhtvzXP
 NzkFPOwKXkLEttLyPEW9JXLBtGdNYwyOnnH5DvhdPwsfROf+tFv/5zoCTkJbTQSQ
 dRYzmFniX/sMya5LT43d+UgVcTzOIkPdGCJoOfG2fDj7R7lrM7bk7F9X0ms+sNjG
 6S+g9o9sBQbP6gTE5rqh3e7+vI7l3ga0U+1mu0i9b3SzbBGQ2lLLYG8llrlGVVvR
 A2Oas7Q1lo/GDm5U0Rr5NsfA/7v7JQ1wK6JCV7LQCXwGcHxQEiENplj/62jnjV9A
 r/eDMfuZz1dXytpcJPTUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217318; x=
 1669224518; bh=HaSsDv5d/FPLIwy4xz9F2XhZn0I1igKf8Qt5jLSTjc4=; b=K
 I01EeLGqfTFeYOPvSpj1Zic/UXhHAL6Yp+91sRKjCyYIoSfArFTjsOCLibqlRBnI
 HddWBDCZkPRT2aEaqPUs8e4h0+nVCv1jmn0WZ98Lea2TsfJgodc8H39PaH7wltzX
 UmB/ADJ1/yLb2oh92JLx8kXavn01gMz2XHJWiBdKYVzKm2NlsfYTxxZR4lbjPRxw
 2Hl4SGYP/P6NSelbm/dXDmKgtLA1W4krmrvQtU+eHlEms6atDyD1Tfln3nRQ4CXO
 jGCjxX0ypIGFEVIKKvUlcmttf1IuBRdxaTmhg/snrUGFJk/BpExFR4r2hZGpDcFo
 SVP/Hfae/nrVb7q0wVaOg==
X-ME-Sender: <xms:Jjx-Y1nlCsG9gOJ4d2rueqAP8vzWY7yjl461n8WvVEcBvccDf76OJw>
 <xme:Jjx-Yw25s9_zW4FoSIiwsuz1GKzymvgf1fmHWbeQkisA6ULfbT_XbM7ix3FHkQZFg
 Pk0qTi-lhuNZKTHko4>
X-ME-Received: <xmr:Jjx-Y7rQI42fiHSNaGMr-AZQKSJFL90k6vabRGSpoXyk8C7mkIJFlLy-k12Mx6LI5re_w2nPZvBW_r10S7LsAJ_ZnydnfLh8iLMSim0L8alFkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Jjx-Y1lnIkLhHzO-7SSzrNP6wyADe_TR9oPoqFdQVRsEzQ8YHIBjMA>
 <xmx:Jjx-Yz27z8G0QIKObN4wE6wUbq7ixhkCU27HA8SyfbNPGNoN1_49OQ>
 <xmx:Jjx-Y0sjziqQNL5z5sIlGGVjGZmCWRfuwGuomlYQSYfyZTb1-SSkbA>
 <xmx:Jjx-Y-XwECL9Hg9eQj7D5nFxpdo31ozyVS3lmU2b-8sRiJvy3BJrD4FGyfo>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:28:37 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:43 +0100
Subject: [PATCH 01/24] drm/tests: helpers: Rename the device init helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-1-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2290; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=+rmCI9pAbapeYT85w8cED6RZFZiyY+8wIFJWQAoU8uo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11lWz7u8IZOvcvFPnYE1enPvc6zapuWmnFt06Gsl28pfK
 xii9jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEyE9xcjw47q/s28coGT1xqcLDnNf2
 FO48VbRwpvNa1pFjeTT2V61MrI8F3zVfS/NfxfXAJ/di5iOG9X9uPWL/47eV8nyd4NDmeIYAUA
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

The name doesn't really fit the conventions for the other helpers in
DRM/KMS, so let's rename it to make it obvious that we allocate a new
DRM device.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 2 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 4 +++-
 drivers/gpu/drm/tests/drm_kunit_helpers.h       | 5 ++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 362a5fbd82f5..e469d1634e2d 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -41,7 +41,7 @@ static int drm_client_modeset_test_init(struct kunit *test)
 
 	test->priv = priv;
 
-	priv->drm = drm_kunit_device_init(test, DRIVER_MODESET, "drm-client-modeset-test");
+	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET, "drm-client-modeset-test");
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
 
 	ret = drmm_connector_init(priv->drm, &priv->connector,
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index f1662091f250..a4ad030ed101 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -36,7 +36,9 @@ static void dev_free(struct kunit_resource *res)
 	root_device_unregister(dev);
 }
 
-struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char *name)
+struct drm_device *
+drm_kunit_helper_alloc_drm_device(struct kunit *test,
+				  u32 features, char *name)
 {
 	struct kunit_dev *kdev;
 	struct drm_device *drm;
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.h b/drivers/gpu/drm/tests/drm_kunit_helpers.h
index 20ab6eec4c89..e9870c7911fe 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.h
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.h
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
