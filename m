Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE87AC66FB
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 12:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A6F10E1D8;
	Wed, 28 May 2025 10:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8fVjHaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7007A10E155;
 Wed, 28 May 2025 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748428270; x=1779964270;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5FpyHY2tQuyzJ0S2g4vKQEYDZ8iGnxH6tJ5/Xaw/2eg=;
 b=G8fVjHaTc9q3hOcNiCVy77EzNYzuTvdE/8yKBrcjdV+ineM55sco+aHw
 2WDs7whJ0TY9pW0w/nMjbCAiQ52GQDB6MIGHVAyxuZhQrs4jD7aNOQbpy
 XVUtr+7WqFVlnT4sqdtzQe1APdsXIUzqrbO+QkiUkDuDLHiHCWoLS09Kn
 W6sPjsC2LatrjcsALxz39VAC5Ck/aJp8BS6fVHSHFHaq+cx3IISmnoRDT
 0CCVEt4XUeOWY05IzzNxQNM+T+pcWHvMwn7c/bRCA61BwDwKO/fefUp+g
 3GsHZuSAuLEA6dHmNSkDkXNTrblj8AcEngBEz/K32lMmleeD2mN3t3WaM Q==;
X-CSE-ConnectionGUID: zE3ixqfeSc6xPI93OJCLFA==
X-CSE-MsgGUID: Yvhm8ojBSzerOw9FE6JVnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49695533"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="49695533"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 03:31:08 -0700
X-CSE-ConnectionGUID: s3rzE0s4SMa7uinSdw/PTw==
X-CSE-MsgGUID: mhMGwAv/SfGRjzvLZUWWkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143234633"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 03:31:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uKE3o-00000001PuX-3hiz; Wed, 28 May 2025 13:31:00 +0300
Date: Wed, 28 May 2025 13:31:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christopher Snowhill <chris@kode54.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Lucas De Marchi <lucas.demarchi@intel.com>,
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
 linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
Message-ID: <aDbl5CIGulMng3de@smile.fi.intel.com>
References: <20250523121106.2231003-1-arnd@kernel.org>
 <j7yodlrk7wh3ylvb2z622ndlzm4guhahmakdb6l5d6qtv5sabo@w4bfiehtmaab>
 <aDbYs7QZRfr2i80A@smile.fi.intel.com>
 <704fd2b9-04da-4ec8-b854-22bc3ce9058e@app.fastmail.com>
 <DA7PSM1WUKBI.3JA6THJTRF5B7@kode54.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA7PSM1WUKBI.3JA6THJTRF5B7@kode54.net>
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

On Wed, May 28, 2025 at 03:17:03AM -0700, Christopher Snowhill wrote:
> On Wed May 28, 2025 at 3:03 AM PDT, Arnd Bergmann wrote:
> > On Wed, May 28, 2025, at 11:34, Andy Shevchenko wrote:
> >> On Tue, May 27, 2025 at 03:55:46PM -0500, Lucas De Marchi wrote:
> >>> On Fri, May 23, 2025 at 02:10:46PM +0200, Arnd Bergmann wrote:

...

> > I think ACPI_VIDEO is at the center here, and changing all the
> > 'select ACPI_VIDEO if ACPI' instances to
> > 'depends on ACPI_VIDEO || !ACPI_VIDEO' would solve a lot of
> 
> Maybe you meant 'depends on ACPI_VIDEO || !ACPI' ?

I believe not. The depends on FOO || FOO=n is idiomatic in Kconfig.

> > the recurring dependency loop problems in drivers/gpu/.
> >
> > Actually doing it without regressions is going to be
> > nontrivial though, because any change in this area is likely
> > to trigger another dependency loop somewhere.

-- 
With Best Regards,
Andy Shevchenko


