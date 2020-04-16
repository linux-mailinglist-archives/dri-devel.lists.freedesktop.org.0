Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B81AB9A2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60456EB1A;
	Thu, 16 Apr 2020 07:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEE96EB1A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 07:21:00 +0000 (UTC)
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MjjOl-1ixNuz2hT9-00lFfv for <dri-devel@lists.freedesktop.org>; Thu, 16
 Apr 2020 09:20:58 +0200
Received: by mail-qt1-f180.google.com with SMTP id c16so9876589qtv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 00:20:58 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ9y0/WhePNBoO7yIP/SXhnA0YN6JS3bGYzKyw+ol3iN1FHmbE8
 AF0V7fQGBl3818EKrh7z9QgsQxYtF4aZ+6ZkBP4=
X-Google-Smtp-Source: APiQypLki807vlF5rf3bUb/lMDePEthLpUaUBhHRg0/ZUfeGPkLYlO08Klb1Ee851xvIZfXGDxWFM30tec+bUhtYF5c=
X-Received: by 2002:ac8:6757:: with SMTP id n23mr12043843qtp.304.1587021657410; 
 Thu, 16 Apr 2020 00:20:57 -0700 (PDT)
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
 <CAK8P3a1-J=4EAxh7TtQxugxwXk239u8ffgxZNRdw_WWy8ExFoQ@mail.gmail.com>
 <834c7606743424c64951dd2193ca15e29799bf18.camel@mellanox.com>
In-Reply-To: <834c7606743424c64951dd2193ca15e29799bf18.camel@mellanox.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 16 Apr 2020 09:20:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Wx5_bUOKnN3_hG5nLOqv3WCUtMSq6vOkJzWZgsmAz+A@mail.gmail.com>
Message-ID: <CAK8P3a3Wx5_bUOKnN3_hG5nLOqv3WCUtMSq6vOkJzWZgsmAz+A@mail.gmail.com>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
To: Saeed Mahameed <saeedm@mellanox.com>
X-Provags-ID: V03:K1:5yfjy7iLdtWCjlg2JFdTSr6Ig7I2eW38Ge5byiktwIKwkpA54IB
 NfojU1VQC9H3jnzGIoeBm16eodYxhdzp1/qJDsCeXcvb1qXFcvge08qkSIpg7PBccBKvwUX
 33F4Gap6wT4NsAM1Razmaa2Oj/QjjEWlkgN48FkdX5qdMI4OyyA/+lmdnYdpqf0eJTW0CgU
 xAfR3XFa4U5Ntqzbo+y5w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kqFBDuXmrdI=:2SujjyFX6vbqqZcQU1l6Kt
 PVVTSKvjR+Nm1iG60BJvZH/yJ9JKfIkRXY46a0OPr9YKWdjEZBVzKPxe9B24YCH3d8B9qki6+
 8FbNm0doH5bIrcm6daJ0DenOr9KKOpaSfUpQM+HNQiOZo9XHK2jeJ5t/n9q/HtYxhP1ikC68w
 3p7IRvpXuRbCRl25NXB2/G93dSU2A/vUEK73mQp3Wqv9GFA7SCFbXm3QLe24zS6AsjiOCA6/Q
 nhPKYFU7X/TEsIXmB886rkf4X1EWAzvt6cEiaDFm2VGg5uTigl31kwIyl0Qs12YxzOsC02ovp
 3fyLXSDFh2qc8htOPAQ1t7xX3pgUnjmg/ytYfc6YIrnBqki8n5KPqzLe1wEoGWvwDNwDBEIap
 SBoLlexiQ/Ea7p2GsoP2Y1yvOvluIplTPazVwZsduuAkkk1a2QnJN/rz+6fnlTJoRMhdQ4/Lp
 Xy6cKcxfegtlC8oyy/alwplW889NR6it1NkAOWKdS4Q3oPJqML7uNeTrizPNqVhMxUgnghLMn
 m8p/f2w/JkDafavb9zP9oJfHOe2Tj/4xeYYS0ATgKatubjrgDHYbyp6wH8aw8VGTKAjj5UcOV
 t/nOL44p+DBRtWwSnHuxwvfOoCiA/sV47ALBIlMtq758//Xa28wQjKv5GHVW+T0SwLa7wDnX7
 kpiHerKleLo0uw1OWgheqLGZTCGomzg1R+fVdTsNx0B1VrYMLgc+UYEaj6oFs7wKTqQJ+e6Zh
 YBLPcn6iUQ6cMH7GT3fn0udBhvwkSKv9o2p/mmpHC6VvcfOjXe3P9mSelvkKOyoFVTa36PxaL
 VPHiZs+qd9Ym0TT9aX6rmuEZPFSaYYJ9Th+upko2EJ3PyI8ek4=
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
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jgg@ziepe.ca" <jgg@ziepe.ca>, "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 5:25 AM Saeed Mahameed <saeedm@mellanox.com> wrote:
>
> On Tue, 2020-04-14 at 20:47 +0200, Arnd Bergmann wrote:
> > On Tue, Apr 14, 2020 at 7:49 PM Saeed Mahameed <saeedm@mellanox.com>
> > wrote:
> > > On Tue, 2020-04-14 at 17:25 +0200, Arnd Bergmann wrote:
> > > > On Tue, Apr 14, 2020 at 5:23 PM Jason Gunthorpe <jgg@ziepe.ca>
> > > > wrote:
> > > > Correct.
> > > >
> > >
> > > Great !
> > >
> > > Then bottom line we will change mlx5/Kconfig: to
> > >
> > > depends on VXLAN || !VXLAN
> >
> > Ok
> >
>
> BTW how about adding a new Kconfig option to hide the details of
> ( BAR || !BAR) ? as Jason already explained and suggested, this will
> make it easier for the users and developers to understand the actual
> meaning behind this tristate weird condition.
>
> e.g have a new keyword:
>      reach VXLAN
> which will be equivalent to:
>      depends on VXLAN && !VXLAN

I'd love to see that, but I'm not sure what keyword is best. For your
suggestion of "reach", that would probably do the job, but I'm not
sure if this ends up being more or less confusing than what we have
today.

> > > This will force MLX5_CORE to m when necessary to make vxlan
> > > reachable
> > > to mlx5_core.  So no need for explicit use of IS_REACHABLE().
> > > in mlx5 there are 4 of these:
> > >
> > >         imply PTP_1588_CLOCK
> > >         imply VXLAN
> > >         imply MLXFW
> > >         imply PCI_HYPERV_INTERFACE
> >
> > As mentioned earlier, we do need to replace the 'imply
> > PTP_1588_CLOCK'
> > with the same
> >
> >          depends on PTP_1588_CLOCK || !PTP_1588_CLOCK
> >
> > So far I have not seen problems for the other two options, so I
> > assume they
> > are fine for now -- it seems to build just fine without
> > PCI_HYPERV_INTERFACE,
> > and MLXFW has no other dependencies, meaning that 'imply' is the
> > same as 'select' here. Using 'select MLXFW' would make it clearer
> > perhaps.
>
> No, I would like to avoid select and allow building mlx5 without MLXFW,
> MLXFW already has a stub protected with IS_REACHABLE(), this is why we
> don't have an issue with it.

So the 'imply MLXFW' should be dropped then?

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
