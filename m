Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649917EC551
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 15:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B6410E03C;
	Wed, 15 Nov 2023 14:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B20F10E010;
 Wed, 15 Nov 2023 14:30:02 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1cc131e52f1so6974445ad.0; 
 Wed, 15 Nov 2023 06:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700058601; x=1700663401; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GPMvuBHzrnyzsvQOdVNlUdgVRHRy9nrQ04fDZWtnk3k=;
 b=A8JYxoIeoBuWPy3Hby3Caot6cqnkRuaNgfRovOhr+LcuIvRvYeHOkZvXLqwIRCb5Cv
 icwhDZ9W6MTOjUajLaCISjkl/wzOHLxo0UvnxBTZDn2J4YKKsZpTo4jkMYJhi0nh10dd
 F401SjioWwN0AM+H9NJWXJXbGIrRgpQrxUwHMOTHNnpCw0+kp63gp3+1oyDQon1Y8aqW
 a891BC6YYwjrYAMWe8HCi3b/sGCX8jH01YZjifrj5HexMj00Dp9ouHEqKYcemkYm+5IY
 OXqJCu4H7jBajRyckzEkrm5GdIXsVACAF8EFV7Gn670ouMFdMx/9kDeM1fBmmSoMhFQJ
 0QUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700058601; x=1700663401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GPMvuBHzrnyzsvQOdVNlUdgVRHRy9nrQ04fDZWtnk3k=;
 b=kTgerRuG7Q+GY8UrSmwmVzKCs/R91baUoWGmiDP3dijnmFWnQWOSq6Hg+sjQMT4jd8
 Us+8yBelFfwVMARQ+480cNf1x5kydu8ZR1mZVA38hAFJqOBxxy5wOLm4Dws65yjR6595
 mtN+WJzvIalkkW2xizobEtmEkDEMmVK9TCID+e8/gBmIV3Xp1DHnuuv/74UfUoJZ3fW3
 9pIIvMPPIBMnt9klcar8PL7CA3bxsDiV3nOSd2bQ1h4t/z06bZZJjL0lt8n6DCk8L4xC
 kA6jBQO8lmmLwa+PswgHzeO66imopsw0LcV/rNZ6vp7I0XYW2DqxL2SeaAMXfgcTgAEu
 Ysxw==
X-Gm-Message-State: AOJu0YxkpkQS+CPqlRqlI6xrQL0fYxFa13TmzvHz3L2bbdT6X7bnGMXb
 X9ahdc8tPuG69cLix99tXiI=
X-Google-Smtp-Source: AGHT+IHR+sZxIEfC2uUZdghvt6bSSRkjl+Y9PXIX6Xv0Rdgv1JOVM2jGbrua15b2q46+mFVr1Pajzw==
X-Received: by 2002:a17:903:41c8:b0:1cc:47c1:c2cb with SMTP id
 u8-20020a17090341c800b001cc47c1c2cbmr8442197ple.2.1700058601324; 
 Wed, 15 Nov 2023 06:30:01 -0800 (PST)
Received: from anfanite396-Predator-PH315-51.gateway.iitmandi.ac.in
 ([14.139.34.151]) by smtp.gmail.com with ESMTPSA id
 q9-20020a170902dac900b001cc50f67fbasm7429751plx.281.2023.11.15.06.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 06:30:00 -0800 (PST)
From: Dipam Turkar <dipamt1729@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH v2] Remove custom dumb_map_offset implementation in msm driver
Date: Wed, 15 Nov 2023 19:49:29 +0530
Message-Id: <20231115141928.429688-1-dipamt1729@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, Dipam Turkar <dipamt1729@gmail.com>,
 sean@poorly.run, quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make msm use drm_gem_create_map_offset() instead of its custom
implementation for associating GEM object with a fake offset. Since,
we already have this generic implementation, we don't need the custom
implementation and it is better to standardize the code for GEM based
drivers. This also removes the outdated locking leftovers.

Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c |  2 +-
 drivers/gpu/drm/msm/msm_gem.c | 21 ---------------------
 drivers/gpu/drm/msm/msm_gem.h |  2 --
 3 files changed, 1 insertion(+), 24 deletions(-)

Changes in v2:
Modify commit message to include the absence of internal locking leftovers
around allocating a fake offset in msm_gem_mmap_offset() in the generic
implementation drm_gem_create_map_offset().

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index a428951ee539..86a15992c717 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1085,7 +1085,7 @@ static const struct drm_driver msm_driver = {
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
-	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.dumb_map_offset    = drm_gem_dumb_map_offset,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index db1e748daa75..489694ef79cb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -671,27 +671,6 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			MSM_BO_SCANOUT | MSM_BO_WC, &args->handle, "dumb");
 }
 
-int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
-		uint32_t handle, uint64_t *offset)
-{
-	struct drm_gem_object *obj;
-	int ret = 0;
-
-	/* GEM does all our handle to object mapping */
-	obj = drm_gem_object_lookup(file, handle);
-	if (obj == NULL) {
-		ret = -ENOENT;
-		goto fail;
-	}
-
-	*offset = msm_gem_mmap_offset(obj);
-
-	drm_gem_object_put(obj);
-
-fail:
-	return ret;
-}
-
 static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 8ddef5443140..dc74a0ef865d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -139,8 +139,6 @@ struct page **msm_gem_pin_pages(struct drm_gem_object *obj);
 void msm_gem_unpin_pages(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
-int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
-		uint32_t handle, uint64_t *offset);
 void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
-- 
2.34.1

