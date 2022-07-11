Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D1C570907
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7B8902F6;
	Mon, 11 Jul 2022 17:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26212902EF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 684BD5C014E;
 Mon, 11 Jul 2022 13:40:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jul 2022 13:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561204; x=1657647604; bh=hD
 9eOU2afMXkNnq4gB8nFaVHBwjCgGKn8JzjN+9sTMc=; b=PngkeQvVmS0rkCzMt6
 2nCyyjFRCS6lmEjGNYWGcGX3VRbHZ+Itt2mdV56/Z8mpF1acsEnErpH9bZjcQxFG
 JzsejjCgDZZWmCMZ39PPOC7Xj6Hmd2wpWugFUtpGHqExoe4vIn3y5T3bV/jbEqtb
 o5vd/XnIYSYScrBMbkjUi1XMYf4SRSAcLUjpk23isj4k0CXrWZWrik3bkiq4cHJA
 Yqv5MT6q6WnSvg17oe9mKQpzR7gvz7Su8bRewLe9GiEPpyhuUnlMT6sU+LIoT+kK
 A8vML/ODAOqX2zmBPeM5KvJAcOeb3YKWq1ls1QRPCu0mw0//g1QP3V5tgBIQHgV0
 Vuug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561204; x=1657647604; bh=hD9eOU2afMXkN
 nq4gB8nFaVHBwjCgGKn8JzjN+9sTMc=; b=j9I2afH8r9Jf4EF5EvuH9wVWiBEWC
 U45hn7hgAUzin33aGVZB/3/Y/CIjpxqurmKgLvCZLiF7vhxbg+f1+3bx0kBm5kkw
 4CyXImCT2fEV0BuLw9p0z9KdEyrQqWtQ0tP5kdOn4QtSdmJLX1ucItSXmb9+0ins
 mMbp08vZvF8Z3elxFkvlo3X3z+FPsH6bUG9INrA0ANHJf3mwASO3VCqTkV5zT348
 R9Ywd9ERtHcOkBzcf2Sh73uLGiLdeXemGJdT68suE/eACJD7uvEqHRnkYGjahvdQ
 ZggFPuv7EkikRw9HVF8f3aAr36j4k9xu59jmh4ikW/BwpCOjSpGBHF7kw==
X-ME-Sender: <xms:dGDMYtN0TjtVW4otclPDjh2MhR-a-mIlyPPqXD61ZWc8tBB5OSOqMw>
 <xme:dGDMYv9r17GaHb77rBrztPznzEVWXNGeLp0XjRYBgs4WWbIcGi0AmZG_qfzJneQnm
 2N7hyoYd1XyWJORcKU>
X-ME-Received: <xmr:dGDMYsRtNOzJRK0NZ1ZXqSJIRQ2KaoKLgrmlcrvuGdpexIjQhtnz4jjFr_drOyHNlqrSKPezWnILnpSt6BPvljjjJ-65_kVy9KtHrVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dGDMYptAhBqIL2yXzq7CJOa0piYrtuEVOeFNDSLuJ1Y3VtMxcIHoYg>
 <xmx:dGDMYleIglFotWumtB73Uo74qV0WPEXu_hZ4U6ygzNpE2KgIoydZsA>
 <xmx:dGDMYl3TLJ5LIMR5sQ9hHE_D7ku0VBfM0tqwfmDrSz-sehFqK9Azwg>
 <xmx:dGDMYuG-TYtYtLmld3tLT9B0HfqA-AJ_P1F-wub3Q7Q1JM3gHVio-A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 12/69] drm/vc4: drv: Call component_unbind_all()
Date: Mon, 11 Jul 2022 19:38:42 +0200
Message-Id: <20220711173939.1132294-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While we were using the component framework to deal with all the DRM
subdevices, we were not calling component_unbind_all().

This leads to none of the subdevices freeing up their resources as part of
their unbind() or device managed hooks.

Fixes: c8b75bca92cb ("drm/vc4: Add KMS support for Raspberry Pi.")
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 14 ++++++++++++--
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 292d1b6a01b6..6b8dfa1e7650 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -267,6 +267,13 @@ static void vc4_match_add_drivers(struct device *dev,
 	}
 }
 
+static void vc4_component_unbind_all(void *ptr)
+{
+	struct vc4_dev *vc4 = ptr;
+
+	component_unbind_all(vc4->dev, &vc4->base);
+}
+
 static const struct of_device_id vc4_dma_range_matches[] = {
 	{ .compatible = "brcm,bcm2711-hvs" },
 	{ .compatible = "brcm,bcm2835-hvs" },
@@ -310,6 +317,7 @@ static int vc4_drm_bind(struct device *dev)
 	if (IS_ERR(vc4))
 		return PTR_ERR(vc4);
 	vc4->is_vc5 = is_vc5;
+	vc4->dev = dev;
 
 	drm = &vc4->base;
 	platform_set_drvdata(pdev, drm);
@@ -360,6 +368,10 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, vc4_component_unbind_all, vc4);
+	if (ret)
+		return ret;
+
 	ret = vc4_plane_create_additional_planes(drm);
 	if (ret)
 		goto unbind_all;
@@ -380,8 +392,6 @@ static int vc4_drm_bind(struct device *dev)
 	return 0;
 
 unbind_all:
-	component_unbind_all(dev, drm);
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 1beb96b77b8c..950056b83843 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -76,6 +76,7 @@ struct vc4_perfmon {
 
 struct vc4_dev {
 	struct drm_device base;
+	struct device *dev;
 
 	bool is_vc5;
 
-- 
2.36.1

