Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B4295ABF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 11:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF426E296;
	Tue, 20 Aug 2019 09:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A006E296
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 09:14:17 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 8210A3A3B4C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 07:47:49 +0000 (UTC)
Received: from uno.localdomain (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 68BE5240008;
 Tue, 20 Aug 2019 07:47:02 +0000 (UTC)
Date: Tue, 20 Aug 2019 09:48:26 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 01/19] dt-bindings: display: renesas,cmm: Add R-Car
 CMM documentation
Message-ID: <20190820074826.5rdzeqyk6ylpjr7o@uno.localdomain>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-2-jacopo+renesas@jmondi.org>
 <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
 <CAMuHMdWFHDGPSZt2_H_sC9rCKDYBR0XDLn0TGxzPRxZsrOTEHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWFHDGPSZt2_H_sC9rCKDYBR0XDLn0TGxzPRxZsrOTEHw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0277509577=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0277509577==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wjfjaeh4g25lin6n"
Content-Disposition: inline


--wjfjaeh4g25lin6n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,
   sorry for the delayed response..

On Mon, Aug 19, 2019 at 03:45:54PM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Mon, Jul 8, 2019 at 9:58 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sat, Jul 6, 2019 at 4:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > Add device tree bindings documentation for the Renesas R-Car Display
> > > Unit Color Management Module.
> > >
> > > CMM is the image enhancement module available on each R-Car DU video
> > > channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> > > @@ -0,0 +1,25 @@
> > > +* Renesas R-Car Color Management Module (CMM)
> > > +
> > > +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> > > +
> > > +Required properties:
> > > + - compatible: shall be one of:
> > > +   - "renesas,rcar-gen3-cmm"
> > > +   - "renesas,rcar-gen2-cmm"
> >
> > Why do you think you do not need SoC-specific compatible values?
> > What if you discover a different across the R-Car Gen3 line tomorrow?
> > Does the IP block have a version register?
>
> Do you have an answer to these questions?

It does not seem to me that CMM has any version register, nor there
are differences between the different Gen3 SoCs..

However, even if we now define a single compatible property for
gen3/gen2 and we later find out one of the SoC needs a soc-specific
property we can safely add it and keep the generic gen3/gen2 one as
fallback.. Does it work for you?

Thanks
   j


> Thanks!
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

--wjfjaeh4g25lin6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1bpb4ACgkQcjQGjxah
VjzFehAAtZJyQ2C0O0+nEMVUjcPez/olBePoMeBVwI9w3mnWypOuE2eVaEyzNlMb
imYJcwvi3JNKbb+3sxlcQAarRkWBayu5QFq/5Orbtk5ZxwBsKVyUjCkfkcTEprsf
Drf5HI77kmvBDtIDRAwSZUPllhAzzmqqymQNOmuCRebv4i+BTKsiyRMrAIxH8xkw
gcwpsfCCYzQxvjZgR73cshXHidzgrPVWL9mTT+SntxymEAspd+S+bd2Q4pVWHCaq
ErkXABSR8quM6hLdPozJGRCaVv9oDkhSxihAj3dkp0AqtwvPLecmm1Czsoe7j5T3
Qi+012N+EyLV5T/lt/jNNJZExS1wUVrkArYzulUUGrSYpWbN0B6StL/rEKY/KcgX
RwubHKNXKAZKSXcHCzL3rnqeGhhP8QavJBtsj+F9oPy6K3tjoj95TBu2llE6fbuv
dwJ4VbdccJA5bGYUTPbl9Xkn671CwUmCMnuGpp3C/jCOBJNLm9k3+4jMkkQcQYae
kt3AwaARLmVCFRjh++QCczkG/MAZtOUVBcqXfJpGqKb4NkKwQofq3lcxib9zSGyk
G3l+SEUmEwIm4TEvyu5VK04y6VD+Vx9CbcE7oJSG2aDzoEsBQymAIIx10vDvRTgA
QV5rl0pWKx75XvHoWn8+OBO3phKOqM2Jr7n7QuhpdMR8GPY7pWY=
=CPng
-----END PGP SIGNATURE-----

--wjfjaeh4g25lin6n--

--===============0277509577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0277509577==--
