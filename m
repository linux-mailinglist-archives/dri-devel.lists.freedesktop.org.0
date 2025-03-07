Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A073A56F5F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96ECE10EC0E;
	Fri,  7 Mar 2025 17:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LdQD8+j5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C702310EC0E;
 Fri,  7 Mar 2025 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741369387; x=1772905387;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+kt9trydWppjyLTS1v06E/6kn1cAIhEtv++sHef4MMw=;
 b=LdQD8+j53S1L1nXLQXlexG16kMiEZal59aVyrChq/dNESqH32FlMYRp8
 Y+La2v7tkwkPbWFk7BhzFyCXQeJIsvEATfj2UgO/LtfRVzKqc/E2NnrQ3
 sf0ixeR1VM2CIMm7yRxSYGKe0/8TLbhNUmcKYHzF4QQs0b3QkV2L7fGTy
 vP+MhEX/6mHG6N1POAn9WDDtZtkbMYFYKhtmGSL7ly/RHWDZDFWI3fJAP
 wQMB8eQj0Ua9LP+zueyf/JgppvATJFDI3kVF2ckd87jG62TxXlp9+S9U8
 a6scXE8OVRfADHl8gkbsy+8QlobCNo4WHRKqdY63h0FUhiX/h8thKP4hH g==;
X-CSE-ConnectionGUID: kIW3m7TIQZeQs+EMNRnu2w==
X-CSE-MsgGUID: ywrDGCd1TCC5pSq+AtDsag==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42461689"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42461689"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:43:07 -0800
X-CSE-ConnectionGUID: RlVyw6roQzWlw+azXoMNUg==
X-CSE-MsgGUID: 8HzF3/4YSjGNPswqX4cnMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="120083673"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:43:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tqbis-00000000TVI-4BqQ; Fri, 07 Mar 2025 19:42:59 +0200
Date: Fri, 7 Mar 2025 19:42:58 +0200
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 1/7] bits: split the definition of the asm and non-asm
 GENMASK()
Message-ID: <Z8swIt7fqpVAp2P8@smile.fi.intel.com>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-1-f59315e73c29@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-fixed-type-genmasks-v6-1-f59315e73c29@wanadoo.fr>
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

On Sat, Mar 08, 2025 at 01:48:48AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
> In an upcoming change, GENMASK() and its friends will indirectly
> depend on sizeof() which is not available in asm.
> 
> Instead of adding further complexity to __GENMASK() to make it work
> for both asm and non asm, just split the definition of the two
> variants.

...

> -/*
> - * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
> - * disable the input check if that is the case.
> - */

> +/*
> + * BUILD_BUG_ON_ZERO() is not available in h files included from asm files, so
> + * no input checks in assembly.
> + */

In case of a new version I would reformat this as

/*
 * BUILD_BUG_ON_ZERO() is not available in h files included from asm files,
 * so no input checks in assembly.
 */

It makes easier to review the changes and see that the first line is kept
the same.

-- 
With Best Regards,
Andy Shevchenko


