Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1188617180B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212DA6ECAD;
	Thu, 27 Feb 2020 12:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E9C6EC94
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:03:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a5so3259281wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tv1b66VHXsMeh5NR7gAtTfq8XGx1hp57Pkw74uVLNqA=;
 b=szuXZwZCgGMpeKcpOVV11orhHMphZe60+AHcLd7eNz9P3yjVvMzvLiUJiUgshDCHpa
 b69cTkrGMy8WCkJBiF0Zb9E5ZbRLGeC/e0c085g2DAEZemzOtkaGzL72ivfodm71Ot3k
 G2Ts52SAJcX/MLV/0elGr0wDkE5RHTcenvSkcig8StUDKPsOKArtl3c7eAXdr3+/RFpC
 930eX7Ki1OEUEeHkWbpmL6wwZTjwdWtqe2vY+CbqhTslvLFKvqM59hGERsdQGJ03PUYN
 WKll6Yd5JNB5V5JyRJIRjI7TD4fW3UVVws72L+00NiTy40YVPi8y9iYoA0/Khxhp9qaY
 jd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tv1b66VHXsMeh5NR7gAtTfq8XGx1hp57Pkw74uVLNqA=;
 b=tXkFUJ53ccNLDm6s8T/8GmsgsF2hu6FWouVcYOtWyCTSw+kpryND7ajoFmvhk7XP/L
 wYyHC4pSB2uWg2SLuwmKMEY5vr6AmQ8MPTOgjRhINgri5MZ8iUGSzAWg3WJ1Ry1rNdsA
 LmVV2EiJJ+bBNBSvVrBKnMe/Iij5QnEncBUbu5YF+VUytvz/o7Vb6TKIqVhYdTNWr/Us
 7AwJF/gvVJHmytMz6sMloxTQnGSOdDQYMxe8uOQKnv7t1tT7TMQOiV7osjsx59hvN2Rt
 xLQOWwSbGHk3KgIg2TUSzm6IAX1te5eLN72h/ZOqgC7P+MnN4MfAEhj10u6iRuESPz5C
 AbEQ==
X-Gm-Message-State: APjAAAW4MhoxPsXO4Id1E19FijLvBynBn368P06Qak2lLwM36MY4wjWJ
 UX9txfYIIf4Z+5sKgyQoZZTyfQc+dtXDUg==
X-Google-Smtp-Source: APXvYqyZ45URLS4OCvwl7pFZT+ggkw0Dgp9j3XUU0EO03gCbFAzyTvmLPyx+BMGDfIJeegvYHNIrsg==
X-Received: by 2002:a1c:6a17:: with SMTP id f23mr1784802wmc.33.1582805014531; 
 Thu, 27 Feb 2020 04:03:34 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:34 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 13/21] drm/omapdrm: remove checks for return value of
 drm_debugfs functions.
Date: Thu, 27 Feb 2020 15:02:24 +0300
Message-Id: <20200227120232.19413-14-wambui.karugax@gmail.com>
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
drm_debugfs_create_files() never fail), there is no need to ever check
the return value for drm_debugfs_create_files(). Therefore remove the
checks for the return value and subsequent error handling in
omap_debugfs_init().

These changes also enables the changing of omap_debugfs_init() to return
void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/omapdrm/omap_debugfs.c | 29 +++++++-------------------
 drivers/gpu/drm/omapdrm/omap_drv.h     |  2 +-
 2 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
index 34dfb33145b4..b57fbe8a0ac2 100644
--- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
+++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
@@ -80,31 +80,16 @@ static struct drm_info_list omap_dmm_debugfs_list[] = {
 	{"tiler_map", tiler_map_show, 0},
 };
 
-int omap_debugfs_init(struct drm_minor *minor)
+void omap_debugfs_init(struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
-	int ret;
-
-	ret = drm_debugfs_create_files(omap_debugfs_list,
-			ARRAY_SIZE(omap_debugfs_list),
-			minor->debugfs_root, minor);
-
-	if (ret) {
-		dev_err(dev->dev, "could not install omap_debugfs_list\n");
-		return ret;
-	}
+	drm_debugfs_create_files(omap_debugfs_list,
+				 ARRAY_SIZE(omap_debugfs_list),
+				 minor->debugfs_root, minor);
 
 	if (dmm_is_available())
-		ret = drm_debugfs_create_files(omap_dmm_debugfs_list,
-				ARRAY_SIZE(omap_dmm_debugfs_list),
-				minor->debugfs_root, minor);
-
-	if (ret) {
-		dev_err(dev->dev, "could not install omap_dmm_debugfs_list\n");
-		return ret;
-	}
-
-	return ret;
+		drm_debugfs_create_files(omap_dmm_debugfs_list,
+					 ARRAY_SIZE(omap_dmm_debugfs_list),
+					 minor->debugfs_root, minor);
 }
 
 #endif
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index 7c4b66efcaa7..8a1fac680138 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -82,6 +82,6 @@ struct omap_drm_private {
 };
 
 
-int omap_debugfs_init(struct drm_minor *minor);
+void omap_debugfs_init(struct drm_minor *minor);
 
 #endif /* __OMAPDRM_DRV_H__ */
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
