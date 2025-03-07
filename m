Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DE0A56F66
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3221510EC11;
	Fri,  7 Mar 2025 17:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKQkSIBF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D82910EC11;
 Fri,  7 Mar 2025 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741369450; x=1772905450;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1srF4LgWxxJj/Y9eDyJgZvB55VhLx8r7xdOwjT1Oc+E=;
 b=UKQkSIBFCQ+lXFv5fpqTUg1RLdUArUv2FDTMyraAN8DCxegZg9ruNkBN
 xcLc84uOn5BromhdeckKQeHut1GcQZL93sINQTb7RmLYaNTw5TezQ5fhh
 TtLZ8oi3T/57RNMM+grfYXdxEwWiGJCPuLBMt8M2sDU/aEbPHrbKr4dUg
 A4ULKIQZO1q94dDWS7MPHy1QvhLGL2xqn/LvQfRpMP4LjRprKN9fff6Fm
 lwN5TsnM9gxwxNpwY4pcpe1/lorNCv+3WXcDdNfKLLEhrsgF/oyMUmKhh
 lTb1wo2GlnUJUsb399/h1WfV5px7u8abv/Y/9vlJ3bjhESELs3nkjXK6c Q==;
X-CSE-ConnectionGUID: i/Mmz7FQRWyvdEZmiA8yHg==
X-CSE-MsgGUID: OJ/uLfTsSKi90uBhSc9JxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42461793"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42461793"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:44:06 -0800
X-CSE-ConnectionGUID: HwCCIbF9QDS6ezXMH8jalw==
X-CSE-MsgGUID: QfApuOshQTisfw2kd/i7wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="124472094"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:44:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tqbjp-00000000TVy-36Lu; Fri, 07 Mar 2025 19:43:57 +0200
Date: Fri, 7 Mar 2025 19:43:57 +0200
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
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v6 0/7] bits: Fixed-type GENMASK_U*() and BIT_U*()
Message-ID: <Z8swXUGf9rtTHw1o@smile.fi.intel.com>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <Z8sqSpKZzfolKm8Q@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8sqSpKZzfolKm8Q@thinkpad>
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

On Fri, Mar 07, 2025 at 12:18:02PM -0500, Yury Norov wrote:
> No rush, please allow your reviewers a week or two before submitting
> a new iteration unless you want to disregard the previous version for
> some reason, of course. This will not get into the upcoming merge
> window, anyways.
> 
> So, what should I do? Go through the v5 and all discussions in there,
> or just jump on this?

There is also question to you. Are we going to leave with U128 variants or is
it subject to remove? If the latter, can you issue a formal patch?

-- 
With Best Regards,
Andy Shevchenko


