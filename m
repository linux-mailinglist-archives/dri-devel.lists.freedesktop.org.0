Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF81AC99F0
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 09:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0BF10E8B3;
	Sat, 31 May 2025 07:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LaCzPK7E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6C910E8B3
 for <dri-devel@lists.freedesktop.org>; Sat, 31 May 2025 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748677983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ohg5fHfGT0uyzMgKziJAeADzuAKD9RxJfWVtgxptZlg=;
 b=LaCzPK7EXSESs7qF/PxlGwtJ1DP4qZOlbTzKmglU/uZ3jAoUb8zZ36P3u1QAM3xIBgH9qy
 eTqZHYC0EP9+3W8OxtZrDSaOYSQgIV2QfflOV0lsatZpaRJHEDlRpT6VtAuFaFp6CbF5aM
 9QNUcSmlu0eek1DcgPWZzGU1cuKe8dY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-OlW710fnMWyC0q9nttc0Ww-1; Sat, 31 May 2025 03:53:00 -0400
X-MC-Unique: OlW710fnMWyC0q9nttc0Ww-1
X-Mimecast-MFC-AGG-ID: OlW710fnMWyC0q9nttc0Ww_1748677980
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-311b6d25278so2897962a91.3
 for <dri-devel@lists.freedesktop.org>; Sat, 31 May 2025 00:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748677980; x=1749282780;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ohg5fHfGT0uyzMgKziJAeADzuAKD9RxJfWVtgxptZlg=;
 b=cJGvPhad4Q/5mPaGr6mupwY3k72kd8TlZoixUul/yqQs8OKoMrSK6802yZB5kzjYPf
 mWVnpZsNBfzYTESSsWFpxYvHhk5xo6bgib4QYT1BvXoKxMdy8pgExrTP5tv/Wo+1x6TS
 g5s6fdFmGDiLLaoZ5QgoGhTAEigwwmTZdelMgeCmPqyav+qHaIOO21wiGIJfqmCLtW4L
 vNcedxae5z6NfIkkIg5y0evLz0pf6za+dmJ3rx1aDP7RvX3hHhe7x2EXn3yBOg1YWpjc
 JTOuFeCL74nta2pXfLUEKeH4Mq/dSZDAjF0FtUYytnskes7lnpJ5MwkGoUQeMcDrdLZT
 uKqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYpKvQHNnph3kJvVtaY+cesaHrS8asDoKzXl6X7cZn01dOS5jrgtrizKeGp9Zv/aLqMnm6fVHYNos=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2WF/uWw7R1NupK4Xx7W/QO0SoPZ6C1zJzvxWKaYA18LwKNTCN
 Ev4n6oC/WaGUP82JAljrMugvhxJO033eleKCyzWilkgJrE7742X69yDrD6YDJGhS9aFuGZB1oj3
 9VcLKpo0cPKC7Nw94HiU8Sfi9RPQyJZOdqR61JWBhLuaj/+6YkWAXQq6UxJVTdhu8O1DbOpc6CW
 MFglBsjorjwQ9OQJkPFA0OsMLHZqPDITxGxvqnZUZUCpia
X-Gm-Gg: ASbGncsZgI0r8ACobnuJBIGiy3v3no7a14qQofh3hWKlHOPg39iqMGn7FaTRu49zOUt
 ImW4eI5Px4D4BZ5B6rP/bmnc5Cog/ICBjVmDdMHtv5af/Z0BQAfBAHNpTU/eZZJnwXvg=
X-Received: by 2002:a17:90b:1646:b0:312:959:dc49 with SMTP id
 98e67ed59e1d1-3127c6c6ac5mr1874348a91.13.1748677979869; 
 Sat, 31 May 2025 00:52:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwPb15HB+x5LlixDkbF7gwe9jHKDNEMcaqP3sUfYw07TfO/w5/C6AzdnYsr2gdlgDJLMrrXiAq57x6HSqDjjw=
X-Received: by 2002:a17:90b:1646:b0:312:959:dc49 with SMTP id
 98e67ed59e1d1-3127c6c6ac5mr1874323a91.13.1748677979477; Sat, 31 May 2025
 00:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-2-acarmina@redhat.com>
 <20250529090129.GZ24938@noisy.programming.kicks-ass.net>
 <CAGegRW76X8Fk_5qqOBw_aqBwAkQTsc8kXKHEuu9ECeXzdJwMSw@mail.gmail.com>
 <20250530140140.GE21197@noisy.programming.kicks-ass.net>
In-Reply-To: <20250530140140.GE21197@noisy.programming.kicks-ass.net>
From: Alessandro Carminati <acarmina@redhat.com>
Date: Sat, 31 May 2025 09:52:47 +0200
X-Gm-Features: AX0GCFvDRExJEUZAsyc3Pz18fgK0YsOWafT6qSf9X6kJzNpcf_7G6rLG7qkegQQ
Message-ID: <CAGegRW5phz1L7WF478jssaxhv4XDrH1H6wYer_MhU_h8gWQdfg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] bug/kunit: Core support for suppressing warning
 backtraces
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kselftest@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>, 
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
 Ville Syrjala <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>, 
 Jani Nikula <jani.nikula@intel.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
 Linux Kernel Functional Testing <lkft@linaro.org>,
 dri-devel@lists.freedesktop.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 Mark Rutland <mark.rutland@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0ZcOOVg4_-4nTc9WHkYrkdroiLMvQDyDH_YyEroYyz4_1748677980
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello Peter,
thanks for the clear explanation.
I finally understand what was bothering you, it wasn=E2=80=99t the __bug_ta=
ble
size or the execution time overhead, but the code size itself.

