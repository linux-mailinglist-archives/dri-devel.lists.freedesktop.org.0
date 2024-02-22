Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A9485FBCC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CCE10E958;
	Thu, 22 Feb 2024 15:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q65FEpMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24E210E952;
 Thu, 22 Feb 2024 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708614257; x=1740150257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FLnnfwOnjplXgzJeC+dzihkLf7mLPySqSS5uo2Y0V94=;
 b=Q65FEpMAUxazkQqTBcJDZTNAaJFXFs+/v+TYo9YbqxsE0zROy9jy+jZI
 f9Ay7JuXRhGtnbtIFknCfkiWjRlgKc5nCoZmbJBF2ofnB0vIiBk1Zj0nj
 ZxGPcVvhtyXixSObQhI2Sg1Y6dhyGcvG3/7CZS/fiDyNRe6hpmaXR36FX
 a4YPDqE9KfVTd3gsJYuoZf1pLfij+qfQgbTtVaza0Qi057eoHEpYyK038
 yJ63p6DQKxQkqeso0nPxK+9Spiv80egmNkPbC9sCWwJd2ETBNX7IJSerT
 CZUbX/Dr9zRTRzREUIAWU8v0r/mvEva6r6Zegp0GABMxozGi7NVM6parI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2706674"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2706674"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 07:04:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913539581"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="913539581"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 07:04:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rdAcN-00000006etC-1HFZ; Thu, 22 Feb 2024 17:04:11 +0200
Date: Thu, 22 Feb 2024 17:04:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <Zddiav19kX8FGKY9@smile.fi.intel.com>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
 <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
 <ZdZlVn9BI-0q1Xdn@smile.fi.intel.com>
 <btssirjumey2kcp5dyhe6m3embdwd5bswjz3c6swrhxfijfhld@lztxaptkegw6>
 <ZddfF7kb54o2c/QR@yury-ThinkPad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZddfF7kb54o2c/QR@yury-ThinkPad>
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

On Thu, Feb 22, 2024 at 06:49:59AM -0800, Yury Norov wrote:
> On Wed, Feb 21, 2024 at 03:59:06PM -0600, Lucas De Marchi wrote:

...

> +#define __GENMASK(t, h, l) \
> +	((~0 - (1 << (l)) + 1) & (~0 >> (BITS_PER_LONG - 1 - (h))))

What's wrong on using the UL/ULL() macros?

Also it would be really good to avoid bifurcation of the implementations of
__GENMASK() for both cases.

...

> -#define __GENMASK(h, l) \
> -	(((~UL(0)) - (UL(1) << (l)) + 1) & \
> -	 (~UL(0) >> (BITS_PER_LONG - 1 - (h))))

This at bare minimum can be left untouched for asm case, no?

-- 
With Best Regards,
Andy Shevchenko


