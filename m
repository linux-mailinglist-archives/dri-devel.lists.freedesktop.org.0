Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22121AD682
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF836E343;
	Fri, 17 Apr 2020 06:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0425B6E223
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:13:04 +0000 (UTC)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 2C30CCCAF9;
 Thu, 16 Apr 2020 11:13:02 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=EmCc83cGpH1PK+OmfXhUEjWC8ds=; b=aVQ7ou
 3WqM0s3ghVtQuQ+FnbxizM2oeosiePh15ekPxSOpZ5O+u89PgTaFwE+kQfwwhh25
 emmYOPZ6Wl2UWxq/FnmZHkgixpcMfM6nOkqGfWOK7E2x/KQGpJCzjT/f3Yl3zVqH
 Yb1epFuCEAxlCdVNqp5xcJA8BnxfM0KCv8YBk=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 22606CCAF8;
 Thu, 16 Apr 2020 11:13:02 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=ODtNsYZK2kcwPIZiYkxRnX/rGfukkhVwPZgiIX9m3Hc=;
 b=mhOwPOrLVNViEQcT6ZxueaJIaNS2OOL5Q6V5kVOJqurB2pQbu5SYf5agaBqzZzQgkrZS/H5Ymql18PTg+aPX++qwbVDZvTgLZvgJmFfIRVcrVkcryFpWoLdgyWxZkfPSOHs95eV/gNPMNi3xlcU4RtrraEQdGL7yRh3CzutY8jM=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id D99EDCCAF3;
 Thu, 16 Apr 2020 11:12:58 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id 09BC42DA0D32;
 Thu, 16 Apr 2020 11:12:57 -0400 (EDT)
Date: Thu, 16 Apr 2020 11:12:56 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
In-Reply-To: <CAK8P3a1S2x1jnx9Q5B22vX8gBHs0Ztu-znA9hqZ5xp5tRAykGg@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.2004161106140.2671@knanqh.ubzr>
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
 <CAK8P3a1S2x1jnx9Q5B22vX8gBHs0Ztu-znA9hqZ5xp5tRAykGg@mail.gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-Pobox-Relay-ID: C1D878A0-7FF4-11EA-9E0A-B0405B776F7B-78420484!pb-smtp20.pobox.com
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
Cc: "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "leon@kernel.org" <leon@kernel.org>,
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
 "jgg@ziepe.ca" <jgg@ziepe.ca>, "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Apr 2020, Arnd Bergmann wrote:

> On Thu, Apr 16, 2020 at 12:17 PM Jani Nikula
> <jani.nikula@linux.intel.com> wrote:
> >
> > On Thu, 16 Apr 2020, Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Thu, Apr 16, 2020 at 5:25 AM Saeed Mahameed <saeedm@mellanox.com> wrote:
> > >> BTW how about adding a new Kconfig option to hide the details of
> > >> ( BAR || !BAR) ? as Jason already explained and suggested, this will
> > >> make it easier for the users and developers to understand the actual
> > >> meaning behind this tristate weird condition.
> > >>
> > >> e.g have a new keyword:
> > >>      reach VXLAN
> > >> which will be equivalent to:
> > >>      depends on VXLAN && !VXLAN
> > >
> > > I'd love to see that, but I'm not sure what keyword is best. For your
> > > suggestion of "reach", that would probably do the job, but I'm not
> > > sure if this ends up being more or less confusing than what we have
> > > today.
> >
> > Ah, perfect bikeshedding topic!
> >
> > Perhaps "uses"? If the dependency is enabled it gets used as a
> > dependency.
> 
> That seems to be the best naming suggestion so far

What I don't like about "uses" is that it doesn't convey the conditional 
dependency. It could be mistaken as being synonymous to "select".

What about "depends_if" ? The rationale is that this is actually a 
dependency, but only if the related symbol is set (i.e. not n or empty).

> Right. OTOH whoever implements it gets to pick the color of the
> bikeshed. ;-)

Absolutely. But some brainstorming can't hurt.


Nicolas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
