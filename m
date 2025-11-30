Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CD5C953FB
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 20:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DCB10E27D;
	Sun, 30 Nov 2025 19:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJVHXPds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B604E10E0B7;
 Sun, 30 Nov 2025 19:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764531349; x=1796067349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v/MI6kLlmGwE12FmWCb72yhLGZ2pXfiaLSMVHtPu4Qs=;
 b=BJVHXPdslPYIkXz2cGA5I0VU1sNRK/VBJX6us+HDgp27/dR+BkKIh95a
 +Uh8csNut3IzlOm8Dr72Vb6ugr0XdOQomk9tBUYW/Uqsd3/wFXM674xoJ
 MYAieSz4V8tZibrhGbdV9po3wj2CJaxnNC8zOuW9oTklICTkETJVrB0ow
 8HI0k7L+JNamZ1JLxuZWiA7lQVo05frtq0/RRF64IDqY8qb2M0V9TI7n7
 zaRVlqh3sFns+vWYCcG2ULOlzisJn4FtWCLZgGv9sS87ywzcXfY3gj63N
 fP4LhlMisShsVHX+q8EOL4dxYe82sAPnCxGAzJno49UxJ831PpKaLvj5B Q==;
X-CSE-ConnectionGUID: 01DBbPmFS9WUqYtzmpninA==
X-CSE-MsgGUID: WZnsiLR8T8CS+sNKhILm3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66364225"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; d="scan'208";a="66364225"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 11:35:48 -0800
X-CSE-ConnectionGUID: ZbEoJsGDT2KT5QF14rLIGQ==
X-CSE-MsgGUID: NF4JUzJjR/mDO5fMXIcBZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; d="scan'208";a="193778551"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.125])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 11:35:43 -0800
Date: Sun, 30 Nov 2025 21:35:41 +0200
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
Message-ID: <aSycjR2Iq4iCOa7k@smile.fi.intel.com>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-3-yury.norov@gmail.com>
 <aStWkK6exUj9YEC1@smile.fi.intel.com>
 <aStYs-LDKbJe6zvW@smile.fi.intel.com>
 <aStZKktOEWliXWT1@smile.fi.intel.com> <aSyFNSqWv_A7JNpI@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSyFNSqWv_A7JNpI@yury>
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

On Sun, Nov 30, 2025 at 12:56:05PM -0500, Yury Norov wrote:
> On Sat, Nov 29, 2025 at 10:35:54PM +0200, Andy Shevchenko wrote:
> > On Sat, Nov 29, 2025 at 10:34:02PM +0200, Andy Shevchenko wrote:
> > > On Sat, Nov 29, 2025 at 10:24:55PM +0200, Andy Shevchenko wrote:
> > > > On Sat, Nov 29, 2025 at 02:53:01PM -0500, Yury Norov (NVIDIA) wrote:
> > > > > The macro is related to sysfs, but is defined in kernel.h. Move it to
> > > > > the proper header, and unload the generic kernel.h.
> > > > 
> > > > Tough guy :-)
> > > > I hope it builds well in your case.
> > > > 
> > > > FWIW,
> > > > https://lore.kernel.org/lkml/20220603172101.49950-1-andriy.shevchenko@linux.intel.com/
> > > > https://lore.kernel.org/lkml/20240212115500.2078463-1-max.kellermann@ionos.com/
> > > > https://lore.kernel.org/lkml/20240215093646.3265823-1-max.kellermann@ionos.com/
> > > > 
> > > > Assuming it builds in allmodconfig, allyesconfig on x86_32/64 and arm/64
> > > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > Actually, one thing should be fixed, i.e.
> > > Documentation/filesystems/sysfs.rst:123:Note as stated in include/linux/kernel.h "OTHER_WRITABLE? ...
> > 
> > And just in case, look into
> > https://lore.kernel.org/r/20251126214709.2322314-1-andriy.shevchenko@linux.intel.com
> 
> Sure. Please find attached.

Just fold this into your patch.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


