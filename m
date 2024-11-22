Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D2E9D61B0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9272710EBE7;
	Fri, 22 Nov 2024 16:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnxVOmUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A5F10E301;
 Fri, 22 Nov 2024 16:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732291375; x=1763827375;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QRr37RA14akjZg3hT7KJvo3SRw4lq5ZSzKxt1VhKt3c=;
 b=MnxVOmUhJtx2tmsCjh9cBn1FVXZJMveTpLp+abS119EEbEDqWfj+PlzQ
 gev+gAaNO+xJHXd8OORFnNzzMwNwkEVeXzmCdQOo4dzqc8T943i5c/MLt
 H52ngeMXtAoU+GwtmBczCpfLl2v2nX28Fxwy54k3n/6PyoKv2VB6b8lZv
 P6Cf1lDRmfaA+Fnkzc3QF/Z7AXHoHvHqf1Wj4ZbmiH6396P7LmWEFzaAS
 Dll3ORmcFP4FvSFO9TrbvMp0z8H7RI1k0eeFqxjQtq5s0c7ONRSPM4Z/T
 piAcnNeIC52c8ft66xWEliJQznUcsCTgmqvZTBmzRfBABvK0U2gFuv5cL g==;
X-CSE-ConnectionGUID: OzkhO8e6SQmBT4hITFuGhg==
X-CSE-MsgGUID: TaOIuaiuQKm/BKbqTEPqHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32602270"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="32602270"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 08:02:55 -0800
X-CSE-ConnectionGUID: 6L6QQQs1R0Ow/CMsbIOrnw==
X-CSE-MsgGUID: uANIV3POT0usWdgqIyN+mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="90251722"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 08:02:50 -0800
Date: Fri, 22 Nov 2024 18:02:47 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v9 1/4] drm: Introduce device wedged event
Message-ID: <Z0CrJ3C3wJqtySLp@black.fi.intel.com>
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-2-raag.jadav@intel.com>
 <8c7292c3-8459-4ddc-a899-b56b1d93076f@linux.intel.com>
 <Z0Atv3Zw1d0N8hvv@black.fi.intel.com>
 <3644d364-6021-46fe-b3a2-689821551984@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3644d364-6021-46fe-b3a2-689821551984@amd.com>
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

On Fri, Nov 22, 2024 at 11:09:32AM +0100, Christian König wrote:
> Am 22.11.24 um 08:07 schrieb Raag Jadav:
> > On Mon, Nov 18, 2024 at 08:26:37PM +0530, Aravind Iddamsetty wrote:
> > > On 15/11/24 10:37, Raag Jadav wrote:
> > > > Introduce device wedged event, which notifies userspace of 'wedged'
> > > > (hanged/unusable) state of the DRM device through a uevent. This is
> > > > useful especially in cases where the device is no longer operating as
> > > > expected and has become unrecoverable from driver context. Purpose of
> > > > this implementation is to provide drivers a generic way to recover with
> > > > the help of userspace intervention without taking any drastic measures
> > > > in the driver.
> > > > 
> > > > A 'wedged' device is basically a dead device that needs attention. The
> > > > uevent is the notification that is sent to userspace along with a hint
> > > > about what could possibly be attempted to recover the device and bring
> > > > it back to usable state. Different drivers may have different ideas of
> > > > a 'wedged' device depending on their hardware implementation, and hence
> > > > the vendor agnostic nature of the event. It is up to the drivers to
> > > > decide when they see the need for recovery and how they want to recover
> > > > from the available methods.
> > > > 
> > > > Prerequisites
> > > > -------------
> > > > 
> > > > The driver, before opting for recovery, needs to make sure that the
> > > > 'wedged' device doesn't harm the system as a whole by taking care of the
> > > > prerequisites. Necessary actions must include disabling DMA to system
> > > > memory as well as any communication channels with other devices. Further,
> > > > the driver must ensure that all dma_fences are signalled and any device
> > > > state that the core kernel might depend on are cleaned up. Once the event
> > > > is sent, the device must be kept in 'wedged' state until the recovery is
> > > > performed. New accesses to the device (IOCTLs) should be blocked,
> > > > preferably with an error code that resembles the type of failure the
> > > > device has encountered. This will signify the reason for wegeding which
> > > > can be reported to the application if needed.
> > > should we even drop the mmaps we created?
> > Whatever is required for a clean recovery, yes.
> > 
> > Although how would this play out? Do we risk loosing display?
> > Or any other possible side-effects?
> 
> Before sending a wedge event all DMA transfers of the device have to be
> blocked.
> 
> So yes, all display, mmap() and file descriptor connections you had with the
> device would need to be re-created.

Does it mean we'd have to rely on userspace to unmap()?

Raag
