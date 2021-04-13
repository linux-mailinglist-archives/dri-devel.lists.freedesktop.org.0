Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D02C35D967
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 09:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBC06E21C;
	Tue, 13 Apr 2021 07:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012216E21C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 07:56:09 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id x7so15398228wrw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 00:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mjJ4KJNwe+FBi9X8xhdF7ZWwDPbABB4kXINZ0Bg0sLs=;
 b=WUqe7g9OleC8DkSUp2eAm+cnGeqGD7U7YQVXRA7i3Rwb5f1wxz1clyMcbukb5SJ++I
 lL6xnaUK6NXp3/1iDjUZuNsLSgHUb9qwECbNXeu3suoYBj9gFIzcZOj811mzNWuueUXU
 iasYACw6JJpA41fwJaF6F7vXDCg5SQEFvUMt5HpUmAGVzZ9tDdTOe+KXxOHpnvi1cQCz
 QoisCJJNQMZArJfqIxeNZFWDomE0AtQ6brXjrKAqw+byObVk0MQGP0SD88aKcU5FZMoE
 dypKelBJMGK32K+oIzI9HKOlH415HBPU023BLwYiu3Yju9HsGKvdNv3v+ffdhTrTfH+t
 KvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mjJ4KJNwe+FBi9X8xhdF7ZWwDPbABB4kXINZ0Bg0sLs=;
 b=mzo5mxfw2BpCV2evj0HOAJHvG+q0rogUY+ueFjPi3RIDt22mgFQy33PU9gqIrL5rRN
 8tmZzsuI9m02AQg+fUKMpOQRbeMvX+lTy6FLI0lLaTqRhYvKVxkrIinLDJxiEMC3aJM6
 UwRw4hKZ1zZZ5P8hzJci/44EDAwOGE35Dk4i7tDob7umVJ5fta2NsBmbuDVrqEQ/mJTh
 yOZbSBXJxpWprHw64LEpaRWVIo7dJSSm2+6EzpchTOB+qf8oEu8/cZonotje0pARjwfA
 lomxphEW0uBK4nryeuFZgsh7qZaDQPlgSCBf2aWZy1NLWFelUPQbs15R1fRIT61vDcWn
 yf7A==
X-Gm-Message-State: AOAM532CAI0iDfDtBzE4AyNSZ+NbQRpCOPq37U50ZDN4Cth1b8iW/LDR
 e4/UPSVkcVzM2U6XNuszPcced4w+9r+riQ==
X-Google-Smtp-Source: ABdhPJxzoDqNvf6G7x4EQrpAeHOlqntKGtbF5xSnedNbtEK8Lhpf+VFjQl2DRi5L4i7+P4Nk0/H0Ug==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr11793963wrx.295.1618300568321; 
 Tue, 13 Apr 2021 00:56:08 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id 7sm18745661wry.60.2021.04.13.00.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 00:56:07 -0700 (PDT)
Date: Tue, 13 Apr 2021 04:56:02 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/vkms: add overlay support
Message-ID: <792ef462f7ffcd16559a2096673d0b3b5c09777c.1618299945.git.melissa.srw@gmail.com>
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

Add support to overlay plane, in addition to primary and cursor
planes. In this approach, the plane composition still requires an
active primary plane and planes are composed associatively in the
order: (primary <- overlay) <- cursor

It enables to run the following IGT tests successfully:
- kms_plane_cursor:
  - pipe-A-[overlay, primary, viewport]-size-[64, 128, 256]
- kms_atomic:
  - plane-overlay-legacy
