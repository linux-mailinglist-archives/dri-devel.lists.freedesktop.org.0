Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632F92973F9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8766E2D1;
	Fri, 23 Oct 2020 16:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D39D6E12B;
 Fri, 23 Oct 2020 16:33:48 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F227221F9;
 Fri, 23 Oct 2020 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603470827;
 bh=HaCfxqyru0DdcvC8IaqpPspuh924AuGj1WtdVq8zJZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R4u0q4IZh/fVnK0DQVa8udilBLYSvmcPcVj9YoqkpECy4Q26duLXO1rS9QT8e13j2
 nSc+IYl2c3Gn0gwt3LzZb1Vf+2Z0Ww4LZjptK0MtlpeaLbMxEqhX1ZKmRohBYy9w+K
 onztKpMQAA+Qh61vlEWPpi+2XtgCepQoxxuRVo+Y=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kW00f-002Avj-1O; Fri, 23 Oct 2020 18:33:45 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v3 11/56] drm/amdgpu: fix some kernel-doc markups
Date: Fri, 23 Oct 2020 18:32:58 +0200
Message-Id: <ffc1f2d59fd5005f365eb5d178a2d890112bb6bb.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
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
Cc: Alex Sierra <alex.sierra@amd.com>, Jonathan Kim <jonathan.kim@amd.com>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Bernard Zhao <bernard@vivo.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 xinhui pan <xinhui.pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Jacob He <jacob.he@amd.com>,
 David Airlie <airlied@linux.ie>, Nirmoy Das <nirmoy.das@amd.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some functions have different names between their prototypes
and the kernel-doc markup.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c       | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 2 +-
 include/uapi/drm/amdgpu_drm.h                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index df110afa97bf..a5f73a267fe5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2166,7 +2166,7 @@ struct amdgpu_bo_va *amdgpu_vm_bo_add(struct amdgpu_device *adev,
 
 
 /**
- * amdgpu_vm_bo_insert_mapping - insert a new mapping
+ * amdgpu_vm_bo_insert_map - insert a new mapping
  *
  * @adev: amdgpu_device pointer
  * @bo_va: bo_va to store the address
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 0c6b7c5ecfec..795bad307497 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -528,7 +528,7 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
 }
 
 /**
- * amdgpu_vram_mgr_alloc_sgt - allocate and fill a sg table
+ * amdgpu_vram_mgr_free_sgt - allocate and fill a sg table
  *
  * @adev: amdgpu device pointer
  * @sgt: sg table to free
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index c5ff2b275fcd..791a1d597d2a 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -667,7 +667,7 @@ struct drm_amdgpu_cs_chunk_data {
 	};
 };
 
-/**
+/*
  *  Query h/w info: Flag that this is integrated (a.h.a. fusion) GPU
  *
  */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
