Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D32736F48
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 16:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B66310E2F6;
	Tue, 20 Jun 2023 14:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE4F10E18A;
 Tue, 20 Jun 2023 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687272925; x=1718808925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XMXMVTVfJHIhMV47ofWnIv/F0uVJolD1m6tGtB1qTuU=;
 b=oDMrTeRIo2xw4K6jhj0WWhPv0hhz9xk4NYvx3yE+IWQ9s4gcspWJk8DH
 UPSGdvSnXuk8IQ+Nr7JBMyCuqRnmVqrPjrJI9mlTYoJMVb72bZxHc7uAG
 SbbLoPVkYlDophHu3swLKtJa7Cwu1cjvJpTbQcWyDHrXEArlEUncrS//R
 sniMBjfdhyT5tiJPqamHLXnBMOLJEFZMwPXnW5Mygt1Gusr7viQErsdz/
 Fs3OCThQuJ1zw5FqQnYYpmg4h/Mqv5t3Y257CTCkovJ2qeUNGuwWTjw/R
 LeKmOu0N/x6JWOMF/w9MxtmcJATeQ9ztViJZubn9Q70jo7EyemggSyj+J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="389150707"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="389150707"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 07:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858613967"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="858613967"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2023 07:55:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qBclM-005HUm-0V; Tue, 20 Jun 2023 17:55:20 +0300
Date: Tue, 20 Jun 2023 17:55:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and BIT macros
Message-ID: <ZJG91zMQW3Rnvdbe@smile.fi.intel.com>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZF4fi5B7PPlgZBOI@smile.fi.intel.com> <87pm75kd0h.fsf@intel.com>
 <ZF4j0NPoBGMBT8CO@smile.fi.intel.com> <87mt29kc34.fsf@intel.com>
 <ZIs0CC2J7nu0LHEK@smile.fi.intel.com> <875y7igph5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875y7igph5.fsf@intel.com>
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
Cc: Andrew Morton <akpm@linux-foundation.org>, intel-gfx@lists.freedesktop.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Masahiro Yamada <masahiroy@kernel.org>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 05:47:34PM +0300, Jani Nikula wrote:
> On Thu, 15 Jun 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, May 12, 2023 at 02:45:19PM +0300, Jani Nikula wrote:
> >> On Fri, 12 May 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >> > On Fri, May 12, 2023 at 02:25:18PM +0300, Jani Nikula wrote:
> >> >> On Fri, 12 May 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >> >> > On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
> >> >> >> Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
> >> >> >> masks for fixed-width types and also the corresponding BIT_U32(),
> >> >> >> BIT_U16() and BIT_U8().
> >> >> >
> >> >> > Why?
> >> >> 
> >> >> The main reason is that GENMASK() and BIT() size varies for 32/64 bit
> >> >> builds.
> >> >
> >> > When needed GENMASK_ULL() can be used (with respective castings perhaps)
> >> > and BIT_ULL(), no?
> >> 
> >> How does that help with making them the same 32-bit size on both 32 and
> >> 64 bit builds?
> >
> > 	u32 x = GENMASK();
> > 	u64 y = GENMASK_ULL();
> >
> > No? Then use in your code either x or y. Note that I assume that the parameters
> > to GENMASK*() are built-time constants. Is it the case for you?
> 
> What's wrong with wanting to define macros with specific size, depending
> on e.g. hardware registers instead of build size?

Nothing, but I think the problem is smaller than it's presented.
And there are already header for bitfields with a lot of helpers
for (similar) cases if not yours.

> What would you use for printk format if you wanted to to print
> GENMASK()?

%lu, no?

-- 
With Best Regards,
Andy Shevchenko


