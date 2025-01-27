Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE57A20064
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 23:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C24B10E066;
	Mon, 27 Jan 2025 22:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Vfo11SR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D511610E066
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 22:17:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738016273; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DHy0wy0Vcin3V6AIQjqZmuu5+valHLLWTN9p/hhMdlIRFmZElA0h38nwwHd15axQbBAkpiTW0m4nAIkzxpJD8rmUkzrSYhR/UpHAJsnVke5/jh3efj+/s0fMr9DZzBSEiRQhbXmBpeDFBoQmlgwR99fEhYMN3lJevgMeAZmux6Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738016273;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hHuDLL1zrKxirVvXrf9KGSt3x9LK1dvhdLXoTO36Hw0=; 
 b=P1L+rX6yzV5xGTHf5e+BanMeSfr6eC/qKoxsi9lL/0RsVzUSuKUjf6D9gLdEqkfGAcibDEryT2jG+nCMuu4sTt3KsuSimnHGPU26loKJY0jjeUpvEZK431GNqqEd5NP9E7GAK87ePMA7osYKeBLiFsyN5IhcBqjadnOOv82L7T8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738016273; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=hHuDLL1zrKxirVvXrf9KGSt3x9LK1dvhdLXoTO36Hw0=;
 b=Vfo11SR2vJBPm1ullFVGMwddpMu9CNgiZm8ocozM4O4uETsaz792IH4O+c7NuD77
 poAKtc7M8ZiHgE/HagP8MEuReHgmRowctZxXpEPYIvD1CFhhd5QzmSOnN9JpBiARn4l
 u3AMizs2OD5xcAw8nVSxuksyY5291FQ8AUeq3fG8=
Received: by mx.zohomail.com with SMTPS id 1738016259876593.0315307958238;
 Mon, 27 Jan 2025 14:17:39 -0800 (PST)
Date: Mon, 27 Jan 2025 22:17:36 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
Subject: Re: [RFC v2 2/8] drm/panthor: Add DEV_QUERY.PERF_INFO handling for
 Gx10
Message-ID: <nvwaxwweuszn23abeihdmqob5didgdwtpkgq4i3fu6rpu3wvmc@vieg4fm3m7hq>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-3-lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211165024.490748-3-lukas.zapolskas@arm.com>
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

On 11.12.2024 16:50, Lukas Zapolskas wrote:
> This change adds the IOCTL to query data about the performance counter
> setup. Some of this data was available via previous DEV_QUERY calls,
> for instance for GPU info, but exposing it via PERF_INFO
> minimizes the overhead of creating a single session to just the one
> aggregate IOCTL.
> 
> To better align the FW interfaces with the arch spec, the patch also
> renames perfcnt to prfcnt.
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/Makefile         |  1 +
>  drivers/gpu/drm/panthor/panthor_device.h |  3 ++
>  drivers/gpu/drm/panthor/panthor_drv.c    | 11 +++++-
>  drivers/gpu/drm/panthor/panthor_fw.c     |  4 ++
>  drivers/gpu/drm/panthor/panthor_fw.h     |  4 ++
>  drivers/gpu/drm/panthor/panthor_perf.c   | 47 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_perf.h   | 12 ++++++
>  7 files changed, 81 insertions(+), 1 deletion(-)
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
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 0e68f5a70d20..636542c1dcbd 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -119,6 +119,9 @@ struct panthor_device {
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
> index ad46a40ed9e1..e0ac3107c69e 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -175,7 +175,9 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
> +
>  
>  /**
>   * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
> @@ -834,6 +836,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
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
> @@ -858,6 +864,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  		panthor_query_group_priorities_info(file, &priorities_info);
>  		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
>  
> +	case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
> +		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->perf_info);
> +
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 4a2e36504fea..e9530d1d9781 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -21,6 +21,7 @@
>  #include "panthor_gem.h"
>  #include "panthor_gpu.h"
>  #include "panthor_mmu.h"
> +#include "panthor_perf.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
>  
> @@ -1417,6 +1418,9 @@ int panthor_fw_init(struct panthor_device *ptdev)
>  		goto err_unplug_fw;
>  
>  	panthor_fw_init_global_iface(ptdev);
> +
> +	panthor_perf_info_init(ptdev);

I think this might better go into end of panthor_device_init(), or inside panthor_perf_init()
since it doesn't program any FW interfaces.

> +
>  	return 0;
>  
>  err_unplug_fw:
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index 22448abde992..db10358e24bb 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -5,6 +5,7 @@
>  #define __PANTHOR_MCU_H__
>  
>  #include <linux/types.h>
> +#include <linux/spinlock.h>
>  
>  struct panthor_device;
>  struct panthor_kernel_bo;
> @@ -197,8 +198,11 @@ struct panthor_fw_global_control_iface {
>  	u32 output_va;
>  	u32 group_num;
>  	u32 group_stride;
> +#define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
>  	u32 perfcnt_size;
>  	u32 instr_features;
> +#define PERFCNT_FEATURES_MD_SIZE(x) ((x) & GENMASK(3, 0))
> +	u32 perfcnt_features;
>  };
>  
>  struct panthor_fw_global_input_iface {
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> new file mode 100644
> index 000000000000..0e3d769c1805
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2023 Collabora Ltd */
> +/* Copyright 2024 Arm ltd. */
> +
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/panthor_drm.h>
> +
> +#include "panthor_device.h"
> +#include "panthor_fw.h"
> +#include "panthor_gpu.h"
> +#include "panthor_perf.h"
> +#include "panthor_regs.h"
> +
> +/**
> + * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
> + * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
> + * which indicates the same information.
> + */
> +#define PANTHOR_PERF_COUNTERS_PER_BLOCK (64)
> +
> +void panthor_perf_info_init(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
> +
> +	if (PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features))
> +		perf_info->flags |= DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT;
> +
> +	if (GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) < 11)
> +		perf_info->counters_per_block = PANTHOR_PERF_COUNTERS_PER_BLOCK;
> +
> +	perf_info->sample_header_size = sizeof(struct drm_panthor_perf_sample_header);
> +	perf_info->block_header_size = sizeof(struct drm_panthor_perf_block_header);
> +
> +	if (GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size)) {
> +		perf_info->fw_blocks = 1;
> +		perf_info->csg_blocks = glb_iface->control->group_num;
> +	}
> +
> +	perf_info->cshw_blocks = 1;
> +	perf_info->tiler_blocks = 1;
> +	perf_info->memsys_blocks = hweight64(ptdev->gpu_info.l2_present);
> +	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
> +}
> +
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
> new file mode 100644
> index 000000000000..cff537a370c9
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2024 Collabora Ltd */
> +/* Copyright 2024 Arm ltd. */
> +
> +#ifndef __PANTHOR_PERF_H__
> +#define __PANTHOR_PERF_H__
> +
> +struct panthor_device;
> +
> +void panthor_perf_info_init(struct panthor_device *ptdev);
> +
> +#endif /* __PANTHOR_PERF_H__ */
> -- 
> 2.25.1


Adrian Larumbe
