Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519D7A503CD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4626010E7DC;
	Wed,  5 Mar 2025 15:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdpnrVPm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D59510E7D9;
 Wed,  5 Mar 2025 15:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741189834; x=1772725834;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KbfYNGaAmTO2nVM2SPkbDPg2fWB59a3naALF8YWvxrQ=;
 b=KdpnrVPmIItfA8uJPsdEmg3RgUEJUfnUQVGiQB2C65lJBQgTRWCdFOa+
 3iHiJ5P3ncIIdESqn49laX4LmgPXK5YpLdE9/Y2Xag14yQbg+jPv+9IkG
 qwj8Pwg60tAllE/g9UtWVxi8Po7wqAYg0HXMISyFIK9AYse7vtC686fVR
 EbziiKPvLAmwERe0ugtp99bndciG2Hz94Utx8MvorJcX58JHaUUfhgoVD
 ORcA3cRImuizxexKtWtVfNZfw0SyvoSMxuhCfMmgxMgsm1yS5aYLfxZB3
 Hfr5WNgkiZ1lYcsifl/IFhGR+7IRR91RCfT9kMthcVHr2HkuZRApsrSNB A==;
X-CSE-ConnectionGUID: 6xwNAetTQsma2OaKEUbFKg==
X-CSE-MsgGUID: lG1GM/hGQNO0EPil62PO4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45815545"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="45815545"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 07:50:27 -0800
X-CSE-ConnectionGUID: OiKFD55tSaiH3SnDUhnYgA==
X-CSE-MsgGUID: LJfdD3M5Tt6tJDJH2VcfkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="141967616"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 07:50:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tpr0k-0000000HSHY-3j1k; Wed, 05 Mar 2025 17:50:18 +0200
Date: Wed, 5 Mar 2025 17:50:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: mailhol.vincent@wanadoo.fr, Lucas De Marchi <lucas.demarchi@intel.com>,
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
 Jani Nikula <jani.nikula@intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
Message-ID: <Z8hyui13BaeKrWCs@smile.fi.intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
 <Z8hsRJvpjYoqh9RG@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8hsRJvpjYoqh9RG@thinkpad>
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

On Wed, Mar 05, 2025 at 10:22:44AM -0500, Yury Norov wrote:
> + Anshuman Khandual <anshuman.khandual@arm.com>
> 
> Anshuman,
> 
> I merged your GENMASK_U128() because you said it's important for your
> projects, and that it will get used in the kernel soon.
> 
> Now it's in the kernel for more than 6 month, but no users were added.
> Can you clarify if you still need it, and if so why it's not used?
> 
> As you see, people add another fixed-types GENMASK() macros, and their
> implementation differ from GENMASK_U128().
> 
> My second concern is that __GENMASK_U128() is declared in uapi, while
> the general understanding for other fixed-type genmasks is that they
> are not exported to users. Do you need this macro to be exported to
> userspace? Can you show how and where it is used there?

FWIW, have you browsed via Debian source code browser? If you can't find it
there, you may remove from uAPI with a little chance of the ABI regression.

-- 
With Best Regards,
Andy Shevchenko


