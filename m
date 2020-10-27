Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C96C29A851
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9186EB5D;
	Tue, 27 Oct 2020 09:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A376EB4E;
 Tue, 27 Oct 2020 09:51:43 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de
 [95.90.213.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 162CC2467C;
 Tue, 27 Oct 2020 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603792302;
 bh=tr/TyQ4+k+iO/sgQYc54fa4PN3T78vRz+760/CGauoo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e6cdTWFYBgdlbPULirQ9m0K3ed/HgHO7J1o6x+xqjIpUvNJXWmgxA0QUAUPoF6AeH
 lQkxSGMA+YGS0ApugAv11+A6HMNTH6202OE16Kzs8HxvJKwB19YNXApxUZg0pmQhYT
 zM40Zfg4g827eawT7+Jc+xieiYv6bKFynbvT2V48=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kXLdj-003FFR-Md; Tue, 27 Oct 2020 10:51:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 22/32] drm: amdgpu: kernel-doc: update some adev parameters
Date: Tue, 27 Oct 2020 10:51:26 +0100
Message-Id: <5755c2b361890b8ae5cea0f61dfd70b1c135eefe.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Bernard Zhao <bernard@vivo.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Colton Lewis <colton.w.lewis@protonmail.com>,
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

While here, uniform the name of the parameter for it to be
the same on all functions using a pointer to struct amdgpu_device.

