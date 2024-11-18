Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1E99D13B0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 15:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D5410E506;
	Mon, 18 Nov 2024 14:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwah4JkR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605D910E4F8;
 Mon, 18 Nov 2024 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731941606; x=1763477606;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1s7Fh4HxKXv3JE+rDne90uVtk7RGKEPj5xN45HrpX+A=;
 b=hwah4JkRpI6REZs7LvFlZHxD3nsgo6HNbaOqodZ312CmsYp10yLvORl9
 ZCvSEhF3HeHnSrwyYMWr8tQIMqD98uVFW4xd00x2NlL0J72xnHc3UIPmB
 msUJvNWlLtqAM0KsejAOapJG4+Nb5CWnhoOnNOyBBsRnEwcP0KyMj9LAg
 0YAeyqTaQj+o1snVW2yVytSUdwf6cL0SBE+V4m6Sh0kaY8HJ7appNqj6i
 y0GjQrd6yfT4lyM5xjDlNQcX9vjIrSSr7bjxyFlcuKc/LFWrol4Urst4a
 gTR7oqhn4htcBCVRB7VMOjC0GCyzu/zmZ2rCViMgJqjZB56/9f4YoUBlq w==;
X-CSE-ConnectionGUID: d24q6GHnTWOt1aPS95UVKQ==
X-CSE-MsgGUID: TwFaokMDQK+qj2IIFeXwvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="49335331"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="49335331"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 06:53:26 -0800
X-CSE-ConnectionGUID: aU28ITtOR7OLXrx6dcwhiA==
X-CSE-MsgGUID: 2wKyjTcwTLO8gR7vknmBbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="90044090"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 06:53:20 -0800
Message-ID: <8c7292c3-8459-4ddc-a899-b56b1d93076f@linux.intel.com>
Date: Mon, 18 Nov 2024 20:26:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] drm: Introduce device wedged event
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-2-raag.jadav@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20241115050733.806934-2-raag.jadav@intel.com>
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


On 15/11/24 10:37, Raag Jadav wrote:
> Introduce device wedged event, which notifies userspace of 'wedged'
> (hanged/unusable) state of the DRM device through a uevent. This is
> useful especially in cases where the device is no longer operating as
> expected and has become unrecoverable from driver context. Purpose of
> this implementation is to provide drivers a generic way to recover with
> the help of userspace intervention without taking any drastic measures
> in the driver.
>
> A 'wedged' device is basically a dead device that needs attention. The
> uevent is the notification that is sent to userspace along with a hint
> about what could possibly be attempted to recover the device and bring
> it back to usable state. Different drivers may have different ideas of
> a 'wedged' device depending on their hardware implementation, and hence
> the vendor agnostic nature of the event. It is up to the drivers to
> decide when they see the need for recovery and how they want to recover
> from the available methods.
>
> Prerequisites
> -------------
>
> The driver, before opting for recovery, needs to make sure that the
> 'wedged' device doesn't harm the system as a whole by taking care of the
> prerequisites. Necessary actions must include disabling DMA to system
> memory as well as any communication channels with other devices. Further,
> the driver must ensure that all dma_fences are signalled and any device
> state that the core kernel might depend on are cleaned up. Once the event
> is sent, the device must be kept in 'wedged' state until the recovery is
> performed. New accesses to the device (IOCTLs) should be blocked,
> preferably with an error code that resembles the type of failure the
> device has encountered. This will signify the reason for wegeding which
> can be reported to the application if needed.

should we even drop the mmaps we created?

