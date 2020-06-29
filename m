Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD9220EF7E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1AC89D46;
	Tue, 30 Jun 2020 07:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCA189C3F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 18:18:32 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id d4so8677386pgk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 11:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RVpg6vIouDiH3on4zq6Qkvcb4IcnV9Eg7LBox0nJvvM=;
 b=TG6rKq8OIgA/7NkvNhVbwcp7Zv81JPFjOf+X5UcCa1t+7uVP1xbpgSP9j7A1oaOrDB
 URqVDRAfG2f8ZVotshyU0N6vx7j9gnEMkN2ZKla0nhU8H+hqEabOCXFHgrmhkdiUNDc0
 c10xCi1y0+t2AOlKgfjDJ3AF633ROwnB2UluF8oFnaHIxW/ZNI4eeEh/Tnaf0n3YeW+T
 YTW9iGyu6ShQ6xVj1DqYA0MHDO/YQTZJ6l/Re/dhnJklZQC8rIkaANrpwMxz2E/eYA6E
 q6tGvHjkbrH7RdYeDdgMCAj7jYCOqIERf7OTSeWu13R4TJZinjirQ0MiAVPZ4kdnGlSh
 PMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RVpg6vIouDiH3on4zq6Qkvcb4IcnV9Eg7LBox0nJvvM=;
 b=JqJ1bTiZVj+Oz5RtRDyjUk7XKnJAhK49Vu4W6b9lliUrpvrIF0kU3gb5M+jijr7Mvi
 Hu1bXIJRVUVWojlm3jgmYUq9UfhgN5flg+prN6Wk5puZYFC+ObR4u5AfeqBT4TmNBG4y
 Qj9gcOcLcsO4yUV+iKsXBfLoqMuvpMzAq3h/gHAZwAerhmDd1A80AJWjd4gsmF8qNOY1
 DnE/L0UIIBTYE29m7+vUpN0vNhyciSQLz1EUIXtpRQK2gNGp+KpRy8YetHa8Ku0spGbL
 rQnh7CiQGAOwUh9c5xhH1X6kYz9akzL9BAvQCzYbMGZoDNSy40e6mBZH/Q4LpV4PVl21
 RP8A==
X-Gm-Message-State: AOAM532YmFDUI7C4kGooDi4AAJwfrArxzsGIf/sgG7gUxUBiEN4F4Dcw
 hGmyJRepqRNuxT/cY4fcfTCy+EaEoTGY06CQRQOalQ==
X-Google-Smtp-Source: ABdhPJx9DCxKOqTyOvK/N39qAKQF4pHJeiMiGtVuafF9ig7zbCcl+2HZ5M9JzPJoDZZmvSgVG0JvPipv8QimLEaooNg=
X-Received: by 2002:a63:5644:: with SMTP id g4mr11018260pgm.381.1593454711516; 
 Mon, 29 Jun 2020 11:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <202006210249.QHly8bQZ%lkp@intel.com>
 <CA+h21hpABfDvthiwq_JwWGpqZ68VJxu5TOBVbw_Gaxpq8j+XQg@mail.gmail.com>
 <CAKwvOdnAKR_CtOccZohR_r1kzKKVuvo8LbpLi0s3ek+3u+c_zw@mail.gmail.com>
 <CA+h21hokCCF52O1wxkg0gLqS9ZcGtB0xMBm07_--i56=anJ=Rg@mail.gmail.com>
In-Reply-To: <CA+h21hokCCF52O1wxkg0gLqS9ZcGtB0xMBm07_--i56=anJ=Rg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 29 Jun 2020 11:18:20 -0700
Message-ID: <CAKwvOdkcPWT4krC5FuCpiXaoY+GiTeUa=CiamFCk5tPJOz4Cjw@mail.gmail.com>
Subject: Re: drivers/gpu/drm/panel/panel-samsung-ld9040.c:240:12: warning:
 stack frame size of 8312 bytes in function 'ld9040_prepare'
To: Vladimir Oltean <olteanv@gmail.com>
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:54 +0000
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 27, 2020 at 12:43 PM Vladimir Oltean <olteanv@gmail.com> wrote:
>
> Hi Nick,
>
> On Mon, 22 Jun 2020 at 19:50, Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
>
> > > I really don't get what's the problem here. The listing of
> > > ld9040_prepare at the given commit and with the given .config is:
> >
> > I wrote a tool to help debug these.
> > https://github.com/ClangBuiltLinux/frame-larger-than
> > If you fetch the randconfig and rebuild with debug info, that tool
> > will help show you which variables are used in which stack frames and
> > what their sizes are.  Also note that strange things get dug up from
> > randconfigs.
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>
> I ran your tool and it basically told me that all 11 calls to

Cool? No bugs running it? (I still need to extend support for many
architectures)

> ld9040_dcs_write from within ld9040_init are inlined by the compiler.
> Each of these ld9040_dcs_write functions calls ld9040_spi_write_word
> twice, so 22 inline calls to that. Now, sizeof(struct
> spi_transfer)=136 and sizeof(struct spi_message)=104, so, no wonder we
> run out of stack pretty quickly.

I'd expect these to have distinct lifetimes resulting in stack slot
reuse.  When the compiler inlines functions, it introduces a lexical
scope. You can imagine it inlining the body, but within a new `{}`
delineated compound statement.  Then the compiler knows that the
variables local to those scopes can't outlive each other, and can
reuse their stack slots in the containing function.  Escape analysis
comes into play, too, but I'm not sure that's an issue here.

>
> But my question is: what's wrong with the code, if anything at all?

The general case we try to find+fix with this warning is excessively
large stack allocations that probably should be heap allocated,
percpu, or static.  Also, the `noinline_for_stack` function annotation
is used frequently for this.

One known case of issues are the sanitizers, which can generally
prevent the reuse of stack slots.  Were any of those set in this
config, since this was a randconfig?  I'd check this first, then
consider if `noinline_for_stack` is appropriate on any of the related
functions.

> Why does the compiler try to inline it, and then complain that it's
> using too much stack

The flag -Wframe-larger-than= is a warning on semantics, not really an
optimization flag controlling the maximum stack depth of the function
being inlined into.

> when basically nobody appears to have asked it to
> inline it?

That's not really how inlining works.  If you don't specify compiler
attributes, then the compiler can decide to inline or not at its
discretion.  The `inline` keyword or its absence doesn't really affect
this.  __attribute__((always_inline)) and __attribute__((noinline))
can give you more control, but there are hyper obscure edge cases
where even those don't work as advertised.

-- 
Thanks,
~Nick Desaulniers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
