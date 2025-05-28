Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65788AC6612
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7902E10E160;
	Wed, 28 May 2025 09:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eKZsfRdo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FCE10E160;
 Wed, 28 May 2025 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748424892; x=1779960892;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=831o/0tq+xxG8bYFWyAIG7pC+lO6xj5Q2fEFNJn6MBg=;
 b=eKZsfRdo9MzgFERq/nt9bU/XOs1wb36DGLGhfaPkTN60uDQMgfz+Z5T3
 Cnab37B/1eZd00YCl9M8Csyd6a+ILMGBvQo3pQL71X+glwNeTRhRWlVj9
 dL3e8jfCzy9zEL8uFZwjbues50ONqqCtWQY8Cd0vdn//usawXNJKMEmZO
 PDoKXPz8UevrE/1VW6zIHdRu7fvVb8b5Lat8dVSdifBO3IwMDgfRfbA9w
 LWc1dM0o3dkLc7OIhD2jl1G1KvgIkgk66x+I4yfNBzFlC1aB7+5vO2vkL
 dlHBNH0B5Si2VA216SSc/mjdHQahwLlpS5t10UhbDSxGQi2izQIs1EWdl A==;
X-CSE-ConnectionGUID: QpIeT3VTScqfJntOYBB1kQ==
X-CSE-MsgGUID: m56aNVKKTZCDSfLbxes/NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50437825"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50437825"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:34:50 -0700
X-CSE-ConnectionGUID: +xoKY/ybQhW1HOYwA0lBJg==
X-CSE-MsgGUID: 4cyIKe+NRE2uGPCtkAHl7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143641016"
Received: from smile.fi.intel.com ([10.237.72.52])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:34:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uKDBL-00000001PEa-19lW; Wed, 28 May 2025 12:34:43 +0300
Date: Wed, 28 May 2025 12:34:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
Message-ID: <aDbYs7QZRfr2i80A@smile.fi.intel.com>
References: <20250523121106.2231003-1-arnd@kernel.org>
 <j7yodlrk7wh3ylvb2z622ndlzm4guhahmakdb6l5d6qtv5sabo@w4bfiehtmaab>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <j7yodlrk7wh3ylvb2z622ndlzm4guhahmakdb6l5d6qtv5sabo@w4bfiehtmaab>
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

On Tue, May 27, 2025 at 03:55:46PM -0500, Lucas De Marchi wrote:
> On Fri, May 23, 2025 at 02:10:46PM +0200, Arnd Bergmann wrote:

...

> > +	depends on INTEL_PLATFORM_DEVICES || !(X86 && ACPI)
> 
> 		   ^
> Did you mean X86_PLATFORM_DEVICES here?

Why do we need to depend on the whole thingy (yes, it will be enabled at the
end) if we only talking about Intel?

> With that, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> I see several drivers selecting
> X86_PLATFORM_DEVICES though. Maybe they should also be translated to
> dependencies instead?

I think so, selecting that sounds wrong.

-- 
With Best Regards,
Andy Shevchenko


