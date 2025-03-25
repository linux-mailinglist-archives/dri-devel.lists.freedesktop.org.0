Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F5A706C7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 17:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF0F10E5B7;
	Tue, 25 Mar 2025 16:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nfo+Oq0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E6310E5B6;
 Tue, 25 Mar 2025 16:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742920017; x=1774456017;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aUoNv4oYa8qCJxrDcUluP80WU2qGEeImHsJYH4SlPvY=;
 b=Nfo+Oq0mlPbSqEAkgtnHR9ylypM+l68j9fJOVvl0k7uWr7SwWxv4p234
 OXaLA43bW2e7/8BqJTUuQzsk45+j3prNfC8gy4AFzhwomuIbG9nnaAmOv
 zxHo20PFSixizDD4p9l0C0hzTAwU+t3rNf6FAoO4RnFBaz4eCHMFrrLox
 lRB/W+l3QreYxg6+QtqRGniKA9cUPjmI5ALeuj606IaLK92joVMYaapYM
 Dm9luEbCcd0mPuZLjnSw/sIWyOBT/a9mzpzXDbJ/1yNS3aJi2grYdomDQ
 atxSy0+rTqC2FqdTJHcqZ0xQl7XiTpB4JL7DQBCIT4h9T5Iq/1wCm/KrX w==;
X-CSE-ConnectionGUID: aEJPH5xTQJGvbx//eG5tsw==
X-CSE-MsgGUID: BgO39AbsTMqPBeJs/AnhcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44103820"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="44103820"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 09:26:43 -0700
X-CSE-ConnectionGUID: JlxV2pRcQ2aEbRUQGA2njA==
X-CSE-MsgGUID: t1wgPdBMRwGB6RhGZYQreQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124401977"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 09:26:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tx76o-00000005nl0-3rmp; Tue, 25 Mar 2025 18:26:34 +0200
Date: Tue, 25 Mar 2025 18:26:34 +0200
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
Subject: Re: [PATCH v8 6/6] test_bits: add tests for BIT_U*()
Message-ID: <Z-LZOoE0tYc51Xlx@smile.fi.intel.com>
References: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
 <20250326-fixed-type-genmasks-v8-6-24afed16ca00@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fixed-type-genmasks-v8-6-24afed16ca00@wanadoo.fr>
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

On Wed, Mar 26, 2025 at 01:00:01AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
> Add some additional tests in lib/tests/test_bits.c to cover the
> expected results of the fixed type BIT_U*() macros.
> 
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

New tests always have a green light to go from my point of view,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


