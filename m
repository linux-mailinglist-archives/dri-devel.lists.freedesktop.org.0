Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964931E9150
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 14:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD766E02D;
	Sat, 30 May 2020 12:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9190E6E02D
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 12:49:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u13so6424810wml.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 05:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hmxVmoI76gZ6HFsVjw9FdZncjRj0/3D0XfcO5gLq/DA=;
 b=G/FM61mcLUa425OC9NWcqJo01rDkyCzrPNbl6ZwUgbWRREyVQj63Q+Tq1PiCj6Lu7x
 BKoihsFub8ONKGrlZPbFByqPw1Psu2NsDlOKUCKfmzA5Gy3u/tg5TI221xlxpUCiFU7n
 IamL8dfpDHRck19utdNbbBqK+pJ9XEH+l+YP8weC4mTZerpCCuLW0/cKuzVW8f54q9c2
 USgGL2ht5v4nLRtubvaM5MJgv6JQEyEkmPs7Swt5/SMJF80GTEHMrvAHDicHjynP3dOz
 GSqgT4SjSncCqrgCAaIktcwEZZp6HeRovsDYNVeuy2bAabxyTjww14O/2mL6rh3h8igB
 GCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hmxVmoI76gZ6HFsVjw9FdZncjRj0/3D0XfcO5gLq/DA=;
 b=uBlHj2LnAuqAVTZK5ehfPUtWZyqkrt4QMeDcYzNYInNyEnXcehhzPWvlcGV8C2dJaO
 u1lXPwJKhKYhWBkW3jItt5Phq+avwfSCa9yc4aTar41xY203WffknYrfhXQiAvnjeJhg
 /KqMO/xXLH8cuCjOLv5iXtTnnJX2hYQmsj7LxN753gWidw5/vJdv1XOyZhRuae9hjyIj
 0pGvsphT9SH6Gu16F1irTjIhEHR5s2DSCHGjE1a+D8UvkalkRnJtleNJn9pNPn89pw0d
 KeDT9wF8UFiopr9DwnXKFpEH3tyafpRnx1G6WBkJ9Abv+6KV4elZGRWYWOFnzwYQWMxK
 8iDw==
X-Gm-Message-State: AOAM532eIhHiNQ65pZDynNnZRt37sGxnoutH8zSDBzuBVDJXl9Xoq46G
 Zythx+nEGQiq03EGb1MI+fF2EJPF
X-Google-Smtp-Source: ABdhPJzjP6srZZrUaLYcHv69ySBdYuyymiDsF6iIcaU+PkNrRJZ4jZL8wPGwTWAnueG1WqBg/bMiPQ==
X-Received: by 2002:a1c:305:: with SMTP id 5mr12883454wmd.60.1590842990860;
 Sat, 30 May 2020 05:49:50 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id q128sm3355051wma.38.2020.05.30.05.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2020 05:49:49 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm: vmwgfx: remove drm_driver::master_set() return typ
Date: Sat, 30 May 2020 13:46:39 +0100
Message-Id: <20200530124640.4176323-1-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
 Roland Scheidegger <sroland@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function always returns zero (success). Ideally we'll remove it all
together - although that's requires a little more work.

For now, we can drop the return type and simplify the drm core code
surrounding it.

v2: remove redundant assignment (Sam)

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
VMWare team, I'm planning to push this via drm-misc. Review, ack and
comments are appreciated.
---
 drivers/gpu/drm/drm_auth.c          | 32 +++++++----------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |  8 +++-----
 include/drm/drm_drv.h               |  4 ++--
 3 files changed, 12 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 74ce0c29c960..4c723e3a689c 100644
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
@@ -265,7 +247,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 		goto out_unlock;
 	}
 
-	ret = drm_set_master(dev, file_priv, false);
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
