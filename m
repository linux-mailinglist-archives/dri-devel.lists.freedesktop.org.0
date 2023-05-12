Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B67700673
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 13:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD00010E67F;
	Fri, 12 May 2023 11:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D9010E67E;
 Fri, 12 May 2023 11:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683890067; x=1715426067;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b2bSeUNs7PpWjC5QOLRCXQ3B+M8q/ixInf2CByxcbkc=;
 b=gj9XEe2VknQn6wEV8Y05OvawKu3ykM1mrh+gPLW2X82B/i6VmAqhuqMK
 kWkiB1pcCTrcsCrubFa5NqdfXe39bgqUyqiHBoV1HrQZlaJ62W8RlfcCJ
 BUm/qZFjMUlR3OhshgV5ccUjJPg0xohlBd0HxFkR7PEkanLIEPnoymYke
 nBkVUtlIpzqzeKa2vXFOrVXha48Y2wOfZhmNgpUSrKqYkN1elKXtxGGJd
 Q+uQEbSPo7MmvCjy+erntMIXtJxYPjEr7JfRxpOYxSQXdG/hMT/+YUHg8
 NuFQERLSq1RbYPIvx/SB0VJM2d8d3j6J5Q7UTnam8GDRAnnwAPbeyADua Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="378900273"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="378900273"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 04:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="730785709"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="730785709"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga008.jf.intel.com with ESMTP; 12 May 2023 04:14:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pxQj5-0004b6-3D; Fri, 12 May 2023 14:14:19 +0300
Date: Fri, 12 May 2023 14:14:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and BIT macros
Message-ID: <ZF4fi5B7PPlgZBOI@smile.fi.intel.com>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509051403.2748545-3-lucas.demarchi@intel.com>
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
> Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
> masks for fixed-width types and also the corresponding BIT_U32(),
> BIT_U16() and BIT_U8().

Why?

> All of those depend on a new "U" suffix added to the integer constant.
> Due to naming clashes it's better to call the macro U32. Since C doesn't
> have a proper suffix for short and char types, the U16 and U18 variants
> just use U32 with one additional check in the BIT_* macros to make
> sure the compiler gives an error when the those types overflow.
> The BIT_U16() and BIT_U8() need the help of GENMASK_INPUT_CHECK(),
> as otherwise they would allow an invalid bit to be passed. Hence
> implement them in include/linux/bits.h rather than together with
> the other BIT* variants.

So, we have _Generic() in case you still wish to implement this.

-- 
With Best Regards,
Andy Shevchenko


