Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D74024CA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 10:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06EC89907;
	Tue,  7 Sep 2021 08:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220DC89907
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:01:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q11so13073736wrr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9zUBTVGg1A3B9kL2P5ReyECwkJFMS/Ce8NZ876KVdf4=;
 b=qzOAONduJaHxKpEC6St1i6FXUyOFmo84L1AunADzEJRpRyZPiHNMhi/jE5VbLpKRU/
 8Hag2Ho6Vy5lTrA+vTylmLtU7Fys3ga0LABVGiwdH0aHuPTYkEsM9/Jl6KqRZ4xGDtPD
 hIz9NNU4c0OXttnUwZQTGWLHfOhrWsW2GDQgU8n6KfgRov/0zD7Kg07ohF9gco3KgeNe
 Tq9YODskHDZzcAsbxvxtujsbYk0Ij/5km2y4zpUY6QRP48TLw85IPu7J12/kB5E1zpBp
 oJ4r2NXxgLzVV9ZrOZ4lqmOoH/86Q5QnGV4qRBDZLgnSb5VpLAnP+K5arD2XOapL5GFb
 9x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9zUBTVGg1A3B9kL2P5ReyECwkJFMS/Ce8NZ876KVdf4=;
 b=WwjHFbSnYYvmLoJQzQXes5+a+/UGeJdxZcXqF1J4gfsJi9+L+inR1zxRSmCRAIcx3a
 bLVusaKRbY72Gk34CkT8qbn3hR+5xXh+Mv1/GoJdvsLO8eYz0VFRu5o9gQPg0EPNxrzH
 iJ7aFoj8bHizAFIKCYditDLwS3CeA325O264ygyMaKBVHCW5h7pFsKu3qnJzPvof09FV
 T4j0KXklAm7JyKnqAJZyFVuUDf51/iShO2OtlLT9nMt+u2zsiaYHaOCFzSbZiCOEuaYz
 wLMCldLIshFZYeTAh0UVfAFYhyTivTHii9WOoDYFAyhvAQyvopmJgF03QYSpy7Yjjr6k
 DInQ==
X-Gm-Message-State: AOAM530rDQ75dWFr9Yu5MJcJuPCqx/f2D0gi/HgCUqA+iztZTWdORuHl
 buoywjdb7JByIdmUH5qJ9fOO+1WV7giaeNPx
X-Google-Smtp-Source: ABdhPJzWcqhGmJkqDW9XT/9tREJtdbAiPBJdtlAxjGScLG+qyKTfHONbcCPEC4atSVBeGJoS5SGO6g==
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr17928921wrz.139.1631001697670; 
 Tue, 07 Sep 2021 01:01:37 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g1sm2248242wmk.2.2021.09.07.01.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:01:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com
Subject: [PATCH 1/8] drm/ttm: remove the outdated kerneldoc section
Date: Tue,  7 Sep 2021 10:01:28 +0200
Message-Id: <20210907080135.101452-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

Clean up to start over with new and more accurate documentation.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 Documentation/gpu/drm-mm.rst | 49 ------------------------------------
 1 file changed, 49 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 0198fa43d254..8ca981065e1a 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -30,55 +30,6 @@ The Translation Table Manager (TTM)
 
 TTM design background and information belongs here.
 
-TTM initialization
-------------------
-
-    **Warning**
-    This section is outdated.
-
-Drivers wishing to support TTM must pass a filled :c:type:`ttm_bo_driver
-<ttm_bo_driver>` structure to ttm_bo_device_init, together with an
-initialized global reference to the memory manager.  The ttm_bo_driver
-structure contains several fields with function pointers for
-initializing the TTM, allocating and freeing memory, waiting for command
-completion and fence synchronization, and memory migration.
-
-The :c:type:`struct drm_global_reference <drm_global_reference>` is made
-up of several fields:
-
-.. code-block:: c
-
-              struct drm_global_reference {
-                      enum ttm_global_types global_type;
-                      size_t size;
-                      void *object;
-                      int (*init) (struct drm_global_reference *);
-                      void (*release) (struct drm_global_reference *);
-              };
-
-
-There should be one global reference structure for your memory manager
-as a whole, and there will be others for each object created by the
-memory manager at runtime. Your global TTM should have a type of
-TTM_GLOBAL_TTM_MEM. The size field for the global object should be
-sizeof(struct ttm_mem_global), and the init and release hooks should
-point at your driver-specific init and release routines, which probably
-eventually call ttm_mem_global_init and ttm_mem_global_release,
-respectively.
-
-Once your global TTM accounting structure is set up and initialized by
-calling ttm_global_item_ref() on it, you need to create a buffer
-object TTM to provide a pool for buffer object allocation by clients and
-the kernel itself. The type of this object should be
-TTM_GLOBAL_TTM_BO, and its size should be sizeof(struct
-ttm_bo_global). Again, driver-specific init and release functions may
-be provided, likely eventually calling ttm_bo_global_ref_init() and
-ttm_bo_global_ref_release(), respectively. Also, like the previous
-object, ttm_global_item_ref() is used to create an initial reference
-count for the TTM, which will call your initialization function.
-
-See the radeon_ttm.c file for an example of usage.
-
 The Graphics Execution Manager (GEM)
 ====================================
 
-- 
2.25.1

