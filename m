Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69518055E7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8F210E528;
	Tue,  5 Dec 2023 13:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3D310E528
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:29:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 51F3761753;
 Tue,  5 Dec 2023 13:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75542C433C7;
 Tue,  5 Dec 2023 13:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701782971;
 bh=Zn4GYLZmwXmZqyevn2I97x9daNh38VTwlzu5aculNSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WD9J9AJFAk2/0D4VYVAU+ifx6QQLbsfR/xrNu9brFiuRqBcsECW8yhOmirrZNo47f
 7m6ARj4MSrzFU7Gj1AlzP//n3uQrgdlEMydSex59apB9u9zWniz7tNZv8URpPrvxGi
 ZOvRjg0fz3fJG1gxtoML0uPSx7OSd5UUhPBaWnNSFIMtEooNk7BXmBjOHRy2Oy3Iod
 AMFofToE1m0upfK+FeWxWEkfCHcjagDADz9vyz7kecbsQmvSBp6uaWSbeEN5SQA6sa
 OBD+VIZUqPY7DieFrZ+th6xFijAxCK6e0AxoWlAF8asfe+f5WM0XITBejsB5bKe8AK
 rF4xwjpQ7MWaA==
Date: Tue, 5 Dec 2023 14:29:27 +0100
From: Maxime Ripard <mripard@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <vawv2mwhonuyvgmp7uox4rfgdcjwg5fa7hmbcfgl3wiase6e4p@tyavpclppfvu>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
 <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sk5rtloxlgm34n5t"
Content-Disposition: inline
In-Reply-To: <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
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


--sk5rtloxlgm34n5t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 05, 2023 at 09:18:58AM +0100, H. Nikolaus Schaller wrote:
> > Am 05.12.2023 um 07:57 schrieb Maxime Ripard <mripard@kernel.org>:
> >=20
> > On Mon, Dec 04, 2023 at 12:22:36PM -0600, Andrew Davis wrote:
> >> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs from
> >> multiple vendors. Describe how the SGX GPU is integrated in these SoC,
> >> including register space and interrupts. Clocks, reset, and power doma=
in
> >> information is SoC specific.
> >>=20
> >> Signed-off-by: Andrew Davis <afd@ti.com>
> >> ---
> >> .../devicetree/bindings/gpu/img,powervr.yaml  | 69 +++++++++++++++++--
> >> 1 file changed, 63 insertions(+), 6 deletions(-)
> >=20
> > I think it would be best to have a separate file for this, img,sgx.yaml
> > maybe?
>=20
> Why?

Because it's more convenient?

> The whole family of IMG GPUs is PowerVR and SGX and Rogue are generations=
 5 and 6++:
>=20
> https://en.wikipedia.org/wiki/PowerVR

That's not really relevant as far as bindings go. We have multiple
binding files for devices of the same generation, or single bindings
covering multiple generations.

The important part is that every compatible is documented. It doesn't
really matter how or where.

Maxime

--sk5rtloxlgm34n5t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW8ltgAKCRDj7w1vZxhR
xUSvAP9PUbf4+YT0EyccyJajSXPeDQSwn4etNEbxV50lUUuE8AD9EaQjz+C035S5
zToIGETivgzX+fLoler4pvNrddntIg4=
=WGdx
-----END PGP SIGNATURE-----

--sk5rtloxlgm34n5t--
