Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 296069CB22
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 09:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208BE8984F;
	Mon, 26 Aug 2019 07:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230848984F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 07:58:22 +0000 (UTC)
Received: from uno.localdomain (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 49607240006;
 Mon, 26 Aug 2019 07:58:12 +0000 (UTC)
Date: Mon, 26 Aug 2019 09:59:43 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 01/14] dt-bindings: display: renesas,cmm: Add R-Car
 CMM documentation
Message-ID: <20190826075943.h7ivwagape3glym5@uno.localdomain>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-2-jacopo+renesas@jmondi.org>
 <CAMuHMdVvjrMXap5CQ-grNYpJfOG6QeN26EW4tR_YE=VFv5ozqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVvjrMXap5CQ-grNYpJfOG6QeN26EW4tR_YE=VFv5ozqw@mail.gmail.com>
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
Cc: muroya@ksk.co.jp, Ulrich Hecht <uli@fpond.eu>,
 Simon Horman <horms@verge.net.au>, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: multipart/mixed; boundary="===============0668764960=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0668764960==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6ypjwqqmzlry6ejt"
Content-Disposition: inline


--6ypjwqqmzlry6ejt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Mon, Aug 26, 2019 at 09:34:41AM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Sun, Aug 25, 2019 at 3:50 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Add device tree bindings documentation for the Renesas R-Car Display
> > Unit Color Management Module.
> >
> > CMM is the image enhancement module available on each R-Car DU video
> > channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> > @@ -0,0 +1,33 @@
> > +* Renesas R-Car Color Management Module (CMM)
> > +
> > +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> > +
> > +Required properties:
> > + - compatible: shall be one or more of the following:
> > +   - "renesas,cmm-r8a7795": for R8A7795 (R-Car H3) compatible CMM.
> > +   - "renesas,cmm-r8a7796": for R8A7796 (R-Car M3-W) compatible CMM.
> > +   - "renesas,cmm-r8a77965": for R8A77965 (R-Car M3-N) compatible CMM.
> > +   - "renesas,cmm-r8a77990": for R8A77990 (R-Car E3) compatible CMM.
> > +   - "renesas,cmm-r8a77995": for R8A77995 (R-Car D3) compatible CMM.
>
> Please use "renesas,<socype->-cmm" instead of "renesas,cmm-<soctype>".
>

I actually copied it from the r-car gpio bindings, and I liked
cmm-<soctype> better. If you prefer I can change it though.

> > +   - "renesas,rcar-gen3-cmm": for a generic R-Car Gen3 compatible CMM.
> > +   - "renesas,rcar-gen2-cmm": for a generic R-Car Gen2 compatible CMM.
> > +
> > +   When the generic compatible string is specified, the SoC-specific
> > +   version corresponding to the platform should be listed first.
> > +
> > + - reg: the address base and length of the memory area where CMM control
> > +   registers are mapped to.
> > +
> > + - clocks: phandle and clock-specifier pair to the CMM functional clock
> > +   supplier.
>
> Thinking about yaml validation:
>
> power-domains?
> resets?
>

They should indeed be documented.

Thanks
   j

> > +Example:
> > +--------
> > +
> > +       cmm0: cmm@fea40000 {
> > +               compatible = "renesas,cmm-r8a7796";
> > +               reg = <0 0xfea40000 0 0x1000>;
> > +               power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> > +               clocks = <&cpg CPG_MOD 711>;
> > +               resets = <&cpg 711>;
> > +       };
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

--6ypjwqqmzlry6ejt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1jkW8ACgkQcjQGjxah
VjxB3w//d3VYx+uJJKBX383/pCXEkl5iaMUHMgZ4mxsCzn3gM1E/3uGgWJOZpjdz
sHAvl1p7ybG4abmbXOKJH0ltitBderyFLPbagGW4SDTi7hFe8AbiRNm9sPWyBjYk
OORU2Upt91N++sTh7xHoxq8bJhqWYL0ZhGOE+tbbwl2LgMAjOXaQFYXTX5Tnl/Mm
7XNVATlhfhpN7Xc9ddijtNasUBFYNAvaBdme/d1h/FOD9gy3nFO2i/w828g+zlIM
MSBpZCcfRSoUmjc2CSJzHW7DHAhdVxm7J9qbSGDRz7I5FMfrH3ICS2ufDoHyNmlr
fqB18iTbkwktkDQwm5rcUGhDEGp19hFCr7qmu4NPeQ+FhTM9TtkxYB+E4gZm74Tu
OvUoI4fbMJIlcLoKw8OBT+l8eX2e5CuWqpHokpwDLdXxjHZwtQIoSKLJvRQliGw0
fs7UR7wHhTWCmSwx1bhghcCLHDLQewjZzS0gqX957ks33+Djq7I2dX3EUUdwd+15
bGgsTiSmr6p8hFzPm2t0ZIyg2g9Lj2cGk+O36FYJtvps9VfiBcK9+CecZbQ73Zs5
godvAr3BPCDAKJlGekXOztiK5EoYN6XmGB09IR+0inCfMv6o9jFn7AiUqDjNVq2i
e3762EZuD8nKwv8FlWsj2LIkD0g/6B+mwTJ/WPBNYWzr2o1RuD8=
=Y5PQ
-----END PGP SIGNATURE-----

--6ypjwqqmzlry6ejt--

--===============0668764960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0668764960==--
