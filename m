Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33415C9480C
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 21:36:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816AB10E224;
	Sat, 29 Nov 2025 20:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpJ1yJIb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B96010E223;
 Sat, 29 Nov 2025 20:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764448561; x=1795984561;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GKcls+b2Pk0UQ8XKL9EpO0xpIMNQ/Upx95LLgZbVEg0=;
 b=HpJ1yJIb7vPbl6K0/XPCTZ7L4hh62DKNt+4yPI3m/CwrePMBypUHqacN
 zVv1UuI9/ZwO/j32Ad6cDh50DYTN5vNrfi8bnwAVJ5hPV4Unw0ka6C7Yd
 einQJ12pxJy17l/IqLU52TipsURQIgVeoZfdhjbVsfnGP97B2afXkPZ1X
 jHdRSbFXz5hsv1MvywE5ulcRmzgrlsfRiwJ12grHBdgexwNWmCKplaQDJ
 ZvpQDoHJNBeEhxOVRGxsolEUPxzs30HYyCm0sKixypbYLsAoOwjTKqkcT
 kT43JkY1ITpQnbLSCh5LUPwCtEe7AB7TMorSwBYEpLsBYfsR9eqN6J5Xi Q==;
X-CSE-ConnectionGUID: nGzzrso8RjuiL3QoQnSHRw==
X-CSE-MsgGUID: i7lPVv3lSC2WPeDI/i4DqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="70293437"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="70293437"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:36:01 -0800
X-CSE-ConnectionGUID: HJ0KX4FoRLOWivyefKYF5Q==
X-CSE-MsgGUID: MIDexseXT/29jhP0VccDsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="198043677"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:35:56 -0800
Date: Sat, 29 Nov 2025 22:35:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
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
Message-ID: <aStZKktOEWliXWT1@smile.fi.intel.com>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-3-yury.norov@gmail.com>
 <aStWkK6exUj9YEC1@smile.fi.intel.com>
 <aStYs-LDKbJe6zvW@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aStYs-LDKbJe6zvW@smile.fi.intel.com>
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

On Sat, Nov 29, 2025 at 10:34:02PM +0200, Andy Shevchenko wrote:
> On Sat, Nov 29, 2025 at 10:24:55PM +0200, Andy Shevchenko wrote:
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
> > 
> > Assuming it builds in allmodconfig, allyesconfig on x86_32/64 and arm/64
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Actually, one thing should be fixed, i.e.
> Documentation/filesystems/sysfs.rst:123:Note as stated in include/linux/kernel.h "OTHER_WRITABLE? ...

And just in case, look into
https://lore.kernel.org/r/20251126214709.2322314-1-andriy.shevchenko@linux.intel.com

-- 
With Best Regards,
Andy Shevchenko


