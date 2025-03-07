Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B25A56F85
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720A910EC0D;
	Fri,  7 Mar 2025 17:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMO7dmMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6F010EC0D;
 Fri,  7 Mar 2025 17:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741369703; x=1772905703;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B8llukmjpnYTZeJDVBXphW31+bV8O5TYaK3otj6LuiY=;
 b=AMO7dmMTk8oDRSVMXx+kZX4TrmSK1esAYRHvSBoEoR4leZm3hg9Oa7xv
 Zy0LuLR2Rgl80hbhW/le12CZ+794SagQstg1OC5vbw7lrhp8a9Rds31Gr
 wCSd5APLPDnZW6hapKQiSCBRy3XDTwOaVo1agoryflRLbd6uVhopfJ+cd
 Nb/C9dbLu3hTrC8Dqw8KyCu3l2CXQZfRO33SaXhkdkELznyOiOkYlrm1A
 pwtFYMrN8fV2e7i7D/i1KLYlSOzxfsDdsUffw6HEJznqIQw5tU9srWfQo
 4ecJJvFnz3j8VbrJKpUyVdDE5zi8ynimvF+Xkvbspyz/S4bRGWDzy9K90 w==;
X-CSE-ConnectionGUID: BCGOiEPhTAy/PEceS1fHdA==
X-CSE-MsgGUID: PFI+2n0TTSubRBMVqVWUaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46208126"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="46208126"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:48:22 -0800
X-CSE-ConnectionGUID: CuEhmC5tQfedXFcSOLBxtg==
X-CSE-MsgGUID: k3JJJ6D/SCi+V3YKyNBjoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119908613"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:48:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tqbnl-00000000TZX-33Lr; Fri, 07 Mar 2025 19:48:01 +0200
Date: Fri, 7 Mar 2025 19:48:01 +0200
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
Subject: Re: [PATCH v6 3/7] bits: introduce fixed-type BIT_U*()
Message-ID: <Z8sxUTR-5j5XmZnO@smile.fi.intel.com>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-3-f59315e73c29@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-fixed-type-genmasks-v6-3-f59315e73c29@wanadoo.fr>
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

On Sat, Mar 08, 2025 at 01:48:50AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Implement fixed-type BIT_U*() to help drivers add stricter checks,
> like it was done for GENMASK_U*().

...

>  /*
>   * Missing asm support
>   *
> - * GENMASK_U*() depends on BITS_PER_TYPE() which relies on sizeof(),
> - * something not available in asm. Nethertheless, fixed width integers
> - * is a C concept. Assembly code can rely on the long and long long
> - * versions instead.
> + * GENMASK_U*() and BIT_U*() depend on BITS_PER_TYPE() which relies on
> + * sizeof(), something not available in asm. Nethertheless, fixed
> + * width integers is a C concept. Assembly code can rely on the long
> + * and long long versions instead.
>   */

I don't like this hunk. You just introduced a message which is rewritten
completely in the immediate followup. Can you come up in a better text
here and/or there so it will give only + LoCs (or minimizes - to 1:ish)?

-- 
With Best Regards,
Andy Shevchenko


