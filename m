Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD42B9B8A3D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 05:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62C810E94E;
	Fri,  1 Nov 2024 04:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYA1py48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E98710E0DA;
 Fri,  1 Nov 2024 04:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730435191; x=1761971191;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=A3wKe3vZsb4UAI0dOJDEu+i/OkVbVgIBrvRNSN14jCI=;
 b=TYA1py48BD3m0eTq4KrGuEG/xE6Pha/g7oqSDd6prYT/9qZrVnirssET
 pbyXzRQoclRNl5N3/s0lVhJyUbhUWn+AgAxwY1M1kWT9RGcE6sAIqnUNh
 mPfRlI/dFac+umfdo+Cd4GEAgbiss5tCDJxkHlzqVHb/VzpU09YuDZFgO
 cXO0kmjTndMNEoaXusKZF4FqI/em5m5itx5v6/Hiiap/yt15Dv3QKQRB6
 SarOPP3lxtU46+Zv8wrZoHSCqi2QM3F5Ikjk8DqzMKcO+PB2/oDvSV6M/
 RMmm4lB7f4pV/lre6pd2zPRXCYMIzfcd17LNlB8wl1WQ6Fs1wPhE6Abv4 w==;
X-CSE-ConnectionGUID: ibCYHqehRTCGz+tB3QtvSQ==
X-CSE-MsgGUID: Vyk5YYWkRfiE/W2niP2GCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29629818"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; d="scan'208";a="29629818"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 21:26:30 -0700
X-CSE-ConnectionGUID: 3T8d51nERz6fewvjDUjdcQ==
X-CSE-MsgGUID: 7SZ5WX47SVWwWLifO++rDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; d="scan'208";a="87667835"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 21:26:25 -0700
Date: Fri, 1 Nov 2024 06:26:21 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 andrealmeid@igalia.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v8 2/4] drm/doc: Document device wedged event
Message-ID: <ZyRYbSm2ki7yUTTz@black.fi.intel.com>
References: <20241025084817.144621-1-raag.jadav@intel.com>
 <20241025084817.144621-3-raag.jadav@intel.com>
 <69b81f6d-203b-451e-935b-085216dfebd1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69b81f6d-203b-451e-935b-085216dfebd1@amd.com>
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

On Tue, Oct 29, 2024 at 10:51:34AM +0100, Christian König wrote:
> Am 25.10.24 um 10:48 schrieb Raag Jadav:
> > Add documentation for device wedged event in a new 'Device wedging'
> > chapter. The describes basic definitions and consumer expectations
> > along with an example.
> > 
> > v8: Improve documentation (Christian, Rodrigo)
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   Documentation/gpu/drm-uapi.rst | 75 ++++++++++++++++++++++++++++++++++
> >   1 file changed, 75 insertions(+)
> > 
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > index 370d820be248..11a7446233b5 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -362,6 +362,81 @@ the first place. DRM devices should make use of devcoredump to store relevant
> >   information about the reset, so this information can be added to user bug
> >   reports.
> > +Device wedging
> > +==============
> > +
> > +Drivers can optionally make use of device wedged event (implemented as
> > +drm_dev_wedged_event() in DRM subsystem) which notifies userspace of wedged
> > +(hanged/unusable) state of the DRM device through a uevent. This is useful
> > +especially in cases where the device is no longer operating as expected even
> > +after a reset and has become unrecoverable from driver context. Purpose of
> > +this implementation is to provide drivers a generic way to recover with the
> > +help of userspace intervention without taking any drastic measures in the
> > +driver.
> > +
> > +A 'wedged' device is basically a dead device that needs attention. The
> > +uevent is the notification that is sent to userspace along with a hint about
> > +what could possibly be attempted to recover the device and bring it back to
> > +usable state. Different drivers may have different ideas of a 'wedged' device
> > +depending on their hardware implementation, and hence the vendor agnostic
> > +nature of the event. It is up to the drivers to decide when they see the need
> > +for recovery and how they want to recover from the available methods.
> > +
> > +Recovery
> > +--------
> > +
> > +Current implementation defines two recovery methods, out of which, drivers
> > +can use any one, both or none. Method(s) of choice will be sent in the uevent
> > +environment as ``WEDGED=<method1>[,<method2>]`` in order of less to more side
> > +effects. If driver is unsure about recovery or method is unknown (like reboot,
> > +firmware flashing, hardware replacement or any other procedure which can't be
> > +attempted on the fly), ``WEDGED=none`` will be sent instead.
> > +
> > +It is the responsibility of the driver to perform required cleanups (like
> > +disabling system memory access or signalling dma_fences) and prepare itself
> > +for the recovery before sending the event.
> 
> That needs to be more like a warning and should have a bit more text. Maybe
> even a separate section.
> 
> Something like this maybe:
> 
> Prerequisites
> ------------------
> 
> Drivers needs to make sure that the device won't harm the system as a
> whole by keeping it in a wedged state. Necessary actions must include
> disabling DMA to system memory as well as communication channels
> with other devices.
> Further drivers must ensure that all dma_fences are signaled and other
> state the core kernel might depend on are cleaned up.
> All ongoing waiting for hardware state changes must be aborted and
> new accesses to the hardware sufficiently blocked....
> 
> 
> I'm not a native speaker of English, so feel free to re-phrase that. But the

