Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32525A1D3EE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 10:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D0810E214;
	Mon, 27 Jan 2025 09:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="RIWLgEng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9C910E214
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 09:57:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1737971815; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DdtXqpBj+ofZNsKWNlb2pqWtfTQwDN/Z4y1Ijz7lr65ti+m8fnMO4LOItMq+5yR5MUVJAV9p7QHy0y8y/mZDtcYpt9PLlmxV5aXDjwedaptqJtkhKhygHE8St34XJz+zzuKozJaONBZR5fIFKMrvd4n1VSRKcW/YYJ3Gh+96PXE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1737971815;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=cMjyPtl0fSDPO4QrQ+8jBgrzdzjTAtICtzseyjUIcWo=; 
 b=l5GQYzJf5CbUT8lNY8eQbneBLWYxQOn6BQ6W9r/tHQxR5+UyB2ygDrTC1MtoO2DzYc/+aTdCLPf0uKMfHhn9uXi1yhaf4kFYoJ2q4mSv8sG9DNFpA3TrVr87+aC2bduk4xxCjMpVkBes29OD+IdC895qcZDktNBV7e0NjaW8LvQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737971815; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=cMjyPtl0fSDPO4QrQ+8jBgrzdzjTAtICtzseyjUIcWo=;
 b=RIWLgEngGrwOuUIFdl1uQ9SVgXWO6n7RGjQmV8FfkMgPQtpAYGL5wNmGOAaMeJWI
 nniUbCRELzT3n+9C+EIY9uZI9BZ/KPlUobR4UKKiU/qL87Iyj118FuBd3ZSvukAiLIG
 w6Z3EFfqXIK6BnzRa7qExNtIVlyj/avKJrgd9qbA=
Received: by mx.zohomail.com with SMTPS id 1737971810995361.5642687045123;
 Mon, 27 Jan 2025 01:56:50 -0800 (PST)
Date: Mon, 27 Jan 2025 09:56:47 +0000
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
Message-ID: <wprqf56va7picningxowww7ycksc2a6d7og7v6x4aehlvinjdv@poywyzhd3bv2>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-3-lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

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
