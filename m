Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F67163ECC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682966EAAC;
	Wed, 19 Feb 2020 08:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B0D6EA59
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 17:28:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w12so24963789wrt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 09:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zS4ft/vYKXfE+WleANo6vegk5u6xXjxUfiyGUHRUqRQ=;
 b=pGq8d6zwYjI+mQ8QceGCxr+PYF4+sY/8o7MKXhSYEtFsh3Nid96TVjuWpqbhbWrsq3
 VcC16WuLlI64bW2I99sbde/ZvK2hUlUqyc5ohpZFEuEc1KwE6YzriPJaSbE21HnM2DZG
 hWYDyojjafNov+pYyrxUFeTvw7PbrLFy4EceYgXNeE77/2HQNEpP8dqZt+KcgX7PZlAw
 Os0pCO/kkeAv+AUQD6COIADNj6qpTydR30o/F9+LXZo/twTAt6GHx+He9UogRiRR8ICW
 S2sATrpiY/ftoJ94+N3mykphyzwKFput3dIrOIULe3pY6+NKQ0k5Zhz8VudbvZ3NEhBZ
 /6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zS4ft/vYKXfE+WleANo6vegk5u6xXjxUfiyGUHRUqRQ=;
 b=oFsGtDTgvOcH6gIoX19t1iX2bGbyyov7kWxuCSPlQm3nWuJTrZlWJXiCmTvvOhrCvN
 xcys/Aud5C7FhB5OhPj6UDSFflJhJ+TRqYwl32nSnabDJQqxPlwtrPKLovNDD8vp7L1L
 HHI/GU9uJzRebW3KLQZy+RQBH2Ddu6lb6c4RyZFakwu5DuNFZxiEclKObu/56FkZ9n14
 TzOOre8kU33qTPL3lOx8soVSMYHYXxzxs+Utebs14jp34HjvuQA/WtD3uZF1ZG0M0MR0
 W3Fiy2mUqjlJunsY0BH9oUOJylDpBbg2uG6dHCTAw8hNGYRc1XRGo8J9EOTNvANkB7fp
 XUig==
X-Gm-Message-State: APjAAAWUoheNT5Bg5C7liE7nl09B0SX5BqczRUIjOONImYsnXCG/MK/X
 RVRE9yirPAoBxg5CklHvvyA=
X-Google-Smtp-Source: APXvYqwEG3yaKNXCA6VkkFFEcJLRAXQz5aVgp9S+xFNUYZCzMbVvk0wpBhd3k2EsPTbUCsiJmYVicg==
X-Received: by 2002:a5d:6087:: with SMTP id w7mr29565396wrt.36.1582046919627; 
 Tue, 18 Feb 2020 09:28:39 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t13sm6998757wrw.19.2020.02.18.09.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 09:28:39 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/2] drm/debugfs: remove checks for return value of
 drm_debugfs functions.
Date: Tue, 18 Feb 2020 20:28:14 +0300
Message-Id: <20200218172821.18378-3-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218172821.18378-1-wambui.karugax@gmail.com>
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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

As there is no need to check the return value of
drm_debugfs_create_files, remove unnecessary checks and error handling
statement blocks.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/drm_debugfs.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4e673d318503..6a2f141b6a38 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -215,35 +215,17 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	sprintf(name, "%d", minor_id);
 	minor->debugfs_root = debugfs_create_dir(name, root);
 
-	ret = drm_debugfs_create_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES,
-				       minor->debugfs_root, minor);
-	if (ret) {
-		debugfs_remove(minor->debugfs_root);
-		minor->debugfs_root = NULL;
-		DRM_ERROR("Failed to create core drm debugfs files\n");
-		return ret;
-	}
+	drm_debugfs_create_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES,
+				 minor->debugfs_root, minor);
 
 	if (drm_drv_uses_atomic_modeset(dev)) {
-		ret = drm_atomic_debugfs_init(minor);
-		if (ret) {
-			DRM_ERROR("Failed to create atomic debugfs files\n");
-			return ret;
-		}
+		drm_atomic_debugfs_init(minor);
 	}
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
-		ret = drm_framebuffer_debugfs_init(minor);
-		if (ret) {
-			DRM_ERROR("Failed to create framebuffer debugfs file\n");
-			return ret;
-		}
+		drm_framebuffer_debugfs_init(minor);
 
-		ret = drm_client_debugfs_init(minor);
-		if (ret) {
-			DRM_ERROR("Failed to create client debugfs file\n");
-			return ret;
-		}
+		drm_client_debugfs_init(minor);
 	}
 
 	if (dev->driver->debugfs_init) {
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
