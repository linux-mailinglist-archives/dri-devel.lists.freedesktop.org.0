Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A54CDED52
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 17:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A88C10F838;
	Fri, 26 Dec 2025 16:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com
 [216.40.44.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AD110E097;
 Fri, 26 Dec 2025 16:58:56 +0000 (UTC)
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay04.hostedemail.com (Postfix) with ESMTP id 74CAE1A19DA;
 Fri, 26 Dec 2025 16:58:54 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf20.hostedemail.com (Postfix) with ESMTPA id A02F02002E; 
 Fri, 26 Dec 2025 16:58:49 +0000 (UTC)
Date: Fri, 26 Dec 2025 11:58:48 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masami Hiramatsu
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
Message-ID: <20251226115848.298465d4@gandalf.local.home>
In-Reply-To: <20251225170930.1151781-8-yury.norov@gmail.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 1modb5ifbg36aazd9rg3ywmjnp363f5p
X-Spam-Status: No, score=1.36
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: A02F02002E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+HIOJSfUq/gQIek48dCUCnGJxtEBCdWvc=
X-HE-Tag: 1766768329-521154
X-HE-Meta: U2FsdGVkX18Cf37frWp8MFvsF0UI9IwFqnSbl8721qXqPIf4ArnA2YrIfdgmqBx3r7DSA469zIpz357H6hEN3m/TzQ+b1X/DStv9yN6DoRvdMhluN06cr5VuVuFDot2eDmItWnDv+QTzjDzY59V/qBuuG7B55TFrbmUECyS1WNRTCmh0XPj1u98C1ze9hFj4zNAQP1UnxHs9rqb+fAKDVhj85QgS1oyHZoNWgFTDi+mnF8yNyIuTTulIy8dl1ELTK8i4rfznnxcE6dsHhuWDXRXiM9Rbwqy8GFgvqd8AlTVKvSBADSuHLYavtYA0lJk6Qz40gnNT3D5oN70CTRnQqbHZW8uDj0lq3Zu/OJZQtY5iFgKLdkeqZLInK2+/XU1YKYEbyyg8DN1DbXnlnYC7SQ==
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

On Thu, 25 Dec 2025 12:09:29 -0500
"Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:

> The trace_printk.h header is debugging-only by nature, but now it's
> included by almost every compilation unit via kernel.h.
> 
> Removing trace_printk.h saves 1.5-2% of compilation time on my
> Ubuntu-derived x86_64/localyesconfig.
> 
> There's ~30 files in the codebase, requiring trace_printk.h for
> non-debugging reasons: mostly to disable tracing on panic or under
> similar conditions. Include the header for those explicitly.
> 
> This implicitly decouples linux/kernel.h and linux/instruction_pointer.h
> as well, because it has been isolated to trace_printk.h early in the
> series.
> 
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

I'm still against this patch. It means every time someone adds
trace_printk() they need to add the header for it.

trace_printk() should be as available to the kernel as printk() is. If
there's a place that one can add printk() without adding a header, then
they should be able to add trace_printk() to that same location without
adding any header. If that's not the case, then I'm adding an official

 Nacked-by: Steven Rostedt <rostedt@goodmis.org>

I'm fine for trying other ways to speed up the compilation, but removing
full access to trace_printk() isn't one of them.

-- Steve
