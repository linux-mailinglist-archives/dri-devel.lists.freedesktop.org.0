Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892D69E82C0
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C532210E484;
	Sat,  7 Dec 2024 23:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KtqjFm+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C86E10E031;
 Sat,  7 Dec 2024 12:24:29 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso567437066b.1; 
 Sat, 07 Dec 2024 04:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733574268; x=1734179068; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nQ4RRhd2E6TY+Bu5fIbqEbAQEz1MRYR2VOuTBXdoN1w=;
 b=KtqjFm+oz0tHGpK4lzXiXI8VgQaEUF2lsRao2DU56amCg6BaadELe5yFjb0U7m7c9A
 L7xP86+YXTsn/P83emxKUMeybPntKpzgBQTgM2ESEkeq/F7PVWutQI8J4HzF7ZMbVY0s
 XP1op8/6+tOzNsyoXcdYWyk8ArBVObEskrquJwCxkOOV1BAHt4QMNU043vBIEzoruETC
 QME9RJzx5T2SbPQ1PQWxyV8vycqABl2IRo8ESQ/fdTJlBiuFiXQM746dB5WeQix7i3CC
 AnURqqX/vuabpUK/CRd/UvppWTzRoU8xq4uSlXrD6ne22G2GreFBxFZPTaUld2LgoO+w
 +J4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733574268; x=1734179068;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nQ4RRhd2E6TY+Bu5fIbqEbAQEz1MRYR2VOuTBXdoN1w=;
 b=wcNj5IEr0aD+Ud8yC7peucteBN2jANW0tmEb3vOkYehPB/8WtSUNhTY/+Pga2W11S+
 4IDTi9cYbMy7zFQeGsMM7TYNoPzd7VY+gKFwhTWuJdb/F/v0SJm7i7hSfKpn4RN8uOuP
 ++t7peUUn3kURZXV28lnVUd5oSck5ti6SIf7NNZT9jPoEdGuthJ9bOqninrsaR5qkx1F
 03RrBDxoPns/qXPhDWstTBBRCmcqQbT2Yaal77CaDhe+nnrvxUlEHh0RIsjwfjzdL9ow
 dCCY+TMmkajKeHsCPhFZ6qqEIRber5134m3lsG0Uq7jbp2vTmJLLXvmDfJJob0ufnDqW
 Qoog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVOGoyzxh/PnRLolnz2y3BImvcWukfaYD0tXfDKwCctELYx9pdvZVVAc3p8+7upymvnENMLJ1yS1U=@lists.freedesktop.org,
 AJvYcCXgMzFe8USZdrbl3KrDEcnfl/UPHLxZLYtPS48Wrg2aHSfbJ5htfS2lSrSjB85EuItZxBZWEgXqJki9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSQW62LnvA3oMO9WifYT1MypUzYXprB2n2jAdvll4uCdHTi7ff
 hEagsRMgHLUR1V/MTiKVxLvbAQ8ArxmvMY402Tr4m5G/ZxqeuC4l238ZcqGPrQP4XVNQHUpKn4V
 37NcEj2UKfXhZ1QRE221kF1o6wLs=
X-Gm-Gg: ASbGncvUGnWsndf1L+mSlhVJ82X4ahlJ3oe7oe33AVHYGC6IUKi6p7xm6cDmh2b0awk
 VKFq1qBw27JkjXmSFXYHzfCgqUFQG378=
X-Google-Smtp-Source: AGHT+IGR0yviTsv6EI0Cf6ZzGRuPI9Rqzj5opuPmDdPb/4ZfUr5j5Og+KYs8tNZPu+yItNXL45088jAdwI3x7fjsYQI=
X-Received: by 2002:a17:907:1de6:b0:aa6:59ef:ec with SMTP id
 a640c23a62f3a-aa659ef01a8mr99491466b.1.1733574267541; Sat, 07 Dec 2024
 04:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
 <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
 <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com>
 <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
 <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com>
 <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com>
In-Reply-To: <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sat, 7 Dec 2024 21:24:16 +0900
Message-ID: <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
To: David Laight <David.Laight@aculab.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "w@1wt.eu" <w@1wt.eu>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "uecker@tugraz.at" <uecker@tugraz.at>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 07 Dec 2024 23:46:21 +0000
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

