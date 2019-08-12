Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 102F689882
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 10:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EE06E221;
	Mon, 12 Aug 2019 08:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BCB6E221
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 08:14:50 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6446E20011;
 Mon, 12 Aug 2019 08:14:46 +0000 (UTC)
Date: Mon, 12 Aug 2019 10:14:45 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [linux-sunxi] [PATCH v8 0/4] Add support for Orange Pi 3
Message-ID: <20190812081445.kfsbikfrt3pmsh6d@flea>
References: <20190806155744.10263-1-megous@megous.com>
 <2218280.0sI6yjypBf@jernej-laptop>
 <CAGb2v67JVG2rhOdUwBmfsO0+RYb4DNOPmUo=Q_UhL3N+niLiEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v67JVG2rhOdUwBmfsO0+RYb4DNOPmUo=Q_UhL3N+niLiEg@mail.gmail.com>
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
Cc: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0990090185=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0990090185==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wnuh5gs25vfqywb6"
Content-Disposition: inline


--wnuh5gs25vfqywb6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2019 at 03:54:03PM +0800, Chen-Yu Tsai wrote:
> On Mon, Aug 12, 2019 at 3:45 PM Jernej =C5=A0krabec <jernej.skrabec@gmail=
=2Ecom> wrote:
> >
> > Dne torek, 06. avgust 2019 ob 17:57:39 CEST je megous@megous.com napisa=
l(a):
> > > From: Ondrej Jirman <megous@megous.com>
> > >
> > > This series implements support for Xunlong Orange Pi 3 board. There
> > > are only a few patches remaining.
> > >
> > > - ethernet support - just a DT change (patch 1)
> > > - HDMI support (patches 2-4)
> > >
> > > For some people, ethernet doesn't work after reboot because u-boot do=
esn't
> > > support AXP805 PMIC, and will not turn off the etherent PHY regulator=
s.
> > > So the regulator controlled by gpio will be shut down, but the other =
one
> > > controlled by the AXP PMIC will not.
> > >
> > > This is a problem only when running with a builtin driver. This needs
> > > to be fixed in u-boot.
> > >
> > >
> > > Please take a look.
> >
> > Is there anything missing? It would be nice to get this in 5.4. There i=
s a lot
> > of H6 boards which needs DDC bus enable mechanism (part of H6 reference
> > design), including Beelink GS1 which already has HDMI node in mainline =
kernel
> > DT, but due to disabled DDC lines works only with 1024x768 (fallback
> > resolution in DRM core).
>
> I have a few minor comments about patch 1.
>
> I think the HDMI bits are good, but I don't have maintainership / commit
> permissions for drm-misc, so I'll have to wait until someone applies patc=
hes
> 2 and 3 before I apply patch 4.

I've applied 2,3 and 4

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--wnuh5gs25vfqywb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVEf9QAKCRDj7w1vZxhR
xXlgAP9MFKL3iPUwZUiy1/l5hoQrktuJFTIedDN9ko3r/H6TDAD/RZg3u4WBh6O3
tteR/L/slzyHzMHsyD72abKseY8/IQE=
=i2m2
-----END PGP SIGNATURE-----

--wnuh5gs25vfqywb6--

--===============0990090185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0990090185==--
