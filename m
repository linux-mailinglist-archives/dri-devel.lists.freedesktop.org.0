Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410B7C48FF4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 20:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F98A10E2F8;
	Mon, 10 Nov 2025 19:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cpqC+x8V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789FF10E2F8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 19:25:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 38DEA4097F;
 Mon, 10 Nov 2025 19:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E9CC16AAE;
 Mon, 10 Nov 2025 19:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762802735;
 bh=GrymXJeErTy9u70PVzPmfw43ubyTayEwBn+LiCzgBE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cpqC+x8V3BJ6v7fmFkIt+t3dVhDH0GKKdgDZh1nM0OX818sGDugtU8rjaIBwPdmKF
 QiEAvjcAlzFdMnYeBsYbJXlzbd53uuAdTpD+Si2EO8CF5/l2w6IkrAGj7h0drqhYHk
 zhs/qLZU8Ti3aUUAB6VDwUTDs4Yc2BpZCv3bMcgTEKKeKpHHPWiGfrGv1HUUY6bbaa
 8eiRsMGt3WbjCUNz2oUWjf+1KVcEWr4yHx07JgpWdX5GZ2IBw0Wn0s6pCx+ubse27h
 ay/YPZh79ewOXvUjiJMCAOmnLNtXfMj0c/YXq+74ER4kBPBH6xuu+hsRw8IefMlFcX
 kRcF6RUdPZdug==
Date: Mon, 10 Nov 2025 19:25:25 +0000
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
Subject: Re: [PATCH RFC 08/13] soc: starfive: Add jh7110-vout-subsystem driver
Message-ID: <20251110-acetone-slinky-0f8e81291371@spud>
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010504eucas1p26e8ee9aa88ab75bebd832eaea81720e9@eucas1p2.samsung.com>
 <20251108-jh7110-clean-send-v1-8-06bf43bb76b1@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d6w1nrcqngNa0tVG"
Content-Disposition: inline
In-Reply-To: <20251108-jh7110-clean-send-v1-8-06bf43bb76b1@samsung.com>
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


--d6w1nrcqngNa0tVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 08, 2025 at 02:04:42AM +0100, Michal Wilczynski wrote:
> Add the wrapper driver for the StarFive JH7110 VOUT subsystem.
>=20
> This driver is responsible for managing the shared resources for all
> video output devices. It enables the PD_VOUT power domain, enables the
> top-level NoC bus clock, and deasserts the main bus reset.
>=20
> Once these resources are active, it calls of_platform_populate() to
> create and probe the child devices (DC8200, VOUTCRG, HDMI MFD) that
> reside within this subsystem.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS                                  |   1 +
>  drivers/soc/Kconfig                          |   1 +
>  drivers/soc/Makefile                         |   1 +
>  drivers/soc/starfive/Kconfig                 |  25 ++++++
>  drivers/soc/starfive/Makefile                |   2 +
>  drivers/soc/starfive/jh7110-vout-subsystem.c | 117 +++++++++++++++++++++=
++++++
>  6 files changed, 147 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 052876c6538f980f75ff64e78b6ebea460307904..74e562a6b57ac9f776c4be2d6=
f0977c62bc03d46 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24051,6 +24051,7 @@ F:	Documentation/devicetree/bindings/display/brid=
ge/starfive,jh7110-inno-hdmi-co
>  F:	Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-mfd.yaml
>  F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.y=
aml
>  F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-s=
ubsystem.yaml
> +F:	drivers/soc/starfive/jh7110-vout-subsystem.c

The parent directory that you've created here for the driver (or created
in a different patch) should probably be added to the "RISC-V MISC SOC
SUPPORT" entry, along with the binding directory. Otherwise I'm probably
not going to see the patches for the former (Emil maintains the
plarform, but for $reasons I'm the one who applies patches and sends the
PRs to Arnd). Think it used to be there, but got removed when the last
(only?) driver was moved out.

--d6w1nrcqngNa0tVG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRI8JQAKCRB4tDGHoIJi
0iL7AQCiyLJiCSE3NKVn/dTVaRDq4/xjTR7nxORX6exO8YKwTAD/f4qo7cSk4n8+
BG25eAfUyQihtYUjB8FnpYKCw2j6mQ8=
=kAFU
-----END PGP SIGNATURE-----

--d6w1nrcqngNa0tVG--
