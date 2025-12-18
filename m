Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0123FCCA643
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 06:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F035410E2F1;
	Thu, 18 Dec 2025 05:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="z2n+SiqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9AD10E2AE;
 Thu, 18 Dec 2025 05:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=1vRsaG/gQ5RPOT/f5ssgtSfUqWkaZ6FLaSXMUWWI0yc=; b=z2n+SiqGLOOn/X7upocovuIIg4
 yg+z1bEd+6QtrZRbmuIYQaQJkkANAyt3+uy8/cWCQWZLuac9l7ih6xHev//uQHOqr1Qi7qL8z0wIg
 gc4X1GFW2A8+UofNCCO5O5k6tKA6xqKI6B8dq7IuTjCYCHHZUDEIw0g0bmFSHna8R6pru0KGe3nPn
 xevdYVL/espVJHz9pEzJKNaVzWcvTCZN88aso9jdUmXRGf0BbLScUqOP390qhPdOSYYMVhUFFHELv
 83U/NCccqm7alixnwGsODuENdl2VbDhkZSipf2aPPO3jfaV0iecAjmqHlfWj2jd4wZJ3NSXcvtkIw
 baFThQPQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vW738-00000007rtE-186b; Thu, 18 Dec 2025 05:59:42 +0000
Message-ID: <40a8e17e-4ec3-4123-8d7d-565afd9701b9@infradead.org>
Date: Wed, 17 Dec 2025 21:59:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
To: Yury Norov <yury.norov@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
References: <20251205175237.242022-1-yury.norov@gmail.com>
 <20251205175237.242022-5-yury.norov@gmail.com>
 <20251216161316.45b3f19ff0ad482018137189@linux-foundation.org>
 <55ceb7bf-0fe9-4edc-81c2-d51366847eec@infradead.org> <aUN8Hm377C5A0ILX@yury>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aUN8Hm377C5A0ILX@yury>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 12/17/25 7:59 PM, Yury Norov wrote:
> On Tue, Dec 16, 2025 at 09:24:55PM -0800, Randy Dunlap wrote:
>> [adding Kees]
>>
>> On 12/16/25 4:13 PM, Andrew Morton wrote:
>>> On Fri,  5 Dec 2025 12:52:35 -0500 "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
>>>
>>>> Tracing is a half of the kernel.h in terms of LOCs, although it's
>>>> a self-consistent part. It is intended for quick debugging purposes
>>>> and isn't used by the normal tracing utilities.
>>>>
>>>> Move it to a separate header. If someone needs to just throw a
>>>> trace_printk() in their driver, they will not have to pull all
>>>> the heavy tracing machinery.
>>>>
>>>> This is a pure move, except for removing a few 'extern's.
>>>>
>>
>> Hm, for a pure move, this shouldn't be necessary. Anyway, not using
>> FORTIFY in purgatory.o fixes this build error.
>> Or maybe there's a better answer.
>>
>> ---
>>  arch/x86/purgatory/Makefile |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> --- a/arch/x86/purgatory/Makefile
>> +++ b/arch/x86/purgatory/Makefile
>> @@ -62,7 +62,7 @@ PURGATORY_CFLAGS_REMOVE		+= $(CC_FLAGS_C
>>  endif
>>  
>>  CFLAGS_REMOVE_purgatory.o	+= $(PURGATORY_CFLAGS_REMOVE)
>> -CFLAGS_purgatory.o		+= $(PURGATORY_CFLAGS)
>> +CFLAGS_purgatory.o		+= $(PURGATORY_CFLAGS) -D__NO_FORTIFY
>>  
>>  CFLAGS_REMOVE_sha256.o		+= $(PURGATORY_CFLAGS_REMOVE)
>>  CFLAGS_sha256.o			+= $(PURGATORY_CFLAGS)
> 
> That happened because the new trace_printk.h includes string.h for
> strlen(), so all kernel.h users now indirectly include it, and it
> causes, seemingly, a circular dependency if FORTIFY is enabled.
> 
> A fix would be dropping trace_printk.h from kernel.h, or switching the
> only user of string.h, trace_puts(), to __builtin_strlen().
> 
> Notice, Andy has concerned about this on the previous round, and also
> suggested __builtin_strlen():
> 
>         https://lkml.org/lkml/2025/12/3/910
> 
> I deem to drop trace_printk.h from kernel.h - it is more aligned with
> the idea of unloading the header. The original motivation to keep
> trace_printk.h in kernel.h was just because a similar printk.h is living
> there. But after all, this is a purely debugging header, so no need for
> almost every C file to bear debugging stuff.
> 
> I can actually do both - switch to an intrinsic and drop the header.
> 
> Guys, please let me know what do you thing.


There are some problems with using __builtin_mem{cpy,set} -- don't
know about __builtin_str{whatever}. See

commit 4ce97317f41d
Author: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Date:   Wed Aug 7 15:15:32 2019 -0700
    x86/purgatory: Do not use __builtin_memcpy and __builtin_memset


We should drop the header from kernel.h soon anyway, whether now or
in a few weeks/months. IMHO.

-- 
~Randy

