Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642E51AD692
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13E06E372;
	Fri, 17 Apr 2020 06:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48B36EA5A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 18:21:08 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id q31so2500693qvf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 11:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VBxNtn9uLGeSV22Vl2rB9fJP9oTr50J1UVIxL3T4SdQ=;
 b=AQM7h/guHIikQc6/ALmkgldpqSxx+vukOeOKH25qjbdAYokggloytSCSv3uQiNoab+
 kmCq0lgWRHsHhVXS/p/KuNMYHolqBV1lhCIlnfGP0GtGI/Hyrk9GYCsTpTg9E5SwNOX9
 r7oJF9IbgXygTuDOFxNChu/pX0xNIVcW5M88scZItWJNAHP2v3Q0QliUjLxhlWDActcy
 9twFPmO0K9ytT7V+3c9bR+pUOvNs0I0vnxODnP+il1jO3CGGGBnZWWeVC9kw3elxN3BO
 n+hwJeISZ+kUhd4+QGbmgmQa7fq/FNoQWDw7NlBGiTqRrxMCsVKSTdQXj0vKEpJVbcYm
 IvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VBxNtn9uLGeSV22Vl2rB9fJP9oTr50J1UVIxL3T4SdQ=;
 b=REkC9Dk0xfIUOxEHRTJonixBval92TzYrLXt/5N/Twg218+Y30rb6MtmT8iarToksQ
 VlFaYHbozLz1fefDCYWRi4LrB9LnDNOP1zGTzQgk+2EjaJc5vuiJRKxzi6e2dLhiA1sX
 dMeaQwpaxnOm7Il6yoox9qyU9IZcGhJxtc7WEUXsFJqn20M4ky6M3hz41EDaEmWZ+3cU
 C1JHmOQoFXVF6+nWW59fmn42Jb8XHAgOQF0RxqVMnENgc4j6h4VJXZkYd714GPK7edPh
 xas6OEbyDaU+QNhrtR4mEr4oy1o2mr/pVZK1EGNekfwWviNZtFpk/e46DKtnLzzEstOx
 pHDQ==
X-Gm-Message-State: AGi0PuZAw6ztLEg3QdxUsrjeQRZHkVkQBxnvyBtGS+gyC/769rXI+GAr
 R6937h37ILvfvVPg2jx0Vad4gA==
X-Google-Smtp-Source: APiQypLv85/ivbA+DcFrwvD4zHlx16bJI6Zu4b9MTnY51aBljq0lYBh1Gg7Hao613nl9Rg4XGDGzhQ==
X-Received: by 2002:a05:6214:173:: with SMTP id
 y19mr11502093qvs.106.1587061268006; 
 Thu, 16 Apr 2020 11:21:08 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id s15sm16363679qtc.31.2020.04.16.11.21.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 Apr 2020 11:21:07 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jP98M-0006MB-Uj; Thu, 16 Apr 2020 15:21:06 -0300
Date: Thu, 16 Apr 2020 15:21:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
Message-ID: <20200416182106.GX5100@ziepe.ca>
References: <CAK8P3a0aFQ7h4zRDW=QLogXWc88JkJJXEOK0_CpWwsRjq6+T+w@mail.gmail.com>
 <20200414152312.GF5100@ziepe.ca>
 <CAK8P3a1PjP9_b5NdmqTLeGN4y+3JXx_yyTE8YAf1u5rYHWPA9g@mail.gmail.com>
 <f6d83b08fc0bc171b5ba5b2a0bc138727d92e2c0.camel@mellanox.com>
 <CAK8P3a1-J=4EAxh7TtQxugxwXk239u8ffgxZNRdw_WWy8ExFoQ@mail.gmail.com>
 <834c7606743424c64951dd2193ca15e29799bf18.camel@mellanox.com>
 <CAK8P3a3Wx5_bUOKnN3_hG5nLOqv3WCUtMSq6vOkJzWZgsmAz+A@mail.gmail.com>
 <874ktj4tvn.fsf@intel.com>
 <CAK8P3a1S2x1jnx9Q5B22vX8gBHs0Ztu-znA9hqZ5xp5tRAykGg@mail.gmail.com>
 <nycvar.YSQ.7.76.2004161106140.2671@knanqh.ubzr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.2004161106140.2671@knanqh.ubzr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "leon@kernel.org" <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Saeed Mahameed <saeedm@mellanox.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 11:12:56AM -0400, Nicolas Pitre wrote:
> On Thu, 16 Apr 2020, Arnd Bergmann wrote:
> 
> > On Thu, Apr 16, 2020 at 12:17 PM Jani Nikula
> > <jani.nikula@linux.intel.com> wrote:
> > >
> > > On Thu, 16 Apr 2020, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Thu, Apr 16, 2020 at 5:25 AM Saeed Mahameed <saeedm@mellanox.com> wrote:
> > > >> BTW how about adding a new Kconfig option to hide the details of
> > > >> ( BAR || !BAR) ? as Jason already explained and suggested, this will
> > > >> make it easier for the users and developers to understand the actual
> > > >> meaning behind this tristate weird condition.
> > > >>
> > > >> e.g have a new keyword:
> > > >>      reach VXLAN
> > > >> which will be equivalent to:
> > > >>      depends on VXLAN && !VXLAN
> > > >
> > > > I'd love to see that, but I'm not sure what keyword is best. For your
> > > > suggestion of "reach", that would probably do the job, but I'm not
> > > > sure if this ends up being more or less confusing than what we have
> > > > today.
> > >
> > > Ah, perfect bikeshedding topic!
> > >
> > > Perhaps "uses"? If the dependency is enabled it gets used as a
> > > dependency.
> > 
> > That seems to be the best naming suggestion so far
> 
> What I don't like about "uses" is that it doesn't convey the conditional 
> dependency. It could be mistaken as being synonymous to "select".
> 
> What about "depends_if" ? The rationale is that this is actually a
> dependency, but only if the related symbol is set (i.e. not n or empty).

I think that stretches the common understanding of 'depends' a bit too
far.. A depends where the target can be N is just too strange.

Somthing incorporating 'optional' seems like a better choice
'optionally uses' seems particularly clear and doesn't overload
existing works like depends or select

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
