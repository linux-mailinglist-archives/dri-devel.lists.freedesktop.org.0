Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA4D76CD6B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 14:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A0F10E0E1;
	Wed,  2 Aug 2023 12:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71A710E169
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 12:47:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2747E61986;
 Wed,  2 Aug 2023 12:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FEDC433C8;
 Wed,  2 Aug 2023 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690980428;
 bh=LhXZRg0afv0qB+yKsYUZTxyHFk+cS+imz+tvV17ALoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QTQYiQ7fa5yF+bGKtFjjkeZsRgj023SmHrPh1SfQtR/gdZqn9Y09deOoViq4CLyn+
 8QdV6tFx9vOqD93irNUGKGv8Kszx+AnQ/fRUA3OQkdXc0qUIo/OyjBT/9Vq5PkL0sn
 H+jloeUziBgeM78fA/VQ63/U3eAdQhLyzTY9FMJtJjzPsa2Ghxzwf0xGPIAKb3zzNp
 du0rTUejIYu/l80vQt+NFzq1BC4NzsYj9bNuLV45aQeO42ggXdeh5YaRdU1MwTFKEw
 yIixZpaUDMVVK086i8LZUvCBeVetB9+nyaMYMX5Sd0cErg2tx6GdFlBzxclByIWOpB
 wzAZ3nnKY8rMg==
Date: Wed, 2 Aug 2023 14:47:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH 3/4] drm/panel: sitronix-st7789v: add support for partial
 mode
Message-ID: <jfmsb4tmgx5rej4ae4npzq4zjh2dnydukxuk34oejbqdpe4a42@a2bbo3bwa3yq>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
 <20230718-feature-lcd-panel-v1-3-e9a85d5374fd@wolfvision.net>
 <tbdwgfr4rqgytttoxhidsil42mda77qj3qmhw2do3k5rmwsaeh@qronuzdubv6q>
 <097de164-6d62-6a1d-f7b5-cbd7d4408ab7@wolfvision.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7wiv5tnbzr6rtjkg"
Content-Disposition: inline
In-Reply-To: <097de164-6d62-6a1d-f7b5-cbd7d4408ab7@wolfvision.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7wiv5tnbzr6rtjkg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 02, 2023 at 02:34:28PM +0200, Michael Riesch wrote:
> On 7/19/23 08:39, Maxime Ripard wrote:
> > On Tue, Jul 18, 2023 at 05:31:52PM +0200, Michael Riesch wrote:
> >> The ST7789V controller features support for the partial mode. Here,
> >> the area to be displayed can be restricted in one direction (by defaul=
t,
> >> in vertical direction). This is useful for panels that are partially
> >> occluded by design. Add support for the partial mode.
> >>
> >> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> >=20
> > We already had that discussion, but I think we shouldn't treat this any
> > differently than overscan for other output.
>=20
> Indeed we had that discussion. For reference, it can be found here:
> https://lore.kernel.org/dri-devel/20230329091636.mu6ml3gvw5mvkhm4@penduic=
k/#t
> The thing is that I am still clueless how the overscan approach could wor=
k.
>=20
> I found some DRM properties related to overscan/margins and I guess
> userspace needs to set those. On my system weston is running. Is weston
> in charge of configuring the corresponding output so that the correct
> margins are applied? If so, how can this be achieved?

I don't really know Weston, but my guess would be based on some
configuration or user feedback, depending on which case we're in.

We also set the default using some kernel command-line options.

> Will DRM handle the properties generically or does the driver need to do
> some work as well?

What do you mean by generically?

> In any case it could make sense to write the partial mode registers and
> enter the effective dimensions. At least I have seen this in other panel
> drivers.

Sure, it makes sense. It shouldn't come from the DT and be fixed though.

Maxime

--7wiv5tnbzr6rtjkg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMpQSAAKCRDj7w1vZxhR
xVzFAP9kilsZBbm6W92vMaew8O9CoKFITr2sHAY3YtrjXN+BMwD8CFk1GalP9DqQ
xK2JsT/QInfbGyojc95pU1mtGD0S+Q8=
=2hFM
-----END PGP SIGNATURE-----

--7wiv5tnbzr6rtjkg--
