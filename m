Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04BFCDFDE5
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 15:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF59010E6A1;
	Sat, 27 Dec 2025 14:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZdouA6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D5C10E6A1;
 Sat, 27 Dec 2025 14:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766846755; x=1798382755;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ozcx0gKLWqYdPO0l3hd3hB0x6/DN+2pZQgLoQ7CvLVY=;
 b=JZdouA6y8DxCv8WAuYgrBYMVcyXx8nA83JODT4FyCP3IZvlNBLekZ+UQ
 iWMrV2DWWtznZEF89yNt3HMfuQCGGCTZ12IYn5rsNJRrzfnwsmXndZOPL
 9g6VVY6TAh4xpR1+/Dpu2jXSbwKMt8E9uiJUsAAjSmRy2l6y5GQXPhuPm
 fjZDpbF7VEjI9+UsfEDPttjhW7Cnb4RFwOfCxJEAA/groM7iswdbY556u
 Wdz6q3tapxxkcSdwwseQIpWemmaLGYzO6tvUKLgSlUAc8G3Hq31QMDoQ3
 FRvaoUvfmCkMaDsaYZMycihtsYaeR1sLtnErJdCp7nvziFLhtKRplcaPB g==;
X-CSE-ConnectionGUID: 1y29sNQoTUWnAmHk9VLYwQ==
X-CSE-MsgGUID: 0rgA6eY8Q0WT9+Xfv165LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="71128654"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; d="scan'208";a="71128654"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2025 06:45:55 -0800
X-CSE-ConnectionGUID: FC2sVHjDQVaxTJuz2GjCZQ==
X-CSE-MsgGUID: Og0tXdcbQZWsd846IPkl+w==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2025 06:45:50 -0800
Date: Sat, 27 Dec 2025 16:45:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <aU_xG7pK9iauff65@smile.fi.intel.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226115848.298465d4@gandalf.local.home>
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

On Fri, Dec 26, 2025 at 11:58:48AM -0500, Steven Rostedt wrote:
> On Thu, 25 Dec 2025 12:09:29 -0500
> "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> 
> > The trace_printk.h header is debugging-only by nature, but now it's
> > included by almost every compilation unit via kernel.h.
> > 
> > Removing trace_printk.h saves 1.5-2% of compilation time on my
> > Ubuntu-derived x86_64/localyesconfig.
> > 
> > There's ~30 files in the codebase, requiring trace_printk.h for
> > non-debugging reasons: mostly to disable tracing on panic or under
> > similar conditions. Include the header for those explicitly.
> > 
> > This implicitly decouples linux/kernel.h and linux/instruction_pointer.h
> > as well, because it has been isolated to trace_printk.h early in the
> > series.
> > 
> > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> 
> I'm still against this patch. It means every time someone adds
> trace_printk() they need to add the header for it.
> 
> trace_printk() should be as available to the kernel as printk() is. If
> there's a place that one can add printk() without adding a header, then
> they should be able to add trace_printk() to that same location without
> adding any header. If that's not the case, then I'm adding an official
> 
>  Nacked-by: Steven Rostedt <rostedt@goodmis.org>
> 
> I'm fine for trying other ways to speed up the compilation, but removing
> full access to trace_printk() isn't one of them.

I interpreted this as if the header inclusion should be moved from kernel.h
to printk.h as a compromise that satisfies all (?) stakeholders. Is it possible
approach?

-- 
With Best Regards,
Andy Shevchenko


