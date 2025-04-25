Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96748A9C200
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0FC10E0F8;
	Fri, 25 Apr 2025 08:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTWqJY0Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E361310E0F8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745571057; x=1777107057;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QkIrrTWA1kg4BKzQxpXXmk8AZJHKdoYVS3wZTbhTkp0=;
 b=HTWqJY0ZHIxiXViha8SA3RXwCOKX8fEyhdjGoRo5SkJlZbnfwYRu/Zpr
 0/6hQNQ0x7IIP4F9ixnGnmC4qnq9nUynWBnpJxHwIJ59t2FRo0cFP27dc
 2KkcyWaw71wQjUma9wo+xeO7bnsJAfE06TJHSEoPSke0vwMMzUUgDv5ou
 szCyrZKMcXx9YsuwrG4pEy8nwVFXPfsJxQaSvtHUFFeHNFEYgYoItmPZn
 l1qs1GdaDxHEnFeinroSN1VETON+plYVBtc/oLF6CmT3tS18/mJHpJmkh
 7yJWRu9UsCnYO1UMIWHuLlpCZbb7XdXaZvzwTd+goxHnKcQ56P/PQ2JLB A==;
X-CSE-ConnectionGUID: lIf5McwGSHGyBpzulQqSMQ==
X-CSE-MsgGUID: geFq4JtASGWcBGHciLUYtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47111753"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47111753"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:50:56 -0700
X-CSE-ConnectionGUID: nf1I5b1RT8aYaaoR2bW3dA==
X-CSE-MsgGUID: ZZo1AH2YRJ2fq0ayLgemfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="137657790"
Received: from pwilma-mobl1.ger.corp.intel.com (HELO [10.245.252.249])
 ([10.245.252.249])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:50:54 -0700
Message-ID: <709e2398-1212-44ad-b70c-9f62d8f73b2b@linux.intel.com>
Date: Fri, 25 Apr 2025 10:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Implement heartbeat-based TDR mechanism
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250416102555.384526-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250416102555.384526-1-maciej.falkowski@linux.intel.com>
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

