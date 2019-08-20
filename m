Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CCC95B0F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 11:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0106E02F;
	Tue, 20 Aug 2019 09:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554826E02F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 09:34:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 5B8543A76D9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:04:46 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3B21F4000A;
 Tue, 20 Aug 2019 08:03:59 +0000 (UTC)
Date: Tue, 20 Aug 2019 10:05:28 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 01/19] dt-bindings: display: renesas,cmm: Add R-Car
 CMM documentation
Message-ID: <20190820080528.2p3l4z525nii2djt@uno.localdomain>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-2-jacopo+renesas@jmondi.org>
 <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
 <CAMuHMdWFHDGPSZt2_H_sC9rCKDYBR0XDLn0TGxzPRxZsrOTEHw@mail.gmail.com>
 <20190820074826.5rdzeqyk6ylpjr7o@uno.localdomain>
 <CAMuHMdXNJLLRqZCZ5KHkdUKgtwmE-F-s5Vi6P10xHR38n_=HrA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXNJLLRqZCZ5KHkdUKgtwmE-F-s5Vi6P10xHR38n_=HrA@mail.gmail.com>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: multipart/mixed; boundary="===============0720796530=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0720796530==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uoy3xuspityfwvxm"
Content-Disposition: inline


--uoy3xuspityfwvxm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Tue, Aug 20, 2019 at 09:53:44AM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Tue, Aug 20, 2019 at 9:47 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> > On Mon, Aug 19, 2019 at 03:45:54PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, Jul 8, 2019 at 9:58 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Sat, Jul 6, 2019 at 4:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > > > Add device tree bindings documentation for the Renesas R-Car Display
> > > > > Unit Color Management Module.
> > > > >
> > > > > CMM is the image enhancement module available on each R-Car DU video
> > > > > channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> > > > > @@ -0,0 +1,25 @@
> > > > > +* Renesas R-Car Color Management Module (CMM)
> > > > > +
> > > > > +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> > > > > +
> > > > > +Required properties:
> > > > > + - compatible: shall be one of:
> > > > > +   - "renesas,rcar-gen3-cmm"
> > > > > +   - "renesas,rcar-gen2-cmm"
> > > >
> > > > Why do you think you do not need SoC-specific compatible values?
> > > > What if you discover a different across the R-Car Gen3 line tomorrow?
> > > > Does the IP block have a version register?
> > >
> > > Do you have an answer to these questions?
> >
> > It does not seem to me that CMM has any version register, nor there
> > are differences between the different Gen3 SoCs..
> >
> > However, even if we now define a single compatible property for
> > gen3/gen2 and we later find out one of the SoC needs a soc-specific
> > property we can safely add it and keep the generic gen3/gen2 one as
> > fallback.. Does it work for you?
>
> Unfortunately that won't work, as the existing DTBs won't have the
> soc-specific compatible value.

Correct, existing dtbs won't have the soc-specific value... However,
there are functional differences between different SoCs according to
the datasheet, but if it's good practice to provide soc-specific
compatibles "just in case" I'm fine doing that..


> You could still resort to soc_device_match(), but it is better to avoid that.

I see... Also that function's documentation prescribes to go through
DT first, so I guess it's our last resort...


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

--uoy3xuspityfwvxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1bqcgACgkQcjQGjxah
VjzfIQ//bceJ2Cx5ZIgeBzXpJ+LvUqUpBoZU2JcuzPvzZHK3zjHVRil1FBlktd8U
qkO8BsZqefP7YenFiMX1wfCXEj/+2Nwm9HGSw4xlOPWuF2oVLtU5PajvYNmSJqRZ
NbVnYtiTf2xQtfj2JE8JkNR9uz+KMH6oHlsqzX8YaSSll5mOt/1I23AV/JIVmx/S
BkQ78othU3hWDFQCxct9rq1GkPrC0TOsq4zN+rw2kxQUdRHcBzb7kZrdDt0kkYYg
K9YBmQgTLnvGoL+yBLnMKRLLpVYFiQpMNzT9TgUjOx0yzXyk2HOxJMh938V97sqX
XtxtAJlxN8VruOrG2RJ4rYfKsPU9OWRyurntMhF1btXysM73zoX8D6AXkEGSqkA2
TtwIDHco5k1FtuZODoFgIetgXOWfkbykC2TWUft52QQriDnYOqZ8qKXp0AE9qoYn
iL72UoeeZwsyVgkPNZBxzI4MUzcfTPJssvlV2tUtXxOciRkBl6zmD61nhN4vvp9p
1AbXOXhYKfC/gmCs/WK4QzJvehSXa1bIAtMWeceUsvJBadsAttbNc6O2BM6SEWuF
JnAZRhWcjqOtfNl90o0bctWsFAZ109guX2rTJONZYSPxXaDya7yJpUdRMw0QgPCx
XVCryR/NCK52QGsFtaExhfidbkxNqKLaRZiPei31s0QWbo6SkJ4=
=M2QT
-----END PGP SIGNATURE-----

--uoy3xuspityfwvxm--

--===============0720796530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0720796530==--
