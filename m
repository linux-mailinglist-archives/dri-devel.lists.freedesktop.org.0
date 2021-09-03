Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA5B3FFFBE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 14:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27136E886;
	Fri,  3 Sep 2021 12:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B7C6E883
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 12:31:31 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so3444047wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xMf9W+3BOW+KjvHXPRo/PLq0f2n/Vd5osGKCVrb0at0=;
 b=F5eobai/uCNpGbhS5ttZWYnbmFU0H8H/CBKE6XSwb3w0TO10fMBWUDgZVe9RYmdx48
 Ks5KNHrdSfmXGT9E/1812/3AqDbk1zDTbUP6fUqQwBT76W2EGQPETJUHGALo+tcVzmMt
 1+1ZDoBLVrCpr99hZYxA/LTp6AyV1kCCqrSLLnlUA8atZhDQtRkMaCtFt6RAHSk6LDNe
 RR3uwg2ENtG7hAYr0vCdjSeXw6H897nRmyWyM1EbHzrtIlq+j7WzpII6EQcDcGqw7pPs
 Met3cGFienBCcE4jZ0u+n5/FUg4LMGk/ZDGFiuX1zKN1Az1kDTeFmnZ1BMhYUWpO5zZ9
 SzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xMf9W+3BOW+KjvHXPRo/PLq0f2n/Vd5osGKCVrb0at0=;
 b=Fnb06LTVvXuhc3G9Vy37B0zaAkbS4viIk/lK7Gz7XLpvqMASXVN2qVdWXUDHmRC+Dt
 AYPmeT9M7g8y3nQ+D/dJsEPNV4t76u0GwrdB/SP2D6ECqtp3gKf1ZGykwcqNn8pVoOyr
 zNUcdaspTizK+hWnzBpT3sAI2d2XMEaEwPDfNtj0PhIytkq5Zpcsu/I1+rOFBjfanyN3
 2aPLlXgsO+6S7kPXqPAqlMCmSXCvf82eORM8HVGxCisAyydFXqHqxF7Su+nRnuW6nfun
 Ms+GrI/k5sqh1eXtmRzeUK8uxlk+IIf/pch15TAkihpITQXfFZKvoXuG/DwaivympD4B
 DUPA==
X-Gm-Message-State: AOAM532F29rizEQw/JudDXae6yy59hY7DXs0hWue4fhwZg+QhuPQKdtN
 Zq3YaZdxNhmDZhGpjrDDy/Evn3vqVHNSk/g9
X-Google-Smtp-Source: ABdhPJydcJn5d1KgkEXkIPV2iSo3qYpxbQB+lMA1KuelmCbpBc2UGq9euMOGgcOs7r2L3JCiV+FHoQ==
X-Received: by 2002:a05:600c:2f90:: with SMTP id
 t16mr8317957wmn.136.1630672290002; 
 Fri, 03 Sep 2021 05:31:30 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 x11sm4564873wro.83.2021.09.03.05.31.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:31:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/ttm: remove the outdated kerneldoc section
Date: Fri,  3 Sep 2021 14:31:19 +0200
Message-Id: <20210903123123.116575-1-christian.koenig@amd.com>
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

