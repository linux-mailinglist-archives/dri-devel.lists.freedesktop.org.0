Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C791A9407
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FEA6E857;
	Wed, 15 Apr 2020 07:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB9589A9A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 15:23:14 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id s3so4326401qvk.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mFojnywoPNyFdhtgvXnmkYzEiNUOhwI6TxTxAvK3xdg=;
 b=SS4y0WhvQF1bhRQ3pn3wLMCiWkfm25jaLNJNqFQ3AGdG5Ie+8aNc3U9tGocHDfSWTi
 nP+oDC2NmQXii1RTPcUNQIL8gVaiNDH9qzhRCfQwRsuSwl/EmmYHOIZ9KjxJur5xTeSL
 7Vjbus/zWtsfWnZ8bBIMSrZuDZ0y/TqLZ0QIUfvodRUt9yC0QUXhZMc9fdqbHI2yoa6K
 w1ySea+kHv4r8Ugu79ALt3mtAd1B/Ihd2AamFw/3d/AtK6QauU6u7ZaiyS4j+fQmNDwy
 EDJOBUhMExnxLYWwN9HQ1rqa8gZ/OgdahR8fmY45lXLkUx5Vq8b+XdpMp0OL1rfhdNWu
 ti+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mFojnywoPNyFdhtgvXnmkYzEiNUOhwI6TxTxAvK3xdg=;
 b=pBkkS/6RIXs4J5+v682i5C1A6DPfE3vscf/h2Ksy1xXy6h+3rVzNZNFLCWt4QvhlpT
 R49bXeeNd+MeKTR32BVQ/pkPqBD3mVvqzDnw1XZlCXEajidfvWckEJyTeM1QwunYcSaw
 zFhVgWp+h4H15nhVahtvpQ1pRVGBpq6tU9eg+7PMDW9GfMrtGoIa7tAzMO9QOdn4rC/j
 7mkWLYKnLiQj0bNh8+KnfLY1aFTEvWT5n5G8yXjBS2ZCg8OYE9YUFoloRrCyj+GEbd15
 bDBrAlMCdrrEvdFWlxXEp81OQnvrL304z6kjESeEwbyW8IYAYI31xp8zj0obcWqFs3cs
 9fDw==
X-Gm-Message-State: AGi0PuZzt7PtbM05WpRKSwbJ6r9JX0oYChlpHqgxQQEJoarzKAqXD9+g
 cTLvzae6vKjDMafktzacWeAuxw==
X-Google-Smtp-Source: APiQypKtItLidlBv85QFnpoyu7Va9Voe4R7MeN23XgRqelBoPM+HtCP/PCBCt2N7ezfG4+eyRUxTjA==
X-Received: by 2002:a0c:ac48:: with SMTP id m8mr509910qvb.13.1586877793898;
 Tue, 14 Apr 2020 08:23:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id m11sm10391993qkg.130.2020.04.14.08.23.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Apr 2020 08:23:13 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jONP6-0005EN-Cy; Tue, 14 Apr 2020 12:23:12 -0300
Date: Tue, 14 Apr 2020 12:23:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
Message-ID: <20200414152312.GF5100@ziepe.ca>
References: <20200408202711.1198966-1-arnd@arndb.de>
 <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
 <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
 <20200408224224.GD11886@ziepe.ca> <87k12pgifv.fsf@intel.com>
 <7d9410a4b7d0ef975f7cbd8f0b6762df114df539.camel@mellanox.com>
 <20200410171320.GN11886@ziepe.ca>
 <16441479b793077cdef9658f35773739038c39dc.camel@mellanox.com>
 <20200414132900.GD5100@ziepe.ca>
 <CAK8P3a0aFQ7h4zRDW=QLogXWc88JkJJXEOK0_CpWwsRjq6+T+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0aFQ7h4zRDW=QLogXWc88JkJJXEOK0_CpWwsRjq6+T+w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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

On Tue, Apr 14, 2020 at 04:27:41PM +0200, Arnd Bergmann wrote:
> On Tue, Apr 14, 2020 at 3:29 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Fri, Apr 10, 2020 at 07:04:27PM +0000, Saeed Mahameed wrote:
> > > On Fri, 2020-04-10 at 14:13 -0300, Jason Gunthorpe wrote:
> > > > On Fri, Apr 10, 2020 at 02:40:42AM +0000, Saeed Mahameed wrote:
> > > >
> > > > > This assumes that the module using FOO has its own flag
> > > > > representing
> > > > > FOO which is not always the case.
> > > > >
> > > > > for example in mlx5 we use VXLAN config flag directly to compile
> > > > > VXLAN related files:
> > > > >
> > > > > mlx5/core/Makefile:
> > > > >
> > > > > obj-$(CONFIG_MLX5_CORE) += mlx5_core.o
> > > > >
> > > > > mlx5_core-y := mlx5_core.o
> > > > > mlx5_core-$(VXLAN) += mlx5_vxlan.o
> > > > >
> > > > > and in mlx5_main.o we do:
> > > >
> > > > Does this work if VXLAN = m ?
> > >
> > > Yes, if VXLAN IS_REACHABLE to MLX5, mlx5_vxlan.o will be
> > > compiled/linked.
> >
> > So mlx5_core-m does the right thing somehow?
> 
> What happens with CONFIG_VXLAN=m is that the above turns into
> 
> mlx5_core-y := mlx5_core.o
> mlx5_core-m += mlx5_vxlan.o
> 
> which in turn leads to mlx5_core.ko *not* containing mlx5_vxlan.o,
> and in turn causing that link error against
> mlx5_vxlan_create/mlx5_vxlan_destroy, unless the IS_ENABLED()
> is changed to IS_REACHABLE().

What about the reverse if mlx5_core is 'm' and VLXAN is 'y'?

 mlx5_core-m := mlx5_core.o
 mlx5_core-y += mlx5_vxlan.o

Magically works out?

> > IIRC that isn't what the expression does, if vxlan is 'n' then
> >   n || !n == true
> 
> It forces MLX5_CORE to 'm' or 'n' but not 'y' if VXLAN=m,
> but allows any option if VXLAN=y

And any option if VXLAN=n ?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
