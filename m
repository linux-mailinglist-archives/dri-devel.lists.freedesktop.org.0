Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0DBAF6900
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 06:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2B510E11B;
	Thu,  3 Jul 2025 04:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOgChSDU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5043310E0A8;
 Thu,  3 Jul 2025 04:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751515586; x=1783051586;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jR08oYudmZXLH42mc/T3+6gOPwb6EWarK2YpMecPu6o=;
 b=BOgChSDUsmCQOyp+521A6if2IEsFf2HF18X2NmUVhyHGbzJonxBNNdDU
 Yj+q1r84Wtx9FXUA2QgFNHDskmYzD2jEokqOi4diHjROvNZuJYkZ3Q9+n
 hfGv0Ddr2KffmgqELc9qxxuJXEC5MQdd6BeS921ZA7Mxo5iYR/cgnwRo3
 Cul9B9AYFylSYSZ4WU5XYC4MFBcqZbJUlCZ+XaJsOfwiX33cJNCzCqVrb
 rMt0tnANx1nBPQz/O686civVaYrTMGzglNfdP1gw5CHAXJ19gIIQGrDUX
 K7xu0fvcVMA2Ov45mdKivbmXoljvp7yOdV+chCDMz9Xwj2Nu/YRJ7x+au Q==;
X-CSE-ConnectionGUID: KB0Uwd0ySCyciBMuWW0s8g==
X-CSE-MsgGUID: 3DTqErJ9QQ6vbOROCJQLXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57636590"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="57636590"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 21:06:26 -0700
X-CSE-ConnectionGUID: OvLF7xAeQrKsagFwG4747Q==
X-CSE-MsgGUID: bAuxgwXgSCOHH150a6otOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="153694497"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 21:06:22 -0700
Date: Thu, 3 Jul 2025 07:06:19 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/7] drm: Add a vendor-specific recovery method to
 device wedged uevent
Message-ID: <aGYBu-6bAEc1il4O@black.fi.intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702141118.3564242-2-riana.tauro@intel.com>
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

On Wed, Jul 02, 2025 at 07:41:11PM +0530, Riana Tauro wrote:
> Certain errors can cause the device to be wedged and may
> require a vendor specific recovery method to restore normal
> operation.
> 
> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
> must provide additional recovery documentation if this method
> is used.
> 
> Cc: André Almeida <andrealmeid@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Suggested-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 5 ++++-
>  drivers/gpu/drm/drm_drv.c      | 2 ++
>  include/drm/drm_device.h       | 4 ++++
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 263e5a97c080..1ea835a3fc66 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -424,7 +424,9 @@ uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>  more side-effects. If driver is unsure about recovery or method is unknown
>  (like soft/hard system reboot, firmware flashing, physical device replacement
>  or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``

We may also want to remove the examples for unknown method so that we
don't confuse users in case any of it overlaps with vendor-specific.

> -will be sent instead.
> +will be sent instead. If recovery method is specific to vendor
> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
> +specific documentation for further recovery steps.
>  
>  Userspace consumers can parse this event and attempt recovery as per the
>  following expectations.
> @@ -435,6 +437,7 @@ following expectations.
>      none            optional telemetry collection
>      rebind          unbind + bind driver
>      bus-reset       unbind + bus reset/re-enumeration + bind
> +    vendor-specific vendor specific recovery method
>      unknown         consumer policy
>      =============== ========================================
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 02556363e918..c72e5c67479d 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -535,6 +535,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>  		return "rebind";
>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
>  		return "bus-reset";
> +	case DRM_WEDGE_RECOVERY_VENDOR:
> +		return "vendor-specific";
>  	default:
>  		return NULL;
>  	}
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 08b3b2467c4c..40a4caaa6313 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -26,10 +26,14 @@ struct pci_controller;
>   * Recovery methods for wedged device in order of less to more side-effects.
>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>   * use any one, multiple (or'd) or none depending on their needs.
> + *
> + * If DRM_WEDGE_RECOVERY_VENDOR method is used, vendors must provide additional
> + * documentation outlining further recovery steps.

The original documentation is sufficient so let's not duplicate specific
cases here.

Raag

>   */
>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>  
>  /**
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> -- 
> 2.47.1
> 
