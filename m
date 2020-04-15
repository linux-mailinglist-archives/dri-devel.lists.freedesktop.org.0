Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2D61AB33D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 23:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5322F6EA68;
	Wed, 15 Apr 2020 21:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF1E6EA68
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 21:22:28 +0000 (UTC)
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MryCb-1iskKd2gXV-00nzcJ for <dri-devel@lists.freedesktop.org>; Wed, 15
 Apr 2020 23:22:26 +0200
Received: by mail-qt1-f170.google.com with SMTP id w24so14679384qts.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 14:22:26 -0700 (PDT)
X-Gm-Message-State: AGi0PuaLL5gk6k0STswaAdihFnDidWl7AONVBUfc7Edw6r7+SbhIqsmd
 hFrAZDB38h7fiG2x54VvdbNpRtrY+QV7SifwgCQ=
X-Google-Smtp-Source: APiQypINvvbbsDvc+K5sPwo+K7MzKlFLIqVVyQJIWMYe8UMUC3pk7MCSaMVSsYr2RgizX7z/824mZq3G5jLNLnmv4G8=
X-Received: by 2002:ac8:6757:: with SMTP id n23mr10344447qtp.304.1586985745338; 
 Wed, 15 Apr 2020 14:22:25 -0700 (PDT)
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
In-Reply-To: <20200415211220.GQ4758@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Apr 2020 23:22:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1rDZO4cuL6VAXgu9sOiedcHqOSL7ELhpvULz+YYRaGbA@mail.gmail.com>
Message-ID: <CAK8P3a1rDZO4cuL6VAXgu9sOiedcHqOSL7ELhpvULz+YYRaGbA@mail.gmail.com>
Subject: Re: [RFC 5/6] drm/rcar-du: fix selection of CMM driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Provags-ID: V03:K1:K+N8PzMs/bo3+clFfxNSLOS1oHkPeubQwwK5X999TDxuWTy2vpq
 U3yOdOgFDhFqkcfnSYtwrueIUlnTfzIFgehUdGsnHmzzsnHQtUv2bAxVOm3I8Pu5OhbpNBE
 UsdIb+j3iVKlCB5RtjkQKKPs3sE7OMKNO8bNO0Ddk5XFBqEzRduh30J95i8bi8X8c7brSnL
 MXxPIJ5GgolRSqvA27Bjg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:16rXmnt6GWI=:q5W5oh1yP8a+hatBo9puvm
 cRp63PJkggmiuqlZZynmFyPQpZjFpKH1JpRJnQ/Bnkx1GPUPEdBcSzNBlEzhuiqzCxt1gYiNr
 1fbQyc0G29iHJnzz7SApdeWWuqwGZbaEwHNy46Bh37rfXckBJJ5voqmIG0XugCONo56aCDut3
 sif1N7sYSs8UFe+BJt4yPKxqzX6kNExW9qC4WEBYp4p64035doiVKIoVFsmMaOfsbJCL/UNr9
 mqMFCWw25c3GCEo/Q3QGF+FknicYn9Ffjb8GC9des6lBI8SRYby4nx8JY+SBa2G14wB0pAEk6
 DwJQdOrRzUpkHUwMmctMZxU+22B2m/YIci2NJqaLBuXlcVxrOU0bS6m+AAJf0uf9lBfXmTCrR
 aN/sjm0MDil3dcYp1a2VpuNxBDmbKaTyvMPh0bR1nKk2VHpVxR61NODE0Oq9jOIcdS1PxmuX9
 D/HvfpHvLdFXxWxspEzySua01uGYDBrU0GFH/SYuDZUmzrDCaOuAGUWKwvMoxFM9nBO28yTA4
 QcmNiR4noMR8Bv0l6Rs9WHbN7Gkg9l+d6B8jJg3X1tfAWahybh73QJkeNsNHOMJwfbkv6unBw
 Ir0XsyY2JhyIf0UO1REyaf5fBDeoDvmX2K5gh3fgWJgn7sutPDmZbw0z5ffuAEXp1phbCkDT6
 Vh8dclFX3/LOJp6G9SGwSvNAMHalYOC3S1o5kpoIjUNcATilRMBS9nItqtWl2CPI0xJ8kAu4i
 WCodRlEpBMwaEoM+Z4WriTBJWEj4WnGc8IS9/XjIyp510aP5/vfBFQI7Qow1FI7cQzWCYSIjm
 ShSOLoE7OErcEqV1NwX4id4LYD5PC5QizjPbfOpH4+RmfJeROY=
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
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "David S. Miller" <davem@davemloft.net>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 11:12 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Apr 15, 2020 at 09:07:14PM +0200, Arnd Bergmann wrote:
> > On Wed, Apr 15, 2020 at 5:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Wed, Apr 15, 2020 at 4:13 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Wed, Apr 15, 2020 at 3:47 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > On Tue, Apr 14, 2020 at 10:52 PM Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > > > > > Doesn't "imply" mean it gets selected by default but can be manually
> > > > > > disabled ?
> > > > >
> > > > > That may be what it means now (I still don't understand how it's defined
> > > > > as of v5.7-rc1), but traditionally it was more like a 'select if all
> > > > > dependencies are met'.
> > > >
> > > > That's still what it is supposed to mean right now ;-)
> > > > Except that now it should correctly handle the modular case, too.
> > >
> > > Then there is a bug. If I run 'make menuconfig' now on a mainline kernel
> > > and enable CONFIG_DRM_RCAR_DU, I can set
> > > DRM_RCAR_CMM and DRM_RCAR_LVDS to 'y', 'n' or 'm' regardless
> > > of whether CONFIG_DRM_RCAR_DU is 'm' or 'y'. The 'implies'
> > > statement seems to be ignored entirely, except as reverse 'default'
> > > setting.
> >
> > Here is another version that should do what we want and is only
> > half-ugly. I can send that as a proper patch if it passes my testing
> > and nobody hates it too much.
>
> This may be a stupid question, but doesn't this really call for fixing
> Kconfig ? This seems to be such a common pattern that requiring
> constructs similar to the ones below will be a never-ending chase of
> offenders.

Maybe, I suppose the hardest part here would be to come up with
an appropriate name for the keyword ;-)

Any suggestions?

This specific issue is fairly rare though, in most cases the dependencies
are in the right order so a Kconfig symbol 'depends on' a second one
when the corresponding loadable module uses symbols from that second
module. The problem here is that the two are mixed up.

The much more common problem is the one where one needs to
wrong

config FOO
       depends on BAR || !BAR

To ensure the dependency is either met or BAR is disabled, but
not FOO=y with BAR=m. If you have any suggestions for a keyword
for that thing, we can clean up hundreds of such instances.

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
