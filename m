Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3E9E82BB
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE58410E078;
	Sat,  7 Dec 2024 23:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eyQObqwN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B352910E1B0;
 Sat,  7 Dec 2024 07:42:54 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-aa549d9dffdso402334366b.2; 
 Fri, 06 Dec 2024 23:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733557373; x=1734162173; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hd+JXxg1Trx18tJn2WFf9QCw9lSZFwBnHLKDbtoBF3M=;
 b=eyQObqwN4u300eHNtNcJzhMwYmhppIyVV336mi520iCm/Be/XVj50M/ET9HFkCCoti
 fYWWsJXbm1lL2nJsg740eTR8i9UrFXzyHrMIqy0ISdo0nGvcetcvUNdvfBUThJnya0CK
 EodiBZ3JKbm3noq6+Au02Hf/TBz63lpGD91fcK0NlRkopaoPgdDqb8JcsfCrFrOZynkt
 Ozc1FNsw4FZITAfXvRczpCzz2ZF6eUrsAK0jhirKsm1tkP1xG+4kXm17RZ3Q5XYvoRrH
 jYzWCDymhcXG0/rn0/874WvLIOIathefDcFDU4qo4Zng3puyd3hZkD2lzC0zBS1LmmEb
 z55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733557373; x=1734162173;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hd+JXxg1Trx18tJn2WFf9QCw9lSZFwBnHLKDbtoBF3M=;
 b=GtjH8zQ1vpZQIPXqx2aRdhu+MFjivqPq/b8RhPhGhUMKPPXMPnsLMZe+5vL2zKudfi
 IUj0q9MwToAkUaBvOeqGPbOZpBpPftWOSTrtOLMf/sXh8JbeIs7/Jjqu8zQZIgNoUdJF
 flCv7AhoDsg8p3+QwHmI7tTMKRir9JU9Ks5CBy8ULH6rgyMEypb7rpdgic1nWXA9iyvi
 +3WvxYyPxC3QCuiCSdWAVd8xnavfGFqSeI3sMEwVQeLqyAywBZ26cffSlCFdMPLti4Un
 Hh9rQJNs9Yfuqo6vri9Vk2F1pfnXEwGoUJLDTAfT9z77OtBvolWtMYMI0IcS31sVSSOS
 YYuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy45LHJVzDElBy9WlfnoObVvWucq5gjuWZduEMwWzA7U5S59ND4BzIU2YZ+nyQ7krlo9EVPQDKhyY=@lists.freedesktop.org,
 AJvYcCXezKlZC+CK+zwXsZrCNt0YOT/arVxrJHRDztragw9VB8swtcRLqv19y0g94Ki3wzmkRn6USLSKjfn4@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yytopbn2/FJdwS61psaUrpiU4DCYfm0mSa+m5UkJU4aP293IWSO
 m8YiCL78ap7c0nnhUXDPjNLavEAoa+cYyhnlXzJz+J4JKAZIF5TXwKr7nP/Gh4E+TjywahOHm4Z
 PoIpWjkv6DSLr2hLhs/hMKpmOs6c=
X-Gm-Gg: ASbGncuBqHEnnnJkw2rAEvCvAAtcEXuyOkVslLeavnXobyRGuZBr/D/YuNpw2tbf6lO
 WPaGAxjQsBNoopwuS2VvpRWRTLn154+k=
X-Google-Smtp-Source: AGHT+IFtbq3U+qyH15cm3qJcpaS8xIxfktbIH2S26u2IkmcJ4yPTJg9aqWHgPR/Bx1zVWKXpdweVI0tjzLEF2jmrRv0=
X-Received: by 2002:a17:906:31d1:b0:aa6:62d5:653 with SMTP id
 a640c23a62f3a-aa662d50b73mr25238766b.54.1733557372613; Fri, 06 Dec 2024
 23:42:52 -0800 (PST)
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
In-Reply-To: <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sat, 7 Dec 2024 16:42:41 +0900
Message-ID: <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
To: David Laight <David.Laight@aculab.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, w@1wt.eu
Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
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

On Sat. 7 Dec. 2024 at 05:24, David Laight <David.Laight@aculab.com> wrote:
> > > > #define const_NULL(x) _Generic(0 ? (x) : (char *)0, char *: 1, void *: 0)
> > > > #define const_true(x) const_NULL((x) ? NULL : (void *)1L))
> > > > #define const_expr(x) const_NULL((x) ? NULL : NULL))
> > > > I send this morning.
> > > > Needs 's/char/struct kjkjkjkjui/' applied.
> > >
> > > Oh Christ. You really are taking this whole ugly to another level.
> >
> > I sort of liked that version in a perverse sort of way.
> > It does give you a simple test for NULL (unless you've used 'struct kjkjkjkjui').
>
> Except const_NULL() really doesn't work at all - so you are lucky :-)
>
> So maybe the slightly long lines:
> #define const_true(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 1L) : (char *)0, char *: 1, void *: 0)
> #define const_expr(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 0L) : (char *)0, char *: 1, void *: 0)

This still throws a -Wnull-pointer-arithmetic on clang on const_expr(NULL):

  https://godbolt.org/z/vo5W7efdE

I just do not see a method to silence that one. So three options:

  1. is_const() does not accept pointers and throws a constraint
     violation:

       #define is_const(x) __is_const_zero(0 * (x))

     This is my current patch.

  2. is_const() accept pointers but is_const(NULL) returns false:

       #define is_const(x) __is_const_zero((x) != (x))

     This keeps the current __is_constexpr() behaviour.

  3. is_const() accepts pointers and is_const(NULL) return true:

       #define const_expr(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 0L)
: (char *)0, char *: 1, void *: 0)

     David's latest proposal, it requires to remove the
     -Wnull-pointer-arithmetic clang warning.

I vote for 1. or 2. (with a preference for 1.). IMHO, we are just
adding an unreasonable level of complexity for making the macro treat
NULL as an integer. Would someone find a solution for 3. that does not
yield a warning, then why not. But if we have to remove a compiler
check for a theoretical use case that does not even exist in the
kernel, then it is not worth the trade off.

Concerning is_const(var << 2), the patch I submitted works fine as-is
with all scalars including that (var << 2):

  https://godbolt.org/z/xer4aMees

And can we ignore the case (!(var << 2))? This is not a warning
because of the macro, but because of the caller! If I do any of:

          if (!(var << 2)) {}
          (void)__builtin_constant_p(!(var << 2));

I also got the warning. The point is that the macro should not
generate *new* warnings. If the given argument already raises a
warning, it is the caller's responsibility to fix.


Yours sincerely,
Vincent Mailhol
