Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF698A3D0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A41A10E0A4;
	Mon, 30 Sep 2024 13:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRwh2IrN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A1410E0A4;
 Mon, 30 Sep 2024 13:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727701207; x=1759237207;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IXMwSrIc4nJso3027HeetFDRPbbpcRT3kuh2ZjZSjN0=;
 b=YRwh2IrNmwgDXE6efVF0XQOhairfx4qJYEI6t/LfkP6gKoZiaQiRMft5
 fQXX6IgwflUaY4yNPMYdnaZmR342RNnkAYZrPNo7rIj71LrVZN9mn3yl1
 Cf91SV5n51QwU/xhF2UmW3rWFVwMQtxX17MMpD7XhczNaAzEHHeHsaGB0
 SYg3jB+rnc7+BYQDPJBmiX0WYFxkwXafcDMsSjOo2LqzMKUsS+YZOTVxS
 6QwEbyDk1hgomfr1Dkrk4QVUtbxhxIV04hnBnomjDo89k03Rq4jd/Bklg
 bG1qPYiBn+Y+eMd54Kq0c5kxJAS/kVwb8pns6DN3EVR6Jf+NdLmTyXDnZ w==;
X-CSE-ConnectionGUID: o8vbVq2+QJ6tsBQWZuX8+A==
X-CSE-MsgGUID: 5EvfrmGRSDCalPLfVPDZjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="30582467"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="30582467"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:00:06 -0700
X-CSE-ConnectionGUID: RyaL/ViLR326Hj/XCdUTQA==
X-CSE-MsgGUID: jESKNTQCRsqcyERzGFtdGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="73693257"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:00:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1svG0N-0000000EfJI-2yje; Mon, 30 Sep 2024 15:59:59 +0300
Date: Mon, 30 Sep 2024 15:59:59 +0300
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
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <Zvqgz3Vpz2IS1Cua@smile.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930073845.347326-2-raag.jadav@intel.com>
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

On Mon, Sep 30, 2024 at 01:08:41PM +0530, Raag Jadav wrote:
> Introduce device wedged event, which will notify userspace of wedged
> (hanged/unusable) state of the DRM device through a uevent. This is
> useful especially in cases where the device is no longer operating as
> expected even after a hardware reset and has become unrecoverable from
> driver context.
> 
> Purpose of this implementation is to provide drivers a generic way to
> recover with the help of userspace intervention. Different drivers may
> have different ideas of a "wedged device" depending on their hardware
> implementation, and hence the vendor agnostic nature of the event.
> It is up to the drivers to decide when they see the need for recovery
> and how they want to recover from the available methods.
> 
> Current implementation defines three recovery methods, out of which,
> drivers can choose to support any one or multiple of them. Preferred
> recovery method will be sent in the uevent environment as WEDGED=<method>.
> Userspace consumers (sysadmin) can define udev rules to parse this event
> and take respective action to recover the device.
> 
>     =============== ==================================
>     Recovery method Consumer expectations
>     =============== ==================================
>     rebind          unbind + rebind driver
>     bus-reset       unbind + reset bus device + rebind
>     reboot          reboot system
>     =============== ==================================

...

> +/*
> + * Available recovery methods for wedged device. To be sent along with device
> + * wedged uevent.
> + */
> +static const char *const drm_wedge_recovery_opts[] = {
> +	[DRM_WEDGE_RECOVERY_REBIND] = "rebind",
> +	[DRM_WEDGE_RECOVERY_BUS_RESET] = "bus-reset",
> +	[DRM_WEDGE_RECOVERY_REBOOT] = "reboot",
> +};

Place for static_assert() is here, as it closer to the actual data we test...

> +static bool drm_wedge_recovery_is_valid(enum drm_wedge_recovery method)
> +{
> +	static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == DRM_WEDGE_RECOVERY_MAX);

...it doesn't fully belong to this function (or only to this function).

> +	return method >= DRM_WEDGE_RECOVERY_REBIND && method < DRM_WEDGE_RECOVERY_MAX;
> +}

Why do we need this one-liner (after above comment being addressed) as a
separate function?

-- 
With Best Regards,
Andy Shevchenko


