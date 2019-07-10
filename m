Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F7B645DD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 13:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D1189F4A;
	Wed, 10 Jul 2019 11:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE8D89F4A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 11:40:46 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CFA7B60004;
 Wed, 10 Jul 2019 11:40:42 +0000 (UTC)
Date: Wed, 10 Jul 2019 13:40:42 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Message-ID: <20190710114042.ybgavnxb4hgqrtor@flea>
References: <20190607062802.m5wslx3imiqooq5a@flea>
 <CGME20190607094103epcas1p4babbb11ec050974a62f2af79bc64d752@epcas1p4.samsung.com>
 <20190607094030.GA12373@lst.de>
 <66707fcc-b48e-02d3-5ed7-6b7e77d53266@samsung.com>
 <20190612152022.c3cfhp4cauhzhfyr@flea>
 <bb2c2c00-b46e-1984-088f-861ac8952331@samsung.com>
 <20190701095842.fvganvycce2cy7jn@flea>
 <CA+E=qVdsYV2Bxk245=Myq=otd7-7WHzUnSJN8_1dciAzvSOG8g@mail.gmail.com>
 <20190709085532.cdqv7whuesrjs64c@flea>
 <CA+E=qVdz4vfU3rtTTKjYdM+4UA+=FWheJfWOMaDtFMnWQ1rHbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+E=qVdz4vfU3rtTTKjYdM+4UA+=FWheJfWOMaDtFMnWQ1rHbw@mail.gmail.com>
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
 devicetree <devicetree@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1785593534=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1785593534==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="escjyxb6ltmmy4x5"
Content-Disposition: inline


--escjyxb6ltmmy4x5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 09, 2019 at 01:30:18PM -0700, Vasily Khoruzhick wrote:
> On Tue, Jul 9, 2019 at 1:55 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Mon, Jul 08, 2019 at 05:49:21PM -0700, Vasily Khoruzhick wrote:
> > > > > Maybe instead of edp-connector one would introduce integrator's specific
> > > > > connector, for example with compatible "olimex,teres-edp-connector"
> > > > > which should follow edp abstract connector rules? This will be at least
> > > > > consistent with below presentation[1] - eDP requirements depends on
> > > > > integrator. Then if olimex has standard way of dealing with panels
> > > > > present in olimex/teres platforms the driver would then create
> > > > > drm_panel/drm_connector/drm_bridge(?) according to these rules, I guess.
> > > > > Anyway it still looks fishy for me :), maybe because I am not
> > > > > familiarized with details of these platforms.
> > > >
> > > > That makes sense yes
> > >
> > > Actually, it makes no sense at all. Current implementation for anx6345
> > > driver works fine as is with any panel specified assuming panel delays
> > > are long enough for connected panel. It just doesn't use panel timings
> > > from the driver. Creating a platform driver for connector itself looks
> > > redundant since it can't be reused, it doesn't describe actual
> > > hardware and it's just defeats purpose of DT by introducing
> > > board-specific code.
> >
> > I'm not sure where you got the idea that the purpose of DT is to not
> > have any board-specific code.
>
> I believe DT was an attempt to move to declarative approach for
> describing hardware. Yes, we have different compatibles for different
> devices but they're specific to particular device rather than
> particular board. Device interconnection is described in DT along with
> some properties rather than in board-specific C-file.

You're right, but it's not incompatible with having some code to deal
with some board quirk.

> Introducing board-specific compatible for a connector isn't looking
> right to me.

If that board has a board-specific behaviour for it's connector, then
what's the issue?

You can't describe all the quirks in the all boards using purely
properties.

> > It's perfectly fine to have some, that's even why there's a compatible
> > assigned to each and every board.
> >
> > What the DT is about is allowing us to have a generic behaviour that
> > we can detect: we can have a given behaviour for a given board, and a
> > separate one for another one, and this will be evaluated at runtime.
> >
> > This is *exactly* what this is about: we can have a compatible that
> > sets a given, more specific, behaviour (olimex,teres-edp-connector)
> > while saying that this is compatible with the generic behaviour
> > (edp-connector). That way, any OS will know what quirk to apply if
> > needed, and if not that it can use the generic behaviour.
> >
> > And we could create a generic driver, for the generic behaviour if
> > needed.
> >
> > > There's another issue: if we introduce edp-connector we'll have to
> > > specify power up delays somewhere (in dts? or in platform driver?), so
> > > edp-connector doesn't really solve the issue of multiple panels with
> > > same motherboard.
> >
> > And that's what that compatible is about :)
>
> Sorry, I fail to see how it would be different from using existing
> panels infrastructure and different panels compatibles. I think Rob's
> idea was to introduce generic edp-connector.

Again, there's no such thing as a generic edp-connector. The spec
doesn't define anything related to the power sequence for example.

> If we can't make it generic then let's use panel infrastructure.

Which uses a device specific compatible. Really, I'm not sure what
your objection and / or argument is here.

In addition, when that was brought up in the discussion, you rejected
it because it was inconvenient:
https://patchwork.freedesktop.org/patch/283012/?series=56163&rev=1#comment_535206

And I agree with you on that one.

> > > I'd say DT overlays should be preferred solution here, not another
> > > connector binding.
> >
> > Overlays are a way to apply a device tree dynamically. It's orthogonal
> > to the binding.
>
> It isn't orthogonal to original problem though.

It is. The original problem is that you want to power up whatever is
on the other side of a eDP link using an arbitrary regulator.

This is a "how do I describe that in my DT" problem, and it really has
nothing to do with how the DT is being passed to the kernel.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--escjyxb6ltmmy4x5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXSXOugAKCRDj7w1vZxhR
xdG+AP9pfxb7uYcDFKG6xikGZewhXzpg/acmPfrETXLF2B1jZQD7Bc2oEF0IKqh7
tiE8F0AU/5LApsNMhblCY9s+dkDrFwU=
=gnu6
-----END PGP SIGNATURE-----

--escjyxb6ltmmy4x5--

--===============1785593534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1785593534==--
