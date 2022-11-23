Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B9A6363AE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2CA10E58E;
	Wed, 23 Nov 2022 15:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78D010E58F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:30:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 1DC022B069B3;
 Wed, 23 Nov 2022 10:30:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 23 Nov 2022 10:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217400; x=
 1669224600; bh=ChYI1M6Z54togdHh/dr/ukigKVcIk1SA7Zu3mho3dqM=; b=l
 /iGN1GKplSE+Cw/ezbuqzZiNTwbPvsC3rd0djiTIh82VitgOmPH7aV3+z/3CRaXw
 REhuh7+QPoJ9GhS4GQu+7IW0OavaN+v920KBSPVQxnxRuqnuQzwcixJoUD3aEyMd
 5MOWP+tafxVMyQu/zDR68FC2k/QJY3kBRBdVfGHGzK/pncjB87vdu3Wf52vrYiJf
 TNjfOzdyrzkic4kDSUQ+o5MR4Fj/Foo4b49akevs3NsJtu9EhNYDedqA1S2jkv2d
 Z4NoX9Q76boem/NS3Ns3a1P9lVi88J+eCoYIV8KXS2XFbvEplPKzZS53IXAZe4RZ
 uiHK069quGGxob7498gkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217400; x=
 1669224600; bh=ChYI1M6Z54togdHh/dr/ukigKVcIk1SA7Zu3mho3dqM=; b=A
 ZTn/AeH3GLMXTY4WVoT2gKRf4kdKF5MK4rwm9NpQbZqxa6WvzrbUska5QQDddEEg
 g/vT/6L3STApxE64TU7Z6e0rz8B4sxP38wmTMLOwdxo1Q06wICU8QxG6D4Ei2uh4
 oMQ1joFGM7MX0w7Fz20dKHITsuOdz4oGDjnbdGAXmqHXYHPfULOny+ezdnRxmowq
 ANhuIZb9Hq0jgofZbaWwiAD4uVg++k+9TQwGwAmLI0Rzs3qEQHcz8rZHlQjjx5ar
 nkfr/hM1D4lYh61iVu3LgYOIbFi+nZRe4J7j4gmXgkzXvULwho6rQdO15hASYOrJ
 YS0JzDE27mBcGnc+Wn8BQ==
X-ME-Sender: <xms:eDx-Y9OOmc4_s3cAq_j0mdnOqX4BiqY5crWdNF4NKZxLHHy-UUoK2w>
 <xme:eDx-Y_99Ldq5YD_MPl7Thdr20cjyC6uPGB805t58P65Nm2FnJqeV5VBgJTJxa3hZ4
 R9KqZnsPyhVLK-FIro>
X-ME-Received: <xmr:eDx-Y8QXBgWuuSXXC8kGANxx3IKsvYYGfM5EoHqVMwbDyiSChqa3yNc4SIxEww9NBYX-cPpu86yaR2VWElWfuKwpeWeianR84TXJT-eRj-0ECw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eDx-Y5uihcKJpjlhmfoRY5jcUnXzqVFeN22hDv_dwmCcGgetmTc2Rw>
 <xmx:eDx-Y1dCJXCwj__z8-MgKE6Ujk1C6M740Gmcv5pXJXT2pZ13FUg2fw>
 <xmx:eDx-Y10FklRlTjKOEl_0qgZ_Ab0WoLFkuU1elANdZS2SJJOvUihIVA>
 <xmx:eDx-Yz-2I0YJS720_cu4LUfzdJHd9COqRmWNaN2zVAek89_89_tp4Jf1zfc>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:29:59 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:59 +0100
Subject: [PATCH 17/24] drm/vc4: crtc: Pass the device and data in vc4_crtc_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-17-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4204; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8IMW90exgcOHa0pomJ4hHcxuKwRM2yEBQaUql6lBc2M=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11tVZLx7+WirWU/0+ljt17wOZ7ecu3PuusXnLtBXpOyPj
 LgYf6yhlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEVlUwMnyxmLX/wNYQ++a7qw83OD
 gem/pg2gODbV91NTmq9H9+n3ma4a8kt8OG6w78f78f3fk3ovB2hP6Onyme5x4vW+Dx5JCR/nxuAA==
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

