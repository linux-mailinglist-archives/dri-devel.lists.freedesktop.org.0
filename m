Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B207B2A3E88
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AC16EC39;
	Tue,  3 Nov 2020 08:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E95B6E0DC;
 Mon,  2 Nov 2020 17:20:26 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id z24so11367938pgk.3;
 Mon, 02 Nov 2020 09:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=s/yrcS/mUpr/eBQskhZIxhfczD6EI2wbsguueS2jHM4=;
 b=l0BX3cCJyhiYZAWX1b6Hh+88EwOqBUpe0AyX59XW5lZRzzBFEhhPZkJrndzH/ifIL4
 DSAFdJKkEXkLniodERcLXs04lnExwoumVZGgc0jPqVnCdpeULe3Saz9fSP8UYIFUa5EQ
 NLcf9gzRZTsIemZXjViAc3u+AeVr/QqFKbe5Zs1hIB6k/vmrqqTDQJfIxxoK3K7hcQ1Y
 sCzQ/uumtk3d3sPit/Ef2tWwd2A3/sJirMj0Pi6E0bOLWQKh6cEH0LmJEyNowJFJAOCm
 G126ieWcIxG7YQIe4fyovPZ4vw60ndvz2bwItFCRGNdbvgwKkQfT+FX3Fu9n7tKO+gz4
 S4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s/yrcS/mUpr/eBQskhZIxhfczD6EI2wbsguueS2jHM4=;
 b=RtLA60r6xK9qPMphnxD1GvTrGWpxKTI9SpNzP+7UoSMTcfd2NRkL9JUjqdHLsQPLR6
 ahpQGLyTpesRd8oROdvYx9+kmboJIx5UX0yYXBULVWM168DVIjEhwUwQ49j00sRls9ks
 qWIqy9d+jB6x4rjLcmMnvYVVdwWwwmonp4E6u+v6j8G0i481mhaD+J3s28qpjQtnxHDs
 qXuazs1wexsOsrKy9HbVysdgrj43lS3rJDrTp/Env3JURgm11A+P2Isn0iSl1mQ04p3r
 +2hKXEO9iHgmcHx5cd8dtetAe0Z9GzKT/QYWIuu79DNAKKRaYF2wQkjvEaBPRs3FvyCk
 dHsQ==
X-Gm-Message-State: AOAM532e7GtzHPUTVYCvsyjLfDawWIH1u6Wi3ZgZ8eaAnPDc8aTtleeg
 nf7O0LiFV1oyll2P3Dbcqfw=
X-Google-Smtp-Source: ABdhPJxBnbW3JEgsbqKs/vCcgyvbZO9PBL65tKiFBQI5pL9rpySjTYjvisGGb9PTRugLH2cq8B29fQ==
X-Received: by 2002:a65:5c43:: with SMTP id v3mr14610329pgr.271.1604337626118; 
 Mon, 02 Nov 2020 09:20:26 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id p188sm12978522pgp.65.2020.11.02.09.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 09:20:25 -0800 (PST)
Date: Mon, 2 Nov 2020 22:50:19 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, gregkh@linuxfoundation.org,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] drm/amdgpu/amdgpu: improve code indentation and alignment
Message-ID: <2ff7c30f432bf00b3deabd255ee146655d85c532.1604336791.git.mh12gx2825@gmail.com>
References: <d644879c4cac32a7cbdbbeebc97c98efd421e17f.1604336791.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d644879c4cac32a7cbdbbeebc97c98efd421e17f.1604336791.git.mh12gx2825@gmail.com>
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: melissa.srw@gmail.com, daniel.vetter@ffwll.ch, mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

General code indentation and alignment changes such as replace spaces
by tabs or align function arguments as per the coding style
guidelines. The patch corrects issues for various amdgpu_*.c files
for this driver. Issue reported by checkpatch script.

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c       | 22 +++++++++----------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 20 ++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 12 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       | 18 +++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       | 10 ++++-----
 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    | 16 +++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       | 14 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vf_error.c  |  2 +-
 13 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index d3e51d361179..1400957034a1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -36,17 +36,17 @@
 
 #include "acp_gfx_if.h"
 
