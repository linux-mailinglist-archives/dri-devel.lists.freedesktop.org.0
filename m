Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4474ACC6097
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 06:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0675F10E649;
	Wed, 17 Dec 2025 05:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="QmZ7QfO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4C010E1B1;
 Wed, 17 Dec 2025 05:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=RlN4+pCVkpZicAJ7V2vtxjQ8DDds5Gz5UApihqlRVOo=; b=QmZ7QfO4x1XF3jA0PQ8Kl8aWft
 W55SorcqyLyQP4uUHtX7We3cer1tnrevG5KPY0UWy0+1gwcbL5ufKXuCS2o9rOa1V+dxUN++bLx93
 yCZpAL2DF4ROP9mDvG1ka+sDFNLOzjB73/94ALQ7VUijq0KYpkwbQMfiq63ZxpLjDRuk2GG8Jx80S
 Kx8SdEbHG5z+6HHTlfrXWQQNV/xYBd/zK2QNzq9PVaNHh+S9Mmq7R+9zCKpl5UsqNxH2Da+duD3+a
 SZ/nwSztONvUYI0xo7y7XE/xix/iW1CkzycnuYMH9RccTNkijNwTpap0AawVyVxfk348pHL0vXHPk
 FhBkMk4w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vVk1y-00000006Bnr-1kDA; Wed, 17 Dec 2025 05:24:58 +0000
Message-ID: <55ceb7bf-0fe9-4edc-81c2-d51366847eec@infradead.org>
Date: Tue, 16 Dec 2025 21:24:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
To: Andrew Morton <akpm@linux-foundation.org>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
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
Content-Language: en-US
In-Reply-To: <20251216161316.45b3f19ff0ad482018137189@linux-foundation.org>
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

[adding Kees]

On 12/16/25 4:13 PM, Andrew Morton wrote:
> On Fri,  5 Dec 2025 12:52:35 -0500 "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> 
>> Tracing is a half of the kernel.h in terms of LOCs, although it's
>> a self-consistent part. It is intended for quick debugging purposes
>> and isn't used by the normal tracing utilities.
>>
>> Move it to a separate header. If someone needs to just throw a
>> trace_printk() in their driver, they will not have to pull all
>> the heavy tracing machinery.
>>
>> This is a pure move, except for removing a few 'extern's.
>>

Hm, for a pure move, this shouldn't be necessary. Anyway, not using
FORTIFY in purgatory.o fixes this build error.
Or maybe there's a better answer.

---
 arch/x86/purgatory/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/x86/purgatory/Makefile
+++ b/arch/x86/purgatory/Makefile
@@ -62,7 +62,7 @@ PURGATORY_CFLAGS_REMOVE		+= $(CC_FLAGS_C
 endif
 
 CFLAGS_REMOVE_purgatory.o	+= $(PURGATORY_CFLAGS_REMOVE)
-CFLAGS_purgatory.o		+= $(PURGATORY_CFLAGS)
+CFLAGS_purgatory.o		+= $(PURGATORY_CFLAGS) -D__NO_FORTIFY
 
 CFLAGS_REMOVE_sha256.o		+= $(PURGATORY_CFLAGS_REMOVE)
 CFLAGS_sha256.o			+= $(PURGATORY_CFLAGS)

> 
> This one blows up my x86_64 allmodconfig, gcc-15.2.0:
> 
> In file included from ./include/linux/string.h:386,
>                  from ./include/linux/trace_printk.h:9,
>                  from ./include/linux/kernel.h:34,
>                  from arch/x86/purgatory/purgatory.c:12:
> ./include/linux/fortify-string.h:626:63: error: expected identifier or '(' before '{' token
>   626 |                              p_size_field, q_size_field, op) ({         \
>       |                                                               ^
> ./include/linux/fortify-string.h:694:27: note: in expansion of macro '__fortify_memcpy_chk'
>   694 | #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
>       |                           ^~~~~~~~~~~~~~~~~~~~
> arch/x86/purgatory/../boot/string.h:11:7: note: in expansion of macro 'memmove'
>    11 | void *memmove(void *dst, const void *src, size_t len);
>       |       ^~~~~~~
> ./include/linux/fortify-string.h:258:9: error: expected identifier or '(' before '__builtin_choose_expr'
>   258 |         __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
>       |         ^~~~~~~~~~~~~~~~~~~~~
> arch/x86/purgatory/../boot/string.h:23:15: note: in expansion of macro 'strlen'
>    23 | extern size_t strlen(const char *s);
>       |               ^~~~~~
> make[4]: *** [scripts/Makefile.build:287: arch/x86/purgatory/purgatory.o] Error 1
> make[3]: *** [scripts/Makefile.build:556: arch/x86/purgatory] Error 2
> make[2]: *** [scripts/Makefile.build:556: arch/x86] Error 2
> make[1]: *** [/usr/src/25/Makefile:2054: .] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 

-- 
~Randy

