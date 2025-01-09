Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699A3A06FFF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCA310ED29;
	Thu,  9 Jan 2025 08:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqZXcSoP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CF110ED27
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736411366; x=1767947366;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n8UAErglSZ39zPSwDab4fliF0Km2aLtUIMBWPkjRzyk=;
 b=iqZXcSoPx0ZzozM76J/rduZa5333ogd63jvwOkcRU3hWrOHnp1e9p1Rs
 0kQq9u1iLolZFxPGO2bjNUK9FKPD9Bm4tjOTs3iA/BfsXFJkHRDJ6iCsE
 kdI2Jb6psHSfC+9fFo1VfvyGlCNDtkvtNYvdxDhRxp0/HeJ7oBD4tsAh6
 g2Ksa+JU4UHqLM53NCZnsBJuVx/PpfGoXZH2CZFpJ4PvvpmDm3EZB92hT
 H+cWwcWICgdVXeFceWD7R+jNqGsXA5Q6dP+AJZCOZuCcBfXmyAy8Zyq3V
 lGx76795A9mPEJPK2/+5gMmeVokhRyCE+yz9OGQEN5ZNtPGnDQf3O04es w==;
X-CSE-ConnectionGUID: 3/F/qT3NRf6TsFugjPDmzA==
X-CSE-MsgGUID: g+opPA9US8ucjn0pG0aYPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47648188"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="47648188"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:29:26 -0800
X-CSE-ConnectionGUID: WP0GD9jGSva+wnxoXlZgTw==
X-CSE-MsgGUID: gcgdBeglR4uZJ8i5Ba/yQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="103306216"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:29:23 -0800
Message-ID: <c691768a-98f2-470e-a49e-2b1c48182bce@linux.intel.com>
Date: Thu, 9 Jan 2025 09:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] accel/ivpu: Add handling of
 VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
 <20250107173238.381120-13-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250107173238.381120-13-maciej.falkowski@linux.intel.com>
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 1/7/2025 6:32 PM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Mark as invalid context of a job that returned HW context violation
> error and queue work that aborts jobs from faulty context.
> Add engine reset to the context abort thread handler to not only abort
> currently executing jobs but also to ensure NPU invalid state recovery.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_job.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index c93ea37062d7..3c162ac41a1d 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -533,6 +533,26 @@ static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32
>  
>  	lockdep_assert_held(&vdev->submitted_jobs_lock);
>  
> +	job = xa_load(&vdev->submitted_jobs_xa, job_id);
> +	if (!job)
> +		return -ENOENT;
> +
> +	if (job_status == VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW) {
> +		guard(mutex)(&job->file_priv->lock);
> +
> +		if (job->file_priv->has_mmu_faults)
> +			return 0;
> +
> +		/*
> +		 * Mark context as faulty and defer destruction of the job to jobs abort thread
> +		 * handler to synchronize between both faults and jobs returning context violation
> +		 * status and ensure both are handled in the same way
> +		 */
> +		job->file_priv->has_mmu_faults = true;
> +		queue_work(system_wq, &vdev->context_abort_work);
> +		return 0;
> +	}
> +
>  	job = ivpu_job_remove_from_submitted_jobs(vdev, job_id);
>  	if (!job)
>  		return -ENOENT;
> @@ -946,6 +966,9 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>  	unsigned long ctx_id;
>  	unsigned long id;
>  
> +	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
> +		ivpu_jsm_reset_engine(vdev, 0);
> +
>  	mutex_lock(&vdev->context_list_lock);
>  	xa_for_each(&vdev->context_xa, ctx_id, file_priv) {
>  		if (!file_priv->has_mmu_faults || file_priv->aborted)
> @@ -959,6 +982,8 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>  
>  	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW)
>  		return;
> +
> +	ivpu_jsm_hws_resume_engine(vdev, 0);
>  	/*
>  	 * In hardware scheduling mode NPU already has stopped processing jobs
>  	 * and won't send us any further notifications, thus we have to free job related resources

