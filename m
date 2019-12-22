Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FD31292D7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE886E227;
	Mon, 23 Dec 2019 08:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6F76E4E3;
 Sun, 22 Dec 2019 03:09:18 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id r27so17357580otc.8;
 Sat, 21 Dec 2019 19:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FLxLMHWzhvsAyc7YSZ1UcqmlBwxpr3w938KiSSxaokg=;
 b=J//ypFVJPHCHhD3mOZb7/3Ti3EJCW6jmrc3PIdLwqX4nQxX4Lmwah28XNfXUoXIl0O
 xDwdR/qYwLFvn3mcvv10Q55wtQnb3Ar07tzDUwFHRbOf4aFJQQvzdG95mw2TD/YQm/3G
 zk9Mnu8tU8jZoAqdk+huPCtjYQz6MEBaRZ55aK96mAbIP77k7ff30hAdpwtW/cxmKa45
 Qdhbm0Pgklj6g2XvVUxY3+SWJU5L733Za8z3iE+LnFfEt/5PBD9IXUtkAtKwkiPEwY+W
 nPTYpq+XviR4cUR0S/KRpKrcmRwhGXN5pdVITJJ3Fn3ryv0dwEVfbk3CNcODs6toZHsz
 OeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FLxLMHWzhvsAyc7YSZ1UcqmlBwxpr3w938KiSSxaokg=;
 b=okUtnjItB+Q3yvkAWmQoeeSl21sGvV8YFWVGAKHyxx84FbadKD1tmpr9+5X7livKfR
 P3gJE8sF/sz1XCwCJHtmKsAgP+3angBngl1Y1MzgY4vDiGLEcJVcyIiyqWspQdZ7fZ2R
 CgyQVn2A+K1Iz+bFCqDB89E92oqS+FIZWs/P4/8nd+W6sKMWWqBXmXt0MKA9v3XIuZqQ
 MpDNo419ex4P4dGkUHowWTCqz9ACmpCAZ1c0mtWMX/SEZHrhr9d6F17D35JT3rILS+Yd
 bJulLS9kQCroaH6SRAcxt2PP42otpkJ3Og/iCgFaGvPuB5kwZnpQ2xnTxIx5bQp7FDu7
 nDQw==
X-Gm-Message-State: APjAAAUe5d+wiW3jHpOrJAZIUp2+ZFdviA43dbqeEtZObGRc2jm0s+sx
 OIa+kVNN1BsS1s3cSWobdrY=
X-Google-Smtp-Source: APXvYqyH0YdvlwZOmLznIfhOeX/61Ru+3ctFbQQRQ5fYVPyH5b/V4PXFyQhY6hkOAQvp3okcFpPSfg==
X-Received: by 2002:a05:6830:1cd3:: with SMTP id
 p19mr8523090otg.70.1576984157645; 
 Sat, 21 Dec 2019 19:09:17 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id 47sm5494666otf.54.2019.12.21.19.09.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 21 Dec 2019 19:09:16 -0800 (PST)
Date: Sat, 21 Dec 2019 20:09:15 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] drm/i915: Remove tautological compare in eb_relocate_vma
Message-ID: <20191222030915.GA27679@ubuntu-m2-xlarge-x86>
References: <20191123195321.41305-1-natechancellor@gmail.com>
 <157453950786.2524.16955749910067219709@skylake-alporthouse-com>
 <CAKwvOdniXqn3xt3-W0Pqi-X1nWjJ2vUVofjCm1O-UPXZ7_4rXw@mail.gmail.com>
 <157538056769.7230.15356495786856166580@skylake-alporthouse-com>
 <CAKwvOd=ov789Lixdq8QE+MVXeYyh=W_sODSuj++4T8uF-hpVMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOd=ov789Lixdq8QE+MVXeYyh=W_sODSuj++4T8uF-hpVMw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: Kees Cook <keescook@chromium.org>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 03, 2019 at 10:45:22AM -0800, Nick Desaulniers wrote:
> On Tue, Dec 3, 2019 at 5:42 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >
> > Quoting Nick Desaulniers (2019-12-02 19:18:20)
> > > On Sat, Nov 23, 2019 at 12:05 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > >
> > > > Quoting Nathan Chancellor (2019-11-23 19:53:22)
> > > > > -Wtautological-compare was recently added to -Wall in LLVM, which
> > > > > exposed an if statement in i915 that is always false:
> > > > >
> > > > > ../drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1485:22: warning:
> > > > > result of comparison of constant 576460752303423487 with expression of
> > > > > type 'unsigned int' is always false
> > > > > [-Wtautological-constant-out-of-range-compare]
> > > > >         if (unlikely(remain > N_RELOC(ULONG_MAX)))
> > > > >             ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
> > > > >
> > > > > Since remain is an unsigned int, it can never be larger than UINT_MAX,
> > > > > which is less than ULONG_MAX / sizeof(struct drm_i915_gem_relocation_entry).
> > > > > Remove this statement to fix the warning.
> > > >
> > > > The check should remain as we do want to document the overflow
> > > > calculation, and it should represent the types used -- it's much easier
> > >
> > > What do you mean "represent the types used?"  Are you concerned that
> > > the type of drm_i915_gem_exec_object2->relocation_count might change
> > > in the future?
> >
> > We may want to change the restriction, yes.
> >
> > > > to review a stub than trying to find a missing overflow check. If the
> > > > overflow cannot happen as the types are wide enough, no problem, the
> > > > compiler can remove the known false branch.
> > >
> > > What overflow are you trying to protect against here?
> >
> > These values are under user control, our validation steps should be
> > clear and easy to check. If we have the types wrong, if the checks are
> > wrong, we need to fix them. If the code is removed because it can be
> > evaluated by the compiler to be redundant, it is much harder for us to
> > verify that we have tried to validate user input.
> >
> > > > Tautology here has a purpose for conveying information to the reader.
> > >
> > > Well leaving a warning unaddressed is also not a solution.  Either
> > > replace it with a comment or turn off the warning for your subdir.
> >
> > My personal preference would be to use a bunch of central macros for the
> > various type/kmalloc overflows, and have the warnings suppressed there
> > since they are very much about documenting user input validation.
> > -Chris
> 
> Is kmalloc_array what you're looking for?  Looks like it has the
> `check_mul_overflow` call in it.

I don't think kmalloc_array is right because we are not validating an
allocation. I am not sure that any of these overflow macros are correct,
we would probably need something new but I am not sure.

Cheers,
Nathan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
