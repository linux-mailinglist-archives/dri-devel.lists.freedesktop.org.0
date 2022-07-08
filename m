Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFB756B61A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB39113826;
	Fri,  8 Jul 2022 09:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FB5113824
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:48 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B762E3200980;
 Fri,  8 Jul 2022 05:57:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 05:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274266; x=1657360666; bh=hD
 9eOU2afMXkNnq4gB8nFaVHBwjCgGKn8JzjN+9sTMc=; b=w0E7hToOpiZ+WGAd8c
 zbBBR3D+MSKMYvnf36CqVFcfbUM1ONGzNK7WHVV6WsZqTB0Kkvpj1kVH0/Znzhnr
 TGwfdZ7Y+aaArrTRqJVlNpE2QpUJ5ZQDh6e1snheGp5cJMX6nixqmIQ4iNb65HwH
 0Mz1imEE8eT0m9eKkk1Pjf7tXoT4/7hu6bds2Ps7lyjf7QfVEhxmfxkfiaYsR2fy
 MJDBRn2J4ErrQkvyoaTaAz9cb3Wdo0w6Rr757X9vxXer6yiKcalPBJBgk+Lsmn2z
 J85DzxRykcCSkGSFSxc/Bf0D4k77sijOsPySV00Eb4xMlaJR+1frbUky8iXaM+Yl
 wZng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274266; x=1657360666; bh=hD9eOU2afMXkN
 nq4gB8nFaVHBwjCgGKn8JzjN+9sTMc=; b=OkBqnHOd+W0MHB9WM4kpiasOzRIf8
 caM6sOBq17jSjOEMA8KN0J97AyVcVQWUNkwo4Pux/qPI2nCtAp8KNLDXINk/YGiH
 xAYOynQTxFg79aKdw4Dy2YOsPJm2LJeG3VG2UNv3C6mhOmmFmwQbQZ2iVFrN7I4+
 I0DWwb9Tp3VcGj7UHYPUCB4qG8DAwL2nWRXz3/Kn7VTQqZWqzTqgpK8iGyHgzViL
 7oicyExEgbTD4qfP74Jbfc3YSSX7IvQqMvEnlTGyvrWNzMWVauP9W4NXgXOE4zZp
 O7IVJB3N9Qocp3VUvej72d6+eEoAiLXwa98qHYtptGn8h0j7LrhStEagA==
X-ME-Sender: <xms:mv_HYnFGHV7WIXVx17pgAgLKMPlB1f3tNPMtTdAXkI6YXypXS2Xjfg>
 <xme:mv_HYkWg4pXToP7VJAy_fh5wX2Y5j-lUHIJx8ZWednJiCC2m0YrcuPAIWuHHvj8F0
 Ojay4CN-8LJT5dtsDg>
X-ME-Received: <xmr:mv_HYpKTePrxHr9dKrn0jn2vXuar7_4EoGRPjgFsBMBFBV5QYdQLWayajjcPdkbV5o1JrRCAg2WG1UThPqfRudavL_IKHWGPtujKc44>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mv_HYlFtZ-W4hHrmAYCkED194E5ZixXEF8SxNhVlvrcSREuevJzweg>
 <xmx:mv_HYtUVMNqj6eEg64rAq6dXXzTCSXQqPB2qu8UW2TfL7zxjnoVsKg>
 <xmx:mv_HYgNGWXHqO8Ehm8msNv7fH_PB7_hxz7jYb_u36VwXjjT06rOYcA>
 <xmx:mv_HYrct7Ywr7eCgLRsGlsfiZtWL2mLj069fH49CvC4FFbXAfKOmVQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 12/69] drm/vc4: drv: Call component_unbind_all()
Date: Fri,  8 Jul 2022 11:56:10 +0200
Message-Id: <20220708095707.257937-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

