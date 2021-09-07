Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F14024D0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 10:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A3C89D53;
	Tue,  7 Sep 2021 08:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8D6899D6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:01:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso1088144wmb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zajWujuBFDhvR4bfH13b+n++yTBgcdYE78FvWxSPeYE=;
 b=ix0BjHwN4RgI6lNBdcaqiJcLFEiwUXKgIDBMECibUTCU/Qsiz+Va56QCRXZJtO+UNa
 AkM5Cm+RKspa7+tQU1o/gyeJAT81dQkrGtEOzsRRf716zHIZwr2t+lGhcpjskiJF7Mq6
 M0is0/kla7t/Fz0AVRHcASNOTpMAsifyFHcR1RWECTMM6MJ1tgFJW2Ukzu7boUijy2tF
 aYid/1663dn0mTYw4EHoSSBt+xR8jljj1SkR1praqsBwRUl+4fBJVpswNy0t9LObTPVJ
 kbJ+ypIKMTHF/JbTg/VzHGUdLdGBMUmAWsDNabwTJ/GcmEhXQmRwsBYoYEokIt5KKVjN
 7BJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zajWujuBFDhvR4bfH13b+n++yTBgcdYE78FvWxSPeYE=;
 b=BdrX1IWplKQHu0F7+hJIOG9ftgOPBQQEvQRmObrwJXZw00zZPFVUCybsuoIXksb4dJ
 QJ9zcUAQz1A590Q+3gmXwUj1PJUqsFAOFkQ+ezb65opaf4YAkpcPMO3cFnaPK/fqT46C
 HXbillxx4Z18XdOmbzj0HIz7VH7m0mgnBeLkbILoTRFpnMMBhK+eJqi3cQ59CDo+gfTw
 c0FSzXBPa3f+TCa/2MDBkquDUW5QvX1qji28yJ+sQ5hB19og3nbjMvpus8nwQr5o68mi
 Z+/Xc9Eywk/Ic3KC7vM8QShPfj0v0SxtLyu28JUZwI7cu1J1QoKUySPbnYiwvznsU0Nd
 XG8w==
X-Gm-Message-State: AOAM531g+UbuBBADb6fUnJMJ/fV3PJY5I7SgMUemYPVxq5BThfell37c
 tpQs6el7Z3Z0Jqkx+J6akaCWiq8EvYcza3P0
X-Google-Smtp-Source: ABdhPJx4/aUYTpzJZavhK3N2Av5QwhZv7WcHVrqNgb6PS1JdDGUNMezIJLGVDOcHirlAFuukP+71EQ==
X-Received: by 2002:a1c:7c12:: with SMTP id x18mr2628877wmc.114.1631001701959; 
 Tue, 07 Sep 2021 01:01:41 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g1sm2248242wmk.2.2021.09.07.01.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:01:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com
Subject: [PATCH 7/8] drm/ttm: enable TTM TT object kerneldoc v2
Date: Tue,  7 Sep 2021 10:01:34 +0200
Message-Id: <20210907080135.101452-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907080135.101452-1-christian.koenig@amd.com>
References: <20210907080135.101452-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the remaining warnings and finally enable this.

v2: add caching enum link

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 Documentation/gpu/drm-mm.rst |  9 +++++++++
 include/drm/ttm/ttm_tt.h     | 11 ++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 1c9930fb5e7d..69c4a20b95d0 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -58,6 +58,15 @@ TTM resource object reference
 .. kernel-doc:: drivers/gpu/drm/ttm/ttm_resource.c
    :export:
 
+TTM TT object reference
+-----------------------
+
+.. kernel-doc:: include/drm/ttm/ttm_tt.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/ttm/ttm_tt.c
+   :export:
+
 The Graphics Execution Manager (GEM)
 ====================================
 
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index e402dab1d0f6..b3963ab12e1f 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -54,7 +54,7 @@ struct ttm_operation_ctx;
  * @dma_address: The DMA (bus) addresses of the pages
  * @swap_storage: Pointer to shmem struct file for swap storage.
  * @pages_list: used by some page allocation backend
- * @caching: The current caching state of the pages.
+ * @caching: The current caching state of the pages, see enum ttm_caching.
  *
  * This is a structure holding the pages, caching- and aperture binding
  * status for a buffer object that isn't backed by fixed (VRAM / AGP)
@@ -126,8 +126,9 @@ int ttm_sg_tt_init(struct ttm_tt *ttm_dma, struct ttm_buffer_object *bo,
 void ttm_tt_fini(struct ttm_tt *ttm);
 
 /**
- * ttm_ttm_destroy:
+ * ttm_tt_destroy:
  *
+ * @bdev: the ttm_device this object belongs to
  * @ttm: The struct ttm_tt.
  *
  * Unbind, unpopulate and destroy common struct ttm_tt.
@@ -148,15 +149,19 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
 /**
  * ttm_tt_populate - allocate pages for a ttm
  *
+ * @bdev: the ttm_device this object belongs to
  * @ttm: Pointer to the ttm_tt structure
+ * @ctx: operation context for populating the tt object.
  *
  * Calls the driver method to allocate pages for a ttm
  */
-int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm, struct ttm_operation_ctx *ctx);
+int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm,
+		    struct ttm_operation_ctx *ctx);
 
 /**
  * ttm_tt_unpopulate - free pages from a ttm
  *
+ * @bdev: the ttm_device this object belongs to
  * @ttm: Pointer to the ttm_tt structure
  *
  * Calls the driver method to free all pages from a ttm
-- 
2.25.1

