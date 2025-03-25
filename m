Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5463A706C0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 17:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48EC10E5B2;
	Tue, 25 Mar 2025 16:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jvE0+jh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1437F10E5AF;
 Tue, 25 Mar 2025 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742919975; x=1774455975;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zLF1T+Svm2nyklPUfhrXKb/s3OtiLT/we109JVFOEz8=;
 b=jvE0+jh6jTjCVnLdo/kfSh//LDHjeh1XcHK/P0ptWbz/EcIuVauTrN/L
 mrUUNpcOhnmmO4yXYG3o+HEbyvijnz2TtETR/RPT982TZg/CInIE4pDDR
 +S8yj0z15GfwtGsMQgOTKlRVvAh7cSl12boO1UAi3dkCjXle84r0wXQ+j
 hnpt4XdUTmxDtcgIEEIXN+m0Nke8nXqGytkGkZddnMkxay0dyLQ+15w5p
 ZZ338NmD5UugaXP2Y2MfFAoMTQoVUTJSUDsuSkD29PHvI/F7BhqAJ3G28
 IAfrGAbABS70GqJsTzD5vCZFbwyTkFyRXlxC2tjv6ZTX6Fh6RLwY/CUiK g==;
X-CSE-ConnectionGUID: Mtyy2QW7SByyqaIOIdyXgg==
X-CSE-MsgGUID: jzQcS8cbSgSJylhdmjbUvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43332909"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="43332909"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 09:26:13 -0700
X-CSE-ConnectionGUID: 5lFr19JRTeWxFDbZy+SCqA==
X-CSE-MsgGUID: /wrgWLZpSzWFt4lXGFYYkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="125362586"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 09:26:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tx76L-00000005nkX-0spP; Tue, 25 Mar 2025 18:26:05 +0200
Date: Tue, 25 Mar 2025 18:26:04 +0200
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 5/6] test_bits: add tests for GENMASK_U*()
Message-ID: <Z-LZHD7sxiOImzu3@smile.fi.intel.com>
References: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
 <20250326-fixed-type-genmasks-v8-5-24afed16ca00@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fixed-type-genmasks-v8-5-24afed16ca00@wanadoo.fr>
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

On Wed, Mar 26, 2025 at 01:00:00AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Add some additional tests in lib/tests/test_bits.c to cover the
> expected/non-expected values of the fixed-type GENMASK_U*() macros.
> 
> Also check that the result value matches the expected type. Since
> those are known at build time, use static_assert() instead of normal
> kunit tests.

New tests always have a green light to go from my point of view,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