Neither am I, but will try my best.

> general approach should be like don't do this before you have made sure a, b
> and c.

Sure, thanks.

> >   Once the event is sent, driver
> > +should block all IOCTLs with an error code.
> 
> Better define which error code that should be. I think -ENODEV similar to a
> hotplug case would be appropriate.

Why not leave it to the drivers to decide depending on the type of failure?

> >   This will signify the reason for
> > +wegeding which can be reported to the application if needed.
> > +
> > +Userspace consumers can parse this event and attempt recovery as per below
> > +expectations.
> > +
> > +    =============== ==================================
> > +    Recovery method Consumer expectations
> > +    =============== ==================================
> > +    rebind          unbind + rebind driver
> > +    bus-reset       unbind + reset bus device + rebind
> > +    none            admin/user policy
> > +    =============== ==================================
> > +
> > +Example for rebind
> > +~~~~~~~~~~~~~~~~~~
> > +
> > +Udev rule::
> > +
> > +    SUBSYSTEM=="drm", ENV{WEDGED}=="rebind", DEVPATH=="*/drm/card[0-9]",
> > +    RUN+="/path/to/rebind.sh $env{DEVPATH}"
> > +
> > +Recovery script::
> > +
> > +    #!/bin/sh
> > +
> > +    DEVPATH=$(readlink -f /sys/$1/device)
> > +    DEVICE=$(basename $DEVPATH)
> > +    DRIVER=$(readlink -f $DEVPATH/driver)
> > +
> > +    echo -n $DEVICE > $DRIVER/unbind
> > +    sleep 1
> > +    echo -n $DEVICE > $DRIVER/bind
> > +
> > +Although scripts are simple enough for basic recovery, admin/users can define
> > +customized policies around recovery action. For example if the driver supports
> > +multiple recovery methods, consumers can opt for the suitable one based on
> > +policy definition. Consumers can also take additional steps like gathering
> > +telemetry information (devcoredump, syslog)
> 
> I'm really wondering if we shouldn't standardize successful resets with this
> event as well?
> 
> E.g. like there was an issue with device X, please collect the devcoredump.

This seems to fit into WEDGED=none case, although with this we'd probably
need to redefine what 'wedged' means.

> And then as a second step have the WEDGED property to indicate:
> a) reset successful, no actions needed.
> b) detach and rebind from the bus
> c) bus-reset
> d) impossible to recover but system as a whole can continue to work.
> e) it's on fire! Run sync and shut down power immediately.

Raag
