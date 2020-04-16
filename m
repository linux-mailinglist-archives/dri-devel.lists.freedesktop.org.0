Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFA71AB87E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2557B6EAC5;
	Thu, 16 Apr 2020 06:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552296EAC5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 06:51:26 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id j16so15771712oih.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 23:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pLZEHboHrVUvSiMzAU5mB2mWJMs+hZ8IHC8retFcrgk=;
 b=JHwymh36ehjFDNDrb8YuMyQ1MkWFaqFQka5rlpHvpOpNowJkEQBJjUJHh6tEn9ItJf
 44VDASM1Nm9+28OJ0BhPDfmpGS7h0JIyE4ei3cCTN1kvXMsSEqE7hJ6ugWHQLwwsjP4k
 SXfyV81W2EeHu0cLCfENisqsTzpcXqPmUQBbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pLZEHboHrVUvSiMzAU5mB2mWJMs+hZ8IHC8retFcrgk=;
 b=GuKwQgebcI6xigr4Ff2WNYyL0PnTnXX1M3vZ0PsZIufSwHOveQihU6FbZAyfiJXfHu
 79Eop2bPwJeOpUGeVLMvvzBzP3oGxOgXIROcD+/D2qatyQKKOg4h/w4D/ueMCM27Fi3+
 Tr9Ng1EZuqVzOJMbXbpvCRTYQLE0ocQdpqpwKFpHzHF16bXKwSkNdOV45Y9lwUkGS3Dx
 2hZAE9gFe4hxAjpT7dyTunnfT8kwc/BZwZmkN6smApOhKYAmcHMF3tHCzwZ0/VavxZNz
 LEEeQFkKLjQ1WkIR3WG4VhyfpfjQ4uNc2LONyqeaW3Q65MZTtZlgmHUC3gaa3+EQ244W
 y8rA==
X-Gm-Message-State: AGi0Pua9LUzroRRea+NSteUdQnTrpLoTsMWf/VPy4qyQ5HLbG2FjfsoC
 4eXlu5qBF7j4uamtNInJoOhTVaiB6OrrB+Cc6YAGIw==
X-Google-Smtp-Source: APiQypLyNc+eIs12WumzaBN5ipx1548wfPjx2IqBdj2oxsFx0exWa6GdqAAPbqs2svHCYqkW3eZbfQLmptUx4Q5ixiM=
X-Received: by 2002:aca:2113:: with SMTP id 19mr2018002oiz.128.1587019885629; 
 Wed, 15 Apr 2020 23:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200408202711.1198966-1-arnd@arndb.de>
 <20200408202711.1198966-6-arnd@arndb.de>
 <20200414201739.GJ19819@pendragon.ideasonboard.com>
 <CAK8P3a0hd5bsezrJS3+GV2nRMui4P5yeD2Rk7wQpJsAZeOCOUg@mail.gmail.com>
 <20200414205158.GM19819@pendragon.ideasonboard.com>
 <CAK8P3a1PZbwdvdH_Gi9UQVUz2+_a8QDxKuWLqPtjhK1stxzMBQ@mail.gmail.com>
 <CAMuHMdUb=XXucGUbxt26tZ1xu9pdyVUB8RVsfB2SffURVVXwSg@mail.gmail.com>
 <CAK8P3a1uasBFg9dwvPEcokrRhYE2qh6iwOMW1fDTY+LBZMrTjg@mail.gmail.com>
 <CAK8P3a0CoPUTSJp6ddDnmabo59iE73pugGSYayoeB5N57az9_w@mail.gmail.com>
 <20200415211220.GQ4758@pendragon.ideasonboard.com>
 <CAK8P3a1rDZO4cuL6VAXgu9sOiedcHqOSL7ELhpvULz+YYRaGbA@mail.gmail.com>
In-Reply-To: <CAK8P3a1rDZO4cuL6VAXgu9sOiedcHqOSL7ELhpvULz+YYRaGbA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 16 Apr 2020 08:51:14 +0200
Message-ID: <CAKMK7uEoZ1jC8c25tPVX20kcdC1=+TpUUNyf+-c=sg5iK2cTZA@mail.gmail.com>
Subject: Re: [RFC 5/6] drm/rcar-du: fix selection of CMM driver
To: Arnd Bergmann <arnd@arndb.de>
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
 Nicolas Pitre <nico@fluxnic.net>, David Airlie <airlied@linux.ie>,
 Networking <netdev@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Saeed Mahameed <saeedm@mellanox.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 11:22 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Apr 15, 2020 at 11:12 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Wed, Apr 15, 2020 at 09:07:14PM +0200, Arnd Bergmann wrote:
> > > On Wed, Apr 15, 2020 at 5:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Wed, Apr 15, 2020 at 4:13 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Wed, Apr 15, 2020 at 3:47 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > On Tue, Apr 14, 2020 at 10:52 PM Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > > > > > > Doesn't "imply" mean it gets selected by default but can be manually
> > > > > > > disabled ?
> > > > > >
> > > > > > That may be what it means now (I still don't understand how it's defined
> > > > > > as of v5.7-rc1), but traditionally it was more like a 'select if all
> > > > > > dependencies are met'.
> > > > >
> > > > > That's still what it is supposed to mean right now ;-)
> > > > > Except that now it should correctly handle the modular case, too.
> > > >
> > > > Then there is a bug. If I run 'make menuconfig' now on a mainline kernel
> > > > and enable CONFIG_DRM_RCAR_DU, I can set
> > > > DRM_RCAR_CMM and DRM_RCAR_LVDS to 'y', 'n' or 'm' regardless
> > > > of whether CONFIG_DRM_RCAR_DU is 'm' or 'y'. The 'implies'
> > > > statement seems to be ignored entirely, except as reverse 'default'
> > > > setting.
> > >
> > > Here is another version that should do what we want and is only
> > > half-ugly. I can send that as a proper patch if it passes my testing
> > > and nobody hates it too much.
> >
> > This may be a stupid question, but doesn't this really call for fixing
> > Kconfig ? This seems to be such a common pattern that requiring
> > constructs similar to the ones below will be a never-ending chase of
> > offenders.
>
> Maybe, I suppose the hardest part here would be to come up with
> an appropriate name for the keyword ;-)
>
> Any suggestions?
>
> This specific issue is fairly rare though, in most cases the dependencies
> are in the right order so a Kconfig symbol 'depends on' a second one
> when the corresponding loadable module uses symbols from that second
> module. The problem here is that the two are mixed up.
>
> The much more common problem is the one where one needs to
> wrong
>
> config FOO
>        depends on BAR || !BAR
>
> To ensure the dependency is either met or BAR is disabled, but
> not FOO=y with BAR=m. If you have any suggestions for a keyword
> for that thing, we can clean up hundreds of such instances.

Some ideas:

config FOO
    can use  BAR
    maybe BAR
    optional BAR

We should probably double-check that this is only ever used for when
both FOO and BAR are tri-state, since without that it doesn't make
much sense.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
