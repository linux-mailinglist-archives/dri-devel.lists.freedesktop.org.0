Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EAAAFEB9E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 16:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006F710E00A;
	Wed,  9 Jul 2025 14:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+GtN1eS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B379B10E00A;
 Wed,  9 Jul 2025 14:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752070743; x=1783606743;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MpFKdPgrlzZsfqr583UieBgUF6VCTRyQdOSvpHYeQFE=;
 b=B+GtN1eSoC6NFM3VALjLbFf0ljodSx2FFnfBsBPBQGIJJHGzWVEEUZX7
 v777Vxt3rqE/JybXLYBjHh+/WoG9XRqy1TiQxVGrbftIh0rS1WHvZXCml
 lb5cMKfKzlbaYtflcz72mlJStShBaZZwGwQN/ruj4FwlYFlS38bJmHAWh
 EVTuCn8bM02pozUQhv+MTbJMucdv2xtB/WTGmkeN5KVxV9xYMExHuF1tm
 7B8rQTo6qfOX1P0jk5aXYB0xg4mnbTnrBHOULf83ZiPIp8XjZGsBnNbnx
 F2lCxpi5M5gTegkKOjvR3cvBRZPAPyK8SRjcYRSVcnT6Kv8WNqrq7+Dn+ A==;
X-CSE-ConnectionGUID: MAYu36FAQZOMRA0ycZ0z2Q==
X-CSE-MsgGUID: wNx9lyMIRzOxJ9u77zRBiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64589759"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="64589759"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 07:19:03 -0700
X-CSE-ConnectionGUID: MgdSzVd4RAqeXg6f/bIlng==
X-CSE-MsgGUID: esSEkBeTTl26MzwbvbyGag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155199991"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 07:18:58 -0700
Date: Wed, 9 Jul 2025 17:18:54 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/9] drm: Add a vendor-specific recovery method to
 device wedged uevent
Message-ID: <aG56Trd1h5WbWYJt@black.fi.intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-2-riana.tauro@intel.com>
 <aG5xglf8BeGzleWM@phenom.ffwll.local>
 <d42e17ef-30ce-4bf1-9948-7f08fd6f3bac@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d42e17ef-30ce-4bf1-9948-7f08fd6f3bac@amd.com>
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

On Wed, Jul 09, 2025 at 04:09:20PM +0200, Christian König wrote:
> On 09.07.25 15:41, Simona Vetter wrote:
> > On Wed, Jul 09, 2025 at 04:50:13PM +0530, Riana Tauro wrote:
> >> Certain errors can cause the device to be wedged and may
> >> require a vendor specific recovery method to restore normal
> >> operation.
> >>
> >> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
> >> must provide additional recovery documentation if this method
> >> is used.
> >>
> >> v2: fix documentation (Raag)
> >>
> >> Cc: André Almeida <andrealmeid@igalia.com>
> >> Cc: Christian König <christian.koenig@amd.com>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: <dri-devel@lists.freedesktop.org>
> >> Suggested-by: Raag Jadav <raag.jadav@intel.com>
> >> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > 
> > I'm not really understanding what this is useful for, maybe concrete
> > example in the form of driver code that uses this, and some tool or
> > documentation steps that should be taken for recovery?
> 
> The recovery method for this particular case is to flash in a new firmware.
> 
> > The issues I'm seeing here is that eventually we'll get different
> > vendor-specific recovery steps, and maybe even on the same device, and
> > that leads us to an enumeration issue. Since it's just a string and an
> > enum I think it'd be better to just allocate a new one every time there's
> > a new strange recovery method instead of this opaque approach.
> 
> That is exactly the opposite of what we discussed so far.
> 
> The original idea was to add a firmware-flush recovery method which looked a bit wage since it didn't give any information on what to do exactly.
> 
> That's why I suggested to add a more generic vendor-specific event with refers to the documentation and system log to see what actually needs to be done.
> 
> Otherwise we would end up with events like firmware-flash, update FW image A, update FW image B, FW version mismatch etc....

Agree. Any newly allocated method that is specific to a vendor is going to
be opaque anyway, since it can't be generic for all drivers. This just helps
reduce the noise in DRM core.

And yes, there could be different vendor-specific cases for the same driver
and the driver should be able to provide the means to distinguish between
them.

Raag

> >> ---
> >>  Documentation/gpu/drm-uapi.rst | 9 +++++----
> >>  drivers/gpu/drm/drm_drv.c      | 2 ++
> >>  include/drm/drm_device.h       | 4 ++++
> >>  3 files changed, 11 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> >> index 263e5a97c080..c33070bdb347 100644
> >> --- a/Documentation/gpu/drm-uapi.rst
> >> +++ b/Documentation/gpu/drm-uapi.rst
> >> @@ -421,10 +421,10 @@ Recovery
> >>  Current implementation defines three recovery methods, out of which, drivers
> >>  can use any one, multiple or none. Method(s) of choice will be sent in the
> >>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> >> -more side-effects. If driver is unsure about recovery or method is unknown
> >> -(like soft/hard system reboot, firmware flashing, physical device replacement
> >> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> >> -will be sent instead.
> >> +more side-effects. If recovery method is specific to vendor
> >> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
> >> +specific documentation for further recovery steps. If driver is unsure about
> >> +recovery or method is unknown, ``WEDGED=unknown`` will be sent instead
> >>  
> >>  Userspace consumers can parse this event and attempt recovery as per the
> >>  following expectations.
> >> @@ -435,6 +435,7 @@ following expectations.
> >>      none            optional telemetry collection
> >>      rebind          unbind + bind driver
> >>      bus-reset       unbind + bus reset/re-enumeration + bind
> >> +    vendor-specific vendor specific recovery method
> >>      unknown         consumer policy
> >>      =============== ========================================
> >>  
> >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> >> index cdd591b11488..0ac723a46a91 100644
> >> --- a/drivers/gpu/drm/drm_drv.c
> >> +++ b/drivers/gpu/drm/drm_drv.c
> >> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
> >>  		return "rebind";
> >>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
> >>  		return "bus-reset";
> >> +	case DRM_WEDGE_RECOVERY_VENDOR:
> >> +		return "vendor-specific";
> >>  	default:
> >>  		return NULL;
> >>  	}
> >> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> >> index 08b3b2467c4c..08a087f149ff 100644
> >> --- a/include/drm/drm_device.h
> >> +++ b/include/drm/drm_device.h
> >> @@ -26,10 +26,14 @@ struct pci_controller;
> >>   * Recovery methods for wedged device in order of less to more side-effects.
> >>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
> >>   * use any one, multiple (or'd) or none depending on their needs.
> >> + *
> >> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> >> + * details.
> >>   */
> >>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
> >>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
> >>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> >> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
> >>  
> >>  /**
> >>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> >> -- 
> >> 2.47.1
> >>
> > 
> 
