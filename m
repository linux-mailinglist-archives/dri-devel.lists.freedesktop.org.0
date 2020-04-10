Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CCD1A42F7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 09:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA1F6EC7B;
	Fri, 10 Apr 2020 07:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20546EC7B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 07:26:50 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id f52so1095350otf.8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 00:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wGqUDkMyUDGl7VVhXa8WG/REtqhU4iY/2ocjn64gPfM=;
 b=uIrHAhADc6nbw0Od9aeOsmHLcwH/Vo+1bgdnTJ5lx5oQrcesqLpKzDMzqzIUuBKk3X
 bxWAT+Mg2JOVxyulKXeMtYdYrPtmfCAjEr00nT0X/R++L/VkGzCvU/4DLB46o8QATg7q
 x5jvfVlI5xWYfT3uqk1DtXWROIJ7DiubXXTXnJLvtkOGrvs/xtAl7x+duJr2cI8qHMQF
 do6u9pXNumqllC2KHKn3kSkCbEMcY3Rdpcmbah6ajger5BpIGK9hVkix0fJYNP0o+5Op
 +hod2xE25sWbRLfNmVOuRHi3Er37avJVTh9KdTZTCGHXTdyS/jlWFokRkW0V0iwMQVED
 NHOQ==
X-Gm-Message-State: AGi0Pub9kCD93m7qOsdqsE4TMv63rLy32DWBPD1+2OkdVDpfg016PPO9
 C3Xse22l1KB8+3o1DNfNRv3xL96cLRb/1T/2T1A=
X-Google-Smtp-Source: APiQypLr/sjrnpwB9pQixWC8DWS5YZ4U3S4bp7uZRbD2EmxXJKK1SVMTlqAkvYa8eK2CJywp2s4W8K/RnCjoFP80X8o=
X-Received: by 2002:a05:6830:1e0e:: with SMTP id
 s14mr3054376otr.107.1586503609934; 
 Fri, 10 Apr 2020 00:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200408202711.1198966-1-arnd@arndb.de>
 <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
 <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
 <20200408224224.GD11886@ziepe.ca> <87k12pgifv.fsf@intel.com>
 <7d9410a4b7d0ef975f7cbd8f0b6762df114df539.camel@mellanox.com>
In-Reply-To: <7d9410a4b7d0ef975f7cbd8f0b6762df114df539.camel@mellanox.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Apr 2020 09:26:38 +0200
Message-ID: <CAMuHMdXnGdxqy6KUnJW69zwmNvHZhSpfXz0PancNrK91SMZp_g@mail.gmail.com>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
To: Saeed Mahameed <saeedm@mellanox.com>
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

Hi Saeed,

On Fri, Apr 10, 2020 at 4:41 AM Saeed Mahameed <saeedm@mellanox.com> wrote:
> On Thu, 2020-04-09 at 11:41 +0300, Jani Nikula wrote:
> > For example, you have two graphics drivers, one builtin and another
> > module. Then you have backlight as a module. Using IS_REACHABLE(),
> > backlight would work in one driver, but not the other. I'm sure there
> > is
> > the oddball person who finds this desirable, but the overwhelming
> > majority would just make the deps such that either you make all of
> > them
> > modules, or also require backlight to be builtin.
>
> the previous imply semantics handled this by forcing backlight to be
> built-in, which worked nicely.

Which may have worked fine for backlight, but not for other symbols
with dependencies that are not always met.

=> Use "select" to enable something unconditionally, but this can only
    be used if the target's dependencies are met.
=> Use "imply" to enable an optional feature conditionally.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
