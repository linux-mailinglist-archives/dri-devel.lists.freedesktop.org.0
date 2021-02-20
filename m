Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0273205C1
	for <lists+dri-devel@lfdr.de>; Sat, 20 Feb 2021 15:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03066E1CE;
	Sat, 20 Feb 2021 14:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C036E1CE
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Feb 2021 14:41:21 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id w4so9532517wmi.4
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Feb 2021 06:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=OmF0g/VAKBYdCDgOx5TjJPBaDMsn4k/UprRXnCcx/14=;
 b=FK4m4lw2FLP9Sa8/oxf9uTH9VM3EHtd0Yz/zGxMQqDot7DRjLAim4AOGOKduX4yLD3
 VcSzy4Lo55LFj2rMqwB43wkuB5O03es3VQHvqL6gtczyfXg73eJ8DgkVVwX5KuF0XG7x
 C8VA7BShMdVk1Y8AoXpI3FyO7hYoTZAo8RDHchBfRZbkx7hE+fWiE6he4oqovKlG8w/7
 3Uy0Wa/vRMxBxHN1roqtWyTkXQozwwMzl9HEztVHFkXUWGPn/hVXoNYxppTe/ECvgN+D
 ONMbcUoGU9KXDEl9xfKZKGpjrStlG/x446HilrZ+slGMypxLVwqyRfNBc4Y5wM48Yy01
 daxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=OmF0g/VAKBYdCDgOx5TjJPBaDMsn4k/UprRXnCcx/14=;
 b=L/1nM2vhOeAS/2T/JPaFe/9qXZRb0WiWd5DqOHxi8AIG1PZkvAU3bJsAcqVNcZXMA8
 gLk/tRY63i/XTqTICtwxeGAynV9PBfRwTbLPxFujToYPAAfHjsn35Y2MnJzaJHwRonY7
 FATZxOcYeoMrMw0k1DiVVaNVCRM3ymOHJmHxyhZH+R633RISDr9bwkQGEmIPNR8oENmX
 3dwt+BJtf98VRdGi8A+OboqiwGOxYVQIr+FkZN7cnwtsr/2Yzg3vpq2S+AXMCBcxLLmM
 7+FrQVotPVe/VuCKDHmlsI8JjqI9V5CZEG7zmS3570LQjvPvf4jjKhn2B7WzQ0Lov/gy
 gkWA==
X-Gm-Message-State: AOAM531jseehcQBd56c4dRRiijt+M0AoWT6aRrJopr5BMfXUFzgC3Xpc
 DSStcfi50qscpsAb1LPZG9Y=
X-Google-Smtp-Source: ABdhPJwJ3OIxGozhrkMHmEyBn6KT9VCoG1PbgSNkHSGIX0SLIXe2DQXAWy3rMihHLJ1Cd8+vkWVxdw==
X-Received: by 2002:a05:600c:4f14:: with SMTP id
 l20mr12932747wmq.118.1613832080718; 
 Sat, 20 Feb 2021 06:41:20 -0800 (PST)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id l7sm19785386wrn.11.2021.02.20.06.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 06:41:20 -0800 (PST)
Date: Sat, 20 Feb 2021 11:41:14 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 David Airlie <airlied@linux.ie>
Subject: [RFC PATCH 2/3] drm/vkms: rename cursor to plane on ops of planes
 composition
Message-ID: <20210220144114.25svrv4wbjietuqd@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
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
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
