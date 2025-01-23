Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF1A1AB8B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 21:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B5110E89E;
	Thu, 23 Jan 2025 20:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ao988BuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9097310E1A5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 20:44:39 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-71e2a32297dso745559a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 12:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1737665078; x=1738269878;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BQWOLgJ/0nTPCCiovV+D4UWc2aPAwnqqUEebNAyNJ50=;
 b=ao988BuVC30eqZ2MftSUuM7H9bkceywWpXfMFNSGwoUfK320YC+st7vQYuH/YU087A
 fgmx1KRhs/LLjiS2WcuTu08OPI6IZtStRLbdL4koNZQHuC4wwJuNEXeA63fvY+CfxVjj
 /eRYXzY0WjkbciEmgz7GCsnSu7mMMr3Sj0G3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737665078; x=1738269878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BQWOLgJ/0nTPCCiovV+D4UWc2aPAwnqqUEebNAyNJ50=;
 b=sEdVS5X3lVB3YkJHXV9y0Mt0jqHNVxMF+Z2E7/PWQxg98wPRtMrxxedIRcbulw6GrQ
 ouP8lbe/kwHm62MLOApaPSZ/ZkIRjIm8YFmdaxbW8sbI87MQ2bkVa4HO1CNojgl6J21E
 K1z+3LcqjFSR4v4bQVar1CJWB74nmFDdU6RlBX9txRc7p8StRcsrdvGeGnQWLHsnzUel
 tONYDUJjZPOPUcxQl+f4UK28rtabaQ10ffJlCZw9QJFZAFbAWhUaPTfRbUG9XOozIjF9
 FhJU1nP+x8oNKr+hUyPplPQqpd78Aw6VflhnrYpfCJdy2WwiIuQ3eDSm8l/7odT/deeV
 njbg==
X-Gm-Message-State: AOJu0Yz5zEn7gE2ORkO1vuergKO0zVVtin1WtaMgFdQE3Vu4Ef6l648S
 wlgHTQxO8SqHKxU7F6mZbkR9JUK8nzuWrPCIzC2az6KI09rG+mokjdDluQD2rLu8crewCi0p3ig
 jXBe8qde6g1Z/KBvx/zp9ALStIOeS2eVzQtfO0GYPCwrCCd78xrRyPpIAknRi5F5RllsvsA43uK
 Y447kYHHwGpKbdCXFlxJjSfhxp3nu4rbyuDqYkn3jm1T42opDbMA==
X-Gm-Gg: ASbGncsWWFbQH4y5Vt6rOWGgysCCsJMkeinhFQ5erz06QT5DvyDITFSztPuEvXSXaCw
 Yr3nIbnObLwUeXDhk4DlTx7rKG1s+n0GMUnsV1LuP/BfhyQH44IAtqio69biDj5GY/ty2qyTfiL
 NN/IyCs20XDZDcL3MGM9rkAmXPbyfkxWax4z4OuvM9Y2pDBkjazlI1vHD2WbYTUrBKCB0msxXFy
 85/gnXn9DHpAOYgWFfT5898GgOrOcKO5ANBJCQ68y61NK5NOzTfwJhaQmBxAhWoXTWi0J5mYXhY
 SNgoEmo6iqyvcRM4x5s/fEqbx83n7cEF8VRzbCH/QpyBcuRd6724re3/
X-Google-Smtp-Source: AGHT+IG/VcCAnkgKykIkmCVhHwvvIL5UYDL9VQZkXU03B3gHqOUMTbd4o5PsthugvSZIFJNLQHBrQg==
X-Received: by 2002:a05:6830:4388:b0:71e:15f7:1a3a with SMTP id
 46e09a7af769-724e0d34ac7mr3619611a34.2.1737665077821; 
 Thu, 23 Jan 2025 12:44:37 -0800 (PST)
Received: from mtt-opossum.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-724ecda47bbsm111965a34.2.2025.01.23.12.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 12:44:37 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: [PATCH v2] drm/vmwgfx: Fix dumb buffer leak
Date: Thu, 23 Jan 2025 14:44:24 -0600
Message-Id: <20250123204424.836896-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dumb buffers were not being freed because the GEM reference that was
acquired in gb_surface_define was not dropped like it is in the 2D case.
Dropping this ref uncovered a few additional issues with freeing the
resources associated with dirty tracking in vmw_bo_free/release.

