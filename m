Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FA2C4F644
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 19:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B9810E633;
	Tue, 11 Nov 2025 18:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PTyOuaBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490B210E633
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 18:14:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 036FE60209;
 Tue, 11 Nov 2025 18:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF59C4CEF7;
 Tue, 11 Nov 2025 18:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762884897;
 bh=YJZ2BYCy/RFNPtkZFsqxaPgXCs3zWEQSsNMKkzCW8hI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PTyOuaBcX/6ltywosBlk/NwujGRrcJfEf8qH4zrh95pJAt8KmLpY0rchl/8qtmmFz
 Qa8aDw06RDCss8Kjwi1Qe/onQEh5ofgzEewAcX+H2bNOc7Br0Em4wLlqP2YplseInE
 UU14ps8vqndAKHvQrGwOSZl4mE10pCFh2mkdJNjMIWPUkgxgVEyX4mwIdoMls+80we
 Hco0gmIy2hh/V6SIk7fVd1rSUqsggZXdtjysstDTlfkDjXZG/9OTl5AKEGRAb5K6lr
 BSDUwHwZplb8f+HiSYVis4M+DIzNyu2PPjkMhdxWTXnGXJ2ls1CidyEq6/oXFK1ICK
 2Xjdgg8pBJJqA==
Date: Tue, 11 Nov 2025 18:14:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 Icenowy Zheng <uwu@icenowy.me>,
 Maud Spierings <maudspierings@gocontroll.com>,
 Andy Yan <andyshrk@163.com>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 00/13] drm: starfive: jh7110: Enable display subsystem
Message-ID: <20251111-footing-eclair-332f5f0769f2@spud>
References: <CGME20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e@eucas1p1.samsung.com>
 <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <20251110-clang-baking-b8b27730356e@spud>
 <00e897dc-9966-439b-a74a-7604a1870027@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/gBidW5Sm+Kw8wVT"
Content-Disposition: inline
In-Reply-To: <00e897dc-9966-439b-a74a-7604a1870027@samsung.com>
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


--/gBidW5Sm+Kw8wVT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 04:33:28PM +0100, Michal Wilczynski wrote:
>=20
>=20
> On 11/10/25 20:35, Conor Dooley wrote:
> > On Sat, Nov 08, 2025 at 02:04:34AM +0100, Michal Wilczynski wrote:
> >> This series enables the display subsystem on the StarFive JH7110 SoC.
> >> This hardware has a complex set of dependencies that this series aims =
to
> >> solve.
> >>
> >> I believe this is a PHY tuning issue that can be fixed in the new
> >> phy-jh7110-inno-hdmi.c driver without changing the overall architectur=
e.
> >> I plan to continue debugging these modes and will submit follow up fix=
es
> >> as needed.
> >>
> >> The core architectural plumbing is sound and ready for review.
> >>
> >> Notes:
> >> - The JH7110 does not have a centralized MAINTAINERS entry like the
> >>   TH1520, and driver maintainership seems fragmented. I have therefore
> >>   added a MAINTAINERS entry for the display subsystem and am willing to
> >>   help with its maintenance.
> >=20
> > Yeah, bunch of different folks wrote the drivers, so lots of entries.
> > Pretty much all as you've done here, authors are responsible for the
> > individual components and Emil is the platform maintainer but
> > responsible for most drivers.
> >=20
> > Do you need any feedback dt wise on the RFC, or is it too likely that
> > we'll both waste our breath if the DRM folks don't approve of your
> > approach for the rest of this series?
>=20
> Hi Conor,
>=20
> Thank you for your response.
>=20
> That's a fair point about the risk of the DRM approach being rejected.
> While I can't be certain, I'm hopeful that part is relatively
> straightforward, as it primarily integrates other recently reviewed
> (though not yet merged) components like the inno-hdmi bridge and dc8200
> drivers.
>=20
> To be honest, I was more concerned that the DT part of the series would
> be more problematic. Given that, I would find it very helpful to get
> your feedback on the DT aspects now, if you have the time.

Right. You'll definitely want some actual DRM people to weigh in though
before making changes, I am really not familiar enough with this type of
hardware to know if the breakdown is correct.

--/gBidW5Sm+Kw8wVT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRN9GAAKCRB4tDGHoIJi
0r8GAPkBsYDP7LLqp2+h6FYJs9F/YlRAnuueN9JB2on22suIYQEA03Yvk0N2Sfh+
Ee2i/GJcLr7XOYAXK2mOE8f+CiHaLQU=
=L7ty
-----END PGP SIGNATURE-----

--/gBidW5Sm+Kw8wVT--
