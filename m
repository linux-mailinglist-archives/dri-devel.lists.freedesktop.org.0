Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA113A0DD5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 09:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810976E044;
	Wed,  9 Jun 2021 07:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE406E21C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:18:55 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id e11so27981759ljn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 10:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8tMohU63OK+0mIKO2fTWMmOOu0c0UzE0fJLOrBflrIo=;
 b=Yf1RE/wLXqJF2VX3Nuh7Lu5a+yBx4gqofJ8OVAGt/Mldb/q1pQGs914YrfWWVoMJbp
 uxZjShVuzVKNRYq6eEaEFbwKyuQlG2N84BX3eEgA2M7dwWONDh2mEBG6X1JXZ13kDLJ0
 +bcSgsIShb4nHeaPw5sk/iTCbdpRll+l/CIxI6kcZpxnMDvsVYBz6xu4InirWhKRXTND
 lS+s4mYSNDUy5Tf/WdBjAkGWACgdBV+UD/fw7LzGaC9Q98QE1p4xW6W1wUB74meFtIVD
 zyDnp/0eGv6sxMjjMAwSso3QqgIFx2ZAOR7LgocTCEf6+pgMUyFmd5AUkT8o1XeOOru2
 wg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8tMohU63OK+0mIKO2fTWMmOOu0c0UzE0fJLOrBflrIo=;
 b=d+ull6kUhp05DTdhv5YovtG/YbRUq4OdzEZk6j0jhdXOIatshabCqTOHlPKBlPOjeF
 1QxvCseqcINAxFpt4h1uhbtnwLObL8iWthueW3zR9etj/9ZebyAlphQR30uYLaRGIJCx
 Ut/jL6VD1EbNpFTKQzUlW6+jHRiarnIj3y5XjXWqlHgiG0NwizUhr1HUlPL/2DacUA7n
 ASekJTtxLcD/n3gvwahPMt/F41NN0ZrC3rN8YP8Vhjg2sL/ecariRr6ZSh7ERTtemXfo
 DImvqMMN4NEu8U/ni/W6pf4PyBTDPin1iKuF5t9X2eRdluIJYKxhQeG/uF5KPoi4sIZv
 Q5Vg==
X-Gm-Message-State: AOAM532rPKhduUzotg7dOGMOnGbwy7htwrznCqDdP3B2Xp/fNG0KZhab
 J96icTFrh81u8AWO4w2LkQb1XePrt9PEdkdqPV1Jq0myB9SWtQ==
X-Google-Smtp-Source: ABdhPJyRhc+TJYn7Iu4QbEBX/GPQxz5rV4hCb5fb/Q4mYQx6N/HsaTVAkHiIvIzFAcpQYtQ5HQjoVVQh0RYifcFBkIc=
X-Received: by 2002:a2e:824c:: with SMTP id j12mr19393669ljh.490.1623172733520; 
 Tue, 08 Jun 2021 10:18:53 -0700 (PDT)
MIME-Version: 1.0
From: Eero Lehtinen <debiangamer2@gmail.com>
Date: Tue, 8 Jun 2021 20:18:42 +0300
Message-ID: <CAHS3B0Fuffcs+25vs7M9FM022thvdy2KNLLq9TZA=JE_5LyD7A@mail.gmail.com>
Subject: [PATCH 1/1] drm/panfrost: remove spamming to syslog
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 09 Jun 2021 07:38:03 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch removes Panfrost spamming messages to syslog that causes a
poor performance and crashes of the Xfce desktop with a Amlogic S912
TV box. See the old bug in:
https://gitlab.freedesktop.org/mesa/mesa/-/issues/3143

Signed-off-by: Eero Lehtinen <debiangamer2 at gmail.com>

--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -36,8 +36,8 @@
     ret = readl_relaxed_poll_timeout_atomic(pfdev->iomem + AS_STATUS(as_nr),
         val, !(val & AS_STATUS_AS_ACTIVE), 10, 1000);

-    if (ret)
-        dev_err(pfdev->dev, "AS_ACTIVE bit stuck\n");
+    //if (ret)
+    //    dev_err(pfdev->dev, "AS_ACTIVE bit stuck\n");

     return ret;
 }

--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -292,8 +292,8 @@
         prot |= IOMMU_NOEXEC;

     sgt = drm_gem_shmem_get_pages_sgt(obj);
-    if (WARN_ON(IS_ERR(sgt)))
-        return PTR_ERR(sgt);
+    //if (WARN_ON(IS_ERR(sgt)))
+    //    return PTR_ERR(sgt);

     mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
            prot, sgt);

--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -660,7 +660,7 @@
         ret = -1;
         if ((status & mask) == BIT(as) && (exception_type & 0xF8) == 0xC0)
             ret = panfrost_mmu_map_fault_addr(pfdev, as, addr);
-
+#if 0
         if (ret)
             /* terminal fault, print info about the fault */
             dev_err(pfdev->dev,
@@ -678,7 +678,7 @@
                 exception_type, panfrost_exception_name(pfdev, exception_type),
                 access_type, access_type_name(pfdev, fault_status),
                 source_id);
-
+#endif
         status &= ~mask;

         /* If we received new MMU interrupts, process them before returning. */

--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -85,8 +85,8 @@

     mutex_unlock(&pfdev->shrinker_lock);

-    if (freed > 0)
-        pr_info_ratelimited("Purging %lu bytes\n", freed << PAGE_SHIFT);
+    // if (freed > 0)
+        // pr_info_ratelimited("Purging %lu bytes\n", freed << PAGE_SHIFT);

     return freed;
 }
