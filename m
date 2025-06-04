Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE2FACD692
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 05:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD9310E6F0;
	Wed,  4 Jun 2025 03:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YK8bCoH0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B331410E6D8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 03:30:53 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-52934f4fb23so4282102e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 20:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749007850; x=1749612650;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fOC+m4zOJ34UxxPz/TiQmD5iaJADylPzttows/BWe1k=;
 b=YK8bCoH0FR2gzwi/aBS8LZfSAOOnQ7l2k7rgKNlwaA96/yQp267DuPTWDT6LFL7I/5
 +ws9/vSNoDiwP6Gn/MZ4M5YLMz/o0WEMnY77+EJI8OVNnAfgVhmalDwZlmV+wJQVmqM5
 GxuHbFmj7aV1a9s01WuWj3GwWMbNTuEeHV2ZqcNpA6f8eE6kk5ruvzQe2lvLCrvOgEyW
 mWvO1nHHI6Xola17p47nvBoapa3QakK2r0+lDUgA3flSfwzOaRamJcL08Py0FFqJV+pg
 suFz19F0su8v2hVMET9cR4IugIQjSF3OW6Nq4e9jlUcquhs2PNTlwxqX0K2SqL37VIAO
 wD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749007850; x=1749612650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fOC+m4zOJ34UxxPz/TiQmD5iaJADylPzttows/BWe1k=;
 b=AaxGClqSr1VrbKZA6uk8Dx71T6xJz86AFI3MKNKv2xE3flC2bSJLnIB1ZaETZe3nwY
 tajxADQb73RcqTpJUNw7OPFKbsCRN7Uykgr4WtKw3jeGZGvH3g2u5RuQ/tQYm0x/twth
 zPy4lmpaItBLe0kxsvVsMhHR/I83/YtfLyTI+r5Iw7rV9tL/0qm49Fnd84SPU8kNFTfM
 L0d7Rur73huPmesxnPmvSmH2k5ruVqd1w5wsAyVrRk5wgV+n79OYqxezEaTiB0uE08Z9
 ethc82SPIUm3uYxJAzTxJxKT3ZFP/tDVg2XytkUmtxYvTT+8L8BlK+fO5Mg0yqHKJqts
 VUYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPHCmxXTfhA2Jb5Lw4ArN00tEWO9OO3NBNe3CLSJXC7kKE6xL881yCtHPz3QbeBWybdJ4kxH+gzXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGOwwSjj6waVQZB2LLaVKc0wkJGqI1+iHgMxqj8byh/FP7pQPl
 JWNjW88+H/nSbWDCFAVM165wlP1zrihN8RDb21OB8rmPEWjR/Yn5tJVMbpBNop4+HJ9Fmebahdw
 yfeROhwUeVSWHf7erx6AyL+Lw/2SMhFiGDT2i2pA/
X-Gm-Gg: ASbGnctqoetnOb9/p5vTbDqMeaQCqPIyx7ZeoOX8v+2t7WkRULLQA8ZF5xnKGBRgBMW
 sj3d5z2A+T/JDUANTMCj8WWrHrv/2hMx+mj8UG+0+NGSkv00tuJekiF6EdYSV5T3sugHKch8clK
 5IO+8Jj2seqCtXJMM+fnMiNcN5VPKLcYgmDMwFMJST6lWdYjoGlKcnlZcZgC50o44NcPhXr/rF3
 w==
X-Google-Smtp-Source: AGHT+IG5bw78Odqgpd3EBpVfqxdEd4THXeUjYORslhfe3Gche7FcK086w9JV/cR2nIVnS6RTWNlPCnRW0vrV7HVy6qs=
X-Received: by 2002:a05:6102:b0b:b0:4e2:82c3:661c with SMTP id
 ada2fe7eead31-4e746d8c858mr770783137.11.1749007850171; Tue, 03 Jun 2025
 20:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-2-acarmina@redhat.com>
 <20250529090129.GZ24938@noisy.programming.kicks-ass.net>
 <CAGegRW76X8Fk_5qqOBw_aqBwAkQTsc8kXKHEuu9ECeXzdJwMSw@mail.gmail.com>
 <20250530140140.GE21197@noisy.programming.kicks-ass.net>
 <202505301037.D816A49@keescook>
 <20250531102304.GF21197@noisy.programming.kicks-ass.net>
 <20250602-phenomenal-turkey-of-hurricane-aadcde@houat>
 <20250603122603.GK21197@noisy.programming.kicks-ass.net>
