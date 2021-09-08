Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC49E403A99
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B616E10A;
	Wed,  8 Sep 2021 13:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840E96E0CC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 13:29:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q11so3302561wrr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 06:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9zUBTVGg1A3B9kL2P5ReyECwkJFMS/Ce8NZ876KVdf4=;
 b=QXb7/KKKALNmjemKE4QLGqmLypCyhuRdik1q6HxgVqeMhgYBcYt45LLkK2LjPhGdv3
 tyTGk8uXzQboVZ9NmKonTjcIaxgJsUP1xKOLgq4h5AkNX6KKGKBEhZ2f1aH1p45uXfhR
 dRvuDn6BJ9cmLMqNo4xTnrI+2M4MSHT55nfrCoBJD5JTR1btPm2ivOfBGI7tPkJiLFYT
 mOu3feUqbtuVgjE7uECRKDkkBTCYILRvLAVR9WRbBWuA6POKAvtprYbc5h6vtxXImqoZ
 8AwZi+GJhnyKrfkt4Pt6txNTj8Qdz4w7wFqmyCmuK7BFI4bZFhnYwgO6TKkWzYVJakIA
 nTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9zUBTVGg1A3B9kL2P5ReyECwkJFMS/Ce8NZ876KVdf4=;
 b=VZRPuj/jLKKVeNNlNmSyeARQXp/xtYbxmzb3HQFqCwn6irrmEZ3lFtSVfnBKQ+Qvry
 YYeX4OT80qlWOH1LM8+/4GOORwUsxxvWKqdKeGs3tY9TqAVvPtFPJz3IIbpi3MvJY91o
 /08NQHheqA2Eu/OBXuFZGESmdqd0Ah5KPP+6cFxNNcqTBn8D9DaKht9b7egNdsP+HTcg
 iHfsbZz8O4J8RNPIvDdnv6z0KQOwi/4qbulF3RN8L3CA1t3S50kBMkzKwTASI0fM5l+k
 8JhItSVRGgHTEMj9hAtptXjMJLY5NjeVEPTNnp/gkn8o+JOTk+s5O9lTYtcCRDEvNFQ7
 Tlfw==
X-Gm-Message-State: AOAM530Ks3DEWcRUVCB9+NXC6vEQ57HewDtFzcRZ4vc4XdqGU/HmWl2O
 Tiq1gbvIq3OGpQ8tQ6kVhOfufGTmAlxr44DG
X-Google-Smtp-Source: ABdhPJzCS0poWJRid/JiFOhNG9tBb9nMc2cBRC18GVLW0J08d6GF+pLJeFIcVd4QAhUMX7k6BIIqfw==
X-Received: by 2002:a5d:438f:: with SMTP id i15mr4064868wrq.361.1631107777973; 
 Wed, 08 Sep 2021 06:29:37 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 k18sm2138959wmi.25.2021.09.08.06.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 06:29:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com,
	daniel@ffwll.ch,
	alexdeucher@gmail.com
Subject: [PATCH 1/8] drm/ttm: remove the outdated kerneldoc section
Date: Wed,  8 Sep 2021 15:29:26 +0200
Message-Id: <20210908132933.3269-2-christian.koenig@amd.com>
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