-#define ACP_TILE_ON_MASK                	0x03
-#define ACP_TILE_OFF_MASK               	0x02
-#define ACP_TILE_ON_RETAIN_REG_MASK     	0x1f
-#define ACP_TILE_OFF_RETAIN_REG_MASK    	0x20
+#define ACP_TILE_ON_MASK			0x03
+#define ACP_TILE_OFF_MASK			0x02
+#define ACP_TILE_ON_RETAIN_REG_MASK		0x1f
+#define ACP_TILE_OFF_RETAIN_REG_MASK		0x20
 
-#define ACP_TILE_P1_MASK                	0x3e
-#define ACP_TILE_P2_MASK                	0x3d
-#define ACP_TILE_DSP0_MASK              	0x3b
-#define ACP_TILE_DSP1_MASK              	0x37
+#define ACP_TILE_P1_MASK			0x3e
+#define ACP_TILE_P2_MASK			0x3d
+#define ACP_TILE_DSP0_MASK			0x3b
+#define ACP_TILE_DSP1_MASK			0x37
 
-#define ACP_TILE_DSP2_MASK              	0x2f
+#define ACP_TILE_DSP2_MASK			0x2f
 
 #define ACP_DMA_REGS_END			0x146c0
 #define ACP_I2S_PLAY_REGS_START			0x14840
@@ -75,8 +75,8 @@
 #define mmACP_CONTROL				0x5131
 #define mmACP_STATUS				0x5133
 #define mmACP_SOFT_RESET			0x5134
-#define ACP_CONTROL__ClkEn_MASK 		0x1
-#define ACP_SOFT_RESET__SoftResetAud_MASK 	0x100
+#define ACP_CONTROL__ClkEn_MASK			0x1
+#define ACP_SOFT_RESET__SoftResetAud_MASK	0x100
 #define ACP_SOFT_RESET__SoftResetAudDone_MASK	0x1000000
 #define ACP_CLOCK_EN_TIME_OUT_VALUE		0x000000FF
 #define ACP_SOFT_RESET_DONE_TIME_OUT_VALUE	0x000000FF
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 5da487b64a66..3fee885f6ac8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1115,19 +1115,19 @@ void amdgpu_amdkfd_gpuvm_destroy_process_vm(struct kgd_dev *kgd, void *vm)
 void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-        struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
 
 	if (WARN_ON(!kgd || !vm))
-                return;
+		return;
 
-        pr_debug("Releasing process vm %p\n", vm);
+	pr_debug("Releasing process vm %p\n", vm);
 
-        /* The original pasid of amdgpu vm has already been
-         * released during making a amdgpu vm to a compute vm
-         * The current pasid is managed by kfd and will be
-         * released on kfd process destroy. Set amdgpu pasid
-         * to 0 to avoid duplicate release.
-         */
+	/* The original pasid of amdgpu vm has already been
+	 * released during making a amdgpu vm to a compute vm
+	 * The current pasid is managed by kfd and will be
+	 * released on kfd process destroy. Set amdgpu pasid
+	 * to 0 to avoid duplicate release.
+	 */
 	amdgpu_vm_release_compute(adev, avm);
 }
 
@@ -1694,7 +1694,7 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 
 	INIT_LIST_HEAD(&(*mem)->bo_va_list);
 	mutex_init(&(*mem)->lock);
