Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99366A49BBE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 15:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0F010ECB8;
	Fri, 28 Feb 2025 14:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="id7j/O+p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BCF10ECB4;
 Fri, 28 Feb 2025 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740752412; x=1772288412;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SRQ0m/MZA7tHF75eUQbdOEzdkJsnHTBVME2DOpyXpBc=;
 b=id7j/O+p+XgyYbEWnpAvx4VJxsbaSfsqBVQdEpW61Kfadm82Kp/sb1dj
 ZER2FNd0O2niffD8LUXnGLQbxvTxGFkdMJ8LTs2zJH++VzHrTYch18G1X
 0jyKxSqZRNf6QIgllvj11oKuy3KWIw8ancyEpsL+cUhXWZ9yx9/VeqFPb
 MI0AeodtSqisZIeN4RSXCTzZPDRLppRriNSDJFrChspRVLXoa+ke48YH6
 y42sUG1rXTzXOn4CVAdgXxRC34FvPH8gyv61R8IkUx2nXLA8pkZUavBMv
 v/nYQEdchNGiagYQ2vA9kR5y0fOrtSXRssEnRQEb54QOBc9NozfQvAhtS A==;
X-CSE-ConnectionGUID: Lahu5w4TQ469f5+c5EomTA==
X-CSE-MsgGUID: W6Almx/FR12eWT84uDnCVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="51885152"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="51885152"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 06:20:11 -0800
X-CSE-ConnectionGUID: g14DsdlNTRe0FmDqqTkSlQ==
X-CSE-MsgGUID: X9pyEn+vSBGgLvpWvWl8Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="121954926"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 06:20:08 -0800
Date: Fri, 28 Feb 2025 16:20:05 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 'Christian =?iso-8859-1?Q?K=F6nig'?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 lucas.demarchi@intel.com
Subject: Re: [PATCH 1/2] drm: Create an app info option for wedge events
Message-ID: <Z8HGFRGOYvyCCWWu@black.fi.intel.com>
References: <20250228121353.1442591-1-andrealmeid@igalia.com>
 <20250228121353.1442591-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228121353.1442591-2-andrealmeid@igalia.com>
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

Cc: Lucas

On Fri, Feb 28, 2025 at 09:13:52AM -0300, André Almeida wrote:
> When a device get wedged, it might be caused by a guilty application.
> For userspace, knowing which app was the cause can be useful for some
> situations, like for implementing a policy, logs or for giving a chance
> for the compositor to let the user know what app caused the problem.
> This is an optional argument, when `PID=-1` there's no information about
> the app caused the problem, or if any app was involved during the hang.
> 
> Sometimes just the PID isn't enough giving that the app might be already
> dead by the time userspace will try to check what was this PID's name,
> so to make the life easier also notify what's the app's name in the user
> event.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>  drivers/gpu/drm/drm_drv.c                  | 16 +++++++++++++---
>  drivers/gpu/drm/i915/gt/intel_reset.c      |  3 ++-
>  drivers/gpu/drm/xe/xe_device.c             |  3 ++-
>  include/drm/drm_device.h                   |  8 ++++++++
>  include/drm/drm_drv.h                      |  3 ++-
>  7 files changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 24ba52d76045..00b9b87dafd8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6124,7 +6124,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  	atomic_set(&adev->reset_domain->reset_res, r);
>  
>  	if (!r)
> -		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> +		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>  
>  	return r;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index ef1b77f1e88f..3ed9cbcab1ad 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -150,7 +150,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  			amdgpu_fence_driver_force_completion(ring);
>  			if (amdgpu_ring_sched_ready(ring))
>  				drm_sched_start(&ring->sched, 0);
> -			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> +			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>  			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
>  			goto exit;
>  		}
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 17fc5dc708f4..48faafd82a99 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -522,6 +522,7 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>   * drm_dev_wedged_event - generate a device wedged uevent
>   * @dev: DRM device
>   * @method: method(s) to be used for recovery
> + * @info: optional information about the guilty app
>   *
>   * This generates a device wedged uevent for the DRM device specified by @dev.
>   * Recovery @method\(s) of choice will be sent in the uevent environment as
> @@ -534,13 +535,14 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>   *
>   * Returns: 0 on success, negative error code otherwise.
>   */
> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_app_info *info)
>  {
>  	const char *recovery = NULL;
>  	unsigned int len, opt;
>  	/* Event string length up to 28+ characters with available methods */
> -	char event_string[32];
> -	char *envp[] = { event_string, NULL };
> +	char event_string[32], pid_string[15], comm_string[TASK_COMM_LEN];
> +	char *envp[] = { event_string, pid_string, comm_string, NULL };
>  
>  	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
>  
> @@ -562,6 +564,14 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>  	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
>  		 "but recovered through reset" : "needs recovery");
>  
> +	if (info) {
> +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> +		snprintf(comm_string, sizeof(comm_string), "APP=%s", info->comm);
> +	} else {
> +		snprintf(pid_string, sizeof(pid_string), "%s", "PID=-1");
> +		snprintf(comm_string, sizeof(comm_string), "%s", "APP=none");
> +	}

This is not much use for wedge cases that needs recovery, since at that point
the userspace will need to clean house anyway.

Which leaves us with only 'none' case and perhaps the need for standardization
of "optional telemetry collection".

Thoughts?

Raag
