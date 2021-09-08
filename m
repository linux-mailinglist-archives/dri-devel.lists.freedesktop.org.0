Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F780403AA5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355456E1B4;
	Wed,  8 Sep 2021 13:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AB46E1A8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 13:29:44 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1555515wmi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 06:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+AB6ihkeDjtE0bAg4kvmlNC2A2b9lpYgl5ZmZnTx4G0=;
 b=jJOP1VLyxYuNyxBGQoG/5KpM1Hqk1krphuUpBhlTgXKNmN62swkj3thlgxIFfgj/cO
 7qoRoy6xwuU3XIarsu3kj6sVcTJ7cQH10q10zRR8CQSipCnxkGPX8p0xTzB4kJdeqklQ
 LdqlOH6IujCJVdT18kyg6feLZ0yA51+UojSE97jFMLsDsh3xh4RzoMHD179TF6g5osXQ
 OMul6AVTSVrZvOBxT/teHIGBgVPWHTMzEpo+Ateg0Avyo86PzAHC5It/5c3xlA3GHX6i
 P6fMEaEfvQt3yR7DhFKiblA49q/NFIbq1pgF6qc4tLPfOhoi7plXXgv68C6sJNWH6vRt
 FRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+AB6ihkeDjtE0bAg4kvmlNC2A2b9lpYgl5ZmZnTx4G0=;
 b=Pe8xdHN/HjInbXD1D+qYNBi5aDIpbbUKtccCTsweKpqjkDMIxXHmOrk+6ROvFQr6xK
 hL88oB5JaoZZJLzAyn0gET4hlafYeNnFIx1dHiMC4WFzXGXb8CLk0/2hIZ5w9dkY+RTP
 7jegOPbKQ+zLSLXIWebui9nB5U4R4xmKKYyDqhq0en/HtcS8oU2zxZ1F9vntG5UUDGex
 +Nad6mB9Iflhj9zGy45SRVkgXX1237sC2Mj+QtWSMRduSRgrO4tcbQS6uT1R6JJCu649
 GTsOfYHX6yaPYixz0w17AeRawtQRrp8waKc8+NR+cQMxZNW9cjLgD9teSLSFOsJDpsJ6
 E12A==
X-Gm-Message-State: AOAM533lXnX82hkVu7935Zf8QM3Pd6Nnzva4hxnz2RCGrQzIDt3W0g//
 v186oq2VcesxmG+Wu5HOIPq3+FIhqglHhhaU
X-Google-Smtp-Source: ABdhPJwlPlZzlwUgu3tCLCpadYUQQ+jPmb8jC7e659O0zlaEXsZhr0SHruhdxhAhhxIyfAfZ3qCq7g==
X-Received: by 2002:a7b:c771:: with SMTP id x17mr3632920wmk.131.1631107783247; 
 Wed, 08 Sep 2021 06:29:43 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 k18sm2138959wmi.25.2021.09.08.06.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 06:29:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com,
	daniel@ffwll.ch,
	alexdeucher@gmail.com
Subject: [PATCH 7/8] drm/ttm: enable TTM TT object kerneldoc v2
Date: Wed,  8 Sep 2021 15:29:32 +0200
Message-Id: <20210908132933.3269-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908132933.3269-1-christian.koenig@amd.com>
References: <20210908132933.3269-1-christian.koenig@amd.com>
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
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
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

