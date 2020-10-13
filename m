Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADE928CDE8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 14:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3846E8CD;
	Tue, 13 Oct 2020 12:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700EA6E321;
 Tue, 13 Oct 2020 12:14:56 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de
 [95.90.213.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23AD522268;
 Tue, 13 Oct 2020 12:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602591295;
 bh=GEoQoCGbFf5b/wNA+woo6pF55S9XNZRyPZRWqLMsiiE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t+zMKk4A+xLqFI+/h4S1sI/vdK8QQ5yAODbSP8I5gP/0qgw+ExA9A3SOD66Ake9FJ
 jPFwr/M2iX36Bo50gK3lSsB4fStHiNI91M/dYfHQImZzZ2guRiOd0sS6j4Ctc9wIL/
 kAgUQK4WmpM/Yo2ovvNOZYZUxjbn6+HqUEWbCP2w=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kSJCe-006Co3-SK; Tue, 13 Oct 2020 14:14:52 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 07/24] drm: amdgpu: kernel-doc: update some adev parameters
Date: Tue, 13 Oct 2020 14:14:34 +0200
Message-Id: <e8d8081e713010edcae2414427fec4a497182fae.1602590106.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602590106.git.mchehab+huawei@kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
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
Cc: Luben Tuikov <luben.tuikov@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Bernard Zhao <bernard@vivo.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Colton Lewis <colton.w.lewis@protonmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Running "make htmldocs: produce lots of warnings on those files:
	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'p_size' description in 'amdgpu_vram_mgr_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:211: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_fini'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'p_size' description in 'amdgpu_vram_mgr_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:211: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_fini'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'p_size' description in 'amdgpu_vram_mgr_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:211: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_fini'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'p_size' description in 'amdgpu_vram_mgr_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:211: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_fini'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:90: warning: Excess function parameter 'man' description in 'amdgpu_gtt_mgr_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:90: warning: Excess function parameter 'p_size' description in 'amdgpu_gtt_mgr_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:134: warning: Excess function parameter 'man' description in 'amdgpu_gtt_mgr_fini'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:90: warning: Excess function parameter 'man' description in 'amdgpu_gtt_mgr_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:90: warning: Excess function parameter 'p_size' description in 'amdgpu_gtt_mgr_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:134: warning: Excess function parameter 'man' description in 'amdgpu_gtt_mgr_fini'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:675: warning: Excess function parameter 'dev' description in 'amdgpu_device_asic_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:675: warning: Excess function parameter 'dev' description in 'amdgpu_device_asic_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:675: warning: Excess function parameter 'dev' description in 'amdgpu_device_asic_init'
	./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:675: warning: Excess function parameter 'dev' description in 'amdgpu_device_asic_init'

They're related to the repacement of some parameters by adev,
and due to a few renamed parameters.

Update the kernel-doc documentation accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 5 ++---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f8f298b34805..fb375752feb1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -817,7 +817,7 @@ static void amdgpu_block_invalid_wreg(struct amdgpu_device *adev,
 /**
  * amdgpu_device_asic_init - Wrapper for atom asic_init
  *
- * @dev: drm_device pointer
+ * @adev: drm_device pointer
  *
  * Does any asic specific work and then calls atom asic init.
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index f203e4a6a3f2..5f3a04cd0fba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -81,8 +81,8 @@ static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func;
 /**
  * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
  *
- * @man: TTM memory type manager
- * @p_size: maximum size of GTT
+ * @adev: amdgpu device structure
+ * @gtt_size: maximum size of GTT
  *
  * Allocate and initialize the GTT manager.
  */
@@ -123,7 +123,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 /**
  * amdgpu_gtt_mgr_fini - free and destroy GTT manager
  *
- * @man: TTM memory type manager
+ * @adev: amdgpu device structure
  *
  * Destroy and free the GTT manager, returns -EBUSY if ranges are still
  * allocated inside it.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 01c1171afbe0..a0e787ddbbd7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -168,8 +168,7 @@ static const struct ttm_resource_manager_func amdgpu_vram_mgr_func;
 /**
  * amdgpu_vram_mgr_init - init VRAM manager and DRM MM
  *
- * @man: TTM memory type manager
- * @p_size: maximum size of VRAM
+ * @adev: amdgpu device structure
  *
  * Allocate and initialize the VRAM manager.
  */
@@ -199,7 +198,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 /**
  * amdgpu_vram_mgr_fini - free and destroy VRAM manager
  *
- * @man: TTM memory type manager
+ * @adev: amdgpu device structure
  *
  * Destroy and free the VRAM manager, returns -EBUSY if ranges are still
  * allocated inside it.
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
