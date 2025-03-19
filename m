Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD777A68D3E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 13:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884D510E4F2;
	Wed, 19 Mar 2025 12:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dtk3cWAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E320010E4F2;
 Wed, 19 Mar 2025 12:54:30 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3912e96c8e8so4405119f8f.2; 
 Wed, 19 Mar 2025 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742388869; x=1742993669; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X4QdDJ2tzHkN+lFmUSCLEya/f2yHJVYxm+pxkS4tFfI=;
 b=dtk3cWAtZPgbENwzbP+/GtLqiEDKWbvw/g4GYH3Zs+f6y/GlU51m9sG+kSB1PdbVqs
 t53AwKRwwlbmX3irGycf8Ctt6d8/I4PVNO16CXdKV/XEEkmApac5rdhaTn+EaM+xzXZw
 hIwzedIx7UKbqQa2XuHC+fUtQGJX7T+KkQl1MkoL5cV841CyUYK+JFHDGrm6H248HWwD
 SmRXy0epkepEfF9AIytORNzDus5XZqy6RW6wyLz/5hNMsRzknLwzb6ronE9g/QHJ28oV
 P05SGAPoEfRPkp5RZKvy63ZFtVip6u4X3jN0avm1i1v4Z9p8Uz7vWzAFowPj3nlcDsSV
 Lnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742388869; x=1742993669;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X4QdDJ2tzHkN+lFmUSCLEya/f2yHJVYxm+pxkS4tFfI=;
 b=fQLFHAaREPpso/LAY1CuDRRutfe0M+tOzWZwnPsYa7OJ/1OZgGYYiRhrzpW57sDsdu
 vXYA3qVnooxOEvhFSUPOOxpY83XBmMoDZaUF9dEkZ/UQdzAq+mNL0i64NfoJ4j+qe5Sb
 njFzy5seLAtGdJN6DjY2RS8+XGMzXJcneZqUNZYzGs4RIJvb5A9FcxnZlaDb7vxew6bq
 0clK1BM9lNhzUUNf0HhkZO3ZtlAIy+MsBKxKpKdWyi2GYKGMGOQ8HoC64KMXreRC5VZP
 wori8JkNovbZ4+kKI6N1wGvLhF+/CWcZTys5WfpX8/41I9eEbn/ETWPOZdlrCuJG9sE7
 fNSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPZR3jxd17NeJIpbiPCPByOH4GreqdTGXP8Mc6mU0YE0kIJca5L0cdVrHauB0itTL9PtvKGgZsjaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMPtRTCdnWJz5iilLGF2z+2aJUB5fcDvXXD9Wu77L9022lkn/M
 zpsgsqyjkMv4711EEY9bBRvOY2DfURCkdI4Jz/glAGQpsOKPCHoW
X-Gm-Gg: ASbGncsGXveE65IHsHnP/frLMUakmG/O9jXKDBGZXC6D1WgBCA1Xp6BKE/HVIulDXxH
 to1zptI2VrSZtjfELguu3s6q6ShD27jHOTViIeyFRKcueg7b/W3K6AiEaH2zrkMxI8fO5cztkiI
 QME0QfyvH1eeoe5BrqTWrLUX0GioFANdIMsxwjEIVcIVRa9lu1TJoPKQhPLGat/LHYs792v1qoL
 m6QQcKT8KiJZn7Jp62rMd9p491ZO2R6nuv0Oyzbhi6/24Bay4gNxwFkt5wmbbQ9SczJxfDEtUFj
 EK9s4cvXzXEgooF8+yb20HhD4OfxRNcyUSnB/V1p4PInuIr6jA==
X-Google-Smtp-Source: AGHT+IFZ6FPtAbMMxEz4gP/mto1/uWDI3BM7h/JbFem0VhxOeZG8sDMPHltBWY5gxWrGw7NDRnawsw==
X-Received: by 2002:a05:6000:4007:b0:391:3261:ff48 with SMTP id
 ffacd0b85a97d-39973af9cb4mr3217380f8f.35.1742388868903; 
 Wed, 19 Mar 2025 05:54:28 -0700 (PDT)
Received: from debian.local ([84.68.5.81]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997656f43asm1046671f8f.25.2025.03.19.05.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 05:54:28 -0700 (PDT)
Date: Wed, 19 Mar 2025 12:54:26 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: nouveau@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lyude@redhat.com, dakr@kernel.org,
 sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/nouveau: prime: fix ttm_bo_delayed_delete oops
Message-ID: <Z9q-ggKKgTsvW-Rz@debian.local>
References: <Z9GHj-edWJmyzpdY@debian.local>
 <00e4d9c4-ecfc-4784-b603-12db04cda806@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00e4d9c4-ecfc-4784-b603-12db04cda806@amd.com>
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
Fixes: https://gitlab.freedesktop.org/drm/amd/-/issues/3937
---
 drivers/gpu/drm/drm_prime.c           | 8 ++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.c  | 3 +++
 drivers/gpu/drm/nouveau/nouveau_gem.c | 3 ---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 32a8781cfd67..452d5c7cd292 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -929,7 +929,9 @@ EXPORT_SYMBOL(drm_gem_prime_export);
  * &drm_driver.gem_prime_import_sg_table internally.
  *
  * Drivers must arrange to call drm_prime_gem_destroy() from their
- * &drm_gem_object_funcs.free hook when using this function.
+ * &drm_gem_object_funcs.free hook or &ttm_buffer_object.destroy
+ * hook when using this function, to avoid the dma_buf being freed while the
+ * ttm_buffer_object can still dereference it.
  */
 struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 					    struct dma_buf *dma_buf,
@@ -999,7 +1001,9 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
  * implementation in drm_gem_prime_fd_to_handle().
  *
  * Drivers must arrange to call drm_prime_gem_destroy() from their
- * &drm_gem_object_funcs.free hook when using this function.
+ * &drm_gem_object_funcs.free hook or &ttm_buffer_object.destroy
+ * hook when using this function, to avoid the dma_buf being freed while the
+ * ttm_buffer_object can still dereference it.
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