Thanks,
Aravind.
>
> Recovery
> --------
>
> Current implementation defines three recovery methods, out of which,
> drivers can use any one, multiple or none. Method(s) of choice will be
> sent in the uevent environment as ``WEDGED=<method1>[,<method2>]`` in
> order of less to more side-effects. If driver is unsure about recovery
> or method is unknown (like soft/hard reboot, firmware flashing, hardware
> replacement or any other procedure which can't be attempted on the fly),
> ``WEDGED=unknown`` will be sent instead.
>
> Userspace consumers can parse this event and attempt recovery as per the
> following expectations.
>
>     =============== ================================
>     Recovery method Consumer expectations
>     =============== ================================
>     none            optional telemetry collection
>     rebind          unbind + bind driver
>     bus-reset       unbind + reset bus device + bind
>     unknown         admin/user policy
>     =============== ================================
>
> The only exception to this is ``WEDGED=none``, which signifies that the
> device was temporarily 'wedged' at some point but was able to recover
> using device specific methods like reset. No explicit action is expected
> from userspace consumers in this case, but they can still take additional
> steps like gathering telemetry information (devcoredump, syslog). This is
> useful because the first hang is usually the most critical one which can
> result in consequential hangs or complete wedging.
>
> Example
> -------
>
> Udev rule::
>
>     SUBSYSTEM=="drm", ENV{WEDGED}=="rebind", DEVPATH=="*/drm/card[0-9]",
>     RUN+="/path/to/rebind.sh $env{DEVPATH}"
>
> Recovery script::
>
>     #!/bin/sh
>
>     DEVPATH=$(readlink -f /sys/$1/device)
>     DEVICE=$(basename $DEVPATH)
>     DRIVER=$(readlink -f $DEVPATH/driver)
>
>     echo -n $DEVICE > $DRIVER/unbind
>     sleep 1
>     echo -n $DEVICE > $DRIVER/bind
>
> Customization
> -------------
>
> Although basic recovery is possible with a simple script, admin/users can
> define custom policies around recovery action. For example, if the driver
> supports multiple recovery methods, consumers can opt for the suitable one
> based on policy definition. Consumers can also choose to have the device
> available for debugging or additional data collection before performing
> the recovery. This is useful especially when the driver is unsure about
> recovery or method is unknown.
>
> v4: s/drm_dev_wedged/drm_dev_wedged_event
>     Use drm_info() (Jani)
>     Kernel doc adjustment (Aravind)
> v5: Send recovery method with uevent (Lina)
> v6: Access wedge_recovery_opts[] using helper function (Jani)
>     Use snprintf() (Jani)
> v7: Convert recovery helpers into regular functions (Andy, Jani)
>     Aesthetic adjustments (Andy)
>     Handle invalid method cases
> v8: Allow sending multiple methods with uevent (Lucas, Michal)
>     static_assert() globally (Andy)
> v9: Provide 'none' method for reset cases (Christian)
>     Provide recovery opts using switch cases
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 63 +++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_device.h  |  8 +++++
>  include/drm/drm_drv.h     |  1 +
>  3 files changed, 72 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index c2c172eb25df..115e1d1c80ea 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -26,6 +26,7 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/debugfs.h>
>  #include <linux/fs.h>
>  #include <linux/module.h>
> @@ -33,6 +34,7 @@
>  #include <linux/mount.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/slab.h>
> +#include <linux/sprintf.h>
>  #include <linux/srcu.h>
>  #include <linux/xarray.h>
>  
> @@ -497,6 +499,67 @@ void drm_dev_unplug(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_dev_unplug);
>  
> +/*
> + * Available recovery methods for wedged device. To be sent along with device
> + * wedged uevent.
> + */
> +static const char *drm_get_wedge_recovery(unsigned int opt)
> +{
> +	switch (BIT(opt)) {
> +	case DRM_WEDGE_RECOVERY_NONE:
> +		return "none";
> +	case DRM_WEDGE_RECOVERY_REBIND:
> +		return "rebind";
> +	case DRM_WEDGE_RECOVERY_BUS_RESET:
> +		return "bus-reset";
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +/**
> + * drm_dev_wedged_event - generate a device wedged uevent
> + * @dev: DRM device
> + * @method: method(s) to be used for recovery
> + *
> + * This generates a device wedged uevent for the DRM device specified by @dev.
> + * Recovery @method\(s) of choice will be sent in the uevent environment as
> + * ``WEDGED=<method1>[,<method2>]`` in order of less to more side-effects.
> + * If caller is unsure about recovery or @method is unknown (0),
> + * ``WEDGED=unknown`` will be sent instead.
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> +{
> +	const char *recovery = NULL;
> +	unsigned int len, opt;
> +	/* Event string length up to 28+ characters with available methods */
> +	char event_string[32];
> +	char *envp[] = { event_string, NULL };
> +
> +	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
> +
> +	for_each_set_bit(opt, &method, BITS_PER_TYPE(method)) {
> +		recovery = drm_get_wedge_recovery(opt);
> +		if (drm_WARN(dev, !recovery, "device wedged, invalid recovery method %u\n", opt))
> +			break;
> +
> +		len += scnprintf(event_string + len, sizeof(event_string), "%s,", recovery);
> +	}
> +
> +	if (recovery)
> +		/* Get rid of trailing comma */
> +		event_string[len - 1] = '\0';
> +	else
> +		/* Caller is unsure about recovery, do the best we can at this point. */
> +		snprintf(event_string, sizeof(event_string), "%s", "WEDGED=unknown");
> +
> +	drm_info(dev, "device wedged, needs recovery\n");
> +	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_dev_wedged_event);
> +
>  /*
>   * DRM internal mount
>   * We want to be able to allocate our own "struct address_space" to control
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index c91f87b5242d..6ea54a578cda 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -21,6 +21,14 @@ struct inode;
>  struct pci_dev;
>  struct pci_controller;
>  
> +/*
> + * Recovery methods for wedged device in order of less to more side-effects.
> + * To be used with drm_dev_wedged_event() as recovery @method. Callers can
> + * use any one, multiple (or'd) or none depending on their needs.
> + */
> +#define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
> +#define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
> +#define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>  
>  /**
>   * enum switch_power_state - power state of drm device
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 1bbbcb8e2d23..f41a82839e28 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -479,6 +479,7 @@ void drm_put_dev(struct drm_device *dev);
>  bool drm_dev_enter(struct drm_device *dev, int *idx);
>  void drm_dev_exit(int idx);
>  void drm_dev_unplug(struct drm_device *dev);
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method);
>  
>  /**
>   * drm_dev_is_unplugged - is a DRM device unplugged
