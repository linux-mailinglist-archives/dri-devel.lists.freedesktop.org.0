Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5B3AE7EAF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 12:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA6010E6BA;
	Wed, 25 Jun 2025 10:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871A410E6BA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 10:11:23 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 9171B1F00055
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 10:11:14 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 423B4AC7B29; Wed, 25 Jun 2025 10:11:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from shepard (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id DA68DAC7B19;
 Wed, 25 Jun 2025 10:11:09 +0000 (UTC)
Date: Wed, 25 Jun 2025 12:11:07 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Parthiban <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 10/22] pinctrl: sunxi: add missed lvds pins for a100/a133
Message-ID: <aFvLO6GUY6NezkcF@shepard>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
 <aFu3fAMa8KPwjPbX@shepard>
 <9c3ea5fb-a045-46bd-9753-26ffa67fe1bc@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hh+oSgryr9OFE2vD"
Content-Disposition: inline
In-Reply-To: <9c3ea5fb-a045-46bd-9753-26ffa67fe1bc@linumiz.com>
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


--hh+oSgryr9OFE2vD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 25 Jun 25, 15:06, Parthiban wrote:
>=20
> On 6/25/25 2:16 PM, Paul Kocialkowski wrote:
> > Hi and thanks for your work!
> >=20
> > On Fri 27 Dec 24, 16:37, Parthiban Nallathambi wrote:
> >> lvds, lcd, dsi all shares the same GPIO D bank and lvds0
> >> data 3 lines and lvds1 pins are missed, add them.
> > Would it also make sense to submit device-tree pin definitions here?
>=20
> this patch is already merged.=20
> git show --stat cef4f1b5ba99a964cd6dd248bb373520573c972f
> commit cef4f1b5ba99a964cd6dd248bb373520573c972f
> Author: Parthiban Nallathambi <parthiban@linumiz.com>
> Date:   Fri Dec 27 16:37:57 2024 +0530
>=20
>     pinctrl: sunxi: add missed lvds pins for a100/a133
>    =20
>     lvds, lcd, dsi all shares the same GPIO D bank and lvds0
>     data 3 lines and lvds1 pins are missed, add them.
>    =20
>     Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
>     Link: https://lore.kernel.org/20241227-a133-display-support-v1-10-13b=
52f71fb14@linumiz.com
>     Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>=20
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> Do you mean the consumer/board devicetree changes?

I mean the pin definitions for lvds in the sun50i-a100.dtsi device-tree.

But maybe you wanted to submit those after the bindings/driver changes are
merged?

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--hh+oSgryr9OFE2vD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbyzsACgkQhP3B6o/u
lQyMGQ//f2vAQYHKFknpEFa9G97bwQAoBFvWmQSD1wmDY326lLbX+9Y05O/nICdQ
datMQbAA6GBDyn///enJBKK2AURU+BrqhBgKbsbBFFSRcfxgqOrBRts1XgjbAA4J
jdl51KH2mhO3rL83JU/DhlwedeW2q/JeZrlFxVV/DL94tc3WRVFHINq3XipGHfk/
l2VdJ9XHwzIz1it4ZG/ypB5reTIvdskJQCjGqqEwpLy2BkYsVvVIW4ASYCWR76A4
CJfYGi3RTEZxDTmiLpLrUiezKLT2y0sZybhIDlFYZG8aVAoMvmDYZafpsotsRD+E
jv9Et5dsl/In0DiCJLdmNGgwdmVgQcn/Ln7D5Ad5hqUqHx5tteJ5Vc+XWVVXTVEh
ngvtcEvY3PornqJ/yAmYqz8UZ0+ZPMjLUM5cBrO0kiVYU6//99FOZRLba7VpDrqt
PpwHreipKusGGSgKjwNU0JBszR61dT9eEBF4CnyTJmsnH/CYgXk3ToqbwYrWInUD
rmClxHtOUwQ+BUAz3GL7YszrAzifLjqmKTFtIydFEIi/xWI/7LDeImEjAjHtk0Vk
eGDxBau9WCqk8IUf7kneF6UcCD2M+9rs8k+2p8rvO6gQOv6I7Ioq1sPfqmWSyA5v
uVQSDI7Amj0SKgFZmKuXry4Qw/EWu+BNGf3Xii0csbO0ZAuxVos=
=Yy5s
-----END PGP SIGNATURE-----

--hh+oSgryr9OFE2vD--
