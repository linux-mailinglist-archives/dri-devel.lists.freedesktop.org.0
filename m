Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8493C7006DE
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 13:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EDB10E68D;
	Fri, 12 May 2023 11:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD28A10E68A;
 Fri, 12 May 2023 11:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683891157; x=1715427157;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PlHNHEaJon/oJdxYet2+Rcf4b0HwSMJh2UW6z3HY6GY=;
 b=ed7MGzofmHZ0b34bZmOLJTIx4VmJDkHGm6omnzltlyp1LZLf35r2ov5s
 gIsUOTRltYEk37qX/c6SR+RvS+tX0tgU9BmlmtXJ0qUtGvZcf1O3BkV27
 veYqDU+Dl0CqkheSZf//Jzd0545c0qKuDjRTgLZGefjTCCx9lUInKuBAi
 xAhpXOKTTgQnKoRL8xBitkttVwrFF41Uokrahioclo3rMjTV7erjp9mRt
 +xpSMEyYdrYoDSCqeHY8krMxCQsFeCS72fl6THBQxhBMCoQPBV8S5sq44
 zyPsBwAgR0lKTW/G9EebYfCXd002WIEdIt4Sw7wInA7QK55urishStp0Z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="350792980"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="350792980"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 04:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="703156706"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="703156706"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP; 12 May 2023 04:32:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pxR0i-0004cE-1c; Fri, 12 May 2023 14:32:32 +0300
Date: Fri, 12 May 2023 14:32:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and BIT macros
Message-ID: <ZF4j0NPoBGMBT8CO@smile.fi.intel.com>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZF4fi5B7PPlgZBOI@smile.fi.intel.com> <87pm75kd0h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pm75kd0h.fsf@intel.com>
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

On Fri, May 12, 2023 at 02:25:18PM +0300, Jani Nikula wrote:
> On Fri, 12 May 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
> >> Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
> >> masks for fixed-width types and also the corresponding BIT_U32(),
> >> BIT_U16() and BIT_U8().
> >
> > Why?
> 
> The main reason is that GENMASK() and BIT() size varies for 32/64 bit
> builds.

When needed GENMASK_ULL() can be used (with respective castings perhaps)
and BIT_ULL(), no?

-- 
With Best Regards,
Andy Shevchenko


