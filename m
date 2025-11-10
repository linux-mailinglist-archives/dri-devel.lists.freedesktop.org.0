Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C317C4915A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 20:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3056C10E2E8;
	Mon, 10 Nov 2025 19:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r/JiLWNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F2E10E2E8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 19:36:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 206FE60195;
 Mon, 10 Nov 2025 19:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACD7C2BCB4;
 Mon, 10 Nov 2025 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762803366;
 bh=jpF83hZl4+ePN40ExsHilbddxNFc1Cve8pvPWp8/Bmc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r/JiLWNHjEYRmruV9LdKTJJTd45+gaNqMVxx3rKwEocvH5raBmPhaOaSVmu3LB1qB
 v0a/a1UV73eEVavjBqelijRtLfPFA7zKLv5pcjNmrBX6zODp941N/MZ9YvQE2P7+Ta
 23tHNDBX6X+G+I1EZMllpz83zr6Mj/te6SLxVm8+Eq9mSpu4z8sygEjiBDcf+ZBRNT
 nmcZDBXr7Q/x9Tn8j8zhBnrVMkPBuhyS5p81Tj270JsMuhgtxrYD8fPwYXHH0bQmlJ
 LPzeEDTvL4PZR5+MfOyG851q9+zXYhus/EQScPYQGY2xw+9LabgDNqmWOGy5TkWuXL
 fmQFkqDEx/eVA==
Date: Mon, 10 Nov 2025 19:35:57 +0000
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
Message-ID: <20251110-clang-baking-b8b27730356e@spud>
References: <CGME20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e@eucas1p1.samsung.com>
 <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cv1rMoP+ljYav3Y/"
Content-Disposition: inline
In-Reply-To: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
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


--cv1rMoP+ljYav3Y/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 08, 2025 at 02:04:34AM +0100, Michal Wilczynski wrote:
> This series enables the display subsystem on the StarFive JH7110 SoC.
> This hardware has a complex set of dependencies that this series aims to
> solve.
>=20
> I believe this is a PHY tuning issue that can be fixed in the new
> phy-jh7110-inno-hdmi.c driver without changing the overall architecture.
> I plan to continue debugging these modes and will submit follow up fixes
> as needed.
>=20
> The core architectural plumbing is sound and ready for review.
>=20
> Notes:
> - The JH7110 does not have a centralized MAINTAINERS entry like the
>   TH1520, and driver maintainership seems fragmented. I have therefore
>   added a MAINTAINERS entry for the display subsystem and am willing to
>   help with its maintenance.

Yeah, bunch of different folks wrote the drivers, so lots of entries.
Pretty much all as you've done here, authors are responsible for the
individual components and Emil is the platform maintainer but
responsible for most drivers.

Do you need any feedback dt wise on the RFC, or is it too likely that
we'll both waste our breath if the DRM folks don't approve of your
approach for the rest of this series?

--cv1rMoP+ljYav3Y/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRI+nQAKCRB4tDGHoIJi
0mgxAP9S65gNYTUGl4G/hjuQeRD2OPtB7jDPJa2U+Nb1h9guXgD/ZYh57W7dimb0
HC9nSRLUedngvCWxlTKXCDULpQjSKg8=
=vQrF
-----END PGP SIGNATURE-----

--cv1rMoP+ljYav3Y/--
