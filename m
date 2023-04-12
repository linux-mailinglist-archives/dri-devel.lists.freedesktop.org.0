Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F19486DF901
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 16:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B2610E85E;
	Wed, 12 Apr 2023 14:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C936E10E85B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:52:22 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i3so1870264wrc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681311142; x=1683903142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y3IEicRB/HYDcHO/VfHzJHUEBDxNvU5Z16X/TngHT9s=;
 b=RVAJfiP96als5+mr+SavZYAQQFzGzSDWds7WLymYEXUG7+NLXLL968hZdTghJ/azVD
 cA2+T9AYy+KNLQ7QtzzhZLyVBFlTT6Qthnesf7l12Q4HHMpfIJPeCvFG0lbIgkliU6Oc
 lrd8iMIOEr9ZJsoH14jxq9mhXIYgDgT4BkWGKTMfmYJ7ccvt7WHU7Due1QfoIayXjduD
 ekAfl9JIw6WmO4YnYEGRDDwBIjHQsCr1SLdHs2nnEGzjZquwzYCpMfm/QNuVcNmh/IuV
 UGIv5Bq7eiWtNyai9pZ+jEshq3yy6aStnD4v8Z0yoTtvjCzD/akaoXavbQLfpAdOf+ha
 TrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681311142; x=1683903142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y3IEicRB/HYDcHO/VfHzJHUEBDxNvU5Z16X/TngHT9s=;
 b=UbtQ9iD+hJYphLZS/i4Wd5k6RDRmCR3RRZFWKXvk1s8Ou0xeSe+E6iM+6pTaEi1/ts
 Y06rpaeup7XSuZa0YY1vM1k+v+fw7dVItlaiUsj+G8eI8PaYfQZpWAJy21BJsowGlFS8
 HqXLJv67vqvE420nkkY80CIUjNG5dfShnOFS+ofmnjbACF1MygmVFTNQdH9dWVrf9XCJ
 B/qOvO9WMZiFdxi/tKOO+Vi+gvsAGY2gJwQ4anDgw+taX2a7l2du7pGYf3KzSqRSNdfH
 dVvQ/x0BEneUnBmP4TxuXzULqhGmlmqZosZbSKeijcIi3IiqMjDE7TC57DPfTBJr3pvU
 UH5Q==
X-Gm-Message-State: AAQBX9deq9p6W2w/PAKdW8TyvREJagg3A2uMQrXNejQRNremYQFM/1UP
 aljlPOde2Zqx8upe1YA6I7E=
X-Google-Smtp-Source: AKy350aKi3gmzO0JDMyHlU30p+EgBESUfjZeFILHmcLf4lHJ0xrT/Qc1FhH94qeBvOuWvyrbbi1Mtg==
X-Received: by 2002:adf:e841:0:b0:2ef:5066:7bb8 with SMTP id
 d1-20020adfe841000000b002ef50667bb8mr8623322wrn.49.1681311141881; 
 Wed, 12 Apr 2023 07:52:21 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 e18-20020adfe392000000b002c56013c07fsm17304166wrm.109.2023.04.12.07.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 07:52:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: mcanal@igalia.com, stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 mwen@igalia.com, maxime@cerno.tech, wambui.karugax@gmail.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/debugfs: remove debugfs_root pointer from minor
Date: Wed, 12 Apr 2023 16:52:06 +0200
Message-Id: <20230412145206.2483-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412145206.2483-1-christian.koenig@amd.com>
References: <20230412145206.2483-1-christian.koenig@amd.com>
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

