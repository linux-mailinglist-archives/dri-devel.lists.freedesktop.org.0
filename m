Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3AD1EF9BC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BF26E8F5;
	Fri,  5 Jun 2020 13:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E1C6E8EC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:58:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F3B70AC9F;
 Fri,  5 Jun 2020 13:58:08 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH 04/14] drm/mgag200: Rename mgag200_ttm.c to mgag200_mm.c
Date: Fri,  5 Jun 2020 15:57:53 +0200
Message-Id: <20200605135803.19811-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605135803.19811-1-tzimmermann@suse.de>
References: <20200605135803.19811-1-tzimmermann@suse.de>
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

The mgag200 driver does not use TTM any longer. Rename the related file
to mgag200_mm.c (as in 'memory management').

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/Makefile                        | 4 ++--
 drivers/gpu/drm/mgag200/mgag200_drv.h                   | 1 +
 drivers/gpu/drm/mgag200/{mgag200_ttm.c => mgag200_mm.c} | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename drivers/gpu/drm/mgag200/{mgag200_ttm.c => mgag200_mm.c} (100%)

diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/Makefile
index 63403133638a3..e6a933874a88c 100644
--- a/drivers/gpu/drm/mgag200/Makefile
+++ b/drivers/gpu/drm/mgag200/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-mgag200-y   := mgag200_main.o mgag200_mode.o \
-	mgag200_drv.o mgag200_i2c.o mgag200_ttm.o
+mgag200-y   := mgag200_drv.o mgag200_i2c.o mgag200_main.o mgag200_mm.o \
+	       mgag200_mode.o
 
 obj-$(CONFIG_DRM_MGAG200) += mgag200.o
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 92b6679029fe5..cd786ffe319b8 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -196,6 +196,7 @@ void mgag200_driver_unload(struct drm_device *dev);
 struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev);
 void mgag200_i2c_destroy(struct mga_i2c_chan *i2c);
 
+				/* mgag200_mm.c */
 int mgag200_mm_init(struct mga_device *mdev);
 void mgag200_mm_fini(struct mga_device *mdev);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_ttm.c b/drivers/gpu/drm/mgag200/mgag200_mm.c
similarity index 100%
rename from drivers/gpu/drm/mgag200/mgag200_ttm.c
rename to drivers/gpu/drm/mgag200/mgag200_mm.c
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
