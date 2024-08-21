Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F32959A34
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 13:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D17D10E8D7;
	Wed, 21 Aug 2024 11:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCVhYHq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398BC10E5EB;
 Wed, 21 Aug 2024 11:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724240293; x=1755776293;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JpurAUr1LDKDx2rZWfsDPTgLW4zoj1oUuLLEA/+ACuo=;
 b=FCVhYHq136UAyOol8Lyc+3FVflC6rRYpa7t1JHDcbvAtHiOO9f2qXrYQ
 A0a4rLvK/SsTLjnUAaycJ6zQBG2eOYVv9p2ZSHEFPkR7Kuyr/AwULqiWC
 5faRUTBlbjSNyNB0h30pLMXNpu7Sdl31xGa9YnEJRJ10B3plouM4KYNzH
 0XLto37v8xwq4mmy+3u6S840ckWkMj9wrU/mW6QF9Rp61Y9qE1MBXRk5m
 13T1weephY0GkjXVjO+hhKV2biqJF9mgdTK/oYrH+eH08W6Qrw7/SR7qk
 nZYLWrC/mTc/3EDouMP2kdMW6Corl7M8ykB4GYOM9BuUWBJlhuCph3Mt5 w==;
X-CSE-ConnectionGUID: 3+EhZ9iYR7ejmzgt/SHpRA==
X-CSE-MsgGUID: 97QQEAPWR1i7d5YyLjJCUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22400920"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22400920"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:38:12 -0700
X-CSE-ConnectionGUID: GXtSLt26RMuFXeV1MTV5/Q==
X-CSE-MsgGUID: aw9hglVlQfKBbixBDU4Hfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65755584"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:38:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sgjfB-0000000035T-3vo6; Wed, 21 Aug 2024 14:38:05 +0300
Date: Wed, 21 Aug 2024 14:38:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
 linux@roeck-us.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZsXRndpkKKVWPj4B@smile.fi.intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
 <ZrYEQqs0IwDHWkGx@ashyti-mobl2.lan>
 <ZsRbK8TEk5GZDl0C@black.fi.intel.com> <ZsUPY4zJwEGAf_t_@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsUPY4zJwEGAf_t_@intel.com>
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

On Tue, Aug 20, 2024 at 05:49:23PM -0400, Rodrigo Vivi wrote:
> On Tue, Aug 20, 2024 at 12:00:27PM +0300, Raag Jadav wrote:
> > On Fri, Aug 09, 2024 at 12:57:54PM +0100, Andi Shyti wrote:
> > > On Fri, Aug 09, 2024 at 02:48:08PM +0300, Andy Shevchenko wrote:

...

> > > I don't understand what interest might have someone in a couple
> > > of years, reading this commit, knowing an unintellegible list of
> > > differences between v2 and v3.
> > > 
> > > I consider it a random pollution of the commit log.
> 
> I agree it is ugly. But I don't agree it is just a 'random polution'.

Since lore is in place and under the control of LF, this _becomes_
a random pollution. Somebody needs to change some scripts and too
conservative workflows :-)

> I consider a valid and very useful information of the patch history.

So, we have a Link: tag. As long as the changelog was published there it's
being archived.

> Very useful for a later cross check to know what exactly version
> of that patch got merged.
> Useful for distros on backports as well.

-- 
With Best Regards,
Andy Shevchenko


