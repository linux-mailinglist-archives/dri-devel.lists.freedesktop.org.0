Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8C6A8591C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 12:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C526810EB62;
	Fri, 11 Apr 2025 10:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zgi33/Cz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3774C10EB62
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744366335; x=1775902335;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5wxtcFAMSu7ftcRVNzJ+53UdONL3yb1rYnGJTQc+gP0=;
 b=Zgi33/CzcdI8r+7IGu3erKoezCEWaaVqqcf+QlofRjz6FghQo034PIW1
 fjVbRh23gJCxCwh3zXneyQjosMExvaJxeQLQWFpjiYLmi/J+1701jrEC3
 4cwTmHRO5GiQ9Tc4nkWZWtPs3rITNAI0plpE1k4UJFVx9Nzz4Q/ezvRcR
 BC8ZK5Ro3thGNqBCd4dILu18w88pGs/uG3Q+iWfJVmoxfhqKm7hK9FS0i
 gmtrX2d+XifMCXNU+t5M+GAB6c2sQVgtQ2Ekf2VyZT+rIr1YHX5uMLb//
 Nethw2DfCwIfH3LWXx7+IU1PaMl1wShARc7kl/py7qDUMwBAzBQkP5/+k A==;
X-CSE-ConnectionGUID: /C7M7PUlTzexIy50O2/IQA==
X-CSE-MsgGUID: xymcTm+XTmmXTpxxcVezqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="46053587"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="46053587"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 03:12:15 -0700
X-CSE-ConnectionGUID: Kq4TxoqLSyK3nKbgfnkAuQ==
X-CSE-MsgGUID: iD8nCoxZTfycjOklUKf+zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="129123673"
Received: from mariuszg-mobl2.ger.corp.intel.com (HELO [10.245.113.161])
 ([10.245.113.161])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 03:12:14 -0700
Message-ID: <4b03b224-77fa-4efc-ae03-71bfc8f0ba58@linux.intel.com>
Date: Fri, 11 Apr 2025 12:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add cmdq_id to job related logs
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250401155939.4049467-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250401155939.4049467-1-maciej.falkowski@linux.intel.com>
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

Applied to drm-misc-fixes

On 4/1/2025 5:59 PM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Add tracking of command queue ID in JOB debug message to improve
> debugging capabilities.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_job.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 004059e4f1e8..863e3cd6ace5 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -470,8 +470,8 @@ static void ivpu_job_destroy(struct ivpu_job *job)
>  	struct ivpu_device *vdev = job->vdev;
>  	u32 i;
>  
> -	ivpu_dbg(vdev, JOB, "Job destroyed: id %3u ctx %2d engine %d",
> -		 job->job_id, job->file_priv->ctx.id, job->engine_idx);
> +	ivpu_dbg(vdev, JOB, "Job destroyed: id %3u ctx %2d cmdq_id %u engine %d",
> +		 job->job_id, job->file_priv->ctx.id, job->cmdq_id, job->engine_idx);
>  
>  	for (i = 0; i < job->bo_count; i++)
>  		if (job->bos[i])
> @@ -564,8 +564,8 @@ static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32
>  	dma_fence_signal(job->done_fence);
>  
>  	trace_job("done", job);
> -	ivpu_dbg(vdev, JOB, "Job complete:  id %3u ctx %2d engine %d status 0x%x\n",
> -		 job->job_id, job->file_priv->ctx.id, job->engine_idx, job_status);
> +	ivpu_dbg(vdev, JOB, "Job complete:  id %3u ctx %2d cmdq_id %u engine %d status 0x%x\n",
> +		 job->job_id, job->file_priv->ctx.id, job->cmdq_id, job->engine_idx, job_status);
>  
>  	ivpu_job_destroy(job);
>  	ivpu_stop_job_timeout_detection(vdev);
> @@ -664,8 +664,8 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
>  	}
>  
>  	trace_job("submit", job);
> -	ivpu_dbg(vdev, JOB, "Job submitted: id %3u ctx %2d engine %d prio %d addr 0x%llx next %d\n",
> -		 job->job_id, file_priv->ctx.id, job->engine_idx, cmdq->priority,
> +	ivpu_dbg(vdev, JOB, "Job submitted: id %3u ctx %2d cmdq_id %u engine %d prio %d addr 0x%llx next %d\n",
> +		 job->job_id, file_priv->ctx.id, cmdq->id, job->engine_idx, cmdq->priority,
>  		 job->cmd_buf_vpu_addr, cmdq->jobq->header.tail);
>  
>  	mutex_unlock(&file_priv->lock);
> @@ -777,7 +777,8 @@ static int ivpu_submit(struct drm_file *file, struct ivpu_file_priv *file_priv,
>  		goto err_free_handles;
>  	}
>  
> -	ivpu_dbg(vdev, JOB, "Submit ioctl: ctx %u buf_count %u\n", file_priv->ctx.id, buffer_count);
> +	ivpu_dbg(vdev, JOB, "Submit ioctl: ctx %u cmdq_id %u buf_count %u\n",
> +		 file_priv->ctx.id, cmdq_id, buffer_count);
>  
>  	job = ivpu_job_create(file_priv, engine, buffer_count);
>  	if (!job) {

