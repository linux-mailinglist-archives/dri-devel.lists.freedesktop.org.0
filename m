Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4317180C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EC96ECB3;
	Thu, 27 Feb 2020 12:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978FF6EC94
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:03:02 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t23so3259768wmi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4fFxtd2alUAmDwPqREqD0hmlK9QgvDgPrbdGklXtT8Q=;
 b=kEOqiWPcKOo2uudX4IJh02QKkSzl+Yj6CrbhJNJsBDkpi/BKDKUsJXQZlC+BeybXc9
 LrzQ752Bg/EVv6ae+ab93XL/7ZBBY1pRJCrN1rY9Lewu85ppogh1mna0z7fed2zF7p7R
 Vkl84PFvXCQYfnFmDwdnfY5CVx/5qWGxxM+7GCvR7izZmVbu3zfpFsal+VzSz1yB/pHd
 +bvkPw3gJoDd/wYKyuEgIFn28eSEV+Nowg7yBrXPlud1eki3NpOSoxSijbQK8SQmKpEW
 Pbk947uhgltMnciutcWElWAuSn7k4Z9bgsnFBdVvaDRcG57jlg1bfGLVbaRu7Xcay7Wb
 Sg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4fFxtd2alUAmDwPqREqD0hmlK9QgvDgPrbdGklXtT8Q=;
 b=QlLNzjZuCEmi65cX7HF0a+oUPEyKJ/dQ04qeMx/ZjjslkCaaMMEoX81VWov52vx4YV
 JJntJ7n49knYBHbwTrbnp1JxR33bCT9QzkX7sV7GfcDWbaRc6Iygj7gXB2XYOORIxK3v
 Rn+Y4L/NpcdBJomRuvGhdVGFthYOGs6L6j29pdsSvORLGfvQ0xsekshJjHHcN8Yj3YCJ
 3b+GPB3HnjZUsHTcQBpwGFdqqv1UKMPTVjyH5ld+fw3XUha7ZyOUmuSBJxiemrBPgcKP
 fYyUUD+S0XoLAIqqzWUSVAr15yFKqO8cu2EhnnJ4Bu4IhNq7MvBrss6+eR3LRK0gld6y
 mwEw==
X-Gm-Message-State: APjAAAWwEWh1jgJq5uEYhlwekNxEMIQJ8TqXwutdTcH1k1PbTLFc2O/2
 3Ad7X5aMNvWqhQ2AmddN7eI=
X-Google-Smtp-Source: APXvYqwEY8Y+d/oV+yJH9lF9a946Az5Xl87bfcopNONxFys9u3gI6iu4vbW3C0rxP+gtf+eEVkXJJw==
X-Received: by 2002:a05:600c:218d:: with SMTP id
 e13mr5108729wme.102.1582804981274; 
 Thu, 27 Feb 2020 04:03:01 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:00 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch,
	airlied@linux.ie,
	Eric Anholt <eric@anholt.net>
Subject: [PATCH 05/21] drm/vc4: remove check of return value of drm_debugfs
 functions
Date: Thu, 27 Feb 2020 15:02:16 +0300
Message-Id: <20200227120232.19413-6-wambui.karugax@gmail.com>
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
fails and should return void. Therefore, remove unnecessary check and
error handling for the return value of drm_debugfs_create_files()
in vc4_debugfs_init().

This change also allows vc4_debugfs_init() to be declared as void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_debugfs.c | 11 +++--------
 drivers/gpu/drm/vc4/vc4_drv.h     |  2 +-
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index b61b2d3407b5..4fbbf980a299 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -20,7 +20,7 @@ struct vc4_debugfs_info_entry {
  * Called at drm_dev_register() time on each of the minors registered
  * by the DRM device, to attach the debugfs files.
  */
-int
+void
 vc4_debugfs_init(struct drm_minor *minor)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(minor->dev);
@@ -30,14 +30,9 @@ vc4_debugfs_init(struct drm_minor *minor)
 			    minor->debugfs_root, &vc4->load_tracker_enabled);
 
 	list_for_each_entry(entry, &vc4->debugfs_list, link) {
-		int ret = drm_debugfs_create_files(&entry->info, 1,
-						   minor->debugfs_root, minor);
-
-		if (ret)
-			return ret;
+		drm_debugfs_create_files(&entry->info, 1,
+					 minor->debugfs_root, minor);
 	}
-
-	return 0;
 }
 
 static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index f90c0d08e740..cd0f9ef41fa2 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -750,7 +750,7 @@ void vc4_crtc_get_margins(struct drm_crtc_state *state,
 			  unsigned int *top, unsigned int *bottom);
 
 /* vc4_debugfs.c */
-int vc4_debugfs_init(struct drm_minor *minor);
+void vc4_debugfs_init(struct drm_minor *minor);
 #ifdef CONFIG_DEBUG_FS
 void vc4_debugfs_add_file(struct drm_device *drm,
 			  const char *filename,
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
