Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2486B163EC6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168BC6E461;
	Wed, 19 Feb 2020 08:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A2D6EA35
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 15:55:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a6so3476835wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 07:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4NYexLpILY60srgmqxAi1etdq+Fbf5QvLbzOYjNBh+0=;
 b=SOBFhU6/pvpE7kBsqMeV/5sQVqvTArYbQxBjoeelE4rU7JNrFx+nsLzvbgg1ksk4fK
 K74P+40eBi906A13+OlVyXs7CkOeChtPVjFHd9VHbiVJJ9kSsTciQv6t7COYuDrEovwR
 hjDw+BUyOqLSaKBFIeR04q/vXQYZVEN+Z3JrrcUXI+Xw7cNkMogyfggomLw/F8wMIIcC
 GN952fQlBB2mIsI4f+Fdu9JP437qPSp8o7a8VJA77Rsrk8kdF6qqwwafHQtvIaXolVOH
 On8tswMWpb11k/23/5VZNq/1Q+BAjyhN3LB6fhv+/QoXnWv7d2ejgvcH+XvH9ZUidvdw
 MAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4NYexLpILY60srgmqxAi1etdq+Fbf5QvLbzOYjNBh+0=;
 b=JbC7I2m+tBqyM+occLOV0mZgOWzM/ScYSH11FiyizYzYmp0A0pBljxTwBqaRDHqwbJ
 cK5xwT7QCCYmEc8YAtXTzUkG6448mW+QNVLzmVuS+7QdPP4mGSnttZj9ccZAu/00fylM
 9mP/aI9Q2ToJTBjSqzoHoMTzQc47m7PyMibmjtOc+H9LWI1cVQ6SdbOsg8gNg1jkx6Cr
 Q3MBFPlGDqZdk0DBLdVFJ0/LTHJjv6Ihl5GLOJXNOoI2TeLVJsj49aazoTrf0bK6cz9A
 E/ERiaT2JyalCfgSxeITkE6hFAmgKBxo9THZzSU7eCdLESz5RBD98r4K+NEEY9L03Y4/
 SURQ==
X-Gm-Message-State: APjAAAXxHdmixovlRCErwEaqk0GgD60g/JejZAoMDHLCNt9buj9aC8MJ
 0HegrhKg/QGxsEhWZ5WkNFg=
X-Google-Smtp-Source: APXvYqzQeydbmzF1uzVvMGaqc4U1nEmFluo014BUKIvhvft/nbFeUljZSSqEAq9NErdKn9IHVccSog==
X-Received: by 2002:a1c:4d07:: with SMTP id o7mr3942001wmh.174.1582041342065; 
 Tue, 18 Feb 2020 07:55:42 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id a9sm6767758wrn.3.2020.02.18.07.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 07:55:41 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jsarha@ti.com, tomi.valkeinen@ti.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/tilcdc: remove check for return value of debugfs
 functions.
Date: Tue, 18 Feb 2020 18:55:34 +0300
Message-Id: <20200218155534.15504-2-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218155534.15504-1-wambui.karugax@gmail.com>
References: <20200218155534.15504-1-wambui.karugax@gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the check and error handling of the return value of
drm_debugfs_create_files as it is not needed in tilcdc_debugfs_init.
Also remove local variables that are not used after the changes.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 0791a0200cc3..3f7071eb9c78 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -480,24 +480,17 @@ static struct drm_info_list tilcdc_debugfs_list[] = {
 
 static int tilcdc_debugfs_init(struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
 	struct tilcdc_module *mod;
-	int ret;
 
-	ret = drm_debugfs_create_files(tilcdc_debugfs_list,
-			ARRAY_SIZE(tilcdc_debugfs_list),
-			minor->debugfs_root, minor);
+	drm_debugfs_create_files(tilcdc_debugfs_list,
+				 ARRAY_SIZE(tilcdc_debugfs_list),
+				 minor->debugfs_root, minor);
 
 	list_for_each_entry(mod, &module_list, list)
 		if (mod->funcs->debugfs_init)
 			mod->funcs->debugfs_init(mod, minor);
 
-	if (ret) {
-		dev_err(dev->dev, "could not install tilcdc_debugfs_list\n");
-		return ret;
-	}
-
-	return ret;
+	return 0;
 }
 #endif
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
