Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441757BE744
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8E110E15C;
	Mon,  9 Oct 2023 17:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CE310E15C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 17:01:42 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 68A375C0198;
 Mon,  9 Oct 2023 13:01:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 09 Oct 2023 13:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1696870900; x=
 1696957300; bh=XoAdNK7MOwe9S8VFTUVUCx1LnB/CJcds+cnHVu5qmS8=; b=G
 mHGBQijc79KX0DhmI+60zB1K1+7Hn2AcT6QLkmMMHI8puou3fVbPGO9UCndwkpeR
 dLFiexiZ1IQkaYihquoNeZ3k9ZvgYnyKqsQtK7iGYlPDfy0qEy8svmrMuDP/VywK
 qADMFCFQbnfNSMBYhRZxCxvfbKyOc7R8Y2+GtkQf4Zojbr04CQkHhnfrN8RWzGMc
 y8+BaelIN1xXpinLgGz1uwfSoTZbc9DNIkGBnvTJmsjsSdz8nukTh3aUPtfPgGdS
 483Q2m8iHbqiOoNexb/R4EuwxswikQpCugRfxKQyF8QoqSRkXVXGWe5ymvGSiMFg
 R33RgPcNDjpFmGWwKYx2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:reply-to
 :sender:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1696870900; x=1696957300; bh=X
 oAdNK7MOwe9S8VFTUVUCx1LnB/CJcds+cnHVu5qmS8=; b=kKf/rY3kPppsBENc2
 /hce72mOQuY1HzfsDpEZle4wlimnIdvAw0LIjuJdXp85taaLHpnNFaOvcZY5ei65
 l92bvqFkGnTPRCgL6wWUYzlG7NovYA87lgJl3H17kJw1Z03lXncXC4K0ZxVL5zPp
 KDQQQtsadGhK8VNurwOBSUWUkOfdPpPhJaqpgT7hDb4i69Qzhjj40n0VT3y3d4Io
 BfxZgNjdv9TBQXK0gh46TVDcxyTpkFUDyr3L1YQPj2RIL/7ZGL2SEpLPT4OcMpgz
 iomFw4u9/hGG/SI/ZvWj6ogMjhoB2EtlI8swYqfwSDyAn52KJJVp02ng9IvJNIlf
 bRsrw==
X-ME-Sender: <xms:9DEkZQGQIkGR_SZx-mhDYBlzeEnQ0me7cHaugVorFF-vI2hc13ckNQ>
 <xme:9DEkZZVS-q9tg2wJJEtS5LQpZ-mXjcy5hssoS72LUgkPIwyv7qupcbn_gI5WlRpvc
 4FhTU4VcJntyukeR1M>
X-ME-Received: <xmr:9DEkZaJfgyJE53UeTccjp65ZrJezQtCg7r-su32HCC8AiDkjQxPcwHlS8-wysXPKcyecyw0f9sE2njYX78n7W7RloNEbt5BDE0yCXCT9sZtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheefgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofhrgggtgfesthekredtredtjeenucfhrhhomhepfdforggr
 iicuofhomhgsrghsrgifrghlrgculdggofifrghrvgdmfdcuoehmrggriihmsehfrghsth
 hmrghilhdrtghomheqnecuggftrfgrthhtvghrnhephfevvdfhudelveelveetlefgffdt
 tefhvdfhffeltdeugeegteegleegffefgfeunecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrrgiimhesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:9DEkZSGwFqTBQPvQIg92-Bp7l2GDSEfFv4pewrvFWhZXnP1yVtG03Q>
 <xmx:9DEkZWVolngHeVadbCzkI-hERJ-N3FJCMeqgrDfTefof53zJP3iJiw>
 <xmx:9DEkZVPN180E1r8l47cWlraC8GHFkRQA4pqaa6e4L7VrAUjoK6dq5g>
 <xmx:9DEkZUxdS4xoJz7T02_thCW-cSg1kwvbP4iAwSKldDZstcgcjH4VTg>
Feedback-ID: i1b1946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Oct 2023 13:01:39 -0400 (EDT)
From: "Maaz Mombasawala (VMware)" <maazm@fastmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/vmwgfx: Make all surfaces shareable
Date: Mon,  9 Oct 2023 09:59:57 -0700
Message-Id: <20231009165958.2507668-1-maazm@fastmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reply-To: Maaz Mombasawala <mombasawalam@vmware.com>
Cc: Maaz Mombasawala <maazm@fastmail.com>, krastevm@vmware.com,
 iforbes@vmware.com, Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maaz Mombasawala <mombasawalam@vmware.com>

