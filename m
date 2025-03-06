Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BD1A55389
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8341810E98F;
	Thu,  6 Mar 2025 17:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9tOjDmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C2110E83E;
 Thu,  6 Mar 2025 17:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741283631; x=1772819631;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TsDBzmg+/rLwfKQ/+P27CYwnhvUD4cy1XnVraIMWiyw=;
 b=k9tOjDmos0HJvnDAdAE9P3d4t9MhmGSx4DvVksMDlxkpbfaJrK+qkmU6
 EmMCOMBy68iOOKu7Q3Fxdb3WDcN5D3U2/H/ZqgoqNYZAmO90zGn3V7uFi
 3eeUnVyPbLDwkgInKTbpulZ2cFI5hdBDb6ia8mD/cI5TlxyBvcJep1gRC
 5QkepGDZCtw4Tjupi1VC0wdhSiq6EPPgU0GWyvIxhcWGz0bO3kn9K48tj
 mmji+EGKxGHzzM5311F+koMIxGyYQ78jOI1v7EWfuSuJi7LdLaToZHI2S
 rCDTMZxxGq+mTX01X29GXYbAL7rT4mgKY9ejAzHbPhcKdimXDaBecPayN w==;
X-CSE-ConnectionGUID: Y8vxyeL5T9+9JQBCQmI98A==
X-CSE-MsgGUID: xvbbkZpRQD6HLH+dNAZlig==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42446057"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42446057"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 09:53:50 -0800
X-CSE-ConnectionGUID: lXk9vUeURSOFzz5QrvGS7w==
X-CSE-MsgGUID: jvwBAumET9S2eHd1WBwZdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="119278800"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 09:53:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tqFPi-00000000B5i-2edP; Thu, 06 Mar 2025 19:53:42 +0200
Date: Thu, 6 Mar 2025 19:53:42 +0200
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
Subject: Re: [PATCH v5 2/7] bits: introduce fixed-type genmasks
Message-ID: <Z8nhJv36eq11oJOD@smile.fi.intel.com>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-2-b443e9dcba63@wanadoo.fr>
 <Z8meY7NS65_d14og@smile.fi.intel.com>
 <1c081c07-2833-4fa9-96fb-88a7295d2c14@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c081c07-2833-4fa9-96fb-88a7295d2c14@wanadoo.fr>
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

On Fri, Mar 07, 2025 at 01:08:01AM +0900, Vincent Mailhol wrote:
> On 06/03/2025 à 22:08, Andy Shevchenko wrote:
> > On Thu, Mar 06, 2025 at 08:29:53PM +0900, Vincent Mailhol via B4 Relay wrote:

...

> Does this mean I get your Reviewed-by tag? Or will you wait the v6 to
> formally give it?

I'll wait for v6.

> > but just to be sure: you prepared your series using histogram
> > diff algo, right?
> 
> No, I never used the histogram diff. My git config is extremely boring.
> Mostly vanilla.
> 
> I remember that Linus even commented on this:
> 
> https://lore.kernel.org/all/CAHk-=wiUxm-NZ1si8dXWVTTJ9n3c+1SRTC0V+Lk7hOE4bDVwJQ@mail.gmail.com/
> 
> But he made it clear this was *not* a requirement, so I just left the
> diff algorithm to the default. Or did I miss any communication that
> contributors should now use histogram diff?

Use your common sense, i.e. look at the result and evaluate which one is more
readable. My guts are telling me that histogram will be slightly better here.

> Regardless, I do not mind activating it. I just did a:
> 
>   git config diff.algorithm histogram
> 
> The v6 will have histogram diffs.

-- 
With Best Regards,
Andy Shevchenko


