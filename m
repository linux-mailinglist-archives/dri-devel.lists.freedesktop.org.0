Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7B9A501F8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2132E10E7B2;
	Wed,  5 Mar 2025 14:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BspWjwSk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AE110E7B2;
 Wed,  5 Mar 2025 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741185015; x=1772721015;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CztryvVz724A/C9Jw9j1kRy7SYjxYHASl8pVk3UD3r4=;
 b=BspWjwSkTt6EnjqLTFcpvpXMnzoZGixoIsXUUjzXZAWjMee7uAWfmdBb
 S76mSv/SKpPxjJr++SlzD9Kw2KA12EDkMzlm6GZb0bmc59SQRfvSUfiKW
 mMUredSaAwdLIZbnqG2mP0AZu25q3ZLSYN+dEvAgtIzFI5xrz+rXko1fK
 Nv2yu3qWcYuAuKX01Dj4aam7ayGuybi8BPUbZfmn0Ymqy7ABFWftiimec
 aKztdoPxnx+I/SiNX69vrjKB7E2Dwb0wnvozeUARPxSCUZYsWgr9kGXBS
 7HxV5CgAIg635erg4Z98UBu6PZ7JHxax7+MxsSLHufZvUYexz+T1XnmKs w==;
X-CSE-ConnectionGUID: pumImVfUTOCBuFPP8hO78g==
X-CSE-MsgGUID: yBb9uAVFRnetpwEeahdohg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42277941"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="42277941"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 06:30:14 -0800
X-CSE-ConnectionGUID: NtE6aXaWTTCzCINz83RB0g==
X-CSE-MsgGUID: RiH//TIOTqm2C+aBtY8FMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="119396347"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 06:30:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tppl8-0000000HR7Z-2G7H; Wed, 05 Mar 2025 16:30:06 +0200
Date: Wed, 5 Mar 2025 16:30:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: mailhol.vincent@wanadoo.fr
Cc: Yury Norov <yury.norov@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
Message-ID: <Z8hf7pN84-64LWPv@smile.fi.intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
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

On Wed, Mar 05, 2025 at 10:00:15PM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Yury Norov <yury.norov@gmail.com>
> 
> Add __GENMASK_t() which generalizes __GENMASK() to support different

Is it with double underscore? I do not see it.

_t is used for typedef simple types. It's unfortunate to have it
in such a macro. Perhaps T or TYPE will suffice. Or perhaps we want
__GENMASK_Uxx() here?

> types, and implement fixed-types versions of GENMASK() based on it.
> The fixed-type version allows more strict checks to the min/max values
> accepted, which is useful for defining registers like implemented by
> i915 and xe drivers with their REG_GENMASK*() macros.
> 
> The strict checks rely on shift-count-overflow compiler check to fail
> the build if a number outside of the range allowed is passed.
> Example:
> 
> 	#define FOO_MASK GENMASK_U32(33, 4)
> 
> will generate a warning like:
> 
> 	../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
> 	   41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
> 	      |                               ^~

...

> + * __GENMASK_U*() depends on BITS_PER_TYPE() which would not work in the asm

Where are the double underscore variants? I see it only for U128.

> + * code as BITS_PER_TYPE() relies on sizeof(), something not available in
> + * asm. Nethertheless, the concept of fixed width integers is a C thing which
> + * does not apply to assembly code.

-- 
With Best Regards,
Andy Shevchenko


