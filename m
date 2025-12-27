Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C37CE022C
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 22:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B170610E249;
	Sat, 27 Dec 2025 21:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com
 [216.40.44.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9650D10E05C;
 Sat, 27 Dec 2025 21:27:18 +0000 (UTC)
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay07.hostedemail.com (Postfix) with ESMTP id 5E0EE1621DD;
 Sat, 27 Dec 2025 21:27:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf13.hostedemail.com (Postfix) with ESMTPA id B83D520010; 
 Sat, 27 Dec 2025 21:27:10 +0000 (UTC)
Date: Sat, 27 Dec 2025 16:27:11 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Christophe Leroy
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
Message-ID: <20251227162711.742407c4@gandalf.local.home>
In-Reply-To: <aVA1GGfWAHSFdACF@yury>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <aU_xG7pK9iauff65@smile.fi.intel.com>
 <20251227105701.5cbeb47e@robin> <aVA1GGfWAHSFdACF@yury>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: gi8z15ty7ouma9md5dqh6t3sjcp567xe
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: B83D520010
X-Spam-Status: No, score=1.36
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19v9AGAIEf/hdBH6xdcLpEmULqN48hw190=
X-HE-Tag: 1766870830-369753
X-HE-Meta: U2FsdGVkX1/aptVQM0wKzP5JNcSSDPMp2b/O6Nc9sS6AufkZCJuGKZ1brpieMN6WB7jRDkrXhymd/DQNa8I8YT1dqFG6kzrKvuD0YSux6syhCWgP5hQGJgkEyeDb0H1pv5deoTjQIrH6zfObxDDNFpP3aVwqpHlw80RjyXTjo/8hNMvLfw+SoiXLuESBrnqKReFuwZ900KP+EtpvEjZvDAi9z2Z+6b00PUsT9zPMfh9uYKFXR+MI8X2dXWa26HgxFyNVMUPuLBTbXxeDjuD1dIJHgENZOmDFOYOmYVbwPuEH6gB8hlfZy9UU3odK5WRQnJ6Wfgr3usozSqsp5bzVf0MKH6zcgImk
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

On Sat, 27 Dec 2025 14:35:52 -0500
Yury Norov <yury.norov@gmail.com> wrote:

> The difference is that printk() is not a debugging tool.

Several developers will disagree with you. In fact, Linus has said he uses
printk() as his preferred debugging tool!

The only reason to have printk.h in kernel.h is because it *is* used for
debugging! If it wasn't used for debugging, then you could simply add
printk.h for those places that needed to use printk(). But because it is
one of the most common debugging tools, having it in kernel.h is useful, as
you don't want to have to add #include <printk.h> every time you added a
printk() for debugging purposes (same is true for trace_printk()).

Yes, it is also used for information. But if that's all it was used for,
then it wouldn't need to be in kernel.h. It could be a normal header file
that anything that needed to print information would have to include.

-- Steve
