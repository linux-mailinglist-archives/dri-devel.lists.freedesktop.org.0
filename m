Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF0637CB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 16:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6E089A8B;
	Tue,  9 Jul 2019 14:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A8489A8B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 14:22:00 +0000 (UTC)
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id EA3DB20001A;
 Tue,  9 Jul 2019 14:21:55 +0000 (UTC)
Date: Tue, 9 Jul 2019 16:21:55 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Message-ID: <20190709142155.2blclgbqapjeifv3@flea>
References: <20190607062802.m5wslx3imiqooq5a@flea>
 <CGME20190607094103epcas1p4babbb11ec050974a62f2af79bc64d752@epcas1p4.samsung.com>
 <20190607094030.GA12373@lst.de>
 <66707fcc-b48e-02d3-5ed7-6b7e77d53266@samsung.com>
 <20190612152022.c3cfhp4cauhzhfyr@flea>
 <bb2c2c00-b46e-1984-088f-861ac8952331@samsung.com>
 <20190701095842.fvganvycce2cy7jn@flea>
 <CA+E=qVdsYV2Bxk245=Myq=otd7-7WHzUnSJN8_1dciAzvSOG8g@mail.gmail.com>
 <20190709085532.cdqv7whuesrjs64c@flea>
 <72E7C765-3660-413A-8450-94BE4B3D1345@aosc.io>
MIME-Version: 1.0
In-Reply-To: <72E7C765-3660-413A-8450-94BE4B3D1345@aosc.io>
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
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Thierry Reding <thierry.reding@gmail.com>,
 Torsten Duwe <duwe@lst.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1521136687=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1521136687==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="en37fuotj5a3o4w2"
Content-Disposition: inline


--en37fuotj5a3o4w2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2019 at 04:58:35PM +0800, Icenowy Zheng wrote:
>
>
> =E4=BA=8E 2019=E5=B9=B47=E6=9C=889=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=884=
:55:32, Maxime Ripard <maxime.ripard@bootlin.com> =E5=86=99=E5=88=B0:
> >On Mon, Jul 08, 2019 at 05:49:21PM -0700, Vasily Khoruzhick wrote:
> >> > > Maybe instead of edp-connector one would introduce integrator's
> >specific
> >> > > connector, for example with compatible
> >"olimex,teres-edp-connector"
> >> > > which should follow edp abstract connector rules? This will be at
> >least
> >> > > consistent with below presentation[1] - eDP requirements depends
> >on
> >> > > integrator. Then if olimex has standard way of dealing with
> >panels
> >> > > present in olimex/teres platforms the driver would then create
> >> > > drm_panel/drm_connector/drm_bridge(?) according to these rules, I
> >guess.
> >> > > Anyway it still looks fishy for me :), maybe because I am not
> >> > > familiarized with details of these platforms.
> >> >
> >> > That makes sense yes
> >>
> >> Actually, it makes no sense at all. Current implementation for
> >anx6345
> >> driver works fine as is with any panel specified assuming panel
> >delays
> >> are long enough for connected panel. It just doesn't use panel
> >timings
> >> from the driver. Creating a platform driver for connector itself
> >looks
> >> redundant since it can't be reused, it doesn't describe actual
> >> hardware and it's just defeats purpose of DT by introducing
> >> board-specific code.
> >
> >I'm not sure where you got the idea that the purpose of DT is to not
> >have any board-specific code.
> >
> >It's perfectly fine to have some, that's even why there's a compatible
> >assigned to each and every board.
> >
> >What the DT is about is allowing us to have a generic behaviour that
> >we can detect: we can have a given behaviour for a given board, and a
> >separate one for another one, and this will be evaluated at runtime.
> >
> >This is *exactly* what this is about: we can have a compatible that
> >sets a given, more specific, behaviour (olimex,teres-edp-connector)
> >while saying that this is compatible with the generic behaviour
> >(edp-connector). That way, any OS will know what quirk to apply if
> >needed, and if not that it can use the generic behaviour.
> >
> >And we could create a generic driver, for the generic behaviour if
> >needed.
> >
> >> There's another issue: if we introduce edp-connector we'll have to
> >> specify power up delays somewhere (in dts? or in platform driver?),
> >so
> >> edp-connector doesn't really solve the issue of multiple panels with
> >> same motherboard.
> >
> >And that's what that compatible is about :)
>
> Maybe we can introduce a connector w/o any driver just like hdmi-connecto=
r?

Ironically, a driver for it has been sent yesterday :)

But yeah, we can definitely do that too.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--en37fuotj5a3o4w2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXSSjAwAKCRDj7w1vZxhR
xRd1AQCJ5jZZvccoYKMTlhIFwESGq/tLGx3Ao78XQTTrIK5CFAEA11fhHaijvh3D
nQ4CuXzwsgPAxXOwMwPH8TV3F9oC/Aw=
=S7iw
-----END PGP SIGNATURE-----

--en37fuotj5a3o4w2--

--===============1521136687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1521136687==--
