Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E3A1E07D9
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E83789F06;
	Mon, 25 May 2020 07:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FB86E212
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 19:36:04 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id h188so8427768lfd.7
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 12:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fDwkv6Ll1fEPODUFnaA/gEcaNjcCzzle8s+x1tcueJ8=;
 b=M/SiH8ZxSSCwYubzElWImdTr1HXfVwthSiUI9cXzojVwXr/G9Hn0aOL/A4yYqqeU4A
 Afd3Wfm9Y3KIoYx/j/GxSrK0dCzfBEqdMfqHYMLM/7WWd42ax+UPhLxF89QRpofl9j2n
 C5p8qe/7Q4PTOwBpvK2ZRbsFCCBm2IglOlZXESZZgJclPflKaOhTTB3yUiaeK49a/qMU
 z02w0C0MdEnyIcAFTTtnrPyLGPTH9iTQgabAOGv6oxUx1SqBwYhs9kR9IKRj6LNmzvEG
 h8NSI3odtNEpyuVVp3bfVyuSRuAymGRho6hHZ8GBE7Cl7+2IrxCaf+6E3oOyjIl4ZBbo
 pXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fDwkv6Ll1fEPODUFnaA/gEcaNjcCzzle8s+x1tcueJ8=;
 b=Ei2WoAOw4rlDB/eYbYAvrJGYjpicdxE1fIPCeekn6hbUU1oFo9kUGuP8aSp4q+knA9
 jrzM/czfZvq1e20od+GiZEJRN0+UeNV05NjVKvne2osx+rOujEZMFg4QMCwI2uiCw9bC
 hNrc7ukkR3ggUTn6lCeygJUiNpDH7dOgifRP9IdizEMONR85pWKonu2K2rfp+dqbqiln
 eM67ci2lkbbcR7C4GoQ5ZX+6JUFi8fNwEE4YJUrUSrUl5u/RL6ycNnVh5HB7mjKh6syb
 2R0qIpgYwiwefQ7tHOahWEF6sQ+o0ses2Nn3OZ8GdWsXT69JRAooSaQTknOPgSLO35+y
 fxkw==
X-Gm-Message-State: AOAM533/uzVEyc4+/gv/i0pZjqPdRsC4z+P9wK/7LKtP3i9BFHEBgnjg
 Ag4Uo03RRqfcy8D/ap0nZw8=
X-Google-Smtp-Source: ABdhPJxhV99fgSeGtAsiOO9QZV9iIYkebjwuV4VvbU/oaRU9L6wjx3kMVmHSxcFSEb3zBTnQP9mehw==
X-Received: by 2002:a19:4ac5:: with SMTP id
 x188mr10680203lfa.180.1590262562414; 
 Sat, 23 May 2020 12:36:02 -0700 (PDT)
Received: from rikard (h-158-174-22-22.NA.cust.bahnhof.se. [158.174.22.22])
 by smtp.gmail.com with ESMTPSA id n22sm2263235ljj.138.2020.05.23.12.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2020 12:36:01 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
X-Google-Original-From: Rikard Falkeborn <rikard.falkeborn>
Date: Sat, 23 May 2020 21:35:57 +0200
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2] linux/bits.h: adjust GENMASK_INPUT_CHECK() check
Message-ID: <20200523193557.GA9802@rikard>
References: <20200519101320.33495-1-emil.l.velikov@gmail.com>
 <20200519211452.422179-1-emil.l.velikov@gmail.com>
 <20200519212829.GA59586@rikard>
 <20200522185019.GA2731481@arch-x1c3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522185019.GA2731481@arch-x1c3>
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: Kees Cook <keescook@chromium.org>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 22, 2020 at 07:50:19PM +0100, Emil Velikov wrote:
> Hi Rikard,
> 
> 
> On 2020/05/19, Rikard Falkeborn wrote:
> > + Andrew et al who recieved mail from the build robot this morning about
> > the same issue.
> > 
> > On Tue, May 19, 2020 at 10:14:52PM +0100, Emil Velikov wrote:
> > > Recently the GENMASK_INPUT_CHECK() was added, aiming to catch cases
> > > where there GENMASK arguments are flipped.
> > > 
> > > Although it seems to be triggering -Wtype-limits in the following cases:
> > > 
> > >    unsigned foo = (10 + x);
> > >    unsigned bar = GENMASK(foo, 0);
> > > 
> > >    const unsigned foo = (10 + x);
> > >    unsigned bar = GENMASK(foo, 0);
> > > 
> > > Here are the warnings, from my GCC 9.2 box.
> > > 
> > > warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
> > >    __builtin_constant_p((l) > (h)), (l) > (h), 0)))
> > >                             ^
> > > warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
> > >    __builtin_constant_p((l) > (h)), (l) > (h), 0)))
> > >                                         ^
> > > 
> > > This results in people disabling the warning all together or promoting
> > > foo to signed. Either of which being a sub par option IMHO.
> > > 
> > > Add a trivial "+ 1" to each h and l in the constant expression.
> > > 
> > > v2: drop accidental !
> > > 
> > > Fixes: 295bcca84916 ("linux/bits.h: add compile time sanity check of
> > > GENMASK inputs")
> > > Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> > > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > > ---
> > >  include/linux/bits.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/include/linux/bits.h b/include/linux/bits.h
> > > index 4671fbf28842..02a42866d198 100644
> > > --- a/include/linux/bits.h
> > > +++ b/include/linux/bits.h
> > > @@ -23,7 +23,7 @@
> > >  #include <linux/build_bug.h>
> > >  #define GENMASK_INPUT_CHECK(h, l) \
> > >  	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
> > > -		__builtin_constant_p((l) > (h)), (l) > (h), 0)))
> > > +		__builtin_constant_p((l + 1) > (h + 1)), (l + 1) > (h + 1), 0)))
> > 
> > You need parentheses around l and h here.
> > 
> Sure will do.
> 
> > I think I would have prefered a cast to int here instead but I'm fine
> > with either (I don't think pragmas for disabling the warning can be used
> > since the check is added to the mask). Either way, I think we need a
> > comment on why this is done.
> 
> How about:
> 
> Add trivial "+ 1" when to the h/l arguments. Without this GCC will
> complain when comparing unsigned vs 0. Depending on the GCC version,
> that can happen within __builtin_constant_p and/or the BUILD_BUG_ON_ZERO
> macro.
> 
> 
> > 
> > >  #else
> > >  /*
> > >   * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
> > > -- 
> > > 2.25.1
> > > 
> > 
> > I can't reproduce this with gcc 10 and kernelci.org does not show the
> > warning (but those builds seem to be gcc 8 only, so maybe this is a gcc
> > 9 thing only). A bit strange this shows up now, it's been in Linus's
> > tree for six weeks and in next for even longer, but oh well.
> > 
> I would imagine that people either use "interesting" workarounds like
> this [1], or outright disable -Wtype-limits - grep for Wtype-limits.
> 
> I'm glad that GCC 10 is saner, although it's far from being the minimum
> required for building the kernel :-\
> 
> 
> Let me know if the above comment works for you and I'll send out the
> next revision.
> 

That works for me, but I'm not the one you need to convince. :)

Rikard

> 
> Thanks
> Emil
> 
> [1]
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2803aa743fd38f66acca555ae6e5fc677bb71251
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
