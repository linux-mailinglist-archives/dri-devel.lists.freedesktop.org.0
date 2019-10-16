Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BD0D91F1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 15:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1C86E976;
	Wed, 16 Oct 2019 13:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B022A6E976
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 13:03:52 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E6C754001D;
 Wed, 16 Oct 2019 13:03:47 +0000 (UTC)
Date: Wed, 16 Oct 2019 15:05:36 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 0/7] backlight: gpio: simplify the driver
Message-ID: <20191016130536.222vsi5whkoy6vzo@uno.localdomain>
References: <20191007033200.13443-1-brgl@bgdev.pl> <20191014081220.GK4545@dell>
 <CACRpkda9Kco-bVPw1OA6FMpQ1L8dZ4WFJ227wTCM9rh5JE7-+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkda9Kco-bVPw1OA6FMpQ1L8dZ4WFJ227wTCM9rh5JE7-+A@mail.gmail.com>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/mixed; boundary="===============0248627059=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0248627059==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="obmlgf7bnd7gsis3"
Content-Disposition: inline


--obmlgf7bnd7gsis3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, sorry for not having replied earlier

On Wed, Oct 16, 2019 at 02:56:57PM +0200, Linus Walleij wrote:
> On Mon, Oct 14, 2019 at 10:12 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> > >  arch/sh/boards/mach-ecovec24/setup.c         |  33 ++++--
> >
> > I guess we're just waiting for the SH Acks now?
>
> The one maintainer with this board is probably overloaded.
>
> I would say just apply it, it can't hold back the entire series.

I've been able to resurect the Ecovec, and I've also been given a copy
of its schematics file a few weeks ago.

It's in my TODO list to test this series but I didn't manage to find
time. If I pinky promise I get back to you before end of the week,
could you wait for me ? :)

Thanks and sorry again!

>
> Yours,
> Linus Walleij

--obmlgf7bnd7gsis3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2nFaAACgkQcjQGjxah
VjzoFBAAhwhZPZe4vv+vLpIH9nXV/zZkAZjerr/FDZoeAm13GfCbvATlAG3xuN2O
/yt4lmoNa0HPZn59BxgVUsCZC5/uTUg8NosCm33YOUGtYU1bhqo9dvBIQc2U7OXJ
u+CxQrlsXVXJtF+51bzDbU0dQRXgccwVhl8F0KMtq/OwyzboyFOl400CN5CqIKHP
Htq5yUN7BPhMNWtSM9ar/CfZpLQUvhl2P/h4id6uuPhM8CQtlDEHxHSULFxtJBwl
w7y0N5f+7wUKtrPVsJ5M6ya3iPrhda49XWtcEPuYGGkOxgM3DiLJENLnStTf78Bh
4hde/25m0jCdbqqRENmccyBcznO1ljcdQOYTAZty+ufXtTWFcJwNk7+Obaz2P447
09kuzxY+Syp7QWAmjh9R1gxaxBpfHCkALgttNqws8jLhou70YeglHSgA/4z/aHgK
wgTcAz2HrzgbtJA15KTO9x+99Gyr/NzJE7ffXSNPXket5u9U2O0r+efDKeCMAGVl
O1YQD4zAnk460taT03o8QndflimZp1kq8Wg8PlXgV3y4XAsIgq64Dc2QGqzLaxI6
30Ak7ph277+RSc6SU6lMazid9TF/b8sf1Rk8tc/usVoWrN7BoHhyFSJj9tdFG71f
kFfg9ieXD+Lno9Ri03PmblRxX1Qted/2kJzw6YX65On55W72l0A=
=RcMR
-----END PGP SIGNATURE-----

--obmlgf7bnd7gsis3--

--===============0248627059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0248627059==--
