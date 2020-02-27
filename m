Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 427D9171816
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693B06ECC4;
	Thu, 27 Feb 2020 12:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982776E885;
 Thu, 27 Feb 2020 12:03:20 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z12so3231371wmi.4;
 Thu, 27 Feb 2020 04:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FF1NrpSPuilvGFuBlDAjCo1EkW/20qE/sk6srnRxdwk=;
 b=hqt0uVTKwEJgrrFViTZSdoN5IyrDGa0MnWpSVpKfzAJ/q4CYucez5Y9GL9cyO3mkIX
 uPhquZ+n6+onWBaMCPga9B+8QCHT5lbST/AIoFCjP/z9QjtWBRQwCNFykzvp+giIIxHx
 ftcx33fAul6ms0T/zjnHYprjSfmeXBZ6+Zf3xUPDcfzQYs4saNULJTigGrxmo+Zt4VWb
 n5F9x6L3itJsG4d9F4cotAAY35c3wH6JIb3TN1Zi5s5loMOSTEw0XMGVtQFlu+HfXvpt
 Hep3CCkcw9XCJxyArNAUaSfdnFIqgdAY//zqMW3nDOggIgF5Bnjhu41nBBSm7noCtzFP
 Xh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FF1NrpSPuilvGFuBlDAjCo1EkW/20qE/sk6srnRxdwk=;
 b=M/XOUlhgyiKfSfuQbe4/jLKLuK2y3EfipituZu4Ba976Hjn2drpLjk987r+piEkIGe
 9alVZRdJZgCQp5brZAFE0Y9gVvpJ0YeZ2g8OMOlYzYZoqKo4WlPNwgas0byWoU6udP20
 KZs0j87ciC9rqtSuiNAhVl21mohIK3FsZ6tdqrXEAeYfyE2q1BkKeX1jzOCGkRrJxeVZ
 rAmsJsUW1JZESVjwhDi4gMmFMR+hRcKHzZ/GcalFJsbTxfQchgCMCvt02WhwQWXtJ7t5
 FvRG3xg8vcsXU/5b3/GF7hZE0rEiEJA2ob+Kj0N0+sJDhywVcOJxL4XVl7irTwR5YA18
 /CnA==
X-Gm-Message-State: APjAAAX6RbEDqKIuctVFOMIfo3E27gzVpE+bGcacR4Btaz1d2umGmSm7
 2spy7dI5BY/S+hJc/k3GUN0=
X-Google-Smtp-Source: APXvYqxaNmMPo4uh3u7cD404NdTjAHMYEUcbV9NVopmZg+bCAqm3J+SaBK6YQlOOsAh9UdiCZSuDXg==
X-Received: by 2002:a05:600c:218d:: with SMTP id
 e13mr5110294wme.102.1582804998319; 
 Thu, 27 Feb 2020 04:03:18 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:17 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch,
	airlied@linux.ie,
	bskeggs@redhat.com
Subject: [PATCH 09/21] drm/nouveau: remove checks for return value of debugfs
 functions
Date: Thu, 27 Feb 2020 15:02:20 +0300
Message-Id: <20200227120232.19413-10-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227120232.19413-1-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), there is no need to ever check
for the the return value of debugfs_create_file() and
drm_debugfs_create_files(). Therefore, remove unnecessary checks and
error handling in nouveau_drm_debugfs_init.

These changes also enable nouveau_drm_debugfs_init() to be declared
as void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 26 +++++++++--------------
 drivers/gpu/drm/nouveau/nouveau_debugfs.h |  5 ++---
 2 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 7dfbbbc1beea..63cb5e432f8a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -217,39 +217,33 @@ static const struct nouveau_debugfs_files {
 	{"pstate", &nouveau_pstate_fops},
 };
 
-int
+void
 nouveau_drm_debugfs_init(struct drm_minor *minor)
 {
 	struct nouveau_drm *drm = nouveau_drm(minor->dev);
 	struct dentry *dentry;
-	int i, ret;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++) {
-		dentry = debugfs_create_file(nouveau_debugfs_files[i].name,
-					     S_IRUGO | S_IWUSR,
-					     minor->debugfs_root, minor->dev,
-					     nouveau_debugfs_files[i].fops);
-		if (!dentry)
-			return -ENOMEM;
+		debugfs_create_file(nouveau_debugfs_files[i].name,
+				    S_IRUGO | S_IWUSR,
+				    minor->debugfs_root, minor->dev,
+				    nouveau_debugfs_files[i].fops);
 	}
 
-	ret = drm_debugfs_create_files(nouveau_debugfs_list,
-				       NOUVEAU_DEBUGFS_ENTRIES,
-				       minor->debugfs_root, minor);
-	if (ret)
-		return ret;
+	drm_debugfs_create_files(nouveau_debugfs_list,
+				 NOUVEAU_DEBUGFS_ENTRIES,
+				 minor->debugfs_root, minor);
 
 	/* Set the size of the vbios since we know it, and it's confusing to
 	 * userspace if it wants to seek() but the file has a length of 0
 	 */
 	dentry = debugfs_lookup("vbios.rom", minor->debugfs_root);
 	if (!dentry)
-		return 0;
+		return;
 
 	d_inode(dentry)->i_size = drm->vbios.length;
 	dput(dentry);
-
-	return 0;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.h b/drivers/gpu/drm/nouveau/nouveau_debugfs.h
index 8909c010e8ea..ccb842d9da87 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.h
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.h
@@ -18,14 +18,13 @@ nouveau_debugfs(struct drm_device *dev)
 	return nouveau_drm(dev)->debugfs;
 }
 
-extern int  nouveau_drm_debugfs_init(struct drm_minor *);
+extern void nouveau_drm_debugfs_init(struct drm_minor *);
 extern int  nouveau_debugfs_init(struct nouveau_drm *);
 extern void nouveau_debugfs_fini(struct nouveau_drm *);
 #else
-static inline int
+static inline void
 nouveau_drm_debugfs_init(struct drm_minor *minor)
 {
-       return 0;
 }
 
 static inline int
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
