Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BDC97E7B2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 10:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4450710E3B4;
	Mon, 23 Sep 2024 08:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9UmSb1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2088E10E3B0;
 Mon, 23 Sep 2024 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727080744; x=1758616744;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Pq35tBxsFJX/9dySiCqY0Lwo7MXxWgYOdqSO7+yO388=;
 b=V9UmSb1dBzZoqtq/hjEZ/jPSt5tFydiGiJ/LtDgPZV24NMHKjoMCtUWE
 CcJ3PEK30wIukCLEWtwrILquGA1GBgVUsYjDAQHaD4M5REDqdcNBxGV8l
 lvgRTO6Bn29S/OttYf8khQQmOOxD94Hj0FvtGEbF2Gs7gAOn42FDa0Q6c
 TsdaCl2GziN4RenOPG0Pasmp7IWnnhGBE7E8eo9dsWC2lQZ3XgLMkFRmo
 VGrgQHgx5ecacZxib69FcMQJkGQCBZbBDO8iZrVBVcFsGpzz5TcQSVPKR
 x/ry9b1eyzohmdLmd2kS+C4TKklDpu9dXJFNMSutsxg9ZwOSKrHj0VDws Q==;
X-CSE-ConnectionGUID: hDYj4wc9QQm/U7uwzL5Dkg==
X-CSE-MsgGUID: A9h2vjYHQcm+8KpB/TCuiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37152819"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="37152819"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 01:39:03 -0700
X-CSE-ConnectionGUID: m0FcGW+PQnCpOk0nm5oqYw==
X-CSE-MsgGUID: qQtX/mbKTNqbLoI/qepi5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="70887702"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 01:38:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sseat-0000000BtZo-2Jfi; Mon, 23 Sep 2024 11:38:55 +0300
Date: Mon, 23 Sep 2024 11:38:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v6 1/4] drm: Introduce device wedged event
Message-ID: <ZvEpH_po4bYmEISh@smile.fi.intel.com>
References: <20240923035826.624196-1-raag.jadav@intel.com>
 <20240923035826.624196-2-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923035826.624196-2-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Sep 23, 2024 at 09:28:23AM +0530, Raag Jadav wrote:
> Introduce device wedged event, which will notify userspace of wedged
> (hanged/unusable) state of the DRM device through a uevent. This is
> useful especially in cases where the device is no longer operating as
> expected and has become unrecoverable from driver context.
> 
> Purpose of this implementation is to provide drivers a way to recover
> through userspace intervention. Different drivers may have different
> ideas of a "wedged device" depending on their hardware implementation,
> and hence the vendor agnostic nature of the event. It is up to the drivers
> to decide when they see the need for recovery and how they want to recover
> from the available methods.
> 
> Current implementation defines three recovery methods, out of which,
> drivers can choose to support any one or multiple of them. Preferred
> recovery method will be sent in the uevent environment as WEDGED=<method>.
> Userspace consumers (sysadmin) can define udev rules to parse this event
> and take respective action to recover the device.
> 
>  Method    | Consumer expectations
> -----------|-----------------------------------
>  rebind    | unbind + rebind driver
>  bus-reset | unbind + reset bus device + rebind
>  reboot    | reboot system

> v4: s/drm_dev_wedged/drm_dev_wedged_event
>     Use drm_info() (Jani)
>     Kernel doc adjustment (Aravind)
> v5: Send recovery method with uevent (Lina)
> v6: Access wedge_recovery_opts[] using helper function (Jani)
>     Use snprintf() (Jani)

Hmm... Isn't changelog in the cover letter is not enough?

...

> +/*
> + * Available recovery methods for wedged device. To be sent along with device
> + * wedged uevent.
> + */
> +#define WEDGE_LEN	32	/* Need 16+ */

This "Need 16+" comment seems unfinished as it doesn't tell why.

...

> +int drm_dev_wedged_event(struct drm_device *dev, enum wedge_recovery_method method)
> +{
> +	char event_string[WEDGE_LEN] = {};
> +	char *envp[] = { event_string, NULL };
> +
> +	if (!test_bit(method, &dev->wedge_recovery)) {
> +		drm_err(dev, "device wedged, recovery method not supported\n");
> +		return -EOPNOTSUPP;
> +	}

> +	snprintf(event_string, sizeof(event_string), "WEDGED=%s", recovery_method_name(method));

Is sprintf.h being included already?

> +	drm_info(dev, "device wedged, generating uevent\n");
> +	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}

...

> +/**
> + * enum wedge_recovery_method - Recovery method for wedged device in order
> + * of severity. To be set as bit fields in drm_device.wedge_recovery variable.
> + * Drivers can choose to support any one or multiple of them depending on their
> + * needs.
> + */

> +

Redundant blank line.

> +enum wedge_recovery_method {
> +	/** @DRM_WEDGE_RECOVERY_REBIND: unbind + rebind driver */
> +	DRM_WEDGE_RECOVERY_REBIND,
> +
> +	/** @DRM_WEDGE_RECOVERY_BUS_RESET: unbind + reset bus device + rebind */
> +	DRM_WEDGE_RECOVERY_BUS_RESET,
> +
> +	/** @DRM_WEDGE_RECOVERY_REBOOT: reboot system */
> +	DRM_WEDGE_RECOVERY_REBOOT,
> +
> +	/** @DRM_WEDGE_RECOVERY_MAX: for bounds checking, do not use */
> +	DRM_WEDGE_RECOVERY_MAX
> +};

...

> +extern const char *const wedge_recovery_opts[];

It's not NULL terminated. How users will know that they have an index valid?

Either you NULL-terminate that, or export the size as well (personally I would
go with the first approach).

...

> +static inline bool recovery_method_is_valid(enum wedge_recovery_method method)
> +{
> +	if (method >= DRM_WEDGE_RECOVERY_REBIND && method < DRM_WEDGE_RECOVERY_MAX)
> +		return true;
> +
> +	return false;

Besides that this can be written as

	return method >= DRM_WEDGE_RECOVERY_REBIND && method < DRM_WEDGE_RECOVERY_MAX;

> +}

this seems a runtime approach for what we have at compile-time, i.e. static_assert()
It's also possible to have as a third approach, but it's less robust.

-- 
With Best Regards,
Andy Shevchenko


