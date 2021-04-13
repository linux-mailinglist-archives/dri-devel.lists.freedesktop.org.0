Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B49F835D961
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 09:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B980289FD9;
	Tue, 13 Apr 2021 07:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A861F89FD9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 07:53:51 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a4so15429866wrr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 00:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cngo3ZfVDnt2WPvjxNtV6TyKaeQge9GquHcF8oaTBHo=;
 b=FEALEW1fvVujvhwLrLqKy04CEK5dgkbiGnFfeWRd6g08SpOGjkJ3iwSvgzGuc8x4Qz
 +dXOMQk86OumdqqJ3i1r6hbetyoNHFLeleoGIa0rQIcR2NMy8Mn/eh6fa4A6ZhVs/ZZ1
 Ij7oN3p75+O8SgHNCtjOCkLmP8mivoI/dusJP8gq/kf2rbGaQzJsI+RVgsgDL+cR/nAx
 QRVPfh6LQVPa6cnE329mVQlpynJXCiPl8zIqtupzgx72uubg8bEPCnb/4nk10WgqNFhG
 3BBOuGNWG9cmk6bdh0LRZUJ8r+exmiJifnqEJp7o8uEvFqKss6PigfJImBqttm5yDyNZ
 NTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cngo3ZfVDnt2WPvjxNtV6TyKaeQge9GquHcF8oaTBHo=;
 b=U9uEyRvxTFMCL9e16Ku4mHXTZ3eZAYx+oyz4L4qQ6Ai0ncQlSU3C6rTNzWv56agJv9
 Gvo9tyr444dVqYAbAf6CB3E93PRpB1X1vrDU1xjXv2iuEm0v4OpUycKJJ5c+3oWh4YAB
 C70gcPJqIEfB/+stI65krbidPuTMnGp2piKT9J7I88nZTCjaBGA1E0zJZ0avpbDczreZ
 guRBpu3K3AIwwQ6e+8hFa9W/kFuPc1AilTGk0yK+RULxjIjD/TyuDY1OoJss5IjHsadN
 QKU97voqaw6r0E2n9IqgFUZQtKHhaFGNTLFyhQu8/IjLYVsDrzMzYasHePnqPvdd1UNG
 31Kg==
X-Gm-Message-State: AOAM532wc5GIIl7RqgMA0zd0BcEhVOMNje0aUZwNH/pvFjB+uscq84Gl
 DLihU33Am9e5Vk8OBaROtvuPzn05jxi+fQ==
X-Google-Smtp-Source: ABdhPJxBDZfygoWM7Nx3x4J6+oFb/RitErtsLAWofj71x+/2CX3IuB2ITIuNxwSBVPBcY8KVrE7Zew==
X-Received: by 2002:a5d:414c:: with SMTP id c12mr9183286wrq.392.1618300430134; 
 Tue, 13 Apr 2021 00:53:50 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id i4sm4599625wrx.56.2021.04.13.00.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 00:53:49 -0700 (PDT)
Date: Tue, 13 Apr 2021 04:53:43 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm/vkms: rename cursor to plane on ops of planes
 composition
Message-ID: <085ed9af17e0cc45e51f6befba1cd7617a36c73a.1618299945.git.melissa.srw@gmail.com>
References: <cover.1618299945.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1618299945.git.melissa.srw@gmail.com>
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

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 66c6842d70db..be8f1d33c645 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -125,26 +125,26 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 	}
 }
 
-static void compose_cursor(struct vkms_composer *cursor_composer,
-			   struct vkms_composer *primary_composer,
+static void compose_planes(struct vkms_composer *primary_composer,
+			   struct vkms_composer *plane_composer,
 			   void *vaddr_out)
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
+static int composite(void **vaddr_out,
+		     struct vkms_composer *primary_composer,
+		     struct vkms_composer *cursor_composer)
 {
 	struct drm_framebuffer *fb = &primary_composer->fb;
 	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
@@ -164,7 +164,7 @@ static int compose_planes(void **vaddr_out,
 	memcpy(*vaddr_out, shmem_obj->vaddr, shmem_obj->base.size);
 
 	if (cursor_composer)
-		compose_cursor(cursor_composer, primary_composer, *vaddr_out);
+		compose_planes(primary_composer, cursor_composer, *vaddr_out);
 
 	return 0;
 }
@@ -222,7 +222,7 @@ void vkms_composer_worker(struct work_struct *work)
 	if (wb_pending)
 		vaddr_out = crtc_state->active_writeback;
 
-	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
+	ret = composite(&vaddr_out, primary_composer, cursor_composer);
 	if (ret) {
 		if (ret == -EINVAL && !wb_pending)
 			kfree(vaddr_out);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
