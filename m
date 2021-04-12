Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA11635D374
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 00:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF416E0CD;
	Mon, 12 Apr 2021 22:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B106E0DA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 22:49:55 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 g66-20020a1c39450000b0290125d187ba22so7266864wma.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=cngo3ZfVDnt2WPvjxNtV6TyKaeQge9GquHcF8oaTBHo=;
 b=qC40QYgNDUeRTE3KGd//It3d8A2jsEuTF/DZ+/kEjoRP6Pb6aX+3ZOSid+V7SSvujB
 FBRsVTnCUREB1SnVciewSJozdUtZba2LcSi035VJY1GRPEIw6vSOEqyjbiDtbL8svL8/
 kJXvmFleI+AKR+RxLm8kf5Qgh3SwnV+NvV7bPMsnOyqDRVCdI0NJ+gs6rja6l9jonexi
 IEzt1r+jClNdyUi3JneKDQcJ/jRuO97Kk/NddW5XOVeRpJGMh9eisMlgyfAQOxztdyTl
 EvTOuQf3e7Bu6XmAWE71dIXI8cC1GASq5v/FInDq5OFjwPyx/KTw0YIP2vsZGNzJ66sl
 nL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=cngo3ZfVDnt2WPvjxNtV6TyKaeQge9GquHcF8oaTBHo=;
 b=um16F7AzipUhGHVwB2BYbEQwBV1L/aOvwh4kqPOWO4ZumxltfLSI1w0+i4D9t7jBo3
 qXCBLLTdjheM58BUUezbQY8c2rlr/MyR+pB5iju7JSLvHIbbS5mlLorSs4MHb2feqzTR
 WsJiwoicreEi9VR9aYmJncefEiGZUA8DjFUDnLg6nyB5r2s3QBPPe6wWvTIHvLwbdb61
 ZJfFWUOk+BzqboKXXIhvAacMcPtt/o7f/JvIQEAenldTzS+pQJje6vAUM8z8GdDLVEYn
 qi5YJqTWmOpl/DO7GlhIo/m8wAjH4i1d6ZF6zgcbhUsPxnkCRuwuK9CHPSa4jQ37Xef7
 FWPw==
X-Gm-Message-State: AOAM5333jV5LAqjcRSaIKaIwZSC5wUV05pBerTskhCD6RPuZ/8/1mvxu
 kTuDk1YBZe4EzbPLksYJKmw=
X-Google-Smtp-Source: ABdhPJzPVCe9nMDqp/sxLn5P0s9k/MRR9AxjEwJN38ZI3Ue4ucZQ+t+6FafxS4N6uKQOQXE18za91Q==
X-Received: by 2002:a1c:c246:: with SMTP id s67mr1150243wmf.86.1618267794039; 
 Mon, 12 Apr 2021 15:49:54 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id c1sm3041917wrx.89.2021.04.12.15.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 15:49:53 -0700 (PDT)
Date: Mon, 12 Apr 2021 19:49:45 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Simon Ser <contact@emersion.fr>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: [PATCH v2 2/4] drm/vkms: rename cursor to plane on ops of planes
 composition
Message-ID: <20210412224945.nrokit7hfn254rbw@smtp.gmail.com>
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
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
