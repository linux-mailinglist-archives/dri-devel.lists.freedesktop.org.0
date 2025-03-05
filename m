Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A86A50BC7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 20:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8E910E2B9;
	Wed,  5 Mar 2025 19:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWn6sKyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C519310E2B3;
 Wed,  5 Mar 2025 19:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741203911; x=1772739911;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=18ZM1//KmWlpxbNtgrT5Ib/LlAyiKm/m64pVpWJqYVY=;
 b=KWn6sKyFBim14ZkCWl2uQaCnXYDrZFSif1SfsXfmlHTyoi7/fjRVxUPW
 RUNMYU4ZFL9cIIgXgkqIhvCkEqXsty4/15Is3biUdeiHPz99lvP7U/1/V
 Cz8c7YRQXbOuOVQc/BGQAAJLXdjY1BYXfQS4EIb9ZqrecMKbwpF7xfaMI
 3UtlJQprPdLMEkwNzQkltejkYWujjfPSYbuhgJ3S0YXCLlDT0WsvQOf4g
 +8kKtEzBVjtZ6MDxgoksp85ZhSkwmm1UWa8unYNqEdsiHdiV75XT6T2sv
 WdTvT//qjdKW7bvVOfFd/Rj/3dDJA1hNqt/XLyXdVUGuJLlNxVY/JBuX+ g==;
X-CSE-ConnectionGUID: 3ZJDRqewR36cAfRclbOQvA==
X-CSE-MsgGUID: yMjR5ZFNT1CJuMIQbRrAqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53585771"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="53585771"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 11:45:11 -0800
X-CSE-ConnectionGUID: ka/lj1c3SCCQmIutfsiqfw==
X-CSE-MsgGUID: XUV/fNJYRWG8hLjPhRMhIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="118507028"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 11:45:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tpufu-0000000HVgZ-1HsU; Wed, 05 Mar 2025 21:45:02 +0200
Date: Wed, 5 Mar 2025 21:45:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
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
Message-ID: <Z8ipvnURG_iejzSX@smile.fi.intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
 <Z8hx9AaUX_GvYq_A@thinkpad>
 <8301ecbc-d035-4257-9b04-c6ef9be4ce32@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8301ecbc-d035-4257-9b04-c6ef9be4ce32@wanadoo.fr>
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

On Thu, Mar 06, 2025 at 01:48:49AM +0900, Vincent Mailhol wrote:
> On 06/03/2025 at 00:47, Yury Norov wrote:
> > On Wed, Mar 05, 2025 at 10:00:15PM +0900, Vincent Mailhol via B4 Relay wrote:

...

> > Having, in fact, different implementations of the same macro for kernel
> > and userspace is a source of problems. Can we move GENMASK_TYPE() to uapi,
> > and implement __GENMASK() on top of them? If not, I'd prefer to keep
> > GENMASK and GENMASK_ULL untouched.
> 
> This is something which I tried to explain in the cover letter. I am not
> confident to declare GENMASK_TYPE() in the uapi and expose it to the
> userland. If we do so, any future change in the parameters would be a
> user breaking change. __GENMASK_U128() looks already too much to me for
> the uapi, I am not keen to bloat it even more with GENMASK_TYPE().
> 
> This plus the fact that if we use GENMASK_TYPE() to generate the asm
> variant, then we can not rely on sizeof() in the definition which makes
> everything over complicated.

I am with you here. The less we done in uAPI the better.
uAPI is something carved in stone, once done it's impossible to change.

> I acknowledge that not having a common denominator is not best, but I
> see this as an acceptable tradeoff.

...

> >> +#define GENMASK_U8(h, l) ((unsigned int)GENMASK_t(u8,  h, l))
> >> +#define GENMASK_U16(h, l) ((unsigned int)GENMASK_t(u16, h, l))
> > 
> > Typecast to the type that user provides explicitly?  And maybe do
> > in GENMASK_TYPE()
> 
> I have a slight preference for the cast to unsigned int for the reason
> explained above. But that is not a deal breaker. If you believe that the
> u8/u16 casts are better, let me know, I will be happy to change it :)

At least can you provide an existing use case (or use cases) that need
this castings? Also still a big question what will happen with it on asm.
Can it cope with 0x000000f0 passed as imm8, for example?

> >> +#define GENMASK_U32(h, l) GENMASK_t(u32, h, l)
> >> +#define GENMASK_U64(h, l) GENMASK_t(u64, h, l)

...

> > But GENMASK_U128() becomes a special case now.
> > The 128-bit GENMASK is unsued, but it's exported in uapi. Is there any
> > simple way to end up with a common implementation for all fixed-type
> > GENMASKs?
> 
> What bothers me is that the 128 bit types are not something available on
> all architectures, c.f. the CONFIG_ARCH_SUPPORTS_INT128. So, I would
> need a U128() equivalent to the ULL() but which does not break on
> architectures which do not support 128 bits integers.
> 
> This is where I am stuck. If someone can guide me on how to write a
> robust U128() macro, then I think the common implementation could be
> feasible.

I think we may leave that U128 stuff alone for now.

-- 
With Best Regards,
Andy Shevchenko


