Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B00566363BA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0170910E596;
	Wed, 23 Nov 2022 15:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A971410E58E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:30:09 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 893162B06A7A;
 Wed, 23 Nov 2022 10:30:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 23 Nov 2022 10:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217406; x=
 1669224606; bh=LlEqWReXgYelNaQynNJoKq+p/J+M6VGW5u7ywWVNf90=; b=O
 PhnUmmObWB2Smpw9hTlKl0+gG+acUeDtyqL5zva6afe5CHZ6dqBKOnGwnEiSwee6
 wAwuVRu3oan6avZO2swX2HeeXkzzgIVGOFuWUSwDsXseFegZBDNbfWMmRn2qmmW3
 S+IWM7IK8eqPDw4VpQCC8O6ROl1n+C/6mgCb0WuddaU6nF0IQLrASfrC23e1rIqy
 4A5fO8NRKIZmgXD48xtniWvvnhZ3/YOvAYM958WVEDz3YGmMC7p+CVhs77HwMB3O
 PFXnFbCVWfT78mJLdZMDV5uO5XvK1biJ6Lie6jBw5RWK+uKQBxbhABCjZXkRZ1mg
 4vGtbRejkyl8HEuGfghvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217406; x=
 1669224606; bh=LlEqWReXgYelNaQynNJoKq+p/J+M6VGW5u7ywWVNf90=; b=K
 q1uiowPzudo2bWceLx0Zk8x1qpfbYrwJLWwbaZDyYjWxe4I9zb2vYiH1q938ufl3
 +lpPoF09MyqJ07PDuD5BAJC3k3Ksk8aubrV+N6ImsqUaoCO4mNHArnIshmk/3kPP
 aV+RcGOBsjPoIE5Qco8rEQexWGz0uwgCDDg5NrY1nlMEUjgkE/tb189dJgpaxC4o
 /fiexJhSHz39ocSpcZv2GIPkZG1i2vCDvvoW7jzpZyojqAw02wbB5ibKU2jf1dK1
 4z85SC0EqJoNtsZIMpqXESazVSne9I9AP/P4gxzVz2fhBE2+EpKFOIfCOvTk0VQE
 sP/F6+xYzRMbFWHTYwR3A==
X-ME-Sender: <xms:fTx-Y-c9JoIijGq9cEyDb5NxplWcxranpHqMCJUPxr5oQlJ7hlFf1A>
 <xme:fTx-Y4MB0HAJDcD51LxjaUzKIYg82HmLxP3HERpknBJldFNmUNict9_psp4NdjryR
 JLFoPxTIqtWURw5nRs>
X-ME-Received: <xmr:fTx-Y_iuEOAnHsjeSiSvAyCTNS0-s6JEXtHEUco7kzYV0oJClki9C8D5jUeG3Srgni6SuFMpMvZkzDcjkEuI2ZS9g3vMEDy7tkzc2eHBdHNDrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fjx-Y7-70AVLQsASm2RnWwaIwCYSdIdo-6TCQMlJK2Z5DIV2XtJQ0w>
 <xmx:fjx-Y6tO5fTXl_tgUYariEUCYnK0ONt0b6yuocLD1uY7BNOGrGoLAw>
 <xmx:fjx-YyG92poKXr1HCaHHWC9WhO3nXy1u4sG0LWOHvyGdkDbl3lpa2w>
 <xmx:fjx-YxNzD5_mN9YFibOSYxNIyrEdZAfdFArxuUdooEuorCwTn3u6dc5ivy0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:30:05 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:26:00 +0100
Subject: [PATCH 18/24] drm/vc4: crtc: Introduce a lower-level crtc init helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-18-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4295; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=04Z0uBi+qWOZWjvOeTb+qQEOKCz2nCGugN1CpyNo2Ow=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11tU3dzgtrpy45HYjg9zT5Lmy6wQnKyf8z3sr/evZ2dsf
 DDmbOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRn8GMDMfLTn7s2yrny/3d9/p3O1
 f2idrsp56U7Z/DzNmzJ/fAITWGX0xSE5osbrSfk2YItrl/gddR7GBrxXZe7zxJ/29pDK6bOQE=
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

The current vc4_crtc_init() helper assumes that we will be using
hardware planes and calls vc4_plane_init().

