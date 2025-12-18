Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A60ACCD472
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBC610E94F;
	Thu, 18 Dec 2025 18:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UGZx8kIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6EF10E94F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766084031; x=1797620031;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kqCVpJkSDIFVnQiaMs9SSgGwpNKDrxO04gAICZ59Wf8=;
 b=UGZx8kInN1PKP8VxuWVqEKU8fV3NxJzYI5VEDkxm9VvzGP3sj9xfuKhE
 8M6BxqIoz63t7EToJhKpmc0mH/zpAv8Lhn0ZS2pJzHKjYFxxGEFazZgAK
 UdM42BDzo0Ud8iiu/4Q4995qkvu7ITVmS+1SsebxemkcJJhn3kN3OV7wq
 01cvXpH1oFno6XMJOHilGB7HnWpXbnfvhOBch/XcE5Kn4OgjbEChOcIGC
 fvEaaNv1Fi1nL+SpXtR4/cOD1xKfWFNXANEElGovkS9QoMNHOspw94O/z
 9QF5Nxik3taeMgf3r0zPX9y3YyxMPFONhvZ9s8YkuOfpl4MA8zTE9BubL A==;
X-CSE-ConnectionGUID: XqoIZpztQb6yyYOK9eroTg==
X-CSE-MsgGUID: MREdO1d7Rb6SppijK6MM/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68201323"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68201323"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:53:50 -0800
X-CSE-ConnectionGUID: 9E+3ODdqSL2VO6mj2f0PIg==
X-CSE-MsgGUID: JFQnACXoTlyHpG4cdvUMzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198423019"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.246])
 ([10.246.17.246])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:53:49 -0800
