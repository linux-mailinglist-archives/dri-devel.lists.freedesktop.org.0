Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30229CE7590
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 17:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2204710E49F;
	Mon, 29 Dec 2025 16:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com
 [216.40.44.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814DD10E49F;
 Mon, 29 Dec 2025 16:17:51 +0000 (UTC)
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay08.hostedemail.com (Postfix) with ESMTP id 2010C140225;
 Mon, 29 Dec 2025 16:17:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf08.hostedemail.com (Postfix) with ESMTPA id 37D1A20028; 
 Mon, 29 Dec 2025 16:17:43 +0000 (UTC)
Date: Mon, 29 Dec 2025 11:17:48 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Christophe Leroy
 <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar
 <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, David Laight
 <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>, Andi Shyti
 <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko
 Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <20251229111748.3ba66311@gandalf.local.home>
In-Reply-To: <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 37D1A20028
X-Stat-Signature: oxnmnxaxjupkiu3iarufwha35ep93ydr
X-Spam-Status: No, score=1.40
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18UdLvhf5+Gh+C8Yu8piG7TO+TD4jGUDeM=
X-HE-Tag: 1767025063-591563
X-HE-Meta: U2FsdGVkX1/Rcu1THkBVWnM2COrCaOUOPqZLp3WQjzp/z2bw69sAkpB0U1+/iNdY3f8qdUSiefMGe0tQpTZEcMLUsMn1zcewUSfQogHG0OCoODgI9zEd9w/VC5nXvpyQmxrsxtCuvWWbd0QxvqqUnCF5wEOpnDEU7nezgH9GRbj7VE1sz4eGcHkvXMXMNmxVLg3lF53A9Ya7T2B0vA1XXqF9Uz8jhrDEtIEImwrzclDXO8PriLXWgs4sMZ8DfA6L+AjM00SJhu7aLJWKztIeN8S6jLmFzEg87H2QUmkD1boJOK6lDomJYeGYIMjMgGE8SV6yktR6COSWDhUDoM4ATM7lU7FLxleuAE1dNJJE1lu8KDxd3e4KA2BYXhEZz644
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

On Sun, 28 Dec 2025 13:31:50 -0800
Andrew Morton <akpm@linux-foundation.org> wrote:

> > trace_printk() should be as available to the kernel as printk() is.  
> 
> um, why?  trace_printk is used 1% as often as is printk.  Seems
> reasonable to include a header file to access such a rarely-used(!) and
> specialized thing?

It will waste a lot of kernel developers time. Go to conferences and talk
with developers. trace_printk() is now one of the most common ways to debug
your code. Having to add "#include <linux/trace_printk.h>" in every file
that you use trace_printk() (and after your build fails because you forgot
to include that file **WILL** slow down kernel debugging for hundreds of
developers! It *is* used more than printk() for debugging today. Because
it's fast and can be used in any context (NMI, interrupt handlers, etc).

But sure, if you want to save the few minutes that is added to "make
allyesconfig" by sacrificing minutes of kernel developer's time. Go ahead
and make this change.

I don't know how much you debug and develop today, but lots of people I
talk to at conferences thank me for trace_printk() because it makes
debugging their code so much easier.

The "shotgun" approach is very common. That is, you add:

	trace_printk("%s:%d\n", __func__, __LINE__);

all over your code to find out where things are going wrong. With the
persistent ring buffer, you can even extract that information after a
crash and reboot.

There's very few instances of it in the kernel because I made it that way.
If you add a trace_printk() in the kernel, you get the banner:

 **********************************************************
 **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
 **                                                      **
 ** trace_printk() being used. Allocating extra memory.  **
 **                                                      **
 ** This means that this is a DEBUG kernel and it is     **
 ** unsafe for production use.                           **
 **                                                      **
 ** If you see this message and you are not debugging    **
 ** the kernel, report this immediately to your vendor!  **
 **                                                      **
 **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
 **********************************************************

in your dmesg.

I've been recommending people that if you find a "trace_printk()" useful,
you should convert it into a normal TRACE_EVENT() for submission. Which
many developers have done.

Yes, it's not in your kernel, but it is in several other people's kernels
as they develop it. And adding a requirement that they need to include a
header file for every place they add it (and then have to remember to
remove that header file when they are done debugging) is going to waste
more precious time that kernel developers don't have much of.

-- Steve
