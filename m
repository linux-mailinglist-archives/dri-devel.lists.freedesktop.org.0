Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A36FCCF4BEF
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D1B10E3E4;
	Mon,  5 Jan 2026 16:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com
 [216.40.44.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26F310E184;
 Mon,  5 Jan 2026 16:38:49 +0000 (UTC)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay08.hostedemail.com (Postfix) with ESMTP id 3DBD91401F4;
 Mon,  5 Jan 2026 16:38:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf01.hostedemail.com (Postfix) with ESMTPA id 332146000F; 
 Mon,  5 Jan 2026 16:38:40 +0000 (UTC)
Date: Mon, 5 Jan 2026 11:39:02 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Yury Norov <yury.norov@gmail.com>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, David Laight <david.laight@runbox.com>,
 Petr Pavlu <petr.pavlu@suse.com>, Andi Shyti <andi.shyti@kernel.org>, Vivi
 Rodrigo <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Daniel Gomez <da.gomez@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-modules@vger.kernel.org"
 <linux-modules@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <20260105113902.6bdfcfa8@gandalf.local.home>
In-Reply-To: <aVmyZ0iXzTkNU86y@smile.fi.intel.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <20260103005059.GA11015@joelbox2>
 <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
 <937926D0-00DC-499B-9FD8-D921C903882D@nvidia.com>
 <aVmyZ0iXzTkNU86y@smile.fi.intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 332146000F
X-Stat-Signature: hxafjg4ncmsykt4dmwkuqhja4ftxwj3q
X-Spam-Status: No, score=1.40
X-Rspamd-Server: rspamout05
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX199ZWLWJbelqoMLbQ2B2b7gz7EOu9A69rc=
X-HE-Tag: 1767631120-776187
X-HE-Meta: U2FsdGVkX18TUKraAk9eDUTCBhjaAdWPFKNooHz+bfcqdqTcVxbKlaESTN1xHRIB6bXyrScasXjrWy/3tM0ZrDxQAGqCLVLwVKm57gBsEwoFaSvbPuFa6ZF8p7ypWmVVtEWieJ8iVXsWD8ppbKOLCHHgXRfQ9b66RDkuS+8eywo/mwhrWIWOkEjGSMxpYfhS2nRw+EBRkEfuP7BPrD741gQX5GUPCRv7D+Pp6rItqZxb74QWi4UN23XLFzBZIQRSFV7Pg0YPuoCqqJaJ+BLy9AgN/m9GtU1Y9fq/d0BeFZJIPKrjt5fce/GLegTG7kC3mQkO8pLLW+MOKZ/tPWybZKagezHVMnXP
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

On Sun, 4 Jan 2026 02:20:55 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> > 
> > I do not think it is necessary to move it.  
> 
> I'm not talking about move, I'm talking about the C 101 thingy. Any custom API
> should be included before use, otherwise compiler won't see it. Which header do
> you want to include to have this API being provided? Note, it's really bad
> situation right now with the header to be included implicitly via non-obvious
> or obscure path. The discussion moved as far as I see it towards the finding a
> good place for the trace_printk.h.

It's not a normal API. It's for debugging the kernel. Thus it should be
available everywhere without having to add a header. Hence, the best place
to include trace_printk.h, is in kernel.h.

I'm thinking that my proposed config option is the best solution now. For
those that do not care about debugging the kernel, you enable the
"HIDE_TRACE_PRINTK" config so that your builds will be "quicker". But for
everyone else, it will not slow down their workflow when they need to debug
code.

-- Steve
