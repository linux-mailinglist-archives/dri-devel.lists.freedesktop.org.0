Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5ADB208A4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 14:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB6010E3D0;
	Mon, 11 Aug 2025 12:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="V/MIdt+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A7610E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 12:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754914886; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=c3nDaH7pjPL8FETLyZ432f8sZtj8VuNSjNtlF17IYaTv/gdygzF88RCM/MejX7mcNZ9mVdMBbzaO9Tj3ynezhBlaLlUEj0/iXKjO+4UwD4SSuNQ3m23ZwrTuAr33bmiHP3SF3GqxI3+TEdFgxz0/Dshx/r/YHYY/96kYHid4mmk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1754914886;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6YPyznItPeL8QP2QJ0jPFy87s095al91cloDpCuZVPM=; 
 b=WhGBdx/C8V/PpPgCEeko5UxOdG+0MBg2tKbbtA45pj6r3t0QTCHHW+h/nVD6NT+rgVV35hyvq6MV5Dyzi+k0D8i6T6R+gxcL0Jb/p5bqRc2/lp7GERyEDtumsxXZ74OfC4noQ+fHJLzl/pysEjigoDndCM6FuyypTeagVzk+Eak=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754914886; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=6YPyznItPeL8QP2QJ0jPFy87s095al91cloDpCuZVPM=;
 b=V/MIdt+uYUo2qbC8K4DQALC4JMnBOfRnZZDcvgBPJaLUPSelekraMPbHFkrNrG0/
 WMtbKMu9ZmOrl6TpzCMI9+bT+Wwca7eZBkKXQmMsthBhDpEIroZuuS5/lWr+xEJG1gR
 ta1rbis/Mz9lDGYcN3EG8O+BIk9T9xnXggCL8l4s=
Received: by mx.zohomail.com with SMTPS id 1754914884915123.2055238353555;
 Mon, 11 Aug 2025 05:21:24 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:21:20 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/7] drm/panthor: Add DEV_QUERY.PERF_INFO handling for
 Gx10
Message-ID: <bpfe3i2ffk3jcezkhdsbf2jlencdeevkqbtzi36wxgsg5jhiky@czttx7r2i7wh>
References: <cover.1753449448.git.lukas.zapolskas@arm.com>
 <8925f2211994f1a4b34f0ba8c61bd0ae2af7d397.1753449448.git.lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8925f2211994f1a4b34f0ba8c61bd0ae2af7d397.1753449448.git.lukas.zapolskas@arm.com>
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

Hi Lukas,

