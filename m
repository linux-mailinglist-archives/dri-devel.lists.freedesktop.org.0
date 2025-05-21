Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF479ABEF37
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 11:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B153210E29A;
	Wed, 21 May 2025 09:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfzsStLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4031110E29A;
 Wed, 21 May 2025 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747818675; x=1779354675;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AyTlo5MV4RoWb0/jlG7PaHacCmtKMIX6jHJZ5hNGkqo=;
 b=WfzsStLml9i75yHwjIcOt+3CTxOikjzCnXzWXZek9CVg0IvPD6LtcaSh
 8AWNaldt6fcfpNgN6wN5s+ViawYeWpexP7wteCHyka9mduP7xdKZ9ODBJ
 k3Jcuk1kWYLW96pTYgwCDAXIer2E8xDdGfR4eGHhb0om828Irwvaz2Fd0
 8oUIdQdPD+iS1h98Jh7pbPBU0pHigzOZCAHMOzbMjNahMyFtE/ddIDshv
 HhKk+bivNdx+heFYge3iAljrFWcOHdvOJEWHPWaJMYQwFqbBydTUfDaMH
 7H2B4TmVOpRNCPDGZPeOVlvbIEfQCFGfB5GT/yzRj9bx9folWcDcRZyPv g==;
X-CSE-ConnectionGUID: C9tGTyT8TzKgB7IJypSNqg==
X-CSE-MsgGUID: MYa/cUv2SXa4vi2BjDt6sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53595238"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="53595238"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 02:11:14 -0700
X-CSE-ConnectionGUID: CNu791ZaRYCb5Aog6f/7NQ==
X-CSE-MsgGUID: QRyvUxAxS/aBYV8nILle/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140044302"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 02:11:10 -0700
Date: Wed, 21 May 2025 12:11:07 +0300
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
Subject: Re: [PATCH v5 1/3] drm: Create a task info option for wedge events
Message-ID: <aC2Yq89IL5tx8MY3@black.fi.intel.com>
References: <20250520163243.328746-1-andrealmeid@igalia.com>
 <20250520163243.328746-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520163243.328746-2-andrealmeid@igalia.com>
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

On Tue, May 20, 2025 at 01:32:41PM -0300, André Almeida wrote:
> When a device get wedged, it might be caused by a guilty application.
> For userspace, knowing which task was the cause can be useful for some
> situations, like for implementing a policy, logs or for giving a chance
> for the compositor to let the user know what task caused the problem.
> This is an optional argument, when the task info is not available, the
> PID and TASK string won't appear in the event string.
> 
> Sometimes just the PID isn't enough giving that the task might be already
> dead by the time userspace will try to check what was this PID's name,
> so to make the life easier also notify what's the task's name in the user
> event.

...

> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_task_info *info)
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
> @@ -582,6 +586,13 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>  	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
>  		 "but recovered through reset" : "needs recovery");
>  
> +	if (info && ((info->comm && info->comm[0] != '\0'))) {

Thanks for adding this. Should we check if pid > 0?

Also, I was wondering what if the driver only has info on one of the
given members? Should we allow it to be flagged independently?

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
> index e2f894f1b90a..c13fe85210f2 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -30,6 +30,14 @@ struct pci_controller;
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>  
> +/**
> + * struct drm_wedge_task_info - information about the guilty app of a wedge dev

s/app/task, missed an instance ;)

> + */
> +struct drm_wedge_task_info {
> +	pid_t pid;
> +	char *comm;
> +};

Raag
