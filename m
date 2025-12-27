Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF10ACDFEBA
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 16:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B8F10E2E7;
	Sat, 27 Dec 2025 15:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com
 [216.40.44.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228DC10E2E7;
 Sat, 27 Dec 2025 15:57:19 +0000 (UTC)
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay02.hostedemail.com (Postfix) with ESMTP id 4CE1D13D079;
 Sat, 27 Dec 2025 15:57:16 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf09.hostedemail.com (Postfix) with ESMTPA id 0FD8820028; 
 Sat, 27 Dec 2025 15:57:10 +0000 (UTC)
Date: Sat, 27 Dec 2025 10:57:01 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, Andrew Morton
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
Message-ID: <20251227105701.5cbeb47e@robin>
In-Reply-To: <aU_xG7pK9iauff65@smile.fi.intel.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <aU_xG7pK9iauff65@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 4bi56z6prjoxpu5k77kdk7niwsunwdbw
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 0FD8820028
X-Spam-Status: No, score=1.90
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+BV7GvsBH3P8RqkX5NIpmjPk/ZJZbh6cc=
X-HE-Tag: 1766851030-923509
X-HE-Meta: U2FsdGVkX19nNp9zKnXj3G8Z7Pf9W6fMJYGbsN003UTQvQm4hf6cBcmJNUvxVZ41ch4Z2eLmAMch67kPfmcme6XcLa2Mv8IEzDX5INq30iCx2g1VpdzfxyezF7cNWadHiSrle/Ec2CmZA11MJfXtfW3nDT256CsdmmoEEgzwQQ0DSW9ajErxpqSgSVfdTPJgyS4Y4NFG06SUGRoMvHI4RQFPt449Q79rbxo8tttv+jPMfdETOa4wmCbP+b8RBotJSzZgiZEWmJG9IxLiVIha+0GFi56mvy7D1fFUFx+iEIj6AKI9Ufg7NdgyUG0W0HW/ozB3/cuaj5tG2CZFymW4FwwpPA3qk8lPxsVDHUNSGkeoaK6JomqPPg==
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

On Sat, 27 Dec 2025 16:45:47 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> > I'm fine for trying other ways to speed up the compilation, but removing
> > full access to trace_printk() isn't one of them.  
> 
> I interpreted this as if the header inclusion should be moved from kernel.h
> to printk.h as a compromise that satisfies all (?) stakeholders. Is it possible
> approach?

I'm fine with putting the include of trace_printk.h into printk.h. If
you remove printk.h from kernel.h I would expect a lot more people to
complain about it. Including Linus himself.

-- Steve
