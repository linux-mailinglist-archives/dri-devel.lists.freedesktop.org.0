Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E0519D57A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 13:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AB76EB66;
	Fri,  3 Apr 2020 11:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4811B6EB66
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 11:06:22 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id j19so7230088wmi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 04:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qtx/Iqz+JAIXNsgzmeDYgYboJyCGubXZKzozvQbZbZ8=;
 b=ScnPM8IufJlWI9sKMslLwuHvPG4qLx8y6wpcE0a8ZEkwQnX4EN8EK5dNHbTcyvZC9T
 pecHUvaz3Kuq7R3IP4JVEuTTJAFlfq7lgCIW2bibjB6IVqsq7DVnelccTi51K8je5iee
 V1lRai7aJ46DtwFK+OxYroc/53RYQB347alYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qtx/Iqz+JAIXNsgzmeDYgYboJyCGubXZKzozvQbZbZ8=;
 b=RzMOGCBlYBXdWogTiwWvqDyKXF8xuJ1S916tg3O8M/bjS5hu1vxmLqpGAv2aDYObd5
 KFcUZ+1jOI0M2UP7NSoaSZ4enIKull6rsBsWF+hzpbg0VT+CdMB2FiQ6XlCw+8qslC85
 ZAyNnT5FEkXJZVz2+WjOr0sq4nTpVw8HaL3EBtekutwJBmTrIHVzlceQ+wMQj1JsXHtT
 Ncao3BG5+IfN0IqjQqSS3HxZHVvVXarpxzMfRv620G4haBOCpvzsBFlaVRnkfA6qXrnt
 Fwj4xpbSEAMqEB+yy/zW16JyCibwElOLOyzF91O9EBdPfHJH3W+6SrfPwYl6crKsDFK6
 IaMg==
X-Gm-Message-State: AGi0PuaJVbz2rV+YqFznk6xvUQ7MCjW+ZzKOtscexNlrXn/t5hQdKxRp
 ZS32j7shgbx0OVOloiJWh0ykPvzCL1XypA==
X-Google-Smtp-Source: APiQypJd3I+K0cW9khBsjFiO1o67rf2BK1Fr4LSGnpabwwMz3Qd00IvIFzhboPqrw4Iyo+wZ9GlGNg==
X-Received: by 2002:a1c:41d6:: with SMTP id o205mr8038190wma.122.1585911977613; 
 Fri, 03 Apr 2020 04:06:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m19sm10011419wml.21.2020.04.03.04.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 04:06:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm: delete drm_pci.h
Date: Fri,  3 Apr 2020 13:06:10 +0200
Message-Id: <20200403110610.2344842-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403110610.2344842-1-daniel.vetter@ffwll.ch>
References: <20200403110610.2344842-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's empty!

After more than 20 years of OS abstraction layer for pci devices, it's
kinda gone now.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_bufs.c               |  2 +-
 drivers/gpu/drm/drm_dma.c                |  2 +-
 drivers/gpu/drm/drm_pci.c                |  1 -
 drivers/gpu/drm/i915/gem/i915_gem_phys.c |  2 --
 drivers/gpu/drm/r128/ati_pcigart.c       |  3 +-
 drivers/gpu/drm/radeon/radeon_drv.c      |  2 +-
 include/drm/drm_pci.h                    | 37 ------------------------
 7 files changed, 5 insertions(+), 44 deletions(-)
 delete mode 100644 include/drm/drm_pci.h

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index dcabf5698333..ef26ac57f039 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -33,6 +33,7 @@
 #include <linux/mm.h>
 #include <linux/mman.h>
 #include <linux/nospec.h>
+#include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/vmalloc.h>
@@ -43,7 +44,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
-#include <drm/drm_pci.h>
 #include <drm/drm_print.h>
 
 #include "drm_legacy.h"
diff --git a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/drm_dma.c
index a7add55a85b4..d07ba54ec945 100644
--- a/drivers/gpu/drm/drm_dma.c
+++ b/drivers/gpu/drm/drm_dma.c
@@ -34,9 +34,9 @@
  */
 
 #include <linux/export.h>
+#include <linux/pci.h>
 
 #include <drm/drm_drv.h>
-#include <drm/drm_pci.h>
 #include <drm/drm_print.h>
 
 #include "drm_legacy.h"
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 131b7a139fda..75e2b7053f35 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -30,7 +30,6 @@
 #include <drm/drm.h>
 #include <drm/drm_agpsupport.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_pci.h>
 #include <drm/drm_print.h>
 
 #include "drm_internal.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 698e22420dc5..7fe9831aa9ba 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -10,8 +10,6 @@
 
 #include <drm/drm.h> /* for drm_legacy.h! */
 #include <drm/drm_cache.h>
-#include <drm/drm_legacy.h> /* for drm_pci.h! */
-#include <drm/drm_pci.h>
 
 #include "gt/intel_gt.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/r128/ati_pcigart.c b/drivers/gpu/drm/r128/ati_pcigart.c
index 9b4072f97215..3e76ae5a17ee 100644
--- a/drivers/gpu/drm/r128/ati_pcigart.c
+++ b/drivers/gpu/drm/r128/ati_pcigart.c
@@ -32,9 +32,10 @@
  */
 
 #include <linux/export.h>
+#include <linux/pci.h>
 
 #include <drm/drm_device.h>
-#include <drm/drm_pci.h>
+#include <drm/drm_legacy.h>
 #include <drm/drm_print.h>
 
 #include "ati_pcigart.h"
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 59f8186a2415..bbb0883e8ce6 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -36,6 +36,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/mmu_notifier.h>
+#include <linux/pci.h>
 
 #include <drm/drm_agpsupport.h>
 #include <drm/drm_crtc_helper.h>
@@ -44,7 +45,6 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
-#include <drm/drm_pci.h>
 #include <drm/drm_pciids.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/include/drm/drm_pci.h b/include/drm/drm_pci.h
deleted file mode 100644
index 1bf31131960e..000000000000
--- a/include/drm/drm_pci.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/*
- * Internal Header for the Direct Rendering Manager
- *
- * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
- * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
- * Copyright (c) 2009-2010, Code Aurora Forum.
- * All rights reserved.
- *
- * Author: Rickard E. (Rik) Faith <faith@valinux.com>
- * Author: Gareth Hughes <gareth@valinux.com>
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef _DRM_PCI_H_
-#define _DRM_PCI_H_
-
-#include <linux/pci.h>
-
-#endif /* _DRM_PCI_H_ */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
