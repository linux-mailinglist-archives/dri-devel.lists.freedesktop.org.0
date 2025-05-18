Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419EBABB1B5
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 23:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA6D10E18D;
	Sun, 18 May 2025 21:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NzjmN4qz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD4210E012;
 Sun, 18 May 2025 21:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747603567; x=1779139567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eshD621sTSOzcT215XItxQpbF2o7T4ts7L9YisTnoWk=;
 b=NzjmN4qzRti1tYZBHIPm0WE+Ke6petgE0pwx08iDkRUBw7quvfb6vupf
 0K1jAo2gikFvuBixpN3TYJByIYHIPC/fTO9A6lLOnm0AlEcaWnfC+zBx8
 74IjvjqpAxEihrxV4rL3R/8LgBRdapUivrlssPKb1oPCSJEfCdHHz26Vo
 xNDsP2g8lKebedVmGueyxagd4boxJWXnlPgO/g4OY59Iumx7luWagG427
 hWbD7eKclltsZgGU//TJGJHBqD7gEYoCief28jUJdOXnxAE5josh0FEbH
 YoJbkk0H3CQdr8bR8OVfIMUpV8lRUV+JdzmtkIdqO36vJeClL0yFFOvb6 Q==;
X-CSE-ConnectionGUID: 8TtQsURFTI23HK2MCtUZzw==
X-CSE-MsgGUID: EhsMYQqqTAuaCjR3VhxFDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="53317166"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; d="scan'208";a="53317166"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 14:26:06 -0700
X-CSE-ConnectionGUID: qq9Bu7WjQdCuB3SDefeRaw==
X-CSE-MsgGUID: S40TOqY7Rvik/sdiklA93Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; d="scan'208";a="139711497"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 14:26:02 -0700
Date: Mon, 19 May 2025 00:26:00 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 1/3] drm: Create an app info option for wedge events
Message-ID: <aCpQaPzY0Vl5cl8T@black.fi.intel.com>
References: <20250512203437.989894-1-andrealmeid@igalia.com>
 <20250512203437.989894-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512203437.989894-2-andrealmeid@igalia.com>
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

On Mon, May 12, 2025 at 05:34:35PM -0300, André Almeida wrote:
> When a device get wedged, it might be caused by a guilty application.
> For userspace, knowing which app was the cause can be useful for some
> situations, like for implementing a policy, logs or for giving a chance
> for the compositor to let the user know what app caused the problem.
> This is an optional argument, when the app info is not available, the
> PID and APP string won't appear in the event string.
> 
> Sometimes just the PID isn't enough giving that the app might be already
> dead by the time userspace will try to check what was this PID's name,
> so to make the life easier also notify what's the app's name in the user
> event.

...

> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3dc7acd56b1d..e30efa4ac330 100644
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
> @@ -554,13 +555,14 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
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
> +	char event_string[32], pid_string[15] = "", comm_string[TASK_COMM_LEN] = "";

Let's make these into proper defines for consistency,

#define WEDGE_STR_LEN
#define PID_LEN

and drop redundant comment.

> +	char *envp[] = { event_string, NULL, NULL, NULL };
>  
>  	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
>  
> @@ -582,6 +584,13 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>  	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
>  		 "but recovered through reset" : "needs recovery");
>  
> +	if (info) {
> +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> +		snprintf(comm_string, sizeof(comm_string), "APP=%s", info->comm);

Since this is a core helper, we'd want to make sure these fields are valid
and not being abused.

Also s/APP/TASK IMHO, but upto you.

Raag
