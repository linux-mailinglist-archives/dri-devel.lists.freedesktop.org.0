Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E99A56F92
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE0310EC19;
	Fri,  7 Mar 2025 17:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOdv33DB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF5310EC16;
 Fri,  7 Mar 2025 17:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741369785; x=1772905785;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FK2ser2TMVe2rV3WcVJCYDPlQ11z8XXJHiWq+ZNdT0k=;
 b=EOdv33DB25OPtY4qAWR1jzx/O2lZDJ6jHlxE0dtrj3iua8NWLSldvwuR
 e3OXknwDkZ610RRbb4DGlv9qgcppiLU+K7WKGauDoEEGcgdRTMHNfd86r
 LyH6+kGmETlaQPUvc6Yf9e/ZrD1hEh1mk0b37duX9qJDpvkGM9xtk5Wqy
 RDfpZL8TgHVLuATCtXE3oJFXJx4SAbY8p/kd+mhdDwhfzvcP5XpmmBxng
 8wchcvZioeTOMeExqFX700Z9jr+aP7iMlaLhR6xqaouca5XJc0NjbFzNo
 hT/R/tIqET+1U10cYLr37UDa5Jylz0i9uikHRrJMNsoFWEE5lr4tVEUmn g==;
X-CSE-ConnectionGUID: P1EoN1/yRkKNR5u/9SdHxw==
X-CSE-MsgGUID: V0VgEEcfT/K9Jq7uLHQXdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46208243"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="46208243"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:49:45 -0800
X-CSE-ConnectionGUID: g3Xe9/1aQFK/en7h5/j7Vg==
X-CSE-MsgGUID: UWY006kQRB6Fu1TIAja4mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="119134269"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:49:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tqbpI-00000000Tam-3FaG; Fri, 07 Mar 2025 19:49:36 +0200
Date: Fri, 7 Mar 2025 19:49:36 +0200
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
Message-ID: <Z8sxsCR0KxqZWltB@smile.fi.intel.com>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-3-f59315e73c29@wanadoo.fr>
 <Z8sxUTR-5j5XmZnO@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8sxUTR-5j5XmZnO@smile.fi.intel.com>
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

On Fri, Mar 07, 2025 at 07:48:01PM +0200, Andy Shevchenko wrote:
> On Sat, Mar 08, 2025 at 01:48:50AM +0900, Vincent Mailhol via B4 Relay wrote:

...

> >  /*
> >   * Missing asm support
> >   *
> > - * GENMASK_U*() depends on BITS_PER_TYPE() which relies on sizeof(),
> > - * something not available in asm. Nethertheless, fixed width integers
> > - * is a C concept. Assembly code can rely on the long and long long
> > - * versions instead.
> > + * GENMASK_U*() and BIT_U*() depend on BITS_PER_TYPE() which relies on
> > + * sizeof(), something not available in asm. Nethertheless, fixed
> > + * width integers is a C concept. Assembly code can rely on the long
> > + * and long long versions instead.
> >   */
> 
> I don't like this hunk. You just introduced a message which is rewritten
> completely in the immediate followup. Can you come up in a better text
> here and/or there so it will give only + LoCs (or minimizes - to 1:ish)?

And also note, that using up to 90 characters in the comments most likely fine
here. At least I don't see a problem with that.

-- 
With Best Regards,
Andy Shevchenko


