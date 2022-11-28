Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8057163ABAE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E7210E1F2;
	Mon, 28 Nov 2022 14:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC52A10E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 14:56:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D85892B04FDA;
 Mon, 28 Nov 2022 09:56:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 28 Nov 2022 09:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669647403; x=
 1669654603; bh=bR9fIsm10MS5O+pzDM9Ri2oe+3Jilb/0tnPd4bxLFgk=; b=D
 0CLvOrtBphX47ypRLkLRwWwJubLgoi0ZzUrIHRZJhINsyWDT50Cl05Dp8gXkBcNl
 4qT0DdzI1SclQhpl8z3DJHM0hT7f8gdS27A4rvzeoMQpaKzCH3AUX8UT51Y+1QFM
 aROJfbJbzG8f0bfqLP1YxcjTWk36ZYx4bovZA7Jcqi8eSsXC6K/o5/GiG/sjZ4tL
 aH8e7r9DcXSgL+8oSGWHbcXcc6MqbTL7nAHhsHR1wHJ4euvXooV5IEJG8zBmrToP
 tQu/4QWNg8QkgXOtRIj/+Zi7hc6eR5yilXxgR1KzOXo41Bd3DdOG6m2s4UUpMrB8
 DTC61vgtVSTRetfu9cVMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669647403; x=
 1669654603; bh=bR9fIsm10MS5O+pzDM9Ri2oe+3Jilb/0tnPd4bxLFgk=; b=w
 wIbc55G2fID3SU+U7tVxScuIBjDMwRFCYuP3uSs3YHEv6f/THPEs/YfwqINKFVFk
 S+lcM9Y32fo9roan8YxgXTVKbn1xy2Ag2NR4lr9q7SB9SqZjL/khSdf6U15CJRDb
 +fcvQ7SgWSXci6If37zkT7dd79F+sM5+ZF7MIAO913ZVVhXHoR31BJ1ctM5VBhBI
 BeU5IVHk5QkYodpFbOxP5PZzCx0dPheMMFQvJEuhn1VOSS7oT79TXRh1G90gCfQC
 W5YqO0XilOs4BLTFtG+iUxaTB0xUwEPiP9QsDI0sNWsxg6i35e1rix0hzoyOgFUU
 qplA/X0xPdpp4PU78YZBA==
X-ME-Sender: <xms:K8yEY8ehu3jn0GxHz3kntWF_5b9fJCEM4SKPGFmuQCTWDARnZhzofg>
 <xme:K8yEY-PHpvgQpDl0fFaFos06Sy0gmjNmWvVIHiqAHCBIZ3LdGZwqwyo8I2inVQ87p
 7nsyBttiawKLwvnnEs>
X-ME-Received: <xmr:K8yEY9hlPc2y5us4ecgxhxfRu7NnG-1HBY85fmT8ofm0bCbllih9VePbnTYrwXQBK481d3Xyibz93E3MUTJSHQkTPus70i9ODzWyFkrZ0gUi1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:K8yEYx_ZpwRVNyJt6b7Xe4Ovh1rEvUrc4HnX-0vs7pO7f0J0VgwqpQ>
 <xmx:K8yEY4sQYQ88Y9nXEx2CwH5moKziM5T7qP21Z3kzqUWhb9c3Nyd-vA>
 <xmx:K8yEY4GJOwyLdGB__hFOHlLzJCIGdT8eynYfkxC4pGlxA4QHqoiLgA>
 <xmx:K8yEY_MAkq3GjNWuLbvamdcgxNcx_JUacjd8cADDxlskce6z-qXtVNfl5NM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 09:56:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 28 Nov 2022 15:53:31 +0100
Subject: [PATCH v2 02/17] drm/tests: helpers: Document drm_kunit_device_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v2-2-efe5ed518b63@cerno.tech>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1506; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=OBe11HrZ3kVuHpwrCmupAo/u8B+NBmoTDXYW339k0v0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMktp0sD0i50/c/btf6Eos0PC66UcJ6C656PPpfffvokjauc
 Y8nNjhIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEykSofhx5q5NlZCEjrKH9xfzzX8mb
 iPOzxjoeKyXWaMIUsipbn8GP6HCBTPOLlj09XlyZsSp7s9e/T2sDb3IYuec2rfe8x2FnLyAAA=
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

Commit 44a3928324e9 ("drm/tests: Add Kunit Helpers") introduced the
drm_kunit_device_init() function but didn't document it properly. Add
that documentation.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 6600a4db3158..46a68c2fd80c 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -35,6 +35,23 @@ static void dev_free(struct kunit_resource *res)
 	root_device_unregister(dev);
 }
 
+/**
+ * drm_kunit_device_init - Allocates a mock DRM device for Kunit tests
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
2.38.1-b4-0.11.0-dev-d416f
