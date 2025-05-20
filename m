Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E75ABD1C9
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A92E10E512;
	Tue, 20 May 2025 08:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPfgaoVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF2610E505;
 Tue, 20 May 2025 08:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747729425; x=1779265425;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Z3mWB6fazXiDZ09nycUaCv631uVbUC/xPeimFswAWVQ=;
 b=dPfgaoVZ0+a9t5lxLiVpz9QnfleKjx9vjOSGpQ4ZnbqRuLCkqk1o4HMv
 lgfWXATjYffwO1W2rNzBm6Z0stIZlYrRbFcqqfW3yueONu1xfci64V8oh
 uxjrBPeAWpBBhh5Ao0Q7WdQcB2AIRQAwaZZ+0Qj3l+Gl1g/AMAVCWEpJO
 bWH/dAcTV/1sVKJS7SeMK7DmCPui/7XDQyz726Z8QUq2+0YgJZdzTMnbO
 SQwhMrjDympEvDVi8onpYnn+Rf1ckq1IcES1m+DrSu6ePNaNjNNeJ6TzU
 QS+RA/G85GNENmaV71SnaFoZBgJnDu5spdy8uoqH+h1QAxLgOIXfS7a7g g==;
X-CSE-ConnectionGUID: O16aM+2OS+K+06+4br4U2Q==
X-CSE-MsgGUID: YatG8n/STc2fdCPxRir1XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="72161964"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="72161964"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 01:23:45 -0700
X-CSE-ConnectionGUID: lO27bfipSamXHy8546OwBg==
X-CSE-MsgGUID: O2M989Z8Snqk6KbkRuNhIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139655504"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 01:23:41 -0700
Date: Tue, 20 May 2025 11:23:38 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v4 1/3] drm: Create an app info option for wedge events
Message-ID: <aCw8CtDyciN3EFVp@black.fi.intel.com>
References: <20250519220333.101355-1-andrealmeid@igalia.com>
 <20250519220333.101355-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519220333.101355-2-andrealmeid@igalia.com>
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

On Mon, May 19, 2025 at 07:03:30PM -0300, André Almeida wrote:
> When a device get wedged, it might be caused by a guilty application.
> For userspace, knowing which app was the cause can be useful for some
> situations, like for implementing a policy, logs or for giving a chance
> for the compositor to let the user know what app caused the problem.
> This is an optional argument, when the app info is not available, the
> PID and TASK string won't appear in the event string.
> 
> Sometimes just the PID isn't enough giving that the app might be already
> dead by the time userspace will try to check what was this PID's name,
> so to make the life easier also notify what's the app's name in the user
> event.
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (for i915 and xe)
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v4: s/APP/TASK

With this in place I think it's better to use the same terminology
everywhere else for consistency (code, doc, commit message and subject).

> v3: Make comm_string and pid_string empty when there's no app info
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>  drivers/gpu/drm/drm_drv.c                  | 16 ++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_reset.c      |  3 ++-
>  drivers/gpu/drm/xe/xe_device.c             |  3 ++-
>  include/drm/drm_device.h                   | 11 +++++++++++
>  include/drm/drm_drv.h                      |  3 ++-
>  7 files changed, 31 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 4d1b54f58495..d27091d5929c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6363,7 +6363,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  	atomic_set(&adev->reset_domain->reset_res, r);
>  
>  	if (!r)
> -		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> +		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>  
>  	return r;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index acb21fc8b3ce..a47b2eb301e5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -166,7 +166,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  			if (amdgpu_ring_sched_ready(ring))
>  				drm_sched_start(&ring->sched, 0);
>  			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
> -			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> +			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>  			goto exit;
>  		}
>  		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3dc7acd56b1d..c428d05a8e7c 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -542,6 +542,7 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>   * drm_dev_wedged_event - generate a device wedged uevent
>   * @dev: DRM device
>   * @method: method(s) to be used for recovery
> + * @info: optional information about the guilty app
>   *
>   * This generates a device wedged uevent for the DRM device specified by @dev.
>   * Recovery @method\(s) of choice will be sent in the uevent environment as
> @@ -554,13 +555,13 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>   *
>   * Returns: 0 on success, negative error code otherwise.
>   */
> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_app_info *info)
>  {
>  	const char *recovery = NULL;
>  	unsigned int len, opt;
> -	/* Event string length up to 28+ characters with available methods */
> -	char event_string[32];
> -	char *envp[] = { event_string, NULL };
> +	char event_string[WEDGE_STR_LEN], pid_string[PID_LEN] = "", comm_string[TASK_COMM_LEN] = "";
> +	char *envp[] = { event_string, NULL, NULL, NULL };
>  
>  	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
>  
> @@ -582,6 +583,13 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>  	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
>  		 "but recovered through reset" : "needs recovery");
>  
> +	if (info) {
> +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> +		snprintf(comm_string, sizeof(comm_string), "TASK=%s", info->comm);

Are we allowing callers to pass empty members?

> +		envp[1] = pid_string;
> +		envp[2] = comm_string;
> +	}
> +
>  	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>  }
>  EXPORT_SYMBOL(drm_dev_wedged_event);
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index dbdcfe130ad4..ba1d8fdc3c7b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1448,7 +1448,8 @@ static void intel_gt_reset_global(struct intel_gt *gt,
>  		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
>  	else
>  		drm_dev_wedged_event(&gt->i915->drm,
> -				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
> +				     NULL);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c02c4c4e9412..f329613e061f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1168,7 +1168,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  
>  		/* Notify userspace of wedged device */
>  		drm_dev_wedged_event(&xe->drm,
> -				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
> +				     NULL);
>  	}
>  
>  	for_each_gt(gt, xe, id)
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index e2f894f1b90a..8a3368dfc7f0 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -30,6 +30,17 @@ struct pci_controller;
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>  
> +#define WEDGE_STR_LEN 32
> +#define PID_LEN 15

These are not shared macros, perhaps move these to drm_drv.c?

Raag

> +
> +/**
> + * struct drm_wedge_app_info - information about the guilty app of a wedge dev
> + */
> +struct drm_wedge_app_info {
> +	pid_t pid;
> +	char *comm;
> +};
> +
>  /**
>   * enum switch_power_state - power state of drm device
>   */
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index a43d707b5f36..8fc6412a6345 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -482,7 +482,8 @@ void drm_put_dev(struct drm_device *dev);
>  bool drm_dev_enter(struct drm_device *dev, int *idx);
>  void drm_dev_exit(int idx);
>  void drm_dev_unplug(struct drm_device *dev);
> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method);
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_app_info *info);
>  
>  /**
>   * drm_dev_is_unplugged - is a DRM device unplugged
> -- 
> 2.49.0
> 
