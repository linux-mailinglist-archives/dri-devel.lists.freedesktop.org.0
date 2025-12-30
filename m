Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B2DCEA366
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 17:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F8910E4C0;
	Tue, 30 Dec 2025 16:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com
 [216.40.44.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E5C10E346;
 Tue, 30 Dec 2025 16:46:07 +0000 (UTC)
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay01.hostedemail.com (Postfix) with ESMTP id 3A4561AC02;
 Tue, 30 Dec 2025 16:46:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf16.hostedemail.com (Postfix) with ESMTPA id 3C3872000E; 
 Tue, 30 Dec 2025 16:46:00 +0000 (UTC)
Date: Tue, 30 Dec 2025 11:46:08 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, David Laight <david.laight@runbox.com>,
 Petr Pavlu <petr.pavlu@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <20251230114608.4d016ad3@gandalf.local.home>
In-Reply-To: <aVP7XVtYwb4YV9gy@yury>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <9833cb61-1ec5-4cc1-ad9d-3e07f3deff80@efficios.com>
 <aVOTbArAxmbT5LY9@smile.fi.intel.com>
 <71767aa7-0247-4bcc-8746-3338905197b3@efficios.com>
 <aVP7XVtYwb4YV9gy@yury>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 4i9hewjpr3gbis1q6d3ttnkhanok4op7
X-Spam-Status: No, score=1.40
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 3C3872000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18O6dPuVd6GpggnxnHsJ7vt65oCGcSBmjI=
X-HE-Tag: 1767113160-914064
X-HE-Meta: U2FsdGVkX18pw+VknCW4DxjOFTSyQBTc345WFVz/6FnLY9YrBVc+F9/yrODI8xntUzXr6QDAUTdwfVKc2ji52wMkx+htI+Dz48K8SQi/wWRO2PFdggctocbIDZ5uEWPoDkRnaAh25vBcp2AJUUygYwNwh/JrMwAbIPXdqK9Tcrzvo7CnkiLt7z4jGH0nkAFlAvkuq4vJv4757f0HurjAvcOTdxeG8PfzZHXSAP7l2112HEI/BbnRhX84nNssrD2zF9mPTP/WWzuKXZzPJFvm6bYURwv1iQUdmJ4Btt6EYP/lD/A5Gh+qz40ZHZK6TEeWi+OOS6gMWcRgJnjXFYTpHVKKNdF2FB0XpS+54YY1zUvhwOh/RzvjoRCBjkhlhsp+
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

On Tue, 30 Dec 2025 11:18:37 -0500
Yury Norov <yury.norov@gmail.com> wrote:

> On Tue, Dec 30, 2025 at 09:21:00AM -0500, Mathieu Desnoyers wrote:
> > On 2025-12-30 03:55, Andy Shevchenko wrote:  
> > > On Mon, Dec 29, 2025 at 05:25:08PM -0500, Mathieu Desnoyers wrote:
> > > 
> > > ...
> > >   
> > > > One possible compromise would be to move it to its own header file,
> > > > and introduce a CONFIG_TRACE_PRINTK Kconfig option (default Y) that
> > > > would surround an include from linux/kernel.h with a preprocessor
> > > > conditional.  
> 
> We already have CONFIG_TRACING, and everything in the new
> trace_printk.h is conditional on it. We can protect the header in
> kernel.h with the same config.

Tracing is used in production all the time. So I think we can have a new
config just for trace_printk(). I was actually thinking of adding a
CONFIG_HIDE_TRACE_PRINTK, with the description of:

  trace_printk() is an extremely powerful utility to debug and develop
  kernel code. It is defined in kernel.h so that it can be easily accessed
  during development or having to debug existing code.

  But trace_printk() is not to be included in the final result, and having
  it in kernel.h during normal builds where the builder has no plans of
  debugging the kernel causes wasted cycles and time in compiling the kernel.

  By saying yes here, the include of trace_printk() macros will be hidden
  from kernel.h and help speed up the compile.

  If you do not plan on debugging this kernel, say Y

And then have in kernel.h:

#ifndef CONFIG_HIDE_TRACE_PRINTK
# include <linux/trace_printk.h>
#endif

This also means it gets set for allyesconfig builds, which I doubt anyone
wants to debug anyway.

> 
> > > > But please make sure the default stays as it is today:
> > > > include the trace printk header by default.  
> > > 
> > > "by default" where exactly?  
> 
> Seemingly nowhere.
> 
> > > The problem is that kernel.h is a total mess and
> > > it's included in a lot of mysterious ways (indirectly),  
> 
> Yes!
> 
> > > and in C you _must_
> > > include a header anyway for a custom API, just define *which* one.  
> >
> > This patch series moves the guts of trace_printk into its own header
> > file, which reduces clutter. So that's already progress. :)
> >   
> > > 
> > > Based on the Steven's first replies I see a compromise in having it inside
> > > printk.h. If you want to debug something with printf() (in general) the same
> > > header should provide all species. Do you agree?  
>  
> It may sound logical, but I don't like this idea. Printk() is used
> for debugging by everyone, but its main goal is to communicate to
> userspace and between different parts of the kernel. Notice how all
> debugging and development API in linux/pritnk.h is protected with the
> corresponding ifdefery. 
> 
> Contrary to that, trace_printk() is a purely debugging feature. There's
> no use for it after the debugging is done. (Or I missed something?)

I actually agree with you here. I don't think adding trace_printk.h into
printk.h is appropriate. I only said that anywhere you can add a printk()
for debugging, you should also be able to add trace_printk(). I believe
kernel.h is the appropriate place for both.

> 
> Everyone admits that kernel.h is a mess. Particularly, it's a mess of
> development and production features. So, moving trace_printk() from an
> already messy kernel.h to a less messy printk.h - to me it looks like
> spreading the mess.
> 
> > I don't have a strong opinion about including trace_printk.h from either
> > kernel.h or printk.h. As long as it's still included by a default kernel
> > config the same way it has been documented/used since 2009.  
> 
> Can you please point to the documentation and quote the exact piece
> stating that? Git history points to the commit 40ada30f9621f from Ingo
> that decouples tracers from DEBUG_KERNEL, and the following 422d3c7a577
> from Kosaki that force-enables the new TRACING_SUPPORT regardless of
> the DEBUG_KERNEL state.
> 
> To me, decoupling tracing from DEBUG_KERNEL looks accidental rather than
> intentional. So maybe simply restore that dependency?

Absolutely not. Tracing is used to debug production kernels, and things
like live kernel patching also depend on it, not to mention BPF.

> 
> Currently, even with tinyconfig, DEBUG_KERNEL is enabled (via EXPERT).
> And even if EXPERT and DEBUG_KERNEL are off, tracers are still enabled.
> This doesn't look right...

Looks fine to me.

-- Steve
