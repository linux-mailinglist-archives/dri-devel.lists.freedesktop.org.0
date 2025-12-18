Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D4ECCCF87
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 18:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FA010E3B3;
	Thu, 18 Dec 2025 17:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com
 [216.40.44.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1971F10E1BC;
 Thu, 18 Dec 2025 17:32:18 +0000 (UTC)
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay05.hostedemail.com (Postfix) with ESMTP id B8DBF57DCF;
 Thu, 18 Dec 2025 17:32:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf05.hostedemail.com (Postfix) with ESMTPA id A5CBC20010; 
 Thu, 18 Dec 2025 17:32:10 +0000 (UTC)
Date: Thu, 18 Dec 2025 12:33:49 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Christophe Leroy <chleroy@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, David Laight
 <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>, Andi Shyti
 <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko
 Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
Message-ID: <20251218123349.35339242@gandalf.local.home>
In-Reply-To: <aUN8Hm377C5A0ILX@yury>
References: <20251205175237.242022-1-yury.norov@gmail.com>
 <20251205175237.242022-5-yury.norov@gmail.com>
 <20251216161316.45b3f19ff0ad482018137189@linux-foundation.org>
 <55ceb7bf-0fe9-4edc-81c2-d51366847eec@infradead.org>
 <aUN8Hm377C5A0ILX@yury>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: hstzp6jteuufahd8q6tbcbnu46w15qog
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: A5CBC20010
X-Spam-Status: No, score=1.43
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX193iJQpA7vys13S/A00XWgKxgoic14KwFA=
X-HE-Tag: 1766079130-761500
X-HE-Meta: U2FsdGVkX1+MDvlruJ4hCiAq6JyjhNVuoOt/+vTnkbslcBiVQppXeci/OrgDqKbYzMF2OqLIRn5OzKrFPJjXdCPPn385+D1s67gmpvpgMoaxesaBMAzxSmVtxhanBJ3Yx5s7XDyGfjDyBTSACg89xFOD+5lI/QFm82ei4hCrgFakIlR8FIUCuzsYjVTZJD/T2716BWYF32eM4b6OQS6B/v1pgsVJFfhZNFkX1PmbrZdi59lkqFxW7KXY2RqvP3PwdgnVokOheLDjJcRcCAh/3zq6Ry16+SXHUCwgtga7pPtvXvAMWgV97192jRHneaB6ZEpWph+zCEajWm+gfc1KRlwp/CG0UD+N
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

On Wed, 17 Dec 2025 22:59:33 -0500
Yury Norov <yury.norov@gmail.com> wrote:

> I deem to drop trace_printk.h from kernel.h - it is more aligned with
> the idea of unloading the header. The original motivation to keep
> trace_printk.h in kernel.h was just because a similar printk.h is living
> there. But after all, this is a purely debugging header, so no need for
> almost every C file to bear debugging stuff.

It is a big deal for debugging stuff. A lot of developers debug their code
with trace_printk(), and do the "shotgun approach", where they cut and
paste trace_printk()s all over their code in several files. Having to now add:

  #include <linux/trace_printk.h>

whenever a trace_printk() is added is going to be a big PITA and slow down
all debugging efforts.

-- Steve
