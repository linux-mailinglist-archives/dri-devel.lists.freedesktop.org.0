Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CC3AC66D2
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 12:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3C510E1BC;
	Wed, 28 May 2025 10:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAPhMtM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FDB10E11C;
 Wed, 28 May 2025 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748427376; x=1779963376;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4pYxOTuaQHO2ph4JvhXpeDEXDuJLt50hEX6YyA8tTZU=;
 b=fAPhMtM8VyFoIhw6un0Hr73bGffft/+09X64PLRn+O7eXNBhAIb7RNKC
 m04FqRH0H721fr2EmthnO/ApxVk1209PJuypYOgRprUzn1fIJyyjw8S21
 OWXDloMEEp2T5cKXHj991QqlUcoWJlrfTo4PkO08/cUd9RJDjTqF9l1os
 TvchnGlQhlMPLXja4e88mYn/yy42pRaBwY4ZpXYfWU7Em29VuC+6bvxmE
 At5qMgyY5Ee/M7Z5IPygYSGqK0Z9piQjWciW25eZj5CQEq2CZS7N3TTUz
 X9hvd82VPiwK+4KQwzcyQUbNU9woDv/Ub8W9SMIHIddwTw+ZxlYJRkZ4L A==;
X-CSE-ConnectionGUID: g4ZDhaR8QviDKTn705SA/w==
X-CSE-MsgGUID: NwzJN/RkR1eRDRbcyAvFBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50552501"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50552501"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 03:16:16 -0700
X-CSE-ConnectionGUID: UukijEHMSIWZ6yS+Xmbk4A==
X-CSE-MsgGUID: dh2cMWCgSMi1dXUS1hwIZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="144171151"
Received: from smile.fi.intel.com ([10.237.72.52])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 03:16:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uKDpR-00000001PjW-2sfp; Wed, 28 May 2025 13:16:09 +0300
Date: Wed, 28 May 2025 13:16:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Arnd Bergmann <arnd@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
Message-ID: <aDbiaepHBSgh1BNZ@smile.fi.intel.com>
References: <20250523121106.2231003-1-arnd@kernel.org>
 <j7yodlrk7wh3ylvb2z622ndlzm4guhahmakdb6l5d6qtv5sabo@w4bfiehtmaab>
 <aDbYs7QZRfr2i80A@smile.fi.intel.com>
 <704fd2b9-04da-4ec8-b854-22bc3ce9058e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <704fd2b9-04da-4ec8-b854-22bc3ce9058e@app.fastmail.com>
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

On Wed, May 28, 2025 at 12:03:43PM +0200, Arnd Bergmann wrote:
> On Wed, May 28, 2025, at 11:34, Andy Shevchenko wrote:
> > On Tue, May 27, 2025 at 03:55:46PM -0500, Lucas De Marchi wrote:
> >> On Fri, May 23, 2025 at 02:10:46PM +0200, Arnd Bergmann wrote:
> >
> > ...
> >
> >> > +	depends on INTEL_PLATFORM_DEVICES || !(X86 && ACPI)
> >> 
> >> 		   ^
> >> Did you mean X86_PLATFORM_DEVICES here?
> 
> Yes, my mistake.
> 
> > Why do we need to depend on the whole thingy (yes, it will be enabled at the
> > end) if we only talking about Intel?
> 
> I don't understand what you mean with 'the whole thing'. My change
> changed the existing 'select X86_PLATFORM_DEVICES if X86 && ACPI'
> into the corresponding dependency, in order to change it the
> least.

It used to be (for only one or two releases) X86_PLATFORM_DRIVERS_INTEL, but it
doesn't look closer to the mistake above, which I was thinking of. So, Lucas is
right.

> The dependency itself is needed because of
> 
>        select ACPI_WMI if X86 && ACPI
> 
> and this in turn is needed for
> 
>        select ACPI_VIDEO if X86 && ACPI
> 
> >> With that, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> 
> >> I see several drivers selecting
> >> X86_PLATFORM_DEVICES though. Maybe they should also be translated to
> >> dependencies instead?
> >
> > I think so, selecting that sounds wrong.
> 
> Agreed. Overall, what I'd really like to see is to remove
> all those 'select' of drivers from other subsystems.

Let's start from some low-hanging fruits?

> I think
> ACPI_VIDEO is at the center here, and changing all the
> 'select ACPI_VIDEO if ACPI' instances to
> 'depends on ACPI_VIDEO || !ACPI_VIDEO' would solve a lot of
> the recurring dependency loop problems in drivers/gpu/.
> 
> Actually doing it without regressions is going to be
> nontrivial though, because any change in this area is likely
> to trigger another dependency loop somewhere.

True and I agree this requires more comprehensive testing.

-- 
With Best Regards,
Andy Shevchenko


