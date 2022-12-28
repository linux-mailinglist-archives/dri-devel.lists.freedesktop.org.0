Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF60657776
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 15:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB3C10E1A1;
	Wed, 28 Dec 2022 14:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8639410E1A1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 14:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672236247; x=1703772247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Lg126dF0ZRB51ZzT/H9t/6uTcxQgkla19QDrEd0Bge0=;
 b=UweJP5iQmWITiUwvzeW9bFU83np8dG9fIzSHOEIGImKmb+HMKW0Ka0hP
 Mohe69AFKh+g/hwsYD2g2g6IPmx23RVVJJPPCXT/dS2sXlXdTa0Zh7mTF
 SHAT2yQ83gSyFbUBch4MOA2djzG0uzihvjuuzeKPRtoY61/+Ve2qgj9kr
 GoJ3/ToWEYz5yIKcrISlUu02JNlOC9RwP4878R4V5JXDOirPucw5+BHHL
 GIcIK0Ib0MWTEgv7xRGnf5rg0rgcvwX1bJqBYpBifV/qrRCxQDpreyzQH
 js2gUeaHLJZKwSO8nqQotMiCxE8nrsLN7/yCCNoo64TIunyXRlIQxM73H g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="308631756"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; d="scan'208";a="308631756"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2022 06:03:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="655320885"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; d="scan'208";a="655320885"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP; 28 Dec 2022 06:03:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pAX1S-000cPm-1R; Wed, 28 Dec 2022 16:03:10 +0200
Date: Wed, 28 Dec 2022 16:03:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 0/3] Add generic framebuffer support to EFI earlycon
 driver
Message-ID: <Y6xMnuMqpThmFn1q@smile.fi.intel.com>
References: <20221221105402.6598-1-markuss.broks@gmail.com>
 <CAMj1kXGUC7dsSwVEUsAMeAoqDYtbqrM7SDOJTXbPfi-LrcSk9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGUC7dsSwVEUsAMeAoqDYtbqrM7SDOJTXbPfi-LrcSk9g@mail.gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 Markuss Broks <markuss.broks@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kim Phillips <kim.phillips@amd.com>,
 Will Deacon <will@kernel.org>, Jami Kettunen <jami.kettunen@protonmail.com>,
 linux-serial@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Borislav Petkov <bp@suse.de>, Jiri Slaby <jirislaby@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 23, 2022 at 03:42:33PM +0100, Ard Biesheuvel wrote:
> (cc Andy)

I believe there are two reasons I'm Cc'ed now:
- the Cc was forgotten. because I remember reviewing some parts
  of this contribution
- this conflicts (to some extent) with my patch that speeds up
  the scrolling

For the first it's obvious what to do, I think Markuss can include me
in his v4.

For the second I don't see the functional clash. The scrolling in this
series is not anyhow optimized. I think my patch should go first as
- it is less intrusive
- it has been tested, or can be tested easily

Tell me if I'm missing something here.

> On Wed, 21 Dec 2022 at 11:54, Markuss Broks <markuss.broks@gmail.com> wrote:
> >
> > Make the EFI earlycon driver be suitable for any linear framebuffers.
> > This should be helpful for early porting of boards with no other means of
> > output, like smartphones/tablets. There seems to be an issue with early_ioremap
> > function on ARM32, but I am unable to find the exact cause. It appears the mappings
> > returned by it are somehow incorrect, thus the driver is disabled on ARM.
> 
> The reason that this driver is disabled on ARM is because the struct
> screen_info is not populated early enough, as it is retrieved from a
> UEFI configuration table.
> 
> early_ioremap() works fine on ARM as long as they mapping is torn down
> before paging_init()
> 
> > EFI early
> > console was disabled on IA64 previously because of missing early_memremap_prot,
> > and this is inherited to this driver.
> >
> > This patch also changes
> 
> "This patch also changes ..." is usually a strong hint to self that
> the patches need to be split up.
> 
> > behavior on EFI systems, by selecting the mapping type
> > based on if the framebuffer region intersects with system RAM. If it does, it's
> > common sense that it should be in RAM as a whole, and so the system RAM mapping is
> > used. It was tested to be working on my PC (Intel Z490 platform), as well as several
> > ARM64 boards (Samsung Galaxy S9 (Exynos), iPad Air 2, Xiaomi Mi Pad 4, ...).

-- 
With Best Regards,
Andy Shevchenko


