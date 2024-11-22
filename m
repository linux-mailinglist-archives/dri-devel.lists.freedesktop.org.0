Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911779D59C1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 08:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15FF10EAD3;
	Fri, 22 Nov 2024 07:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WS4rgxUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6EE10E082;
 Fri, 22 Nov 2024 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732259298; x=1763795298;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=euGw3dtXA1ltlsc5+XqXfQexRPcnAxDPo0W1W8gAIno=;
 b=WS4rgxUFUpSWHSgLJ6HDOzJcw6xmSYbHnVlTgsLH+/aBwzpNsx1PWW7N
 LsJ82r8jLg0YXXqXJZzJejj1hm2kM4tK9HOl0UKQXQl7j4y74atffRyUN
 482CCni99LL5v0ha15jcEnl/Sv9GvAxxm349tQOlr76j53m0U4PWTwYBi
 ODYAAsUZg4HGhH8R4I4XfDS9Z6O0sSuJfJiztxD+KpFlbCbJRzra7Gspv
 eaUO7SBcRKE9PGeJuvrX9TdZqLJu053CKWnCXUzcLoU33oqK0X3/fOpSW
 B+9oPlH38ipjyFxXWvG/f+P01PjFmU54ztDzbtsSgyFGlV0O+pXhoB9UR g==;
X-CSE-ConnectionGUID: 5bLCxap3SI++gdeVWLc8cg==
X-CSE-MsgGUID: QUHRDVOiRUqruX9giE+6YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43467074"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="43467074"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:07:51 -0800
X-CSE-ConnectionGUID: IB0ACSyWTqCIMsr7NGKLBQ==
X-CSE-MsgGUID: 4f9Jg2fFQFWEeyNozHwXmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90429696"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:07:46 -0800
Date: Fri, 22 Nov 2024 09:07:43 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 andrealmeid@igalia.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v9 1/4] drm: Introduce device wedged event
Message-ID: <Z0Atv3Zw1d0N8hvv@black.fi.intel.com>
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-2-raag.jadav@intel.com>
 <8c7292c3-8459-4ddc-a899-b56b1d93076f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c7292c3-8459-4ddc-a899-b56b1d93076f@linux.intel.com>
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

On Mon, Nov 18, 2024 at 08:26:37PM +0530, Aravind Iddamsetty wrote:
> On 15/11/24 10:37, Raag Jadav wrote:
> > Introduce device wedged event, which notifies userspace of 'wedged'
> > (hanged/unusable) state of the DRM device through a uevent. This is
> > useful especially in cases where the device is no longer operating as
> > expected and has become unrecoverable from driver context. Purpose of
> > this implementation is to provide drivers a generic way to recover with
> > the help of userspace intervention without taking any drastic measures
> > in the driver.
> >
> > A 'wedged' device is basically a dead device that needs attention. The
> > uevent is the notification that is sent to userspace along with a hint
> > about what could possibly be attempted to recover the device and bring
> > it back to usable state. Different drivers may have different ideas of
> > a 'wedged' device depending on their hardware implementation, and hence
> > the vendor agnostic nature of the event. It is up to the drivers to
> > decide when they see the need for recovery and how they want to recover
> > from the available methods.
> >
> > Prerequisites
> > -------------
> >
> > The driver, before opting for recovery, needs to make sure that the
> > 'wedged' device doesn't harm the system as a whole by taking care of the
> > prerequisites. Necessary actions must include disabling DMA to system
> > memory as well as any communication channels with other devices. Further,
> > the driver must ensure that all dma_fences are signalled and any device
> > state that the core kernel might depend on are cleaned up. Once the event
> > is sent, the device must be kept in 'wedged' state until the recovery is
> > performed. New accesses to the device (IOCTLs) should be blocked,
> > preferably with an error code that resembles the type of failure the
> > device has encountered. This will signify the reason for wegeding which
> > can be reported to the application if needed.
> 
> should we even drop the mmaps we created?

Whatever is required for a clean recovery, yes.

Although how would this play out? Do we risk loosing display?
Or any other possible side-effects?

Raag
