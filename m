Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 175DE2A9653
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 13:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257AD6E1A8;
	Fri,  6 Nov 2020 12:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76CD6E1A8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 12:42:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D5C4ABDE;
 Fri,  6 Nov 2020 12:42:28 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/gma500: Remove unused function psb_gem_get_aperture()
Date: Fri,  6 Nov 2020 13:42:24 +0100
Message-Id: <20201106124224.21201-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apparently, the function was never used at all.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gem.c     | 6 ------
 drivers/gpu/drm/gma500/psb_drv.h | 2 --
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 8f07de83b6fb..db827e591403 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -32,12 +32,6 @@ static void psb_gem_free_object(struct drm_gem_object *obj)
 	psb_gtt_free_range(obj->dev, gtt);
 }
 
-int psb_gem_get_aperture(struct drm_device *dev, void *data,
-				struct drm_file *file)
-{
-	return -EINVAL;
-}
-
 static const struct vm_operations_struct psb_gem_vm_ops = {
 	.fault = psb_gem_fault,
 	.open = drm_gem_vm_open,
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index c71a5a4e912c..ce6aae4b1bb2 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -735,8 +735,6 @@ extern const struct drm_connector_helper_funcs
 extern const struct drm_connector_funcs psb_intel_lvds_connector_funcs;
 
 /* gem.c */
-extern int psb_gem_get_aperture(struct drm_device *dev, void *data,
-			struct drm_file *file);
 extern int psb_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args);
 
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
