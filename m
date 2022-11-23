Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6A76363A0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3738310E580;
	Wed, 23 Nov 2022 15:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04DB10E580
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:29:13 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 7D47C2B069B4;
 Wed, 23 Nov 2022 10:29:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 23 Nov 2022 10:29:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217350; x=
 1669224550; bh=u+1ymrAP+Uo/CwDGmXOacIfISOEP++Rwn9qJQbSVq8E=; b=N
 AYi2/vcBLMDWtLcwQpME0YLmuCi9gO7LsXeCue+VQagjDk5HrYfyp4b8CMi4w00Z
 29LsG7Hidtz2Aj3+4qtkKuG6ckk73eZRiqWkEIL3NUGRQE2FJb+9WhvmE6MJaLa0
 jr8ZzP7WUkpLf34Tx4ULGV9RlqYQId6MXhGtKeiKDkTJM4X2tPTu7HpSh5HW7xNr
 tHQnI9Uth/aM5y+TjnvGJuJDM3R9hgukxgbIJKVGGmPGnClzod+B1rU5++wFZm8O
 njtADye0efyK8UESnJFARByB+MZoR81y4erJtAmcCF1fI0DwrO5YvdCARYUM+ia9
 qLwyVrsUXdHLYnoxt2Q+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217350; x=
 1669224550; bh=u+1ymrAP+Uo/CwDGmXOacIfISOEP++Rwn9qJQbSVq8E=; b=c
 Lt3gFaILhOvjOrVYOdI+Wgg/D7a8koC99CI0KJnHxGhvfPt+8XgeIldOaNFJg0Ig
 JDmpt9qfY501ux2kvQzrA/xNzCJxfvfn+oiWI+Dq8dQFHyi1G90p/42KCXVseEfm
 IQgdJjb6JtAgq0V+gdYbzRLSSHaeWxp+Ol1q5VGcPMupW0nZ1bn/O6Wn1hEFTdrK
 7O6JyC/5L4iRdE6/1Tw6eqUgvRbw1HAi9nlcuhM9RqmR7dyT0XX7y4+dMtyr5J5r
 A0akVPLgNInkC5RwECExampf3PqA3em9OKFw80bno4drszNe9PupQVWs2OcWBJKz
 ypYcOmG5oZvyy0sgQmZ0A==
X-ME-Sender: <xms:RTx-Y7_pp1Q_YC4psCGVWjLIrTYE_7WzLuddQ1N5xkkBqu0UbECt5A>
 <xme:RTx-Y3s8ik39r2zv6JXiXjoPQDDlYGEtpNRzKmaIWCh1FliSSDi7oElYsNhoaLPgx
 5nK-tWXD5-flZf4vlc>
X-ME-Received: <xmr:RTx-Y5Ca9pi4PDcatr9Dq-psv6CiDgGuMheSHEsbZXE0qzdVr2ov8IiUZAIzTkcf8-WitJ-qD1LM-FmrkNd5D5cph9Ito6wqcE1ruUp1MovJcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RTx-Y3ebgFE_51-GXnG_QkyEvrbMLn0f1wjvCIBMwYw90u062eLPjA>
 <xmx:RTx-YwPgZv9PTC0nxnGEY2fLrOzAZc7hd9oQ0EuW20AntefbFghatA>
 <xmx:RTx-Y5mvusnupntz-WNWG66Ur5DgpzYLljTNi-diNxnkAmhMo5TNwA>
 <xmx:Rjx-Y2vjwSb6K37xPRL1EU0o1DJYwZ9WvbzhGbYyTMcmEHTcIEe3sk27PH8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:29:09 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:49 +0100
Subject: [PATCH 07/24] drm/tests: helpers: Allow to pass a custom drm_driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-7-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3124; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Ahr/dzE3tn44EjPLHFard1PjEGhVLUGRIQk+hZvFDEQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11tV372yR3ysf8KIgQf+wyCf3JaeUf3ieFtW8eYt3+7Ql
 091kO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRg5yMDIv8H17brcQsWCGx8rS63p
 yo5rf+PdO9uXW2Os0vcMz+IsjI8LGsq+5SwMqjPHMNn87Ifj/zau6mdW5VZTILWLlW3pyhwA0A
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

Some tests will need to provide their own drm_driver instead of relying
on the dumb one in the helpers, so let's create a helper that allows to
do so.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 13 ++++---------
 drivers/gpu/drm/tests/drm_kunit_helpers.h | 29 +++++++++++++++++++++++++++--
 2 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 6d614f9e62d8..5c758a22f526 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -100,20 +100,15 @@ void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 }
 
 struct drm_device *
-__drm_kunit_helper_alloc_drm_device(struct kunit *test, struct device *dev,
-				    size_t size, size_t offset,
-				    u32 features)
+__drm_kunit_helper_alloc_drm_device_with_driver(struct kunit *test,
+						struct device *dev,
+						size_t size, size_t offset,
+						const struct drm_driver *driver)
 {
 	struct drm_device *drm;
-	struct drm_driver *driver;
 	void *container;
 	int ret;
 
-	driver = kunit_kzalloc(test, sizeof(*driver), GFP_KERNEL);
-	if (!driver)
-		return ERR_PTR(-ENOMEM);
-
-	driver->driver_features = features;
 	container = __devm_drm_dev_alloc(dev, driver, size, offset);
 	if (IS_ERR(container))
 		return ERR_CAST(container);
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.h b/drivers/gpu/drm/tests/drm_kunit_helpers.h
index 70abc8c806c9..45bc12a53cd4 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.h
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.h
@@ -10,9 +10,34 @@ struct device *drm_kunit_helper_alloc_device(struct kunit *test);
 void drm_kunit_helper_free_device(struct kunit *test, struct device *dev);
 
 struct drm_device *
-__drm_kunit_helper_alloc_drm_device(struct kunit *test, struct device *dev,
+__drm_kunit_helper_alloc_drm_device_with_driver(struct kunit *test,
+						struct device *dev,
+						size_t size, size_t offset,
+						const struct drm_driver *driver);
+
+#define drm_kunit_helper_alloc_drm_device_with_driver(_test, _dev, _type, _member, _drv)	\
+	((_type *) __drm_kunit_helper_alloc_drm_device_with_driver(_test, _dev,			\
+						       sizeof(_type),				\
+						       offsetof(_type, _member),		\
+						       _drv))
+
+static inline struct drm_device *
+__drm_kunit_helper_alloc_drm_device(struct kunit *test,
+				    struct device *dev,
 				    size_t size, size_t offset,
-				    u32 features);
+				    u32 features)
+{
+	struct drm_driver *driver;
+
+	driver = kunit_kzalloc(test, sizeof(*driver), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, driver);
+
+	driver->driver_features = features;
+
+	return __drm_kunit_helper_alloc_drm_device_with_driver(test, dev,
+							       size, offset,
+							       driver);
+}
 
 #define drm_kunit_helper_alloc_drm_device(_test, _dev, _type, _member, _feat)	\
 	((_type *) __drm_kunit_helper_alloc_drm_device(_test, _dev,		\

-- 
2.38.1-b4-0.11.0-dev-d416f
