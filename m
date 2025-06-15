Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19036ADA197
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 13:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD92A10E220;
	Sun, 15 Jun 2025 11:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MC7Jfqa4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339A910E21F;
 Sun, 15 Jun 2025 11:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749985309; x=1781521309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ShYjDmRhDuyDUBLCl65nzoU7Z7r6ZL6+weJbx9+y4z4=;
 b=MC7Jfqa46pBrtsnavNf8ue+RGWDh+qmZqZLT8fHguXkz/pJhDF7il7ul
 mYgooy+xyg3fruvcgVaOlAm7D7WsjCMzgrblh5kTHN91TZ/oLf7f59REP
 NINWLxqhqgn48s9ZpzIibyRIAhM17yoakj8a18csbv/kt2Cp1JOtAho+j
 GccD0Z5tS1A+SBxfZrAt4rHchewsCNH5asg7+fSBeWxIP8WKH+QkJ5rWu
 0nWCbw0GwHV0LLSpH5qinw/TWRU2f67oZzQpKVeQzi7w9mrUZGbwvVoTQ
 aWXNFgfEBMs6Hv1g7rLtexsgavUhE482MptyqHXCcX+bVDfRSRRMBWGG2 Q==;
X-CSE-ConnectionGUID: i2UmzXdSSuWGp2EYJfX34A==
X-CSE-MsgGUID: TVvN1iFFQ+CtTmlvWRsxcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52014251"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; d="scan'208";a="52014251"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 04:01:48 -0700
X-CSE-ConnectionGUID: wRWLPTNqRMGyfMfyD8/7xA==
X-CSE-MsgGUID: Ss0Zx9mdTaeVePw6WwXenw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; d="scan'208";a="152995807"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 04:01:43 -0700
Date: Sun, 15 Jun 2025 14:01:40 +0300
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
Subject: Re: [PATCH v7 2/5] drm: Create a task info option for wedge events
Message-ID: <aE6oFOBbQ_3oRwtB@black.fi.intel.com>
References: <20250613184348.1761020-1-andrealmeid@igalia.com>
 <20250613184348.1761020-3-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613184348.1761020-3-andrealmeid@igalia.com>
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

On Fri, Jun 13, 2025 at 03:43:45PM -0300, André Almeida wrote:
> When a device get wedged, it might be caused by a guilty application.
> For userspace, knowing which task was involved can be useful for some
> situations, like for implementing a policy, logs or for giving a chance
> for the compositor to let the user know what task was involved in the
> problem.  This is an optional argument, when the task info is not
> available, the PID and TASK string won't appear in the event string.
> 
> Sometimes just the PID isn't enough giving that the task might be already
> dead by the time userspace will try to check what was this PID's name,
> so to make the life easier also notify what's the task's name in the user
> event.
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (for i915 and xe)
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>

Although I'm okay with this version, a few aesthetic nits below.

> Signed-off-by: André Almeida <andrealmeid@igalia.com>

...

> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 56dd61f8e05a..eba99a081ec1 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -538,10 +538,15 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>  	}
>  }
>  
> +#define WEDGE_STR_LEN 32
> +#define PID_STR_LEN 15
> +#define COMM_STR_LEN (TASK_COMM_LEN + 5)

Align the values using tabs for readability, and since you're using
TASK_COMM_LEN here please include sched.h instead of relying on
intermediate header which may not guarantee it for other archs and
randconfigs.

> +
>  /**
>   * drm_dev_wedged_event - generate a device wedged uevent
>   * @dev: DRM device
>   * @method: method(s) to be used for recovery
> + * @info: optional information about the guilty task
>   *
>   * This generates a device wedged uevent for the DRM device specified by @dev.
>   * Recovery @method\(s) of choice will be sent in the uevent environment as
> @@ -554,13 +559,13 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>   *
>   * Returns: 0 on success, negative error code otherwise.
>   */
> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_task_info *info)
>  {
>  	const char *recovery = NULL;
>  	unsigned int len, opt;
> -	/* Event string length up to 28+ characters with available methods */
> -	char event_string[32];
> -	char *envp[] = { event_string, NULL };
> +	char event_string[WEDGE_STR_LEN], pid_string[PID_STR_LEN], comm_string[COMM_STR_LEN];
> +	char *envp[] = { event_string, NULL, NULL, NULL };

Let's make this reverse xmas order and be consistent with other helpers
in this file.

>  	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
>  
> @@ -582,6 +587,13 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>  	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
>  		 "but recovered through reset" : "needs recovery");
>  
> +	if (info && (info->comm[0] != '\0') && (info->pid >= 0)) {
> +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> +		snprintf(comm_string, sizeof(comm_string), "TASK=%s", info->comm);
> +		envp[1] = pid_string;
> +		envp[2] = comm_string;
> +	}
> +
>  	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>  }
>  EXPORT_SYMBOL(drm_dev_wedged_event);

...

> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index e2f894f1b90a..729e1c6da138 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -30,6 +30,14 @@ struct pci_controller;
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>  
> +/**
> + * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> + */
> +struct drm_wedge_task_info {
> +	pid_t pid;
> +	char comm[TASK_COMM_LEN];

Ditto for sched.h.

Raag

> +};
> +
>  /**
>   * enum switch_power_state - power state of drm device
>   */
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 63b51942d606..3f76a32d6b84 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -487,7 +487,8 @@ void drm_put_dev(struct drm_device *dev);
>  bool drm_dev_enter(struct drm_device *dev, int *idx);
>  void drm_dev_exit(int idx);
>  void drm_dev_unplug(struct drm_device *dev);
> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method);
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_task_info *info);
>  
>  /**
>   * drm_dev_is_unplugged - is a DRM device unplugged
> -- 
> 2.49.0
> 
