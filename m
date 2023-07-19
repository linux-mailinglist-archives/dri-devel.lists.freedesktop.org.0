Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9014758DFF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 08:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0845510E1AE;
	Wed, 19 Jul 2023 06:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4567410E1AE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 06:39:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9B1760C94;
 Wed, 19 Jul 2023 06:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B336C433C8;
 Wed, 19 Jul 2023 06:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689748770;
 bh=tS2USjBiTii2vuCPFys8pH4L2wdw03uCCar6swSVKH0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZpPZzjMjbULCWVQOQFPRhZl4bi55zKdgr/SX5rXzypGRyeX1wnKtnnhBy+SEP6Vzk
 sSJwZ2yT+enuxn51dwMmaYm+RpnpQZnYUoqOg5mchSp/06PkIJPgVgmAxsDi5Ws3f7
 8P5iBe6JYHpwfMsa/WTRmt0DPRNYsnwAH99aTEDp2VgXh7Ew0ueyDywYHdz/CMRDHI
 vPbxejeV0majDR3tAchIF0xBzHERMbimdlMf46QcGuQwPiCUXaKVWHnfXsuPZVMkMp
 pAn1H4VGqZqLM6/Tk7KhP0tf24vil+fvzXK/MKRzXUDKhx/Xor+wCOPRy+oxwv+Skv
 bw8mk/c/TWGDA==
Date: Wed, 19 Jul 2023 08:39:21 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH 3/4] drm/panel: sitronix-st7789v: add support for partial
 mode
Message-ID: <tbdwgfr4rqgytttoxhidsil42mda77qj3qmhw2do3k5rmwsaeh@qronuzdubv6q>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
 <20230718-feature-lcd-panel-v1-3-e9a85d5374fd@wolfvision.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gchzkzww7o425bgv"
Content-Disposition: inline
In-Reply-To: <20230718-feature-lcd-panel-v1-3-e9a85d5374fd@wolfvision.net>
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


--gchzkzww7o425bgv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 18, 2023 at 05:31:52PM +0200, Michael Riesch wrote:
> The ST7789V controller features support for the partial mode. Here,
> the area to be displayed can be restricted in one direction (by default,
> in vertical direction). This is useful for panels that are partially
> occluded by design. Add support for the partial mode.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>

We already had that discussion, but I think we shouldn't treat this any
differently than overscan for other output.

Maxime

--gchzkzww7o425bgv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLeFGQAKCRDj7w1vZxhR
xQEHAP9l+6fq2pGx7Jm6gVs/CtjU/7bDk+zaO0WdI84BaqQvbAEAriaZs0acLkRy
cLAuw4lVbWWc+TWWoE24cPhBJrI1DA0=
=64QN
-----END PGP SIGNATURE-----

--gchzkzww7o425bgv--
