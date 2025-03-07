Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1318BA56F7E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BE110EC10;
	Fri,  7 Mar 2025 17:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OpCguEab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963DB10EC10;
 Fri,  7 Mar 2025 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741369597; x=1772905597;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gz9QobSq1TH6LtLDOr7UA7IpBaLUy1MNXmyFIzdZuog=;
 b=OpCguEabO0B2enrODtLqk/+YKR4WlmhwuyPXURIEHFwkR8YT8TYOHxLT
 5apsCC0WWDyzh3QsXrGeXnE2UQ6nrKrezczGcel5CKbps9rmJR42ySvQB
 rdlkf9D4L4wdOoGWIbsDSlsLOSV28oKPiJryKNSTDUSsF3BvwcMRnYwbz
 AH0EbfUrZtlk8eoh3LWDO1Z39JfLu4c52qiNrMAQg6TxX0QPRl/CywScX
 FF764MIF+jWwcE7CUHsYx3flfyXfc+f4pE6egJE+rtaKNHF0/epJXQb2w
 zok1dmh52wEvqLlDGq+bqWiCe46QIcSxGiqiTrA/2ovGFlamFypq7ZbxR A==;
X-CSE-ConnectionGUID: m0eIEn2gQCCyh9pTf71SJA==
X-CSE-MsgGUID: NOji9PfERbqG5/1ooayYrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42654708"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42654708"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:46:36 -0800
X-CSE-ConnectionGUID: XTD0cHeZTJC+I1xi0s3rKQ==
X-CSE-MsgGUID: 6UglvJRnSIK3DOS2W2uNSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156600797"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:46:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tqbmG-00000000TXX-1xys; Fri, 07 Mar 2025 19:46:28 +0200
Date: Fri, 7 Mar 2025 19:46:28 +0200
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
Subject: Re: [PATCH v6 2/7] bits: introduce fixed-type genmasks
Message-ID: <Z8sw9P5__EAW8RQh@smile.fi.intel.com>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-2-f59315e73c29@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-fixed-type-genmasks-v6-2-f59315e73c29@wanadoo.fr>
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

On Sat, Mar 08, 2025 at 01:48:49AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Yury Norov <yury.norov@gmail.com>
> 
> Add GENMASK_TYPE() which generalizes __GENMASK() to support different
> types, and implement fixed-types versions of GENMASK() based on it.
> The fixed-type version allows more strict checks to the min/max values
> accepted, which is useful for defining registers like implemented by
> i915 and xe drivers with their REG_GENMASK*() macros.
> 
> The strict checks rely on shift-count-overflow compiler check to fail
> the build if a number outside of the range allowed is passed.
> Example:
> 
>   #define FOO_MASK GENMASK_U32(33, 4)
> 
> will generate a warning like:
> 
>   include/linux/bits.h:51:27: error: right shift count >= width of type [-Werror=shift-count-overflow]
>      51 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
>         |                           ^~

...

>  /*
>   * Missing asm support
>   *

> + * GENMASK_U*() depends on BITS_PER_TYPE() which relies on sizeof(),

s/depends/depend/ (we are already referring to a plural)

> + * something not available in asm. Nethertheless, fixed width integers
> + * is a C concept. Assembly code can rely on the long and long long
> + * versions instead.
>   */

-- 
With Best Regards,
Andy Shevchenko


