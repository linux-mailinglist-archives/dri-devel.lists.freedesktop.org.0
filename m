Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F2928760A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 16:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71D66EA67;
	Thu,  8 Oct 2020 14:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E2A6EA67
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 14:29:34 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l15so6900487wmh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tM72HOhD4m0QZaHwDXJFnjrIle6ycRQ/mhLSWFtCpZM=;
 b=OD0nhkkbLh77M3QUqypfYiWreH7sAgeseyBjzkD8rf+yXtAdaNfk6VjMBX6sCpb628
 M53tcJ7qOIOYJhGP4RCfByNvg5Q/UIAwX7+ItrRMqJlCw2xM+SIZCCwqftYxrQ8VOrHW
 C6n/pLlG1Xd/fbxJHCNMOYsbWW8S9w5Z0B4a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tM72HOhD4m0QZaHwDXJFnjrIle6ycRQ/mhLSWFtCpZM=;
 b=F+pkr6IPmWV5nD2U4ASX9rvwmAspxes+xNQd6h3p1SnvqllzBZrPRqpSwOGimzjDWP
 D2BoGj7m4Mtk4opmtMVmY8YDga6dzW0Npfbo+gLxYisg+iL1kb3JXyTg+YTa4OpEmVpV
 LNqdz5Pq3B3fHui1Lv+2aWuj0pcUe14xSO/J7tVDWavCVPqi498PH+skNT5f6Rd+abIm
 WsAbFle9jLSieNYRduo8+ck+syg1vke76GD08CcA6yQYKARnv1YNjhx/899oyHdmv11/
 4xu1RRxzE79cqcxzQsemK3UpVG7jqDncA7AItZcL9vOxaDR5oMsT5rJqm7RrTlczIKxk
 FjLg==
X-Gm-Message-State: AOAM530ZM9JejZ24DIIFzaCWzKXAm08vi+2PoanmQh869JyFdc/DAcNt
 nZpg1jGoEVqU11VPiMUPaC+MZpwsxz4QBN+b
X-Google-Smtp-Source: ABdhPJySiFE3tTzaNxdUpdfODNCEuldy6DzUTqUvkWv4EtnO2u9x0/ZXsvnnwOSsXuQdewE482QIvg==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr9575194wmk.128.1602167372721; 
 Thu, 08 Oct 2020 07:29:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u15sm6965887wml.21.2020.10.08.07.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 07:29:32 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: Give irq_by_busid drm_legacy_ prefix
Date: Thu,  8 Oct 2020 16:29:27 +0200
Message-Id: <20201008142927.2819321-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's the only ioctl handler purely for legacy drivers that didn't have
this yet.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_internal.h | 8 ++++----
 drivers/gpu/drm/drm_ioctl.c    | 2 +-
 drivers/gpu/drm/drm_pci.c      | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index b65865c630b0..2bdac3557765 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -53,15 +53,15 @@ void drm_lastclose(struct drm_device *dev);
 #ifdef CONFIG_PCI
 
 /* drm_pci.c */
-int drm_irq_by_busid(struct drm_device *dev, void *data,
-		     struct drm_file *file_priv);
+int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
+			    struct drm_file *file_priv);
 void drm_pci_agp_destroy(struct drm_device *dev);
 int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master);
 
 #else
 
-static inline int drm_irq_by_busid(struct drm_device *dev, void *data,
-				   struct drm_file *file_priv)
+static inline int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
+					  struct drm_file *file_priv)
 {
 	return -EINVAL;
 }
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 87a44492957e..6def1621e32a 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -578,7 +578,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_VERSION, drm_version, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF(DRM_IOCTL_GET_UNIQUE, drm_getunique, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_GET_MAGIC, drm_getmagic, 0),
-	DRM_IOCTL_DEF(DRM_IOCTL_IRQ_BUSID, drm_irq_by_busid, DRM_MASTER|DRM_ROOT_ONLY),
+	DRM_IOCTL_DEF(DRM_IOCTL_IRQ_BUSID, drm_legacy_irq_by_busid, DRM_MASTER|DRM_ROOT_ONLY),
 
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_MAP, drm_legacy_getmap_ioctl, 0),
 
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index c250fb5a88ca..6dba4b8ce4fe 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -139,7 +139,7 @@ static int drm_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_busid *p)
 }
 
 /**
- * drm_irq_by_busid - Get interrupt from bus ID
+ * drm_legacy_irq_by_busid - Get interrupt from bus ID
  * @dev: DRM device
  * @data: IOCTL parameter pointing to a drm_irq_busid structure
  * @file_priv: DRM file private.
@@ -150,8 +150,8 @@ static int drm_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_busid *p)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int drm_irq_by_busid(struct drm_device *dev, void *data,
-		     struct drm_file *file_priv)
+int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
+			    struct drm_file *file_priv)
 {
 	struct drm_irq_busid *p = data;
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
