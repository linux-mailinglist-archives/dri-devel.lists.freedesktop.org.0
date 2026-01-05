Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EED8CF5381
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 19:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC85D10E401;
	Mon,  5 Jan 2026 18:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oWD8g/Eu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61FD10E3FF;
 Mon,  5 Jan 2026 18:21:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9A29260010;
 Mon,  5 Jan 2026 18:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2910C116D0;
 Mon,  5 Jan 2026 18:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767637299;
 bh=LzC/4MIXgJ+/fSz8j0wORC98LSPXcdunvtYupg9ResM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oWD8g/EuogOjyE6K9wMAs+2YaZk/nPnAE2no167iPpVDel6JtYbBymaAozb/3WqA7
 NyifLWoHmuGsDo1m2wGDnSQhTUFCaXXyPzL1569ljXqANGUhAXEzY1oF6SoaFPyjG1
 kuvt+IIMdGagh3HPqhnau2MglK/TmYfeH0O9X8xrESGlpsJG24nZ28L8q6Od6jrobB
 mCyrOFphX4TM9rBV6a8MNHcP+V4V8VBeY6cw1Agv44qB+cVMzlEYFmL/1lOeC4GHa6
 4ZqTOprmtXSS+KSQgsxmX3vDf3qs8U4LUI2zoYC395JOxAwruOi+261/rMzZoXGAxu
 lbyrfQW/XulQw==
Message-ID: <63a00906-a5c6-43de-82ce-328c8eaa7d3f@kernel.org>
Date: Mon, 5 Jan 2026 19:21:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Yury Norov <yury.norov@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <20260103005059.GA11015@joelbox2> <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
 <937926D0-00DC-499B-9FD8-D921C903882D@nvidia.com>
 <aVmyZ0iXzTkNU86y@smile.fi.intel.com>
 <20260105113902.6bdfcfa8@gandalf.local.home>
 <d642ef4c-145c-4b16-818d-153c8f2e3485@nvidia.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <d642ef4c-145c-4b16-818d-153c8f2e3485@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 05/01/2026 à 18:11, Joel Fernandes a écrit :
> 
> 
> On 1/5/2026 11:39 AM, Steven Rostedt wrote:
>> On Sun, 4 Jan 2026 02:20:55 +0200
>> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>>
>>>>
>>>> I do not think it is necessary to move it.
>>>
>>> I'm not talking about move, I'm talking about the C 101 thingy. Any custom API
>>> should be included before use, otherwise compiler won't see it. Which header do
>>> you want to include to have this API being provided? Note, it's really bad
>>> situation right now with the header to be included implicitly via non-obvious
>>> or obscure path. The discussion moved as far as I see it towards the finding a
>>> good place for the trace_printk.h.
>>
>> It's not a normal API. It's for debugging the kernel. Thus it should be
>> available everywhere without having to add a header. Hence, the best place
>> to include trace_printk.h, is in kernel.h.
>>
>> I'm thinking that my proposed config option is the best solution now. For
>> those that do not care about debugging the kernel, you enable the
>> "HIDE_TRACE_PRINTK" config so that your builds will be "quicker". But for
>> everyone else, it will not slow down their workflow when they need to debug
>> code.
> 
> 100% agree. We do have people running custom configs for faster builds, so this
> hide thing could be enabled there assuming those don't care about debug.
> 
> In other words, "If it aint broke, don't fix it".

But if I understand correctly, it would save 2% build time. That means 
12 secondes on a 10 minutes build. Is it really worth it ?

Christophe
