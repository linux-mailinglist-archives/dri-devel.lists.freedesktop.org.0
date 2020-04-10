Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FA11A522A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 14:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0880A6E31C;
	Sat, 11 Apr 2020 12:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED6A6E1FB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 17:13:23 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id z15so2796789qki.7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 10:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IM1Dms+6Kk6uSoOVXDf++gqgf8pSHSOrUNNPGKpHdFY=;
 b=HV2la9hQONCVfSMQQuksMMkJuwjAeD273zC8VodiNbmtqcBgp2ySsLByOsTc1wzOMr
 Q9UfQ3z57uAE/AWLeIkDYBqxMsgSFKVaorYpEBWRMLbBFkKVnmwYANj6bP3Btwm2uths
 L9byXcBZfaHUEkD0RCnPWYbb3RLvr6yjpdT+E3khm/EiDCkUDGNNZMO4Fom5Xpr1b0rM
 lbfhPKbdmkL+FSBFPFKRkQPoLz4AWsJLrV3BqyY8BMDpnEVBFFhkxyXkMSxZ//Z/bz2W
 VRZdiIuzKZZicmBrIzbxO4CEGwy9CxOfE/paIO4nviIEqyU173faTtrmigfjHx+WYbQX
 5o7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IM1Dms+6Kk6uSoOVXDf++gqgf8pSHSOrUNNPGKpHdFY=;
 b=a83eHoHaq6zMi07VIjF75l0C0xgWS2nvWUPklWsAEtloReq89js/RsIF6CD8Ohr5J7
 VZ5ayHdIYdiicKoIFNILLx852HqXu+h4fDBPblAAv+1f83rs+ADHtnsIR+2S+OD7kvog
 +uvvO2+t1fukVBoh3Ddn4VTjXTYR5/hKaiOC7IiKMibo5U/JZYwoy/LbdeuKdsImyzNq
 oXzyqKFtl6zpqRuZt85NFPbb1oGZXWgFZ/RWcTaF3KO6f+xHfrZzjBmTazKQ0ewC4aIC
 4IlNmeMe2ncUFaBqCmcHM96jZRSV6M/Jnmv1kBo6K2hxO3Xmqyj4Nq2znKtyfbFNwuZE
 rs3w==
X-Gm-Message-State: AGi0PuaIeGzLYPEhvdJdp349xZUMt4t2Fd3tLiMZcF0C7R9dzQxWDNr9
 RYzRnodKq1fYgYN+2O7YAfUEzw==
X-Google-Smtp-Source: APiQypLmE/MEQtipGhULJ9OlLMq9pEcPOhlrkTjtMbVWOYt8l+l3qlb93NNl4fBSv7xFKi5pNqJpBA==
X-Received: by 2002:a05:620a:a41:: with SMTP id
 j1mr5046527qka.86.1586538802345; 
 Fri, 10 Apr 2020 10:13:22 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id m10sm1997447qte.71.2020.04.10.10.13.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 Apr 2020 10:13:21 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jMxDU-0006Dq-Uh; Fri, 10 Apr 2020 14:13:20 -0300
Date: Fri, 10 Apr 2020 14:13:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Saeed Mahameed <saeedm@mellanox.com>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
Message-ID: <20200410171320.GN11886@ziepe.ca>
References: <20200408202711.1198966-1-arnd@arndb.de>
 <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
 <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
 <20200408224224.GD11886@ziepe.ca> <87k12pgifv.fsf@intel.com>
 <7d9410a4b7d0ef975f7cbd8f0b6762df114df539.camel@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d9410a4b7d0ef975f7cbd8f0b6762df114df539.camel@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 11 Apr 2020 12:53:57 +0000
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
 "arnd@arndb.de" <arnd@arndb.de>, "leon@kernel.org" <leon@kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>,
 "nico@fluxnic.net" <nico@fluxnic.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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

On Fri, Apr 10, 2020 at 02:40:42AM +0000, Saeed Mahameed wrote:

> This assumes that the module using FOO has its own flag representing
> FOO which is not always the case.
> 
> for example in mlx5 we use VXLAN config flag directly to compile VXLAN
> related files:
> 
> mlx5/core/Makefile:
> 
> obj-$(CONFIG_MLX5_CORE) += mlx5_core.o
> 
> mlx5_core-y := mlx5_core.o
> mlx5_core-$(VXLAN) += mlx5_vxlan.o
> 
> and in mlx5_main.o we do:

Does this work if VXLAN = m ?

> if (IS_ENABLED(VXLAN))
>        mlx5_vxlan_init()
> 
> after the change in imply semantics:
> our options are:
> 
> 1) use IS_REACHABLE(VXLAN) instead of IS_ENABLED(VXLAN)
> 
> 2) have MLX5_VXLAN in mlx5 Kconfig and use IS_ENABLED(MLX5_VXLAN) 
> config MLX5_VXLAN
> 	depends on VXLAN || !VXLAN
> 	bool

Does this trick work when vxlan is a bool not a tristate?

Why not just put the VXLAN || !VXLAN directly on MLX5_CORE?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
