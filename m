Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 686041ACC3E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 17:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988146E323;
	Thu, 16 Apr 2020 15:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CFE6E321
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:58:51 +0000 (UTC)
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M7am5-1jJuuS1lcr-0084wY for <dri-devel@lists.freedesktop.org>; Thu, 16
 Apr 2020 17:58:49 +0200
Received: by mail-qk1-f178.google.com with SMTP id x66so21771848qkd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:58:49 -0700 (PDT)
X-Gm-Message-State: AGi0PuYx/RHSBrLtxbQ0evvUSqoDvov3TxhaLI0QZk127AY7l++UiB8w
 e8B9rDhHuPntSO6sVwa6alskagtyaeoiMt50B5c=
X-Google-Smtp-Source: APiQypKGrakVFJpHU6+2/9ubHFZSVsfORqHq+Dek4jgUuB+FQt0sMX/hFlCLPEJjO3Byfz+ywXPktI2/F+cmyK0/LA8=
X-Received: by 2002:a37:851:: with SMTP id 78mr32467282qki.352.1587052728173; 
 Thu, 16 Apr 2020 08:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200414132900.GD5100@ziepe.ca>
 <CAK8P3a0aFQ7h4zRDW=QLogXWc88JkJJXEOK0_CpWwsRjq6+T+w@mail.gmail.com>
 <20200414152312.GF5100@ziepe.ca>
 <CAK8P3a1PjP9_b5NdmqTLeGN4y+3JXx_yyTE8YAf1u5rYHWPA9g@mail.gmail.com>
 <f6d83b08fc0bc171b5ba5b2a0bc138727d92e2c0.camel@mellanox.com>
 <CAK8P3a1-J=4EAxh7TtQxugxwXk239u8ffgxZNRdw_WWy8ExFoQ@mail.gmail.com>
 <834c7606743424c64951dd2193ca15e29799bf18.camel@mellanox.com>
 <CAK8P3a3Wx5_bUOKnN3_hG5nLOqv3WCUtMSq6vOkJzWZgsmAz+A@mail.gmail.com>
 <874ktj4tvn.fsf@intel.com>
 <CAK8P3a1S2x1jnx9Q5B22vX8gBHs0Ztu-znA9hqZ5xp5tRAykGg@mail.gmail.com>
 <20200416145235.GR5100@ziepe.ca>
In-Reply-To: <20200416145235.GR5100@ziepe.ca>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 16 Apr 2020 17:58:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3HwFYKfZftm2fWE=Lzi486rXpMBwjy1F4oohYU2+o7-g@mail.gmail.com>
Message-ID: <CAK8P3a3HwFYKfZftm2fWE=Lzi486rXpMBwjy1F4oohYU2+o7-g@mail.gmail.com>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Provags-ID: V03:K1:X52wEopCKOO/D9zWR8+b1VpLpgc8b8FRsWa/VWwBNJpXw0sm+0D
 y7Aj72gAYIr1oGS9yxeX2oNf8KP8qePH0baRTD6DEZ73h2icrHchMAjPBDmpZ0nur6MSeht
 vdAT7LlnTu/7MgrIAhaQ0udqJspeNX/i9u9625KXomc3V5GOAYS6yE3vOTW1P8lNb9z7fgQ
 4gLV1KZ9Orl//xHiMiKMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HUCBpFkB4mA=:yK12VrJje22Y2t1zve56Lc
 jPVI5r9JRmYBfgU4+yvXiOonWPErkcYQ6rcxaQQXth/ppbl+O9BZRtNj8gTpBWsKifk3NPkbk
 FOJRlbl65wlEf7njEG69X4fIGRUVAgda+TTSCHlyRPHzErW86jjSGOUff51+hOFRezRtrHP0M
 R77piA+WU5NIv/7AW7AHFGKichcVNamXVvFkG3glYAthxkfq8mZj5HRojFdVOPxJpGzwFO5Zk
 nf6aAqXWc6hMP2ZkfuuM6XVWlgOugvxIU9rgBkGOoVmXd1+AXKOVrlrKvDLLj8kkUgVZkG5cg
 5Hih7UqgeHGj0iE68yAM44ppUrBQUjdex8CidyrtuhxxUFHnh4zNCl1II82b0X1WGoDf/oCKm
 FAqq8UbRX22j9cfmmPFudZ+KW20WDX8KRjFg7tQ50Ipu6hWd59EQjy73c0fUBKxgrLfVk6rdt
 3ciT9Ci2lmlj8VL0oyBRwQw97ORz7MRBmurNrqHjVSk5JA+plcEGZqEG6jKR1T8tLhAL/QTM4
 GiJQYrfQO1EUUA+AS/qRiVRvRwkFMefakZGvxcTvGB7XP7gJHUp0+UbXOx4mTWB9Fg/YBd2L3
 GuTz6tdbDGQ6XnT1RnSgJG5+h4Un6GTnxaMZ59R/QQWnRcg+OrxavbAdd5RxqCJBaHN1tbj+W
 DswGSohHLMguepjIuf5f0PgMYF3M3IRd4kplOZjxWHPLBBEdKrAXvuPqSOhGHbVG/Yrxl67Sx
 tttEg/LC7jOmJRxR62GTBihlChzzD8dze3QeprEYqjyYeDShIDskOWlt1FbdExxnbum7vYDjv
 ChRxAQfpoCYI3nwLCUQ3+l6jqZRBphJQRzOeoslUKEqEujRLk4=
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
Cc: "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "leon@kernel.org" <leon@kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>,
 "nico@fluxnic.net" <nico@fluxnic.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Saeed Mahameed <saeedm@mellanox.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 4:52 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Thu, Apr 16, 2020 at 02:38:50PM +0200, Arnd Bergmann wrote:
> > On Thu, Apr 16, 2020 at 12:17 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > > Of course, this is all just talk until someone(tm) posts a patch
> > > actually making the change. I've looked at the kconfig tool sources
> > > before; not going to make the same mistake again.
> >
> > Right. OTOH whoever implements it gets to pick the color of the
> > bikeshed. ;-)
>
> I hope someone takes it up, especially now that imply, which
> apparently used to do this, doesn't any more :)

The old 'imply' was something completely different, it was more of a
'try to select if you can so we can assume it's there, but give up
if it can only be a module and we need it to be built-in".

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