While it's a reasonable assumption, we'll want to mock the plane and
thus provide our own. Let's create a helper that will take the plane as
an argument.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 52 +++++++++++++++++++++++++++---------------
 drivers/gpu/drm/vc4/vc4_drv.h  |  6 +++++
 2 files changed, 39 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 1ea190dffe87..340c39921bce 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1278,31 +1278,20 @@ static void vc4_set_crtc_possible_masks(struct drm_device *drm,
 	}
 }
 
-int vc4_crtc_init(struct drm_device *drm, struct platform_device *pdev,
-		  struct vc4_crtc *vc4_crtc,
-		  const struct vc4_crtc_data *data,
-		  const struct drm_crtc_funcs *crtc_funcs,
-		  const struct drm_crtc_helper_funcs *crtc_helper_funcs,
-		  bool feeds_txp)
+int __vc4_crtc_init(struct drm_device *drm,
+		    struct platform_device *pdev,
+		    struct vc4_crtc *vc4_crtc,
+		    const struct vc4_crtc_data *data,
+		    struct drm_plane *primary_plane,
+		    const struct drm_crtc_funcs *crtc_funcs,
+		    const struct drm_crtc_helper_funcs *crtc_helper_funcs,
+		    bool feeds_txp)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct drm_crtc *crtc = &vc4_crtc->base;
-	struct drm_plane *primary_plane;
 	unsigned int i;
 	int ret;
 
-	/* For now, we create just the primary and the legacy cursor
-	 * planes.  We should be able to stack more planes on easily,
-	 * but to do that we would need to compute the bandwidth
-	 * requirement of the plane configuration, and reject ones
-	 * that will take too much.
-	 */
-	primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY, 0);
-	if (IS_ERR(primary_plane)) {
-		dev_err(drm->dev, "failed to construct primary plane\n");
-		return PTR_ERR(primary_plane);
-	}
-
 	vc4_crtc->data = data;
 	vc4_crtc->pdev = pdev;
 	vc4_crtc->feeds_txp = feeds_txp;
@@ -1334,6 +1323,31 @@ int vc4_crtc_init(struct drm_device *drm, struct platform_device *pdev,
 	return 0;
 }
 
+int vc4_crtc_init(struct drm_device *drm, struct platform_device *pdev,
+		  struct vc4_crtc *vc4_crtc,
+		  const struct vc4_crtc_data *data,
+		  const struct drm_crtc_funcs *crtc_funcs,
+		  const struct drm_crtc_helper_funcs *crtc_helper_funcs,
+		  bool feeds_txp)
+{
+	struct drm_plane *primary_plane;
+
+	/* For now, we create just the primary and the legacy cursor
+	 * planes.  We should be able to stack more planes on easily,
+	 * but to do that we would need to compute the bandwidth
+	 * requirement of the plane configuration, and reject ones
+	 * that will take too much.
+	 */
+	primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY, 0);
+	if (IS_ERR(primary_plane)) {
+		dev_err(drm->dev, "failed to construct primary plane\n");
+		return PTR_ERR(primary_plane);
+	}
+
+	return __vc4_crtc_init(drm, pdev, vc4_crtc, data, primary_plane,
+			       crtc_funcs, crtc_helper_funcs, feeds_txp);
+}
+
 static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 599d24f1f55a..01ca2b25d2e3 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -886,6 +886,12 @@ int vc4_bo_debugfs_init(struct drm_minor *minor);
 /* vc4_crtc.c */
 extern struct platform_driver vc4_crtc_driver;
 int vc4_crtc_disable_at_boot(struct drm_crtc *crtc);
+int __vc4_crtc_init(struct drm_device *drm, struct platform_device *pdev,
+		    struct vc4_crtc *vc4_crtc, const struct vc4_crtc_data *data,
+		    struct drm_plane *primary_plane,
+		    const struct drm_crtc_funcs *crtc_funcs,
+		    const struct drm_crtc_helper_funcs *crtc_helper_funcs,
+		    bool feeds_txp);
 int vc4_crtc_init(struct drm_device *drm, struct platform_device *pdev,
 		  struct vc4_crtc *vc4_crtc, const struct vc4_crtc_data *data,
 		  const struct drm_crtc_funcs *crtc_funcs,

-- 
2.38.1-b4-0.11.0-dev-d416f
