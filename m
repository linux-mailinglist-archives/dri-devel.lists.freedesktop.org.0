Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F69A3FBF5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F270010EAFE;
	Fri, 21 Feb 2025 16:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhHZawKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657DD10EAFE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740156607; x=1771692607;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1E2TMZF4clchinoXEISFNTFN9Mo1YsiHycNLmSVgkg4=;
 b=jhHZawKg/OXjtqeaJFbd93JGZkpTdk3PAlqZcTKAdd4ZzLjoGUkdP6jD
 bb7EnwDTYvJHmcfLp3A93dzX7P3w4BMm9MbbjKr9DkN/jJOKXTJOXifWj
 I9CfGj+3fQ+unIyvI/Mx9Scvzb+MqVNZk7rpn7aJ/QxPMOtgZF4qq5pV0
 CXrnHKUrmdAF+UIi46eDst6Ni2ucvSnBjRdIse87ZupXNn7S/pCK/ik+d
 qGKqjX9LW3fa5841j3qsdS5rP6d2qZJfNQUs+bR4NySBrUyLGrO4CqZxp
 2YqMtmQxlKDdKP4sUyUB1V2hEQUwPRm8NIwctoXP2yvaCMHkzp64QudMx Q==;
X-CSE-ConnectionGUID: XpYu4R9+TMSdqYvHgRdP3A==
X-CSE-MsgGUID: gW1/dA15T2qgXWyyWo7eRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40172915"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="40172915"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:50:07 -0800
X-CSE-ConnectionGUID: 1+ARLkzjSXqKZa38w8XD1A==
X-CSE-MsgGUID: 3UttHELwTPKLUBw7EDjpZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="115945958"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:50:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tlWDy-0000000DhAd-2N3z; Fri, 21 Feb 2025 18:50:02 +0200
Date: Fri, 21 Feb 2025 18:50:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Raag Jadav <raag.jadav@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Cleanup io.h
Message-ID: <Z7iuulG0Ltoltl8F@smile.fi.intel.com>
References: <20250221050804.2764553-1-raag.jadav@intel.com>
 <2342b516-2c6e-42e5-b4f4-579b280823ba@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2342b516-2c6e-42e5-b4f4-579b280823ba@app.fastmail.com>
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

On Fri, Feb 21, 2025 at 11:15:47AM +0100, Arnd Bergmann wrote:
> On Fri, Feb 21, 2025, at 06:08, Raag Jadav wrote:
> > In a wider effort to improve build speeds, we're attempting to split/cleanup
> > core headers.
> >
> > This series attempts to cleanup io.h with "include what you need" approach.
> >
> > This depends on earlier modifications available in immutable tag[1]. Feel
> > free to carry your subsystem patches with it, or let Andy know if you'd
> > rather let him carry them.
> >
> > [1] https://lore.kernel.org/r/Z7cqCaME4LxTTBn6@black.fi.intel.com/
> >
> > v2: Fix drm_draw.c build errors
> 
> Hi Raag,
> 
> I think your patch is to linux/io.h is correct and we should
> eventually apply it, but I think the header file cleanup needs
> to be done in a little more structured way or it ends up causing
> a lot of extra work for very little gain.
> 
> As you already found, removing an old indirect #include that is
> no longer needed usually leads to some files breaking. The more
> impactful your change is in terms of build speed, the more
> things break! I think in this case, removing linux/err.h and
> linux/bug.h made very little difference because they are very
> small files in terms of what else they include.

While this is all true, removing unneeded inclusions rarely can lead to the
"extra work with a little gain". When there is a replacement to the low
level ones, it's also an improvement in my opinion and won't be harmful in
the future. But I agree, that the stuff is way too tangled already and requires
an enormous work to untangle it, even if doing it structurally.

...

Do you have your scripts for the showed statistics being published somewhere?

-- 
With Best Regards,
Andy Shevchenko