On 4/16/2025 12:25 PM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Introduce a heartbeat-based Timeout Detection and Recovery (TDR) mechanism.
> The enhancement aims to improve the reliability of device hang detection by
> monitoring heartbeat updates.
> 
> Each progressing inference will update heartbeat counter allowing driver to
> monitor its progression. Limit maximum number of reschedules when heartbeat
> indicates progression to 30.
> 
> The heartbeat mechanism provides a more robust method for detecting device
> hangs, potentially reducing false positive recoveries due to long running
> inferences.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_drv.c |  4 ++++
>  drivers/accel/ivpu/ivpu_drv.h |  1 +
>  drivers/accel/ivpu/ivpu_fw.h  |  1 +
>  drivers/accel/ivpu/ivpu_pm.c  | 20 ++++++++++++++++++++
>  4 files changed, 26 insertions(+)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index eff1d3ca075f..0e7748c5e117 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -374,6 +374,9 @@ int ivpu_boot(struct ivpu_device *vdev)
>  {
>  	int ret;
>  
> +	drm_WARN_ON(&vdev->drm, atomic_read(&vdev->job_timeout_counter));
> +	drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->submitted_jobs_xa));
> +
>  	/* Update boot params located at first 4KB of FW memory */
>  	ivpu_fw_boot_params_setup(vdev, ivpu_bo_vaddr(vdev->fw->mem));
>  
> @@ -573,6 +576,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>  	vdev->context_xa_limit.min = IVPU_USER_CONTEXT_MIN_SSID;
>  	vdev->context_xa_limit.max = IVPU_USER_CONTEXT_MAX_SSID;
>  	atomic64_set(&vdev->unique_id_counter, 0);
> +	atomic_set(&vdev->job_timeout_counter, 0);
>  	xa_init_flags(&vdev->context_xa, XA_FLAGS_ALLOC | XA_FLAGS_LOCK_IRQ);
>  	xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
>  	xa_init_flags(&vdev->db_xa, XA_FLAGS_ALLOC1);
> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> index 92753effb1c9..5497e7030e91 100644
> --- a/drivers/accel/ivpu/ivpu_drv.h
> +++ b/drivers/accel/ivpu/ivpu_drv.h
> @@ -154,6 +154,7 @@ struct ivpu_device {
>  	struct mutex submitted_jobs_lock; /* Protects submitted_jobs */
>  	struct xarray submitted_jobs_xa;
>  	struct ivpu_ipc_consumer job_done_consumer;
> +	atomic_t job_timeout_counter;
>  
>  	atomic64_t unique_id_counter;
>  
> diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
> index 1d0b2bd9d65c..9a3935be1c05 100644
> --- a/drivers/accel/ivpu/ivpu_fw.h
> +++ b/drivers/accel/ivpu/ivpu_fw.h
> @@ -39,6 +39,7 @@ struct ivpu_fw_info {
>  	u64 read_only_addr;
>  	u32 read_only_size;
>  	u32 sched_mode;
> +	u64 last_heartbeat;
>  };
>  
>  int ivpu_fw_init(struct ivpu_device *vdev);
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index b5891e91f7ab..1fe03fc16bbc 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -34,6 +34,7 @@ module_param_named(tdr_timeout_ms, ivpu_tdr_timeout_ms, ulong, 0644);
>  MODULE_PARM_DESC(tdr_timeout_ms, "Timeout for device hang detection, in milliseconds, 0 - default");
>  
>  #define PM_RESCHEDULE_LIMIT     5
> +#define PM_TDR_HEARTBEAT_LIMIT  30
>  
>  static void ivpu_pm_prepare_cold_boot(struct ivpu_device *vdev)
>  {
> @@ -44,6 +45,7 @@ static void ivpu_pm_prepare_cold_boot(struct ivpu_device *vdev)
>  	ivpu_fw_log_reset(vdev);
>  	ivpu_fw_load(vdev);
>  	fw->entry_point = fw->cold_boot_entry_point;
> +	fw->last_heartbeat = 0;
>  }
>  
>  static void ivpu_pm_prepare_warm_boot(struct ivpu_device *vdev)
> @@ -189,7 +191,24 @@ static void ivpu_job_timeout_work(struct work_struct *work)
>  {
>  	struct ivpu_pm_info *pm = container_of(work, struct ivpu_pm_info, job_timeout_work.work);
>  	struct ivpu_device *vdev = pm->vdev;
> +	u64 heartbeat;
>  
> +	if (ivpu_jsm_get_heartbeat(vdev, 0, &heartbeat) || heartbeat <= vdev->fw->last_heartbeat) {
> +		ivpu_err(vdev, "Job timeout detected, heartbeat not progressed\n");
> +		goto recovery;
> +	}
> +
> +	if (atomic_fetch_inc(&vdev->job_timeout_counter) > PM_TDR_HEARTBEAT_LIMIT) {
> +		ivpu_err(vdev, "Job timeout detected, heartbeat limit exceeded\n");
> +		goto recovery;
> +	}
> +
> +	vdev->fw->last_heartbeat = heartbeat;
> +	ivpu_start_job_timeout_detection(vdev);
> +	return;
> +
> +recovery:
> +	atomic_set(&vdev->job_timeout_counter, 0);
>  	ivpu_pm_trigger_recovery(vdev, "TDR");
>  }
>  
> @@ -204,6 +223,7 @@ void ivpu_start_job_timeout_detection(struct ivpu_device *vdev)
>  void ivpu_stop_job_timeout_detection(struct ivpu_device *vdev)
>  {
>  	cancel_delayed_work_sync(&vdev->pm->job_timeout_work);
> +	atomic_set(&vdev->job_timeout_counter, 0);
>  }
>  
>  int ivpu_pm_suspend_cb(struct device *dev)

