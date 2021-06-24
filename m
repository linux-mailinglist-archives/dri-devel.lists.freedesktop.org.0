Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC7E3B2B0A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 11:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721466EB12;
	Thu, 24 Jun 2021 09:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD056EA8D;
 Thu, 24 Jun 2021 09:05:03 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6ABE52197D;
 Thu, 24 Jun 2021 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624525502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T5Qe+XA5tUEIi39mYqUowu6I4/Ub2Rn/PDDgcGNwwIY=;
 b=A2vOlXQ7JcR73UdNs8+O0k6o10MNtB8iCnZj2yC43VTG4HgQALN4R4nNsYqsGieP79xA93
 aJ7pxi9TpiC/+5UAi209i698VwlKlIyskhIRkPQa6Yz07h0Y+eq019drKVbTnEhgtA7NuO
 gnGTGGG1t7tVzw5M2cW7UEA0LkDEd7s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624525502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T5Qe+XA5tUEIi39mYqUowu6I4/Ub2Rn/PDDgcGNwwIY=;
 b=qjdg5zwY0tPij6ffuVV2eAKh9LKxQIX8mhMVZLebPpWColU0kCK0HLK0FKSq0I+AvJNloq
 YQ2eHq1Qi03lLDAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 43AA911A97;
 Thu, 24 Jun 2021 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624525502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T5Qe+XA5tUEIi39mYqUowu6I4/Ub2Rn/PDDgcGNwwIY=;
 b=A2vOlXQ7JcR73UdNs8+O0k6o10MNtB8iCnZj2yC43VTG4HgQALN4R4nNsYqsGieP79xA93
 aJ7pxi9TpiC/+5UAi209i698VwlKlIyskhIRkPQa6Yz07h0Y+eq019drKVbTnEhgtA7NuO
 gnGTGGG1t7tVzw5M2cW7UEA0LkDEd7s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624525502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T5Qe+XA5tUEIi39mYqUowu6I4/Ub2Rn/PDDgcGNwwIY=;
 b=qjdg5zwY0tPij6ffuVV2eAKh9LKxQIX8mhMVZLebPpWColU0kCK0HLK0FKSq0I+AvJNloq
 YQ2eHq1Qi03lLDAQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id /RmrD75K1GCFNQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 09:05:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	kraxel@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/qxl: Remove empty qxl_gem_prime_mmap()
Date: Thu, 24 Jun 2021 11:05:00 +0200
Message-Id: <20210624090500.8320-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function qxl_gem_prime_mmap() returns an error. The two callers
of gem_prime_mmap are drm_fbdev_fb_mmap() and drm_gem_dmabuf_mmap(),
which both already handle NULL-callbacks with an error code. So clear
gem_prime_mmap in qxl and remove qxl_gem_prime_mmap().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_drv.c   | 1 -
 drivers/gpu/drm/qxl/qxl_drv.h   | 2 --
 drivers/gpu/drm/qxl/qxl_prime.c | 6 ------
 3 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 854e6c5a563f..b3d75ea7e6b3 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -281,7 +281,6 @@ static struct drm_driver qxl_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = qxl_gem_prime_import_sg_table,
-	.gem_prime_mmap = qxl_gem_prime_mmap,
 	.fops = &qxl_fops,
 	.ioctls = qxl_ioctls,
 	.irq_handler = qxl_irq_handler,
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index dd6abee55f56..f95885a8bd2b 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -434,8 +434,6 @@ struct drm_gem_object *qxl_gem_prime_import_sg_table(
 int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
 			  struct dma_buf_map *map);
-int qxl_gem_prime_mmap(struct drm_gem_object *obj,
-				struct vm_area_struct *vma);
 
 /* qxl_irq.c */
 int qxl_irq_init(struct qxl_device *qdev);
diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
index 0628d1cc91fe..4a10cb0a413b 100644
--- a/drivers/gpu/drm/qxl/qxl_prime.c
+++ b/drivers/gpu/drm/qxl/qxl_prime.c
@@ -73,9 +73,3 @@ void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
 
 	qxl_bo_vunmap(bo);
 }
-
-int qxl_gem_prime_mmap(struct drm_gem_object *obj,
-		       struct vm_area_struct *area)
-{
-	return -ENOSYS;
-}
-- 
2.32.0

