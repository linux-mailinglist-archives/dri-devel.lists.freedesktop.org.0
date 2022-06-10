Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BB7546607
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7506210EC56;
	Fri, 10 Jun 2022 11:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F15710EB52
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:51:59 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 083675C011C;
 Fri, 10 Jun 2022 07:51:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 07:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654861919; x=1654948319; bh=BA
 k6PWPuIXNwit1rneToMK68ZWGtS+6/0KKb0Kfi5fs=; b=AwTXgFTMGVG+P9WLeb
 y3G2WZCYqhymeMw0JmV6R/yjnCF8BRWQpewf7WJDwDZrkggpBRgjetZc0G1jGlP+
 DBdHdlfQn2mr9jZm0OpxeInVGuZP4cGu9QmSgYkjiAGWbwbIq/Xty4a8HjiHZjgN
 6rbqaSFz40Lfwuj/9Qb2FicSc/QlV6jlyfPZpG/c5fbsomESGU9ejMpJDbElxc1/
 stlqO5aue3NVhVHN4hwAgeVafBy+ZtJRC0jpvz1WtJgtmWufERMaw+P3iQz8YnTo
 icNmYKS9znkIMY65yA5FHuZH78HvUWcheA60jOhQ9b/DIXirV/nySTJvlkyrnbIe
 FvvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654861919; x=1654948319; bh=BAk6PWPuIXNwi
 t1rneToMK68ZWGtS+6/0KKb0Kfi5fs=; b=x5wEPKyBBs41WeyfUkBlxpvTleuni
 Ljr4zSMlyq7E0U/yN6+7bZE2VV/+0mSAaJBNzhYfRT034hnCrZVaCHzMppM+ifGC
 hfgq+Iqw7iz/48q/22wmWInB5UyCgPFqo7yU7f9aQiSwKS+lrcUmUwp2q6PwnBJl
 fMgZvlWaSBaHVL9kasHV2r9ruTudd22K/wO4TYrWgnUqtDpe+r1eZ/98tt9SJtJq
 kpkCaEVjfY2+l4dEjnEceOrmsrNE0xOsfzRrq/S2XXm2mcd2haYN9w+Hc+p9DVjS
 NYKcjw0YO9qYr6HcdUDkFavbN0ItUFZzOLe9LOS6a8+Two8yWI2dMEv0g==
X-ME-Sender: <xms:XjCjYgIXN6v2yKlhIaNbPeX-ZuCMbnsA5gqFG2VxQkxoCZFKfkN3pw>
 <xme:XjCjYgK07p7PoCWPBIxzMC7XEj9UtRCZm9Nz7x_txnGyyjVrJuiej8PQQd-jMY22-
 DNyojGi_lbB1AAWxQY>
X-ME-Received: <xmr:XjCjYgvJlMbh9S7E5rEpjiOs7GLtLbtXUFOQ06FZ61E8VH8rly2EuH2XmCy2wVaGmSS2KOqz1LMdMjfZM6aaarlvdTuTQ7y-N5fsquk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XjCjYtbnAF8sueYjJDSp0430TqnPwYE8dHAbDOEgaILYFb0U2Ecb3g>
 <xmx:XjCjYna-OM3a4DxG6ZqwLoGinyIKsS2b04InO8kudxEa_f4MHzHuXg>
 <xmx:XjCjYpC49cWfLBI-k7eWWtF3A22ePdY2rA4wkrZvAqkoxmscmHr29Q>
 <xmx:XzCjYiyx8Ws45bmq3zZITCdLLnI2NWJaSwqNiRC7frx2eCRlv2sTKw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 07:51:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 03/14] drm/vc4: bo: Rename vc4_dumb_create
Date: Fri, 10 Jun 2022 13:51:38 +0200
Message-Id: <20220610115149.964394-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610115149.964394-1-maxime@cerno.tech>
References: <20220610115149.964394-1-maxime@cerno.tech>
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

Reviewed-by: Melissa Wen <mwen@igalia.com>
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
2.36.1

