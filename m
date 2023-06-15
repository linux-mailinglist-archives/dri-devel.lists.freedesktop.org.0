Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C98731D2B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 17:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499A110E193;
	Thu, 15 Jun 2023 15:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F9110E085;
 Thu, 15 Jun 2023 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686844527; x=1718380527;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J/UExcCSWcCbBihpF3Gt3tZY015dD69CsvobSQlZbPY=;
 b=R4S4yZQRh5vCp5D4XOuTkREhnH5F5q/2GJJinK4obyVRYz/OB04fcZ8U
 X32qyCBKMfz4ogRiBJT4yjbPSk7eIyBpu7gmUsi1PEj/Od9sR0YnmLvnK
 19BwQ4UbVM40U2opByEfT3zt5Qs1QHCgkbymW6NXyVsFieSscu3DMrqUI
 F2gghuHmI//30VopU5I99SusCuLnYwSQR1tNmHlO2EwyOZXSTy8qhgy+w
 amO5yGpU/+7avB/Uw3GeSD7jObv/hT3l7spaMTa+vpVP8yxiBtFJKtMDE
 95ZIbZEr5FPnncyH1jZH8BPDvVzqri4yoX5ovFBE1hg9ajX4TQYJrk1zG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343683105"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="343683105"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 08:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="712509047"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="712509047"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002.jf.intel.com with ESMTP; 15 Jun 2023 08:53:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1q9pI9-003ygq-0i; Thu, 15 Jun 2023 18:53:45 +0300
Date: Thu, 15 Jun 2023 18:53:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and BIT macros
Message-ID: <ZIs0CC2J7nu0LHEK@smile.fi.intel.com>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZF4fi5B7PPlgZBOI@smile.fi.intel.com> <87pm75kd0h.fsf@intel.com>
 <ZF4j0NPoBGMBT8CO@smile.fi.intel.com> <87mt29kc34.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mt29kc34.fsf@intel.com>
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

On Fri, May 12, 2023 at 02:45:19PM +0300, Jani Nikula wrote:
> On Fri, 12 May 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, May 12, 2023 at 02:25:18PM +0300, Jani Nikula wrote:
> >> On Fri, 12 May 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >> > On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
> >> >> Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
> >> >> masks for fixed-width types and also the corresponding BIT_U32(),
> >> >> BIT_U16() and BIT_U8().
> >> >
> >> > Why?
> >> 
> >> The main reason is that GENMASK() and BIT() size varies for 32/64 bit
> >> builds.
> >
> > When needed GENMASK_ULL() can be used (with respective castings perhaps)
> > and BIT_ULL(), no?
> 
> How does that help with making them the same 32-bit size on both 32 and
> 64 bit builds?

	u32 x = GENMASK();
	u64 y = GENMASK_ULL();

No? Then use in your code either x or y. Note that I assume that the parameters
to GENMASK*() are built-time constants. Is it the case for you?

-- 
With Best Regards,
Andy Shevchenko


