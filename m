Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F174BAF7D1
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 09:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB5F10E697;
	Wed,  1 Oct 2025 07:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYCciqkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A863610E697
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 07:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759305038; x=1790841038;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=L8ZYXRy/cjGNV9HwF54BFukB14tdqbA4EjgZo8SW2oQ=;
 b=mYCciqkzgx1Ln059f43H/SOPCB+Iie7wo2xDpfkykJm3mfVjtvWD4cSs
 2aaIGEEZWmsLzN7xGZ3DFUjjD+EToif5jBsW3L9UPjukE8+M+j3nTZu8Z
 Tb2SXVC8KS4fL6RaWFo7PpSPExuTQoULounWRToXXOypm1baQeP8UhAlI
 V3ECBI5KjsgMbEZcURB/czKogOfBoiyCDJde+bGZX3xvSm0Z5uc9opzNC
 cqzYR49yNurz/pwOhDNU4GcRbq27ebSyMXXi/SiRnCkGWNWRuzkFKic38
 9iqW64AiNyvDlxQa5xhRPmBV0GZ/1mZqzH/4WR2rkQyjkGWELEPkM1cmD w==;
X-CSE-ConnectionGUID: c4MT+qgyR6uJe+Eeo0BCIQ==
X-CSE-MsgGUID: bEuRgPOCSzaOUcDqHcp/9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61280838"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61280838"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 00:50:36 -0700
X-CSE-ConnectionGUID: bD0sJjkpRZmoRrr6LUBduA==
X-CSE-MsgGUID: CA+ahJJUSUGrwPFu37hc7g==
X-ExtLoop1: 1
Received: from unknown (HELO [10.102.88.152]) ([10.102.88.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 00:50:35 -0700
Message-ID: <7b1d502a-c883-43ac-923b-1d483d417b31@linux.intel.com>
Date: Wed, 1 Oct 2025 09:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix doc description of job structure
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
References: <20250925145131.1446323-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250925145131.1446323-1-maciej.falkowski@linux.intel.com>
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

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>

On 9/25/2025 4:51 PM, Maciej Falkowski wrote:
> From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>
> Fix doc description of job structure as it is
> improperly formatted. Align order of job structure's
> fields according to the documentation.
>
> Fixes: 0bf37f45d5c4 ("accel/ivpu: Add support for user-managed preemption buffer")
> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_job.h | 44 +++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
> index 6c8b9c739b51..d2fc4c151614 100644
> --- a/drivers/accel/ivpu/ivpu_job.h
> +++ b/drivers/accel/ivpu/ivpu_job.h
> @@ -15,12 +15,17 @@ struct ivpu_device;
>  struct ivpu_file_priv;
>  
>  /**
> - * struct ivpu_cmdq - Object representing device queue used to send jobs.
> - * @jobq:	   Pointer to job queue memory shared with the device
> - * @mem:           Memory allocated for the job queue, shared with device
> - * @entry_count    Number of job entries in the queue
> - * @db_id:	   Doorbell assigned to this job queue
> - * @db_registered: True if doorbell is registered in device
> + * struct ivpu_cmdq - Represents a command queue for submitting jobs to the VPU.
> + * Tracks queue memory, preemption buffers, and metadata for job management.
> + * @jobq:                Pointer to job queue memory shared with the device
> + * @primary_preempt_buf: Primary preemption buffer for this queue (optional)
> + * @secondary_preempt_buf: Secondary preemption buffer for this queue (optional)
> + * @mem:                 Memory allocated for the job queue, shared with device
> + * @entry_count:         Number of job entries in the queue
> + * @id:                  Unique command queue ID
> + * @db_id:               Doorbell ID assigned to this job queue
> + * @priority:            Priority level of the command queue
> + * @is_legacy:           True if this is a legacy command queue
>   */
>  struct ivpu_cmdq {
>  	struct vpu_job_queue *jobq;
> @@ -35,16 +40,21 @@ struct ivpu_cmdq {
>  };
>  
>  /**
> - * struct ivpu_job - KMD object that represents batchbuffer / DMA buffer.
> - * Each batch / DMA buffer is a job to be submitted and executed by the VPU FW.
> - * This is a unit of execution, and be tracked by the job_id for
> - * any status reporting from VPU FW through IPC JOB RET/DONE message.
> - * @file_priv:		  The client that submitted this job
> - * @job_id:		  Job ID for KMD tracking and job status reporting from VPU FW
> - * @status:		  Status of the Job from IPC JOB RET/DONE message
> - * @batch_buffer:	  CPU vaddr points to the batch buffer memory allocated for the job
> - * @submit_status_offset: Offset within batch buffer where job completion handler
> -			  will update the job status
> + * struct ivpu_job - Representing a batch or DMA buffer submitted to the VPU.
> + * Each job is a unit of execution, tracked by job_id for status reporting from VPU FW.
> + * The structure holds all resources and metadata needed for job submission, execution,
> + * and completion handling.
> + * @vdev:                Pointer to the VPU device
> + * @file_priv:           The client context that submitted this job
> + * @done_fence:          Fence signaled when job completes
> + * @cmd_buf_vpu_addr:    VPU address of the command buffer for this job
> + * @cmdq_id:             Command queue ID used for submission
> + * @job_id:              Unique job ID for tracking and status reporting
> + * @engine_idx:          Engine index for job execution
> + * @primary_preempt_buf: Primary preemption buffer for job
> + * @secondary_preempt_buf: Secondary preemption buffer for job (optional)
> + * @bo_count:            Number of buffer objects associated with this job
> + * @bos:                 Array of buffer objects used by the job (batch buffer is at index 0)
>   */
>  struct ivpu_job {
>  	struct ivpu_device *vdev;
> @@ -54,9 +64,9 @@ struct ivpu_job {
>  	u32 cmdq_id;
>  	u32 job_id;
>  	u32 engine_idx;
> -	size_t bo_count;
>  	struct ivpu_bo *primary_preempt_buf;
>  	struct ivpu_bo *secondary_preempt_buf;
> +	size_t bo_count;
>  	struct ivpu_bo *bos[] __counted_by(bo_count);
>  };
>  
