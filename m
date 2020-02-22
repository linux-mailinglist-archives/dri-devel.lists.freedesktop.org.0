Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD97F16910D
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 18:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6386E96D;
	Sat, 22 Feb 2020 17:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CFD6E96B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 17:54:43 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c84so5208061wme.4
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 09:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QQFvAt89gHl5sehwV/pl0yi99opLB2JHobZcXKnTrO0=;
 b=hKqORRJTd70oa/J2y02zfUU8qinK6hqjuWEmGltzuSRVM6/MnApX18zlCkMPvcdtUO
 9rlkFQ6Ma3xSyZdkLZDpK6sITem52UXq2ReZ49HhvyQhbXkiu2ma9uKaUWbGdZVIJ5UL
 vOoiP/Tu7Y80NjrdO+cxxDG2Nv0ysm2J4VLYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QQFvAt89gHl5sehwV/pl0yi99opLB2JHobZcXKnTrO0=;
 b=nP5o6K6Jo/1vJgIbCMHEwG4qvn8gb1g+GPRDvxkEIDWGsxO3L9yS/8lBA4GME2mHjo
 +wKx42XvMfZJF53hnFYIDQGNAB8MPIFzf7g0T/HEa9UnSOj6xqINCPgrSUh177mi9Mi9
 bXFbDBia+wYXSGnc+DTej9Eo6HyAIemSSeo+IE3b+6JeZ1XSPUQ2p/gOXYhbJoBlIVxS
 Yc/O0b71wf+5/DAehO5e7RFJ1+eARlhHvGgCncXpwyvW/qzT6tbNnI6VautxwCYD/hiI
 6AUqtZEuZlDy3aP8Posgg6V3VlHR/LujHyfm5lyHCYM36aZNm8kd2FuxHBP5OIEIl7rg
 VjIA==
X-Gm-Message-State: APjAAAUT/xU+5p4w0lvRdsNHjup8/P4AzMAhXn8rC2f2ErzWMH+UM6pT
 M4OEdple6o+Ah6qGxFTPE6R6UlEuLX8=
X-Google-Smtp-Source: APXvYqyjt5zA2ve60feeJb2PFCi0UinIIk/AEvSclzkH/YH5W9JBxd2rrV/XuAXEJfdcdJZaP4MziQ==
X-Received: by 2002:a05:600c:248:: with SMTP id 8mr11134623wmj.1.1582394081490; 
 Sat, 22 Feb 2020 09:54:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l15sm9373405wrv.39.2020.02.22.09.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 09:54:41 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/pci: Unexport drm_get_pci_dev
Date: Sat, 22 Feb 2020 18:54:33 +0100
Message-Id: <20200222175433.2259158-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222175433.2259158-1-daniel.vetter@ffwll.ch>
References: <20200222175433.2259158-1-daniel.vetter@ffwll.ch>
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

Only user left is the shadow attach for legacy drivers.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_pci.c | 22 +++-------------------
 include/drm/drm_pci.h     | 11 -----------
 2 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index c6bb98729a26..cc5af271a1b1 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -75,7 +75,6 @@ drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev, size_t size, size_t ali
 
 	return dmah;
 }
-
 EXPORT_SYMBOL(drm_pci_alloc);
 
 /**
@@ -191,23 +190,9 @@ void drm_pci_agp_destroy(struct drm_device *dev)
 	}
 }
 
-/**
- * drm_get_pci_dev - Register a PCI device with the DRM subsystem
- * @pdev: PCI device
- * @ent: entry from the PCI ID table that matches @pdev
- * @driver: DRM device driver
- *
- * Attempt to gets inter module "drm" information. If we are first
- * then register the character device and inter module information.
- * Try and register, if we fail to register, backout previous work.
- *
- * NOTE: This function is deprecated, please use drm_dev_alloc() and
- * drm_dev_register() instead and remove your &drm_driver.load callback.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int drm_get_pci_dev(struct pci_dev *pdev, const struct pci_device_id *ent,
-		    struct drm_driver *driver)
+static int drm_get_pci_dev(struct pci_dev *pdev,
+			   const struct pci_device_id *ent,
+			   struct drm_driver *driver)
 {
 	struct drm_device *dev;
 	int ret;
@@ -250,7 +235,6 @@ int drm_get_pci_dev(struct pci_dev *pdev, const struct pci_device_id *ent,
 	drm_dev_put(dev);
 	return ret;
 }
-EXPORT_SYMBOL(drm_get_pci_dev);
 
 #ifdef CONFIG_DRM_LEGACY
 
diff --git a/include/drm/drm_pci.h b/include/drm/drm_pci.h
index 9031e217b506..3941b0255ecf 100644
--- a/include/drm/drm_pci.h
+++ b/include/drm/drm_pci.h
@@ -45,10 +45,6 @@ struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev, size_t size,
 				     size_t align);
 void drm_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah);
 
-int drm_get_pci_dev(struct pci_dev *pdev,
-		    const struct pci_device_id *ent,
-		    struct drm_driver *driver);
-
 #else
 
 static inline struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev,
@@ -62,13 +58,6 @@ static inline void drm_pci_free(struct drm_device *dev,
 {
 }
 
-static inline int drm_get_pci_dev(struct pci_dev *pdev,
-				  const struct pci_device_id *ent,
-				  struct drm_driver *driver)
-{
-	return -ENOSYS;
-}
-
 #endif
 
 #endif /* _DRM_PCI_H_ */
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
