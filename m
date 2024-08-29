Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720A2964C21
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 18:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4048410E73E;
	Thu, 29 Aug 2024 16:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AyY1mOW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2452A10E73C;
 Thu, 29 Aug 2024 16:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724950422; x=1756486422;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tY/o2qCVFTpCmNogacGCPMgnl7k/juPKBpptAW+kEro=;
 b=AyY1mOW+Ch/TWNeH6pfAhUY1PhBNUqN7sMNUj5hyUBBNXS2oN2yFCrKX
 PsDykLvUHiq2LGVeSaaD/W3JdTk8BnI56wpm28dYBtGQXlapDeLHrQSal
 vyesn/MePBkEYxTYy4kx5ZNUyTTV+8bFwMAqC6hutlXWxwTUbEdoAPiNw
 oTOh68i05Eb6a+jXgrBsTdqSHNXecFOY+0Ewy1dB+CJYOz5ho79AglLeo
 l3w4gw5vQRmdhhpW//qoviwBagq/W/0xxWl+EPyJwkalAFiE6PuSy5mDp
 ZHtaRYFocRNJJR9JjsQGIg9hDUizM1lb9I8an1CEAOiTvcediyEo1/v4n w==;
X-CSE-ConnectionGUID: V7V7PmJ9Sca4jaIYJ1WAzQ==
X-CSE-MsgGUID: NmnjF+0ORcG2Iht8jMsTkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34724802"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="34724802"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 09:53:41 -0700
X-CSE-ConnectionGUID: ZD7ABZXYRYma/n7J+jff7A==
X-CSE-MsgGUID: OzuePKLiTMK+BgiEPTDWTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="68307889"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 09:53:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sjiOj-000000035Jl-2374; Thu, 29 Aug 2024 19:53:25 +0300
Date: Thu, 29 Aug 2024 19:53:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/2] drm/i915/fence: A couple of build fixes
Message-ID: <ZtCnhXwtO-gd1fMf@smile.fi.intel.com>
References: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
 <87cylrwahb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cylrwahb.fsf@intel.com>
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

On Thu, Aug 29, 2024 at 07:38:08PM +0300, Jani Nikula wrote:
> On Thu, 29 Aug 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > With CONFIG_WERROR=y and `make W=1` build fails on my x86_64 machine.
> > This is due to some unused functions. Hence these quick fixes.
> 
> Since when have we been getting the warnings for static inlines?

Do you want to see any additional information of my building environment?

Debian clang version 18.1.8 (9)

-- 
With Best Regards,
Andy Shevchenko


