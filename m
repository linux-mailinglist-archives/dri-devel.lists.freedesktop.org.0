Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A338735577F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 17:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4931B6E838;
	Tue,  6 Apr 2021 15:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674F26E838;
 Tue,  6 Apr 2021 15:14:47 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id a12so10653310pfc.7;
 Tue, 06 Apr 2021 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=adjFIDH7suKAxSkAUsA7mNQ1QGbjr8xmyHwuNOjmpYI=;
 b=h17bzcrHd+TvJspel47YuVDoHGvfLePIE+BJJnF4Bx9PwypKbzcDPTyx8aLat9ZG/k
 j8KHDiJbHUnPYbEOvwEJ97+DmQH7HcbWrJgEV/q8cmARbot1g2MiMuoiySGDZtdHY8qr
 pudIuLHnIzFnxkMaf64mTk2UpDAxAQwSmSJHaPNwfxE9aVx+Bf2+r30XirKXZFLtLG/P
 GiGHdKA48WWGZcfbfOkj2Jrhb4Xc/WyWyszuPBUCNa9iU6T72sRdBqduVxjcB+71UMQU
 tnAy+TQdMIFGiFFM7iv3ElOkD1aOINngTcw4HIuM2vFuZUoSVherFfw1QYDqsbCIWzmZ
 qoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=adjFIDH7suKAxSkAUsA7mNQ1QGbjr8xmyHwuNOjmpYI=;
 b=Vvk2L/YYpB2ORj91ehB6x5UAEkKu/kE6kKAeLFHfDywmr4rQzh8Psjmmtj8z6Id7zC
 s13ZM9+vcxfYXNO/RA4JFm+NlxvgzeFjqMzEXIPb8gUgKn9HMPkEdxNhDKCEqwW24D4c
 +iuFsG2NW5kIbaZRD4VzFXJHwne5fxtROmB5iBveMs8w9RouQV6sw6EICMIJBoSwziSi
 LqRpId+PIhmBW9sYa83LbRppWPmsf8z8gLnZaSLKUiSFmZGCKeKzaGeMb3H7lRYKFAdH
 y58BXTXo2XNmmRkTVrupxP1L6RHlX1+/K2pfek5YEWJ/REwHIcVPmk3FQFgvpHWzL7j/
 P3Bg==
X-Gm-Message-State: AOAM530SFnwGIRcldmTEHANBQVFJ4NoAIFbRvoz9MEFVHYXoBIDS1yMD
 t9DkvpxydtjcrTDlOHZqImVOf0vsYOqFYg==
X-Google-Smtp-Source: ABdhPJzvaEMLJToUkLeuDRQNFBCCD4L+4pvaUDDz/fltxXoMhW+vGas9eqdV8ud8+qrOMfCsqCL97g==
X-Received: by 2002:a62:e20b:0:b029:23d:f634:e70e with SMTP id
 a11-20020a62e20b0000b029023df634e70emr4177879pfi.70.1617722086264; 
 Tue, 06 Apr 2021 08:14:46 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 12sm18286485pgw.18.2021.04.06.08.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:14:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix spelling "purgable" -> "purgeable"
Date: Tue,  6 Apr 2021 08:18:16 -0700
Message-Id: <20210406151816.1515329-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The previous patch fixes the user visible spelling.  This one fixes the
code.  Oops.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          | 12 ++++++------
 drivers/gpu/drm/msm/msm_gem.h          | 16 ++++++++--------
 drivers/gpu/drm/msm/msm_gem_shrinker.c |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9568d551f7de..3c0b384a8984 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -821,14 +821,14 @@ static void update_inactive(struct msm_gem_object *msm_obj)
 	WARN_ON(msm_obj->active_count != 0);
 
 	if (msm_obj->dontneed)
