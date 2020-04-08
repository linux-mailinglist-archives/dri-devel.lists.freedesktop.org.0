Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07861A3038
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52376EB90;
	Thu,  9 Apr 2020 07:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EBF6EB10
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 22:42:26 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id j4so2077361qkc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 15:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Gx7CIn2jLm5j4xdRTQllP3gtsV1GD1rqAZK1dgPXufs=;
 b=QNvwhanRxS4Sp2j2LHSLQcsnvtI8nKLKCO4iJmFGW1B92LmBwTjRXgMu6hoA+3nu6a
 +AncNDjcl0kSubqIIKDmhQ/B4P0DWLjY944vQvPzXqfIZ/sCSq0fDEsgem3Gc5iICbyv
 0Y39n5KQM6xKjbVgPorJhsaiN2AuYU7Q0/dWwDhxN1r5mtViSRqRNidGJ/zth/jmXnAd
 Fj7J66gfSRWdqqRboP1FK189wHiA2ZAzhPdo2Mp8SJP9vg7U1rEBSGTCCasAVssBxBTy
 zYpfsDYyG5+n/7srZdc6jeXEQR+u64TxJV40NMVebs8Xh6UEw6KOAP5b0PcZX96oRtnX
 4fIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gx7CIn2jLm5j4xdRTQllP3gtsV1GD1rqAZK1dgPXufs=;
 b=M4lfG3tKzhwXeKg7ZQ1PxL/6xbn1c2i7E7D14DnNU/s6stIK5ol6vB9lyr5/tT7xHR
 lnNG7z2VPvj9QcJWyzLfvOUs0HuVTapIElkes3aD1RP5O+W9IzZHIoQsvgD7Qsnbj4v1
 /9ZBlbseqnvnQhX20D7QdKcgBSG4+01X/4nPr/DXF4xRc8xmvPhODCKu0+ad4GW05A+w
 OY/zEO1RNjKcTve8CdpLEJybkz0LnuzdOwKot6HS5dDvVShMhKaPCGX+OUJlMhgFJj+6
 1uyxEnwSu/Coo3OQWEcQdjMg0w/Q32i1KffhEaI9Id1f10rBxcUIUpnp7aB9NNTvA/go
 +xww==
X-Gm-Message-State: AGi0PuYCwHYhuw5oENXIkl/0iKdt6RDTcH66qwlM/zh9QvRaMzbLuUhO
 SUh7yaADZIWrO/o9bE6X+S6PqQ==
X-Google-Smtp-Source: APiQypK2bX+tqIpGntcBk1/CwwpnTCfzPu8OVIuVdpAy/314r42K0ZVFzsGT+xEEVrPrBkQ7VCf5XA==
X-Received: by 2002:a05:620a:4f2:: with SMTP id
 b18mr9768314qkh.433.1586385745928; 
 Wed, 08 Apr 2020 15:42:25 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id x17sm19797204qkb.87.2020.04.08.15.42.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Apr 2020 15:42:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jMJOq-0006Fv-Ln; Wed, 08 Apr 2020 19:42:24 -0300
Date: Wed, 8 Apr 2020 19:42:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
Message-ID: <20200408224224.GD11886@ziepe.ca>
References: <20200408202711.1198966-1-arnd@arndb.de>
 <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
 <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Networking <netdev@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Pitre <nico@fluxnic.net>, Saeed Mahameed <saeedm@mellanox.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 10:49:48PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 8, 2020 at 10:38 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> > On Wed, 8 Apr 2020, Arnd Bergmann wrote:
> > > I have created workarounds for the Kconfig files, which now stop using
> > > imply and do something else in each case. I don't know whether there was
> > > a bug in the kconfig changes that has led to allowing configurations that
> > > were not meant to be legal even with the new semantics, or if the Kconfig
> > > files have simply become incorrect now and the tool works as expected.
> >
> > In most cases it is the code that has to be fixed. It typically does:
> >
> >         if (IS_ENABLED(CONFIG_FOO))
> >                 foo_init();
> >
> > Where it should rather do:
> >
> >         if (IS_REACHABLE(CONFIG_FOO))
> >                 foo_init();
> >
> > A couple of such patches have been produced and queued in their
> > respective trees already.
> 
> I try to use IS_REACHABLE() only as a last resort, as it tends to
> confuse users when a subsystem is built as a module and already
> loaded but something relying on that subsystem does not use it.
> 
> In the six patches I made, I had to use IS_REACHABLE() once,
> for the others I tended to use a Kconfig dependency like
> 
> 'depends on FOO || FOO=n'

It is unfortunate kconfig doesn't have a language feature for this
idiom, as the above is confounding without a lot of kconfig knowledge

> I did come up with the IS_REACHABLE() macro originally, but that
> doesn't mean I think it's a good idea to use it liberally ;-)

It would be nice to have some uniform policy here

I also don't like the IS_REACHABLE solution, it makes this more
complicated, not less..

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