Update the kernel-doc documentation accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   | 28 ++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  |  6 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c |  7 +++--
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 37da3537ba2e..641c039150eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -705,7 +705,7 @@ void amdgpu_device_indirect_wreg64(struct amdgpu_device *adev,
 /**
  * amdgpu_invalid_rreg - dummy reg read function
  *
- * @adev: amdgpu device pointer
+ * @adev: amdgpu_device pointer
  * @reg: offset of register
  *
  * Dummy register read function.  Used for register blocks
@@ -722,7 +722,7 @@ static uint32_t amdgpu_invalid_rreg(struct amdgpu_device *adev, uint32_t reg)
 /**
  * amdgpu_invalid_wreg - dummy reg write function
  *
- * @adev: amdgpu device pointer
+ * @adev: amdgpu_device pointer
  * @reg: offset of register
  * @v: value to write to the register
  *
@@ -739,7 +739,7 @@ static void amdgpu_invalid_wreg(struct amdgpu_device *adev, uint32_t reg, uint32
 /**
  * amdgpu_invalid_rreg64 - dummy 64 bit reg read function
  *
- * @adev: amdgpu device pointer
+ * @adev: amdgpu_device pointer
  * @reg: offset of register
  *
  * Dummy register read function.  Used for register blocks
@@ -756,7 +756,7 @@ static uint64_t amdgpu_invalid_rreg64(struct amdgpu_device *adev, uint32_t reg)
 /**
  * amdgpu_invalid_wreg64 - dummy reg write function
  *
- * @adev: amdgpu device pointer
+ * @adev: amdgpu_device pointer
  * @reg: offset of register
  * @v: value to write to the register
  *
@@ -773,7 +773,7 @@ static void amdgpu_invalid_wreg64(struct amdgpu_device *adev, uint32_t reg, uint
 /**
  * amdgpu_block_invalid_rreg - dummy reg read function
  *
- * @adev: amdgpu device pointer
+ * @adev: amdgpu_device pointer
  * @block: offset of instance
  * @reg: offset of register
  *
@@ -793,7 +793,7 @@ static uint32_t amdgpu_block_invalid_rreg(struct amdgpu_device *adev,
 /**
  * amdgpu_block_invalid_wreg - dummy reg write function
  *
- * @adev: amdgpu device pointer
+ * @adev: amdgpu_device pointer
  * @block: offset of instance
  * @reg: offset of register
  * @v: value to write to the register
@@ -813,7 +813,7 @@ static void amdgpu_block_invalid_wreg(struct amdgpu_device *adev,
 /**
  * amdgpu_device_asic_init - Wrapper for atom asic_init
  *
- * @dev: drm_device pointer
+ * @adev: amdgpu_device pointer
  *
  * Does any asic specific work and then calls atom asic init.
  */
@@ -827,7 +827,7 @@ static int amdgpu_device_asic_init(struct amdgpu_device *adev)
 /**
  * amdgpu_device_vram_scratch_init - allocate the VRAM scratch page
  *
- * @adev: amdgpu device pointer
+ * @adev: amdgpu_device pointer
  *
  * Allocates a scratch page of VRAM for use by various things in the
  * driver.
@@ -844,7 +844,7 @@ static int amdgpu_device_vram_scratch_init(struct amdgpu_device *adev)
 /**
  * amdgpu_device_vram_scratch_fini - Free the VRAM scratch page
  *
- * @adev: amdgpu device pointer
+ * @adev: amdgpu_device pointer
  *
  * Frees the VRAM scratch page.
  */
@@ -3011,7 +3011,7 @@ bool amdgpu_device_asic_has_dc_support(enum amd_asic_type asic_type)
 /**
  * amdgpu_device_has_dc_support - check if dc is supported
  *
- * @adev: amdgpu_device_pointer
+ * @adev: amdgpu_device pointer
  *
  * Returns true for supported, false for not supported
  */
@@ -4045,7 +4045,7 @@ static int amdgpu_device_recover_vram(struct amdgpu_device *adev)
 /**
  * amdgpu_device_reset_sriov - reset ASIC for SR-IOV vf
  *
- * @adev: amdgpu device pointer
+ * @adev: amdgpu_device pointer
  * @from_hypervisor: request from hypervisor
  *
  * do VF FLR and reinitialize Asic
@@ -4100,7 +4100,7 @@ static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
 /**
  * amdgpu_device_has_job_running - check if there is any job in mirror list
  *
- * @adev: amdgpu device pointer
+ * @adev: amdgpu_device pointer
  *
  * check if there is any job in mirror list
  */
@@ -4128,7 +4128,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
 /**
  * amdgpu_device_should_recover_gpu - check if we should try GPU recovery
  *
- * @adev: amdgpu device pointer
+ * @adev: amdgpu_device pointer
  *
  * Check amdgpu_gpu_recovery and SRIOV status to see if we should try to recover
  * a hung GPU.
@@ -4477,7 +4477,7 @@ static int amdgpu_device_suspend_display_audio(struct amdgpu_device *adev)
 /**
  * amdgpu_device_gpu_recover - reset the asic and recover scheduler
  *
- * @adev: amdgpu device pointer
+ * @adev: amdgpu_device pointer
  * @job: which job trigger hang
  *
  * Attempt to reset the GPU if it has hung (all asics).
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index f203e4a6a3f2..731f3aa2e6ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -81,8 +81,8 @@ static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func;
 /**
  * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
  *
- * @man: TTM memory type manager
- * @p_size: maximum size of GTT
+ * @adev: amdgpu_device pointer
+ * @gtt_size: maximum size of GTT
  *
  * Allocate and initialize the GTT manager.
  */
@@ -123,7 +123,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 /**
  * amdgpu_gtt_mgr_fini - free and destroy GTT manager
  *
- * @man: TTM memory type manager
+ * @adev: amdgpu_device pointer
  *
  * Destroy and free the GTT manager, returns -EBUSY if ranges are still
  * allocated inside it.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 01c1171afbe0..0c6b7c5ecfec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -168,8 +168,7 @@ static const struct ttm_resource_manager_func amdgpu_vram_mgr_func;
 /**
  * amdgpu_vram_mgr_init - init VRAM manager and DRM MM
  *
- * @man: TTM memory type manager
- * @p_size: maximum size of VRAM
+ * @adev: amdgpu_device pointer
  *
  * Allocate and initialize the VRAM manager.
  */
@@ -199,7 +198,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 /**
  * amdgpu_vram_mgr_fini - free and destroy VRAM manager
  *
- * @man: TTM memory type manager
+ * @adev: amdgpu_device pointer
  *
  * Destroy and free the VRAM manager, returns -EBUSY if ranges are still
  * allocated inside it.
@@ -229,7 +228,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 /**
  * amdgpu_vram_mgr_vis_size - Calculate visible node size
  *
- * @adev: amdgpu device structure
+ * @adev: amdgpu_device pointer
  * @node: MM node structure
  *
  * Calculate how many bytes of the MM node are inside visible VRAM
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
