Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F227E81E5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 19:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83B510E16E;
	Fri, 10 Nov 2023 18:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6D910E16E;
 Fri, 10 Nov 2023 18:42:18 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1cc1e1e74beso20988195ad.1; 
 Fri, 10 Nov 2023 10:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699641738; x=1700246538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DowCvdW0pDIOEX7tuv7ZCgDtza6+DGAzWVpe/6IiP+A=;
 b=JBTNgeJbAGKWEdb4bwz5s5z41yqDyonBeLyJE/koHoG4nmd17K1jcrSazw7Ma948/h
 2CLS3wdBVKa1LYOeKRMfo9qGNZYHMKdpesHr7Pv1RXBkcW31vWufhtsyRT6i44SFTDUU
 wlGl80pX/KTaAJ7cGlvfxrN+BsVY1fdrAzi5QL81NG2cq1TfJEP4wusnnEXRk6XRWA5j
 Ko0BO4UvFCeF4WskJ0R4fpvTkzsOBr+neDpr//C2Jv7RQUGObu/nWfTFAfV7wKtme1dv
 DK19qIPrpa63IS/YswvWiJ1RgPLlCtIqoTZ9Zsail63O/00rUnhrHpYHVcJW0T39Q1TI
 85RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699641738; x=1700246538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DowCvdW0pDIOEX7tuv7ZCgDtza6+DGAzWVpe/6IiP+A=;
 b=C0ezVIt27GopZm02iw/ib1C0RZJA/a7VERNtSaPNOJqQaJ9iQ5VOVI/IbktXJBIkNz
 DuVq8i5FxbgfaEAxtir6D3pD4gpYlYiWkNtq5L2tuwL360szQF+LVijX2N50hfGKUNwo
 lQOG/AiiOYti2RcaHrKiYie5fcqcx4bW6hg65oibMD2UubBE4hMH4YXncIGA0zbL0Z9v
 8doqf2vbJ/mIH0jKapHQf9eb7xUfxfA2BSr1RsfNlDg/WWXqggsGVRsVn5lH55mjQDJC
 h/qVYtD9b6Lkrv/RQwhBaNd7SehUNfI7b9QQDCeKnbr+CeRbFCEOArQYziuOqFXJDrbT
 K+GA==
X-Gm-Message-State: AOJu0YwDxIkvMyp8EOPV5qMAt8vW96c7+xfAQRsxPzoi/LjDrfyDe3zY
 s8SMPNCdCK+VvTN5xrHcaSc=
X-Google-Smtp-Source: AGHT+IEaHe6OpOyydZLuU/Eb6sIh2hJuHc+75WIRpZyaHbDGrKlsVr40ZUBVLX6h23BIrXqUvDQHQg==
X-Received: by 2002:a17:902:d484:b0:1c9:bca2:d653 with SMTP id
 c4-20020a170902d48400b001c9bca2d653mr110956plg.11.1699641737756; 
 Fri, 10 Nov 2023 10:42:17 -0800 (PST)
Received: from anfanite396-Predator-PH315-51.gateway.iitmandi.ac.in
 ([14.139.34.151]) by smtp.gmail.com with ESMTPSA id
 y12-20020a170902ed4c00b001b86dd825e7sm5705495plb.108.2023.11.10.10.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 10:42:17 -0800 (PST)
From: Dipam Turkar <dipamt1729@gmail.com>
To: jani.nikula@linux.intel.com
Subject: [PATCH v2] Remove custom dumb_map_offset implementations in i915
 driver
Date: Sat, 11 Nov 2023 00:11:27 +0530
Message-Id: <20231110184126.712310-1-dipamt1729@gmail.com>
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
Cc: tvrtko.ursulin@linux.intel.com, Dipam Turkar <dipamt1729@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Making i915 use drm_gem_create_mmap_offset() instead of its custom
implementations for associating GEM object with a fake offset.

Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 21 ---------------------
 drivers/gpu/drm/i915/gem/i915_gem_mman.h |  4 ----
 drivers/gpu/drm/i915/i915_driver.c       |  3 ++-
 3 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index aa4d842d4c5a..71d621a1f249 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -771,27 +771,6 @@ __assign_mmap_offset_handle(struct drm_file *file,
 	return err;
 }
 
-int
-i915_gem_dumb_mmap_offset(struct drm_file *file,
-			  struct drm_device *dev,
-			  u32 handle,
-			  u64 *offset)
-{
-	struct drm_i915_private *i915 = to_i915(dev);
-	enum i915_mmap_type mmap_type;
-
-	if (HAS_LMEM(to_i915(dev)))
-		mmap_type = I915_MMAP_TYPE_FIXED;
-	else if (pat_enabled())
-		mmap_type = I915_MMAP_TYPE_WC;
-	else if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
-		return -ENODEV;
-	else
-		mmap_type = I915_MMAP_TYPE_GTT;
-
-	return __assign_mmap_offset_handle(file, handle, mmap_type, offset);
-}
-
 /**
  * i915_gem_mmap_offset_ioctl - prepare an object for GTT mmap'ing
  * @dev: DRM device
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.h b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
index 196417fd0f5c..253435795caf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
@@ -20,10 +20,6 @@ struct mutex;
 int i915_gem_mmap_gtt_version(void);
 int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 
-int i915_gem_dumb_mmap_offset(struct drm_file *file_priv,
-			      struct drm_device *dev,
-			      u32 handle, u64 *offset);
-
 void __i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
 void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index d50347e5773a..48d7e53c49d6 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -42,6 +42,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
@@ -1826,7 +1827,7 @@ static const struct drm_driver i915_drm_driver = {
 	.gem_prime_import = i915_gem_prime_import,
 
 	.dumb_create = i915_gem_dumb_create,
-	.dumb_map_offset = i915_gem_dumb_mmap_offset,
+	.dumb_map_offset = drm_gem_dumb_map_offset,
 
 	.ioctls = i915_ioctls,
 	.num_ioctls = ARRAY_SIZE(i915_ioctls),
-- 
2.34.1

