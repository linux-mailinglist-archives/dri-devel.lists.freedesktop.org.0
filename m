Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670B7814955
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE4D10E22E;
	Fri, 15 Dec 2023 13:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB24C10E22E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:33:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F76A625CF;
 Fri, 15 Dec 2023 13:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44711C433C7;
 Fri, 15 Dec 2023 13:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702647194;
 bh=tGUhZ8a1wsbx0GalNAANJzpCwpQC3QW2iHSYADKeSd0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BJcTttLW46h1AIr8fYhPxXp/T5lrnGXfSuuj1cYQJ8Vp3lwBUMrFQ/RFMGzBVoHRl
 XQEItc18liqK+qYbS2F+dntRyrr3ZwLueXZTw33eYCOIG7WrKiTs7XBDORhUYF5dn0
 4dDOSP2CxoXqCAyAN3XJ3X15F7RkwLrcvLY5WObqXn+zvG53DTpV+58W1oUkT3B+mB
 czKFhXsk4126nHSzSxrRd8yCS3V8JygX/BwifVKxD2D1gbt1LDkU/d8Cg60y9l3qyI
 p5MRLg3p95hkUVScbzuNXtOur0zq/Qr578Jr3MsvB0ZJqvbRZnlXg0cPVwRHeSQF3v
 gJ6z1AliF5MIA==
Date: Fri, 15 Dec 2023 14:33:12 +0100
From: Maxime Ripard <mripard@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <oobcl2kfsuph27er7rflfqvt3lu6athufomxv5chf3uctx4emh@x6rzjtlskhbf>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
 <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
 <vawv2mwhonuyvgmp7uox4rfgdcjwg5fa7hmbcfgl3wiase6e4p@tyavpclppfvu>
 <6BC60156-89E2-4734-BD00-B49A9A6C1D7A@goldelico.com>
 <6gpehpoz54f5lxhmvirqbfwmq7dpgiroy27cljpvu66wtn7aqy@lgrh7wysyxnp>
 <D8AB6CC4-DCA5-40DD-A311-94A16FF59254@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jgmzzpd4kephm2k6"
Content-Disposition: inline
In-Reply-To: <D8AB6CC4-DCA5-40DD-A311-94A16FF59254@goldelico.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Matt Coster <matt.coster@imgtec.com>, Rob Herring <robh+dt@kernel.org>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jgmzzpd4kephm2k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 11:33:53AM +0100, H. Nikolaus Schaller wrote:
> Hi Maxime,
>=20
> > Am 07.12.2023 um 10:20 schrieb Maxime Ripard <mripard@kernel.org>:
> >=20
> > On Tue, Dec 05, 2023 at 02:50:08PM +0100, H. Nikolaus Schaller wrote:
> >> Hi,
> >>=20
> >>> Am 05.12.2023 um 14:29 schrieb Maxime Ripard <mripard@kernel.org>:
> >>>=20
> >>> Hi,
> >>>=20
> >>> On Tue, Dec 05, 2023 at 09:18:58AM +0100, H. Nikolaus Schaller wrote:
> >>>>> Am 05.12.2023 um 07:57 schrieb Maxime Ripard <mripard@kernel.org>:
> >>>>>=20
> >>>>> On Mon, Dec 04, 2023 at 12:22:36PM -0600, Andrew Davis wrote:
> >>>>>> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs =
=66rom
> >>>>>> multiple vendors. Describe how the SGX GPU is integrated in these =
SoC,
> >>>>>> including register space and interrupts. Clocks, reset, and power =
domain
> >>>>>> information is SoC specific.
> >>>>>>=20
> >>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
> >>>>>> ---
> >>>>>> .../devicetree/bindings/gpu/img,powervr.yaml  | 69 +++++++++++++++=
++--
> >>>>>> 1 file changed, 63 insertions(+), 6 deletions(-)
> >>>>>=20
> >>>>> I think it would be best to have a separate file for this, img,sgx.=
yaml
> >>>>> maybe?
> >>>>=20
> >>>> Why?
> >>>=20
> >>> Because it's more convenient?
> >>=20
> >> Is it?
> >=20
> > It's for a separate architecture, with a separate driver, maintained out
> > of tree by a separate community, with a separate set of requirements as
> > evidenced by the other thread. And that's all fine in itself, but
> > there's very little reason to put these two bindings in the same file.
> >=20
> > We could also turn this around, why is it important that it's in the
> > same file?
>=20
> Same vendor. And enough similarity in architectures, even a logical seque=
nce
> of development of versions (SGX =3D Version 5, Rogue =3D Version 6+) behi=
nd.
> (SGX and Rogue seem to be just trade names for their architecture develop=
ment).

Again, none of that matters for *where* the binding is stored.

> AFAIK bindings should describe hardware and not communities or drivers
> or who is currently maintaining it. The latter can change, the first not.

Bindings are supposed to describe hardware indeed. Nothing was ever said
about where those bindings are supposed to be located.

There's hundreds of other YAML bindings describing devices of the same
vendors and different devices from the same generation. If anything
it'll make it easier for you. I'm really not sure why it is
controversial and you're fighting this so hard.

Maxime

--jgmzzpd4kephm2k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXxVmAAKCRDj7w1vZxhR
xVw8AP41gJoEr4Iyn/S1Hezu3iKztXGS3daC3u3QCuAGL/pTzwD9HOO3pcwNEL/E
pFq4wYajjL/ypoQuClzjpZ6kW6ckSgs=
=YYGh
-----END PGP SIGNATURE-----

--jgmzzpd4kephm2k6--
