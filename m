Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67666A5DD6D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 14:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4EC10E070;
	Wed, 12 Mar 2025 13:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SR8ZeLvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9B610E070;
 Wed, 12 Mar 2025 13:09:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso25127105e9.1; 
 Wed, 12 Mar 2025 06:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741784979; x=1742389779; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BesuV5iUBr9H3CHJKVubwaztfZ8d7wDanwbVw8gGgQA=;
 b=SR8ZeLvy7Nvine0jJobC5l7lXgKM1HXUr8UKWihqD2hP4SQgV4AE9vOeZ/ak8Xq9B9
 g5xHerY6Gy89WfwwM99SHPJYLFFyKvgEw+Gi7/moWu8Vk0S5KQfW3zVdhhfTmZo3Re3Q
 aMZfxvI+kG2WFhjDHqVDXUuq0mFKW+UK3JUaKB008ngxfTSVcpa5y0C9pzvovBseSets
 SeCdV8vUmPhRtDV/VTd/33uRhNCr1WWg0Rl2BChnhwRH1Yo0y/f1mfFt71z7VjtHGcmU
 qY58eAMAoIy1xPjfKuWnW3yWen5UzpkPZog5bGALy5UKU3cvMLub4UDZaeCkqg52Tabi
 KSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741784979; x=1742389779;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BesuV5iUBr9H3CHJKVubwaztfZ8d7wDanwbVw8gGgQA=;
 b=XkEw/dwRw4pP6Lt58KJKgHMFyappN//hvAErLIYpFDo4pFMYaIto/9OC/DJm7nzbCw
 y0v3pOcCXqip9iud5y6idgZ7okn0VYeCG+C2j7U54d9uorP6mvFYyFBRoWuV4esB3Geh
 v9yCzWYD6eFg8BDwYNt1QduH1dJY8VphhFbpujAxr0Y2GL+0qHFq9MX1SwOpwGVhAi4o
 La3b8ShGJK18n45If3inlMcCE5g7ZLBvLyRnnEAWTgFJtY+r/qXfM0vppc76tTFuMxb+
 lwrj9PTgl06tLqYPgb/OIMDM6wZlZ8lEg0rfSF6IQspKAUUnF2kYbNbrjJzXJtG1gOxj
 3c3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJdid5hg2dfYoIM6kWKbn66Lessq2C//evl8A4AaZZRY0Z0KoYDvzCjhS4N59jQlAizA8Gv3lBp5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQU+k5gA4qQFEsUx56XMTZ5FB/sxIDIVdE7EuySrRw6D+x0Iq/
 uffAN4kFXygjAOtemEnwUI97O5TrjZtzrQESyLLaZ/Lg/vWLmyJW+ytANIJQ
X-Gm-Gg: ASbGnctuUuJ2JI6QTv5i27wSy5rEqvvLk/o9bgIb540fR2CMzj6LrVhOgNEXR1Lndiu
 JgGnUD6wOWQDPAbUH1PAePHZ8jihAc1OmiBSkpk3m0iBQjkric1Hy1yVfkJzzu6iE0bjVQcDZrL
 /wki6PGQ3yVFOzPxDybtXr6eOQPOsYa2EgIuODLThlD2/NMwl5bIsTw5d6nVtb/UxGf8M5JSdAp
 TsqE0ZsgiFL1diQ+uEPVPtmGy+8vHjJaWJeUgjYSvU4Bnb3UiwPuh7f+sjhYXpEy/yeA8LMid52
 padIDqW/8EV7BZR4deP90DhVxqm/4znd5//vtrRX4/4uKP1Ki86V9mOhtoNuN2g=
X-Google-Smtp-Source: AGHT+IEWvAbnYEcsY0S3sZRK65NS9EF9SyTrlTuzSCKkbzoiPm9A0wySzWIsDJgR35ApeXwsRAGZhA==
X-Received: by 2002:a05:600d:14:b0:43c:e2dd:98f3 with SMTP id
 5b1f17b1804b1-43ce2dda00amr130086975e9.21.1741784979045; 
 Wed, 12 Mar 2025 06:09:39 -0700 (PDT)
