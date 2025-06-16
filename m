Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3EBADAED1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 13:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D1010E350;
	Mon, 16 Jun 2025 11:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hC6mhvYL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD0210E350
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 11:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750073982; x=1781609982;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HzDlz+FFZfoje9IpKb7d7ynYN5SUUS4qF2kKIuTtEI8=;
 b=hC6mhvYLg/eWhzNVjJGsNntTIHL6NNLtNpFkNpaDn4YeNguAPI3m4GQr
 Q5lqiRvLDpaAdmu0kR/MVqEMVLAcRcwklyPYJ00myQb80BMlrzXgpZOKQ
 qTsFJnfioa/6knMlL1BLj8i9hFTYkztrB2RJgunj5tfgAyHmZh6ZsBRqj
 G7jkffE0Wfq+plJYID3sIZyBPGQdBTWMm0B1aXrcDB05o5pWmTr3yE/1E
 v4hBe2EnfbwOaYh1RVFPkIbN8h90o1p4i/GiUzKLGNq99oR8eDVJ7olu0
 MDgyjyQFwKB2NrK7pZiyJqXeYsFvU3jj/qhsztqTNZjdg/7JKSrriquq0 Q==;
X-CSE-ConnectionGUID: PG5udvgiQ8SUkOL+A89eWw==
X-CSE-MsgGUID: ADaG12+VST6NCtM08t1MSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63246696"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="63246696"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 04:39:42 -0700
X-CSE-ConnectionGUID: uysmVxnHScu50jy//eIIcg==
X-CSE-MsgGUID: M3dJ2ceIRx2lLQNgkEJHbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="185710947"
Received: from wegrzynx-mobl5.ger.corp.intel.com (HELO [10.245.115.76])
 ([10.245.115.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 04:39:40 -0700
Message-ID: <46a23e73-5a81-47cd-a438-d520f3e29d2e@linux.intel.com>
Date: Mon, 16 Jun 2025 13:39:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add turbo flag to the DRM_IVPU_CMDQ_CREATE
 ioctl
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250605162001.1237789-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250605162001.1237789-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Applied to drm-misc-next

On 6/5/2025 6:20 PM, Maciej Falkowski wrote:
> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> 
> Introduces a new parameter to the DRM_IVPU_CMDQ_CREATE ioctl,
> enabling turbo mode for jobs submitted via the command queue.
> Turbo mode allows jobs to run at higher frequencies,
> potentially improving performance for demanding workloads.
> 
> The change also adds the IVPU_TEST_MODE_TURBO_DISABLE flag
> to allow test mode to explicitly disable turbo mode
> requested by the application.
> The IVPU_TEST_MODE_TURBO mode has been renamed to
> IVPU_TEST_MODE_TURBO_ENABLE for clarity and consistency.
> 
> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_drv.h | 11 ++---
>  drivers/accel/ivpu/ivpu_job.c | 81 +++++++++++++++++++++++------------
>  include/uapi/drm/ivpu_accel.h | 14 ++++++
>  3 files changed, 73 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> index 17aa3532c76d..62ab1c654e63 100644
> --- a/drivers/accel/ivpu/ivpu_drv.h
> +++ b/drivers/accel/ivpu/ivpu_drv.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) 2020-2024 Intel Corporation
> + * Copyright (C) 2020-2025 Intel Corporation
>   */
>  
>  #ifndef __IVPU_DRV_H__
> @@ -209,10 +209,11 @@ extern bool ivpu_force_snoop;
>  #define IVPU_TEST_MODE_D0I3_MSG_ENABLE    BIT(5)
>  #define IVPU_TEST_MODE_MIP_DISABLE        BIT(6)
>  #define IVPU_TEST_MODE_DISABLE_TIMEOUTS   BIT(8)
> -#define IVPU_TEST_MODE_TURBO		  BIT(9)
> -#define IVPU_TEST_MODE_CLK_RELINQ_DISABLE BIT(10)
> -#define IVPU_TEST_MODE_CLK_RELINQ_ENABLE  BIT(11)
> -#define IVPU_TEST_MODE_D0I2_DISABLE       BIT(12)
> +#define IVPU_TEST_MODE_TURBO_ENABLE       BIT(9)
> +#define IVPU_TEST_MODE_TURBO_DISABLE      BIT(10)
> +#define IVPU_TEST_MODE_CLK_RELINQ_DISABLE BIT(11)
> +#define IVPU_TEST_MODE_CLK_RELINQ_ENABLE  BIT(12)
> +#define IVPU_TEST_MODE_D0I2_DISABLE       BIT(13)
>  extern int ivpu_test_mode;
>  
>  struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index fae8351aa330..060f1fc031d3 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2020-2024 Intel Corporation
> + * Copyright (C) 2020-2025 Intel Corporation
>   */
>  
>  #include <drm/drm_file.h>
> @@ -100,6 +100,43 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
>  	return NULL;
>  }
>  
> +/**
> + * ivpu_cmdq_get_entry_count - Calculate the number of entries in the command queue.
> + * @cmdq: Pointer to the command queue structure.
> + *
> + * Returns the number of entries that can fit in the command queue memory.
> + */
> +static inline u32 ivpu_cmdq_get_entry_count(struct ivpu_cmdq *cmdq)
> +{
> +	size_t size = ivpu_bo_size(cmdq->mem) - sizeof(struct vpu_job_queue_header);
> +
> +	return size / sizeof(struct vpu_job_queue_entry);
> +}
> +
> +/**
> + * ivpu_cmdq_get_flags - Get command queue flags based on input flags and test mode.
> + * @vdev: Pointer to the ivpu device structure.
> + * @flags: Input flags to determine the command queue flags.
> + *
> + * Returns the calculated command queue flags, considering both the input flags
> + * and the current test mode settings.
> + */
> +static u32 ivpu_cmdq_get_flags(struct ivpu_device *vdev, u32 flags)
> +{
> +	u32 cmdq_flags = 0;
> +
> +	if ((flags & DRM_IVPU_CMDQ_FLAG_TURBO) && (ivpu_hw_ip_gen(vdev) >= IVPU_HW_IP_40XX))
> +		cmdq_flags |= VPU_JOB_QUEUE_FLAGS_TURBO_MODE;
> +
> +	/* Test mode can override the TURBO flag coming from the application */
> +	if (ivpu_test_mode & IVPU_TEST_MODE_TURBO_ENABLE)
> +		cmdq_flags |= VPU_JOB_QUEUE_FLAGS_TURBO_MODE;
> +	if (ivpu_test_mode & IVPU_TEST_MODE_TURBO_DISABLE)
> +		cmdq_flags &= ~VPU_JOB_QUEUE_FLAGS_TURBO_MODE;
> +
> +	return cmdq_flags;
> +}
> +
>  static void ivpu_cmdq_free(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
>  {
>  	ivpu_preemption_buffers_free(file_priv->vdev, file_priv, cmdq);
> @@ -107,8 +144,7 @@ static void ivpu_cmdq_free(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *c
>  	kfree(cmdq);
>  }
>  
> -static struct ivpu_cmdq *ivpu_cmdq_create(struct ivpu_file_priv *file_priv, u8 priority,
> -					  bool is_legacy)
> +static struct ivpu_cmdq *ivpu_cmdq_create(struct ivpu_file_priv *file_priv, u8 priority, u32 flags)
>  {
>  	struct ivpu_device *vdev = file_priv->vdev;
>  	struct ivpu_cmdq *cmdq = NULL;
> @@ -121,10 +157,6 @@ static struct ivpu_cmdq *ivpu_cmdq_create(struct ivpu_file_priv *file_priv, u8 p
>  		ivpu_err(vdev, "Failed to allocate command queue\n");
>  		return NULL;
>  	}
> -
> -	cmdq->priority = priority;
> -	cmdq->is_legacy = is_legacy;
> -
>  	ret = xa_alloc_cyclic(&file_priv->cmdq_xa, &cmdq->id, cmdq, file_priv->cmdq_limit,
>  			      &file_priv->cmdq_id_next, GFP_KERNEL);
>  	if (ret < 0) {
> @@ -132,7 +164,15 @@ static struct ivpu_cmdq *ivpu_cmdq_create(struct ivpu_file_priv *file_priv, u8 p
>  		goto err_free_cmdq;
>  	}
>  
> -	ivpu_dbg(vdev, JOB, "Command queue %d created, ctx %d\n", cmdq->id, file_priv->ctx.id);
> +	cmdq->entry_count = ivpu_cmdq_get_entry_count(cmdq);
> +	cmdq->priority = priority;
> +
> +	cmdq->jobq = (struct vpu_job_queue *)ivpu_bo_vaddr(cmdq->mem);
> +	cmdq->jobq->header.engine_idx = VPU_ENGINE_COMPUTE;
> +	cmdq->jobq->header.flags = ivpu_cmdq_get_flags(vdev, flags);
> +
> +	ivpu_dbg(vdev, JOB, "Command queue %d created, ctx %d, flags 0x%08x\n",
> +		 cmdq->id, file_priv->ctx.id, cmdq->jobq->header.flags);
>  	return cmdq;
>  
>  err_free_cmdq:
> @@ -188,27 +228,14 @@ static int ivpu_register_db(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *
>  	return ret;
>  }
>  
> -static void ivpu_cmdq_jobq_init(struct ivpu_device *vdev, struct vpu_job_queue *jobq)
> +static void ivpu_cmdq_jobq_reset(struct ivpu_device *vdev, struct vpu_job_queue *jobq)
>  {
> -	jobq->header.engine_idx = VPU_ENGINE_COMPUTE;
>  	jobq->header.head = 0;
>  	jobq->header.tail = 0;
>  
> -	if (ivpu_test_mode & IVPU_TEST_MODE_TURBO) {
> -		ivpu_dbg(vdev, JOB, "Turbo mode enabled");
> -		jobq->header.flags = VPU_JOB_QUEUE_FLAGS_TURBO_MODE;
> -	}
> -
>  	wmb(); /* Flush WC buffer for jobq->header */
>  }
>  
> -static inline u32 ivpu_cmdq_get_entry_count(struct ivpu_cmdq *cmdq)
> -{
> -	size_t size = ivpu_bo_size(cmdq->mem) - sizeof(struct vpu_job_queue_header);
> -
> -	return size / sizeof(struct vpu_job_queue_entry);
> -}
> -
>  static int ivpu_cmdq_register(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
>  {
>  	struct ivpu_device *vdev = file_priv->vdev;
> @@ -219,10 +246,7 @@ static int ivpu_cmdq_register(struct ivpu_file_priv *file_priv, struct ivpu_cmdq
>  	if (cmdq->db_id)
>  		return 0;
>  
> -	cmdq->entry_count = ivpu_cmdq_get_entry_count(cmdq);
> -	cmdq->jobq = (struct vpu_job_queue *)ivpu_bo_vaddr(cmdq->mem);
> -
> -	ivpu_cmdq_jobq_init(vdev, cmdq->jobq);
> +	ivpu_cmdq_jobq_reset(vdev, cmdq->jobq);
>  
>  	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
>  		ret = ivpu_hws_cmdq_init(file_priv, cmdq, VPU_ENGINE_COMPUTE, cmdq->priority);
> @@ -291,9 +315,10 @@ static struct ivpu_cmdq *ivpu_cmdq_acquire_legacy(struct ivpu_file_priv *file_pr
>  			break;
>  
>  	if (!cmdq) {
> -		cmdq = ivpu_cmdq_create(file_priv, priority, true);
> +		cmdq = ivpu_cmdq_create(file_priv, priority, 0);
>  		if (!cmdq)
>  			return NULL;
> +		cmdq->is_legacy = true;
>  	}
>  
>  	return cmdq;
> @@ -891,7 +916,7 @@ int ivpu_cmdq_create_ioctl(struct drm_device *dev, void *data, struct drm_file *
>  
>  	mutex_lock(&file_priv->lock);
>  
> -	cmdq = ivpu_cmdq_create(file_priv, ivpu_job_to_jsm_priority(args->priority), false);
> +	cmdq = ivpu_cmdq_create(file_priv, ivpu_job_to_jsm_priority(args->priority), args->flags);
>  	if (cmdq)
>  		args->cmdq_id = cmdq->id;
>  
> diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
> index 2f24103f4533..160ee1411d4a 100644
> --- a/include/uapi/drm/ivpu_accel.h
> +++ b/include/uapi/drm/ivpu_accel.h
> @@ -445,6 +445,9 @@ struct drm_ivpu_metric_streamer_get_data {
>  	__u64 data_size;
>  };
>  
> +/* Command queue flags */
> +#define DRM_IVPU_CMDQ_FLAG_TURBO 0x00000001
> +
>  /**
>   * struct drm_ivpu_cmdq_create - Create command queue for job submission
>   */
> @@ -462,6 +465,17 @@ struct drm_ivpu_cmdq_create {
>  	 * %DRM_IVPU_JOB_PRIORITY_REALTIME
>  	 */
>  	__u32 priority;
> +	/**
> +	 * @flags:
> +	 *
> +	 * Supported flags:
> +	 *
> +	 * %DRM_IVPU_CMDQ_FLAG_TURBO
> +	 *
> +	 * Enable low-latency mode for the command queue. The NPU will maximize performance
> +	 * when executing jobs from such queue at the cost of increased power usage.
> +	 */
> +	__u32 flags;
>  };
>  
>  /**