There is no real need to have a separate pool for shareable and
non-shareable surfaces. Make all surfaces shareable, regardless of whether
the drm_vmw_surface_flag_shareable has been specified.

Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Signed-off-by: Maaz Mombasawala (VMware) <maazm@fastmail.com>
---
 drivers/gpu/drm/vmwgfx/ttm_object.c     |  6 +++---
 drivers/gpu/drm/vmwgfx/ttm_object.h     |  3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 17 ++++++-----------
 include/uapi/drm/vmwgfx_drm.h           |  5 +++--
 4 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index ddf8373c1d77..6806c05e57f6 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /**************************************************************************
  *
- * Copyright (c) 2009-2022 VMware, Inc., Palo Alto, CA., USA
+ * Copyright (c) 2009-2023 VMware, Inc., Palo Alto, CA., USA
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -648,7 +648,6 @@ int ttm_prime_handle_to_fd(struct ttm_object_file *tfile,
  * @tfile: struct ttm_object_file identifying the caller
  * @size: The size of the dma_bufs we export.
  * @prime: The object to be initialized.
- * @shareable: See ttm_base_object_init
  * @type: See ttm_base_object_init
  * @refcount_release: See ttm_base_object_init
  *
@@ -656,10 +655,11 @@ int ttm_prime_handle_to_fd(struct ttm_object_file *tfile,
  * for data sharing between processes and devices.
  */
 int ttm_prime_object_init(struct ttm_object_file *tfile, size_t size,
-			  struct ttm_prime_object *prime, bool shareable,
+			  struct ttm_prime_object *prime,
 			  enum ttm_object_type type,
 			  void (*refcount_release) (struct ttm_base_object **))
 {
+	bool shareable = !!(type == VMW_RES_SURFACE);
 	mutex_init(&prime->mutex);
 	prime->size = PAGE_ALIGN(size);
 	prime->real_type = type;
diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.h b/drivers/gpu/drm/vmwgfx/ttm_object.h
index e6b77ee33e55..573e038c0fab 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.h
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.h
@@ -1,6 +1,6 @@
 /**************************************************************************
  *
- * Copyright (c) 2006-2022 VMware, Inc., Palo Alto, CA., USA
+ * Copyright (c) 2006-2023 VMware, Inc., Palo Alto, CA., USA
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -288,7 +288,6 @@ extern void ttm_object_device_release(struct ttm_object_device **p_tdev);
 extern int ttm_prime_object_init(struct ttm_object_file *tfile,
 				 size_t size,
 				 struct ttm_prime_object *prime,
-				 bool shareable,
 				 enum ttm_object_type type,
 				 void (*refcount_release)
 				 (struct ttm_base_object **));
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 5db403ee8261..3156bdd095e9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -836,8 +836,6 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 		srf->snooper.image = NULL;
 	}
 
-	user_srf->prime.base.shareable = false;
-	user_srf->prime.base.tfile = NULL;
 	if (drm_is_primary_client(file_priv))
 		user_srf->master = drm_file_get_master(file_priv);
 
@@ -851,10 +849,10 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 		goto out_unlock;
 
 	/*
-	 * A gb-aware client referencing a shared surface will
-	 * expect a backup buffer to be present.
+	 * A gb-aware client referencing a surface will expect a backup
+	 * buffer to be present.
 	 */
-	if (dev_priv->has_mob && req->shareable) {
+	if (dev_priv->has_mob) {
 		uint32_t backup_handle;
 
 		ret = vmw_gem_object_create_with_handle(dev_priv,
@@ -875,8 +873,9 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	}
 
 	tmp = vmw_resource_reference(&srf->res);
-	ret = ttm_prime_object_init(tfile, res->guest_memory_size, &user_srf->prime,
-				    req->shareable, VMW_RES_SURFACE,
+	ret = ttm_prime_object_init(tfile, res->guest_memory_size,
+				    &user_srf->prime,
+				    VMW_RES_SURFACE,
 				    &vmw_user_surface_base_release);
 
 	if (unlikely(ret != 0)) {
@@ -1557,8 +1556,6 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 
 	tmp = vmw_resource_reference(res);
 	ret = ttm_prime_object_init(tfile, res->guest_memory_size, &user_srf->prime,
-				    req->base.drm_surface_flags &
-				    drm_vmw_surface_flag_shareable,
 				    VMW_RES_SURFACE,
 				    &vmw_user_surface_base_release);
 
@@ -2060,8 +2057,6 @@ int vmw_gb_surface_define(struct vmw_private *dev_priv,
 	}
 
 	*srf_out  = &user_srf->srf;
-	user_srf->prime.base.shareable = false;
-	user_srf->prime.base.tfile = NULL;
 
 	srf = &user_srf->srf;
 	srf->metadata = *req;
diff --git a/include/uapi/drm/vmwgfx_drm.h b/include/uapi/drm/vmwgfx_drm.h
index 26549c86a91f..26d96fecb902 100644
--- a/include/uapi/drm/vmwgfx_drm.h
+++ b/include/uapi/drm/vmwgfx_drm.h
@@ -1,6 +1,6 @@
 /**************************************************************************
  *
- * Copyright © 2009-2022 VMware, Inc., Palo Alto, CA., USA
+ * Copyright © 2009-2023 VMware, Inc., Palo Alto, CA., USA
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -902,7 +902,8 @@ struct drm_vmw_shader_arg {
 /**
  * enum drm_vmw_surface_flags
  *
- * @drm_vmw_surface_flag_shareable:     Whether the surface is shareable
+ * @drm_vmw_surface_flag_shareable:     Deprecated - all userspace surfaces are
+ *                                      shareable.
  * @drm_vmw_surface_flag_scanout:       Whether the surface is a scanout
  *                                      surface.
  * @drm_vmw_surface_flag_create_buffer: Create a backup buffer if none is
-- 
2.34.1

