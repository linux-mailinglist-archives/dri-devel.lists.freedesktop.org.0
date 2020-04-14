Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE211A82A2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 17:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2A0897FD;
	Tue, 14 Apr 2020 15:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20FD897FD
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 15:25:58 +0000 (UTC)
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mc02Z-1iqQ8p2jzb-00dSpq for <dri-devel@lists.freedesktop.org>; Tue, 14
 Apr 2020 17:25:56 +0200
Received: by mail-qt1-f170.google.com with SMTP id o10so10417125qtr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 08:25:56 -0700 (PDT)
X-Gm-Message-State: AGi0PuaerHgU4c8eN8t1mhHrDFYLMLSJfjjNa6VzNqWue+YdNWNsFCWL
 IcJzKXttnkz1eZYcLwpn2p6OOeiodnIqVrWNOpA=
X-Google-Smtp-Source: APiQypL2bnXf86E03hawsz8pxDqc8oMdZRSmBA+dTNzneuRbxAzCaV1aI5lbgXSqxBtoHIjMy0g/toQKbqbs9h0eD6I=
X-Received: by 2002:aed:20e3:: with SMTP id 90mr16307053qtb.142.1586877955579; 
 Tue, 14 Apr 2020 08:25:55 -0700 (PDT)
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
In-Reply-To: <20200414152312.GF5100@ziepe.ca>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Apr 2020 17:25:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1PjP9_b5NdmqTLeGN4y+3JXx_yyTE8YAf1u5rYHWPA9g@mail.gmail.com>
Message-ID: <CAK8P3a1PjP9_b5NdmqTLeGN4y+3JXx_yyTE8YAf1u5rYHWPA9g@mail.gmail.com>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Provags-ID: V03:K1:xZ1x9Ie/RuXD47U0TswgA8+JaNcPyVCIuo1WbtTu1VwQCvRxY3o
 +DrY8lFoyNHurRiUS38xaFxmu+k7GEEf7milomMQit14KFTGfg9ZhwTLk2p74dlvvEBo1UO
 jpEWOEMr/o/SljYYgtZRXT7aRh0p4vKjMz1DKo9NiQmni7LYW/0mGrRC95/Sp9QdASnKbRD
 FfAxragqaLErznHvoy0Bg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9+f6+jBDzPI=:d+T/IvRxAOwG4qA2PSNoIP
 ToK476Dsaj/wSRR1LJ0pSFcDHDOrndz3mVKPZ9cE8GwG75iEC4NZ00k5YP+Vbzmn0P+esKYoX
 QgizZtvu0kM+zpM/d+bCpRU3i+5Vb7qqAjuWCF+cmt1Qn44VYCOm5yh6yyR02N2NiBaNblBQ/
 DDsyoRMsXTqhZDXbnfEXA2ID7HupB3HHX68BIGFc/Di6XQlG8kXrqCc5ucymyS6Os1hJ0Ua/c
 pyF2YtSXgvNz1ogPfxrFJRn9yoMy9qbDot6EQGDfOoQTc4forNFpLDAIZniS+6HINOavBFz7q
 Gt8ZswCIERCJ+fp01PFiQP7wc6UQJrVqywq/kHyi+Ak2nXW/Ho5/uWeV4dPXkxPjiYL7Xsvg8
 P6EiVs4uiBD/KSzodIjKd6m0SbUUE2KmyM9ozbT8QSjsdRRr9qj3GZQfpxTRZptckerROq3hp
 cmdTDrrcFdyzp/6fJHH+0/1D0BHabVggDk5TmfvBd9v/NNGNdsG1qBigCZ65u1rRs5eRdeUqk
 u9eXAkF/6UqL+2BvuF+AHZrzIPJu3A0wDRpDUzMUofqeB1ZrgBfhlYPBsh0qS/8JuaoqDKrKH
 4TsO44bdMIzUPgawltHYVw4imXOKgy8pg7VmC5SE2Dy2jQfTTTCAqrdCqL5YGoKuPjv5Lfnu9
 ffqp/rU3+/6bEkMezNOQPK9bz89FbRMw7XrzVqbuSy3DamVA065IAchjZUO0mmDIiOUI7NacT
 KNu9u/khG3/MKv0ZM2YGgynvIluvHSeE6ws5zRnzYvLSGXaRaNCvvVPC70Hlw+fysdtii8rA/
 tgkuken4Tu8dIMUqza6Ftkv/jn8NtvkYRuURm86Hw+5LZQB3GY=
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

On Tue, Apr 14, 2020 at 5:23 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Apr 14, 2020 at 04:27:41PM +0200, Arnd Bergmann wrote:
> > On Tue, Apr 14, 2020 at 3:29 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > On Fri, Apr 10, 2020 at 07:04:27PM +0000, Saeed Mahameed wrote:
> > which in turn leads to mlx5_core.ko *not* containing mlx5_vxlan.o,
> > and in turn causing that link error against
> > mlx5_vxlan_create/mlx5_vxlan_destroy, unless the IS_ENABLED()
> > is changed to IS_REACHABLE().
>
> What about the reverse if mlx5_core is 'm' and VLXAN is 'y'?
>
>  mlx5_core-m := mlx5_core.o
>  mlx5_core-y += mlx5_vxlan.o
>
> Magically works out?

Yes, Kbuild takes care of that case.

> > > IIRC that isn't what the expression does, if vxlan is 'n' then
> > >   n || !n == true
> >
> > It forces MLX5_CORE to 'm' or 'n' but not 'y' if VXLAN=m,
> > but allows any option if VXLAN=y
>
> And any option if VXLAN=n ?

Correct.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
