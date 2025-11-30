Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37400C9542B
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 20:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F7E10E284;
	Sun, 30 Nov 2025 19:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahFTpTz8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D46410E280;
 Sun, 30 Nov 2025 19:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764531893; x=1796067893;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YNqCeQ6lG0WyDX4FDnPCP4qQ9zDHcy4L9w8YAwA2us4=;
 b=ahFTpTz8pIJUEdju6QE+/fyVjMG53T44f/DkqwYaW0fR5II5TFC+lqzt
 o0c6SYuDZ97O6lROtwIeLvEHfXmi7J04bmcV4GrvKcrxN02FathcXo2aI
 r25oe4hKYCLnQxlK9LxP6PFX+BRa5dMxaDwTtLmKI8LeMNYYloYImN0FW
 QrzZzonDhaFu6onDh2RbnXf6itIzxiuhAMpEP1jfucd0MMMBlOnU+ou41
 buVI7vxxqLQfG1Uo8I74xeQblOj4NyQBEFJyukiEeXuug8qakvcOOBzXt
 l1C/39fnZ/Zc+L5K0mS/1w4u4loQWDwIyQhlW0yhGCxH7Ja4krFqvkoVs g==;
X-CSE-ConnectionGUID: zMRoEoTGS2KgdqA/xa20rg==
X-CSE-MsgGUID: Db1z8XKDRZSP0il4nWdbuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70324858"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; d="scan'208";a="70324858"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 11:44:53 -0800
X-CSE-ConnectionGUID: M7QQPtsgQEWqjfkTR2q7ng==
X-CSE-MsgGUID: i/kzFHWaRbKVunckos8Wtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; d="scan'208";a="194684854"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.125])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 11:44:48 -0800
Date: Sun, 30 Nov 2025 21:44:46 +0200
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
Subject: Re: [PATCH 3/3] tracing: move tracing declarations from kernel.h to
 a dedicated header
Message-ID: <aSyertuRRX9Czvyz@smile.fi.intel.com>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-4-yury.norov@gmail.com>
 <aStX3242e3mo5H05@smile.fi.intel.com> <aSyJ83v7EEAPHXeU@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSyJ83v7EEAPHXeU@yury>
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

On Sun, Nov 30, 2025 at 01:16:19PM -0500, Yury Norov wrote:
> On Sat, Nov 29, 2025 at 10:30:23PM +0200, Andy Shevchenko wrote:
> > On Sat, Nov 29, 2025 at 02:53:02PM -0500, Yury Norov (NVIDIA) wrote:
> > > Tracing is a half of the kernel.h in terms of LOCs, although it's a
> > > self-consistent part. Move it to a separate header.
> > > 
> > > This is a pure move, except for removing a few 'extern's.
> > 
> > Yeah, I also have something similar (but half-baked) locally, the Q I wanted to
> > ask is why a separate header? We have already some of tracing headers. Doesn't
> > suit well?
> 
> Just as said in the commit message - this part is more or less
> self-consistent and debugging-oriented. If someone needs to just
> throw trace_printk() in their driver, they will not have to pull
> all the heavy tracing machinery.

Please, add a summary of this to it. It will be much clearer and based on it
I agree with your judgement.

...

> > > --- a/include/linux/kernel.h
> > > +++ b/include/linux/kernel.h
> > > @@ -27,6 +27,7 @@
> > >  #include <linux/math.h>
> > >  #include <linux/minmax.h>
> > >  #include <linux/typecheck.h>
> > 
> > > +#include <linux/tracing.h>
> > 
> > There is better place for t*.h, i.e. after static_call_types.h.
> 
> They are poorly sorted for seemingly no good reason. I found the first
> t*.h and just put this header next to it. Don't think that placing it
> next to static_call_types.h is any better or worse.

It's better, because the (sparsed) chain of the sorted one is longer.

> > Btw, have you tried to sort alphabetically the bulk in the kernel.h after
> > your series. Does it still build? (Just wondering about state of affairs
> > with the possible cyclic dependencies.)
> 
> I didn't try. Sorting #include's is not the purpose of the series.

I know, I'm _just wondering_.

-- 
With Best Regards,
Andy Shevchenko