-		mark_unpurgable(msm_obj);
+		mark_unpurgeable(msm_obj);
 
 	list_del(&msm_obj->mm_list);
 	if (msm_obj->madv == MSM_MADV_WILLNEED) {
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
 	} else if (msm_obj->madv == MSM_MADV_DONTNEED) {
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
-		mark_purgable(msm_obj);
+		mark_purgeable(msm_obj);
 	} else {
 		WARN_ON(msm_obj->madv != __MSM_MADV_PURGED);
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_purged);
@@ -901,8 +901,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		madv = " purged";
 		break;
 	case MSM_MADV_DONTNEED:
-		stats->purgable.count++;
-		stats->purgable.size += obj->size;
+		stats->purgeable.count++;
+		stats->purgeable.size += obj->size;
 		madv = " purgeable";
 		break;
 	case MSM_MADV_WILLNEED:
@@ -984,7 +984,7 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 	seq_printf(m, "Active:    %4d objects, %9zu bytes\n",
 			stats.active.count, stats.active.size);
 	seq_printf(m, "Purgeable: %4d objects, %9zu bytes\n",
-			stats.purgable.count, stats.purgable.size);
+			stats.purgeable.count, stats.purgeable.size);
 	seq_printf(m, "Purged:    %4d objects, %9zu bytes\n",
 			stats.purged.count, stats.purged.size);
 }
@@ -1003,7 +1003,7 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 
 	mutex_lock(&priv->mm_lock);
 	if (msm_obj->dontneed)
-		mark_unpurgable(msm_obj);
+		mark_unpurgeable(msm_obj);
 	list_del(&msm_obj->mm_list);
 	mutex_unlock(&priv->mm_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7c7d54bad189..13ebecdd70f4 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -163,7 +163,7 @@ struct msm_gem_stats {
 	struct {
 		unsigned count;
 		size_t size;
-	} all, active, purgable, purged;
+	} all, active, purgeable, purged;
 };
 
 void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
@@ -207,8 +207,8 @@ static inline bool is_active(struct msm_gem_object *msm_obj)
 	return msm_obj->active_count;
 }
 
-/* imported/exported objects are not purgable: */
-static inline bool is_unpurgable(struct msm_gem_object *msm_obj)
+/* imported/exported objects are not purgeable: */
+static inline bool is_unpurgeable(struct msm_gem_object *msm_obj)
 {
 	return msm_obj->base.dma_buf && msm_obj->base.import_attach;
 }
@@ -216,7 +216,7 @@ static inline bool is_unpurgable(struct msm_gem_object *msm_obj)
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
 {
 	return (msm_obj->madv == MSM_MADV_DONTNEED) && msm_obj->sgt &&
-			!is_unpurgable(msm_obj);
+			!is_unpurgeable(msm_obj);
 }
 
 static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
@@ -225,13 +225,13 @@ static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
 	return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
 }
 
-static inline void mark_purgable(struct msm_gem_object *msm_obj)
+static inline void mark_purgeable(struct msm_gem_object *msm_obj)
 {
 	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
 
 	WARN_ON(!mutex_is_locked(&priv->mm_lock));
 
-	if (is_unpurgable(msm_obj))
+	if (is_unpurgeable(msm_obj))
 		return;
 
 	if (WARN_ON(msm_obj->dontneed))
@@ -241,13 +241,13 @@ static inline void mark_purgable(struct msm_gem_object *msm_obj)
 	msm_obj->dontneed = true;
 }
 
-static inline void mark_unpurgable(struct msm_gem_object *msm_obj)
+static inline void mark_unpurgeable(struct msm_gem_object *msm_obj)
 {
 	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
 
 	WARN_ON(!mutex_is_locked(&priv->mm_lock));
 
-	if (is_unpurgable(msm_obj))
+	if (is_unpurgeable(msm_obj))
 		return;
 
 	if (WARN_ON(!msm_obj->dontneed))
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 33a49641ef30..7101ca881ae1 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -49,7 +49,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		/*
 		 * Now that we own a reference, we can drop mm_lock for the
 		 * rest of the loop body, to reduce contention with the
-		 * retire_submit path (which could make more objects purgable)
+		 * retire_submit path (which could make more objects purgeable)
 		 */
 
 		mutex_unlock(&priv->mm_lock);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
