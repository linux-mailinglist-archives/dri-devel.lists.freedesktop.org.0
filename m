Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC7DA706CD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 17:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4EB10E5B4;
	Tue, 25 Mar 2025 16:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBEG6cXX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922C610E5B4;
 Tue, 25 Mar 2025 16:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742920050; x=1774456050;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DXYLHXiwzIcA/Bj/2td4YqOe2oymYE7jS6LyMPCk+S8=;
 b=IBEG6cXXkrIfdq/0LE8HYuOdRKZ/iibsQzRmFa6mSfqr6Fp0XvZBG4xC
 uz28Pv46/83BXDn952k6fZxZBRnpc5wcc1evjs4/BVOu2BADuifsjxAos
 aoxzfaMNtcK4HsvOQ6NZyy5SmwcM5FPq0kOzsSShA0VZdVZ50TXj6dqOY
 hpdAdm2y7fYul58Ru4JJPq8Pun9qVY9L8xtGmslQwbP5nq3WOQRG62ddI
 zxT597p7nF5ZOujcxmO4ye2r3BXqNGX+q3UQmjw3v7x5e9kY7PWbu0REz
 q7HIOKW9uTJ2C7UovFN0Y6DmuL8uXA70El0g7zT5+MBQ6i2RRNsEHbkau w==;
X-CSE-ConnectionGUID: tnw6HDazSuy/d5i8JE+S9Q==
X-CSE-MsgGUID: KfVZle5WQFyF2hWHpw+8iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="61570264"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="61570264"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 09:27:29 -0700
X-CSE-ConnectionGUID: yll9APRVQx63HH74bLC0Wg==
X-CSE-MsgGUID: nY7nGxCqQyGk0UZVVRoCUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="125221710"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 09:27:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tx77Z-00000005nlV-1ZAR; Tue, 25 Mar 2025 18:27:21 +0200
Date: Tue, 25 Mar 2025 18:27:21 +0200
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
 linux-arm-kernel@lists.infradead.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v8 3/6] bits: introduce fixed-type BIT_U*()
Message-ID: <Z-LZaSEO0jGw_Q-y@smile.fi.intel.com>
References: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
 <20250326-fixed-type-genmasks-v8-3-24afed16ca00@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fixed-type-genmasks-v8-3-24afed16ca00@wanadoo.fr>
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

On Wed, Mar 26, 2025 at 12:59:58AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Implement fixed-type BIT_U*() to help drivers add stricter checks,
> like it was done for GENMASK_U*().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


