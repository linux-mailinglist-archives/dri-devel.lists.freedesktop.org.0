Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8924171612
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 12:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C862A88C49;
	Tue, 23 Jul 2019 10:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A25788C49
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:29:07 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 07CECC000F;
 Tue, 23 Jul 2019 10:29:03 +0000 (UTC)
Date: Tue, 23 Jul 2019 12:30:24 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 10/10] [HACK] arm64: dts: renesas: ebisu: Enable LVDS
 dual-link operation
Message-ID: <20190723103024.3du7i7dm2xfyfblm@uno.localdomain>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-11-laurent.pinchart+renesas@ideasonboard.com>
 <TY1PR01MB177063CF6128DB62E16FD0EBC0C40@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB177063CF6128DB62E16FD0EBC0C40@TY1PR01MB1770.jpnprd01.prod.outlook.com>
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1802561955=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1802561955==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ha2fju6woqc5ri53"
Content-Disposition: inline


--ha2fju6woqc5ri53
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

HI Fabrizio,

On Mon, Jul 22, 2019 at 11:27:26AM +0000, Fabrizio Castro wrote:
> Hello Jacopo,
>
> > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@=
vger.kernel.org> On Behalf Of Laurent Pinchart
> > Sent: 28 May 2019 15:13
> > Subject: [PATCH v3 10/10] [HACK] arm64: dts: renesas: ebisu: Enable LVD=
S dual-link operation
> >
> > Enable and connect the second LVDS encoder to the second LVDS input of
> > the THC63LVD1024 for dual-link LVDS operation. This requires changing
> > the default settings of SW45 and SW47 to OFF and ON respectively.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> How did you test this patch on Ebisu (kernel branch, configuration, switc=
hes,etc.)?
>

I tested the branch provided by Laurent and mentioned in this cover
letter.

The branch is now rebased on v5.2-rc1 as you can see, I cannot tell at
the time which one was the release tag on which it was based on, but I
suspect 5.0 or either v4.20. Maye Laurent remembers it.

> I tested both linux-next and drm/du/lvds/dual-link and they are not worki=
ng for me.
> The base configuration I am using is coming from arch/arm64/configs/defco=
nfig from each respective branch, on top of that I am enabling the remainin=
g bits and pieces.
> I have tried the suggested configuration of the switches for this patch, =
basically nothing is happening. I have also tried reverting the changes mad=
e by this patch (on both branches), and of course I have reverted the selec=
tion for the switches as well, and even single-link doesn't work for me. Si=
ngle-link support from the BSP version of the kernel (4.14.75-ltsi) works f=
or me, that confirms the configuration of the switches I am using when test=
ing single-link should be okay.
>
> If, in the single-link use case from drm/du/lvds/dual-link, I connect lvd=
s1 to the vga-encoder in the DT (like for the BSP DT, but I can see from th=
e schematics that ADV7123 is actually connected to DU, like the configurati=
on in the DT upstream), then HDMI works as expected (most of the time).
>
> I wonder if for some reason we may end up using the wrong lvds encoder at=
 times, or no encoder at all?
>
> Have you seen this problem? Am I missing something obvious here?

The branch I tested at the time worked out the box, but now, I see
several different problems, and this morning I ran severl tests. Here
it is a summary:

Laurent's drm/du/lvds/dual-link and drm/du/next are v5.2-rc1 based.
I see an error which makes Ebisu fail to boot on those branches and
plain v5.2 (both -rc1 and final v5.2)

The issue is related to bd9571 which seems to be an MFD gpio expander:

[    2.748694] bd9571mwv 8-0030: Device: BD9571MWV rev. 4
[   28.754865] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[   28.761094] rcu:     1-...0: (2 ticks this GP) idle=3D352/1/0x4000000000=
000000 softirq=3D45/46 fqs=3D3250

sometimes it even fail when detecting the chip:
        i2c-sh_mobile e60b0000.i2c: Transfer request timed out             =
                                                                           =
               =E2=94=82
        bd9571mwv 8-0030: Failed to read vendor code register (ret=3D-110)

I managed to boot the board once with no error, so I wonder if it is
not my board which has issues?

Anyway, this seems unrelated to the lvds dual link mode, but prevents
me from testing anything on v5.2. I wonder if you ever seen anything simila=
r...

So I went and tested v5.1. Plain v5.1 with SW45 and SW47 in their
'default' position gives me a working output with single mode.

I then cherry-picked the patches from Laurent's drm/du/lvds/dual-link
and applied on top of v5.1 and it seems like DU does not get probed
there.

