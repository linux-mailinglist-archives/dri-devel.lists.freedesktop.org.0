Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9F463F376
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7F510E60B;
	Thu,  1 Dec 2022 15:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E97410E60F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:15:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C5A81580381;
 Thu,  1 Dec 2022 10:15:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 01 Dec 2022 10:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907713; x=
 1669914913; bh=oDB2afXY6lkHKaqUoi0wRi3hiF2Hi8xv6xcV2kl0XgE=; b=J
 J1+70pDODrFN9p104zfK4+W64oGRpxJRZ4Fq4+sDfdOD0yHesjMFSS5p6SvYVrY4
 XoSaV1sif8A52rkgBkF/eR/5fuboUhPb/TehhuRgLYXyskhOci2B1+w6WtIvCNH7
 wE6qPPxzwQI5DKw7kgiP10UGdIGeilHwXFHJISFyEhDqPm3zVzvxaM3fdgxNIu+j
 lfiza8Cr/uBSsjTAzGqkLa6Vm6XW5mi2pLh64VOCMLiZ1g8P363MibSOqvQYBWrd
 gOWNmPwRYmSAeP53xxYCgfdS/sSBezoBOOYd3gd5AY1uJtt4T8Jm2yX1wqVNmmKY
 tzIwPPHfbxwbTalTKDb7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907713; x=
 1669914913; bh=oDB2afXY6lkHKaqUoi0wRi3hiF2Hi8xv6xcV2kl0XgE=; b=l
 uZR/L5+9wXpouuqXjTHLl6i7VBR3EFftgIM6wLf9GTwjbuH2eFyqo0aazVTf6fnO
 rBBwgfHWOlO1rFgx3Wh55zobGbOhFbWSnuV0YAJrtGOjSr1x9fra2KPs3GIygxcr
 6gneChCAfUpMR48eGnKFuuJV6NzFj9PXvaIfkR/m0vvfCAFwkhjzdNoegWZl6ppJ
 7l1+yweykLfNJSB6FVnjFuEbAYhDCojA3wn13kteLqsQxStuxtYe6VnHmgI8LBLK
 tmSVleRy3tT0IbeDBGNwMp5sHNoLzUI3j4NaV2G4epWRpHrBzFVHRD7mRYsWa+DD
 Sy2HDeYYkNOyTFJPsWwiQ==
X-ME-Sender: <xms:AcWIY3AUzxmNVJQmqT2Y5NyEMOkFFPcODhUWPrcTbEJ4KHVxAoNLzA>
 <xme:AcWIY9hvvkiY_ACAZJC1edFywIT9mBe0cK4WPuq25xviK2KgRC3kfUOIb07I8Z6e9
 7XMtPcBisxIqukrw-E>
X-ME-Received: <xmr:AcWIYykHEnSvBW1QTWuJQbkn7lnFKSpxcmU7v7AisVBRb-lVm37Rx_IY1xaLvDckzXJQlIqbJ6Zbjf1-m7dn6eQQH5cqxVVfzujh_HU1ML8ttg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AcWIY5xOywpVkoFQYlZfzGZ-L22bAK0fXaZtFi9r2dE9MD-pqPrk2g>
 <xmx:AcWIY8RkRD1Dxz09SXRJWCEMtWge7LxRosMiiG6rH1lcEQ7cCV0-xQ>
 <xmx:AcWIY8abPeYNGe5rbjjOT5EH15ecjyTaKTY-oN-RQVX5d15rhZS47A>
 <xmx:AcWIY0znQN4yWD1VqgHmvnOt95M0jeQMBx9yTvWqZRk4vWZeJio7rQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:15:12 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:45 +0100
Subject: [PATCH v3 14/20] drm/vc4: crtc: Introduce a lower-level crtc init
 helper
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221123-rpi-kunit-tests-v3-14-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5028; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=PmLbO4zADFTtSdsuPA9IBUCP4WoMg3nPuUuT2WyMo0I=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdRzQe8t9Qz25Q1+exubuM5VLgrydKvn96ZCvKmWpPRaQ1
 fSrpKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwES+XGFkmO3c2td+7JlKwNHz72MKGF
 dxvhLrW5aX+TDD9zfv2UX8XowM39YqZZ5T2bW+aGXJ5p0MdxtcdXOSpz1Qm7c27p7d/Bc2fAA=
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

The current vc4_crtc_init() helper assumes that we will be using
hardware planes and calls vc4_plane_init().

While it's a reasonable assumption, we'll want to mock the plane and
thus provide our own. Let's create a helper that will take the plane as
an argument.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 70 ++++++++++++++++++++++++++++++------------
 drivers/gpu/drm/vc4/vc4_drv.h  |  6 ++++
 2 files changed, 57 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 333529ed3a0d..5f7f50add46e 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1286,31 +1286,38 @@ static void vc4_set_crtc_possible_masks(struct drm_device *drm,
 	}
 }
 
-int vc4_crtc_init(struct drm_device *drm, struct platform_device *pdev,
-		  struct vc4_crtc *vc4_crtc,
-		  const struct vc4_crtc_data *data,
-		  const struct drm_crtc_funcs *crtc_funcs,
-		  const struct drm_crtc_helper_funcs *crtc_helper_funcs,
-		  bool feeds_txp)
+/**
+ * __vc4_crtc_init - Initializes a CRTC
+ * @drm: DRM Device
+ * @pdev: CRTC Platform Device
+ * @vc4_crtc: CRTC Object to Initialize
+ * @data: Configuration data associated with this CRTC
+ * @primary_plane: Primary plane for CRTC
+ * @crtc_funcs: Callbacks for the new CRTC
+ * @crtc_helper_funcs: Helper Callbacks for the new CRTC
+ * @feeds_txp: Is this CRTC connected to the TXP?
+ *
+ * Initializes our private CRTC structure. This function is mostly
+ * relevant for KUnit testing, all other users should use
+ * vc4_crtc_init() instead.
+ *
+ * Returns:
+ * 0 on success, a negative error code on failure.
+ */
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
@@ -1342,6 +1349,31 @@ int vc4_crtc_init(struct drm_device *drm, struct platform_device *pdev,
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
index 051c2e3b6d43..cd2002fff115 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -888,6 +888,12 @@ int vc4_bo_debugfs_init(struct drm_minor *minor);
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
b4 0.10.1
