Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93434CF5759
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 21:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E4F10E409;
	Mon,  5 Jan 2026 20:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com
 [216.40.44.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0F710E363;
 Mon,  5 Jan 2026 20:04:39 +0000 (UTC)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id 695841A9488;
 Mon,  5 Jan 2026 20:04:36 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf01.hostedemail.com (Postfix) with ESMTPA id 697E260009; 
 Mon,  5 Jan 2026 20:04:31 +0000 (UTC)
Date: Mon, 5 Jan 2026 15:04:53 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Yury Norov <yury.norov@gmail.com>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Randy Dunlap <rdunlap@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, David Laight
 <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>, Andi Shyti
 <andi.shyti@kernel.org>, Vivi Rodrigo <rodrigo.vivi@intel.com>, Tvrtko
 Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <20260105150453.127927c9@gandalf.local.home>
In-Reply-To: <e171f94d-060b-448c-aab5-bafc01fea7fe@nvidia.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <20260103005059.GA11015@joelbox2>
 <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
 <937926D0-00DC-499B-9FD8-D921C903882D@nvidia.com>
 <aVmyZ0iXzTkNU86y@smile.fi.intel.com>
 <20260105113902.6bdfcfa8@gandalf.local.home>
 <d642ef4c-145c-4b16-818d-153c8f2e3485@nvidia.com>
 <63a00906-a5c6-43de-82ce-328c8eaa7d3f@kernel.org>
 <e171f94d-060b-448c-aab5-bafc01fea7fe@nvidia.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 697E260009
X-Stat-Signature: mqe6c1hdp69dzosg5uxafmqe4phk6i8o
X-Spam-Status: No, score=1.39
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX192B6yEerA1ErOTHvQIemRcasxp90OK3v8=
X-HE-Tag: 1767643471-745037
X-HE-Meta: U2FsdGVkX19/j10HauqXmj2qtPoS/VPLmpwH5wGoptlD5qvVpr1f5cJgRml0I9J0bMjB0oZqw2uZ6CQjl8EmYUScq76QFj0/u9UYfAvhZc3TX2eFLdFOAHIqQNUjBMWSAjg+U7HEKrF7okgDNXKbtZn3loWaAFKg11HgeTOXmM5WA0IponuwXBQ/YXJK3ZhYXiAF/UbbN1fAs5aGCh39KQQsWlmRgRZLSyyBYzt+KfZMuXbrnpgVERacOOn2FThBMKimJ1MVn2m6fApOuiUHk+k8gbqqNDl0VeDd9Vedougf6afTFV6G9pPkmpvzT3xMccm2hok2Uk4laE1iWav52XRAgAt8vfcv
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

On Mon, 5 Jan 2026 14:33:35 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> >>> I'm thinking that my proposed config option is the best solution now. For
> >>> those that do not care about debugging the kernel, you enable the
> >>> "HIDE_TRACE_PRINTK" config so that your builds will be "quicker". But for
> >>> everyone else, it will not slow down their workflow when they need to debug
> >>> code.  
> >>
> >> 100% agree. We do have people running custom configs for faster builds, so this
> >> hide thing could be enabled there assuming those don't care about debug.
> >>
> >> In other words, "If it aint broke, don't fix it".  
> > 
> > But if I understand correctly, it would save 2% build time. That means 12
> > secondes on a 10 minutes build. Is it really worth it ?
> >   
> 99% of my kernel builds are usually 90 seconds. I throw a lot of cores at it and
> with ccache. I care more about trace_printk not being available than saving 2%.
> But YMMV. I am sure there are people who care a lot about build time, but for me
> it has not (yet) been a problem.

I can see Linus enabling this. I don't think he uses trace_printk() to
debug the kernel, so improving his build times may be useful.

-- Steve