To be sure I was testing the same patches I tested at the time I gave
my tag to this series I manually applied the patches from this series
(not the one in Laurent's tree, but the ones here sent) on top of v5.1
and I got the same result, DU was not probed correctly.

I had a look at diff in the encoder registration process between 5.0 and
5.2 and I don't see much differences, so I suspect it might be some
config option I have missed as well?

Could you be a bit more precise on which tools are you using for
testing and which failures you see? Are those the same I see here?

I'm testing using kms-tests or kmsxx alternatively, and made sure the
DU driver was loaded (or not) with modeprint from drm's modetest
suite.  Basically, everything is mentioned here:
uttps://elinux.org/R-Car/Devices#DU

I could start reporting the v5.2 failure on Ebisu if you confirm me
you see the same on your side, then trying to get to the bottom of the
DU/lvds issue.

Thanks
   j

>
> Thanks,
> Fab
>
> > ---
> >  .../arm64/boot/dts/renesas/r8a77990-ebisu.dts | 24 +++++++++++++------
> >  1 file changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm6=
4/boot/dts/renesas/r8a77990-ebisu.dts
> > index c72772589953..988d82609f41 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > @@ -93,11 +93,18 @@
> >
> >  			port@0 {
> >  				reg =3D <0>;
> > -				thc63lvd1024_in: endpoint {
> > +				thc63lvd1024_in0: endpoint {
> >  					remote-endpoint =3D <&lvds0_out>;
> >  				};
> >  			};
> >
> > +			port@1 {
> > +				reg =3D <1>;
> > +				thc63lvd1024_in1: endpoint {
> > +					remote-endpoint =3D <&lvds1_out>;
> > +				};
> > +			};
> > +
> >  			port@2 {
> >  				reg =3D <2>;
> >  				thc63lvd1024_out: endpoint {
> > @@ -482,24 +489,27 @@
> >  	ports {
> >  		port@1 {
> >  			lvds0_out: endpoint {
> > -				remote-endpoint =3D <&thc63lvd1024_in>;
> > +				remote-endpoint =3D <&thc63lvd1024_in0>;
> >  			};
> >  		};
> >  	};
> >  };
> >
> >  &lvds1 {
> > -	/*
> > -	 * Even though the LVDS1 output is not connected, the encoder must be
> > -	 * enabled to supply a pixel clock to the DU for the DPAD output when
> > -	 * LVDS0 is in use.
> > -	 */
> >  	status =3D "okay";
> >
> >  	clocks =3D <&cpg CPG_MOD 727>,
> >  		 <&x13_clk>,
> >  		 <&extal_clk>;
> >  	clock-names =3D "fck", "dclkin.0", "extal";
> > +
> > +	ports {
> > +		port@1 {
> > +			lvds1_out: endpoint {
> > +				remote-endpoint =3D <&thc63lvd1024_in1>;
> > +			};
> > +		};
> > +	};
> >  };
> >
> >  &ohci0 {
> > --
> > Regards,
> >
> > Laurent Pinchart
>

--ha2fju6woqc5ri53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl024cAACgkQcjQGjxah
VjwU/g//WLidgnztRCUvWRcbzqaRnDPPulwiIFGGcofSd2YyIKQOYNa0VkGVIb5H
AzeiGiq8dZLrlbv6v/merLGr7Q9hkTay/c4zOX+3zGoKMX9WiehPvnR/d489XPFP
ATzSpvvI0lvCd1KExupMODOMDxhBuQASX2zo9uiS789e+c1Rcbhz5YIaDAETA4/w
KTy2cjKNMyOUwznYYFdxKkgMDBybBcBDr9+pcW32h/HyMqNpjsoyjmc5VoKy1tGR
CSUj8yv5/p+nXrjz32cERFeKi7UA5ewNgJRVE1YIsNXG62TmEwKhvrwuOqM4t30F
Qi8QXy6FVWSZtbiIlWZo8yN+ww9GcVyPS/+GYyHL0xvxRugbJzrtRn3CNoKb6lFW
9L/UJ5R8u3a/lr1YZ6VtIoCcxtWmN8dx7NgAYDmoMevRi5IAQoBqz700v6YSuMG6
A3oyisLoTyozR3SXafc7JF7IRAD/StYdqQVjCrxWQb0eEnDhqWqULcfqvCK/1pC5
CIMKIsI4DJluDPxjsPz74DRY30ifCZPZWVUOWx5kWN/KUWmcxLXRuMhHeXORvuey
sHRp7r5E2EAsBa0jvVyMY+YBu8p/kbvTsSj8yP56jSVglqx3ACyU1QN8XJdEtflq
lqi7Y6lHW1shzDBsTcRXCNWszkAmo8RYLtGCu9o0HZyAXmxo/n4=
=t5Rn
-----END PGP SIGNATURE-----

--ha2fju6woqc5ri53--

--===============1802561955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1802561955==--
