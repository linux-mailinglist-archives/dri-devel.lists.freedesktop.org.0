Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2351DEF85
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 20:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4036EA27;
	Fri, 22 May 2020 18:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FED6EA27
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 18:53:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so11180034wru.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 11:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=B0vGhuCjEvtxZvj9D6OBMClg7WtQ7jUpnFZAu4kucU4=;
 b=tSYUAy0kjtsUeKUnw+EITydgqle7j9x3gvoFmsTKYGV3dqFr2nFaUXBrapg7G4aQAc
 eBz8mGrCX7oZvm1Wf+74TxB/faQEfL2Gwcj2peCdMXM+emHFlqZJcustbCkuQgBx9As1
 bFljfMjAoo52LRPTP3mFBb5RsUZQ2EMld3w9sx40/4iBEAMQ4rM6sqddff1h8POgKICY
 G6s0OwmkBCwMc8ZzEuZtQ6sCS+sbDcvC5weoyToElhi2bxRALERO5kHXqhjdeBeZzYLB
 Kr7H/ViteZDSYOyVcBdFkCjfUI8XpQesuQvuKzUIW9l/ZaQvS/NQTyAWjo1sZQ8SD6WM
 jMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B0vGhuCjEvtxZvj9D6OBMClg7WtQ7jUpnFZAu4kucU4=;
 b=edDFSomdkOcU1NwZAyBASyHh67AtbLbsuYaBPasJ/BNG8Bj7SH3a9BKa9kLQ6PoUsX
 D6xIpNtzFttC1Gwv6q/BF/ooj3qCDrv+lHeCv/UPjLbParGmnvDTXowgjKX9uZX4HfaH
 criyTzThYqorp2H8fmU2jz4LYTrHZLtPf8qiJX7GT0XwRs0ARlpWrIOX/AaKW1jlwGAA
 fv8+dZQ+FWtiJpgHehloBY7aVoJGzrGIZsWKuOA1j+SXKB48Ak9v+kScN5MLg3tS0L/r
 XCdXw+230VLK0h4clyOrrKERjArd35NxOoMhfeN03N6BZ+om59xoo2+ZKyVyUTnL15ku
 Sv7w==
X-Gm-Message-State: AOAM531h8bj3F+th9o/uLba3BRQBKVreJkf33qsUMme77ipIuAOIUTf+
 zoxLVFlT+av6jhZIg1UXDO4=
X-Google-Smtp-Source: ABdhPJwRqiPY29mx748B1Sdjs1UUvm23jl9VJ9uoGK4mj8wjHAdYirktNnLr9N0umQUlxOSIs57lvg==
X-Received: by 2002:adf:82b6:: with SMTP id 51mr4399090wrc.102.1590173589296; 
 Fri, 22 May 2020 11:53:09 -0700 (PDT)
Received: from arch-x1c3 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net.
 [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id q9sm9960765wmb.34.2020.05.22.11.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 11:53:08 -0700 (PDT)
Date: Fri, 22 May 2020 19:50:19 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH v2] linux/bits.h: adjust GENMASK_INPUT_CHECK() check
Message-ID: <20200522185019.GA2731481@arch-x1c3>
References: <20200519101320.33495-1-emil.l.velikov@gmail.com>
 <20200519211452.422179-1-emil.l.velikov@gmail.com>
 <20200519212829.GA59586@rikard>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519212829.GA59586@rikard>
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
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rikard,


On 2020/05/19, Rikard Falkeborn wrote:
> + Andrew et al who recieved mail from the build robot this morning about
> the same issue.
> 
> On Tue, May 19, 2020 at 10:14:52PM +0100, Emil Velikov wrote:
> > Recently the GENMASK_INPUT_CHECK() was added, aiming to catch cases
> > where there GENMASK arguments are flipped.
> > 
> > Although it seems to be triggering -Wtype-limits in the following cases:
> > 
> >    unsigned foo = (10 + x);
> >    unsigned bar = GENMASK(foo, 0);
> > 
> >    const unsigned foo = (10 + x);
> >    unsigned bar = GENMASK(foo, 0);
> > 
> > Here are the warnings, from my GCC 9.2 box.
> > 
> > warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
> >    __builtin_constant_p((l) > (h)), (l) > (h), 0)))
> >                             ^
> > warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
> >    __builtin_constant_p((l) > (h)), (l) > (h), 0)))
> >                                         ^
> > 
> > This results in people disabling the warning all together or promoting
> > foo to signed. Either of which being a sub par option IMHO.
> > 
> > Add a trivial "+ 1" to each h and l in the constant expression.
> > 
> > v2: drop accidental !
> > 
> > Fixes: 295bcca84916 ("linux/bits.h: add compile time sanity check of
> > GENMASK inputs")
> > Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: kbuild test robot <lkp@intel.com>
> > ---
> >  include/linux/bits.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/bits.h b/include/linux/bits.h
> > index 4671fbf28842..02a42866d198 100644
> > --- a/include/linux/bits.h
> > +++ b/include/linux/bits.h
> > @@ -23,7 +23,7 @@
> >  #include <linux/build_bug.h>
> >  #define GENMASK_INPUT_CHECK(h, l) \
> >  	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
> > -		__builtin_constant_p((l) > (h)), (l) > (h), 0)))
> > +		__builtin_constant_p((l + 1) > (h + 1)), (l + 1) > (h + 1), 0)))
> 
> You need parentheses around l and h here.
> 
Sure will do.

> I think I would have prefered a cast to int here instead but I'm fine
> with either (I don't think pragmas for disabling the warning can be used
> since the check is added to the mask). Either way, I think we need a
> comment on why this is done.

How about:

Add trivial "+ 1" when to the h/l arguments. Without this GCC will
complain when comparing unsigned vs 0. Depending on the GCC version,
that can happen within __builtin_constant_p and/or the BUILD_BUG_ON_ZERO
macro.


> 
> >  #else
> >  /*
> >   * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
> > -- 
> > 2.25.1
> > 
> 
> I can't reproduce this with gcc 10 and kernelci.org does not show the
> warning (but those builds seem to be gcc 8 only, so maybe this is a gcc
> 9 thing only). A bit strange this shows up now, it's been in Linus's
> tree for six weeks and in next for even longer, but oh well.
> 
I would imagine that people either use "interesting" workarounds like
this [1], or outright disable -Wtype-limits - grep for Wtype-limits.

I'm glad that GCC 10 is saner, although it's far from being the minimum
required for building the kernel :-\


Let me know if the above comment works for you and I'll send out the
next revision.


Thanks
Emil

[1]
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2803aa743fd38f66acca555ae6e5fc677bb71251
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