Received: from debian.local ([84.70.89.211]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8c5cbfsm20408135e9.30.2025.03.12.06.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 06:09:38 -0700 (PDT)
Date: Wed, 12 Mar 2025 13:09:35 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: nouveau@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lyude@redhat.com, dakr@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: prime: fix ttm_bo_delayed_delete oops
Message-ID: <Z9GHj-edWJmyzpdY@debian.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Fix an oops in ttm_bo_delayed_delete which results from dererencing a
dangling pointer:

Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b7b: 0000 [#1] PREEMPT SMP
CPU: 4 UID: 0 PID: 1082 Comm: kworker/u65:2 Not tainted 6.14.0-rc4-00267-g505460b44513-dirty #216
Hardware name: LENOVO 82N6/LNVNB161216, BIOS GKCN65WW 01/16/2024
Workqueue: ttm ttm_bo_delayed_delete [ttm]
RIP: 0010:dma_resv_iter_first_unlocked+0x55/0x290
Code: 31 f6 48 c7 c7 00 2b fa aa e8 97 bd 52 ff e8 a2 c1 53 00 5a 85 c0 74 48 e9 88 01 00 00 4c 89 63 20 4d 85 e4 0f 84 30 01 00 00 <41> 8b 44 24 10 c6 43 2c 01 48 89 df 89 43 28 e8 97 fd ff ff 4c 8b
RSP: 0018:ffffbf9383473d60 EFLAGS: 00010202
RAX: 0000000000000001 RBX: ffffbf9383473d88 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffbf9383473d78 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 6b6b6b6b6b6b6b6b
R13: ffffa003bbf78580 R14: ffffa003a6728040 R15: 00000000000383cc
FS:  0000000000000000(0000) GS:ffffa00991c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000758348024dd0 CR3: 000000012c259000 CR4: 0000000000f50ef0
PKRU: 55555554
Call Trace:
 <TASK>
 ? __die_body.cold+0x19/0x26
 ? die_addr+0x3d/0x70
 ? exc_general_protection+0x159/0x460
 ? asm_exc_general_protection+0x27/0x30
 ? dma_resv_iter_first_unlocked+0x55/0x290
 dma_resv_wait_timeout+0x56/0x100
 ttm_bo_delayed_delete+0x69/0xb0 [ttm]
 process_one_work+0x217/0x5c0
 worker_thread+0x1c8/0x3d0
 ? apply_wqattrs_cleanup.part.0+0xc0/0xc0
 kthread+0x10b/0x240
 ? kthreads_online_cpu+0x140/0x140
 ret_from_fork+0x40/0x70
 ? kthreads_online_cpu+0x140/0x140
 ret_from_fork_asm+0x11/0x20
 </TASK>

The cause of this is:

- drm_prime_gem_destroy calls dma_buf_put(dma_buf) which releases the
  reference to the shared dma_buf. The reference count is 0, so the
  dma_buf is destroyed, which in turn decrements the corresponding
  amdgpu_bo reference count to 0, and the amdgpu_bo is destroyed -
  calling drm_gem_object_release then dma_resv_fini (which destroys the
  reservation object), then finally freeing the amdgpu_bo.

- nouveau_bo obj->bo.base.resv is now a dangling pointer to the memory
  formerly allocated to the amdgpu_bo.

- nouveau_gem_object_del calls ttm_bo_put(&nvbo->bo) which calls
  ttm_bo_release, which schedules ttm_bo_delayed_delete.

- ttm_bo_delayed_delete runs and dereferences the dangling resv pointer,
  resulting in a general protection fault.

Fix this by moving the drm_prime_gem_destroy call from
nouveau_gem_object_del to nouveau_bo_del_ttm. This ensures that it will
be run after ttm_bo_delayed_delete.

Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Co-Developed-by: Christian König <christian.koenig@amd.com>
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3937
---
 drivers/gpu/drm/drm_prime.c           | 8 ++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.c  | 3 +++
 drivers/gpu/drm/nouveau/nouveau_gem.c | 3 ---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 32a8781cfd67..4b90fa8954d7 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -929,7 +929,9 @@ EXPORT_SYMBOL(drm_gem_prime_export);
  * &drm_driver.gem_prime_import_sg_table internally.
  *
  * Drivers must arrange to call drm_prime_gem_destroy() from their
- * &drm_gem_object_funcs.free hook when using this function.
+ * &ttm_buffer_object.destroy hook when using this function,
+ * to avoid the dma_buf being freed while the ttm_buffer_object can still
+ * dereference it.
  */
 struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 					    struct dma_buf *dma_buf,
@@ -999,7 +1001,9 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
  * implementation in drm_gem_prime_fd_to_handle().
  *
  * Drivers must arrange to call drm_prime_gem_destroy() from their
- * &drm_gem_object_funcs.free hook when using this function.
+ * &ttm_buffer_object.destroy hook when using this function,
+ * to avoid the dma_buf being freed while the ttm_buffer_object can still
+ * dereference it.
  */
 struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
 					    struct dma_buf *dma_buf)
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index db961eade225..2016c1e7242f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -144,6 +144,9 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 	nouveau_bo_del_io_reserve_lru(bo);
 	nv10_bo_put_tile_region(dev, nvbo->tile, NULL);
 
+	if (bo->base.import_attach)
+		drm_prime_gem_destroy(&bo->base, bo->sg);
+
 	/*
 	 * If nouveau_bo_new() allocated this buffer, the GEM object was never
 	 * initialized, so don't attempt to release it.
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 9ae2cee1c7c5..67e3c99de73a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -87,9 +87,6 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 		return;
 	}
 
-	if (gem->import_attach)
-		drm_prime_gem_destroy(gem, nvbo->bo.sg);
-
 	ttm_bo_put(&nvbo->bo);
 
 	pm_runtime_mark_last_busy(dev);
-- 
2.47.2

