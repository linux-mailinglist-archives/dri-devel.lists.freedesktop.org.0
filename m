Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D8F518400
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C2A10F920;
	Tue,  3 May 2022 12:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE6D10F92D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:14:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E46F4320098D;
 Tue,  3 May 2022 08:13:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 03 May 2022 08:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651580038; x=1651666438; bh=qi
 EQEyTdZ+wW1t2VFZ3/9DxNxFg0iVUtoKUY0VDi2sI=; b=lZqGzGqGeHEioQ5Sea
 XTsDDLYofEnBKkDmz+59vIpTXtTp1i9vfR6e4HEOVtqKjQA1iNcjDN5xvHEZJ+jm
 pFQoFkZHrQNgYl5XUT1LD0vQl8DLka3IG99dHvHxVRoOsSmKTXwyp+NPiCJLFKy6
 NJ8XVEdyGb0sg3uiq92JFxYl1/P7KoHVORd2oDgk36ZcqqxKpz6MCZdqgAG2XYp3
 K9SMTzWvia5lOx5SEjygthL1xby8qSIxH62OioNLu3PTjFUSasLyfE1e5HhuXCW5
 x//JcOP9R7KT7J/JwyTrOb0279k5QzapZcAz8t0OI54DInx5CV2BRrBIjWHCxiec
 5agw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580038; x=1651666438; bh=qiEQEyTdZ+wW1t2VFZ3/9DxNxFg0iVUtoKU
 Y0VDi2sI=; b=fhuqE7sBhCftRC66khdw7LMPKW/jOSXD5cNF/DejVzVcpyr5ZKe
 GDuL92SVRLsQ6+Brkwe5ZGmq1N7KVuYnb033+w8Nx9jNg1via0YkZ4dJdFISRE0i
 4DZU5lmWIcpXBZC9jWh4cqXHTgp+b/D/yqqRgYRwlpxXwIi2e5cZglFD/lcyjQpd
 ejWiRlgi8zzo4U295lyD6ZiMuzmH3cnGT+LblHFN3oTqMVi04UBI7+XEsl4Cyddb
 oyaatc8KDX6LeCUvVuue+VJrxneHVhtSZyC3mE4abCvTMOCv9c+y+j86egSROZn9
 Lu0jxRS9HyUnXz0LhYbBy9lXRAUrqTGPkTg==
X-ME-Sender: <xms:hhxxYse6kHv4pTEfZ0Ap2DkklGXbSo6qNhZJL3ydeL6XLVXlH_RWpQ>
 <xme:hhxxYuNs2K3zTe-Yd4n9M4e3ugOIdFJQjYEoIhwNFb9YOSTyL34f5JkFiuFYaOjqL
 pfOlFbWhcz24sEcCEU>
X-ME-Received: <xmr:hhxxYtimnqnpkDruXLokURDcnvXKWhcTZPa8PrqzeX7rPcKlwFQ6jleQYI-JbFN07xbM_hVZrNL0iYrzWs2QgYcYX2E5zltdjXcv6MM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
 jefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hhxxYh-GdiZ37nrtRD9j9T6mb1QSa6zW282-JBwZNincSnNUDHXpkA>
 <xmx:hhxxYou5zp_dWUPDZihNutVHhTdbka6b0wwhadw7eneyF8trRHIFXA>
 <xmx:hhxxYoF-wtx5D53_rul25yQ0oOu4aJHWp1Mr7YsM5sbYaqx0mZ0_Vw>
 <xmx:hhxxYiVNCMKNU11cZRKZ5t5UjKmNYVezS4XnnWAJsg1mJpgLfciPlA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:13:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 03/14] drm/vc4: bo: Rename vc4_dumb_create
Date: Tue,  3 May 2022 14:13:30 +0200
Message-Id: <20220503121341.983842-4-maxime@cerno.tech>
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

We're going to add a new variant of the dumb BO allocation function, so
let's rename vc4_dumb_create() to something a bit more specific.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_bo.c  | 6 +++---
 drivers/gpu/drm/vc4/vc4_drv.c | 2 +-
 drivers/gpu/drm/vc4/vc4_drv.h | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 49c0f2ac868b..6d505da6b6cf 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -471,9 +471,9 @@ struct vc4_bo *vc4_bo_create(struct drm_device *dev, size_t unaligned_size,
 	return bo;
 }
 
-int vc4_dumb_create(struct drm_file *file_priv,
-		    struct drm_device *dev,
-		    struct drm_mode_create_dumb *args)
+int vc4_bo_dumb_create(struct drm_file *file_priv,
+		       struct drm_device *dev,
+		       struct drm_mode_create_dumb *args)
 {
 	int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
 	struct vc4_bo *bo = NULL;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 53067525b586..5f39e40ef238 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -175,7 +175,7 @@ static struct drm_driver vc4_drm_driver = {
 
 	.gem_create_object = vc4_create_object,
 
-	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(vc4_dumb_create),
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(vc4_bo_dumb_create),
 
 	.ioctls = vc4_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(vc4_drm_ioctls),
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 82453a3bcffe..37c93654480f 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -814,9 +814,9 @@ struct vc4_validated_shader_info {
 struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size);
 struct vc4_bo *vc4_bo_create(struct drm_device *dev, size_t size,
 			     bool from_cache, enum vc4_kernel_bo_type type);
-int vc4_dumb_create(struct drm_file *file_priv,
-		    struct drm_device *dev,
-		    struct drm_mode_create_dumb *args);
+int vc4_bo_dumb_create(struct drm_file *file_priv,
+		       struct drm_device *dev,
+		       struct drm_mode_create_dumb *args);
 int vc4_create_bo_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv);
 int vc4_create_shader_bo_ioctl(struct drm_device *dev, void *data,
-- 
2.35.1

