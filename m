Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C4BAA4A53
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 13:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B0010E0E2;
	Wed, 30 Apr 2025 11:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWCJMksN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDF510E0E2;
 Wed, 30 Apr 2025 11:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746013681; x=1777549681;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cvZDcBsXWKWJpyaNRzC0GH8PJHas0D4umuw8g9rTmS8=;
 b=EWCJMksN/XcbrUDBpN7aPHnhqoRvsz8+ekrthfzhbyYx/lQ0fnwwrphH
 EZnrkQw8WzuABcEAW6cO1Pu2hAZc4sIUSAk73EyW8EcIoRcHLLsRdMT90
 N+hnTKGG97PjeckmxAZaVUQMgiTj8szzBaDkUx0dzj5UVVSspyV4mQ0xo
 oxha7gImHOvUKEfr9s/RFael9PlH4h2PlIijuoD3Bn/SREdPXXezfsLh8
 kD22M2COVVHurR8BYn7Zr3kCUFQVw+P+vhHI2bgNoILBMU2mIZeqR+33g
 +vVK8ZiCZ5yVdc/68U0bIcjJwdEonxWCigUsISq42pr/toPODvA+J+SUe Q==;
X-CSE-ConnectionGUID: IEfvhNcKRSWxXXZLE5rtdw==
X-CSE-MsgGUID: 9d/pqyo+R0+047WcewxnLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="59029929"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="59029929"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:48:00 -0700
X-CSE-ConnectionGUID: sUtHADSWTHyLmdiSnueWUA==
X-CSE-MsgGUID: Cdbg2aOuSVeGqnMICU67PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="138926787"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:47:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: Re: [RFC 0/9] Introducing firmware late binding
In-Reply-To: <20250429160956.1014376-1-badal.nilawar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
Date: Wed, 30 Apr 2025 14:47:55 +0300
Message-ID: <87jz71vpjo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 29 Apr 2025, Badal Nilawar <badal.nilawar@intel.com> wrote:
> Introducing firmware late binding feature to enable firmware loading
> for the devices, such as the fan controller and voltage regulator,
> during the driver probe.
> Typically, firmware for these devices are part of IFWI flash image but
> can be replaced at probe after OEM tuning.

I replied to the previous version [1], the comment has been ignored, and
there's no version information in this series on what changed.

Please don't do that.

BR,
Jani.


[1] https://lore.kernel.org/r/87v7qnwdm3.fsf@intel.com


>
> Alexander Usyskin (2):
>   mei: bus: add mei_cldev_mtu interface
>   mei: late_bind: add late binding component driver
>
> Badal Nilawar (6):
>   drm/xe/late_bind_fw: Introducing late_bind_fw
>   drm/xe/xe_late_bind_fw: Initialize late binding firmware
>   drm/xe/xe_late_bind_fw: Load late binding firmware
>   drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
>   drm/xe/xe_late_bind_fw: Reload late binding fw in S2Idle/S3 resume
>   drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late
>     binding
>
> Rodrigo Vivi (1):
>   {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
>
>  Documentation/userspace-api/fwctl/index.rst   |   1 +
>  drivers/gpu/drm/xe/Kconfig                    |   2 +
>  drivers/gpu/drm/xe/Makefile                   |   2 +
>  drivers/gpu/drm/xe/xe_debugfs.c               |  42 +++
>  drivers/gpu/drm/xe/xe_device.c                |   7 +
>  drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>  drivers/gpu/drm/xe/xe_late_bind_fw.c          | 289 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_late_bind_fw.h          |  18 ++
>  drivers/gpu/drm/xe/xe_late_bind_fw_types.h    |  97 ++++++
>  drivers/gpu/drm/xe/xe_pci.c                   |   5 +
>  drivers/gpu/drm/xe/xe_pcode_fwctl.c           | 218 +++++++++++++
>  drivers/gpu/drm/xe/xe_pcode_fwctl.h           |  13 +
>  drivers/gpu/drm/xe/xe_pm.c                    |   7 +
>  drivers/misc/mei/Kconfig                      |   1 +
>  drivers/misc/mei/Makefile                     |   1 +
>  drivers/misc/mei/bus.c                        |  13 +
>  drivers/misc/mei/late_bind/Kconfig            |  12 +
>  drivers/misc/mei/late_bind/Makefile           |   9 +
>  drivers/misc/mei/late_bind/mei_late_bind.c    | 261 ++++++++++++++++
>  include/drm/intel/i915_component.h            |   1 +
>  .../drm/intel/xe_late_bind_mei_interface.h    |  49 +++
>  include/linux/mei_cl_bus.h                    |   1 +
>  include/uapi/fwctl/fwctl.h                    |   1 +
>  include/uapi/fwctl/xe_pcode.h                 |  80 +++++
>  24 files changed, 1134 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
>  create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
>  create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.h
>  create mode 100644 drivers/misc/mei/late_bind/Kconfig
>  create mode 100644 drivers/misc/mei/late_bind/Makefile
>  create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
>  create mode 100644 include/drm/intel/xe_late_bind_mei_interface.h
>  create mode 100644 include/uapi/fwctl/xe_pcode.h

-- 
Jani Nikula, Intel
