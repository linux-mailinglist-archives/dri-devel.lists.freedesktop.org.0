Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 491FB1A8A11
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D336E528;
	Tue, 14 Apr 2020 18:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7496E528
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:47:42 +0000 (UTC)
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MnagF-1ixN7J1cKz-00jZdz for <dri-devel@lists.freedesktop.org>; Tue, 14
 Apr 2020 20:47:40 +0200
Received: by mail-qt1-f172.google.com with SMTP id o10so11107123qtr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:47:40 -0700 (PDT)
X-Gm-Message-State: AGi0Pua+oFhXQmiWEbJgsyZqN7A4PKWpahT/7KVGByhZ34ryhAjpdxHP
 a6tTUXgr/aTWgB4jux848S4sro7ccXNRt7rxdNg=
X-Google-Smtp-Source: APiQypJkm7YK7DFcAXzV9bKRiTg4ndg9+lnP/bhAkYKcaZ1Yw17IqxDBvH++61J2ztireirhfyoBdFwDtwNvTt2Nro4=
X-Received: by 2002:ac8:d8e:: with SMTP id s14mr17254416qti.204.1586890059307; 
 Tue, 14 Apr 2020 11:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200408202711.1198966-1-arnd@arndb.de>
 <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
 <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
 <20200408224224.GD11886@ziepe.ca> <87k12pgifv.fsf@intel.com>
 <7d9410a4b7d0ef975f7cbd8f0b6762df114df539.camel@mellanox.com>
 <20200410171320.GN11886@ziepe.ca>
 <16441479b793077cdef9658f35773739038c39dc.camel@mellanox.com>
 <20200414132900.GD5100@ziepe.ca>
 <CAK8P3a0aFQ7h4zRDW=QLogXWc88JkJJXEOK0_CpWwsRjq6+T+w@mail.gmail.com>
 <20200414152312.GF5100@ziepe.ca>
 <CAK8P3a1PjP9_b5NdmqTLeGN4y+3JXx_yyTE8YAf1u5rYHWPA9g@mail.gmail.com>
 <f6d83b08fc0bc171b5ba5b2a0bc138727d92e2c0.camel@mellanox.com>
In-Reply-To: <f6d83b08fc0bc171b5ba5b2a0bc138727d92e2c0.camel@mellanox.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Apr 2020 20:47:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1-J=4EAxh7TtQxugxwXk239u8ffgxZNRdw_WWy8ExFoQ@mail.gmail.com>
Message-ID: <CAK8P3a1-J=4EAxh7TtQxugxwXk239u8ffgxZNRdw_WWy8ExFoQ@mail.gmail.com>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
To: Saeed Mahameed <saeedm@mellanox.com>
X-Provags-ID: V03:K1:uWFIKG04Xq6VSKkymkfkLqAQ2QE/FmId7R7+TXy0R1bYPpZfPuQ
 Qgu9/Kc7EX6PiF7kftJOMFLIbx80dLV+I9ogsrtiKb2jTq2F4Y9MillkJiC23qY/IbEGe5Z
 9Vgiuo6XE4YD/ONEh4Zf8/HQAU/F+KsAtWX5cz3z8m/GamYT+QpX0gSoW05bSdhlCiIzdkw
 p2/FteKTXq/gXJz3uHpNw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QHWqk9K0hyU=:Fo/4oeilijcBmGre/y+Xa3
 NzM6yhP266UHgMOBO3Q9ZrVHgyJJJaBnNOoC11951row8fb8N2vjOHmeHIxXIu0Y4Zsvx5qTo
 4CRS3FSZZxClXd7pZ6i/JMaif3gKbNLKtI4xHOUZazv2ufyd3Z2PmxzuORUATPzMKP7jnNOV0
 /b5jX8DMgAiXPW4cw0Wx1zNOREFsPnz7MSBMKhxabEYTWxrH0ev27xnDW4Bj1XMGPXoBB0xdg
 iHma7b8x2TPlcQ2qZ1Jx7svaPJDVwZ37uFqjikizaxcLY7bNt9aKorptBohpYk1xmTRAaxqu3
 urd5C0/rgBt48Y8hJUT1z5MtE8v6CNiu4woWUrKsfDzDk0gvdGJw1kvwMoRimYFLm4SE7FWI0
 OOVkr8XKPW9e6zZ/H30SmJadas87gNmZ9SvyljfjL6vE6eQ6gRq8pkBPY4/YmMeiYn4VArAoY
 l2s/mqHKwn/izmf8vMlfYVtaWyzIMQnfgc0Kzsh8ZCylqZWeIJNPl52SRir2gGYB3evYx2rgl
 n0st0gMdniAV4Xbg+i1wOPhmLsChGXTn4d3usNv821atrESu7WqNHGM2zBUCG4EGMCq6G3Ly3
 7q9TbSWvdWgRJtC+7qsbBWS1WG9V7deyFq9nBkYEYRmnd2lhs3lqGgAh+YRDI9BRYGBtwl13q
 Vcbzh1r6+uWwu9r/lD+N61Xz8METm8m+xUlrUvUEaADnKEhdQD5qo+ZDCoDOM6h35I/TyNgfB
 n3Wf7zfBMZA6ciCpWCvVukBp+lLk+sBF4HbQuQhXMZ/Yf4LkQEOqHY34fxRm2nUe1SYQdKMTv
 ZLlptX9+nlrZNp7vUg/GiJU2uPZwLiSHIJxqKjwILIZXHoqhcU=
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
 "jgg@ziepe.ca" <jgg@ziepe.ca>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 7:49 PM Saeed Mahameed <saeedm@mellanox.com> wrote:
> On Tue, 2020-04-14 at 17:25 +0200, Arnd Bergmann wrote:
> > On Tue, Apr 14, 2020 at 5:23 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > Correct.
> >
>
> Great !
>
> Then bottom line we will change mlx5/Kconfig: to
>
> depends on VXLAN || !VXLAN

Ok

> This will force MLX5_CORE to m when necessary to make vxlan reachable
> to mlx5_core.  So no need for explicit use of IS_REACHABLE().
> in mlx5 there are 4 of these:
>
>         imply PTP_1588_CLOCK
>         imply VXLAN
>         imply MLXFW
>         imply PCI_HYPERV_INTERFACE

As mentioned earlier, we do need to replace the 'imply PTP_1588_CLOCK'
with the same

         depends on PTP_1588_CLOCK || !PTP_1588_CLOCK

So far I have not seen problems for the other two options, so I assume they
are fine for now -- it seems to build just fine without PCI_HYPERV_INTERFACE,
and MLXFW has no other dependencies, meaning that 'imply' is the
same as 'select' here. Using 'select MLXFW' would make it clearer perhaps.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
