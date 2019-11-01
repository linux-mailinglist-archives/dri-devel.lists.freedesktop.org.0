Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BED24EC5BD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 16:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60976F82B;
	Fri,  1 Nov 2019 15:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1723E6F828
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 15:39:47 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9C5EDFF802;
 Fri,  1 Nov 2019 15:39:41 +0000 (UTC)
Date: Fri, 1 Nov 2019 16:41:33 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
Message-ID: <20191101154133.qqjj3uriwrl2j5r5@uno.localdomain>
References: <20191022083630.28175-1-brgl@bgdev.pl>
 <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
 <20191023155941.q563d3cfizre4zvt@holly.lan>
 <20191024064726.GB15843@dell>
 <20191024071703.6keoebzlfnn2qmyd@uno.localdomain>
 <20191101085803.GD5700@dell>
MIME-Version: 1.0
In-Reply-To: <20191101085803.GD5700@dell>
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
Content-Type: multipart/mixed; boundary="===============0812025567=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0812025567==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mkrddyxkwo53ywov"
Content-Disposition: inline


--mkrddyxkwo53ywov
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,
  as promised...

On Fri, Nov 01, 2019 at 08:58:03AM +0000, Lee Jones wrote:
> On Thu, 24 Oct 2019, Jacopo Mondi wrote:
>
> > Hello,
> >
> > On Thu, Oct 24, 2019 at 07:47:26AM +0100, Lee Jones wrote:
> > > On Wed, 23 Oct 2019, Daniel Thompson wrote:
> > >
> > > > On Tue, Oct 22, 2019 at 11:29:54AM +0200, Bartosz Golaszewski wrote:
> > > > > wt., 22 pa=C5=BA 2019 o 10:36 Bartosz Golaszewski <brgl@bgdev.pl>=
 napisa=C5=82(a):
> > > > > >
> > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > >
> > > > > > While working on my other series related to gpio-backlight[1] I=
 noticed
> > > > > > that we could simplify the driver if we made the only user of p=
latform
> > > > > > data use GPIO lookups and device properties. This series tries =
to do
> > > > > > that.
> > > > > >
> > > > > > First two patches contain minor fixes. Third patch makes the dr=
iver
> > > > > > explicitly drive the GPIO line. Fourth patch adds all necessary=
 data
> > > > > > structures to ecovec24. Patch 5/9 unifies much of the code for =
both
> > > > > > pdata and non-pdata cases. Patches 6-7/9 remove unused platform=
 data
> > > > > > fields. Last two patches contain additional improvements for th=
e GPIO
> > > > > > backlight driver while we're already modifying it.
> > > > > >
> > > > > > I don't have access to this HW but hopefully this works. Only c=
ompile
> > > > > > tested.
> > > > > >
> > > > > > [1] https://lkml.org/lkml/2019/6/25/900
> > > > > >
> > > > > > v1 -> v2:
> > > > > > - rebased on top of v5.3-rc1 and adjusted to the recent changes=
 from Andy