On Fri, May 30, 2025 at 4:02=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
>
> +Mark because he loves a hack :-)
>
> On Thu, May 29, 2025 at 12:36:55PM +0200, Alessandro Carminati wrote:
>
> > > Like I said before; you need to do this on the report_bug() size of
> > > things.
> > >
> > I fully understand your concerns, and I truly appreciate both yours
> > and Josh=E2=80=99s feedback on this matter.
> > Please rest assured that I took your suggestions seriously and
> > carefully evaluated the possibility of consolidating all related logic
> > within the exception handler.
> > After a thorough investigation, however, I encountered several
> > limitations that led me to maintain the check in the macro.
> > I=E2=80=99d like to share the rationale behind this decision:
>
> > * In the case of WARN() messages, part of the output, the
> > user-specified content, is emitted directly by the macro, prior to
> > reaching the exception handler [1].
> >   Moving the check solely to the exception handler would not prevent
> > this early output.
>
> Yeah, this has been really annoying me for a long while. WARN() code gen
> is often horrible crap because of that.
>
> Everything I've tried so far is worse though :/ So in the end I try to
> never use WARN(), its just not worth it.
>
> ... /me goes down the rabbit-hole again, because well, you can't let
> something simple like this defeat you ;-)
>
> Results of today's hackery below. It might actually be worth cleaning
> up.
>
> > * Unless we change the user-facing interface that allows suppression
> > based on function names, we still need to work with those names at
> > runtime.
>
> I'm not sure I understand this. What interface and what names? This is a
> new feature, so how can there be an interface that needs to be
> preserved?
>
> > * This leaves us with two main strategies: converting function names
> > to pointers (e.g., via kallsyms) or continuing to work with names.
> >   The former requires name resolution at suppression time and pointer
> > comparison in the handler, but function names are often altered by the
> > compiler due to inlining or other optimizations[2].
> >   Some WARN() sites are even marked __always_inline[3], making it
> > difficult to prevent inlining altogether.
>
> Arguably __func__ should be the function name of the function you get
> inlined into. C inlining does not preserve the sequence point, so there
> is absolutely no point in trying to preserve the inline name.
>
> I'm again confused though; [2] does not use __func__ at all.
>
> Anyway, when I do something like:
>
> void __attribute__((__always_inline__)) foo(void)
> {
>         puts(__func__);
> }
>
> void bar(void)
> {
>         foo();
> }
>
> it uses a "foo" string, which IMO is just plain wrong. Anyway, do both
> compilers guarantee it will always be foo? I don't think I've seen the
> GCC manual be explicit about this case.
On this point:
even if not explicitly stated, __func__ will always be "foo" in your exampl=
e.
I=E2=80=99m confident in this because, according to the GCC manual[1],
__func__ is inserted into the source as:
static const char __func__[] =3D "function-name";
At that point, the compiler doesn't yet know what the final code will
look like or whether it will be inlined.
I=E2=80=99m not a compiler expert, but this definition doesn=E2=80=99t leav=
e much room
for alternative interpretations.

>
> > * An alternative is to embed function names in the __bug_table.
> >   While potentially workable, this increases the size of the table and
> > requires attention to handle position-independent builds
> > (-fPIC/-fPIE), such as using offsets relative to __start_rodata.
> >
> > However, the central challenge remains: any logic that aims to
> > suppress WARN() output must either move the entire message emission
> > into the exception handler or accept that user-specified parts of the
> > message will still be printed.
>
> Well, we can set suppress_printk and then all is quiet :-) Why isn't
> this good enough?
>
> > As a secondary point, there are also less common architectures where
> > it's unclear whether suppressing these warnings is a priority, which
> > might influence how broadly the effort is applied.
> > I hoped to have addressed the concern of having faster runtime, by
> > exposing a counter that could skip the logic.
> > Kess suggested using static branching that would make things even bette=
r.
> > Could Kess' suggestion mitigate your concern on this strategy?
> > I=E2=80=99m absolutely open to any further thoughts or suggestions you =
may
> > have, and I appreciate your continued guidance.
>
> I'm not really concerned with performance here, but more with the size
> of the code emitted by WARN_ONCE(). There are a *ton* of WARN sites,
> while only one report_bug() and printk().
>
> The really offensive thing is that this is for a feature most nobody
> will ever need :/
>
>
>
> The below results in:
>
> 03dc  7ac:      48 c7 c0 00 00 00 00    mov    $0x0,%rax        7af: R_X8=
6_64_32S       .rodata.str1.1+0x223
> 03e3  7b3:      ba 2a 00 00 00          mov    $0x2a,%edx
> 03e8  7b8:      48 0f b9 d0             ud1    %rax,%rdx
>
> And it even works :-)
>
> Hmm... I should try and stick the format string into the __bug_table,
> its const after all. Then I can get 2 arguments covered.
>
> ---
> diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> index f0e9acf72547..88b305d49f35 100644
> --- a/arch/x86/include/asm/bug.h
> +++ b/arch/x86/include/asm/bug.h
The rework is impressive.
I=E2=80=99m not in a position to judge, but for what it=E2=80=99s worth, yo=
u have my admiration.

That said, I see a problem, the same I faced when embedding __func__
in the bug table.
__func__, and I believe also printk fmt, are constants, but their
pointers might not be, especially in position-independent code.
This causes issues depending on the compiler.
For example, my tests worked fine with recent GCC on x86_64, but
failed with Clang.
Changing architecture complicates things further, GCC added support
for this only in newer versions.
I ran into this in v3 when the s390x build failed[2].

As mentioned in the patchset cover letter, my solution to avoid
copying the strings into the bug table is to store their pointer as an
offset from __start_rodata.
[1]. https://gcc.gnu.org/onlinedocs/gcc/Function-Names.html
[2]. https://lore.kernel.org/all/202503200847.LbkIJIXa-lkp@intel.com/

