Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D2C171810
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAAE6ECB0;
	Thu, 27 Feb 2020 12:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE4A6EC96
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:03:50 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a141so3109447wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/F7RIx+9SUwwtWwjcWvQf8uTf1pG7IKUNhe5nQ/dsk=;
 b=DjF8bSXaPpeF2aqQW2zM7PDB8yZEaM3Omcoznwdy+f9o7qu5S8yJHsMua/+2do8sDC
 H1My8KuIBQwkcwdY+fUS11dDsMdZlxhvYWjHO/yOgJxQXq37jItgmOjFQVy9v4ZToabc
 EMMUjf8FeAb8o8sdlyJTyPmYm+quXJ+AJtoajWX9gIebljiftnUIjG+MNHld1zGGkbBj
 W828gAnoDWOCqwF8OH4ts3bPhGIsShQmLxCMbbzYdIpYVWteH2zVYF6i5CJ+Z8vsDl5E
 eB7GUUUP9l4btMnTrTCrh3LJzE8SLunOCi/0K0EdbiyTmELdt1I9pSRdMRo+3D7vavM+
 9qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/F7RIx+9SUwwtWwjcWvQf8uTf1pG7IKUNhe5nQ/dsk=;
 b=m3pilpwnIFm5X9FBTpAxXrTeXkDYtXww6EB8/nkEOB6mIOdXkKRJv75j91rJ9fSgCb
 HRyb7lUQu4tL2eiWV0lyj7NzLQRW78mZYP8kmI+tMK+TXCWq/xIoDjMsgUpms8iOMi5r
 l3kqtFndGO6eI204p26WeYP/dQcI7tnXYmXZvZ3cIZJvEVzoOR/wNBa/m+fByb3AUg0V
 G11H+X/F7mtyLbLUmIN8qqDgSsOvz4n/xPS81aITD7AmmJAk7GMrC4uZARKIhpw2sK69
 F1PPi53UrsICwi5HBw2QWRJol2Pc0R/Q8EliCeML6uJpPZSQ01rznhIzWWYTVsufe6nN
 ENRQ==
X-Gm-Message-State: APjAAAVkLyYDJOaNfYwrOQU0CVUbTli2wWuccR5/PnPCztsVXHpuvaoh
 pgZLeINGOgi0wsTJV1I1smA=
X-Google-Smtp-Source: APXvYqw2m6lnhgwdcVIy5+XBGvgEz0kXIyQsiTFpaxOh0RoL419orS6n6MJ5JhIrZMuOETmKv+1A/Q==
X-Received: by 2002:a1c:25c6:: with SMTP id l189mr5018868wml.104.1582805029054; 
 Thu, 27 Feb 2020 04:03:49 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:48 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 17/21] drm/tilcdc: remove check for return value of debugfs
 functions.
Date: Thu, 27 Feb 2020 15:02:28 +0300
Message-Id: <20200227120232.19413-18-wambui.karugax@gmail.com>
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
fails. Therefore, remove the check and error handling of the return
value of drm_debugfs_create_files() as it is not needed in
tilcdc_debugfs_init().

Also remove local variables that are not used after the changes, and
declare tilcdc_debugfs_init() as void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 0791a0200cc3..78c1877d13a8 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -478,26 +478,17 @@ static struct drm_info_list tilcdc_debugfs_list[] = {
 		{ "mm",   tilcdc_mm_show,   0 },
 };
 
-static int tilcdc_debugfs_init(struct drm_minor *minor)
+static void tilcdc_debugfs_init(struct drm_minor *minor)
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
-
-	if (ret) {
-		dev_err(dev->dev, "could not install tilcdc_debugfs_list\n");
-		return ret;
-	}
-
-	return ret;
 }
 #endif
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
