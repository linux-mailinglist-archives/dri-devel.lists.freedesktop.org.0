Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E7572A3B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 10:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95836E49E;
	Wed, 24 Jul 2019 08:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326FD6E49E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:35:54 +0000 (UTC)
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 05C1124000C;
 Wed, 24 Jul 2019 08:35:48 +0000 (UTC)
Date: Wed, 24 Jul 2019 10:37:10 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm: rcar_lvds: Fix dual link mode operations
Message-ID: <20190724083710.wnttvauam2zwiii7@uno.localdomain>
References: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
 <CAMuHMdVKiJp0PsuogMo8FZ6NUxi4j09+A2zDXZr4nrtZY-KHaw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVKiJp0PsuogMo8FZ6NUxi4j09+A2zDXZr4nrtZY-KHaw@mail.gmail.com>
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============0788394665=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0788394665==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tmwn5ydm7h2arvyi"
Content-Disposition: inline


--tmwn5ydm7h2arvyi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Wed, Jul 24, 2019 at 09:28:58AM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Wed, Jul 24, 2019 at 3:38 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > The R-Car LVDS encoder units support dual-link operations by splitting
> > the pixel output between the primary encoder and the companion one.
> >
> > In order for the primary encoder to succesfully control the companion's
> > operations this should not fail at probe time and register itself its
> > associated drm bridge so that the primary one can find it.
> >
> > Currently the companion encoder fails at probe time, causing the
> > registration of the primary to fail preventing the whole DU unit to be
> > registered correctly.
> >
> > Fixes: fa440d870358 ("drm: rcar-du: lvds: Add support for dual-link mode")
> > Reported-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > ---
> > The "Fixes" tag refers to a patch currently part of the
> > renesas-drivers-2019-07-09-v5.2 branch of Geert's renesas-drivers tree.
>
> The broken commit is also present in v5.3-rc1.

You're right... This is then entitled to be collected for rc2 then.

Thanks
   j
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

--tmwn5ydm7h2arvyi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl04GLYACgkQcjQGjxah
VjyrrxAAl4RQ0Uq+Ix56ugDgecHqIcqzJ0HtIHBz+2Zmj1mD26HJwuPzlgV7Ke3O
hMjEXdqtcl2F+BamoPn5HLx0X9VU8zYZ7EKwZniiBER438HAqMzky37ujuenZv+u
YilYEiMslCDqv2JCFlFAgXw41gYWzeWnmPwFbmO2nhMplj5SLU/qSIkTMTGTDDZU
M0txIFJ08GS6UyIWJcS2TAB1BuPltG4F1G+Ei8GJ2iTnW6BndETHh0SGUaTLAgV4
TH40JZd8TnND+lvMvxTQrcHwsuw9VxTJxoDc+bH9sVg7TS8VuJuBojlvTnEQtB4I
PTVNHz51F+vOreEZSyvVAGpIrThxDPNFke/uxTEINvMXJ1XXo6WAgbcs9mznTU02
gq3SKddfyzlRGPQkwHxmCkY4ifkEwstiQSiTzkiKhEOUILjMf8dOltoyQhfhzN2J
g1rsKbp/ufezBMBnIytDN5WdyO5C1Wai5jX5vUxOiBHU40zlsTdleCJrsKaqoGrD
e9VPZmNtTzwvR/j+XcGxRhLT1YQrWt6RAAlqaid2po6aiOUyPs5TZdUBa1FV+hbV
y7Z+zGk9hS2Z/PR4ngqLCipSlgjDCJXocnnE1lG/AZpekgdtrH996QnT+z8B/a/k
gIjDe+x6A9wkzwfsQloCcEJwCZeZsz+l2aQcdJrXgEXHeuxs53c=
=iXnV
-----END PGP SIGNATURE-----

--tmwn5ydm7h2arvyi--

--===============0788394665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0788394665==--
