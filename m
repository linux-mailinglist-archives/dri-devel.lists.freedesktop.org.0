Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4792CB0F41B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 15:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E88E10E7CE;
	Wed, 23 Jul 2025 13:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXtynNco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3C710E7CE;
 Wed, 23 Jul 2025 13:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753277675; x=1784813675;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c0Zls4X+RUA3UlPXCpqjQwV11rfI/QVw6RHu6mpARlE=;
 b=fXtynNcoEi8ubIG7vMrRts8NhnAcCU/2BwvwDDR4FU7gVT5MFBCnmM2x
 EX+x3oJ75ipX5JjBbwjZZco8JBKZHqEXF9vgAs8IG0lGqlzGQhoCQWo87
 cztAA7eYRlXx1f/TeI3BF29kk/My8u5xzY2nOdAl6liGfCIEmTz3v54/b
 scE6Uylung9OCTd3cmtdmgIrOd0tCL/gtxa5tZZJ+qmx8eb8lLEuqbrd1
 e83msxC0b6Z5nH1l9vdimi7jWtumuJNyvmcfpAncTR8I4prxBbhvuKs0J
 0eL/U3XILVRSfvtpJlj45/7u0W6v9RuqFUCU/1cT2zeQcjlV2e+JIkMSF A==;
X-CSE-ConnectionGUID: +TcSRn+aRBW3gOw8H/6+KA==
X-CSE-MsgGUID: Nrw1D28KTDu0z0g+zanwvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="54778034"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="54778034"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 06:34:35 -0700
X-CSE-ConnectionGUID: fnGut0aYTJOYN0yx2YOWbw==
X-CSE-MsgGUID: 9qaPIGkIT2OYWa92i/MC5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="163768928"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 06:34:32 -0700
Date: Wed, 23 Jul 2025 16:34:29 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, simona.vetter@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH v5 6/9] drm/xe/doc: Document device wedged and runtime
 survivability
Message-ID: <aIDk5XBEolQVTVHU@black.fi.intel.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
 <20250715104730.2109506-7-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715104730.2109506-7-riana.tauro@intel.com>
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

On Tue, Jul 15, 2025 at 04:17:26PM +0530, Riana Tauro wrote:
> Add documentation for vendor specific device wedged recovery method
> and runtime survivability.

...

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index bd81ebd370cb..d28c92f8b80c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1133,6 +1133,28 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>  }
>  
>  /**
> + * DOC: Device Wedging

Xe Device Wedging?

> + * Xe driver uses device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> + *
> + * When device is in wedged state, every IOCTL will be blocked and GT cannot be
> + * used. Certain critical errors like gt reset failure, firmware failures can cause
> + * the device to be wedged. The default recovery mechanism for a wedged state

method

> + * is re-probe (unbind + bind)

Let's use uapi naming for consistency.

> + * Another recovery method is ``WEDGED=vendor-specific`. Below are the usecases

If we mean method, it's just ``vendor-specific`` with correct quoting.

> + * that trigger vendor-specific drm wedged uevent and actions to be performed
> + * to recover the device.
> + *
> + * Case 1: CSC firmware errors require a firmware flash to restore normal device
> + *         operation. Since firmware flash is a vendor-specific action
> + *         `WEDGED=vendor-specific`` recovery method along with
> + *         :ref:`runtime survivability mode <xe-survivability-mode>` is used to
> + *         notify userspace. User can then initiate a firmware flash using userspace tools
> + *         like fwupd to restore device to normal situation.
> + */
> +
> +/*
>   * xe_device_set_wedged_method - Set wedged recovery method
>   * @xe: xe device instance
>   * @method: recovery method to set
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 267d0e3fd85a..9f770db116f4 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -22,15 +22,18 @@
>  #define MAX_SCRATCH_MMIO 8
>  
>  /**
> - * DOC: Xe Boot Survivability
> + * DOC: Survivability Mode
>   *
> - * Boot Survivability is a software based workflow for recovering a system in a failed boot state
> + * Survivability Mode is a software based workflow for recovering a system in a failed boot state
>   * Here system recoverability is concerned with recovering the firmware responsible for boot.
>   *
> - * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
> - * to be flashed through mei and collect telemetry. The driver's probe flow is modified
> - * such that it enters survivability mode when pcode initialization is incomplete and boot status
> - * denotes a failure.
> + * Boot Survivability
> + * ===================
> + *
> + * Boot Survivability is implemented by loading the driver with bare minimum (no drm card) to allow
> + * the firmware to be flashed through mei and collect telemetry. The driver's probe flow is

'mei driver' or it gives the impression of a tool. Also, what telemetry?

> + * modified such that it enters survivability mode when pcode initialization is incomplete and boot
> + * status denotes a failure.
>   *
>   * Survivability mode can also be entered manually using the survivability mode attribute available
>   * through configfs which is beneficial in several usecases. It can be used to address scenarios
> @@ -46,7 +49,7 @@
>   * Survivability mode is indicated by the below admin-only readable sysfs which provides additional

If it's sensitive, does it make sense to also log it?

>   * debug information::
>   *
> - *	/sys/bus/pci/devices/<device>/surivability_mode
> + *	/sys/bus/pci/devices/<device>/survivability_mode
>   *
>   * Capability Information:
>   *	Provides boot status
> @@ -56,6 +59,22 @@
>   *	Provides history of previous failures
>   * Auxiliary Information
>   *	Certain failures may have information in addition to postcode information
> + *
> + * Runtime Survivability
> + * =====================
> + *
> + * Certain runtime firmware errors can cause the device to enter a wedged state
> + * (:ref:`xe-device-wedging`) requiring a firmware flash to restore normal operation.
> + * Runtime Survivability Mode indicates that a firmware flash is necessary to recover the device and
> + * is indicated by the presence of survivability mode sysfs::
> + *
> + *	/sys/bus/pci/devices/<device>/survivability_mode
> + *
> + * Survivability mode sysfs provides information about the type of survivability mode.
> + *
> + * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
> + * survivability mode. User can then initiate a firmware update using userspace tools like fwupd
> + * to restore device to normal operation.
>   */

Overall looks good and gets the point across, but I think consistent
termiologies would make it more easy to follow and understand.

method/mechanism/actions
wedged uevent/drm wedged uevent/drm device wedged uevent
firmware flash/firmware update
operation/situation

... and so on.

Raag
