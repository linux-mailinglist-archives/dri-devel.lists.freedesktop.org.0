Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A01D1A9409
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE176E863;
	Wed, 15 Apr 2020 07:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C21E6E4E6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 13:29:02 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id x66so13089946qkd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=35JPFQoqu2n9cN3F6+ZUlaG1xiUip5sDdcTtmfYSpe8=;
 b=SGDVO9RhBeIKEvWxZM+JWkgmaml/HD1RGTWogUTjrp7mfpYcvQzhzvnQvuqqNth22N
 Rruj/VI4H3I+sFH0OMY7v28QPW7MuXUg2mASS1xE6j7UY02Vsml5mZ/Qw3RjVn6hM5sL
 91+i14Bcrzqhm6veEVFJKC4kDq6XPaCQMogswLGFbM3gHKAmva9nPlymq+fzZNGMon0d
 x8zpf/ituX5C+wfeuP6qyk4GEct1eoKycovq5kubVEQ6lMA/5i8wWni2DZtPa6Up9Ooi
 kYXcRlzmeiczsaiU0z/VZCQS1033PVmAEKoP0aAKyt6Q1y5kmS85rGIwGACP5nqbuo27
 H/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=35JPFQoqu2n9cN3F6+ZUlaG1xiUip5sDdcTtmfYSpe8=;
 b=bZgwbg36WQkGIS9MDR6fITZOf05LcXuRnjyW/4CfSGBlUKYBcfnor/I8MPGus0Xood
 tp/9LtD42mDfo4OpMpYw+uwbm2alKh30lPjeON+N08IxftpEc29icu3NcixMOi0o6Yz/
 MpxneORkJYsEMX11Z4bGOtfsm6g2NAzwPWXecTSKJtcId1hnQPB4SWxkIAZrBFG6JxbE
 yKIoZXOfSmHR3/1/82ZVI10og0qb/04vH8BYzsS+l7xPQ8iMG49hsimf+kOyNs+89L3y
 5VSqCY+OqwYP8lXc/iLTKHQmiVxfcLHkT49ZndUeV19m/zBIMmpM8OKU6cwx+AECBkUd
 qzzA==
X-Gm-Message-State: AGi0PubOe42kx4Rhec7u98u36jUSs+p8U1FK9TvcfWu+bSEYU/TwmaBV
 DkstgVixZdy5ljAJVYIJWziP3Q==
X-Google-Smtp-Source: APiQypIkNBlhG/qtn+tMNh1eYCoqf1FbWKttUwwrXZkT7Pr6J06H5IKbF/sYAPrVFKbZXZI1qCFvng==
X-Received: by 2002:a37:cc7:: with SMTP id 190mr6464058qkm.44.1586870941325;
 Tue, 14 Apr 2020 06:29:01 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id f1sm9986663qkl.91.2020.04.14.06.29.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Apr 2020 06:29:00 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jOLca-000515-3n; Tue, 14 Apr 2020 10:29:00 -0300
Date: Tue, 14 Apr 2020 10:29:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Saeed Mahameed <saeedm@mellanox.com>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
Message-ID: <20200414132900.GD5100@ziepe.ca>
References: <20200408202711.1198966-1-arnd@arndb.de>
 <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
 <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
 <20200408224224.GD11886@ziepe.ca> <87k12pgifv.fsf@intel.com>
 <7d9410a4b7d0ef975f7cbd8f0b6762df114df539.camel@mellanox.com>
 <20200410171320.GN11886@ziepe.ca>
 <16441479b793077cdef9658f35773739038c39dc.camel@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16441479b793077cdef9658f35773739038c39dc.camel@mellanox.com>
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
 "arnd@arndb.de" <arnd@arndb.de>, "leon@kernel.org" <leon@kernel.org>,
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
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 10, 2020 at 07:04:27PM +0000, Saeed Mahameed wrote:
> On Fri, 2020-04-10 at 14:13 -0300, Jason Gunthorpe wrote:
> > On Fri, Apr 10, 2020 at 02:40:42AM +0000, Saeed Mahameed wrote:
> > 
> > > This assumes that the module using FOO has its own flag
> > > representing
> > > FOO which is not always the case.
> > > 
> > > for example in mlx5 we use VXLAN config flag directly to compile
> > > VXLAN
> > > related files:
> > > 
> > > mlx5/core/Makefile:
> > > 
> > > obj-$(CONFIG_MLX5_CORE) += mlx5_core.o
> > > 
> > > mlx5_core-y := mlx5_core.o
> > > mlx5_core-$(VXLAN) += mlx5_vxlan.o
> > > 
> > > and in mlx5_main.o we do:
> > 
> > Does this work if VXLAN = m ?
> 
> Yes, if VXLAN IS_REACHABLE to MLX5, mlx5_vxlan.o will be
> compiled/linked.

So mlx5_core-m does the right thing somehow?

> > 
> > > if (IS_ENABLED(VXLAN))
> > >        mlx5_vxlan_init()
> > > 
> > > after the change in imply semantics:
> > > our options are:
> > > 
> > > 1) use IS_REACHABLE(VXLAN) instead of IS_ENABLED(VXLAN)
> > > 
> > > 2) have MLX5_VXLAN in mlx5 Kconfig and use IS_ENABLED(MLX5_VXLAN) 
> > > config MLX5_VXLAN
> > > 	depends on VXLAN || !VXLAN
> > > 	bool
> > 
> > Does this trick work when vxlan is a bool not a tristate?
> > 
> > Why not just put the VXLAN || !VXLAN directly on MLX5_CORE?
> > 
> 
> so force MLX5_CORE to n if vxlan is not reachable ? 

IIRC that isn't what the expression does, if vxlan is 'n' then 
  n || !n == true

The other version of this is (m || VXLAN != m)

Basically all it does is prevent MLX5_CORE=y && VXLAN=m

> and how do we compile mlx5_vxlan.o wihout a single flag 
> can i do in Makefile :
> mlx5_core-$(VXLAN || !VXLAN) += mlx5_vxlan.o ?? 

No, you just use VXLAN directly, it will be m, n or y, but it won't be
m if mlx5_core is y

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
