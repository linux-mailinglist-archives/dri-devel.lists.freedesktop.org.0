Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DDF2987F
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 15:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4F26E10E;
	Fri, 24 May 2019 13:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3304B6E10E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 13:06:31 +0000 (UTC)
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr
 [90.88.147.134]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C20A420000F;
 Fri, 24 May 2019 13:06:23 +0000 (UTC)
Date: Fri, 24 May 2019 15:06:23 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: a64: enable ANX6345 bridge on
 Teres-I
Message-ID: <20190524130623.dpkg5z5rdyc2bno4@flea>
References: <20190523065013.2719D68B05@newverein.lst.de>
 <20190523065404.BB60F68B20@newverein.lst.de>
 <CA+E=qVdh-=C5zOYWYj95jLN51EaXFS6B+CQ101-f64q5QmgN3g@mail.gmail.com>
 <20190524121359.GE15685@lst.de>
MIME-Version: 1.0
In-Reply-To: <20190524121359.GE15685@lst.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1796115840=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1796115840==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fsxi6i2r62yvgbvk"
Content-Disposition: inline


--fsxi6i2r62yvgbvk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 24, 2019 at 02:13:59PM +0200, Torsten Duwe wrote:
> On Thu, May 23, 2019 at 07:48:03AM -0700, Vasily Khoruzhick wrote:
> > On Wed, May 22, 2019 at 11:54 PM Torsten Duwe <duwe@lst.de> wrote:
> > >
> > >
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> > > @@ -65,6 +65,21 @@
> > >                 };
> > >         };
> > >
> > > +       panel: panel {
> > > +               compatible ="innolux,n116bge", "simple-panel";
> >
> > IIRC Rob wanted it to be edp-connector, not simple-panel. Also you
> > need to introduce edp-connector binding.
>
> This line is identically found in
> arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi and
> arch/arm64/boot/dts/nvidia/tegra132-norrin.dts

That's not really an argument though. These are using rather old
bindings, and realising that they are flawed and fixing these flaws is
a natural process.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--fsxi6i2r62yvgbvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOfsTwAKCRDj7w1vZxhR
xRybAP9iKNkCqyhXQ6xIsRZgZ0sNXT+q0aHuuuRwgIKZaEJwkwEAqakTF1EIu2Pr
7DcRHe8aaX/5zfuRYUOdKKZ/wNaOdQ0=
=Mlxd
-----END PGP SIGNATURE-----

--fsxi6i2r62yvgbvk--

--===============1796115840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1796115840==--
