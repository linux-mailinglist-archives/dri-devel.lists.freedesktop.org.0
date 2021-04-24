Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0D136A01D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 10:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CF16E1AA;
	Sat, 24 Apr 2021 08:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463676E1AA
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 08:24:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r7so38615598wrm.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 01:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hV0xUGIeRB38d2CN9b9a0qqhz2I6cglrWTlPqgF1qkI=;
 b=L0qEWOqwimpJCzDUFm2Z3DCbp+k6XCx/ZJCNKyIM0Tf+iIY6HOaA71ze3Rzla/G7bS
 PR5yAWJvmxVZpMlMD7RyoI43xuyev1Gs7LGpsDRv+ewERcLzEhvkaaoTtzKJX1DzgNWX
 kKRpchS4pM9YHo7YoFy6kXQqh3Q8e5Rgbe8uIlwjNyI86au/fXeyXJsNRxS0VqfAwXqS
 HyhRna7Xh7rHgKTp4gxqwFn3r79aQvkAa04vuN2qnL/yS+Amj1dchmnrQ3AVjAtzriSk
 QU2Di5Trv8RgNI/PDJwXCEBlA2grtc/box7pI31t31dFSKVwA1bxPgklTZT2k52oDRup
 j3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hV0xUGIeRB38d2CN9b9a0qqhz2I6cglrWTlPqgF1qkI=;
 b=CrKimoJQ8kBbq3oaIKyY3DCU4t4McIxO6Y2itGT4X37kkESauPz+syAa7bYMsnhwsl
 E8V6dotWHV+lQztQIHwfoUULaJa5R/FbIaaMVl3rnmLPbiw8Q0dRvPj+Coir/vTHUt0G
 D2d8jYmdKKMYJ4HLPyhua7uMnkaearSC8/PtgdH0tnu/ToGoNd0KiYDJrVf7J/ouwtcw
 3WeE8G2viKN2Mqp2p+B5/h/B+rEC7zZ1ejwMm4VYyGDVbU4K7ws8PgvwL6v1oPE6qeT7
 DCcmd/N85P5vMIzB5dthvc58pZAFEUdUuMGSXOgqMPKs3J8gJ0oiSOP/PAy65yAwBJQO
 rnRA==
X-Gm-Message-State: AOAM533D6xn3kMxaY8gkq/+OvHu8CKCHewyhze0QwN2yH0LuPkytCwTL
 QD4E8KEqw/SEdqxjwHmLelEL+ZeKgNyHWrAO
X-Google-Smtp-Source: ABdhPJwCon8hUuBhK+yLEBYY5Uo+6gpkFQEmI3WsDJBR7411nOaYP+26lm8qpR9YhfOVA+e1Bt4GFA==
X-Received: by 2002:adf:fe91:: with SMTP id l17mr433762wrr.149.1619252691116; 
 Sat, 24 Apr 2021 01:24:51 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id g19sm683743wme.48.2021.04.24.01.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 01:24:50 -0700 (PDT)
Date: Sat, 24 Apr 2021 05:24:44 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/4] drm/vkms: rename cursor to plane on ops of planes
 composition
Message-ID: <ef3249c9ac3a08b7079894f9f1ccf70960194ec7.1619250933.git.melissa.srw@gmail.com>
References: <cover.1619250933.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1619250933.git.melissa.srw@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generalize variables and function names used for planes composition
(from cursor to plane), since we will reuse the operations for both
cursor and overlay types.

No functional change.

v4:
- use better names for functions of plane composition (Daniel)

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 31 ++++++++++++++--------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 66c6842d70db..02642801735d 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -125,26 +125,26 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 	}
 }
 
-static void compose_cursor(struct vkms_composer *cursor_composer,
-			   struct vkms_composer *primary_composer,
-			   void *vaddr_out)
+static void compose_plane(struct vkms_composer *primary_composer,
+			  struct vkms_composer *plane_composer,
+			  void *vaddr_out)
 {
-	struct drm_gem_object *cursor_obj;
-	struct drm_gem_shmem_object *cursor_shmem_obj;
+	struct drm_gem_object *plane_obj;
+	struct drm_gem_shmem_object *plane_shmem_obj;
 
-	cursor_obj = drm_gem_fb_get_obj(&cursor_composer->fb, 0);
-	cursor_shmem_obj = to_drm_gem_shmem_obj(cursor_obj);
+	plane_obj = drm_gem_fb_get_obj(&plane_composer->fb, 0);
+	plane_shmem_obj = to_drm_gem_shmem_obj(plane_obj);
 
-	if (WARN_ON(!cursor_shmem_obj->vaddr))
+	if (WARN_ON(!plane_shmem_obj->vaddr))
 		return;
 
-	blend(vaddr_out, cursor_shmem_obj->vaddr,
-	      primary_composer, cursor_composer);
+	blend(vaddr_out, plane_shmem_obj->vaddr,
+	      primary_composer, plane_composer);
 }
 
-static int compose_planes(void **vaddr_out,
-			  struct vkms_composer *primary_composer,
-			  struct vkms_composer *cursor_composer)
+static int compose_active_planes(void **vaddr_out,
+				 struct vkms_composer *primary_composer,
+				 struct vkms_composer *cursor_composer)
 {
 	struct drm_framebuffer *fb = &primary_composer->fb;
 	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
@@ -164,7 +164,7 @@ static int compose_planes(void **vaddr_out,
 	memcpy(*vaddr_out, shmem_obj->vaddr, shmem_obj->base.size);
 
 	if (cursor_composer)
-		compose_cursor(cursor_composer, primary_composer, *vaddr_out);
+		compose_plane(primary_composer, cursor_composer, *vaddr_out);
 
 	return 0;
 }
@@ -222,7 +222,8 @@ void vkms_composer_worker(struct work_struct *work)
 	if (wb_pending)
 		vaddr_out = crtc_state->active_writeback;
 
-	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
+	ret = compose_active_planes(&vaddr_out, primary_composer,
+				    cursor_composer);
 	if (ret) {
 		if (ret == -EINVAL && !wb_pending)
 			kfree(vaddr_out);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
