Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41573DC620
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 15:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC8A6E3A0;
	Sat, 31 Jul 2021 13:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056276E51D
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627738996;
 bh=Fu/lW7pPCxMAVtTTCjrX6D5BTYRamvOOTo6hAqwjT+M=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ZsL7JBbsitWzQJ5WHefWqlFAwGe7vJbhBj2faIoGOl88YzZTi5tGfkfH4bOBa7px9
 StEJYLOeYKn/M6DazE9IQoM6PEzwTFJTynEpHLZypO7Za35UYAJRTBrNcbfCFk/4A8
 KaadioHrg2gvzVdhC8DaNWlMa/g5tj8RuZSkW3lA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N63Vi-1nG7GW0WYy-016QDW; Sat, 31
 Jul 2021 15:43:16 +0200
Date: Sat, 31 Jul 2021 15:43:03 +0200
From: Len Baker <len.baker@gmx.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Len Baker <len.baker@gmx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phil Reid <preid@electromag.com.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] staging/fbtft: Remove all strcpy() uses
Message-ID: <20210731134303.GA1979@titan>
References: <20210724151411.9531-1-len.baker@gmx.com>
 <20210724151411.9531-2-len.baker@gmx.com>
 <CAHp75Vd+ZM_yO6CU_6oJieePMt00Sp6oKEU2+QEyZxLDg5PN8A@mail.gmail.com>
 <20210725135844.GA1953@titan>
 <CAHp75Vd=_qgnaLpAq+=Awf+ggUf9DEm0amNyTE0KkYThxtP=WQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd=_qgnaLpAq+=Awf+ggUf9DEm0amNyTE0KkYThxtP=WQ@mail.gmail.com>
X-Provags-ID: V03:K1:DfpDEk+H0BF86NTgWDM1eIV7LCLQS0mvdmiGmakvUXg55dsSL2J
 56o7cLVbGe9OJ1bVo0UskmwedbqtAit7HeAC1EbxrtgzUfQgPWmSQvhH/4UzluXfSUxa5TR
 rWiiCQB5D782uCPZAH0YyipX3JZR3lpMuUrj+J7+HtR3QsRpSyDAvQk6LB72RWj9iZHSlfY
 em3DBJgdQNEFuTcfH6Hdw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tH6Wma+ggNg=:igYXSXxsqbjd7FSyhf80oM
 FqmUZ4+wQF9/cPupsLE0OcFE+yhEk5TnW3wfWy1SDebC8/k1KCoR4DH6rhfs5Eo8c4edpUgPs
 YEc8EK5y0kDU67PEtXwfuZChISRADttUjSaolNl56RE1qfiote4aJh/P0Vb2CXCxoacFHwp5z
 5ggX2auQdiE99YGYTOM460ezh4kOobmRv740UdN8TUecwa/5HU3/IKsYznyzoonPpC1dciNnU
 C4bk/4FoPt/aW5q7jJ5PmpuW1Y30IjW3pTgc3HI6X8BlmYdsh8Cz5oqIsIU44buQhjqOFQa3d
 +duOZ5zxXqHFOvQ0+fAqLwAsY7qzD0oLTCOchzFIrWDyzQ5z32X3eP8/G3xN/0Q3Lj5E53iP0
 xLVe2XfZzhKayNBDROVVBXsJJQY7HvCG7xrN7wQN2B2osSpQWNiqBx/zIOVqjLCQN5Oi77Opn
 xi7xIAnPbUFX2VfZJaa/60OT6aczVyt0WDGioMJvgiNUxnKZiIoC8pyeXiQ38NsLVnjGkbBgh
 svDAUiO320GHoOhPZtKxN04960uVN0Tm2jZ1szbVPEMMr/gfz95yk06786NhOICtCvp47lg9o
 /9wedIflNsYZtLu2pVPeAU2HsL48Ujmz2yK9X8HN21UPxwML/GKYM48u1SRaP9MBmempr0tdj
 d0Zi01Vmj7fXa+68IJ0ZOSog6EKrjXsMmEJ6P+W2VNS/j8eFzaww8EVRHW9UsS4Wc072l3Ylv
 TA9swyt+AkHrMcW8tOVyntq6EufS/Owy0YO59Zq1fhHe3xcSxoSMpbq6rk7kPrh4RS1tbgpNM
 fZq4svBGzOFKu+76OwiTFgBHGT2tGSr5nLrNagBOkeXJS/cyXAwjf6KvsEO9GhbZjfevioDHF
 +4RL9gc2XS9JECa8BPuTJhM5jy77ZNf0dZE35SSJxVnkbHejPIec7NMcLuMBvI0jGIyOJSxx6
 Gk6e1X84wFslP8aAD/ngeaLiYSN5AtoCsjgTkjHL+f1uh09Rb1i26TKNMC/yB6Fib1ozlBQE0
 biuyG2ajaeExfSsNleq8Djb5u+MK+8grVZmtKfKrlDbj28FoOkJ6dnKrIiW+JuApDbh/Zfz3n
 ACMnR5GdXGcshMpiaj9KEDC8fG8mg+Qml7M
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

On Sun, Jul 25, 2021 at 09:51:18PM +0300, Andy Shevchenko wrote:
> On Sun, Jul 25, 2021 at 4:59 PM Len Baker <len.baker@gmx.com> wrote:
> > On Sat, Jul 24, 2021 at 11:21:04PM +0300, Andy Shevchenko wrote:
> > > On Sat, Jul 24, 2021 at 7:05 PM Len Baker <len.baker@gmx.com> wrote:
>
> ...
>
> > > > -       char msg[128];
> > >
> > > 128 / 4 =3D 32. So, this buffer is enough to debug print only up to =
32
> > > bytes. Hence %*ph replacement won't cut output earlier than requeste=
d.
> >
> > I'm sorry, but I don't understand what you are trying to explain. More=
over,
> > with the "0x%02X " in the sprintf followed by the strcat, the msg buff=
er can
> > print 128/5 values (25 hex values).
> >
> > The %*ph replacement can print up to 64 bytes, so I don't see any prob=
lem
> > here.
>
> Right. That's what I am trying to say and the hint here is to combine
> this part into a phrase in the commit message in the next version of
> the patch.

Ok, I will update the commit changelog for the next version.

>
> ...
>
> > > > +                       for (j =3D i + 1; par->init_sequence[j] >=
=3D 0; j++);
> > >
> > > Why is i + 1 initial for the j? You may rather access the 'i + 1 +
> > > j'th element in the array...
> > >
> > > ...
> > >
> > > > +                                     par->init_sequence[i], j - i=
 - 1,
> > >
> > > ...and get rid of the ' - i -1' part here.
> >
> > Yes, it was the first idea but I prefer this method since we save arit=
methic
> > operations. In other words, if I use what you suggest, the index for
> > par->init_sequence is calculated as a "sum" every iteration. But if th=
e
> > performance is not an issue and you believe that the above is more cle=
ar, I
> > have no problem. What do you prefer?
>
> I prefer my variant and I believe the compilers nowadays are clever
> enough to understand this.

Ok, understood. Thanks.

> Have you tried to compile and compare the real assembly?

I will test it.

> --
> With Best Regards,
> Andy Shevchenko

Regards,
Len
