Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25800AF8A1B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750A410E977;
	Fri,  4 Jul 2025 07:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0F7qHh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E67C10E97E;
 Fri,  4 Jul 2025 07:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751615663; x=1783151663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2oLAN0I3MPH743jpOiM312shdseQ1P5Sz0tCpCEQSuw=;
 b=n0F7qHh3aau8cR2om4TYR4dCoriYmQ76iMyTOFwdZqZ+gpQR+M3R4ccC
 UH27meT+r1xOx8tp5z4mpuzbfN5n6Klr6ldyTT4cCC4t6Iq9HRXLxBn8Y
 +Z9Hsuuwbh67JWXTX+bT59cSV0Nx5vgC5tI6N7h1Tv/6UAIts94x35D8a
 sCUkqLkWPpW0JgkbgZgCvQzDAUK/RBoTWNBQvl+EVbdu5oa2r1+Qj+qGs
 ZbHgPmUH3bdRu5XgsjaixTsHE/y7MNSV/ZhK8TgeIh2P8MN17p0La0W3S
 f0PraOwAfOpAIyYrgvcZgw1LDAqaVAb795xJIN6hpq6NBbASB0taZIaNK A==;
X-CSE-ConnectionGUID: 9q1T4WXvRXucTBhFUee90w==
X-CSE-MsgGUID: 47QfHgiXSWGEmPVIMMSduA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494604"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="76494604"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:22 -0700
X-CSE-ConnectionGUID: RhFtQ7PRQl6VBE4/Qd22QQ==
X-CSE-MsgGUID: fBIQ85yES5ehhaXU4RLS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="158924260"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 svinhufvud.fi.intel.com) ([10.245.244.244])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:11 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
 by svinhufvud.fi.intel.com (Postfix) with ESMTP id 8B01D44419;
 Fri,  4 Jul 2025 10:54:09 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Antonio Quartulli <antonio@mandelbit.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Harry Wentland <harry.wentland@amd.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Ma Ke <make24@iscas.ac.cn>, Yang Wang <kevinyang.wang@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tim Huang <tim.huang@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Asad Kamal <asad.kamal@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Prike Liang <Prike.Liang@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 ganglxie <ganglxie@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 16/80] drm/amd: Remove redundant pm_runtime_mark_last_busy()
 calls
Date: Fri,  4 Jul 2025 10:54:09 +0300
Message-Id: <20250704075409.3217885-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  1 -
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  4 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 25 -------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  4 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c       |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |  1 -
 .../gpu/drm/amd/amdgpu/amdgpu_securedisplay.c |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     |  1 -
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  1 -
 drivers/gpu/drm/amd/pm/amdgpu_pm.c            |  1 -
 14 files changed, 47 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index f5466c592d94..9e4f135b9173 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -507,7 +507,6 @@ static int amdgpu_atif_handler(struct amdgpu_device *adev,
 				pm_runtime_get_sync(adev_to_drm(adev)->dev);
 				/* Just fire off a uevent and let userspace tell us what to do */
 				drm_helper_hpd_irq_event(adev_to_drm(adev));
-				pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 				pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			}
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 5e375e9c4f5d..7220ecb93ff7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -738,7 +738,6 @@ amdgpu_connector_lvds_detect(struct drm_connector *connector, bool force)
 	amdgpu_connector_update_scratch_regs(connector, ret);
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
 		pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
@@ -923,7 +922,6 @@ amdgpu_connector_vga_detect(struct drm_connector *connector, bool force)
 
 out:
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
 		pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
@@ -1150,7 +1148,6 @@ amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
 
 exit:
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
 		pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
