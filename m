Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6261E8A74
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 23:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190486E97B;
	Fri, 29 May 2020 21:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4496E97B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 21:51:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x6so5508561wrm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 14:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWejylb+djpwIa2N9XUbD+uH2HLcKZnhtSJoefcCpEA=;
 b=YfwIN1N1HKXAiRpB5zUDK6/WFR3AIY1bQgcw7GwuBUuSnLWc2qbSE2gludDvSxS5nL
 TZf3giCdm67jZt/G1Zz5Tk6J13kQ2dyyBRgJMIMSfaoLrInjVkcly07iraYqVejGtPjS
 Y8Ls/IAcoSPxMdVbBS1217Yz7SRsZ9hmDS0pmQgoiAdwOdnxmtVWnP2H/LC4yMoNcses
 0bCxNGtZIPEKdN1TbwGqjdEbCP8udTiSD2DpZL4nhZ9O8AB0MhJwc+UEKR9+GF88qa7C
 LLcKjdb1kzx9Tz97unz4I1hMIcbGNjHGTot6M6DEasI6XABy/EHyvdL60ofhqz3X27j2
 F+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWejylb+djpwIa2N9XUbD+uH2HLcKZnhtSJoefcCpEA=;
 b=Ybv7PpFYJOFXO41y+rW3x9ZjVNVvw77ieI2bRRGS/qY8nAxyh/TffhdlMWActY/6Ls
 v3L/9OWUH7FWL4Yh/oDm5jmB2Adk2dO9c04Tt7AcRq7t5Tt8j41DWtpwtKkgLFfR6QY2
 xcpMrk2+RMESehCRw1IeCkSh7UOoggOJKiRUFpyAFV9pUch5F07LRbhizwT5SIOcEM98
 KT2o02rKnW+aQoXGBX0VNa29vzFwpMUQMp+Y+mTx6rP4PiWt0lJcZLXtipPMKJxYbrzC
 bWI5rkfPDYi3P0BREpDJNZa3c5bWCkNvvTMNqGL4WQ+zlfrLMR7PTrmqfpJwedVsK/j/
 SiGg==
X-Gm-Message-State: AOAM530cXE7gq7NE1/s8L7i+BjhR+e+8KpZ1yOH9/ZFCJqpqpRLyLmxZ
 dcBypGwxXoKps9z3lU6h1p3Q+mOw
X-Google-Smtp-Source: ABdhPJw/qxZoUvUVekaSihkNQw+IHXkPjHdGLBmjrBu4ZbUNKC/Njr8V3GrxxuSeh5Mf6um/ZLdnbw==
X-Received: by 2002:adf:f582:: with SMTP id f2mr11396456wro.204.1590789080009; 
 Fri, 29 May 2020 14:51:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id 23sm1140660wmo.18.2020.05.29.14.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 14:51:19 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: vmwgfx: remove drm_driver::master_set() return typ
Date: Fri, 29 May 2020 22:48:06 +0100
Message-Id: <20200529214807.3801851-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function always returns zero (success). Ideally we'll remove it all
together - although that's requires a little more work.

For now, we can drop the return type and simplify the drm core code
surrounding it.

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
VMWare team, I'm planning to push this via drm-misc. Review, ack and
comments are appreciated.
---
 drivers/gpu/drm/drm_auth.c          | 33 +++++++----------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |  8 +++----
 include/drm/drm_drv.h               |  4 ++--
 3 files changed, 13 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 800ac39f3213..db701a9e9393 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -122,27 +122,19 @@ struct drm_master *drm_master_create(struct drm_device *dev)
 	return master;
 }
 
-static int drm_set_master(struct drm_device *dev, struct drm_file *fpriv,
-			  bool new_master)
+static void drm_set_master(struct drm_device *dev, struct drm_file *fpriv,
+			   bool new_master)
 {
-	int ret = 0;
-
 	dev->master = drm_master_get(fpriv->master);
-	if (dev->driver->master_set) {
-		ret = dev->driver->master_set(dev, fpriv, new_master);
-		if (unlikely(ret != 0)) {
-			drm_master_put(&dev->master);
-		}
-	}
+	if (dev->driver->master_set)
+		dev->driver->master_set(dev, fpriv, new_master);
 
-	fpriv->was_master = (ret == 0);
-	return ret;
+	fpriv->was_master = true;
 }
 
 static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
 {
 	struct drm_master *old_master;
-	int ret;
 
 	lockdep_assert_held_once(&dev->master_mutex);
 
@@ -157,22 +149,12 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
 	fpriv->is_master = 1;
 	fpriv->authenticated = 1;
 
-	ret = drm_set_master(dev, fpriv, true);
-	if (ret)
-		goto out_err;
+	drm_set_master(dev, fpriv, true);
 
 	if (old_master)
 		drm_master_put(&old_master);
 
 	return 0;
-
-out_err:
-	/* drop references and restore old master on failure */
-	drm_master_put(&fpriv->master);
-	fpriv->master = old_master;
-	fpriv->is_master = 0;
-
-	return ret;
 }
 
 /*
@@ -265,7 +247,8 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 		goto out_unlock;
 	}
 
-	ret = drm_set_master(dev, file_priv, false);
+	ret = 0;
+	drm_set_master(dev, file_priv, false);
 out_unlock:
 	mutex_unlock(&dev->master_mutex);
 	return ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index c2247a893ed4..470428387878 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1129,9 +1129,9 @@ static long vmw_compat_ioctl(struct file *filp, unsigned int cmd,
 }
 #endif
 
-static int vmw_master_set(struct drm_device *dev,
-			  struct drm_file *file_priv,
-			  bool from_open)
+static void vmw_master_set(struct drm_device *dev,
+			   struct drm_file *file_priv,
+			   bool from_open)
 {
 	/*
 	 * Inform a new master that the layout may have changed while
@@ -1139,8 +1139,6 @@ static int vmw_master_set(struct drm_device *dev,
 	 */
 	if (!from_open)
 		drm_sysfs_hotplug_event(dev);
-
-	return 0;
 }
 
 static void vmw_master_drop(struct drm_device *dev,
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index bb924cddc09c..835c38a76ef6 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -311,8 +311,8 @@ struct drm_driver {
 	 *
 	 * Called whenever the minor master is set. Only used by vmwgfx.
 	 */
-	int (*master_set)(struct drm_device *dev, struct drm_file *file_priv,
-			  bool from_open);
+	void (*master_set)(struct drm_device *dev, struct drm_file *file_priv,
+			   bool from_open);
 	/**
 	 * @master_drop:
 	 *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
