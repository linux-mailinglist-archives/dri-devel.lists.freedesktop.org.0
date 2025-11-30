Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C248C9541C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 20:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C3F10E281;
	Sun, 30 Nov 2025 19:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccmizBMh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A3910E281;
 Sun, 30 Nov 2025 19:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764531761; x=1796067761;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UsyIcrAN+z+uloCc8uihm40ypzgGuql8alYATQbdSuA=;
 b=ccmizBMhLd+ImrOigbCMSo1IIM1ZlbCAgmArlPTq8Y0m4TOz3/9jo6xB
 42mjq9Qq/z05vEolA2JfqeObxTtKN/vX7brB6W59d3OdbCOrJ/YozkrFz
 GhTohEreNfPx6KwhC24sL5+CGyaGsyqY9g33AcOZq3bMNvLjV3hm37aUs
 ILIgfWCg6Qn/Ab82ClfX2e0f7gTiXjDbshj8EXcmcb6geAWZPJ82Nr2Ng
 dRH/JFN+wul3zRqpc27QksRQwQY00dYNjyNyKUCD9Hv/o67t7O2KG+gSh
 rMIRC+Oegz4CaJr5Y6moNEIgLcv4euzZ8lDYi/aWuox0kXa8/2rCdltLI w==;
X-CSE-ConnectionGUID: trJfruh6QGygBGEtZjhIVg==
X-CSE-MsgGUID: Sy9DGhliRUuJDdRPy7g2Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77157988"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; d="scan'208";a="77157988"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 11:42:41 -0800
X-CSE-ConnectionGUID: fVhBquvTRZKpmJKKTi5zYg==
X-CSE-MsgGUID: zsOrzZCbR22wYU9/90Mwmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; d="scan'208";a="198231469"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.125])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 11:42:36 -0800
Date: Sun, 30 Nov 2025 21:42:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
Message-ID: <aSyeKgVrLktkPo5C@smile.fi.intel.com>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-3-yury.norov@gmail.com>
 <aStWkK6exUj9YEC1@smile.fi.intel.com> <aSyMobJnY4qKmsdk@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSyMobJnY4qKmsdk@yury>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Sun, Nov 30, 2025 at 01:27:45PM -0500, Yury Norov wrote:
> On Sat, Nov 29, 2025 at 10:24:48PM +0200, Andy Shevchenko wrote:
> > On Sat, Nov 29, 2025 at 02:53:01PM -0500, Yury Norov (NVIDIA) wrote:
> > > The macro is related to sysfs, but is defined in kernel.h. Move it to
> > > the proper header, and unload the generic kernel.h.
> > 
> > Tough guy :-)
> > I hope it builds well in your case.
> > 
> > FWIW,
> > https://lore.kernel.org/lkml/20220603172101.49950-1-andriy.shevchenko@linux.intel.com/
> > https://lore.kernel.org/lkml/20240212115500.2078463-1-max.kellermann@ionos.com/
> > https://lore.kernel.org/lkml/20240215093646.3265823-1-max.kellermann@ionos.com/
> 
> Oh, OK. Surely I didn't want to undercut your or Max's work.

It's not about undercutting, I referred just for your information.

> Do you know why it wasn't merged in 2022 and 2024?

I have no idea why his (shorten) version of the series had been ignored.
Perhaps wrong / missing Cc? Also he went too far on splitting things, and IIRC
I mentioned that to him in one of the review rounds (but not sure).

So, I think you can take his work as Originally-by: and modify accordingly.

> > Assuming it builds in allmodconfig, allyesconfig on x86_32/64 and arm/64
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> It seemingly builds well. Thanks for review.

That said, I'm totally fine with your patch as mine at least didn't build
that time.

-- 
With Best Regards,
Andy Shevchenko