Message-ID: <4aa53d2e-48ef-485d-b5ba-2da799f9df5a@linux.intel.com>
Date: Thu, 18 Dec 2025 19:53:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Remove NPU2 support
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20251217190818.2145781-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251217190818.2145781-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 12/17/2025 8:08 PM, Lizhi Hou wrote:
> NPU2 hardware was never publicly released and is now obsolete.
> Remove all remaining NPU2 support from the driver.
>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/Makefile          |   1 -
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |   1 -
>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 -
>   drivers/accel/amdxdna/npu2_regs.c       | 117 ------------------------
>   4 files changed, 120 deletions(-)
>   delete mode 100644 drivers/accel/amdxdna/npu2_regs.c
>
> diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
> index 6344aaf523fa..3fa0e74fd8f5 100644
> --- a/drivers/accel/amdxdna/Makefile
> +++ b/drivers/accel/amdxdna/Makefile
> @@ -18,7 +18,6 @@ amdxdna-y := \
>   	amdxdna_sysfs.o \
>   	amdxdna_ubuf.o \
>   	npu1_regs.o \
> -	npu2_regs.o \
>   	npu4_regs.o \
>   	npu5_regs.o \
>   	npu6_regs.o
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index fcf7e7869007..7d59764d7869 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -51,7 +51,6 @@ MODULE_DEVICE_TABLE(pci, pci_ids);
>   
>   static const struct amdxdna_device_id amdxdna_ids[] = {
>   	{ 0x1502, 0x0,  &dev_npu1_info },
> -	{ 0x17f0, 0x0,  &dev_npu2_info },
>   	{ 0x17f0, 0x10, &dev_npu4_info },
>   	{ 0x17f0, 0x11, &dev_npu5_info },
>   	{ 0x17f0, 0x20, &dev_npu6_info },
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> index 0d50c4c8b353..6580cb5ec7e2 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> @@ -137,7 +137,6 @@ struct amdxdna_client {
>   
>   /* Add device info below */
>   extern const struct amdxdna_dev_info dev_npu1_info;
> -extern const struct amdxdna_dev_info dev_npu2_info;
>   extern const struct amdxdna_dev_info dev_npu4_info;
>   extern const struct amdxdna_dev_info dev_npu5_info;
>   extern const struct amdxdna_dev_info dev_npu6_info;
> diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
> deleted file mode 100644
> index ad0743fb06d5..000000000000
> --- a/drivers/accel/amdxdna/npu2_regs.c
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
> - */
> -
> -#include <drm/amdxdna_accel.h>
> -#include <drm/drm_device.h>
> -#include <drm/gpu_scheduler.h>
> -#include <linux/sizes.h>
> -
> -#include "aie2_pci.h"
> -#include "amdxdna_mailbox.h"
> -#include "amdxdna_pci_drv.h"
> -
> -/* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
> -#define MPNPU_PWAITMODE                0x301003C
> -#define MPNPU_PUB_SEC_INTR             0x3010060
> -#define MPNPU_PUB_PWRMGMT_INTR         0x3010064
> -#define MPNPU_PUB_SCRATCH0             0x301006C
> -#define MPNPU_PUB_SCRATCH1             0x3010070
> -#define MPNPU_PUB_SCRATCH2             0x3010074
> -#define MPNPU_PUB_SCRATCH3             0x3010078
> -#define MPNPU_PUB_SCRATCH4             0x301007C
> -#define MPNPU_PUB_SCRATCH5             0x3010080
> -#define MPNPU_PUB_SCRATCH6             0x3010084
> -#define MPNPU_PUB_SCRATCH7             0x3010088
> -#define MPNPU_PUB_SCRATCH8             0x301008C
> -#define MPNPU_PUB_SCRATCH9             0x3010090
> -#define MPNPU_PUB_SCRATCH10            0x3010094
> -#define MPNPU_PUB_SCRATCH11            0x3010098
> -#define MPNPU_PUB_SCRATCH12            0x301009C
> -#define MPNPU_PUB_SCRATCH13            0x30100A0
> -#define MPNPU_PUB_SCRATCH14            0x30100A4
> -#define MPNPU_PUB_SCRATCH15            0x30100A8
> -#define MP0_C2PMSG_73                  0x3810A24
> -#define MP0_C2PMSG_123                 0x3810AEC
> -
> -#define MP1_C2PMSG_0                   0x3B10900
> -#define MP1_C2PMSG_60                  0x3B109F0
> -#define MP1_C2PMSG_61                  0x3B109F4
> -
> -#define MPNPU_SRAM_X2I_MAILBOX_0       0x3600000
> -#define MPNPU_SRAM_X2I_MAILBOX_15      0x361E000
> -#define MPNPU_SRAM_X2I_MAILBOX_31      0x363E000
> -#define MPNPU_SRAM_I2X_MAILBOX_31      0x363F000
> -
> -#define MMNPU_APERTURE0_BASE           0x3000000
> -#define MMNPU_APERTURE1_BASE           0x3600000
> -#define MMNPU_APERTURE3_BASE           0x3810000
> -#define MMNPU_APERTURE4_BASE           0x3B10000
> -
> -/* PCIe BAR Index for NPU2 */
> -#define NPU2_REG_BAR_INDEX	0
> -#define NPU2_MBOX_BAR_INDEX	0
> -#define NPU2_PSP_BAR_INDEX	4
> -#define NPU2_SMU_BAR_INDEX	5
> -#define NPU2_SRAM_BAR_INDEX	2
> -/* Associated BARs and Apertures */
> -#define NPU2_REG_BAR_BASE	MMNPU_APERTURE0_BASE
> -#define NPU2_MBOX_BAR_BASE	MMNPU_APERTURE0_BASE
> -#define NPU2_PSP_BAR_BASE	MMNPU_APERTURE3_BASE
> -#define NPU2_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
> -#define NPU2_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
> -
> -static const struct amdxdna_dev_priv npu2_dev_priv = {
> -	.fw_path        = "amdnpu/17f0_00/npu.sbin",
> -	.protocol_major = 0x6,
> -	.protocol_minor = 0x6,
> -	.rt_config	= npu4_default_rt_cfg,
> -	.dpm_clk_tbl	= npu4_dpm_clk_table,
> -	.fw_feature_tbl = npu4_fw_feature_table,
> -	.col_align	= COL_ALIGN_NATURE,
> -	.mbox_dev_addr  = NPU2_MBOX_BAR_BASE,
> -	.mbox_size      = 0, /* Use BAR size */
> -	.sram_dev_addr  = NPU2_SRAM_BAR_BASE,
> -	.hwctx_limit    = 16,
> -	.sram_offs      = {
> -		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU2_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
> -		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU2_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
> -	},
> -	.psp_regs_off   = {
> -		DEFINE_BAR_OFFSET(PSP_CMD_REG,    NPU2_PSP, MP0_C2PMSG_123),
> -		DEFINE_BAR_OFFSET(PSP_ARG0_REG,   NPU2_REG, MPNPU_PUB_SCRATCH3),
> -		DEFINE_BAR_OFFSET(PSP_ARG1_REG,   NPU2_REG, MPNPU_PUB_SCRATCH4),
> -		DEFINE_BAR_OFFSET(PSP_ARG2_REG,   NPU2_REG, MPNPU_PUB_SCRATCH9),
> -		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU2_PSP, MP0_C2PMSG_73),
> -		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU2_PSP, MP0_C2PMSG_123),
> -		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU2_REG, MPNPU_PUB_SCRATCH3),
> -		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU2_REG, MPNPU_PWAITMODE),
> -	},
> -	.smu_regs_off   = {
> -		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU2_SMU, MP1_C2PMSG_0),
> -		DEFINE_BAR_OFFSET(SMU_ARG_REG,  NPU2_SMU, MP1_C2PMSG_60),
> -		DEFINE_BAR_OFFSET(SMU_INTR_REG, NPU2_SMU, MMNPU_APERTURE4_BASE),
> -		DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU2_SMU, MP1_C2PMSG_61),
> -		DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU2_SMU, MP1_C2PMSG_60),
> -	},
> -	.hw_ops	=	 {
> -		.set_dpm = npu4_set_dpm,
> -	},
> -};
> -
> -const struct amdxdna_dev_info dev_npu2_info = {
> -	.reg_bar           = NPU2_REG_BAR_INDEX,
> -	.mbox_bar          = NPU2_MBOX_BAR_INDEX,
> -	.sram_bar          = NPU2_SRAM_BAR_INDEX,
> -	.psp_bar           = NPU2_PSP_BAR_INDEX,
> -	.smu_bar           = NPU2_SMU_BAR_INDEX,
> -	.first_col         = 0,
> -	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
> -	.dev_mem_base      = AIE2_DEVM_BASE,
> -	.dev_mem_size      = AIE2_DEVM_SIZE,
> -	.vbnv              = "RyzenAI-npu2",
> -	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
> -	.dev_priv          = &npu2_dev_priv,
> -	.ops               = &aie2_ops, /* NPU2 can share NPU1's callback */
> -};