Both users of vc4_crtc_init need the same extra initialization to set
the pointer to the platform_device and the CRTC data. Since it's
mandatory, let's make them both arguments of vc4_crtc_init().

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 17 +++++++++++------
 drivers/gpu/drm/vc4/vc4_drv.h  |  6 ++++--
 drivers/gpu/drm/vc4/vc4_txp.c  |  7 ++-----
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 0108613e79d5..1ea190dffe87 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1278,9 +1278,12 @@ static void vc4_set_crtc_possible_masks(struct drm_device *drm,
 	}
 }
 
-int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
+int vc4_crtc_init(struct drm_device *drm, struct platform_device *pdev,
+		  struct vc4_crtc *vc4_crtc,
+		  const struct vc4_crtc_data *data,
 		  const struct drm_crtc_funcs *crtc_funcs,
-		  const struct drm_crtc_helper_funcs *crtc_helper_funcs)
+		  const struct drm_crtc_helper_funcs *crtc_helper_funcs,
+		  bool feeds_txp)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct drm_crtc *crtc = &vc4_crtc->base;
@@ -1300,6 +1303,9 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 		return PTR_ERR(primary_plane);
 	}
 
+	vc4_crtc->data = data;
+	vc4_crtc->pdev = pdev;
+	vc4_crtc->feeds_txp = feeds_txp;
 	spin_lock_init(&vc4_crtc->irq_lock);
 	ret = drmm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
 					 crtc_funcs, NULL);
@@ -1345,8 +1351,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	pv_data = of_device_get_match_data(dev);
 	if (!pv_data)
 		return -ENODEV;
-	vc4_crtc->data = &pv_data->base;
-	vc4_crtc->pdev = pdev;
 
 	vc4_crtc->regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(vc4_crtc->regs))
@@ -1356,8 +1360,9 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	vc4_crtc->regset.regs = crtc_regs;
 	vc4_crtc->regset.nregs = ARRAY_SIZE(crtc_regs);
 
-	ret = vc4_crtc_init(drm, vc4_crtc,
-			    &vc4_crtc_funcs, &vc4_crtc_helper_funcs);
+	ret = vc4_crtc_init(drm, pdev, vc4_crtc, &pv_data->base,
+			    &vc4_crtc_funcs, &vc4_crtc_helper_funcs,
+			    false);
 	if (ret)
 		return ret;
 	vc4_set_crtc_possible_masks(drm, crtc);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 31228d4cf080..599d24f1f55a 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -886,9 +886,11 @@ int vc4_bo_debugfs_init(struct drm_minor *minor);
 /* vc4_crtc.c */
 extern struct platform_driver vc4_crtc_driver;
 int vc4_crtc_disable_at_boot(struct drm_crtc *crtc);
-int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
+int vc4_crtc_init(struct drm_device *drm, struct platform_device *pdev,
+		  struct vc4_crtc *vc4_crtc, const struct vc4_crtc_data *data,
 		  const struct drm_crtc_funcs *crtc_funcs,
-		  const struct drm_crtc_helper_funcs *crtc_helper_funcs);
+		  const struct drm_crtc_helper_funcs *crtc_helper_funcs,
+		  bool feeds_txp);
 int vc4_page_flip(struct drm_crtc *crtc,
 		  struct drm_framebuffer *fb,
 		  struct drm_pending_vblank_event *event,
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index c2a6bea6fd96..841da240d93a 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -509,15 +509,12 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(txp->regs);
 
 	vc4_crtc = &txp->base;
-	vc4_crtc->pdev = pdev;
-	vc4_crtc->data = &vc4_txp_crtc_data;
-	vc4_crtc->feeds_txp = true;
 	vc4_crtc->regset.base = txp->regs;
 	vc4_crtc->regset.regs = txp_regs;
 	vc4_crtc->regset.nregs = ARRAY_SIZE(txp_regs);
 
-	ret = vc4_crtc_init(drm, vc4_crtc,
-			    &vc4_txp_crtc_funcs, &vc4_txp_crtc_helper_funcs);
+	ret = vc4_crtc_init(drm, pdev, vc4_crtc, &vc4_txp_crtc_data,
+			    &vc4_txp_crtc_funcs, &vc4_txp_crtc_helper_funcs, true);
 	if (ret)
 		return ret;
 

-- 
2.38.1-b4-0.11.0-dev-d416f
