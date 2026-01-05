Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF275CF4CF7
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3CB10E450;
	Mon,  5 Jan 2026 16:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com
 [216.40.44.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31CD10E427;
 Mon,  5 Jan 2026 16:50:13 +0000 (UTC)
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id CC54D1A01B0;
 Mon,  5 Jan 2026 16:50:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf11.hostedemail.com (Postfix) with ESMTPA id C74542002D; 
 Mon,  5 Jan 2026 16:50:05 +0000 (UTC)
Date: Mon, 5 Jan 2026 11:50:27 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, David Laight
 <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>, Andi Shyti
 <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko
 Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <20260105115027.1aea85c1@gandalf.local.home>
In-Reply-To: <aVvoe5fQN3EUtEAJ@yury>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <20260103005059.GA11015@joelbox2>
 <aVkSVk2L6VH9MYGz@smile.fi.intel.com> <aVkmQ4EGIQgAddZQ@yury>
 <254c1096c3b892923dd12b07a8b80291b88c0e9b@intel.com>
 <aVvoe5fQN3EUtEAJ@yury>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C74542002D
X-Stat-Signature: idz13ryxxjr91atgwngrfok7zygtutt3
X-Spam-Status: No, score=1.40
X-Rspamd-Server: rspamout08
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19supINbnwdWCMLx4+n0XP8la5ZW/l1co0=
X-HE-Tag: 1767631805-694570
X-HE-Meta: U2FsdGVkX1+D8ZxAlfx8ZTVUS8+VHfa4a5PuEEthOEndhQMr9j2WAdgNMKfNU0JLX+BZY7qz3ZwBP4OjtLh7tZKe9tsd59Wq9quN9m878arog0rbH0c/PP/WNy/05wieg/ovromGkJWys/94+HqDbQkfNO4m2bQENCWW7M7HN4dZzBlz+MiWzmDhPACeRXOIMG9sqBtd7u43+eRpVfAOllFgDTSccJOm1WVk4ruNei0wABLD0aIjqTqeU434OOWRQYq6RRx8qQI75kGh5P/79Qi+Lofqn39i8/aOeATec6cZFugLPICmiznlhqq9HfxGF97w/bIjotFGopaZ+dbLsxdK6TFPXcDvfIJjK12tRcgjtonU6SeUsROudhlB2cIhhkGqW8Zz5zks4Ki6Y2IbXg==
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

On Mon, 5 Jan 2026 11:36:11 -0500
Yury Norov <yury.norov@gmail.com> wrote:

> > You do realize this means recompiling everything when adding D=1 for
> > debugging?  
> 
> Yes sir I do.
> 
> It would be as simple (or hard) as building another arch:
> 
>         make O=../build/linux-arm64
>         make O=../build/linux-x86_64
>         make D=1 W=1 O=../build/linux-x86_64-dev
> 
> If you're both developer and CI engineer in your company, you're likely
> already doing something like that. If you're CI-only, there're no
> changes for you. If you're a developer - yeah, you'd have to learn a
> new flag.

I'm saying this right now.

Hard-nacked-by: Steven Rostedt <rostedt@goodmis.org>

Why do you want to burden developers?

> 
> The real problem of course is the status inflation. The fact that
> defconfig enables CONFIG_EXPERT and CONFIG_DEBUG_KERNEL implies that
> every random person who is able to do:
> 
>         git clone && make && sudo make install
> 
> now assumed an expert kernel user and active developer. It is not
> correct, and it leads to bloating kernel with dev-only features.
> 
> What we discuss here is a new marker for those real experts and
> developers, I think. (In an hope that it will inflate not very fast.)

This is a generic feature that helps all developers. The ones spending the
most time in maintaining the kernel.

Add the config I mentioned:

config HIDE_TRACE_PRINTK
  depends on TRACING
  help
    trace_printk() is an extremely powerful utility to debug and develop
    kernel code. It is defined in kernel.h so that it can be easily accessed
    during development or having to debug existing code.

    But trace_printk() is not to be included in the final result, and having
    it in kernel.h during normal builds where the builder has no plans of
    debugging the kernel causes wasted cycles and time in compiling the kernel.

    By saying yes here, the include of trace_printk() macros will be hidden
    from kernel.h and help speed up the compile.

    If you do not plan on debugging this kernel, say Y


It is default 'n' as the normal person building their own kernel likely
wants to debug it. Once you set this to 'y' then you get your "fast" builds.

Then in kernel.h have:

#ifndef CONFIG_HIDE_TRACE_PRINTK
# include <linux/trace_printk.h>
#endif

-- Steve
