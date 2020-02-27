Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8881717FE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3EF6ECA3;
	Thu, 27 Feb 2020 12:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6246E885
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:02:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id i10so5727024wmd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LFKRLVR3En2qAyWAFyjSG1BfnWs6i3rEBFI+3Z3Uh14=;
 b=vdInBT6S+Cz7AIQeFEX/HBaX1a273oG5ysqqQNm6tMxsB11TcE6gB7Qk7dSWeJk+dR
 +UdWmHGvW/PT2YtbbK/p6BxPnkCfSkaXP60ZOmuwNesmvONeuAn/hneMI1pfBdhL0pBW
 TtEWwU4gp2vmK/cWYrqWWyGPF0Bk8fmwDpyAWbZly5vhqdXPVAXFR6VGTaNFFo+5S2gh
 DEtiqgzQUC41JK3cQ1LVa+siCwhhbGyvkPuOCbGFoRfVLZtYoc69I/8Ch6159+ee21E3
 2ZPsrUKSFCC2he7B22o8IFsQGT1CcU1NSHwhjNO7XgcfQnaWrOutEdrBvrc0/rf1GOQx
 +chA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LFKRLVR3En2qAyWAFyjSG1BfnWs6i3rEBFI+3Z3Uh14=;
 b=bw+SzOl2OrafN7lA8pRkv6ClXr9l8NIdjGo2sC8Hn+WP8Tw32S6CyU2BVhwgvcVvk4
 F+MTdahT0CFJFzTg2AapJvQvJGd83Jt6Yk40OCniVU2sNbJO1r+3uTj3lK4gyrY1nDW9
 edyzpE7zrEq8+oUOoO+BO6WIxYCotc06S2zpeYyE3fxQ7w0KxhUcWikcMeVP7mykwwXI
 PA0Mr2qdkp3KBzK08Iq4y2CmOcWXzbCo73c0PNIKeCUvWwYV/Cpyrdp8SMqtcB3CB1MR
 V4H/n9tbdxX1oemIuJVzl51hABUzUSc5JUm2zZ7ZIeRWyPI+EOXaqDNkELU8OZ1ijhm1
 Re0w==
X-Gm-Message-State: APjAAAXklfx0+n1bGdkeKIw7ExS3fXJiWMc3wPbBWbU5rKcqdv/jqJSn
 RXFaSIBSp9WuMs6WCYs+lhU=
X-Google-Smtp-Source: APXvYqzgXMIf7d0ygpseoochEgHCgZpMjbGcGRwlunhf+x0Lp5zstDVWt367HgvoaXcO0f8N7F5PJQ==
X-Received: by 2002:a1c:a443:: with SMTP id n64mr4733588wme.141.1582804977474; 
 Thu, 27 Feb 2020 04:02:57 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:02:56 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/21] drm/vram-helper: make drm_vram_mm_debugfs_init() return
 void
Date: Thu, 27 Feb 2020 15:02:15 +0300
Message-Id: <20200227120232.19413-5-wambui.karugax@gmail.com>
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
fails and should return void. Therefore, remove its use as the
return value of drm_vram_mm_debugfs_init(), and have the function
declared as void instead.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 14 ++++----------
 include/drm/drm_gem_vram_helper.h     |  2 +-
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 92a11bb42365..76506bedac11 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1042,20 +1042,14 @@ static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
  *
  * @minor: drm minor device.
  *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
  */
-int drm_vram_mm_debugfs_init(struct drm_minor *minor)
+void drm_vram_mm_debugfs_init(struct drm_minor *minor)
 {
-	int ret = 0;
-
 #if defined(CONFIG_DEBUG_FS)
-	ret = drm_debugfs_create_files(drm_vram_mm_debugfs_list,
-				       ARRAY_SIZE(drm_vram_mm_debugfs_list),
-				       minor->debugfs_root, minor);
+	drm_debugfs_create_files(drm_vram_mm_debugfs_list,
+				 ARRAY_SIZE(drm_vram_mm_debugfs_list),
+				 minor->debugfs_root, minor);
 #endif
-	return ret;
 }
 EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
 
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 0f6e47213d8d..b63bcd1b996d 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -196,7 +196,7 @@ static inline struct drm_vram_mm *drm_vram_mm_of_bdev(
 	return container_of(bdev, struct drm_vram_mm, bdev);
 }
 
-int drm_vram_mm_debugfs_init(struct drm_minor *minor);
+void drm_vram_mm_debugfs_init(struct drm_minor *minor);
 
 /*
  * Helpers for integration with struct drm_device
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