On Sat. 7 Dec. 2024 at 20:19, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 07 December 2024 07:43
> ...
> > > So maybe the slightly long lines:
> > > #define const_true(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 1L) : (char *)0, char *: 1, void *: 0)
> > > #define const_expr(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 0L) : (char *)0, char *: 1, void *: 0)
>
> Clearly they can be implemented in terms of a common define.
> But I don't see a need for a const_zero() and nested expansions make extra
> work for the compiler.
>
> >
> > This still throws a -Wnull-pointer-arithmetic on clang on const_expr(NULL):
> >   https://godbolt.org/z/vo5W7efdE
>
> I was worried about that one.
>
> > I just do not see a method to silence that one. So three options:
> >
> >   1. is_const() does not accept pointers and throws a constraint violation:
> >        #define is_const(x) __is_const_zero(0 * (x))
> >      This is my current patch.
>
> Is that going to affect things like const_true(x << y)?

No warnings for const_true(x << y). See by yourself:

  https://godbolt.org/z/v79x3dnor

> Disallowing that seems counter-productive.
> (Remember it might be passed into a #define that is then
> checking its argument for being constant.)

I understand how a static inline may use __builtin_constant_p() to
check if its argument is NULL. But I am having a hard time
understanding how this would look like with macros and with
is_const().

Do you know one real life example where you have to pass NULL to a
function like macro which can not be written as a static inline
function?

And if that real life use case does not exist, then disallowing it
looks sane: it will push the developper to do the right thing: write a
static inline with __builting_constant_p().

> >   2. is_const() accept pointers but is_const(NULL) returns false:
> >        #define is_const(x) __is_const_zero((x) != (x))
> >      This keeps the current __is_constexpr() behaviour.
>
> No good - expands everything twice.

And? __is_const_zero() does not evaluate its arguments, so no side effect:

  https://godbolt.org/z/W988P4v9e

Or am I missing something else?

> >   3. is_const() accepts pointers and is_const(NULL) return true:
> >
> >        #define const_expr(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 0L)
> > : (char *)0, char *: 1, void *: 0)
> >
> >      David's latest proposal, it requires to remove the
> >      -Wnull-pointer-arithmetic clang warning.
>
> Only for const_expr(NULL) - and since clang gets that wrong
> maybe the warning is a good thing.
>
> You can just add:
> #define const_NULL(ptr) const_true(!(ptr))
> Probably the only place where you actually want to test for zero.

Which goes back to my first point: if we have to declare const_NULL(),
then we probably do not want is_const() to accept NULL so that the
user sees the mismatch (and I am not acknowledging that we need
const_NULL(): as long as no use case arize, no need for it).

> > I vote for 1. or 2. (with a preference for 1.). IMHO, we are just
> > adding an unreasonable level of complexity for making the macro treat
> > NULL as an integer. Would someone find a solution for 3. that does not
> > yield a warning, then why not. But if we have to remove a compiler
> > check for a theoretical use case that does not even exist in the
> > kernel, then it is not worth the trade off.
> >
> > Concerning is_const(var << 2), the patch I submitted works fine as-is
> > with all scalars including that (var << 2):
> >
> >   https://godbolt.org/z/xer4aMees
> >
> > And can we ignore the case (!(var << 2))? This is not a warning
> > because of the macro, but because of the caller! If I do any of:
> >
> >           if (!(var << 2)) {}
> >           (void)__builtin_constant_p(!(var << 2));
> >
> > I also got the warning. The point is that the macro should not
> > generate *new* warnings. If the given argument already raises a
> > warning, it is the caller's responsibility to fix.
>
> Except it could easily happen way inside some other expansion.
> Perhaps someone optimises frobnicate(x) for constant input.
> Suddenly frobnicate(!(var << 2)) generates a compile error.

Then, that person will see that compile error and will modify
frobnicate() to remove the compile error. End of the story.

My point is simple: if the use case you are mentioning is valid, why
did it never collide with __builtin_constant_p() that we have been
using for many years?

And I am sure that there are hundreds of examples of macro that will
either pass their argument as-is to an if() or to the ternary operator
without accounting for if their input is (!(var << 2)). So why did not
these collide?


Yours sincerely,
Vincent Mailhol
