Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ADFC53EDE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 19:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBC810E1A7;
	Wed, 12 Nov 2025 18:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GI/5YeOf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC9610E0D7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 18:36:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 34FCF40841;
 Wed, 12 Nov 2025 18:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0D8C4CEF7;
 Wed, 12 Nov 2025 18:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762972592;
 bh=WnOMdyUM9PIIBDXqCoag+EQM65Uhfsy8dLkk4QRpRf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GI/5YeOfpZMmZVaVUwRR6Fbye59/PSnaqF/DdPeOXtxbGIbwfNWHeDbyV4p3QU59G
 +D16rYwVg8D32b2bSej61a9lz1kZvGXw4j2I4QZjsAGx51e7Ii55bzmRx4GzrabPNV
 mH65mLBEOVxrZrmT1myfF7c0stIgBhYKzqvc5IucEk7P5fdNM+Otbxh4ArAdwhvcMi
 NckYMl5HBmZIJ/uE9MEYAty8k1PvYxgpB8Jpndc0cf+bWFdSVcpht76AC40ennmRKz
 2VRPWg1FFoOgEYPXvOxetk/BAQlONtL5gVFzR85UdiF0GprVVpSdLPLtk9kodpMpah
 eazHG4E1gMLGA==
Date: Wed, 12 Nov 2025 18:36:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maudspierings@gocontroll.com>,
 Andy Yan <andyshrk@163.com>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 01/13] dt-bindings: soc: starfive: Add vout-subsystem
 IP block
Message-ID: <20251112-skating-robust-81be8dee0a8b@spud>
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345@eucas1p2.samsung.com>
 <20251108-jh7110-clean-send-v1-1-06bf43bb76b1@samsung.com>
 <20251111-massager-twistable-1e88f03d82f8@spud>
 <20251111-unsaid-rockslide-67b88b2e34bd@spud>
 <0d8e3a626b037dd348378e5ebca8005c1e715871.camel@icenowy.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z01jU0pczI5X5Okr"
Content-Disposition: inline
In-Reply-To: <0d8e3a626b037dd348378e5ebca8005c1e715871.camel@icenowy.me>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--z01jU0pczI5X5Okr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 02:34:39PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2025-11-11=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 18:36 +0000=EF=
=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > On Tue, Nov 11, 2025 at 06:18:16PM +0000, Conor Dooley wrote:
> > > On Sat, Nov 08, 2025 at 02:04:35AM +0100, Michal Wilczynski wrote:
> > > > Add the dt-binding documentation for the StarFive JH7110 Video

> > > > +patternProperties:
> > > > +=C2=A0 "^display@[0-9a-f]+$":
> > >=20
> > > Personally I'd like to see these being regular properties, since
> > > there's
> > > exactly one possible setup for this.
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0 type: object
> > > > +=C2=A0=C2=A0=C2=A0 description: Verisilicon DC8200 Display Control=
ler node.
> > >=20
> > > Can you add the relevant references here instead of allowing any
> > > object?
> >=20
> > I don't think that if you did, this would pass the binding checks,
> > because there's no "verisilicon,dc" binding. I think I saw one in
> > progress, but without the soc-specific compatible that I am going to
> > require here - if for no reason other than making sure that the
> > clocks
> > etc are provided correctly for this device.
>=20
> Well I didn't specify any soc-specific compatible because that IP has
> its own identification registers.

I still require one because I want to make sure that clocks etc are
handled correctly. You can ignore it in the driver if you wish, but when
the next user comes along with one more or less clock, I want the
jh7110 one to be forced to use the correct configuration.

--z01jU0pczI5X5Okr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRTTpwAKCRB4tDGHoIJi
0n08APwON6v69gaWnOdNIAfYHKE57muDvt77iLW9YOkBpmJ8gQD/SCB3VfMB5jCd
kGuaHJbvedczk5aTkG39KaIgYoNexAc=
=8HDy
-----END PGP SIGNATURE-----

--z01jU0pczI5X5Okr--