In-Reply-To: <20250603122603.GK21197@noisy.programming.kicks-ass.net>
From: Daniel Latypov <dlatypov@google.com>
Date: Wed, 4 Jun 2025 12:30:38 +0900
X-Gm-Features: AX0GCFsGfqrM-mb1TX-evfPNlSjXcsDpFP46rFQa5C7LWSuPpBr8suouJ-eIUyU
Message-ID: <CAGS_qxoxkcDyUDKPYWAV2Sk1Df0kMYaDpSwinxUTyhtWpjkr6g@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] bug/kunit: Core support for suppressing warning
 backtraces
To: Peter Zijlstra <peterz@infradead.org>
Cc: Maxime Ripard <mripard@kernel.org>, Kees Cook <kees@kernel.org>, 
 Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org, 
 Dan Carpenter <dan.carpenter@linaro.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>, 
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Linux Kernel Functional Testing <lkft@linaro.org>,
 dri-devel@lists.freedesktop.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 Mark Rutland <mark.rutland@arm.com>
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

On Tue, Jun 3, 2025 at 9:26=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Mon, Jun 02, 2025 at 01:13:29PM +0200, Maxime Ripard wrote:
>
> > > I can't operate kunit
> >
> > Why not?
>
> Too complicated. People have even wrecked tools/testing/selftests/ to
> the point that it is now nearly impossible to run the simple selftests
> :-(
>
> And while I don't mind tests -- they're quite useful. Kunit just looks
> to make it all more complicated that it needs to be. Not to mention
> there seems to be snakes involved -- and I never can remember how that
> works.

I've been out of the loop for a while, but I'm curious.
What parts in particular are the most annoying, or is it basically all of t=
hem?

Is it that adding a new test file requires editing at least 3 files
(Makefile, Kconfig, the actual test.c file)?
Is it editing/writing new tests because the C API is hard to use? (Has
too many funcs to know how to do simple things, etc.?)

For me personally, it's the first part about all the additional edits
you have to make.
I _hate_ doing it, but can't think of a good alternative that feels it
makes the right tradeoffs (implementation complexity, requiring users
to learn some new system or not, etc.)

>
> Basically, if the stuff takes more effort to make run, than the time it
> runs for, its a loss. And in that respect much of the kernel testing
> stuff is a fail. Just too damn hard to make work.
>
> I want to: make; ./run.sh or something similarly trivial. But clearly
> that is too much to task these days :-(

Agreed that ultimately, it would be nice if it was as simple as one of thes=
e
$ run_kunit_tests --suite=3Dtest_suite_name
$ run_kunit_tests --in_file=3Dlib/my_test.c
or something similar.

But while I don't see a way to get there, if you've set your new test
config to `default KUNIT_ALL_TESTS` and are fine running on UML, then
it could be as simple as
$ ./tools/testing/kunit/kunit.py run

It should basically do what you want: `make` to regen the .config and
build and then execute the tests.

But I can see these pain points with it,
a) it'll run a bunch of other tests too by default but they shouldn't
be failing, nor should they add too much build or test runtime
overhead.
b) if the new test you're adding doesn't work on UML, you'd have to
fiddle with enabling more kconfig options or switch arches
c) it can be confusing how it has multiple subcommands in addition to
`run` and it's not immediately clear when/why you'd ever use them
d) the fact it's not like kselftest and just part of make, i.e. `make
TARGETS=3D"foo" kselftest`
   * even if kunit.py was dead simple (and it's not, but I don't think
it's _that_ complex), it's another tool to learn and keep in your
head.

Do these cover what you've experienced?
Or are there others?

>
> I spent almost a full day trying to get kvm selftests working a couple
> of weeks ago; that's time I don't have. And it makes me want to go hulk
> and smash things.

Stepping back, I think there'll always be relatively simple things
that take a bit too much effort to do in KUnit.

But I'd like to get to the point where anyone can feel comfortable
doing the very simple things.
And I don't want it to be with the caveat of "after they've read 10
pages of docs", because none of us have the time for that, as you say.

E.g. If someone is introducing a new data structure, it should be easy
to ask them to learn a enough KUnit so that they write _basic_ sanity
tests for it and add it to their patch series.
Maybe it's annoying to cover all edge cases properly and very
difficult to try and test concurrent read/writes, but those are
inherently harder problems.

Cheers,
Daniel