> > > > > > - added additional two patches with minor improvements
> > > > > >
> > > > > > v2 -> v3:
> > > > > > - in patch 7/7: used initializers to set values for pdata and d=
ev local vars
> > > > > >
> > > > > > v3 -> v4:
> > > > > > - rebased on top of v5.4-rc1
> > > > > > - removed changes that are no longer relevant after commit ec66=
5b756e6f
> > > > > >   ("backlight: gpio-backlight: Correct initial power state hand=
ling")
> > > > > > - added patch 7/7
> > > > > >
> > > > > > v4 -> v5:
> > > > > > - in patch 7/7: added a comment replacing the name of the funct=
ion being
> > > > > >   pulled into probe()
> > > > > >
> > > > > > v5 -> v6:
> > > > > > - added a patch making the driver explicitly set the direction =
of the GPIO
> > > > > >   to output
> > > > > > - added a patch removing a redundant newline
> > > > > >
> > > > > > v6 -> v7:
> > > > > > - renamed the function calculating the new GPIO value for statu=
s update
> > > > > > - collected more tags
> > > > > >
> > > > > > Bartosz Golaszewski (9):
> > > > > >   backlight: gpio: remove unneeded include
> > > > > >   backlight: gpio: remove stray newline
> > > > > >   backlight: gpio: explicitly set the direction of the GPIO
> > > > > >   sh: ecovec24: add additional properties to the backlight devi=
ce
> > > > > >   backlight: gpio: simplify the platform data handling
> > > > > >   sh: ecovec24: don't set unused fields in platform data
> > > > > >   backlight: gpio: remove unused fields from platform data
> > > > > >   backlight: gpio: use a helper variable for &pdev->dev
> > > > > >   backlight: gpio: pull gpio_backlight_initial_power_state() in=
to probe
> > > > > >
> > > > > >  arch/sh/boards/mach-ecovec24/setup.c         |  33 +++--
> > > > > >  drivers/video/backlight/gpio_backlight.c     | 128 +++++++----=
--------
> > > > > >  include/linux/platform_data/gpio_backlight.h |   3 -
> > > > > >  3 files changed, 69 insertions(+), 95 deletions(-)
> > > > > >
> > > > > >
> > > > >
> > > > > Lee, Daniel, Jingoo,
> > > > >
> > > > > Jacopo is travelling until November 1st and won't be able to test=
 this
> > > > > again before this date. Do you think you can pick it up and in ca=
se
> > > > > anything's broken on SH, we can fix it after v5.5-rc1, so that it
> > > > > doesn't miss another merge window?
> > >
> > > November 1st (-rc6) will be fine.
> > >
> > > I'd rather apply it late-tested than early-non-tested.
> > >
> > > Hopefully Jacopo can prioritise testing this on Thursday or Friday,
> > > since Monday will be -rc7 which is really cutting it fine.
> >
> > I'll do my best, I'll get home Friday late afternoon :)
>
> Welcome home!
>
> Just a little reminder in your inbox. TIA. :)

For the ecovec part:
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j


>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Linaro Services Technical Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--mkrddyxkwo53ywov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl28UigACgkQcjQGjxah
VjzGSRAArwHKUx3NL679rg20jhbM6i53yCGiIe5VhB7/jWpuNzDeg205l4yidgDI
xOoxwxeWiNGTFdav95RWXi31C/BO7XRFelNejT4vSdZLZU8nWd6sRqUk26ZoxU5o
bCwQR1Px6BDJpYCHyHx6JpyFqF6W6NHcvlwYt4ylz7ZmGXbmn3iKsSDrkswPOYvp
t0msKUcCMFEpEPv2IKx0xjYg9pzqVpJWzG28qZbtnDoQoImgRCsu4mtwHj1LjF1S
IFBmsGiGkmgRyVBR88JHCXGk0yA8RXzDjtwRhmOqfOZJLqtWOZaWaS8YhMsIt2FM
SslzzFlI6gTqbwLGApVRWIt8xP9x+Arf280RKSK5jiIXBjdVS+B3Pi1C3VdiHC7R
Bfn/jIUGoMM1BtywQXBCXNazZWcctMlIBSng12oDcBvhkB7GDPv77XL6mN8WpgIi
tfeYIkRG1jD79B0+W3vSsuNxNO+dYpKaRbFc/FS0Qbpt8o15U55vMT0SXPs9M4zC
5lYjN8CdE53JI3A/5YZx+mDwz8ujqZ46kWJRkUqmIjkKnTwW63wysQKNmONdb2BC
tQIcu2ZRUoo/EwNGCfHfVpJbSS/DEnv6npqQBQqn6FKwlaLbGdyLdbI8ClSRy4sh
23CZLEVgsB7zilBkNbD1YdOzvoCgNF1/Vi/wg5zuJoViXqP4cFk=
=y0NH
-----END PGP SIGNATURE-----

--mkrddyxkwo53ywov--

--===============0812025567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0812025567==--
