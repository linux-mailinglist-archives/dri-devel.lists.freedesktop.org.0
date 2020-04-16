Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C018F1AC171
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 14:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7096E047;
	Thu, 16 Apr 2020 12:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76516E047
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 12:39:09 +0000 (UTC)
Received: from mail-lj1-f171.google.com ([209.85.208.171]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MBmDy-1jWo5P33LY-00CBfx for <dri-devel@lists.freedesktop.org>; Thu, 16
 Apr 2020 14:39:07 +0200
Received: by mail-lj1-f171.google.com with SMTP id u6so6024749ljl.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 05:39:07 -0700 (PDT)
X-Gm-Message-State: AGi0PuapKd6JyA+shRz4ogiZoA9H/u3cavNE2pSOxMAf9tE/E1iHEBpZ
 //M5Uj+nqRfpTnZiIPhOJazuDxJnL7dApLKBqVo=
X-Google-Smtp-Source: APiQypJBjKSJ60PBcmBCW4rJUa3iEMj8puJUFjtDtgFXYZenSiZo1kQ7qfLc3ugSe7HBLKnPyUhQlFliM3tyUpQ3SD4=
X-Received: by 2002:a2e:6a08:: with SMTP id f8mr6773388ljc.8.1587040747110;
 Thu, 16 Apr 2020 05:39:07 -0700 (PDT)
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
 <CAK8P3a3Wx5_bUOKnN3_hG5nLOqv3WCUtMSq6vOkJzWZgsmAz+A@mail.gmail.com>
 <874ktj4tvn.fsf@intel.com>
In-Reply-To: <874ktj4tvn.fsf@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 16 Apr 2020 14:38:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1S2x1jnx9Q5B22vX8gBHs0Ztu-znA9hqZ5xp5tRAykGg@mail.gmail.com>
Message-ID: <CAK8P3a1S2x1jnx9Q5B22vX8gBHs0Ztu-znA9hqZ5xp5tRAykGg@mail.gmail.com>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Provags-ID: V03:K1:DmQM9zjp7ilcUF9kNZg38Y0y+umA332zjMWm6AXYpDqpy8Gumzb
 aOT6sKSZUYOGwAPyaxaJwQh3bWnLyILHujzTsZtUy/p75666R1h3EGo5Veug73Uy6uefFaM
 HkaCguDdg4YR8zsYcfxh+f7OBlH5k84JOWMfDhkhIatNxtJhyPQTU/UD25MQPupjEc89C5w
 3BLHrWXZ720zqgFpuheoQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:leC4bSib19E=:qMwQ46Owtcb0adDuS1AMmI
 d/+/6FP1xVCwScODWBHl/DUbgVe9gcs+0h75UoZ5w1UmgVaaHgi90yVsLyomYu2vkie4eiihs
 u/uxLQaJmrN/tUyJ0V/u/G56Xa5T7LpOuzgiRfvWnhl2XgcRRWGsyp4cIjzgK42R83eY8bp/u
 NkZKvS1F/f3thtRMf7etdjMk49FDyqUHoSwt3diHQ4wUneywa/f/1q5LuTYbZHQBaUJW3mOy9
 IHx1CJokkg/Y+7CfD7XUTz7WfYjb2XT/u5Bwv+7UrcrvNdEYC9zEeY0jTEP1LvNHDbDeJvjXb
 CYNdDjy87AEDqVUdpGaXV66ak3VyOYdDQ5uyZsV6Yf/LVptxwHddX7j4Z8GlMGSYNJVL4vRfn
 xDcRXvmxCKBz3R7sSTxpVDz3ETKiX+hLJ7N3ULJkxnaQMa5kq9WZD5qwrBZGO9XblgyVnrwQo
 NzJgUYF7qWv4aZGsaYTT7MNOZa5XIC7ZzjN8ZyP6YUbb8zb8MjbpN1L4L2TJ5EqSdOLibIX/v
 LFFR7AfLk2NHxxsKaJAliaFqqNCp4nV0k2fToaYoMkmZHNR+ldHdB4QxQ2PIum0A1m8NV3g71
 8iGKZKez10jC6urUc3hx0XqXmsjVhIqi+R7ZTMm9bn10zvIvwRuAc0om4Ij6+zHa7AMEvaAK2
 SnDWbM+EgQwzzUcMjcO+2COfSsu6njYEoCSVmhFFk35FIKZsdrrr3X7zqFBfJQJ9ySghGYbuW
 2ZgzagoZWx7OSKTFUj3aBCPemfMPti/nzULVfss82Ke5Mq1RgW9BxcNYts1wixA23ZL7D6/Ae
 5ANfA/z3nmHxRpATn71k4T1XLykMxdY+hFL8s464y1263eKxGk=
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
 "jgg@ziepe.ca" <jgg@ziepe.ca>, "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 12:17 PM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
>
> On Thu, 16 Apr 2020, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thu, Apr 16, 2020 at 5:25 AM Saeed Mahameed <saeedm@mellanox.com> wrote:
> >> BTW how about adding a new Kconfig option to hide the details of
> >> ( BAR || !BAR) ? as Jason already explained and suggested, this will
> >> make it easier for the users and developers to understand the actual
> >> meaning behind this tristate weird condition.
> >>
> >> e.g have a new keyword:
> >>      reach VXLAN
> >> which will be equivalent to:
> >>      depends on VXLAN && !VXLAN
> >
> > I'd love to see that, but I'm not sure what keyword is best. For your
> > suggestion of "reach", that would probably do the job, but I'm not
> > sure if this ends up being more or less confusing than what we have
> > today.
>
> Ah, perfect bikeshedding topic!
>
> Perhaps "uses"? If the dependency is enabled it gets used as a
> dependency.

That seems to be the best naming suggestion so far

> Of course, this is all just talk until someone(tm) posts a patch
> actually making the change. I've looked at the kconfig tool sources
> before; not going to make the same mistake again.

Right. OTOH whoever implements it gets to pick the color of the
bikeshed. ;-)

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