Additionally the TTM object associated with the surface were also leaking
which meant that when the ttm_object_file was closed at process exit the
destructor unreferenced an already destroyed surface.

The solution is to remove the destructor from the vmw_user_surface
associated with the dumb_buffer and immediately unreferencing the TTM
object which his removes it from the ttm_object_file.

This also allows the early return in vmw_user_surface_base_release for the
dumb buffer case to be removed as it should no longer occur.

The chain of references now has the GEM handle(s) owning the dumb buffer.
The GEM handles have a singular GEM reference to the vmw_bo which is
dropped when all handles are closed. When the GEM reference count hits
zero the vmw_bo is freed which then unreferences the surface via
vmw_resource_release in vmw_bo_release.

Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---

v2:
 - Update commit description
 - Clean up leaked dirty tracking resources
 - Fix handling of leaked TTM objects

 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c       |  6 ++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c  | 18 ++++++++++++------
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 9b5b8c1f063b..87d8b2ba0e8c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -51,11 +51,13 @@ static void vmw_bo_release(struct vmw_bo *vbo)
 			mutex_lock(&res->dev_priv->cmdbuf_mutex);
 			(void)vmw_resource_reserve(res, false, true);
 			vmw_resource_mob_detach(res);
+			if (res->dirty)
+				res->func->dirty_free(res);
 			if (res->coherent)
 				vmw_bo_dirty_release(res->guest_memory_bo);
 			res->guest_memory_bo = NULL;
 			res->guest_memory_offset = 0;
-			vmw_resource_unreserve(res, false, false, false, NULL,
+			vmw_resource_unreserve(res, true, false, false, NULL,
 					       0);
 			mutex_unlock(&res->dev_priv->cmdbuf_mutex);
 		}
@@ -73,9 +75,9 @@ static void vmw_bo_free(struct ttm_buffer_object *bo)
 {
 	struct vmw_bo *vbo = to_vmw_bo(&bo->base);
 
-	WARN_ON(vbo->dirty);
 	WARN_ON(!RB_EMPTY_ROOT(&vbo->res_tree));
 	vmw_bo_release(vbo);
+	WARN_ON(vbo->dirty);
 	kfree(vbo);
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index a73af8a355fb..c4d5fe5f330f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -273,7 +273,7 @@ int vmw_user_resource_lookup_handle(struct vmw_private *dev_priv,
 		goto out_bad_resource;
 
 	res = converter->base_obj_to_res(base);
-	kref_get(&res->kref);
+	vmw_resource_reference(res);
 
 	*p_res = res;
 	ret = 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 5721c74da3e0..5e022ed466ae 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -658,7 +658,7 @@ static void vmw_user_surface_free(struct vmw_resource *res)
 	struct vmw_user_surface *user_srf =
 	    container_of(srf, struct vmw_user_surface, srf);
 
-	WARN_ON_ONCE(res->dirty);
+	WARN_ON(res->dirty);
 	if (user_srf->master)
 		drm_master_put(&user_srf->master);
 	kfree(srf->offsets);
@@ -689,8 +689,7 @@ static void vmw_user_surface_base_release(struct ttm_base_object **p_base)
 	 * Dumb buffers own the resource and they'll unref the
 	 * resource themselves
 	 */
-	if (res && res->guest_memory_bo && res->guest_memory_bo->is_dumb)
-		return;
+	WARN_ON(res && res->guest_memory_bo && res->guest_memory_bo->is_dumb);
 
 	vmw_resource_unreference(&res);
 }
@@ -2358,12 +2357,19 @@ int vmw_dumb_create(struct drm_file *file_priv,
 	vbo = res->guest_memory_bo;
 	vbo->is_dumb = true;
 	vbo->dumb_surface = vmw_res_to_srf(res);
-
+	drm_gem_object_put(&vbo->tbo.base);
+	/*
+	 * Unset the user surface dtor since this in not actually exposed
+	 * to userspace. The suface is owned via the dumb_buffer's GEM handle
+	 */
+	struct vmw_user_surface *usurf = container_of(vbo->dumb_surface,
+						struct vmw_user_surface, srf);
+	usurf->prime.base.refcount_release = NULL;
 err:
 	if (res)
 		vmw_resource_unreference(&res);
-	if (ret)
-		ttm_ref_object_base_unref(tfile, arg.rep.handle);
+
+	ttm_ref_object_base_unref(tfile, arg.rep.handle);
 
 	return ret;
 }
-- 
2.43.0

