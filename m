Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3356AC7BD9
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 12:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8E810E027;
	Thu, 29 May 2025 10:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LY1SofqQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8418D10E027
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 10:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748515029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fz8QX1fdjUroMsYLnfzdC7Cz8h3WJ8EnVkCetCUVw1g=;
 b=LY1SofqQ+GK3H7F9NEelJ/AhyuoMe3dpw1ZzTYCnxIXrbTbPdWQ+JDlIHo8Hvf471FzGlq
 VDvTESye1Wxu/zQPMBF526Bh0twLOONTraA9lC7oo8MBofUkcjrBsLcaC7Sf/dFOWGHk4F
 U46gP3rlb/HdHc41GF8B5RDQNoSZs8c=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-WbK8eQgMNRS0cvsqvwgQNg-1; Thu, 29 May 2025 06:37:08 -0400
X-MC-Unique: WbK8eQgMNRS0cvsqvwgQNg-1
X-Mimecast-MFC-AGG-ID: WbK8eQgMNRS0cvsqvwgQNg_1748515027
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b16b35ea570so824389a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 03:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748515027; x=1749119827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fz8QX1fdjUroMsYLnfzdC7Cz8h3WJ8EnVkCetCUVw1g=;
 b=v0a8hy3xTZeyksIpvwRvM8D1JhNeWup4lUcGpC1iGCcwMmZgG1B4lK5bj4wPUum0ai
 sgWsIQWFyrj4cIofNlcWHQMIrEjc+DgyUHLpFvzQf5rofAD4Zqf9/JzWX1pZVEyx8soe
 Wt78yC6Ae3sd5EWm4bmznhlRFxuTzBYown3rClLyWfYj1VKaE5eXAu18FVdp5H+mLwZU
 BL5Q6ewjOesICeuSUK92K3Xd0vTb4bnji8565dyNiUGa0/7FPN4OY1m0/MRF6iK9cw2D
 MUeQCB/usiZO0cYp2aL0qFBTBDOjxziUwdKG6A2BrAiPF9TET+77Y5JCvlA/q5Uue2GN
 Y1RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkIH8IqN5Od8+ZVl3q7AsOVK98CmaqC0fRew5K1SQ6+YrEm5keh2ikrS19cIjojJh3LThdVzl4DxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywke1GmEnlmx94RbA45FCxqfFhoqsOhdzw18+aTF3Cap7U/sqNe
 VXNxxbmyRcY56hjOC076AlN6vEgl5sAZBaaefEazgxmcpHEKbd+KWAiIwgh4yMZoTJIDd6VLLbI
 PPbgFtkfKi/07WZsRtEeFKre7zWqWcEavWUekIYAcS9lZSBu5MEq58i2OwENIy0hPMJVXXy7rDH
 VxjlRD06/Ph10bhfFXiC5IEbO3SriwYn7AS0ypa8u7QI8f
X-Gm-Gg: ASbGncvNBE4sOZO51UWUZ1Mj0sO1FvlThgtmeMwVg4fim1AMZiqEWTXmFSLp8JQdYnE
 1A/aXiFXecpDZPAqd2XGKhBJMxIE3xlYVXOUN7/7NHfhhPLg4rBoM6WgxyTUwfnPqKr0=
X-Received: by 2002:a17:90b:4b51:b0:311:c1ec:7d11 with SMTP id
 98e67ed59e1d1-311c1ec7fc4mr15065770a91.18.1748515027146; 
 Thu, 29 May 2025 03:37:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAox7IsAtssu07irh1QLheVHkNdP7Y9lbZWa2nMvcyl1pY0Ab2r7QPJxl0/LISCRlZ0lWUbDAn2F6LjXBI53k=
X-Received: by 2002:a17:90b:4b51:b0:311:c1ec:7d11 with SMTP id
 98e67ed59e1d1-311c1ec7fc4mr15065721a91.18.1748515026685; Thu, 29 May 2025
 03:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-2-acarmina@redhat.com>
 <20250529090129.GZ24938@noisy.programming.kicks-ass.net>
In-Reply-To: <20250529090129.GZ24938@noisy.programming.kicks-ass.net>
From: Alessandro Carminati <acarmina@redhat.com>
Date: Thu, 29 May 2025 12:36:55 +0200
X-Gm-Features: AX0GCFtpfP4yBdraQIoFZcf2VnrqkTd0yjo326QS2M0ocr49FrM6353kuQ9j38Y
Message-ID: <CAGegRW76X8Fk_5qqOBw_aqBwAkQTsc8kXKHEuu9ECeXzdJwMSw@mail.gmail.com>
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
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S0ob0GkcAbh3qs8Ls21Fa1OFlurM1lgpAEW4bzg3YQI_1748515027
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

Hi Peter,

Thank you for your follow-up and for reiterating your point.

