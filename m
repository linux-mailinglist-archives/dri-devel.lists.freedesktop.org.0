Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD5EE2ADF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 09:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24066E0FA;
	Thu, 24 Oct 2019 07:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B50F6E0FA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 07:15:22 +0000 (UTC)
X-Originating-IP: 93.2.121.143
Received: from uno.localdomain (143.121.2.93.rev.sfr.net [93.2.121.143])
 (Authenticated sender: jacopo@jmondi.org)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5F255E0015;
 Thu, 24 Oct 2019 07:15:16 +0000 (UTC)
Date: Thu, 24 Oct 2019 09:17:03 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
Message-ID: <20191024071703.6keoebzlfnn2qmyd@uno.localdomain>
References: <20191022083630.28175-1-brgl@bgdev.pl>
 <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
 <20191023155941.q563d3cfizre4zvt@holly.lan>
 <20191024064726.GB15843@dell>
MIME-Version: 1.0
In-Reply-To: <20191024064726.GB15843@dell>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============0602316190=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0602316190==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wfpai4ndwplq7h5c"
Content-Disposition: inline


--wfpai4ndwplq7h5c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Oct 24, 2019 at 07:47:26AM +0100, Lee Jones wrote:
> On Wed, 23 Oct 2019, Daniel Thompson wrote:
>
> > On Tue, Oct 22, 2019 at 11:29:54AM +0200, Bartosz Golaszewski wrote:
> > > wt., 22 pa=C5=BA 2019 o 10:36 Bartosz Golaszewski <brgl@bgdev.pl> nap=
isa=C5=82(a):
> > > >
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > While working on my other series related to gpio-backlight[1] I not=
iced
> > > > that we could simplify the driver if we made the only user of platf=
orm
> > > > data use GPIO lookups and device properties. This series tries to do
> > > > that.
> > > >
> > > > First two patches contain minor fixes. Third patch makes the driver
> > > > explicitly drive the GPIO line. Fourth patch adds all necessary data
> > > > structures to ecovec24. Patch 5/9 unifies much of the code for both
> > > > pdata and non-pdata cases. Patches 6-7/9 remove unused platform data
> > > > fields. Last two patches contain additional improvements for the GP=
IO
> > > > backlight driver while we're already modifying it.
> > > >
> > > > I don't have access to this HW but hopefully this works. Only compi=
le
> > > > tested.
> > > >
> > > > [1] https://lkml.org/lkml/2019/6/25/900
> > > >
> > > > v1 -> v2:
> > > > - rebased on top of v5.3-rc1 and adjusted to the recent changes fro=
m Andy
> > > > - added additional two patches with minor improvements
> > > >
> > > > v2 -> v3:
> > > > - in patch 7/7: used initializers to set values for pdata and dev l=
ocal vars
> > > >
> > > > v3 -> v4:
> > > > - rebased on top of v5.4-rc1
> > > > - removed changes that are no longer relevant after commit ec665b75=
6e6f
> > > >   ("backlight: gpio-backlight: Correct initial power state handling=
")
> > > > - added patch 7/7
> > > >
> > > > v4 -> v5:
> > > > - in patch 7/7: added a comment replacing the name of the function =
being
> > > >   pulled into probe()
> > > >
> > > > v5 -> v6:
> > > > - added a patch making the driver explicitly set the direction of t=
he GPIO
> > > >   to output
> > > > - added a patch removing a redundant newline
> > > >
> > > > v6 -> v7:
> > > > - renamed the function calculating the new GPIO value for status up=
date
> > > > - collected more tags
> > > >
> > > > Bartosz Golaszewski (9):
> > > >   backlight: gpio: remove unneeded include
> > > >   backlight: gpio: remove stray newline
> > > >   backlight: gpio: explicitly set the direction of the GPIO
> > > >   sh: ecovec24: add additional properties to the backlight device
> > > >   backlight: gpio: simplify the platform data handling
> > > >   sh: ecovec24: don't set unused fields in platform data
> > > >   backlight: gpio: remove unused fields from platform data
> > > >   backlight: gpio: use a helper variable for &pdev->dev
> > > >   backlight: gpio: pull gpio_backlight_initial_power_state() into p=
robe
> > > >
> > > >  arch/sh/boards/mach-ecovec24/setup.c         |  33 +++--
> > > >  drivers/video/backlight/gpio_backlight.c     | 128 +++++++--------=
----
> > > >  include/linux/platform_data/gpio_backlight.h |   3 -
> > > >  3 files changed, 69 insertions(+), 95 deletions(-)
> > > >
> > > >
> > >
> > > Lee, Daniel, Jingoo,
> > >
> > > Jacopo is travelling until November 1st and won't be able to test this
> > > again before this date. Do you think you can pick it up and in case
> > > anything's broken on SH, we can fix it after v5.5-rc1, so that it
> > > doesn't miss another merge window?
>
> November 1st (-rc6) will be fine.
>
> I'd rather apply it late-tested than early-non-tested.
>
> Hopefully Jacopo can prioritise testing this on Thursday or Friday,
> since Monday will be -rc7 which is really cutting it fine.

I'll do my best, I'll get home Friday late afternoon :)


>
> > Outside of holidays and other emergencies Lee usually collects up the
> > patches for backlight. I'm not sure when he plans to close things for
> > v5.5.
>
> In special cases such as these I can remain flexible.
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Linaro Services Technical Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog

--wfpai4ndwplq7h5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2xT+kACgkQcjQGjxah
VjyWSRAAxMG+doVs6jKDU7YNSv/u74lWN3O4ddF1jNPc3tEP3zjxqXDzGlzX8QeD
LJ8SjmP4xIcU6gTJOEj30PbxQk4w/uCuhVk50LHZxsH8LY6d+NF8F65UaPpJ843X
WFmK4WDdXkIRZ/HxRL83m9hLmpHRZTGtjW71t+4h7W1aFZfJe6AaWDp+uh76/9qi
o2gfkjhELb5+wViBHfLexMgWNIGfY7kMXjSiZPZk1hghTvIkNqKm7thvwm5ecgd1
V0pkF84tBb2qUGV15DC8fYmlsNxiv3iWeh+j8kayiMvGeQSuwPfAQBxW5ihfydau
NRconH89vXqfl85J6QdEQXI8oM3jLh2rr5bs1QCudeX+Q4yZyxgCWDImCTjO6338
BTjm4kNGbeaiNbU/t1vVJnjK+DeHluhaK5ahq4IAcwB16ultNHfe/IggX/xoZHkY
KwSh0NmnVOWcIyokDlOZLvViA16qdD5II0rHx1D75VvwAS3QnyDXBt/A2FF4MYP+
DQMV8jXkSw7YI5U1j55uEWBA1ePpeZMj2sG7wNBu48uyOzGgbUitnYKm1hkihJM9
i5D6B9vBJiUOO1auaGcmaNZXWqjuAzk7chajL2O6hprhB3uNUSqHX6oBpJQFb6Yd
tOpoiYc2px3euAANQVkKw7rOWYBeZlpR7Ic2tvc0lkaeb5agFgA=
=OTLb
-----END PGP SIGNATURE-----

--wfpai4ndwplq7h5c--

--===============0602316190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0602316190==--
