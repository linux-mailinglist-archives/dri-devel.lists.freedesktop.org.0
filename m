Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9E9B246D2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 12:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E448A10E6DC;
	Wed, 13 Aug 2025 10:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cZzAQ49r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E9A10E334
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 11:05:07 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-61860a739a3so90063a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 04:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754996706; x=1755601506; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LTgEWAbzj7JPyTIv1pPqi1BWuVKR7rG/7+oZh/5JWL0=;
 b=cZzAQ49r2jyHVySFPlT4AxFQBO6i+aFsA/Rtp2o3MtqRqPgCXjH9GyaOEcgKD81W7X
 b3DYKadzKpzVzM8/MqpJ+MDAtG1YbKJAZ63sNGjGYLCbI/kwuRS6+Ln3uYMmJ5JDUAPU
 Em5786xRgnToOhsWR+ZX0NU+iznzLFsqKeB8oyx6+sAAc5YpryvXMTdjKDFXVksZOP09
 eqO3g+FVqph8izGdxjqWpUYUP1S6qwGAQ2eawiFcB4A/KHXjyHTwk+zW2SZ2MZd3bcdE
 9zuLrIJHbBE/Hzb9+UjzrwI8g5X3kbfWIw4nfwaPTbAsfKX8GnPCJ5Y+rehiqR+pogD1
 hXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754996706; x=1755601506;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LTgEWAbzj7JPyTIv1pPqi1BWuVKR7rG/7+oZh/5JWL0=;
 b=BREpl6XdbYLknjoakAQL3CMwNmGuZPScfuK1WQPuA2WFbuKvNg4uGHkNzvyzHRp3M+
 2l8Bo9Z7b0J7UEAR9rCkZnATt2epe7j8V+W35XCWFJn2Y9T2KY91KdvemJVFsknadK1E
 wt/cQCdvkABNn3vHf+cc1wvY8HJ9zyObyK1r8Cos+xrtODz8hVHpXX1Y8+6zZPxbO2D1
 KxZ68xdlXFsYNqMKqBK+ME7cY0cKwtzigd5jc1tX1Z2x2r7V6SreNVRNcojFHm+cPLKI
 +Nz+bD8cs/qULHsPdiyyla2q5G/nFdiakhGHZmCTS1OyUeNcn7vQdClserP98wYA4OCn
 vqEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmxyzFGfx1ljz4c80oyGz8T44CQY5j3yrzezmcewVddBscjYQ1gtT9JumUrVHGrg0NF/OqkHOCQhw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXioKUn7ZF87EK9c7Kzz4CIjPavL0oV9qc442dmwTA69k30Xth
 FtsxhEE5COV8w7CB6W7oZUcBcNUUx+/oCjjLuigsxpkiyENP544uf26hi4qBTO22eiMCn6iiPCd
 buT7eFx1YVFXApQ8/RHFoDK5wHfbSGq0=
X-Gm-Gg: ASbGncu0pDiiYWHDVMQuRtGOCyMOeHKXViFgYiSbaNhhNg8ofNdeIntKNIozN+cgY0J
 w2BcWr050VHF+I3EDVnnDXUxANvJ/netiGVISIdocduJguCjLSm1S2FtHgznwq2GAh8DjdKGFYq
 AOplDk6gg+UugcFoTXvJsdYggKWRGrrJ7Q3HlalCwDStdySA0IQat5Cvsdu0Od/CUW3vK1emQvc
 tC/xbCUp+E4oKU8zlfjlTZ2sWp3ADh5rK1FjjWl3A==
X-Google-Smtp-Source: AGHT+IFwCX8cSL/K5d1OkSs/amd4E4PzWthVAvldLYypTrj80aYqfdyZ3wAP/PQS7kmhOiZdLlNQjCLN3W5vZCz3Fxo=
X-Received: by 2002:aa7:d284:0:b0:617:c586:9bca with SMTP id
 4fb4d7f45d1cf-6184d8476eamr2062234a12.4.1754996705945; Tue, 12 Aug 2025
 04:05:05 -0700 (PDT)
MIME-Version: 1.0
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Tue, 12 Aug 2025 16:34:54 +0530
X-Gm-Features: Ac12FXy0gZZlCyJyZEADicRtKiztGgeswBceSj6HyHFkNiH5cnlrTffObFwDLfs
Message-ID: <CAJE-K+DV4U4vnTxYNusn21T0Zx2n9-=r6=az+ouEjPgvo8HeHQ@mail.gmail.com>
Subject: PATCH[1/1] DRM_GPUVM.C : htmldoc error due to multi-line code inside
 comment
To: dakr@kernel.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 13 Aug 2025 10:15:00 +0000
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

Dear Maintainers,
This is my first patch, please bear with me.
I request you to suggest if it can be better.
Your time is appreciated.
---------------------------------------------------------------------------
commit 4ed9c00376c616cdbfb978b5fd76911cccd63b26
Author:     Sidharth Seela <sid@y740.local>
AuthorDate: Tue Aug 12 15:56:03 2025 +0530
Commit:     Sidharth Seela <sid@y740.local>
CommitDate: Tue Aug 12 15:56:03 2025 +0530

    cleaned up errors stemming for multiline text
---
 drivers/gpu/drm/drm_gpuvm.c | 50 ++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..cf49dbfcec91 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2432,31 +2432,31 @@ static const struct drm_gpuvm_ops lock_ops = {
  *
  * The expected usage is:
  *
- *    vm_bind {
- *        struct drm_exec exec;
- *
- *        // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is recommended:
- *        drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT, 0);
- *
- *        drm_exec_until_all_locked (&exec) {
- *            for_each_vm_bind_operation {
- *                switch (op->op) {
- *                case DRIVER_OP_UNMAP:
- *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm,
&exec, op->addr, op->range);
- *                    break;
- *                case DRIVER_OP_MAP:
- *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec,
num_fences,
- *                                                     op->addr, op->range,
- *                                                     obj, op->obj_offset);
- *                    break;
- *                }
- *
- *                drm_exec_retry_on_contention(&exec);
- *                if (ret)
- *                    return ret;
- *            }
- *        }
- *    }
+ * *   vm_bind {
+ * *       struct drm_exec exec;
+ * *
+ * *       // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is recommended:
+ * *       drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT, 0);
+ * *
+ * *       drm_exec_until_all_locked (&exec) {
+ * *           for_each_vm_bind_operation {
+ * *               switch (op->op) {
+ * *               case DRIVER_OP_UNMAP:
+ * *                   ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm,
&exec, op->addr, op->range);
+ * *                   break;
+ * *               case DRIVER_OP_MAP:
+ * *                   ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec,
num_fences,
+ * *                                                    op->addr, op->range,
+ * *                                                    obj, op->obj_offset);
+ * *                   break;
+ * *               }
+ * *
+ * *               drm_exec_retry_on_contention(&exec);
+ * *               if (ret)
+ * *                   return ret;
+ * *           }
+ * *       }
+ * *   }
  *
  * This enables all locking to be performed before the driver begins modifying
  * the VM.  This is safe to do in the case of overlapping DRIVER_VM_BIND_OPs,
--
2.39.5
signed-off-by:Sidharth Seela<sidharthseela@gmail.com>
