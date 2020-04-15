Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 347091AAB9A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676A46EA12;
	Wed, 15 Apr 2020 15:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22586EA12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:18:39 +0000 (UTC)
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MK3mS-1jgxg80C8k-00LYHR for <dri-devel@lists.freedesktop.org>; Wed, 15
 Apr 2020 17:18:38 +0200
Received: by mail-qk1-f173.google.com with SMTP id o19so10272126qkk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:18:37 -0700 (PDT)
X-Gm-Message-State: AGi0PuZA5vkl3u18fNnRemfolG4ILjIdrn/nv+VXabZLhE81QMXClO1N
 2KPEtW9bDKtq+kW5G4Yh2TkCLaGXfnLxNcuzTHQ=
X-Google-Smtp-Source: APiQypKR0HaZQKe1NU2qEEDNoosGf+Eiif2YA3+bZv4o1jlLLMUkDmtAFRquqje/5krjrQpj3uXRFFr+JLm/a3RbNKI=
X-Received: by 2002:a37:ba47:: with SMTP id k68mr15682834qkf.394.1586963916750; 
 Wed, 15 Apr 2020 08:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200408202711.1198966-1-arnd@arndb.de>
 <20200408202711.1198966-6-arnd@arndb.de>
 <20200414201739.GJ19819@pendragon.ideasonboard.com>
 <CAK8P3a0hd5bsezrJS3+GV2nRMui4P5yeD2Rk7wQpJsAZeOCOUg@mail.gmail.com>
 <20200414205158.GM19819@pendragon.ideasonboard.com>
 <CAK8P3a1PZbwdvdH_Gi9UQVUz2+_a8QDxKuWLqPtjhK1stxzMBQ@mail.gmail.com>
 <CAMuHMdUb=XXucGUbxt26tZ1xu9pdyVUB8RVsfB2SffURVVXwSg@mail.gmail.com>
In-Reply-To: <CAMuHMdUb=XXucGUbxt26tZ1xu9pdyVUB8RVsfB2SffURVVXwSg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Apr 2020 17:18:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1uasBFg9dwvPEcokrRhYE2qh6iwOMW1fDTY+LBZMrTjg@mail.gmail.com>
Message-ID: <CAK8P3a1uasBFg9dwvPEcokrRhYE2qh6iwOMW1fDTY+LBZMrTjg@mail.gmail.com>
Subject: Re: [RFC 5/6] drm/rcar-du: fix selection of CMM driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Provags-ID: V03:K1:TnwXMSIWyg+Z5m8jaMITdXPH1MN0h20nYh7NYJ/qgJVE7Jug9zI
 WxWwwzlq/7rv2YKd1EUEy0VtPr6SjezsOSIfd02eHb3A/BqYWNuT7BzIRhGss+vKDNywDyX
 YMBu0c6fy/olet1rUVQsW4dSO1KF2GGsdEZivxUQO6QHy6XA6wR+44KqipmAvInvtbJBFPm
 pR3gpwIqr8ZxQXu9fOMrQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:S66ge8R3Cpc=:4jz1lPk/YzSnmunSU0vodY
 zoGpRLIX9FUSPWgYhr8tgmunC4asNLagrLj6IPHPvRpZAZ2kncFj74l+vsTqwhfZa49hSBAGV
 DkXY+Lwf3YXHg9wj0v9kv+jZr3/cSB46uFjl9ACyBy1Kbw9LW4OpDpWMKPslGWI06rsQQbWOL
 0Omu0p3c8+dThVpqiu8Wt9NdT+kM+vc0Rzd0uExi/bFfnUFZBhBIxcl3DzQMBs+cH8ZXdyRg4
 YVabw0sgiHDedu2cgj761WrGQAVVCKK4vtkqc8KAr5ff7ivEBoo3oFQxmjKQj61mZZMVmjMAI
 9g7bKjx1hti9CtipkBV6YGdmHDp/r/g33tgeIAAijfGv6vEa14yeC4ECB3fg1tSMriUX1modN
 MmB9QRGv9CNIz6jEuThtMWixupWnjzaDWmRELLLLaS7CoSvZIBuo/WYbzkmHJsOH6Nu8oxA+m
 ovV3g1Cp67fUQdap8ARS7Q59n+enxMeDWaa15ug/UJvhWhT3Ro9VRNiPupMp0AqhC6TW3mv/5
 fdAS/+8LYV34zGyFZzERl5YkIOqivRg7Pc/NmyYGw9jJxJ8x5PSPVSZgHH4hk2Hxl9G4A3JJO
 P4seMKRfWH0SDJvZae2KEXMrQQuLIoYFiRmHjhSL00XsGlI7U12utI8zM7W+NQgGHNZUc+wJV
 j0TagmuqGyiz3SRUqPY6zP2JPcOfOeUsh9TUUHP+5LT8MNL8HID3TWesaZew5ZqhPAgYz6Aih
 3vm5N9nwXlNzJoiocYUvxO2oA4G1Rocutth8vjeN14ohl3p+YRnjWznH7vnAQohsHrcSnDsQ5
 EdoojL9TGh1in4zm5rtN0N2e5AfsxdP4uL/wjiY8B2sg2Gwl5w=
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 4:13 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Apr 15, 2020 at 3:47 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tue, Apr 14, 2020 at 10:52 PM Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > > Doesn't "imply" mean it gets selected by default but can be manually
> > > disabled ?
> >
> > That may be what it means now (I still don't understand how it's defined
> > as of v5.7-rc1), but traditionally it was more like a 'select if all
> > dependencies are met'.
>
> That's still what it is supposed to mean right now ;-)
> Except that now it should correctly handle the modular case, too.

Then there is a bug. If I run 'make menuconfig' now on a mainline kernel
and enable CONFIG_DRM_RCAR_DU, I can set
DRM_RCAR_CMM and DRM_RCAR_LVDS to 'y', 'n' or 'm' regardless
of whether CONFIG_DRM_RCAR_DU is 'm' or 'y'. The 'implies'
statement seems to be ignored entirely, except as reverse 'default'
setting.

> >
> > In that case, a Makefile trick could also work, doing
> >
> > ifdef CONFIG_DRM_RCAR_CMM
> > obj-$(CONFIG_DRM_RCAR_DU) += rcar-cmm.o
> > endif
> >
> > Thereby making the cmm module have the same state (y or m) as
> > the du module whenever the option is enabled.
>
> What about dropping the "imply DRM_RCAR_CMM", but defaulting to
> enable CMM if DU is enabled?
>
>     config DRM_RCAR_CMM
>             tristate "R-Car DU Color Management Module (CMM) Support"
>             depends on DRM_RCAR_DU && OF
>             default DRM_RCAR_DU

That doesn't work because it allows DRM_RCAR_DU=y with
DRM_RCAR_CMM=m, which causes a link failure.

         Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