-	
+
 	(*mem)->alloc_flags =
 		((bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) ?
 		KFD_IOC_ALLOC_MEM_FLAGS_VRAM : KFD_IOC_ALLOC_MEM_FLAGS_GTT)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 12598a4b5c78..309464a8c06b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -326,7 +326,7 @@ static void amdgpu_cs_get_threshold_for_moves(struct amdgpu_device *adev,
 	increment_us = time_us - adev->mm_stats.last_update_us;
 	adev->mm_stats.last_update_us = time_us;
 	adev->mm_stats.accum_us = min(adev->mm_stats.accum_us + increment_us,
-                                      us_upper_bound);
+				      us_upper_bound);
 
 	/* This prevents the short period of low performance when the VRAM
 	 * usage is low and the driver is in debt or doesn't have enough
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index f076b1ba7319..0e5c7beb97e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -169,14 +169,14 @@ static void amdgpu_debugfs_autodump_init(struct amdgpu_device *adev)
  *
  * Bit 62:  Indicates a GRBM bank switch is needed
  * Bit 61:  Indicates a SRBM bank switch is needed (implies bit 62 is
- * 			zero)
+ *	    zero)
  * Bits 24..33: The SE or ME selector if needed
  * Bits 34..43: The SH (or SA) or PIPE selector if needed
  * Bits 44..53: The INSTANCE (or CU/WGP) or QUEUE selector if needed
  *
  * Bit 23:  Indicates that the PM power gating lock should be held
- * 			This is necessary to read registers that might be
- * 			unreliable during a power gating transistion.
+ *		This is necessary to read registers that might be
+ *		unreliable during a power gating transistion.
  *
  * The lower bits are the BYTE offset of the register to read.  This
  * allows reading multiple registers in a single call and having
@@ -848,7 +848,7 @@ static ssize_t amdgpu_debugfs_sensor_read(struct file *f, char __user *buf,
  * The offset being sought changes which wave that the status data
  * will be returned for.  The bits are used as follows:
  *
- * Bits 0..6: 	Byte offset into data
+ * Bits 0..6:	Byte offset into data
  * Bits 7..14:	SE selector
  * Bits 15..22:	SH/SA selector
  * Bits 23..30: CU/{WGP+SIMD} selector
@@ -864,7 +864,7 @@ static ssize_t amdgpu_debugfs_wave_read(struct file *f, char __user *buf,
 {
 	struct amdgpu_device *adev = f->f_inode->i_private;
 	int r, x;
-	ssize_t result=0;
+	ssize_t result = 0;
 	uint32_t offset, se, sh, cu, wave, simd, data[32];
 
 	if (size & 3 || *pos & 3)
@@ -1210,7 +1210,7 @@ static const char *debugfs_regs_names[] = {
 
 /**
  * amdgpu_debugfs_regs_init -	Initialize debugfs entries that provide
- * 								register access.
+ *				register access.
  *
  * @adev: The device to attach the debugfs entries to
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index c241317edee7..8ab6126ff70c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1494,7 +1494,7 @@ static const struct file_operations amdgpu_driver_kms_fops = {
 
 int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
 {
-        struct drm_file *file;
+	struct drm_file *file;
 
 	if (!filp)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 96a9699f87ba..c3b1b27df153 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -624,14 +624,14 @@ static void psp_prep_ta_load_cmd_buf(struct psp_gfx_cmd_resp *cmd,
 				     uint64_t ta_shared_mc,
 				     uint32_t ta_shared_size)
 {
-	cmd->cmd_id 				= GFX_CMD_ID_LOAD_TA;
+	cmd->cmd_id				= GFX_CMD_ID_LOAD_TA;
 	cmd->cmd.cmd_load_ta.app_phy_addr_lo 	= lower_32_bits(ta_bin_mc);
-	cmd->cmd.cmd_load_ta.app_phy_addr_hi 	= upper_32_bits(ta_bin_mc);
-	cmd->cmd.cmd_load_ta.app_len 		= ta_bin_size;
+	cmd->cmd.cmd_load_ta.app_phy_addr_hi	= upper_32_bits(ta_bin_mc);
+	cmd->cmd.cmd_load_ta.app_len		= ta_bin_size;
 
 	cmd->cmd.cmd_load_ta.cmd_buf_phy_addr_lo = lower_32_bits(ta_shared_mc);
 	cmd->cmd.cmd_load_ta.cmd_buf_phy_addr_hi = upper_32_bits(ta_shared_mc);
-	cmd->cmd.cmd_load_ta.cmd_buf_len 	 = ta_shared_size;
+	cmd->cmd.cmd_load_ta.cmd_buf_len	 = ta_shared_size;
 }
 
 static int psp_xgmi_init_shared_buf(struct psp_context *psp)
@@ -655,9 +655,9 @@ static void psp_prep_ta_invoke_cmd_buf(struct psp_gfx_cmd_resp *cmd,
 				       uint32_t ta_cmd_id,
 				       uint32_t session_id)
 {
-	cmd->cmd_id 				= GFX_CMD_ID_INVOKE_CMD;
-	cmd->cmd.cmd_invoke_cmd.session_id 	= session_id;
-	cmd->cmd.cmd_invoke_cmd.ta_cmd_id 	= ta_cmd_id;
+	cmd->cmd_id				= GFX_CMD_ID_INVOKE_CMD;
+	cmd->cmd.cmd_invoke_cmd.session_id	= session_id;
+	cmd->cmd.cmd_invoke_cmd.ta_cmd_id	= ta_cmd_id;
 }
 
 static int psp_ta_invoke(struct psp_context *psp,
@@ -2520,9 +2520,9 @@ int parse_ta_bin_descriptor(struct psp_context *psp,
 
 	switch (desc->fw_type) {
 	case TA_FW_TYPE_PSP_ASD:
-		psp->asd_fw_version 	   = le32_to_cpu(desc->fw_version);
+		psp->asd_fw_version	   = le32_to_cpu(desc->fw_version);
 		psp->asd_feature_version   = le32_to_cpu(desc->fw_version);
-		psp->asd_ucode_size 	   = le32_to_cpu(desc->size_bytes);
+		psp->asd_ucode_size	   = le32_to_cpu(desc->size_bytes);
 		psp->asd_start_addr 	   = ucode_start_addr;
 		break;
 	case TA_FW_TYPE_PSP_XGMI:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 4e36551ab50b..687043b84b8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -516,9 +516,9 @@ struct ras_manager *amdgpu_ras_find_obj(struct amdgpu_device *adev,
 /* obj end */
 
 static void amdgpu_ras_parse_status_code(struct amdgpu_device *adev,
-				  const char* 		invoke_type,
-				  const char* 		block_name,
-				  enum ta_ras_status 	ret)
+					 const char *invoke_type,
+					 const char *block_name,
+					 enum ta_ras_status ret)
 {
 	switch (ret) {
 	case TA_RAS_STATUS__SUCCESS:
@@ -607,7 +607,7 @@ int amdgpu_ras_feature_enable(struct amdgpu_device *adev,
 	if (!con)
 		return -EINVAL;
 
-        info = kzalloc(sizeof(union ta_ras_cmd_input), GFP_KERNEL);
+	info = kzalloc(sizeof(union ta_ras_cmd_input), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
@@ -2156,7 +2156,7 @@ void amdgpu_ras_late_fini(struct amdgpu_device *adev,
 
 	amdgpu_ras_sysfs_remove(adev, ras_block);
 	if (ih_info->cb)
-                amdgpu_ras_interrupt_remove_handler(adev, ih_info);
+		amdgpu_ras_interrupt_remove_handler(adev, ih_info);
 	amdgpu_ras_feature_enable(adev, ras_block, 0);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index 0e64c39a2372..00cf78f76b38 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -27,9 +27,9 @@
 #include <linux/bits.h>
 #include "atom.h"
 
-#define EEPROM_I2C_TARGET_ADDR_VEGA20    	0xA0
-#define EEPROM_I2C_TARGET_ADDR_ARCTURUS  	0xA8
-#define EEPROM_I2C_TARGET_ADDR_ARCTURUS_D342  	0xA0
+#define EEPROM_I2C_TARGET_ADDR_VEGA20		0xA0
+#define EEPROM_I2C_TARGET_ADDR_ARCTURUS		0xA8
+#define EEPROM_I2C_TARGET_ADDR_ARCTURUS_D342	0xA0
 
 /*
  * The 2 macros bellow represent the actual size in bytes that
@@ -124,11 +124,11 @@ static void __decode_table_header_from_buff(struct amdgpu_ras_eeprom_table_heade
 {
 	uint32_t *pp = (uint32_t *)buff;
 
-	hdr->header 	      = le32_to_cpu(pp[0]);
-	hdr->version 	      = le32_to_cpu(pp[1]);
-	hdr->first_rec_offset = le32_to_cpu(pp[2]);
-	hdr->tbl_size 	      = le32_to_cpu(pp[3]);
-	hdr->checksum 	      = le32_to_cpu(pp[4]);
+	hdr->header		= le32_to_cpu(pp[0]);
+	hdr->version		= le32_to_cpu(pp[1]);
+	hdr->first_rec_offset	= le32_to_cpu(pp[2]);
+	hdr->tbl_size		= le32_to_cpu(pp[3]);
+	hdr->checksum		= le32_to_cpu(pp[4]);
 }
 
 static int __update_table_header(struct amdgpu_ras_eeprom_control *control,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c
index 0bd1d4ffc19e..524d10b21041 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c
@@ -75,7 +75,7 @@ int amdgpu_sa_bo_manager_init(struct amdgpu_device *adev,
 }
 
 void amdgpu_sa_bo_manager_fini(struct amdgpu_device *adev,
-                              struct amdgpu_sa_manager *sa_manager)
+			       struct amdgpu_sa_manager *sa_manager)
 {
 	struct amdgpu_sa_bo *sa_bo, *tmp;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 250a309e4dee..de91d29c9d96 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -126,7 +126,7 @@ int amdgpu_sdma_ras_late_init(struct amdgpu_device *adev,
 		goto free;
 	}
 
-        return 0;
+	return 0;
 
 late_fini:
 	amdgpu_ras_late_fini(adev, adev->sdma.ras_if, ih_info);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 8039d2399584..a5b466d3248c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -981,7 +981,7 @@ void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm, struct page **pages)
 }
 
 /**
- * amdgpu_ttm_tt_pin_userptr - 	prepare the sg table with the user pages
+ * amdgpu_ttm_tt_pin_userptr -	prepare the sg table with the user pages
  *
  * Called by amdgpu_ttm_backend_bind()
  **/
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index f3b7287e84c4..3126beef1595 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -37,13 +37,13 @@
 #define FIRMWARE_RAVEN		"amdgpu/raven_vcn.bin"
 #define FIRMWARE_PICASSO	"amdgpu/picasso_vcn.bin"
 #define FIRMWARE_RAVEN2		"amdgpu/raven2_vcn.bin"
-#define FIRMWARE_ARCTURUS 	"amdgpu/arcturus_vcn.bin"
-#define FIRMWARE_RENOIR 	"amdgpu/renoir_vcn.bin"
-#define FIRMWARE_NAVI10 	"amdgpu/navi10_vcn.bin"
-#define FIRMWARE_NAVI14 	"amdgpu/navi14_vcn.bin"
-#define FIRMWARE_NAVI12 	"amdgpu/navi12_vcn.bin"
-#define FIRMWARE_SIENNA_CICHLID 	"amdgpu/sienna_cichlid_vcn.bin"
-#define FIRMWARE_NAVY_FLOUNDER 	"amdgpu/navy_flounder_vcn.bin"
+#define FIRMWARE_ARCTURUS	"amdgpu/arcturus_vcn.bin"
+#define FIRMWARE_RENOIR		"amdgpu/renoir_vcn.bin"
+#define FIRMWARE_NAVI10		"amdgpu/navi10_vcn.bin"
+#define FIRMWARE_NAVI14		"amdgpu/navi14_vcn.bin"
+#define FIRMWARE_NAVI12		"amdgpu/navi12_vcn.bin"
+#define FIRMWARE_SIENNA_CICHLID	"amdgpu/sienna_cichlid_vcn.bin"
+#define FIRMWARE_NAVY_FLOUNDER	"amdgpu/navy_flounder_vcn.bin"
 
 MODULE_FIRMWARE(FIRMWARE_RAVEN);
 MODULE_FIRMWARE(FIRMWARE_PICASSO);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vf_error.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vf_error.c
index 7f7097931c6f..f9d3d79f68b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vf_error.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vf_error.c
@@ -59,7 +59,7 @@ void amdgpu_vf_error_trans_all(struct amdgpu_device *adev)
 		return;
 	}
 /*
- 	TODO: Enable these code when pv2vf_info is merged
+	TODO: Enable these code when pv2vf_info is merged
 	AMDGPU_FW_VRAM_PF2VF_READ (adev, feature_flags, &pf2vf_flags);
 	if (!(pf2vf_flags & AMDGIM_FEATURE_ERROR_LOG_COLLECT)) {
 		return;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