On Thu, May 29, 2025 at 11:01=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Mon, May 26, 2025 at 01:27:51PM +0000, Alessandro Carminati wrote:
>
> >  #define __WARN()             __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
> >  #define __WARN_printf(taint, arg...) do {                            \
> > -             instrumentation_begin();                                \
> > -             __warn_printk(arg);                                     \
> > -             __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));=
\
> > -             instrumentation_end();                                  \
> > +             if (!KUNIT_IS_SUPPRESSED_WARNING(__func__)) {           \
> > +                     instrumentation_begin();                        \
> > +                     __warn_printk(arg);                             \
> > +                     __WARN_FLAGS(BUGFLAG_NO_CUT_HERE |              \
> > +                             BUGFLAG_TAINT(taint));                  \
> > +                     instrumentation_end();                          \
> > +             }                                                       \
> >       } while (0)
> >  #define WARN_ON_ONCE(condition) ({                           \
> >       int __ret_warn_on =3D !!(condition);                      \
> > -     if (unlikely(__ret_warn_on))                            \
> > +     if (unlikely(__ret_warn_on) && !KUNIT_IS_SUPPRESSED_WARNING(__fun=
c__))  \
> >               __WARN_FLAGS(BUGFLAG_ONCE |                     \
> >                            BUGFLAG_TAINT(TAINT_WARN));        \
> >       unlikely(__ret_warn_on);                                \
> > @@ -121,7 +130,7 @@ extern __printf(1, 2) void __warn_printk(const char=
 *fmt, ...);
> >  #ifndef WARN_ON
> >  #define WARN_ON(condition) ({                                         =
       \
> >       int __ret_warn_on =3D !!(condition);                             =
 \
> > -     if (unlikely(__ret_warn_on))                                    \
> > +     if (unlikely(__ret_warn_on) && !KUNIT_IS_SUPPRESSED_WARNING(__fun=
c__))  \
> >               __WARN();                                               \
> >       unlikely(__ret_warn_on);                                        \
> >  })
> > @@ -138,7 +147,7 @@ extern __printf(1, 2) void __warn_printk(const char=
 *fmt, ...);
> >
> >  #define WARN_TAINT(condition, taint, format...) ({                   \
> >       int __ret_warn_on =3D !!(condition);                             =
 \
> > -     if (unlikely(__ret_warn_on))                                    \
> > +     if (unlikely(__ret_warn_on) && !KUNIT_IS_SUPPRESSED_WARNING(__fun=
c__))  \
> >               __WARN_printf(taint, format);                           \
> >       unlikely(__ret_warn_on);                                        \
> >  })
> > @@ -157,8 +166,10 @@ extern __printf(1, 2) void __warn_printk(const cha=
r *fmt, ...);
> >  #else /* !CONFIG_BUG */
> >  #ifndef HAVE_ARCH_BUG
> >  #define BUG() do {           \
> > -     do {} while (1);        \
> > -     unreachable();          \
> > +     if (!KUNIT_IS_SUPPRESSED_WARNING(__func__)) {                   \
> > +             do {} while (1);                                        \
> > +             unreachable();                                          \
> > +     }                                                               \
> >  } while (0)
> >  #endif
>
> NAK
>
> This is again doing it wrong -- this will bloat every frigging bug/warn
> site for no reason.
>
> Like I said before; you need to do this on the report_bug() size of
> things.
>
I fully understand your concerns, and I truly appreciate both yours
and Josh=E2=80=99s feedback on this matter.
Please rest assured that I took your suggestions seriously and
carefully evaluated the possibility of consolidating all related logic
within the exception handler.
After a thorough investigation, however, I encountered several
limitations that led me to maintain the check in the macro.
I=E2=80=99d like to share the rationale behind this decision:
* In the case of WARN() messages, part of the output, the
user-specified content, is emitted directly by the macro, prior to
reaching the exception handler [1].
  Moving the check solely to the exception handler would not prevent
this early output.
* Unless we change the user-facing interface that allows suppression
based on function names, we still need to work with those names at
runtime.
* This leaves us with two main strategies: converting function names
to pointers (e.g., via kallsyms) or continuing to work with names.
  The former requires name resolution at suppression time and pointer
comparison in the handler, but function names are often altered by the
compiler due to inlining or other optimizations[2].
  Some WARN() sites are even marked __always_inline[3], making it
difficult to prevent inlining altogether.
* An alternative is to embed function names in the __bug_table.
  While potentially workable, this increases the size of the table and
requires attention to handle position-independent builds
(-fPIC/-fPIE), such as using offsets relative to __start_rodata.

However, the central challenge remains: any logic that aims to
suppress WARN() output must either move the entire message emission
into the exception handler or accept that user-specified parts of the
message will still be printed.
As a secondary point, there are also less common architectures where
it's unclear whether suppressing these warnings is a priority, which
might influence how broadly the effort is applied.
I hoped to have addressed the concern of having faster runtime, by
exposing a counter that could skip the logic.
Kess suggested using static branching that would make things even better.
Could Kess' suggestion mitigate your concern on this strategy?
I=E2=80=99m absolutely open to any further thoughts or suggestions you may
have, and I appreciate your continued guidance.

[1]. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/include/asm-generic/bug.h#n106
[2]. https://godbolt.org/z/d8aja1Wfz Compiler here emits inlined
function and stand alone function to allow pointer usage.
[3]. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/include/linux/file_ref.h#n118
this is one example, others exist.
--=20
---
Thanks
Alessandro

