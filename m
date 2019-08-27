Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8A09E4F0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 11:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745F489491;
	Tue, 27 Aug 2019 09:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C6589491
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 09:53:44 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2CD171C0005;
 Tue, 27 Aug 2019 09:53:36 +0000 (UTC)
Date: Tue, 27 Aug 2019 11:55:08 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 03/14] arm64: dts: renesas: r8a7796: Add CMM units
Message-ID: <20190827095508.lpp74fh5capobvcf@uno.localdomain>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-4-jacopo+renesas@jmondi.org>
 <20190826224337.GL5031@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190826224337.GL5031@pendragon.ideasonboard.com>
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
Cc: muroya@ksk.co.jp, uli@fpond.eu, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: multipart/mixed; boundary="===============1332997834=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1332997834==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j65b5dlwaxdtql3o"
Content-Disposition: inline


--j65b5dlwaxdtql3o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Aug 27, 2019 at 01:43:37AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> Should you squash this with the patches that add CMM units to the other
> SoCs ?

I don't know, I guess it depends on Geert's preferences. Geert?


>
> On Sun, Aug 25, 2019 at 03:51:43PM +0200, Jacopo Mondi wrote:
> > Add CMM units to Renesas R-Car M3-W device tree and reference them from
> > the Display Unit they are connected to.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Apart from the issue pointed out by Geert,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 25 ++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > index 3dc9d73f589a..8d78e1f98a23 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -2613,6 +2613,30 @@
> >  			renesas,fcp = <&fcpvi0>;
> >  		};
> >
> > +		cmm0: cmm@fea40000 {
> > +			compatible = "renesas,cmm-r8a7796";
> > +			reg = <0 0xfea40000 0 0x1000>;
> > +			clocks = <&cpg CPG_MOD 711>;
> > +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> > +			resets = <&cpg 711>;
> > +		};
> > +
> > +		cmm1: cmm@fea50000 {
> > +			compatible = "renesas,cmm-r8a7796";
> > +			reg = <0 0xfea50000 0 0x1000>;
> > +			clocks = <&cpg CPG_MOD 710>;
> > +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> > +			resets = <&cpg 710>;
> > +		};
> > +
> > +		cmm2: cmm@fea60000 {
> > +			compatible = "renesas,cmm-r8a7796";
> > +			reg = <0 0xfea60000 0 0x1000>;
> > +			clocks = <&cpg CPG_MOD 709>;
> > +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> > +			resets = <&cpg 709>;
> > +		};
> > +
> >  		csi20: csi2@fea80000 {
> >  			compatible = "renesas,r8a7796-csi2";
> >  			reg = <0 0xfea80000 0 0x10000>;
> > @@ -2766,6 +2790,7 @@
> >  			status = "disabled";
> >
> >  			vsps = <&vspd0 &vspd1 &vspd2>;
> > +			cmms = <&cmm0 &cmm1 &cmm2>;
> >
> >  			ports {
> >  				#address-cells = <1>;
>
> --
> Regards,
>
> Laurent Pinchart

--j65b5dlwaxdtql3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1k/fsACgkQcjQGjxah
Vjxiaw//Z5HMC2bGdbZRpCxKiWUOZRLP1eFu80P2Jh/8TSVhc9CSIK5I95E4e1uJ
JfbbyuJwHRir1zIpQaEOI0xbCsA3iTgYEaAnsuM2cc39zqhKQ1XwaT3BS22/6A2v
zgav3dt2QH3n+XIKzapRAbTSHwXupoxEkuNBERTX6kPIxQCHW4SwKTvsJlc0bXGK
CvoWwg7pUi5+92WAQOuEkCrRIZ9sw3p+714MQqtEg6R8+FpkvmsnGFlWvEWr4uff
qs5nqLda8rkCGn+l3Z+wF2cOdV8t1TAApcBZIMPQTjGbLFqe1wXCsJGKuEdrapoX
UBVfMGieG3fML6gcxHaJN8z9FM+GTz/VJhjWYdvR2PMExJmmJp+2XFW5UnwJ/wsQ
kOjjoLNvo0ndZ64jbmsHoXZvkgORPuMsJXGzH4THPRLPInM7oAoCtPlybWVq2iP8
sy1TLvwXNUP/hHlv7GXbj+Im8uvwfmvRaIZEQqoXTDP4rXtIIDWsGgsUaZqZrpQr
f5k+cTSGhWHUZoTxNAZXykg2cSDLbQT1svfnJHQz9oEHaxapLTOfF2HFltAY+iCV
18vwyY1QytTIcyMC3EbW1eR+r+JvJdKk/TCzBkUV74PHWocxBLah0S2+DqApTGEu
VdDWLqs82AHrz3MvGvkTwf7A4gMIuJRPsXOoeWqgeWlinds78RA=
=s54F
-----END PGP SIGNATURE-----

--j65b5dlwaxdtql3o--

--===============1332997834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1332997834==--
