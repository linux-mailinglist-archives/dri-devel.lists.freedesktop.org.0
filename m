Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B927EAA467
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 15:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8636E0D5;
	Thu,  5 Sep 2019 13:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C4E6E0D5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 13:27:01 +0000 (UTC)
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id A09C3100006;
 Thu,  5 Sep 2019 13:26:52 +0000 (UTC)
Date: Thu, 5 Sep 2019 15:28:26 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 01/14] dt-bindings: display: renesas,cmm: Add R-Car
 CMM documentation
Message-ID: <20190905132826.k5yn5ltsias2cyi2@uno.localdomain>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-2-jacopo+renesas@jmondi.org>
 <CAMuHMdVvjrMXap5CQ-grNYpJfOG6QeN26EW4tR_YE=VFv5ozqw@mail.gmail.com>
 <20190826075943.h7ivwagape3glym5@uno.localdomain>
 <20190826101550.GB5031@pendragon.ideasonboard.com>
 <20190830180108.mlei4wbfn3mktj23@uno.localdomain>
 <20190905115017.GI5035@pendragon.ideasonboard.com>
 <CAMuHMdW-MEQvf7MgY7XQkKap-mm8=TO8V61BFtVv63oacFTfYQ@mail.gmail.com>
 <20190905122059.GK5035@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190905122059.GK5035@pendragon.ideasonboard.com>
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
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: multipart/mixed; boundary="===============1420514066=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1420514066==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gxheopgdktwghftq"
Content-Disposition: inline


--gxheopgdktwghftq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent, Geert,


On Thu, Sep 05, 2019 at 03:20:59PM +0300, Laurent Pinchart wrote:
> Hi Geert,
>
> On Thu, Sep 05, 2019 at 02:05:34PM +0200, Geert Uytterhoeven wrote:
> > On Thu, Sep 5, 2019 at 1:50 PM Laurent Pinchart wrote:
> > > On Fri, Aug 30, 2019 at 08:01:09PM +0200, Jacopo Mondi wrote:
> > > > On Mon, Aug 26, 2019 at 01:15:50PM +0300, Laurent Pinchart wrote:
> > > > > How about converting this binding to yaml alreay ? It should be fairly
> > > > > simple.
> > > >
> > > > I'm trying to, and I'm having my portion of fun time at it.
> > > >
> > > > The definition of the schema itself seems good, but I wonder, is this
> > > > the first renesas schema we have? Because it seems to me the schema
> > > > validator is having an hard time to digest the examplea 'clocks' and
> > > > 'power-domains' properties, which have 1 phandle and 2 specifiers and 1
> > > > phandle and 1 specifier respectively for Rensas SoCs.
> > > >
> > > > In other words, if in the example I have:
> > > >
> > > >  examples:
> > > >    - |
> > > >      cmm0: cmm@fea40000 {
> > > >           compatible = "renesas,r8a7796-cmm";
> > > >           reg = <0 0xfea40000 0 0x1000>;
> > > >           clocks = <&cpg 711>              <---- 1 phandle + 1 specifier
> > > >           resets = <&cpg 711>;
> > > >           power-domains = <&sysc>;         <---- 1 phandle
> > > >      };
> > > >
> > > > The schema validation is good.
> > > >
> > > > While if I use an actual example
> > > >    - |
> > > >      cmm0: cmm@fea40000 {
> > > >           compatible = "renesas,r8a7796-cmm";
> > > >           reg = <0 0xfea40000 0 0x1000>;
> > > >           clocks = <&cpg CPG_MOD 711>         <---- 1 phandle + 2 specifier
> > > >           resets = <&cpg 711>;
> > > >           power-domains = <&sysc R8A7796_PD_ALWAYS_ON>; <---- 1 phandle
> > > >      };                                                       + 1 specfier
> > > >
> > > > The schema validation fails...
> > > > Error: Documentation/devicetree/bindings/display/renesas,cmm.example.dts:20.29-30 syntax error
> > > > FATAL ERROR: Unable to parse input tree
> > > >
> > > > Are clocks properties with > 2 entries and power-domains properties with
> > > > > 1 entries supported?
> > > >
> > > > Because from what I read here:
> > > > https://github.com/robherring/yaml-bindings/blob/master/schemas/clock/clock.yaml
> > > > "The length of a clock specifier is defined by the value of a #clock-cells
> > > > property in the clock provider node."
> > > >
> > > > And that's expected, but is the examples actually validated against the
> > > > clock provider pointed by the phandle? Because in that case, if we had a
> > > > yaml schema for the cpg-mssr provider, it would indeed specify clock-cells=2.
> > > >
> > > > Do we need a schema for cpg-mssr first, or am I doing something else
> > > > wrong?
> > >
> > > I think you just need to #include the headers that define CPG_MOD and
> > > R8A7796_PD_ALWAYS_ON.
> >
> > If that helps, you might want to replace the symbols in the examples by their
> > actual values (1 resp. 32).
> >
> > And perhaps keep the symbols as comments?
> >
> >         clocks = <&cpg 1 /* CPG_MOD */ 711>;
> >         power-domains = <&sysc 32 /* R8A7796_PD_ALWAYS_ON */>;
>
> I think adding the required #include at the beginning of the example is
> a better solution.

I didn't realize that, but it actually makes sense, as the example is
extracted and actually compiled from the yaml schema.. brilliant!

With a simple:

--- a/Documentation/devicetree/bindings/display/renesas,cmm.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,cmm.yaml
@@ -51,6 +51,9 @@ additionalProperties: false

 examples:
   - |
+    #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
+    #include <dt-bindings/power/r8a7796-sysc.h>

The example now compiles.

Thanks, I will submit the bindings in yaml format in next iteration.

>
> --
> Regards,
>
> Laurent Pinchart

--gxheopgdktwghftq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1xDXoACgkQcjQGjxah
Vjy4Dg/8DGPc6KerGdHYq5Hdpy8U5Y92IMizppaQy9fpz+qQHURT/Y79Rli9j6zx
EGVP1SE/D2DKYkWn9OyVtjcQib0ZR5emr7UoID8I+Pmwq1syn1pbuAxXNhV+Gj/I
bECVgYyHyWzmutgUb41OL8doagWUmmNKk9W5B6jS+mFBpeSySPczvGU4rh8SiDQs
1GdAjDWJ9H7I6xVfjU1mPlYBMr0/ufzw6tkYHapCPHayDvuYR9LVdTaw70WD8iLZ
bwAVMaTVuD4ir7Uh8KGNcdub3vF85/naLzd9yWCz4Clzkg0CQCmUI5411jNVS0dK
3iyEO/6BDy/LG8UDguFL5IaM+46Hh2fVVkwnwBZd50cWP+CUHu+w7uNdc4XGmVO4
hG2SqpBZIOaBeIfWPb7yhVt66/LEgC9nmOVfjgVynO5+9CwZw8DuApb5iLG4+7Ds
Z+pp46sfrMEQLU/Aw1/MGj2wksYEC427UI161pdVjPka7wnhlNr2hasNgb36ShDz
TQHOEVp7OGsajo9oqxsKyAvTIx8HXflrd/LTNZmmMrRF8B0QKU8i1Xj8v1AJMvGw
Cyr8oV0BCnZQg+Qa/Ujhv0bxmCnrXrhmdVhfCqvhTo2ulOdpNEnp7oWa05QRdpMS
55MjegmjoLIHvl8ZJeRquJMGGoVwzjaIT0bAVd6/8OGXBWQQZyQ=
=tNT+
-----END PGP SIGNATURE-----

--gxheopgdktwghftq--

--===============1420514066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1420514066==--
