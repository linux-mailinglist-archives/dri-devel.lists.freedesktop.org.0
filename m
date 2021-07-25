Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6519A3D4F93
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 20:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC056E457;
	Sun, 25 Jul 2021 18:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1C96E457
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 18:51:54 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id n10so1345152plc.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 11:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qirs+iLZFGRKsz/ZopqRyNng3+a0VdaNoIeySOmoJBs=;
 b=ryQJ486SrysdfwQYYY2pSFz6x9WPYf3me6zDgsy0m4p2aDx7AsvFubmhNxrWI+j4mv
 nsvVtOQpACYSIKSnrUTMMMUUQdp3SgVsYl0TD7ExOXYMOl9F27ZE/bAU4iYLTFdlttbM
 mgCsWVFzt5OIJaGyyWvVlaXnqOtUUQ3nC2OVhZV1MZ77YP7msKpmtmRPj9vV2BXO76Wu
 DeRSI5ITm7mYKMjdHyrm4wxysMYOQwP9EkFdubOY8tc52aVAyjbKLgzmaoChdQBcBiij
 VHm02K4+SLwTlRDCumkBT32LVccoGk37flJDSBLtEmBt5OrWlE4gDEz5t7dxqImxSUYj
 ZVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qirs+iLZFGRKsz/ZopqRyNng3+a0VdaNoIeySOmoJBs=;
 b=UyrVebS7yiUlzzoN+yFl4ferUIBxx7kbdjwy6i480ivD7bMoQO3JdO3qh4UxC03BfJ
 aQA7VPR8vruU0nMkjtW76keSkXtNpKFVig3wRgk6zt8ZcYMpVbamZtSaVEFgYVTvYURs
 +FO2IfGMY88/feujVBR/ooOW44aE0XhWH0FTxsmGkG8isYMOtYDuVyt4IwE/kTa8veWv
 SMeV+syFBQ3V4dzjPXa2F/rdRcYtkdRs+VtPu8S8up6IEsrC0YUZGtfwuE1P5fFc+ny7
 eBnIPSIkUElRvL9zNHQBYXurjiPV1hB0ypQ0fMD7zbCeuaL4VJPG3e5eJy5gBMXxknfz
 Vn5w==
X-Gm-Message-State: AOAM530li58vs78A87xjO7GmAztsjusFZLTIl2mGlXQCSEcDOOsL+4kN
 CHW8qVNxnBjZA2UbJYvRaMTMtyOX6frJOsg7XJs=
X-Google-Smtp-Source: ABdhPJxHwipVJbJmzeHfWz64SwkxLZVfnnCGACfafL10iji3Cc/k3Num3SbdXCt9DRUt1CVwHIbCU+9rEVCNd+x0eNo=
X-Received: by 2002:a63:d014:: with SMTP id z20mr14700708pgf.203.1627239114212; 
 Sun, 25 Jul 2021 11:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210724151411.9531-1-len.baker@gmx.com>
 <20210724151411.9531-2-len.baker@gmx.com>
 <CAHp75Vd+ZM_yO6CU_6oJieePMt00Sp6oKEU2+QEyZxLDg5PN8A@mail.gmail.com>
 <20210725135844.GA1953@titan>
In-Reply-To: <20210725135844.GA1953@titan>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 25 Jul 2021 21:51:18 +0300
Message-ID: <CAHp75Vd=_qgnaLpAq+=Awf+ggUf9DEm0amNyTE0KkYThxtP=WQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] staging/fbtft: Remove all strcpy() uses
To: Len Baker <len.baker@gmx.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Phil Reid <preid@electromag.com.au>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 25, 2021 at 4:59 PM Len Baker <len.baker@gmx.com> wrote:
> On Sat, Jul 24, 2021 at 11:21:04PM +0300, Andy Shevchenko wrote:
> > On Sat, Jul 24, 2021 at 7:05 PM Len Baker <len.baker@gmx.com> wrote:

...

> > > -       char msg[128];
> >
> > 128 / 4 = 32. So, this buffer is enough to debug print only up to 32
> > bytes. Hence %*ph replacement won't cut output earlier than requested.
>
> I'm sorry, but I don't understand what you are trying to explain. Moreover,
> with the "0x%02X " in the sprintf followed by the strcat, the msg buffer can
> print 128/5 values (25 hex values).
>
> The %*ph replacement can print up to 64 bytes, so I don't see any problem
> here.

Right. That's what I am trying to say and the hint here is to combine
this part into a phrase in the commit message in the next version of
the patch.

...

> > > +                       for (j = i + 1; par->init_sequence[j] >= 0; j++);
> >
> > Why is i + 1 initial for the j? You may rather access the 'i + 1 +
> > j'th element in the array...
> >
> > ...
> >
> > > +                                     par->init_sequence[i], j - i - 1,
> >
> > ...and get rid of the ' - i -1' part here.
>
> Yes, it was the first idea but I prefer this method since we save aritmethic
> operations. In other words, if I use what you suggest, the index for
> par->init_sequence is calculated as a "sum" every iteration. But if the
> performance is not an issue and you believe that the above is more clear, I
> have no problem. What do you prefer?

I prefer my variant and I believe the compilers nowadays are clever
enough to understand this. Have you tried to compile and compare the
real assembly?

-- 
With Best Regards,
Andy Shevchenko