and preserves the successful execution of kms_cursor_crc,
kms_writeback and kms_flip

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++----------
 drivers/gpu/drm/vkms/vkms_drv.c      |  5 +++++
 drivers/gpu/drm/vkms/vkms_drv.h      |  1 +
 drivers/gpu/drm/vkms/vkms_output.c   | 11 ++++++++++-
 drivers/gpu/drm/vkms/vkms_plane.c    | 14 +++++++++++---
 5 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 7fe1fdb3af39..73ce1d381737 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -158,11 +158,12 @@ static void compose_planes(struct vkms_composer *primary_composer,
 
 static int composite(void **vaddr_out,
 		     struct vkms_composer *primary_composer,
-		     struct vkms_composer *cursor_composer)
+		     struct vkms_crtc_state *crtc_state)
 {
 	struct drm_framebuffer *fb = &primary_composer->fb;
 	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
 	struct drm_gem_shmem_object *shmem_obj = to_drm_gem_shmem_obj(gem_obj);
+	int i;
 
 	if (!*vaddr_out) {
 		*vaddr_out = kzalloc(shmem_obj->base.size, GFP_KERNEL);
@@ -177,8 +178,14 @@ static int composite(void **vaddr_out,
 
 	memcpy(*vaddr_out, shmem_obj->vaddr, shmem_obj->base.size);
 
-	if (cursor_composer)
-		compose_planes(primary_composer, cursor_composer, *vaddr_out);
+	/* If there are other planes besides primary, we consider the active
+	 * planes should be in z-order and compose them associatively:
+	 * ((primary <- overlay) <- cursor)
+	 */
+	for (i = 1; i < crtc_state->num_active_planes; i++)
+		compose_planes(primary_composer,
+			       crtc_state->active_planes[i]->composer,
+			       *vaddr_out);
 
 	return 0;
 }
@@ -200,7 +207,7 @@ void vkms_composer_worker(struct work_struct *work)
 	struct drm_crtc *crtc = crtc_state->base.crtc;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 	struct vkms_composer *primary_composer = NULL;
-	struct vkms_composer *cursor_composer = NULL;
+	struct vkms_plane_state *act_plane = NULL;
 	bool crc_pending, wb_pending;
 	void *vaddr_out = NULL;
 	u32 crc32 = 0;
@@ -224,11 +231,11 @@ void vkms_composer_worker(struct work_struct *work)
 	if (!crc_pending)
 		return;
 
-	if (crtc_state->num_active_planes >= 1)
-		primary_composer = crtc_state->active_planes[0]->composer;
-
-	if (crtc_state->num_active_planes == 2)
-		cursor_composer = crtc_state->active_planes[1]->composer;
+	if (crtc_state->num_active_planes >= 1) {
+		act_plane = crtc_state->active_planes[0];
+		if (act_plane->base.plane->type == DRM_PLANE_TYPE_PRIMARY)
+			primary_composer = act_plane->composer;
+	}
 
 	if (!primary_composer)
 		return;
@@ -236,7 +243,7 @@ void vkms_composer_worker(struct work_struct *work)
 	if (wb_pending)
 		vaddr_out = crtc_state->active_writeback;
 
-	ret = composite(&vaddr_out, primary_composer, cursor_composer);
+	ret = composite(&vaddr_out, primary_composer, crtc_state);
 	if (ret) {
 		if (ret == -EINVAL && !wb_pending)
 			kfree(vaddr_out);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 2173b82606f6..027ffe759440 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -44,6 +44,10 @@ static bool enable_writeback = true;
 module_param_named(enable_writeback, enable_writeback, bool, 0444);
 MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector support");
 
+static bool enable_overlay;
+module_param_named(enable_overlay, enable_overlay, bool, 0444);
+MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
+
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_release(struct drm_device *dev)
@@ -198,6 +202,7 @@ static int __init vkms_init(void)
 
 	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
+	config->overlay = enable_overlay;
 
 	return vkms_create(config);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 70fb79621617..ac8c9c2fa4ed 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -89,6 +89,7 @@ struct vkms_device;
 struct vkms_config {
 	bool writeback;
 	bool cursor;
+	bool overlay;
 	/* only set when instantiated */
 	struct vkms_device *dev;
 };
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 6979fbc7f821..04406bd3ff02 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -39,7 +39,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	struct drm_connector *connector = &output->connector;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_crtc *crtc = &output->crtc;
-	struct vkms_plane *primary, *cursor = NULL;
+	struct vkms_plane *primary, *cursor = NULL, *overlay = NULL;
 	int ret;
 	int writeback;
 
@@ -47,6 +47,15 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
+	if (vkmsdev->config->overlay) {
+		overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
+		if (IS_ERR(overlay))
+			return PTR_ERR(overlay);
+
+		if (!overlay->base.possible_crtcs)
+			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
+	}
+
 	if (vkmsdev->config->cursor) {
 		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
 		if (IS_ERR(cursor))
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index da4251aff67f..8be9eab41ea0 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -133,7 +133,7 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
-	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
 		can_position = true;
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
@@ -200,11 +200,19 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	const u32 *formats;
 	int nformats;
 
-	if (type == DRM_PLANE_TYPE_CURSOR) {
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+		formats = vkms_formats;
+		nformats = ARRAY_SIZE(vkms_formats);
+		funcs = &vkms_primary_helper_funcs;
+		break;
+	case DRM_PLANE_TYPE_CURSOR:
+	case DRM_PLANE_TYPE_OVERLAY:
 		formats = vkms_plane_formats;
 		nformats = ARRAY_SIZE(vkms_plane_formats);
 		funcs = &vkms_primary_helper_funcs;
-	} else {
+		break;
+	default:
 		formats = vkms_formats;
 		nformats = ARRAY_SIZE(vkms_formats);
 		funcs = &vkms_primary_helper_funcs;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
