Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0586E1A7FBA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 16:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26AB6E142;
	Tue, 14 Apr 2020 14:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88FE6E142
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 14:28:00 +0000 (UTC)
Received: from mail-lj1-f172.google.com ([209.85.208.172]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MKszj-1jgiKx38cH-00LJ7B for <dri-devel@lists.freedesktop.org>; Tue, 14
 Apr 2020 16:27:58 +0200
Received: by mail-lj1-f172.google.com with SMTP id r24so12701586ljd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 07:27:58 -0700 (PDT)
X-Gm-Message-State: AGi0PuYSveXzitcKDgZFI3XNtjbCvO8ZMHSXmIJA8Lb9nGL6p2WkupYL
 EVy/r3ib9V1AyZtMN0NJevwJMPTxvnB3TX/WqL4=
X-Google-Smtp-Source: APiQypIehfRw4bnzZDiYQ9rbmdjkvSpz2iHh0P7VLnhHPaYn8R1IT4hVMubviwCCAbF8Hb+k1UqXmIWLLXlwy3kW8AM=
X-Received: by 2002:a2e:b446:: with SMTP id o6mr305063ljm.80.1586874477781;
 Tue, 14 Apr 2020 07:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200408202711.1198966-1-arnd@arndb.de>
 <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
 <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
 <20200408224224.GD11886@ziepe.ca> <87k12pgifv.fsf@intel.com>
 <7d9410a4b7d0ef975f7cbd8f0b6762df114df539.camel@mellanox.com>
 <20200410171320.GN11886@ziepe.ca>
 <16441479b793077cdef9658f35773739038c39dc.camel@mellanox.com>
 <20200414132900.GD5100@ziepe.ca>
In-Reply-To: <20200414132900.GD5100@ziepe.ca>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Apr 2020 16:27:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0aFQ7h4zRDW=QLogXWc88JkJJXEOK0_CpWwsRjq6+T+w@mail.gmail.com>
Message-ID: <CAK8P3a0aFQ7h4zRDW=QLogXWc88JkJJXEOK0_CpWwsRjq6+T+w@mail.gmail.com>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Provags-ID: V03:K1:21QfcfTzykPqDZaZCDjhRe+st86mk8Q3U8MfQl3+17dgJJypN1q
 qrAbw8dwQOnaI2Hpu75nVdOJ+puInxyzLYNGWbfXlhDuzdbBMKo1Nf/no/xUx6LET8w9Kbu
 Sgk/wvjLeLqaWlqnkGfU9fcJugvNFOItSogKezs/e/lIMIjAUcyp1EtjXvAXWU9EVFkf6Li
 R2Iayh99qCj7RCICfi74A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zm8AreIQrAU=:ZPAM45mDdRHhoVgEr7Y6QY
 10WhxTLi4j84EvzYesvAgJ0mR8YR142jP7FGHqydrLRUVtL1Jr90SIire0V9F+I1WiWo/2i1o
 fdbTzFndeCAxuP13qtoRNct2rQ1ucfTLkHrkNz2Z/lOCwIwrQ2jz7QuOdZEVwWxTwpb4ZGuyt
 uRq9F0jYM1I/iZ9k/6WweVrUW1sdAdGoLved46qTuC7ASn4TwRG4x9rfRdLQmdH98aBJJ1hIn
 NY2f2dGEGVA6sBtRDHeGhBuXYrIR/PoUlBZtIPFy4XXm4Apq1ntXTj44KfwewXnNN/Chc2Vpn
 cLIjHnBT58chZj0QsGF0HgRDuwS2ePviTJvGCqACj04OeEfZ9gtHVwoFw3SNKWKbOj6RdSAKZ
 RSNbEP5HQG77UfWWBGivZ4K+ojro6M4qBMREsTwbRq3PuIWRfjudyR3vsv2oI+ywgvzP6nK3k
 MEBSTgc5bjTH9Bm6GQHMLT+hJw0ILfTr1St/wsyTwj0dwPwGx5tCrkEps5pLIopM9TEeGVjFz
 ceWSi88kxoNJEXljCwYzp91BNElDfU8+Gclc9Hsk4lkUQ3fXFlGkpPLkS5F5zxF3St+n5tRa/
 +zY/EGBLnG2xdQYwTUOcF85A/eKmnxjPkTXpUe1FTEkLSH6J3/B34lg/7UCyIQio/PeRmJLWs
 9l9jdp8Mfn4SMSriC95zyKtYW+zy44LWbIVlJwxkOtemJJtgDw8/BSc3KhUeb+Tka5aK0ZvrO
 vOf6Gm1/WdSnbYvXVvz5XYOFLFspAP08vFo5HTDB/7H7Xeh8nLfWbcUeGqBmFRwKgz9i6weFV
 XF9BP0U77i3Y5/Lg2KpwtVVSRK0LWMRC56Qj8ffjJv2ubaefDo=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "leon@kernel.org" <leon@kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>,
 "nico@fluxnic.net" <nico@fluxnic.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Saeed Mahameed <saeedm@mellanox.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 3:29 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Fri, Apr 10, 2020 at 07:04:27PM +0000, Saeed Mahameed wrote:
> > On Fri, 2020-04-10 at 14:13 -0300, Jason Gunthorpe wrote:
> > > On Fri, Apr 10, 2020 at 02:40:42AM +0000, Saeed Mahameed wrote:
> > >
> > > > This assumes that the module using FOO has its own flag
> > > > representing
> > > > FOO which is not always the case.
> > > >
> > > > for example in mlx5 we use VXLAN config flag directly to compile
> > > > VXLAN related files:
> > > >
> > > > mlx5/core/Makefile:
> > > >
> > > > obj-$(CONFIG_MLX5_CORE) += mlx5_core.o
> > > >
> > > > mlx5_core-y := mlx5_core.o
> > > > mlx5_core-$(VXLAN) += mlx5_vxlan.o
> > > >
> > > > and in mlx5_main.o we do:
> > >
> > > Does this work if VXLAN = m ?
> >
> > Yes, if VXLAN IS_REACHABLE to MLX5, mlx5_vxlan.o will be
> > compiled/linked.
>
> So mlx5_core-m does the right thing somehow?

What happens with CONFIG_VXLAN=m is that the above turns into

mlx5_core-y := mlx5_core.o
mlx5_core-m += mlx5_vxlan.o

which in turn leads to mlx5_core.ko *not* containing mlx5_vxlan.o,
and in turn causing that link error against
mlx5_vxlan_create/mlx5_vxlan_destroy, unless the IS_ENABLED()
is changed to IS_REACHABLE().

> > > > if (IS_ENABLED(VXLAN))
> > > >        mlx5_vxlan_init()
> > > >
> > > > after the change in imply semantics:
> > > > our options are:
> > > >
> > > > 1) use IS_REACHABLE(VXLAN) instead of IS_ENABLED(VXLAN)
> > > >
> > > > 2) have MLX5_VXLAN in mlx5 Kconfig and use IS_ENABLED(MLX5_VXLAN)
> > > > config MLX5_VXLAN
> > > >   depends on VXLAN || !VXLAN
> > > >   bool
> > >
> > > Does this trick work when vxlan is a bool not a tristate?
> > >
> > > Why not just put the VXLAN || !VXLAN directly on MLX5_CORE?
> > >
> >
> > so force MLX5_CORE to n if vxlan is not reachable ?
>
> IIRC that isn't what the expression does, if vxlan is 'n' then
>   n || !n == true

It forces MLX5_CORE to 'm' or 'n' but not 'y' if VXLAN=m,
but allows any option if VXLAN=y

> The other version of this is (m || VXLAN != m)

Right, that should be the same, but is less common.

I later found that I also needed this one for the same
kind of dependency on PTP:

--- a/drivers/net/ethernet/mellanox/mlx5/core/Kconfig
+++ b/drivers/net/ethernet/mellanox/mlx5/core/Kconfig
@@ -7,7 +7,7 @@ config MLX5_CORE
        tristate "Mellanox 5th generation network adapters (ConnectX
series) core driver"
        depends on PCI
        select NET_DEVLINK
-       imply PTP_1588_CLOCK
+       depends on PTP_1588_CLOCK || !PTP_1588_CLOCK
        depends on VXLAN || !VXLAN
        imply MLXFW
        imply PCI_HYPERV_INTERFACE
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