We only keept that around for API compatibility with drivers. Clean all
this up and use the per device debugfs directory.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/accel/drm_accel.c                      |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c    |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c      |  3 +--
 .../gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c        |  3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c         |  3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c        |  4 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c     |  5 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c        |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c        |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c       |  3 +--
 .../gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c        |  3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c        |  3 +--
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c             |  3 +--
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c      |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c               |  2 +-
 drivers/gpu/drm/armada/armada_debugfs.c        |  2 +-
 drivers/gpu/drm/drm_debugfs.c                  |  3 ---
 drivers/gpu/drm/drm_mipi_dbi.c                 |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c          |  2 +-
 drivers/gpu/drm/i915/display/hsw_ips.c         |  2 +-
 .../drm/i915/display/intel_display_debugfs.c   |  4 ++--
 drivers/gpu/drm/i915/display/intel_dmc.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c   |  9 ++++++---
 drivers/gpu/drm/i915/display/intel_psr.c       |  6 ++++--
 drivers/gpu/drm/i915/display/intel_wm.c        |  9 ++++++---
 drivers/gpu/drm/i915/display/skl_watermark.c   |  6 ++++--
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c     |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c     |  2 +-
 drivers/gpu/drm/i915/gvt/debugfs.c             |  6 +++---
 drivers/gpu/drm/i915/i915_debugfs.c            |  6 +++---
 drivers/gpu/drm/i915/i915_debugfs_params.c     |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c   |  4 ++--
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c      |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c       |  2 +-
 drivers/gpu/drm/msm/dp/dp_debug.c              |  2 +-
 drivers/gpu/drm/msm/msm_debugfs.c              | 18 +++++++++---------
 drivers/gpu/drm/msm/msm_perf.c                 |  2 +-
 drivers/gpu/drm/msm/msm_rd.c                   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c      |  6 +++---
 drivers/gpu/drm/omapdrm/omap_debugfs.c         |  4 ++--
 drivers/gpu/drm/pl111/pl111_debugfs.c          |  2 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c              |  4 ++--
 drivers/gpu/drm/qxl/qxl_ttm.c                  |  4 ++--
 drivers/gpu/drm/radeon/r100.c                  |  6 +++---
 drivers/gpu/drm/radeon/r300.c                  |  2 +-
 drivers/gpu/drm/radeon/r420.c                  |  2 +-
 drivers/gpu/drm/radeon/r600.c                  |  2 +-
 drivers/gpu/drm/radeon/radeon_fence.c          |  2 +-
 drivers/gpu/drm/radeon/radeon_gem.c            |  2 +-
 drivers/gpu/drm/radeon/radeon_ib.c             |  2 +-
 drivers/gpu/drm/radeon/radeon_pm.c             |  2 +-
 drivers/gpu/drm/radeon/radeon_ring.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c            |  2 +-
 drivers/gpu/drm/radeon/rs400.c                 |  2 +-
 drivers/gpu/drm/radeon/rv515.c                 |  2 +-
 drivers/gpu/drm/sti/sti_cursor.c               |  2 +-
 drivers/gpu/drm/sti/sti_drv.c                  |  4 ++--
 drivers/gpu/drm/sti/sti_dvo.c                  |  2 +-
 drivers/gpu/drm/sti/sti_gdp.c                  |  2 +-
 drivers/gpu/drm/sti/sti_hda.c                  |  2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                 |  2 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                |  2 +-
 drivers/gpu/drm/sti/sti_mixer.c                |  2 +-
 drivers/gpu/drm/sti/sti_tvout.c                |  2 +-
 drivers/gpu/drm/sti/sti_vid.c                  |  2 +-
 drivers/gpu/drm/tegra/drm.c                    |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c            |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                  |  2 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                  |  2 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c       |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c            |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c            |  2 +-
 include/drm/drm_file.h                         |  2 --
 79 files changed, 122 insertions(+), 129 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index 82c54bc2dcad..7e4176c736a5 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -100,8 +100,6 @@ void accel_debugfs_register(struct drm_device *dev)
 {
 	struct drm_minor *minor = dev->accel;
 
-	minor->debugfs_root = dev->debugfs_root;
-
 	drm_debugfs_create_files(accel_debugfs_list, ACCEL_DEBUGFS_ENTRIES,
 				 dev->debugfs_root, minor);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index f60753f97ac5..54d2b92a9e71 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1454,7 +1454,7 @@ static const char *debugfs_regs_names[] = {
 int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
 {
 	struct drm_minor *minor = adev_to_drm(adev)->primary;
-	struct dentry *ent, *root = minor->debugfs_root;
+	struct dentry *ent, *root = minor->dev->debugfs_root;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(debugfs_regs); i++) {
@@ -1926,7 +1926,7 @@ static const struct file_operations amdgpu_reset_dump_register_list = {
 
 int amdgpu_debugfs_init(struct amdgpu_device *adev)
 {
-	struct dentry *root = adev_to_drm(adev)->primary->debugfs_root;
+	struct dentry *root = adev_to_drm(adev)->debugfs_root;
 	struct dentry *ent;
 	int r, i;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index f52d0ba91a77..eb406870d57b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -927,8 +927,7 @@ static void amdgpu_debugfs_reset_work(struct work_struct *work)
 void amdgpu_debugfs_fence_init(struct amdgpu_device *adev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct drm_minor *minor = adev_to_drm(adev)->primary;
-	struct dentry *root = minor->debugfs_root;
+	struct dentry *root = adev_to_drm(adev)->debugfs_root;
 
 	debugfs_create_file("amdgpu_fence_info", 0444, root, adev,
 			    &amdgpu_debugfs_fence_info_fops);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c
index 2ca3c329de6d..c18f1316ea88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c
@@ -137,7 +137,7 @@ void amdgpu_fw_attestation_debugfs_init(struct amdgpu_device *adev)
 
 	debugfs_create_file("amdgpu_fw_attestation",
 			    S_IRUSR,
-			    adev_to_drm(adev)->primary->debugfs_root,
+			    adev_to_drm(adev)->debugfs_root,
 			    adev,
 			    &amdgpu_fw_attestation_debugfs_ops);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 863cb668e000..d2c8c3491bb6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -994,8 +994,7 @@ DEFINE_SHOW_ATTRIBUTE(amdgpu_debugfs_gem_info);
 void amdgpu_debugfs_gem_init(struct amdgpu_device *adev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct drm_minor *minor = adev_to_drm(adev)->primary;
-	struct dentry *root = minor->debugfs_root;
+	struct dentry *root = adev_to_drm(adev)->debugfs_root;
 
 	debugfs_create_file("amdgpu_gem_info", 0444, root, adev,
 			    &amdgpu_debugfs_gem_info_fops);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
index df7eb0b7c4b9..f36b656f91d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
@@ -457,8 +457,7 @@ DEFINE_SHOW_ATTRIBUTE(amdgpu_debugfs_sa_info);
 void amdgpu_debugfs_sa_init(struct amdgpu_device *adev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct drm_minor *minor = adev_to_drm(adev)->primary;
-	struct dentry *root = minor->debugfs_root;
+	struct dentry *root = adev_to_drm(adev)->debugfs_root;
 
 	debugfs_create_file("amdgpu_sa_info", 0444, root, adev,
 			    &amdgpu_debugfs_sa_info_fops);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 0efb38539d70..751351aa598b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1704,11 +1704,9 @@ DEFINE_SHOW_ATTRIBUTE(amdgpu_debugfs_firmware_info);
 void amdgpu_debugfs_firmware_init(struct amdgpu_device *adev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct drm_minor *minor = adev_to_drm(adev)->primary;
-	struct dentry *root = minor->debugfs_root;
+	struct dentry *root = adev_to_drm(adev)->debugfs_root;
 
 	debugfs_create_file("amdgpu_firmware_info", 0444, root,
 			    adev, &amdgpu_debugfs_firmware_info_fops);
-
 #endif
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
index 468a67b302d4..aff145bcbfe2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
@@ -373,9 +373,8 @@ static ssize_t ta_if_invoke_debugfs_write(struct file *fp, const char *buf, size
 
 void amdgpu_ta_if_debugfs_init(struct amdgpu_device *adev)
 {
-	struct drm_minor *minor = adev_to_drm(adev)->primary;
-
-	struct dentry *dir = debugfs_create_dir("ta_if", minor->debugfs_root);
+	struct dentry *root = adev_to_drm(adev)->debugfs_root;
+	struct dentry *dir = debugfs_create_dir("ta_if", root);
 
 	debugfs_create_file("ta_load", 0200, dir, adev,
 				     &ta_load_debugfs_fops);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
index 12010c988c8b..a39aba26710c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
@@ -117,12 +117,12 @@ static const struct file_operations amdgpu_rap_debugfs_ops = {
 void amdgpu_rap_debugfs_init(struct amdgpu_device *adev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct drm_minor *minor = adev_to_drm(adev)->primary;
+	struct dentry *root = adev_to_drm(adev)->debugfs_root;
 
 	if (!adev->psp.rap_context.context.initialized)
 		return;
 
-	debugfs_create_file("rap_test", S_IWUSR, minor->debugfs_root,
-				adev, &amdgpu_rap_debugfs_ops);
+	debugfs_create_file("rap_test", S_IWUSR, root, adev,
+			    &amdgpu_rap_debugfs_ops);
 #endif
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 11df6ee052b4..f7e6dcca3873 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1440,10 +1440,10 @@ static int amdgpu_ras_sysfs_remove_all(struct amdgpu_device *adev)
 static struct dentry *amdgpu_ras_debugfs_create_ctrl_node(struct amdgpu_device *adev)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
-	struct drm_minor  *minor = adev_to_drm(adev)->primary;
-	struct dentry     *dir;
+	struct dentry *root = adev_to_drm(adev)->debugfs_root;
+	struct dentry *dir;
 
-	dir = debugfs_create_dir(RAS_FS_NAME, minor->debugfs_root);
+	dir = debugfs_create_dir(RAS_FS_NAME, root);
 	debugfs_create_file("ras_ctrl", S_IWUGO | S_IRUGO, dir, adev,
 			    &amdgpu_ras_debugfs_ctrl_ops);
 	debugfs_create_file("ras_eeprom_reset", S_IWUGO | S_IRUGO, dir, adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index dc474b809604..b75cd5958c40 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -484,8 +484,7 @@ void amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
 			      struct amdgpu_ring *ring)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct drm_minor *minor = adev_to_drm(adev)->primary;
-	struct dentry *root = minor->debugfs_root;
+	struct dentry *root = adev_to_drm(adev)->debugfs_root;
 	char name[32];
 
 	sprintf(name, "amdgpu_ring_%s", ring->name);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
index 8ed0e073656f..575320c6d48a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
@@ -177,7 +177,7 @@ void amdgpu_securedisplay_debugfs_init(struct amdgpu_device *adev)
 	if (!adev->psp.securedisplay_context.context.initialized)
 		return;
 
-	debugfs_create_file("securedisplay_test", S_IWUSR, adev_to_drm(adev)->primary->debugfs_root,
+	debugfs_create_file("securedisplay_test", S_IWUSR, adev_to_drm(adev)->debugfs_root,
 				adev, &amdgpu_securedisplay_debugfs_ops);
 #endif
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 2cd081cbf706..2198fef53fdc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2371,8 +2371,7 @@ static const struct file_operations amdgpu_ttm_iomem_fops = {
 void amdgpu_ttm_debugfs_init(struct amdgpu_device *adev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct drm_minor *minor = adev_to_drm(adev)->primary;
-	struct dentry *root = minor->debugfs_root;
+	struct dentry *root = adev_to_drm(adev)->debugfs_root;
 
 	debugfs_create_file_size("amdgpu_vram", 0444, root, adev,
 				 &amdgpu_ttm_vram_fops, adev->gmc.mc_vram_size);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index e63fcc58e8e0..1d40763939dc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -1121,8 +1121,7 @@ void amdgpu_debugfs_vcn_fwlog_init(struct amdgpu_device *adev, uint8_t i,
                                    struct amdgpu_vcn_inst *vcn)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct drm_minor *minor = adev_to_drm(adev)->primary;
-	struct dentry *root = minor->debugfs_root;
+	struct dentry *root = adev_to_drm(adev)->debugfs_root;
 	char name[32];
 
 	sprintf(name, "amdgpu_vcn_%d_fwlog", i);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 827fcb4fb3b3..cec1cafafd0c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -3658,7 +3658,7 @@ void dtn_debugfs_init(struct amdgpu_device *adev)
 	};
 
 	struct drm_minor *minor = adev_to_drm(adev)->primary;
-	struct dentry *root = minor->debugfs_root;
+	struct dentry *root = minor->dev->debugfs_root;
 
 	debugfs_create_file("amdgpu_mst_topology", 0444, root,
 			    adev, &mst_topo_fops);
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index d75a67cfe523..3e900b6f746b 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -3705,8 +3705,7 @@ static const struct file_operations amdgpu_debugfs_pm_prv_buffer_fops = {
 void amdgpu_debugfs_pm_init(struct amdgpu_device *adev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct drm_minor *minor = adev_to_drm(adev)->primary;
-	struct dentry *root = minor->debugfs_root;
+	struct dentry *root = adev_to_drm(adev)->debugfs_root;
 
 	if (!adev->pm.dpm_enabled)
 		return;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index b5d64749990e..9afdd31072ee 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -3215,7 +3215,7 @@ void amdgpu_smu_stb_debug_fs_init(struct amdgpu_device *adev)
 
 	debugfs_create_file_size("amdgpu_smu_stb_dump",
 			    S_IRUSR,
-			    adev_to_drm(adev)->primary->debugfs_root,
+			    adev_to_drm(adev)->debugfs_root,
 			    adev,
 			    &smu_stb_debugfs_fops,
 			    smu->stb_context.stb_buf_size);
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index c03cfd57b752..c825a453a03f 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -552,7 +552,7 @@ static void malidp_debugfs_init(struct drm_minor *minor)
 	malidp_error_stats_init(&malidp->de_errors);
 	malidp_error_stats_init(&malidp->se_errors);
 	spin_lock_init(&malidp->errors_lock);
-	debugfs_create_file("debug", S_IRUGO | S_IWUSR, minor->debugfs_root,
+	debugfs_create_file("debug", S_IRUGO | S_IWUSR, minor->dev->debugfs_root,
 			    minor->dev, &malidp_debugfs_fops);
 }
 
diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/armada/armada_debugfs.c
index 29f4b52e3c8d..24b42ca59f02 100644
--- a/drivers/gpu/drm/armada/armada_debugfs.c
+++ b/drivers/gpu/drm/armada/armada_debugfs.c
@@ -105,7 +105,7 @@ static struct drm_info_list armada_debugfs_list[] = {
 int armada_drm_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(armada_debugfs_list, ARMADA_DEBUGFS_ENTRIES,
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index c8e2d4f9f00d..e09a4c47b66b 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -264,9 +264,6 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
 	sprintf(name, "%d", minor_id);
 	debugfs_create_symlink(name, root, dev->unique);
 
-	/* TODO: Only for compatibility with drivers */
-	minor->debugfs_root = dev->debugfs_root;
-
 	if (dev->driver->debugfs_init && dev->render != minor)
 		dev->driver->debugfs_init(minor);
 
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index c871d9f096b8..8ffd30885d01 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1454,7 +1454,7 @@ void mipi_dbi_debugfs_init(struct drm_minor *minor)
 
 	if (dbidev->dbi.read_commands)
 		mode |= S_IRUGO;
-	debugfs_create_file("command", mode, minor->debugfs_root, dbidev,
+	debugfs_create_file("command", mode, minor->dev->debugfs_root, dbidev,
 			    &mipi_dbi_debugfs_command_fops);
 }
 EXPORT_SYMBOL(mipi_dbi_debugfs_init);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 44ca803237a5..6ba9bb15f94d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -243,7 +243,7 @@ static void etnaviv_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(etnaviv_debugfs_list,
 				 ARRAY_SIZE(etnaviv_debugfs_list),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/i915/display/hsw_ips.c b/drivers/gpu/drm/i915/display/hsw_ips.c
index 2910f5d0f3e2..617b6e493b37 100644
--- a/drivers/gpu/drm/i915/display/hsw_ips.c
+++ b/drivers/gpu/drm/i915/display/hsw_ips.c
@@ -301,6 +301,6 @@ void hsw_ips_debugfs_register(struct drm_i915_private *i915)
 {
 	struct drm_minor *minor = i915->drm.primary;
 
-	debugfs_create_file("i915_ips_status", 0444, minor->debugfs_root,
+	debugfs_create_file("i915_ips_status", 0444, minor->dev->debugfs_root,
 			    i915, &hsw_ips_debugfs_status_fops);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index cc5026272558..46d63ea14e63 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1083,14 +1083,14 @@ void intel_display_debugfs_register(struct drm_i915_private *i915)
 	for (i = 0; i < ARRAY_SIZE(intel_display_debugfs_files); i++) {
 		debugfs_create_file(intel_display_debugfs_files[i].name,
 				    S_IRUGO | S_IWUSR,
-				    minor->debugfs_root,
+				    minor->dev->debugfs_root,
 				    to_i915(minor->dev),
 				    intel_display_debugfs_files[i].fops);
 	}
 
 	drm_debugfs_create_files(intel_display_debugfs_list,
 				 ARRAY_SIZE(intel_display_debugfs_list),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 
 	hsw_ips_debugfs_register(i915);
 	intel_dmc_debugfs_register(i915);
diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 8a88de67ff0a..4ca2125c0a8a 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1229,6 +1229,6 @@ void intel_dmc_debugfs_register(struct drm_i915_private *i915)
 {
 	struct drm_minor *minor = i915->drm.primary;
 
-	debugfs_create_file("i915_dmc_info", 0444, minor->debugfs_root,
+	debugfs_create_file("i915_dmc_info", 0444, minor->dev->debugfs_root,
 			    i915, &intel_dmc_debugfs_status_fops);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index b507ff944864..5a83b4e87246 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1839,5 +1839,5 @@ void intel_fbc_debugfs_register(struct drm_i915_private *i915)
 
 	fbc = i915->display.fbc[INTEL_FBC_A];
 	if (fbc)
-		intel_fbc_debugfs_add(fbc, minor->debugfs_root);
+		intel_fbc_debugfs_add(fbc, minor->dev->debugfs_root);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index b12900446828..99dedfcefc50 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -943,10 +943,13 @@ void intel_hpd_debugfs_register(struct drm_i915_private *i915)
 {
 	struct drm_minor *minor = i915->drm.primary;
 
-	debugfs_create_file("i915_hpd_storm_ctl", 0644, minor->debugfs_root,
+	debugfs_create_file("i915_hpd_storm_ctl", 0644,
+			    minor->dev->debugfs_root,
 			    i915, &i915_hpd_storm_ctl_fops);
-	debugfs_create_file("i915_hpd_short_storm_ctl", 0644, minor->debugfs_root,
+	debugfs_create_file("i915_hpd_short_storm_ctl", 0644,
+			    minor->dev->debugfs_root,
 			    i915, &i915_hpd_short_storm_ctl_fops);
-	debugfs_create_bool("i915_ignore_long_hpd", 0644, minor->debugfs_root,
+	debugfs_create_bool("i915_ignore_long_hpd", 0644,
+			    minor->dev->debugfs_root,
 			    &i915->display.hotplug.ignore_long_hpd);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 31084d95711d..d86394276288 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2870,10 +2870,12 @@ void intel_psr_debugfs_register(struct drm_i915_private *i915)
 {
 	struct drm_minor *minor = i915->drm.primary;
 
-	debugfs_create_file("i915_edp_psr_debug", 0644, minor->debugfs_root,
+	debugfs_create_file("i915_edp_psr_debug", 0644,
+			    minor->dev->debugfs_root,
 			    i915, &i915_edp_psr_debug_fops);
 
-	debugfs_create_file("i915_edp_psr_status", 0444, minor->debugfs_root,
+	debugfs_create_file("i915_edp_psr_status", 0444,
+			    minor->dev->debugfs_root,
 			    i915, &i915_edp_psr_status_fops);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_wm.c b/drivers/gpu/drm/i915/display/intel_wm.c
index bb99179cd5fd..cfa618da262e 100644
--- a/drivers/gpu/drm/i915/display/intel_wm.c
+++ b/drivers/gpu/drm/i915/display/intel_wm.c
@@ -395,13 +395,16 @@ void intel_wm_debugfs_register(struct drm_i915_private *i915)
 {
 	struct drm_minor *minor = i915->drm.primary;
 
-	debugfs_create_file("i915_pri_wm_latency", 0644, minor->debugfs_root,
+	debugfs_create_file("i915_pri_wm_latency", 0644,
+			    minor->dev->debugfs_root,
 			    i915, &i915_pri_wm_latency_fops);
 
-	debugfs_create_file("i915_spr_wm_latency", 0644, minor->debugfs_root,
+	debugfs_create_file("i915_spr_wm_latency", 0644,
+			    minor->dev->debugfs_root,
 			    i915, &i915_spr_wm_latency_fops);
 
-	debugfs_create_file("i915_cur_wm_latency", 0644, minor->debugfs_root,
+	debugfs_create_file("i915_cur_wm_latency", 0644,
+			    minor->dev->debugfs_root,
 			    i915, &i915_cur_wm_latency_fops);
 
 	skl_watermark_debugfs_register(i915);
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 50a9a6adbe32..d108912ae304 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -3709,10 +3709,12 @@ void skl_watermark_debugfs_register(struct drm_i915_private *i915)
 	struct drm_minor *minor = i915->drm.primary;
 
 	if (HAS_IPC(i915))
-		debugfs_create_file("i915_ipc_status", 0644, minor->debugfs_root, i915,
+		debugfs_create_file("i915_ipc_status", 0644,
+				    minor->dev->debugfs_root, i915,
 				    &skl_watermark_ipc_status_fops);
 
 	if (HAS_SAGV(i915))
-		debugfs_create_file("i915_sagv_status", 0444, minor->debugfs_root, i915,
+		debugfs_create_file("i915_sagv_status", 0444,
+				    minor->dev->debugfs_root, i915,
 				    &intel_sagv_status_fops);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index 5fc2df01aa0d..dc3be6b6276a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -84,10 +84,10 @@ void intel_gt_debugfs_register(struct intel_gt *gt)
 {
 	struct dentry *root;
 
-	if (!gt->i915->drm.primary->debugfs_root)
+	if (!gt->i915->drm.debugfs_root)
 		return;
 
-	root = debugfs_create_dir("gt", gt->i915->drm.primary->debugfs_root);
+	root = debugfs_create_dir("gt", gt->i915->drm.debugfs_root);
 	if (IS_ERR(root))
 		return;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 195db8c9d420..57c8b86ee8bc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -543,7 +543,7 @@ static int guc_log_relay_create(struct intel_guc_log *log)
 	n_subbufs = 8;
 
 	guc_log_relay_chan = relay_open("guc_log",
-					i915->drm.primary->debugfs_root,
+					i915->drm.debugfs_root,
 					subbuf_size, n_subbufs,
 					&relay_callbacks, i915);
 	if (!guc_log_relay_chan) {
diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
index baccbf1761b7..f087986747ac 100644
--- a/drivers/gpu/drm/i915/gvt/debugfs.c
+++ b/drivers/gpu/drm/i915/gvt/debugfs.c
@@ -195,7 +195,7 @@ void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu)
 	struct intel_gvt *gvt = vgpu->gvt;
 	struct drm_minor *minor = gvt->gt->i915->drm.primary;
 
-	if (minor->debugfs_root && gvt->debugfs_root) {
+	if (minor->dev->debugfs_root && gvt->debugfs_root) {
 		debugfs_remove_recursive(vgpu->debugfs);
 		vgpu->debugfs = NULL;
 	}
@@ -209,7 +209,7 @@ void intel_gvt_debugfs_init(struct intel_gvt *gvt)
 {
 	struct drm_minor *minor = gvt->gt->i915->drm.primary;
 
-	gvt->debugfs_root = debugfs_create_dir("gvt", minor->debugfs_root);
+	gvt->debugfs_root = debugfs_create_dir("gvt", minor->dev->debugfs_root);
 
 	debugfs_create_ulong("num_tracked_mmio", 0444, gvt->debugfs_root,
 			     &gvt->mmio.num_tracked_mmio);
@@ -223,7 +223,7 @@ void intel_gvt_debugfs_clean(struct intel_gvt *gvt)
 {
 	struct drm_minor *minor = gvt->gt->i915->drm.primary;
 
-	if (minor->debugfs_root) {
+	if (minor->dev->debugfs_root) {
 		debugfs_remove_recursive(gvt->debugfs_root);
 		gvt->debugfs_root = NULL;
 	}
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 16011c0286ad..96f2d6f88243 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -783,17 +783,17 @@ void i915_debugfs_register(struct drm_i915_private *dev_priv)
 
 	i915_debugfs_params(dev_priv);
 
-	debugfs_create_file("i915_forcewake_user", S_IRUSR, minor->debugfs_root,
+	debugfs_create_file("i915_forcewake_user", S_IRUSR, minor->dev->debugfs_root,
 			    to_i915(minor->dev), &i915_forcewake_fops);
 	for (i = 0; i < ARRAY_SIZE(i915_debugfs_files); i++) {
 		debugfs_create_file(i915_debugfs_files[i].name,
 				    S_IRUGO | S_IWUSR,
-				    minor->debugfs_root,
+				    minor->dev->debugfs_root,
 				    to_i915(minor->dev),
 				    i915_debugfs_files[i].fops);
 	}
 
 	drm_debugfs_create_files(i915_debugfs_list,
 				 ARRAY_SIZE(i915_debugfs_list),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
diff --git a/drivers/gpu/drm/i915/i915_debugfs_params.c b/drivers/gpu/drm/i915/i915_debugfs_params.c
index 614bde321589..704a016b3520 100644
--- a/drivers/gpu/drm/i915/i915_debugfs_params.c
+++ b/drivers/gpu/drm/i915/i915_debugfs_params.c
@@ -248,7 +248,7 @@ struct dentry *i915_debugfs_params(struct drm_i915_private *i915)
 	struct i915_params *params = &i915->params;
 	struct dentry *dir;
 
-	dir = debugfs_create_dir("i915_params", minor->debugfs_root);
+	dir = debugfs_create_dir("i915_params", minor->dev->debugfs_root);
 	if (IS_ERR(dir))
 		return dir;
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
index 4b8e70caa3ad..264b4832d3d9 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
@@ -72,10 +72,10 @@ void intel_pxp_debugfs_register(struct intel_pxp *pxp)
 		return;
 
 	minor = pxp->ctrl_gt->i915->drm.primary;
-	if (!minor->debugfs_root)
+	if (!minor->dev->debugfs_root)
 		return;
 
-	pxproot = debugfs_create_dir("pxp", minor->debugfs_root);
+	pxproot = debugfs_create_dir("pxp", minor->dev->debugfs_root);
 	if (IS_ERR(pxproot))
 		return;
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index 6bd397a85834..b858a1590cf4 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -152,8 +152,8 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 
 	drm_debugfs_create_files(a5xx_debugfs_list,
 				 ARRAY_SIZE(a5xx_debugfs_list),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 
-	debugfs_create_file_unsafe("reset", S_IWUGO, minor->debugfs_root, dev,
+	debugfs_create_file_unsafe("reset", S_IWUGO, minor->dev->debugfs_root, dev,
 				&reset_fops);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 758261e8ac73..987c332f216f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2137,7 +2137,7 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 
 	/* create overall sub-directory for the encoder */
 	dpu_enc->debugfs_root = debugfs_create_dir(name,
-			drm_enc->dev->primary->debugfs_root);
+			drm_enc->dev->debugfs_root);
 
 	/* don't error check these */
 	debugfs_create_file("status", 0600,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a683bd9b5a04..3fba86e5b4da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -269,7 +269,7 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	dev = dpu_kms->dev;
 	priv = dev->dev_private;
 
-	entry = debugfs_create_dir("debug", minor->debugfs_root);
+	entry = debugfs_create_dir("debug", minor->dev->debugfs_root);
 
 	debugfs_create_x32(DPU_DEBUGFS_HWMASKNAME, 0600, entry, p);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 29ae5c9613f3..800c0bf78529 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -253,7 +253,7 @@ static int mdp5_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 {
 	drm_debugfs_create_files(mdp5_debugfs_list,
 				 ARRAY_SIZE(mdp5_debugfs_list),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 5e35033ba3e4..eff62032a8f7 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -213,7 +213,7 @@ static void dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 
 	snprintf(path, sizeof(path), "msm_dp-%s", debug->connector->name);
 
-	debug->root = debugfs_create_dir(path, minor->debugfs_root);
+	debug->root = debugfs_create_dir(path, minor->dev->debugfs_root);
 
 	debugfs_create_file("dp_debug", 0444, debug->root,
 			debug, &dp_debug_fops);
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index d6ecff0ab618..4fb5b44073bd 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -309,24 +309,24 @@ void msm_debugfs_init(struct drm_minor *minor)
 
 	drm_debugfs_create_files(msm_debugfs_list,
 				 ARRAY_SIZE(msm_debugfs_list),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 
-	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
+	debugfs_create_file("gpu", S_IRUSR, minor->dev->debugfs_root,
 		dev, &msm_gpu_fops);
 
-	debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
+	debugfs_create_file("kms", S_IRUSR, minor->dev->debugfs_root,
 		dev, &msm_kms_fops);
 
-	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
+	debugfs_create_u32("hangcheck_period_ms", 0600, minor->dev->debugfs_root,
 		&priv->hangcheck_period);
 
-	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
+	debugfs_create_bool("disable_err_irq", 0600, minor->dev->debugfs_root,
 		&priv->disable_err_irq);
 
-	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
+	debugfs_create_file("shrink", S_IRWXU, minor->dev->debugfs_root,
 		dev, &shrink_fops);
 
-	gpu_devfreq = debugfs_create_dir("devfreq", minor->debugfs_root);
+	gpu_devfreq = debugfs_create_dir("devfreq", dev->debugfs_root);
 
 	debugfs_create_bool("idle_clamp",0600, gpu_devfreq,
 			    &priv->gpu_clamp_to_idle);
@@ -341,9 +341,9 @@ void msm_debugfs_init(struct drm_minor *minor)
 		priv->kms->funcs->debugfs_init(priv->kms, minor);
 
 #ifdef CONFIG_FAULT_INJECTION
-	fault_create_debugfs_attr("fail_gem_alloc", minor->debugfs_root,
+	fault_create_debugfs_attr("fail_gem_alloc", minor->dev->debugfs_root,
 				  &fail_gem_alloc);
-	fault_create_debugfs_attr("fail_gem_iova", minor->debugfs_root,
+	fault_create_debugfs_attr("fail_gem_iova", minor->dev->debugfs_root,
 				  &fail_gem_iova);
 #endif
 }
diff --git a/drivers/gpu/drm/msm/msm_perf.c b/drivers/gpu/drm/msm/msm_perf.c
index 3d3da79fec2a..82d8ef9e0e74 100644
--- a/drivers/gpu/drm/msm/msm_perf.c
+++ b/drivers/gpu/drm/msm/msm_perf.c
@@ -214,7 +214,7 @@ int msm_perf_debugfs_init(struct drm_minor *minor)
 	mutex_init(&perf->read_lock);
 	priv->perf = perf;
 
-	debugfs_create_file("perf", S_IFREG | S_IRUGO, minor->debugfs_root,
+	debugfs_create_file("perf", S_IFREG | S_IRUGO, minor->dev->debugfs_root,
 			    perf, &perf_debugfs_fops);
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index db2f847c8535..cd0d4859fef0 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -261,7 +261,7 @@ static struct msm_rd_state *rd_init(struct drm_minor *minor, const char *name)
 
 	init_waitqueue_head(&rd->fifo_event);
 
-	debugfs_create_file(name, S_IFREG | S_IRUGO, minor->debugfs_root, rd,
+	debugfs_create_file(name, S_IFREG | S_IRUGO, minor->dev->debugfs_root, rd,
 			    &rd_debugfs_fops);
 
 	return rd;
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 2a36d1ca8fda..0ea7c19b8da9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -233,18 +233,18 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
 	for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++) {
 		debugfs_create_file(nouveau_debugfs_files[i].name,
 				    S_IRUGO | S_IWUSR,
-				    minor->debugfs_root, minor->dev,
+				    minor->dev->debugfs_root, minor->dev,
 				    nouveau_debugfs_files[i].fops);
 	}
 
 	drm_debugfs_create_files(nouveau_debugfs_list,
 				 NOUVEAU_DEBUGFS_ENTRIES,
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 
 	/* Set the size of the vbios since we know it, and it's confusing to
 	 * userspace if it wants to seek() but the file has a length of 0
 	 */
-	dentry = debugfs_lookup("vbios.rom", minor->debugfs_root);
+	dentry = debugfs_lookup("vbios.rom", minor->dev->debugfs_root);
 	if (!dentry)
 		return;
 
diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
index a3d470468e5b..bc7331531bb9 100644
--- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
+++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
@@ -85,12 +85,12 @@ void omap_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(omap_debugfs_list,
 				 ARRAY_SIZE(omap_debugfs_list),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 
 	if (dmm_is_available())
 		drm_debugfs_create_files(omap_dmm_debugfs_list,
 					 ARRAY_SIZE(omap_dmm_debugfs_list),
-					 minor->debugfs_root, minor);
+					 minor->dev->debugfs_root, minor);
 }
 
 #endif
diff --git a/drivers/gpu/drm/pl111/pl111_debugfs.c b/drivers/gpu/drm/pl111/pl111_debugfs.c
index 6744fa16f464..2603822bf9f4 100644
--- a/drivers/gpu/drm/pl111/pl111_debugfs.c
+++ b/drivers/gpu/drm/pl111/pl111_debugfs.c
@@ -55,5 +55,5 @@ pl111_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(pl111_debugfs_list,
 				 ARRAY_SIZE(pl111_debugfs_list),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 2d9ed3b94574..80e5b12802da 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -90,7 +90,7 @@ qxl_debugfs_init(struct drm_minor *minor)
 	struct qxl_device *dev = to_qxl(minor->dev);
 
 	drm_debugfs_create_files(qxl_debugfs_list, QXL_DEBUGFS_ENTRIES,
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 
 	qxl_ttm_debugfs_init(dev);
 #endif
@@ -120,7 +120,7 @@ void qxl_debugfs_add_files(struct qxl_device *qdev,
 	qdev->debugfs_count = i;
 #if defined(CONFIG_DEBUG_FS)
 	drm_debugfs_create_files(files, nfiles,
-				 qdev->ddev.primary->debugfs_root,
+				 qdev->ddev.debugfs_root,
 				 qdev->ddev.primary);
 #endif
 }
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 1a82629bce3f..f39f3a13e62c 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -238,9 +238,9 @@ void qxl_ttm_debugfs_init(struct qxl_device *qdev)
 #if defined(CONFIG_DEBUG_FS)
 	ttm_resource_manager_create_debugfs(ttm_manager_type(&qdev->mman.bdev,
 							     TTM_PL_VRAM),
-					    qdev->ddev.primary->debugfs_root, "qxl_mem_mm");
+					    qdev->ddev.debugfs_root, "qxl_mem_mm");
 	ttm_resource_manager_create_debugfs(ttm_manager_type(&qdev->mman.bdev,
 							     TTM_PL_PRIV),
-					    qdev->ddev.primary->debugfs_root, "qxl_surf_mm");
+					    qdev->ddev.debugfs_root, "qxl_surf_mm");
 #endif
 }
diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index d4f09ecc3d22..23846346db0f 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -3058,7 +3058,7 @@ DEFINE_SHOW_ATTRIBUTE(r100_debugfs_mc_info);
 void  r100_debugfs_rbbm_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev->ddev->debugfs_root;
 
 	debugfs_create_file("r100_rbbm_info", 0444, root, rdev,
 			    &r100_debugfs_rbbm_info_fops);
@@ -3068,7 +3068,7 @@ void  r100_debugfs_rbbm_init(struct radeon_device *rdev)
 void r100_debugfs_cp_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev->ddev->debugfs_root;
 
 	debugfs_create_file("r100_cp_ring_info", 0444, root, rdev,
 			    &r100_debugfs_cp_ring_info_fops);
@@ -3080,7 +3080,7 @@ void r100_debugfs_cp_init(struct radeon_device *rdev)
 void  r100_debugfs_mc_info_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev->ddev->debugfs_root;
 
 	debugfs_create_file("r100_mc_info", 0444, root, rdev,
 			    &r100_debugfs_mc_info_fops);
diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
index 7b0cfeaddcec..3038426e465c 100644
--- a/drivers/gpu/drm/radeon/r300.c
+++ b/drivers/gpu/drm/radeon/r300.c
@@ -615,7 +615,7 @@ DEFINE_SHOW_ATTRIBUTE(rv370_debugfs_pcie_gart_info);
 static void rv370_debugfs_pcie_gart_info_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev->ddev->debugfs_root;
 
 	debugfs_create_file("rv370_pcie_gart_info", 0444, root, rdev,
 			    &rv370_debugfs_pcie_gart_info_fops);
diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r420.c
index 7e6320e8c6a0..24e595db3dbf 100644
--- a/drivers/gpu/drm/radeon/r420.c
+++ b/drivers/gpu/drm/radeon/r420.c
@@ -492,7 +492,7 @@ DEFINE_SHOW_ATTRIBUTE(r420_debugfs_pipes_info);
 void r420_debugfs_pipes_info_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev->ddev->debugfs_root;
 
 	debugfs_create_file("r420_pipes_info", 0444, root, rdev,
 			    &r420_debugfs_pipes_info_fops);
diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
index dd78fc499402..1a1cf06f968c 100644
--- a/drivers/gpu/drm/radeon/r600.c
+++ b/drivers/gpu/drm/radeon/r600.c
@@ -4358,7 +4358,7 @@ DEFINE_SHOW_ATTRIBUTE(r600_debugfs_mc_info);
 static void r600_debugfs_mc_info_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev->ddev->debugfs_root;
 
 	debugfs_create_file("r600_mc_info", 0444, root, rdev,
 			    &r600_debugfs_mc_info_fops);
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 73e3117420bf..20c178e2e9fd 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -1004,7 +1004,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(radeon_debugfs_gpu_reset_fops,
 void radeon_debugfs_fence_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev->ddev->debugfs_root;
 
 	debugfs_create_file("radeon_gpu_reset", 0444, root, rdev,
 			    &radeon_debugfs_gpu_reset_fops);
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 261fcbae88d7..7779179c9411 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -892,7 +892,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_gem_info);
 void radeon_gem_debugfs_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev->ddev->debugfs_root;
 
 	debugfs_create_file("radeon_gem_info", 0444, root, rdev,
 			    &radeon_debugfs_gem_info_fops);
diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeon/radeon_ib.c
index 6a45a72488f9..0a4c8ce3c6ca 100644
--- a/drivers/gpu/drm/radeon/radeon_ib.c
+++ b/drivers/gpu/drm/radeon/radeon_ib.c
@@ -307,7 +307,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_sa_info);
 static void radeon_debugfs_sa_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev->ddev->debugfs_root;
 
 	debugfs_create_file("radeon_sa_info", 0444, root, rdev,
 			    &radeon_debugfs_sa_info_fops);
diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index cbc554928bcc..e63aead25682 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -1954,7 +1954,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_pm_info);
 static void radeon_debugfs_pm_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev->ddev->debugfs_root;
 
 	debugfs_create_file("radeon_pm_info", 0444, root, rdev,
 			    &radeon_debugfs_pm_info_fops);
diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeon/radeon_ring.c
index 7e207276df37..59f0b97b69eb 100644
--- a/drivers/gpu/drm/radeon/radeon_ring.c
+++ b/drivers/gpu/drm/radeon/radeon_ring.c
@@ -548,7 +548,7 @@ static void radeon_debugfs_ring_init(struct radeon_device *rdev, struct radeon_r
 {
 #if defined(CONFIG_DEBUG_FS)
 	const char *ring_name = radeon_debugfs_ring_idx_to_name(ring->idx);
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev->ddev->debugfs_root;
 
 	if (ring_name)
 		debugfs_create_file(ring_name, 0444, root, ring,
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 2220cdf6a3f6..202a3db46be0 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -899,7 +899,7 @@ static void radeon_ttm_debugfs_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
 	struct drm_minor *minor = rdev->ddev->primary;
-	struct dentry *root = minor->debugfs_root;
+	struct dentry *root = minor->dev->debugfs_root;
 
 	debugfs_create_file("radeon_vram", 0444, root, rdev,
 			    &radeon_ttm_vram_fops);
diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs400.c
index 6383f7a34bd8..79b968b41006 100644
--- a/drivers/gpu/drm/radeon/rs400.c
+++ b/drivers/gpu/drm/radeon/rs400.c
@@ -378,7 +378,7 @@ DEFINE_SHOW_ATTRIBUTE(rs400_debugfs_gart_info);
 static void rs400_debugfs_pcie_gart_info_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev->ddev->debugfs_root;
 
 	debugfs_create_file("rs400_gart_info", 0444, root, rdev,
 			    &rs400_debugfs_gart_info_fops);
diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv515.c
index 63fb06e8e2d7..1ad855b5eb21 100644
--- a/drivers/gpu/drm/radeon/rv515.c
+++ b/drivers/gpu/drm/radeon/rv515.c
@@ -255,7 +255,7 @@ DEFINE_SHOW_ATTRIBUTE(rv515_debugfs_ga_info);
 void rv515_debugfs(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev->ddev->debugfs_root;
 
 	debugfs_create_file("rv515_pipes_info", 0444, root, rdev,
 			    &rv515_debugfs_pipes_info_fops);
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index db0a1eb53532..9b2d671e4a66 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -142,7 +142,7 @@ static void cursor_debugfs_init(struct sti_cursor *cursor,
 
 	drm_debugfs_create_files(cursor_debugfs_files,
 				 ARRAY_SIZE(cursor_debugfs_files),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
 
 static void sti_cursor_argb8888_to_clut8(struct sti_cursor *cursor, u32 *src)
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 1b87b5899f9e..947e07029ce9 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -95,9 +95,9 @@ static void sti_drm_dbg_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(sti_drm_dbg_list,
 				 ARRAY_SIZE(sti_drm_dbg_list),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 
-	debugfs_create_file("fps_show", S_IRUGO | S_IWUSR, minor->debugfs_root,
+	debugfs_create_file("fps_show", S_IRUGO | S_IWUSR, minor->dev->debugfs_root,
 			    minor->dev, &sti_drm_fps_fops);
 
 	DRM_INFO("%s: debugfs installed\n", DRIVER_NAME);
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index 577c477b5f46..6d214a9cde62 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -205,7 +205,7 @@ static void dvo_debugfs_init(struct sti_dvo *dvo, struct drm_minor *minor)
 
 	drm_debugfs_create_files(dvo_debugfs_files,
 				 ARRAY_SIZE(dvo_debugfs_files),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
 
 static void sti_dvo_disable(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index 43c72c2604a0..83dbaa67d81e 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -347,7 +347,7 @@ static int gdp_debugfs_init(struct sti_gdp *gdp, struct drm_minor *minor)
 
 	drm_debugfs_create_files(gdp_debugfs_files,
 				 nb_files,
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index 15097ac67931..f32dfb85f503 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -377,7 +377,7 @@ static void hda_debugfs_init(struct sti_hda *hda, struct drm_minor *minor)
 
 	drm_debugfs_create_files(hda_debugfs_files,
 				 ARRAY_SIZE(hda_debugfs_files),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
 
 /**
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 8539fe1fedc4..3827ca9ced90 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -743,7 +743,7 @@ static void hdmi_debugfs_init(struct sti_hdmi *hdmi, struct drm_minor *minor)
 
 	drm_debugfs_create_files(hdmi_debugfs_files,
 				 ARRAY_SIZE(hdmi_debugfs_files),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
 
 static void sti_hdmi_disable(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 02b77279f6e4..3148e113e2d6 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -650,7 +650,7 @@ static void hqvdp_debugfs_init(struct sti_hqvdp *hqvdp, struct drm_minor *minor)
 
 	drm_debugfs_create_files(hqvdp_debugfs_files,
 				 ARRAY_SIZE(hqvdp_debugfs_files),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
 
 /**
diff --git a/drivers/gpu/drm/sti/sti_mixer.c b/drivers/gpu/drm/sti/sti_mixer.c
index 7e5f14646625..d708fae682cd 100644
--- a/drivers/gpu/drm/sti/sti_mixer.c
+++ b/drivers/gpu/drm/sti/sti_mixer.c
@@ -202,7 +202,7 @@ void sti_mixer_debugfs_init(struct sti_mixer *mixer, struct drm_minor *minor)
 
 	drm_debugfs_create_files(mixer_debugfs_files,
 				 nb_files,
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
 
 void sti_mixer_set_background_status(struct sti_mixer *mixer, bool enable)
diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index 2499715a69b7..fefd04719315 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -579,7 +579,7 @@ static void tvout_debugfs_init(struct sti_tvout *tvout, struct drm_minor *minor)
 
 	drm_debugfs_create_files(tvout_debugfs_files,
 				 ARRAY_SIZE(tvout_debugfs_files),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
 
 static void sti_tvout_encoder_dpms(struct drm_encoder *encoder, int mode)
diff --git a/drivers/gpu/drm/sti/sti_vid.c b/drivers/gpu/drm/sti/sti_vid.c
index 2d818397918d..e8aa6e608c69 100644
--- a/drivers/gpu/drm/sti/sti_vid.c
+++ b/drivers/gpu/drm/sti/sti_vid.c
@@ -133,7 +133,7 @@ void vid_debugfs_init(struct sti_vid *vid, struct drm_minor *minor)
 
 	drm_debugfs_create_files(vid_debugfs_files,
 				 ARRAY_SIZE(vid_debugfs_files),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
 
 void sti_vid_commit(struct sti_vid *vid,
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6ca9f396e55b..4b7465464651 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -876,7 +876,7 @@ static void tegra_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(tegra_debugfs_list,
 				 ARRAY_SIZE(tegra_debugfs_list),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index fe56beea3e93..5a54608d8c83 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -468,7 +468,7 @@ static void tilcdc_debugfs_init(struct drm_minor *minor)
 
 	drm_debugfs_create_files(tilcdc_debugfs_list,
 				 ARRAY_SIZE(tilcdc_debugfs_list),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 
 	list_for_each_entry(mod, &module_list, list)
 		if (mod->funcs->debugfs_init)
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index e5b10e41554a..770b76701764 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -357,7 +357,7 @@ static void arcpgu_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(arcpgu_debugfs_list,
 				 ARRAY_SIZE(arcpgu_debugfs_list),
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4da66ef96783..85fae3ab85c6 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -769,7 +769,7 @@ int vc4_hvs_debugfs_init(struct drm_minor *minor)
 
 	if (!vc4->is_vc5)
 		debugfs_create_bool("hvs_load_tracker", S_IRUGO | S_IWUSR,
-				    minor->debugfs_root,
+				    minor->dev->debugfs_root,
 				    &vc4->load_tracker_enabled);
 
 	drm_debugfs_add_file(drm, "hvs_dlists", vc4_hvs_debugfs_dlist, NULL);
diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 853dd9aa397e..f403d03149bc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -107,5 +107,5 @@ virtio_gpu_debugfs_init(struct drm_minor *minor)
 {
 	drm_debugfs_create_files(virtio_gpu_debugfs_list,
 				 VIRTIO_GPU_DEBUGFS_ENTRIES,
-				 minor->debugfs_root, minor);
+				 minor->dev->debugfs_root, minor);
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 2588615a2a38..d5e70d7f9a54 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1409,7 +1409,7 @@ static void vmw_remove(struct pci_dev *pdev)
 static void vmw_debugfs_resource_managers_init(struct vmw_private *vmw)
 {
 	struct drm_minor *minor = vmw->drm.primary;
-	struct dentry *root = minor->debugfs_root;
+	struct dentry *root = minor->dev->debugfs_root;
 
 	ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, TTM_PL_SYSTEM),
 					    root, "system_ttm");
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index c0da89e16e6f..46ca03d78ad6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -267,7 +267,7 @@ void vmw_debugfs_gem_init(struct vmw_private *vdev)
 {
 #if defined(CONFIG_DEBUG_FS)
 	struct drm_minor *minor = vdev->drm.primary;
-	struct dentry *root = minor->debugfs_root;
+	struct dentry *root = minor->dev->debugfs_root;
 
 	debugfs_create_file("vmwgfx_gem_info", 0444, root, vdev,
 			    &vmw_debugfs_gem_info_fops);
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index e687ce27624e..3ddbeef8f5de 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -77,8 +77,6 @@ struct drm_minor {
 	int type;                       /* Control or render or accel */
 	struct device *kdev;		/* Linux device */
 	struct drm_device *dev;
-
-	struct dentry *debugfs_root;
 };
 
 /**
-- 
2.34.1