@@ -1450,7 +1447,6 @@ amdgpu_connector_dp_detect(struct drm_connector *connector, bool force)
 	amdgpu_connector_update_scratch_regs(connector, ret);
 out:
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
 		pm_runtime_put_autosuspend(connector->dev->dev);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 83f211903425..2c724e8354de 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -129,7 +129,6 @@ static int  amdgpu_debugfs_process_reg_op(bool read, struct file *f,
 	if (use_bank) {
 		if ((sh_bank != 0xFFFFFFFF && sh_bank >= adev->gfx.config.max_sh_per_se) ||
 		    (se_bank != 0xFFFFFFFF && se_bank >= adev->gfx.config.max_shader_engines)) {
-			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			amdgpu_virt_disable_access_debugfs(adev);
 			return -EINVAL;
@@ -179,7 +178,6 @@ static int  amdgpu_debugfs_process_reg_op(bool read, struct file *f,
 	if (pm_pg_lock)
 		mutex_unlock(&adev->pm.mutex);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	amdgpu_virt_disable_access_debugfs(adev);
@@ -255,7 +253,6 @@ static ssize_t amdgpu_debugfs_regs2_op(struct file *f, char __user *buf, u32 off
 	if (rd->id.use_grbm) {
 		if ((rd->id.grbm.sh != 0xFFFFFFFF && rd->id.grbm.sh >= adev->gfx.config.max_sh_per_se) ||
 		    (rd->id.grbm.se != 0xFFFFFFFF && rd->id.grbm.se >= adev->gfx.config.max_shader_engines)) {
-			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			amdgpu_virt_disable_access_debugfs(adev);
 			mutex_unlock(&rd->lock);
@@ -310,7 +307,6 @@ static ssize_t amdgpu_debugfs_regs2_op(struct file *f, char __user *buf, u32 off
 
 	mutex_unlock(&rd->lock);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	amdgpu_virt_disable_access_debugfs(adev);
@@ -446,7 +442,6 @@ static ssize_t amdgpu_debugfs_gprwave_read(struct file *f, char __user *buf, siz
 	amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, rd->id.xcc_id);
 	mutex_unlock(&adev->grbm_idx_mutex);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (!x) {
@@ -557,7 +552,6 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struct file *f, char __user *buf,
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
@@ -617,7 +611,6 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(struct file *f, const char __user
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
@@ -676,7 +669,6 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
@@ -736,7 +728,6 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
@@ -795,7 +786,6 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct file *f, char __user *buf,
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
@@ -855,7 +845,6 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct file *f, const char __user *
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return r;
@@ -1003,7 +992,6 @@ static ssize_t amdgpu_debugfs_sensor_read(struct file *f, char __user *buf,
 
 	r = amdgpu_dpm_read_sensor(adev, idx, &values[0], &valuesize);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (r) {
@@ -1094,7 +1082,6 @@ static ssize_t amdgpu_debugfs_wave_read(struct file *f, char __user *buf,
 	amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0);
 	mutex_unlock(&adev->grbm_idx_mutex);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (!x) {
@@ -1192,7 +1179,6 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
 	amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0);
 	mutex_unlock(&adev->grbm_idx_mutex);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	while (size) {
@@ -1266,7 +1252,6 @@ static ssize_t amdgpu_debugfs_gfxoff_residency_read(struct file *f, char __user
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
@@ -1315,7 +1300,6 @@ static ssize_t amdgpu_debugfs_gfxoff_residency_write(struct file *f, const char
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
@@ -1365,7 +1349,6 @@ static ssize_t amdgpu_debugfs_gfxoff_count_read(struct file *f, char __user *buf
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
@@ -1414,7 +1397,6 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct file *f, const char __user *bu
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
@@ -1460,7 +1442,6 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
@@ -1501,7 +1482,6 @@ static ssize_t amdgpu_debugfs_gfxoff_status_read(struct file *f, char __user *bu
 
 	r = result;
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
@@ -1701,7 +1681,6 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 
 	up_write(&adev->reset_domain->sem);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
@@ -1721,7 +1700,6 @@ static int amdgpu_debugfs_evict_vram(void *data, u64 *val)
 
 	*val = amdgpu_ttm_evict_resources(adev, TTM_PL_VRAM);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
@@ -1742,7 +1720,6 @@ static int amdgpu_debugfs_evict_gtt(void *data, u64 *val)
 
 	*val = amdgpu_ttm_evict_resources(adev, TTM_PL_TT);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
@@ -1762,7 +1739,6 @@ static int amdgpu_debugfs_benchmark(void *data, u64 val)
 
 	r = amdgpu_benchmark(adev, val);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return r;
@@ -2014,7 +1990,6 @@ static int amdgpu_debugfs_sclk_set(void *data, u64 val)
 		ret = -EINVAL;
 
 out:
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 9e463d3ee927..d5844fee7204 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -332,8 +332,6 @@ int amdgpu_display_crtc_set_config(struct drm_mode_set *set,
 		if (crtc->enabled)
 			active = true;
 
-	pm_runtime_mark_last_busy(dev->dev);
-
 	adev = drm_to_adev(dev);
 	/* if we have active crtcs and we don't have a power ref,
 	 * take the current one
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index b299e15bb5e5..24edb5a327c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2228,7 +2228,6 @@ static void amdgpu_get_secondary_funcs(struct amdgpu_device *adev)
 						adev->pdev->bus->number, i);
 		if (p) {
 			pm_runtime_get_sync(&p->dev);
-			pm_runtime_mark_last_busy(&p->dev);
 			pm_runtime_put_autosuspend(&p->dev);
 			pci_dev_put(p);
 		}
@@ -2469,7 +2468,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 
 		pm_runtime_allow(ddev->dev);
 
-		pm_runtime_mark_last_busy(ddev->dev);
 		pm_runtime_put_autosuspend(ddev->dev);
 
 		pci_wake_from_d3(pdev, TRUE);
@@ -2907,7 +2905,6 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
 
 	ret = amdgpu_runtime_idle_check_userq(dev);
 done:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_autosuspend(dev);
 	return ret;
 }
@@ -2926,7 +2923,6 @@ long amdgpu_drm_ioctl(struct file *filp,
 
 	ret = drm_ioctl(filp, cmd, arg);
 
-	pm_runtime_mark_last_busy(dev->dev);
 out:
 	pm_runtime_put_autosuspend(dev->dev);
 	return ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 2c3547f4cea4..5e52ac2f9206 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -267,7 +267,6 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
 
 		dma_fence_signal(fence);
 		dma_fence_put(fence);
-		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	} while (last_seq != seq);
 
@@ -920,7 +919,6 @@ static int gpu_recover_get(void *data, u64 *val)
 
 	*val = atomic_read(&adev->reset_domain->reset_res);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index c80c8f543532..c922e141f4c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -1594,7 +1594,6 @@ static ssize_t amdgpu_gfx_set_run_cleaner_shader(struct device *dev,
 
 	ret = amdgpu_gfx_run_cleaner_shader(adev, value);
 
-	pm_runtime_mark_last_busy(ddev->dev);
 	pm_runtime_put_autosuspend(ddev->dev);
 
 	if (ret)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 195ed81d39ff..c7233f30a29f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1450,7 +1450,6 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	kfree(fpriv);
 
 out_suspend:
-	pm_runtime_mark_last_busy(dev->dev);
 pm_put:
 	pm_runtime_put_autosuspend(dev->dev);
 
@@ -1521,7 +1520,6 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 	kfree(fpriv);
 	file_priv->driver_priv = NULL;
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
index 123bcf5c2bb1..bacf888735db 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
@@ -101,7 +101,6 @@ static ssize_t amdgpu_rap_debugfs_write(struct file *f, const char __user *buf,
 	}
 
 	amdgpu_gfx_off_ctrl(adev, true);
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return size;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index dd37d8815ba5..258acce7db8f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -3869,7 +3869,6 @@ static void amdgpu_ras_counte_dw(struct work_struct *work)
 		atomic_set(&con->ras_ue_count, ue_count);
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
 Out:
 	pm_runtime_put_autosuspend(dev->dev);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
index 41ebe690eeff..3739be1b71e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
@@ -159,7 +159,6 @@ static ssize_t amdgpu_securedisplay_debugfs_write(struct file *f, const char __u
 		dev_err(adev->dev, "Invalid input: %s\n", str);
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return size;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 295e7186e156..5e939ea8ea42 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -322,7 +322,6 @@ amdgpu_userq_destroy(struct drm_file *filp, int queue_id)
 	amdgpu_userq_cleanup(uq_mgr, queue, queue_id);
 	mutex_unlock(&uq_mgr->userq_mutex);
 
-	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 5be28c6c4f6a..04b1abd8e80a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1083,7 +1083,6 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 		 * for auto suspend
 		 */
 		if (pdd->runtime_inuse) {
-			pm_runtime_mark_last_busy(adev_to_drm(pdd->dev->adev)->dev);
 			pm_runtime_put_autosuspend(adev_to_drm(pdd->dev->adev)->dev);
 			pdd->runtime_inuse = false;
 		}
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index edd9895b46c0..728b3982df57 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -172,7 +172,6 @@ static int amdgpu_pm_get_access_if_active(struct amdgpu_device *adev)
  */
 static inline void amdgpu_pm_put_access(struct amdgpu_device *adev)
 {
-	pm_runtime_mark_last_busy(adev->dev);
 	pm_runtime_put_autosuspend(adev->dev);
 }
 
-- 
2.39.5

