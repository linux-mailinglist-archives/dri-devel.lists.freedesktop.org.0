Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF461AEB9D
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 12:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5566E41B;
	Sat, 18 Apr 2020 10:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCC46E41B
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 10:15:12 +0000 (UTC)
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N63NW-1jAAcQ2pHU-016Plx for <dri-devel@lists.freedesktop.org>; Sat, 18
 Apr 2020 12:15:10 +0200
Received: by mail-qk1-f169.google.com with SMTP id 20so5196212qkl.10
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 03:15:10 -0700 (PDT)
X-Gm-Message-State: AGi0PuZgvzRdr2v9tjiNBshN7oMiloUa/zLALTXnoS2oM1CO0edysO0O
 3JnTK3S8EgNGHH3awphBpqui2qesPo2W6spCg6s=
X-Google-Smtp-Source: APiQypL1jKipNiUeVhJwOl5M66Nh/Js4Ri2A5sesKsfarSq7XUVbX7iQCpooHjQjUDKJS1y25aYqQR4IWZNujIQYHPw=
X-Received: by 2002:a37:851:: with SMTP id 78mr7389692qki.352.1587204909605;
 Sat, 18 Apr 2020 03:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417155553.675905-2-arnd@arndb.de>
 <877dydp0ih.fsf@belgarion.home>
In-Reply-To: <877dydp0ih.fsf@belgarion.home>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 18 Apr 2020 12:14:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3DD3qy=SkZjy=X3+1ooHUcXEWu05JApeeyoQN4VOntCQ@mail.gmail.com>
Message-ID: <CAK8P3a3DD3qy=SkZjy=X3+1ooHUcXEWu05JApeeyoQN4VOntCQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] fbdev: w100fb: clean up mach-pxa compile-time
 dependency
To: Robert Jarzmik <robert.jarzmik@free.fr>
X-Provags-ID: V03:K1:TWT3I8J8n3Vaa+3WpW9mLnganUew8jfL8cOrpVUIwLDPtOS3BRH
 3HxROwRC+WTAHRB4sh4abclnMcHNmWzML9d3Yp4npVjtNBijhgc/nFGVcLklayNqh3S+Veq
 KaGSWFO542fqXU8c6KMh7IdfiGhRoyWUpNffZvWeu85lYkjsCspKgyEQE3iRT0+ISUiNTip
 M4BjAr7BMd2wOGGZVHiDw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mKiXrzz4r2k=:Q7+L6X0LQAyNBeAxOVt1Xt
 7g9lrYHqLvrwei/TBU9EFnwn6m1oqGF5o02MGv+QJs7EqVHU9kOB6J9oEZbJ9DKjZYaVySTw7
 6kJyplAkpqyjKUEg2ls45l/mKFhqVsBKv9E+21ywN67AKMrbV1CJbakiXb9ZfhBwTI1JQETdo
 9ZSHYQRxKksw0WudYwlBf7Pn52n1AP1wmWjglQs7vO6FPe6UggmFZOFBx2iGR1mMrpY+zqHSA
 vtkD5DNKrt22GVkCQBw3wa0hUkouRnUB08CTgah/w8nPjwpumFYX8QgyzRQ6lmuL/FLBaObJf
 Q2t1RcrqxJE7aXoLGtkJeZZhOg21oHq1WoCr/1lDBQ1wrkcrmeBLlB5W4WgOxSU4jKFlU4UQs
 +BL5ISnf3SuODkfYtfY7RlFtXvF8+E5MYZdtOXw80ErPgNXXQ4XuBf1QjTtt9uuIr7B60uQ6w
 TZvMCcmSKRZCOAMDWmjFlyDh3VjrsWAqqNeJ4HXZz36ye7KwOyPDDzRopEDM+YHHilaN3SIfT
 BLpDzwQEObVJtG8KogH0IeC6P4ZVce/A1XrCRvBEiHIQfcMTsTxtR+blMAt4VtNwiYh2iXmH2
 gB2wjCHAE7lo0igE3EsaYiBCnjrfbc2mmYhmxuQQCAyZz9+71gMkFsa3nhl2ZZWWSXOkF5nj/
 IpQsFemEN3E90o4WB/MaVPqTqwN9zQSrSLhjgXJhgKa+qyBPWoFnaDAlen1qxMLadldoHVR6Q
 +6Y5HMrLCuyTqPkNOAv63kgvo2PeI0EMXQobMbENA7SAZByHtdDRfvoLvpNtFI4WTSot9Cw+i
 p0ZvjLQWr5BFnbjNtISK6PcxzJGUzVfEeWwnf6KLSyT+/wfKtE=
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>, Thomas Hellstrom <thellstrom@vmware.com>,
 dsd@laptop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Masahiro Yamada <masahiroy@kernel.org>, Saeed Mahameed <saeedm@mellanox.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
 dri-devel <dri-devel@lists.freedesktop.org>, jfrederich@gmail.com,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 18, 2020 at 12:11 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
> Arnd Bergmann <arnd@arndb.de> writes:
>
> Hi Arnd,
>
> > diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
> > index f60bc29aef68..8444d40df1b3 100644
> > --- a/arch/arm/mach-pxa/Kconfig
> > +++ b/arch/arm/mach-pxa/Kconfig
> > @@ -549,9 +549,6 @@ config MACH_ICONTROL
> >
> >  config ARCH_PXA_ESERIES
> >       bool "PXA based Toshiba e-series PDAs"
> > -     select FB_W100
> > -     select FB
> > -     select PXA25x
> This last line puzzles me a bit in this patch. Why removing the PXA25x select ?

It's a mistake, fixed now. Thanks for taking a look!

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
