Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EC8A5539B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B6310EA4A;
	Thu,  6 Mar 2025 17:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALAKw58t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE9410EA4A;
 Thu,  6 Mar 2025 17:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741283711; x=1772819711;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6fvdqXm8H7ytxHQlOX9tMlO4epxS5Q2oP7qjq6K+MTY=;
 b=ALAKw58tOT7OamKLn3LZoN8qo2eVbeRo8VoWILK7XnjkAXeAcfe/Tr4j
 ZYZONLXTu9Ncjx4KKeONy0wmMdxqHujzsX/HUvUQBJ3CmZidYWEfRfnER
 Zz/ELvLPDLxiqqKbYzNBdEX0mgdLn77muQdgimG5t83ff2znsthBjMF0E
 03VIdHLfeiD8F9JdZBrpZRSatwva/6Tfli48K+NUp8YKN8KcZ0aqTMYCZ
 BIWdDWIhcHRCgxP7iFguQghQIKjYNf+wDGuIZP08a1+U8R/omXdQiZFSt
 VF8N7x9rOuYvIqFyKEV9MoSEqSCg32lxHrK8mLSzmsd4dc/NdScIw2XXL A==;
X-CSE-ConnectionGUID: XgXYYOVVQHqCe5L0Jxhhxw==
X-CSE-MsgGUID: G9+iXqJVQ7el6ucmesQJOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41563943"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="41563943"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 09:55:10 -0800
X-CSE-ConnectionGUID: waIaI0sJQLW6fwv6tw8xQw==
X-CSE-MsgGUID: aijjEQaOSleAib6+dPsGrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120011491"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 09:55:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tqFR1-00000000B6w-1KUF; Thu, 06 Mar 2025 19:55:03 +0200
Date: Thu, 6 Mar 2025 19:55:03 +0200
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 7/7] test_bits: add tests for BIT_U*()
Message-ID: <Z8nhdz5FZIHYb4Yi@smile.fi.intel.com>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-7-b443e9dcba63@wanadoo.fr>
 <Z8mfAQGUvm3z86kE@smile.fi.intel.com>
 <722e147b-fdd1-4098-8d60-48c83e36a7f7@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <722e147b-fdd1-4098-8d60-48c83e36a7f7@wanadoo.fr>
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

On Fri, Mar 07, 2025 at 01:08:15AM +0900, Vincent Mailhol wrote:
> On 06/03/2025 at 22:11, Andy Shevchenko wrote:
> > On Thu, Mar 06, 2025 at 08:29:58PM +0900, Vincent Mailhol via B4 Relay wrote:
> >> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >>
> >> Add some additional tests in lib/test_bits.c to cover the expected
> >> results of the fixed type BIT_U*() macros.
> > 
> > Still would be good to have a small assembly test case for GENMASK*() as they
> > went split and it will be a good regression test in case somebody decides to
> > unify both without much thinking..
> 
> Let me confirm that I correctly understood your ask. Would something
> like this meet your expectations?

I believe it should be written in asm.

-- 
With Best Regards,
Andy Shevchenko


