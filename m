Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10BE518401
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06E610F92E;
	Tue,  3 May 2022 12:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43E710F92E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:14:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5853D320096C;
 Tue,  3 May 2022 08:14:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 03 May 2022 08:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651580041; x=1651666441; bh=0v
 E9VdJ7jMeCYK1HMaNi508vZS1IFNSlkl9FdXtFwr8=; b=HYbnlRLDrtrRXTYZYH
 LF2m4k72yHCpD4Iak1iY+aGdw8tNrD6agE+MwV49OcaX780vlSWtD8XiceCUHw/4
 S+JMfB2sL/S7n4XGRtqGwHumMdE31Zm4X5jgG+4aU+no83rtAL7jd10g+VdFUYKY
 NNtTGNPagTW3A9woXGDOOHdsmIge/nesQNbieWQ0Ll7KfjGS8hfSoZ33rZ5ksY6m
 596JmqAiVxRDBVkDCv+pmS4Z61jNZGFFy1VMe+uFo5xnvY3+jTz9imxZ30mTXGmm
 +9m8SZy4TEELNdA0lvUPSCkK+V3zrwRoj8jG6k3RLE6q/viGvmTgLEXGl4DIySF5
 +SAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580041; x=1651666441; bh=0vE9VdJ7jMeCYK1HMaNi508vZS1IFNSlkl9
 FdXtFwr8=; b=GZ5h6CO+ZZfpCCISfS04ckIaQVyaTcjrLrroYtnGvSCrlXGjrTG
 dcpMvanW1gkTCE+nDC11qSyaFI6l0Z/I6BYHI24KI70OWpJogenI22u/yu9LNEla
 bAsDxBdY+bXQtYOBQlXGmz3GZPx0brTq3Po5G5d4c/+Hi24s39rjWa5HIX7cndfi
 CkniStUIj3e89hBpz3UsWrCNN/o5EeWX6mNeZ0QYpaO4kDxX/roiHPND1f0skQgj
 mqofwlz0mvQzWMo1CUOELsiw6xG14UZrF3azWjYEMlk2MiUX49FTjZ0sX3ScRRbu
 xr9glHkj7z+SYmmfsQAtiv2mOUam01YtJng==
X-ME-Sender: <xms:iRxxYrfQtWI_NXWEWJ0B6Gtn7r0hjt3qSf9yjddEGixtjEC5EPiDog>
 <xme:iRxxYhNkmMOJtj1JihH3lXotl1XCcllBtankOv5ea4mHktbwXJHp9ojQcYqZpL6ko
 ujivaoQ2uMPYQw4qug>
X-ME-Received: <xmr:iRxxYkgGsOTT4viKRSLFwiCl--m_H6BECSMXVwA-rvp8Fv3Je0d0v3rKnxKtq6Km8U-Yeq-Hmg5ramhfIGJOIi8Uk0ehnzEqdAL9s-Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
 jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iRxxYs_I2gM_Bq5Z-rawScYONaDn50gyTegHTUoUcKibw6A0Inmt9g>
 <xmx:iRxxYns-qRGkgP_lRoKjc7M2fdxr_XTsMEOXqQalpc8O0qprzkAPwA>
 <xmx:iRxxYrG4fFf_27mhfuUANVf6OjyxLjSb1gGy5C1JIBUSihawSe5lfw>
 <xmx:iRxxYtUQ6K7LBQGiEy7iAE5Go8aSC6BVQ5tJdO8nQFV4Bqds9w4J4Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:14:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 04/14] drm/vc4: bo: Split out Dumb buffers fixup
Date: Tue,  3 May 2022 14:13:31 +0200
Message-Id: <20220503121341.983842-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503121341.983842-1-maxime@cerno.tech>
References: <20220503121341.983842-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_bo_dumb_create() both fixes up the allocation arguments to match
the hardware constraints and actually performs the allocation.

Since we're going to introduce a new function that uses a different
allocator, let's split the arguments fixup to a separate function we
will be able to reuse.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_bo.c  |  9 +++------
 drivers/gpu/drm/vc4/vc4_drv.c | 13 +++++++++++++
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 6d505da6b6cf..3ca16d682fc0 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -475,15 +475,12 @@ int vc4_bo_dumb_create(struct drm_file *file_priv,
 		       struct drm_device *dev,
 		       struct drm_mode_create_dumb *args)
 {
-	int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
 	struct vc4_bo *bo = NULL;
 	int ret;
 
-	if (args->pitch < min_pitch)
-		args->pitch = min_pitch;
-
-	if (args->size < args->pitch * args->height)
-		args->size = args->pitch * args->height;
+	ret = vc4_dumb_fixup_args(args);
+	if (ret)
+		return ret;
 
 	bo = vc4_bo_create(dev, args->size, false, VC4_BO_TYPE_DUMB);
 	if (IS_ERR(bo))
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 5f39e40ef238..eb08940028d3 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -63,6 +63,19 @@ void __iomem *vc4_ioremap_regs(struct platform_device *pdev, int index)
 	return map;
 }
 
+int vc4_dumb_fixup_args(struct drm_mode_create_dumb *args)
+{
+	int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+
+	if (args->pitch < min_pitch)
+		args->pitch = min_pitch;
+
+	if (args->size < args->pitch * args->height)
+		args->size = args->pitch * args->height;
+
+	return 0;
+}
+
 static int vc4_get_param_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file_priv)
 {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 37c93654480f..9c324c12c410 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -885,6 +885,7 @@ static inline void vc4_debugfs_add_regset32(struct drm_device *drm,
 
 /* vc4_drv.c */
 void __iomem *vc4_ioremap_regs(struct platform_device *dev, int index);
+int vc4_dumb_fixup_args(struct drm_mode_create_dumb *args);
 
 /* vc4_dpi.c */
 extern struct platform_driver vc4_dpi_driver;
-- 
2.35.1

