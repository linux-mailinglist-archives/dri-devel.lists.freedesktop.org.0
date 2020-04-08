Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B1B1A2AA3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 22:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A93C6EAFD;
	Wed,  8 Apr 2020 20:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70196EAFD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 20:50:07 +0000 (UTC)
Received: from mail-qt1-f179.google.com ([209.85.160.179]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MpUlO-1ix49y0PQC-00puUK for <dri-devel@lists.freedesktop.org>; Wed, 08
 Apr 2020 22:50:06 +0200
Received: by mail-qt1-f179.google.com with SMTP id x2so1110899qtr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 13:50:05 -0700 (PDT)
X-Gm-Message-State: AGi0PuZZzq0V31wjy5WTqdlISzuy59w9d6nu1Iih8hX3DcaWWktkSth5
 a03VKyLoSVl4erlOKGbO6KhEYo5pMfBiD1yfIiQ=
X-Google-Smtp-Source: APiQypIP5yghqg/2MrWIAF2lP5PX73f0nNW4IRcRHBZR7UjH98P/p+NK0Mdk7nj6cOkNVhU/171r9JSmuzucI6UHA5Q=
X-Received: by 2002:ac8:12c2:: with SMTP id b2mr1560498qtj.7.1586379004961;
 Wed, 08 Apr 2020 13:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200408202711.1198966-1-arnd@arndb.de>
 <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Apr 2020 22:49:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
Message-ID: <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
To: Nicolas Pitre <nico@fluxnic.net>
X-Provags-ID: V03:K1:jbTYwSHJ8UEmXDuTJ38v5RxVn7W3R+LKaVpPk8uYYiQ7elkb2Nt
 TLJgQu1tvMl3NKiJs/l9RdRamFGY5dT30SFmdMCPIOIHQWzPHxtejZ7wjvqmlYRHw1wHFgb
 iG+m2FHkBeXXY9BjH6yGJm3Hb+xFp0gbw+0olWROvKHHuLFJeKvHAtbuXlBUm63Swy1v5Lw
 vwvluU3ze5HPbNqpig9sg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vbt7NN+bK68=:BOZ0Z0vKdiT34r7QXGQcrs
 9+NTd4PbdEaMXeI7pepVqKsB0YR79xkoU13A3ULdWyRtzB2hUMbG7mM1+qkkkkSN6EAoj//L4
 2z0RSdAki7ULn1Zx6ahQjaqN+0h6rVglHP7VZWlAorj/4wxt9XfnboTbtvGnGSVTjjhhiGLYm
 bFFkKK1b/OOEi6kr8j/nyuhIqa2UDvP57/2VhBtKiVV8r5T+JVEgoXSfkp2Qf0svBmKRbmSqF
 ecB1PRd3kOSWwqSnwp1mvZ9TekxDQ1ClDfrHV2OX8qnt3IvtW77AoHLZotvNqRpQ+TxkdDqGq
 zS2rdksOk83de0kz/HX4MGmz+oR3bXdHiOYQ7tz2j8qvD/0IjPYX7xWsR2VXWovHvE3TukWvQ
 OFLEu6GwXufpzYCz4tL6CvS0EruTgRjdQ+d1DEGmaWCNmENZQPu7ZxOIbRPzrrN0dqG2FYJOy
 SDPN9upAH6ShMGAa0aR8x75c3oKIBOUAkLJU+Id7sPKMtkvjqytOdd9RxySU58KWRCeeRi7b8
 zauLOWCYzVa4phYW+WzQOZx4LH+PmI7IHzx8Yx86/JgKhWHexq1Vq2fx82svyNdlnxHVsxhSV
 w6YR6cSr32e9RvlRSdIBlNTB8vejyFlEsxk4xAOVvFJBmtqiwjZuLI2KjZo77NZipXCwUoWdU
 pN7FcMJ5SP6TwibvQZlOEpy0vIfORLU6TxpGDtJJsfuA6GcpjCz4T1XEBTp2EcE+wsF7CdNsr
 hhdQ+gTEgcCLTlxr7assF6mMitHWf+hJBt0YAzCTWvdzo6XS3Vy0ilbXFA/q/DREe94fRmgru
 4herof6H7wl0ExFLCwqlB1PIhMGF9RfYvXkYg5DSEyTPgYO5lI=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Leon Romanovsky <leon@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Networking <netdev@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Saeed Mahameed <saeedm@mellanox.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 8, 2020 at 10:38 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> On Wed, 8 Apr 2020, Arnd Bergmann wrote:
> > I have created workarounds for the Kconfig files, which now stop using
> > imply and do something else in each case. I don't know whether there was
> > a bug in the kconfig changes that has led to allowing configurations that
> > were not meant to be legal even with the new semantics, or if the Kconfig
> > files have simply become incorrect now and the tool works as expected.
>
> In most cases it is the code that has to be fixed. It typically does:
>
>         if (IS_ENABLED(CONFIG_FOO))
>                 foo_init();
>
> Where it should rather do:
>
>         if (IS_REACHABLE(CONFIG_FOO))
>                 foo_init();
>
> A couple of such patches have been produced and queued in their
> respective trees already.

I try to use IS_REACHABLE() only as a last resort, as it tends to
confuse users when a subsystem is built as a module and already
loaded but something relying on that subsystem does not use it.

In the six patches I made, I had to use IS_REACHABLE() once,
for the others I tended to use a Kconfig dependency like

'depends on FOO || FOO=n'

which avoids the case that IS_REACHABLE() works around badly.

I did come up with the IS_REACHABLE() macro originally, but that
doesn't mean I think it's a good idea to use it liberally ;-)

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