On 25.07.2025 15:57, Lukas Zapolskas wrote:
> This change adds the IOCTL to query data about the performance counter
> setup. Some of this data was available via previous DEV_QUERY calls,
> for instance for GPU info, but exposing it via PERF_INFO
> minimizes the overhead of creating a single session to just the one
> aggregate IOCTL.
>
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/Makefile         |  1 +
>  drivers/gpu/drm/panthor/panthor_device.c |  7 +++
>  drivers/gpu/drm/panthor/panthor_device.h |  3 +
>  drivers/gpu/drm/panthor/panthor_drv.c    | 10 ++-
>  drivers/gpu/drm/panthor/panthor_fw.h     |  3 +
>  drivers/gpu/drm/panthor/panthor_perf.c   | 77 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_perf.h   | 15 +++++
>  drivers/gpu/drm/panthor/panthor_regs.h   |  1 +
>  8 files changed, 116 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h
>
> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> index 15294719b09c..0df9947f3575 100644
> --- a/drivers/gpu/drm/panthor/Makefile
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -9,6 +9,7 @@ panthor-y := \
>  	panthor_gpu.o \
>  	panthor_heap.o \
>  	panthor_mmu.o \
> +	panthor_perf.o \
>  	panthor_sched.o
>
>  obj-$(CONFIG_DRM_PANTHOR) += panthor.o
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index f0b2da5b2b96..15ab329722cc 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -19,6 +19,7 @@
>  #include "panthor_fw.h"
>  #include "panthor_gpu.h"
>  #include "panthor_mmu.h"
> +#include "panthor_perf.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
>
> @@ -264,6 +265,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		goto err_unplug_fw;
>
> +	ret = panthor_perf_init(ptdev);
> +	if (ret)
> +		goto err_unplug_sched;
> +
>  	/* ~3 frames */
>  	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>  	pm_runtime_use_autosuspend(ptdev->base.dev);
> @@ -277,6 +282,8 @@ int panthor_device_init(struct panthor_device *ptdev)
>
>  err_disable_autosuspend:
>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> +
> +err_unplug_sched:
>  	panthor_sched_unplug(ptdev);
>
>  err_unplug_fw:
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 4fc7cf2aeed5..720d39b9e783 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -120,6 +120,9 @@ struct panthor_device {
>  	/** @csif_info: Command stream interface information. */
>  	struct drm_panthor_csif_info csif_info;
>
> +	/** @perf_info: Performance counter interface information. */
> +	struct drm_panthor_perf_info perf_info;
> +
>  	/** @gpu: GPU management data. */
>  	struct panthor_gpu *gpu;
>
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 9256806eb662..8b1e3e38b12e 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -175,7 +175,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
>
>  /**
>   * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
> @@ -835,6 +836,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  			args->size = sizeof(priorities_info);
>  			return 0;
>
> +		case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
> +			args->size = sizeof(ptdev->perf_info);
> +			return 0;
> +
>  		default:
>  			return -EINVAL;
>  		}
> @@ -859,6 +864,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  		panthor_query_group_priorities_info(file, &priorities_info);
>  		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
>
> +	case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
> +		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->perf_info);
> +
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index 6598d96c6d2a..8bcb933fa790 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -197,8 +197,11 @@ struct panthor_fw_global_control_iface {
>  	u32 output_va;
>  	u32 group_num;
>  	u32 group_stride;
> +#define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
>  	u32 perfcnt_size;
>  	u32 instr_features;
> +#define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
> +	u32 perfcnt_features;
>  };
>
>  struct panthor_fw_global_input_iface {
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> new file mode 100644
> index 000000000000..e58a62ad7988
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2023 Collabora Ltd */
> +/* Copyright 2025 Arm ltd. */
> +
> +#include <linux/bitops.h>
> +#include <drm/panthor_drm.h>
> +
> +#include "panthor_device.h"
> +#include "panthor_fw.h"
> +#include "panthor_perf.h"
> +#include "panthor_regs.h"
> +
> +struct panthor_perf_counter_block {
> +	struct drm_panthor_perf_block_header header;
> +	u64 counters[];
> +};
> +
> +static size_t get_annotated_block_size(size_t counters_per_block)
> +{
> +	return struct_size_t(struct panthor_perf_counter_block, counters, counters_per_block);
> +}
> +
> +static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
> +{
> +	const size_t block_size = get_annotated_block_size(info->counters_per_block);
> +	const size_t block_nr = info->cshw_blocks + info->fw_blocks +
> +		info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
> +
> +	return info->sample_header_size + (block_size * block_nr);
> +}
> +
> +/**
> + * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
> + * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
> + * which indicates the same information.
> + */
> +#define PANTHOR_PERF_COUNTERS_PER_BLOCK (64)
> +
> +static void panthor_perf_info_init(struct panthor_device *const ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
> +
> +	if (PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features))
> +		perf_info->flags |= DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT;
> +
> +	perf_info->counters_per_block = PANTHOR_PERF_COUNTERS_PER_BLOCK;

I might've mentioned this in a previous review, but maybe we could add PRFCNT_FEATURES register
access in this commit, and both ways of retrieving the number of counters per block depending
in the CSF firmware version?

Other than that:

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

> +
> +	perf_info->sample_header_size = sizeof(struct drm_panthor_perf_sample_header);
> +	perf_info->block_header_size = sizeof(struct drm_panthor_perf_block_header);
> +
> +	if (GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size))
> +		perf_info->fw_blocks = 1;
> +
> +	perf_info->cshw_blocks = 1;
> +	perf_info->tiler_blocks = 1;
> +	perf_info->memsys_blocks = GPU_MEM_FEATURES_L2_SLICES(ptdev->gpu_info.mem_features);
> +	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
> +
> +	perf_info->sample_size = session_get_user_sample_size(perf_info);
> +}
> +
> +/**
> + * panthor_perf_init - Initialize the performance counter subsystem.
> + * @ptdev: Panthor device
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int panthor_perf_init(struct panthor_device *ptdev)
> +{
> +	if (!ptdev)
> +		return -EINVAL;
> +
> +	panthor_perf_info_init(ptdev);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
> new file mode 100644
> index 000000000000..3c32c24c164c
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2025 Collabora Ltd */
> +/* Copyright 2025 Arm ltd. */
> +
> +#ifndef __PANTHOR_PERF_H__
> +#define __PANTHOR_PERF_H__
> +
> +#include <linux/types.h>
> +
> +struct panthor_device;
> +
> +int panthor_perf_init(struct panthor_device *ptdev);
> +
> +#endif /* __PANTHOR_PERF_H__ */
> +
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index 48bbfd40138c..d613ce723981 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -27,6 +27,7 @@
>  #define GPU_TILER_FEATURES				0xC
>  #define GPU_MEM_FEATURES				0x10
>  #define   GROUPS_L2_COHERENT				BIT(0)
> +#define   GPU_MEM_FEATURES_L2_SLICES(x)			((((x) & GENMASK(11, 8)) >> 8) + 1)
>
>  #define GPU_MMU_FEATURES				0x14
>  #define  GPU_MMU_FEATURES_VA_BITS(x)			((x) & GENMASK(7, 0))
> --
> 2.33.0.dirty
